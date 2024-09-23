uint64_t XPCConnectable.remoteObjectProxy(retryCount:proxyHandler:)(uint64_t a1, void (*a2)(_BYTE *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  void (*v12)(_QWORD *__return_ptr, uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t);
  _BYTE v14[40];
  _QWORD v15[4];

  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = v5;
  v11[5] = a1;
  v11[6] = a2;
  v11[7] = a3;
  v12 = *(void (**)(_QWORD *__return_ptr, uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t))(a5 + 104);
  swift_unknownObjectRetain();
  swift_retain();
  v12(v15, sub_1DD30E6D0, v11, a4, a5);
  swift_release();
  sub_1DD30E6DC((uint64_t)v15, (uint64_t)v14);
  v14[32] = 0;
  a2(v14);
  sub_1DD30E718((uint64_t)v14);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
}

uint64_t sub_1DD30E6D0(void *a1)
{
  return sub_1DD30ECE4(a1, (uint64_t (*)(uint64_t, void (*)(_QWORD), uint64_t, uint64_t, uint64_t))XPCConnectable.remoteObjectProxy(retryCount:proxyHandler:));
}

uint64_t sub_1DD30E6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1DD30E718(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3AC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0D90F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)(uint64_t a1, void (*a2)(_QWORD *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  uint64_t (*v17)(void *);
  _QWORD *v18;
  _BYTE v19[32];

  v6 = v5;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = v6;
  v12[5] = a1;
  v12[6] = a2;
  v12[7] = a3;
  v17 = sub_1DD30ECD8;
  v18 = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1DD30ED08;
  v16[3] = &block_descriptor;
  v13 = _Block_copy(v16);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  v14 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v13);
  _Block_release(v13);
  sub_1DD34296C();
  swift_unknownObjectRelease();
  sub_1DD30E6DC((uint64_t)v19, (uint64_t)v16);
  LOBYTE(v17) = 0;
  a2(v16);
  sub_1DD30E718((uint64_t)v16);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
}

uint64_t sub_1DD30E8E4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, void (*)(_QWORD), uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  void (*v20)(_BYTE *, uint64_t, uint64_t);
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  char v41;
  id v43;
  _BYTE v44[12];
  int v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(_QWORD);
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, void (*)(_QWORD), uint64_t, uint64_t, uint64_t);
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  char v59;

  v51 = a8;
  v56 = a3;
  v13 = sub_1DD342090();
  v53 = *(_QWORD *)(v13 - 8);
  v54 = v13;
  MEMORY[0x1E0C80A78](v13);
  v52 = &v44[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_1DD3423D8();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = &v44[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = sub_1DD339108();
  v20 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16);
  v55 = v15;
  v20(v18, v19, v15);
  swift_unknownObjectRetain();
  v21 = a1;
  swift_unknownObjectRetain();
  v22 = a1;
  v23 = sub_1DD3423C0();
  v24 = sub_1DD3428AC();
  v25 = v24;
  v26 = os_log_type_enabled(v23, v24);
  v49 = a6;
  v50 = a7;
  if (v26)
  {
    v27 = swift_slowAlloc();
    v47 = a5;
    v28 = v27;
    v46 = swift_slowAlloc();
    v57 = v46;
    *(_DWORD *)v28 = 136446722;
    v48 = a4;
    v29 = *(uint64_t (**)(uint64_t, uint64_t))(a7 + 8);
    v45 = v25;
    v58[0] = v29(a6, a7);
    v58[1] = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B30);
    v31 = sub_1DD3427A4();
    v58[0] = sub_1DD30EE20(v31, v32, &v57);
    sub_1DD342954();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2082;
    swift_getErrorValue();
    v33 = sub_1DD342B7C();
    v58[0] = sub_1DD30EE20(v33, v34, &v57);
    a4 = v48;
    sub_1DD342954();
    swift_bridgeObjectRelease();

    *(_WORD *)(v28 + 22) = 2048;
    v35 = v56;
    v58[0] = v56;
    sub_1DD342954();
    _os_log_impl(&dword_1DD30C000, v23, (os_log_type_t)v45, "Connection error from %{public}s: %{public}s\n Attempts remaining: %lu", (uint8_t *)v28, 0x20u);
    v36 = v46;
    swift_arrayDestroy();
    MEMORY[0x1DF0D91B0](v36, -1, -1);
    v37 = v28;
    a5 = v47;
    MEMORY[0x1DF0D91B0](v37, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v18, v55);
    v38 = v35;
    if (!v35)
      goto LABEL_7;
  }
  else
  {
    swift_unknownObjectRelease_n();

    (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v18, v55);
    v38 = v56;
    if (!v56)
      goto LABEL_7;
  }
  v39 = v52;
  sub_1DD342084();
  sub_1DD30EDD8();
  v40 = v54;
  v41 = sub_1DD342144();
  (*(void (**)(_BYTE *, uint64_t))(v53 + 8))(v39, v40);
  if ((v41 & 1) != 0)
    return v51(v38 - 1, a4, a5, v49, v50);
LABEL_7:
  v58[0] = a1;
  v59 = 1;
  v43 = a1;
  a4(v58);
  return sub_1DD30E718((uint64_t)v58);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD30ECD8(void *a1)
{
  return sub_1DD30ECE4(a1, (uint64_t (*)(uint64_t, void (*)(_QWORD), uint64_t, uint64_t, uint64_t))XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:));
}

uint64_t sub_1DD30ECE4(void *a1, uint64_t (*a2)(uint64_t, void (*)(_QWORD), uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;

  return sub_1DD30E8E4(a1, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(void (**)(_QWORD))(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

void sub_1DD30ED08(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

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

uint64_t dispatch thunk of XPCConnectable.serviceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of XPCConnectable.exportedObject.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of XPCConnectable.exportedObject.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of XPCConnectable.exportedObject.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of XPCConnectable.exportedInterface.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of XPCConnectable.exportedInterface.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of XPCConnectable.exportedInterface.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of XPCConnectable.remoteObjectInterface.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of XPCConnectable.remoteObjectInterface.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of XPCConnectable.remoteObjectInterface.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of XPCConnectable.resume()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of XPCConnectable.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of XPCConnectable.remoteObjectProxyWithErrorHandler(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

unint64_t sub_1DD30EDD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03D3B28;
  if (!qword_1F03D3B28)
  {
    v1 = sub_1DD342090();
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CADE18], v1);
    atomic_store(result, (unint64_t *)&qword_1F03D3B28);
  }
  return result;
}

uint64_t sub_1DD30EE20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1DD30EEF0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1DD30E6DC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1DD30E6DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1DD30EEF0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1DD342960();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1DD30F0A8(a5, a6);
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
  v8 = sub_1DD342A08();
  if (!v8)
  {
    sub_1DD342A20();
    __break(1u);
LABEL_17:
    result = sub_1DD342A68();
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

uint64_t sub_1DD30F0A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1DD30F13C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1DD30F314(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1DD30F314(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DD30F13C(uint64_t a1, unint64_t a2)
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
      v3 = sub_1DD30F2B0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1DD3429D8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1DD342A20();
      __break(1u);
LABEL_10:
      v2 = sub_1DD3427C8();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1DD342A68();
    __break(1u);
LABEL_14:
    result = sub_1DD342A20();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1DD30F2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B38);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1DD30F314(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B38);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1DD342A68();
  __break(1u);
  return result;
}

void *sub_1DD30F474()
{
  return &unk_1EA71B2B0;
}

unint64_t sub_1DD30F480()
{
  return 0xD000000000000030;
}

uint64_t sub_1DD30F49C()
{
  return 0;
}

uint64_t sub_1DD30F4A8()
{
  return sub_1DD30F528(&OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback, (void (*)(_QWORD, _QWORD))sub_1DD310C78);
}

uint64_t sub_1DD30F4BC(uint64_t a1, uint64_t a2)
{
  return sub_1DD30F5AC(a1, a2, &OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1DD310C7C);
}

uint64_t (*sub_1DD30F4D0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD30F514()
{
  return sub_1DD30F528(&OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback, (void (*)(_QWORD, _QWORD))sub_1DD30F588);
}

uint64_t sub_1DD30F528(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_1DD30F588(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1DD30F598(uint64_t a1, uint64_t a2)
{
  return sub_1DD30F5AC(a1, a2, &OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1DD30F608);
}

uint64_t sub_1DD30F5AC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_1DD30F608(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*sub_1DD30F618())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1DD30F660(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD aBlock[7];

  v4 = (id)sub_1DD310548();
  v5 = (void *)sub_1DD342810();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  aBlock[4] = sub_1DD310820;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD30F7B0;
  aBlock[3] = &block_descriptor_0;
  v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_instantiateViewControllerWithInputItems_connectionHandler_, v5, v7);

  _Block_release(v7);
}

uint64_t sub_1DD30F79C()
{
  return sub_1DD310548();
}

uint64_t sub_1DD30F7B0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (*v7)(uint64_t, void *, void *);
  id v8;
  id v9;

  v7 = *(void (**)(uint64_t, void *, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v8 = a3;
  v9 = a4;
  v7(a2, a3, a4);
  swift_release();

  return swift_unknownObjectRelease();
}

unint64_t sub_1DD30F838(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3BA0);
  v2 = sub_1DD342A5C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1DD310C30(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1DD310404(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1DD310BDC(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1DD30F960(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B98);
    v2 = sub_1DD342A5C();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_1DD30E6DC(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1DD310BDC(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_1DD310BDC(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_1DD310BDC(v36, v37);
    sub_1DD310BDC(v37, &v33);
    result = sub_1DD34299C();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_1DD310BDC(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1DD310C28();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_1DD30FD24()
{
  return sub_1DD30FD48(&protocolRef__TtP14FamilyControls30ActivityPickerServiceInterface_);
}

id sub_1DD30FD3C()
{
  return sub_1DD30FD48(&protocolRef__TtP14FamilyControls29ActivityPickerClientInterface_);
}

id sub_1DD30FD48(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, *a1);
}

id sub_1DD30FD90(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, *a3);
}

id sub_1DD30FDD0(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1DD34278C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id sub_1DD30FE44(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v5;
  char *v6;
  void *v7;
  id v8;
  objc_super v10;

  v5 = &v3[OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v3[OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  if (a2)
  {
    v7 = (void *)sub_1DD34278C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for ActivityPickerRemoteViewController();
  v8 = objc_msgSendSuper2(&v10, sel_initWithNibName_bundle_, v7, a3);

  return v8;
}

id sub_1DD30FFBC(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_1DD30FFFC(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  objc_class *v5;
  id v6;
  objc_super v8;

  v3 = &v1[OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v1[OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback];
  v5 = (objc_class *)type metadata accessor for ActivityPickerRemoteViewController();
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v8.receiver = v1;
  v8.super_class = v5;
  v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

id sub_1DD3100DC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityPickerRemoteViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void (*sub_1DD31014C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  _QWORD *v6;
  void (*result)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  result = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v6) + 0x60))();
  if (result)
  {
    v14 = (uint64_t)result;
    result(a1, a2, a3, a4, a5, a6);
    return (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1DD30F608(v14);
  }
  return result;
}

void (*sub_1DD310344())(void)
{
  _QWORD *v0;
  void (*result)(void);
  uint64_t v2;

  result = (void (*)(void))(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
  if (result)
  {
    v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1DD30F608(v2);
  }
  return result;
}

unint64_t sub_1DD310404(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1DD342BB8();
  sub_1DD3427B0();
  v4 = sub_1DD342BD0();
  return sub_1DD310468(a1, a2, v4);
}

unint64_t sub_1DD310468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1DD342B34() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1DD342B34() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1DD310548()
{
  uint64_t inited;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B80);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DD3432F0;
  *(_QWORD *)(inited + 32) = sub_1DD342798();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = 0xD000000000000030;
  *(_QWORD *)(inited + 56) = 0x80000001DD3472D0;
  v2 = sub_1DD30F838(inited);
  v3 = (void *)objc_opt_self();
  sub_1DD30F960(v2);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1DD34275C();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v17[0] = 0;
  v5 = objc_msgSend(v3, sel_extensionsWithMatchingAttributes_error_, v4, v17);

  v6 = *(void **)&v17[0];
  if (!v5)
  {
    v9 = *(id *)&v17[0];
    v7 = sub_1DD3421EC();

    swift_willThrow();
    sub_1DD310B58();
    swift_allocError();
    *v10 = v7;
LABEL_11:
    swift_willThrow();
    return v7;
  }
  v7 = sub_1DD34281C();
  v8 = v6;

  if (*(_QWORD *)(v7 + 16))
  {
    sub_1DD30E6DC(v7 + 32, (uint64_t)&v15);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v16 + 1))
  {
    sub_1DD310B9C((uint64_t)&v15);
    sub_1DD310B58();
    swift_allocError();
    *v11 = 0x8000000000000000;
    goto LABEL_11;
  }
  sub_1DD310BDC(&v15, v17);
  sub_1DD30E6DC((uint64_t)v17, (uint64_t)&v15);
  sub_1DD310BEC();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = v14;
  }
  else
  {
    sub_1DD310B58();
    swift_allocError();
    *v12 = 0x8000000000000008;
    swift_willThrow();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return v7;
}

uint64_t sub_1DD3107FC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DD310820(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;

  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  if (a3)
  {
    v6 = a3 | 0x4000000000000000;
    sub_1DD310B58();
    v7 = swift_allocError();
    *v8 = v6;
    v9 = (id)a3;
    v4(v7, 1);
    v10 = (void *)v7;
  }
  else if (a2
         && (type metadata accessor for ActivityPickerRemoteViewController(), (v12 = swift_dynamicCastClass()) != 0))
  {
    v13 = v12;
    v16 = a2;
    v4(v13, 0);
    v10 = v16;
  }
  else
  {
    sub_1DD310B58();
    v14 = swift_allocError();
    *v15 = 0x8000000000000010;
    v4(v14, 1);
    v10 = (void *)v14;
  }

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

uint64_t type metadata accessor for ActivityPickerRemoteViewController()
{
  return objc_opt_self();
}

unint64_t *initializeBufferWithCopyOfBuffer for ActivityPickerRemoteViewError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_1DD310990(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_1DD310990(unint64_t result)
{
  if (result >> 62)
  {
    if (result >> 62 != 1)
      return result;
    result &= 0x3FFFFFFFFFFFFFFFuLL;
  }
  return (unint64_t)(id)result;
}

void destroy for ActivityPickerRemoteViewError(unint64_t *a1)
{
  sub_1DD3109B4(*a1);
}

void sub_1DD3109B4(unint64_t a1)
{
  if (a1 >> 62)
  {
    if (a1 >> 62 != 1)
      return;
    a1 &= 0x3FFFFFFFFFFFFFFFuLL;
  }

}

unint64_t *assignWithCopy for ActivityPickerRemoteViewError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_1DD310990(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_1DD3109B4(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for ActivityPickerRemoteViewError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_1DD3109B4(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityPickerRemoteViewError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ActivityPickerRemoteViewError(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1DD310AF0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_1DD310B0C(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_1DD310B1C(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 2)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 62;
  }
  else
  {
    v2 = 8 * (a2 - 2);
    v3 = 0x8000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for ActivityPickerRemoteViewError()
{
  return &type metadata for ActivityPickerRemoteViewError;
}

unint64_t sub_1DD310B58()
{
  unint64_t result;

  result = qword_1F03D3B78;
  if (!qword_1F03D3B78)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD343300, &type metadata for ActivityPickerRemoteViewError);
    atomic_store(result, (unint64_t *)&qword_1F03D3B78);
  }
  return result;
}

uint64_t sub_1DD310B9C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_1DD310BDC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1DD310BEC()
{
  unint64_t result;

  result = qword_1F03D3B90;
  if (!qword_1F03D3B90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F03D3B90);
  }
  return result;
}

uint64_t sub_1DD310C28()
{
  return swift_release();
}

uint64_t sub_1DD310C30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3BA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FamilyControlsError.errorDescription.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1DD310CC0 + 4 * byte_1DD3433A0[*v0]))(0xD00000000000001ELL, 0x80000001DD3476C0);
}

uint64_t sub_1DD310CC0@<X0>(uint64_t a1@<X8>)
{
  return a1 - 8;
}

BOOL sub_1DD310D40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DD310D54()
{
  sub_1DD342BB8();
  sub_1DD342BC4();
  return sub_1DD342BD0();
}

uint64_t sub_1DD310D98()
{
  return sub_1DD342BC4();
}

uint64_t sub_1DD310DC0()
{
  sub_1DD342BB8();
  sub_1DD342BC4();
  return sub_1DD342BD0();
}

uint64_t sub_1DD310E10()
{
  sub_1DD3112AC();
  return sub_1DD342B70();
}

uint64_t sub_1DD310E38()
{
  sub_1DD3112AC();
  sub_1DD311224();
  sub_1DD311268();
  return sub_1DD342B64();
}

FamilyControls::FamilyControlsError_optional __swiftcall FamilyControlsError.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 8;
  if ((unint64_t)rawValue < 8)
    v2 = rawValue;
  *v1 = v2;
  return (FamilyControls::FamilyControlsError_optional)rawValue;
}

uint64_t FamilyControlsError.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void FamilyControlsError.errorUserInfo.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t inited;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B80);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DD3432F0;
  *(_QWORD *)(inited + 32) = 1868983913;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  __asm { BR              X11 }
}

unint64_t sub_1DD310F14(_QWORD *a1)
{
  uint64_t v1;

  a1[9] = MEMORY[0x1E0DEA968];
  a1[6] = v1 - 8;
  a1[7] = 0x80000001DD3476A0;
  return sub_1DD30F838((uint64_t)a1);
}

unint64_t sub_1DD310FB8()
{
  unint64_t result;

  result = qword_1F03D3BB0;
  if (!qword_1F03D3BB0)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsError, &type metadata for FamilyControlsError);
    atomic_store(result, (unint64_t *)&qword_1F03D3BB0);
  }
  return result;
}

unint64_t sub_1DD311000()
{
  unint64_t result;

  result = qword_1F03D3BB8;
  if (!qword_1F03D3BB8)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsError, &type metadata for FamilyControlsError);
    atomic_store(result, (unint64_t *)&qword_1F03D3BB8);
  }
  return result;
}

FamilyControls::FamilyControlsError_optional sub_1DD311044(Swift::Int *a1)
{
  return FamilyControlsError.init(rawValue:)(*a1);
}

void sub_1DD31104C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_1DD31105C()
{
  sub_1DD311224();
  sub_1DD311268();
  return sub_1DD3420E4();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FamilyControlsError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyControlsError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1DD311190 + 4 * byte_1DD3433B5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1DD3111C4 + 4 * byte_1DD3433B0[v4]))();
}

uint64_t sub_1DD3111C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD3111CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD3111D4);
  return result;
}

uint64_t sub_1DD3111E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD3111E8);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1DD3111EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD3111F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD311200(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DD31120C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FamilyControlsError()
{
  return &type metadata for FamilyControlsError;
}

unint64_t sub_1DD311224()
{
  unint64_t result;

  result = qword_1F03D3BC0;
  if (!qword_1F03D3BC0)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsError, &type metadata for FamilyControlsError);
    atomic_store(result, (unint64_t *)&qword_1F03D3BC0);
  }
  return result;
}

unint64_t sub_1DD311268()
{
  unint64_t result;

  result = qword_1F03D3BC8;
  if (!qword_1F03D3BC8)
  {
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1F03D3BC8);
  }
  return result;
}

unint64_t sub_1DD3112AC()
{
  unint64_t result;

  result = qword_1F03D3BD0;
  if (!qword_1F03D3BD0)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsError, &type metadata for FamilyControlsError);
    atomic_store(result, (unint64_t *)&qword_1F03D3BD0);
  }
  return result;
}

uint64_t AuthorizationRecord.bundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AuthorizationRecord.teamIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AuthorizationRecord.recordIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AuthorizationRecord() + 24);
  v4 = sub_1DD3422D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for AuthorizationRecord()
{
  uint64_t result;

  result = qword_1EDB65200;
  if (!qword_1EDB65200)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AuthorizationRecord.status.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for AuthorizationRecord();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t AuthorizationRecord.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AuthorizationRecord() + 32));
}

uint64_t sub_1DD31141C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1DD311454 + 4 * byte_1DD343580[a1]))(0xD000000000000010, 0x80000001DD347740);
}

uint64_t sub_1DD311454()
{
  return 0x6E6564496D616574;
}

uint64_t sub_1DD31148C()
{
  return 0x737574617473;
}

uint64_t sub_1DD3114A0()
{
  return 1701869940;
}

uint64_t sub_1DD3114B0()
{
  unsigned __int8 *v0;

  return sub_1DD31141C(*v0);
}

uint64_t sub_1DD3114B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DD312250(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DD3114DC()
{
  return 0;
}

void sub_1DD3114E8(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1DD3114F4()
{
  sub_1DD3119F8();
  return sub_1DD342BF4();
}

uint64_t sub_1DD31151C()
{
  sub_1DD3119F8();
  return sub_1DD342C00();
}

uint64_t AuthorizationRecord.init(bundleIdentifier:teamIdentifier:recordIdentifier:status:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, _QWORD *a7@<X8>)
{
  char v9;
  int *v10;
  char *v11;
  uint64_t v12;
  uint64_t result;

  v9 = *a6;
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  v10 = (int *)type metadata accessor for AuthorizationRecord();
  v11 = (char *)a7 + v10[6];
  v12 = sub_1DD3422D0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a5, v12);
  *((_BYTE *)a7 + v10[7]) = v9;
  *(_QWORD *)((char *)a7 + v10[8]) = 0;
  return result;
}

uint64_t AuthorizationRecord.init(bundleIdentifier:teamIdentifier:recordIdentifier:status:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  char v11;
  int *v12;
  char *v13;
  uint64_t v14;
  uint64_t result;

  v11 = *a6;
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  v12 = (int *)type metadata accessor for AuthorizationRecord();
  v13 = (char *)a8 + v12[6];
  v14 = sub_1DD3422D0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v13, a5, v14);
  *((_BYTE *)a8 + v12[7]) = v11;
  *(_QWORD *)((char *)a8 + v12[8]) = a7;
  return result;
}

uint64_t AuthorizationRecord.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;

  v27 = a2;
  v3 = sub_1DD3422D0();
  v28 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3BD8);
  v6 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AuthorizationRecord();
  MEMORY[0x1E0C80A78]();
  v11 = (uint64_t *)((char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD3119F8();
  v31 = v8;
  v12 = (uint64_t)v32;
  sub_1DD342BDC();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v13 = v5;
  v14 = v6;
  v32 = a1;
  v26 = v9;
  v16 = v28;
  v15 = v29;
  v40 = 0;
  v17 = v30;
  v19 = (uint64_t)v11;
  *v11 = sub_1DD342AA4();
  v11[1] = v20;
  v39 = 1;
  v11[2] = sub_1DD342AA4();
  v11[3] = v21;
  v38 = 2;
  sub_1DD311FD8(&qword_1F03D3BE0, MEMORY[0x1E0CB09E0]);
  sub_1DD342AC8();
  v25 = 0;
  v22 = v26;
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v19 + *(int *)(v26 + 24), v13, v15);
  v36 = 3;
  sub_1DD311A3C();
  sub_1DD342AC8();
  *(_BYTE *)(v19 + *(int *)(v22 + 28)) = v37;
  v35 = 4;
  sub_1DD311A80();
  sub_1DD342A98();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v31, v17);
  v23 = v27;
  if (v34 == 1)
    v24 = 0;
  else
    v24 = v33;
  *(_QWORD *)(v19 + *(int *)(v26 + 32)) = v24;
  sub_1DD311AC4(v19, v23);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
  return sub_1DD311B08(v19);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1DD3119F8()
{
  unint64_t result;

  result = qword_1F03D5160[0];
  if (!qword_1F03D5160[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD34378C, &type metadata for AuthorizationRecord.RecordCodingKeys);
    atomic_store(result, qword_1F03D5160);
  }
  return result;
}

unint64_t sub_1DD311A3C()
{
  unint64_t result;

  result = qword_1F03D3BE8;
  if (!qword_1F03D3BE8)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for AuthorizationStatus, &type metadata for AuthorizationStatus);
    atomic_store(result, (unint64_t *)&qword_1F03D3BE8);
  }
  return result;
}

unint64_t sub_1DD311A80()
{
  unint64_t result;

  result = qword_1F03D3BF0;
  if (!qword_1F03D3BF0)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsMember, &type metadata for FamilyControlsMember);
    atomic_store(result, (unint64_t *)&qword_1F03D3BF0);
  }
  return result;
}

uint64_t sub_1DD311AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AuthorizationRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD311B08(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AuthorizationRecord();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AuthorizationRecord.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3BF8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD3119F8();
  sub_1DD342BE8();
  v17 = 0;
  sub_1DD342AEC();
  if (!v2)
  {
    v16 = 1;
    sub_1DD342AEC();
    v9 = type metadata accessor for AuthorizationRecord();
    v15 = 2;
    sub_1DD3422D0();
    sub_1DD311FD8(&qword_1F03D3C00, MEMORY[0x1E0CB09B8]);
    sub_1DD342B10();
    v14 = *(_BYTE *)(v3 + *(int *)(v9 + 28));
    v13 = 3;
    sub_1DD311D44();
    sub_1DD342B10();
    v12 = *(_QWORD *)(v3 + *(int *)(v9 + 32));
    v11[15] = 4;
    sub_1DD311D88();
    sub_1DD342B10();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1DD311D44()
{
  unint64_t result;

  result = qword_1F03D3C08;
  if (!qword_1F03D3C08)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for AuthorizationStatus, &type metadata for AuthorizationStatus);
    atomic_store(result, (unint64_t *)&qword_1F03D3C08);
  }
  return result;
}

unint64_t sub_1DD311D88()
{
  unint64_t result;

  result = qword_1F03D3C10;
  if (!qword_1F03D3C10)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsMember, &type metadata for FamilyControlsMember);
    atomic_store(result, (unint64_t *)&qword_1F03D3C10);
  }
  return result;
}

uint64_t AuthorizationRecord.description.getter()
{
  sub_1DD3429CC();
  sub_1DD3427BC();
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  type metadata accessor for AuthorizationRecord();
  sub_1DD3422D0();
  sub_1DD311FD8(&qword_1F03D3C18, MEMORY[0x1E0CB09F0]);
  sub_1DD342B1C();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  sub_1DD312018();
  sub_1DD342B1C();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  sub_1DD31205C();
  sub_1DD342B1C();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  return 0;
}

uint64_t sub_1DD311FD8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1DD3422D0();
    result = MEMORY[0x1DF0D9108](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DD312018()
{
  unint64_t result;

  result = qword_1F03D3C20;
  if (!qword_1F03D3C20)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for AuthorizationStatus, &type metadata for AuthorizationStatus);
    atomic_store(result, (unint64_t *)&qword_1F03D3C20);
  }
  return result;
}

unint64_t sub_1DD31205C()
{
  unint64_t result;

  result = qword_1F03D3C28;
  if (!qword_1F03D3C28)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsMember, &type metadata for FamilyControlsMember);
    atomic_store(result, (unint64_t *)&qword_1F03D3C28);
  }
  return result;
}

uint64_t sub_1DD3120A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  _BOOL8 v4;
  char v5;
  _BOOL8 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  char v19;

  if (a1)
  {
    v3 = a1;
    AuthorizationStatus.init(rawValue:)((Swift::Int)objc_msgSend(v3, sel_status));
    if (v19 != 3)
    {
      v4 = FamilyControlsMember.init(rawValue:)((uint64_t)objc_msgSend(v3, sel_type));
      if ((v5 & 1) == 0)
      {
        v6 = v4;
        v7 = objc_msgSend(v3, sel_bundleIdentifier);
        v8 = sub_1DD342798();
        v10 = v9;

        v11 = objc_msgSend(v3, sel_teamIdentifier);
        v12 = sub_1DD342798();
        v14 = v13;

        v15 = objc_msgSend(v3, sel_recordIdentifier);
        v16 = type metadata accessor for AuthorizationRecord();
        sub_1DD3422B8();

        *a2 = v8;
        a2[1] = v10;
        a2[2] = v12;
        a2[3] = v14;
        *((_BYTE *)a2 + *(int *)(v16 + 28)) = v19;
        *(uint64_t *)((char *)a2 + *(int *)(v16 + 32)) = v6;
        return (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 0, 1, v16);
      }
    }

  }
  v18 = type metadata accessor for AuthorizationRecord();
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a2, 1, 1, v18);
}

uint64_t sub_1DD312220@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AuthorizationRecord.init(from:)(a1, a2);
}

uint64_t sub_1DD312234(_QWORD *a1)
{
  return AuthorizationRecord.encode(to:)(a1);
}

uint64_t sub_1DD312250(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x80000001DD347740 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6564496D616574 && a2 == 0xEE00726569666974 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001DD347760 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x737574617473 && a2 == 0xE600000000000000 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_1DD342B34();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

BOOL _s14FamilyControls19AuthorizationRecordV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  BOOL v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_1DD342B34(), result = 0, (v5 & 1) != 0))
  {
    v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_1DD342B34(), result = 0, (v8 & 1) != 0))
    {
      v9 = type metadata accessor for AuthorizationRecord();
      if ((sub_1DD3422AC() & 1) != 0
        && (v10 = *(int *)(v9 + 28),
            LOBYTE(v12) = *((_BYTE *)a1 + v10),
            LOBYTE(v11) = *((_BYTE *)a2 + v10),
            sub_1DD312D3C(),
            sub_1DD3427EC(),
            sub_1DD3427EC(),
            v14 == v13))
      {
        sub_1DD312D80();
        sub_1DD3427EC();
        sub_1DD3427EC();
        return v12 == v11;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AuthorizationRecord(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_1DD3422D0();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(_QWORD *)((char *)v4 + v14) = *(_QWORD *)((char *)a2 + v14);
  }
  return v4;
}

uint64_t destroy for AuthorizationRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_1DD3422D0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for AuthorizationRecord(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_1DD3422D0();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  return a1;
}

_QWORD *assignWithCopy for AuthorizationRecord(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DD3422D0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  return a1;
}

_OWORD *initializeWithTake for AuthorizationRecord(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1DD3422D0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  return a1;
}

_QWORD *assignWithTake for AuthorizationRecord(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_1DD3422D0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationRecord()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD312980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1DD3422D0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AuthorizationRecord()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD312A08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1DD3422D0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1DD312A7C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DD3422D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AuthorizationRecord.RecordCodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationRecord.RecordCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1DD312BE4 + 4 * byte_1DD34358A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1DD312C18 + 4 * byte_1DD343585[v4]))();
}

uint64_t sub_1DD312C18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD312C20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD312C28);
  return result;
}

uint64_t sub_1DD312C34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD312C3CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1DD312C40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD312C48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationRecord.RecordCodingKeys()
{
  return &type metadata for AuthorizationRecord.RecordCodingKeys;
}

unint64_t sub_1DD312C68()
{
  unint64_t result;

  result = qword_1F03D5470[0];
  if (!qword_1F03D5470[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD343764, &type metadata for AuthorizationRecord.RecordCodingKeys);
    atomic_store(result, qword_1F03D5470);
  }
  return result;
}

unint64_t sub_1DD312CB0()
{
  unint64_t result;

  result = qword_1F03D5580;
  if (!qword_1F03D5580)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD3436D4, &type metadata for AuthorizationRecord.RecordCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D5580);
  }
  return result;
}

unint64_t sub_1DD312CF8()
{
  unint64_t result;

  result = qword_1F03D5588[0];
  if (!qword_1F03D5588[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD3436FC, &type metadata for AuthorizationRecord.RecordCodingKeys);
    atomic_store(result, qword_1F03D5588);
  }
  return result;
}

unint64_t sub_1DD312D3C()
{
  unint64_t result;

  result = qword_1F03D3C30;
  if (!qword_1F03D3C30)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for AuthorizationStatus, &type metadata for AuthorizationStatus);
    atomic_store(result, (unint64_t *)&qword_1F03D3C30);
  }
  return result;
}

unint64_t sub_1DD312D80()
{
  unint64_t result;

  result = qword_1F03D3C38;
  if (!qword_1F03D3C38)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsMember, &type metadata for FamilyControlsMember);
    atomic_store(result, (unint64_t *)&qword_1F03D3C38);
  }
  return result;
}

FamilyControls::AppInfoSource_optional __swiftcall AppInfoSource.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (FamilyControls::AppInfoSource_optional)rawValue;
}

uint64_t AppInfoSource.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

FamilyControls::AppInfoSource_optional sub_1DD312DE0(Swift::Int *a1)
{
  return AppInfoSource.init(rawValue:)(*a1);
}

void sub_1DD312DE8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

_QWORD *sub_1DD312DF4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 120))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1DD312E34(char *a1, uint64_t *a2)
{
  uint64_t v2;
  char v4;

  v2 = *a2;
  v4 = *a1;
  return (*(uint64_t (**)(char *))(*(_QWORD *)v2 + 128))(&v4);
}

uint64_t sub_1DD312E70@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 16);
  return result;
}

uint64_t sub_1DD312EB0(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = v2;
  return result;
}

uint64_t (*sub_1DD312EEC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD312F28@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 144))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1DD312F58(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 152);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1DD312F9C()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD312FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DD313034())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD313070@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 168))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1DD3130A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 176);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1DD3130E4()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD31312C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DD31317C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD3131BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 192))();
}

uint64_t sub_1DD3131E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD313274(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 200))(v5);
}

uint64_t sub_1DD313268@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD313448(&OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL, a1);
}

uint64_t sub_1DD313274(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD3132BC(uint64_t a1)
{
  return sub_1DD3134A0(a1, &OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL);
}

uint64_t sub_1DD3132C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1DD313310())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD313354@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_1DD342258();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_1DD313390(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 216))();
}

uint64_t sub_1DD3133B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD313274(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 224))(v5);
}

uint64_t sub_1DD31343C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD313448(&OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL, a1);
}

uint64_t sub_1DD313448@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a1;
  swift_beginAccess();
  return sub_1DD313274(v4, a2);
}

uint64_t sub_1DD313494(uint64_t a1)
{
  return sub_1DD3134A0(a1, &OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL);
}

uint64_t sub_1DD3134A0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a2;
  swift_beginAccess();
  sub_1DD3132C8(a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1DD3134F4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1DD313538()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  v1 = MEMORY[0x1E0C80A78]();
  strcpy((char *)v19, "Source: ");
  BYTE1(v19[1]) = 0;
  WORD1(v19[1]) = 0;
  HIDWORD(v19[1]) = -402653184;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(_QWORD *)v0 + 120))(&v17, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C48);
  sub_1DD3427A4();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  v3 = v19[0];
  v2 = v19[1];
  v19[0] = 0;
  v19[1] = 0xE000000000000000;
  sub_1DD3429CC();
  v4 = swift_bridgeObjectRelease();
  v19[0] = 0xD000000000000013;
  v19[1] = 0x80000001DD347790;
  v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 144))(v4);
  v18 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B30);
  sub_1DD3427A4();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  v19[0] = v3;
  v19[1] = v2;
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v19[0];
  v6 = v19[1];
  v19[0] = 0;
  v19[1] = 0xE000000000000000;
  sub_1DD3429CC();
  v8 = swift_bridgeObjectRelease();
  strcpy((char *)v19, "Display Name: ");
  HIBYTE(v19[1]) = -18;
  v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 168))(v8);
  v18 = v9;
  sub_1DD3427A4();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  v19[0] = v7;
  v19[1] = v6;
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  v10 = swift_bridgeObjectRelease();
  v12 = v19[0];
  v11 = v19[1];
  strcpy((char *)v19, "Local URL: ");
  HIDWORD(v19[1]) = -352321536;
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 192))(v10);
  sub_1DD3427A4();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  v19[0] = v12;
  v19[1] = v11;
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = v19[0];
  v13 = v19[1];
  v19[0] = 0;
  v19[1] = 0xE000000000000000;
  sub_1DD3429CC();
  v15 = swift_bridgeObjectRelease();
  strcpy((char *)v19, "Artwork URL: ");
  HIWORD(v19[1]) = -4864;
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 216))(v15);
  sub_1DD3427A4();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  v19[0] = v14;
  v19[1] = v13;
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19[0];
}

uint64_t AppInfo.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DD31A090(v0 + OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL, &qword_1F03D3C40);
  sub_1DD31A090(v0 + OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL, &qword_1F03D3C40);
  return v0;
}

uint64_t AppInfo.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DD31A090(v0 + OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL, &qword_1F03D3C40);
  sub_1DD31A090(v0 + OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL, &qword_1F03D3C40);
  return swift_deallocClassInstance();
}

uint64_t sub_1DD313974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);

  v0 = swift_allocObject();
  *(_BYTE *)(v0 + 16) = 3;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  v1 = v0 + OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL;
  v2 = sub_1DD342258();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
  v3(v0 + OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL, 1, 1, v2);
  return v0;
}

uint64_t sub_1DD313A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);

  *(_BYTE *)(v0 + 16) = 3;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  v1 = v0 + OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL;
  v2 = sub_1DD342258();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
  v3(v0 + OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL, 1, 1, v2);
  return v0;
}

uint64_t sub_1DD313A98()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 240))();
}

uint64_t sub_1DD313AC0()
{
  return MEMORY[0x1E0DEE9E8];
}

id sub_1DD313ACC()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D38]), sel_init);
}

uint64_t sub_1DD313AF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v6[2];

  v0 = sub_1DD3428F4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD3428E8();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  sub_1DD342738();
  MEMORY[0x1E0C80A78]();
  sub_1DD313CAC();
  sub_1DD34272C();
  v6[1] = MEMORY[0x1E0DEE9D8];
  sub_1DD3150D4(&qword_1EDB64FD0, v4, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FB8);
  sub_1DD31A0CC(&qword_1EDB64FC0, &qword_1EDB64FB8, MEMORY[0x1E0DEAF38]);
  sub_1DD342978();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  return sub_1DD342924();
}

unint64_t sub_1DD313CAC()
{
  unint64_t result;

  result = qword_1EDB64FD8;
  if (!qword_1EDB64FD8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDB64FD8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0D90FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_1DD313D2C()
{
  uint64_t v0;
  _QWORD *result;

  type metadata accessor for AppInfoCache();
  v0 = swift_allocObject();
  result = sub_1DD313DE4();
  qword_1F03D5618 = v0;
  return result;
}

uint64_t *sub_1DD313D64()
{
  if (qword_1F03D5610 != -1)
    swift_once();
  return &qword_1F03D5618;
}

uint64_t static AppInfoCache.shared.getter()
{
  if (qword_1F03D5610 != -1)
    swift_once();
  return swift_retain();
}

_QWORD *sub_1DD313DE4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[2];

  v1 = v0;
  v14[0] = sub_1DD3428F4();
  v2 = *(_QWORD *)(v14[0] - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD3428E8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  sub_1DD342738();
  MEMORY[0x1E0C80A78]();
  v0[2] = MEMORY[0x1E0DEE9E8];
  v0[3] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D38]), sel_init);
  sub_1DD313CAC();
  sub_1DD34272C();
  v14[1] = MEMORY[0x1E0DEE9D8];
  sub_1DD3150D4(&qword_1EDB64FD0, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FB8);
  sub_1DD31A0CC(&qword_1EDB64FC0, &qword_1EDB64FB8, MEMORY[0x1E0DEAF38]);
  sub_1DD342978();
  (*(void (**)(char *, _QWORD, _QWORD))(v2 + 104))(v4, *MEMORY[0x1E0DEF8D0], v14[0]);
  v0[4] = sub_1DD342924();
  v6 = objc_msgSend((id)objc_opt_self(), sel_ephemeralSessionConfiguration);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedURLCache);
  objc_msgSend(v6, sel_setURLCache_, v7);

  objc_msgSend(v6, sel_setRequestCachePolicy_, 2);
  objc_msgSend(v6, sel_setHTTPShouldUsePipelining_, 1);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3828]), sel_init);
  sub_1DD342930();
  v9 = (void *)sub_1DD34278C();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setName_, v9);

  objc_msgSend(v8, sel_setUnderlyingQueue_, v1[4]);
  v10 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_delegate_delegateQueue_, v6, 0, v8);
  v1[5] = v10;
  v11 = v10;
  v12 = objc_msgSend(v8, sel_name);
  objc_msgSend(v11, sel_setSessionDescription_, v12);

  return v1;
}

char *sub_1DD314138(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v5 = sub_1DD342720();
  v18 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD342738();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DD314D30(a1, a2);
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v12 + 120))(aBlock);
  if (!LOBYTE(aBlock[0]))
  {
    v17[1] = *(_QWORD *)(v2 + 32);
    v13 = swift_allocObject();
    swift_weakInit();
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v13;
    v14[3] = a1;
    v17[0] = v13;
    v14[4] = a2;
    aBlock[4] = sub_1DD314FD8;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DD3143AC;
    aBlock[3] = &block_descriptor_1;
    v15 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1DD34272C();
    v19 = MEMORY[0x1E0DEE9D8];
    sub_1DD3150D4((unint64_t *)&qword_1EDB64F88, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FA8);
    sub_1DD31A0CC((unint64_t *)&qword_1EDB64FB0, &qword_1EDB64FA8, MEMORY[0x1E0DEAF38]);
    sub_1DD342978();
    MEMORY[0x1DF0D89F4](0, v11, v7, v15);
    _Block_release(v15);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v5);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release();
    swift_release();
  }
  return v12;
}

uint64_t sub_1DD3143B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t inited;
  uint64_t v10;
  _QWORD *v11;
  void (*v12)(uint64_t, uint64_t (*)(uint64_t), _QWORD *);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DD3432F0;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  v10 = sub_1DD319580(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a1;
  v11[5] = a2;
  v12 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), _QWORD *))(*(_QWORD *)v4 + 184);
  swift_bridgeObjectRetain();
  swift_retain();
  v12(v10, sub_1DD319640, v11);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1DD3144B4(uint64_t a1, void (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  id v23;
  void *v24;
  char *v25;
  uint64_t v26;
  int64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  char *v31;
  uint64_t *v32;
  id v33;
  void *v34;
  int64_t v35;
  uint64_t v36;
  char isUniquelyReferenced_nonNull_native;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  void (*v54)(_QWORD);
  void *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t result;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(_QWORD);
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  int64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t aBlock[6];
  uint64_t v79;

  v69 = a3;
  v68 = a2;
  v67 = sub_1DD342720();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x1E0C80A78](v67);
  v65 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_1DD342738();
  v63 = *(_QWORD *)(v64 - 8);
  MEMORY[0x1E0C80A78](v64);
  v62 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = MEMORY[0x1E0DEE9E0];
  v79 = MEMORY[0x1E0DEE9E8];
  v7 = *(_QWORD *)(a1 + 56);
  v72 = a1 + 56;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v7;
  v73 = (unint64_t)(v8 + 63) >> 6;
  v75 = a1;
  swift_bridgeObjectRetain();
  v11 = 0;
  v74 = "Controls.app-info-cache";
  v70 = v6;
  if (v10)
    goto LABEL_7;
LABEL_8:
  v15 = v11 + 1;
  if (__OFADD__(v11, 1))
    goto LABEL_49;
  if (v15 >= v73)
    goto LABEL_44;
  v16 = *(_QWORD *)(v72 + 8 * v15);
  ++v11;
  if (!v16)
  {
    v11 = v15 + 1;
    if (v15 + 1 >= v73)
      goto LABEL_44;
    v16 = *(_QWORD *)(v72 + 8 * v11);
    if (!v16)
    {
      v11 = v15 + 2;
      if (v15 + 2 >= v73)
        goto LABEL_44;
      v16 = *(_QWORD *)(v72 + 8 * v11);
      if (!v16)
      {
        v17 = v15 + 3;
        if (v17 < v73)
        {
          v16 = *(_QWORD *)(v72 + 8 * v17);
          if (v16)
          {
            v11 = v17;
            goto LABEL_21;
          }
          while (1)
          {
            v11 = v17 + 1;
            if (__OFADD__(v17, 1))
              goto LABEL_50;
            if (v11 >= v73)
              break;
            v16 = *(_QWORD *)(v72 + 8 * v11);
            ++v17;
            if (v16)
              goto LABEL_21;
          }
        }
LABEL_44:
        swift_release();
        v51 = v79;
        if (*(_QWORD *)(v79 + 16))
        {
          v52 = swift_allocObject();
          swift_weakInit();
          v53 = (_QWORD *)swift_allocObject();
          v53[2] = v52;
          v53[3] = v51;
          v54 = v68;
          v53[4] = v6;
          v53[5] = v54;
          v53[6] = v69;
          aBlock[4] = (uint64_t)sub_1DD31976C;
          aBlock[5] = (uint64_t)v53;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_1DD3143AC;
          aBlock[3] = (uint64_t)&block_descriptor_16;
          v55 = _Block_copy(aBlock);
          swift_retain();
          swift_retain();
          swift_retain();
          v56 = v62;
          sub_1DD34272C();
          v77 = MEMORY[0x1E0DEE9D8];
          sub_1DD3150D4((unint64_t *)&qword_1EDB64F88, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FA8);
          sub_1DD31A0CC((unint64_t *)&qword_1EDB64FB0, &qword_1EDB64FA8, MEMORY[0x1E0DEAF38]);
          v57 = v65;
          v58 = v67;
          sub_1DD342978();
          MEMORY[0x1DF0D89F4](0, v56, v57, v55);
          _Block_release(v55);
          (*(void (**)(char *, uint64_t))(v66 + 8))(v57, v58);
          (*(void (**)(char *, uint64_t))(v63 + 8))(v56, v64);
          swift_release();
          swift_release();
          return swift_release();
        }
        else
        {
          swift_bridgeObjectRelease();
          v60 = swift_bridgeObjectRetain();
          v68(v60);
          swift_release();
          return swift_bridgeObjectRelease();
        }
      }
    }
  }
LABEL_21:
  v10 = (v16 - 1) & v16;
  for (i = __clz(__rbit64(v16)) + (v11 << 6); ; i = v13 | (v11 << 6))
  {
    v18 = (uint64_t *)(*(_QWORD *)(v75 + 48) + 16 * i);
    v19 = *v18;
    v20 = v18[1];
    v21 = *v18 == 0x6C7070612E6D6F63 && v20 == 0xEF74616843692E65;
    if (!v21 && (sub_1DD342B34() & 1) == 0)
      swift_bridgeObjectRetain();
    v22 = *(void **)(v76 + 24);
    swift_bridgeObjectRetain();
    v23 = v22;
    v24 = (void *)sub_1DD34278C();
    swift_bridgeObjectRelease();
    v25 = (char *)objc_msgSend(v23, sel_objectForKey_, v24);

    if (!v25)
    {
      v26 = sub_1DD319074(v19, v20);
      if (v26)
      {
        v25 = (char *)v26;
      }
      else
      {
        type metadata accessor for AppInfo();
        v25 = (char *)swift_allocObject();
        v25[16] = 3;
        *(_OWORD *)(v25 + 40) = 0u;
        v71 = (uint64_t *)(v25 + 40);
        *(_OWORD *)(v25 + 24) = 0u;
        v27 = v11;
        v28 = &v25[OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL];
        v29 = sub_1DD342258();
        v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
        v31 = v28;
        v11 = v27;
        v30(v31, 1, 1, v29);
        v30(&v25[OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL], 1, 1, v29);
        v6 = v70;
        swift_beginAccess();
        v25[16] = 0;
        swift_beginAccess();
        *((_QWORD *)v25 + 3) = v19;
        *((_QWORD *)v25 + 4) = v20;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32 = v71;
        swift_beginAccess();
        *v32 = v19;
        *((_QWORD *)v25 + 6) = v20;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v33 = *(id *)(v76 + 24);
        v34 = (void *)sub_1DD34278C();
        objc_msgSend(v33, sel_setObject_forKey_, v25, v34);

      }
    }
    (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v25 + 120))(aBlock);
    if (!LOBYTE(aBlock[0]))
    {
      sub_1DD317648(aBlock, v19, v20);
      swift_release();
      swift_bridgeObjectRelease();
      if (!v10)
        goto LABEL_8;
      goto LABEL_7;
    }
    v35 = v11;
    swift_retain();
    v36 = *(_QWORD *)(v6 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v36;
    *(_QWORD *)(v6 + 16) = 0x8000000000000000;
    v39 = sub_1DD310404(v19, v20);
    v40 = *(_QWORD *)(v36 + 16);
    v41 = (v38 & 1) == 0;
    v42 = v40 + v41;
    if (__OFADD__(v40, v41))
      break;
    v43 = v38;
    if (*(_QWORD *)(v36 + 24) >= v42)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_1DD318534();
    }
    else
    {
      sub_1DD3180C4(v42, isUniquelyReferenced_nonNull_native);
      v44 = sub_1DD310404(v19, v20);
      if ((v43 & 1) != (v45 & 1))
        goto LABEL_51;
      v39 = v44;
    }
    v11 = v35;
    v46 = (_QWORD *)aBlock[0];
    if ((v43 & 1) != 0)
    {
      v12 = *(_QWORD *)(aBlock[0] + 56);
      swift_release();
      *(_QWORD *)(v12 + 8 * v39) = v25;
    }
    else
    {
      *(_QWORD *)(aBlock[0] + 8 * (v39 >> 6) + 64) |= 1 << v39;
      v47 = (uint64_t *)(v46[6] + 16 * v39);
      *v47 = v19;
      v47[1] = v20;
      *(_QWORD *)(v46[7] + 8 * v39) = v25;
      v48 = v46[2];
      v49 = __OFADD__(v48, 1);
      v50 = v48 + 1;
      if (v49)
        goto LABEL_48;
      v46[2] = v50;
      swift_bridgeObjectRetain();
    }
    *(_QWORD *)(v6 + 16) = v46;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v10)
      goto LABEL_8;
LABEL_7:
    v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  result = sub_1DD342B58();
  __break(1u);
  return result;
}

char *sub_1DD314D30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  id v12;
  void *v13;

  if ((a1 != 0x6C7070612E6D6F63 || a2 != 0xEF74616843692E65) && (sub_1DD342B34() & 1) == 0)
    swift_bridgeObjectRetain();
  v5 = *(id *)(v2 + 24);
  v6 = (void *)sub_1DD34278C();
  swift_bridgeObjectRelease();
  v7 = (char *)objc_msgSend(v5, sel_objectForKey_, v6);

  if (!v7)
  {
    v8 = sub_1DD319074(a1, a2);
    if (v8)
    {
      return (char *)v8;
    }
    else
    {
      type metadata accessor for AppInfo();
      v7 = (char *)swift_allocObject();
      v7[16] = 3;
      *(_OWORD *)(v7 + 40) = 0u;
      *(_OWORD *)(v7 + 24) = 0u;
      v9 = &v7[OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL];
      v10 = sub_1DD342258();
      v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
      v11(v9, 1, 1, v10);
      v11(&v7[OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL], 1, 1, v10);
      swift_beginAccess();
      v7[16] = 0;
      swift_beginAccess();
      *((_QWORD *)v7 + 3) = a1;
      *((_QWORD *)v7 + 4) = a2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      *((_QWORD *)v7 + 5) = a1;
      *((_QWORD *)v7 + 6) = a2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v12 = *(id *)(v2 + 24);
      v13 = (void *)sub_1DD34278C();
      objc_msgSend(v12, sel_setObject_forKey_, v7, v13);

    }
  }
  return v7;
}

uint64_t sub_1DD314FA8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DD314FCC()
{
  return objectdestroy_2Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_1DD314FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t inited;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C50);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1DD3432F0;
    *(_QWORD *)(inited + 32) = v1;
    *(_QWORD *)(inited + 40) = v2;
    swift_bridgeObjectRetain();
    v5 = sub_1DD319580(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_1DD315114(v5, 0, 0);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
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

uint64_t sub_1DD3150D4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0D9108](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DD315114(uint64_t a1, void (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  id v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  void (*v55)(_QWORD);
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  void (*v64)(unint64_t, char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  void (*v76)(_QWORD);
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  void *v82;
  void *v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  void (*v89)(char *, uint64_t);
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(_QWORD);
  _QWORD aBlock[6];
  uint64_t v116;

  v4 = v3;
  v108 = a3;
  v114 = a2;
  v6 = sub_1DD3423D8();
  v109 = *(_QWORD *)(v6 - 8);
  v110 = v6;
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v90 - v11;
  MEMORY[0x1E0C80A78](v10);
  v94 = (char *)&v90 - v13;
  v96 = sub_1DD3420B4();
  v95 = *(_QWORD *)(v96 - 8);
  MEMORY[0x1E0C80A78](v96);
  v92 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  MEMORY[0x1E0C80A78](v15);
  v99 = (char *)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_1DD342258();
  v103 = *(_QWORD *)(v101 - 8);
  v17 = MEMORY[0x1E0C80A78](v101);
  v93 = (char *)&v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v100 = (char *)&v90 - v19;
  v98 = sub_1DD342300();
  v97 = *(_QWORD *)(v98 - 8);
  MEMORY[0x1E0C80A78](v98);
  v21 = (char *)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_1DD3420CC();
  v106 = *(_QWORD *)(v102 - 8);
  v22 = MEMORY[0x1E0C80A78](v102);
  v104 = (char *)&v90 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v22);
  v105 = (char *)&v90 - v25;
  MEMORY[0x1E0C80A78](v24);
  v107 = (char *)&v90 - v26;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3F00);
  MEMORY[0x1E0C80A78](v27);
  v29 = (char *)&v90 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1DD342114();
  v112 = *(_QWORD *)(v30 - 8);
  v113 = v30;
  MEMORY[0x1E0C80A78](v30);
  v111 = (char *)&v90 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_1DD342744();
  v33 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v35 = (uint64_t *)((char *)&v90 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = *(void **)(v4 + 32);
  *v35 = v36;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v33 + 104))(v35, *MEMORY[0x1E0DEF740], v32);
  v37 = v36;
  LOBYTE(v36) = sub_1DD342750();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v33 + 8))(v35, v32);
  if ((v36 & 1) == 0)
  {
    __break(1u);
    return result;
  }
  v116 = a1;
  swift_beginAccess();
  v39 = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD3189CC(v39);
  swift_bridgeObjectRelease();
  v40 = v116;
  if (!*(_QWORD *)(v116 + 16))
  {
    swift_bridgeObjectRelease();
    v49 = sub_1DD338CAC();
    v51 = v109;
    v50 = v110;
    (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v9, v49, v110);
    v52 = sub_1DD3423C0();
    v53 = sub_1DD3428C4();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_1DD30C000, v52, v53, "Requested bundle identifiers have all been cached or are inflight", v54, 2u);
      MEMORY[0x1DF0D91B0](v54, -1, -1);
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v9, v50);
    goto LABEL_10;
  }
  sub_1DD342108();
  v42 = v112;
  v41 = v113;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v112 + 48))(v29, 1, v113) == 1)
  {
    swift_bridgeObjectRelease();
    sub_1DD31A090((uint64_t)v29, &qword_1F03D3F00);
    v43 = sub_1DD338CAC();
    v45 = v109;
    v44 = v110;
    (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v12, v43, v110);
    v46 = sub_1DD3423C0();
    v47 = sub_1DD3428B8();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_1DD30C000, v46, v47, "Failed to initialize URL for app info lookup", v48, 2u);
      MEMORY[0x1DF0D91B0](v48, -1, -1);
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v12, v44);
LABEL_10:
    v55 = v114;
    if (v114)
    {
      swift_retain();
      v55(MEMORY[0x1E0DEE9E0]);
      return sub_1DD30F608((uint64_t)v55);
    }
    return result;
  }
  v91 = v4;
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v111, v29, v41);
  aBlock[0] = v40;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3F08);
  sub_1DD31A0CC(&qword_1F03D3F10, &qword_1F03D3F08, MEMORY[0x1E0DEB3D0]);
  sub_1DD31A10C();
  sub_1DD3427E0();
  swift_bridgeObjectRelease();
  v56 = v107;
  sub_1DD3420C0();
  swift_bridgeObjectRelease();
  sub_1DD3422F4();
  sub_1DD3422DC();
  (*(void (**)(char *, uint64_t))(v97 + 8))(v21, v98);
  v57 = v105;
  sub_1DD3420C0();
  swift_bridgeObjectRelease();
  v58 = v104;
  sub_1DD3420C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3F18);
  v59 = v106;
  v60 = *(_QWORD *)(v106 + 72);
  v61 = (*(unsigned __int8 *)(v106 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80);
  v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_1DD343800;
  v63 = v62 + v61;
  v64 = *(void (**)(unint64_t, char *, uint64_t))(v59 + 16);
  v65 = v102;
  v64(v63, v56, v102);
  v64(v63 + v60, v57, v65);
  v64(v63 + 2 * v60, v58, v65);
  sub_1DD3420F0();
  v66 = (uint64_t)v99;
  sub_1DD3420FC();
  v67 = v103;
  v68 = v101;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v103 + 48))(v66, 1, v101) == 1)
  {
    swift_bridgeObjectRelease();
    sub_1DD31A090(v66, &qword_1F03D3C40);
    v69 = sub_1DD338CAC();
    v71 = v109;
    v70 = v110;
    v72 = v94;
    (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v94, v69, v110);
    v73 = sub_1DD3423C0();
    v74 = sub_1DD3428B8();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_1DD30C000, v73, v74, "Failed to initialize URL with query parameters for app info lookup", v75, 2u);
      MEMORY[0x1DF0D91B0](v75, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v70);
    v76 = v114;
    if (v114)
    {
      swift_retain();
      v76(MEMORY[0x1E0DEE9E0]);
      sub_1DD30F608((uint64_t)v76);
    }
  }
  else
  {
    v77 = v100;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(v100, v66, v68);
    v78 = v116;
    swift_beginAccess();
    v79 = swift_bridgeObjectRetain();
    sub_1DD315BE4(v79);
    swift_endAccess();
    (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v93, v77, v68);
    v80 = v91;
    v81 = v92;
    sub_1DD3420A8();
    v82 = *(void **)(v80 + 40);
    v83 = (void *)sub_1DD34209C();
    v84 = (_QWORD *)swift_allocObject();
    v84[2] = v80;
    v84[3] = v78;
    v85 = (uint64_t)v114;
    v86 = v108;
    v84[4] = v114;
    v84[5] = v86;
    aBlock[4] = sub_1DD31A190;
    aBlock[5] = v84;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DD315D50;
    aBlock[3] = &block_descriptor_29;
    v87 = _Block_copy(aBlock);
    swift_retain();
    sub_1DD30F588(v85);
    swift_release();
    v88 = objc_msgSend(v82, sel_dataTaskWithRequest_completionHandler_, v83, v87);
    _Block_release(v87);

    objc_msgSend(v88, sel_resume);
    (*(void (**)(char *, uint64_t))(v95 + 8))(v81, v96);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v100, v68);
  }
  v89 = *(void (**)(char *, uint64_t))(v106 + 8);
  v89(v104, v65);
  v89(v105, v65);
  v89(v107, v65);
  return (*(uint64_t (**)(char *, uint64_t))(v112 + 8))(v111, v113);
}

uint64_t sub_1DD315BE4(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      v2 = v13 + 1;
      if (v13 + 1 >= v7)
        return swift_release();
      v14 = *(_QWORD *)(v3 + 8 * v2);
      if (!v14)
      {
        v2 = v13 + 2;
        if (v13 + 2 >= v7)
          return swift_release();
        v14 = *(_QWORD *)(v3 + 8 * v2);
        if (!v14)
        {
          v2 = v13 + 3;
          if (v13 + 3 >= v7)
            return swift_release();
          v14 = *(_QWORD *)(v3 + 8 * v2);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v9);
    v11 = *v10;
    v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_1DD317648(&v16, v11, v12);
    result = swift_bridgeObjectRelease();
  }
  v15 = v13 + 4;
  if (v15 >= v7)
    return swift_release();
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v2 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1DD315D50(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void (*v7)(void *, unint64_t, void *, void *);
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v8 = v6;
    v6 = (void *)sub_1DD34227C();
    v10 = v9;

  }
  else
  {
    swift_retain();
    v10 = 0xF000000000000000;
  }
  v11 = a3;
  v12 = a4;
  v7(v6, v10, a3, a4);

  sub_1DD319C0C((uint64_t)v6, v10);
  return swift_release();
}

void sub_1DD315E00(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void (*a5)(_QWORD), uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  void (*v62)(_QWORD);
  void *v63;
  void *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  id v68;
  id v69;
  NSObject *v70;
  os_log_type_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  void (*v90)(_QWORD);
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char isUniquelyReferenced_nonNull_native;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  int64_t v122;
  unint64_t v123;
  int64_t v124;
  uint64_t *v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  os_log_type_t v130;
  _BOOL4 v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v138;
  char v139;
  char v140;
  unint64_t v141;
  uint64_t v142;
  _BOOL8 v143;
  uint64_t v144;
  char v145;
  unint64_t v146;
  char v147;
  uint64_t *v148;
  uint64_t v149;
  BOOL v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  void *v155;
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  char *v161;
  _QWORD v162[2];
  unint64_t v163;
  void (*v164)(uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  int64_t v173;
  uint64_t v174;
  uint64_t v175;
  void (*v176)(_QWORD);
  char *v177;
  char *v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  __int128 aBlock;
  __int128 v187;
  uint64_t (*v188)();
  _QWORD *v189;
  _QWORD v190[6];

  v7 = v6;
  v174 = a6;
  v175 = a2;
  v176 = a5;
  v190[4] = *MEMORY[0x1E0C80C00];
  v11 = sub_1DD342720();
  v170 = *(_QWORD *)(v11 - 8);
  v171 = v11;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v169 = (char *)v162 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DD342738();
  v167 = *(_QWORD *)(v13 - 8);
  v168 = v13;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v166 = (char *)v162 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1DD3423D8();
  v16 = *(_QWORD *)(v15 - 8);
  v181 = v15;
  v182 = v16;
  v17 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v183 = (char *)v162 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)v162 - v20;
  v22 = MEMORY[0x1E0C80A78](v19);
  v177 = (char *)v162 - v23;
  MEMORY[0x1E0C80A78](v22);
  v178 = (char *)v162 - v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  v26 = MEMORY[0x1E0C80A78](v25);
  v179 = (unint64_t)v162 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26);
  v180 = (uint64_t)v162 - v28;
  v29 = sub_1DD342744();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v32 = (_QWORD *)((char *)v162 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  v33 = *(void **)(v7 + 32);
  *v32 = v33;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v30 + 104))(v32, *MEMORY[0x1E0DEF740], v29);
  v34 = v33;
  LOBYTE(v33) = sub_1DD342750();
  (*(void (**)(_QWORD *, uint64_t))(v30 + 8))(v32, v29);
  if ((v33 & 1) == 0)
    goto LABEL_84;
  swift_beginAccess();
  sub_1DD3189CC(a1);
  swift_endAccess();
  if (a3 >> 60 == 15 || a4)
  {
    v47 = sub_1DD338CAC();
    v48 = v181;
    v49 = v182;
    (*(void (**)(char *, uint64_t, uint64_t))(v182 + 16))(v21, v47, v181);
    swift_bridgeObjectRetain();
    v50 = a4;
    swift_bridgeObjectRetain();
    v51 = a4;
    v52 = sub_1DD3423C0();
    v53 = sub_1DD3428AC();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = swift_slowAlloc();
      v183 = (char *)swift_slowAlloc();
      *(_QWORD *)&aBlock = v183;
      *(_DWORD *)v54 = 136315394;
      swift_bridgeObjectRetain();
      v55 = sub_1DD342870();
      v57 = v56;
      swift_bridgeObjectRelease();
      v190[0] = sub_1DD30EE20(v55, v57, (uint64_t *)&aBlock);
      sub_1DD342954();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 12) = 2080;
      v190[0] = a4;
      v58 = a4;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A70);
      v59 = sub_1DD3427A4();
      v190[0] = sub_1DD30EE20(v59, v60, (uint64_t *)&aBlock);
      sub_1DD342954();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1DD30C000, v52, v53, "Failed to lookup bundle identifiers %s with error %s", (uint8_t *)v54, 0x16u);
      v61 = v183;
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v61, -1, -1);
      MEMORY[0x1DF0D91B0](v54, -1, -1);

      (*(void (**)(char *, uint64_t))(v182 + 8))(v21, v181);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v49 + 8))(v21, v48);
    }
    v62 = v176;
    if (!v176)
      return;
    swift_retain();
    v62(MEMORY[0x1E0DEE9E0]);
LABEL_21:
    sub_1DD30F608((uint64_t)v62);
    return;
  }
  v162[1] = v7;
  v35 = (void *)objc_opt_self();
  sub_1DD319BC8(v175, a3);
  v163 = a3;
  v36 = (void *)sub_1DD342270();
  *(_QWORD *)&aBlock = 0;
  v37 = objc_msgSend(v35, sel_JSONObjectWithData_options_error_, v36, 0, &aBlock);

  v38 = (id)aBlock;
  v39 = v182;
  if (!v37)
  {
    v63 = v38;
    v64 = (void *)sub_1DD3421EC();

    swift_willThrow();
    v65 = sub_1DD338CAC();
    v66 = v183;
    v67 = v181;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v183, v65, v181);
    swift_bridgeObjectRetain();
    v68 = v64;
    swift_bridgeObjectRetain();
    v69 = v64;
    v70 = sub_1DD3423C0();
    v71 = sub_1DD3428AC();
    if (os_log_type_enabled(v70, v71))
    {
      v72 = swift_slowAlloc();
      v73 = swift_slowAlloc();
      *(_QWORD *)&aBlock = v73;
      *(_DWORD *)v72 = 136315394;
      swift_bridgeObjectRetain();
      v74 = sub_1DD342870();
      v76 = v75;
      swift_bridgeObjectRelease();
      v190[0] = sub_1DD30EE20(v74, v76, (uint64_t *)&aBlock);
      sub_1DD342954();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v72 + 12) = 2080;
      v190[0] = v64;
      v77 = v64;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A00);
      v78 = sub_1DD3427A4();
      v190[0] = sub_1DD30EE20(v78, v79, (uint64_t *)&aBlock);
      sub_1DD342954();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1DD30C000, v70, v71, "Failed to deserialize lookup for %s with error %s", (uint8_t *)v72, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v73, -1, -1);
      MEMORY[0x1DF0D91B0](v72, -1, -1);

      (*(void (**)(char *, uint64_t))(v182 + 8))(v183, v181);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v39 + 8))(v66, v67);
    }
    v62 = v176;
    if (!v176)
    {
      sub_1DD319C0C(v175, v163);

      return;
    }
    swift_retain();
    v62(MEMORY[0x1E0DEE9E0]);
    sub_1DD319C0C(v175, v163);

    goto LABEL_21;
  }
  sub_1DD34296C();
  swift_unknownObjectRelease();
  sub_1DD30E6DC((uint64_t)v190, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3EE8);
  v40 = MEMORY[0x1E0DEE9B8];
  if (swift_dynamicCast())
  {
    v41 = v185;
    v42 = (char *)a1;
    v184 = a1;
    if (*(_QWORD *)(v185 + 16))
    {
      swift_bridgeObjectRetain();
      v43 = sub_1DD310404(0x73746C75736572, 0xE700000000000000);
      v44 = v181;
      v45 = v178;
      if ((v46 & 1) != 0)
      {
        sub_1DD30E6DC(*(_QWORD *)(v41 + 56) + 32 * v43, (uint64_t)&aBlock);
      }
      else
      {
        aBlock = 0u;
        v187 = 0u;
      }
    }
    else
    {
      aBlock = 0u;
      v187 = 0u;
      swift_bridgeObjectRetain();
      v44 = v181;
      v45 = v178;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v187 + 1))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3EF0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v91 = v185;
        v177 = *(char **)(v185 + 16);
        if (!v177)
        {
          swift_bridgeObjectRelease();
          v93 = (char *)MEMORY[0x1E0DEE9E0];
          goto LABEL_45;
        }
        v92 = 0;
        v93 = (char *)MEMORY[0x1E0DEE9E0];
        v94 = v179;
        v162[0] = v185;
        while (1)
        {
          v95 = *(_QWORD *)(v91 + 8 * v92 + 32);
          v96 = swift_bridgeObjectRetain();
          v97 = sub_1DD319D0C(v96, 0x6449656C646E7562, 0xE800000000000000);
          if (v98)
          {
            v99 = v98;
            v173 = v97;
            v100 = sub_1DD319D0C(v95, 0x6D614E6B63617274, 0xE900000000000065);
            if (v101)
            {
              *(_QWORD *)&v165 = v101;
              v172 = v100;
              v183 = v93;
              v102 = sub_1DD342258();
              v103 = v180;
              v164 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v102 - 8) + 56);
              v164(v180, 1, 1, v102);
              sub_1DD319D0C(v95, 0x556B726F77747261, 0xED00003030316C72);
              v104 = v94;
              v106 = v105;
              swift_bridgeObjectRelease();
              if (v106)
              {
                sub_1DD342240();
                swift_bridgeObjectRelease();
                sub_1DD31A090(v103, &qword_1F03D3C40);
                sub_1DD31A048(v104, v103);
              }
              type metadata accessor for AppInfo();
              v107 = swift_allocObject();
              *(_BYTE *)(v107 + 16) = 3;
              *(_OWORD *)(v107 + 40) = 0u;
              *(_OWORD *)(v107 + 24) = 0u;
              v108 = v164;
              v164(v107 + OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL, 1, 1, v102);
              v109 = v107 + OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL;
              v108(v107 + OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL, 1, 1, v102);
              swift_beginAccess();
              *(_BYTE *)(v107 + 16) = 2;
              swift_beginAccess();
              v110 = v173;
              *(_QWORD *)(v107 + 24) = v173;
              *(_QWORD *)(v107 + 32) = v99;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_beginAccess();
              *(_QWORD *)(v107 + 40) = v172;
              *(_QWORD *)(v107 + 48) = v165;
              swift_bridgeObjectRelease();
              v94 = v179;
              v111 = v180;
              sub_1DD313274(v180, v179);
              swift_beginAccess();
              sub_1DD3132C8(v94, v109);
              swift_endAccess();
              swift_bridgeObjectRetain();
              swift_retain();
              v112 = v183;
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)&aBlock = v112;
              sub_1DD3183D8(v107, v110, v99, isUniquelyReferenced_nonNull_native);
              v93 = (char *)aBlock;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_1DD318B60(v110, v99);
              swift_release();
              swift_bridgeObjectRelease();
              sub_1DD31A090(v111, &qword_1F03D3C40);
              swift_bridgeObjectRelease();
              v39 = v182;
              v45 = v178;
              v91 = v162[0];
              goto LABEL_34;
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
LABEL_34:
          if (v177 == (char *)++v92)
          {
            swift_bridgeObjectRelease();
            v42 = (char *)v184;
            v40 = MEMORY[0x1E0DEE9B8];
            v44 = v181;
LABEL_45:
            v115 = 0;
            v116 = *((_QWORD *)v42 + 7);
            v172 = (uint64_t)(v42 + 56);
            v117 = 1 << v42[32];
            v118 = -1;
            if (v117 < 64)
              v118 = ~(-1 << v117);
            v119 = v118 & v116;
            v173 = (unint64_t)(v117 + 63) >> 6;
            *(_QWORD *)&v114 = 136315138;
            v165 = v114;
            v164 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 8);
            v177 = v42;
            while (1)
            {
              if (v119)
              {
                v179 = (v119 - 1) & v119;
                v121 = __clz(__rbit64(v119)) | (v115 << 6);
              }
              else
              {
                v122 = v115 + 1;
                if (__OFADD__(v115, 1))
                  goto LABEL_85;
                if (v122 >= v173)
                {
LABEL_78:
                  swift_release();
LABEL_79:
                  v153 = v170;
                  v152 = v171;
                  v154 = v169;
                  sub_1DD313CAC();
                  v155 = (void *)sub_1DD342900();
                  v156 = swift_allocObject();
                  swift_weakInit();
                  v157 = (_QWORD *)swift_allocObject();
                  v157[2] = v156;
                  v157[3] = v93;
                  v158 = (uint64_t)v176;
                  v159 = v174;
                  v157[4] = v176;
                  v157[5] = v159;
                  v188 = sub_1DD319C68;
                  v189 = v157;
                  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&aBlock + 1) = 1107296256;
                  *(_QWORD *)&v187 = sub_1DD3143AC;
                  *((_QWORD *)&v187 + 1) = &block_descriptor_23;
                  v160 = _Block_copy(&aBlock);
                  sub_1DD30F588(v158);
                  swift_release();
                  v161 = v166;
                  sub_1DD34272C();
                  *(_QWORD *)&aBlock = MEMORY[0x1E0DEE9D8];
                  sub_1DD3150D4((unint64_t *)&qword_1EDB64F88, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
                  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FA8);
                  sub_1DD31A0CC((unint64_t *)&qword_1EDB64FB0, &qword_1EDB64FA8, MEMORY[0x1E0DEAF38]);
                  sub_1DD342978();
                  MEMORY[0x1DF0D89F4](0, v161, v154, v160);
                  sub_1DD319C0C(v175, v163);
                  _Block_release(v160);

                  (*(void (**)(char *, uint64_t))(v153 + 8))(v154, v152);
                  (*(void (**)(char *, uint64_t))(v167 + 8))(v161, v168);
LABEL_80:
                  __swift_destroy_boxed_opaque_existential_0((uint64_t)v190);
                  return;
                }
                v123 = *(_QWORD *)(v172 + 8 * v122);
                ++v115;
                if (!v123)
                {
                  v115 = v122 + 1;
                  if (v122 + 1 >= v173)
                    goto LABEL_78;
                  v123 = *(_QWORD *)(v172 + 8 * v115);
                  if (!v123)
                  {
                    v115 = v122 + 2;
                    if (v122 + 2 >= v173)
                      goto LABEL_78;
                    v123 = *(_QWORD *)(v172 + 8 * v115);
                    if (!v123)
                    {
                      v124 = v122 + 3;
                      if (v124 >= v173)
                        goto LABEL_78;
                      v123 = *(_QWORD *)(v172 + 8 * v124);
                      if (!v123)
                      {
                        while (1)
                        {
                          v115 = v124 + 1;
                          if (__OFADD__(v124, 1))
                            goto LABEL_86;
                          if (v115 >= v173)
                            goto LABEL_78;
                          v123 = *(_QWORD *)(v172 + 8 * v115);
                          ++v124;
                          if (v123)
                            goto LABEL_65;
                        }
                      }
                      v115 = v124;
                    }
                  }
                }
LABEL_65:
                v179 = (v123 - 1) & v123;
                v121 = __clz(__rbit64(v123)) + (v115 << 6);
              }
              v183 = v93;
              v125 = (uint64_t *)(*((_QWORD *)v42 + 6) + 16 * v121);
              v127 = *v125;
              v126 = v125[1];
              swift_bridgeObjectRetain();
              v128 = sub_1DD338CAC();
              (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v45, v128, v44);
              swift_bridgeObjectRetain_n();
              v129 = sub_1DD3423C0();
              v130 = sub_1DD3428AC();
              v131 = os_log_type_enabled(v129, v130);
              v180 = v115;
              if (v131)
              {
                v132 = swift_slowAlloc();
                v133 = swift_slowAlloc();
                *(_QWORD *)&aBlock = v133;
                *(_DWORD *)v132 = v165;
                swift_bridgeObjectRetain();
                *(_QWORD *)(v132 + 4) = sub_1DD30EE20(v127, v126, (uint64_t *)&aBlock);
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_1DD30C000, v129, v130, "Failed to find app with bundle identifier %s", (uint8_t *)v132, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x1DF0D91B0](v133, -1, -1);
                MEMORY[0x1DF0D91B0](v132, -1, -1);

              }
              else
              {

                swift_bridgeObjectRelease_n();
              }
              (*(void (**)(char *, uint64_t))(v39 + 8))(v45, v44);
              type metadata accessor for AppInfo();
              v134 = swift_allocObject();
              *(_BYTE *)(v134 + 16) = 3;
              *(_OWORD *)(v134 + 40) = 0u;
              *(_OWORD *)(v134 + 24) = 0u;
              v135 = v134 + OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL;
              v136 = sub_1DD342258();
              v137 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v136 - 8) + 56);
              v137(v135, 1, 1, v136);
              v137(v134 + OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL, 1, 1, v136);
              swift_beginAccess();
              *(_BYTE *)(v134 + 16) = 2;
              swift_beginAccess();
              *(_QWORD *)(v134 + 24) = v127;
              *(_QWORD *)(v134 + 32) = v126;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_beginAccess();
              *(_QWORD *)(v134 + 40) = v127;
              *(_QWORD *)(v134 + 48) = v126;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_retain();
              v138 = v183;
              v139 = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)&aBlock = v138;
              v141 = sub_1DD310404(v127, v126);
              v142 = *((_QWORD *)v138 + 2);
              v143 = (v140 & 1) == 0;
              v144 = v142 + v143;
              if (__OFADD__(v142, v143))
                break;
              v145 = v140;
              if (*((_QWORD *)v138 + 3) >= v144)
              {
                if ((v139 & 1) == 0)
                  sub_1DD318534();
              }
              else
              {
                sub_1DD3180C4(v144, v139);
                v146 = sub_1DD310404(v127, v126);
                if ((v145 & 1) != (v147 & 1))
                {
                  sub_1DD342B58();
                  __break(1u);
                  return;
                }
                v141 = v146;
              }
              v45 = v178;
              v93 = (char *)aBlock;
              if ((v145 & 1) != 0)
              {
                v120 = *(_QWORD *)(aBlock + 56);
                swift_release();
                *(_QWORD *)(v120 + 8 * v141) = v134;
              }
              else
              {
                *(_QWORD *)(aBlock + 8 * (v141 >> 6) + 64) |= 1 << v141;
                v148 = (uint64_t *)(*((_QWORD *)v93 + 6) + 16 * v141);
                *v148 = v127;
                v148[1] = v126;
                *(_QWORD *)(*((_QWORD *)v93 + 7) + 8 * v141) = v134;
                v149 = *((_QWORD *)v93 + 2);
                v150 = __OFADD__(v149, 1);
                v151 = v149 + 1;
                if (v150)
                  goto LABEL_83;
                *((_QWORD *)v93 + 2) = v151;
                swift_bridgeObjectRetain();
              }
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v44 = v181;
              v39 = v182;
              v42 = v177;
              v119 = v179;
              v115 = v180;
            }
            __break(1u);
LABEL_83:
            __break(1u);
LABEL_84:
            __break(1u);
LABEL_85:
            __break(1u);
LABEL_86:
            __break(1u);
          }
        }
      }
    }
    else
    {
      sub_1DD31A090((uint64_t)&aBlock, &qword_1F03D3B88);
    }
    swift_bridgeObjectRelease();
    v93 = (char *)MEMORY[0x1E0DEE9E0];
    goto LABEL_79;
  }
  v80 = sub_1DD338CAC();
  v81 = v177;
  v82 = v181;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v177, v80, v181);
  swift_bridgeObjectRetain_n();
  v83 = sub_1DD3423C0();
  v84 = sub_1DD3428AC();
  if (os_log_type_enabled(v83, v84))
  {
    v85 = (uint8_t *)swift_slowAlloc();
    v86 = swift_slowAlloc();
    *(_QWORD *)&aBlock = v86;
    *(_DWORD *)v85 = 136315138;
    swift_bridgeObjectRetain();
    v87 = sub_1DD342870();
    v89 = v88;
    swift_bridgeObjectRelease();
    v185 = sub_1DD30EE20(v87, v89, (uint64_t *)&aBlock);
    sub_1DD342954();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DD30C000, v83, v84, "Failed to deserialize lookup for %s", v85, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D91B0](v86, -1, -1);
    MEMORY[0x1DF0D91B0](v85, -1, -1);

    (*(void (**)(char *, uint64_t))(v182 + 8))(v177, v181);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v81, v82);
  }
  v90 = v176;
  if (v176)
  {
    swift_retain();
    v90(MEMORY[0x1E0DEE9E0]);
    sub_1DD319C0C(v175, v163);
    sub_1DD30F608((uint64_t)v90);
    goto LABEL_80;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v190);
  sub_1DD319C0C(v175, v163);
}

uint64_t sub_1DD31729C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1DD3172C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;

  v2 = v1;
  v4 = sub_1DD342744();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DD313CAC();
  *v7 = sub_1DD342900();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF740], v4);
  v8 = sub_1DD342750();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
    goto LABEL_25;
  v9 = a1 + 64;
  v10 = 1 << *(_BYTE *)(a1 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(a1 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  swift_bridgeObjectRetain();
  v14 = 0;
  while (1)
  {
    if (v12)
    {
      v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v16 = v15 | (v14 << 6);
      goto LABEL_6;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (v21 >= v13)
      goto LABEL_22;
    v22 = *(_QWORD *)(v9 + 8 * v21);
    ++v14;
    if (!v22)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_22;
      v22 = *(_QWORD *)(v9 + 8 * v14);
      if (!v22)
      {
        v14 = v21 + 2;
        if (v21 + 2 >= v13)
          goto LABEL_22;
        v22 = *(_QWORD *)(v9 + 8 * v14);
        if (!v22)
          break;
      }
    }
LABEL_21:
    v12 = (v22 - 1) & v22;
    v16 = __clz(__rbit64(v22)) + (v14 << 6);
LABEL_6:
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v16);
    v18 = *(void **)(v2 + 24);
    swift_bridgeObjectRetain();
    swift_retain();
    v19 = v18;
    v20 = (void *)sub_1DD34278C();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setObject_forKey_, v17, v20);
    swift_release();

  }
  v23 = v21 + 3;
  if (v23 >= v13)
  {
LABEL_22:
    swift_release();
    return;
  }
  v22 = *(_QWORD *)(v9 + 8 * v23);
  if (v22)
  {
    v14 = v23;
    goto LABEL_21;
  }
  while (1)
  {
    v14 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v14 >= v13)
      goto LABEL_22;
    v22 = *(_QWORD *)(v9 + 8 * v14);
    ++v23;
    if (v22)
      goto LABEL_21;
  }
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
}

id *AppInfoCache.deinit()
{
  id *v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t AppInfoCache.__deallocating_deinit()
{
  id *v0;

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

id sub_1DD317570(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)sub_1DD34278C();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_1DD3421EC();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1DD317648(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_1DD342BB8();
  swift_bridgeObjectRetain();
  sub_1DD3427B0();
  v8 = sub_1DD342BD0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1DD342B34() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1DD342B34() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1DD317AD0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1DD3177F4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3EF8);
  v3 = sub_1DD3429B4();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_1DD342BB8();
      sub_1DD3427B0();
      result = sub_1DD342BD0();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1DD317AD0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_1DD3177F4();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1DD317C68();
      goto LABEL_22;
    }
    sub_1DD317E18();
  }
  v11 = *v4;
  sub_1DD342BB8();
  sub_1DD3427B0();
  result = sub_1DD342BD0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1DD342B34(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1DD342B4C();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_1DD342B34();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_1DD317C68()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3EF8);
  v2 = *v0;
  v3 = sub_1DD3429A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1DD317E18()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3EF8);
  v3 = sub_1DD3429B4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1DD342BB8();
    swift_bridgeObjectRetain();
    sub_1DD3427B0();
    result = sub_1DD342BD0();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1DD3180C4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3F20);
  v36 = a2;
  v6 = sub_1DD342A50();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1DD342BB8();
    sub_1DD3427B0();
    result = sub_1DD342BD0();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1DD3183D8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1DD310404(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1DD318534();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1DD3180C4(v15, a4 & 1);
  v21 = sub_1DD310404(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1DD342B58();
  __break(1u);
  return result;
}

void *sub_1DD318534()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3F20);
  v2 = *v0;
  v3 = sub_1DD342A44();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1DD3186E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
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
  _QWORD *v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_1DD318EE4();
  if (!v8)
    goto LABEL_24;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  v13 = (_QWORD *)*a5;
  v15 = sub_1DD310404(v7, v8);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v19 = v14;
  if (v13[3] >= v18)
  {
    if ((a4 & 1) != 0)
    {
      v22 = (_QWORD *)*a5;
      if ((v14 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_1DD318534();
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v24 = (uint64_t *)(v22[6] + 16 * v15);
    *v24 = v10;
    v24[1] = v11;
    *(_QWORD *)(v22[7] + 8 * v15) = v12;
    v25 = v22[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v27;
LABEL_13:
    v28 = sub_1DD318EE4();
    if (v29)
    {
      v31 = v28;
      v32 = v29;
      v33 = v30;
      do
      {
        v37 = (_QWORD *)*a5;
        v39 = sub_1DD310404(v31, v32);
        v40 = v37[2];
        v41 = (v38 & 1) == 0;
        v42 = v40 + v41;
        if (__OFADD__(v40, v41))
          goto LABEL_25;
        v43 = v38;
        if (v37[3] < v42)
        {
          sub_1DD3180C4(v42, 1);
          v44 = sub_1DD310404(v31, v32);
          if ((v43 & 1) != (v45 & 1))
            goto LABEL_27;
          v39 = v44;
        }
        v46 = (_QWORD *)*a5;
        if ((v43 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v34 = v46[7];
          swift_release();
          *(_QWORD *)(v34 + 8 * v39) = v33;
        }
        else
        {
          v46[(v39 >> 6) + 8] |= 1 << v39;
          v47 = (uint64_t *)(v46[6] + 16 * v39);
          *v47 = v31;
          v47[1] = v32;
          *(_QWORD *)(v46[7] + 8 * v39) = v33;
          v48 = v46[2];
          v26 = __OFADD__(v48, 1);
          v49 = v48 + 1;
          if (v26)
            goto LABEL_26;
          v46[2] = v49;
        }
        v31 = sub_1DD318EE4();
        v32 = v35;
        v33 = v36;
      }
      while (v35);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1DD310C28();
    return swift_release();
  }
  sub_1DD3180C4(v18, a4 & 1);
  v20 = sub_1DD310404(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    v15 = v20;
    v22 = (_QWORD *)*a5;
    if ((v19 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    swift_bridgeObjectRelease();
    v23 = v22[7];
    swift_release();
    *(_QWORD *)(v23 + 8 * v15) = v12;
    goto LABEL_13;
  }
LABEL_27:
  result = sub_1DD342B58();
  __break(1u);
  return result;
}

uint64_t sub_1DD3189CC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1DD318B60(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1DD318B60(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_1DD342BB8();
  swift_bridgeObjectRetain();
  sub_1DD3427B0();
  v6 = sub_1DD342BD0();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1DD342B34() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1DD342B34() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1DD317C68();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_1DD318CEC(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1DD318CEC(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1DD342984();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1DD342BB8();
        swift_bridgeObjectRetain();
        sub_1DD3427B0();
        v10 = sub_1DD342BD0();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1DD318EB0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_1DD318EE4()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    swift_retain();
    v11(&v19, v20);
    swift_release();
    swift_bridgeObjectRelease();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v14 != v18)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_1DD319074(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v21;
  id v22;
  uint64_t v23;

  sub_1DD3423D8();
  MEMORY[0x1E0C80A78]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_allocWithZone(MEMORY[0x1E0CA5870]);
  swift_bridgeObjectRetain();
  v7 = sub_1DD317570(a1, a2, 0);
  if ((a1 == 0xD000000000000012 && a2 == 0x80000001DD347950 || (sub_1DD342B34() & 1) != 0)
    && (MGGetBoolAnswer() & 1) == 0)
  {

    return 0;
  }
  else
  {
    type metadata accessor for AppInfo();
    v8 = swift_allocObject();
    *(_BYTE *)(v8 + 16) = 3;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 24) = 0u;
    v22 = v7;
    v9 = v8 + OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL;
    v23 = v8 + OBJC_IVAR____TtC14FamilyControls7AppInfo_localURL;
    v10 = sub_1DD342258();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    v11(v9, 1, 1, v10);
    v11(v8 + OBJC_IVAR____TtC14FamilyControls7AppInfo_artworkURL, 1, 1, v10);
    swift_beginAccess();
    *(_BYTE *)(v8 + 16) = 1;
    swift_beginAccess();
    *(_QWORD *)(v8 + 24) = a1;
    *(_QWORD *)(v8 + 32) = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1DD3422E8();
    v12 = (void *)sub_1DD342810();
    swift_bridgeObjectRelease();
    v13 = v22;
    v14 = objc_msgSend(v22, sel_localizedNameWithPreferredLocalizations_, v12);

    v15 = sub_1DD342798();
    v17 = v16;

    swift_beginAccess();
    *(_QWORD *)(v8 + 40) = v15;
    *(_QWORD *)(v8 + 48) = v17;
    swift_bridgeObjectRelease();
    v18 = objc_msgSend(v13, sel_URL);
    sub_1DD342228();

    v11((uint64_t)v5, 0, 1, v10);
    v19 = v23;
    swift_beginAccess();
    sub_1DD3132C8((uint64_t)v5, v19);
    swift_endAccess();

  }
  return v8;
}

uint64_t sub_1DD319580(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1DD34287C();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1DD317648(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1DD319614()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DD319640(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;

  v2 = *(void (**)(uint64_t))(v1 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    v6 = v1 + 32;
    v4 = *(_QWORD *)(v1 + 32);
    v5 = *(_QWORD *)(v6 + 8);
    swift_bridgeObjectRetain();
    v7 = sub_1DD310404(v4, v5);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v7);
      swift_retain();
    }
    else
    {
      v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v2(v9);
  return swift_release();
}

uint64_t sub_1DD3196D0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t type metadata accessor for AppInfo()
{
  uint64_t result;

  result = qword_1F03D5820;
  if (!qword_1F03D5820)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DD319730()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD31976C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  __int128 v5;

  v1 = *(_QWORD *)(v0 + 24);
  v5 = *(_OWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 48);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v5;
    *(_QWORD *)(v4 + 32) = v2;
    swift_retain();
    swift_retain();
    sub_1DD315114(v1, (void (*)(_QWORD))sub_1DD31A204, v4);
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_1DD31982C()
{
  unint64_t result;

  result = qword_1F03D3C58;
  if (!qword_1F03D3C58)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for AppInfoSource, &type metadata for AppInfoSource);
    atomic_store(result, (unint64_t *)&qword_1F03D3C58);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AuthorizationStatus(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppInfoSource(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DD31994C + 4 * byte_1DD343815[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DD319980 + 4 * byte_1DD343810[v4]))();
}

uint64_t sub_1DD319980(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD319988(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD319990);
  return result;
}

uint64_t sub_1DD31999C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD3199A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DD3199A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD3199B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppInfoSource()
{
  return &type metadata for AppInfoSource;
}

uint64_t sub_1DD3199CC()
{
  return type metadata accessor for AppInfo();
}

void sub_1DD3199D4()
{
  unint64_t v0;

  sub_1DD319B24();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AppInfo()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppInfo.source.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of AppInfo.source.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of AppInfo.source.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of AppInfo.bundleIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of AppInfo.bundleIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of AppInfo.bundleIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of AppInfo.displayName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AppInfo.displayName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AppInfo.displayName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AppInfo.localURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AppInfo.localURL.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AppInfo.localURL.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of AppInfo.artworkURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of AppInfo.artworkURL.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of AppInfo.artworkURL.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of AppInfo.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

void sub_1DD319B24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F03D3C88[0])
  {
    sub_1DD342258();
    v0 = sub_1DD342948();
    if (!v1)
      atomic_store(v0, qword_1F03D3C88);
  }
}

uint64_t type metadata accessor for AppInfoCache()
{
  return objc_opt_self();
}

uint64_t method lookup function for AppInfoCache()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppInfoCache.appInfo(bundleIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AppInfoCache.fetchAppInfo(bundleIdentifier:completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AppInfoCache.fetchAppInfo(bundleIdentifiers:completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_1DD319BC8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1DD319C0C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DD319C20(a1, a2);
  return a1;
}

uint64_t sub_1DD319C20(uint64_t a1, unint64_t a2)
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

uint64_t sub_1DD319C68()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void (**)(uint64_t))(v0 + 32);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1DD3172C8(v1);
    if (v2)
    {
      swift_retain();
      v2(v1);
      swift_release();
      return sub_1DD30F608((uint64_t)v2);
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1DD319D0C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;

  v6 = sub_1DD3423D8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v30 = 0u;
    v31 = 0u;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  v10 = sub_1DD310404(a2, a3);
  if ((v11 & 1) == 0)
  {
    v30 = 0u;
    v31 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_1DD30E6DC(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v30);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v31 + 1))
  {
LABEL_11:
    sub_1DD31A090((uint64_t)&v30, &qword_1F03D3B88);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v14 = sub_1DD338CAC();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v14, v6);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v15 = sub_1DD3423C0();
    v16 = sub_1DD3428AC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v27 = v7;
      v18 = v17;
      v26 = swift_slowAlloc();
      *(_QWORD *)&v30 = v26;
      *(_DWORD *)v18 = 136315394;
      swift_bridgeObjectRetain();
      v28 = sub_1DD30EE20(a2, a3, (uint64_t *)&v30);
      sub_1DD342954();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v18 + 12) = 2080;
      swift_bridgeObjectRetain();
      v19 = sub_1DD342768();
      v25 = v6;
      v20 = v19;
      v22 = v21;
      swift_bridgeObjectRelease();
      v28 = sub_1DD30EE20(v20, v22, (uint64_t *)&v30);
      sub_1DD342954();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DD30C000, v15, v16, "Failed to extract value for key %s from lookup results %s", (uint8_t *)v18, 0x16u);
      v23 = v26;
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v23, -1, -1);
      MEMORY[0x1DF0D91B0](v18, -1, -1);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v25);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    return 0;
  }
  result = v28;
  v13 = HIBYTE(v29) & 0xF;
  if ((v29 & 0x2000000000000000) == 0)
    v13 = v28 & 0xFFFFFFFFFFFFLL;
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_1DD31A048(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD31A090(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DD31A0CC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0D9108](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DD31A10C()
{
  unint64_t result;

  result = qword_1EDB64FE0;
  if (!qword_1EDB64FE0)
  {
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EDB64FE0);
  }
  return result;
}

uint64_t objectdestroy_19Tm()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

void sub_1DD31A190(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;

  sub_1DD315E00(*(_QWORD *)(v4 + 24), a1, a2, a4, *(void (**)(_QWORD))(v4 + 32), *(_QWORD *)(v4 + 40));
}

uint64_t sub_1DD31A1C0()
{
  return objectdestroy_2Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t objectdestroy_2Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  a1(*(_QWORD *)(v1 + 32));
  return swift_deallocObject();
}

uint64_t sub_1DD31A204(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  v2 = *(void (**)(uint64_t))(v1 + 24);
  v3 = (uint64_t *)(*(_QWORD *)(v1 + 16) + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_1DD3186E8(a1, (uint64_t)sub_1DD318EB0, 0, isUniquelyReferenced_nonNull_native, &v8);
    *v3 = v8;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  swift_beginAccess();
  v6 = swift_bridgeObjectRetain();
  v2(v6);
  return swift_bridgeObjectRelease();
}

void sub_1DD31A2DC()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t static Feature.isAuthorizationEnabled.getter()
{
  return sub_1DD31A488((unsigned __int8 *)&byte_1EDB64F80, (uint64_t)&type metadata for Feature.FeatureFlags, (uint64_t (*)(uint64_t))sub_1DD31A32C);
}

char *sub_1DD31A320()
{
  return &byte_1EDB64F80;
}

unint64_t sub_1DD31A32C()
{
  unint64_t result;

  result = qword_1EDB65210;
  if (!qword_1EDB65210)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD343B18, &type metadata for Feature.FeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EDB65210);
  }
  return result;
}

uint64_t sub_1DD31A370()
{
  return 1;
}

const char *sub_1DD31A380()
{
  return "FamilyControls";
}

const char *sub_1DD31A394()
{
  return "Authorization";
}

uint64_t static Feature.overrideAuthorizationEnabled.getter()
{
  swift_beginAccess();
  return byte_1EDB64F80;
}

uint64_t static Feature.overrideAuthorizationEnabled.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1EDB64F80 = a1;
  return result;
}

uint64_t (*static Feature.overrideAuthorizationEnabled.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static Feature.isRebrandingEnabled.getter()
{
  return sub_1DD31A488((unsigned __int8 *)&byte_1F03D3F28, (uint64_t)&type metadata for Feature.AppleAccountFeatureFlags, (uint64_t (*)(uint64_t))sub_1DD31A510);
}

uint64_t sub_1DD31A488(unsigned __int8 *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6;
  int v7;
  char v8;
  _QWORD v10[5];

  v6 = swift_beginAccess();
  v7 = *a1;
  if (v7 == 2)
  {
    v10[3] = a2;
    v10[4] = a3(v6);
    v8 = sub_1DD34230C();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  }
  else
  {
    v8 = v7 & 1;
  }
  return v8 & 1;
}

char *sub_1DD31A504()
{
  return &byte_1F03D3F28;
}

unint64_t sub_1DD31A510()
{
  unint64_t result;

  result = qword_1F03D5838;
  if (!qword_1F03D5838)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD343AE8, &type metadata for Feature.AppleAccountFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1F03D5838);
  }
  return result;
}

uint64_t sub_1DD31A554()
{
  sub_1DD342BB8();
  sub_1DD342BC4();
  return sub_1DD342BD0();
}

uint64_t sub_1DD31A594()
{
  return sub_1DD342BC4();
}

uint64_t sub_1DD31A5B8()
{
  sub_1DD342BB8();
  sub_1DD342BC4();
  return sub_1DD342BD0();
}

const char *sub_1DD31A5F4()
{
  return "AppleAccount";
}

const char *sub_1DD31A608()
{
  return "AABranding";
}

uint64_t static Feature.overrideRebrandingEnabled.getter()
{
  swift_beginAccess();
  return byte_1F03D3F28;
}

uint64_t static Feature.overrideRebrandingEnabled.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1F03D3F28 = a1;
  return result;
}

uint64_t (*static Feature.overrideRebrandingEnabled.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

uint64_t sub_1DD31A6FC()
{
  return 0;
}

ValueMetadata *type metadata accessor for Feature.AppleAccountFeatureFlags()
{
  return &type metadata for Feature.AppleAccountFeatureFlags;
}

uint64_t _s14FamilyControls7FeatureV24AppleAccountFeatureFlagsOwet_0(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s14FamilyControls7FeatureV24AppleAccountFeatureFlagsOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1DD31A7A4 + 4 * byte_1DD3439C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DD31A7C4 + 4 * byte_1DD3439C5[v4]))();
}

_BYTE *sub_1DD31A7A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DD31A7C4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DD31A7CC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DD31A7D4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DD31A7DC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DD31A7E4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Feature.FeatureFlags()
{
  return &type metadata for Feature.FeatureFlags;
}

unint64_t sub_1DD31A804()
{
  unint64_t result;

  result = qword_1F03D5840[0];
  if (!qword_1F03D5840[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD343A58, &type metadata for Feature.FeatureFlags);
    atomic_store(result, qword_1F03D5840);
  }
  return result;
}

unint64_t sub_1DD31A84C()
{
  unint64_t result;

  result = qword_1F03D5950[0];
  if (!qword_1F03D5950[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD343AC0, &type metadata for Feature.AppleAccountFeatureFlags);
    atomic_store(result, qword_1F03D5950);
  }
  return result;
}

id sub_1DD31A894()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1F03EA508);
  qword_1F03D5AE8 = (uint64_t)result;
  return result;
}

uint64_t *sub_1DD31A8E0()
{
  if (qword_1F03D5AE0 != -1)
    swift_once();
  return &qword_1F03D5AE8;
}

id static FamilyControlsAuthenticationUIService.agentInterface.getter()
{
  if (qword_1F03D5AE0 != -1)
    swift_once();
  return (id)qword_1F03D5AE8;
}

uint64_t static FamilyControlsAuthenticationUIService.connection(endpoint:)(void *a1)
{
  uint64_t (*v2)(void *);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  id v9;

  swift_beginAccess();
  v2 = (uint64_t (*)(void *))off_1F03D3F30;
  swift_retain();
  v3 = v2(a1);
  v5 = v4;
  swift_release();
  ObjectType = swift_getObjectType();
  if (qword_1F03D5AE0 != -1)
    swift_once();
  v7 = qword_1F03D5AE8;
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 72);
  v9 = (id)qword_1F03D5AE8;
  v8(v7, ObjectType, v5);
  return v3;
}

uint64_t (**sub_1DD31AA34())()
{
  return &off_1F03D3F30;
}

uint64_t sub_1DD31AA40(void *a1)
{
  type metadata accessor for XPCConnection();
  return XPCConnection.__allocating_init(listenerEndpoint:)(a1);
}

uint64_t (*static FamilyControlsAuthenticationUIService.underlyingConnection.getter())()
{
  uint64_t (*v0)();

  swift_beginAccess();
  v0 = off_1F03D3F30;
  swift_retain();
  return v0;
}

uint64_t static FamilyControlsAuthenticationUIService.underlyingConnection.setter(uint64_t (*a1)(), uint64_t a2)
{
  swift_beginAccess();
  off_1F03D3F30 = a1;
  qword_1F03D3F38 = a2;
  return swift_release();
}

uint64_t (*static FamilyControlsAuthenticationUIService.underlyingConnection.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_1DD31AB60()
{
  return &unk_1EA71BB28;
}

unint64_t static FamilyControlsAuthenticationUIService.ServiceTypeKey.getter()
{
  return 0xD00000000000001ELL;
}

void *sub_1DD31AB88()
{
  return &unk_1EA71BB38;
}

unint64_t static FamilyControlsAuthenticationUIService.ServiceBundleIdentifierKey.getter()
{
  return 0xD00000000000002ALL;
}

void *sub_1DD31ABB0()
{
  return &unk_1EA71BB48;
}

unint64_t static FamilyControlsAuthenticationUIService.ServiceMemberKey.getter()
{
  return 0xD000000000000020;
}

uint64_t FamilyControlsAuthenticationUIService.ServiceType.init(member:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  if (!result)
  {
    v2 = 0;
LABEL_5:
    *a2 = v2;
    return result;
  }
  if (result == 1)
  {
    v2 = 1;
    goto LABEL_5;
  }
  result = sub_1DD342B40();
  __break(1u);
  return result;
}

uint64_t FamilyControlsAuthenticationUIService.ServiceType.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1DD31AC68 + 4 * byte_1DD343B50[*v0]))(0xD000000000000022, 0x80000001DD347A90);
}

uint64_t sub_1DD31AC68@<X0>(uint64_t a1@<X8>)
{
  return a1 + 14;
}

FamilyControls::FamilyControlsAuthenticationUIService::ServiceType_optional __swiftcall FamilyControlsAuthenticationUIService.ServiceType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (FamilyControls::FamilyControlsAuthenticationUIService::ServiceType_optional)rawValue;
}

uint64_t FamilyControlsAuthenticationUIService.ServiceType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

FamilyControls::FamilyControlsAuthenticationUIService::ServiceType_optional sub_1DD31ACC8(Swift::Int *a1)
{
  return FamilyControlsAuthenticationUIService.ServiceType.init(rawValue:)(*a1);
}

uint64_t sub_1DD31ACD0()
{
  sub_1DD31AF7C();
  return sub_1DD342804();
}

uint64_t sub_1DD31AD2C()
{
  sub_1DD31AF7C();
  return sub_1DD3427F8();
}

uint64_t FamilyControlsAuthenticationUIService.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FamilyControlsAuthenticationUIService.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1DD31AD94()
{
  return swift_allocObject();
}

uint64_t sub_1DD31ADA4()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_1DD31ADB0()
{
  unint64_t result;

  result = qword_1F03D3F40;
  if (!qword_1F03D3F40)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsAuthenticationUIService.ServiceType, &type metadata for FamilyControlsAuthenticationUIService.ServiceType);
    atomic_store(result, (unint64_t *)&qword_1F03D3F40);
  }
  return result;
}

uint64_t type metadata accessor for FamilyControlsAuthenticationUIService()
{
  return objc_opt_self();
}

uint64_t method lookup function for FamilyControlsAuthenticationUIService()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for FamilyControlsAuthenticationUIService.ServiceType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyControlsAuthenticationUIService.ServiceType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1DD31AEFC + 4 * byte_1DD343B59[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1DD31AF30 + 4 * byte_1DD343B54[v4]))();
}

uint64_t sub_1DD31AF30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD31AF38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD31AF40);
  return result;
}

uint64_t sub_1DD31AF4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD31AF54);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1DD31AF58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD31AF60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType()
{
  return &type metadata for FamilyControlsAuthenticationUIService.ServiceType;
}

unint64_t sub_1DD31AF7C()
{
  unint64_t result;

  result = qword_1F03D3FE0;
  if (!qword_1F03D3FE0)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsAuthenticationUIService.ServiceType, &type metadata for FamilyControlsAuthenticationUIService.ServiceType);
    atomic_store(result, (unint64_t *)&qword_1F03D3FE0);
  }
  return result;
}

uint64_t AuthorizationStatus.description.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6465696E6544;
  if (*v0 != 1)
    v1 = 0x6465766F72707041;
  if (*v0)
    return v1;
  else
    return 0x6574654420746F4ELL;
}

FamilyControls::AuthorizationStatus_optional __swiftcall AuthorizationStatus.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (FamilyControls::AuthorizationStatus_optional)rawValue;
}

uint64_t AuthorizationStatus.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t sub_1DD31B044()
{
  unint64_t result;

  result = qword_1F03D3FE8;
  if (!qword_1F03D3FE8)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for AuthorizationStatus, &type metadata for AuthorizationStatus);
    atomic_store(result, (unint64_t *)&qword_1F03D3FE8);
  }
  return result;
}

FamilyControls::AuthorizationStatus_optional sub_1DD31B088(Swift::Int *a1)
{
  return AuthorizationStatus.init(rawValue:)(*a1);
}

uint64_t sub_1DD31B090()
{
  sub_1DD312D3C();
  return sub_1DD342804();
}

uint64_t sub_1DD31B0EC()
{
  sub_1DD312D3C();
  return sub_1DD3427F8();
}

uint64_t sub_1DD31B138()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6465696E6544;
  if (*v0 != 1)
    v1 = 0x6465766F72707041;
  if (*v0)
    return v1;
  else
    return 0x6574654420746F4ELL;
}

uint64_t storeEnumTagSinglePayload for AuthorizationStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DD31B1E8 + 4 * byte_1DD343CF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DD31B21C + 4 * byte_1DD343CF0[v4]))();
}

uint64_t sub_1DD31B21C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD31B224(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD31B22CLL);
  return result;
}

uint64_t sub_1DD31B238(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD31B240);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DD31B244(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD31B24C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationStatus()
{
  return &type metadata for AuthorizationStatus;
}

uint64_t Label<>.init(_:)(uint64_t a1)
{
  return sub_1DD31B4DC(a1, (uint64_t)sub_1DD31B284, (uint64_t)sub_1DD31B2D4, &qword_1F03D4880);
}

{
  return sub_1DD31B4DC(a1, (uint64_t)sub_1DD31B3C0, (uint64_t)sub_1DD31B440, (uint64_t *)&unk_1F03D4870);
}

{
  return sub_1DD31B4DC(a1, (uint64_t)sub_1DD31B5D8, (uint64_t)sub_1DD31B5E8, &qword_1F03D4000);
}

uint64_t sub_1DD31B284@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD31B3D0(&qword_1F03D4880, a1);
}

uint64_t sub_1DD31B294@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t result;

  sub_1DD320CF0(a1, a3, type metadata accessor for FamilyActivity);
  result = type metadata accessor for FamilyActivityTitleView(0);
  *(_BYTE *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t sub_1DD31B2D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD31B450(&qword_1F03D4880, a1);
}

uint64_t type metadata accessor for FamilyActivityTitleView(uint64_t a1)
{
  return sub_1DD31B320(a1, (uint64_t *)&unk_1F03D62B0);
}

uint64_t type metadata accessor for FamilyActivityIconView(uint64_t a1)
{
  return sub_1DD31B320(a1, qword_1F03D62C0);
}

uint64_t type metadata accessor for FamilyActivity(uint64_t a1)
{
  return sub_1DD31B320(a1, (uint64_t *)&unk_1F03D62A0);
}

uint64_t sub_1DD31B320(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DD31B354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = *(int *)(type metadata accessor for FamilyActivityIconView(0) + 20);
  result = sub_1DD320CF0(a1, a3, type metadata accessor for FamilyActivity);
  *(_QWORD *)(a3 + v6) = a2;
  return result;
}

uint64_t sub_1DD31B3C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD31B3D0((uint64_t *)&unk_1F03D4870, a1);
}

uint64_t sub_1DD31B3D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
  type metadata accessor for FamilyActivity(0);
  swift_storeEnumTagMultiPayload();
  result = type metadata accessor for FamilyActivityTitleView(0);
  *(_BYTE *)(a2 + *(int *)(result + 20)) = 0;
  return result;
}

uint64_t sub_1DD31B440@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD31B450((uint64_t *)&unk_1F03D4870, a1);
}

uint64_t sub_1DD31B450@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
  type metadata accessor for FamilyActivity(0);
  swift_storeEnumTagMultiPayload();
  result = type metadata accessor for FamilyActivityIconView(0);
  *(_QWORD *)(a2 + *(int *)(result + 20)) = 0;
  return result;
}

uint64_t sub_1DD31B4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  type metadata accessor for FamilyActivityTitleView(0);
  type metadata accessor for FamilyActivityIconView(0);
  sub_1DD3150D4(&qword_1F03D3FF0, type metadata accessor for FamilyActivityTitleView, (uint64_t)&protocol conformance descriptor for FamilyActivityTitleView);
  sub_1DD3150D4(&qword_1F03D3FF8, type metadata accessor for FamilyActivityIconView, (uint64_t)&protocol conformance descriptor for FamilyActivityIconView);
  sub_1DD3426B4();
  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
}

uint64_t sub_1DD31B5D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD31B3D0(&qword_1F03D4000, a1);
}

uint64_t sub_1DD31B5E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD31B450(&qword_1F03D4000, a1);
}

uint64_t Label<>.init(bundleIdentifier:)()
{
  type metadata accessor for FamilyActivityTitleView(0);
  type metadata accessor for FamilyActivityIconView(0);
  sub_1DD3150D4(&qword_1F03D3FF0, type metadata accessor for FamilyActivityTitleView, (uint64_t)&protocol conformance descriptor for FamilyActivityTitleView);
  sub_1DD3150D4(&qword_1F03D3FF8, type metadata accessor for FamilyActivityIconView, (uint64_t)&protocol conformance descriptor for FamilyActivityIconView);
  sub_1DD3426B4();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t Label<>.init(bundleIdentifier:inProcess:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v4 = a1;
  if ((a3 & 1) != 0)
  {
    v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)*sub_1DD313D64() + 168);
    swift_retain();
    v5(v4, a2);
    a1 = swift_release();
  }
  v6 = MEMORY[0x1E0C80A78](a1);
  MEMORY[0x1E0C80A78](v6);
  type metadata accessor for FamilyActivityTitleView(0);
  type metadata accessor for FamilyActivityIconView(0);
  sub_1DD3150D4(&qword_1F03D3FF0, type metadata accessor for FamilyActivityTitleView, (uint64_t)&protocol conformance descriptor for FamilyActivityTitleView);
  sub_1DD3150D4(&qword_1F03D3FF8, type metadata accessor for FamilyActivityIconView, (uint64_t)&protocol conformance descriptor for FamilyActivityIconView);
  sub_1DD3426B4();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1DD31B86C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v23 = a5;
  v9 = type metadata accessor for FamilyActivity(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = type metadata accessor for FamilyActivityTitleView(0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a1;
  if (v15
    && (v16 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 168),
        v17 = swift_retain(),
        v18 = v16(v17),
        v20 = v19,
        swift_release(),
        v20))
  {
    a2 = v18;
    a3 = v20;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  *v11 = a2;
  v11[1] = a3;
  swift_storeEnumTagMultiPayload();
  sub_1DD320CF0((uint64_t)v11, (uint64_t)v14, type metadata accessor for FamilyActivity);
  v14[*(int *)(v12 + 20)] = a4 & 1;
  return sub_1DD320CF0((uint64_t)v14, v23, type metadata accessor for FamilyActivityTitleView);
}

uint64_t sub_1DD31B9C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DD31B86C(*(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_BYTE *)(v1 + 40), a1);
}

uint64_t sub_1DD31B9D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v6;

  *a4 = a1;
  a4[1] = a2;
  type metadata accessor for FamilyActivity(0);
  swift_storeEnumTagMultiPayload();
  v6 = *a3;
  *(_QWORD *)((char *)a4 + *(int *)(type metadata accessor for FamilyActivityIconView(0) + 20)) = v6;
  swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DD31BA3C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1DD31B9D4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t **)(v1 + 32), a1);
}

uint64_t Label<>.init(webDomain:)()
{
  type metadata accessor for FamilyActivityTitleView(0);
  type metadata accessor for FamilyActivityIconView(0);
  sub_1DD3150D4(&qword_1F03D3FF0, type metadata accessor for FamilyActivityTitleView, (uint64_t)&protocol conformance descriptor for FamilyActivityTitleView);
  sub_1DD3150D4(&qword_1F03D3FF8, type metadata accessor for FamilyActivityIconView, (uint64_t)&protocol conformance descriptor for FamilyActivityIconView);
  sub_1DD3426B4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD31BB1C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  *a1 = v3;
  a1[1] = v4;
  type metadata accessor for FamilyActivity(0);
  swift_storeEnumTagMultiPayload();
  *((_BYTE *)a1 + *(int *)(type metadata accessor for FamilyActivityTitleView(0) + 20)) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DD31BB6C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  *a1 = v3;
  a1[1] = v4;
  type metadata accessor for FamilyActivity(0);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)((char *)a1 + *(int *)(type metadata accessor for FamilyActivityIconView(0) + 20)) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DD31BBBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FamilyActivity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1DD31BC00())()
{
  return nullsub_1;
}

uint64_t sub_1DD31BC10()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FamilyActivityTitleView(0) + 20));
}

uint64_t sub_1DD31BC30(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for FamilyActivityTitleView(0);
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*sub_1DD31BC5C())()
{
  type metadata accessor for FamilyActivityTitleView(0);
  return nullsub_1;
}

uint64_t FamilyActivityTitleView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t (*v20)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v44 = a1;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4008);
  MEMORY[0x1E0C80A78](v42);
  v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4010);
  MEMORY[0x1E0C80A78](v40);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4018);
  MEMORY[0x1E0C80A78](v43);
  v41 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = type metadata accessor for FamilyActivitySlot.Representable(0);
  MEMORY[0x1E0C80A78](v45);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4020);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4028);
  MEMORY[0x1E0C80A78](v39);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for FamilyActivity(0);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (uint64_t *)((char *)&v38 - v18);
  sub_1DD31C2EC(v1, (uint64_t)&v38 - v18, v20);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    v26 = v19[1];
    v46 = *v19;
    v47 = v26;
    sub_1DD31A10C();
    v27 = sub_1DD34263C();
    v29 = v28;
    *(_QWORD *)v5 = v27;
    *((_QWORD *)v5 + 1) = v28;
    v31 = v30 & 1;
    v5[16] = v30 & 1;
    *((_QWORD *)v5 + 3) = v32;
    swift_storeEnumTagMultiPayload();
    sub_1DD31C3F0(v27, v29, v31);
    sub_1DD31C330();
    swift_bridgeObjectRetain();
    v33 = MEMORY[0x1E0CDDD58];
    v34 = (uint64_t)v41;
    sub_1DD3425B8();
    sub_1DD320C6C(v34, (uint64_t)v3, &qword_1F03D4018);
    swift_storeEnumTagMultiPayload();
    sub_1DD31ECB8(&qword_1F03D4030, &qword_1F03D4018, (uint64_t (*)(void))sub_1DD31C330, v33);
    sub_1DD3150D4(&qword_1F03D4890, type metadata accessor for FamilyActivitySlot.Representable, (uint64_t)&unk_1DD345520);
    sub_1DD3425B8();
    sub_1DD31A090(v34, &qword_1F03D4018);
    sub_1DD31C400(v27, v29, v31);
    return swift_bridgeObjectRelease();
  }
  else if (EnumCaseMultiPayload == 3)
  {
    v22 = v19[1];
    if (*(_BYTE *)(v1 + *(int *)(type metadata accessor for FamilyActivityTitleView(0) + 20)) == 1)
    {
      v46 = *v19;
      v47 = v22;
      sub_1DD31A10C();
      *(_QWORD *)v11 = sub_1DD34263C();
      *((_QWORD *)v11 + 1) = v23;
      v11[16] = v24 & 1;
      *((_QWORD *)v11 + 3) = v25;
      swift_storeEnumTagMultiPayload();
      sub_1DD3150D4(&qword_1F03D4890, type metadata accessor for FamilyActivitySlot.Representable, (uint64_t)&unk_1DD345520);
      sub_1DD3425B8();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_1DD31C2EC(v1, (uint64_t)v17, type metadata accessor for FamilyActivity);
      sub_1DD33B5DC((uint64_t)v17, 1, (uint64_t)v8);
      sub_1DD31C2EC((uint64_t)v8, (uint64_t)v11, type metadata accessor for FamilyActivitySlot.Representable);
      swift_storeEnumTagMultiPayload();
      sub_1DD3150D4(&qword_1F03D4890, type metadata accessor for FamilyActivitySlot.Representable, (uint64_t)&unk_1DD345520);
      sub_1DD3425B8();
      sub_1DD31C3B4((uint64_t)v8, type metadata accessor for FamilyActivitySlot.Representable);
    }
    sub_1DD320C6C((uint64_t)v13, (uint64_t)v5, &qword_1F03D4028);
    swift_storeEnumTagMultiPayload();
    sub_1DD31C330();
    v36 = MEMORY[0x1E0CDDD58];
    v37 = (uint64_t)v41;
    sub_1DD3425B8();
    sub_1DD320C6C(v37, (uint64_t)v3, &qword_1F03D4018);
    swift_storeEnumTagMultiPayload();
    sub_1DD31ECB8(&qword_1F03D4030, &qword_1F03D4018, (uint64_t (*)(void))sub_1DD31C330, v36);
    sub_1DD3150D4(&qword_1F03D4890, type metadata accessor for FamilyActivitySlot.Representable, (uint64_t)&unk_1DD345520);
    sub_1DD3425B8();
    sub_1DD31A090(v37, &qword_1F03D4018);
    return sub_1DD31A090((uint64_t)v13, &qword_1F03D4028);
  }
  else
  {
    sub_1DD31C2EC(v1, (uint64_t)v17, type metadata accessor for FamilyActivity);
    sub_1DD33B5DC((uint64_t)v17, 1, (uint64_t)v8);
    sub_1DD31C2EC((uint64_t)v8, (uint64_t)v3, type metadata accessor for FamilyActivitySlot.Representable);
    swift_storeEnumTagMultiPayload();
    sub_1DD31ECB8(&qword_1F03D4030, &qword_1F03D4018, (uint64_t (*)(void))sub_1DD31C330, MEMORY[0x1E0CDDD58]);
    sub_1DD3150D4(&qword_1F03D4890, type metadata accessor for FamilyActivitySlot.Representable, (uint64_t)&unk_1DD345520);
    sub_1DD3425B8();
    sub_1DD31C3B4((uint64_t)v8, type metadata accessor for FamilyActivitySlot.Representable);
    return sub_1DD31C3B4((uint64_t)v19, type metadata accessor for FamilyActivity);
  }
}

uint64_t sub_1DD31C2EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1DD31C330()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1F03D4038;
  if (!qword_1F03D4038)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4028);
    v2 = sub_1DD3150D4(&qword_1F03D4890, type metadata accessor for FamilyActivitySlot.Representable, (uint64_t)&unk_1DD345520);
    v3[0] = MEMORY[0x1E0CDDD58];
    v3[1] = v2;
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1F03D4038);
  }
  return result;
}

uint64_t sub_1DD31C3B4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DD31C3F0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_1DD31C400(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_1DD31C41C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DD31C2EC(v1, a1, type metadata accessor for FamilyActivity);
}

uint64_t sub_1DD31C440(uint64_t a1)
{
  uint64_t v1;

  return sub_1DD31BBBC(a1, v1);
}

uint64_t sub_1DD31C448()
{
  return 0;
}

uint64_t sub_1DD31C450()
{
  type metadata accessor for FamilyActivityIconView(0);
  return swift_retain();
}

uint64_t sub_1DD31C470(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for FamilyActivityIconView(0) + 20);
  result = swift_release();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*sub_1DD31C4AC())()
{
  type metadata accessor for FamilyActivityIconView(0);
  return nullsub_1;
}

uint64_t sub_1DD31C4D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4040);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1F03D60F0 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v2, (uint64_t)qword_1F03D60F8);
  sub_1DD320C6C(v5, (uint64_t)v4, &qword_1F03D4040);
  sub_1DD31C598(a1);
  return sub_1DD31A090((uint64_t)v4, &qword_1F03D4040);
}

uint64_t sub_1DD31C598@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_1DD342510();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4330);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD320C6C(v2, (uint64_t)v10, &qword_1F03D4330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_1DD34245C();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_1DD3428B8();
    v14 = sub_1DD342630();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_1DD30EE20(0x686353726F6C6F43, 0xEB00000000656D65, &v18);
      _os_log_impl(&dword_1DD30C000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v16, -1, -1);
      MEMORY[0x1DF0D91B0](v15, -1, -1);
    }

    sub_1DD342504();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

double sub_1DD31C7AC(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  double v14;

  v4 = sub_1DD342510();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  swift_retain();
  v8 = sub_1DD3428B8();
  v9 = sub_1DD342630();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v14 = *(double *)&v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_1DD30EE20(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_1DD30C000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D91B0](v11, -1, -1);
    MEMORY[0x1DF0D91B0](v10, -1, -1);
  }

  sub_1DD342504();
  swift_getAtKeyPath();
  sub_1DD31EA98(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_1DD31C940()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4040);
  __swift_allocate_value_buffer(v0, qword_1F03D60F8);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_1F03D60F8);
  *v1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4330);
  return swift_storeEnumTagMultiPayload();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1DD31C9C8()
{
  return sub_1DD3424BC();
}

uint64_t sub_1DD31C9E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1DD34245C();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1DD3424C8();
}

uint64_t FamilyActivityIconView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t (*v26)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char *v41;
  __int128 v42;
  char *v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  char v61;

  v57 = a1;
  v2 = sub_1DD342690();
  v46 = *(_QWORD *)(v2 - 8);
  v47 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4048);
  MEMORY[0x1E0C80A78](v54);
  v56 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4050);
  MEMORY[0x1E0C80A78](v51);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4058);
  MEMORY[0x1E0C80A78](v55);
  v52 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4060);
  MEMORY[0x1E0C80A78](v48);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for FamilyActivitySlot.Representable(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4068);
  v14 = MEMORY[0x1E0C80A78](v53);
  v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v46 - v17;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4070);
  MEMORY[0x1E0C80A78](v50);
  v49 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for FamilyActivity(0);
  v21 = MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (uint64_t *)((char *)&v46 - v24);
  sub_1DD31C2EC(v1, (uint64_t)&v46 - v24, v26);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    sub_1DD31E7C0();
    swift_bridgeObjectRelease();
    v33 = v46;
    v32 = v47;
    (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v4, *MEMORY[0x1E0CDF6F8], v47);
    v34 = sub_1DD34269C();
    swift_release();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v32);
    sub_1DD342714();
    sub_1DD342480();
    v35 = v58;
    v36 = BYTE8(v58);
    v37 = v59;
    v38 = BYTE8(v59);
    *(_QWORD *)v7 = v34;
    *((_QWORD *)v7 + 1) = v35;
    v7[16] = v36;
    *((_QWORD *)v7 + 3) = v37;
    v7[32] = v38;
    *(_OWORD *)(v7 + 40) = v60;
    swift_storeEnumTagMultiPayload();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40A0);
    sub_1DD31D288();
    sub_1DD31D3E4();
    v39 = (uint64_t)v52;
    sub_1DD3425B8();
    sub_1DD320C6C(v39, v56, &qword_1F03D4058);
    swift_storeEnumTagMultiPayload();
    sub_1DD31D264();
    sub_1DD31D31C();
    sub_1DD3425B8();
    sub_1DD31A090(v39, &qword_1F03D4058);
    return swift_release();
  }
  else if (EnumCaseMultiPayload == 3)
  {
    v28 = v25[1];
    if (*(_QWORD *)(v1 + *(int *)(type metadata accessor for FamilyActivityIconView(0) + 20)))
    {
      v29 = *v25;
      swift_retain();
      sub_1DD31E610(v29, v28, (uint64_t)&v58);
      v30 = v59;
      *(_OWORD *)v10 = v58;
      *((_OWORD *)v10 + 1) = v30;
      *((_OWORD *)v10 + 2) = v60;
      v10[48] = v61;
      swift_storeEnumTagMultiPayload();
      sub_1DD31D31C();
      sub_1DD31D3A0();
      v31 = (uint64_t)v49;
      sub_1DD3425B8();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_1DD31C2EC(v1, (uint64_t)v23, type metadata accessor for FamilyActivity);
      sub_1DD33B5DC((uint64_t)v23, 0, (uint64_t)v13);
      sub_1DD342714();
      sub_1DD342480();
      sub_1DD31C2EC((uint64_t)v13, (uint64_t)v16, type metadata accessor for FamilyActivitySlot.Representable);
      v43 = &v16[*(int *)(v53 + 36)];
      v44 = v59;
      *(_OWORD *)v43 = v58;
      *((_OWORD *)v43 + 1) = v44;
      *((_OWORD *)v43 + 2) = v60;
      sub_1DD31C3B4((uint64_t)v13, type metadata accessor for FamilyActivitySlot.Representable);
      sub_1DD31EA00((uint64_t)v16, (uint64_t)v18, &qword_1F03D4068);
      sub_1DD320C6C((uint64_t)v18, (uint64_t)v10, &qword_1F03D4068);
      swift_storeEnumTagMultiPayload();
      sub_1DD31D31C();
      sub_1DD31D3A0();
      v31 = (uint64_t)v49;
      sub_1DD3425B8();
      sub_1DD31A090((uint64_t)v18, &qword_1F03D4068);
    }
    sub_1DD320C6C(v31, (uint64_t)v7, &qword_1F03D4070);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40A0);
    sub_1DD31D288();
    sub_1DD31D3E4();
    v45 = (uint64_t)v52;
    sub_1DD3425B8();
    sub_1DD320C6C(v45, v56, &qword_1F03D4058);
    swift_storeEnumTagMultiPayload();
    sub_1DD31D264();
    sub_1DD31D31C();
    sub_1DD3425B8();
    sub_1DD31A090(v45, &qword_1F03D4058);
    return sub_1DD31A090(v31, &qword_1F03D4070);
  }
  else
  {
    sub_1DD31C2EC(v1, (uint64_t)v23, type metadata accessor for FamilyActivity);
    sub_1DD33B5DC((uint64_t)v23, 0, (uint64_t)v13);
    sub_1DD342714();
    sub_1DD342480();
    sub_1DD31C2EC((uint64_t)v13, (uint64_t)v16, type metadata accessor for FamilyActivitySlot.Representable);
    v41 = &v16[*(int *)(v53 + 36)];
    v42 = v59;
    *(_OWORD *)v41 = v58;
    *((_OWORD *)v41 + 1) = v42;
    *((_OWORD *)v41 + 2) = v60;
    sub_1DD31C3B4((uint64_t)v13, type metadata accessor for FamilyActivitySlot.Representable);
    sub_1DD31EA00((uint64_t)v16, (uint64_t)v18, &qword_1F03D4068);
    sub_1DD320C6C((uint64_t)v18, v56, &qword_1F03D4068);
    swift_storeEnumTagMultiPayload();
    sub_1DD31D264();
    sub_1DD31D31C();
    sub_1DD3425B8();
    sub_1DD31A090((uint64_t)v18, &qword_1F03D4068);
    return sub_1DD31C3B4((uint64_t)v25, type metadata accessor for FamilyActivity);
  }
}

double sub_1DD31D21C@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  __int128 v4;
  double result;
  _OWORD v6[2];
  __int128 v7;
  char v8;

  sub_1DD31E610(a1, a2, (uint64_t)v6);
  v4 = v6[1];
  *(_OWORD *)a3 = v6[0];
  *(_OWORD *)(a3 + 16) = v4;
  result = *(double *)&v7;
  *(_OWORD *)(a3 + 32) = v7;
  *(_BYTE *)(a3 + 48) = v8;
  return result;
}

uint64_t sub_1DD31D264()
{
  return sub_1DD31D2AC(&qword_1F03D4078, &qword_1F03D4058, sub_1DD31D288, (uint64_t (*)(void))sub_1DD31D3E4);
}

uint64_t sub_1DD31D288()
{
  return sub_1DD31D2AC(&qword_1F03D4080, &qword_1F03D4070, (uint64_t (*)(void))sub_1DD31D31C, (uint64_t (*)(void))sub_1DD31D3A0);
}

uint64_t sub_1DD31D2AC(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CDB8A0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DD31D31C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F03D4088;
  if (!qword_1F03D4088)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4068);
    v2[0] = sub_1DD3150D4(&qword_1F03D4890, type metadata accessor for FamilyActivitySlot.Representable, (uint64_t)&unk_1DD345520);
    v2[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F03D4088);
  }
  return result;
}

unint64_t sub_1DD31D3A0()
{
  unint64_t result;

  result = qword_1F03D4090;
  if (!qword_1F03D4090)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD343F20, &type metadata for FamilyActivityIconView.ApplicationIcon);
    atomic_store(result, (unint64_t *)&qword_1F03D4090);
  }
  return result;
}

unint64_t sub_1DD31D3E4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F03D4098;
  if (!qword_1F03D4098)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D40A0);
    v2[0] = MEMORY[0x1E0CDF820];
    v2[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F03D4098);
  }
  return result;
}

uint64_t sub_1DD31D44C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD31D478()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40A8);
  sub_1DD3426C0();
  return v1;
}

uint64_t sub_1DD31D4B4()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40B0);
  sub_1DD3426CC();
  return v1;
}

uint64_t sub_1DD31D4F8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40B0);
  return sub_1DD3426D8();
}

void (*sub_1DD31D540(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _OWORD *v3;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[1] = *(_OWORD *)(v1 + 16);
  sub_1DD31EA00((uint64_t)v3 + 24, (uint64_t)(v3 + 2), &qword_1F03D40B8);
  sub_1DD31EA00((uint64_t)(v3 + 1), (uint64_t)v3 + 56, &qword_1F03D40A8);
  *v3 = v3[1];
  sub_1DD31EA44((uint64_t)v3 + 56);
  sub_1DD31EA44((uint64_t)(v3 + 2));
  *((_QWORD *)v3 + 8) = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40B0);
  sub_1DD3426CC();
  return sub_1DD31D5FC;
}

void sub_1DD31D5FC(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)a1 + 32;
  v2[6] = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_OWORD *)v2 = *((_OWORD *)v2 + 1);
  if ((a2 & 1) != 0)
  {
    swift_retain();
    sub_1DD3426D8();
    sub_1DD31EA6C((uint64_t)(v2 + 7));
    sub_1DD31EA6C(v3);
    swift_release();
  }
  else
  {
    sub_1DD3426D8();
    sub_1DD31EA6C((uint64_t)(v2 + 7));
    sub_1DD31EA6C(v3);
  }
  free(v2);
}

uint64_t sub_1DD31D69C()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40B0);
  sub_1DD3426E4();
  return v1;
}

id sub_1DD31D6E4()
{
  return objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x1E0D3A870]);
}

id sub_1DD31D728()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t sub_1DD31D730()
{
  return swift_getKeyPath();
}

uint64_t sub_1DD31D750@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DD3424E0();
  *a1 = v3;
  return result;
}

uint64_t sub_1DD31D778()
{
  return sub_1DD3424EC();
}

uint64_t sub_1DD31D7A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  _OWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55;
  _OWORD v56[3];
  uint64_t v57;
  char v58;
  uint64_t v59;
  unsigned __int8 v60;
  uint64_t v61;
  unsigned __int8 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[16];

  v2 = v1;
  v50 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C40);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v45 - v7;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40C0);
  v9 = *(_QWORD *)(v49 - 8);
  v10 = MEMORY[0x1E0C80A78](v49);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v45 - v13;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40C8);
  MEMORY[0x1E0C80A78](v47);
  v48 = (_OWORD *)((char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v46 = sub_1DD342690();
  v16 = *(_QWORD *)(v46 - 8);
  MEMORY[0x1E0C80A78](v46);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = *(_OWORD *)(v1 + 16);
  v56[0] = *(_OWORD *)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40B0);
  v19 = sub_1DD3426CC();
  if (v51
    && ((*(void (**)(_OWORD *__return_ptr, uint64_t))(*(_QWORD *)v51 + 120))(v56, v19),
        swift_release(),
        LOBYTE(v56[0]) != 3)
    && (LOBYTE(v51) = 1, sub_1DD31982C(), (sub_1DD342780() & 1) != 0))
  {
    v20 = objc_allocWithZone(MEMORY[0x1E0D3A820]);
    swift_bridgeObjectRetain();
    v21 = (void *)sub_1DD34278C();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v20, sel_initWithBundleIdentifier_, v21);

    v23 = objc_msgSend(v22, sel_prepareImageForDescriptor_, *(_QWORD *)(v2 + 32));
    if (v23 && (v24 = objc_msgSend(v23, sel_CGImage), v23, v24))
    {
      objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3870]), sel_initWithCGImage_, v24);
      sub_1DD342678();
      v25 = v46;
      (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x1E0CDF6F8], v46);
      v26 = sub_1DD34269C();
      swift_release();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v25);
      sub_1DD342714();
      sub_1DD342480();
      v51 = v26;
      *(_QWORD *)&v52 = v59;
      *((_QWORD *)&v52 + 1) = v60;
      *(_QWORD *)&v53 = v61;
      *((_QWORD *)&v53 + 1) = v62;
      v54 = v63;
      v55 = 0;
      swift_retain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40A0);
      sub_1DD31D3E4();
      sub_1DD3425B8();
      swift_release_n();

    }
    else
    {
      v56[0] = v64;
      v36 = sub_1DD3426CC();
      if (!v51 || ((*(void (**)(uint64_t))(*(_QWORD *)v51 + 168))(v36), v38 = v37, swift_release(), !v38))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      v39 = sub_1DD31E7C0();
      swift_bridgeObjectRelease();
      v51 = v39;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40A0);
      sub_1DD31D3E4();
      sub_1DD3425B8();
    }
    v40 = v56[1];
    v41 = v56[2];
    v42 = v57;
    v43 = v58;
    v44 = v48;
    *v48 = v56[0];
    v44[1] = v40;
    v44[2] = v41;
    *((_QWORD *)v44 + 6) = v42;
    *((_BYTE *)v44 + 56) = v43;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4130);
    sub_1DD31ECB8(&qword_1F03D4138, &qword_1F03D4130, (uint64_t (*)(void))sub_1DD31D3E4, MEMORY[0x1E0CDF820]);
    sub_1DD31A0CC(qword_1F03D4140, &qword_1F03D40C0, MEMORY[0x1E0CD8308]);
    return sub_1DD3425B8();
  }
  else
  {
    v56[0] = v64;
    v27 = sub_1DD3426CC();
    if (v51)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v51 + 216))(v27);
      swift_release();
    }
    else
    {
      v28 = sub_1DD342258();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v8, 1, 1, v28);
    }
    sub_1DD31EA00((uint64_t)&v64 + 8, (uint64_t)&v59, &qword_1F03D40B8);
    sub_1DD31EA00((uint64_t)&v64, (uint64_t)v65, &qword_1F03D40A8);
    v56[0] = *(_OWORD *)v1;
    v29 = *(void **)(v1 + 32);
    v51 = *(_QWORD *)(v1 + 40);
    LOBYTE(v52) = *(_BYTE *)(v1 + 48);
    v30 = swift_allocObject();
    v31 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v30 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v30 + 32) = v31;
    *(_OWORD *)(v30 + 48) = *(_OWORD *)(v2 + 32);
    *(_BYTE *)(v30 + 64) = *(_BYTE *)(v2 + 48);
    sub_1DD320C6C((uint64_t)v8, (uint64_t)v6, &qword_1F03D3C40);
    v32 = (_QWORD *)swift_allocObject();
    v32[2] = sub_1DD31DFA4;
    v32[3] = 0;
    v32[4] = sub_1DD31EAA4;
    v32[5] = v30;
    sub_1DD31EAE4((uint64_t)v56);
    sub_1DD31EA44((uint64_t)v65);
    sub_1DD31EA44((uint64_t)&v59);
    v33 = v29;
    sub_1DD31EB0C((uint64_t)&v51);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40D0);
    sub_1DD31D2AC(&qword_1F03D40D8, &qword_1F03D40D0, (uint64_t (*)(void))sub_1DD31EB44, (uint64_t (*)(void))sub_1DD31EC34);
    sub_1DD342444();
    sub_1DD31A090((uint64_t)v8, &qword_1F03D3C40);
    v34 = v49;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v12, v49);
    (*(void (**)(_OWORD *, char *, uint64_t))(v9 + 16))(v48, v14, v34);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4130);
    sub_1DD31ECB8(&qword_1F03D4138, &qword_1F03D4130, (uint64_t (*)(void))sub_1DD31D3E4, MEMORY[0x1E0CDF820]);
    sub_1DD31A0CC(qword_1F03D4140, &qword_1F03D40C0, MEMORY[0x1E0CD8308]);
    sub_1DD3425B8();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v34);
  }
}

uint64_t sub_1DD31DFA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v23)(void);
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v29 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4108);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD3424B0();
  MEMORY[0x1E0C80A78](v4);
  v6 = (_OWORD *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_1DD342690();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40F8);
  MEMORY[0x1E0C80A78](v11);
  v13 = (uint64_t *)((char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0CDF6F8], v7);
  v14 = sub_1DD34269C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v15 = (char *)v6 + *(int *)(v4 + 20);
  v16 = *MEMORY[0x1E0CDB0C0];
  v17 = sub_1DD34251C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
  __asm { FMOV            V0.2D, #5.0 }
  *v6 = _Q0;
  v23 = MEMORY[0x1E0CDA088];
  sub_1DD31C2EC((uint64_t)v6, (uint64_t)v3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
  *(_WORD *)&v3[*(int *)(v1 + 36)] = 256;
  sub_1DD320C6C((uint64_t)v3, (uint64_t)v13 + *(int *)(v11 + 36), &qword_1F03D4108);
  *v13 = v14;
  swift_retain();
  sub_1DD31A090((uint64_t)v3, &qword_1F03D4108);
  sub_1DD31C3B4((uint64_t)v6, (uint64_t (*)(_QWORD))v23);
  swift_release();
  sub_1DD342714();
  sub_1DD342480();
  v24 = v29;
  sub_1DD320C6C((uint64_t)v13, v29, &qword_1F03D40F8);
  v25 = (_OWORD *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40E8) + 36));
  v26 = v31;
  *v25 = v30;
  v25[1] = v26;
  v25[2] = v32;
  return sub_1DD31A090((uint64_t)v13, &qword_1F03D40F8);
}

uint64_t sub_1DD31E240@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t (**v12)();
  id v13;
  uint64_t v15;
  char v16;
  __int128 v17;
  _BYTE v18[8];
  _BYTE v19[8];
  __int128 v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4128);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD342474();
  v8 = a1[1];
  v20 = *a1;
  v17 = v8;
  sub_1DD31EA00((uint64_t)&v17, (uint64_t)v19, &qword_1F03D40A8);
  sub_1DD31EA00((uint64_t)&v17 + 8, (uint64_t)v18, &qword_1F03D40B8);
  v9 = (void *)*((_QWORD *)a1 + 4);
  v15 = *((_QWORD *)a1 + 5);
  v16 = *((_BYTE *)a1 + 48);
  v10 = swift_allocObject();
  v11 = a1[1];
  *(_OWORD *)(v10 + 16) = *a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)(v10 + 48) = a1[2];
  *(_BYTE *)(v10 + 64) = *((_BYTE *)a1 + 48);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(a2, v7, v4);
  v12 = (uint64_t (**)())(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4118) + 36));
  *v12 = sub_1DD320AC0;
  v12[1] = (uint64_t (*)())v10;
  v12[2] = 0;
  v12[3] = 0;
  sub_1DD31EAE4((uint64_t)&v20);
  sub_1DD31EA44((uint64_t)v19);
  sub_1DD31EA44((uint64_t)v18);
  v13 = v9;
  sub_1DD31EB0C((uint64_t)&v15);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1DD31E3A8()
{
  return sub_1DD342660();
}

id sub_1DD31E3C4(void *a1)
{
  id result;
  uint64_t v3;

  result = objc_msgSend(a1, sel_CGImage);
  if (result)
  {
    objc_msgSend(a1, sel_scale);
    v3 = sub_1DD342684();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DD31E428@<X0>(void (*a1)(void)@<X1>, void (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD v17[2];
  void (*v18)(void);
  uint64_t v19;

  v17[1] = a3;
  v18 = a2;
  v19 = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4118);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4328);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40E8);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1DD3424A4())
  {
    a1();
    v14 = &qword_1F03D40E8;
    sub_1DD320C6C((uint64_t)v13, (uint64_t)v10, &qword_1F03D40E8);
    swift_storeEnumTagMultiPayload();
    sub_1DD31EB44();
    sub_1DD31EC34();
    sub_1DD3425B8();
    swift_release();
    v15 = (uint64_t)v13;
  }
  else
  {
    v18();
    v14 = &qword_1F03D4118;
    sub_1DD320C6C((uint64_t)v7, (uint64_t)v10, &qword_1F03D4118);
    swift_storeEnumTagMultiPayload();
    sub_1DD31EB44();
    sub_1DD31EC34();
    sub_1DD3425B8();
    v15 = (uint64_t)v7;
  }
  return sub_1DD31A090(v15, v14);
}

uint64_t sub_1DD31E610@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  id v6;
  uint64_t KeyPath;
  id v8;
  id v9;
  double v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40A8);
  sub_1DD3426C0();
  v6 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x1E0D3A870]);
  KeyPath = swift_getKeyPath();
  swift_retain();
  v8 = v6;
  swift_retain();
  sub_1DD3426C0();
  swift_retain_n();
  swift_retain_n();
  swift_release();
  swift_release();
  v9 = v8;
  swift_retain();
  swift_bridgeObjectRetain();
  v10 = sub_1DD31C7AC(KeyPath, 0);
  swift_release();

  swift_release();
  swift_release();
  objc_msgSend(v9, sel_setScale_, v10);
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  result = swift_release();
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = v12;
  *(_QWORD *)(a3 + 24) = v13;
  *(_QWORD *)(a3 + 32) = v9;
  *(_QWORD *)(a3 + 40) = KeyPath;
  *(_BYTE *)(a3 + 48) = 0;
  return result;
}

uint64_t sub_1DD31E7C0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v22;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4040);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1DD34245C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v22 - v8;
  if (qword_1F03D60F0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v0, (uint64_t)qword_1F03D60F8);
  sub_1DD320C6C(v10, (uint64_t)v2, &qword_1F03D4040);
  sub_1DD31C598((uint64_t)v9);
  sub_1DD31A090((uint64_t)v2, &qword_1F03D4040);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0CD86D0], v3);
  v11 = sub_1DD342450();
  v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, v3);
  v12(v9, v3);
  if ((v11 & 1) != 0)
    v13 = 3;
  else
    v13 = 2;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97518]), sel_initWithStyle_diameter_, v13, 29.0);
  v15 = v14;
  if (v14
    && (v16 = v14,
        v17 = (void *)sub_1DD34278C(),
        v18 = (void *)sub_1DD34278C(),
        v19 = objc_msgSend(v16, sel_monogramForPersonWithFirstName_lastName_, v17, v18),
        v16,
        v17,
        v18,
        v19))
  {
    v20 = sub_1DD342678();
    v15 = v16;
  }
  else
  {
    v20 = sub_1DD3426A8();
  }

  return v20;
}

uint64_t sub_1DD31EA00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DD31EA44(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_1DD31EA6C(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_1DD31EA98(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_1DD31EAA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DD31E240((__int128 *)(v1 + 16), a1);
}

uint64_t sub_1DD31EAAC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD31EAD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DD31E428(*(void (**)(void))(v1 + 16), *(void (**)(void))(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

uint64_t sub_1DD31EAE4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1DD31EB0C(uint64_t a1)
{
  sub_1DD31EB38(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

uint64_t sub_1DD31EB38(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

unint64_t sub_1DD31EB44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F03D40E0;
  if (!qword_1F03D40E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D40E8);
    v2[0] = sub_1DD31EBB0();
    v2[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F03D40E0);
  }
  return result;
}

unint64_t sub_1DD31EBB0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1F03D40F0;
  if (!qword_1F03D40F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D40F8);
    v2 = sub_1DD31A0CC(&qword_1F03D4100, &qword_1F03D4108, MEMORY[0x1E0CD89F0]);
    v3[0] = MEMORY[0x1E0CDF820];
    v3[1] = v2;
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1F03D40F0);
  }
  return result;
}

unint64_t sub_1DD31EC34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F03D4110;
  if (!qword_1F03D4110)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4118);
    v2[0] = sub_1DD31A0CC(&qword_1F03D4120, &qword_1F03D4128, MEMORY[0x1E0CD8B78]);
    v2[1] = MEMORY[0x1E0CDC8B0];
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F03D4110);
  }
  return result;
}

uint64_t sub_1DD31ECB8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CDB8A0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DD31ED20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DD31ED30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DD31ED40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DD31ED50(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_1DD31EDA0 + 4 * byte_1DD343E60[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t sub_1DD31EEA8(uint64_t a1)
{
  uint64_t result;
  uint64_t *v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = &qword_1F03D4880;
      goto LABEL_6;
    case 1:
      v3 = (uint64_t *)&unk_1F03D4870;
      goto LABEL_6;
    case 2:
      v3 = &qword_1F03D4000;
LABEL_6:
      v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
      break;
    case 3:
    case 4:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void sub_1DD31EF3C()
{
  char *v0;

  v0 = (char *)sub_1DD31EF80 + 4 * byte_1DD343E6A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1DD31EF80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t sub_1DD31F068(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_1DD31C3B4(result, type metadata accessor for FamilyActivity);
    v2 = (char *)&loc_1DD31F0C4 + 4 * byte_1DD343E6F[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void *sub_1DD31F1BC(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1DD31F2C8(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_1DD31C3B4((uint64_t)a1, type metadata accessor for FamilyActivity);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1DD31F3EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_1DD31F3F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1DD31F408()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_1DD31F418()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1DD31F4F0(319, &qword_1F03D41B8, (void (*)(uint64_t))MEMORY[0x1E0CC1448]);
  if (v0 <= 0x3F)
  {
    sub_1DD31F4F0(319, &qword_1F03D41C0, (void (*)(uint64_t))MEMORY[0x1E0CC1498]);
    if (v1 <= 0x3F)
    {
      sub_1DD31F4F0(319, qword_1F03D41C8, (void (*)(uint64_t))MEMORY[0x1E0CC1528]);
      if (v2 <= 0x3F)
        swift_initEnumMetadataMultiPayload();
    }
  }
}

void sub_1DD31F4F0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1DD342378();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for FamilyActivityTitleView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    type metadata accessor for FamilyActivity(0);
    v5 = (char *)&loc_1DD31F598 + 4 * byte_1DD343E74[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for FamilyActivityTitleView(uint64_t a1)
{
  uint64_t result;
  uint64_t *v3;
  uint64_t v4;

  type metadata accessor for FamilyActivity(0);
  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = &qword_1F03D4880;
      goto LABEL_6;
    case 1:
      v3 = (uint64_t *)&unk_1F03D4870;
      goto LABEL_6;
    case 2:
      v3 = &qword_1F03D4000;
LABEL_6:
      v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
      break;
    case 3:
    case 4:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for FamilyActivityTitleView()
{
  char *v0;

  type metadata accessor for FamilyActivity(0);
  v0 = (char *)sub_1DD31F7A0 + 4 * byte_1DD343E7E[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1DD31F7A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v0, v1, v3);
  swift_storeEnumTagMultiPayload();
  *(_BYTE *)(v0 + *(int *)(v2 + 20)) = *(_BYTE *)(v1 + *(int *)(v2 + 20));
  return v0;
}

uint64_t assignWithCopy for FamilyActivityTitleView(uint64_t result, uint64_t a2, uint64_t a3)
{
  char *v3;

  if (result != a2)
  {
    sub_1DD31C3B4(result, type metadata accessor for FamilyActivity);
    type metadata accessor for FamilyActivity(0);
    v3 = (char *)&loc_1DD31F8FC + 4 * byte_1DD343E83[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  *(_BYTE *)(result + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return result;
}

void *initializeWithTake for FamilyActivityTitleView(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for FamilyActivity(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithTake for FamilyActivityTitleView(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_1DD31C3B4((uint64_t)a1, type metadata accessor for FamilyActivity);
    v6 = type metadata accessor for FamilyActivity(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilyActivityTitleView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD31FC6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for FamilyActivity(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FamilyActivityTitleView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD31FD04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for FamilyActivity(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t sub_1DD31FD7C()
{
  return sub_1DD3205EC();
}

uint64_t initializeBufferWithCopyOfBuffer for FamilyActivityIconView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    type metadata accessor for FamilyActivity(0);
    v5 = (char *)&loc_1DD31FDE4 + 4 * byte_1DD343E88[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for FamilyActivityIconView(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;

  type metadata accessor for FamilyActivity(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v2 = &qword_1F03D4880;
      goto LABEL_6;
    case 1u:
      v2 = (uint64_t *)&unk_1F03D4870;
      goto LABEL_6;
    case 2u:
      v2 = &qword_1F03D4000;
LABEL_6:
      v3 = __swift_instantiateConcreteTypeFromMangledName(v2);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    case 3u:
    case 4u:
      swift_bridgeObjectRelease();
      break;
    default:
      return swift_release();
  }
  return swift_release();
}

void initializeWithCopy for FamilyActivityIconView()
{
  char *v0;

  type metadata accessor for FamilyActivity(0);
  v0 = (char *)sub_1DD31FFEC + 4 * byte_1DD343E92[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1DD31FFEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v0, v1, v3);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(v0 + *(int *)(v2 + 20)) = *(_QWORD *)(v1 + *(int *)(v2 + 20));
  swift_retain();
  return v0;
}

uint64_t assignWithCopy for FamilyActivityIconView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v4;

  if (a1 != a2)
  {
    sub_1DD31C3B4(a1, type metadata accessor for FamilyActivity);
    type metadata accessor for FamilyActivity(0);
    v4 = (char *)&loc_1DD32014C + 4 * byte_1DD343E97[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for FamilyActivityIconView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for FamilyActivity(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for FamilyActivityIconView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_1DD31C3B4((uint64_t)a1, type metadata accessor for FamilyActivity);
    v6 = type metadata accessor for FamilyActivity(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilyActivityIconView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD3204D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for FamilyActivity(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyActivityIconView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD320568(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for FamilyActivity(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t sub_1DD3205E0()
{
  return sub_1DD3205EC();
}

uint64_t sub_1DD3205EC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for FamilyActivity(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FamilyActivityIconView.ApplicationIcon(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FamilyActivityIconView.ApplicationIcon(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return sub_1DD31EA98(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for FamilyActivityIconView.ApplicationIcon(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v6 = *(void **)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v8 = v6;
  sub_1DD31EB38(v5, v7);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = v7;
  return a1;
}

uint64_t assignWithCopy for FamilyActivityIconView.ApplicationIcon(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = v2[2];
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = v2[3];
  swift_retain();
  swift_release();
  v4 = (void *)v2[4];
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v6 = v4;

  v7 = v2[5];
  LOBYTE(v2) = *((_BYTE *)v2 + 48);
  sub_1DD31EB38(v7, (char)v2);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = (_BYTE)v2;
  sub_1DD31EA98(v8, v9);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FamilyActivityIconView.ApplicationIcon(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  v5 = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = v5;
  sub_1DD31EA98(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilyActivityIconView.ApplicationIcon(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyActivityIconView.ApplicationIcon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FamilyActivityIconView.ApplicationIcon()
{
  return &type metadata for FamilyActivityIconView.ApplicationIcon;
}

unint64_t sub_1DD32093C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F03D42F8;
  if (!qword_1F03D42F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4300);
    v2[0] = sub_1DD31ECB8(&qword_1F03D4030, &qword_1F03D4018, (uint64_t (*)(void))sub_1DD31C330, MEMORY[0x1E0CDDD58]);
    v2[1] = sub_1DD3150D4(&qword_1F03D4890, type metadata accessor for FamilyActivitySlot.Representable, (uint64_t)&unk_1DD345520);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F03D42F8);
  }
  return result;
}

uint64_t sub_1DD3209E0()
{
  return sub_1DD31D2AC(&qword_1F03D4308, &qword_1F03D4310, sub_1DD31D264, (uint64_t (*)(void))sub_1DD31D31C);
}

unint64_t sub_1DD320A18()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F03D4318;
  if (!qword_1F03D4318)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4320);
    v2[0] = sub_1DD31ECB8(&qword_1F03D4138, &qword_1F03D4130, (uint64_t (*)(void))sub_1DD31D3E4, MEMORY[0x1E0CDF820]);
    v2[1] = sub_1DD31A0CC(qword_1F03D4140, &qword_1F03D40C0, MEMORY[0x1E0CD8308]);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F03D4318);
  }
  return result;
}

uint64_t sub_1DD320AC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  void (*v6)(uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  void *v7;
  id v8;
  uint64_t v10;
  char v11;
  __int128 v12;
  _BYTE v13[8];
  _BYTE v14[8];

  v1 = *sub_1DD313D64();
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = swift_allocObject();
  v5 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v4 + 32) = v5;
  *(_OWORD *)(v4 + 48) = *(_OWORD *)(v0 + 48);
  *(_BYTE *)(v4 + 64) = *(_BYTE *)(v0 + 64);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(), uint64_t))(*(_QWORD *)v1 + 176);
  v12 = v5;
  sub_1DD31EA00((uint64_t)&v12, (uint64_t)v14, &qword_1F03D40A8);
  sub_1DD31EA00((uint64_t)&v12 + 8, (uint64_t)v13, &qword_1F03D40B8);
  v7 = *(void **)(v0 + 48);
  v10 = *(_QWORD *)(v0 + 56);
  v11 = *(_BYTE *)(v0 + 64);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1DD31EA44((uint64_t)v14);
  sub_1DD31EA44((uint64_t)v13);
  v8 = v7;
  sub_1DD31EB0C((uint64_t)&v10);
  v6(v2, v3, sub_1DD320C20, v4);
  swift_release();
  return swift_release();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  sub_1DD31EA98(*(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  return swift_deallocObject();
}

uint64_t sub_1DD320C20()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D40B0);
  return sub_1DD3426D8();
}

uint64_t sub_1DD320C6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_1DD320CF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t FamilyActivitySelection.includeEntireCategory.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t FamilyActivitySelection.applicationTokens.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FamilyActivitySelection.applicationTokens.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*FamilyActivitySelection.applicationTokens.modify())()
{
  return nullsub_1;
}

uint64_t FamilyActivitySelection.categoryTokens.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FamilyActivitySelection.categoryTokens.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*FamilyActivitySelection.categoryTokens.modify())()
{
  return nullsub_1;
}

uint64_t FamilyActivitySelection.webDomainTokens.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FamilyActivitySelection.webDomainTokens.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*FamilyActivitySelection.webDomainTokens.modify())()
{
  return nullsub_1;
}

uint64_t FamilyActivitySelection.applications.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t result;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = sub_1DD342330();
  v31 = *(_QWORD *)(v1 - 8);
  v32 = v1;
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v29 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v29 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v29 - v15;
  v33 = *(_QWORD *)(v0 + 8);
  v34 = MEMORY[0x1E0DEE9E8];
  v17 = *(_QWORD *)(v33 + 56);
  v29 = v33 + 56;
  v18 = 1 << *(_BYTE *)(v33 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & v17;
  v30 = (unint64_t)(v18 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v22 = 0;
  while (1)
  {
    if (v20)
    {
      v23 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v24 = v23 | (v22 << 6);
      goto LABEL_5;
    }
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v30)
      goto LABEL_25;
    v27 = *(_QWORD *)(v29 + 8 * v26);
    ++v22;
    if (!v27)
    {
      v22 = v26 + 1;
      if (v26 + 1 >= v30)
        goto LABEL_25;
      v27 = *(_QWORD *)(v29 + 8 * v22);
      if (!v27)
      {
        v22 = v26 + 2;
        if (v26 + 2 >= v30)
          goto LABEL_25;
        v27 = *(_QWORD *)(v29 + 8 * v22);
        if (!v27)
        {
          v22 = v26 + 3;
          if (v26 + 3 >= v30)
            goto LABEL_25;
          v27 = *(_QWORD *)(v29 + 8 * v22);
          if (!v27)
          {
            v22 = v26 + 4;
            if (v26 + 4 >= v30)
              goto LABEL_25;
            v27 = *(_QWORD *)(v29 + 8 * v22);
            if (!v27)
              break;
          }
        }
      }
    }
LABEL_24:
    v20 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v22 << 6);
LABEL_5:
    v25 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
    v25(v16, *(_QWORD *)(v33 + 48) + *(_QWORD *)(v8 + 72) * v24, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v14, v16, v7);
    v25(v11, (unint64_t)v14, v7);
    sub_1DD342324();
    sub_1DD323CF0((uint64_t)v6, v4);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v32);
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v14, v7);
  }
  v28 = v26 + 5;
  if (v28 >= v30)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return v34;
  }
  v27 = *(_QWORD *)(v29 + 8 * v28);
  if (v27)
  {
    v22 = v28;
    goto LABEL_24;
  }
  while (1)
  {
    v22 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v22 >= v30)
      goto LABEL_25;
    v27 = *(_QWORD *)(v29 + 8 * v22);
    ++v28;
    if (v27)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t FamilyActivitySelection.categories.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t result;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = sub_1DD342354();
  v31 = *(_QWORD *)(v1 - 8);
  v32 = v1;
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v29 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v29 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v29 - v15;
  v33 = *(_QWORD *)(v0 + 16);
  v34 = MEMORY[0x1E0DEE9E8];
  v17 = *(_QWORD *)(v33 + 56);
  v29 = v33 + 56;
  v18 = 1 << *(_BYTE *)(v33 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & v17;
  v30 = (unint64_t)(v18 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v22 = 0;
  while (1)
  {
    if (v20)
    {
      v23 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v24 = v23 | (v22 << 6);
      goto LABEL_5;
    }
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v30)
      goto LABEL_25;
    v27 = *(_QWORD *)(v29 + 8 * v26);
    ++v22;
    if (!v27)
    {
      v22 = v26 + 1;
      if (v26 + 1 >= v30)
        goto LABEL_25;
      v27 = *(_QWORD *)(v29 + 8 * v22);
      if (!v27)
      {
        v22 = v26 + 2;
        if (v26 + 2 >= v30)
          goto LABEL_25;
        v27 = *(_QWORD *)(v29 + 8 * v22);
        if (!v27)
        {
          v22 = v26 + 3;
          if (v26 + 3 >= v30)
            goto LABEL_25;
          v27 = *(_QWORD *)(v29 + 8 * v22);
          if (!v27)
          {
            v22 = v26 + 4;
            if (v26 + 4 >= v30)
              goto LABEL_25;
            v27 = *(_QWORD *)(v29 + 8 * v22);
            if (!v27)
              break;
          }
        }
      }
    }
LABEL_24:
    v20 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v22 << 6);
LABEL_5:
    v25 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
    v25(v16, *(_QWORD *)(v33 + 48) + *(_QWORD *)(v8 + 72) * v24, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v14, v16, v7);
    v25(v11, (unint64_t)v14, v7);
    sub_1DD342348();
    sub_1DD323F4C((uint64_t)v6, v4);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v32);
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v14, v7);
  }
  v28 = v26 + 5;
  if (v28 >= v30)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return v34;
  }
  v27 = *(_QWORD *)(v29 + 8 * v28);
  if (v27)
  {
    v22 = v28;
    goto LABEL_24;
  }
  while (1)
  {
    v22 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v22 >= v30)
      goto LABEL_25;
    v27 = *(_QWORD *)(v29 + 8 * v22);
    ++v28;
    if (v27)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t FamilyActivitySelection.webDomains.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t result;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = sub_1DD34239C();
  v31 = *(_QWORD *)(v1 - 8);
  v32 = v1;
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v29 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v29 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v29 - v15;
  v33 = *(_QWORD *)(v0 + 24);
  v34 = MEMORY[0x1E0DEE9E8];
  v17 = *(_QWORD *)(v33 + 56);
  v29 = v33 + 56;
  v18 = 1 << *(_BYTE *)(v33 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & v17;
  v30 = (unint64_t)(v18 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v22 = 0;
  while (1)
  {
    if (v20)
    {
      v23 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v24 = v23 | (v22 << 6);
      goto LABEL_5;
    }
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v30)
      goto LABEL_25;
    v27 = *(_QWORD *)(v29 + 8 * v26);
    ++v22;
    if (!v27)
    {
      v22 = v26 + 1;
      if (v26 + 1 >= v30)
        goto LABEL_25;
      v27 = *(_QWORD *)(v29 + 8 * v22);
      if (!v27)
      {
        v22 = v26 + 2;
        if (v26 + 2 >= v30)
          goto LABEL_25;
        v27 = *(_QWORD *)(v29 + 8 * v22);
        if (!v27)
        {
          v22 = v26 + 3;
          if (v26 + 3 >= v30)
            goto LABEL_25;
          v27 = *(_QWORD *)(v29 + 8 * v22);
          if (!v27)
          {
            v22 = v26 + 4;
            if (v26 + 4 >= v30)
              goto LABEL_25;
            v27 = *(_QWORD *)(v29 + 8 * v22);
            if (!v27)
              break;
          }
        }
      }
    }
LABEL_24:
    v20 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v22 << 6);
LABEL_5:
    v25 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
    v25(v16, *(_QWORD *)(v33 + 48) + *(_QWORD *)(v8 + 72) * v24, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v14, v16, v7);
    v25(v11, (unint64_t)v14, v7);
    sub_1DD342384();
    sub_1DD3241A8((uint64_t)v6, v4);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v32);
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v14, v7);
  }
  v28 = v26 + 5;
  if (v28 >= v30)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return v34;
  }
  v27 = *(_QWORD *)(v29 + 8 * v28);
  if (v27)
  {
    v22 = v28;
    goto LABEL_24;
  }
  while (1)
  {
    v22 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v22 >= v30)
      goto LABEL_25;
    v27 = *(_QWORD *)(v29 + 8 * v22);
    ++v28;
    if (v27)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t FamilyActivitySelection.untokenizedApplicationIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FamilyActivitySelection.untokenizedApplicationIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*FamilyActivitySelection.untokenizedApplicationIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t FamilyActivitySelection.untokenizedCategoryIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FamilyActivitySelection.untokenizedCategoryIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t (*FamilyActivitySelection.untokenizedCategoryIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t FamilyActivitySelection.untokenizedWebDomainIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FamilyActivitySelection.untokenizedWebDomainIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*FamilyActivitySelection.untokenizedWebDomainIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t FamilyActivitySelection.untokenizedApplications.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = sub_1DD342330();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v19 - v6;
  v8 = *(_QWORD *)(v0 + 32);
  v9 = *(_QWORD *)(v8 + 56);
  v19 = v8 + 56;
  v20 = MEMORY[0x1E0DEE9E8];
  v10 = 1 << *(_BYTE *)(v8 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v9;
  v13 = (unint64_t)(v10 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v12 &= v12 - 1;
      goto LABEL_5;
    }
    v16 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v16 >= v13)
      goto LABEL_25;
    v17 = *(_QWORD *)(v19 + 8 * v16);
    ++v15;
    if (!v17)
    {
      v15 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_25;
      v17 = *(_QWORD *)(v19 + 8 * v15);
      if (!v17)
      {
        v15 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_25;
        v17 = *(_QWORD *)(v19 + 8 * v15);
        if (!v17)
        {
          v15 = v16 + 3;
          if (v16 + 3 >= v13)
            goto LABEL_25;
          v17 = *(_QWORD *)(v19 + 8 * v15);
          if (!v17)
          {
            v15 = v16 + 4;
            if (v16 + 4 >= v13)
              goto LABEL_25;
            v17 = *(_QWORD *)(v19 + 8 * v15);
            if (!v17)
              break;
          }
        }
      }
    }
LABEL_24:
    v12 = (v17 - 1) & v17;
LABEL_5:
    swift_bridgeObjectRetain_n();
    sub_1DD342318();
    sub_1DD323CF0((uint64_t)v7, v5);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    result = swift_bridgeObjectRelease();
  }
  v18 = v16 + 5;
  if (v18 >= v13)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return v20;
  }
  v17 = *(_QWORD *)(v19 + 8 * v18);
  if (v17)
  {
    v15 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    v15 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v15 >= v13)
      goto LABEL_25;
    v17 = *(_QWORD *)(v19 + 8 * v15);
    ++v18;
    if (v17)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t FamilyActivitySelection.untokenizedCategories.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = sub_1DD342354();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v19 - v6;
  v8 = *(_QWORD *)(v0 + 40);
  v9 = *(_QWORD *)(v8 + 56);
  v19 = v8 + 56;
  v20 = MEMORY[0x1E0DEE9E8];
  v10 = 1 << *(_BYTE *)(v8 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v9;
  v13 = (unint64_t)(v10 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v12 &= v12 - 1;
      goto LABEL_5;
    }
    v16 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v16 >= v13)
      goto LABEL_25;
    v17 = *(_QWORD *)(v19 + 8 * v16);
    ++v15;
    if (!v17)
    {
      v15 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_25;
      v17 = *(_QWORD *)(v19 + 8 * v15);
      if (!v17)
      {
        v15 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_25;
        v17 = *(_QWORD *)(v19 + 8 * v15);
        if (!v17)
        {
          v15 = v16 + 3;
          if (v16 + 3 >= v13)
            goto LABEL_25;
          v17 = *(_QWORD *)(v19 + 8 * v15);
          if (!v17)
          {
            v15 = v16 + 4;
            if (v16 + 4 >= v13)
              goto LABEL_25;
            v17 = *(_QWORD *)(v19 + 8 * v15);
            if (!v17)
              break;
          }
        }
      }
    }
LABEL_24:
    v12 = (v17 - 1) & v17;
LABEL_5:
    swift_bridgeObjectRetain_n();
    sub_1DD34233C();
    sub_1DD323F4C((uint64_t)v7, v5);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    result = swift_bridgeObjectRelease();
  }
  v18 = v16 + 5;
  if (v18 >= v13)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return v20;
  }
  v17 = *(_QWORD *)(v19 + 8 * v18);
  if (v17)
  {
    v15 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    v15 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v15 >= v13)
      goto LABEL_25;
    v17 = *(_QWORD *)(v19 + 8 * v15);
    ++v18;
    if (v17)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t FamilyActivitySelection.untokenizedWebDomains.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = sub_1DD34239C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v19 - v6;
  v8 = *(_QWORD *)(v0 + 48);
  v9 = *(_QWORD *)(v8 + 56);
  v19 = v8 + 56;
  v20 = MEMORY[0x1E0DEE9E8];
  v10 = 1 << *(_BYTE *)(v8 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v9;
  v13 = (unint64_t)(v10 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v12 &= v12 - 1;
      goto LABEL_5;
    }
    v16 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v16 >= v13)
      goto LABEL_25;
    v17 = *(_QWORD *)(v19 + 8 * v16);
    ++v15;
    if (!v17)
    {
      v15 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_25;
      v17 = *(_QWORD *)(v19 + 8 * v15);
      if (!v17)
      {
        v15 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_25;
        v17 = *(_QWORD *)(v19 + 8 * v15);
        if (!v17)
        {
          v15 = v16 + 3;
          if (v16 + 3 >= v13)
            goto LABEL_25;
          v17 = *(_QWORD *)(v19 + 8 * v15);
          if (!v17)
          {
            v15 = v16 + 4;
            if (v16 + 4 >= v13)
              goto LABEL_25;
            v17 = *(_QWORD *)(v19 + 8 * v15);
            if (!v17)
              break;
          }
        }
      }
    }
LABEL_24:
    v12 = (v17 - 1) & v17;
LABEL_5:
    swift_bridgeObjectRetain_n();
    sub_1DD342390();
    sub_1DD3241A8((uint64_t)v7, v5);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    result = swift_bridgeObjectRelease();
  }
  v18 = v16 + 5;
  if (v18 >= v13)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return v20;
  }
  v17 = *(_QWORD *)(v19 + 8 * v18);
  if (v17)
  {
    v15 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    v15 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v15 >= v13)
      goto LABEL_25;
    v17 = *(_QWORD *)(v19 + 8 * v15);
    ++v18;
    if (v17)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t FamilyActivitySelection.init(includeEntireCategory:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)a2 = result;
  v2 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(a2 + 8) = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(a2 + 16) = v2;
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = v2;
  *(_QWORD *)(a2 + 48) = v2;
  return result;
}

void FamilyActivitySelection.init()(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_BYTE *)a1 = 0;
  v1 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = v1;
  *(_QWORD *)(a1 + 32) = v1;
  *(_QWORD *)(a1 + 40) = v1;
  *(_QWORD *)(a1 + 48) = v1;
}

uint64_t sub_1DD321F04(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t i;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t *v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  unint64_t *v46;
  uint64_t *v47;
  uint64_t v48;

  v46 = a5;
  v47 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v48 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v37 - v13;
  result = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v37 - v16;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v18 = 0;
  v19 = *(_QWORD *)(a1 + 56);
  v40 = a4;
  v41 = a1 + 56;
  v20 = 1 << *(_BYTE *)(a1 + 32);
  if (v20 < 64)
    v21 = ~(-1 << v20);
  else
    v21 = -1;
  v22 = v21 & v19;
  v42 = (unint64_t)(v20 + 63) >> 6;
  v45 = a2 + 56;
  v38 = v17;
  v39 = a1;
  if (!v22)
    goto LABEL_9;
LABEL_7:
  v43 = (v22 - 1) & v22;
  v44 = v18;
  for (i = __clz(__rbit64(v22)) | (v18 << 6); ; i = __clz(__rbit64(v25)) + (v26 << 6))
  {
    v28 = v48;
    v29 = *(_QWORD *)(v48 + 72);
    v30 = *(void (**)(char *, unint64_t, uint64_t))(v48 + 16);
    v30(v17, *(_QWORD *)(a1 + 48) + v29 * i, v8);
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v14, v17, v8);
    sub_1DD31A0CC(a4, v47, MEMORY[0x1E0CC14E0]);
    v31 = sub_1DD342774();
    v32 = -1 << *(_BYTE *)(a2 + 32);
    v33 = v31 & ~v32;
    if (((*(_QWORD *)(v45 + ((v33 >> 3) & 0xFFFFFFFFFFFFF8)) >> v33) & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v48 + 8))(v14, v8);
      return 0;
    }
    v34 = ~v32;
    while (1)
    {
      v30(v11, *(_QWORD *)(a2 + 48) + v33 * v29, v8);
      sub_1DD31A0CC(v46, v47, MEMORY[0x1E0CC14E8]);
      v35 = sub_1DD342780();
      v36 = *(void (**)(char *, uint64_t))(v48 + 8);
      v36(v11, v8);
      if ((v35 & 1) != 0)
        break;
      v33 = (v33 + 1) & v34;
      if (((*(_QWORD *)(v45 + ((v33 >> 3) & 0xFFFFFFFFFFFFF8)) >> v33) & 1) == 0)
      {
        v36(v14, v8);
        return 0;
      }
    }
    result = ((uint64_t (*)(char *, uint64_t))v36)(v14, v8);
    a1 = v39;
    a4 = v40;
    v17 = v38;
    v22 = v43;
    v18 = v44;
    if (v43)
      goto LABEL_7;
LABEL_9:
    v24 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v24 >= v42)
      return 1;
    v25 = *(_QWORD *)(v41 + 8 * v24);
    v26 = v18 + 1;
    if (!v25)
    {
      v26 = v18 + 2;
      if (v18 + 2 >= v42)
        return 1;
      v25 = *(_QWORD *)(v41 + 8 * v26);
      if (!v25)
      {
        v26 = v18 + 3;
        if (v18 + 3 >= v42)
          return 1;
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          v26 = v18 + 4;
          if (v18 + 4 >= v42)
            return 1;
          v25 = *(_QWORD *)(v41 + 8 * v26);
          if (!v25)
            break;
        }
      }
    }
LABEL_24:
    v43 = (v25 - 1) & v25;
    v44 = v26;
  }
  v27 = v18 + 5;
  if (v18 + 5 >= v42)
    return 1;
  v25 = *(_QWORD *)(v41 + 8 * v27);
  if (v25)
  {
    v26 = v18 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v26 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v26 >= v42)
      return 1;
    v25 = *(_QWORD *)(v41 + 8 * v26);
    ++v27;
    if (v25)
      goto LABEL_24;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1DD32226C(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v30)
            return 1;
          v11 = *(_QWORD *)(v29 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_1DD342BB8();
    swift_bridgeObjectRetain();
    sub_1DD3427B0();
    v18 = sub_1DD342BD0();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_1DD342B34() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_1DD342B34() & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_1DD32250C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1DD322548 + 4 * byte_1DD3440A0[a1]))(0xD000000000000015, 0x80000001DD347B80);
}

unint64_t sub_1DD322548()
{
  return 0xD000000000000011;
}

uint64_t sub_1DD322564()
{
  return 0x79726F6765746163;
}

uint64_t sub_1DD322588()
{
  return 0x69616D6F44626577;
}

uint64_t sub_1DD3225AC()
{
  uint64_t v0;

  return v0 + 16;
}

uint64_t sub_1DD3225E4()
{
  unsigned __int8 *v0;

  return sub_1DD32250C(*v0);
}

uint64_t sub_1DD3225EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DD3273F0(a1, a2);
  *a3 = result;
  return result;
}

void sub_1DD322610(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_1DD32261C()
{
  sub_1DD325CB4();
  return sub_1DD342BF4();
}

uint64_t sub_1DD322644()
{
  sub_1DD325CB4();
  return sub_1DD342C00();
}

uint64_t FamilyActivitySelection.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4338);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = v1[1];
  v20 = v1[2];
  v21 = v7;
  v8 = v1[3];
  v18 = v1[4];
  v19 = v8;
  v9 = v1[6];
  v17 = v1[5];
  v10 = a1[3];
  v11 = a1;
  v12 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v11, v10);
  sub_1DD325CB4();
  v13 = v4;
  sub_1DD342BE8();
  LOBYTE(v23) = 0;
  sub_1DD342AF8();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v12, v4);
  v14 = v19;
  v15 = v20;
  v23 = v21;
  v22 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4340);
  sub_1DD325CF8();
  sub_1DD342B10();
  v23 = v15;
  v22 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4358);
  sub_1DD325D74();
  sub_1DD342B10();
  v23 = v14;
  v22 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4370);
  sub_1DD325DF0();
  sub_1DD342B10();
  v23 = v18;
  v22 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3F08);
  sub_1DD325FE0(&qword_1F03D4388, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEB3B8]);
  sub_1DD342B10();
  v23 = v17;
  v22 = 5;
  sub_1DD342B10();
  v23 = v9;
  v22 = 6;
  sub_1DD342B10();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v12, v13);
}

uint64_t FamilyActivitySelection.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4390);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD325CB4();
  sub_1DD342BDC();
  if (!v2)
  {
    LOBYTE(v30) = 0;
    v9 = sub_1DD342AB0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4340);
    v29 = 1;
    sub_1DD325E6C();
    sub_1DD342AC8();
    v11 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4358);
    v29 = 2;
    sub_1DD325EE8();
    swift_bridgeObjectRetain();
    sub_1DD342AC8();
    v28 = v11;
    v12 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4370);
    v29 = 3;
    sub_1DD325F64();
    swift_bridgeObjectRetain();
    sub_1DD342AC8();
    v27 = v12;
    v13 = v30;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3F08);
    v29 = 4;
    v15 = sub_1DD325FE0(&qword_1F03D43C8, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEB3D8]);
    swift_bridgeObjectRetain();
    v25 = v15;
    v26 = v14;
    sub_1DD342AC8();
    v24 = v9;
    v16 = v30;
    v29 = 5;
    swift_bridgeObjectRetain();
    sub_1DD342AC8();
    v23 = a2;
    v17 = v30;
    v29 = 6;
    swift_bridgeObjectRetain();
    sub_1DD342AC8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v18 = v24 & 1;
    v19 = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v20 = v23;
    *v23 = v18;
    v21 = v27;
    v20[1] = v28;
    v20[2] = v21;
    v20[3] = v13;
    v20[4] = v16;
    v20[5] = v17;
    v20[6] = v19;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD322E4C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return FamilyActivitySelection.init(from:)(a1, a2);
}

uint64_t sub_1DD322E60(_QWORD *a1)
{
  return FamilyActivitySelection.encode(to:)(a1);
}

uint64_t sub_1DD322E78()
{
  return swift_getKeyPath();
}

uint64_t sub_1DD322E98@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DD3424D4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1DD322EC4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1DD322F08()
{
  return sub_1DD3424F8();
}

__n128 FamilyActivityPicker.init(selection:)@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t *v7;
  __int128 v8;
  __n128 result;

  v4 = *a1;
  v5 = a1[1];
  v6 = *((_BYTE *)a1 + 16);
  *(_QWORD *)(a2 + 112) = swift_getKeyPath();
  *(_BYTE *)(a2 + 120) = 0;
  v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for FamilyActivityPicker() + 36));
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  swift_storeEnumTagMultiPayload();
  *(_BYTE *)a2 = 1;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_QWORD *)(a2 + 40) = v4;
  *(_QWORD *)(a2 + 48) = v5;
  *(_BYTE *)(a2 + 56) = v6;
  v8 = *(_OWORD *)(a1 + 5);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(a2 + 80) = v8;
  result = *(__n128 *)(a1 + 7);
  *(__n128 *)(a2 + 96) = result;
  return result;
}

__n128 sub_1DD322FE0@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t *v16;
  __int128 v17;
  __n128 result;

  v13 = *a6;
  v14 = a6[1];
  v15 = *((_BYTE *)a6 + 16);
  *(_QWORD *)(a7 + 112) = swift_getKeyPath();
  *(_BYTE *)(a7 + 120) = 0;
  v16 = (uint64_t *)(a7 + *(int *)(type metadata accessor for FamilyActivityPicker() + 36));
  *v16 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  swift_storeEnumTagMultiPayload();
  *(_BYTE *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  *(_QWORD *)(a7 + 32) = a5;
  *(_QWORD *)(a7 + 40) = v13;
  *(_QWORD *)(a7 + 48) = v14;
  *(_BYTE *)(a7 + 56) = v15;
  v17 = *(_OWORD *)(a6 + 5);
  *(_OWORD *)(a7 + 64) = *(_OWORD *)(a6 + 3);
  *(_OWORD *)(a7 + 80) = v17;
  result = *(__n128 *)(a6 + 7);
  *(__n128 *)(a7 + 96) = result;
  return result;
}

__n128 FamilyActivityPicker.init(headerText:footerText:selection:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t *v15;
  __int128 v16;
  __n128 result;

  v12 = *a5;
  v13 = a5[1];
  v14 = *((_BYTE *)a5 + 16);
  *(_QWORD *)(a6 + 112) = swift_getKeyPath();
  *(_BYTE *)(a6 + 120) = 0;
  v15 = (uint64_t *)(a6 + *(int *)(type metadata accessor for FamilyActivityPicker() + 36));
  *v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  swift_storeEnumTagMultiPayload();
  *(_BYTE *)a6 = 1;
  *(_QWORD *)(a6 + 8) = a1;
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a3;
  *(_QWORD *)(a6 + 32) = a4;
  *(_QWORD *)(a6 + 40) = v12;
  *(_QWORD *)(a6 + 48) = v13;
  *(_BYTE *)(a6 + 56) = v14;
  v16 = *(_OWORD *)(a5 + 5);
  *(_OWORD *)(a6 + 64) = *(_OWORD *)(a5 + 3);
  *(_OWORD *)(a6 + 80) = v16;
  result = *(__n128 *)(a5 + 7);
  *(__n128 *)(a6 + 96) = result;
  return result;
}

double FamilyActivityPicker.body.getter@<D0>(_OWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double result;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29[2];
  unsigned __int8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v3 = type metadata accessor for FamilyActivityPicker();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v28 = *v1;
  v27 = *((_QWORD *)v1 + 1);
  v24 = *((_QWORD *)v1 + 2);
  v26 = *((_QWORD *)v1 + 3);
  v6 = *((_QWORD *)v1 + 5);
  v25 = *((_QWORD *)v1 + 4);
  v7 = *((_QWORD *)v1 + 6);
  v8 = v1[56];
  v9 = *((_QWORD *)v1 + 8);
  v10 = *((_QWORD *)v1 + 9);
  v11 = *((_QWORD *)v1 + 10);
  v21 = *((_QWORD *)v1 + 11);
  v22 = *((_QWORD *)v1 + 12);
  v23 = *((_QWORD *)v1 + 13);
  v29[0] = v6;
  v29[1] = v7;
  v30 = v8;
  v31 = v9;
  v32 = v10;
  v33 = v11;
  v34 = v21;
  v35 = v22;
  v36 = v23;
  sub_1DD32607C((uint64_t)v1, (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v13 = swift_allocObject();
  sub_1DD3261C4((uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = v24;
  swift_bridgeObjectRetain();
  v15 = v25;
  swift_bridgeObjectRetain();
  sub_1DD32E660(v28, v27, v14, v26, v15, v29, (uint64_t)sub_1DD326208, v13, (uint64_t)v37);
  v16 = v41;
  a1[4] = v40;
  a1[5] = v16;
  v17 = v43;
  a1[6] = v42;
  a1[7] = v17;
  v18 = v37[1];
  *a1 = v37[0];
  a1[1] = v18;
  result = *(double *)&v38;
  v20 = v39;
  a1[2] = v38;
  a1[3] = v20;
  return result;
}

uint64_t sub_1DD3233B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v14;

  v2 = sub_1DD342498();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for FamilyActivityPicker();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 112);
  v10 = *(_BYTE *)(a1 + 120);
  sub_1DD31EB38(v9, v10);
  v11 = sub_1DD323954(v9, v10);
  sub_1DD31EA98(v9, v10);
  sub_1DD32607C(a1, (uint64_t)v8);
  if ((v11 & 1) != 0)
  {
    v12 = *v8;
    sub_1DD3276EC((uint64_t)v8);
    if ((v12 & 1) != 0)
    {
      return 0;
    }
    else
    {
      sub_1DD323AE0((uint64_t)v5);
      sub_1DD34248C();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return 1;
    }
  }
  else
  {
    sub_1DD3276EC((uint64_t)v8);
    return 0;
  }
}

uint64_t View.familyActivityPicker(isPresented:selection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[4];
  uint64_t v12;

  v5 = *(_OWORD *)(a4 + 48);
  v11[2] = *(_OWORD *)(a4 + 32);
  v11[3] = v5;
  v12 = *(_QWORD *)(a4 + 64);
  v6 = *(_OWORD *)(a4 + 16);
  v11[0] = *(_OWORD *)a4;
  v11[1] = v6;
  v7 = swift_allocObject();
  v8 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 80) = *(_QWORD *)(a4 + 64);
  v9 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v7 + 32) = v9;
  sub_1DD326298((uint64_t)v11);
  type metadata accessor for FamilyActivityPicker();
  sub_1DD3150D4(&qword_1F03D43D8, (uint64_t (*)(uint64_t))type metadata accessor for FamilyActivityPicker, (uint64_t)&protocol conformance descriptor for FamilyActivityPicker);
  sub_1DD34266C();
  return swift_release();
}

uint64_t sub_1DD32360C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v11;

  v4 = type metadata accessor for FamilyActivityPicker();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_QWORD *)v6 + 14) = swift_getKeyPath();
  v6[120] = 0;
  v7 = (uint64_t *)&v6[*(int *)(v4 + 36)];
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  swift_storeEnumTagMultiPayload();
  *v6 = 0;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_OWORD *)(v6 + 24) = 0u;
  v8 = *(_OWORD *)a1;
  *(_OWORD *)(v6 + 56) = *(_OWORD *)(a1 + 16);
  v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 72) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v6 + 88) = v9;
  *((_QWORD *)v6 + 13) = *(_QWORD *)(a1 + 64);
  *(_OWORD *)(v6 + 40) = v8;
  sub_1DD3261C4((uint64_t)v6, a2);
  return sub_1DD326298(a1);
}

uint64_t View.familyActivityPicker(headerText:footerText:isPresented:selection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  _OWORD v19[4];
  uint64_t v20;

  v13 = *(_OWORD *)(a8 + 48);
  v19[2] = *(_OWORD *)(a8 + 32);
  v19[3] = v13;
  v20 = *(_QWORD *)(a8 + 64);
  v14 = *(_OWORD *)(a8 + 16);
  v19[0] = *(_OWORD *)a8;
  v19[1] = v14;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a1;
  *(_QWORD *)(v15 + 24) = a2;
  *(_QWORD *)(v15 + 32) = a3;
  *(_QWORD *)(v15 + 40) = a4;
  v16 = *(_OWORD *)(a8 + 48);
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(a8 + 32);
  *(_OWORD *)(v15 + 96) = v16;
  *(_QWORD *)(v15 + 112) = *(_QWORD *)(a8 + 64);
  v17 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(v15 + 48) = *(_OWORD *)a8;
  *(_OWORD *)(v15 + 64) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD326298((uint64_t)v19);
  type metadata accessor for FamilyActivityPicker();
  sub_1DD3150D4(&qword_1F03D43D8, (uint64_t (*)(uint64_t))type metadata accessor for FamilyActivityPicker, (uint64_t)&protocol conformance descriptor for FamilyActivityPicker);
  sub_1DD34266C();
  return swift_release();
}

uint64_t sub_1DD323838@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v19;

  v12 = type metadata accessor for FamilyActivityPicker();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_QWORD *)v14 + 14) = swift_getKeyPath();
  v14[120] = 0;
  v15 = (uint64_t *)&v14[*(int *)(v12 + 36)];
  *v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  swift_storeEnumTagMultiPayload();
  v16 = *(_OWORD *)a5;
  *(_OWORD *)(v14 + 56) = *(_OWORD *)(a5 + 16);
  v17 = *(_OWORD *)(a5 + 48);
  *(_OWORD *)(v14 + 72) = *(_OWORD *)(a5 + 32);
  *(_OWORD *)(v14 + 88) = v17;
  *v14 = 0;
  *((_QWORD *)v14 + 1) = a1;
  *((_QWORD *)v14 + 2) = a2;
  *((_QWORD *)v14 + 3) = a3;
  *((_QWORD *)v14 + 4) = a4;
  *((_QWORD *)v14 + 13) = *(_QWORD *)(a5 + 64);
  *(_OWORD *)(v14 + 40) = v16;
  sub_1DD3261C4((uint64_t)v14, a6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1DD326298(a5);
}

uint64_t sub_1DD323954(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v4 = sub_1DD342510();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_1DD3428B8();
  v9 = sub_1DD342630();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v13 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_1DD30EE20(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_1DD30C000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D91B0](v11, -1, -1);
    MEMORY[0x1DF0D91B0](v10, -1, -1);
  }

  sub_1DD342504();
  swift_getAtKeyPath();
  sub_1DD31EA98(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_1DD323AE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_1DD342510();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD327728(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_1DD342498();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_1DD3428B8();
    v14 = sub_1DD342630();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_1DD30EE20(0x417373696D736944, 0xED00006E6F697463, &v18);
      _os_log_impl(&dword_1DD30C000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v16, -1, -1);
      MEMORY[0x1DF0D91B0](v15, -1, -1);
    }

    sub_1DD342504();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1DD323CF0(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_1DD342330();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1DD3150D4(&qword_1F03D44E8, v11, MEMORY[0x1E0CC1458]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_1DD342774();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_1DD3150D4(&qword_1F03D44F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1448], MEMORY[0x1E0CC1460]);
      v21 = sub_1DD342780();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_1DD324AAC((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1DD323F4C(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_1DD342354();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1DD3150D4(&qword_1F03D44D0, v11, MEMORY[0x1E0CC14A8]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_1DD342774();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_1DD3150D4(&qword_1F03D44D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1498], MEMORY[0x1E0CC14B0]);
      v21 = sub_1DD342780();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_1DD324CB0((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1DD3241A8(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_1DD34239C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1DD3150D4(&qword_1F03D44B8, v11, MEMORY[0x1E0CC1538]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_1DD342774();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_1DD3150D4(&qword_1F03D44C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1528], MEMORY[0x1E0CC1540]);
      v21 = sub_1DD342780();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_1DD324F04((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1DD324404()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  uint64_t v37;

  v1 = v0;
  v2 = sub_1DD342330();
  v37 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D44F8);
  v6 = sub_1DD3429B4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_37;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v36 = (_QWORD *)(v5 + 56);
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v34 = v0;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = v36;
    v20 = v36[v18];
    ++v14;
    if (!v20)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_31;
      v20 = v36[v14];
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_31:
          swift_release();
          v1 = v34;
          goto LABEL_33;
        }
        v20 = v36[v21];
        if (!v20)
        {
          while (1)
          {
            v14 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_39;
            if (v14 >= v35)
              goto LABEL_31;
            v20 = v36[v14];
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v14 = v21;
      }
    }
LABEL_21:
    v11 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    v22 = v5;
    v23 = *(_QWORD *)(v37 + 72);
    v24 = *(_QWORD *)(v5 + 48) + v23 * v17;
    v25 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 32);
    v25(v4, v24, v2);
    sub_1DD3150D4(&qword_1F03D44E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1448], MEMORY[0x1E0CC1458]);
    result = sub_1DD342774();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v12 + 8 * v28);
      }
      while (v32 == -1);
      v15 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
    ++*(_QWORD *)(v7 + 16);
    v5 = v22;
  }
  swift_release();
  v1 = v34;
  v19 = v36;
LABEL_33:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 > 63)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_37:
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_1DD32474C(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  unint64_t *v45;
  uint64_t v46;

  v45 = a4;
  v46 = a5;
  v7 = v5;
  v44 = a2;
  v8 = a2(0);
  v43 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v39 - v9;
  v11 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = sub_1DD3429B4();
  v13 = v12;
  if (*(_QWORD *)(v11 + 16))
  {
    v14 = 1 << *(_BYTE *)(v11 + 32);
    v15 = *(_QWORD *)(v11 + 56);
    v42 = (_QWORD *)(v11 + 56);
    if (v14 < 64)
      v16 = ~(-1 << v14);
    else
      v16 = -1;
    v17 = v16 & v15;
    v40 = v5;
    v41 = (unint64_t)(v14 + 63) >> 6;
    v18 = v12 + 56;
    result = swift_retain();
    v20 = 0;
    while (1)
    {
      if (v17)
      {
        v22 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        v23 = v22 | (v20 << 6);
      }
      else
      {
        v24 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v24 >= v41)
          goto LABEL_33;
        v25 = v42[v24];
        ++v20;
        if (!v25)
        {
          v20 = v24 + 1;
          if (v24 + 1 >= v41)
            goto LABEL_33;
          v25 = v42[v20];
          if (!v25)
          {
            v20 = v24 + 2;
            if (v24 + 2 >= v41)
              goto LABEL_33;
            v25 = v42[v20];
            if (!v25)
            {
              v26 = v24 + 3;
              if (v26 >= v41)
              {
LABEL_33:
                swift_release();
                v7 = v40;
                v38 = 1 << *(_BYTE *)(v11 + 32);
                if (v38 > 63)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v11 + 16) = 0;
                break;
              }
              v25 = v42[v26];
              if (!v25)
              {
                while (1)
                {
                  v20 = v26 + 1;
                  if (__OFADD__(v26, 1))
                    goto LABEL_39;
                  if (v20 >= v41)
                    goto LABEL_33;
                  v25 = v42[v20];
                  ++v26;
                  if (v25)
                    goto LABEL_23;
                }
              }
              v20 = v26;
            }
          }
        }
LABEL_23:
        v17 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v20 << 6);
      }
      v27 = v11;
      v28 = *(_QWORD *)(v11 + 48);
      v29 = *(_QWORD *)(v43 + 72);
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 32);
      v30(v10, v28 + v29 * v23, v8);
      sub_1DD3150D4(v45, v44, v46);
      result = sub_1DD342774();
      v31 = -1 << *(_BYTE *)(v13 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6))) != 0)
      {
        v21 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v18 + 8 * v33);
        }
        while (v37 == -1);
        v21 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v30)(*(_QWORD *)(v13 + 48) + v21 * v29, v10, v8);
      ++*(_QWORD *)(v13 + 16);
      v11 = v27;
    }
  }
  result = swift_release();
  *v7 = v13;
  return result;
}

uint64_t sub_1DD324AAC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_1DD342330();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_1DD324404();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1DD325158();
      goto LABEL_12;
    }
    sub_1DD32558C();
  }
  v12 = *v3;
  sub_1DD3150D4(&qword_1F03D44E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1448], MEMORY[0x1E0CC1458]);
  v13 = sub_1DD342774();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_1DD3150D4(&qword_1F03D44F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1448], MEMORY[0x1E0CC1460]);
      v18 = sub_1DD342780();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1DD342B4C();
  __break(1u);
  return result;
}

uint64_t sub_1DD324CB0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_1DD342354();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1DD32474C(v12, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1498], &qword_1F03D44E0, &qword_1F03D44D0, MEMORY[0x1E0CC14A8]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_1DD325368((uint64_t (*)(_QWORD))MEMORY[0x1E0CC1498], &qword_1F03D44E0);
      goto LABEL_12;
    }
    sub_1DD325880(v12, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1498], &qword_1F03D44E0, &qword_1F03D44D0, MEMORY[0x1E0CC14A8]);
  }
  v13 = *v3;
  sub_1DD3150D4(&qword_1F03D44D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1498], MEMORY[0x1E0CC14A8]);
  v14 = sub_1DD342774();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_1DD3150D4(&qword_1F03D44D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1498], MEMORY[0x1E0CC14B0]);
      v19 = sub_1DD342780();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1DD342B4C();
  __break(1u);
  return result;
}

uint64_t sub_1DD324F04(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_1DD34239C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1DD32474C(v12, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1528], &qword_1F03D44C8, &qword_1F03D44B8, MEMORY[0x1E0CC1538]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_1DD325368((uint64_t (*)(_QWORD))MEMORY[0x1E0CC1528], &qword_1F03D44C8);
      goto LABEL_12;
    }
    sub_1DD325880(v12, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1528], &qword_1F03D44C8, &qword_1F03D44B8, MEMORY[0x1E0CC1538]);
  }
  v13 = *v3;
  sub_1DD3150D4(&qword_1F03D44B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1528], MEMORY[0x1E0CC1538]);
  v14 = sub_1DD342774();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_1DD3150D4(&qword_1F03D44C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1528], MEMORY[0x1E0CC1540]);
      v19 = sub_1DD342780();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1DD342B4C();
  __break(1u);
  return result;
}

void *sub_1DD325158()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_1DD342330();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D44F8);
  v6 = *v0;
  v7 = sub_1DD3429A8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v17)
      goto LABEL_26;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_26;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
        break;
    }
LABEL_25:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 2;
  if (v23 >= v17)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_26;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1DD325368(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  uint64_t v13;
  unint64_t v14;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v4 = v2;
  v5 = a1(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v27 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *v2;
  v10 = sub_1DD3429A8();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v4 = v11;
    return result;
  }
  v28 = v4;
  result = (void *)(v10 + 56);
  v13 = v9 + 56;
  v14 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v14)
    result = memmove(result, (const void *)(v9 + 56), 8 * v14);
  v16 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v17 = 1 << *(_BYTE *)(v9 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(v9 + 56);
  v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }
    v24 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v24 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v24);
    ++v16;
    if (!v25)
    {
      v16 = v24 + 1;
      if (v24 + 1 >= v20)
        goto LABEL_28;
      v25 = *(_QWORD *)(v13 + 8 * v16);
      if (!v25)
      {
        v16 = v24 + 2;
        if (v24 + 2 >= v20)
          goto LABEL_28;
        v25 = *(_QWORD *)(v13 + 8 * v16);
        if (!v25)
          break;
      }
    }
LABEL_27:
    v19 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v16 << 6);
LABEL_12:
    v23 = *(_QWORD *)(v6 + 72) * v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(_QWORD *)(v9 + 48) + v23, v5);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v23, v8, v5);
  }
  v26 = v24 + 3;
  if (v26 >= v20)
  {
LABEL_28:
    result = (void *)swift_release();
    v4 = v28;
    goto LABEL_30;
  }
  v25 = *(_QWORD *)(v13 + 8 * v26);
  if (v25)
  {
    v16 = v26;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v16 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v16);
    ++v26;
    if (v25)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1DD32558C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_1DD342330();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D44F8);
  v7 = sub_1DD3429B4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_33:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_22;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v19 >= v33)
      goto LABEL_31;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_31;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
        break;
    }
LABEL_21:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_22:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_1DD3150D4(&qword_1F03D44E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CC1448], MEMORY[0x1E0CC1458]);
    result = sub_1DD342774();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_34;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 2;
  if (v21 >= v33)
  {
LABEL_31:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_33;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_21;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_31;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_21;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1DD325880(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t (*v39)(uint64_t);
  unint64_t *v40;
  uint64_t v41;

  v40 = a4;
  v41 = a5;
  v7 = v5;
  v39 = a2;
  v8 = a2(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v36 - v10;
  v12 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v13 = sub_1DD3429B4();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
  {
    result = swift_release();
LABEL_35:
    *v7 = v14;
    return result;
  }
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 56);
  v36 = v5;
  v37 = v12 + 56;
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v38 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 56;
  result = swift_retain();
  v21 = 0;
  while (1)
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v25 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v37 + 8 * v25);
    ++v21;
    if (!v26)
    {
      v21 = v25 + 1;
      if (v25 + 1 >= v38)
        goto LABEL_33;
      v26 = *(_QWORD *)(v37 + 8 * v21);
      if (!v26)
      {
        v21 = v25 + 2;
        if (v25 + 2 >= v38)
          goto LABEL_33;
        v26 = *(_QWORD *)(v37 + 8 * v21);
        if (!v26)
          break;
      }
    }
LABEL_23:
    v18 = (v26 - 1) & v26;
    v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_24:
    v28 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, *(_QWORD *)(v12 + 48) + v28 * v24, v8);
    sub_1DD3150D4(v40, v39, v41);
    result = sub_1DD342774();
    v29 = -1 << *(_BYTE *)(v14 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v19 + 8 * (v30 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v19 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v19 + 8 * v31);
      }
      while (v35 == -1);
      v22 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(*(_QWORD *)(v14 + 48) + v22 * v28, v11, v8);
    ++*(_QWORD *)(v14 + 16);
  }
  v27 = v25 + 3;
  if (v27 >= v38)
  {
LABEL_33:
    result = swift_release_n();
    v7 = v36;
    goto LABEL_35;
  }
  v26 = *(_QWORD *)(v37 + 8 * v27);
  if (v26)
  {
    v21 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    v21 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v21 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v37 + 8 * v21);
    ++v27;
    if (v26)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t _s14FamilyControls0A17ActivitySelectionV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
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

  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2)
    return 0;
  v3 = a1[3];
  v2 = a1[4];
  v5 = a1[5];
  v4 = a1[6];
  v7 = a2[3];
  v6 = a2[4];
  v9 = a2[5];
  v8 = a2[6];
  v10 = a2[2];
  v11 = a1[2];
  if ((sub_1DD321F04(a1[1], a2[1], &qword_1F03D4880, &qword_1F03D44A8, &qword_1F03D44B0) & 1) == 0)
    return 0;
  if ((sub_1DD321F04(v11, v10, (uint64_t *)&unk_1F03D4870, &qword_1F03D4498, &qword_1F03D44A0) & 1) != 0
    && (sub_1DD321F04(v3, v7, &qword_1F03D4000, &qword_1F03D4488, &qword_1F03D4490) & 1) != 0
    && (sub_1DD32226C(v2, v6) & 1) != 0
    && (sub_1DD32226C(v5, v9) & 1) != 0)
  {
    return sub_1DD32226C(v4, v8);
  }
  else
  {
    return 0;
  }
}

unint64_t sub_1DD325CB4()
{
  unint64_t result;

  result = qword_1F03D62E0[0];
  if (!qword_1F03D62E0[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD34436C, &type metadata for FamilyActivitySelection.CodingKeys);
    atomic_store(result, qword_1F03D62E0);
  }
  return result;
}

unint64_t sub_1DD325CF8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F03D4348;
  if (!qword_1F03D4348)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4340);
    v2 = sub_1DD31A0CC(&qword_1F03D4350, &qword_1F03D4880, MEMORY[0x1E0CC14D8]);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEB3B8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F03D4348);
  }
  return result;
}

unint64_t sub_1DD325D74()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F03D4360;
  if (!qword_1F03D4360)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4358);
    v2 = sub_1DD31A0CC(&qword_1F03D4368, (uint64_t *)&unk_1F03D4870, MEMORY[0x1E0CC14D8]);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEB3B8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F03D4360);
  }
  return result;
}

unint64_t sub_1DD325DF0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F03D4378;
  if (!qword_1F03D4378)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4370);
    v2 = sub_1DD31A0CC(&qword_1F03D4380, &qword_1F03D4000, MEMORY[0x1E0CC14D8]);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEB3B8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F03D4378);
  }
  return result;
}

unint64_t sub_1DD325E6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F03D4398;
  if (!qword_1F03D4398)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4340);
    v2 = sub_1DD31A0CC(&qword_1F03D43A0, &qword_1F03D4880, MEMORY[0x1E0CC14F0]);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEB3D8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F03D4398);
  }
  return result;
}

unint64_t sub_1DD325EE8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F03D43A8;
  if (!qword_1F03D43A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4358);
    v2 = sub_1DD31A0CC(&qword_1F03D43B0, (uint64_t *)&unk_1F03D4870, MEMORY[0x1E0CC14F0]);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEB3D8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F03D43A8);
  }
  return result;
}

unint64_t sub_1DD325F64()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F03D43B8;
  if (!qword_1F03D43B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D4370);
    v2 = sub_1DD31A0CC(&qword_1F03D43C0, &qword_1F03D4000, MEMORY[0x1E0CC14F0]);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEB3D8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F03D43B8);
  }
  return result;
}

uint64_t sub_1DD325FE0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03D3F08);
    v8 = a2;
    result = MEMORY[0x1DF0D9108](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for FamilyActivityPicker()
{
  uint64_t result;

  result = qword_1F03D6500;
  if (!qword_1F03D6500)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DD32607C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FamilyActivityPicker();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD3260C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for FamilyActivityPicker();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DD31EA98(*(_QWORD *)(v3 + 112), *(_BYTE *)(v3 + 120));
  v4 = v3 + *(int *)(v1 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_1DD342498();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_1DD3261C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FamilyActivityPicker();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD326208()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FamilyActivityPicker() - 8) + 80);
  return sub_1DD3233B4(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_1DD326234()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DD326290@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DD32360C(v1 + 16, a1);
}

uint64_t sub_1DD326298(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1DD326320()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DD32638C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1DD323838(v1[2], v1[3], v1[4], v1[5], (uint64_t)(v1 + 6), a1);
}

uint64_t sub_1DD32639C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for FamilyActivitySelection()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FamilyActivitySelection(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FamilyActivitySelection(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FamilyActivitySelection(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilyActivitySelection(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyActivitySelection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FamilyActivitySelection()
{
  return &type metadata for FamilyActivitySelection;
}

_BYTE *initializeBufferWithCopyOfBuffer for FamilyActivityPicker(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  _BYTE *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (_BYTE *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v6 = a2[2];
    *((_QWORD *)v4 + 1) = a2[1];
    *((_QWORD *)v4 + 2) = v6;
    v7 = a2[4];
    *((_QWORD *)v4 + 3) = a2[3];
    *((_QWORD *)v4 + 4) = v7;
    v8 = a2[6];
    *((_QWORD *)v4 + 5) = a2[5];
    *((_QWORD *)v4 + 6) = v8;
    v4[56] = *((_BYTE *)a2 + 56);
    v9 = a2[9];
    *((_QWORD *)v4 + 8) = a2[8];
    *((_QWORD *)v4 + 9) = v9;
    v10 = a2[11];
    *((_QWORD *)v4 + 10) = a2[10];
    *((_QWORD *)v4 + 11) = v10;
    v11 = a2[13];
    *((_QWORD *)v4 + 12) = a2[12];
    *((_QWORD *)v4 + 13) = v11;
    v19 = a2[14];
    v18 = *((_BYTE *)a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1DD31EB38(v19, v18);
    *((_QWORD *)v4 + 14) = v19;
    v4[120] = v18;
    v12 = *(int *)(a3 + 36);
    v13 = &v4[v12];
    v14 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_1DD342498();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t destroy for FamilyActivityPicker(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DD31EA98(*(_QWORD *)(a1 + 112), *(_BYTE *)(a1 + 120));
  v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_1DD342498();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for FamilyActivityPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  char v16;
  uint64_t v17;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v17 = *(_QWORD *)(a2 + 112);
  v16 = *(_BYTE *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD31EB38(v17, v16);
  *(_QWORD *)(a1 + 112) = v17;
  *(_BYTE *)(a1 + 120) = v16;
  v11 = *(int *)(a3 + 36);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_1DD342498();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for FamilyActivityPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 112);
  v7 = *(_BYTE *)(a2 + 120);
  sub_1DD31EB38(v6, v7);
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_BYTE *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = v6;
  *(_BYTE *)(a1 + 120) = v7;
  sub_1DD31EA98(v8, v9);
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 36);
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_1DD326C60(a1 + v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_1DD342498();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1DD326C60(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for FamilyActivityPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v4 = *(_QWORD *)(a2 + 112);
  v5 = *(int *)(a3 + 36);
  v6 = (const void *)(a2 + v5);
  v7 = (void *)(a1 + v5);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_1DD342498();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v6, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for FamilyActivityPicker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  v8 = *(_BYTE *)(a2 + 120);
  v9 = *(_QWORD *)(a1 + 112);
  v10 = *(_BYTE *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = v8;
  sub_1DD31EA98(v9, v10);
  if (a1 != a2)
  {
    v11 = *(int *)(a3 + 36);
    v12 = (void *)(a1 + v11);
    v13 = (const void *)(a2 + v11);
    sub_1DD326C60(a1 + v11);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_1DD342498();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilyActivityPicker()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD326F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43E0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for FamilyActivityPicker()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD326FA4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 48) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43E0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

void sub_1DD32701C()
{
  unint64_t v0;

  sub_1DD3270B0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1DD3270B0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F03D4440)
  {
    sub_1DD342498();
    v0 = sub_1DD342468();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F03D4440);
  }
}

unint64_t sub_1DD327108()
{
  unint64_t result;

  result = qword_1F03D4480;
  if (!qword_1F03D4480)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344560, &type metadata for ActivityPickerViewController.Representable);
    atomic_store(result, (unint64_t *)&qword_1F03D4480);
  }
  return result;
}

uint64_t sub_1DD32714C()
{
  type metadata accessor for FamilyActivityPicker();
  sub_1DD3150D4(&qword_1F03D43D8, (uint64_t (*)(uint64_t))type metadata accessor for FamilyActivityPicker, (uint64_t)&protocol conformance descriptor for FamilyActivityPicker);
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for FamilyActivitySelection.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyActivitySelection.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1DD327298 + 4 * byte_1DD3440AC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1DD3272CC + 4 * byte_1DD3440A7[v4]))();
}

uint64_t sub_1DD3272CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD3272D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD3272DCLL);
  return result;
}

uint64_t sub_1DD3272E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD3272F0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1DD3272F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD3272FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FamilyActivitySelection.CodingKeys()
{
  return &type metadata for FamilyActivitySelection.CodingKeys;
}

unint64_t sub_1DD32731C()
{
  unint64_t result;

  result = qword_1F03D6610[0];
  if (!qword_1F03D6610[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344344, &type metadata for FamilyActivitySelection.CodingKeys);
    atomic_store(result, qword_1F03D6610);
  }
  return result;
}

unint64_t sub_1DD327364()
{
  unint64_t result;

  result = qword_1F03D6720;
  if (!qword_1F03D6720)
  {
    result = MEMORY[0x1DF0D9108]("]~=\rdW", &type metadata for FamilyActivitySelection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D6720);
  }
  return result;
}

unint64_t sub_1DD3273AC()
{
  unint64_t result;

  result = qword_1F03D6728[0];
  if (!qword_1F03D6728[0])
  {
    result = MEMORY[0x1DF0D9108]("E~=\r<W", &type metadata for FamilyActivitySelection.CodingKeys);
    atomic_store(result, qword_1F03D6728);
  }
  return result;
}

uint64_t sub_1DD3273F0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x80000001DD347B80 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001DD347BA0 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xEE00736E656B6F54 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x69616D6F44626577 && a2 == 0xEF736E656B6F546ELL || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000021 && a2 == 0x80000001DD347BC0 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x80000001DD347BF0 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD00000000000001FLL && a2 == 0x80000001DD347C10)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v5 = sub_1DD342B34();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_1DD3276EC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FamilyActivityPicker();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DD327728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D43D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FamilyMember.firstName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FamilyMember.firstName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*FamilyMember.firstName.modify())()
{
  return nullsub_1;
}

uint64_t FamilyMember.lastName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FamilyMember.lastName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*FamilyMember.lastName.modify())()
{
  return nullsub_1;
}

uint64_t FamilyMember.altDSID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FamilyMember.altDSID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*FamilyMember.altDSID.modify())()
{
  return nullsub_1;
}

uint64_t FamilyMember.appleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FamilyMember.appleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*FamilyMember.appleID.modify())()
{
  return nullsub_1;
}

uint64_t FamilyMember.isParent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t FamilyMember.isParent.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = result;
  return result;
}

uint64_t (*FamilyMember.isParent.modify())()
{
  return nullsub_1;
}

uint64_t FamilyMember.isChild.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t FamilyMember.isChild.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 65) = result;
  return result;
}

uint64_t (*FamilyMember.isChild.modify())()
{
  return nullsub_1;
}

uint64_t FamilyMember.isMe.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t FamilyMember.isMe.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 66) = result;
  return result;
}

uint64_t (*FamilyMember.isMe.modify())()
{
  return nullsub_1;
}

uint64_t FamilyMember.fullName.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_1DD3421D4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD3421C8();
  swift_bridgeObjectRetain();
  sub_1DD3421A4();
  swift_bridgeObjectRetain();
  sub_1DD3421B0();
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_1DD3421BC();
  v6 = objc_msgSend(v4, sel_localizedStringFromPersonNameComponents_style_options_, v5, 0, 0);

  v7 = sub_1DD342798();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v7;
}

void sub_1DD327AA8(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = objc_msgSend(a1, sel_firstName);
  if (v4)
  {
    v5 = v4;
    v26 = sub_1DD342798();
    v7 = v6;

  }
  else
  {
    v26 = 0;
    v7 = 0;
  }
  swift_bridgeObjectRetain();
  v8 = objc_msgSend(a1, sel_lastName);
  if (v8)
  {
    v9 = v8;
    v25 = sub_1DD342798();
    v11 = v10;

  }
  else
  {
    v25 = 0;
    v11 = 0;
  }
  swift_bridgeObjectRetain();
  v12 = objc_msgSend(a1, sel_altDSID);
  if (v12)
  {
    v13 = v12;
    v24 = sub_1DD342798();
    v15 = v14;

  }
  else
  {
    v24 = 0;
    v15 = 0;
  }
  swift_bridgeObjectRetain();
  v16 = objc_msgSend(a1, sel_appleID);
  if (v16)
  {
    v17 = v16;
    v18 = sub_1DD342798();
    v20 = v19;

  }
  else
  {
    v18 = 0;
    v20 = 0;
  }
  swift_bridgeObjectRetain();
  v21 = objc_msgSend(a1, sel_isParent);
  v22 = objc_msgSend(a1, sel_isMe);
  v23 = (char *)objc_msgSend(a1, sel_memberType);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *(_QWORD *)a2 = v26;
  *(_QWORD *)(a2 + 8) = v7;
  *(_QWORD *)(a2 + 16) = v25;
  *(_QWORD *)(a2 + 24) = v11;
  *(_QWORD *)(a2 + 32) = v24;
  *(_QWORD *)(a2 + 40) = v15;
  *(_QWORD *)(a2 + 48) = v18;
  *(_QWORD *)(a2 + 56) = v20;
  *(_BYTE *)(a2 + 64) = v21;
  *(_BYTE *)(a2 + 65) = (unint64_t)(v23 - 1) < 2;
  *(_BYTE *)(a2 + 66) = v22;
}

double sub_1DD327C90@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_DWORD *)(a1 + 63) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void __swiftcall FamilyMember.copy()(FamilyControls::FamilyMember *__return_ptr retstr)
{
  uint64_t v1;
  void *v2;
  char v3;
  char v4;
  char v5;

  v2 = *(void **)(v1 + 56);
  v3 = *(_BYTE *)(v1 + 64);
  v4 = *(_BYTE *)(v1 + 65);
  v5 = *(_BYTE *)(v1 + 66);
  retstr->firstName.value._countAndFlagsBits = *(_QWORD *)v1;
  *(_OWORD *)&retstr->firstName.value._object = *(_OWORD *)(v1 + 8);
  *(_OWORD *)&retstr->lastName.value._object = *(_OWORD *)(v1 + 24);
  *(_OWORD *)&retstr->altDSID.value._object = *(_OWORD *)(v1 + 40);
  retstr->appleID.value._object = v2;
  retstr->isParent = v3;
  retstr->isChild = v4;
  retstr->isMe = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

uint64_t sub_1DD327D28()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD327D58()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD327D84()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD327DB0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t sub_1DD327DB8()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t sub_1DD327DC0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t sub_1DD327DC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;

  v2 = *(_QWORD *)(v1 + 56);
  v3 = *(_BYTE *)(v1 + 64);
  v4 = *(_BYTE *)(v1 + 65);
  v5 = *(_BYTE *)(v1 + 66);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(a1 + 56) = v2;
  *(_BYTE *)(a1 + 64) = v3;
  *(_BYTE *)(a1 + 65) = v4;
  *(_BYTE *)(a1 + 66) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DD327E4C()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  _QWORD aBlock[6];
  uint64_t v8;

  v8 = MEMORY[0x1E0DEE9D8];
  v1 = *(NSObject **)(v0 + 24);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v8;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_1DD329D60;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_1DD329D78;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD328144;
  aBlock[3] = &block_descriptor_2;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v1 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

uint64_t sub_1DD327F8C(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t *v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[5];
  uint64_t v24;

  v2 = a1;
  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(v3 + 16);
  v5 = MEMORY[0x1E0DEE9D8];
  if (v4)
  {
    v19 = a1;
    v24 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1DD32A3EC(0, v4, 0);
    v6 = v3 + 32;
    v5 = v24;
    do
    {
      sub_1DD32AE18(v6, (uint64_t)v20);
      v7 = v21;
      v8 = v22;
      __swift_project_boxed_opaque_existential_1(v20, v21);
      v9 = *(_QWORD *)(v8 + 8);
      v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v23[3] = v7;
      v23[4] = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v23);
      v10(v7, v9);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = sub_1DD32A3EC(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v24;
      }
      v14 = *(_QWORD *)(v5 + 16);
      v13 = *(_QWORD *)(v5 + 24);
      if (v14 >= v13 >> 1)
        isUniquelyReferenced_nonNull_native = sub_1DD32A3EC(v13 > 1, v14 + 1, 1);
      MEMORY[0x1E0C80A78](isUniquelyReferenced_nonNull_native);
      v16 = (char *)&v20[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t *, uint64_t))(v17 + 16))(v16, boxed_opaque_existential_1, v7);
      sub_1DD32AC94(v14, (uint64_t)v16, &v24, v7, v8);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
      v5 = v24;
      v6 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    v2 = v19;
  }
  *v2 = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD328144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1DD328164()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  _QWORD aBlock[6];
  uint64_t v8;

  v8 = MEMORY[0x1E0DEE9D8];
  v1 = *(NSObject **)(v0 + 24);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v8;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_1DD329DB0;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_1DD32AE98;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD328144;
  aBlock[3] = &block_descriptor_13;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v1 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

uint64_t sub_1DD3282A4(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t *v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[5];
  uint64_t v24;

  v2 = a1;
  v3 = *(_QWORD *)(a2 + 40);
  v4 = *(_QWORD *)(v3 + 16);
  v5 = MEMORY[0x1E0DEE9D8];
  if (v4)
  {
    v19 = a1;
    v24 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1DD32A3EC(0, v4, 0);
    v6 = v3 + 32;
    v5 = v24;
    do
    {
      sub_1DD32AE18(v6, (uint64_t)v20);
      v7 = v21;
      v8 = v22;
      __swift_project_boxed_opaque_existential_1(v20, v21);
      v9 = *(_QWORD *)(v8 + 8);
      v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v23[3] = v7;
      v23[4] = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v23);
      v10(v7, v9);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = sub_1DD32A3EC(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v24;
      }
      v14 = *(_QWORD *)(v5 + 16);
      v13 = *(_QWORD *)(v5 + 24);
      if (v14 >= v13 >> 1)
        isUniquelyReferenced_nonNull_native = sub_1DD32A3EC(v13 > 1, v14 + 1, 1);
      MEMORY[0x1E0C80A78](isUniquelyReferenced_nonNull_native);
      v16 = (char *)&v20[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t *, uint64_t))(v17 + 16))(v16, boxed_opaque_existential_1, v7);
      sub_1DD32AC94(v14, (uint64_t)v16, &v24, v7, v8);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
      v5 = v24;
      v6 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    v2 = v19;
  }
  *v2 = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD32845C()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  _QWORD aBlock[6];
  uint64_t v8;

  v8 = MEMORY[0x1E0DEE9D8];
  v1 = *(NSObject **)(v0 + 24);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v8;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_1DD329DC8;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_1DD32AE98;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD328144;
  aBlock[3] = &block_descriptor_23_0;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v1 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

uint64_t sub_1DD32859C(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t *v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[5];
  uint64_t v24;

  v2 = a1;
  v3 = *(_QWORD *)(a2 + 48);
  v4 = *(_QWORD *)(v3 + 16);
  v5 = MEMORY[0x1E0DEE9D8];
  if (v4)
  {
    v19 = a1;
    v24 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1DD32A3EC(0, v4, 0);
    v6 = v3 + 32;
    v5 = v24;
    do
    {
      sub_1DD32AE18(v6, (uint64_t)v20);
      v7 = v21;
      v8 = v22;
      __swift_project_boxed_opaque_existential_1(v20, v21);
      v9 = *(_QWORD *)(v8 + 8);
      v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v23[3] = v7;
      v23[4] = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v23);
      v10(v7, v9);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = sub_1DD32A3EC(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v24;
      }
      v14 = *(_QWORD *)(v5 + 16);
      v13 = *(_QWORD *)(v5 + 24);
      if (v14 >= v13 >> 1)
        isUniquelyReferenced_nonNull_native = sub_1DD32A3EC(v13 > 1, v14 + 1, 1);
      MEMORY[0x1E0C80A78](isUniquelyReferenced_nonNull_native);
      v16 = (char *)&v20[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t *, uint64_t))(v17 + 16))(v16, boxed_opaque_existential_1, v7);
      sub_1DD32AC94(v14, (uint64_t)v16, &v24, v7, v8);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
      v5 = v24;
      v6 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    v2 = v19;
  }
  *v2 = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD328754@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD v9[6];
  _OWORD v10[2];
  uint64_t v11;

  v2 = v1;
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  v4 = *(NSObject **)(v1 + 24);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v10;
  *(_QWORD *)(v5 + 24) = v2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1DD329DE0;
  *(_QWORD *)(v6 + 24) = v5;
  v9[4] = sub_1DD32AE98;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1DD328144;
  v9[3] = &block_descriptor_33;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_1DD329EC8((uint64_t)v10, a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_1DD3288A4()
{
  return 0xFFFFFFFFLL;
}

uint64_t sub_1DD3288AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  _QWORD v8[2];

  v0 = sub_1DD3428F4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD3428E8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1DD342738();
  MEMORY[0x1E0C80A78](v6);
  sub_1DD32AC08(0, (unint64_t *)&qword_1EDB64FD8);
  sub_1DD34272C();
  v8[1] = MEMORY[0x1E0DEE9D8];
  sub_1DD3150D4(&qword_1EDB64FD0, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FB8);
  sub_1DD32AA94(&qword_1EDB64FC0, &qword_1EDB64FB8);
  sub_1DD342978();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  return sub_1DD342924();
}

uint64_t sub_1DD328A70()
{
  return MEMORY[0x1E0DEE9D8];
}

double sub_1DD328A7C@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t FamilyCircle.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  FamilyCircle.init()();
  return v0;
}

uint64_t FamilyCircle.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0;
  v14 = sub_1DD3428F4();
  v2 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD3428E8();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v5);
  v7 = sub_1DD342738();
  MEMORY[0x1E0C80A78](v7);
  *(_DWORD *)(v0 + 16) = -1;
  v13 = sub_1DD32AC08(0, (unint64_t *)&qword_1EDB64FD8);
  sub_1DD34272C();
  v8 = MEMORY[0x1E0DEE9D8];
  v15 = MEMORY[0x1E0DEE9D8];
  sub_1DD3150D4(&qword_1EDB64FD0, v6, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FB8);
  sub_1DD32AA94(&qword_1EDB64FC0, &qword_1EDB64FB8);
  sub_1DD342978();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF8D0], v14);
  *(_QWORD *)(v0 + 24) = sub_1DD342924();
  *(_QWORD *)(v0 + 32) = v8;
  *(_QWORD *)(v0 + 40) = v8;
  *(_QWORD *)(v0 + 48) = v8;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_QWORD *)(v0 + 88) = 0;
  sub_1DD329168();
  v9 = sub_1DD342798();
  v11 = v10;
  swift_retain();
  sub_1DD328F18(v9, v11, v1);
  swift_bridgeObjectRelease();
  return v1;
}

void sub_1DD328CF0(const char *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD aBlock[6];

  v4 = sub_1DD3423D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD32AC08(0, (unint64_t *)&qword_1EDB64FD8);
  v8 = sub_1DD342900();
  v9 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_1DD32A764;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD328EDC;
  aBlock[3] = &block_descriptor_40;
  v10 = _Block_copy(aBlock);
  swift_release();
  swift_beginAccess();
  LODWORD(a1) = notify_register_dispatch(a1, (int *)(a2 + 16), v8, v10);
  swift_endAccess();
  _Block_release(v10);

  if ((_DWORD)a1)
  {
    v11 = sub_1DD338ED8();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
    v12 = sub_1DD3423C0();
    v13 = sub_1DD3428AC();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DD30C000, v12, v13, "Failed to register for Family Circle update notifications", v14, 2u);
      MEMORY[0x1DF0D91B0](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1DD328EDC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1DD328F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *v4;
  _QWORD v6[2];

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_1DD3429C0();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v4 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v4 = (const char *)sub_1DD342A08();
    sub_1DD328CF0(v4, a3);
    return swift_release();
  }
  v6[0] = a1;
  v6[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  sub_1DD328CF0((const char *)v6, a3);
  return swift_release();
}

uint64_t FamilyCircle.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v12;

  v1 = v0;
  v2 = sub_1DD3423D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = *(_DWORD *)(v1 + 16);
  if (v6 != -1 && notify_cancel(v6))
  {
    v7 = sub_1DD338ED8();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
    v8 = sub_1DD3423C0();
    v9 = sub_1DD3428AC();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DD30C000, v8, v9, "Failed to unregister for Family Circle update notifications", v10, 2u);
      MEMORY[0x1DF0D91B0](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DD329F10(v1 + 56);
  return v1;
}

uint64_t FamilyCircle.__deallocating_deinit()
{
  FamilyCircle.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1DD329168()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1DD342720();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DD342738();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(_QWORD *)(v1 + 24);
  aBlock[4] = sub_1DD32A7B8;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD3143AC;
  aBlock[3] = &block_descriptor_43;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_1DD34272C();
  v13[1] = MEMORY[0x1E0DEE9D8];
  sub_1DD3150D4((unint64_t *)&qword_1EDB64F88, v3, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FA8);
  sub_1DD32AA94((unint64_t *)&qword_1EDB64FB0, &qword_1EDB64FA8);
  sub_1DD342978();
  MEMORY[0x1DF0D89F4](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_1DD329334(void *a1, void *a2, uint64_t a3, uint8_t *a4, uint64_t a5, uint64_t a6, NSObject *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  char v26;
  char v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  _QWORD **v50;
  _QWORD *v51;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD **v57;
  _QWORD *v58;
  char v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD **v64;
  _QWORD *v65;
  char v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  id v71;
  dispatch_group_t v72;
  _QWORD *v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  char v88;
  char v89;
  char v90;

  v72 = a7;
  v81 = a5;
  v82 = a4;
  v80 = a3;
  v10 = sub_1DD3423D8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    if (a2)
    {
      v31 = a2;
      v32 = sub_1DD338ED8();
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v32, v10);
      v33 = a2;
      v34 = a2;
      v35 = sub_1DD3423C0();
      v36 = sub_1DD3428AC();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        v38 = swift_slowAlloc();
        *(_QWORD *)&v84 = v38;
        *(_DWORD *)v37 = 136315138;
        v82 = v37 + 4;
        swift_getErrorValue();
        v39 = sub_1DD342B7C();
        v83 = sub_1DD30EE20(v39, v40, (uint64_t *)&v84);
        sub_1DD342954();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1DD30C000, v35, v36, "Failed to fetch Family Circle with error: %s", v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1DF0D91B0](v38, -1, -1);
        MEMORY[0x1DF0D91B0](v37, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
LABEL_45:
    dispatch_group_leave(v72);
    return;
  }
  v79 = a6;
  v14 = a1;
  v15 = objc_msgSend(v14, sel_members);
  sub_1DD32AC08(0, &qword_1EDB64FC8);
  v16 = sub_1DD34281C();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_1DD342A38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v71 = v14;
  if (!v17)
  {
    swift_bridgeObjectRelease();
    v19 = MEMORY[0x1E0DEE9D8];
LABEL_18:
    v41 = *(_QWORD *)(v19 + 16);
    if (v41)
    {
      *(_QWORD *)&v75 = v80 + 16;
      v73 = v82 + 16;
      *(_QWORD *)&v76 = v79 + 16;
      v74 = v81 + 16;
      swift_beginAccess();
      v70[1] = v19;
      v42 = (unsigned __int8 *)(v19 + 98);
      do
      {
        v43 = *(uint8_t **)(v42 - 66);
        v44 = *(_QWORD *)(v42 - 58);
        v81 = *(_QWORD *)(v42 - 50);
        v82 = v43;
        v45 = *(_QWORD *)(v42 - 42);
        v80 = *(_QWORD *)(v42 - 34);
        v46 = *(_QWORD *)(v42 - 26);
        v79 = *(_QWORD *)(v42 - 18);
        v47 = *(_QWORD *)(v42 - 10);
        v48 = *(v42 - 2);
        v49 = *v42;
        LODWORD(v77) = *(v42 - 1);
        LODWORD(v78) = v48;
        if ((_DWORD)v77 == 1)
        {
          v50 = (_QWORD **)v75;
          swift_beginAccess();
          v51 = *v50;
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *v50 = v51;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v51 = sub_1DD32A2CC(0, v51[2] + 1, 1, v51);
            *(_QWORD *)v75 = v51;
          }
          v54 = v51[2];
          v53 = v51[3];
          if (v54 >= v53 >> 1)
          {
            v51 = sub_1DD32A2CC((_QWORD *)(v53 > 1), v54 + 1, 1, v51);
            *(_QWORD *)v75 = v51;
          }
          *((_QWORD *)&v85 + 1) = &type metadata for FamilyMember;
          *(_QWORD *)&v86 = &protocol witness table for FamilyMember;
          v55 = swift_allocObject();
          *(_QWORD *)&v84 = v55;
          *(_QWORD *)(v55 + 16) = v82;
          *(_QWORD *)(v55 + 24) = v44;
          *(_QWORD *)(v55 + 32) = v81;
          *(_QWORD *)(v55 + 40) = v45;
          *(_QWORD *)(v55 + 48) = v80;
          *(_QWORD *)(v55 + 56) = v46;
          *(_QWORD *)(v55 + 64) = v79;
          *(_QWORD *)(v55 + 72) = v47;
          *(_BYTE *)(v55 + 80) = v78;
          *(_BYTE *)(v55 + 81) = 1;
          *(_BYTE *)(v55 + 82) = v49;
          v56 = (uint64_t)&v51[5 * v54 + 4];
          v51[2] = v54 + 1;
        }
        else
        {
          if (!v48)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (!v49)
              goto LABEL_34;
LABEL_33:
            *((_QWORD *)&v85 + 1) = &type metadata for FamilyMember;
            *(_QWORD *)&v86 = &protocol witness table for FamilyMember;
            v63 = swift_allocObject();
            *(_QWORD *)&v84 = v63;
            *(_QWORD *)(v63 + 16) = v82;
            *(_QWORD *)(v63 + 24) = v44;
            *(_QWORD *)(v63 + 32) = v81;
            *(_QWORD *)(v63 + 40) = v45;
            *(_QWORD *)(v63 + 48) = v80;
            *(_QWORD *)(v63 + 56) = v46;
            *(_QWORD *)(v63 + 64) = v79;
            *(_QWORD *)(v63 + 72) = v47;
            *(_BYTE *)(v63 + 80) = v78;
            *(_BYTE *)(v63 + 81) = v77;
            *(_BYTE *)(v63 + 82) = 1;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1DD32ABC0((uint64_t)&v84, v74);
            goto LABEL_34;
          }
          v57 = (_QWORD **)v73;
          swift_beginAccess();
          v58 = *v57;
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          v59 = swift_isUniquelyReferenced_nonNull_native();
          *v57 = v58;
          if ((v59 & 1) == 0)
          {
            v58 = sub_1DD32A2CC(0, v58[2] + 1, 1, v58);
            *v73 = v58;
          }
          v61 = v58[2];
          v60 = v58[3];
          if (v61 >= v60 >> 1)
          {
            v58 = sub_1DD32A2CC((_QWORD *)(v60 > 1), v61 + 1, 1, v58);
            *v73 = v58;
          }
          *((_QWORD *)&v85 + 1) = &type metadata for FamilyMember;
          *(_QWORD *)&v86 = &protocol witness table for FamilyMember;
          v62 = swift_allocObject();
          *(_QWORD *)&v84 = v62;
          *(_QWORD *)(v62 + 16) = v82;
          *(_QWORD *)(v62 + 24) = v44;
          *(_QWORD *)(v62 + 32) = v81;
          *(_QWORD *)(v62 + 40) = v45;
          *(_QWORD *)(v62 + 48) = v80;
          *(_QWORD *)(v62 + 56) = v46;
          *(_QWORD *)(v62 + 64) = v79;
          *(_QWORD *)(v62 + 72) = v47;
          *(_WORD *)(v62 + 80) = 1;
          *(_BYTE *)(v62 + 82) = v49;
          v58[2] = v61 + 1;
          v56 = (uint64_t)&v58[5 * v61 + 4];
        }
        sub_1DD32AC7C(&v84, v56);
        swift_endAccess();
        if (v49)
          goto LABEL_33;
LABEL_34:
        v64 = (_QWORD **)v76;
        swift_beginAccess();
        v65 = *v64;
        v66 = swift_isUniquelyReferenced_nonNull_native();
        *v64 = v65;
        if ((v66 & 1) == 0)
        {
          v65 = sub_1DD32A2CC(0, v65[2] + 1, 1, v65);
          *(_QWORD *)v76 = v65;
        }
        v68 = v65[2];
        v67 = v65[3];
        if (v68 >= v67 >> 1)
        {
          v65 = sub_1DD32A2CC((_QWORD *)(v67 > 1), v68 + 1, 1, v65);
          *(_QWORD *)v76 = v65;
        }
        *((_QWORD *)&v85 + 1) = &type metadata for FamilyMember;
        *(_QWORD *)&v86 = &protocol witness table for FamilyMember;
        v69 = swift_allocObject();
        *(_QWORD *)&v84 = v69;
        *(_QWORD *)(v69 + 16) = v82;
        *(_QWORD *)(v69 + 24) = v44;
        *(_QWORD *)(v69 + 32) = v81;
        *(_QWORD *)(v69 + 40) = v45;
        *(_QWORD *)(v69 + 48) = v80;
        *(_QWORD *)(v69 + 56) = v46;
        *(_QWORD *)(v69 + 64) = v79;
        *(_QWORD *)(v69 + 72) = v47;
        *(_BYTE *)(v69 + 80) = v78;
        *(_BYTE *)(v69 + 81) = v77;
        *(_BYTE *)(v69 + 82) = v49;
        v65[2] = v68 + 1;
        sub_1DD32AC7C(&v84, (uint64_t)&v65[5 * v68 + 4]);
        swift_endAccess();
        v42 += 72;
        --v41;
      }
      while (v41);
    }

    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  v83 = MEMORY[0x1E0DEE9D8];
  sub_1DD32A408(0, v17 & ~(v17 >> 63), 0);
  if ((v17 & 0x8000000000000000) == 0)
  {
    v18 = 0;
    v19 = v83;
    do
    {
      if ((v16 & 0xC000000000000001) != 0)
        v20 = (id)MEMORY[0x1DF0D8AC0](v18, v16);
      else
        v20 = *(id *)(v16 + 8 * v18 + 32);
      sub_1DD327AA8(v20, (uint64_t)&v84);
      v21 = v84;
      v22 = v85;
      v23 = v86;
      v24 = v87;
      v25 = v88;
      v26 = v89;
      v27 = v90;
      v83 = v19;
      v29 = *(_QWORD *)(v19 + 16);
      v28 = *(_QWORD *)(v19 + 24);
      if (v29 >= v28 >> 1)
      {
        v78 = v84;
        v77 = v85;
        v76 = v86;
        v75 = v87;
        sub_1DD32A408(v28 > 1, v29 + 1, 1);
        v24 = v75;
        v23 = v76;
        v22 = v77;
        v21 = v78;
        v19 = v83;
      }
      ++v18;
      *(_QWORD *)(v19 + 16) = v29 + 1;
      v30 = v19 + 72 * v29;
      *(_OWORD *)(v30 + 32) = v21;
      *(_OWORD *)(v30 + 48) = v22;
      *(_OWORD *)(v30 + 64) = v23;
      *(_OWORD *)(v30 + 80) = v24;
      *(_BYTE *)(v30 + 96) = v25;
      *(_BYTE *)(v30 + 97) = v26;
      *(_BYTE *)(v30 + 98) = v27;
    }
    while (v17 != v18);
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  __break(1u);
}

void sub_1DD329CC8(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_1DD329D3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD329D60()
{
  uint64_t v0;

  return sub_1DD327F8C(*(uint64_t **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1DD329D68()
{
  return swift_deallocObject();
}

uint64_t sub_1DD329D78()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1DD329DB0()
{
  uint64_t v0;

  return sub_1DD3282A4(*(uint64_t **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1DD329DB8()
{
  return swift_deallocObject();
}

uint64_t sub_1DD329DC8()
{
  uint64_t v0;

  return sub_1DD32859C(*(uint64_t **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1DD329DD0()
{
  return swift_deallocObject();
}

uint64_t sub_1DD329DE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24) + 56;
  swift_beginAccess();
  sub_1DD32AB78(v2, (uint64_t)v11);
  if (v12)
  {
    sub_1DD32AE18((uint64_t)v11, (uint64_t)v8);
    sub_1DD329F10((uint64_t)v11);
    v3 = v9;
    v4 = v10;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    v5 = *(_QWORD *)(v4 + 8);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    *((_QWORD *)&v14 + 1) = v3;
    v15 = v4;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v13);
    v6(v3, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  }
  else
  {
    sub_1DD329F10((uint64_t)v11);
    v13 = 0u;
    v14 = 0u;
    v15 = 0;
  }
  return sub_1DD32ABC0((uint64_t)&v13, v1);
}

uint64_t sub_1DD329EB8()
{
  return swift_deallocObject();
}

uint64_t sub_1DD329EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD329F10(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64CA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for FamilyMember()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FamilyMember(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FamilyMember(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  return a1;
}

__n128 __swift_memcpy67_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 63) = *(_DWORD *)(a2 + 63);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for FamilyMember(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  return a1;
}

uint64_t getEnumTagSinglePayload for FamilyMember(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 67))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyMember(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 66) = 0;
    *(_WORD *)(result + 64) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 67) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 67) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FamilyMember()
{
  return &type metadata for FamilyMember;
}

uint64_t type metadata accessor for FamilyCircle()
{
  return objc_opt_self();
}

uint64_t method lookup function for FamilyCircle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FamilyCircle.members.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of FamilyCircle.guardians.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of FamilyCircle.children.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of FamilyCircle.currentMember.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of FamilyCircle.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

void sub_1DD32A2A4(const char *a1)
{
  uint64_t v1;

  sub_1DD328CF0(a1, v1);
}

_QWORD *sub_1DD32A2CC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4500);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1DD32AD0C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DD32A3EC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1DD32A424(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1DD32A408(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DD32A5C4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DD32A424(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4500);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4508);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1DD342A68();
  __break(1u);
  return result;
}

uint64_t sub_1DD32A5C4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4510);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 72 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1DD342A68();
  __break(1u);
  return result;
}

uint64_t sub_1DD32A740()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DD32A764()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1DD329168();
    return swift_release();
  }
  return result;
}

uint64_t sub_1DD32A7B8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  id v12;
  _QWORD aBlock[7];

  v1 = v0;
  v2 = swift_allocObject();
  v3 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + 16) = MEMORY[0x1E0DEE9D8];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v3;
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 32) = 0u;
  *(_QWORD *)(v6 + 48) = 0;
  *(_OWORD *)(v6 + 16) = 0u;
  v7 = dispatch_group_create();
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D20EB0]), sel_init);
  objc_msgSend(v12, sel_setCachePolicy_, 1);
  dispatch_group_enter(v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v4;
  v8[4] = v6;
  v8[5] = v2;
  v8[6] = v7;
  aBlock[4] = sub_1DD32AB68;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD329CC8;
  aBlock[3] = &block_descriptor_57;
  v9 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v10 = v7;
  swift_release();
  objc_msgSend(v12, sel_startRequestWithCompletionHandler_, v9);
  _Block_release(v9);
  sub_1DD3428DC();
  swift_beginAccess();
  v1[4] = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[5] = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[6] = *(_QWORD *)(v5 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_1DD32AB78(v6 + 16, (uint64_t)aBlock);
  swift_beginAccess();
  sub_1DD32ABC0((uint64_t)aBlock, (uint64_t)(v1 + 7));
  swift_endAccess();

  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1DD32AA94(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DD32AAD4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DD32AAF8()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1DD32AB24()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_1DD32AB68(void *a1, void *a2)
{
  uint64_t v2;

  sub_1DD329334(a1, a2, *(_QWORD *)(v2 + 16), *(uint8_t **)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(NSObject **)(v2 + 48));
}

uint64_t sub_1DD32AB78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD32ABC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD32AC08(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1DD32AC40()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DD32AC7C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1DD32AC94(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_1DD32AC7C(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_1DD32AD0C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4508);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1DD342A68();
  __break(1u);
  return result;
}

uint64_t sub_1DD32AE18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

FamilyControls::Locations __swiftcall Locations.init(useExplicitLocations:)(FamilyControls::Locations useExplicitLocations)
{
  FamilyControls::Locations *v1;

  v1->useExplicitLocations = useExplicitLocations.useExplicitLocations;
  return useExplicitLocations;
}

uint64_t Locations.familyControlsAuthorization.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD32B110(0xD000000000000014, 0x80000001DD347D70, a1);
}

uint64_t Locations.familyControlsDataDirectory.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v1 = sub_1DD3421F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD342258();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v10[0]) = *v0;
  sub_1DD32B540();
  v10[0] = 0xD00000000000001DLL;
  v10[1] = 0x80000001DD347D50;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CAFD60], v1);
  sub_1DD31A10C();
  sub_1DD34224C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t Locations.familyControlsInternalAuthorization.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD32B110(0xD00000000000001CLL, 0x80000001DD347D90, a1);
}

uint64_t Locations.familyControlsKeyData.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD32B110(0x2E6174614479654BuLL, 0xED00007473696C70, a1);
}

uint64_t Locations.familyControlsStore.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD32B110(0x6C702E65726F7453uLL, 0xEB00000000747369, a1);
}

uint64_t Locations.familyControlsPrivateSyncMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD32B110(0xD000000000000019, 0x80000001DD347DB0, a1);
}

uint64_t Locations.familyControlsSharedSyncMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD32B110(0xD000000000000018, 0x80000001DD347DD0, a1);
}

uint64_t Locations.familyControlsPrivateSyncSerialization.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD32B110(0xD00000000000001ELL, 0x80000001DD347DF0, a1);
}

uint64_t Locations.familyControlsSharedSyncSerialization.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD32B110(0xD00000000000001DLL, 0x80000001DD347E10, a1);
}

uint64_t sub_1DD32B110@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, _QWORD, uint64_t);
  void (*v16)(char *, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v20 = a1;
  v21 = a2;
  v22 = a3;
  v4 = sub_1DD3421F8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD342258();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v19 - v13;
  LOBYTE(v23) = *v3;
  sub_1DD32B540();
  v23 = 0xD00000000000001DLL;
  v24 = 0x80000001DD347D50;
  v15 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v15(v7, *MEMORY[0x1E0CAFD60], v4);
  sub_1DD31A10C();
  sub_1DD34224C();
  v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v7, v4);
  swift_bridgeObjectRelease();
  v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v12, v8);
  v23 = v20;
  v24 = v21;
  v15(v7, *MEMORY[0x1E0CAFD68], v4);
  sub_1DD34224C();
  v16(v7, v4);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v17)(v14, v8);
}

uint64_t Locations.familyControlsCacheDirectory.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t result;
  id v14;
  id v16[3];

  v1 = sub_1DD3421F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v16[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD342258();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*v0 == 1)
  {
    sub_1DD342204();
LABEL_5:
    v16[0] = (id)0xD00000000000001DLL;
    v16[1] = (id)0x80000001DD347D50;
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CAFD60], v1);
    sub_1DD31A10C();
    sub_1DD34224C();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v16[0] = 0;
  v10 = objc_msgSend(v9, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 13, 1, 0, 1, v16);

  v11 = v16[0];
  if (v10)
  {
    sub_1DD342228();
    v12 = v11;

    goto LABEL_5;
  }
  v14 = v16[0];
  sub_1DD3421EC();

  swift_willThrow();
  result = sub_1DD342A2C();
  __break(1u);
  return result;
}

void sub_1DD32B540()
{
  _BYTE *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  if (*v0 == 1)
  {
    sub_1DD342204();
  }
  else
  {
    v1 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v6[0] = 0;
    v2 = objc_msgSend(v1, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 5, 1, 0, 1, v6);

    v3 = v6[0];
    if (v2)
    {
      sub_1DD342228();
      v4 = v3;

    }
    else
    {
      v5 = v6[0];
      sub_1DD3421EC();

      swift_willThrow();
      sub_1DD342A2C();
      __break(1u);
    }
  }
}

uint64_t getEnumTagSinglePayload for Locations(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Locations(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DD32B7D8 + 4 * byte_1DD344475[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DD32B80C + 4 * byte_1DD344470[v4]))();
}

uint64_t sub_1DD32B80C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD32B814(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD32B81CLL);
  return result;
}

uint64_t sub_1DD32B828(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD32B830);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DD32B834(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD32B83C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Locations()
{
  return &type metadata for Locations;
}

uint64_t dispatch thunk of FamilyMemberable.firstName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FamilyMemberable.lastName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of FamilyMemberable.fullName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FamilyMemberable.altDSID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FamilyMemberable.appleID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FamilyMemberable.isParent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of FamilyMemberable.isChild.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of FamilyMemberable.isMe.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_1DD32B898()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_isEmbedded);
}

uint64_t sub_1DD32B8A8()
{
  return sub_1DD32B8C0(&OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_headerText);
}

uint64_t sub_1DD32B8B4()
{
  return sub_1DD32B8C0(&OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_footerText);
}

uint64_t sub_1DD32B8C0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1DD32B8F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (_QWORD *)(v1 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection + 8);
  v5 = *(_BYTE *)(v1 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection + 16);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection + 24);
  v7 = v2[4];
  v8 = v2[5];
  v9 = v2[6];
  v10 = v2[7];
  v11 = v2[8];
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DD32B990()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_dismissCallback);
  swift_retain();
  return v1;
}

void *sub_1DD32B9C8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1DD32BA14(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1DD32BA64())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1DD32BAA8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  objc_class *v8;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  _QWORD *v24;
  objc_super v26;

  v17 = objc_allocWithZone(v8);
  v18 = *a6;
  v19 = a6[1];
  *(_QWORD *)&v17[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController] = 0;
  v20 = *((_BYTE *)a6 + 16);
  v17[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_isEmbedded] = a1;
  v21 = &v17[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_headerText];
  *v21 = a2;
  v21[1] = a3;
  v22 = &v17[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_footerText];
  *v22 = a4;
  v22[1] = a5;
  v23 = &v17[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection];
  *(_QWORD *)v23 = v18;
  *((_QWORD *)v23 + 1) = v19;
  v23[16] = v20;
  *(_OWORD *)(v23 + 24) = *(_OWORD *)(a6 + 3);
  *(_OWORD *)(v23 + 40) = *(_OWORD *)(a6 + 5);
  *(_OWORD *)(v23 + 56) = *(_OWORD *)(a6 + 7);
  v24 = &v17[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_dismissCallback];
  *v24 = a7;
  v24[1] = a8;
  v26.receiver = v17;
  v26.super_class = v8;
  return objc_msgSendSuper2(&v26, sel_initWithNibName_bundle_, 0, 0);
}

id sub_1DD32BBA8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  objc_super v17;

  v9 = *a6;
  v10 = a6[1];
  v11 = *((_BYTE *)a6 + 16);
  *(_QWORD *)&v8[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController] = 0;
  v8[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_isEmbedded] = a1;
  v12 = &v8[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_headerText];
  *v12 = a2;
  v12[1] = a3;
  v13 = &v8[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_footerText];
  *v13 = a4;
  v13[1] = a5;
  v14 = &v8[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection];
  *(_QWORD *)v14 = v9;
  *((_QWORD *)v14 + 1) = v10;
  v14[16] = v11;
  *(_OWORD *)(v14 + 24) = *(_OWORD *)(a6 + 3);
  *(_OWORD *)(v14 + 40) = *(_OWORD *)(a6 + 5);
  *(_OWORD *)(v14 + 56) = *(_OWORD *)(a6 + 7);
  v15 = &v8[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_dismissCallback];
  *v15 = a7;
  v15[1] = a8;
  v17.receiver = v8;
  v17.super_class = (Class)type metadata accessor for ActivityPickerViewController();
  return objc_msgSendSuper2(&v17, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for ActivityPickerViewController()
{
  return objc_opt_self();
}

void sub_1DD32BC7C()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController] = 0;

  sub_1DD342A2C();
  __break(1u);
}

uint64_t sub_1DD32BD58()
{
  void *v0;
  id v1;
  uint64_t v2;
  id v3;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  objc_msgSend(v0, sel_setView_, v1);
  type metadata accessor for ActivityPickerRemoteViewController();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = v0;
  sub_1DD30F660((uint64_t)sub_1DD32C0E4, v2);

  return swift_release();
}

void sub_1DD32BDF0(void *a1, char a2, _QWORD *a3)
{
  _QWORD *v5;
  void (*v6)(void *);
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void (*v14)(uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), _QWORD *);
  _QWORD *v15;
  _QWORD *v16;
  void (*v17)(uint64_t (*)(), uint64_t);
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;

  if ((a2 & 1) != 0)
  {
    v18 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
    v19 = a1;
    v20 = objc_msgSend(v18, sel_init);
    swift_getErrorValue();
    sub_1DD342B7C();
    v21 = (void *)sub_1DD34278C();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel_setText_, v21);

    objc_msgSend(v20, sel_setNumberOfLines_, 0);
    v22 = objc_msgSend(a3, sel_view);
    if (v22)
    {
      v23 = v22;
      objc_msgSend(v22, sel_addSubview_, v20);

      sub_1DD32DAB8(v20);
      sub_1DD32FE8C(a1);
      return;
    }
  }
  else
  {
    v5 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v6 = *(void (**)(void *))((*MEMORY[0x1E0DEEDD8] & *a3) + 0x88);
    sub_1DD32FE98(a1);
    v7 = a1;
    v6(a1);
    objc_msgSend(a3, sel_addChildViewController_, v7);
    v8 = objc_msgSend(v7, sel_view);
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(a3, sel_view);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, sel_addSubview_, v9);

        sub_1DD32DAB8(v9);
        objc_msgSend(v7, sel_didMoveToParentViewController_, a3);
        sub_1DD32CDD0();
        v12 = swift_allocObject();
        *(_QWORD *)(v12 + 16) = a3;
        *(_QWORD *)(v12 + 24) = v7;
        v13 = (_QWORD *)swift_allocObject();
        v13[2] = a3;
        v13[3] = sub_1DD32FED0;
        v13[4] = v12;
        v14 = *(void (**)(uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), _QWORD *))((*v5 & *v7) + 0x68);
        v15 = a3;
        sub_1DD32FE98(a1);
        v16 = v15;
        swift_retain();
        v14(sub_1DD32FF7C, v13);
        v17 = *(void (**)(uint64_t (*)(), uint64_t))((*v5 & *v7) + 0x80);
        swift_retain();
        v17(sub_1DD32FED0, v12);

        swift_release();
        sub_1DD32FE8C(a1);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1DD32C0C0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1DD32C0E4(void *a1, char a2)
{
  uint64_t v2;

  sub_1DD32BDF0(a1, a2 & 1, *(_QWORD **)(v2 + 16));
}

uint64_t sub_1DD32C0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t), uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
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
  unint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t KeyPath;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  __int128 v115;

  v91 = a8;
  v90 = a6;
  v89 = a5;
  v88 = a4;
  v94 = a3;
  v93 = a2;
  v92 = a1;
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
  v85 = *(_QWORD *)(v86 - 8);
  v10 = MEMORY[0x1E0C80A78](v86);
  v84 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v83 = (char *)&v77 - v12;
  v82 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
  v81 = *(_QWORD *)(v82 - 8);
  v13 = MEMORY[0x1E0C80A78](v82);
  v80 = (char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v79 = (char *)&v77 - v15;
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
  v77 = *(_QWORD *)(v78 - 8);
  v16 = MEMORY[0x1E0C80A78](v78);
  v18 = (char *)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v77 - v19;
  v21 = (_QWORD *)(a7 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection);
  v22 = *(_QWORD *)(a7 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection + 8);
  v104 = *(_QWORD *)(a7 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection);
  LODWORD(a7) = *(unsigned __int8 *)(a7 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection + 16);
  v23 = v21[3];
  v24 = v21[4];
  v25 = v21[5];
  v26 = v21[6];
  v27 = v21[7];
  v28 = v21[8];
  KeyPath = swift_getKeyPath();
  v106 = v104;
  *(_QWORD *)&v107 = v22;
  v101 = v22;
  v103 = a7;
  BYTE8(v107) = a7;
  v108 = v23;
  v109 = v24;
  v110 = v25;
  v111 = v26;
  v112 = v27;
  v113 = v28;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4578);
  sub_1DD342708();
  v29 = v92;
  v96 = v28;
  swift_bridgeObjectRelease();
  v97 = v27;
  swift_bridgeObjectRelease();
  v98 = v26;
  v30 = v101;
  swift_bridgeObjectRelease();
  v99 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v31 = v24;
  v106 = v114;
  v107 = v115;
  v32 = MEMORY[0x1E0DEE9E8];
  v105 = MEMORY[0x1E0DEE9E8];
  v33 = *(_QWORD *)(v29 + 16);
  v95 = v23;
  v100 = v31;
  if (v33)
  {
    swift_bridgeObjectRetain();
    v34 = (unint64_t *)(v29 + 40);
    v35 = v78;
    v36 = v77;
    do
    {
      v37 = *(v34 - 1);
      v38 = *v34;
      sub_1DD319BC8(v37, *v34);
      sub_1DD319BC8(v37, v38);
      sub_1DD342330();
      sub_1DD34236C();
      sub_1DD32ED20((uint64_t)v20, v18, &qword_1F03D4880, &qword_1F03D44A8, &qword_1F03D45C0, &qword_1F03D44B0);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v20, v35);
      sub_1DD319C20(v37, v38);
      v34 += 2;
      --v33;
    }
    while (v33);
    swift_bridgeObjectRelease();
    v32 = v105;
    v39 = v100;
    v30 = v101;
    v23 = v95;
  }
  else
  {
    v39 = v31;
  }
  v92 = a9;
  v105 = v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4580);
  sub_1DD3426FC();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v106 = v104;
  *(_QWORD *)&v107 = v30;
  BYTE8(v107) = v103;
  v108 = v23;
  v109 = v39;
  v110 = v99;
  v111 = v98;
  v112 = v97;
  v113 = v96;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v106 = v114;
  v107 = v115;
  v40 = MEMORY[0x1E0DEE9E8];
  v105 = MEMORY[0x1E0DEE9E8];
  v41 = v30;
  v42 = *(_QWORD *)(v93 + 16);
  if (v42)
  {
    v43 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    v44 = v82;
    v45 = v81;
    v46 = v80;
    v47 = (uint64_t)v79;
    do
    {
      v48 = *(v43 - 1);
      v49 = *v43;
      sub_1DD319BC8(v48, *v43);
      sub_1DD319BC8(v48, v49);
      sub_1DD342354();
      sub_1DD34236C();
      sub_1DD32ED20(v47, v46, (uint64_t *)&unk_1F03D4870, &qword_1F03D4498, &qword_1F03D45B8, &qword_1F03D44A0);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v47, v44);
      sub_1DD319C20(v48, v49);
      v43 += 2;
      --v42;
    }
    while (v42);
    swift_bridgeObjectRelease();
    v40 = v105;
    v39 = v100;
    v50 = v101;
    v23 = v95;
  }
  else
  {
    v50 = v41;
  }
  v105 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4588);
  sub_1DD3426FC();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v106 = v104;
  *(_QWORD *)&v107 = v50;
  BYTE8(v107) = v103;
  v108 = v23;
  v109 = v39;
  v110 = v99;
  v111 = v98;
  v112 = v97;
  v113 = v96;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v51 = v23;
  v52 = v39;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v106 = v114;
  v107 = v115;
  v53 = MEMORY[0x1E0DEE9E8];
  v105 = MEMORY[0x1E0DEE9E8];
  v54 = v50;
  v55 = *(_QWORD *)(v94 + 16);
  if (v55)
  {
    v56 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    v57 = v86;
    v58 = v85;
    v59 = v84;
    v60 = (uint64_t)v83;
    do
    {
      v61 = *(v56 - 1);
      v62 = *v56;
      sub_1DD319BC8(v61, *v56);
      sub_1DD319BC8(v61, v62);
      sub_1DD34239C();
      sub_1DD34236C();
      sub_1DD32ED20(v60, v59, &qword_1F03D4000, &qword_1F03D4488, &qword_1F03D45B0, &qword_1F03D4490);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v60, v57);
      sub_1DD319C20(v61, v62);
      v56 += 2;
      --v55;
    }
    while (v55);
    swift_bridgeObjectRelease();
    v53 = v105;
    v52 = v100;
    v54 = v101;
    v51 = v95;
  }
  v105 = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4590);
  sub_1DD3426FC();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v106 = v104;
  *(_QWORD *)&v107 = v54;
  BYTE8(v107) = v103;
  v108 = v51;
  v109 = v52;
  v64 = v98;
  v63 = v99;
  v110 = v99;
  v111 = v98;
  v65 = v97;
  v66 = v96;
  v112 = v97;
  v113 = v96;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v106 = v114;
  v107 = v115;
  v67 = v51;
  v68 = swift_bridgeObjectRetain();
  v69 = sub_1DD319580(v68);
  swift_bridgeObjectRelease();
  v105 = v69;
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4598);
  sub_1DD3426FC();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_getKeyPath();
  v70 = v104;
  v106 = v104;
  *(_QWORD *)&v107 = v101;
  BYTE8(v107) = v103;
  v108 = v67;
  v109 = v100;
  v110 = v63;
  v111 = v64;
  v112 = v65;
  v113 = v66;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v106 = v114;
  v107 = v115;
  v71 = swift_bridgeObjectRetain();
  v72 = sub_1DD319580(v71);
  swift_bridgeObjectRelease();
  v105 = v72;
  sub_1DD3426FC();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_getKeyPath();
  v106 = v70;
  *(_QWORD *)&v107 = v101;
  BYTE8(v107) = v103;
  v108 = v95;
  v109 = v100;
  v110 = v63;
  v111 = v64;
  v112 = v65;
  v113 = v66;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v106 = v114;
  v107 = v115;
  v73 = swift_bridgeObjectRetain();
  v74 = sub_1DD319580(v73);
  swift_bridgeObjectRelease();
  v105 = v74;
  sub_1DD3426FC();
  swift_bridgeObjectRelease();
  swift_release();
  v75 = swift_release();
  return v91(v75);
}

uint64_t sub_1DD32CDD0()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = v0 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection);
  v3 = *(_QWORD *)(v1 + 8);
  v30 = *(_BYTE *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 48);
  v8 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  swift_getKeyPath();
  v38 = v4;
  v39 = v5;
  v40 = v7;
  v41 = v6;
  v42 = v8;
  v43 = v9;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4578);
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v35 = v31;
  v36 = v32;
  v37 = v33;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4580);
  MEMORY[0x1DF0D87CC](&v34, v10);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DD32D7F0(v34, &qword_1F03D4880);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v35 = v2;
  v36 = v3;
  LOBYTE(v37) = v30;
  v38 = v4;
  v39 = v5;
  v40 = v7;
  v41 = v6;
  v42 = v8;
  v43 = v9;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v35 = v31;
  v36 = v32;
  v37 = v33;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4588);
  MEMORY[0x1DF0D87CC](&v34, v11);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DD32D7F0(v34, (uint64_t *)&unk_1F03D4870);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v35 = v2;
  v36 = v3;
  LOBYTE(v37) = v30;
  v38 = v4;
  v39 = v5;
  v40 = v7;
  v41 = v6;
  v42 = v8;
  v43 = v9;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v35 = v31;
  v36 = v32;
  v37 = v33;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4590);
  MEMORY[0x1DF0D87CC](&v34, v12);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DD32D7F0(v34, &qword_1F03D4000);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v35 = v2;
  v36 = v3;
  LOBYTE(v37) = v30;
  v38 = v4;
  v39 = v5;
  v40 = v7;
  v41 = v6;
  v42 = v8;
  v43 = v9;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v35 = v31;
  v36 = v32;
  v37 = v33;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4598);
  MEMORY[0x1DF0D87CC](&v34);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DD32FA78(v34);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v35 = v2;
  v36 = v3;
  LOBYTE(v37) = v30;
  v38 = v4;
  v39 = v5;
  v40 = v7;
  v41 = v6;
  v42 = v8;
  v43 = v9;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v35 = v31;
  v36 = v32;
  v37 = v33;
  MEMORY[0x1DF0D87CC](&v34, v28);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DD32FA78(v34);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v35 = v2;
  v36 = v3;
  LOBYTE(v37) = v30;
  v38 = v4;
  v39 = v5;
  v40 = v7;
  v41 = v6;
  v42 = v8;
  v43 = v9;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DD342708();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v35 = v31;
  v36 = v32;
  v37 = v33;
  MEMORY[0x1DF0D87CC](&v34, v28);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DD32FA78(v34);
  v13 = swift_bridgeObjectRelease();
  v14 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v26) + 0xB0))(v13);
  if (v14)
  {
    v15 = (void *)v14;
    v25 = *((unsigned __int8 *)v26 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_isEmbedded);
    if (*(_QWORD *)((char *)v26 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_headerText + 8))
      v24 = (void *)sub_1DD34278C();
    else
      v24 = 0;
    if (*(_QWORD *)((char *)v26 + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_footerText + 8))
      v27 = (void *)sub_1DD34278C();
    else
      v27 = 0;
    v35 = v2;
    v36 = v3;
    LOBYTE(v37) = v30;
    v38 = v4;
    v39 = v5;
    v40 = v7;
    v41 = v6;
    v42 = v8;
    v43 = v9;
    MEMORY[0x1DF0D87CC](&v31, v29);
    v17 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = (void *)sub_1DD342810();
    swift_bridgeObjectRelease();
    v19 = (void *)sub_1DD342810();
    swift_bridgeObjectRelease();
    v20 = (void *)sub_1DD342810();
    swift_bridgeObjectRelease();
    v21 = (void *)sub_1DD342810();
    swift_release();
    v22 = (void *)sub_1DD342810();
    swift_release();
    v23 = (void *)sub_1DD342810();
    swift_release();
    objc_msgSend(v15, sel_configureWithIsEmbedded_headerText_footerText_includeEntireCategory_selectedApplications_selectedCategories_selectedWebDomains_selectedUntokenizedApplications_selectedUntokenizedCategories_selectedUntokenizedWebDomains_, v25, v24, v27, v17, v18, v19, v20, v21, v22, v23);

    return swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1DD32D7F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  int64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v32 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v31 = (char *)&v28 - v7;
  v8 = *(_QWORD *)(a1 + 56);
  v29 = a1 + 56;
  v9 = 1 << *(_BYTE *)(a1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v8;
  v30 = (unint64_t)(v9 + 63) >> 6;
  v33 = a1;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  v14 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (!v11)
    goto LABEL_5;
LABEL_4:
  v15 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (i = v15 | (v13 << 6); ; i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    v20 = v31;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v31, *(_QWORD *)(v33 + 48) + *(_QWORD *)(v4 + 72) * i, v3);
    v21 = v32;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v32, v20, v3);
    v22 = sub_1DD342360();
    v24 = v23;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v21, v3);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1DD32EC14(0, v14[2] + 1, 1, v14);
      v14 = (_QWORD *)result;
    }
    v26 = v14[2];
    v25 = v14[3];
    if (v26 >= v25 >> 1)
    {
      result = (uint64_t)sub_1DD32EC14((_QWORD *)(v25 > 1), v26 + 1, 1, v14);
      v14 = (_QWORD *)result;
    }
    v14[2] = v26 + 1;
    v27 = &v14[2 * v26];
    v27[4] = v22;
    v27[5] = v24;
    if (v11)
      goto LABEL_4;
LABEL_5:
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v17 >= v30)
      goto LABEL_27;
    v18 = *(_QWORD *)(v29 + 8 * v17);
    ++v13;
    if (!v18)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v30)
        goto LABEL_27;
      v18 = *(_QWORD *)(v29 + 8 * v13);
      if (!v18)
      {
        v13 = v17 + 2;
        if (v17 + 2 >= v30)
          goto LABEL_27;
        v18 = *(_QWORD *)(v29 + 8 * v13);
        if (!v18)
        {
          v13 = v17 + 3;
          if (v17 + 3 >= v30)
            goto LABEL_27;
          v18 = *(_QWORD *)(v29 + 8 * v13);
          if (!v18)
            break;
        }
      }
    }
LABEL_20:
    v11 = (v18 - 1) & v18;
  }
  v19 = v17 + 4;
  if (v19 >= v30)
  {
LABEL_27:
    swift_release();
    return (uint64_t)v14;
  }
  v18 = *(_QWORD *)(v29 + 8 * v19);
  if (v18)
  {
    v13 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    v13 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v13 >= v30)
      goto LABEL_27;
    v18 = *(_QWORD *)(v29 + 8 * v13);
    ++v19;
    if (v18)
      goto LABEL_20;
  }
LABEL_29:
  __break(1u);
  return result;
}

void sub_1DD32DAB8(void *a1)
{
  void *v1;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v3 = objc_msgSend(a1, sel_topAnchor);
  v4 = objc_msgSend(v1, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_topAnchor);

  v7 = objc_msgSend(v3, sel_constraintEqualToAnchor_, v6);
  objc_msgSend(v7, sel_setActive_, 1);

  v8 = objc_msgSend(a1, sel_bottomAnchor);
  v9 = objc_msgSend(v1, sel_view);
  if (!v9)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_bottomAnchor);

  v12 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v11);
  objc_msgSend(v12, sel_setActive_, 1);

  v13 = objc_msgSend(a1, sel_leftAnchor);
  v14 = objc_msgSend(v1, sel_view);
  if (!v14)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, sel_leftAnchor);

  v17 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v16);
  objc_msgSend(v17, sel_setActive_, 1);

  v18 = objc_msgSend(a1, sel_rightAnchor);
  v19 = objc_msgSend(v1, sel_view);
  if (v19)
  {
    v20 = v19;
    v21 = objc_msgSend(v19, sel_rightAnchor);

    v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
    objc_msgSend(v22, sel_setActive_, 1);

    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_1DD32DD40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD v16[2];
  __int128 v17;
  __int128 v18;
  __int128 aBlock;
  __int128 v20;
  uint64_t (*v21)(void *);
  uint64_t v22;

  v1 = sub_1DD3423D8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))(v3);
  if (v6)
  {
    v7 = (void *)v6;
    v21 = sub_1DD32DF7C;
    v22 = 0;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v20 = sub_1DD32E164;
    *((_QWORD *)&v20 + 1) = &block_descriptor_3;
    v8 = _Block_copy(&aBlock);
    v9 = objc_msgSend(v7, sel_serviceViewControllerProxyWithErrorHandler_, v8);
    _Block_release(v8);

    if (v9)
    {
      sub_1DD34296C();
      swift_unknownObjectRelease();
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    sub_1DD32E1D0((uint64_t)&v17, (uint64_t)&aBlock);
  }
  else
  {
    aBlock = 0u;
    v20 = 0u;
  }
  sub_1DD32E218((uint64_t)&aBlock, (uint64_t)&v17);
  if (*((_QWORD *)&v18 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4548);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = v16[1];
      sub_1DD310B9C((uint64_t)&aBlock);
      return v10;
    }
  }
  else
  {
    sub_1DD310B9C((uint64_t)&v17);
  }
  v11 = sub_1DD338BAC();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v11, v1);
  v12 = sub_1DD3423C0();
  v13 = sub_1DD3428AC();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1DD30C000, v12, v13, "Failed to get service interface", v14, 2u);
    MEMORY[0x1DF0D91B0](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  sub_1DD310B9C((uint64_t)&aBlock);
  return 0;
}

uint64_t sub_1DD32DF7C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;

  v2 = sub_1DD3423D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD338BAC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = a1;
  v9 = sub_1DD3423C0();
  v10 = sub_1DD3428AC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = (uint64_t)a1;
    v19 = v12;
    *(_DWORD *)v11 = 136446210;
    v17[1] = v11 + 4;
    v13 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A70);
    v14 = sub_1DD3427A4();
    v18 = sub_1DD30EE20(v14, v15, &v19);
    sub_1DD342954();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1DD30C000, v9, v10, "Failed to get service proxy: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D91B0](v12, -1, -1);
    MEMORY[0x1DF0D91B0](v11, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_1DD32E164(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_1DD32E1D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD32E218(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1DD32E260()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1DD32E2BC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityPickerViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DD32E3C0()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_1DD32E3C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD32E3F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD32E420@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v1 + 40);
  v3 = *(_QWORD *)(v1 + 48);
  v4 = *(_BYTE *)(v1 + 56);
  v5 = *(_QWORD *)(v1 + 64);
  v6 = *(_QWORD *)(v1 + 72);
  v7 = *(_QWORD *)(v1 + 80);
  v8 = *(_QWORD *)(v1 + 88);
  v10 = *(_QWORD *)(v1 + 96);
  v9 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v9;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DD32E4B0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_retain();
  return v1;
}

id sub_1DD32E4DC()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  _BYTE *v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  objc_super v24;

  v17 = *v0;
  v18 = *((_QWORD *)v0 + 2);
  v19 = *((_QWORD *)v0 + 1);
  v1 = *((_QWORD *)v0 + 4);
  v2 = *((_QWORD *)v0 + 6);
  v20 = *((_QWORD *)v0 + 3);
  v21 = *((_QWORD *)v0 + 5);
  v22 = v0[56];
  v4 = *((_QWORD *)v0 + 8);
  v3 = *((_QWORD *)v0 + 9);
  v6 = *((_QWORD *)v0 + 10);
  v5 = *((_QWORD *)v0 + 11);
  v8 = *((_QWORD *)v0 + 12);
  v7 = *((_QWORD *)v0 + 13);
  v9 = *((_QWORD *)v0 + 15);
  v23 = *((_QWORD *)v0 + 14);
  v10 = (objc_class *)type metadata accessor for ActivityPickerViewController();
  v11 = objc_allocWithZone(v10);
  *(_QWORD *)&v11[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController] = 0;
  v11[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_isEmbedded] = v17;
  v12 = &v11[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_headerText];
  *v12 = v19;
  v12[1] = v18;
  v13 = &v11[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_footerText];
  *v13 = v20;
  v13[1] = v1;
  v14 = &v11[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_selection];
  *(_QWORD *)v14 = v21;
  *((_QWORD *)v14 + 1) = v2;
  v14[16] = v22;
  *((_QWORD *)v14 + 3) = v4;
  *((_QWORD *)v14 + 4) = v3;
  *((_QWORD *)v14 + 5) = v6;
  *((_QWORD *)v14 + 6) = v5;
  *((_QWORD *)v14 + 7) = v8;
  *((_QWORD *)v14 + 8) = v7;
  v15 = &v11[OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_dismissCallback];
  *v15 = v23;
  v15[1] = v9;
  v24.receiver = v11;
  v24.super_class = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return objc_msgSendSuper2(&v24, sel_initWithNibName_bundle_, 0, 0);
}

__n128 sub_1DD32E660@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __n128 result;

  v9 = *a6;
  v10 = a6[1];
  v11 = *((_BYTE *)a6 + 16);
  *(_BYTE *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = v9;
  *(_QWORD *)(a9 + 48) = v10;
  *(_BYTE *)(a9 + 56) = v11;
  v12 = *(_OWORD *)(a6 + 5);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(a6 + 3);
  *(_OWORD *)(a9 + 80) = v12;
  result = *(__n128 *)(a6 + 7);
  *(__n128 *)(a9 + 96) = result;
  *(_QWORD *)(a9 + 112) = a7;
  *(_QWORD *)(a9 + 120) = a8;
  return result;
}

uint64_t sub_1DD32E6A8()
{
  return sub_1DD3425DC();
}

uint64_t sub_1DD32E6E0()
{
  sub_1DD32FE48();
  return sub_1DD342618();
}

uint64_t sub_1DD32E730()
{
  sub_1DD32FE48();
  return sub_1DD3425E8();
}

void sub_1DD32E780()
{
  sub_1DD32FE48();
  sub_1DD34260C();
  __break(1u);
}

uint64_t sub_1DD32E7A8()
{
  return MEMORY[0x1E0CE0788];
}

uint64_t destroy for ActivityPickerViewController.Representable()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for ActivityPickerViewController.Representable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v8 = *(_QWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ActivityPickerViewController.Representable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for ActivityPickerViewController.Representable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityPickerViewController.Representable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 128))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityPickerViewController.Representable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityPickerViewController.Representable()
{
  return &type metadata for ActivityPickerViewController.Representable;
}

_QWORD *sub_1DD32EC14(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D45A0);
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
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1DD32FD58(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DD32ED20(uint64_t a1, char *a2, uint64_t *a3, unint64_t *a4, uint64_t *a5, unint64_t *a6)
{
  uint64_t *v6;
  uint64_t *v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD, _QWORD, _QWORD);
  void (*v24)(_QWORD, _QWORD, _QWORD);
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t *v27;
  char isUniquelyReferenced_nonNull_native;
  char *v29;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  unint64_t *v38;
  char *v39;
  uint64_t v40;

  v38 = a6;
  v33 = a5;
  v9 = v6;
  v12 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *v6;
  v37 = a3;
  sub_1DD31A0CC(a4, a3, MEMORY[0x1E0CC14E0]);
  swift_bridgeObjectRetain();
  v39 = a2;
  v17 = sub_1DD342774();
  v18 = -1 << *(_BYTE *)(v16 + 32);
  v19 = v17 & ~v18;
  v20 = *(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19;
  v34 = a4;
  if ((v20 & 1) != 0)
  {
    v31 = v6;
    v32 = a1;
    v35 = ~v18;
    v21 = v13;
    v22 = *(_QWORD *)(v13 + 72);
    v36 = v21;
    v23 = *(void (**)(_QWORD, _QWORD, _QWORD))(v21 + 16);
    while (1)
    {
      v24 = v23;
      v23(v15, *(_QWORD *)(v16 + 48) + v22 * v19, v12);
      sub_1DD31A0CC(v38, v37, MEMORY[0x1E0CC14E8]);
      v25 = sub_1DD342780();
      v26 = *(void (**)(char *, uint64_t))(v36 + 8);
      v26(v15, v12);
      if ((v25 & 1) != 0)
        break;
      v19 = (v19 + 1) & v35;
      v23 = v24;
      if (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v9 = v31;
        a1 = v32;
        v27 = v33;
        v13 = v36;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v26(v39, v12);
    v24(v32, *(_QWORD *)(*v31 + 48) + v22 * v19, v12);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v23 = *(void (**)(_QWORD, _QWORD, _QWORD))(v13 + 16);
    v27 = v33;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = v39;
    v23(v15, v39, v12);
    v40 = *v9;
    *v9 = 0x8000000000000000;
    sub_1DD32F304((uint64_t)v15, v19, isUniquelyReferenced_nonNull_native, v37, v27, v34, v38);
    *v9 = v40;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v29, v12);
    return 1;
  }
}

uint64_t sub_1DD32EFA0(uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, unint64_t, uint64_t);
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t *v43;

  v42 = a2;
  v43 = a4;
  v6 = v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v41 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v11 = sub_1DD3429B4();
  v12 = v11;
  if (*(_QWORD *)(v10 + 16))
  {
    v13 = 1 << *(_BYTE *)(v10 + 32);
    v14 = *(_QWORD *)(v10 + 56);
    v40 = (_QWORD *)(v10 + 56);
    if (v13 < 64)
      v15 = ~(-1 << v13);
    else
      v15 = -1;
    v16 = v15 & v14;
    v38 = v4;
    v39 = (unint64_t)(v13 + 63) >> 6;
    v17 = v11 + 56;
    result = swift_retain();
    v19 = 0;
    while (1)
    {
      if (v16)
      {
        v21 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v22 = v21 | (v19 << 6);
      }
      else
      {
        v23 = v19 + 1;
        if (__OFADD__(v19, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v23 >= v39)
          goto LABEL_33;
        v24 = v40[v23];
        ++v19;
        if (!v24)
        {
          v19 = v23 + 1;
          if (v23 + 1 >= v39)
            goto LABEL_33;
          v24 = v40[v19];
          if (!v24)
          {
            v19 = v23 + 2;
            if (v23 + 2 >= v39)
              goto LABEL_33;
            v24 = v40[v19];
            if (!v24)
            {
              v25 = v23 + 3;
              if (v25 >= v39)
              {
LABEL_33:
                swift_release();
                v6 = v38;
                v37 = 1 << *(_BYTE *)(v10 + 32);
                if (v37 > 63)
                  bzero(v40, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v40 = -1 << v37;
                *(_QWORD *)(v10 + 16) = 0;
                break;
              }
              v24 = v40[v25];
              if (!v24)
              {
                while (1)
                {
                  v19 = v25 + 1;
                  if (__OFADD__(v25, 1))
                    goto LABEL_39;
                  if (v19 >= v39)
                    goto LABEL_33;
                  v24 = v40[v19];
                  ++v25;
                  if (v24)
                    goto LABEL_23;
                }
              }
              v19 = v25;
            }
          }
        }
LABEL_23:
        v16 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v19 << 6);
      }
      v26 = v10;
      v27 = *(_QWORD *)(v10 + 48);
      v28 = *(_QWORD *)(v41 + 72);
      v29 = *(void (**)(char *, unint64_t, uint64_t))(v41 + 32);
      v29(v9, v27 + v28 * v22, v7);
      sub_1DD31A0CC(v43, v42, MEMORY[0x1E0CC14E0]);
      result = sub_1DD342774();
      v30 = -1 << *(_BYTE *)(v12 + 32);
      v31 = result & ~v30;
      v32 = v31 >> 6;
      if (((-1 << v31) & ~*(_QWORD *)(v17 + 8 * (v31 >> 6))) != 0)
      {
        v20 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v33 = 0;
        v34 = (unint64_t)(63 - v30) >> 6;
        do
        {
          if (++v32 == v34 && (v33 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v35 = v32 == v34;
          if (v32 == v34)
            v32 = 0;
          v33 |= v35;
          v36 = *(_QWORD *)(v17 + 8 * v32);
        }
        while (v36 == -1);
        v20 = __clz(__rbit64(~v36)) + (v32 << 6);
      }
      *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v29)(*(_QWORD *)(v12 + 48) + v20 * v28, v9, v7);
      ++*(_QWORD *)(v12 + 16);
      v10 = v26;
    }
  }
  result = swift_release();
  *v6 = v12;
  return result;
}

uint64_t sub_1DD32F304(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, uint64_t *a5, unint64_t *a6, unint64_t *a7)
{
  uint64_t *v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  char v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v32 = a7;
  v34 = a1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v33 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(*v7 + 16);
  v17 = *(_QWORD *)(*v7 + 24);
  v31 = v7;
  if (v17 > v16 && (a3 & 1) != 0)
    goto LABEL_12;
  v18 = v16 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1DD32EFA0(v18, a4, a5, a6);
  }
  else
  {
    if (v17 > v16)
    {
      sub_1DD32F538(a4, a5);
      goto LABEL_12;
    }
    sub_1DD32F758(v18, a4, a5, a6);
  }
  v19 = *v7;
  sub_1DD31A0CC(a6, a4, MEMORY[0x1E0CC14E0]);
  v20 = sub_1DD342774();
  v21 = -1 << *(_BYTE *)(v19 + 32);
  a2 = v20 & ~v21;
  if (((*(_QWORD *)(v19 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v22 = ~v21;
    v23 = *(_QWORD *)(v33 + 72);
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v33 + 16);
    do
    {
      v24(v15, *(_QWORD *)(v19 + 48) + v23 * a2, v13);
      sub_1DD31A0CC(v32, a4, MEMORY[0x1E0CC14E8]);
      v25 = sub_1DD342780();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v13);
      if ((v25 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v22;
    }
    while (((*(_QWORD *)(v19 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v26 = *v31;
  *(_QWORD *)(v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v33 + 32))(*(_QWORD *)(v26 + 48) + *(_QWORD *)(v33 + 72) * a2, v34, v13);
  v28 = *(_QWORD *)(v26 + 16);
  v29 = __OFADD__(v28, 1);
  v30 = v28 + 1;
  if (!v29)
  {
    *(_QWORD *)(v26 + 16) = v30;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1DD342B4C();
  __break(1u);
  return result;
}

void *sub_1DD32F538(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  uint64_t v13;
  unint64_t v14;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v4 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *v2;
  v10 = sub_1DD3429A8();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v4 = v11;
    return result;
  }
  v28 = v4;
  result = (void *)(v10 + 56);
  v13 = v9 + 56;
  v14 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v14)
    result = memmove(result, (const void *)(v9 + 56), 8 * v14);
  v16 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v17 = 1 << *(_BYTE *)(v9 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(v9 + 56);
  v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }
    v24 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v24 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v24);
    ++v16;
    if (!v25)
    {
      v16 = v24 + 1;
      if (v24 + 1 >= v20)
        goto LABEL_28;
      v25 = *(_QWORD *)(v13 + 8 * v16);
      if (!v25)
      {
        v16 = v24 + 2;
        if (v24 + 2 >= v20)
          goto LABEL_28;
        v25 = *(_QWORD *)(v13 + 8 * v16);
        if (!v25)
          break;
      }
    }
LABEL_27:
    v19 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v16 << 6);
LABEL_12:
    v23 = *(_QWORD *)(v6 + 72) * v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(_QWORD *)(v9 + 48) + v23, v5);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v23, v8, v5);
  }
  v26 = v24 + 3;
  if (v26 >= v20)
  {
LABEL_28:
    result = (void *)swift_release();
    v4 = v28;
    goto LABEL_30;
  }
  v25 = *(_QWORD *)(v13 + 8 * v26);
  if (v25)
  {
    v16 = v26;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v16 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v16);
    ++v26;
    if (v25)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1DD32F758(uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t *v39;
  unint64_t *v40;

  v39 = a2;
  v40 = a4;
  v6 = v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = sub_1DD3429B4();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
  {
    result = swift_release();
LABEL_35:
    *v6 = v13;
    return result;
  }
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 56);
  v36 = v4;
  v37 = v11 + 56;
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v38 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 56;
  result = swift_retain();
  v20 = 0;
  while (1)
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v20 << 6);
      goto LABEL_24;
    }
    v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v24 >= v38)
      goto LABEL_33;
    v25 = *(_QWORD *)(v37 + 8 * v24);
    ++v20;
    if (!v25)
    {
      v20 = v24 + 1;
      if (v24 + 1 >= v38)
        goto LABEL_33;
      v25 = *(_QWORD *)(v37 + 8 * v20);
      if (!v25)
      {
        v20 = v24 + 2;
        if (v24 + 2 >= v38)
          goto LABEL_33;
        v25 = *(_QWORD *)(v37 + 8 * v20);
        if (!v25)
          break;
      }
    }
LABEL_23:
    v17 = (v25 - 1) & v25;
    v23 = __clz(__rbit64(v25)) + (v20 << 6);
LABEL_24:
    v27 = *(_QWORD *)(v8 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, *(_QWORD *)(v11 + 48) + v27 * v23, v7);
    sub_1DD31A0CC(v40, v39, MEMORY[0x1E0CC14E0]);
    result = sub_1DD342774();
    v28 = -1 << *(_BYTE *)(v13 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v18 + 8 * (v29 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v18 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v18 + 8 * v30);
      }
      while (v34 == -1);
      v21 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v21 * v27, v10, v7);
    ++*(_QWORD *)(v13 + 16);
  }
  v26 = v24 + 3;
  if (v26 >= v38)
  {
LABEL_33:
    result = swift_release_n();
    v6 = v36;
    goto LABEL_35;
  }
  v25 = *(_QWORD *)(v37 + 8 * v26);
  if (v25)
  {
    v20 = v26;
    goto LABEL_23;
  }
  while (1)
  {
    v20 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v20 >= v38)
      goto LABEL_33;
    v25 = *(_QWORD *)(v37 + 8 * v20);
    ++v26;
    if (v25)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

_QWORD *sub_1DD32FA78(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3C50);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_1DD32FB5C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1DD310C28();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1DD32FB5C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1DD32FD58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_1DD342A68();
  __break(1u);
  return result;
}

unint64_t sub_1DD32FE48()
{
  unint64_t result;

  result = qword_1F03D45A8;
  if (!qword_1F03D45A8)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD3444E8, &type metadata for ActivityPickerViewController.Representable);
    atomic_store(result, (unint64_t *)&qword_1F03D45A8);
  }
  return result;
}

void sub_1DD32FE8C(id a1)
{

}

id sub_1DD32FE98(id a1)
{
  return a1;
}

uint64_t sub_1DD32FEA4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1DD32FED0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t result;
  _QWORD *v3;

  v1 = *(_QWORD **)(v0 + 24);
  result = (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16)
                                + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_dismissCallback))();
  if ((result & 1) != 0)
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    (*(void (**)(_QWORD, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x68))(0, 0);
    return (*(uint64_t (**)(_QWORD, _QWORD))((*v3 & *v1) + 0x80))(0, 0);
  }
  return result;
}

uint64_t sub_1DD32FF50()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD32FF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  return sub_1DD32C0F0(a1, a2, a3, a4, a5, a6, *(_QWORD *)(v6 + 16), *(uint64_t (**)(uint64_t))(v6 + 24), *(_QWORD *)(v6 + 32));
}

FamilyControls::UsageItemRecord::UsageType_optional __swiftcall UsageItemRecord.UsageType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  FamilyControls::UsageItemRecord::UsageType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1DD342A74();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t UsageItemRecord.UsageType.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 6448503;
  else
    return 7368801;
}

uint64_t sub_1DD330030(char *a1, char *a2)
{
  return sub_1DD33003C(*a1, *a2);
}

uint64_t sub_1DD33003C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 6448503;
  else
    v2 = 7368801;
  if ((a2 & 1) != 0)
    v3 = 6448503;
  else
    v3 = 7368801;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_1DD342B34();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_1DD3300A8()
{
  return sub_1DD3300B0();
}

uint64_t sub_1DD3300B0()
{
  sub_1DD342BB8();
  sub_1DD3427B0();
  swift_bridgeObjectRelease();
  return sub_1DD342BD0();
}

uint64_t sub_1DD330114()
{
  return sub_1DD33011C();
}

uint64_t sub_1DD33011C()
{
  sub_1DD3427B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD330150()
{
  return sub_1DD330158();
}

uint64_t sub_1DD330158()
{
  sub_1DD342BB8();
  sub_1DD3427B0();
  swift_bridgeObjectRelease();
  return sub_1DD342BD0();
}

FamilyControls::UsageItemRecord::UsageType_optional sub_1DD3301B8(Swift::String *a1)
{
  return UsageItemRecord.UsageType.init(rawValue:)(*a1);
}

uint64_t sub_1DD3301C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = UsageItemRecord.UsageType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL static UsageItemRecord.Source.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t UsageItemRecord.Source.hash(into:)()
{
  return sub_1DD342BC4();
}

uint64_t sub_1DD330228(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65746F6D6572;
  else
    return 0x6C61636F6CLL;
}

BOOL sub_1DD330258(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1DD330278()
{
  char *v0;

  return sub_1DD330228(*v0);
}

uint64_t sub_1DD330280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DD3359EC(a1, a2);
  *a3 = result;
  return result;
}

void sub_1DD3302A4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1DD3302B0()
{
  sub_1DD3305B8();
  return sub_1DD342BF4();
}

uint64_t sub_1DD3302D8()
{
  sub_1DD3305B8();
  return sub_1DD342C00();
}

uint64_t sub_1DD330300()
{
  return 0;
}

uint64_t sub_1DD33030C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_1DD330338(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1DD330344()
{
  sub_1DD330640();
  return sub_1DD342BF4();
}

uint64_t sub_1DD33036C()
{
  sub_1DD330640();
  return sub_1DD342C00();
}

uint64_t sub_1DD330394()
{
  sub_1DD3305FC();
  return sub_1DD342BF4();
}

uint64_t sub_1DD3303BC()
{
  sub_1DD3305FC();
  return sub_1DD342C00();
}

uint64_t UsageItemRecord.Source.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D45C8);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D45D0);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D45D8);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD3305B8();
  sub_1DD342BE8();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_1DD3305FC();
    sub_1DD342AE0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_1DD330640();
    sub_1DD342AE0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_1DD3305B8()
{
  unint64_t result;

  result = qword_1F03D68F0;
  if (!qword_1F03D68F0)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD345054, &type metadata for UsageItemRecord.Source.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D68F0);
  }
  return result;
}

unint64_t sub_1DD3305FC()
{
  unint64_t result;

  result = qword_1F03D68F8;
  if (!qword_1F03D68F8)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD345004, &type metadata for UsageItemRecord.Source.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D68F8);
  }
  return result;
}

unint64_t sub_1DD330640()
{
  unint64_t result;

  result = qword_1F03D6900;
  if (!qword_1F03D6900)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344FB4, &type metadata for UsageItemRecord.Source.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D6900);
  }
  return result;
}

uint64_t UsageItemRecord.Source.hashValue.getter()
{
  sub_1DD342BB8();
  sub_1DD342BC4();
  return sub_1DD342BD0();
}

uint64_t UsageItemRecord.Source.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D45E0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D45E8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D45F0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD3305B8();
  v11 = v33;
  sub_1DD342BDC();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_1DD342AD4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_1DD3429FC();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D45F8);
    *v21 = &type metadata for UsageItemRecord.Source;
    sub_1DD342A8C();
    sub_1DD3429F0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x1E0DEC450], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_1DD3305FC();
    sub_1DD342A80();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_1DD330640();
    v22 = v6;
    sub_1DD342A80();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_0(v24);
}

uint64_t sub_1DD330A20@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return UsageItemRecord.Source.init(from:)(a1, a2);
}

uint64_t sub_1DD330A34(_QWORD *a1)
{
  return UsageItemRecord.Source.encode(to:)(a1);
}

uint64_t UsageItemRecord.recordName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UsageItemRecord.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void UsageItemRecord.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

void UsageItemRecord.source.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 33);
}

uint64_t UsageItemRecord.category.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

double UsageItemRecord.totalUsage.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

uint64_t sub_1DD330AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1DD3422D0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD3422C4();
  v4 = sub_1DD342294();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

void sub_1DD330B7C(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void __swiftcall UsageItemRecord.init(identifier:recordName:type:source:category:totalUsage:)(FamilyControls::UsageItemRecord *__return_ptr retstr, Swift::String identifier, Swift::String recordName, FamilyControls::UsageItemRecord::UsageType type, FamilyControls::UsageItemRecord::Source source, Swift::String category, Swift::Double totalUsage)
{
  FamilyControls::UsageItemRecord::UsageType v7;
  FamilyControls::UsageItemRecord::Source v8;

  v7 = *(_BYTE *)type;
  v8 = *(_BYTE *)source;
  retstr->recordName = recordName;
  retstr->identifier = identifier;
  retstr->type = v7;
  retstr->source = v8;
  retstr->category = category;
  retstr->totalUsage = totalUsage;
}

uint64_t static UsageItemRecord.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24))
    return 1;
  else
    return sub_1DD342B34();
}

uint64_t UsageItemRecord.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1DD3427B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD330C1C(char a1)
{
  return *(_QWORD *)&aRecordnaidenti[8 * a1];
}

uint64_t sub_1DD330C3C()
{
  char *v0;

  return sub_1DD330C1C(*v0);
}

uint64_t sub_1DD330C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DD335AC4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1DD330C68(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_1DD330C74()
{
  sub_1DD330EE8();
  return sub_1DD342BF4();
}

uint64_t sub_1DD330C9C()
{
  sub_1DD330EE8();
  return sub_1DD342C00();
}

uint64_t UsageItemRecord.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  _QWORD v13[3];
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4600);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v16 = *(_QWORD *)(v1 + 24);
  v17 = v7;
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 32);
  v14 = *(unsigned __int8 *)(v1 + 33);
  v15 = v7;
  v8 = *(_QWORD *)(v1 + 40);
  v13[1] = *(_QWORD *)(v1 + 48);
  v13[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD330EE8();
  sub_1DD342BE8();
  v26 = 0;
  v9 = v18;
  sub_1DD342AEC();
  if (!v9)
  {
    v10 = v14;
    v11 = v15;
    v25 = 1;
    sub_1DD342AEC();
    v24 = v11;
    v23 = 2;
    sub_1DD330F2C();
    sub_1DD342B10();
    v22 = v10;
    v21 = 3;
    sub_1DD330F70();
    sub_1DD342B10();
    v20 = 4;
    sub_1DD342AEC();
    v19 = 5;
    sub_1DD342B04();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1DD330EE8()
{
  unint64_t result;

  result = qword_1F03D6908[0];
  if (!qword_1F03D6908[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344F64, &type metadata for UsageItemRecord.CodingKeys);
    atomic_store(result, qword_1F03D6908);
  }
  return result;
}

unint64_t sub_1DD330F2C()
{
  unint64_t result;

  result = qword_1F03D4608;
  if (!qword_1F03D4608)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageItemRecord.UsageType, &type metadata for UsageItemRecord.UsageType);
    atomic_store(result, (unint64_t *)&qword_1F03D4608);
  }
  return result;
}

unint64_t sub_1DD330F70()
{
  unint64_t result;

  result = qword_1F03D4610;
  if (!qword_1F03D4610)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageItemRecord.Source, &type metadata for UsageItemRecord.Source);
    atomic_store(result, (unint64_t *)&qword_1F03D4610);
  }
  return result;
}

uint64_t UsageItemRecord.hashValue.getter()
{
  sub_1DD342BB8();
  swift_bridgeObjectRetain();
  sub_1DD3427B0();
  swift_bridgeObjectRelease();
  return sub_1DD342BD0();
}

uint64_t UsageItemRecord.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  unsigned __int8 v30;
  char v31;
  unsigned __int8 v32;
  char v33;
  char v34;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4618);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD330EE8();
  sub_1DD342BDC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v34 = 0;
  v9 = sub_1DD342AA4();
  v11 = v10;
  v33 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_1DD342AA4();
  v14 = v13;
  v25 = v12;
  v31 = 2;
  sub_1DD331440();
  swift_bridgeObjectRetain();
  v26 = v14;
  sub_1DD342AC8();
  v24 = v32;
  v29 = 3;
  sub_1DD331484();
  sub_1DD342AC8();
  v23 = v30;
  v28 = 4;
  v21 = sub_1DD342AA4();
  v22 = v16;
  v27 = 5;
  swift_bridgeObjectRetain();
  sub_1DD342ABC();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  v19 = v26;
  *(_QWORD *)(a2 + 16) = v25;
  *(_QWORD *)(a2 + 24) = v19;
  *(_BYTE *)(a2 + 32) = v24;
  *(_BYTE *)(a2 + 33) = v23;
  v20 = v22;
  *(_QWORD *)(a2 + 40) = v21;
  *(_QWORD *)(a2 + 48) = v20;
  *(_QWORD *)(a2 + 56) = v18;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD331350()
{
  sub_1DD342BB8();
  swift_bridgeObjectRetain();
  sub_1DD3427B0();
  swift_bridgeObjectRelease();
  return sub_1DD342BD0();
}

uint64_t sub_1DD3313A8()
{
  swift_bridgeObjectRetain();
  sub_1DD3427B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD3313EC()
{
  sub_1DD342BB8();
  swift_bridgeObjectRetain();
  sub_1DD3427B0();
  swift_bridgeObjectRelease();
  return sub_1DD342BD0();
}

unint64_t sub_1DD331440()
{
  unint64_t result;

  result = qword_1F03D4620;
  if (!qword_1F03D4620)
  {
    result = MEMORY[0x1DF0D9108]("у=\r0P", &type metadata for UsageItemRecord.UsageType);
    atomic_store(result, (unint64_t *)&qword_1F03D4620);
  }
  return result;
}

unint64_t sub_1DD331484()
{
  unint64_t result;

  result = qword_1F03D4628;
  if (!qword_1F03D4628)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageItemRecord.Source, &type metadata for UsageItemRecord.Source);
    atomic_store(result, (unint64_t *)&qword_1F03D4628);
  }
  return result;
}

uint64_t sub_1DD3314C8(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24))
    return 1;
  else
    return sub_1DD342B34();
}

uint64_t sub_1DD3314F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return UsageItemRecord.init(from:)(a1, a2);
}

uint64_t sub_1DD33150C(_QWORD *a1)
{
  return UsageItemRecord.encode(to:)(a1);
}

uint64_t sub_1DD331520()
{
  uint64_t result;

  result = sub_1DD33153C();
  qword_1F03D68E8 = result;
  return result;
}

uint64_t sub_1DD33153C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char v6;
  _BYTE v8[48];

  v0 = sub_1DD3423D8();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DD342258();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v8[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for UsageStore();
  v5 = swift_allocObject();
  UsageStore.init()();
  v6 = sub_1DD31A6FC();
  Locations.init(useExplicitLocations:)(v6 & 1);
  v8[24] = v8[32];
  Locations.familyControlsStore.getter((uint64_t)v4);
  (*(void (**)(_BYTE *))(*(_QWORD *)v5 + 128))(v4);
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
  return v5;
}

uint64_t UsageStore.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  UsageStore.init()();
  return v0;
}

uint64_t *sub_1DD331834()
{
  if (qword_1F03D68E0 != -1)
    swift_once();
  return &qword_1F03D68E8;
}

uint64_t static UsageStore.shared.getter()
{
  if (qword_1F03D68E0 != -1)
    swift_once();
  return swift_retain();
}

unint64_t sub_1DD3318B4()
{
  return sub_1DD3318C0(MEMORY[0x1E0DEE9D8]);
}

unint64_t sub_1DD3318C0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D46D8);
  v2 = sub_1DD342A5C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v22 = v2 + 64;
  swift_retain();
  v5 = (_QWORD *)(a1 + 104);
  while (1)
  {
    v23 = v4;
    v6 = *(v5 - 9);
    v7 = *(v5 - 8);
    v8 = *(v5 - 7);
    v9 = *(v5 - 6);
    v11 = *(v5 - 5);
    v10 = *(v5 - 4);
    v12 = *((_BYTE *)v5 - 24);
    v25 = *((_BYTE *)v5 - 23);
    v13 = *(v5 - 1);
    v24 = *(v5 - 2);
    v14 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1DD310404(v6, v7);
    if ((v16 & 1) != 0)
      break;
    *(_QWORD *)(v22 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = (uint64_t *)(v3[6] + 16 * result);
    *v17 = v6;
    v17[1] = v7;
    v18 = v3[7] + (result << 6);
    *(_QWORD *)v18 = v8;
    *(_QWORD *)(v18 + 8) = v9;
    *(_QWORD *)(v18 + 16) = v11;
    *(_QWORD *)(v18 + 24) = v10;
    *(_BYTE *)(v18 + 32) = v12;
    *(_BYTE *)(v18 + 33) = v25;
    *(_QWORD *)(v18 + 40) = v24;
    *(_QWORD *)(v18 + 48) = v13;
    *(_QWORD *)(v18 + 56) = v14;
    v19 = v3[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v3[2] = v21;
    v5 += 10;
    v4 = v23 - 1;
    if (v23 == 1)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1DD331A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  _QWORD v8[2];

  v0 = sub_1DD3428F4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD3428E8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1DD342738();
  MEMORY[0x1E0C80A78](v6);
  sub_1DD313CAC();
  sub_1DD34272C();
  v8[1] = MEMORY[0x1E0DEE9D8];
  sub_1DD33616C(&qword_1EDB64FD0, 255, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FB8);
  sub_1DD31A0CC(&qword_1EDB64FC0, &qword_1EDB64FB8, MEMORY[0x1E0DEAF38]);
  sub_1DD342978();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  return sub_1DD342924();
}

uint64_t UsageStore.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v1 = sub_1DD3428F4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD3428E8();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v5);
  v7 = sub_1DD342738();
  MEMORY[0x1E0C80A78](v7);
  v8 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v0 + 16) = sub_1DD3318C0(MEMORY[0x1E0DEE9D8]);
  v10[0] = sub_1DD313CAC();
  sub_1DD34272C();
  v10[1] = v8;
  sub_1DD33616C(&qword_1EDB64FD0, 255, v6, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FB8);
  sub_1DD31A0CC(&qword_1EDB64FC0, &qword_1EDB64FB8, MEMORY[0x1E0DEAF38]);
  sub_1DD342978();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF8D0], v1);
  *(_QWORD *)(v0 + 24) = sub_1DD342924();
  return v0;
}

uint64_t sub_1DD331DE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isEscapingClosureAtFileLocation;
  _QWORD v12[6];

  result = sub_1DD342264();
  if (!v1)
  {
    v4 = result;
    v5 = v3;
    sub_1DD342168();
    swift_allocObject();
    sub_1DD34215C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64F90);
    sub_1DD336E6C(&qword_1EDB64FA0, (uint64_t (*)(void))sub_1DD331FE4, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEA0D8]);
    sub_1DD342150();
    v6 = v12[0];
    v7 = *(NSObject **)(v0 + 24);
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v0;
    *(_QWORD *)(v8 + 24) = v6;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1DD332054;
    *(_QWORD *)(v9 + 24) = v8;
    v12[4] = sub_1DD329D78;
    v12[5] = v9;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 1107296256;
    v12[2] = sub_1DD328144;
    v12[3] = &block_descriptor_4;
    v10 = _Block_copy(v12);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v7, v10);
    swift_release();
    sub_1DD319C20(v4, v5);
    _Block_release(v10);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

unint64_t sub_1DD331FE4()
{
  unint64_t result;

  result = qword_1EDB64EE8[0];
  if (!qword_1EDB64EE8[0])
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageItemRecord, &type metadata for UsageItemRecord);
    atomic_store(result, qword_1EDB64EE8);
  }
  return result;
}

uint64_t sub_1DD332028()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DD332054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = v1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD3320AC()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_1DD3320D4()
{
  sub_1DD342198();
  swift_allocObject();
  sub_1DD34218C();
  sub_1DD342174();
  sub_1DD34290C();
  return swift_release();
}

void sub_1DD332178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  _QWORD v20[2];
  id v21[4];

  v21[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_1DD342258();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_1DD342234();
  v9 = (void *)sub_1DD34278C();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_fileExistsAtPath_, v9);

  if ((v10 & 1) != 0
    || (sub_1DD34221C(),
        v11 = (void *)sub_1DD342210(),
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4),
        v21[0] = 0,
        v12 = objc_msgSend(v8, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v11, 1, 0, v21), v11, v13 = v21[0], v12))
  {
    swift_beginAccess();
    v20[1] = *(_QWORD *)(a3 + 16);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64F90);
    sub_1DD336E6C(&qword_1EDB64F98, (uint64_t (*)(void))sub_1DD336EE0, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEA0B8]);
    v14 = v20[0];
    v15 = sub_1DD342180();
    if (v14)
    {

      swift_bridgeObjectRelease();
      return;
    }
    v17 = v15;
    v18 = v16;
    swift_bridgeObjectRelease();
    sub_1DD342288();
    sub_1DD319C20(v17, v18);
  }
  else
  {
    v19 = v13;
    sub_1DD3421EC();

    swift_willThrow();
  }

}

void sub_1DD3323D0()
{
  uint64_t *v0;

  sub_1DD332178(v0[2], v0[3], v0[4]);
}

uint64_t UsageStore.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t UsageStore.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t UsageStore.startIndex.getter()
{
  return sub_1DD332508();
}

uint64_t sub_1DD332448@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD336E08(a1);
}

uint64_t sub_1DD33245C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 88);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t UsageStore.endIndex.getter()
{
  return sub_1DD332508();
}

uint64_t sub_1DD332508()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  return v1;
}

uint64_t sub_1DD332568@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD336DAC(a1);
}

double UsageStore.subscript.getter(uint64_t a1)
{
  double result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4630);
  sub_1DD34290C();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 33) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  return result;
}

uint64_t sub_1DD33261C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DD336D34(a1);
}

uint64_t sub_1DD332630(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = *(_QWORD *)(a5 + 56) + (a2 << 6);
    v7 = *(_QWORD *)(v6 + 8);
    v8 = *(_QWORD *)(v6 + 16);
    v9 = *(_QWORD *)(v6 + 24);
    v10 = *(_BYTE *)(v6 + 32);
    v11 = *(_BYTE *)(v6 + 33);
    v12 = *(_QWORD *)(v6 + 40);
    v13 = *(_QWORD *)(v6 + 48);
    v14 = *(_QWORD *)(v6 + 56);
    *(_QWORD *)result = *(_QWORD *)v6;
    *(_QWORD *)(result + 8) = v7;
    *(_QWORD *)(result + 16) = v8;
    *(_QWORD *)(result + 24) = v9;
    *(_BYTE *)(result + 32) = v10;
    *(_BYTE *)(result + 33) = v11;
    *(_QWORD *)(result + 40) = v12;
    *(_QWORD *)(result + 48) = v13;
    *(_QWORD *)(result + 56) = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t UsageStore.index(after:)()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  return v1;
}

uint64_t sub_1DD332778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t result;

  v9 = a4 & 1;
  swift_beginAccess();
  v10 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v11 = sub_1DD334B44(a2, a3, v9, v10);
  v13 = v12;
  LOBYTE(v9) = v14;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a5 = v11;
  *(_QWORD *)(a5 + 8) = v13;
  *(_BYTE *)(a5 + 16) = v9 & 1;
  return result;
}

uint64_t sub_1DD332810@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD336D04(a1);
}

uint64_t UsageStore.subscript.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4638);
  return sub_1DD34290C();
}

double sub_1DD332888@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4638);
  sub_1DD34290C();
  *a1 = v3;
  a1[1] = v4;
  result = *(double *)&v5;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_1DD332900(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13[8];

  v3 = a3[1];
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v12 = *a3;
  v13[0] = *a1;
  v13[1] = v4;
  v13[2] = v5;
  v13[3] = v6;
  v13[4] = v7;
  v13[5] = v8;
  v13[6] = v9;
  v13[7] = v10;
  swift_bridgeObjectRetain();
  sub_1DD33319C(v13[0], v4);
  return UsageStore.subscript.setter((uint64_t)v13, v12, v3);
}

uint64_t UsageStore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  _QWORD v12[6];
  _BYTE v13[64];

  v4 = v3;
  sub_1DD332C1C(a1, (uint64_t)v13);
  v7 = *(NSObject **)(v3 + 24);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v4;
  v8[3] = a2;
  v8[4] = a3;
  sub_1DD332C1C((uint64_t)v13, (uint64_t)(v8 + 5));
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1DD332CE0;
  *(_QWORD *)(v9 + 24) = v8;
  v12[4] = sub_1DD32AE98;
  v12[5] = v9;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1DD328144;
  v12[3] = &block_descriptor_13_0;
  v10 = _Block_copy(v12);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v7 & 1) != 0)
    __break(1u);
  return result;
}

double sub_1DD332AF4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double result;

  swift_beginAccess();
  v8 = *(_QWORD *)(a1 + 16);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_1DD310404(a2, a3);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(v8 + 56) + (v9 << 6);
      v12 = *(_QWORD *)(v11 + 8);
      v13 = *(_QWORD *)(v11 + 16);
      v14 = *(_QWORD *)(v11 + 24);
      v15 = *(_BYTE *)(v11 + 32);
      v16 = *(_BYTE *)(v11 + 33);
      v17 = *(_QWORD *)(v11 + 40);
      v18 = *(_QWORD *)(v11 + 48);
      v19 = *(_QWORD *)(v11 + 56);
      *(_QWORD *)a4 = *(_QWORD *)v11;
      *(_QWORD *)(a4 + 8) = v12;
      *(_QWORD *)(a4 + 16) = v13;
      *(_QWORD *)(a4 + 24) = v14;
      *(_BYTE *)(a4 + 32) = v15;
      *(_BYTE *)(a4 + 33) = v16;
      *(_QWORD *)(a4 + 40) = v17;
      *(_QWORD *)(a4 + 48) = v18;
      *(_QWORD *)(a4 + 56) = v19;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  result = 0.0;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  return result;
}

double sub_1DD332BF0@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1DD332AF4(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_1DD332C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD332C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1DD333164(a4);
  sub_1DD332D00((uint64_t)a4, a2, a3);
  return swift_endAccess();
}

uint64_t sub_1DD332CE0()
{
  uint64_t *v0;

  return sub_1DD332C64(v0[2], v0[3], v0[4], v0 + 5);
}

uint64_t sub_1DD332CF0()
{
  return swift_deallocObject();
}

uint64_t sub_1DD332D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[8];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = v3;
  sub_1DD332C1C(a1, (uint64_t)v19);
  v7 = v19[0];
  v8 = v19[1];
  v10 = v19[2];
  v9 = v19[3];
  v12 = v20;
  v11 = v21;
  v13 = v22;
  v14 = v23;
  sub_1DD332C1C(a1, (uint64_t)v24);
  if (v25)
  {
    *(_QWORD *)&v26 = v7;
    *((_QWORD *)&v26 + 1) = v8;
    v27 = v10;
    v28 = v9;
    LOWORD(v29) = v12 & 0x101;
    v30 = v11;
    v31 = v13;
    v32 = v14;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_1DD335224(&v26, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1DD334BC0(a2, a3, (uint64_t)&v26);
    swift_bridgeObjectRelease();
    return sub_1DD3331D8(v26, *((uint64_t *)&v26 + 1));
  }
}

void (*UsageStore.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;

  v7 = malloc(0x110uLL);
  *a1 = v7;
  v7[30] = a2;
  v7[31] = a3;
  v8 = *(_QWORD *)(v3 + 24);
  v7[32] = v3;
  v7[33] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4638);
  sub_1DD34290C();
  return sub_1DD332EC0;
}

void sub_1DD332EC0(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  char isEscapingClosureAtFileLocation;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  char v15;

  v2 = *a1;
  v3 = (uint64_t)(*a1 + 16);
  v5 = v2[32];
  v4 = v2[33];
  v7 = v2[30];
  v6 = v2[31];
  if ((a2 & 1) != 0)
  {
    sub_1DD332C1C(v3, (uint64_t)v2);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = v5;
    v8[3] = v7;
    v8[4] = v6;
    sub_1DD332C1C((uint64_t)v2, (uint64_t)(v8 + 5));
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1DD336F6C;
    *(_QWORD *)(v9 + 24) = v8;
    v2[28] = (uint64_t)sub_1DD32AE98;
    v2[29] = v9;
    v2[24] = MEMORY[0x1E0C809B0];
    v2[25] = 1107296256;
    v2[26] = (uint64_t)sub_1DD328144;
    v2[27] = (uint64_t)&block_descriptor_25;
    v10 = _Block_copy(v2 + 24);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1DD333164(v2);
    swift_retain();
    swift_release();
    dispatch_sync(v4, v10);
    _Block_release(v10);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      sub_1DD3331D8(v2[16], v2[17]);
LABEL_5:
      free(v2);
      return;
    }
    __break(1u);
  }
  else
  {
    sub_1DD332C1C(v3, (uint64_t)(v2 + 8));
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v5;
    v12[3] = v7;
    v12[4] = v6;
    sub_1DD332C1C((uint64_t)(v2 + 8), (uint64_t)(v12 + 5));
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_1DD336F6C;
    *(_QWORD *)(v13 + 24) = v12;
    v2[28] = (uint64_t)sub_1DD32AE98;
    v2[29] = v13;
    v2[24] = MEMORY[0x1E0C809B0];
    v2[25] = 1107296256;
    v2[26] = (uint64_t)sub_1DD328144;
    v2[27] = (uint64_t)&block_descriptor_36;
    v14 = _Block_copy(v2 + 24);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v4, v14);
    _Block_release(v14);
    v15 = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v15 & 1) == 0)
      goto LABEL_5;
  }
  __break(1u);
}

uint64_t sub_1DD333154()
{
  return swift_deallocObject();
}

uint64_t *sub_1DD333164(uint64_t *a1)
{
  sub_1DD33319C(*a1, a1[1]);
  return a1;
}

uint64_t sub_1DD33319C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1DD3331D8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t sub_1DD333260()
{
  return swift_deallocObject();
}

uint64_t UsageStore.contains(where:)()
{
  uint64_t v0;
  char v1;
  char v3;

  sub_1DD34290C();
  if (!v0)
    v1 = v3;
  return v1 & 1;
}

uint64_t sub_1DD3332CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)(uint64_t, uint64_t, _QWORD *);
  uint64_t v5;
  char v6;
  uint64_t result;

  v4 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(v1 + 24);
  swift_beginAccess();
  v5 = swift_bridgeObjectRetain();
  v6 = sub_1DD335D10(v5, v4);
  result = swift_bridgeObjectRelease();
  if (!v2)
    *a1 = v6 & 1;
  return result;
}

uint64_t UsageStore.first(where:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4640);
  return sub_1DD34290C();
}

uint64_t sub_1DD3333C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t, _QWORD *);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(v1 + 24);
  swift_beginAccess();
  v4 = swift_bridgeObjectRetain();
  sub_1DD333448(v4, v3, a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD333448@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, _QWORD *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t i;
  BOOL v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v34;
  int64_t v35;
  _QWORD v36[4];
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v28 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v29 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  v34 = (v6 - 1) & v6;
  v35 = v8;
  for (i = __clz(__rbit64(v6)) | (v8 << 6); ; i = __clz(__rbit64(v12)) + (v11 << 6))
  {
    v14 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v15 = *v14;
    v16 = v14[1];
    v17 = *(_QWORD *)(a1 + 56) + (i << 6);
    v18 = *(_QWORD *)(v17 + 8);
    v19 = *(_QWORD *)(v17 + 24);
    v20 = *(unsigned __int8 *)(v17 + 32);
    v21 = *(unsigned __int8 *)(v17 + 33);
    v23 = *(_QWORD *)(v17 + 40);
    v22 = *(_QWORD *)(v17 + 48);
    v24 = *(_QWORD *)(v17 + 56);
    v30 = *(_QWORD *)(v17 + 16);
    v31 = *(_QWORD *)v17;
    v36[0] = *(_QWORD *)v17;
    v36[1] = v18;
    v36[2] = v30;
    v36[3] = v19;
    v37 = v20;
    v38 = v21;
    v39 = v23;
    v40 = v22;
    v41 = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25 = a2(v15, v16, v36);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    if ((v25 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v6 = v34;
    v8 = v35;
    if (v34)
      goto LABEL_4;
LABEL_5:
    v10 = __OFADD__(v8, 1);
    v11 = v8 + 1;
    if (v10)
    {
      __break(1u);
LABEL_32:
      __break(1u);
      return result;
    }
    if (v11 >= v29)
      goto LABEL_30;
    v12 = *(_QWORD *)(v28 + 8 * v11);
    if (!v12)
    {
      v13 = v11 + 1;
      if (v11 + 1 >= v29)
        goto LABEL_30;
      v12 = *(_QWORD *)(v28 + 8 * v13);
      if (!v12)
      {
        v13 = v11 + 2;
        if (v11 + 2 >= v29)
          goto LABEL_30;
        v12 = *(_QWORD *)(v28 + 8 * v13);
        if (!v12)
        {
          v13 = v11 + 3;
          if (v11 + 3 >= v29)
            goto LABEL_30;
          v12 = *(_QWORD *)(v28 + 8 * v13);
          if (!v12)
          {
            v13 = v11 + 4;
            if (v11 + 4 >= v29)
            {
LABEL_30:
              result = swift_release();
              *(_OWORD *)(a3 + 48) = 0u;
              *(_OWORD *)(a3 + 64) = 0u;
              *(_OWORD *)(a3 + 16) = 0u;
              *(_OWORD *)(a3 + 32) = 0u;
              *(_OWORD *)a3 = 0u;
              return result;
            }
            v12 = *(_QWORD *)(v28 + 8 * v13);
            if (!v12)
            {
              while (1)
              {
                v11 = v13 + 1;
                if (__OFADD__(v13, 1))
                  goto LABEL_32;
                if (v11 >= v29)
                  goto LABEL_30;
                v12 = *(_QWORD *)(v28 + 8 * v11);
                ++v13;
                if (v12)
                  goto LABEL_17;
              }
            }
          }
        }
      }
      v11 = v13;
    }
LABEL_17:
    v34 = (v12 - 1) & v12;
    v35 = v11;
  }
  result = swift_release();
  v26 = 256;
  if (!v21)
    v26 = 0;
  *(_QWORD *)a3 = v15;
  *(_QWORD *)(a3 + 8) = v16;
  *(_QWORD *)(a3 + 16) = v31;
  *(_QWORD *)(a3 + 24) = v18;
  *(_QWORD *)(a3 + 32) = v30;
  *(_QWORD *)(a3 + 40) = v19;
  *(_QWORD *)(a3 + 48) = v26 | v20;
  *(_QWORD *)(a3 + 56) = v23;
  *(_QWORD *)(a3 + 64) = v22;
  *(_QWORD *)(a3 + 72) = v24;
  return result;
}

Swift::Void __swiftcall UsageStore.removeAll()()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v1 = *(NSObject **)(v0 + 24);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_1DD33383C;
  *(_QWORD *)(v2 + 24) = v0;
  v4[4] = sub_1DD32AE98;
  v4[5] = v2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1107296256;
  v4[2] = sub_1DD328144;
  v4[3] = &block_descriptor_43_0;
  v3 = _Block_copy(v4);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v1 & 1) != 0)
    __break(1u);
}

uint64_t sub_1DD33383C()
{
  uint64_t v0;
  unint64_t v1;

  v1 = sub_1DD3318C0(MEMORY[0x1E0DEE9D8]);
  swift_beginAccess();
  *(_QWORD *)(v0 + 16) = v1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD33388C()
{
  return swift_deallocObject();
}

double sub_1DD33389C@<D0>(uint64_t a1@<X8>)
{
  return sub_1DD3338B4(a1);
}

double sub_1DD3338A8@<D0>(uint64_t a1@<X8>)
{
  return sub_1DD3338B4(a1);
}

double sub_1DD3338B4@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  char v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

void (*sub_1DD333920(_QWORD *a1))(void **a1)
{
  _QWORD *v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;

  v2 = malloc(0x70uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4630);
  sub_1DD34290C();
  v3 = v2[3];
  v2[10] = v2[1];
  v2[11] = v3;
  v4 = *((_BYTE *)v2 + 48);
  v5 = *((_BYTE *)v2 + 49);
  v6 = v2[8];
  v2[12] = v2[5];
  v2[13] = v6;
  *((_BYTE *)v2 + 48) = v4;
  *((_BYTE *)v2 + 49) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1DD333A00;
}

void sub_1DD333A00(void **a1)
{
  void *v1;

  v1 = *a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  free(v1);
}

double sub_1DD333A8C@<D0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  double result;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[2];

  v3 = a1[1];
  v9 = *a1;
  v10[0] = v3;
  *(_OWORD *)((char *)v10 + 9) = *(__int128 *)((char *)a1 + 25);
  sub_1DD333AEC((uint64_t)&v9, (uint64_t)v6);
  v4 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v4;
  result = *(double *)&v7;
  *(_OWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 48) = v8;
  return result;
}

uint64_t sub_1DD333AEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  result = sub_1DD34290C();
  if ((v11 & 1) != 0)
    goto LABEL_13;
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v6 = *(_QWORD *)(a1 + 8);
  if ((_DWORD)v6 != v10)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(_QWORD *)a1 < v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v10 == (_DWORD)v7)
    {
      v8 = *(_QWORD *)(a1 + 24);
      if (v9 >= v8)
      {
        *(_QWORD *)a2 = *(_QWORD *)a1;
        *(_QWORD *)(a2 + 8) = v6;
        *(_BYTE *)(a2 + 16) = 0;
        *(_QWORD *)(a2 + 24) = v8;
        *(_QWORD *)(a2 + 32) = v7;
        *(_BYTE *)(a2 + 40) = 0;
        *(_QWORD *)(a2 + 48) = v2;
        return swift_retain();
      }
      goto LABEL_12;
    }
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_15:
  __break(1u);
  return result;
}

__n128 sub_1DD333C2C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  __n128 result;
  __n128 v5;
  char v6;

  v3 = *v1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  sub_1DD34290C();
  result = v5;
  *(_QWORD *)a1 = v3;
  *(__n128 *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  *(__n128 *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 48) = v6;
  return result;
}

void sub_1DD333CE8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = -2;
}

uint64_t sub_1DD333CF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char v6;

  result = sub_1DD333D38(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), a2);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = v6 & 1;
  return result;
}

uint64_t sub_1DD333D38(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = a4;
    v5 = a2;
    v6 = result;
    v7 = a3 & 1;
    if (a4)
    {
      v8 = sub_1DD336CF8(result, a2, a3 & 1);
      do
      {
        MEMORY[0x1E0C80A78](v8);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
        sub_1DD34290C();
        v8 = sub_1DD336CEC(v6, v5, v7 & 1);
        v6 = v9;
        v5 = v10;
        v7 = v11;
        --v4;
      }
      while (v4);
    }
    else
    {
      sub_1DD336CF8(result, a2, a3 & 1);
    }
    return v6;
  }
  return result;
}

uint64_t sub_1DD333E4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  uint64_t v6;
  char v7;

  result = sub_1DD333E94(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), a2, *(_QWORD *)a3, *(_QWORD *)(a3 + 8), *(_BYTE *)(a3 + 16));
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = v6;
  *(_BYTE *)(a4 + 16) = v7;
  return result;
}

uint64_t sub_1DD333E94(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, int a6, char a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  uint64_t v14;
  int v15;
  char v16;

  if (a4 < 0)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  v7 = a4;
  v8 = a2;
  v9 = result;
  v10 = a3 & 1;
  if (a4)
  {
    result = sub_1DD336CF8(result, a2, a3 & 1);
    if ((a7 & 1) == 0)
    {
      while ((v10 & 1) == 0)
      {
        if (v8 != a6)
        {
          __break(1u);
          goto LABEL_13;
        }
        if (v9 == a5)
          return 0;
        MEMORY[0x1E0C80A78](result);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
        result = sub_1DD34290C();
        v9 = v14;
        v8 = v15;
        v10 = v16;
        if (!--v7)
          return v9;
      }
    }
    goto LABEL_14;
  }
  sub_1DD336CF8(result, a2, a3 & 1);
  return v9;
}

uint64_t sub_1DD333FCC(uint64_t a1, uint64_t a2)
{
  return sub_1DD334004(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

uint64_t sub_1DD334004(uint64_t result, uint64_t a2, char a3, uint64_t a4, int a5, char a6)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  char v14;

  if ((a6 & 1) != 0 || (a3 & 1) != 0)
  {
LABEL_18:
    __break(1u);
    return result;
  }
  v7 = result;
  if (a4 < result)
    goto LABEL_15;
  v9 = a2;
  if (a5 != (_DWORD)a2)
    goto LABEL_16;
  if (result != a4)
  {
    for (i = 0; ; ++i)
    {
      v10 = i + 1;
      if (__OFADD__(i, 1))
        break;
      MEMORY[0x1E0C80A78](result);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
      sub_1DD34290C();
      result = sub_1DD336CEC(v7, v9, 0);
      if ((v14 & 1) != 0)
        goto LABEL_17;
      v9 = v13;
      if ((_DWORD)v13 != a5)
        goto LABEL_14;
      v7 = v12;
      if (v12 == a4)
        return v10;
    }
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  return 0;
}

uint64_t sub_1DD334140(uint64_t result, uint64_t a2)
{
  int v2;

  if ((*(_BYTE *)(result + 16) & 1) != 0 || (*(_BYTE *)(a2 + 16) & 1) != 0)
    goto LABEL_13;
  v2 = *(_DWORD *)(result + 8);
  if (v2 != *(_QWORD *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(_QWORD *)result < *(_QWORD *)a2)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((*(_BYTE *)(a2 + 40) & 1) != 0)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  if (v2 != *(_QWORD *)(a2 + 32))
    goto LABEL_11;
  if (*(_QWORD *)result >= *(_QWORD *)(a2 + 24))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_1DD3341AC(uint64_t result, uint64_t a2)
{
  int v2;

  if ((*(_BYTE *)(result + 16) & 1) != 0 || (*(_BYTE *)(a2 + 16) & 1) != 0)
    goto LABEL_13;
  v2 = *(_DWORD *)(result + 8);
  if (v2 != *(_QWORD *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(_QWORD *)result < *(_QWORD *)a2)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((*(_BYTE *)(a2 + 40) & 1) != 0)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  if (*(_QWORD *)(a2 + 32) != v2)
    goto LABEL_11;
  if (*(_QWORD *)(a2 + 24) < *(_QWORD *)result)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_1DD334218(uint64_t result, uint64_t a2)
{
  if ((*(_BYTE *)(result + 16) & 1) != 0 || (*(_BYTE *)(a2 + 16) & 1) != 0)
    goto LABEL_13;
  if (*(_DWORD *)(result + 8) != *(_QWORD *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(_QWORD *)result < *(_QWORD *)a2)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (((*(_BYTE *)(a2 + 40) | *(_BYTE *)(result + 40)) & 1) != 0)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  if (*(_QWORD *)(a2 + 32) != *(_QWORD *)(result + 32))
    goto LABEL_11;
  if (*(_QWORD *)(a2 + 24) < *(_QWORD *)(result + 24))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

double sub_1DD334294@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  char v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_1DD334314(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  char v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  result = sub_1DD336CEC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return result;
}

__n128 sub_1DD3343A0@<Q0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  __n128 result;
  __n128 v5;
  char v6;

  v3 = *v1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  swift_release();
  result = v5;
  *(_QWORD *)a1 = v3;
  *(__n128 *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_1DD334420(uint64_t a1)
{
  MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageStore, a1);
  return sub_1DD342888();
}

uint64_t sub_1DD334454()
{
  return 2;
}

uint64_t sub_1DD33445C()
{
  uint64_t v0;

  v0 = sub_1DD335584();
  swift_release();
  return v0;
}

uint64_t sub_1DD334490(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_1DD335718(a1, a2, a3);
}

uint64_t sub_1DD3344B0()
{
  type metadata accessor for UsageStore();
  return sub_1DD3427D4();
}

uint64_t UsageItemRecord.description.getter()
{
  sub_1DD3429CC();
  sub_1DD3427BC();
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  sub_1DD342A14();
  sub_1DD3427BC();
  swift_bridgeObjectRetain();
  sub_1DD3427BC();
  swift_bridgeObjectRelease();
  sub_1DD3427BC();
  sub_1DD34284C();
  return 0;
}

uint64_t UsageStore.description.getter()
{
  uint64_t v1;

  sub_1DD34290C();
  return v1;
}

uint64_t sub_1DD334738@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = sub_1DD342768();
  v4 = v3;
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_1DD3347B8@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DD334738(a1);
}

uint64_t sub_1DD3347E0()
{
  uint64_t v1;

  sub_1DD34290C();
  return v1;
}

uint64_t sub_1DD334830(uint64_t a1, uint64_t a2)
{
  return sub_1DD335FA0(a1, a2) & 1;
}

uint64_t sub_1DD33484C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DD335FA0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1DD334874()
{
  sub_1DD336024();
  return sub_1DD342BF4();
}

uint64_t sub_1DD33489C()
{
  sub_1DD336024();
  return sub_1DD342C00();
}

uint64_t UsageItemRecord.UsageType.init(from:)@<X0>(_QWORD *a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4648);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD336024();
  sub_1DD342BDC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  sub_1DD342AA4();
  v9 = sub_1DD342A74();
  result = swift_bridgeObjectRelease();
  if (v9 <= 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 != 0;
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  __break(1u);
  return result;
}

uint64_t UsageItemRecord.UsageType.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4658);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DD336024();
  sub_1DD342BE8();
  sub_1DD342AEC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DD334B1C@<X0>(_QWORD *a1@<X0>, BOOL *a2@<X8>)
{
  return UsageItemRecord.UsageType.init(from:)(a1, a2);
}

uint64_t sub_1DD334B30(_QWORD *a1)
{
  return UsageItemRecord.UsageType.encode(to:)(a1);
}

uint64_t sub_1DD334B44(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + 64 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return sub_1DD342990();
LABEL_8:
  __break(1u);
  return result;
}

double sub_1DD334BC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double result;
  uint64_t v21;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1DD310404(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v21 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1DD335388();
      v11 = v21;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56) + (v8 << 6);
    v13 = *(_QWORD *)(v12 + 16);
    v14 = *(_QWORD *)(v12 + 24);
    v15 = *(_BYTE *)(v12 + 32);
    v16 = *(_BYTE *)(v12 + 33);
    v17 = *(_QWORD *)(v12 + 40);
    v18 = *(_QWORD *)(v12 + 48);
    v19 = *(_QWORD *)(v12 + 56);
    *(_OWORD *)a3 = *(_OWORD *)v12;
    *(_QWORD *)(a3 + 16) = v13;
    *(_QWORD *)(a3 + 24) = v14;
    *(_BYTE *)(a3 + 32) = v15;
    *(_BYTE *)(a3 + 33) = v16;
    *(_QWORD *)(a3 + 40) = v17;
    *(_QWORD *)(a3 + 48) = v18;
    *(_QWORD *)(a3 + 56) = v19;
    sub_1DD335048(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1DD334CDC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t i;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D46D8);
  v41 = a2;
  v6 = sub_1DD342A50();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v39 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v38 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v38)
          goto LABEL_33;
        v23 = v39[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_33;
          v23 = v39[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v41 & 1) != 0)
              {
                v37 = 1 << *(_BYTE *)(v5 + 32);
                if (v37 >= 64)
                  bzero(v39, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v39 = -1 << v37;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v38)
                  goto LABEL_33;
                v23 = v39[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v30 = *v29;
      v31 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + (v21 << 6);
      v33 = *(_QWORD *)(v32 + 8);
      v34 = *(_QWORD *)(v32 + 24);
      v46 = *(_QWORD *)(v32 + 16);
      v44 = *(_BYTE *)(v32 + 33);
      v45 = *(_BYTE *)(v32 + 32);
      v35 = *(_QWORD *)(v32 + 48);
      v42 = *(_QWORD *)v32;
      v43 = *(_QWORD *)(v32 + 40);
      v36 = *(_QWORD *)(v32 + 56);
      if ((v41 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_1DD342BB8();
      sub_1DD3427B0();
      result = sub_1DD342BD0();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v16 == v26;
          if (v16 == v26)
            v16 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      *v18 = v30;
      v18[1] = v31;
      v19 = *(_QWORD *)(v7 + 56) + (v17 << 6);
      *(_QWORD *)v19 = v42;
      *(_QWORD *)(v19 + 8) = v33;
      *(_QWORD *)(v19 + 16) = v46;
      *(_QWORD *)(v19 + 24) = v34;
      *(_BYTE *)(v19 + 32) = v45;
      *(_BYTE *)(v19 + 33) = v44;
      *(_QWORD *)(v19 + 40) = v43;
      *(_QWORD *)(v19 + 48) = v35;
      *(_QWORD *)(v19 + 56) = v36;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1DD335048(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  __int128 *v18;
  __int128 *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1DD342984();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1DD342BB8();
        swift_bridgeObjectRetain();
        sub_1DD3427B0();
        v12 = sub_1DD342BD0();
        result = swift_bridgeObjectRelease();
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (__int128 *)(v17 + (v3 << 6));
          v19 = (__int128 *)(v17 + (v6 << 6));
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 4))
          {
            v9 = *v19;
            v10 = v19[1];
            v11 = v19[3];
            v18[2] = v19[2];
            v18[3] = v11;
            *v18 = v9;
            v18[1] = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1DD335224(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1DD310404(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1DD335388();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_1DD336E5C((uint64_t)a1, v18[7] + (v12 << 6));
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    v23 = (_OWORD *)(v18[7] + (v12 << 6));
    v24 = *a1;
    v25 = a1[1];
    v26 = a1[3];
    v23[2] = a1[2];
    v23[3] = v26;
    *v23 = v24;
    v23[1] = v25;
    v27 = v18[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v18[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1DD334CDC(v15, a4 & 1);
  v20 = sub_1DD310404(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_1DD336E5C((uint64_t)a1, v18[7] + (v12 << 6));
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1DD342B58();
  __break(1u);
  return result;
}

void *sub_1DD335388()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D46D8);
  v2 = *v0;
  v3 = sub_1DD342A44();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v33 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v33 >= v13)
      goto LABEL_26;
    v34 = *(_QWORD *)(v6 + 8 * v33);
    ++v9;
    if (!v34)
    {
      v9 = v33 + 1;
      if (v33 + 1 >= v13)
        goto LABEL_26;
      v34 = *(_QWORD *)(v6 + 8 * v9);
      if (!v34)
        break;
    }
LABEL_25:
    v12 = (v34 - 1) & v34;
    v15 = __clz(__rbit64(v34)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = v15 << 6;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = *(_QWORD *)(v21 + 16);
    v25 = *(_QWORD *)(v21 + 24);
    v26 = *(_BYTE *)(v21 + 32);
    v27 = *(_BYTE *)(v21 + 33);
    v28 = *(_QWORD *)(v21 + 40);
    v29 = *(_QWORD *)(v21 + 48);
    v30 = *(_QWORD *)(v21 + 56);
    v31 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v31 = v19;
    v31[1] = v18;
    v32 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v32 = v22;
    *(_QWORD *)(v32 + 8) = v23;
    *(_QWORD *)(v32 + 16) = v24;
    *(_QWORD *)(v32 + 24) = v25;
    *(_BYTE *)(v32 + 32) = v26;
    *(_BYTE *)(v32 + 33) = v27;
    *(_QWORD *)(v32 + 40) = v28;
    *(_QWORD *)(v32 + 48) = v29;
    *(_QWORD *)(v32 + 56) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v35 = v33 + 2;
  if (v35 >= v13)
    goto LABEL_26;
  v34 = *(_QWORD *)(v6 + 8 * v35);
  if (v34)
  {
    v9 = v35;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v35 + 1;
    if (__OFADD__(v35, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v34 = *(_QWORD *)(v6 + 8 * v9);
    ++v35;
    if (v34)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1DD335584()
{
  uint64_t v0;
  _QWORD *v1;
  size_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  sub_1DD34290C();
  v0 = sub_1DD334004(v5, v6, v7, v5, v6, v7);
  sub_1DD336CEC(v5, v6, v7);
  sub_1DD336CEC(v5, v6, v7);
  if (!v0)
    return MEMORY[0x1E0DEE9D8];
  if (v0 <= 0)
  {
    v1 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D46D0);
    v1 = (_QWORD *)swift_allocObject();
    v2 = _swift_stdlib_malloc_size(v1);
    v1[2] = v0;
    v1[3] = 2 * ((uint64_t)(v2 - 32) / 80);
  }
  swift_retain();
  v3 = sub_1DD335718(&v5, (uint64_t)(v1 + 4), v0);
  swift_release();
  result = sub_1DD336CEC(v6, v7, v8);
  if (v3 == v0)
    return (uint64_t)v1;
  __break(1u);
  return result;
}

uint64_t sub_1DD335718(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t *v8;
  uint64_t *v9;
  int v10;
  uint64_t *v11;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB64FF0);
  sub_1DD34290C();
  result = swift_release();
  v9 = (uint64_t *)*((_QWORD *)&v31 + 1);
  v8 = (uint64_t *)v31;
  LOBYTE(v10) = v32;
  v21 = a1;
  if (a2)
  {
    if (!a3)
      goto LABEL_12;
    if (a3 < 0)
    {
LABEL_17:
      __break(1u);
      return result;
    }
    v20 = a3;
    result = sub_1DD34290C();
    if ((v32 & 1) == 0)
    {
      v8 = (uint64_t *)*((_QWORD *)&v31 + 1);
      v11 = (uint64_t *)v31;
      a3 = 0;
      v22 = v20 - 1;
      v13 = DWORD2(v31);
      v12 = (uint64_t *)v31;
      while ((_DWORD)v8 == v13)
      {
        if (v11 == v12)
        {
          LOBYTE(v10) = 0;
          goto LABEL_15;
        }
        MEMORY[0x1E0C80A78](result);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4630);
        v14 = sub_1DD34290C();
        v9 = &v20;
        v29 = v32;
        v30 = v31;
        v27 = v34;
        v28 = v33;
        v25 = v36;
        v26 = v35;
        v24 = v37;
        v23 = v38;
        v15 = v39;
        MEMORY[0x1E0C80A78](v14);
        swift_retain();
        sub_1DD34290C();
        swift_release();
        v8 = (uint64_t *)*((_QWORD *)&v31 + 1);
        v11 = (uint64_t *)v31;
        v10 = v32;
        v16 = v29;
        *(_OWORD *)a2 = v30;
        *(_OWORD *)(a2 + 16) = v16;
        v17 = v27;
        *(_QWORD *)(a2 + 32) = v28;
        *(_QWORD *)(a2 + 40) = v17;
        *(_BYTE *)(a2 + 48) = v26;
        *(_BYTE *)(a2 + 49) = v25;
        v18 = v23;
        *(_QWORD *)(a2 + 56) = v24;
        *(_QWORD *)(a2 + 64) = v18;
        *(_QWORD *)(a2 + 72) = v15;
        if (v22 == a3)
        {
          a3 = v20;
          goto LABEL_15;
        }
        result = sub_1DD34290C();
        v13 = DWORD2(v31);
        v12 = (uint64_t *)v31;
        ++a3;
        a2 += 80;
        if (((v10 | v32) & 1) != 0)
          goto LABEL_10;
      }
      __break(1u);
      goto LABEL_17;
    }
LABEL_10:
    __break(1u);
  }
  a3 = 0;
LABEL_12:
  v11 = v8;
  v8 = v9;
LABEL_15:
  v19 = v21;
  *v21 = v3;
  v19[1] = v11;
  v19[2] = v8;
  *((_BYTE *)v19 + 24) = v10;
  return a3;
}

uint64_t sub_1DD3359EC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v3 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746F6D6572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1DD342B34();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1DD335AC4(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x614E64726F636572 && a2 == 0xEA0000000000656DLL || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000 || (sub_1DD342B34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6173556C61746F74 && a2 == 0xEA00000000006567)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_1DD342B34();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_1DD335D10(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  int64_t v28;
  char v29;
  uint64_t v30;
  int64_t v31;
  _QWORD v33[4];
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  v30 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(v4 + 63) >> 6;
  v39 = a1;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_17;
    }
    if (__OFADD__(v8++, 1))
      break;
    if (v8 >= v31)
      goto LABEL_27;
    v12 = *(_QWORD *)(v30 + 8 * v8);
    if (!v12)
    {
      v13 = v8 + 1;
      if (v8 + 1 >= v31)
        goto LABEL_27;
      v12 = *(_QWORD *)(v30 + 8 * v13);
      if (v12)
        goto LABEL_15;
      v13 = v8 + 2;
      if (v8 + 2 >= v31)
        goto LABEL_27;
      v12 = *(_QWORD *)(v30 + 8 * v13);
      if (v12)
        goto LABEL_15;
      v13 = v8 + 3;
      if (v8 + 3 >= v31)
        goto LABEL_27;
      v12 = *(_QWORD *)(v30 + 8 * v13);
      if (v12)
      {
LABEL_15:
        v8 = v13;
      }
      else
      {
        v28 = v8 + 4;
        if (v8 + 4 >= v31)
        {
LABEL_27:
          swift_release();
          v29 = 0;
          return v29 & 1;
        }
        v12 = *(_QWORD *)(v30 + 8 * v28);
        for (v8 += 4; !v12; ++v28)
        {
          v8 = v28 + 1;
          if (__OFADD__(v28, 1))
            goto LABEL_30;
          if (v8 >= v31)
            goto LABEL_27;
          v12 = *(_QWORD *)(v30 + 8 * v8);
        }
      }
    }
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_17:
    v14 = (uint64_t *)(*(_QWORD *)(v39 + 48) + 16 * v10);
    v15 = *v14;
    v16 = v14[1];
    v17 = *(_QWORD *)(v39 + 56) + (v10 << 6);
    v18 = *(_QWORD *)(v17 + 8);
    v19 = *(_QWORD *)(v17 + 16);
    v20 = *(_QWORD *)(v17 + 24);
    v21 = *(_BYTE *)(v17 + 32);
    v22 = *(_BYTE *)(v17 + 33);
    v23 = *(_QWORD *)(v17 + 40);
    v24 = *(_QWORD *)(v17 + 48);
    v25 = *(_QWORD *)(v17 + 56);
    v33[0] = *(_QWORD *)v17;
    v33[1] = v18;
    v33[2] = v19;
    v33[3] = v20;
    v34 = v21;
    v35 = v22;
    v36 = v23;
    v37 = v24;
    v38 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26 = a2(v15, v16, v33);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v29 & 1;
    }
    v27 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
    {
      swift_release();
      v29 = 1;
      return v29 & 1;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1DD335FA0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1DD342B34();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1DD336014()
{
  return 1701869940;
}

unint64_t sub_1DD336024()
{
  unint64_t result;

  result = qword_1F03D4650;
  if (!qword_1F03D4650)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344AE0, &type metadata for UsageItemRecord.UsageType.Key);
    atomic_store(result, (unint64_t *)&qword_1F03D4650);
  }
  return result;
}

unint64_t sub_1DD33606C()
{
  unint64_t result;

  result = qword_1F03D4660;
  if (!qword_1F03D4660)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageItemRecord.UsageType, &type metadata for UsageItemRecord.UsageType);
    atomic_store(result, (unint64_t *)&qword_1F03D4660);
  }
  return result;
}

unint64_t sub_1DD3360B4()
{
  unint64_t result;

  result = qword_1F03D4668;
  if (!qword_1F03D4668)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageItemRecord.Source, &type metadata for UsageItemRecord.Source);
    atomic_store(result, (unint64_t *)&qword_1F03D4668);
  }
  return result;
}

unint64_t sub_1DD3360FC()
{
  unint64_t result;

  result = qword_1F03D4670;
  if (!qword_1F03D4670)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageItemRecord, &type metadata for UsageItemRecord);
    atomic_store(result, (unint64_t *)&qword_1F03D4670);
  }
  return result;
}

uint64_t sub_1DD336140(uint64_t a1, uint64_t a2)
{
  return sub_1DD33616C(&qword_1EDB64FE8, a2, (uint64_t (*)(uint64_t))type metadata accessor for UsageStore, (uint64_t)&protocol conformance descriptor for UsageStore);
}

uint64_t sub_1DD33616C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1DF0D9108](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for UsageStore()
{
  return objc_opt_self();
}

uint64_t sub_1DD3361CC()
{
  return sub_1DD31A0CC(&qword_1F03D4678, (uint64_t *)&unk_1EDB64FF0, MEMORY[0x1E0DE9F30]);
}

uint64_t sub_1DD3361F8()
{
  return sub_1DD31A0CC(&qword_1F03D4680, &qword_1F03D4688, MEMORY[0x1E0DEA228]);
}

uint64_t sub_1DD336224()
{
  return sub_1DD31A0CC(&qword_1F03D4690, &qword_1F03D4698, MEMORY[0x1E0DEDE48]);
}

uint64_t sub_1DD336250()
{
  return sub_1DD31A0CC(&qword_1F03D46A0, &qword_1F03D46A8, MEMORY[0x1E0DEC908]);
}

unint64_t sub_1DD336280()
{
  unint64_t result;

  result = qword_1F03D46B0;
  if (!qword_1F03D46B0)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344A78, &type metadata for UsageItemRecord.UsageType.Key);
    atomic_store(result, (unint64_t *)&qword_1F03D46B0);
  }
  return result;
}

unint64_t sub_1DD3362C8()
{
  unint64_t result;

  result = qword_1F03D46B8;
  if (!qword_1F03D46B8)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344B58, &type metadata for UsageItemRecord.UsageType.Key);
    atomic_store(result, (unint64_t *)&qword_1F03D46B8);
  }
  return result;
}

unint64_t sub_1DD336310()
{
  unint64_t result;

  result = qword_1F03D46C0;
  if (!qword_1F03D46C0)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344B30, &type metadata for UsageItemRecord.UsageType.Key);
    atomic_store(result, (unint64_t *)&qword_1F03D46C0);
  }
  return result;
}

unint64_t sub_1DD336358()
{
  unint64_t result;

  result = qword_1F03D46C8;
  if (!qword_1F03D46C8)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344B80, &type metadata for UsageItemRecord.UsageType.CodingError);
    atomic_store(result, (unint64_t *)&qword_1F03D46C8);
  }
  return result;
}

uint64_t sub_1DD33639C()
{
  return 0;
}

uint64_t destroy for UsageItemRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UsageItemRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UsageItemRecord(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for UsageItemRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageItemRecord(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageItemRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UsageItemRecord()
{
  return &type metadata for UsageItemRecord;
}

_BYTE *sub_1DD33661C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UsageItemRecord.UsageType()
{
  return &type metadata for UsageItemRecord.UsageType;
}

ValueMetadata *type metadata accessor for UsageItemRecord.Source()
{
  return &type metadata for UsageItemRecord.Source;
}

uint64_t method lookup function for UsageStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UsageStore.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of UsageStore.open(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of UsageStore.save(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

ValueMetadata *type metadata accessor for UsageItemRecord.UsageType.Key()
{
  return &type metadata for UsageItemRecord.UsageType.Key;
}

uint64_t _s14FamilyControls15UsageItemRecordV9UsageTypeO3KeyOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1DD3366E8 + 4 * byte_1DD3446B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DD336708 + 4 * byte_1DD3446B5[v4]))();
}

_BYTE *sub_1DD3366E8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DD336708(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DD336710(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DD336718(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DD336720(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DD336728(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UsageItemRecord.UsageType.CodingError()
{
  return &type metadata for UsageItemRecord.UsageType.CodingError;
}

uint64_t getEnumTagSinglePayload for UsageItemRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageItemRecord.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1DD336820 + 4 * byte_1DD3446BF[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1DD336854 + 4 * byte_1DD3446BA[v4]))();
}

uint64_t sub_1DD336854(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD33685C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD336864);
  return result;
}

uint64_t sub_1DD336870(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD336878);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1DD33687C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD336884(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UsageItemRecord.CodingKeys()
{
  return &type metadata for UsageItemRecord.CodingKeys;
}

uint64_t _s14FamilyControls15UsageItemRecordV9UsageTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14FamilyControls15UsageItemRecordV9UsageTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DD33697C + 4 * byte_1DD3446C9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DD3369B0 + 4 * byte_1DD3446C4[v4]))();
}

uint64_t sub_1DD3369B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD3369B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DD3369C0);
  return result;
}

uint64_t sub_1DD3369CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DD3369D4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DD3369D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DD3369E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UsageItemRecord.Source.CodingKeys()
{
  return &type metadata for UsageItemRecord.Source.CodingKeys;
}

ValueMetadata *type metadata accessor for UsageItemRecord.Source.LocalCodingKeys()
{
  return &type metadata for UsageItemRecord.Source.LocalCodingKeys;
}

ValueMetadata *type metadata accessor for UsageItemRecord.Source.RemoteCodingKeys()
{
  return &type metadata for UsageItemRecord.Source.RemoteCodingKeys;
}

unint64_t sub_1DD336A20()
{
  unint64_t result;

  result = qword_1F03D7690[0];
  if (!qword_1F03D7690[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344E84, &type metadata for UsageItemRecord.Source.CodingKeys);
    atomic_store(result, qword_1F03D7690);
  }
  return result;
}

unint64_t sub_1DD336A68()
{
  unint64_t result;

  result = qword_1F03D78A0[0];
  if (!qword_1F03D78A0[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344F3C, &type metadata for UsageItemRecord.CodingKeys);
    atomic_store(result, qword_1F03D78A0);
  }
  return result;
}

unint64_t sub_1DD336AB0()
{
  unint64_t result;

  result = qword_1F03D79B0;
  if (!qword_1F03D79B0)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344EAC, &type metadata for UsageItemRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D79B0);
  }
  return result;
}

unint64_t sub_1DD336AF8()
{
  unint64_t result;

  result = qword_1F03D79B8[0];
  if (!qword_1F03D79B8[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344ED4, &type metadata for UsageItemRecord.CodingKeys);
    atomic_store(result, qword_1F03D79B8);
  }
  return result;
}

unint64_t sub_1DD336B40()
{
  unint64_t result;

  result = qword_1F03D7A40;
  if (!qword_1F03D7A40)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344DA4, &type metadata for UsageItemRecord.Source.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D7A40);
  }
  return result;
}

unint64_t sub_1DD336B88()
{
  unint64_t result;

  result = qword_1F03D7A48[0];
  if (!qword_1F03D7A48[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344DCC, &type metadata for UsageItemRecord.Source.LocalCodingKeys);
    atomic_store(result, qword_1F03D7A48);
  }
  return result;
}

unint64_t sub_1DD336BD0()
{
  unint64_t result;

  result = qword_1F03D7AD0;
  if (!qword_1F03D7AD0)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344D54, &type metadata for UsageItemRecord.Source.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D7AD0);
  }
  return result;
}

unint64_t sub_1DD336C18()
{
  unint64_t result;

  result = qword_1F03D7AD8[0];
  if (!qword_1F03D7AD8[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344D7C, &type metadata for UsageItemRecord.Source.RemoteCodingKeys);
    atomic_store(result, qword_1F03D7AD8);
  }
  return result;
}

unint64_t sub_1DD336C60()
{
  unint64_t result;

  result = qword_1F03D7B60;
  if (!qword_1F03D7B60)
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344DF4, &type metadata for UsageItemRecord.Source.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03D7B60);
  }
  return result;
}

unint64_t sub_1DD336CA8()
{
  unint64_t result;

  result = qword_1F03D7B68[0];
  if (!qword_1F03D7B68[0])
  {
    result = MEMORY[0x1DF0D9108](&unk_1DD344E1C, &type metadata for UsageItemRecord.Source.CodingKeys);
    atomic_store(result, qword_1F03D7B68);
  }
  return result;
}

uint64_t sub_1DD336CEC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1DD336CF8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1DD336D04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DD332778(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_BYTE *)(v1 + 40), a1);
}

uint64_t sub_1DD336D34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = *(unsigned __int8 *)(v1 + 40);
  swift_beginAccess();
  result = sub_1DD332630((uint64_t)(a1 + 2), v3, v5, v6, *(_QWORD *)(v4 + 16));
  *a1 = result;
  a1[1] = v8;
  return result;
}

uint64_t sub_1DD336DAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = 1 << *(_BYTE *)(v4 + 32);
  v6 = *(unsigned int *)(v4 + 36);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = 0;
  return result;
}

uint64_t sub_1DD336E08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  char v5;

  swift_beginAccess();
  result = sub_1DD33245C(*(_QWORD *)(v1 + 16));
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  return result;
}

uint64_t sub_1DD336E5C(uint64_t a1, uint64_t a2)
{
  return assignWithTake for UsageItemRecord(a2, a1);
}

uint64_t sub_1DD336E6C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB64F90);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x1DF0D9108](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DD336EE0()
{
  unint64_t result;

  result = qword_1EDB64EE0;
  if (!qword_1EDB64EE0)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for UsageItemRecord, &type metadata for UsageItemRecord);
    atomic_store(result, (unint64_t *)&qword_1EDB64EE0);
  }
  return result;
}

double sub_1DD336F54@<D0>(uint64_t a1@<X8>)
{
  return sub_1DD332BF0(a1);
}

void *sub_1DD336F70()
{
  return &unk_1EA71D1B0;
}

unint64_t sub_1DD336F7C()
{
  return 0xD000000000000025;
}

ValueMetadata *type metadata accessor for FamilyControlsAgentPrivateService()
{
  return &type metadata for FamilyControlsAgentPrivateService;
}

id sub_1DD336FA8()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 16);
}

void sub_1DD336FD8(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

uint64_t (*sub_1DD33701C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t XPCConnection.__allocating_init(machServiceName:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = swift_allocObject();
  v5 = objc_allocWithZone(MEMORY[0x1E0CB3B38]);
  v6 = (void *)sub_1DD34278C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithMachServiceName_options_, v6, a3);

  *(_QWORD *)(v4 + 16) = v7;
  return v4;
}

uint64_t XPCConnection.init(machServiceName:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  id v7;

  v5 = objc_allocWithZone(MEMORY[0x1E0CB3B38]);
  v6 = (void *)sub_1DD34278C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithMachServiceName_options_, v6, a3);

  *(_QWORD *)(v3 + 16) = v7;
  return v3;
}

uint64_t XPCConnection.__allocating_init(listenerEndpoint:)(void *a1)
{
  uint64_t v2;
  id v3;

  v2 = swift_allocObject();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3B38]), sel_initWithListenerEndpoint_, a1);

  *(_QWORD *)(v2 + 16) = v3;
  return v2;
}

uint64_t XPCConnection.init(listenerEndpoint:)(void *a1)
{
  uint64_t v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3B38]), sel_initWithListenerEndpoint_, a1);

  *(_QWORD *)(v1 + 16) = v3;
  return v1;
}

uint64_t sub_1DD337228()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  v1 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
  v2 = objc_msgSend(v1, sel_serviceName);

  if (!v2)
    return 0;
  v3 = sub_1DD342798();

  return v3;
}

uint64_t sub_1DD3372A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 136))();
}

uint64_t sub_1DD3372C8(uint64_t a1, uint64_t a2)
{
  _BYTE v4[32];

  sub_1DD32E218(a1, (uint64_t)v4);
  return (*(uint64_t (**)(_BYTE *))(**(_QWORD **)a2 + 144))(v4);
}

double sub_1DD337308@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  double result;

  v3 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  v4 = objc_msgSend(v3, sel_exportedObject);

  if (v4)
  {
    sub_1DD34296C();
    swift_unknownObjectRelease();
  }
  else
  {
    result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_1DD337384(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[3];
  uint64_t v12;

  v3 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  sub_1DD32E218(a1, (uint64_t)v11);
  v4 = v12;
  if (v12)
  {
    v5 = __swift_project_boxed_opaque_existential_1(v11, v12);
    v6 = *(_QWORD *)(v4 - 8);
    MEMORY[0x1E0C80A78](v5);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v6 + 16))(v8);
    v9 = sub_1DD342B28();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v3, sel_setExportedObject_, v9);

  swift_unknownObjectRelease();
  return sub_1DD310B9C(a1);
}

void (*sub_1DD337490(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  char *v3;
  _OWORD *v4;
  void *v5;
  id v6;

  v3 = (char *)malloc(0x48uLL);
  *a1 = v3;
  v4 = v3 + 32;
  *((_QWORD *)v3 + 8) = v1;
  v5 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  v6 = objc_msgSend(v5, sel_exportedObject);

  if (v6)
  {
    sub_1DD34296C();
    swift_unknownObjectRelease();
  }
  else
  {
    *v4 = 0u;
    *((_OWORD *)v3 + 3) = 0u;
  }
  sub_1DD32E1D0((uint64_t)v4, (uint64_t)v3);
  return sub_1DD337534;
}

void sub_1DD337534(uint64_t *a1, char a2)
{
  void *v2;

  v2 = (void *)*a1;
  if ((a2 & 1) != 0)
  {
    sub_1DD32E218(*a1, (uint64_t)v2 + 32);
    sub_1DD337384((uint64_t)v2 + 32);
    sub_1DD310B9C((uint64_t)v2);
  }
  else
  {
    sub_1DD337384(*a1);
  }
  free(v2);
}

uint64_t sub_1DD337594@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 160))();
  *a2 = result;
  return result;
}

uint64_t sub_1DD3375C4(id *a1, uint64_t a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))(**(_QWORD **)a2 + 168);
  v4 = *a1;
  return v3(v2);
}

id sub_1DD337600()
{
  return sub_1DD337704((SEL *)&selRef_exportedInterface);
}

void sub_1DD33760C(void *a1)
{
  sub_1DD337758(a1, (SEL *)&selRef_setExportedInterface_);
}

void (*sub_1DD337618(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t (*v3)(void);
  void *v4;
  id v5;

  a1[1] = v1;
  v3 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 88);
  a1[2] = v3;
  v4 = (void *)v3();
  v5 = objc_msgSend(v4, sel_exportedInterface);

  *a1 = v5;
  return sub_1DD337680;
}

void sub_1DD337680(uint64_t a1, char a2)
{
  sub_1DD337818(a1, a2, (SEL *)&selRef_setExportedInterface_);
}

uint64_t sub_1DD33768C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 184))();
  *a2 = result;
  return result;
}

uint64_t sub_1DD3376BC(id *a1, uint64_t a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))(**(_QWORD **)a2 + 192);
  v4 = *a1;
  return v3(v2);
}

id sub_1DD3376F8()
{
  return sub_1DD337704((SEL *)&selRef_remoteObjectInterface);
}

id sub_1DD337704(SEL *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v3 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  v4 = objc_msgSend(v3, *a1);

  return v4;
}

void sub_1DD33774C(void *a1)
{
  sub_1DD337758(a1, (SEL *)&selRef_setRemoteObjectInterface_);
}

void sub_1DD337758(void *a1, SEL *a2)
{
  uint64_t v2;
  void *v4;

  v4 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v2 + 88))();
  objc_msgSend(v4, *a2, a1);

}

void (*sub_1DD3377A4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t (*v3)(void);
  void *v4;
  id v5;

  a1[1] = v1;
  v3 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 88);
  a1[2] = v3;
  v4 = (void *)v3();
  v5 = objc_msgSend(v4, sel_remoteObjectInterface);

  *a1 = v5;
  return sub_1DD33780C;
}

void sub_1DD33780C(uint64_t a1, char a2)
{
  sub_1DD337818(a1, a2, (SEL *)&selRef_setRemoteObjectInterface_);
}

void sub_1DD337818(uint64_t a1, char a2, SEL *a3)
{
  uint64_t (*v4)(void);
  id v5;
  id v6;

  v4 = *(uint64_t (**)(void))(a1 + 16);
  v5 = *(id *)a1;
  if ((a2 & 1) != 0)
  {
    v5 = v5;
    v6 = (id)v4();
    objc_msgSend(v6, *a3, v5);

  }
  else
  {
    v6 = (id)v4();
    objc_msgSend(v6, *a3, v5);
  }

}

void sub_1DD337890()
{
  sub_1DD3378A8((SEL *)&selRef_resume);
}

void sub_1DD33789C()
{
  sub_1DD3378A8((SEL *)&selRef_invalidate);
}

void sub_1DD3378A8(SEL *a1)
{
  uint64_t v1;
  id v3;

  v3 = (id)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  objc_msgSend(v3, *a1);

}

uint64_t sub_1DD3378E8()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
  v2 = objc_msgSend(v1, sel_remoteObjectProxy);

  sub_1DD34296C();
  return swift_unknownObjectRelease();
}

uint64_t sub_1DD3379E8(uint64_t a1, uint64_t a2)
{
  return sub_1DD337B6C(a1, a2, (uint64_t)&block_descriptor_5, (SEL *)&selRef_remoteObjectProxyWithErrorHandler_);
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_1DD337B58(uint64_t a1, uint64_t a2)
{
  return sub_1DD337B6C(a1, a2, (uint64_t)&block_descriptor_3, (SEL *)&selRef_synchronousRemoteObjectProxyWithErrorHandler_);
}

uint64_t sub_1DD337B6C(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];

  v9 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v4 + 88))();
  v13[4] = a1;
  v13[5] = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1DD30ED08;
  v13[3] = a3;
  v10 = _Block_copy(v13);
  swift_retain();
  swift_release();
  v11 = objc_msgSend(v9, *a4, v10);
  _Block_release(v10);

  sub_1DD34296C();
  return swift_unknownObjectRelease();
}

uint64_t XPCConnection.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t XPCConnection.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_1DD337DC8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t sub_1DD337DD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_1DD337DE0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t (*sub_1DD337DEC(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 152))();
  return sub_1DD337E38;
}

uint64_t sub_1DD337E3C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t sub_1DD337E48()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t (*sub_1DD337E54(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 176))();
  return sub_1DD337E38;
}

uint64_t sub_1DD337EA0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_1DD337EAC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t (*sub_1DD337EB8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 200))();
  return sub_1DD337E38;
}

void sub_1DD337F04(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_1DD337F30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t sub_1DD337F3C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t sub_1DD337F48()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t type metadata accessor for XPCConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCConnection.__allocating_init(machServiceName:options:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of XPCConnection.__allocating_init(listenerEndpoint:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of XPCConnection.serviceName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of XPCConnection.exportedObject.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of XPCConnection.exportedObject.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of XPCConnection.exportedObject.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of XPCConnection.exportedInterface.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of XPCConnection.exportedInterface.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of XPCConnection.exportedInterface.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of XPCConnection.remoteObjectInterface.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of XPCConnection.remoteObjectInterface.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of XPCConnection.remoteObjectInterface.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of XPCConnection.resume()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of XPCConnection.invalidate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of XPCConnection.remoteObjectProxy()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of XPCConnection.remoteObjectProxyWithErrorHandler(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of XPCConnection.synchronousRemoteObjectProxyWithErrorHandler(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t sub_1DD338044()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1DD33806C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_1DD3421E0();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t AppleAccount.firstName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppleAccount.firstName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AppleAccount.firstName.modify())()
{
  return nullsub_1;
}

uint64_t AppleAccount.lastName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppleAccount.lastName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*AppleAccount.lastName.modify())()
{
  return nullsub_1;
}

uint64_t AppleAccount.fullName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppleAccount.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AppleAccount.fullName.modify())()
{
  return nullsub_1;
}

uint64_t AppleAccount.altDSID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppleAccount.altDSID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AppleAccount.altDSID.modify())()
{
  return nullsub_1;
}

uint64_t AppleAccount.appleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppleAccount.appleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t (*AppleAccount.appleID.modify())()
{
  return nullsub_1;
}

uint64_t AppleAccount.isParent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t AppleAccount.isParent.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 80) = result;
  return result;
}

uint64_t (*AppleAccount.isParent.modify())()
{
  return nullsub_1;
}

uint64_t AppleAccount.isChild.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 81);
}

uint64_t AppleAccount.isChild.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 81) = result;
  return result;
}

uint64_t (*AppleAccount.isChild.modify())()
{
  return nullsub_1;
}

uint64_t AppleAccount.isMe.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 82);
}

uint64_t AppleAccount.isMe.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 82) = result;
  return result;
}

uint64_t (*AppleAccount.isMe.modify())()
{
  return nullsub_1;
}

void __swiftcall AppleAccount.init()(FamilyControls::AppleAccount *__return_ptr retstr)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;
  Swift::Bool v28;
  Swift::Bool v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  Swift::Bool v47;
  __int16 v48;

  v2 = sub_1DD3423D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = 0;
  v47 = 0;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8F2B8]), sel_init);
  v7 = objc_msgSend(v6, sel_aa_primaryAppleAccount);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, sel_aa_firstName);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1DD342798();
      v45 = v12;
      v46 = v11;

    }
    else
    {
      v45 = 0;
      v46 = 0;
    }
    v30 = objc_msgSend(v8, sel_aa_lastName);
    if (v30)
    {
      v31 = v30;
      v32 = sub_1DD342798();
      v43 = v33;
      v44 = v32;

    }
    else
    {
      v43 = 0;
      v44 = 0;
    }
    v34 = objc_msgSend(v8, sel_aa_fullName, v43, v44);
    if (v34)
    {
      v35 = v34;
      v22 = sub_1DD342798();
      v21 = v36;

    }
    else
    {
      v22 = 0;
      v21 = 0;
    }
    v37 = objc_msgSend(v8, sel_aa_altDSID);
    if (v37)
    {
      v38 = v37;
      v20 = sub_1DD342798();
      v19 = v39;

    }
    else
    {
      v20 = 0;
      v19 = 0;
    }
    v40 = objc_msgSend(v8, sel_aa_primaryEmail);
    if (v40)
    {
      v41 = v40;
      v18 = sub_1DD342798();
      v17 = v42;

      v28 = 0;
      v27 = 0;
    }
    else
    {

      v28 = 0;
      v27 = 0;
      v17 = 0;
      v18 = 0;
    }
    v29 = 1;
    v25 = v45;
    v26 = v46;
    v23 = v43;
    v24 = v44;
  }
  else
  {
    v13 = sub_1DD338D0C();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
    v14 = sub_1DD3423C0();
    v15 = sub_1DD3428AC();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DD30C000, v14, v15, "Failed to find a primary Apple Account", v16, 2u);
      MEMORY[0x1DF0D91B0](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = HIBYTE(v48);
    v28 = v48;
    v29 = v47;
  }
  retstr->firstName.value._countAndFlagsBits = v26;
  retstr->firstName.value._object = v25;
  retstr->lastName.value._countAndFlagsBits = v24;
  retstr->lastName.value._object = v23;
  retstr->fullName.value._countAndFlagsBits = v22;
  retstr->fullName.value._object = v21;
  retstr->altDSID.value._countAndFlagsBits = v20;
  retstr->altDSID.value._object = v19;
  retstr->appleID.value._countAndFlagsBits = v18;
  retstr->appleID.value._object = v17;
  retstr->isParent = v27;
  retstr->isChild = v28;
  retstr->isMe = v29;
}

void __swiftcall AppleAccount.copy()(FamilyControls::AppleAccount *__return_ptr retstr)
{
  uint64_t v1;
  void *v2;
  char v3;
  char v4;
  char v5;

  v2 = *(void **)(v1 + 72);
  v3 = *(_BYTE *)(v1 + 80);
  v4 = *(_BYTE *)(v1 + 81);
  v5 = *(_BYTE *)(v1 + 82);
  retstr->firstName.value._countAndFlagsBits = *(_QWORD *)v1;
  *(_OWORD *)&retstr->firstName.value._object = *(_OWORD *)(v1 + 8);
  *(_OWORD *)&retstr->lastName.value._object = *(_OWORD *)(v1 + 24);
  *(_OWORD *)&retstr->fullName.value._object = *(_OWORD *)(v1 + 40);
  *(_OWORD *)&retstr->altDSID.value._object = *(_OWORD *)(v1 + 56);
  retstr->appleID.value._object = v2;
  retstr->isParent = v3;
  retstr->isChild = v4;
  retstr->isMe = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

uint64_t sub_1DD3386E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DD33870C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t sub_1DD338714()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 81);
}

uint64_t sub_1DD33871C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 82);
}

uint64_t sub_1DD338724@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;

  v2 = *(_QWORD *)(v1 + 72);
  v3 = *(_BYTE *)(v1 + 80);
  v4 = *(_BYTE *)(v1 + 81);
  v5 = *(_BYTE *)(v1 + 82);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v1 + 56);
  *(_QWORD *)(a1 + 72) = v2;
  *(_BYTE *)(a1 + 80) = v3;
  *(_BYTE *)(a1 + 81) = v4;
  *(_BYTE *)(a1 + 82) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for AppleAccount()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppleAccount(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_WORD *)(a1 + 81) = *(_WORD *)(a2 + 81);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppleAccount(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  *(_BYTE *)(a1 + 82) = *(_BYTE *)(a2 + 82);
  return a1;
}

__n128 __swift_memcpy83_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 79) = *(_DWORD *)(a2 + 79);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for AppleAccount(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  *(_BYTE *)(a1 + 82) = *(_BYTE *)(a2 + 82);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleAccount(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 83))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleAccount(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 82) = 0;
    *(_WORD *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 83) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 83) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleAccount()
{
  return &type metadata for AppleAccount;
}

void *sub_1DD338AF8()
{
  return &unk_1EA71D480;
}

unint64_t sub_1DD338B04()
{
  return 0xD000000000000018;
}

uint64_t sub_1DD338B20(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7BF8);
}

uint64_t sub_1DD338B48()
{
  return sub_1DD338BC8(&qword_1F03D7BF0, (uint64_t)qword_1F03D7BF8);
}

uint64_t static Logger.activityItem.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7BF0, (uint64_t)qword_1F03D7BF8, a1);
}

uint64_t sub_1DD338B80(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7C18);
}

uint64_t sub_1DD338BAC()
{
  return sub_1DD338BC8(&qword_1F03D7C10, (uint64_t)qword_1F03D7C18);
}

uint64_t sub_1DD338BC8(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_1DD3423D8();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.activityPicker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7C10, (uint64_t)qword_1F03D7C18, a1);
}

uint64_t sub_1DD338C24@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1DD3423D8();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1DD338C8C(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7C38);
}

uint64_t sub_1DD338CAC()
{
  return sub_1DD338BC8(&qword_1F03D7C30, (uint64_t)qword_1F03D7C38);
}

uint64_t static Logger.appInfo.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7C30, (uint64_t)qword_1F03D7C38, a1);
}

uint64_t sub_1DD338CE4(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7C58);
}

uint64_t sub_1DD338D0C()
{
  return sub_1DD338BC8(&qword_1F03D7C50, (uint64_t)qword_1F03D7C58);
}

uint64_t static Logger.appleAccount.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7C50, (uint64_t)qword_1F03D7C58, a1);
}

uint64_t sub_1DD338D44(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1EDB65000);
}

uint64_t sub_1DD338D60()
{
  return sub_1DD338BC8(&qword_1EDB65018, (uint64_t)qword_1EDB65000);
}

uint64_t static Logger.agent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1EDB65018, (uint64_t)qword_1EDB65000, a1);
}

uint64_t sub_1DD338D98(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7C78);
}

uint64_t sub_1DD338DC4()
{
  return sub_1DD338BC8(&qword_1F03D7C70, (uint64_t)qword_1F03D7C78);
}

uint64_t static Logger.authentication.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7C70, (uint64_t)qword_1F03D7C78, a1);
}

uint64_t sub_1DD338DFC(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7C98);
}

uint64_t sub_1DD338E20()
{
  return sub_1DD338BC8(&qword_1F03D7C90, (uint64_t)qword_1F03D7C98);
}

uint64_t static Logger.authenticationUI.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7C90, (uint64_t)qword_1F03D7C98, a1);
}

uint64_t sub_1DD338E58(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1EDB65218);
}

uint64_t sub_1DD338E84()
{
  return sub_1DD338BC8(&qword_1EDB65230, (uint64_t)qword_1EDB65218);
}

uint64_t static Logger.authorization.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1EDB65230, (uint64_t)qword_1EDB65218, a1);
}

uint64_t sub_1DD338EBC(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7CB8);
}

uint64_t sub_1DD338ED8()
{
  return sub_1DD338BC8(&qword_1F03D7CB0, (uint64_t)qword_1F03D7CB8);
}

uint64_t static Logger.family.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7CB0, (uint64_t)qword_1F03D7CB8, a1);
}

uint64_t sub_1DD338F10(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7CD8);
}

uint64_t sub_1DD338F34()
{
  return sub_1DD338BC8(&qword_1F03D7CD0, (uint64_t)qword_1F03D7CD8);
}

uint64_t static Logger.overrideSettings.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7CD0, (uint64_t)qword_1F03D7CD8, a1);
}

uint64_t sub_1DD338F6C(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7CF8);
}

uint64_t sub_1DD338F94()
{
  return sub_1DD338BC8(&qword_1F03D7CF0, (uint64_t)qword_1F03D7CF8);
}

uint64_t static Logger.permissions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7CF0, (uint64_t)qword_1F03D7CF8, a1);
}

uint64_t sub_1DD338FCC(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1EDB651E0);
}

uint64_t sub_1DD338FF0()
{
  return sub_1DD338BC8(&qword_1EDB651F8, (uint64_t)qword_1EDB651E0);
}

uint64_t static Logger.syncEngine.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1EDB651F8, (uint64_t)qword_1EDB651E0, a1);
}

uint64_t sub_1DD339028(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1EDB65238);
}

uint64_t sub_1DD339044()
{
  return sub_1DD338BC8(&qword_1EDB65020, (uint64_t)qword_1EDB65238);
}

uint64_t static Logger.usage.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1EDB65020, (uint64_t)qword_1EDB65238, a1);
}

uint64_t sub_1DD33907C(uint64_t a1)
{
  return sub_1DD339094(a1, qword_1F03D7D18);
}

uint64_t sub_1DD339094(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1DD3423D8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1DD3423CC();
}

uint64_t sub_1DD339108()
{
  return sub_1DD338BC8(&qword_1F03D7D10, (uint64_t)qword_1F03D7D18);
}

uint64_t static Logger.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD338C24(&qword_1F03D7D10, (uint64_t)qword_1F03D7D18, a1);
}

unint64_t TokenType.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t *sub_1DD33915C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_1DD339178()
{
  sub_1DD339438();
  return sub_1DD342804();
}

uint64_t sub_1DD3391D4()
{
  sub_1DD339438();
  return sub_1DD3427F8();
}

BOOL LabelSlotType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_1DD339248(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DD33925C()
{
  sub_1DD342BB8();
  sub_1DD342BC4();
  return sub_1DD342BD0();
}

uint64_t sub_1DD3392A0()
{
  return sub_1DD342BC4();
}

uint64_t sub_1DD3392C8()
{
  sub_1DD342BB8();
  sub_1DD342BC4();
  return sub_1DD342BD0();
}

_QWORD *sub_1DD339308@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

void sub_1DD339338(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void *sub_1DD339344()
{
  return &unk_1EA71D490;
}

unint64_t sub_1DD339350()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_1DD339370()
{
  unint64_t result;

  result = qword_1F03D4818;
  if (!qword_1F03D4818)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for TokenType, &type metadata for TokenType);
    atomic_store(result, (unint64_t *)&qword_1F03D4818);
  }
  return result;
}

unint64_t sub_1DD3393B8()
{
  unint64_t result;

  result = qword_1F03D4820;
  if (!qword_1F03D4820)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for LabelSlotType, &type metadata for LabelSlotType);
    atomic_store(result, (unint64_t *)&qword_1F03D4820);
  }
  return result;
}

uint64_t sub_1DD3393FC()
{
  return MEMORY[0x1E0DEB428];
}

ValueMetadata *type metadata accessor for TokenType()
{
  return &type metadata for TokenType;
}

ValueMetadata *type metadata accessor for LabelSlotType()
{
  return &type metadata for LabelSlotType;
}

ValueMetadata *type metadata accessor for FamilyControlsAgentService()
{
  return &type metadata for FamilyControlsAgentService;
}

unint64_t sub_1DD339438()
{
  unint64_t result;

  result = qword_1F03D4828;
  if (!qword_1F03D4828)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for TokenType, &type metadata for TokenType);
    atomic_store(result, (unint64_t *)&qword_1F03D4828);
  }
  return result;
}

uint64_t dispatch thunk of Copyable.copy()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1DD339490(uint64_t a1)
{
  return sub_1DD339520(a1, (uint64_t (*)(void))sub_1DD339344, &qword_1EDB65040, algn_1EDB65048);
}

uint64_t *sub_1DD3394A8()
{
  if (qword_1EDB65050 != -1)
    swift_once();
  return &qword_1EDB65040;
}

uint64_t static FamilyControlsService.name.getter()
{
  return sub_1DD3395B0(qword_1EDB65050, &qword_1EDB65040);
}

uint64_t sub_1DD339508(uint64_t a1)
{
  return sub_1DD339520(a1, (uint64_t (*)(void))sub_1DD336F70, &qword_1EDB65028, &qword_1EDB65030);
}

uint64_t sub_1DD339520(uint64_t a1, uint64_t (*a2)(void), _QWORD *a3, _QWORD *a4)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (uint64_t *)a2();
  v8 = *v6;
  v7 = v6[1];
  *a3 = v8;
  *a4 = v7;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_1DD339550()
{
  if (qword_1EDB65038 != -1)
    swift_once();
  return &qword_1EDB65028;
}

uint64_t static FamilyControlsService.namePrivate.getter()
{
  return sub_1DD3395B0(&qword_1EDB65038, &qword_1EDB65028);
}

uint64_t sub_1DD3395B0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

void *sub_1DD339600()
{
  return &unk_1EA71D598;
}

unint64_t static FamilyControlsService.nameAPS.getter()
{
  return 0xD000000000000021;
}

void *sub_1DD339628()
{
  return &unk_1EA71D5A8;
}

unint64_t static FamilyControlsService.nameIDS.getter()
{
  return 0xD000000000000026;
}

id sub_1DD339650()
{
  id result;

  result = sub_1DD33966C();
  qword_1F03D81B8 = (uint64_t)result;
  return result;
}

id sub_1DD33966C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  __int128 v20;
  uint64_t v21;

  v0 = sub_1DD3423D8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1F03EA5C8);
  sub_1DD32AC08(0, &qword_1F03D4840);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4848);
  v5 = swift_allocObject();
  v20 = xmmword_1DD3432F0;
  *(_OWORD *)(v5 + 16) = xmmword_1DD3432F0;
  v6 = sub_1DD32AC08(0, &qword_1F03D4850);
  *(_QWORD *)(v5 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4858);
  *(_QWORD *)(v5 + 32) = v6;
  v7 = (void *)MEMORY[0x1DF0D8A18](v5);
  v21 = 0;
  sub_1DD342864();

  if (v21)
  {
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = v20;
    v9 = sub_1DD32AC08(0, &qword_1F03D4860);
    *(_QWORD *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4868);
    *(_QWORD *)(v8 + 32) = v9;
    v10 = (void *)MEMORY[0x1DF0D8A18](v8);
    v21 = 0;
    sub_1DD342864();

    if (v21)
    {
      v11 = (void *)sub_1DD342858();
      objc_msgSend(v4, sel_setClasses_forSelector_argumentIndex_ofReply_, v11, sel_getRemoteContentForActivitySlotWithSlotID_slotStyle_slotType_tokenToPresent_tokenType::, 1, 0);

      v12 = (void *)sub_1DD342858();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_setClasses_forSelector_argumentIndex_ofReply_, v12, sel_getRemoteContentByBundleIDWithBundleIdentifier_slotID_slotStyle_slotType::, 2, 0);

      v13 = (void *)sub_1DD342858();
      objc_msgSend(v4, sel_setClasses_forSelector_argumentIndex_ofReply_, v13, sel_getRemoteContentForActivitySlotWithSlotID_slotStyle_slotType_tokenToPresent_tokenType::, 0, 1);

      v14 = (void *)sub_1DD342858();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_setClasses_forSelector_argumentIndex_ofReply_, v14, sel_getRemoteContentByBundleIDWithBundleIdentifier_slotID_slotStyle_slotType::, 0, 1);

      return v4;
    }
    swift_bridgeObjectRelease();
  }
  v15 = sub_1DD338D60();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v15, v0);
  v16 = sub_1DD3423C0();
  v17 = sub_1DD3428AC();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1DD30C000, v16, v17, "Unable to set allowed classes", v18, 2u);
    MEMORY[0x1DF0D91B0](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t *sub_1DD3399F0()
{
  if (qword_1F03D81B0 != -1)
    swift_once();
  return &qword_1F03D81B8;
}

id static FamilyControlsService.agentInterface.getter()
{
  return sub_1DD339ABC(&qword_1F03D81B0, (id *)&qword_1F03D81B8);
}

id sub_1DD339A4C(uint64_t a1)
{
  return sub_1DD339B78(a1, &protocolRef__TtP14FamilyControls20FamilyControlsClient_, &qword_1F03D81C8);
}

uint64_t *sub_1DD339A60()
{
  if (qword_1F03D81C0 != -1)
    swift_once();
  return &qword_1F03D81C8;
}

id static FamilyControlsService.clientInterface.getter()
{
  return sub_1DD339ABC(&qword_1F03D81C0, (id *)&qword_1F03D81C8);
}

id sub_1DD339ABC(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id sub_1DD339AF4(uint64_t a1)
{
  return sub_1DD339B78(a1, &protocolRef__TtP14FamilyControls26FamilyControlsAgentPrivate_, &qword_1EDB65350);
}

uint64_t *sub_1DD339B08()
{
  if (qword_1EDB65358 != -1)
    swift_once();
  return &qword_1EDB65350;
}

id static FamilyControlsService.agentInterfacePrivate.getter()
{
  return sub_1DD339ABC(&qword_1EDB65358, (id *)&qword_1EDB65350);
}

id sub_1DD339B64(uint64_t a1)
{
  return sub_1DD339B78(a1, &protocolRef__TtP14FamilyControls27FamilyControlsClientPrivate_, &qword_1F03D81D8);
}

id sub_1DD339B78(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, *a2);
  *a3 = result;
  return result;
}

uint64_t *sub_1DD339BC0()
{
  if (qword_1F03D81D0 != -1)
    swift_once();
  return &qword_1F03D81D8;
}

id static FamilyControlsService.clientInterfacePrivate.getter()
{
  return sub_1DD339ABC(&qword_1F03D81D0, (id *)&qword_1F03D81D8);
}

uint64_t static FamilyControlsService.connection()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(void *, uint64_t, uint64_t);
  id v9;
  _BYTE v11[32];
  _OWORD v12[2];

  if (qword_1EDB65050[0] != -1)
    swift_once();
  v0 = qword_1EDB65040;
  v1 = *(_QWORD *)algn_1EDB65048;
  memset(v12, 0, sizeof(v12));
  if (qword_1F03D81B0 != -1)
    swift_once();
  v2 = (void *)qword_1F03D81B8;
  swift_beginAccess();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1F03D4830;
  swift_retain();
  v4 = v3(v0, v1, 4096);
  v6 = v5;
  swift_release();
  ObjectType = swift_getObjectType();
  sub_1DD32E218((uint64_t)v12, (uint64_t)v11);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 24))(v11, ObjectType, v6);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v6 + 48))(0, ObjectType, v6);
  v8 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 72);
  v9 = v2;
  v8(v2, ObjectType, v6);
  sub_1DD310B9C((uint64_t)v12);
  return v4;
}

uint64_t static FamilyControlsService.connection<A>(exportedObject:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  void (*v14)(void *, uint64_t, uint64_t);
  id v15;
  void (*v16)(void *, uint64_t, uint64_t);
  id v17;
  _BYTE v19[32];
  _QWORD v20[4];

  if (qword_1EDB65050[0] != -1)
    swift_once();
  v4 = qword_1EDB65040;
  v5 = *(_QWORD *)algn_1EDB65048;
  v20[3] = a2;
  v20[0] = a1;
  v6 = qword_1F03D81C0;
  swift_unknownObjectRetain();
  if (v6 != -1)
    swift_once();
  v7 = (void *)qword_1F03D81C8;
  if (qword_1F03D81B0 != -1)
    swift_once();
  v8 = (void *)qword_1F03D81B8;
  swift_beginAccess();
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1F03D4830;
  swift_retain();
  v10 = v9(v4, v5, 4096);
  v12 = v11;
  swift_release();
  ObjectType = swift_getObjectType();
  sub_1DD32E218((uint64_t)v20, (uint64_t)v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 24))(v19, ObjectType, v12);
  v14 = *(void (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v15 = v7;
  v14(v7, ObjectType, v12);
  v16 = *(void (**)(void *, uint64_t, uint64_t))(v12 + 72);
  v17 = v8;
  v16(v8, ObjectType, v12);
  sub_1DD310B9C((uint64_t)v20);
  return v10;
}

uint64_t static FamilyControlsService.connectionPrivate<A>(exportedObject:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  void (*v14)(void *, uint64_t, uint64_t);
  id v15;
  void (*v16)(void *, uint64_t, uint64_t);
  id v17;
  _BYTE v19[32];
  _QWORD v20[4];

  if (qword_1EDB65038 != -1)
    swift_once();
  v4 = qword_1EDB65028;
  v5 = qword_1EDB65030;
  v20[3] = a2;
  v20[0] = a1;
  v6 = qword_1F03D81D0;
  swift_unknownObjectRetain();
  if (v6 != -1)
    swift_once();
  v7 = (void *)qword_1F03D81D8;
  if (qword_1EDB65358 != -1)
    swift_once();
  v8 = (void *)qword_1EDB65350;
  swift_beginAccess();
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1F03D4830;
  swift_retain();
  v10 = v9(v4, v5, 4096);
  v12 = v11;
  swift_release();
  ObjectType = swift_getObjectType();
  sub_1DD32E218((uint64_t)v20, (uint64_t)v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 24))(v19, ObjectType, v12);
  v14 = *(void (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v15 = v7;
  v14(v7, ObjectType, v12);
  v16 = *(void (**)(void *, uint64_t, uint64_t))(v12 + 72);
  v17 = v8;
  v16(v8, ObjectType, v12);
  sub_1DD310B9C((uint64_t)v20);
  return v10;
}

uint64_t (**sub_1DD33A094())()
{
  return &off_1F03D4830;
}

uint64_t sub_1DD33A0A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for XPCConnection();
  swift_bridgeObjectRetain();
  return XPCConnection.__allocating_init(machServiceName:options:)(a1, a2, a3);
}

uint64_t (*static FamilyControlsService.underlyingConnection.getter())()
{
  uint64_t (*v0)();

  swift_beginAccess();
  v0 = off_1F03D4830;
  swift_retain();
  return v0;
}

uint64_t static FamilyControlsService.underlyingConnection.setter(uint64_t (*a1)(), uint64_t a2)
{
  swift_beginAccess();
  off_1F03D4830 = a1;
  qword_1F03D4838 = a2;
  return swift_release();
}

uint64_t (*static FamilyControlsService.underlyingConnection.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for FamilyControlsService()
{
  return &type metadata for FamilyControlsService;
}

uint64_t sub_1DD33A1F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DD33A208(v1 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_activity, a1);
}

uint64_t sub_1DD33A208(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FamilyActivity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD33A24C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_slotType);
}

uint64_t sub_1DD33A25C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = swift_allocObject();
  v5 = (_QWORD *)(v4 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot____lazy_storage___connection);
  *v5 = 0;
  v5[1] = 0;
  sub_1DD33A318(a1, v4 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_activity);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_slotType) = a2;
  return v4;
}

uint64_t sub_1DD33A2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot____lazy_storage___connection);
  *v4 = 0;
  v4[1] = 0;
  sub_1DD33A318(a1, v2 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_activity);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_slotType) = a2;
  return v2;
}

uint64_t sub_1DD33A318(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FamilyActivity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD33A35C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot____lazy_storage___connection);
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot____lazy_storage___connection))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot____lazy_storage___connection);
  }
  else
  {
    v2 = static FamilyControlsService.connection()();
    v4 = v3;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v4 + 88))(ObjectType, v4);
    *v1 = v2;
    v1[1] = v4;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

id sub_1DD33A3E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  int EnumCaseMultiPayload;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1DD3423D8();
  v44 = *(_QWORD *)(v2 - 8);
  v45 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
  v42 = *(_QWORD *)(v5 - 8);
  v43 = v5;
  MEMORY[0x1E0C80A78](v5);
  v41 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for FamilyActivity(0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC4360]), sel_init);
  v46 = v1;
  v47 = v18;
  sub_1DD33A208(v1 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_activity, (uint64_t)v17);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v17, v7);
      v20 = sub_1DD342360();
      v22 = v24;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v23 = 1;
      goto LABEL_7;
    case 1:
      v25 = v41;
      v26 = v42;
      v27 = v43;
      (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v17, v43);
      v20 = sub_1DD342360();
      v22 = v28;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
      v23 = 2;
      goto LABEL_7;
    case 0:
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v17, v11);
      v20 = sub_1DD342360();
      v22 = v21;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      v23 = 0;
LABEL_7:
      v29 = swift_allocObject();
      swift_weakInit();
      v30 = (_QWORD *)swift_allocObject();
      v30[2] = v29;
      v30[3] = v20;
      v30[4] = v22;
      v30[5] = v23;
      aBlock[4] = sub_1DD33BA94;
      aBlock[5] = v30;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD33AA58;
      aBlock[3] = &block_descriptor_6;
      v31 = _Block_copy(aBlock);
      sub_1DD319BC8(v20, v22);
      swift_release();
      v32 = v47;
      objc_msgSend(v47, sel__setSlotAnyContentProvider_, v31);
      sub_1DD319C20(v20, v22);
      _Block_release(v31);
      return v32;
  }
  v33 = sub_1DD338B48();
  v35 = v44;
  v34 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v4, v33, v45);
  v36 = sub_1DD3423C0();
  v37 = sub_1DD3428AC();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_1DD30C000, v36, v37, "Label is incorrrectly attempting to be intialized", v38, 2u);
    MEMORY[0x1DF0D91B0](v38, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v35 + 8))(v4, v34);
  sub_1DD33A7D0((uint64_t)v17);
  return v47;
}

uint64_t sub_1DD33A7D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FamilyActivity(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1DD33A80C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t Strong;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v29 = a8;
  v12 = sub_1DD3423D8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v17 = Strong;
    v18 = (*(uint64_t (**)(void))(*(_QWORD *)Strong + 152))();
    if (v18)
    {
      v19 = (void *)v18;
      v28 = *(_QWORD *)(v17 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_slotType);
      v20 = (void *)sub_1DD342270();
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = a3;
      *(_QWORD *)(v21 + 24) = a4;
      aBlock[4] = sub_1DD33C3B8;
      aBlock[5] = v21;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD329CC8;
      aBlock[3] = &block_descriptor_36_0;
      v22 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v19, sel_getRemoteContentForActivitySlotWithSlotID_slotStyle_slotType_tokenToPresent_tokenType::, a1, a2, v28, v20, v29, v22);
      swift_release();
      swift_unknownObjectRelease();
      _Block_release(v22);

    }
    else
    {
      swift_release();
    }
  }
  else
  {
    v23 = sub_1DD338B48();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v23, v12);
    v24 = sub_1DD3423C0();
    v25 = sub_1DD3428AC();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1DD30C000, v24, v25, "Label is already or no longer part of the view hierarchy", v26, 2u);
      MEMORY[0x1DF0D91B0](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

void sub_1DD33AA58(uint64_t a1, uint64_t a2, void *a3, void *aBlock)
{
  void (*v6)(uint64_t, id, uint64_t (*)(), uint64_t);
  void *v7;
  uint64_t v8;
  id v9;

  v6 = *(void (**)(uint64_t, id, uint64_t (*)(), uint64_t))(a1 + 32);
  v7 = _Block_copy(aBlock);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  swift_retain();
  v9 = a3;
  v6(a2, v9, sub_1DD33C368, v8);
  swift_release();
  swift_release();

}

id sub_1DD33AAFC(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[6];

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC4360]), sel_init);
  v5 = swift_allocObject();
  swift_weakInit();
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v5;
  v6[3] = a1;
  v6[4] = a2;
  v9[4] = sub_1DD33BABC;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1DD33AA58;
  v9[3] = &block_descriptor_10;
  v7 = _Block_copy(v9);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v4, sel__setSlotAnyContentProvider_, v7);
  _Block_release(v7);
  return v4;
}

void sub_1DD33AC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t Strong;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD aBlock[6];

  v8 = sub_1DD3423D8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v13 = Strong;
    v14 = (*(uint64_t (**)(void))(*(_QWORD *)Strong + 152))();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = (void *)sub_1DD34278C();
      v17 = *(_QWORD *)(v13 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_slotType);
      v18 = swift_allocObject();
      *(_QWORD *)(v18 + 16) = a3;
      *(_QWORD *)(v18 + 24) = a4;
      aBlock[4] = sub_1DD33C32C;
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD329CC8;
      aBlock[3] = &block_descriptor_27;
      v19 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v15, sel_getRemoteContentByBundleIDWithBundleIdentifier_slotID_slotStyle_slotType::, v16, a1, a2, v17, v19);
      swift_release();
      swift_unknownObjectRelease();
      _Block_release(v19);

    }
    else
    {
      swift_release();
    }
  }
  else
  {
    v20 = sub_1DD338B48();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v20, v8);
    v21 = sub_1DD3423C0();
    v22 = sub_1DD3428AC();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1DD30C000, v21, v22, "Label is already or no longer part of the view hierarchy", v23, 2u);
      MEMORY[0x1DF0D91B0](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void sub_1DD33AE50(void *a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = sub_1DD3423D8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v30 - v11;
  if (a1 && (objc_opt_self(), (v13 = swift_dynamicCastObjCClass()) != 0))
  {
    v14 = v13;
    v31 = a1;
    if ((a3(v14) & 1) != 0)
    {

    }
    else
    {
      v25 = sub_1DD338B48();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v25, v6);
      v26 = sub_1DD3423C0();
      v27 = sub_1DD3428AC();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1DD30C000, v26, v27, "Failed to yield remote content", v28, 2u);
        MEMORY[0x1DF0D91B0](v28, -1, -1);
        v29 = v31;
      }
      else
      {
        v29 = v26;
        v26 = v31;
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  else
  {
    v15 = sub_1DD338B48();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v15, v6);
    v16 = a2;
    v17 = a2;
    v18 = sub_1DD3423C0();
    v19 = sub_1DD3428AC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v32 = (uint64_t)a2;
      v33 = v21;
      *(_DWORD *)v20 = 136446210;
      v31 = (v20 + 4);
      v22 = a2;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A70);
      v23 = sub_1DD3427A4();
      v32 = sub_1DD30EE20(v23, v24, &v33);
      sub_1DD342954();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1DD30C000, v18, v19, "Failed to get remote content: %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v21, -1, -1);
      MEMORY[0x1DF0D91B0](v20, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

uint64_t sub_1DD33B168()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD v13[2];
  _BYTE v14[32];
  _QWORD aBlock[6];

  v0 = sub_1DD3423D8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)sub_1DD33A35C();
  aBlock[4] = sub_1DD33B354;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD30ED08;
  aBlock[3] = &block_descriptor_13_1;
  v5 = _Block_copy(aBlock);
  v6 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v5);
  swift_unknownObjectRelease();
  _Block_release(v5);
  sub_1DD34296C();
  swift_unknownObjectRelease();
  sub_1DD30E6DC((uint64_t)aBlock, (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4888);
  if (swift_dynamicCast())
  {
    v7 = v13[1];
    __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
  }
  else
  {
    v8 = sub_1DD338B48();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v8, v0);
    v9 = sub_1DD3423C0();
    v10 = sub_1DD3428AC();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DD30C000, v9, v10, "Failed to get service interface", v11, 2u);
      MEMORY[0x1DF0D91B0](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
    return 0;
  }
  return v7;
}

uint64_t sub_1DD33B354(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;

  v2 = sub_1DD3423D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD338B48();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = a1;
  v9 = sub_1DD3423C0();
  v10 = sub_1DD3428AC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = (uint64_t)a1;
    v19 = v12;
    *(_DWORD *)v11 = 136446210;
    v17[1] = v11 + 4;
    v13 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A00);
    v14 = sub_1DD3427A4();
    v18 = sub_1DD30EE20(v14, v15, &v19);
    sub_1DD342954();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1DD30C000, v9, v10, "Failed to get service proxy: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D91B0](v12, -1, -1);
    MEMORY[0x1DF0D91B0](v11, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1DD33B53C()
{
  uint64_t v0;

  sub_1DD33A7D0(v0 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_activity);
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_1DD33B570()
{
  uint64_t v0;

  sub_1DD33A7D0(v0 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_activity);
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1DD33B5B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DD33A208(v1, a1);
}

uint64_t sub_1DD33B5BC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for FamilyActivitySlot.Representable(0) + 20));
}

uint64_t sub_1DD33B5DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  sub_1DD33A318(a1, a3);
  result = type metadata accessor for FamilyActivitySlot.Representable(0);
  *(_QWORD *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

id sub_1DD33B614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  double v22;
  double v23;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = type metadata accessor for FamilyActivity(0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (_QWORD *)((char *)aBlock - v6);
  sub_1DD33A208(v1, (uint64_t)aBlock - v6);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v9 = *v7;
    v8 = v7[1];
    sub_1DD33A208(v1, (uint64_t)v5);
    v10 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for FamilyActivitySlot.Representable(0) + 20));
    type metadata accessor for FamilyActivitySlot(0);
    v11 = swift_allocObject();
    v12 = (_QWORD *)(v11 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot____lazy_storage___connection);
    *v12 = 0;
    v12[1] = 0;
    sub_1DD33A318((uint64_t)v5, v11 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_activity);
    *(_QWORD *)(v11 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_slotType) = v10;
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC4360]), sel_init);
    v14 = swift_allocObject();
    swift_weakInit();
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = v14;
    v15[3] = v9;
    v15[4] = v8;
    aBlock[4] = sub_1DD33C388;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DD33AA58;
    aBlock[3] = &block_descriptor_21;
    v16 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v13, sel__setSlotAnyContentProvider_, v16);
    _Block_release(v16);
    swift_release();
    swift_bridgeObjectRelease();
    LODWORD(v17) = 1148846080;
    objc_msgSend(v13, sel_setContentHuggingPriority_forAxis_, 0, v17);
    LODWORD(v18) = 1148846080;
    objc_msgSend(v13, sel_setContentHuggingPriority_forAxis_, 1, v18);
  }
  else
  {
    sub_1DD33A208(v1, (uint64_t)v5);
    v19 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for FamilyActivitySlot.Representable(0) + 20));
    type metadata accessor for FamilyActivitySlot(0);
    v20 = swift_allocObject();
    v21 = (_QWORD *)(v20 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot____lazy_storage___connection);
    *v21 = 0;
    v21[1] = 0;
    sub_1DD33A318((uint64_t)v5, v20 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_activity);
    *(_QWORD *)(v20 + OBJC_IVAR____TtC14FamilyControls18FamilyActivitySlot_slotType) = v19;
    v13 = sub_1DD33A3E0();
    swift_release();
    LODWORD(v22) = 1148846080;
    objc_msgSend(v13, sel_setContentHuggingPriority_forAxis_, 0, v22);
    LODWORD(v23) = 1148846080;
    objc_msgSend(v13, sel_setContentHuggingPriority_forAxis_, 1, v23);
    sub_1DD33A7D0((uint64_t)v7);
  }
  return v13;
}

uint64_t sub_1DD33B910()
{
  return sub_1DD342540();
}

uint64_t sub_1DD33B950()
{
  sub_1DD33C2C8(&qword_1F03D49F8, (uint64_t)&unk_1DD345490);
  return sub_1DD3425A0();
}

uint64_t sub_1DD33B9B0()
{
  sub_1DD33C2C8(&qword_1F03D49F8, (uint64_t)&unk_1DD345490);
  return sub_1DD34254C();
}

void sub_1DD33BA10()
{
  sub_1DD33C2C8(&qword_1F03D49F8, (uint64_t)&unk_1DD345490);
  sub_1DD342594();
  __break(1u);
}

uint64_t sub_1DD33BA44()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DD33BA68()
{
  uint64_t v0;

  swift_release();
  sub_1DD319C20(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return swift_deallocObject();
}

void sub_1DD33BA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  sub_1DD33A80C(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5]);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

void sub_1DD33BABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1DD33AC0C(a1, a2, a3, a4);
}

uint64_t type metadata accessor for FamilyActivitySlot.Representable(uint64_t a1)
{
  return sub_1DD31B320(a1, (uint64_t *)&unk_1F03D8300);
}

uint64_t type metadata accessor for FamilyActivitySlot(uint64_t a1)
{
  return sub_1DD31B320(a1, (uint64_t *)&unk_1F03D82F0);
}

uint64_t objectdestroy_6Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DD33BB20()
{
  return sub_1DD33C2C8(&qword_1F03D4890, (uint64_t)&unk_1DD345520);
}

uint64_t sub_1DD33BB44()
{
  return type metadata accessor for FamilyActivitySlot(0);
}

uint64_t sub_1DD33BB4C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for FamilyActivity(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1DD33BBD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    type metadata accessor for FamilyActivity(0);
    v5 = (char *)&loc_1DD33BC2C + 4 * byte_1DD345470[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t sub_1DD33BD40(uint64_t a1)
{
  uint64_t result;
  uint64_t *v3;
  uint64_t v4;

  type metadata accessor for FamilyActivity(0);
  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = &qword_1F03D4880;
      goto LABEL_6;
    case 1:
      v3 = (uint64_t *)&unk_1F03D4870;
      goto LABEL_6;
    case 2:
      v3 = &qword_1F03D4000;
LABEL_6:
      v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
      break;
    case 3:
    case 4:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void sub_1DD33BDE4()
{
  char *v0;

  type metadata accessor for FamilyActivity(0);
  v0 = (char *)sub_1DD33BE34 + 4 * byte_1DD34547A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1DD33BE34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v0, v1, v3);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(v0 + *(int *)(v2 + 20)) = *(_QWORD *)(v1 + *(int *)(v2 + 20));
  return v0;
}

uint64_t sub_1DD33BF28(uint64_t result, uint64_t a2, uint64_t a3)
{
  char *v3;

  if (result != a2)
  {
    sub_1DD33A7D0(result);
    type metadata accessor for FamilyActivity(0);
    v3 = (char *)&loc_1DD33BF88 + 4 * byte_1DD34547F[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  *(_QWORD *)(result + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return result;
}

char *sub_1DD33C08C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_1DD33A7D0((uint64_t)a1);
    v6 = type metadata accessor for FamilyActivity(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4000);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4870);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4880);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

uint64_t sub_1DD33C1C0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD33C1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FamilyActivity(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1DD33C208()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DD33C214(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FamilyActivity(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1DD33C254()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for FamilyActivity(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1DD33C2C8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for FamilyActivitySlot.Representable(255);
    result = MEMORY[0x1DF0D9108](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DD33C308()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DD33C32C(void *a1, void *a2)
{
  uint64_t v2;

  sub_1DD33AE50(a1, a2, *(uint64_t (**)(uint64_t))(v2 + 16));
}

uint64_t sub_1DD33C344()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DD33C368()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t dispatch thunk of Locatable.familyControlsAuthorization.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Locatable.familyControlsInternalAuthorization.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Locatable.familyControlsKeyData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Locatable.familyControlsStore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Locatable.familyControlsPrivateSyncMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of Locatable.familyControlsSharedSyncMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Locatable.familyControlsDataDirectory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of Locatable.familyControlsCacheDirectory.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t FamilyControlsMember.description.getter(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 0x646C696843;
  if (a1 == 1)
    return 0x7564697669646E49;
  result = sub_1DD342B40();
  __break(1u);
  return result;
}

BOOL FamilyControlsMember.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_1DD33C48C()
{
  sub_1DD312D80();
  return sub_1DD342804();
}

uint64_t sub_1DD33C4E8()
{
  sub_1DD312D80();
  return sub_1DD3427F8();
}

uint64_t sub_1DD33C534()
{
  uint64_t *v0;

  return FamilyControlsMember.description.getter(*v0);
}

uint64_t sub_1DD33C53C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t result;
  _BYTE v10[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for AuthorizationCenter();
  v4 = swift_allocObject();
  v5 = v4 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter__authorizationStatus;
  v10[15] = 0;
  sub_1DD3423F0();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v1 + 32))(v5, v3, v0);
  v6 = OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter_authorizationCenterClient;
  type metadata accessor for AuthorizationCenterClient();
  *(_QWORD *)(v4 + v6) = swift_allocObject();
  v7 = (_QWORD *)(v4 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connection);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_QWORD *)(v4 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connectionPrivate);
  *v8 = 0;
  v8[1] = 0;
  result = sub_1DD33CEC4();
  qword_1F03D8318 = v4;
  return result;
}

uint64_t sub_1DD33C644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _BYTE v10[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = swift_allocObject();
  v5 = v4 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter__authorizationStatus;
  v10[15] = 0;
  sub_1DD3423F0();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v1 + 32))(v5, v3, v0);
  v6 = OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter_authorizationCenterClient;
  type metadata accessor for AuthorizationCenterClient();
  *(_QWORD *)(v4 + v6) = swift_allocObject();
  v7 = (_QWORD *)(v4 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connection);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_QWORD *)(v4 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connectionPrivate);
  *v8 = 0;
  v8[1] = 0;
  sub_1DD33CEC4();
  return v4;
}

uint64_t *sub_1DD33C740()
{
  if (qword_1F03D8310 != -1)
    swift_once();
  return &qword_1F03D8318;
}

uint64_t static AuthorizationCenter.shared.getter()
{
  if (qword_1F03D8310 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_1DD33C7C0()
{
  return sub_1DD3423F0();
}

_QWORD *sub_1DD33C7F0@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 112))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1DD33C830(char *a1, uint64_t *a2)
{
  uint64_t v2;
  char v4;

  v2 = *a2;
  v4 = *a1;
  return (*(uint64_t (**)(char *))(*(_QWORD *)v2 + 120))(&v4);
}

uint64_t sub_1DD33C86C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DD342420();
  swift_release();
  return swift_release();
}

uint64_t sub_1DD33C8D0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1DD34242C();
}

void (*sub_1DD33C93C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1DD342414();
  return sub_1DD33C9B4;
}

void sub_1DD33C9B4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_1DD33CA00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 144))(v6);
}

uint64_t sub_1DD33CA8C()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE0);
  sub_1DD3423FC();
  return swift_endAccess();
}

uint64_t sub_1DD33CAEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE0);
  sub_1DD342408();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1DD33CBC0(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter__authorizationStatus;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE0);
  sub_1DD3423FC();
  swift_endAccess();
  return sub_1DD33CC88;
}

void sub_1DD33CC88(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1DD342408();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_1DD342408();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_1DD33CDA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _BYTE v10[16];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter__authorizationStatus;
  v10[15] = 0;
  sub_1DD3423F0();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v2 + 32))(v5, v4, v1);
  v6 = OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter_authorizationCenterClient;
  type metadata accessor for AuthorizationCenterClient();
  *(_QWORD *)(v0 + v6) = swift_allocObject();
  v7 = (_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connection);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connectionPrivate);
  *v8 = 0;
  v8[1] = 0;
  sub_1DD33CEC4();
  return v0;
}

uint64_t type metadata accessor for AuthorizationCenterClient()
{
  return objc_opt_self();
}

uint64_t sub_1DD33CEA8()
{
  type metadata accessor for AuthorizationCenterClient();
  return swift_allocObject();
}

uint64_t sub_1DD33CEC4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t result;
  void *v7;
  uint64_t aBlock;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BYTE v14[32];

  v1 = (void *)sub_1DD33E51C();
  v12 = sub_1DD33D08C;
  v13 = 0;
  v2 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v9 = 1107296256;
  v10 = sub_1DD30ED08;
  v11 = &block_descriptor_114;
  v3 = _Block_copy(&aBlock);
  v4 = objc_msgSend(v1, sel_synchronousRemoteObjectProxyWithErrorHandler_, v3);
  swift_unknownObjectRelease();
  _Block_release(v3);
  sub_1DD34296C();
  swift_unknownObjectRelease();
  sub_1DD30E6DC((uint64_t)v14, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4888);
  if (swift_dynamicCast())
  {
    v12 = sub_1DD3418B4;
    v13 = v0;
    aBlock = v2;
    v9 = 1107296256;
    v10 = sub_1DD329CC8;
    v11 = &block_descriptor_117;
    v5 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_getAuthorizationStatus_, v5);
    _Block_release(v5);
    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  else
  {
    result = sub_1DD342A2C();
    __break(1u);
  }
  return result;
}

uint64_t sub_1DD33D08C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;

  v2 = sub_1DD3423D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD338E84();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = a1;
  v9 = sub_1DD3423C0();
  v10 = sub_1DD3428AC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = (uint64_t)a1;
    v19 = v12;
    *(_DWORD *)v11 = 136446210;
    v17[1] = v11 + 4;
    v13 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A00);
    v14 = sub_1DD3427A4();
    v18 = sub_1DD30EE20(v14, v15, &v19);
    sub_1DD342954();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1DD30C000, v9, v10, "Failed to get service proxy: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D91B0](v12, -1, -1);
    MEMORY[0x1DF0D91B0](v11, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_1DD33D274(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t aBlock[6];
  uint64_t v35;

  v6 = sub_1DD342720();
  v33 = *(uint8_t **)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_1DD342738();
  v9 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DD3423D8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v16 = a1;
    AuthorizationStatus.init(rawValue:)((Swift::Int)objc_msgSend(v16, sel_integerValue));
    v17 = aBlock[0];
    if (LOBYTE(aBlock[0]) == 3)
    {

    }
    else
    {
      sub_1DD32AC08(0, (unint64_t *)&qword_1EDB64FD8);
      v28 = (void *)sub_1DD342900();
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = a3;
      *(_BYTE *)(v29 + 24) = v17;
      aBlock[4] = (uint64_t)sub_1DD341738;
      aBlock[5] = v29;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1DD3143AC;
      aBlock[3] = (uint64_t)&block_descriptor_123;
      v30 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_1DD34272C();
      aBlock[0] = MEMORY[0x1E0DEE9D8];
      sub_1DD34173C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FA8);
      sub_1DD341784();
      sub_1DD342978();
      MEMORY[0x1DF0D89F4](0, v11, v8, v30);

      _Block_release(v30);
      (*((void (**)(char *, uint64_t))v33 + 1))(v8, v6);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v32);
    }
  }
  else
  {
    v18 = sub_1DD338E84();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v18, v12);
    v19 = a2;
    v20 = a2;
    v21 = sub_1DD3423C0();
    v22 = sub_1DD3428AC();
    if (os_log_type_enabled(v21, (os_log_type_t)v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      *(_DWORD *)v23 = 136446210;
      v33 = v23 + 4;
      aBlock[0] = v24;
      v35 = (uint64_t)a2;
      v25 = a2;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A70);
      v26 = sub_1DD3427A4();
      v35 = sub_1DD30EE20(v26, v27, aBlock);
      sub_1DD342954();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1DD30C000, v21, (os_log_type_t)v22, "Failed to fetch authorization status: %{public}s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v24, -1, -1);
      MEMORY[0x1DF0D91B0](v23, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

uint64_t sub_1DD33D640(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AF0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD342840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  swift_retain();
  swift_retain();
  sub_1DD33D988((uint64_t)v7, (uint64_t)&unk_1F03D4B00, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_1DD33D71C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD);

  v6[2] = a5;
  v6[3] = a6;
  v9 = (uint64_t (*)(_QWORD))(**(int **)(*(_QWORD *)a4 + 184) + *(_QWORD *)(*(_QWORD *)a4 + 184));
  v7 = (_QWORD *)swift_task_alloc();
  v6[4] = v7;
  *v7 = v6;
  v7[1] = sub_1DD33D780;
  return v9(0);
}

uint64_t sub_1DD33D780()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DD33D7E4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 16))(0, 0);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD33D81C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(void *, uint64_t);
  id v3;

  v1 = *(void **)(v0 + 40);
  v2 = *(void (**)(void *, uint64_t))(v0 + 16);
  v3 = v1;
  v2(v1, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD33D878()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD33D8AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;
  uint64_t (*v7)(_QWORD);

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_1DD33D940;
  *(_OWORD *)(v3 + 16) = v4;
  v7 = (uint64_t (*)(_QWORD))(**(int **)(*(_QWORD *)v2 + 184) + *(_QWORD *)(*(_QWORD *)v2 + 184));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 32) = v5;
  *v5 = v3;
  v5[1] = sub_1DD33D780;
  return v7(0);
}

uint64_t sub_1DD33D940()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DD33D988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DD342840();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DD342834();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DD31A090(a1, &qword_1F03D4AF0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DD342828();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DD33DAD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = v1;
  return swift_task_switch();
}

uint64_t sub_1DD33DAEC()
{
  uint64_t v0;
  _BYTE *v2;

  if ((static Feature.isAuthorizationEnabled.getter() & 1) != 0)
    return swift_task_switch();
  sub_1DD311000();
  swift_allocError();
  *v2 = 0;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD33DB74()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  _QWORD *v7;

  v2 = v0[10];
  v1 = v0[11];
  v0[2] = v0;
  v0[3] = sub_1DD33DC44;
  v3 = swift_continuation_init();
  sub_1DD33E51C();
  v5 = v4;
  ObjectType = swift_getObjectType();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v2;
  v7[3] = v1;
  v7[4] = v3;
  swift_retain();
  XPCConnectable.remoteObjectProxy(retryCount:proxyHandler:)(1, (void (*)(_BYTE *))sub_1DD33E5DC, (uint64_t)v7, ObjectType, v5);
  swift_unknownObjectRelease();
  swift_release();
  return swift_continuation_await();
}

uint64_t sub_1DD33DC44()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 48))
    swift_willThrow();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_1DD33DC98(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  id v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t *v33;
  _QWORD *v34;
  id v35[2];
  _QWORD aBlock[6];

  v8 = sub_1DD342720();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DD342738();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v35[1] = a4;
    v35[0] = a1;
    AuthorizationStatus.init(rawValue:)((Swift::Int)objc_msgSend(v35[0], sel_integerValue));
    v16 = aBlock[0];
    if (LOBYTE(aBlock[0]) != 3)
    {
      sub_1DD32AC08(0, (unint64_t *)&qword_1EDB64FD8);
      v17 = (void *)sub_1DD342900();
      v18 = swift_allocObject();
      *(_QWORD *)(v18 + 16) = a3;
      *(_BYTE *)(v18 + 24) = v16;
      aBlock[4] = sub_1DD341738;
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD3143AC;
      aBlock[3] = &block_descriptor_105;
      v19 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_1DD34272C();
      aBlock[0] = MEMORY[0x1E0DEE9D8];
      sub_1DD34173C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FA8);
      sub_1DD341784();
      sub_1DD342978();
      MEMORY[0x1DF0D89F4](0, v15, v11, v19);
      _Block_release(v19);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      swift_continuation_throwingResume();

      return;
    }
    goto LABEL_15;
  }
  if (a2)
  {
    v20 = a2;
    v21 = a2;
    v22 = (void *)sub_1DD3421E0();
    v23 = objc_msgSend(v22, sel_domain);
    v24 = sub_1DD342798();
    v26 = v25;

    sub_1DD3112AC();
    if (v24 == sub_1DD3420D8() && v26 == v27)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v28 = sub_1DD342B34();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A00);
        swift_allocError();
        *v34 = a2;
        swift_continuation_throwingResumeWithError();
LABEL_14:

        return;
      }
    }
    FamilyControlsError.init(rawValue:)((Swift::Int)objc_msgSend(v22, sel_code));
    v29 = aBlock[0];
    if (LOBYTE(aBlock[0]) == 8)
    {
      v30 = a2;
      v31 = (uint64_t)a2;
    }
    else
    {
      sub_1DD311000();
      v31 = swift_allocError();
      *v32 = v29;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A00);
    swift_allocError();
    *v33 = v31;
    swift_continuation_throwingResumeWithError();

    goto LABEL_14;
  }
LABEL_15:
  sub_1DD342A2C();
  __break(1u);
}

void sub_1DD33E108(void *a1, void *a2, void (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[2];
  void (*v24)(_QWORD, _QWORD);
  uint64_t v25;
  _QWORD aBlock[6];

  v5 = v4;
  v10 = sub_1DD342720();
  v25 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DD342738();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v23[1] = a4;
    v24 = a3;
    v17 = a1;
    AuthorizationStatus.init(rawValue:)((Swift::Int)objc_msgSend(v17, sel_integerValue));
    v18 = aBlock[0];
    if (LOBYTE(aBlock[0]) != 3)
    {
      sub_1DD32AC08(0, (unint64_t *)&qword_1EDB64FD8);
      v19 = (void *)sub_1DD342900();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = v5;
      *(_BYTE *)(v20 + 24) = v18;
      aBlock[4] = sub_1DD341738;
      aBlock[5] = v20;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD3143AC;
      aBlock[3] = &block_descriptor_92;
      v21 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_1DD34272C();
      aBlock[0] = MEMORY[0x1E0DEE9D8];
      sub_1DD34173C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB64FA8);
      sub_1DD341784();
      sub_1DD342978();
      MEMORY[0x1DF0D89F4](0, v16, v12, v21);
      _Block_release(v21);

      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      v24(0, 0);

      return;
    }
  }
  else if (a2)
  {
    v22 = a2;
    a3(a2, 1);

    return;
  }
  sub_1DD342A2C();
  __break(1u);
}

void sub_1DD33E420(void (*a1)(void *, uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  _QWORD *v8;
  void *v9;
  _BYTE *v10;

  if ((static Feature.isAuthorizationEnabled.getter() & 1) != 0)
  {
    sub_1DD33E51C();
    v6 = v5;
    ObjectType = swift_getObjectType();
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = v2;
    v8[3] = a1;
    v8[4] = a2;
    swift_retain();
    swift_retain();
    XPCConnectable.remoteObjectProxy(retryCount:proxyHandler:)(1, (void (*)(_BYTE *))sub_1DD33E8D0, (uint64_t)v8, ObjectType, v6);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1DD311000();
    v9 = (void *)swift_allocError();
    *v10 = 0;
    a1(v9, 1);

  }
}

uint64_t sub_1DD33E51C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connection);
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connection))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connection);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter_authorizationCenterClient);
    v4 = type metadata accessor for AuthorizationCenterClient();
    v2 = static FamilyControlsService.connection<A>(exportedObject:)(v3, v4);
    v6 = v5;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v6 + 88))(ObjectType, v6);
    *v1 = v2;
    v1[1] = v6;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t sub_1DD33E5B8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DD33E5DC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t *v21;
  _QWORD aBlock[7];
  _OWORD v23[2];
  _OWORD v24[2];
  char v25;

  v3 = v1[2];
  v2 = v1[3];
  v4 = v1[4];
  sub_1DD3414EC(a1, (uint64_t)v24);
  if ((v25 & 1) != 0)
  {
    v5 = *(void **)&v24[0];
    v6 = (void *)sub_1DD3421E0();
    v7 = objc_msgSend(v6, sel_domain);
    v8 = sub_1DD342798();
    v10 = v9;

    sub_1DD3112AC();
    if (v8 == sub_1DD3420D8() && v10 == v11)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v13 = sub_1DD342B34();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A00);
        swift_allocError();
        *v14 = v5;
        swift_continuation_throwingResumeWithError();
LABEL_15:

        return;
      }
    }
    FamilyControlsError.init(rawValue:)((Swift::Int)objc_msgSend(v6, sel_code));
    if (LOBYTE(aBlock[0]) == 8)
    {
      v18 = v5;
      v19 = (uint64_t)v5;
    }
    else
    {
      sub_1DD311000();
      v19 = swift_allocError();
      *v20 = aBlock[0];
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A00);
    swift_allocError();
    *v21 = v19;
    swift_continuation_throwingResumeWithError();

    goto LABEL_15;
  }
  sub_1DD310BDC(v24, v23);
  sub_1DD30E6DC((uint64_t)v23, (uint64_t)aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4888);
  if (swift_dynamicCast())
  {
    v15 = (void *)aBlock[6];
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v2;
    *(_QWORD *)(v16 + 24) = v4;
    aBlock[4] = sub_1DD3417F4;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DD329CC8;
    aBlock[3] = &block_descriptor_98;
    v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_requestAuthorizationFor::, v3, v17);
    _Block_release(v17);
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  }
  else
  {
    sub_1DD342A2C();
    __break(1u);
  }
}

void sub_1DD33E8D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void (*v3)(void *, uint64_t);
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _BYTE *v21;
  _QWORD aBlock[7];
  _OWORD v23[2];
  _OWORD v24[2];
  char v25;

  v2 = v1[2];
  v3 = (void (*)(void *, uint64_t))v1[3];
  v4 = v1[4];
  sub_1DD3414EC(a1, (uint64_t)v24);
  if ((v25 & 1) != 0)
  {
    v5 = *(void **)&v24[0];
    v6 = (void *)sub_1DD3421E0();
    v7 = objc_msgSend(v6, sel_domain);
    v8 = sub_1DD342798();
    v10 = v9;

    sub_1DD3112AC();
    if (v8 == sub_1DD3420D8() && v10 == v11)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v13 = sub_1DD342B34();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
        v14 = v5;
        v3(v5, 1);

        v15 = v5;
LABEL_15:

        return;
      }
    }
    FamilyControlsError.init(rawValue:)((Swift::Int)objc_msgSend(v6, sel_code));
    if (LOBYTE(aBlock[0]) == 8)
    {
      v19 = v5;
      v20 = (uint64_t)v5;
    }
    else
    {
      sub_1DD311000();
      v20 = swift_allocError();
      *v21 = aBlock[0];
    }
    v3((void *)v20, 1);

    v15 = (void *)v20;
    goto LABEL_15;
  }
  sub_1DD310BDC(v24, v23);
  sub_1DD30E6DC((uint64_t)v23, (uint64_t)aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4888);
  if (swift_dynamicCast())
  {
    v16 = (void *)aBlock[6];
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = v2;
    v17[3] = v3;
    v17[4] = v4;
    aBlock[4] = sub_1DD341710;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DD329CC8;
    aBlock[3] = &block_descriptor_86;
    v18 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_revokeAuthorization_, v18);
    _Block_release(v18);
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  }
  else
  {
    sub_1DD342A2C();
    __break(1u);
  }
}

uint64_t sub_1DD33EBA8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connectionPrivate);
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connectionPrivate))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter____lazy_storage___connectionPrivate);
  }
  else
  {
    v3 = type metadata accessor for AuthorizationCenter();
    v2 = static FamilyControlsService.connectionPrivate<A>(exportedObject:)(v0, v3);
    v5 = v4;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 88))(ObjectType, v5);
    *v1 = v2;
    v1[1] = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t AuthorizationCenter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter__authorizationStatus;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t AuthorizationCenter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC14FamilyControls19AuthorizationCenter__authorizationStatus;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4AE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1DD33ED34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AuthorizationCenter();
  result = sub_1DD3423E4();
  *a1 = result;
  return result;
}

uint64_t AuthorizationCenter.isFamilyControlsAuthorized.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _BYTE v17[24];
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  v1 = type metadata accessor for AuthorizationRecord();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v17[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = MEMORY[0x1E0DEE9D8];
  if ((static Feature.isAuthorizationEnabled.getter() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    sub_1DD33EBA8();
    v8 = v7;
    ObjectType = swift_getObjectType();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v0;
    *(_QWORD *)(v10 + 24) = v6;
    swift_retain();
    swift_retain();
    XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)(1, (void (*)(_QWORD *))sub_1DD33F3EC, v10, ObjectType, v8);
    swift_unknownObjectRelease();
    swift_release();
    swift_beginAccess();
    v5 = *(_QWORD *)(v6 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  v11 = *(_QWORD *)(v5 + 16);
  if (v11)
  {
    v12 = *(int *)(v1 + 28);
    v13 = v5 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v14 = *(_QWORD *)(v2 + 72);
    while (1)
    {
      sub_1DD311AC4(v13, (uint64_t)v4);
      v15 = v4[v12];
      sub_1DD311B08((uint64_t)v4);
      v21 = v15;
      v20 = 2;
      sub_1DD312D3C();
      sub_1DD3427EC();
      sub_1DD3427EC();
      if (v19 == v18)
        break;
      v13 += v14;
      if (!--v11)
        goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t AuthorizationCenter.authorizationRecords.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;

  v1 = MEMORY[0x1E0DEE9D8];
  if ((static Feature.isAuthorizationEnabled.getter() & 1) != 0)
  {
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v1;
    sub_1DD33EBA8();
    v4 = v3;
    ObjectType = swift_getObjectType();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v0;
    *(_QWORD *)(v6 + 24) = v2;
    swift_retain();
    swift_retain();
    XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)(1, (void (*)(_QWORD *))sub_1DD341970, v6, ObjectType, v4);
    swift_unknownObjectRelease();
    swift_release();
    swift_beginAccess();
    v1 = *(_QWORD *)(v2 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  return v1;
}

uint64_t sub_1DD33F064()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DD33F088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t result;
  uint8_t *v24;
  uint64_t aBlock[7];
  _OWORD v26[2];
  _OWORD v27[2];
  char v28;

  v6 = sub_1DD3423D8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD3414EC(a1, (uint64_t)v27);
  if ((v28 & 1) != 0)
  {
    v10 = *(void **)&v27[0];
    v11 = sub_1DD338E84();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
    v12 = v10;
    v13 = v10;
    v14 = sub_1DD3423C0();
    v15 = sub_1DD3428AC();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      *(_DWORD *)v16 = 136446210;
      v24 = v16 + 4;
      aBlock[0] = v17;
      swift_getErrorValue();
      v18 = sub_1DD342B7C();
      *(_QWORD *)&v26[0] = sub_1DD30EE20(v18, v19, aBlock);
      sub_1DD342954();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1DD30C000, v14, v15, "%{public}s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v17, -1, -1);
      MEMORY[0x1DF0D91B0](v16, -1, -1);

    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    sub_1DD310BDC(v27, v26);
    sub_1DD30E6DC((uint64_t)v26, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D08);
    if (swift_dynamicCast())
    {
      v20 = (void *)aBlock[6];
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = a2;
      *(_QWORD *)(v21 + 24) = a3;
      aBlock[4] = (uint64_t)sub_1DD3415F0;
      aBlock[5] = v21;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1DD33F3F8;
      aBlock[3] = (uint64_t)&block_descriptor_80;
      v22 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v20, sel_authorizationRecordsWithReplyHandler_, v22);
      _Block_release(v22);
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
    }
    else
    {
      result = sub_1DD342A2C();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1DD33F3EC(uint64_t a1)
{
  uint64_t v1;

  return sub_1DD33F088(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1DD33F3F8(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_1DD34281C();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void AuthorizationCenter.requestAuthorization(recordIdentifier:completionHandler:)(uint64_t a1, void (*a2)(void *, uint64_t), void (*a3)(void *, uint64_t))
{
  sub_1DD33F990(a1, a2, a3, (uint64_t)&unk_1EA71D990, (void (*)(_BYTE *))sub_1DD33F490);
}

void sub_1DD33F490(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD aBlock[7];
  _OWORD v16[2];
  _OWORD v17[2];
  char v18;

  v3 = sub_1DD3422D0();
  v4 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v1 + v4);
  v8 = *(void (**)(void *, uint64_t))(v1 + v5);
  v7 = *(_QWORD *)(v1 + v5 + 8);
  sub_1DD3414EC(a1, (uint64_t)v17);
  if ((v18 & 1) != 0)
  {
    v9 = *(void **)&v17[0];
    v10 = *(id *)&v17[0];
    v8(v9, 1);

  }
  else
  {
    sub_1DD310BDC(v17, v16);
    sub_1DD30E6DC((uint64_t)v16, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D08);
    if (swift_dynamicCast())
    {
      v11 = (void *)aBlock[6];
      v12 = (void *)sub_1DD3422A0();
      v13 = (_QWORD *)swift_allocObject();
      v13[2] = v6;
      v13[3] = v8;
      v13[4] = v7;
      aBlock[4] = sub_1DD341538;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD32E164;
      aBlock[3] = &block_descriptor_74;
      v14 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_requestAuthorizationWithRecordIdentifier_replyHandler_, v12, v14);
      _Block_release(v14);

      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    }
    else
    {
      sub_1DD342A2C();
      __break(1u);
    }
  }
}

void AuthorizationCenter.requestInternalAuthorization(for:completionHandler:)(uint64_t a1, void (*a2)(void *, uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  _QWORD *v10;
  void *v11;
  _BYTE *v12;

  if ((static Feature.isAuthorizationEnabled.getter() & 1) != 0)
  {
    sub_1DD33EBA8();
    v8 = v7;
    ObjectType = swift_getObjectType();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = a1;
    v10[3] = v3;
    v10[4] = a2;
    v10[5] = a3;
    swift_retain();
    swift_retain();
    XPCConnectable.remoteObjectProxy(retryCount:proxyHandler:)(1, (void (*)(_BYTE *))sub_1DD33F7C4, (uint64_t)v10, ObjectType, v8);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_1DD311000();
    v11 = (void *)swift_allocError();
    *v12 = 0;
    a2(v11, 1);

  }
}

uint64_t sub_1DD33F798()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1DD33F7C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void *, uint64_t);
  void *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD aBlock[7];
  _OWORD v12[2];
  _OWORD v13[2];
  char v14;

  v2 = v1[2];
  v3 = v1[3];
  v5 = (void (*)(void *, uint64_t))v1[4];
  v4 = v1[5];
  sub_1DD3414EC(a1, (uint64_t)v13);
  if ((v14 & 1) != 0)
  {
    v6 = *(void **)&v13[0];
    v7 = *(id *)&v13[0];
    v5(v6, 1);

  }
  else
  {
    sub_1DD310BDC(v13, v12);
    sub_1DD30E6DC((uint64_t)v12, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D08);
    if (swift_dynamicCast())
    {
      v8 = (void *)aBlock[6];
      v9 = (_QWORD *)swift_allocObject();
      v9[2] = v3;
      v9[3] = v5;
      v9[4] = v4;
      aBlock[4] = sub_1DD341538;
      aBlock[5] = v9;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD32E164;
      aBlock[3] = &block_descriptor_68;
      v10 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v8, sel_requestInternalAuthorizationForMember_replyHandler_, v2, v10);
      _Block_release(v10);
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
    }
    else
    {
      sub_1DD342A2C();
      __break(1u);
    }
  }
}

void AuthorizationCenter.resetAuthorization(recordIdentifier:completionHandler:)(uint64_t a1, void (*a2)(void *, uint64_t), void (*a3)(void *, uint64_t))
{
  sub_1DD33F990(a1, a2, a3, (uint64_t)&unk_1EA71D9E0, (void (*)(_BYTE *))sub_1DD33FB30);
}

void sub_1DD33F990(uint64_t a1, void (*a2)(void *, uint64_t), void (*a3)(void *, uint64_t), uint64_t a4, void (*a5)(_BYTE *))
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (**v18)(void *, uint64_t);
  void *v19;
  _BYTE *v20;
  void (*v21)(_BYTE *);
  uint64_t ObjectType;
  uint64_t v23;
  uint64_t v24;

  v10 = sub_1DD3422D0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((static Feature.isAuthorizationEnabled.getter() & 1) != 0)
  {
    v23 = sub_1DD33EBA8();
    v24 = v14;
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
    v15 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v16 = (v12 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
    v21 = a5;
    v17 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v17 + v15, v13, v10);
    *(_QWORD *)(v17 + v16) = v5;
    v18 = (void (**)(void *, uint64_t))(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8));
    *v18 = a2;
    v18[1] = a3;
    swift_retain();
    swift_retain();
    XPCConnectable.remoteObjectProxy(retryCount:proxyHandler:)(1, v21, v17, ObjectType, v24);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1DD311000();
    v19 = (void *)swift_allocError();
    *v20 = 0;
    a2(v19, 1);

  }
}

void sub_1DD33FB30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD aBlock[7];
  _OWORD v16[2];
  _OWORD v17[2];
  char v18;

  v3 = sub_1DD3422D0();
  v4 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v1 + v4);
  v8 = *(void (**)(void *, uint64_t))(v1 + v5);
  v7 = *(_QWORD *)(v1 + v5 + 8);
  sub_1DD3414EC(a1, (uint64_t)v17);
  if ((v18 & 1) != 0)
  {
    v9 = *(void **)&v17[0];
    v10 = *(id *)&v17[0];
    v8(v9, 1);

  }
  else
  {
    sub_1DD310BDC(v17, v16);
    sub_1DD30E6DC((uint64_t)v16, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D08);
    if (swift_dynamicCast())
    {
      v11 = (void *)aBlock[6];
      v12 = (void *)sub_1DD3422A0();
      v13 = (_QWORD *)swift_allocObject();
      v13[2] = v6;
      v13[3] = v8;
      v13[4] = v7;
      aBlock[4] = sub_1DD341538;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD32E164;
      aBlock[3] = &block_descriptor_62;
      v14 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_resetAuthorizationWithRecordIdentifier_replyHandler_, v12, v14);
      _Block_release(v14);

      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    }
    else
    {
      sub_1DD342A2C();
      __break(1u);
    }
  }
}

void AuthorizationCenter.revokeAuthorization(recordIdentifier:completionHandler:)(uint64_t a1, void (*a2)(void *, uint64_t), void (*a3)(void *, uint64_t))
{
  sub_1DD33F990(a1, a2, a3, (uint64_t)&unk_1EA71DA08, (void (*)(_BYTE *))sub_1DD33FD50);
}

void sub_1DD33FD50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD aBlock[7];
  _OWORD v16[2];
  _OWORD v17[2];
  char v18;

  v3 = sub_1DD3422D0();
  v4 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v1 + v4);
  v8 = *(void (**)(void *, uint64_t))(v1 + v5);
  v7 = *(_QWORD *)(v1 + v5 + 8);
  sub_1DD3414EC(a1, (uint64_t)v17);
  if ((v18 & 1) != 0)
  {
    v9 = *(void **)&v17[0];
    v10 = *(id *)&v17[0];
    v8(v9, 1);

  }
  else
  {
    sub_1DD310BDC(v17, v16);
    sub_1DD30E6DC((uint64_t)v16, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D08);
    if (swift_dynamicCast())
    {
      v11 = (void *)aBlock[6];
      v12 = (void *)sub_1DD3422A0();
      v13 = (_QWORD *)swift_allocObject();
      v13[2] = v6;
      v13[3] = v8;
      v13[4] = v7;
      aBlock[4] = sub_1DD341538;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD32E164;
      aBlock[3] = &block_descriptor_56;
      v14 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_revokeAuthorizationWithRecordIdentifier_replyHandler_, v12, v14);
      _Block_release(v14);

      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    }
    else
    {
      sub_1DD342A2C();
      __break(1u);
    }
  }
}

void AuthorizationCenter.revokeAuthorizationForDeletion(recordIdentifier:completionHandler:)(uint64_t a1, void (*a2)(void *, uint64_t), void (*a3)(void *, uint64_t))
{
  sub_1DD33F990(a1, a2, a3, (uint64_t)&unk_1EA71DA30, (void (*)(_BYTE *))sub_1DD340000);
}

uint64_t objectdestroy_23Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1DD3422D0();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1DD340000(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD aBlock[7];
  _OWORD v16[2];
  _OWORD v17[2];
  char v18;

  v3 = sub_1DD3422D0();
  v4 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v1 + v4);
  v8 = *(void (**)(void *, uint64_t))(v1 + v5);
  v7 = *(_QWORD *)(v1 + v5 + 8);
  sub_1DD3414EC(a1, (uint64_t)v17);
  if ((v18 & 1) != 0)
  {
    v9 = *(void **)&v17[0];
    v10 = *(id *)&v17[0];
    v8(v9, 1);

  }
  else
  {
    sub_1DD310BDC(v17, v16);
    sub_1DD30E6DC((uint64_t)v16, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D08);
    if (swift_dynamicCast())
    {
      v11 = (void *)aBlock[6];
      v12 = (void *)sub_1DD3422A0();
      v13 = (_QWORD *)swift_allocObject();
      v13[2] = v6;
      v13[3] = v8;
      v13[4] = v7;
      aBlock[4] = sub_1DD341538;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD32E164;
      aBlock[3] = &block_descriptor_50;
      v14 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_revokeAuthorizationForDeletionWithRecordIdentifier_replyHandler_, v12, v14);
      _Block_release(v14);

      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    }
    else
    {
      sub_1DD342A2C();
      __break(1u);
    }
  }
}

void AuthorizationCenter.revokeInternalAuthorization(completionHandler:)(void (*a1)(void *, uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  _QWORD *v8;
  void *v9;
  _BYTE *v10;

  if ((static Feature.isAuthorizationEnabled.getter() & 1) != 0)
  {
    sub_1DD33EBA8();
    v6 = v5;
    ObjectType = swift_getObjectType();
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = v2;
    v8[3] = a1;
    v8[4] = a2;
    swift_retain();
    swift_retain();
    XPCConnectable.remoteObjectProxy(retryCount:proxyHandler:)(1, (void (*)(_BYTE *))sub_1DD340308, (uint64_t)v8, ObjectType, v6);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_1DD311000();
    v9 = (void *)swift_allocError();
    *v10 = 0;
    a1(v9, 1);

  }
}

void sub_1DD340308(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void (*v3)(void *, uint64_t);
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD aBlock[7];
  _OWORD v11[2];
  _OWORD v12[2];
  char v13;

  v2 = v1[2];
  v3 = (void (*)(void *, uint64_t))v1[3];
  v4 = v1[4];
  sub_1DD3414EC(a1, (uint64_t)v12);
  if ((v13 & 1) != 0)
  {
    v5 = *(void **)&v12[0];
    v6 = *(id *)&v12[0];
    v3(v5, 1);

  }
  else
  {
    sub_1DD310BDC(v12, v11);
    sub_1DD30E6DC((uint64_t)v11, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D08);
    if (swift_dynamicCast())
    {
      v7 = (void *)aBlock[6];
      v8 = (_QWORD *)swift_allocObject();
      v8[2] = v2;
      v8[3] = v3;
      v8[4] = v4;
      aBlock[4] = sub_1DD341538;
      aBlock[5] = v8;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DD32E164;
      aBlock[3] = &block_descriptor_7;
      v9 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v7, sel_revokeInternalAuthorizationWithReplyHandler_, v9);
      _Block_release(v9);
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    }
    else
    {
      sub_1DD342A2C();
      __break(1u);
    }
  }
}

unint64_t sub_1DD3404C0()
{
  unint64_t result;

  result = qword_1F03D4B10;
  if (!qword_1F03D4B10)
  {
    result = MEMORY[0x1DF0D9108](&protocol conformance descriptor for FamilyControlsMember, &type metadata for FamilyControlsMember);
    atomic_store(result, (unint64_t *)&qword_1F03D4B10);
  }
  return result;
}

uint64_t sub_1DD340504()
{
  return MEMORY[0x1E0C96020];
}

ValueMetadata *type metadata accessor for FamilyControlsMember()
{
  return &type metadata for FamilyControlsMember;
}

uint64_t sub_1DD340520()
{
  return type metadata accessor for AuthorizationCenter();
}

uint64_t type metadata accessor for AuthorizationCenter()
{
  uint64_t result;

  result = qword_1F03D86D0;
  if (!qword_1F03D86D0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1DD340564()
{
  unint64_t v0;

  sub_1DD340688();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AuthorizationCenter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AuthorizationCenter.authorizationStatus.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of AuthorizationCenter.$authorizationStatus.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of AuthorizationCenter.requestAuthorization(completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AuthorizationCenter.requestAuthorization(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 184) + *(_QWORD *)(*(_QWORD *)v1 + 184));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DD33D940;
  return v6(a1);
}

uint64_t dispatch thunk of AuthorizationCenter.revokeAuthorization(completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

void sub_1DD340688()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F03D4B48[0])
  {
    v0 = sub_1DD342438();
    if (!v1)
      atomic_store(v0, qword_1F03D4B48);
  }
}

uint64_t sub_1DD340724()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1DD340734(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DD340798;
  return v6(a1);
}

uint64_t sub_1DD340798()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DD3407E4(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D28);
  v10 = *(_QWORD *)(type metadata accessor for AuthorizationRecord() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1DD342A20();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for AuthorizationRecord() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1DD3409EC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1DD3409EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for AuthorizationRecord() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_1DD342A68();
  __break(1u);
  return result;
}

uint64_t sub_1DD340B04(uint64_t a1, void *a2, unint64_t *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t result;
  _QWORD v42[2];
  unint64_t *v43;
  uint64_t v44;
  __int128 v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v6 = sub_1DD3423D8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D10);
  v12 = MEMORY[0x1E0C80A78](v11);
  v46 = (_QWORD *)((char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v42 - v14;
  v16 = type metadata accessor for AuthorizationRecord();
  v53 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x1E0C80A78](v16);
  v52 = (uint64_t)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v47 = (uint64_t)v42 - v19;
  if (a1)
  {
    v20 = *(_QWORD *)(a1 + 16);
    if (v20)
    {
      v43 = a3;
      v51 = sub_1DD32AC08(0, &qword_1F03D4D18);
      v21 = sub_1DD32AC08(0, &qword_1F03D4D20);
      v49 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56);
      v50 = v21;
      swift_bridgeObjectRetain();
      v22 = MEMORY[0x1E0DEE9D8];
      v42[1] = a1;
      v23 = a1 + 40;
      *(_QWORD *)&v24 = 136446210;
      v45 = v24;
      v44 = MEMORY[0x1E0DEE9B8] + 8;
      v48 = v16;
      do
      {
        v54 = v22;
        v55 = v20;
        v49(v15, 1, 1, v16);
        v25 = (void *)sub_1DD3428D0();
        v26 = v46;
        sub_1DD3120A0(v25, v46);

        sub_1DD31A090((uint64_t)v15, &qword_1F03D4D10);
        sub_1DD341698((uint64_t)v26, (uint64_t)v15);
        v22 = v54;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v15, 1, v16) == 1)
        {
          sub_1DD31A090((uint64_t)v15, &qword_1F03D4D10);
        }
        else
        {
          v27 = v47;
          sub_1DD341654((uint64_t)v15, v47);
          sub_1DD341654(v27, v52);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v22 = sub_1DD3407E4(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
          v29 = *(_QWORD *)(v22 + 16);
          v28 = *(_QWORD *)(v22 + 24);
          if (v29 >= v28 >> 1)
            v22 = sub_1DD3407E4(v28 > 1, v29 + 1, 1, v22);
          *(_QWORD *)(v22 + 16) = v29 + 1;
          sub_1DD341654(v52, v22+ ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))+ *(_QWORD *)(v53 + 72) * v29);
        }
        v23 += 16;
        v20 = v55 - 1;
      }
      while (v55 != 1);
      swift_bridgeObjectRelease();
      a3 = v43;
    }
    else
    {
      v22 = MEMORY[0x1E0DEE9D8];
    }
    result = swift_bridgeObjectRelease();
    *a3 = v22;
  }
  else
  {
    v30 = sub_1DD338E84();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v30, v6);
    v31 = a2;
    v32 = a2;
    v33 = sub_1DD3423C0();
    v34 = sub_1DD3428AC();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v55 = v6;
      v37 = v36;
      v56 = (uint64_t)a2;
      v57 = v36;
      v54 = v7;
      *(_DWORD *)v35 = 136446210;
      v38 = a2;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03D4A70);
      v39 = sub_1DD3427A4();
      v56 = sub_1DD30EE20(v39, v40, &v57);
      sub_1DD342954();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1DD30C000, v33, v34, "No record data given. Error: %{public}s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v37, -1, -1);
      MEMORY[0x1DF0D91B0](v35, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v10, v55);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  return result;
}

uint64_t sub_1DD341160(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  _QWORD *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;

  v2 = sub_1DD3423D8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v28 - v7;
  AuthorizationStatus.init(rawValue:)((Swift::Int)objc_msgSend(a1, sel_integerValue));
  v9 = v31;
  v10 = sub_1DD338E84();
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  if (v9 == 3)
  {
    v11(v6, v10, v2);
    v12 = a1;
    v13 = sub_1DD3423C0();
    v14 = sub_1DD3428AC();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v29 = v2;
      v17 = (_QWORD *)v16;
      v28 = v3;
      *(_DWORD *)v15 = 138412290;
      v31 = v12;
      v18 = v12;
      v3 = v28;
      sub_1DD342954();
      *v17 = v12;

      _os_log_impl(&dword_1DD30C000, v13, v14, "Received authorization change with unknown status: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D00);
      swift_arrayDestroy();
      v19 = v17;
      v2 = v29;
      MEMORY[0x1DF0D91B0](v19, -1, -1);
      MEMORY[0x1DF0D91B0](v15, -1, -1);
    }
    else
    {

      v13 = v12;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    v11(v8, v10, v2);
    v20 = sub_1DD3423C0();
    v21 = sub_1DD3428C4();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v29 = v2;
      v24 = v23;
      v31 = v23;
      v28 = v3;
      *(_DWORD *)v22 = 136315138;
      LOBYTE(v30) = v9;
      sub_1DD312018();
      v25 = sub_1DD342B1C();
      v30 = sub_1DD30EE20(v25, v26, (uint64_t *)&v31);
      sub_1DD342954();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DD30C000, v20, v21, "Received authorization change with status: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0D91B0](v24, -1, -1);
      MEMORY[0x1DF0D91B0](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
    if (qword_1F03D8310 != -1)
      swift_once();
    LOBYTE(v31) = v9;
    return (*(uint64_t (**)(NSObject **))(*(_QWORD *)qword_1F03D8318 + 120))(&v31);
  }
}

uint64_t sub_1DD3414EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D3AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

void sub_1DD341568(void *a1)
{
  uint64_t v1;
  void (*v2)(void *, uint64_t);
  id v4;

  v2 = *(void (**)(void *, uint64_t))(v1 + 24);
  if (a1)
  {
    v4 = a1;
    v2(a1, 1);

  }
  else
  {
    v2(0, 0);
  }
}

uint64_t objectdestroy_15Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD3415F0(uint64_t a1, void *a2)
{
  uint64_t v2;
  unint64_t *v5;

  v5 = (unint64_t *)(*(_QWORD *)(v2 + 24) + 16);
  swift_beginAccess();
  sub_1DD340B04(a1, a2, v5);
  return swift_endAccess();
}

uint64_t sub_1DD341654(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AuthorizationRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD341698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03D4D10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_9Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1DD341710(void *a1, void *a2)
{
  uint64_t v2;

  sub_1DD33E108(a1, a2, *(void (**)(_QWORD, _QWORD))(v2 + 24), *(_QWORD *)(v2 + 32));
}

unint64_t sub_1DD34173C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDB64F88;
  if (!qword_1EDB64F88)
  {
    v1 = sub_1DD342720();
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EDB64F88);
  }
  return result;
}

unint64_t sub_1DD341784()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDB64FB0;
  if (!qword_1EDB64FB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB64FA8);
    result = MEMORY[0x1DF0D9108](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EDB64FB0);
  }
  return result;
}

uint64_t sub_1DD3417D0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DD3417F4(void *a1, void *a2)
{
  uint64_t v2;

  sub_1DD33DC98(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1DD3417FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD341820()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DD341844(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DD3418FC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F03D4D30 + dword_1F03D4D30))(a1, v4);
}

void sub_1DD3418B4(void *a1, void *a2)
{
  uint64_t v2;

  sub_1DD33D274(a1, a2, v2);
}

uint64_t sub_1DD3418BC()
{
  uint64_t v0;
  uint64_t v1;
  char v3;

  v1 = *(_QWORD *)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  return (*(uint64_t (**)(char *))(*(_QWORD *)v1 + 120))(&v3);
}

id sub_1DD341974()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1F03D86E8 = (uint64_t)result;
  return result;
}

uint64_t sub_1DD3419C4(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D8788);
}

uint64_t sub_1DD3419E4()
{
  return sub_1DD341A5C(&qword_1F03D86F0, (uint64_t)qword_1F03D8788);
}

uint64_t sub_1DD341A00@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D86F0, (uint64_t)qword_1F03D8788, a1);
}

uint64_t sub_1DD341A1C(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D87A0);
}

uint64_t sub_1DD341A40()
{
  return sub_1DD341A5C(&qword_1F03D86F8, (uint64_t)qword_1F03D87A0);
}

uint64_t sub_1DD341A5C(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_1DD3423B4();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1DD341A9C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D86F8, (uint64_t)qword_1F03D87A0, a1);
}

uint64_t sub_1DD341AB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1DD3423B4();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1DD341B20(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D87B8);
}

uint64_t sub_1DD341B44()
{
  return sub_1DD341A5C(&qword_1F03D8700, (uint64_t)qword_1F03D87B8);
}

uint64_t sub_1DD341B60@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8700, (uint64_t)qword_1F03D87B8, a1);
}

uint64_t sub_1DD341B7C(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D87D0);
}

uint64_t sub_1DD341BA0()
{
  return sub_1DD341A5C(&qword_1F03D8708, (uint64_t)qword_1F03D87D0);
}

uint64_t sub_1DD341BBC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8708, (uint64_t)qword_1F03D87D0, a1);
}

uint64_t sub_1DD341BD8(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D87E8);
}

uint64_t sub_1DD341C04()
{
  return sub_1DD341A5C(&qword_1F03D8710, (uint64_t)qword_1F03D87E8);
}

uint64_t sub_1DD341C20@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8710, (uint64_t)qword_1F03D87E8, a1);
}

uint64_t sub_1DD341C3C(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D8800);
}

uint64_t sub_1DD341C58()
{
  return sub_1DD341A5C(&qword_1F03D8718, (uint64_t)qword_1F03D8800);
}

uint64_t sub_1DD341C74@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8718, (uint64_t)qword_1F03D8800, a1);
}

uint64_t sub_1DD341C90(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D8818);
}

uint64_t sub_1DD341CBC()
{
  return sub_1DD341A5C(&qword_1F03D8720, (uint64_t)qword_1F03D8818);
}

uint64_t sub_1DD341CD8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8720, (uint64_t)qword_1F03D8818, a1);
}

uint64_t sub_1DD341CF4(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D8830);
}

uint64_t sub_1DD341D18()
{
  return sub_1DD341A5C(&qword_1F03D8728, (uint64_t)qword_1F03D8830);
}

uint64_t sub_1DD341D34@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8728, (uint64_t)qword_1F03D8830, a1);
}

uint64_t sub_1DD341D50(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D8848);
}

uint64_t sub_1DD341D6C()
{
  return sub_1DD341A5C(&qword_1F03D8730, (uint64_t)qword_1F03D8848);
}

uint64_t sub_1DD341D88@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8730, (uint64_t)qword_1F03D8848, a1);
}

uint64_t sub_1DD341DA4(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D8860);
}

uint64_t sub_1DD341DCC()
{
  return sub_1DD341A5C(&qword_1F03D8738, (uint64_t)qword_1F03D8860);
}

uint64_t sub_1DD341DE8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8738, (uint64_t)qword_1F03D8860, a1);
}

uint64_t sub_1DD341E04(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D8878);
}

uint64_t sub_1DD341E30()
{
  return sub_1DD341A5C(&qword_1F03D8740, (uint64_t)qword_1F03D8878);
}

uint64_t sub_1DD341E4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8740, (uint64_t)qword_1F03D8878, a1);
}

uint64_t sub_1DD341E68(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D8890);
}

uint64_t sub_1DD341E8C()
{
  return sub_1DD341A5C(&qword_1F03D8748, (uint64_t)qword_1F03D8890);
}

uint64_t sub_1DD341EA8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8748, (uint64_t)qword_1F03D8890, a1);
}

uint64_t sub_1DD341EC4(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D88A8);
}

uint64_t sub_1DD341EE0()
{
  return sub_1DD341A5C(&qword_1F03D8750, (uint64_t)qword_1F03D88A8);
}

uint64_t sub_1DD341EFC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8750, (uint64_t)qword_1F03D88A8, a1);
}

uint64_t sub_1DD341F18(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D88C0);
}

uint64_t sub_1DD341F3C()
{
  return sub_1DD341A5C(&qword_1F03D8758, (uint64_t)qword_1F03D88C0);
}

uint64_t sub_1DD341F58@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8758, (uint64_t)qword_1F03D88C0, a1);
}

uint64_t sub_1DD341F74(uint64_t a1)
{
  return sub_1DD341F94(a1, qword_1F03D88D8);
}

uint64_t sub_1DD341F94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_1DD3423B4();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1F03D86E0 != -1)
    swift_once();
  v4 = (id)qword_1F03D86E8;
  return sub_1DD3423A8();
}

uint64_t sub_1DD34202C()
{
  return sub_1DD341A5C(&qword_1F03D8760, (uint64_t)qword_1F03D88D8);
}

uint64_t sub_1DD342048@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD341AB8(&qword_1F03D8760, (uint64_t)qword_1F03D88D8, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1DD342084()
{
  return MEMORY[0x1E0CADD98]();
}

uint64_t sub_1DD342090()
{
  return MEMORY[0x1E0CADE20]();
}

uint64_t sub_1DD34209C()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1DD3420A8()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1DD3420B4()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1DD3420C0()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1DD3420CC()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1DD3420D8()
{
  return MEMORY[0x1E0CAE6D0]();
}

uint64_t sub_1DD3420E4()
{
  return MEMORY[0x1E0CAE700]();
}

uint64_t sub_1DD3420F0()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1DD3420FC()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1DD342108()
{
  return MEMORY[0x1E0CAE858]();
}

uint64_t sub_1DD342114()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1DD342120()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1DD34212C()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1DD342138()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1DD342144()
{
  return MEMORY[0x1E0CAF548]();
}

uint64_t sub_1DD342150()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1DD34215C()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1DD342168()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1DD342174()
{
  return MEMORY[0x1E0CAF628]();
}

uint64_t sub_1DD342180()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1DD34218C()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1DD342198()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1DD3421A4()
{
  return MEMORY[0x1E0CAF6F8]();
}

uint64_t sub_1DD3421B0()
{
  return MEMORY[0x1E0CAF708]();
}

uint64_t sub_1DD3421BC()
{
  return MEMORY[0x1E0CAF750]();
}

uint64_t sub_1DD3421C8()
{
  return MEMORY[0x1E0CAF788]();
}

uint64_t sub_1DD3421D4()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1DD3421E0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DD3421EC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DD3421F8()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1DD342204()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1DD342210()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DD34221C()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1DD342228()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1DD342234()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1DD342240()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1DD34224C()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1DD342258()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DD342264()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1DD342270()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DD34227C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DD342288()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1DD342294()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1DD3422A0()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1DD3422AC()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1DD3422B8()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1DD3422C4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1DD3422D0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1DD3422DC()
{
  return MEMORY[0x1E0CB0A98]();
}

uint64_t sub_1DD3422E8()
{
  return MEMORY[0x1E0CB0BD8]();
}

uint64_t sub_1DD3422F4()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DD342300()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DD34230C()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1DD342318()
{
  return MEMORY[0x1E0CC1428]();
}

uint64_t sub_1DD342324()
{
  return MEMORY[0x1E0CC1440]();
}

uint64_t sub_1DD342330()
{
  return MEMORY[0x1E0CC1448]();
}

uint64_t sub_1DD34233C()
{
  return MEMORY[0x1E0CC1468]();
}

uint64_t sub_1DD342348()
{
  return MEMORY[0x1E0CC1490]();
}

uint64_t sub_1DD342354()
{
  return MEMORY[0x1E0CC1498]();
}

uint64_t sub_1DD342360()
{
  return MEMORY[0x1E0CC14B8]();
}

uint64_t sub_1DD34236C()
{
  return MEMORY[0x1E0CC14C0]();
}

uint64_t sub_1DD342378()
{
  return MEMORY[0x1E0CC14C8]();
}

uint64_t sub_1DD342384()
{
  return MEMORY[0x1E0CC1500]();
}

uint64_t sub_1DD342390()
{
  return MEMORY[0x1E0CC1510]();
}

uint64_t sub_1DD34239C()
{
  return MEMORY[0x1E0CC1528]();
}

uint64_t sub_1DD3423A8()
{
  return MEMORY[0x1E0CA9B98]();
}

uint64_t sub_1DD3423B4()
{
  return MEMORY[0x1E0CA9BA8]();
}

uint64_t sub_1DD3423C0()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DD3423CC()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DD3423D8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DD3423E4()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1DD3423F0()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1DD3423FC()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1DD342408()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1DD342414()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1DD342420()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1DD34242C()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1DD342438()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1DD342444()
{
  return MEMORY[0x1E0CD82E8]();
}

uint64_t sub_1DD342450()
{
  return MEMORY[0x1E0CD86C0]();
}

uint64_t sub_1DD34245C()
{
  return MEMORY[0x1E0CD86F8]();
}

uint64_t sub_1DD342468()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_1DD342474()
{
  return MEMORY[0x1E0CD8B48]();
}

uint64_t sub_1DD342480()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1DD34248C()
{
  return MEMORY[0x1E0CD8E78]();
}

uint64_t sub_1DD342498()
{
  return MEMORY[0x1E0CD8E80]();
}

uint64_t sub_1DD3424A4()
{
  return MEMORY[0x1E0CD9810]();
}

uint64_t sub_1DD3424B0()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_1DD3424BC()
{
  return MEMORY[0x1E0CDA4E0]();
}

uint64_t sub_1DD3424C8()
{
  return MEMORY[0x1E0CDA4E8]();
}

uint64_t sub_1DD3424D4()
{
  return MEMORY[0x1E0CDA520]();
}

uint64_t sub_1DD3424E0()
{
  return MEMORY[0x1E0CDA590]();
}

uint64_t sub_1DD3424EC()
{
  return MEMORY[0x1E0CDA5A0]();
}

uint64_t sub_1DD3424F8()
{
  return MEMORY[0x1E0CDA938]();
}

uint64_t sub_1DD342504()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_1DD342510()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_1DD34251C()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_1DD342528()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t sub_1DD342534()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_1DD342540()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t sub_1DD34254C()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_1DD342558()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_1DD342564()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_1DD342570()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_1DD34257C()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_1DD342588()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_1DD342594()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_1DD3425A0()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_1DD3425AC()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_1DD3425B8()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1DD3425C4()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_1DD3425D0()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_1DD3425DC()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_1DD3425E8()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_1DD3425F4()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_1DD342600()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_1DD34260C()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_1DD342618()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_1DD342624()
{
  return MEMORY[0x1E0CDCEC8]();
}

uint64_t sub_1DD342630()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_1DD34263C()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1DD342648()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1DD342654()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1DD342660()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1DD34266C()
{
  return MEMORY[0x1E0CDEF58]();
}

uint64_t sub_1DD342678()
{
  return MEMORY[0x1E0CDF6A8]();
}

uint64_t sub_1DD342684()
{
  return MEMORY[0x1E0CDF6B0]();
}

uint64_t sub_1DD342690()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_1DD34269C()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_1DD3426A8()
{
  return MEMORY[0x1E0CDF858]();
}

uint64_t sub_1DD3426B4()
{
  return MEMORY[0x1E0CDF878]();
}

uint64_t sub_1DD3426C0()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1DD3426CC()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1DD3426D8()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_1DD3426E4()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_1DD3426F0()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1DD3426FC()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_1DD342708()
{
  return MEMORY[0x1E0CDFD58]();
}

uint64_t sub_1DD342714()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1DD342720()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1DD34272C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1DD342738()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1DD342744()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1DD342750()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1DD34275C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DD342768()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1DD342774()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1DD342780()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1DD34278C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DD342798()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DD3427A4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1DD3427B0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DD3427BC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DD3427C8()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DD3427D4()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1DD3427E0()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_1DD3427EC()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1DD3427F8()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1DD342804()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1DD342810()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DD34281C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DD342828()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DD342834()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DD342840()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DD34284C()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1DD342858()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1DD342864()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t sub_1DD342870()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1DD34287C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1DD342888()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_1DD342894()
{
  return MEMORY[0x1E0DEB618]();
}

uint64_t sub_1DD3428A0()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1DD3428AC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DD3428B8()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1DD3428C4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DD3428D0()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1DD3428DC()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1DD3428E8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1DD3428F4()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1DD342900()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1DD34290C()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1DD342918()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1DD342924()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1DD342930()
{
  return MEMORY[0x1E0DEF918]();
}

uint64_t sub_1DD34293C()
{
  return MEMORY[0x1E0CB1FB0]();
}

uint64_t sub_1DD342948()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DD342954()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DD342960()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DD34296C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1DD342978()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DD342984()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1DD342990()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1DD34299C()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1DD3429A8()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1DD3429B4()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1DD3429C0()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1DD3429CC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DD3429D8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DD3429E4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DD3429F0()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1DD3429FC()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1DD342A08()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DD342A14()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1DD342A20()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DD342A2C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1DD342A38()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DD342A44()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1DD342A50()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1DD342A5C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DD342A68()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DD342A74()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1DD342A80()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1DD342A8C()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1DD342A98()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1DD342AA4()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1DD342AB0()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1DD342ABC()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1DD342AC8()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1DD342AD4()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1DD342AE0()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1DD342AEC()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1DD342AF8()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1DD342B04()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1DD342B10()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1DD342B1C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DD342B28()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1DD342B34()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DD342B40()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1DD342B4C()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1DD342B58()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1DD342B64()
{
  return MEMORY[0x1E0CB2620]();
}

uint64_t sub_1DD342B70()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1DD342B7C()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1DD342B88()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DD342B94()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DD342BA0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DD342BAC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DD342BB8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DD342BC4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DD342BD0()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1DD342BDC()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1DD342BE8()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1DD342BF4()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1DD342C00()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

