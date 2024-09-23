void sub_2126D73F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2126D76AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ILDefaultLog()
{
  if (ILDefaultLog_onceToken != -1)
    dispatch_once(&ILDefaultLog_onceToken, &__block_literal_global_0);
  return (id)ILDefaultLog_log;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2126D8F18(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_2126DBB6C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
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

void sub_2126DCDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2126DCEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

IdentityLookup::IdentityType_optional __swiftcall IdentityType.init(rawValue:)(Swift::Int32 rawValue)
{
  char *v1;
  char v2;

  if (rawValue >= 3)
    v2 = 3;
  else
    v2 = rawValue;
  *v1 = v2;
  return (IdentityLookup::IdentityType_optional)rawValue;
}

uint64_t IdentityType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_2126DF03C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2126DF050()
{
  sub_2126EF6A4();
  sub_2126EF6BC();
  return sub_2126EF6C8();
}

uint64_t sub_2126DF094()
{
  return sub_2126EF6BC();
}

uint64_t sub_2126DF0BC()
{
  sub_2126EF6A4();
  sub_2126EF6BC();
  return sub_2126EF6C8();
}

IdentityLookup::IdentityType_optional sub_2126DF0FC(Swift::Int32 *a1)
{
  return IdentityType.init(rawValue:)(*a1);
}

void sub_2126DF104(_DWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t ExtensionUpdate.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ExtensionUpdate.isAppStoreVendable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable);
}

id ExtensionUpdate.__allocating_init(identifier:isAppStoreVendable:)(uint64_t a1, uint64_t a2, char a3)
{
  objc_class *v3;
  _BYTE *v7;
  _QWORD *v8;
  objc_super v10;

  v7 = objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier];
  *v8 = a1;
  v8[1] = a2;
  v7[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable] = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id ExtensionUpdate.init(identifier:isAppStoreVendable:)(uint64_t a1, uint64_t a2, char a3)
{
  _BYTE *v3;
  _QWORD *v4;
  objc_super v6;

  v4 = &v3[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier];
  *v4 = a1;
  v4[1] = a2;
  v3[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ExtensionUpdate();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for ExtensionUpdate()
{
  return objc_opt_self();
}

id ExtensionUpdate.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ExtensionUpdate.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ExtensionUpdate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtensionUpdate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2126DF2EC()
{
  uint64_t result;

  result = sub_2126EF4A0();
  qword_254B56230 = result;
  return result;
}

unint64_t static LiveLookupStore.imageDirectoryPath.getter()
{
  return 0xD000000000000028;
}

id sub_2126DF33C()
{
  uint64_t v0;
  id result;

  type metadata accessor for LiveLookupStore();
  v0 = swift_allocObject();
  *(_DWORD *)(v0 + 16) = 5;
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  result = sub_2126E7558(0xD000000000000034, (void *)0x80000002126F2870);
  *(_QWORD *)(v0 + 24) = result;
  if (result)
  {
    result = objc_msgSend(result, sel_newBackgroundContext);
    *(_QWORD *)(v0 + 32) = result;
    off_253D8E8F0 = (_UNKNOWN *)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LiveLookupStore.__allocating_init(storeLocation:)(NSObject *a1, void *a2)
{
  uint64_t v4;
  id v5;

  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 16) = 5;
  v5 = sub_2126E7558(a1, a2);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 32) = objc_msgSend(v5, sel_newBackgroundContext);
  return v4;
}

uint64_t static LiveLookupStore.shared.getter()
{
  if (qword_253D8E8F8 != -1)
    swift_once();
  return swift_retain();
}

void *LiveLookupStore.init(storeLocation:)(NSObject *a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *result;
  id v6;
  void *v7;

  *(_DWORD *)(v2 + 16) = 5;
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  v3 = sub_2126E7558(a1, a2);
  swift_bridgeObjectRelease();
  v4 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3;

  result = *(void **)(v2 + 24);
  if (result)
  {
    v6 = objc_msgSend(result, sel_newBackgroundContext);
    v7 = *(void **)(v2 + 32);
    *(_QWORD *)(v2 + 32) = v6;

    return (void *)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2126DF4E0(int a1, id a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  NSObject *oslog;
  uint64_t v12;

  if (a2)
  {
    v3 = a2;
    if (qword_253D8E8A8 != -1)
      swift_once();
    v4 = sub_2126EF488();
    __swift_project_value_buffer(v4, (uint64_t)qword_253D8E9F8);
    v5 = a2;
    v6 = a2;
    oslog = sub_2126EF470();
    v7 = sub_2126EF56C();
    if (os_log_type_enabled(oslog, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v8 = 138412290;
      v10 = a2;
      v12 = _swift_stdlib_bridgeErrorToNSError();
      sub_2126EF5A8();
      *v9 = v12;

      _os_log_impl(&dword_2126D5000, oslog, v7, "Unable to load persistent stores: %@", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
      swift_arrayDestroy();
      MEMORY[0x212BF0AB8](v9, -1, -1);
      MEMORY[0x212BF0AB8](v8, -1, -1);

    }
    else
    {

    }
  }
}

void sub_2126DF6BC(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

uint64_t sub_2126DF730(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[6];

  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    v3 = (void *)result;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v1;
    *(_QWORD *)(v4 + 24) = v3;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_2126E7F1C;
    *(_QWORD *)(v5 + 24) = v4;
    v9[4] = sub_2126E7F30;
    v9[5] = v5;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 1107296256;
    v9[2] = sub_2126DF884;
    v9[3] = &block_descriptor;
    v6 = _Block_copy(v9);
    v7 = v2;
    swift_retain();
    v8 = v3;
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_performBlockAndWait_, v6);

    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((v3 & 1) == 0)
    {
      sub_2126DF8A4();
      return swift_release();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2126DF884(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_2126DF8A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v1 = v0;
  if (qword_253D8E8A8 != -1)
    swift_once();
  v2 = sub_2126EF488();
  __swift_project_value_buffer(v2, (uint64_t)qword_253D8E9F8);
  v3 = sub_2126EF470();
  v4 = sub_2126EF56C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2126D5000, v3, v4, "saving", v5, 2u);
    MEMORY[0x212BF0AB8](v5, -1, -1);
  }

  v6 = *(void **)(v1 + 32);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = sub_2126E7F80;
    *(_QWORD *)(v7 + 24) = v1;
    v10[4] = sub_2126E8780;
    v10[5] = v7;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_2126DF884;
    v10[3] = &block_descriptor_10;
    v8 = _Block_copy(v10);
    v9 = v6;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_performBlockAndWait_, v8);

    _Block_release(v8);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v8 & 1) == 0)
      return;
    __break(1u);
  }
  __break(1u);
}

void sub_2126DFA78(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  id v22;
  void *v23;
  NSObject *oslog;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (!v2)
    __break(1u);
  if (objc_msgSend(v2, sel_hasChanges))
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v25[0] = 0;
      if (objc_msgSend(v3, sel_save_, v25))
      {
        v4 = qword_253D8E8A8;
        v5 = v25[0];
        if (v4 != -1)
          swift_once();
        v6 = sub_2126EF488();
        __swift_project_value_buffer(v6, (uint64_t)qword_253D8E9F8);
        v7 = sub_2126EF470();
        v8 = sub_2126EF56C();
        if (os_log_type_enabled(v7, v8))
        {
          v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_2126D5000, v7, v8, "Save Successful", v9, 2u);
          MEMORY[0x212BF0AB8](v9, -1, -1);
        }

      }
      else
      {
        v13 = v25[0];
        v14 = (void *)sub_2126EF308();

        swift_willThrow();
        if (qword_253D8E8A8 != -1)
          swift_once();
        v15 = sub_2126EF488();
        __swift_project_value_buffer(v15, (uint64_t)qword_253D8E9F8);
        v16 = v14;
        v17 = v14;
        v18 = sub_2126EF470();
        v19 = sub_2126EF56C();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = (uint8_t *)swift_slowAlloc();
          v21 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v20 = 138412290;
          v22 = v14;
          v23 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v25[0] = v23;
          sub_2126EF5A8();
          *v21 = v23;

          _os_log_impl(&dword_2126D5000, v18, v19, "Could not save. %@", v20, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
          swift_arrayDestroy();
          MEMORY[0x212BF0AB8](v21, -1, -1);
          MEMORY[0x212BF0AB8](v20, -1, -1);

        }
        else
        {

        }
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_253D8E8A8 != -1)
      swift_once();
    v10 = sub_2126EF488();
    __swift_project_value_buffer(v10, (uint64_t)qword_253D8E9F8);
    oslog = sub_2126EF470();
    v11 = sub_2126EF56C();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2126D5000, oslog, v11, "no changes, not saving", v12, 2u);
      MEMORY[0x212BF0AB8](v12, -1, -1);
    }

  }
}

uint64_t sub_2126DFE50(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  char isEscapingClosureAtFileLocation;
  uint64_t v10;
  _QWORD aBlock[6];
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    v3 = (void *)result;
    v4 = (_QWORD *)swift_allocObject();
    v4[2] = &v12;
    v4[3] = v1;
    v4[4] = v3;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_2126E86C0;
    *(_QWORD *)(v5 + 24) = v4;
    aBlock[4] = sub_2126E8780;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2126DF884;
    aBlock[3] = &block_descriptor_126;
    v6 = _Block_copy(aBlock);
    v7 = v2;
    swift_retain();
    v8 = v3;
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_performBlockAndWait_, v6);

    _Block_release(v6);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      v10 = v12;
      swift_release();
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2126DFFBC(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  char isEscapingClosureAtFileLocation;
  uint64_t v10;
  _QWORD aBlock[6];
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    v3 = (void *)result;
    v4 = (_QWORD *)swift_allocObject();
    v4[2] = &v12;
    v4[3] = v1;
    v4[4] = v3;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_2126E8600;
    *(_QWORD *)(v5 + 24) = v4;
    aBlock[4] = sub_2126E8780;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2126DF884;
    aBlock[3] = &block_descriptor_116;
    v6 = _Block_copy(aBlock);
    v7 = v2;
    swift_retain();
    v8 = v3;
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_performBlockAndWait_, v6);

    _Block_release(v6);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      v10 = v12;
      swift_release();
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2126E0128(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  char isEscapingClosureAtFileLocation;
  uint64_t v10;
  _QWORD aBlock[6];
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    v3 = (void *)result;
    v4 = (_QWORD *)swift_allocObject();
    v4[2] = &v12;
    v4[3] = v1;
    v4[4] = v3;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_2126E8558;
    *(_QWORD *)(v5 + 24) = v4;
    aBlock[4] = sub_2126E8780;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2126DF884;
    aBlock[3] = &block_descriptor_87;
    v6 = _Block_copy(aBlock);
    v7 = v2;
    swift_retain();
    v8 = v3;
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_performBlockAndWait_, v6);

    _Block_release(v6);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      v10 = v12;
      swift_release();
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2126E0294(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  char isEscapingClosureAtFileLocation;
  uint64_t v13;
  _QWORD aBlock[6];
  uint64_t v15;

  result = sub_2126EF518();
  v15 = result;
  v6 = *(void **)(v2 + 32);
  if (v6)
  {
    v7 = (_QWORD *)swift_allocObject();
    v7[2] = a2;
    v7[3] = &v15;
    v7[4] = v2;
    v7[5] = a1;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = sub_2126E7FC4;
    *(_QWORD *)(v8 + 24) = v7;
    aBlock[4] = sub_2126E8780;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2126DF884;
    aBlock[3] = &block_descriptor_20;
    v9 = _Block_copy(aBlock);
    v10 = v6;
    swift_retain();
    v11 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_performBlockAndWait_, v9);

    _Block_release(v9);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      v13 = v15;
      swift_release();
      return v13;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2126E0404(uint64_t result, uint64_t a2, uint64_t a3, void (*a4)(_QWORD))
{
  void *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;

  v4 = *(void **)(a2 + 32);
  if (v4)
  {
    v5 = (_QWORD *)result;
    a4(0);
    v6 = v4;
    v7 = sub_2126EF590();

    *v5 = v7;
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2126E063C(uint64_t result, uint64_t a2)
{
  void *v2;
  _QWORD *v3;
  id v4;
  uint64_t v5;

  v2 = *(void **)(a2 + 32);
  if (v2)
  {
    v3 = (_QWORD *)result;
    v4 = v2;
    v5 = sub_2126EF590();

    *v3 = v5;
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LiveLookupStore.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LiveLookupStore.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t LiveLookupStore.activeExtensions()()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2126EF4A0();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  sub_2126E86F4(0, (unint64_t *)&qword_253D8E988);
  v3 = (void *)sub_2126EF554();
  objc_msgSend(v2, sel_setPredicate_, v3);

  v4 = v2;
  v5 = LiveLookupStore.fetchExtensions(_:)(v2);

  return v5;
}

uint64_t LiveLookupStore.fetchExtensions(_:)(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  if (qword_253D8E8A8 != -1)
    swift_once();
  v2 = sub_2126EF488();
  __swift_project_value_buffer(v2, (uint64_t)qword_253D8E9F8);
  v3 = a1;
  v4 = sub_2126EF470();
  v5 = sub_2126EF56C();
  if (!os_log_type_enabled(v4, v5))
  {

    v9 = v3;
    if (a1)
      goto LABEL_11;
    goto LABEL_10;
  }
  v6 = (uint8_t *)swift_slowAlloc();
  v7 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v6 = 138412290;
  if (a1)
  {
    v33[0] = (uint64_t)v3;
    v8 = v3;
  }
  else
  {
    v33[0] = 0;
  }
  sub_2126EF5A8();
  *v7 = a1;

  _os_log_impl(&dword_2126D5000, v4, v5, "fetching extensions: fetchRequest=%@", v6, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
  swift_arrayDestroy();
  MEMORY[0x212BF0AB8](v7, -1, -1);
  MEMORY[0x212BF0AB8](v6, -1, -1);

  v9 = v3;
  if (!a1)
  {
LABEL_10:
    v10 = objc_allocWithZone(MEMORY[0x24BDBB678]);
    v11 = (void *)sub_2126EF4A0();
    v9 = objc_msgSend(v10, sel_initWithEntityName_, v11);

  }
LABEL_11:
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E908);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2126F0B40;
  v13 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v14 = v3;
  v15 = (void *)sub_2126EF4A0();
  v16 = objc_msgSend(v13, sel_initWithKey_ascending_, v15, 1);

  *(_QWORD *)(v12 + 32) = v16;
  v33[0] = v12;
  sub_2126EF500();
  sub_2126E86F4(0, &qword_253D8E8B0);
  v17 = (void *)sub_2126EF4DC();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setSortDescriptors_, v17);

  v18 = sub_2126DFE50((uint64_t)v9);
  v19 = v9;
  swift_bridgeObjectRetain_n();
  v20 = v19;
  v21 = sub_2126EF470();
  v22 = sub_2126EF56C();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v33[0] = v32;
    *(_DWORD *)v23 = 138412546;
    v25 = v20;
    sub_2126EF5A8();
    *v24 = v20;

    *(_WORD *)(v23 + 12) = 2080;
    v26 = type metadata accessor for LiveLookupDBExtension();
    v27 = swift_bridgeObjectRetain();
    v28 = MEMORY[0x212BF0308](v27, v26);
    v30 = v29;
    swift_bridgeObjectRelease();
    sub_2126E6BB4(v28, v30, v33);
    sub_2126EF5A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2126D5000, v21, v22, "fetchExtensions: request: %@ extensions: %s", (uint8_t *)v23, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v24, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v32, -1, -1);
    MEMORY[0x212BF0AB8](v23, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v18;
}

void *LiveLookupStore.installedExtensions(refresh:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *result;

  v2 = v1;
  v4 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v5 = (void *)sub_2126EF4A0();
  v6 = objc_msgSend(v4, sel_initWithEntityName_, v5);

  sub_2126E86F4(0, (unint64_t *)&qword_253D8E988);
  v7 = (void *)sub_2126EF554();
  objc_msgSend(v6, sel_setPredicate_, v7);

  v8 = v6;
  v9 = LiveLookupStore.fetchExtensions(_:)(v6);

  if ((a1 & 1) == 0)
  {

    return (void *)v9;
  }
  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10)
      goto LABEL_4;
    goto LABEL_11;
  }
LABEL_15:
  swift_bridgeObjectRetain();
  v10 = sub_2126EF65C();
  if (!v10)
  {
LABEL_11:

    swift_bridgeObjectRelease();
    return (void *)v9;
  }
LABEL_4:
  v11 = 4;
  while (1)
  {
    if ((v9 & 0xC000000000000001) != 0)
      v12 = (id)MEMORY[0x212BF03F8](v11 - 4, v9);
    else
      v12 = *(id *)(v9 + 8 * v11);
    v13 = v12;
    v14 = v11 - 3;
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
      goto LABEL_15;
    }
    result = *(void **)(v2 + 32);
    if (!result)
      break;
    objc_msgSend(result, sel_refreshObject_mergeChanges_, v13, 0);

    ++v11;
    if (v14 == v10)
      goto LABEL_11;
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall LiveLookupStore.isAppStoreVendable(forExtensionWith:)(Swift::String forExtensionWith)
{
  void *object;
  uint64_t countAndFlagsBits;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Swift::Bool result;
  id v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;

  object = forExtensionWith._object;
  countAndFlagsBits = forExtensionWith._countAndFlagsBits;
  v3 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v4 = (void *)sub_2126EF4A0();
  v5 = objc_msgSend(v3, sel_initWithEntityName_, v4);

  sub_2126E86F4(0, (unint64_t *)&qword_253D8E988);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E870);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2126F0B50;
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 64) = sub_2126E8020();
  *(_QWORD *)(v6 + 32) = countAndFlagsBits;
  *(_QWORD *)(v6 + 40) = object;
  swift_bridgeObjectRetain();
  v7 = (void *)sub_2126EF554();
  objc_msgSend(v5, sel_setPredicate_, v7);

  v8 = sub_2126DFE50((uint64_t)v5);
  if (qword_253D8E8A8 != -1)
    swift_once();
  v9 = sub_2126EF488();
  __swift_project_value_buffer(v9, (uint64_t)qword_253D8E9F8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v10 = sub_2126EF470();
  v11 = sub_2126EF56C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v24 = v13;
    *(_DWORD *)v12 = 136315394;
    swift_bridgeObjectRetain();
    sub_2126E6BB4(countAndFlagsBits, (unint64_t)object, &v24);
    sub_2126EF5A8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2080;
    v14 = type metadata accessor for LiveLookupDBExtension();
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x212BF0308](v15, v14);
    v18 = v17;
    swift_bridgeObjectRelease();
    sub_2126E6BB4(v16, v18, &v24);
    sub_2126EF5A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2126D5000, v10, v11, "identifier %s extensions %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v13, -1, -1);
    MEMORY[0x212BF0AB8](v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    result = swift_bridgeObjectRelease_n();
  }
  if (!(v8 >> 62))
  {
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
LABEL_13:

    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v23 = sub_2126EF65C();
  result = swift_bridgeObjectRelease();
  if (!v23)
    goto LABEL_13;
LABEL_8:
  if ((v8 & 0xC000000000000001) != 0)
  {
    v20 = (id)MEMORY[0x212BF03F8](0, v8);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v20 = *(id *)(v8 + 32);
LABEL_11:
    v21 = v20;
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v21, sel_isAppStoreVendable);

    return v22;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall LiveLookupStore.resetExtension(with:)(Swift::String with)
{
  unint64_t v1;
  unint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t aBlock;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  uint64_t (*v37)();
  uint64_t v38;

  v2 = v1;
  object = with._object;
  countAndFlagsBits = with._countAndFlagsBits;
  sub_2126E86F4(0, (unint64_t *)&qword_253D8E988);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E870);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2126F0B50;
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 64) = sub_2126E8020();
  *(_QWORD *)(v5 + 32) = countAndFlagsBits;
  *(_QWORD *)(v5 + 40) = object;
  swift_bridgeObjectRetain();
  v6 = (_QWORD *)sub_2126EF554();
  v7 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v8 = (void *)sub_2126EF4A0();
  v9 = (uint64_t)objc_msgSend(v7, sel_initWithEntityName_, v8);

  objc_msgSend((id)v9, sel_setPredicate_, v6);
  v10 = sub_2126DFFBC(v9);
  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11)
      goto LABEL_3;
LABEL_22:

    swift_bridgeObjectRelease();
LABEL_23:
    sub_2126E1950((uint64_t)v6);

    return;
  }
LABEL_21:
  v11 = sub_2126EF65C();
  if (!v11)
    goto LABEL_22;
LABEL_3:
  v28 = (void *)v9;
  v29 = v6;
  v31 = v10 & 0xC000000000000001;
  v9 = 4;
  v30 = v10;
  while (1)
  {
    if (v31)
      v12 = (id)MEMORY[0x212BF03F8](v9 - 4, v10);
    else
      v12 = *(id *)(v10 + 8 * v9);
    v13 = v12;
    if (__OFADD__(v9 - 4, 1))
    {
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    v32 = v9 - 3;
    v14 = v11;
    v15 = *(void **)(v2 + 32);
    if (!v15)
      break;
    v6 = (_QWORD *)swift_allocObject();
    v6[2] = v2;
    v6[3] = v13;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = sub_2126E7F1C;
    *(_QWORD *)(v16 + 24) = v6;
    v37 = sub_2126E8780;
    v38 = v16;
    aBlock = MEMORY[0x24BDAC760];
    v34 = 1107296256;
    v35 = sub_2126DF884;
    v36 = &block_descriptor_31;
    v17 = _Block_copy(&aBlock);
    v18 = v15;
    v10 = v2;
    swift_retain();
    v19 = v13;
    swift_retain();
    swift_release();
    objc_msgSend(v18, sel_performBlockAndWait_, v17);

    _Block_release(v17);
    LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v18 & 1) != 0)
      goto LABEL_19;
    if (qword_253D8E8A8 != -1)
      swift_once();
    v20 = sub_2126EF488();
    __swift_project_value_buffer(v20, (uint64_t)qword_253D8E9F8);
    v21 = sub_2126EF470();
    v22 = sub_2126EF56C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_2126D5000, v21, v22, "saving", v23, 2u);
      MEMORY[0x212BF0AB8](v23, -1, -1);
    }

    v24 = *(void **)(v2 + 32);
    if (!v24)
      goto LABEL_25;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = sub_2126E7F80;
    *(_QWORD *)(v25 + 24) = v2;
    v37 = sub_2126E8780;
    v38 = v25;
    aBlock = MEMORY[0x24BDAC760];
    v34 = 1107296256;
    v35 = sub_2126DF884;
    v36 = &block_descriptor_39;
    v26 = _Block_copy(&aBlock);
    swift_retain();
    v27 = v24;
    swift_retain();
    swift_release();
    objc_msgSend(v27, sel_performBlockAndWait_, v26);

    _Block_release(v26);
    LOBYTE(v26) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    swift_release();
    if ((v26 & 1) != 0)
      goto LABEL_20;
    ++v9;
    v11 = v14;
    v10 = v30;
    if (v32 == v14)
    {

      swift_bridgeObjectRelease();
      v6 = v29;
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
}

uint64_t sub_2126E1950(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void (**v7)(char *, uint64_t, id);
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  unsigned int v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  id aBlock;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  uint64_t (*v51)();
  void (**v52)(char *, uint64_t, id);
  uint64_t v53;

  v2 = v1;
  v53 = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E8A0);
  MEMORY[0x24BDAC7A8](v4);
  v42 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (_QWORD *)sub_2126EF380();
  v7 = (void (**)(char *, uint64_t, id))*(v6 - 1);
  MEMORY[0x24BDAC7A8](v6);
  v41 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v10 = (void *)sub_2126EF4A0();
  v11 = objc_msgSend(v9, sel_initWithEntityName_, v10);

  objc_msgSend(v11, sel_setPredicate_, a1);
  v12 = sub_2126E0128((uint64_t)v11);
  if (v12 >> 62)
    goto LABEL_28;
  for (i = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10); i; i = sub_2126EF65C())
  {
    v39 = v11;
    v40 = 0;
    v46 = v12 & 0xC000000000000001;
    v14 = 4;
    v44 = v12;
    v45 = v6;
    v43 = i;
    while (1)
    {
      v15 = v46 ? (id)MEMORY[0x212BF03F8](v14 - 4, v12) : *(id *)(v12 + 8 * v14);
      v16 = v15;
      v17 = v14 - 3;
      if (__OFADD__(v14 - 4, 1))
        break;
      v18 = objc_msgSend(v15, sel_iconURL);
      if (v18)
      {
        v19 = v18;
        sub_2126EF4AC();

        v20 = (uint64_t)v42;
        sub_2126EF35C();
        swift_bridgeObjectRelease();
        if (((unsigned int (*)(uint64_t, uint64_t, _QWORD *))v7[6])(v20, 1, v6) == 1)
        {
          sub_2126E8164(v20, &qword_253D8E8A0);
        }
        else
        {
          v7[4](v41, v20, v6);
          v21 = objc_msgSend((id)objc_opt_self(), sel_defaultManager, v39, v40);
          v22 = (void *)sub_2126EF338();
          aBlock = 0;
          v23 = objc_msgSend(v21, sel_removeItemAtURL_error_, v22, &aBlock);

          if (v23)
          {
            v24 = aBlock;
          }
          else
          {
            v25 = aBlock;
            v26 = (void *)sub_2126EF308();

            swift_willThrow();
            v40 = 0;
          }
          ((void (*)(char *, _QWORD *))v7[1])(v41, v6);
        }
      }
      v27 = *(void **)(v2 + 32);
      if (!v27)
      {
        __break(1u);
LABEL_31:
        __break(1u);
      }
      v12 = (unint64_t)v7;
      v11 = (_QWORD *)swift_allocObject();
      v11[2] = v2;
      v11[3] = v16;
      v28 = swift_allocObject();
      *(_QWORD *)(v28 + 16) = sub_2126E7F1C;
      *(_QWORD *)(v28 + 24) = v11;
      v51 = sub_2126E8780;
      v52 = (void (**)(char *, uint64_t, id))v28;
      aBlock = (id)MEMORY[0x24BDAC760];
      v48 = 1107296256;
      v49 = sub_2126DF884;
      v50 = &block_descriptor_98;
      v29 = _Block_copy(&aBlock);
      v7 = v52;
      v6 = v27;
      swift_retain();
      v30 = v16;
      swift_retain();
      swift_release();
      objc_msgSend(v6, sel_performBlockAndWait_, v29);

      _Block_release(v29);
      LOBYTE(v29) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((v29 & 1) != 0)
        goto LABEL_26;
      if (qword_253D8E8A8 != -1)
        swift_once();
      v31 = sub_2126EF488();
      __swift_project_value_buffer(v31, (uint64_t)qword_253D8E9F8);
      v32 = sub_2126EF470();
      v33 = sub_2126EF56C();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_2126D5000, v32, v33, "saving", v34, 2u);
        MEMORY[0x212BF0AB8](v34, -1, -1);
      }

      v35 = *(void **)(v2 + 32);
      if (!v35)
        goto LABEL_31;
      v36 = swift_allocObject();
      *(_QWORD *)(v36 + 16) = sub_2126E7F80;
      *(_QWORD *)(v36 + 24) = v2;
      v51 = sub_2126E8780;
      v52 = (void (**)(char *, uint64_t, id))v36;
      aBlock = (id)MEMORY[0x24BDAC760];
      v48 = 1107296256;
      v49 = sub_2126DF884;
      v50 = &block_descriptor_106;
      v37 = _Block_copy(&aBlock);
      v6 = v52;
      swift_retain();
      v7 = v35;
      swift_retain();
      swift_release();
      objc_msgSend(v7, sel_performBlockAndWait_, v37);

      _Block_release(v37);
      LOBYTE(v37) = swift_isEscapingClosureAtFileLocation();

      swift_release();
      swift_release();
      swift_release();
      if ((v37 & 1) != 0)
        goto LABEL_27;
      ++v14;
      v7 = (void (**)(char *, uint64_t, id))v12;
      v12 = v44;
      v6 = v45;
      if (v17 == v43)
      {

        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    ;
  }

  return swift_bridgeObjectRelease();
}

Swift::tuple_OpaquePointer_OpaquePointer __swiftcall LiveLookupStore.updateExtensions(with:)(Swift::OpaquePointer with)
{
  uint64_t v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t *);
  NSObject *v15;
  int v16;
  _BOOL4 v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  Swift::OpaquePointer *v51;
  uint8_t *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  os_log_t v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  char *v62;
  id v63;
  void *v64;
  void *v65;
  char *v66;
  BOOL v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v78;
  char *v79;
  NSObject *v80;
  os_log_type_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  void *v86;
  char *v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  id v92;
  void *v93;
  unsigned __int8 v94;
  NSObject *v95;
  os_log_type_t v96;
  uint8_t *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  id v105;
  unint64_t v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  uint64_t v111;
  uint8_t *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  uint64_t v121;
  void *v122;
  unint64_t v123;
  unint64_t v124;
  Swift::OpaquePointer *v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t v130;
  __int128 v131;
  uint64_t v132;
  id v133;
  void *v134;
  uint64_t v135;
  NSObject *v136;
  os_log_type_t v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  void *v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  id v145;
  id v146;
  void *v147;
  void *v148;
  Swift::tuple_OpaquePointer_OpaquePointer result;
  _QWORD v150[2];
  char *v151;
  unint64_t v152;
  uint64_t *v153;
  uint8_t *v154;
  uint64_t v155;
  uint64_t v156;
  __int128 v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  NSObject *v162;
  void (*v163)(uint64_t, uint64_t, uint64_t *);
  __int128 v164;
  uint64_t *v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  char *v169;
  uint64_t v170[3];
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;

  v3 = (char *)sub_2126EF488();
  v4 = *((_QWORD *)v3 - 1);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (uint64_t)v150 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v150[0] = (char *)v150 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v150 - v10;
  v156 = v1;
  v12 = LiveLookupStore.fetchExtensions(_:)(0);
  v174 = MEMORY[0x24BEE4AF8];
  v175 = v12;
  v173 = MEMORY[0x24BEE4AF8];
  if (qword_253D8E8A8 != -1)
    goto LABEL_33;
  while (1)
  {
    v13 = __swift_project_value_buffer((uint64_t)v3, (uint64_t)qword_253D8E9F8);
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t *))(v4 + 16);
    v168 = v13;
    v163 = v14;
    ((void (*)(char *))v14)(v11);
    swift_bridgeObjectRetain_n();
    v15 = sub_2126EF470();
    v16 = sub_2126EF56C();
    v17 = os_log_type_enabled(v15, (os_log_type_t)v16);
    v18 = (unint64_t)with._rawValue >> 62;
    v165 = (uint64_t *)v3;
    v166 = v7;
    *(Swift::OpaquePointer *)&v164 = with;
    if (!v17)
    {

      swift_bridgeObjectRelease_n();
      v162 = *(NSObject **)(v4 + 8);
      ((void (*)(char *, char *))v162)(v11, v3);
      v30 = (uint64_t *)v3;
      goto LABEL_41;
    }
    v19 = (char *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v172 = v20;
    v169 = v19;
    *(_DWORD *)v19 = 136315394;
    if (v18)
    {
      swift_bridgeObjectRetain();
      v21 = sub_2126EF65C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = *(_QWORD *)(((unint64_t)with._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v22 = MEMORY[0x24BEE4AF8];
    v167 = v11;
    v161 = (unint64_t)with._rawValue >> 62;
    v162 = v15;
    LODWORD(v160) = v16;
    v159 = v20;
    if (v21)
    {
      v170[0] = MEMORY[0x24BEE4AF8];
      sub_2126E725C(0, v21 & ~(v21 >> 63), 0);
      if (v21 < 0)
      {
        __break(1u);
LABEL_163:
        __break(1u);
        goto LABEL_164;
      }
      v22 = v170[0];
      if (((unint64_t)with._rawValue & 0xC000000000000001) != 0)
      {
        v23 = 0;
        do
        {
          v24 = MEMORY[0x212BF03F8](v23, v164);
          v26 = *(_QWORD *)(v24 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier);
          v25 = *(_QWORD *)(v24 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier + 8);
          swift_bridgeObjectRetain();
          swift_unknownObjectRelease();
          v170[0] = v22;
          v28 = *(_QWORD *)(v22 + 16);
          v27 = *(_QWORD *)(v22 + 24);
          if (v28 >= v27 >> 1)
          {
            sub_2126E725C(v27 > 1, v28 + 1, 1);
            v22 = v170[0];
          }
          ++v23;
          *(_QWORD *)(v22 + 16) = v28 + 1;
          v29 = v22 + 16 * v28;
          *(_QWORD *)(v29 + 32) = v26;
          *(_QWORD *)(v29 + 40) = v25;
        }
        while (v21 != v23);
      }
      else
      {
        v31 = (char *)with._rawValue + 32;
        do
        {
          v32 = (uint64_t *)(*v31 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier);
          v34 = *v32;
          v33 = v32[1];
          v170[0] = v22;
          v36 = *(_QWORD *)(v22 + 16);
          v35 = *(_QWORD *)(v22 + 24);
          swift_bridgeObjectRetain();
          if (v36 >= v35 >> 1)
          {
            sub_2126E725C(v35 > 1, v36 + 1, 1);
            v22 = v170[0];
          }
          *(_QWORD *)(v22 + 16) = v36 + 1;
          v37 = v22 + 16 * v36;
          *(_QWORD *)(v37 + 32) = v34;
          *(_QWORD *)(v37 + 40) = v33;
          ++v31;
          --v21;
        }
        while (v21);
      }
      with._rawValue = (void *)v164;
    }
    v38 = v169;
    v3 = v169 + 4;
    v11 = (char *)MEMORY[0x212BF0308](v22, MEMORY[0x24BEE0D00]);
    v40 = v39;
    swift_bridgeObjectRelease();
    v170[0] = sub_2126E6BB4((uint64_t)v11, v40, &v172);
    sub_2126EF5A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v38 + 6) = 2080;
    swift_beginAccess();
    v21 = v175;
    if (v175 >> 62)
      break;
    v41 = *(_QWORD *)((v175 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v41)
      goto LABEL_39;
LABEL_21:
    v170[0] = MEMORY[0x24BEE4AF8];
    sub_2126E725C(0, v41 & ~(v41 >> 63), 0);
    if (v41 < 0)
      goto LABEL_163;
    v42 = 0;
    v43 = v170[0];
    v7 = v21 & 0xC000000000000001;
    while (v41 != v42)
    {
      if (v7)
        v44 = (id)MEMORY[0x212BF03F8](v42, v21);
      else
        v44 = *(id *)(v21 + 8 * v42 + 32);
      v45 = v44;
      v46 = objc_msgSend(v44, sel_identifier);
      if (!v46)
        goto LABEL_165;
      v47 = v46;
      v11 = (char *)sub_2126EF4AC();
      with._rawValue = v48;

      v170[0] = v43;
      v50 = *(_QWORD *)(v43 + 16);
      v49 = *(_QWORD *)(v43 + 24);
      v3 = (char *)(v50 + 1);
      if (v50 >= v49 >> 1)
      {
        sub_2126E725C(v49 > 1, v50 + 1, 1);
        v43 = v170[0];
      }
      ++v42;
      *(_QWORD *)(v43 + 16) = v3;
      v51 = (Swift::OpaquePointer *)(v43 + 16 * v50);
      v51[4]._rawValue = v11;
      v51[5]._rawValue = with._rawValue;
      if (v41 == v42)
      {
        swift_bridgeObjectRelease();
        goto LABEL_40;
      }
    }
    __break(1u);
LABEL_33:
    swift_once();
  }
  if ((v175 & 0x8000000000000000) != 0)
    v3 = (char *)v175;
  else
    v3 = (char *)(v175 & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  v41 = sub_2126EF65C();
  if (v41)
    goto LABEL_21;
LABEL_39:
  swift_bridgeObjectRelease();
  v43 = MEMORY[0x24BEE4AF8];
LABEL_40:
  v52 = (uint8_t *)v169;
  v53 = MEMORY[0x212BF0308](v43, MEMORY[0x24BEE0D00]);
  v55 = v54;
  swift_bridgeObjectRelease();
  v170[0] = sub_2126E6BB4(v53, v55, &v172);
  sub_2126EF5A8();
  swift_bridgeObjectRelease();
  v56 = v162;
  _os_log_impl(&dword_2126D5000, v162, (os_log_type_t)v160, "updatingExtensions: on device: %s in db: %s", v52, 0x16u);
  v57 = v159;
  swift_arrayDestroy();
  MEMORY[0x212BF0AB8](v57, -1, -1);
  MEMORY[0x212BF0AB8](v52, -1, -1);

  v58 = *(NSObject **)(v4 + 8);
  v30 = v165;
  v162 = v58;
  ((void (*)(char *, uint64_t *))v58)(v167, v165);
  v7 = v166;
  with._rawValue = (void *)v164;
  v18 = v161;
LABEL_41:
  swift_beginAccess();
  if (v175 >> 62)
    goto LABEL_134;
  v59 = *(_QWORD *)((v175 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_43:
  v155 = v59 + 1;
  if (__OFADD__(v59, 1))
  {
    __break(1u);
  }
  else if (!v18)
  {
    v60 = *(_QWORD *)(((unint64_t)with._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    goto LABEL_46;
  }
  swift_bridgeObjectRetain();
  v60 = sub_2126EF65C();
LABEL_46:
  if (v60)
  {
    LODWORD(v158) = 0;
    v62 = 0;
    v161 = (unint64_t)with._rawValue & 0xC000000000000001;
    v152 = (unint64_t)with._rawValue & 0xFFFFFFFFFFFFFF8;
    v151 = (char *)with._rawValue + 32;
    v153 = &v172;
    *(_QWORD *)&v61 = 136315138;
    v157 = v61;
    v150[1] = MEMORY[0x24BEE4AD8] + 8;
    v159 = v155;
    v160 = v60;
    while (1)
    {
      while (1)
      {
        if (v161)
        {
          v66 = (char *)MEMORY[0x212BF03F8](v62, with._rawValue);
        }
        else
        {
          if ((unint64_t)v62 >= *(_QWORD *)(v152 + 16))
            goto LABEL_130;
          v66 = (char *)*(id *)&v151[8 * (_QWORD)v62];
        }
        v169 = v66;
        v67 = __OFADD__(v62, 1);
        v68 = v62 + 1;
        if (v67)
        {
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          swift_bridgeObjectRetain();
          v59 = sub_2126EF65C();
          swift_bridgeObjectRelease();
          goto LABEL_43;
        }
        v18 = v175;
        v167 = v68;
        if (!(v175 >> 62))
          break;
        swift_bridgeObjectRetain();
        v69 = sub_2126EF65C();
        if (v69)
          goto LABEL_58;
LABEL_73:
        swift_bridgeObjectRelease();
        v79 = v169;
        v80 = sub_2126EF470();
        v81 = sub_2126EF56C();
        if (os_log_type_enabled(v80, v81))
        {
          v82 = swift_slowAlloc();
          v83 = swift_slowAlloc();
          v170[0] = v83;
          *(_DWORD *)v82 = v157;
          v18 = *(_QWORD *)&v79[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier];
          v84 = *(_QWORD *)&v79[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier + 8];
          swift_bridgeObjectRetain();
          *(_QWORD *)(v82 + 4) = sub_2126E6BB4(v18, v84, v170);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2126D5000, v80, v81, "adding extensionIdentifier: %s", (uint8_t *)v82, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x212BF0AB8](v83, -1, -1);
          MEMORY[0x212BF0AB8](v82, -1, -1);

        }
        else
        {

        }
        v7 = v166;
        v102 = *(_QWORD *)(v156 + 32);
        with._rawValue = (void *)v164;
        if (!v102)
          goto LABEL_168;
        type metadata accessor for LiveLookupDBExtension();
        v103 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v102);
        v30 = *(uint64_t **)&v79[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier + 8];
        swift_bridgeObjectRetain();
        v104 = (void *)sub_2126EF4A0();
        swift_bridgeObjectRelease();
        objc_msgSend(v103, sel_setIdentifier_, v104);

        objc_msgSend(v103, sel_setIsAppStoreVendable_, v79[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable]);
        if (v155 < -32768)
          goto LABEL_128;
        v30 = (uint64_t *)v159;
        if (v159 >= 0x8000)
          goto LABEL_129;
        objc_msgSend(v103, sel_setPriority_, (__int16)v159);
        objc_msgSend(v103, sel_setIsInstalled_, 1);
        objc_msgSend(v103, sel_setShouldRemove_, 0);
        v105 = v103;
        MEMORY[0x212BF02E4]();
        v18 = *(_QWORD *)((v174 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v18 >= *(_QWORD *)((v174 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2126EF50C();
        v159 = (uint64_t)v30 + 1;
        sub_2126EF524();
        sub_2126EF500();

        LODWORD(v158) = 1;
        v62 = v167;
        v30 = v165;
        if (v167 == (char *)v160)
          goto LABEL_109;
      }
      v69 = *(_QWORD *)((v175 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v69)
        goto LABEL_73;
LABEL_58:
      v30 = (uint64_t *)&v169[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier];
      v70 = 4;
      while (1)
      {
        v71 = v70 - 4;
        if ((v18 & 0xC000000000000001) != 0)
          v72 = (id)MEMORY[0x212BF03F8](v70 - 4, v18);
        else
          v72 = *(id *)(v18 + 8 * v70);
        with._rawValue = v72;
        v73 = objc_msgSend(v72, sel_identifier);
        if (!v73)
        {

          v78 = v70 - 3;
          if (__OFADD__(v71, 1))
            goto LABEL_124;
          goto LABEL_72;
        }
        v7 = (uint64_t)v73;
        v74 = sub_2126EF4AC();
        v76 = v75;

        if (v74 == *v30 && v76 == v30[1])
          break;
        v7 = sub_2126EF698();

        swift_bridgeObjectRelease();
        if ((v7 & 1) != 0)
          goto LABEL_76;
        v78 = v70 - 3;
        if (__OFADD__(v71, 1))
        {
LABEL_124:
          __break(1u);
          goto LABEL_125;
        }
LABEL_72:
        ++v70;
        if (v78 == v69)
          goto LABEL_73;
      }
      swift_bridgeObjectRelease();

LABEL_76:
      swift_bridgeObjectRelease();
      v87 = v169;
      v88 = sub_2126EF470();
      v89 = sub_2126EF56C();
      with._rawValue = (void *)v89;
      if (os_log_type_enabled(v88, v89))
      {
        v90 = (uint8_t *)swift_slowAlloc();
        v7 = swift_slowAlloc();
        v170[0] = v7;
        v169 = v87;
        *(_DWORD *)v90 = v157;
        v154 = v90 + 4;
        v91 = *v30;
        v18 = v30[1];
        swift_bridgeObjectRetain();
        v171 = sub_2126E6BB4(v91, v18, v170);
        v87 = v169;
        sub_2126EF5A8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2126D5000, v88, (os_log_type_t)with._rawValue, "extensionIdentifier in db: %s", v90, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x212BF0AB8](v7, -1, -1);
        MEMORY[0x212BF0AB8](v90, -1, -1);

      }
      else
      {

      }
      swift_beginAccess();
      if ((v175 & 0xC000000000000001) != 0)
      {
        v92 = (id)MEMORY[0x212BF03F8](v70 - 4);
      }
      else
      {
        if (v71 >= *(_QWORD *)((v175 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_126;
        v92 = *(id *)(v175 + 8 * v70);
      }
      v93 = v92;
      swift_endAccess();
      v94 = objc_msgSend(v93, sel_isInstalled);

      if ((v94 & 1) == 0)
      {
        v7 = v87;
        v95 = sub_2126EF470();
        v96 = sub_2126EF56C();
        with._rawValue = (void *)v96;
        if (os_log_type_enabled(v95, v96))
        {
          v97 = (uint8_t *)swift_slowAlloc();
          v158 = swift_slowAlloc();
          v170[0] = v158;
          v169 = (char *)v7;
          *(_DWORD *)v97 = v157;
          v154 = v97 + 4;
          v18 = (unint64_t)v87;
          v98 = *v30;
          v99 = v30[1];
          swift_bridgeObjectRetain();
          v100 = v98;
          v87 = (char *)v18;
          v171 = sub_2126E6BB4(v100, v99, v170);
          v7 = (uint64_t)v169;
          sub_2126EF5A8();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2126D5000, v95, (os_log_type_t)with._rawValue, "setting extensionIdentifier to available %s", v97, 0xCu);
          v101 = v158;
          swift_arrayDestroy();
          MEMORY[0x212BF0AB8](v101, -1, -1);
          MEMORY[0x212BF0AB8](v97, -1, -1);

        }
        else
        {

        }
        swift_beginAccess();
        v106 = v175;
        v30 = (uint64_t *)(v175 & 0xC000000000000001);
        if ((v175 & 0xC000000000000001) != 0)
        {
          v107 = (id)MEMORY[0x212BF03F8](v70 - 4, v175);
        }
        else
        {
          if (v71 >= *(_QWORD *)((v175 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_131;
          v107 = *(id *)(v175 + 8 * v70);
        }
        v108 = v107;
        swift_endAccess();
        objc_msgSend(v108, sel_setIsInstalled_, 1);

        if (v30)
        {
          v109 = (id)MEMORY[0x212BF03F8](v70 - 4, v106);
        }
        else
        {
          if (v71 >= *(_QWORD *)((v106 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_132;
          v109 = *(id *)(v106 + 8 * v70);
        }
        v110 = v109;
        objc_msgSend(v109, sel_setShouldRemove_, 0);

        if (v30)
        {
          v63 = (id)MEMORY[0x212BF03F8](v70 - 4, v106);
        }
        else
        {
          if (v71 >= *(_QWORD *)((v106 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_133;
          v63 = *(id *)(v106 + 8 * v70);
        }
        v64 = v63;
        objc_msgSend(v63, sel_setIsAppStoreVendable_, *(unsigned __int8 *)(v7 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable));

        LODWORD(v158) = 1;
      }
      swift_beginAccess();
      v65 = (void *)sub_2126E3564(v70 - 4);
      swift_endAccess();

      v7 = v166;
      v62 = v167;
      v30 = v165;
      with._rawValue = (void *)v164;
      if (v167 == (char *)v160)
        goto LABEL_109;
    }
  }
  LODWORD(v158) = 0;
LABEL_109:
  swift_bridgeObjectRelease();
  v111 = v150[0];
  v163(v150[0], v168, v30);
  v18 = sub_2126EF470();
  with._rawValue = (void *)sub_2126EF56C();
  if (!os_log_type_enabled((os_log_t)v18, (os_log_type_t)with._rawValue))
  {

    ((void (*)(uint64_t, uint64_t *))v162)(v111, v30);
LABEL_140:
    v129 = v175;
    if (v175 >> 62)
      goto LABEL_156;
    v130 = *(_QWORD *)((v175 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v130; v130 = sub_2126EF65C())
    {
      v169 = (char *)(v129 & 0xC000000000000001);
      v132 = 4;
      *(_QWORD *)&v131 = 136315138;
      v164 = v131;
      v160 = MEMORY[0x24BEE4AD8] + 8;
      v161 = v129;
      v167 = (char *)v130;
      while (1)
      {
        v133 = v169 ? (id)MEMORY[0x212BF03F8](v132 - 4, v129) : *(id *)(v129 + 8 * v132);
        v134 = v133;
        v135 = v132 - 3;
        if (__OFADD__(v132 - 4, 1))
          break;
        objc_msgSend(v133, sel_setIsInstalled_, 0);
        v163(v7, v168, v30);
        v21 = v134;
        v136 = sub_2126EF470();
        v137 = sub_2126EF56C();
        if (os_log_type_enabled(v136, v137))
        {
          v138 = swift_slowAlloc();
          v139 = swift_slowAlloc();
          v170[0] = v139;
          *(_DWORD *)v138 = v164;
          v140 = objc_msgSend((id)v21, sel_identifier);
          if (!v140)
            goto LABEL_167;
          v141 = v140;
          v142 = sub_2126EF4AC();
          v144 = v143;

          *(_QWORD *)(v138 + 4) = sub_2126E6BB4(v142, v144, v170);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2126D5000, v136, v137, "setting dbExtension to unavailable: %s", (uint8_t *)v138, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x212BF0AB8](v139, -1, -1);
          MEMORY[0x212BF0AB8](v138, -1, -1);

          v30 = v165;
          v7 = v166;
          ((void (*)(uint64_t, uint64_t *))v162)(v166, v165);
          v129 = v161;
        }
        else
        {

          ((void (*)(uint64_t, uint64_t *))v162)(v7, v30);
        }
        v145 = (id)v21;
        MEMORY[0x212BF02E4]();
        if (*(_QWORD *)((v173 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v173 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2126EF50C();
        sub_2126EF524();
        sub_2126EF500();

        ++v132;
        if ((char *)v135 == v167)
        {
          swift_bridgeObjectRelease();
          goto LABEL_158;
        }
      }
      __break(1u);
LABEL_156:
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    if ((v158 & 1) != 0)
    {
LABEL_158:
      v146 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
      if (qword_254B555F0 != -1)
        swift_once();
      objc_msgSend(v146, sel_postNotificationName_object_, qword_254B56230, 0);

      sub_2126DF8A4();
    }
    v148 = (void *)v173;
    v147 = (void *)v174;
    swift_bridgeObjectRelease();
    v85 = v147;
    v86 = v148;
    goto LABEL_169;
  }
  v112 = (uint8_t *)swift_slowAlloc();
  v113 = swift_slowAlloc();
  v170[0] = v113;
  *(_DWORD *)v112 = 136315138;
  v114 = v175;
  if (v175 >> 62)
  {
    swift_bridgeObjectRetain();
    v21 = sub_2126EF65C();
    if (v21)
      goto LABEL_112;
    goto LABEL_138;
  }
  v21 = *(_QWORD *)((v175 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v21)
  {
LABEL_138:
    swift_bridgeObjectRelease();
    v116 = MEMORY[0x24BEE4AF8];
LABEL_139:
    v126 = MEMORY[0x212BF0308](v116, MEMORY[0x24BEE0D00]);
    v128 = v127;
    swift_bridgeObjectRelease();
    v171 = sub_2126E6BB4(v126, v128, v170);
    sub_2126EF5A8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2126D5000, (os_log_t)v18, (os_log_type_t)with._rawValue, "dbExtensions: %s)", v112, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v113, -1, -1);
    MEMORY[0x212BF0AB8](v112, -1, -1);

    v30 = v165;
    ((void (*)(_QWORD, uint64_t *))v162)(v150[0], v165);
    v7 = v166;
    goto LABEL_140;
  }
LABEL_112:
  v171 = MEMORY[0x24BEE4AF8];
  sub_2126E725C(0, v21 & ~(v21 >> 63), 0);
  if ((v21 & 0x8000000000000000) == 0)
  {
    *(_QWORD *)&v164 = v113;
    LODWORD(v167) = with._rawValue;
    v169 = (char *)v112;
    v7 = v18;
    v115 = 0;
    v116 = v171;
    v30 = (uint64_t *)(v114 & 0xC000000000000001);
    while (v21 != v115)
    {
      if (v30)
        v117 = (id)MEMORY[0x212BF03F8](v115, v114);
      else
        v117 = *(id *)(v114 + 8 * v115 + 32);
      v118 = v117;
      v119 = objc_msgSend(v117, sel_identifier);
      if (!v119)
        goto LABEL_166;
      v120 = v119;
      v121 = sub_2126EF4AC();
      with._rawValue = v122;

      v171 = v116;
      v124 = *(_QWORD *)(v116 + 16);
      v123 = *(_QWORD *)(v116 + 24);
      v18 = v124 + 1;
      if (v124 >= v123 >> 1)
      {
        sub_2126E725C(v123 > 1, v124 + 1, 1);
        v116 = v171;
      }
      ++v115;
      *(_QWORD *)(v116 + 16) = v18;
      v125 = (Swift::OpaquePointer *)(v116 + 16 * v124);
      v125[4]._rawValue = (void *)v121;
      v125[5]._rawValue = with._rawValue;
      if (v21 == v115)
      {
        swift_bridgeObjectRelease();
        v18 = v7;
        v112 = (uint8_t *)v169;
        LOBYTE(with._rawValue) = (_BYTE)v167;
        v113 = v164;
        goto LABEL_139;
      }
    }
    goto LABEL_127;
  }
LABEL_164:
  __break(1u);
LABEL_165:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_166:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_167:

  __break(1u);
LABEL_168:
  __break(1u);
LABEL_169:
  result._1._rawValue = v86;
  result._0._rawValue = v85;
  return result;
}

uint64_t sub_2126E3564(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_2126E71F4(v3);
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      sub_2126EF500();
      return v10;
    }
  }
  result = sub_2126EF668();
  __break(1u);
  return result;
}

uint64_t LiveLookupStore.fetchBlockingInfo(for:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = v2;
  v6 = sub_2126EF3E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253D8E8A8 != -1)
    swift_once();
  v10 = sub_2126EF488();
  __swift_project_value_buffer(v10, (uint64_t)qword_253D8E9F8);
  swift_bridgeObjectRetain_n();
  v11 = sub_2126EF470();
  v12 = sub_2126EF56C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v24 = v3;
    v25 = v6;
    v15 = v14;
    v27 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    v26 = sub_2126E6BB4(a1, a2, &v27);
    sub_2126EF5A8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2126D5000, v11, v12, "fetchBlockingInfo for %s", v13, 0xCu);
    swift_arrayDestroy();
    v6 = v25;
    MEMORY[0x212BF0AB8](v15, -1, -1);
    MEMORY[0x212BF0AB8](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v16 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v17 = (void *)sub_2126EF4A0();
  v18 = objc_msgSend(v16, sel_initWithEntityName_, v17);

  sub_2126E86F4(0, (unint64_t *)&qword_253D8E988);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E870);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_2126F0B60;
  sub_2126EF3D4();
  v20 = sub_2126EF3BC();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(_QWORD *)(v19 + 56) = sub_2126E86F4(0, &qword_253D8E860);
  *(_QWORD *)(v19 + 64) = sub_2126E8088();
  *(_QWORD *)(v19 + 32) = v20;
  *(_QWORD *)(v19 + 96) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v19 + 104) = sub_2126E8020();
  *(_QWORD *)(v19 + 72) = a1;
  *(_QWORD *)(v19 + 80) = a2;
  swift_bridgeObjectRetain();
  v21 = (void *)sub_2126EF554();
  objc_msgSend(v18, sel_setPredicate_, v21);

  v22 = sub_2126DFFBC((uint64_t)v18);
  return v22;
}

void LiveLookupStore.fetchBlockingInfo(for:with:expiration:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  sub_2126E4998(a1, a2, a3, a4, "fetchBlockingInfo for %s with %s", 0x676E696B636F6C42, (uint64_t (*)(id))sub_2126DFFBC, (uint64_t (*)(_QWORD))type metadata accessor for BlockingInfo, "blockingInfo %s");
}

void LiveLookupStore.updateBlockingInfo(for:with:shouldBlock:)(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *);
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  void (*v39)(char *, uint64_t);
  void *v40;
  NSObject *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  id v45;
  _QWORD *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;

  v63 = a1;
  v60 = a4;
  v6 = sub_2126EF3E0();
  v61 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v48 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B55610);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2126EF488();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253D8E8A8 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v15, (uint64_t)qword_253D8E9F8);
  v20 = *(void (**)(char *))(v16 + 16);
  v59 = v19;
  v20(v18);
  swift_bridgeObjectRetain_n();
  v21 = a3;
  v22 = sub_2126EF470();
  v58 = sub_2126EF56C();
  if (os_log_type_enabled(v22, (os_log_type_t)v58))
  {
    v50 = v22;
    v51 = v16;
    v52 = v15;
    v53 = v14;
    v55 = v9;
    v56 = v11;
    v57 = v6;
    v23 = swift_slowAlloc();
    v49 = swift_slowAlloc();
    v65 = v49;
    *(_DWORD *)v23 = 136315394;
    swift_bridgeObjectRetain();
    v64 = sub_2126E6BB4(v63, a2, (uint64_t *)&v65);
    sub_2126EF5A8();
    v54 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2080;
    v24 = objc_msgSend(v21, sel_identifier);
    if (!v24)
    {

      __break(1u);
      goto LABEL_16;
    }
    v25 = v24;
    v26 = sub_2126EF4AC();
    v28 = v27;

    v64 = sub_2126E6BB4(v26, v28, (uint64_t *)&v65);
    sub_2126EF5A8();

    swift_bridgeObjectRelease();
    v29 = v50;
    _os_log_impl(&dword_2126D5000, v50, (os_log_type_t)v58, "updateBlockingInfo for %s with %s", (uint8_t *)v23, 0x16u);
    v30 = v49;
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v30, -1, -1);
    MEMORY[0x212BF0AB8](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v18, v52);
    v11 = v56;
    v6 = v57;
    a2 = v54;
    v9 = v55;
    v14 = v53;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56))(v14, 1, 1, v6);
  LiveLookupStore.fetchBlockingInfo(for:with:expiration:)(v63, a2, v21, (uint64_t)v14);
  v32 = v31;
  sub_2126E8164((uint64_t)v14, &qword_254B55610);
  v33 = v21;
  if (!v32)
  {
    v36 = *(_QWORD *)(v62 + 32);
    if (v36)
    {
      type metadata accessor for BlockingInfo();
      v35 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v36);
      v34 = v35;
      v32 = 0;
      goto LABEL_11;
    }
LABEL_16:
    __break(1u);
    return;
  }
  v34 = v32;
  v35 = v32;
LABEL_11:
  v37 = v32;
  v38 = (void *)sub_2126EF4A0();
  objc_msgSend(v34, sel_setHandle_, v38);

  objc_msgSend(v34, sel_setShouldBlock_, v60 & 1);
  sub_2126EF3D4();
  sub_2126EF3B0();
  v39 = *(void (**)(char *, uint64_t))(v61 + 8);
  v39(v9, v6);
  v40 = (void *)sub_2126EF3BC();
  v39(v11, v6);
  objc_msgSend(v34, sel_setExpiration_, v40);

  objc_msgSend(v34, sel_setDbExtension_, v33);
  v41 = v34;
  v42 = sub_2126EF470();
  v43 = sub_2126EF56C();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = v35;
    v46 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v44 = 138412290;
    v65 = v41;
    v47 = v41;
    sub_2126EF5A8();
    *v46 = v45;

    _os_log_impl(&dword_2126D5000, v42, v43, "saving blockingInfo %@", v44, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v46, -1, -1);
    MEMORY[0x212BF0AB8](v44, -1, -1);
  }
  else
  {

    v42 = v41;
  }

  sub_2126DF8A4();
}

uint64_t LiveLookupStore.fetchIdentityInfo(for:from:canBeEmpty:)(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (**v27)(char *, id);
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  unint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _QWORD *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  void (**v67)(char *, id);
  id v68;
  uint64_t v69;
  uint64_t v70[2];

  v5 = v4;
  LODWORD(v6) = a4;
  v70[1] = *MEMORY[0x24BDAC8D0];
  v10 = sub_2126EF3E0();
  v67 = *(void (***)(char *, id))(v10 - 8);
  v68 = (id)v10;
  MEMORY[0x24BDAC7A8](v10);
  v66 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253D8E8A8 != -1)
    swift_once();
  v12 = sub_2126EF488();
  v13 = (void *)__swift_project_value_buffer(v12, (uint64_t)qword_253D8E9F8);
  swift_bridgeObjectRetain_n();
  v14 = a3;
  v15 = sub_2126EF470();
  v16 = sub_2126EF56C();
  if (os_log_type_enabled(v15, v16))
  {
    v62 = v13;
    v63 = v6;
    v65 = v5;
    v6 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v70[0] = v18;
    *(_DWORD *)v6 = 136315394;
    swift_bridgeObjectRetain();
    v64 = a1;
    v69 = sub_2126E6BB4(a1, a2, v70);
    sub_2126EF5A8();
    v19 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2112;
    v20 = objc_msgSend(v14, sel_identityInfo);
    v21 = v20;
    if (v20)
      v69 = (uint64_t)v20;
    else
      v69 = 0;
    sub_2126EF5A8();
    *v17 = v21;

    _os_log_impl(&dword_2126D5000, v15, v16, "fetchIdentityInfo for %s from %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v18, -1, -1);
    MEMORY[0x212BF0AB8](v6, -1, -1);

    a1 = v64;
    v5 = v65;
    a2 = v19;
    LODWORD(v6) = v63;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!objc_msgSend(v14, sel_isEnabled) || !objc_msgSend(v14, sel_isInstalled))
  {
    v50 = v14;
    v51 = sub_2126EF470();
    v52 = sub_2126EF56C();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v53 = 138412290;
      v55 = objc_msgSend(v50, sel_identityInfo);
      v56 = v55;
      if (v55)
        v70[0] = (uint64_t)v55;
      else
        v70[0] = 0;
      sub_2126EF5A8();
      *v54 = v56;

      _os_log_impl(&dword_2126D5000, v51, v52, "%@ not enabled and installed", v53, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
      swift_arrayDestroy();
      MEMORY[0x212BF0AB8](v54, -1, -1);
      MEMORY[0x212BF0AB8](v53, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v22 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v23 = (void *)sub_2126EF4A0();
  v62 = objc_msgSend(v22, sel_initWithEntityName_, v23);

  sub_2126E86F4(0, (unint64_t *)&qword_253D8E988);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E870);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2126F0B70;
  *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v24 + 64) = sub_2126E8020();
  *(_QWORD *)(v24 + 32) = a1;
  *(_QWORD *)(v24 + 40) = a2;
  swift_bridgeObjectRetain();
  v25 = v66;
  sub_2126EF3D4();
  v26 = sub_2126EF3BC();
  v67[1](v25, v68);
  *(_QWORD *)(v24 + 96) = sub_2126E86F4(0, &qword_253D8E860);
  *(_QWORD *)(v24 + 104) = sub_2126E8088();
  *(_QWORD *)(v24 + 72) = v26;
  *(_QWORD *)(v24 + 136) = type metadata accessor for LiveLookupDBExtension();
  *(_QWORD *)(v24 + 144) = sub_2126E80E0(&qword_254B55618, (uint64_t (*)(uint64_t))type metadata accessor for LiveLookupDBExtension, MEMORY[0x24BEE5BE8]);
  *(_QWORD *)(v24 + 112) = v14;
  v27 = (void (**)(char *, id))v14;
  v28 = (id)sub_2126EF554();
  v67 = v27;
  if ((v6 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E908);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_2126F0B80;
    *(_QWORD *)(v29 + 32) = v28;
    v30 = v28;
    *(_QWORD *)(v29 + 40) = sub_2126EF554();
    v70[0] = v29;
    sub_2126EF500();
    v31 = (void *)sub_2126EF4DC();
    swift_bridgeObjectRelease();
    v28 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v31);

  }
  v32 = v62;
  v68 = v28;
  objc_msgSend(v62, sel_setPredicate_, v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E908);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_2126F0B40;
  v34 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v35 = (void *)sub_2126EF4A0();
  v36 = objc_msgSend(v34, sel_initWithKey_ascending_, v35, 1);

  *(_QWORD *)(v33 + 32) = v36;
  v70[0] = v33;
  sub_2126EF500();
  sub_2126E86F4(0, &qword_253D8E8B0);
  v37 = (void *)sub_2126EF4DC();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, sel_setSortDescriptors_, v37);

  v38 = sub_2126E0128((uint64_t)v32);
  swift_bridgeObjectRetain_n();
  v39 = sub_2126EF470();
  v40 = sub_2126EF56C();
  if (os_log_type_enabled(v39, v40))
  {
    v64 = a1;
    v41 = (uint8_t *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v65 = v5;
    v43 = v42;
    v70[0] = v42;
    *(_DWORD *)v41 = 136315138;
    v44 = a2;
    v45 = type metadata accessor for IdentityInfo();
    v46 = swift_bridgeObjectRetain();
    v47 = MEMORY[0x212BF0308](v46, v45);
    v63 = v6;
    v6 = v48;
    swift_bridgeObjectRelease();
    v49 = v47;
    a2 = v44;
    v69 = sub_2126E6BB4(v49, v6, v70);
    a1 = v64;
    sub_2126EF5A8();
    swift_bridgeObjectRelease_n();
    LOBYTE(v6) = v63;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2126D5000, v39, v40, "identityInfo %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v43, -1, -1);
    MEMORY[0x212BF0AB8](v41, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v59 = v68;
  if (v38 >> 62)
  {
    swift_bridgeObjectRetain();
    v61 = sub_2126EF65C();
    swift_bridgeObjectRelease();
    if (v61)
      goto LABEL_26;
    goto LABEL_31;
  }
  if (!*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_31:
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      v57 = LiveLookupStore.fetchIdentityInfo(for:from:canBeEmpty:)(a1, a2, v67, 1);

      return v57;
    }

    return 0;
  }
LABEL_26:
  if ((v38 & 0xC000000000000001) != 0)
  {
    v60 = (id)MEMORY[0x212BF03F8](0, v38);
  }
  else
  {
    if (!*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v60 = *(id *)(v38 + 32);
  }
  v57 = (uint64_t)v60;
  swift_bridgeObjectRelease();

  return v57;
}

void LiveLookupStore.fetchIdentityInfo(for:with:expiration:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  sub_2126E4998(a1, a2, a3, a4, "fetchIdentityInfo for %s with %s", 0x797469746E656449, (uint64_t (*)(id))sub_2126E0128, (uint64_t (*)(_QWORD))type metadata accessor for IdentityInfo, "identityInfo %s");
}

void sub_2126E4998(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t (*a7)(id), uint64_t (*a8)(_QWORD), const char *a9)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *);
  char *v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  char *v39;
  char *v40;
  id v41;
  unsigned int (*v42)(char *, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  unint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  int v77;
  const char *v78;
  char *v79;
  uint64_t (*v80)(_QWORD);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t (*v84)(id);
  char *v85;
  id v86;
  uint64_t v87;
  uint64_t v88[2];

  v84 = a7;
  v81 = a6;
  v78 = a5;
  v86 = (id)a1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B55610);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_2126EF3E0();
  v16 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v79 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2126EF488();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253D8E8A8 != -1)
    swift_once();
  v22 = __swift_project_value_buffer(v18, (uint64_t)qword_253D8E9F8);
  v23 = *(void (**)(char *))(v19 + 16);
  v83 = v22;
  v23(v21);
  swift_bridgeObjectRetain_n();
  v24 = a3;
  v25 = sub_2126EF470();
  v77 = sub_2126EF56C();
  v26 = os_log_type_enabled(v25, (os_log_type_t)v77);
  v80 = a8;
  v85 = v24;
  if (v26)
  {
    v72 = v19;
    v74 = a4;
    v75 = v15;
    v76 = v16;
    v27 = swift_slowAlloc();
    v71 = swift_slowAlloc();
    v88[0] = v71;
    *(_DWORD *)v27 = 136315394;
    swift_bridgeObjectRetain();
    v87 = sub_2126E6BB4((uint64_t)v86, a2, v88);
    sub_2126EF5A8();
    v73 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2080;
    v28 = objc_msgSend(v24, sel_identifier);
    if (!v28)
      goto LABEL_23;
    v29 = v28;
    v30 = sub_2126EF4AC();
    v32 = v31;

    v87 = sub_2126E6BB4(v30, v32, v88);
    sub_2126EF5A8();
    v33 = v85;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2126D5000, v25, (os_log_type_t)v77, v78, (uint8_t *)v27, 0x16u);
    v34 = v71;
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v34, -1, -1);
    MEMORY[0x212BF0AB8](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v72 + 8))(v21, v18);
    v15 = v75;
    v16 = v76;
    a2 = v73;
    a4 = v74;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  v35 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v36 = (void *)sub_2126EF4A0();
  v37 = objc_msgSend(v35, sel_initWithEntityName_, v36);

  sub_2126E86F4(0, (unint64_t *)&qword_253D8E988);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E870);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_2126F0B60;
  *(_QWORD *)(v38 + 56) = type metadata accessor for LiveLookupDBExtension();
  *(_QWORD *)(v38 + 64) = sub_2126E80E0(&qword_254B55618, (uint64_t (*)(uint64_t))type metadata accessor for LiveLookupDBExtension, MEMORY[0x24BEE5BE8]);
  v39 = v85;
  *(_QWORD *)(v38 + 32) = v85;
  *(_QWORD *)(v38 + 96) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v38 + 104) = sub_2126E8020();
  *(_QWORD *)(v38 + 72) = v86;
  *(_QWORD *)(v38 + 80) = a2;
  swift_bridgeObjectRetain();
  v40 = v39;
  v41 = (id)sub_2126EF554();
  sub_2126E8120(a4, (uint64_t)v15, &qword_254B55610);
  v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v43 = v16;
  v44 = v82;
  if (v42(v15, 1, v82) == 1)
  {
    sub_2126E8164((uint64_t)v15, &qword_254B55610);
  }
  else
  {
    v45 = v15;
    v46 = v79;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v79, v45, v44);
    v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_2126F0B50;
    v48 = v41;
    v49 = sub_2126EF3BC();
    *(_QWORD *)(v47 + 56) = sub_2126E86F4(0, &qword_253D8E860);
    *(_QWORD *)(v47 + 64) = sub_2126E8088();
    *(_QWORD *)(v47 + 32) = v49;
    v50 = (void *)sub_2126EF554();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E908);
    v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_2126F0B80;
    *(_QWORD *)(v51 + 32) = v48;
    *(_QWORD *)(v51 + 40) = v50;
    v88[0] = v51;
    sub_2126EF500();
    v52 = v50;
    v53 = (void *)sub_2126EF4DC();
    swift_bridgeObjectRelease();
    v41 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v53);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v44);
  }
  objc_msgSend(v37, sel_setPredicate_, v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E908);
  v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_2126F0B40;
  v55 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v56 = (void *)sub_2126EF4A0();
  v57 = objc_msgSend(v55, sel_initWithKey_ascending_, v56, 1);

  *(_QWORD *)(v54 + 32) = v57;
  v88[0] = v54;
  sub_2126EF500();
  sub_2126E86F4(0, &qword_253D8E8B0);
  v58 = (void *)sub_2126EF4DC();
  swift_bridgeObjectRelease();
  objc_msgSend(v37, sel_setSortDescriptors_, v58);

  v59 = v84(v37);
  swift_bridgeObjectRetain_n();
  v60 = sub_2126EF470();
  v61 = sub_2126EF56C();
  if (os_log_type_enabled(v60, v61))
  {
    v85 = (char *)a9;
    v86 = v41;
    v62 = (uint8_t *)swift_slowAlloc();
    v63 = swift_slowAlloc();
    v88[0] = v63;
    *(_DWORD *)v62 = 136315138;
    v64 = v80(0);
    v65 = swift_bridgeObjectRetain();
    v66 = MEMORY[0x212BF0308](v65, v64);
    v68 = v67;
    swift_bridgeObjectRelease();
    v87 = sub_2126E6BB4(v66, v68, v88);
    sub_2126EF5A8();
    swift_bridgeObjectRelease_n();
    v41 = v86;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2126D5000, v60, v61, v85, v62, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v63, -1, -1);
    MEMORY[0x212BF0AB8](v62, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (v59 >> 62)
  {
    swift_bridgeObjectRetain();
    v70 = sub_2126EF65C();
    swift_bridgeObjectRelease();
    if (!v70)
      goto LABEL_18;
  }
  else if (!*(_QWORD *)((v59 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_18:
    swift_bridgeObjectRelease();

    return;
  }
  if ((v59 & 0xC000000000000001) != 0)
  {
    MEMORY[0x212BF03F8](0, v59);
    goto LABEL_18;
  }
  if (*(_QWORD *)((v59 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v69 = *(id *)(v59 + 32);
    goto LABEL_18;
  }
  __break(1u);
LABEL_23:

  __break(1u);
}

void LiveLookupStore.updateIdentityInfo(for:with:name:iconURL:type:ttlMinutes:)(uint64_t a1, id a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, unsigned int a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *);
  id v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  void *v56;
  void *v57;
  void (*v58)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int v59;
  char *v60;
  void (*v61)(char *, uint64_t);
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  char *v70;
  char *v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  _QWORD *v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t, uint64_t, uint64_t);
  id v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103[2];

  v95 = a8;
  v93 = a5;
  v87 = a4;
  v98 = a1;
  v12 = sub_2126EF3E0();
  v100 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v96 = (char *)&v79 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E8A0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = sub_2126EF380();
  v94 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v86 = (char *)&v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B55610);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v85 = (char *)&v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v99 = (char *)&v79 - v24;
  v25 = sub_2126EF488();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v79 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = *a7;
  if (qword_253D8E8A8 != -1)
    swift_once();
  v29 = __swift_project_value_buffer(v25, (uint64_t)qword_253D8E9F8);
  v30 = *(void (**)(char *))(v26 + 16);
  v89 = v29;
  v30(v28);
  swift_bridgeObjectRetain_n();
  v31 = a3;
  v32 = v26;
  v33 = sub_2126EF470();
  LODWORD(v91) = sub_2126EF56C();
  if (os_log_type_enabled(v33, (os_log_type_t)v91))
  {
    v81 = v32;
    v82 = v19;
    v83 = a6;
    v84 = v15;
    v90 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v12;
    v34 = swift_slowAlloc();
    v80 = swift_slowAlloc();
    v103[0] = v80;
    *(_DWORD *)v34 = 136315394;
    swift_bridgeObjectRetain();
    v102 = sub_2126E6BB4(v98, (unint64_t)a2, v103);
    sub_2126EF5A8();
    v88 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 2080;
    v35 = objc_msgSend(v31, sel_identifier);
    v36 = v31;
    if (!v35)
    {
LABEL_35:

      __break(1u);
      goto LABEL_36;
    }
    v37 = v35;
    v38 = sub_2126EF4AC();
    v40 = v39;

    v102 = sub_2126E6BB4(v38, v40, v103);
    sub_2126EF5A8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2126D5000, v33, (os_log_type_t)v91, "updateIdentityInfo for %s with %s", (uint8_t *)v34, 0x16u);
    v41 = v80;
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v41, -1, -1);
    MEMORY[0x212BF0AB8](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v81 + 8))(v28, v25);
    v12 = (uint64_t)v90;
    a2 = v88;
    a6 = v83;
    v15 = v84;
    v31 = v36;
    v19 = v82;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v28, v25);
  }
  v42 = (uint64_t)v99;
  v90 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v100 + 56);
  v90(v99, 1, 1, v12);
  v43 = v98;
  v91 = v31;
  LiveLookupStore.fetchIdentityInfo(for:with:expiration:)(v98, (unint64_t)a2, v31, v42);
  v45 = v44;
  sub_2126E8164(v42, &qword_254B55610);
  v46 = v97;
  if (v45)
  {
    v47 = v45;
    v88 = v45;
  }
  else
  {
    v48 = *(_QWORD *)(v101 + 32);
    if (!v48)
    {
LABEL_36:
      __break(1u);
      return;
    }
    type metadata accessor for IdentityInfo();
    v88 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v48);
    v47 = v88;
    v45 = 0;
  }
  v49 = v45;
  v50 = (void *)sub_2126EF4A0();
  objc_msgSend(v47, sel_setHandle_, v50);

  objc_msgSend(v47, sel_setType_, v92);
  if (v93)
  {
    v51 = (void *)sub_2126EF4A0();
    objc_msgSend(v47, sel_setName_, v51);

  }
  v52 = (void *)sub_2126EF4A0();
  objc_msgSend(v47, sel_setHandle_, v52);

  sub_2126E8120(a6, (uint64_t)v19, &qword_253D8E8A0);
  v53 = v94;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v94 + 48))(v19, 1, v46) == 1)
  {
    sub_2126E8164((uint64_t)v19, &qword_253D8E8A0);
  }
  else
  {
    v54 = v19;
    v55 = v86;
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v86, v54, v46);
    sub_2126EF320();
    v56 = (void *)sub_2126EF4A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v47, sel_setIconURL_, v56);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v46);
  }
  v58 = v90;
  v57 = v91;
  if (v95)
    v59 = v95;
  else
    v59 = 5;
  sub_2126EF3D4();
  v36 = v96;
  if (((60 * v59) & 0xFFFFFFFF00000000) != 0)
  {
    __break(1u);
    goto LABEL_35;
  }
  sub_2126EF3B0();
  v60 = v15;
  v61 = *(void (**)(char *, uint64_t))(v100 + 8);
  v61(v60, v12);
  v62 = (void *)sub_2126EF3BC();
  v61((char *)v36, v12);
  objc_msgSend(v47, sel_setExpiration_, v62);

  objc_msgSend(v47, sel_setDbExtension_, v57);
  v63 = v57;
  v64 = (uint64_t)v99;
  sub_2126EF3D4();
  v58((char *)v64, 0, 1, v12);
  LiveLookupStore.fetchBlockingInfo(for:with:expiration:)(v43, (unint64_t)a2, v63, v64);
  v66 = v65;
  sub_2126E8164(v64, &qword_254B55610);
  if (v66)
  {
    v67 = v66;
    if ((objc_msgSend(v67, sel_shouldBlock) & 1) == 0)
    {
      v68 = objc_msgSend(v47, sel_expiration);
      if (v68)
      {
        sub_2126EF3C8();

        v69 = v100;
        v70 = v85;
        (*(void (**)(char *, void *, uint64_t))(v100 + 32))(v85, v36, v12);
        v58(v70, 0, 1, v12);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48))(v70, 1, v12) == 1)
        {
          v68 = 0;
        }
        else
        {
          v71 = v70;
          v68 = (id)sub_2126EF3BC();
          v61(v71, v12);
        }
      }
      else
      {
        v58(v85, 1, 1, v12);
      }
      objc_msgSend(v67, sel_setExpiration_, v68);

    }
  }
  else
  {
    v67 = v47;
  }

  v72 = v88;
  v73 = v88;
  v74 = sub_2126EF470();
  v75 = sub_2126EF56C();
  if (os_log_type_enabled(v74, v75))
  {
    v76 = (uint8_t *)swift_slowAlloc();
    v77 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v76 = 138412290;
    v103[0] = (uint64_t)v73;
    v78 = v73;
    sub_2126EF5A8();
    *v77 = v72;

    _os_log_impl(&dword_2126D5000, v74, v75, "saving identityInfo %@", v76, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v77, -1, -1);
    MEMORY[0x212BF0AB8](v76, -1, -1);
  }
  else
  {

    v74 = v73;
  }

  sub_2126DF8A4();
}

_QWORD *LiveLookupStore.removeStaleRecords()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  char isEscapingClosureAtFileLocation;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint8_t *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  BOOL v41;
  unint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void (*v53)(char *);
  char *v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t);
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  void (*v80)(char *, uint64_t);
  id v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  NSObject *v102;
  os_log_type_t v103;
  uint8_t *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  id v111[2];
  __int128 v112;
  unint64_t v113;
  unsigned int v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  char *v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  _QWORD *v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t i;
  id aBlock;
  uint64_t v137;
  uint64_t (*v138)(uint64_t);
  void *v139;
  uint64_t (*v140)();
  uint64_t v141;
  uint64_t v142[2];

  v1 = v0;
  v142[1] = *MEMORY[0x24BDAC8D0];
  v121 = sub_2126EF314();
  v120 = *(_QWORD *)(v121 - 8);
  MEMORY[0x24BDAC7A8](v121);
  v119 = (char *)v111 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E8A0);
  MEMORY[0x24BDAC7A8](v3);
  v118 = (char *)v111 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_2126EF380();
  v117 = *(_QWORD *)(v126 - 8);
  v5 = MEMORY[0x24BDAC7A8](v126);
  v116 = (char *)v111 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v125 = (char *)v111 - v7;
  v133 = sub_2126EF488();
  v128 = *(_QWORD *)(v133 - 8);
  MEMORY[0x24BDAC7A8](v133);
  v127 = (char *)v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2126EF3E0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2126E86F4(0, (unint64_t *)&qword_253D8E988);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E870);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2126F0B50;
  sub_2126EF3D4();
  v14 = sub_2126EF3BC();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(_QWORD *)(v13 + 56) = sub_2126E86F4(0, &qword_253D8E860);
  *(_QWORD *)(v13 + 64) = sub_2126E8088();
  *(_QWORD *)(v13 + 32) = v14;
  v15 = v1;
  v16 = (void *)sub_2126EF554();
  v17 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v18 = (void *)sub_2126EF4A0();
  v19 = objc_msgSend(v17, sel_initWithEntityName_, v18);

  v111[0] = v16;
  objc_msgSend(v19, sel_setPredicate_, v16);
  v130 = v19;
  v20 = sub_2126DFFBC((uint64_t)v19);
  if (v20 >> 62)
    goto LABEL_22;
  v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
  for (i = v1; v21; i = v15)
  {
    v132 = v20 & 0xC000000000000001;
    v22 = 4;
    v131 = (_QWORD *)v20;
    while (1)
    {
      v23 = v132 ? (id)MEMORY[0x212BF03F8](v22 - 4, v20) : *(id *)(v20 + 8 * v22);
      v24 = v23;
      if (__OFADD__(v22 - 4, 1))
        break;
      v134 = v22 - 3;
      v25 = *(void **)(v15 + 32);
      if (!v25)
      {
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
      }
      v20 = v21;
      v26 = swift_allocObject();
      *(_QWORD *)(v26 + 16) = v15;
      *(_QWORD *)(v26 + 24) = v24;
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = sub_2126E7F1C;
      *(_QWORD *)(v27 + 24) = v26;
      v140 = sub_2126E8780;
      v141 = v27;
      aBlock = (id)MEMORY[0x24BDAC760];
      v137 = 1107296256;
      v138 = sub_2126DF884;
      v139 = &block_descriptor_50;
      v28 = _Block_copy(&aBlock);
      v29 = v25;
      swift_retain();
      v30 = v24;
      swift_retain();
      swift_release();
      objc_msgSend(v29, sel_performBlockAndWait_, v28);

      _Block_release(v28);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((isEscapingClosureAtFileLocation & 1) != 0)
        goto LABEL_20;
      if (qword_253D8E8A8 != -1)
        swift_once();
      __swift_project_value_buffer(v133, (uint64_t)qword_253D8E9F8);
      v32 = sub_2126EF470();
      v33 = sub_2126EF56C();
      v34 = os_log_type_enabled(v32, v33);
      v35 = i;
      if (v34)
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_2126D5000, v32, v33, "saving", v36, 2u);
        MEMORY[0x212BF0AB8](v36, -1, -1);
      }

      v37 = *(void **)(v35 + 32);
      if (!v37)
        goto LABEL_70;
      v38 = swift_allocObject();
      *(_QWORD *)(v38 + 16) = sub_2126E7F80;
      *(_QWORD *)(v38 + 24) = v35;
      v140 = sub_2126E8780;
      v141 = v38;
      aBlock = (id)MEMORY[0x24BDAC760];
      v137 = 1107296256;
      v138 = sub_2126DF884;
      v139 = &block_descriptor_58;
      v39 = _Block_copy(&aBlock);
      swift_retain();
      v40 = v37;
      swift_retain();
      v15 = i;
      swift_release();
      objc_msgSend(v40, sel_performBlockAndWait_, v39);

      _Block_release(v39);
      LOBYTE(v39) = swift_isEscapingClosureAtFileLocation();

      swift_release();
      swift_release();
      swift_release();
      if ((v39 & 1) != 0)
        goto LABEL_21;
      ++v22;
      v21 = v20;
      v41 = v134 == v20;
      v20 = (unint64_t)v131;
      if (v41)
        goto LABEL_23;
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    v21 = sub_2126EF65C();
  }
LABEL_23:

  swift_bridgeObjectRelease();
  sub_2126E1950((uint64_t)v111[0]);
  v42 = LiveLookupStore.fetchExtensions(_:)(0);
  if (v42 >> 62)
    goto LABEL_68;
  v44 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v45 = v133;
    v46 = v128;
    if (!v44)
      break;
    v134 = v42 & 0xC000000000000001;
    v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v48 = 4;
    v114 = *MEMORY[0x24BDCD7A0];
    *(_QWORD *)&v43 = 136315138;
    v112 = v43;
    v111[1] = (id)(MEMORY[0x24BEE4AD8] + 8);
    v113 = 0x80000002126F2220;
    v115 = v42;
    v122 = v44;
    while (1)
    {
      v49 = v134 ? (id)MEMORY[0x212BF03F8](v48 - 4, v42) : *(id *)(v42 + 8 * v48);
      v50 = v49;
      v51 = v48 - 3;
      if (__OFADD__(v48 - 4, 1))
        break;
      if (objc_msgSend(v49, sel_shouldRemove)
        && (objc_msgSend(v50, sel_isInstalled) & 1) == 0)
      {
        v129 = v48 - 3;
        if (qword_253D8E8A8 != -1)
          swift_once();
        v52 = (void *)__swift_project_value_buffer(v45, (uint64_t)qword_253D8E9F8);
        v53 = *(void (**)(char *))(v46 + 16);
        v54 = v127;
        v130 = v52;
        v53(v127);
        v55 = v50;
        v56 = sub_2126EF470();
        v57 = sub_2126EF56C();
        v58 = os_log_type_enabled(v56, v57);
        v131 = v47;
        v132 = (unint64_t)v55;
        if (v58)
        {
          v59 = swift_slowAlloc();
          v60 = swift_slowAlloc();
          v142[0] = v60;
          *(_DWORD *)v59 = v112;
          v61 = objc_msgSend(v55, sel_identifier);
          if (v61)
          {
            v62 = v61;
            v63 = (void *)sub_2126EF4AC();
            v65 = v64;

            aBlock = v63;
            v137 = v65;
            v55 = (id)v132;
            v45 = v133;
            v66 = sub_2126EF4B8();
            v68 = v67;
          }
          else
          {
            v68 = 0xE300000000000000;
            v66 = 7104878;
          }
          *(_QWORD *)(v59 + 4) = sub_2126E6BB4(v66, v68, v142);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2126D5000, v56, v57, "removing %s", (uint8_t *)v59, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x212BF0AB8](v60, -1, -1);
          MEMORY[0x212BF0AB8](v59, -1, -1);

          (*(void (**)(char *, uint64_t))(v128 + 8))(v127, v45);
          v47 = v131;
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v46 + 8))(v54, v45);
        }
        v69 = objc_msgSend(v55, sel_identifier);
        if (v69)
        {
          v70 = v69;
          v124 = (void *)sub_2126EF4AC();
          v123 = v71;

          v72 = v117;
          v73 = v126;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v117 + 56))(v118, 1, 1, v126);
          v74 = v120;
          v75 = *(void (**)(char *, uint64_t, uint64_t))(v120 + 104);
          v76 = v119;
          v77 = v114;
          v78 = v121;
          v75(v119, v114, v121);
          v79 = v116;
          sub_2126EF368();
          aBlock = v124;
          v137 = v123;
          v75(v76, v77, v78);
          sub_2126E81E8();
          sub_2126EF374();
          (*(void (**)(char *, uint64_t))(v74 + 8))(v76, v78);
          v80 = *(void (**)(char *, uint64_t))(v72 + 8);
          v80(v79, v73);
          swift_bridgeObjectRelease();
          v81 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
          v82 = (void *)sub_2126EF338();
          aBlock = 0;
          LODWORD(v75) = objc_msgSend(v81, sel_removeItemAtURL_error_, v82, &aBlock);

          if ((_DWORD)v75)
          {
            v83 = aBlock;
          }
          else
          {
            v84 = aBlock;
            v85 = (void *)sub_2126EF308();

            swift_willThrow();
          }
          v80(v125, v126);
          v42 = v115;
          v47 = v131;
          v55 = (id)v132;
        }
        v86 = objc_msgSend(v55, sel_identifier);
        if (v86)
        {
          v87 = v86;
          v88 = sub_2126EF4AC();
          v90 = v89;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v47 = sub_2126E6AA8(0, v47[2] + 1, 1, v47);
          v92 = v47[2];
          v91 = v47[3];
          if (v92 >= v91 >> 1)
            v47 = sub_2126E6AA8((_QWORD *)(v91 > 1), v92 + 1, 1, v47);
          v47[2] = v92 + 1;
          v93 = &v47[2 * v92];
          v93[4] = v88;
          v93[5] = v90;
          v55 = (id)v132;
        }
        v94 = i;
        v95 = *(void **)(i + 32);
        if (!v95)
          goto LABEL_71;
        v96 = swift_allocObject();
        *(_QWORD *)(v96 + 16) = v94;
        *(_QWORD *)(v96 + 24) = v55;
        v97 = swift_allocObject();
        *(_QWORD *)(v97 + 16) = sub_2126E7F1C;
        *(_QWORD *)(v97 + 24) = v96;
        v140 = sub_2126E8780;
        v141 = v97;
        aBlock = (id)MEMORY[0x24BDAC760];
        v137 = 1107296256;
        v138 = sub_2126DF884;
        v139 = &block_descriptor_69;
        v98 = v55;
        v99 = _Block_copy(&aBlock);
        swift_retain();
        v100 = v98;
        v101 = v95;
        swift_retain();
        swift_release();
        objc_msgSend(v101, sel_performBlockAndWait_, v99);

        _Block_release(v99);
        LOBYTE(v99) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if ((v99 & 1) != 0)
          goto LABEL_66;
        v102 = sub_2126EF470();
        v103 = sub_2126EF56C();
        if (os_log_type_enabled(v102, v103))
        {
          v104 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v104 = 0;
          _os_log_impl(&dword_2126D5000, v102, v103, "saving", v104, 2u);
          MEMORY[0x212BF0AB8](v104, -1, -1);
        }

        v105 = i;
        v106 = *(void **)(i + 32);
        if (!v106)
          goto LABEL_72;
        v107 = swift_allocObject();
        *(_QWORD *)(v107 + 16) = sub_2126E7F80;
        *(_QWORD *)(v107 + 24) = v105;
        v140 = sub_2126E8780;
        v141 = v107;
        aBlock = (id)MEMORY[0x24BDAC760];
        v137 = 1107296256;
        v138 = sub_2126DF884;
        v139 = &block_descriptor_77;
        v108 = _Block_copy(&aBlock);
        swift_retain();
        v109 = v106;
        swift_retain();
        swift_release();
        objc_msgSend(v109, sel_performBlockAndWait_, v108);

        _Block_release(v108);
        LOBYTE(v108) = swift_isEscapingClosureAtFileLocation();

        swift_release();
        swift_release();
        swift_release();
        v45 = v133;
        v46 = v128;
        v51 = v129;
        v44 = v122;
        if ((v108 & 1) != 0)
          goto LABEL_67;
      }
      else
      {
        if ((objc_msgSend(v50, sel_isInstalled) & 1) == 0)
        {
          objc_msgSend(v50, sel_setShouldRemove_, 1);
          objc_msgSend(v50, sel_setIsEnabled_, 0);
        }

      }
      ++v48;
      if (v51 == v44)
        goto LABEL_64;
    }
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    swift_bridgeObjectRetain();
    v44 = sub_2126EF65C();
    swift_bridgeObjectRelease();
  }
  v47 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_64:
  swift_bridgeObjectRelease();
  sub_2126DF8A4();

  return v47;
}

_QWORD *sub_2126E6AA8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B55638);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2126E8464(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2126E6BB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2126E6C84(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2126E8654((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2126E8654((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2126E6C84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2126EF5B4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2126E6E3C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2126EF5FC();
  if (!v8)
  {
    sub_2126EF644();
    __break(1u);
LABEL_17:
    result = sub_2126EF668();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2126E6E3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2126E6ED0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2126E70A8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2126E70A8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2126E6ED0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2126E7044(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2126EF5CC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2126EF644();
      __break(1u);
LABEL_10:
      v2 = sub_2126EF4C4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2126EF668();
    __break(1u);
LABEL_14:
    result = sub_2126EF644();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2126E7044(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E8C0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2126E70A8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E8C0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2126EF668();
  __break(1u);
  return result;
}

void sub_2126E71F4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2126EF65C();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x212BF0404);
}

uint64_t sub_2126E725C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2126E7294(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2126E7278(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2126E73FC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2126E7294(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B55638);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2126EF668();
  __break(1u);
  return result;
}

uint64_t sub_2126E73FC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B55630);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2126EF668();
  __break(1u);
  return result;
}

id sub_2126E7558(NSObject *a1, void *a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t ObjCClassFromMetadata;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  _QWORD *v61;
  id v62;
  void *v63;
  uint8_t *v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t);
  _QWORD v75[2];
  char *v76;
  void (*v77)(char *, uint64_t);
  NSObject *v78;
  id v79;
  char *v80;
  uint64_t aBlock[6];
  uint64_t v82;

  v78 = a1;
  v79 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E8A0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)v75 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2126EF380();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v77 = (void (*)(char *, uint64_t))((char *)v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v75 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v75 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v75 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v80 = (char *)v75 - v17;
  type metadata accessor for LiveLookupStore();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v20 = (void *)sub_2126EF4A0();
  v21 = (void *)sub_2126EF4A0();
  v22 = objc_msgSend(v19, sel_URLForResource_withExtension_, v20, v21);

  if (v22)
  {
    v76 = v10;
    sub_2126EF350();

    v23 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v23(v3, v16, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
    {
      v24 = v80;
      v23(v80, v3, v4);
      if (qword_253D8E8A8 != -1)
        swift_once();
      v25 = sub_2126EF488();
      v26 = __swift_project_value_buffer(v25, (uint64_t)qword_253D8E9F8);
      v27 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v27(v13, v24, v4);
      v75[1] = v26;
      v28 = sub_2126EF470();
      v29 = sub_2126EF56C();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        v31 = swift_slowAlloc();
        v75[0] = v27;
        v32 = v31;
        aBlock[0] = v31;
        *(_DWORD *)v30 = 136315138;
        v33 = sub_2126EF320();
        v82 = sub_2126E6BB4(v33, v34, aBlock);
        sub_2126EF5A8();
        swift_bridgeObjectRelease();
        v35 = *(void (**)(char *, uint64_t))(v5 + 8);
        v35(v13, v4);
        _os_log_impl(&dword_2126D5000, v28, v29, "modelURL: %s", v30, 0xCu);
        swift_arrayDestroy();
        v36 = v32;
        v27 = (void (*)(char *, char *, uint64_t))v75[0];
        MEMORY[0x212BF0AB8](v36, -1, -1);
        v37 = v30;
        v24 = v80;
        MEMORY[0x212BF0AB8](v37, -1, -1);
      }
      else
      {
        v35 = *(void (**)(char *, uint64_t))(v5 + 8);
        v35(v13, v4);
      }

      v43 = objc_allocWithZone(MEMORY[0x24BDBB6B0]);
      v44 = (void *)sub_2126EF338();
      v45 = objc_msgSend(v43, sel_initWithContentsOfURL_, v44);

      if (v45)
      {
        v77 = v35;
        v46 = objc_allocWithZone(MEMORY[0x24BDBB700]);
        v47 = v45;
        v48 = (void *)sub_2126EF4A0();
        v49 = objc_msgSend(v46, sel_initWithName_managedObjectModel_, v48, v47);

        sub_2126EF32C();
        v50 = objc_allocWithZone(MEMORY[0x24BDBB740]);
        v51 = (void *)sub_2126EF338();
        v52 = objc_msgSend(v50, sel_initWithURL_, v51);

        objc_msgSend(v52, sel_setShouldInferMappingModelAutomatically_, 1);
        objc_msgSend(v52, sel_setShouldMigrateStoreAutomatically_, 1);
        sub_2126EF4AC();
        v53 = (void *)sub_2126EF4A0();
        swift_bridgeObjectRelease();
        objc_msgSend(v52, sel_setOption_forKey_, v53, *MEMORY[0x24BDBB4F8]);

        __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E908);
        v54 = swift_allocObject();
        *(_OWORD *)(v54 + 16) = xmmword_2126F0B40;
        *(_QWORD *)(v54 + 32) = v52;
        aBlock[0] = v54;
        sub_2126EF500();
        sub_2126E86F4(0, &qword_253D8E8B8);
        v55 = v52;
        v56 = (void *)sub_2126EF4DC();
        swift_bridgeObjectRelease();
        objc_msgSend(v49, sel_setPersistentStoreDescriptions_, v56);

        aBlock[4] = (uint64_t)sub_2126DF4E0;
        aBlock[5] = 0;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_2126DF6BC;
        aBlock[3] = (uint64_t)&block_descriptor_129;
        v57 = _Block_copy(aBlock);
        objc_msgSend(v49, sel_loadPersistentStoresWithCompletionHandler_, v57);
        _Block_release(v57);
        v42 = v49;
        v58 = sub_2126EF470();
        v59 = sub_2126EF56C();
        if (os_log_type_enabled(v58, v59))
        {
          v79 = v55;
          v60 = (uint8_t *)swift_slowAlloc();
          v61 = (_QWORD *)swift_slowAlloc();
          v78 = v58;
          *(_DWORD *)v60 = 138412290;
          aBlock[0] = (uint64_t)v42;
          v62 = v42;
          v58 = v78;
          v63 = v79;
          sub_2126EF5A8();
          *v61 = v42;

          _os_log_impl(&dword_2126D5000, v58, v59, "Created persistent container: %@", v60, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
          swift_arrayDestroy();
          MEMORY[0x212BF0AB8](v61, -1, -1);
          v64 = v60;
          v24 = v80;
          MEMORY[0x212BF0AB8](v64, -1, -1);
        }
        else
        {

          v47 = v42;
          v63 = v42;
        }

        v73 = v77;
        v77(v76, v4);
        v73(v24, v4);
      }
      else
      {
        v65 = (char *)v77;
        v27((char *)v77, v24, v4);
        v66 = sub_2126EF470();
        v67 = sub_2126EF56C();
        if (os_log_type_enabled(v66, v67))
        {
          v68 = (uint8_t *)swift_slowAlloc();
          v69 = swift_slowAlloc();
          aBlock[0] = v69;
          *(_DWORD *)v68 = 136315138;
          sub_2126E80E0(&qword_254B55640, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
          v70 = sub_2126EF68C();
          v82 = sub_2126E6BB4(v70, v71, aBlock);
          sub_2126EF5A8();
          swift_bridgeObjectRelease();
          v35(v65, v4);
          _os_log_impl(&dword_2126D5000, v66, v67, "Failed to create model from file: %s", v68, 0xCu);
          swift_arrayDestroy();
          v72 = v69;
          v24 = v80;
          MEMORY[0x212BF0AB8](v72, -1, -1);
          MEMORY[0x212BF0AB8](v68, -1, -1);
        }
        else
        {
          v35(v65, v4);
        }

        v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB700]), sel_init);
        v35(v24, v4);
      }
      return v42;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  }
  sub_2126E8164((uint64_t)v3, &qword_253D8E8A0);
  if (qword_253D8E8A8 != -1)
    swift_once();
  v38 = sub_2126EF488();
  __swift_project_value_buffer(v38, (uint64_t)qword_253D8E9F8);
  v39 = sub_2126EF470();
  v40 = sub_2126EF56C();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v41 = 0;
    _os_log_impl(&dword_2126D5000, v39, v40, "find LiveLookupStore model file", v41, 2u);
    MEMORY[0x212BF0AB8](v41, -1, -1);
  }

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB700]), sel_init);
}

uint64_t sub_2126E7F20()
{
  return swift_deallocObject();
}

uint64_t sub_2126E7F30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_2126E7F80()
{
  uint64_t v0;

  sub_2126DFA78(v0);
}

uint64_t sub_2126E7F88()
{
  return swift_deallocObject();
}

uint64_t sub_2126E7F98()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2126E7FC4()
{
  uint64_t v0;

  return sub_2126E063C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_2126E7FD0()
{
  return swift_deallocObject();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BF0A10]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2126E8020()
{
  unint64_t result;

  result = qword_254B55608;
  if (!qword_254B55608)
  {
    result = MEMORY[0x212BF0A1C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254B55608);
  }
  return result;
}

uint64_t sub_2126E8068()
{
  return swift_deallocObject();
}

uint64_t sub_2126E8078()
{
  return swift_deallocObject();
}

unint64_t sub_2126E8088()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253D8E868;
  if (!qword_253D8E868)
  {
    v1 = sub_2126E86F4(255, &qword_253D8E860);
    result = MEMORY[0x212BF0A1C](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&qword_253D8E868);
  }
  return result;
}

uint64_t sub_2126E80E0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BF0A1C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2126E8120(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2126E8164(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2126E81A4()
{
  return swift_deallocObject();
}

uint64_t sub_2126E81B4()
{
  return swift_deallocObject();
}

uint64_t sub_2126E81C8()
{
  return swift_deallocObject();
}

uint64_t sub_2126E81D8()
{
  return swift_deallocObject();
}

unint64_t sub_2126E81E8()
{
  unint64_t result;

  result = qword_254B55620;
  if (!qword_254B55620)
  {
    result = MEMORY[0x212BF0A1C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254B55620);
  }
  return result;
}

unint64_t sub_2126E8230()
{
  unint64_t result;

  result = qword_254B55628;
  if (!qword_254B55628)
  {
    result = MEMORY[0x212BF0A1C](&protocol conformance descriptor for IdentityType, &type metadata for IdentityType);
    atomic_store(result, (unint64_t *)&qword_254B55628);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IdentityType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for IdentityType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2126E8360 + 4 * byte_2126F0B95[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2126E8394 + 4 * byte_2126F0B90[v4]))();
}

uint64_t sub_2126E8394(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2126E839C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2126E83A4);
  return result;
}

uint64_t sub_2126E83B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2126E83B8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2126E83BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2126E83C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2126E83D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2126E83DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IdentityType()
{
  return &type metadata for IdentityType;
}

uint64_t method lookup function for ExtensionUpdate()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ExtensionUpdate.__allocating_init(identifier:isAppStoreVendable:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t type metadata accessor for LiveLookupStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for LiveLookupStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LiveLookupStore.__allocating_init(storeLocation:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of LiveLookupStore.delete(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of LiveLookupStore.save()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of LiveLookupStore.fetch<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_2126E8464(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2126EF668();
  __break(1u);
  return result;
}

uint64_t sub_2126E8558()
{
  uint64_t *v0;

  return sub_2126E0404(v0[2], v0[3], v0[4], (void (*)(_QWORD))type metadata accessor for IdentityInfo);
}

uint64_t sub_2126E857C()
{
  return swift_deallocObject();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

id sub_2126E85BC()
{
  uint64_t v0;
  id result;

  result = *(id *)(*(_QWORD *)(v0 + 16) + 32);
  if (result)
    return objc_msgSend(result, sel_deleteObject_, *(_QWORD *)(v0 + 24));
  __break(1u);
  return result;
}

uint64_t sub_2126E85DC()
{
  return swift_deallocObject();
}

uint64_t sub_2126E85EC()
{
  return swift_deallocObject();
}

uint64_t sub_2126E8600()
{
  uint64_t *v0;

  return sub_2126E0404(v0[2], v0[3], v0[4], (void (*)(_QWORD))type metadata accessor for BlockingInfo);
}

uint64_t sub_2126E8624()
{
  return swift_deallocObject();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2126E8654(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t objectdestroy_79Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2126E86C0()
{
  uint64_t *v0;

  return sub_2126E0404(v0[2], v0[3], v0[4], (void (*)(_QWORD))type metadata accessor for LiveLookupDBExtension);
}

uint64_t sub_2126E86E4()
{
  return swift_deallocObject();
}

uint64_t sub_2126E86F4(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for ILMessageFilterSubAction()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254B55648[0])
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, qword_254B55648);
  }
}

uint64_t sub_2126E87F4()
{
  uint64_t v0;

  v0 = sub_2126EF488();
  __swift_allocate_value_buffer(v0, qword_253D8E9F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_253D8E9F8);
  return sub_2126EF47C();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t dispatch thunk of LiveCallerIDLookupProtocol.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

BOOL static CallLookupExtensionStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CallLookupExtensionStatus.hash(into:)()
{
  return sub_2126EF6B0();
}

uint64_t CallLookupExtensionStatus.hashValue.getter()
{
  sub_2126EF6A4();
  sub_2126EF6B0();
  return sub_2126EF6C8();
}

BOOL sub_2126E8938(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2126E8950()
{
  sub_2126EF6A4();
  sub_2126EF6B0();
  return sub_2126EF6C8();
}

uint64_t sub_2126E8994()
{
  return sub_2126EF6B0();
}

uint64_t sub_2126E89BC()
{
  sub_2126EF6A4();
  sub_2126EF6B0();
  return sub_2126EF6C8();
}

uint64_t static LiveCallerIDLookupManager.shared.getter()
{
  type metadata accessor for LiveCallerIDLookupManager();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for LiveCallerIDLookupManager()
{
  return objc_opt_self();
}

uint64_t sub_2126E8A38@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  dispatch_semaphore_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[6];

  v2 = swift_allocObject();
  *(_BYTE *)(v2 + 16) = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v5 = (void *)sub_2126EF4A0();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v3;
  *(_QWORD *)(v6 + 24) = v2;
  v10[4] = sub_2126E8E38;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_2126E8E40;
  v10[3] = &block_descriptor_0;
  v7 = _Block_copy(v10);
  v8 = v3;
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_getEnabledForExtensionWithIdentifier_completionHandler_, v5, v7);
  _Block_release(v7);

  sub_2126EF578();
  swift_beginAccess();
  *a1 = *(_BYTE *)(v2 + 16);
  return swift_release();
}

uint64_t sub_2126E8BAC()
{
  return swift_deallocObject();
}

uint64_t sub_2126E8BBC(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;

  if (qword_253D8E8A8 != -1)
    swift_once();
  v7 = sub_2126EF488();
  __swift_project_value_buffer(v7, (uint64_t)qword_253D8E9F8);
  v8 = a2;
  v9 = a2;
  v10 = sub_2126EF470();
  v11 = sub_2126EF56C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 67109378;
    sub_2126EF5A8();
    *(_WORD *)(v12 + 8) = 2112;
    if (a2)
    {
      v14 = a2;
      v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_2126EF5A8();
    }
    else
    {
      sub_2126EF5A8();
      v15 = 0;
    }
    *v13 = v15;

    _os_log_impl(&dword_2126D5000, v10, v11, "status = %{BOOL}d error = %@", (uint8_t *)v12, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E900);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v13, -1, -1);
    MEMORY[0x212BF0AB8](v12, -1, -1);

  }
  else
  {

  }
  swift_beginAccess();
  *(_BYTE *)(a4 + 16) = a1 & 1;
  return sub_2126EF584();
}

uint64_t sub_2126E8E0C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2126E8E38(char a1, void *a2)
{
  uint64_t v2;

  return sub_2126E8BBC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_2126E8E40(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_2126E8EB8()
{
  return swift_task_switch();
}

uint64_t sub_2126E8ECC()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_253D8E8A8 != -1)
    swift_once();
  v1 = sub_2126EF488();
  __swift_project_value_buffer(v1, (uint64_t)qword_253D8E9F8);
  v2 = sub_2126EF470();
  v3 = sub_2126EF56C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2126D5000, v2, v3, "openSettings", v4, 2u);
    MEMORY[0x212BF0AB8](v4, -1, -1);
  }

  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v0[15] = v5;
  v0[2] = v0;
  v0[3] = sub_2126E9030;
  v6 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v7 = v0 + 10;
  v7[1] = 0x40000000;
  v7[2] = sub_2126E9104;
  v7[3] = &block_descriptor_4;
  v7[4] = v6;
  objc_msgSend(v5, sel_openSettingsWithCompletionHandler_, v7);
  return swift_continuation_await();
}

uint64_t sub_2126E9030()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 128) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2126E9090()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2126E90C4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2126E9104(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B55698);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_2126E9178(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  return swift_task_switch();
}

uint64_t sub_2126E9190()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v0[17] = v1;
  v2 = sub_2126EF4A0();
  v0[18] = v2;
  v0[2] = v0;
  v0[3] = sub_2126E9264;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_2126E9104;
  v4[3] = &block_descriptor_6;
  v4[4] = v3;
  objc_msgSend(v1, sel_resetExtensionWithIdentier_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_2126E9264()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2126E92C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  return swift_task_switch();
}

uint64_t sub_2126E92DC()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v0[17] = v1;
  v2 = sub_2126EF4A0();
  v0[18] = v2;
  v0[2] = v0;
  v0[3] = sub_2126E93B0;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_2126E9104;
  v4[3] = &block_descriptor_8;
  v4[4] = v3;
  objc_msgSend(v1, sel_refreshPIRParametersForLiveLookupExtensionWithIdentifier_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_2126E93B0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2126E9410()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 144);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2126E9448()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 144);
  v2 = *(void **)(v0 + 136);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *sub_2126E9490()
{
  _QWORD *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *result;

  if (qword_253D8E8F8 != -1)
LABEL_13:
    swift_once();
  v0 = off_253D8E8F0;
  v1 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v2 = (void *)sub_2126EF4A0();
  v3 = objc_msgSend(v1, sel_initWithEntityName_, v2);

  sub_2126EA114();
  v4 = (void *)sub_2126EF554();
  objc_msgSend(v3, sel_setPredicate_, v4);

  v5 = v3;
  v6 = LiveLookupStore.fetchExtensions(_:)(v3);

  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_4;
LABEL_11:

    swift_bridgeObjectRelease();
    return (void *)v6;
  }
  swift_bridgeObjectRetain();
  v7 = sub_2126EF65C();
  if (!v7)
    goto LABEL_11;
LABEL_4:
  v8 = 4;
  while (1)
  {
    if ((v6 & 0xC000000000000001) != 0)
      v9 = (id)MEMORY[0x212BF03F8](v8 - 4, v6);
    else
      v9 = *(id *)(v6 + 8 * v8);
    v10 = v9;
    v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    result = (void *)v0[4];
    if (!result)
      break;
    objc_msgSend(result, sel_refreshObject_mergeChanges_, v10, 0);

    ++v8;
    if (v11 == v7)
      goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_2126E966C(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 168) = a2;
  *(_BYTE *)(v2 + 236) = a1;
  v3 = sub_2126EF488();
  *(_QWORD *)(v2 + 176) = v3;
  *(_QWORD *)(v2 + 184) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 192) = swift_task_alloc();
  *(_QWORD *)(v2 + 200) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2126E96E0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void (*v25)(uint64_t, uint64_t);
  void *v26;
  int v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD *v33;
  void *v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  void *v39;
  uint8_t *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;

  if (qword_253D8E8A8 != -1)
    swift_once();
  v1 = (void **)(v0 + 168);
  v2 = *(void **)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = __swift_project_value_buffer(v4, (uint64_t)qword_253D8E9F8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7(v3, v6, v4);
  v8 = v2;
  v9 = sub_2126EF470();
  v10 = sub_2126EF56C();
  if (os_log_type_enabled(v9, v10))
  {
    v60 = v6;
    v11 = *v1;
    v12 = swift_slowAlloc();
    v59 = swift_slowAlloc();
    v64 = v59;
    *(_DWORD *)v12 = 136315394;
    v13 = objc_msgSend(v11, sel_identifier);
    v62 = v7;
    if (v13)
    {
      v14 = v13;
      v15 = sub_2126EF4AC();
      v17 = v16;

      *(_QWORD *)(v0 + 136) = v15;
      *(_QWORD *)(v0 + 144) = v17;
      v18 = sub_2126EF4B8();
      v20 = v19;
    }
    else
    {
      v18 = 7104878;
      v20 = 0xE300000000000000;
    }
    v56 = *(_QWORD *)(v0 + 184);
    v26 = *(void **)(v0 + 168);
    v57 = *(_QWORD *)(v0 + 176);
    v58 = *(_QWORD *)(v0 + 200);
    v27 = *(unsigned __int8 *)(v0 + 236);
    *(_QWORD *)(v0 + 152) = sub_2126E6BB4(v18, v20, &v64);
    sub_2126EF5A8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 1024;
    *(_DWORD *)(v0 + 232) = v27;
    sub_2126EF5A8();
    _os_log_impl(&dword_2126D5000, v9, v10, "setting extension %s enabled=%{BOOL}d", (uint8_t *)v12, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x212BF0AB8](v59, -1, -1);
    MEMORY[0x212BF0AB8](v12, -1, -1);

    v25 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
    v25(v58, v57);
    v6 = v60;
    v7 = v62;
  }
  else
  {
    v21 = *(_QWORD *)(v0 + 200);
    v22 = *(_QWORD *)(v0 + 176);
    v23 = *(_QWORD *)(v0 + 184);
    v24 = *(void **)(v0 + 168);

    v25 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v25(v21, v22);
  }
  v28 = objc_msgSend(*(id *)(v0 + 168), sel_identifier);
  *(_QWORD *)(v0 + 208) = v28;
  if (v28)
  {
    v29 = v28;
    v30 = *(unsigned __int8 *)(v0 + 236);
    v31 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    *(_QWORD *)(v0 + 216) = v31;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_2126E9C00;
    v32 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v33 = (_QWORD *)(v0 + 80);
    v33[1] = 0x40000000;
    v33[2] = sub_2126E9104;
    v33[3] = &block_descriptor_10_0;
    v33[4] = v32;
    objc_msgSend(v31, sel_setEnabled_forExtensionWithIdentifier_completionHandler_, v30, v29, v33);
    return swift_continuation_await();
  }
  else
  {
    v35 = *(void **)(v0 + 168);
    v7(*(_QWORD *)(v0 + 192), v6, *(_QWORD *)(v0 + 176));
    v36 = v35;
    v37 = sub_2126EF470();
    v38 = sub_2126EF560();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = *v1;
      v40 = (uint8_t *)swift_slowAlloc();
      v63 = swift_slowAlloc();
      v64 = v63;
      *(_DWORD *)v40 = 136315138;
      v41 = objc_msgSend(v39, sel_identifier);
      if (v41)
      {
        v42 = v41;
        v43 = sub_2126EF4AC();
        v45 = v44;

        *(_QWORD *)(v0 + 120) = v43;
        *(_QWORD *)(v0 + 128) = v45;
        v46 = sub_2126EF4B8();
        v48 = v47;
      }
      else
      {
        v46 = 7104878;
        v48 = 0xE300000000000000;
      }
      v61 = *(_QWORD *)(v0 + 192);
      v54 = *(void **)(v0 + 168);
      v55 = *(_QWORD *)(v0 + 176);
      *(_QWORD *)(v0 + 160) = sub_2126E6BB4(v46, v48, &v64);
      sub_2126EF5A8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2126D5000, v37, v38, "extension %s has null identifier", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BF0AB8](v63, -1, -1);
      MEMORY[0x212BF0AB8](v40, -1, -1);

      v52 = v61;
      v53 = v55;
    }
    else
    {
      v49 = *(_QWORD *)(v0 + 192);
      v51 = *(void **)(v0 + 168);
      v50 = *(_QWORD *)(v0 + 176);

      v52 = v49;
      v53 = v50;
    }
    v25(v52, v53);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2126E9C00()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 224) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2126E9C60()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 208);
  v2 = *(void **)(v0 + 168);
  v3 = *(unsigned __int8 *)(v0 + 236);

  objc_msgSend(v2, sel_setIsEnabled_, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2126E9CCC()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 216);
  v2 = *(void **)(v0 + 208);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2126E9D30(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  char v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  unint64_t v36;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return;
  if (qword_253D8E8F8 != -1)
    goto LABEL_14;
  while (1)
  {
    v3 = off_253D8E8F0;
    v4 = objc_allocWithZone(MEMORY[0x24BDBB678]);
    v5 = (void *)sub_2126EF4A0();
    v6 = objc_msgSend(v4, sel_initWithEntityName_, v5);

    sub_2126EA114();
    v7 = (void *)sub_2126EF554();
    objc_msgSend(v6, sel_setPredicate_, v7);

    v8 = v6;
    v9 = LiveLookupStore.fetchExtensions(_:)(v6);

    v36 = v9;
    if (v9 >> 62)
      break;
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v10)
      goto LABEL_16;
LABEL_5:
    v11 = v1;
    v35 = v9 & 0xC000000000000001;
    v12 = 4;
    while (1)
    {
      v13 = v35 ? (id)MEMORY[0x212BF03F8](v12 - 4, v9) : *(id *)(v9 + 8 * v12);
      v14 = v13;
      v1 = v12 - 3;
      if (__OFADD__(v12 - 4, 1))
        break;
      v15 = (void *)v3[4];
      if (!v15)
        goto LABEL_42;
      objc_msgSend(v15, sel_refreshObject_mergeChanges_, v14, 0);

      ++v12;
      if (v1 == v10)
      {

        swift_bridgeObjectRelease();
        v1 = v11;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_14:
    swift_once();
  }
  swift_bridgeObjectRetain();
  v10 = sub_2126EF65C();
  if (v10)
    goto LABEL_5;
LABEL_16:

  swift_bridgeObjectRelease();
  v35 = v9 & 0xC000000000000001;
LABEL_17:
  v33 = a1 + 32;
  swift_bridgeObjectRetain();
  v16 = 0;
  v34 = 1;
  v32 = v1;
  while (1)
  {
    if (v16 == v1)
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return;
    }
    if (v10)
      break;
LABEL_19:
    if (++v16 == v1)
      goto LABEL_38;
  }
  v17 = (uint64_t *)(v33 + 16 * v16);
  v19 = *v17;
  v18 = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = 4;
  while (2)
  {
    if (v35)
      v21 = (id)MEMORY[0x212BF03F8](v20 - 4, v9);
    else
      v21 = *(id *)(v9 + 8 * v20);
    v22 = v21;
    v23 = v20 - 3;
    if (__OFADD__(v20 - 4, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    v24 = objc_msgSend(v21, sel_identifier);
    if (!v24)
    {
LABEL_23:

      ++v20;
      v29 = v23 == v10;
      v9 = v36;
      if (v29)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v1 = v32;
        goto LABEL_19;
      }
      continue;
    }
    break;
  }
  v25 = v24;
  v26 = sub_2126EF4AC();
  v28 = v27;

  v29 = v26 == v19 && v28 == v18;
  if (!v29)
  {
    v30 = sub_2126EF698();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
    {
      v9 = v36;
      goto LABEL_36;
    }
    goto LABEL_23;
  }
  v9 = v36;
  swift_bridgeObjectRelease();
LABEL_36:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = v34;
  objc_msgSend(v22, sel_setPriority_, v34);

  ++v34;
  v1 = v32;
  if (v31 + 1 == (__int16)(v31 + 1))
    goto LABEL_19;
  __break(1u);
LABEL_38:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2126DF8A4();
}

uint64_t LiveCallerIDLookupManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LiveCallerIDLookupManager.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_2126EA114()
{
  unint64_t result;

  result = qword_253D8E988;
  if (!qword_253D8E988)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253D8E988);
  }
  return result;
}

unint64_t sub_2126EA154()
{
  unint64_t result;

  result = qword_254B55670;
  if (!qword_254B55670)
  {
    result = MEMORY[0x212BF0A1C](&protocol conformance descriptor for CallLookupExtensionStatus, &type metadata for CallLookupExtensionStatus);
    atomic_store(result, (unint64_t *)&qword_254B55670);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CallLookupExtensionStatus(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CallLookupExtensionStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2126EA274 + 4 * byte_2126F0D25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2126EA2A8 + 4 * byte_2126F0D20[v4]))();
}

uint64_t sub_2126EA2A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2126EA2B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2126EA2B8);
  return result;
}

uint64_t sub_2126EA2C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2126EA2CCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2126EA2D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2126EA2D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2126EA2E4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CallLookupExtensionStatus()
{
  return &type metadata for CallLookupExtensionStatus;
}

uint64_t method lookup function for LiveCallerIDLookupManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.status(forExtensionWithIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 80))();
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.openSettings()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 88) + *(_QWORD *)(*(_QWORD *)v0 + 88));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_2126EA370;
  return v4();
}

uint64_t sub_2126EA370()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.reset(forExtensionWithIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 96) + *(_QWORD *)(*(_QWORD *)v2 + 96));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_2126EA528;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.refreshPIRParameters(forExtensionWithIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 104) + *(_QWORD *)(*(_QWORD *)v2 + 104));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_2126EA528;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.installedExtensions()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.set(enabled:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 120) + *(_QWORD *)(*(_QWORD *)v2 + 120));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_2126EA528;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.set(prioritizedExtensionIdentifiers:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

id BlockingInfo.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id BlockingInfo.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for BlockingInfo();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for BlockingInfo()
{
  return objc_opt_self();
}

id BlockingInfo.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlockingInfo();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id IdentityInfo.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id IdentityInfo.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for IdentityInfo();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for IdentityInfo()
{
  return objc_opt_self();
}

id IdentityInfo.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityInfo();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id LiveLookupDBExtension.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id LiveLookupDBExtension.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for LiveLookupDBExtension();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for LiveLookupDBExtension()
{
  return objc_opt_self();
}

id LiveLookupDBExtension.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveLookupDBExtension();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LiveCallerIDLookupExtensionContext.serviceURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2126EF380();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t LiveCallerIDLookupExtensionContext.tokenIssuerURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for LiveCallerIDLookupExtensionContext() + 20);
  v4 = sub_2126EF380();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for LiveCallerIDLookupExtensionContext()
{
  uint64_t result;

  result = qword_254B556E8;
  if (!qword_254B556E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LiveCallerIDLookupExtensionContext.userTierToken.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for LiveCallerIDLookupExtensionContext() + 24);
  v2 = *(_QWORD *)v1;
  sub_2126EAA30(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_2126EAA30(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t LiveCallerIDLookupExtensionContext.init(serviceURL:tokenIssuerURL:userTierToken:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;

  v10 = sub_2126EF380();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(a5, a1, v10);
  v12 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(a5 + *(int *)(v12 + 20), a2, v10);
  v14 = (_QWORD *)(a5 + *(int *)(v12 + 24));
  *v14 = a3;
  v14[1] = a4;
  return result;
}

uint64_t LiveCallerIDLookupExtensionContext.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;

  sub_2126EF380();
  sub_2126E80E0(&qword_254B556A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_2126EF494();
  v1 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  sub_2126EF494();
  v2 = (uint64_t *)(v0 + *(int *)(v1 + 24));
  v3 = *v2;
  v4 = v2[1];
  sub_2126EAA30(*v2, v4);
  sub_2126EF3A4();
  return sub_2126EABC8(v3, v4);
}

uint64_t sub_2126EABC8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

void static LiveCallerIDLookupExtensionContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((MEMORY[0x212BF0158]() & 1) != 0)
  {
    v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
    if ((MEMORY[0x212BF0158](a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20)) & 1) != 0)
      sub_2126EBB34(*(_QWORD *)(a1 + *(int *)(v4 + 24)), *(_QWORD *)(a1 + *(int *)(v4 + 24) + 8));
  }
}

uint64_t sub_2126EAC84(char a1)
{
  return *(_QWORD *)&aServiceutokeni[8 * a1];
}

uint64_t sub_2126EACA4()
{
  char *v0;

  return sub_2126EAC84(*v0);
}

uint64_t sub_2126EACAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2126EC4AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2126EACD0()
{
  return 0;
}

void sub_2126EACDC(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2126EACE8()
{
  sub_2126EBCA0();
  return sub_2126EF6EC();
}

uint64_t sub_2126EAD10()
{
  sub_2126EBCA0();
  return sub_2126EF6F8();
}

uint64_t LiveCallerIDLookupExtensionContext.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v11;
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B556A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2126EBCA0();
  sub_2126EF6E0();
  LOBYTE(v11) = 0;
  sub_2126EF380();
  sub_2126E80E0(&qword_254B556B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
  sub_2126EF680();
  if (!v2)
  {
    v9 = type metadata accessor for LiveCallerIDLookupExtensionContext();
    LOBYTE(v11) = 1;
    sub_2126EF680();
    v11 = *(_OWORD *)(v3 + *(int *)(v9 + 24));
    v12 = 2;
    sub_2126EBCE4();
    sub_2126EF680();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t LiveCallerIDLookupExtensionContext.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;

  sub_2126EF6A4();
  sub_2126EF380();
  sub_2126E80E0(&qword_254B556A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_2126EF494();
  v1 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  sub_2126EF494();
  v2 = (uint64_t *)(v0 + *(int *)(v1 + 24));
  v3 = *v2;
  v4 = v2[1];
  sub_2126EAA30(*v2, v4);
  sub_2126EF3A4();
  sub_2126EABC8(v3, v4);
  return sub_2126EF6C8();
}

uint64_t LiveCallerIDLookupExtensionContext.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  __int128 v33;
  char v34;

  v26 = a2;
  v29 = sub_2126EF380();
  v27 = *(_QWORD *)(v29 - 8);
  v3 = MEMORY[0x24BDAC7A8](v29);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v28 = (char *)&v23 - v6;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B556C8);
  v7 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2126EBCA0();
  v31 = v9;
  v13 = (uint64_t)v32;
  sub_2126EF6D4();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v24 = v5;
  v25 = v7;
  v32 = a1;
  v23 = v10;
  v14 = v12;
  LOBYTE(v33) = 0;
  sub_2126E80E0(&qword_254B556D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  v15 = v28;
  v16 = v29;
  v17 = v30;
  sub_2126EF674();
  v18 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
  v19 = (uint64_t)v14;
  v18(v14, v15, v16);
  LOBYTE(v33) = 1;
  v20 = v24;
  sub_2126EF674();
  v21 = v23;
  v18((char *)(v19 + *(int *)(v23 + 20)), v20, v16);
  v34 = 2;
  sub_2126EBD28();
  sub_2126EF674();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v31, v17);
  *(_OWORD *)(v19 + *(int *)(v21 + 24)) = v33;
  sub_2126EBD6C(v19, v26);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
  return sub_2126EBDB0(v19);
}

uint64_t sub_2126EB300(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  sub_2126EF6A4();
  sub_2126EF380();
  sub_2126E80E0(&qword_254B556A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_2126EF494();
  sub_2126EF494();
  v3 = (uint64_t *)(v1 + *(int *)(a1 + 24));
  v4 = *v3;
  v5 = v3[1];
  sub_2126EAA30(*v3, v5);
  sub_2126EF3A4();
  sub_2126EABC8(v4, v5);
  return sub_2126EF6C8();
}

uint64_t sub_2126EB3D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  sub_2126EF380();
  sub_2126E80E0(&qword_254B556A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_2126EF494();
  sub_2126EF494();
  v4 = (uint64_t *)(v2 + *(int *)(a2 + 24));
  v5 = *v4;
  v6 = v4[1];
  sub_2126EAA30(*v4, v6);
  sub_2126EF3A4();
  return sub_2126EABC8(v5, v6);
}

uint64_t sub_2126EB48C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;

  sub_2126EF6A4();
  sub_2126EF380();
  sub_2126E80E0(&qword_254B556A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_2126EF494();
  sub_2126EF494();
  v4 = (uint64_t *)(v2 + *(int *)(a2 + 24));
  v5 = *v4;
  v6 = v4[1];
  sub_2126EAA30(*v4, v6);
  sub_2126EF3A4();
  sub_2126EABC8(v5, v6);
  return sub_2126EF6C8();
}

uint64_t sub_2126EB55C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return LiveCallerIDLookupExtensionContext.init(from:)(a1, a2);
}

uint64_t sub_2126EB570(_QWORD *a1)
{
  return LiveCallerIDLookupExtensionContext.encode(to:)(a1);
}

void sub_2126EB584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((MEMORY[0x212BF0158]() & 1) != 0
    && (MEMORY[0x212BF0158](a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20)) & 1) != 0)
  {
    sub_2126EBB34(*(_QWORD *)(a1 + *(int *)(a3 + 24)), *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8));
  }
}

void sub_2126EB5F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_2126EB654(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x2126EB838);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_2126EB85C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2126EB8B8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_2126EB5F4((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_2126EABC8(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_2126EBA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_2126EF2E4();
  v11 = result;
  if (result)
  {
    result = sub_2126EF2FC();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_2126EF2F0();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_2126EB5F4(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_2126EBB34(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_2126EBB78()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_2126EBBAC + dword_2126EBC6C[v0 >> 62]))();
}

uint64_t sub_2126EBBBC@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_2126EAA30(v2, v1);
      sub_2126EB85C(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2126EBCA0()
{
  unint64_t result;

  result = qword_254B556B0;
  if (!qword_254B556B0)
  {
    result = MEMORY[0x212BF0A1C](&unk_2126F1064, &type metadata for LiveCallerIDLookupExtensionContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B556B0);
  }
  return result;
}

unint64_t sub_2126EBCE4()
{
  unint64_t result;

  result = qword_254B556C0;
  if (!qword_254B556C0)
  {
    result = MEMORY[0x212BF0A1C](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254B556C0);
  }
  return result;
}

unint64_t sub_2126EBD28()
{
  unint64_t result;

  result = qword_254B556D8;
  if (!qword_254B556D8)
  {
    result = MEMORY[0x212BF0A1C](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254B556D8);
  }
  return result;
}

uint64_t sub_2126EBD6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2126EBDB0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2126EBDEC()
{
  return sub_2126E80E0(&qword_254B556E0, (uint64_t (*)(uint64_t))type metadata accessor for LiveCallerIDLookupExtensionContext, (uint64_t)&protocol conformance descriptor for LiveCallerIDLookupExtensionContext);
}

uint64_t *initializeBufferWithCopyOfBuffer for LiveCallerIDLookupExtensionContext(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2126EF380();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = *v11;
    v13 = v11[1];
    sub_2126EAA30(*v11, v13);
    *v10 = v12;
    v10[1] = v13;
  }
  return a1;
}

uint64_t destroy for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = sub_2126EF380();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  return sub_2126EABC8(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8));
}

uint64_t initializeWithCopy for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v6 = sub_2126EF380();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (uint64_t *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v11 = *v10;
  v12 = v10[1];
  sub_2126EAA30(*v10, v12);
  *v9 = v11;
  v9[1] = v12;
  return a1;
}

uint64_t assignWithCopy for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = sub_2126EF380();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (uint64_t *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v11 = *v10;
  v12 = v10[1];
  sub_2126EAA30(*v10, v12);
  v13 = *v9;
  v14 = v9[1];
  *v9 = v11;
  v9[1] = v12;
  sub_2126EABC8(v13, v14);
  return a1;
}

uint64_t initializeWithTake for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_2126EF380();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = sub_2126EF380();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = *(_QWORD *)(a1 + v8);
  v10 = *(_QWORD *)(a1 + v8 + 8);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  sub_2126EABC8(v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveCallerIDLookupExtensionContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2126EC170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v6 = sub_2126EF380();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
  if (((4 * (_DWORD)v9) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v9) & 0xC | (v9 >> 2));
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LiveCallerIDLookupExtensionContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2126EC20C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;

  result = sub_2126EF380();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  v10 = (_QWORD *)(a1 + *(int *)(a4 + 24));
  *v10 = 0;
  v10[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

uint64_t sub_2126EC294()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2126EF380();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LiveCallerIDLookupExtensionContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2126EC354 + 4 * byte_2126F0E85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2126EC388 + 4 * byte_2126F0E80[v4]))();
}

uint64_t sub_2126EC388(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2126EC390(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2126EC398);
  return result;
}

uint64_t sub_2126EC3A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2126EC3ACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2126EC3B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2126EC3B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LiveCallerIDLookupExtensionContext.CodingKeys()
{
  return &type metadata for LiveCallerIDLookupExtensionContext.CodingKeys;
}

unint64_t sub_2126EC3D8()
{
  unint64_t result;

  result = qword_254B556F8;
  if (!qword_254B556F8)
  {
    result = MEMORY[0x212BF0A1C](&unk_2126F103C, &type metadata for LiveCallerIDLookupExtensionContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B556F8);
  }
  return result;
}

unint64_t sub_2126EC420()
{
  unint64_t result;

  result = qword_254B55700;
  if (!qword_254B55700)
  {
    result = MEMORY[0x212BF0A1C](&unk_2126F0FAC, &type metadata for LiveCallerIDLookupExtensionContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B55700);
  }
  return result;
}

unint64_t sub_2126EC468()
{
  unint64_t result;

  result = qword_254B55708;
  if (!qword_254B55708)
  {
    result = MEMORY[0x212BF0A1C](&unk_2126F0FD4, &type metadata for LiveCallerIDLookupExtensionContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B55708);
  }
  return result;
}

uint64_t sub_2126EC4AC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x5565636976726573 && a2 == 0xEA00000000004C52;
  if (v3 || (sub_2126EF698() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7373496E656B6F74 && a2 == 0xEE004C5255726575 || (sub_2126EF698() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7265695472657375 && a2 == 0xED00006E656B6F54)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2126EF698();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.getter()
{
  return sub_2126EC6C8((SEL *)&selRef_transactionalSubActions);
}

unint64_t sub_2126EC634()
{
  unint64_t result;

  result = qword_254B55710;
  if (!qword_254B55710)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B55710);
  }
  return result;
}

void ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter(uint64_t a1)
{
  sub_2126EC864(a1, (SEL *)&selRef_setTransactionalSubActions_);
}

uint64_t (*ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.getter();
  return sub_2126EC6B0;
}

uint64_t sub_2126EC6B0(uint64_t *a1, char a2)
{
  return sub_2126EC9B4(a1, a2, (uint64_t (*)(uint64_t))ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter);
}

uint64_t ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.getter()
{
  return sub_2126EC6C8((SEL *)&selRef_promotionalSubActions);
}

uint64_t sub_2126EC6C8(SEL *a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v2 = objc_msgSend(v1, *a1);
  sub_2126EC634();
  v3 = sub_2126EF4E8();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v4 = sub_2126EF65C();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_13;
LABEL_3:
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_2126E7278(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = v13;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x212BF03F8](v6, v3);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_integerValue);

      v12 = *(_QWORD *)(v13 + 16);
      v11 = *(_QWORD *)(v13 + 24);
      if (v12 >= v11 >> 1)
        sub_2126E7278(v11 > 1, v12 + 1, 1);
      ++v6;
      *(_QWORD *)(v13 + 16) = v12 + 1;
      *(_QWORD *)(v13 + 8 * v12 + 32) = v10;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return v7;
  }
  __break(1u);
  return result;
}

void ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.setter(uint64_t a1)
{
  sub_2126EC864(a1, (SEL *)&selRef_setPromotionalSubActions_);
}

void sub_2126EC864(uint64_t a1, SEL *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    sub_2126EF620();
    v5 = 0;
    do
    {
      v6 = v5 + 1;
      sub_2126EF548();
      sub_2126EF608();
      sub_2126EF62C();
      sub_2126EF638();
      sub_2126EF614();
      v5 = v6;
    }
    while (v4 != v6);
  }
  swift_bridgeObjectRelease();
  sub_2126EC634();
  v7 = (id)sub_2126EF4DC();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, *a2, v7);

}

uint64_t (*ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.getter();
  return sub_2126EC9A8;
}

uint64_t sub_2126EC9A8(uint64_t *a1, char a2)
{
  return sub_2126EC9B4(a1, a2, (uint64_t (*)(uint64_t))ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.setter);
}

uint64_t sub_2126EC9B4(uint64_t *a1, char a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  if ((a2 & 1) == 0)
    return a3(*a1);
  v4 = swift_bridgeObjectRetain();
  a3(v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2126ECA08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2126ECA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter);
}

uint64_t sub_2126ECA3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2126ECA64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.setter);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6;

  v6 = swift_bridgeObjectRetain();
  return a5(v6);
}

id sub_2126ECB6C(void *a1)
{
  void *v1;
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  objc_super v12;

  sub_2126ECCFC();
  v3 = v1;
  v4 = sub_2126EF59C();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = sub_2126EF398();
    v8 = v7;

    v9 = (uint64_t *)&v3[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data];
    *v9 = v6;
    v9[1] = v8;

    v12.receiver = v3;
    v12.super_class = (Class)type metadata accessor for XPCWrapper();
    v10 = objc_msgSendSuper2(&v12, sel_init);

  }
  else
  {

    type metadata accessor for XPCWrapper();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

id sub_2126ECC98()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for XPCWrapper()
{
  return objc_opt_self();
}

unint64_t sub_2126ECCFC()
{
  unint64_t result;

  result = qword_254B55738;
  if (!qword_254B55738)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B55738);
  }
  return result;
}

unint64_t extensionPointName.getter()
{
  return 0xD000000000000015;
}

id LiveCallerIDLookupProtocol.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id result;

  v6 = type metadata accessor for _LiveLookupConfiguration(0, a1, a2, a3);
  result = sub_2126EDF1C(v4, v6, v7, v8);
  *a4 = result;
  return result;
}

uint64_t type metadata accessor for _LiveLookupConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _LiveLookupConfiguration);
}

void sub_2126ECDA0(void (*a1)(id))
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  objc_super v16;

  v3 = *MEMORY[0x24BEE4EA0] & *v1;
  v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(_QWORD))(*(_QWORD *)(v3 + 88) + 16))(*(_QWORD *)(v3 + 80));
  v7 = (objc_class *)type metadata accessor for XPCWrapper();
  v8 = objc_allocWithZone(v7);
  sub_2126EF2D8();
  swift_allocObject();
  v9 = (char *)v8;
  sub_2126EF2CC();
  sub_2126E80E0(&qword_254B55848, (uint64_t (*)(uint64_t))type metadata accessor for LiveCallerIDLookupExtensionContext, (uint64_t)&protocol conformance descriptor for LiveCallerIDLookupExtensionContext);
  v10 = sub_2126EF2C0();
  v12 = v11;
  swift_release();
  v13 = (uint64_t *)&v9[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data];
  *v13 = v10;
  v13[1] = v12;

  v16.receiver = v9;
  v16.super_class = v7;
  v14 = objc_msgSendSuper2(&v16, sel_init);
  sub_2126EBDB0((uint64_t)v6);
  a1(v14);

}

uint64_t sub_2126ECF54(void *a1, int a2, void *aBlock)
{
  void *v4;
  id v5;

  v4 = _Block_copy(aBlock);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = a1;
  sub_2126ECDA0((void (*)(id))sub_2126EE0DC);

  return swift_release();
}

uint64_t sub_2126ECFC0(void *a1)
{
  uint64_t v1;
  id v3;

  objc_msgSend(a1, sel_setExportedObject_, v1);
  v3 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_254B5AEC8);
  objc_msgSend(a1, sel_setExportedInterface_, v3);

  objc_msgSend(a1, sel_resume);
  return 1;
}

void sub_2126ED048()
{
  sub_2126EE08C();
}

id sub_2126ED064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for _LiveLookupConfiguration(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_2126ED0B0(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x60)]);
}

uint64_t sub_2126ED0DC(void *a1)
{
  sub_2126ECFC0(a1);
  return 1;
}

uint64_t static Host.context()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1[23] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E8A0);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v2 = sub_2126EF458();
  v1[26] = v2;
  v1[27] = *(_QWORD *)(v2 - 8);
  v1[28] = swift_task_alloc();
  v3 = sub_2126EF434();
  v1[29] = v3;
  v1[30] = *(_QWORD *)(v3 - 8);
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  v4 = sub_2126EF3F8();
  v1[33] = v4;
  v1[34] = *(_QWORD *)(v4 - 8);
  v1[35] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B557A8);
  v1[36] = swift_task_alloc();
  v5 = sub_2126EF464();
  v1[37] = v5;
  v1[38] = *(_QWORD *)(v5 - 8);
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v6 = sub_2126EF404();
  v1[41] = v6;
  v1[42] = *(_QWORD *)(v6 - 8);
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  v7 = sub_2126EF41C();
  v1[45] = v7;
  v1[46] = *(_QWORD *)(v7 - 8);
  v1[47] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2126ED2B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[43];
  v1 = v0[44];
  v3 = v0[41];
  v4 = v0[42];
  sub_2126EF3EC();
  sub_2126EF410();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_2126E80E0(&qword_254B557B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7820], MEMORY[0x24BDC7830]);
  sub_2126EF53C();
  sub_2126E80E0(&qword_254B557B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7808], MEMORY[0x24BDC7810]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[48] = v5;
  *v5 = v0;
  v5[1] = sub_2126ED3C4;
  return sub_2126EF530();
}

uint64_t sub_2126ED3C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 392) = v0;
  swift_task_dealloc();
  if (v0)
    (*(void (**)(_QWORD, _QWORD))(v2[34] + 8))(v2[35], v2[33]);
  return swift_task_switch();
}

uint64_t sub_2126ED438()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v1 = v0[21];
  if (!v1)
  {
    v3 = v0[37];
    v4 = v0[38];
    v5 = v0[36];
    (*(void (**)(_QWORD, _QWORD))(v0[34] + 8))(v0[35], v0[33]);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, 1, 1, v3);
LABEL_7:
    sub_2126EDF54(v0[36]);
    return sub_2126EF650();
  }
  (*(void (**)(_QWORD, _QWORD))(v0[34] + 8))(v0[35], v0[33]);
  if (*(_QWORD *)(v1 + 16))
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(v0[38] + 16))(v0[36], v1 + ((*(unsigned __int8 *)(v0[38] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[38] + 80)), v0[37]);
    v2 = 0;
  }
  else
  {
    v2 = 1;
  }
  v6 = v0[37];
  v7 = v0[38];
  v8 = v0[36];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v8, v2, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
    goto LABEL_7;
  v10 = v0[39];
  v11 = v0[40];
  v12 = v0[37];
  v13 = v0[38];
  v15 = v0[31];
  v14 = v0[32];
  v16 = v0[29];
  v17 = v0[30];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 32))(v11, v0[36], v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v10, v11, v12);
  sub_2126EF428();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v14, v16);
  v18 = (_QWORD *)swift_task_alloc();
  v0[50] = v18;
  *v18 = v0;
  v18[1] = sub_2126ED64C;
  return sub_2126EF440();
}

uint64_t sub_2126ED630()
{
  return swift_unexpectedError();
}

uint64_t sub_2126ED64C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 408) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2126ED6B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;

  v1 = v0[51];
  v2 = sub_2126EF44C();
  if (v1)
    return swift_unexpectedError();
  v4 = (void *)v2;
  v5 = v0[25];
  v6 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_254B5AEC8);
  objc_msgSend(v4, sel_setRemoteObjectInterface_, v6);

  objc_msgSend(v4, sel_resume);
  v0[2] = MEMORY[0x24BDAC760];
  v0[6] = nullsub_1;
  v0[7] = 0;
  v0[3] = 1107296256;
  v0[4] = sub_2126EDB50;
  v0[5] = &block_descriptor_1;
  v7 = _Block_copy(v0 + 2);
  v8 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_2126EF5C0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(qword_254B557C0);
  swift_dynamicCast();
  v9 = (void *)v0[22];
  sub_2126EF35C();
  v10 = sub_2126EF380();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  result = v12(v5, 1, v10);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v38 = v9;
    v13 = v0[24];
    sub_2126EF35C();
    result = v12(v13, 1, v10);
    if ((_DWORD)result != 1)
    {
      v37 = v0[47];
      v35 = v0[46];
      v36 = v0[45];
      v32 = v0[41];
      v33 = v0[44];
      v30 = v0[40];
      v31 = v0[42];
      v28 = v0[38];
      v29 = v0[37];
      v27 = v0[32];
      v25 = v0[30];
      v26 = v0[29];
      v14 = v0[27];
      v15 = v0[25];
      v23 = v0[26];
      v24 = v0[28];
      v16 = v0[24];
      v34 = v0[23];
      v17 = type metadata accessor for LiveCallerIDLookupExtensionContext();
      v18 = swift_allocBox();
      v20 = v19;
      v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
      v21(v19, v15, v10);
      v21(v20 + *(int *)(v17 + 20), v16, v10);
      *(_OWORD *)(v20 + *(int *)(v17 + 24)) = xmmword_2126F1100;
      v0[12] = sub_2126EDFAC;
      v0[13] = v18;
      v0[8] = MEMORY[0x24BDAC760];
      v0[9] = 1107296256;
      v0[10] = sub_2126EDE48;
      v0[11] = &block_descriptor_4_0;
      v22 = _Block_copy(v0 + 8);
      swift_retain();
      swift_release();
      objc_msgSend(v38, sel_contextWithReply_, v22);
      _Block_release(v22);

      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v24, v23);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v29);
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v36);
      swift_beginAccess();
      sub_2126EBD6C(v20, v34);
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return ((uint64_t (*)(void))v0[1])();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2126EDB34()
{
  return swift_unexpectedError();
}

void sub_2126EDB50(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2126EDBA0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8E8A0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - v6;
  result = swift_projectBox();
  if (a1)
  {
    v14 = result;
    sub_2126EF2B4();
    swift_allocObject();
    v9 = a1;
    sub_2126EF2A8();
    v11 = *(_QWORD *)&v9[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data];
    v10 = *(_QWORD *)&v9[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data + 8];
    sub_2126EAA30(v11, v10);
    sub_2126E80E0((unint64_t *)&unk_254B55850, (uint64_t (*)(uint64_t))type metadata accessor for LiveCallerIDLookupExtensionContext, (uint64_t)&protocol conformance descriptor for LiveCallerIDLookupExtensionContext);
    sub_2126EF29C();
    sub_2126EABC8(v11, v10);

    swift_release();
    v12 = v14;
    swift_beginAccess();
    return sub_2126EE0EC((uint64_t)v7, v12);
  }
  return result;
}

void sub_2126EDE48(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id sub_2126EDE9C(uint64_t a1)
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
  v5 = (objc_class *)type metadata accessor for _LiveLookupConfiguration(0, v3, v2[11], v4);
  v7.receiver = v1;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_init);
}

id sub_2126EDF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for _LiveLookupConfiguration(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_2126EDE9C(a1);
}

uint64_t sub_2126EDF54(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B557A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_2126EDFAC(void *a1)
{
  return sub_2126EDBA0(a1);
}

uint64_t sub_2126EDFB8()
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

ValueMetadata *type metadata accessor for Host()
{
  return &type metadata for Host;
}

void sub_2126EE038(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _LiveLookupConfiguration(255, *a1, a1[1], a4);
  JUMPOUT(0x212BF0A1CLL);
}

uint64_t sub_2126EE060(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x212BF0A1C](&unk_2126F11A0);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_2126EE08C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2126EE0B8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2126EE0DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_2126EE0EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212BF09D4](a1, v6, a5);
}

id static BlockingInfo.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2126EF4A0();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_2126EE1D0()
{
  return MEMORY[0x24BEE0948];
}

uint64_t sub_2126EE1DC@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_expiration);
  if (v3)
  {
    v4 = v3;
    sub_2126EF3C8();

    v5 = sub_2126EF3E0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_2126EF3E0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_2126EE260(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B55610);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2126EE50C(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_2126EF3E0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_2126EF3BC();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setExpiration_, v10);

}

void sub_2126EE33C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_handle);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2126EF4AC();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_2126EE3A0(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_2126EF4A0();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setHandle_);

}

uint64_t sub_2126EE3FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for BlockingInfo();
  result = sub_2126EF5D8();
  *a1 = result;
  return result;
}

char *keypath_get_selector_expiration()
{
  return sel_expiration;
}

char *keypath_get_selector_handle()
{
  return sel_handle;
}

char *keypath_get_selector_shouldBlock()
{
  return sel_shouldBlock;
}

id sub_2126EE470@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldBlock);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2126EE4A0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldBlock_, *a1);
}

char *keypath_get_selector_dbExtension()
{
  return sel_dbExtension;
}

id sub_2126EE4C0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_dbExtension);
  *a2 = result;
  return result;
}

id sub_2126EE4F8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDbExtension_, *a1);
}

uint64_t sub_2126EE50C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B55610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id static IdentityInfo.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2126EF4A0();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_2126EE5C0(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_2126EF4AC();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_2126EE620(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v7 = sub_2126EF4A0();
  else
    v7 = 0;
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

uint64_t sub_2126EE67C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for IdentityInfo();
  result = sub_2126EF5D8();
  *a1 = result;
  return result;
}

void sub_2126EE6C4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2126EE5C0(a1, (SEL *)&selRef_handle, a2);
}

void sub_2126EE6E0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2126EE620(a1, a2, a3, a4, (SEL *)&selRef_setHandle_);
}

char *keypath_get_selector_iconURL()
{
  return sel_iconURL;
}

void sub_2126EE708(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2126EE5C0(a1, (SEL *)&selRef_iconURL, a2);
}

void sub_2126EE724(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2126EE620(a1, a2, a3, a4, (SEL *)&selRef_setIconURL_);
}

char *keypath_get_selector_name()
{
  return sel_name;
}

void sub_2126EE74C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2126EE5C0(a1, (SEL *)&selRef_name, a2);
}

void sub_2126EE768(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2126EE620(a1, a2, a3, a4, (SEL *)&selRef_setName_);
}

char *keypath_get_selector_type()
{
  return sel_type;
}

id sub_2126EE790@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_type);
  *a2 = (_DWORD)result;
  return result;
}

id sub_2126EE7C0(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

id sub_2126EE7D4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_dbExtension);
  *a2 = result;
  return result;
}

id sub_2126EE80C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDbExtension_, *a1);
}

id static LiveLookupDBExtension.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2126EF4A0();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_2126EE888(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_identifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2126EF4AC();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_2126EE8EC(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_2126EF4A0();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setIdentifier_);

}

uint64_t sub_2126EE948@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for LiveLookupDBExtension();
  result = sub_2126EF5D8();
  *a1 = result;
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

char *keypath_get_selector_isAppStoreVendable()
{
  return sel_isAppStoreVendable;
}

id sub_2126EE9A8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isAppStoreVendable);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2126EE9D8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsAppStoreVendable_, *a1);
}

char *keypath_get_selector_isEnabled()
{
  return sel_isEnabled;
}

id sub_2126EE9F8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2126EEA28(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsEnabled_, *a1);
}

char *keypath_get_selector_isInstalled()
{
  return sel_isInstalled;
}

id sub_2126EEA48@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isInstalled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2126EEA78(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsInstalled_, *a1);
}

char *keypath_get_selector_priority()
{
  return sel_priority;
}

id sub_2126EEA98@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_priority);
  *a2 = (_WORD)result;
  return result;
}

id sub_2126EEAC8(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPriority_, *a1);
}

char *keypath_get_selector_shouldRemove()
{
  return sel_shouldRemove;
}

id sub_2126EEAE8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldRemove);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2126EEB18(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldRemove_, *a1);
}

char *keypath_get_selector_blockingInfo()
{
  return sel_blockingInfo;
}

id sub_2126EEB38@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_blockingInfo);
  *a2 = result;
  return result;
}

id sub_2126EEB70(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBlockingInfo_, *a1);
}

char *keypath_get_selector_identityInfo()
{
  return sel_identityInfo;
}

id sub_2126EEB90@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_identityInfo);
  *a2 = result;
  return result;
}

id sub_2126EEBC8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIdentityInfo_, *a1);
}

uint64_t sub_2126EF29C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2126EF2A8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2126EF2B4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2126EF2C0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2126EF2CC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2126EF2D8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2126EF2E4()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2126EF2F0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2126EF2FC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2126EF308()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2126EF314()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2126EF320()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2126EF32C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2126EF338()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2126EF344()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_2126EF350()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2126EF35C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2126EF368()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_2126EF374()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_2126EF380()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2126EF38C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2126EF398()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2126EF3A4()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_2126EF3B0()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2126EF3BC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2126EF3C8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2126EF3D4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2126EF3E0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2126EF3EC()
{
  return MEMORY[0x24BDC77F0]();
}

uint64_t sub_2126EF3F8()
{
  return MEMORY[0x24BDC7808]();
}

uint64_t sub_2126EF404()
{
  return MEMORY[0x24BDC7820]();
}

uint64_t sub_2126EF410()
{
  return MEMORY[0x24BDC7838]();
}

uint64_t sub_2126EF41C()
{
  return MEMORY[0x24BDC7840]();
}

uint64_t sub_2126EF428()
{
  return MEMORY[0x24BDC7858]();
}

uint64_t sub_2126EF434()
{
  return MEMORY[0x24BDC7870]();
}

uint64_t sub_2126EF440()
{
  return MEMORY[0x24BDC7880]();
}

uint64_t sub_2126EF44C()
{
  return MEMORY[0x24BDC7890]();
}

uint64_t sub_2126EF458()
{
  return MEMORY[0x24BDC78A8]();
}

uint64_t sub_2126EF464()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_2126EF470()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2126EF47C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2126EF488()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2126EF494()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2126EF4A0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2126EF4AC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2126EF4B8()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_2126EF4C4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2126EF4D0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2126EF4DC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2126EF4E8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2126EF4F4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2126EF500()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2126EF50C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2126EF518()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2126EF524()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2126EF530()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2126EF53C()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_2126EF548()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2126EF554()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_2126EF560()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2126EF56C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2126EF578()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_2126EF584()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_2126EF590()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_2126EF59C()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2126EF5A8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2126EF5B4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2126EF5C0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2126EF5CC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2126EF5D8()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_2126EF5E4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2126EF5F0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2126EF5FC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2126EF608()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2126EF614()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2126EF620()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2126EF62C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2126EF638()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2126EF644()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2126EF650()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2126EF65C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2126EF668()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2126EF674()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2126EF680()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2126EF68C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2126EF698()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2126EF6A4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2126EF6B0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2126EF6BC()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2126EF6C8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2126EF6D4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2126EF6E0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2126EF6EC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2126EF6F8()
{
  return MEMORY[0x24BEE4A10]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

