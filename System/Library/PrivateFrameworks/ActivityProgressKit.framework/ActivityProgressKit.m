uint64_t APKDeviceLockState.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x656B636F6C6E752ELL;
  else
    return 0x64656B636F6C2ELL;
}

BOOL static APKDeviceLockState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t APKDeviceLockState.hash(into:)()
{
  return sub_235E8AA04();
}

BOOL sub_235E891FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_235E89218()
{
  return sub_235E8AA04();
}

uint64_t sub_235E89244()
{
  _BYTE *v0;

  if (*v0)
    return 0x64656B636F6C6E75;
  else
    return 0x64656B636F6CLL;
}

uint64_t sub_235E8927C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235E8A880(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_235E892A0()
{
  return 0;
}

void sub_235E892AC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_235E892B8()
{
  sub_235E89624();
  return sub_235E8AA34();
}

uint64_t sub_235E892E0()
{
  sub_235E89624();
  return sub_235E8AA40();
}

uint64_t sub_235E89308()
{
  return 0;
}

uint64_t sub_235E89314@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_235E89340(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_235E8934C()
{
  sub_235E896AC();
  return sub_235E8AA34();
}

uint64_t sub_235E89374()
{
  sub_235E896AC();
  return sub_235E8AA40();
}

uint64_t sub_235E8939C()
{
  sub_235E89668();
  return sub_235E8AA34();
}

uint64_t sub_235E893C4()
{
  sub_235E89668();
  return sub_235E8AA40();
}

uint64_t APKDeviceLockState.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25638A8E8);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25638A8F0);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25638A8F8);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235E89624();
  sub_235E8AA28();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_235E89668();
    sub_235E8A9E0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_235E896AC();
    sub_235E8A9E0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E4554]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_235E89624()
{
  unint64_t result;

  result = qword_25638AA30;
  if (!qword_25638AA30)
  {
    result = MEMORY[0x23B7E4560](&unk_235E8B19C, &type metadata for APKDeviceLockState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25638AA30);
  }
  return result;
}

unint64_t sub_235E89668()
{
  unint64_t result;

  result = qword_25638AA38;
  if (!qword_25638AA38)
  {
    result = MEMORY[0x23B7E4560](&unk_235E8B14C, &type metadata for APKDeviceLockState.UnlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25638AA38);
  }
  return result;
}

unint64_t sub_235E896AC()
{
  unint64_t result;

  result = qword_25638AA40[0];
  if (!qword_25638AA40[0])
  {
    result = MEMORY[0x23B7E4560](&unk_235E8B0FC, &type metadata for APKDeviceLockState.LockedCodingKeys);
    atomic_store(result, qword_25638AA40);
  }
  return result;
}

uint64_t APKDeviceLockState.hashValue.getter()
{
  sub_235E8A9F8();
  sub_235E8AA04();
  return sub_235E8AA10();
}

uint64_t APKDeviceLockState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25638A900);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25638A908);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25638A910);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235E89624();
  v11 = v33;
  sub_235E8AA1C();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_235E8A9D4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_235E8A9A4();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25638A918);
    *v21 = &type metadata for APKDeviceLockState;
    sub_235E8A9C8();
    sub_235E8A998();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_235E89668();
    sub_235E8A9BC();
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
    sub_235E896AC();
    v22 = v6;
    sub_235E8A9BC();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_235E89A8C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return APKDeviceLockState.init(from:)(a1, a2);
}

uint64_t sub_235E89AA0(_QWORD *a1)
{
  return APKDeviceLockState.encode(to:)(a1);
}

uint64_t sub_235E89AB4()
{
  sub_235E8A9F8();
  sub_235E8AA04();
  return sub_235E8AA10();
}

uint64_t sub_235E89AF8()
{
  sub_235E8A9F8();
  sub_235E8AA04();
  return sub_235E8AA10();
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

uint64_t sub_235E89B58()
{
  _BYTE *v0;

  if (*v0)
    return 0x656B636F6C6E752ELL;
  else
    return 0x64656B636F6C2ELL;
}

uint64_t sub_235E89B98@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x23B7E45C0](v4);
  v6 = *(_QWORD *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_235E89BF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_235E89C48()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x23B7E45C0](v0 + 16);
}

uint64_t sub_235E89C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_235E89CEC(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x23B7E45C0](v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_235E89D58;
}

void sub_235E89D58(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 24) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

unint64_t sub_235E89DC8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25638AA28);
  v2 = (_QWORD *)sub_235E8A9B0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_235E8A73C(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
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

void sub_235E89ED8(_BYTE *a1@<X8>)
{
  void *v2;
  unsigned int v3;
  unint64_t v4;

  v2 = (void *)sub_235E8A974();
  v3 = MKBGetDeviceLockState();

  v4 = 0x100000001000001uLL >> (8 * v3);
  if (v3 >= 8)
    LOBYTE(v4) = 0;
  *a1 = v4;
}

uint64_t APKLockStateMonitor.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  APKLockStateMonitor.init()();
  return v0;
}

uint64_t APKLockStateMonitor.init()()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];

  v1 = v0;
  *(_QWORD *)(v0 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_DWORD *)(v0 + 32) = 0;
  v2 = (int *)(v0 + 32);
  *(_QWORD *)(v0 + 40) = sub_235E89DC8((uint64_t)&unk_250742CC0);
  sub_235E8A098();
  v3 = sub_235E8A98C();
  v4 = swift_allocObject();
  swift_weakInit();
  v7[4] = sub_235E8A0F8;
  v7[5] = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_235E8A1C0;
  v7[3] = &block_descriptor;
  v5 = _Block_copy(v7);
  swift_release();
  swift_beginAccess();
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", v2, v3, v5);
  swift_endAccess();
  _Block_release(v5);

  return v1;
}

unint64_t sub_235E8A098()
{
  unint64_t result;

  result = qword_25638A920;
  if (!qword_25638A920)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25638A920);
  }
  return result;
}

uint64_t sub_235E8A0D4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E8A0F8()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  char v5;
  char v6;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = result + 16;
    swift_beginAccess();
    if (MEMORY[0x23B7E45C0](v2))
    {
      v3 = *(_QWORD *)(v1 + 24);
      ObjectType = swift_getObjectType();
      sub_235E89ED8(&v6);
      v5 = v6;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 8))(&v5, ObjectType, v3);
      swift_unknownObjectRelease();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_235E8A1C0(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
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

uint64_t APKLockStateMonitor.deinit()
{
  uint64_t v0;

  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 32));
  sub_235E8A25C(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_235E8A25C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t APKLockStateMonitor.__deallocating_deinit()
{
  uint64_t v0;

  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 32));
  sub_235E8A25C(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_235E8A2D8()
{
  unint64_t result;

  result = qword_25638A928;
  if (!qword_25638A928)
  {
    result = MEMORY[0x23B7E4560](&protocol conformance descriptor for APKDeviceLockState, &type metadata for APKDeviceLockState);
    atomic_store(result, (unint64_t *)&qword_25638A928);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for APKDeviceLockState()
{
  return &type metadata for APKDeviceLockState;
}

uint64_t dispatch thunk of APKLockStateMonitorDelegate.lockStateChanged(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for APKLockStateMonitor()
{
  return objc_opt_self();
}

uint64_t method lookup function for APKLockStateMonitor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of APKLockStateMonitor.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of APKLockStateMonitor.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of APKLockStateMonitor.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of APKLockStateMonitor.lockState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of APKLockStateMonitor.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t _s19ActivityProgressKit18APKDeviceLockStateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s19ActivityProgressKit18APKDeviceLockStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E8A490 + 4 * byte_235E8ADC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_235E8A4C4 + 4 * byte_235E8ADC0[v4]))();
}

uint64_t sub_235E8A4C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E8A4CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E8A4D4);
  return result;
}

uint64_t sub_235E8A4E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E8A4E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_235E8A4EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E8A4F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E8A500(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235E8A508(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for APKDeviceLockState.CodingKeys()
{
  return &type metadata for APKDeviceLockState.CodingKeys;
}

ValueMetadata *type metadata accessor for APKDeviceLockState.LockedCodingKeys()
{
  return &type metadata for APKDeviceLockState.LockedCodingKeys;
}

ValueMetadata *type metadata accessor for APKDeviceLockState.UnlockedCodingKeys()
{
  return &type metadata for APKDeviceLockState.UnlockedCodingKeys;
}

unint64_t sub_235E8A548()
{
  unint64_t result;

  result = qword_25638AFD0[0];
  if (!qword_25638AFD0[0])
  {
    result = MEMORY[0x23B7E4560](&unk_235E8B0D4, &type metadata for APKDeviceLockState.CodingKeys);
    atomic_store(result, qword_25638AFD0);
  }
  return result;
}

unint64_t sub_235E8A590()
{
  unint64_t result;

  result = qword_25638B0E0;
  if (!qword_25638B0E0)
  {
    result = MEMORY[0x23B7E4560](&unk_235E8AFF4, &type metadata for APKDeviceLockState.LockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25638B0E0);
  }
  return result;
}

unint64_t sub_235E8A5D8()
{
  unint64_t result;

  result = qword_25638B0E8[0];
  if (!qword_25638B0E8[0])
  {
    result = MEMORY[0x23B7E4560](&unk_235E8B01C, &type metadata for APKDeviceLockState.LockedCodingKeys);
    atomic_store(result, qword_25638B0E8);
  }
  return result;
}

unint64_t sub_235E8A620()
{
  unint64_t result;

  result = qword_25638B170;
  if (!qword_25638B170)
  {
    result = MEMORY[0x23B7E4560](&unk_235E8AFA4, &type metadata for APKDeviceLockState.UnlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25638B170);
  }
  return result;
}

unint64_t sub_235E8A668()
{
  unint64_t result;

  result = qword_25638B178;
  if (!qword_25638B178)
  {
    result = MEMORY[0x23B7E4560](&unk_235E8AFCC, &type metadata for APKDeviceLockState.UnlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25638B178);
  }
  return result;
}

unint64_t sub_235E8A6B0()
{
  unint64_t result;

  result = qword_25638B200;
  if (!qword_25638B200)
  {
    result = MEMORY[0x23B7E4560](&unk_235E8B044, &type metadata for APKDeviceLockState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25638B200);
  }
  return result;
}

unint64_t sub_235E8A6F8()
{
  unint64_t result;

  result = qword_25638B208[0];
  if (!qword_25638B208[0])
  {
    result = MEMORY[0x23B7E4560](&unk_235E8B06C, &type metadata for APKDeviceLockState.CodingKeys);
    atomic_store(result, qword_25638B208);
  }
  return result;
}

unint64_t sub_235E8A73C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_235E8A9F8();
  sub_235E8A980();
  v4 = sub_235E8AA10();
  return sub_235E8A7A0(a1, a2, v4);
}

unint64_t sub_235E8A7A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_235E8A9EC() & 1) == 0)
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
      while (!v14 && (sub_235E8A9EC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_235E8A880(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x64656B636F6CLL && a2 == 0xE600000000000000;
  if (v2 || (sub_235E8A9EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656B636F6C6E75 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_235E8A9EC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_235E8A974()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235E8A980()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235E8A98C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_235E8A998()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_235E8A9A4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_235E8A9B0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235E8A9BC()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_235E8A9C8()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_235E8A9D4()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_235E8A9E0()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_235E8A9EC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235E8A9F8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235E8AA04()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235E8AA10()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_235E8AA1C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_235E8AA28()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_235E8AA34()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_235E8AA40()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

