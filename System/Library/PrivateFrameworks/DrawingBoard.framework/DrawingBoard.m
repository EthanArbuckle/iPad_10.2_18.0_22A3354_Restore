uint64_t sub_23A6DC838()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjCClassFromMetadata;
  uint64_t result;

  v0 = sub_23A70D624();
  if (swift_isClassType())
    v1 = v0;
  else
    v1 = 0;
  if (!v1)
    goto LABEL_11;
  v2 = sub_23A70D624();
  if (!swift_isClassType())
    v2 = 0;
  if (v2)
  {
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    LODWORD(result) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, ObjCClassFromMetadata);
    if (v2 == v1)
      return 0;
    else
      return result;
  }
  else
  {
LABEL_11:
    swift_retain();
    sub_23A70D6D8();
    sub_23A70D468();
    sub_23A70D63C();
    sub_23A70D738();
    result = sub_23A70D750();
    __break(1u);
  }
  return result;
}

void type metadata accessor for FBSceneContentState(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF2F8);
}

void type metadata accessor for FBSSceneInterruptionPolicy(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF300);
}

void type metadata accessor for BSInterfaceOrientation(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF308);
}

void type metadata accessor for UISSystemReferenceAngleMode(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF310);
}

void type metadata accessor for ReferenceDisplayModeStatus(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF318);
}

void type metadata accessor for UIAccessibilityContrast(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF320);
}

void type metadata accessor for BSDeviceOrientation(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF328);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF330);
}

void type metadata accessor for _UIApplicationStatusBarPart(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF338);
}

uint64_t _s5EventOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_23A6DCAF8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A6DCB18(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF340);
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF348);
}

void type metadata accessor for UIApplicationSceneDeactivationReasonMask(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF350);
}

void type metadata accessor for _UIStatusBarStyleOverrides(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF358);
}

BOOL sub_23A6DCB94(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_23A6DCBA8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_23A6DCBB4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23A6DCBD0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A6DCBF0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF3C0);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_23A6DCC40(a1, &qword_2569AF3C8);
}

void sub_23A6DCC40(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_23A6DCCA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

id sub_23A6DCCD8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A6DCD54()
{
  return type metadata accessor for SceneObserver();
}

uint64_t type metadata accessor for SceneObserver()
{
  uint64_t result;

  result = qword_2569AF4C8;
  if (!qword_2569AF4C8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A6DCD98()
{
  unint64_t v0;

  sub_23A6DCE10();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_23A6DCE10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2569AF4D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2569AF4E0);
    v0 = sub_23A70D5E8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2569AF4D8);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B85525C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A6DCEAC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v13[3];
  char v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF500);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF508);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A6DEB50(v1 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF4E0);
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) == 1)
  {
    sub_23A6DEB98((uint64_t)v4, &qword_2569AF500);
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  }
  else
  {
    v10 = objc_msgSend(a1, sel_contentState);
    v13[1] = 0;
    v13[2] = 0;
    v13[0] = v10;
    v14 = 0;
    sub_23A70D534();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  return sub_23A6DEB98((uint64_t)v6, &qword_2569AF508);
}

void sub_23A6DD3D4(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

id sub_23A6DD4D8(id result, void *a2, void *a3, char a4)
{
  id v4;
  id v5;
  id v6;

  switch(a4)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      result = result;
      break;
    case 6:
      v6 = result;
      v4 = a3;
      v5 = v6;
      result = a2;
      break;
    default:
      return result;
  }
  return result;
}

void _s5EventOwxx(uint64_t a1)
{
  sub_23A6DD54C(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(_BYTE *)(a1 + 24));
}

void sub_23A6DD54C(void *a1, void *a2, void *a3, char a4)
{
  switch(a4)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:

      break;
    case 6:

      break;
    default:
      return;
  }
}

uint64_t _s5EventOwcp(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A6DD4D8(*(id *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t _s5EventOwca(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A6DD4D8(*(id *)a2, v4, v5, v6);
  v7 = *(void **)a1;
  v8 = *(void **)(a1 + 8);
  v9 = *(void **)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23A6DD54C(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s5EventOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v6 = *(void **)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23A6DD54C(v5, v7, v6, v8);
  return a1;
}

uint64_t _s5EventOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 249);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 7)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s5EventOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 249;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A6DD76C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 6u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 7);
}

uint64_t sub_23A6DD788(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 7;
  if (a2 >= 7)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 7;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *_s5EventOMa()
{
  return &_s5EventON;
}

unint64_t sub_23A6DD7B4()
{
  unint64_t result;

  result = qword_2569AFF10;
  if (!qword_2569AFF10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569AFF10);
  }
  return result;
}

unint64_t sub_23A6DD7F0()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2569AF4F0;
  if (!qword_2569AF4F0)
  {
    v1 = sub_23A6DD7B4();
    result = MEMORY[0x23B855268](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2569AF4F0);
  }
  return result;
}

uint64_t sub_23A6DD838(void *a1, uint64_t a2)
{
  uint64_t isEscapingClosureAtFileLocation;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (objc_msgSend((id)isEscapingClosureAtFileLocation, sel_isActive))
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    a2 = swift_allocObject();
    *(_QWORD *)(a2 + 16) = sub_23A6DEC58;
    *(_QWORD *)(a2 + 24) = v5;
    v15 = sub_23A6DEC58;
    v16 = a2;
    v11 = MEMORY[0x24BDAC760];
    v12 = 1107296256;
    v13 = sub_23A6DDA64;
    v14 = &block_descriptor_18;
    a1 = _Block_copy(&v11);
    swift_retain();
    swift_release();
    objc_msgSend((id)isEscapingClosureAtFileLocation, sel_performUpdate_, a1);
    _Block_release(a1);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return result;
    __break(1u);
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23A6DEBF4;
  *(_QWORD *)(v8 + 24) = v7;
  v15 = sub_23A6DEC28;
  v16 = v8;
  v11 = MEMORY[0x24BDAC760];
  v12 = 1107296256;
  v13 = sub_23A6E30E4;
  v14 = &block_descriptor;
  v9 = _Block_copy(&v11);
  swift_retain();
  swift_release();
  objc_msgSend((id)isEscapingClosureAtFileLocation, sel_updateSettingsWithBlock_, v9);
  _Block_release(v9);
  v10 = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v10 & 1) != 0)
    __break(1u);
  return result;
}

void sub_23A6DDA64(uint64_t a1, void *a2, void *a3)
{
  void (*v4)(id, id);
  id v5;
  id v6;

  v4 = *(void (**)(id, id))(a1 + 32);
  v6 = a2;
  v5 = a3;
  v4(v6, v5);

}

void sub_23A6DDAB8(unint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, id *))
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v21 = 0;
  v6 = 0;
  v7 = a3 + 56;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 56);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v11)
      goto LABEL_24;
    v16 = *(_QWORD *)(v7 + 8 * v15);
    ++v6;
    if (!v16)
    {
      v6 = v15 + 1;
      if (v15 + 1 >= v11)
        goto LABEL_24;
      v16 = *(_QWORD *)(v7 + 8 * v6);
      if (!v16)
      {
        v6 = v15 + 2;
        if (v15 + 2 >= v11)
          goto LABEL_24;
        v16 = *(_QWORD *)(v7 + 8 * v6);
        if (!v16)
          break;
      }
    }
LABEL_20:
    v10 = (v16 - 1) & v16;
    v13 = __clz(__rbit64(v16)) + (v6 << 6);
LABEL_5:
    v23 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v13);
    v14 = v23;
    a4(&v22, &v23);

    if (v22 == 1)
    {
      *(unint64_t *)((char *)a1 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v21++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        sub_23A6DDC88(a1, a2, v21, a3);
        swift_release();
        return;
      }
    }
  }
  v17 = v15 + 3;
  if (v17 >= v11)
    goto LABEL_24;
  v16 = *(_QWORD *)(v7 + 8 * v17);
  if (v16)
  {
    v6 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v6 >= v11)
      goto LABEL_24;
    v16 = *(_QWORD *)(v7 + 8 * v6);
    ++v17;
    if (v16)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_23A6DDC88(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF4F8);
  result = sub_23A70D6CC();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = sub_23A70D5D0();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_23A6DDEE4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  char v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF500);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF508);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A6DEB50(v0 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF4E0);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) == 1)
  {
    sub_23A6DEB98((uint64_t)v2, &qword_2569AF500);
    v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v11 = 7;
    sub_23A70D534();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v2, v5);
    v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 0, 1, v8);
  }
  return sub_23A6DEB98((uint64_t)v4, &qword_2569AF508);
}

uint64_t sub_23A6DE068(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v13[3];
  char v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF500);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF508);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A6DEB50(v1 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF4E0);
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) == 1)
  {
    sub_23A6DEB98((uint64_t)v4, &qword_2569AF500);
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  }
  else
  {
    v13[1] = 0;
    v13[2] = 0;
    v13[0] = a1;
    v14 = 1;
    v10 = a1;
    sub_23A70D534();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  return sub_23A6DEB98((uint64_t)v6, &qword_2569AF508);
}

uint64_t sub_23A6DE1F8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  char v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF500);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF508);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A6DEB50(v0 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF4E0);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) == 1)
  {
    sub_23A6DEB98((uint64_t)v2, &qword_2569AF500);
    v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
  }
  else
  {
    v10[1] = 0;
    v10[2] = 0;
    v10[0] = 1;
    v11 = 7;
    sub_23A70D534();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v2, v5);
    v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 0, 1, v8);
  }
  return sub_23A6DEB98((uint64_t)v4, &qword_2569AF508);
}

uint64_t sub_23A6DE380(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v15[3];
  char v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF500);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF508);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A6DEB50(v2 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF4E0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    sub_23A6DEB98((uint64_t)v6, &qword_2569AF500);
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  else
  {
    v15[1] = 0;
    v15[2] = 0;
    v15[0] = a1;
    v16 = a2;
    v12 = a1;
    sub_23A70D534();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 0, 1, v13);
  }
  return sub_23A6DEB98((uint64_t)v8, &qword_2569AF508);
}

uint64_t sub_23A6DE514(void *a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v19[3];
  char v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF500);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF508);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A6DEB50(v3 + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, (uint64_t)v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF4E0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) == 1)
  {
    sub_23A6DEB98((uint64_t)v8, &qword_2569AF500);
    v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  else
  {
    v19[0] = a1;
    v19[1] = a2;
    v19[2] = a3;
    v20 = 6;
    v14 = a3;
    v15 = a1;
    v16 = a2;
    sub_23A70D534();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF510);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v10, 0, 1, v17);
  }
  return sub_23A6DEB98((uint64_t)v10, &qword_2569AF508);
}

uint64_t sub_23A6DE6B8(uint64_t a1, void (*a2)(uint64_t *__return_ptr, id *))
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  unsigned int v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];

  v3 = v2;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_BYTE *)(a1 + 32);
  v7 = v6 & 0x3F;
  v8 = (unint64_t)((1 << v6) + 63) >> 6;
  v9 = 8 * v8;
  swift_retain_n();
  if (v7 <= 0xD || (swift_stdlib_isStackAllocationSafe() & 1) != 0)
  {
    MEMORY[0x24BDAC7A8]();
    bzero((char *)v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    swift_retain();
    sub_23A6DDAB8((_QWORD *)((char *)v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, a1, a2);
    v11 = v10;
    swift_release();
    if (v3)
      swift_willThrow();
    swift_release();
  }
  else
  {
    v12 = (void *)swift_slowAlloc();
    bzero(v12, v9);
    swift_retain();
    sub_23A6DDAB8((unint64_t *)v12, v8, a1, a2);
    v11 = v13;
    swift_release();
    MEMORY[0x23B85534C](v12, -1, -1);
    swift_release();
  }
  swift_release();
  return v11;
}

uint64_t sub_23A6DE880(uint64_t a1, void (*a2)(uint64_t *__return_ptr, id *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  if ((a1 & 0xC000000000000001) == 0)
    return sub_23A6DE6B8(a1, a2);
  v3 = MEMORY[0x24BEE4B08];
  v21 = MEMORY[0x24BEE4B08];
  swift_retain();
  sub_23A70D660();
  v4 = sub_23A70D690();
  if (v4)
  {
    v5 = v4;
    sub_23A6DD7B4();
    do
    {
      v19 = v5;
      swift_dynamicCast();
      v19 = (uint64_t)v20;
      a2((uint64_t *)&v18, (id *)&v19);
      v6 = v20;
      if ((v18 & 1) != 0)
      {
        v7 = v21;
        if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
        {
          sub_23A6E79CC();
          v7 = v21;
        }
        result = sub_23A70D5D0();
        v9 = v7 + 56;
        v10 = -1 << *(_BYTE *)(v7 + 32);
        v11 = result & ~v10;
        v12 = v11 >> 6;
        if (((-1 << v11) & ~*(_QWORD *)(v7 + 56 + 8 * (v11 >> 6))) != 0)
        {
          v13 = __clz(__rbit64((-1 << v11) & ~*(_QWORD *)(v7 + 56 + 8 * (v11 >> 6)))) | v11 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v10) >> 6;
          do
          {
            if (++v12 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v12 == v15;
            if (v12 == v15)
              v12 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v9 + 8 * v12);
          }
          while (v17 == -1);
          v13 = __clz(__rbit64(~v17)) + (v12 << 6);
        }
        *(_QWORD *)(v9 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
        *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v13) = v6;
        ++*(_QWORD *)(v7 + 16);
      }
      else
      {

      }
      v5 = sub_23A70D690();
    }
    while (v5);
    v3 = v21;
  }
  swift_release();
  swift_release();
  return v3;
}

uint64_t sub_23A6DEAAC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23A6DEABC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6DEAE0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *a2 = result & 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B855250]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A6DEB50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A6DEB98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A6DEBD4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23A6DEBE4()
{
  return swift_deallocObject();
}

uint64_t sub_23A6DEBF4(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(a1, 0);
}

uint64_t sub_23A6DEC18()
{
  return swift_deallocObject();
}

uint64_t sub_23A6DEC28(uint64_t a1)
{
  uint64_t v1;

  return sub_23A6E30C4(a1, *(uint64_t (**)(void))(v1 + 16));
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

uint64_t sub_23A6DEC48()
{
  return swift_deallocObject();
}

uint64_t sub_23A6DEC58()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23A6DEC78()
{
  return swift_deallocObject();
}

_QWORD *sub_23A6DED58()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for LocalSceneSpecification();
  v1 = objc_msgSendSuper2(&v8, sel_defaultExtensions);
  if (v1)
  {
    v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF548);
    v3 = (_QWORD *)sub_23A70D498();

  }
  else
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_23A6DEED4(0, v3[2] + 1, 1, v3);
  v5 = v3[2];
  v4 = v3[3];
  if (v5 >= v4 >> 1)
    v3 = sub_23A6DEED4((_QWORD *)(v4 > 1), v5 + 1, 1, v3);
  v6 = type metadata accessor for LocalSceneExtension();
  v3[2] = v5 + 1;
  v3[v5 + 4] = v6;
  return v3;
}

id sub_23A6DEE84()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalSceneSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LocalSceneSpecification()
{
  return objc_opt_self();
}

_QWORD *sub_23A6DEED4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(qword_2569AF550);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A6DEFE0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_23A6DEFE0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23A70D78C();
  __break(1u);
  return result;
}

unint64_t static Int.default.getter()
{
  return 0x8000000000000000;
}

uint64_t sub_23A6DF0D4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A6DF0DC()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A6DF170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v26;
  uint64_t v27;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v7 + 97) & (unint64_t)~v7) + *(_QWORD *)(v6 + 64) > 0x18)
  {
    v10 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v10 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
    swift_retain();
  }
  else
  {
    v27 = *(_QWORD *)(a3 + 16);
    v11 = *(_QWORD *)a2;
    v12 = *(_BYTE *)(a2 + 8);
    v26 = *(_QWORD *)(v5 - 8);
    sub_23A6DF2FC(*(_QWORD *)a2, v12);
    *(_QWORD *)a1 = v11;
    *(_BYTE *)(a1 + 8) = v12;
    v13 = a1 & 0xFFFFFFFFFFFFFFF8;
    v14 = a2 & 0xFFFFFFFFFFFFFFF8;
    v15 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
    LOBYTE(v11) = *(_BYTE *)(v14 + 24);
    sub_23A6DF2FC(v15, v11);
    *(_QWORD *)(v13 + 16) = v15;
    *(_BYTE *)(v13 + 24) = v11;
    v16 = *(_QWORD *)(v14 + 32);
    LOBYTE(v11) = *(_BYTE *)(v14 + 40);
    sub_23A6DF308(v16, v11);
    *(_QWORD *)(v13 + 32) = v16;
    *(_BYTE *)(v13 + 40) = v11;
    *(_QWORD *)(v13 + 48) = *(_QWORD *)(v14 + 48);
    v17 = ((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8;
    v18 = (v14 + 63) & 0xFFFFFFFFFFFFFFF8;
    v19 = *(_QWORD *)v18;
    v20 = *(_QWORD *)(v18 + 8);
    v21 = *(_QWORD *)(v18 + 16);
    v22 = *(_QWORD *)(v18 + 24);
    v23 = *(_QWORD *)(v18 + 32);
    v24 = *(_BYTE *)(v18 + 40);
    swift_retain();
    sub_23A6DF314(v19, v20, v21, v22, v23, v24);
    *(_QWORD *)v17 = v19;
    *(_QWORD *)(v17 + 8) = v20;
    *(_QWORD *)(v17 + 16) = v21;
    *(_QWORD *)(v17 + 24) = v22;
    *(_QWORD *)(v17 + 32) = v23;
    *(_BYTE *)(v17 + 40) = v24;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v26 + 16))((v17 + v7 + 41) & ~v7, (v18 + v7 + 41) & ~v7, v27);
  }
  return a1;
}

uint64_t sub_23A6DF2FC(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return swift_retain();
}

uint64_t sub_23A6DF308(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_23A6DF314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  switch(a6)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23A6DF35C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a1;
  sub_23A6DF3E4(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  v3 &= 0xFFFFFFFFFFFFFFF8;
  sub_23A6DF3E4(*(_QWORD *)(v3 + 16), *(_BYTE *)(v3 + 24));
  sub_23A6DF3F0(*(_QWORD *)(v3 + 32), *(_BYTE *)(v3 + 40));
  swift_release();
  v4 = (v3 + 63) & 0xFFFFFFFFFFFFFFF8;
  sub_23A6DF3FC(*(_QWORD *)v4, *(_QWORD *)(v4 + 8), *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), *(_BYTE *)(v4 + 40));
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v4 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

uint64_t sub_23A6DF3E4(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return swift_release();
}

uint64_t sub_23A6DF3F0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_23A6DF3FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  switch(a6)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23A6DF444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23A6DF2FC(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a1 & 0xFFFFFFFFFFFFFFF8;
  v9 = a2 & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  LOBYTE(v6) = *(_BYTE *)(v9 + 24);
  sub_23A6DF2FC(v10, v6);
  *(_QWORD *)(v8 + 16) = v10;
  *(_BYTE *)(v8 + 24) = v6;
  v11 = *(_QWORD *)(v9 + 32);
  LOBYTE(v6) = *(_BYTE *)(v9 + 40);
  sub_23A6DF308(v11, v6);
  *(_QWORD *)(v8 + 32) = v11;
  *(_BYTE *)(v8 + 40) = v6;
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(v9 + 48);
  v12 = ((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v9 + 63) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)v13;
  v15 = *(_QWORD *)(v13 + 8);
  v16 = *(_QWORD *)(v13 + 16);
  v17 = *(_QWORD *)(v13 + 24);
  v18 = *(_QWORD *)(v13 + 32);
  v19 = *(_BYTE *)(v13 + 40);
  swift_retain();
  sub_23A6DF314(v14, v15, v16, v17, v18, v19);
  *(_QWORD *)v12 = v14;
  *(_QWORD *)(v12 + 8) = v15;
  *(_QWORD *)(v12 + 16) = v16;
  *(_QWORD *)(v12 + 24) = v17;
  *(_QWORD *)(v12 + 32) = v18;
  *(_BYTE *)(v12 + 40) = v19;
  v20 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 16))((*(unsigned __int8 *)(v20 + 80) + 41 + v12) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), (*(unsigned __int8 *)(v20 + 80) + 41 + v13) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

uint64_t sub_23A6DF568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23A6DF2FC(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23A6DF3E4(v8, v9);
  v10 = a1 & 0xFFFFFFFFFFFFFFF8;
  v11 = a2 & 0xFFFFFFFFFFFFFFF8;
  v12 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  LOBYTE(v6) = *(_BYTE *)(v11 + 24);
  sub_23A6DF2FC(v12, v6);
  v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 16);
  v14 = *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF8) + 24);
  *(_QWORD *)(v10 + 16) = v12;
  *(_BYTE *)(v10 + 24) = v6;
  sub_23A6DF3E4(v13, v14);
  v15 = *(_QWORD *)(v11 + 32);
  LOBYTE(v6) = *(_BYTE *)(v11 + 40);
  sub_23A6DF308(v15, v6);
  v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 32);
  v17 = *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF8) + 40);
  *(_QWORD *)(v10 + 32) = v15;
  *(_BYTE *)(v10 + 40) = v6;
  sub_23A6DF3F0(v16, v17);
  *(_QWORD *)(v10 + 48) = *(_QWORD *)(v11 + 48);
  swift_retain();
  swift_release();
  v18 = ((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8;
  v19 = (v11 + 63) & 0xFFFFFFFFFFFFFFF8;
  v20 = *(_QWORD *)v19;
  v21 = *(_QWORD *)(v19 + 8);
  v22 = *(_QWORD *)(v19 + 16);
  v23 = *(_QWORD *)(v19 + 24);
  v24 = *(_QWORD *)(v19 + 32);
  v25 = *(_BYTE *)(v19 + 40);
  sub_23A6DF314(*(_QWORD *)v19, v21, v22, v23, v24, v25);
  v26 = *(_QWORD *)v18;
  v27 = *(_QWORD *)(v18 + 8);
  v28 = *(_QWORD *)(v18 + 16);
  v29 = *(_QWORD *)(v18 + 24);
  v30 = *(_QWORD *)(v18 + 32);
  *(_QWORD *)v18 = v20;
  *(_QWORD *)(v18 + 8) = v21;
  *(_QWORD *)(v18 + 16) = v22;
  *(_QWORD *)(v18 + 24) = v23;
  *(_QWORD *)(v18 + 32) = v24;
  v31 = *(_BYTE *)(v18 + 40);
  *(_BYTE *)(v18 + 40) = v25;
  sub_23A6DF3FC(v26, v27, v28, v29, v30, v31);
  v32 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v32 + 24))((*(unsigned __int8 *)(v32 + 80) + 41 + v18) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80), (*(unsigned __int8 *)(v32 + 80) + 41 + v19) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
  return a1;
}

uint64_t sub_23A6DF6D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = a1 & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  *(_BYTE *)(v4 + 24) = *(_BYTE *)((a2 & 0xFFFFFFFFFFFFFFF8) + 24);
  *(_QWORD *)(v4 + 16) = v5;
  v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(_BYTE *)(v4 + 40) = *(_BYTE *)((a2 & 0xFFFFFFFFFFFFFFF8) + 40);
  *(_QWORD *)(v4 + 32) = v6;
  *(_QWORD *)(v4 + 48) = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 48);
  v7 = (_OWORD *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  v8 = (__int128 *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8);
  v9 = *v8;
  v10 = v8[1];
  *(_OWORD *)((char *)v7 + 25) = *(__int128 *)((char *)v8 + 25);
  *v7 = v9;
  v7[1] = v10;
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 32))(((unint64_t)v7 + *(unsigned __int8 *)(v11 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v11 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

uint64_t sub_23A6DF778(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  char v27;
  uint64_t v28;

  v4 = a2;
  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23A6DF3E4(v8, v9);
  v10 = a1 & 0xFFFFFFFFFFFFFFF8;
  v4 = (uint64_t *)((unint64_t)v4 & 0xFFFFFFFFFFFFFFF8);
  v11 = *((_BYTE *)v4 + 24);
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 16);
  v13 = *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF8) + 24);
  *(_QWORD *)(v10 + 16) = v4[2];
  *(_BYTE *)(v10 + 24) = v11;
  sub_23A6DF3E4(v12, v13);
  v14 = *((_BYTE *)v4 + 40);
  v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 32);
  v16 = *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF8) + 40);
  *(_QWORD *)(v10 + 32) = v4[4];
  *(_BYTE *)(v10 + 40) = v14;
  sub_23A6DF3F0(v15, v16);
  *(_QWORD *)(v10 + 48) = v4[6];
  swift_release();
  v17 = ((unint64_t)v4 + 63) & 0xFFFFFFFFFFFFFFF8;
  v18 = *(_QWORD *)(v17 + 32);
  v19 = *(_BYTE *)(v17 + 40);
  v20 = ((a1 & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8;
  v21 = *(_QWORD *)v20;
  v22 = *(_QWORD *)(v20 + 8);
  v23 = *(_QWORD *)(v20 + 16);
  v24 = *(_QWORD *)(v20 + 24);
  v25 = *(_QWORD *)(v20 + 32);
  v26 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)v20 = *(_OWORD *)v17;
  *(_OWORD *)(v20 + 16) = v26;
  *(_QWORD *)(v20 + 32) = v18;
  v27 = *(_BYTE *)(v20 + 40);
  *(_BYTE *)(v20 + 40) = v19;
  sub_23A6DF3FC(v21, v22, v23, v24, v25, v27);
  v28 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v28 + 40))((*(unsigned __int8 *)(v28 + 80) + 41 + v20) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80), (*(unsigned __int8 *)(v28 + 80) + 41 + v17) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80));
  return a1;
}

uint64_t sub_23A6DF878(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 97) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      v15 = a1 & 0xFFFFFFFFFFFFFFF8;
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((((v15 + 63) & 0xFFFFFFFFFFFFFFF8) + v7 + 41) & ~v7);
      v16 = *(_QWORD *)(v15 + 48);
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_23A6DF94C + 4 * byte_23A70EA28[(v9 - 1)]))();
}

void sub_23A6DF9C8(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 97) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for PresentationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PresentationView);
}

uint64_t sub_23A6DFBD4()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_23A6DFC08@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  char v26;
  char v27;
  char v28;
  __n128 result;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _BYTE v42[7];
  __n128 v43;
  _BYTE v44[25];
  _BYTE v45[7];
  char v46;
  char v47;
  char v48;

  v6 = type metadata accessor for PresentationViewModel.Identity(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath();
  v48 = 0;
  v10 = swift_getKeyPath();
  v47 = 0;
  v11 = swift_getKeyPath();
  v46 = 0;
  v12 = a2[1];
  v43 = *(__n128 *)a2;
  *(_OWORD *)v44 = v12;
  *(_OWORD *)&v44[9] = *(_OWORD *)((char *)a2 + 25);
  swift_retain();
  v38 = sub_23A7008E0();
  swift_retain();
  v37 = sub_23A70D1A4();
  v36 = sub_23A70D2AC();
  if (qword_2569AF2E8 != -1)
    swift_once();
  v13 = sub_23A70D0E4();
  __swift_project_value_buffer(v13, (uint64_t)qword_2569B4540);
  swift_retain_n();
  v14 = sub_23A70D0CC();
  v15 = sub_23A70D57C();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v34 = v10;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v33 = v11;
    v19 = v18;
    v35 = KeyPath;
    *(_DWORD *)v17 = 136315138;
    v41 = v18;
    v32[1] = v17 + 4;
    sub_23A6E13DC(a1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity, (uint64_t)v8);
    v20 = (uint64_t *)&v8[*(int *)(v6 + 20)];
    v21 = v20[1];
    v39 = *v20;
    v40 = v21;
    swift_bridgeObjectRetain();
    sub_23A70D468();
    sub_23A70CFF4();
    sub_23A6E1420(&qword_2569AF600, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    sub_23A70D7C8();
    sub_23A70D468();
    swift_bridgeObjectRelease();
    v22 = v39;
    v23 = v40;
    sub_23A6E1460((uint64_t)v8);
    v39 = sub_23A6F8508(v22, v23, &v41);
    KeyPath = v35;
    sub_23A70D5F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A6DA000, v14, v15, "#PresentationView presentation: %s", v17, 0xCu);
    swift_arrayDestroy();
    v24 = v19;
    v11 = v33;
    MEMORY[0x23B85534C](v24, -1, -1);
    v25 = v17;
    v10 = v34;
    MEMORY[0x23B85534C](v25, -1, -1);

    swift_release();
  }
  else
  {

    swift_release_n();
  }
  v26 = v48;
  *(_DWORD *)(a3 + 9) = v39;
  *(_DWORD *)(a3 + 12) = *(_DWORD *)((char *)&v39 + 3);
  v27 = v47;
  *(_DWORD *)(a3 + 25) = v41;
  *(_DWORD *)(a3 + 28) = *(_DWORD *)((char *)&v41 + 3);
  v28 = v46;
  *(_DWORD *)(a3 + 41) = *(_DWORD *)v45;
  *(_DWORD *)(a3 + 44) = *(_DWORD *)&v45[3];
  result = v43;
  v30 = *(_OWORD *)v44;
  *(_OWORD *)(a3 + 81) = *(_OWORD *)&v44[9];
  *(_OWORD *)(a3 + 72) = v30;
  *(__n128 *)(a3 + 56) = result;
  *(_DWORD *)(a3 + 97) = *(_DWORD *)v42;
  *(_DWORD *)(a3 + 100) = *(_DWORD *)&v42[3];
  *(_QWORD *)a3 = KeyPath;
  *(_BYTE *)(a3 + 8) = v26;
  *(_QWORD *)(a3 + 16) = v10;
  *(_BYTE *)(a3 + 24) = v27;
  *(_QWORD *)(a3 + 32) = v11;
  *(_BYTE *)(a3 + 40) = v28;
  *(_QWORD *)(a3 + 48) = a1;
  v31 = v37;
  *(_QWORD *)(a3 + 104) = v38;
  *(_QWORD *)(a3 + 112) = v31;
  *(_BYTE *)(a3 + 120) = v36;
  return result;
}

uint64_t sub_23A6DFFA4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  ValueMetadata *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v31;
  void *v32;
  _BYTE *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, char *, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  ValueMetadata *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  void *Strong;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, char *, uint64_t);
  char *v82;
  void (*v83)(char *, uint64_t);
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t, uint64_t);
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  _QWORD v113[2];
  uint64_t v114;
  ValueMetadata *v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  ValueMetadata *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;

  v3 = v2;
  v108 = a2;
  v91 = *(_QWORD *)(a1 - 8);
  v92 = *(_QWORD *)(v91 + 64);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v90 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v5 + 16);
  v111 = *(_QWORD *)(v7 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = v10;
  v11 = *(_QWORD *)(v8 + 24);
  v119 = v7;
  v120 = (ValueMetadata *)MEMORY[0x24BEE1328];
  v12 = (ValueMetadata *)MEMORY[0x24BEE1328];
  v121 = v11;
  v122 = MEMORY[0x24BEE1340];
  v13 = v11;
  v110 = v11;
  v14 = MEMORY[0x24BEE1340];
  v15 = MEMORY[0x23B855220](0, &v119, MEMORY[0x24BDF30C8], 0);
  v100 = *(_QWORD *)(v15 - 8);
  v16 = v15;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v112 = (char *)&v85 - v17;
  v119 = v7;
  v120 = v12;
  v109 = v7;
  v121 = v13;
  v122 = v14;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v119 = v16;
  v120 = v12;
  v94 = v16;
  v121 = OpaqueTypeConformance2;
  v122 = v14;
  v19 = OpaqueTypeConformance2;
  v95 = OpaqueTypeConformance2;
  v20 = v14;
  v21 = MEMORY[0x24BDF38E8];
  v22 = MEMORY[0x23B855220](0, &v119, MEMORY[0x24BDF38E8], 0);
  v101 = *(_QWORD *)(v22 - 8);
  v23 = v22;
  v99 = v22;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v93 = (char *)&v85 - v24;
  v119 = v16;
  v120 = v12;
  v121 = v19;
  v122 = v20;
  v25 = swift_getOpaqueTypeConformance2();
  v98 = v25;
  v97 = sub_23A6E0C8C();
  v119 = v23;
  v120 = &type metadata for PropagatedSceneSettings;
  v121 = v25;
  v122 = v97;
  v26 = MEMORY[0x23B855220](0, &v119, v21, 0);
  v106 = *(_QWORD *)(v26 - 8);
  v103 = v26;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v96 = (char *)&v85 - v27;
  v105 = sub_23A70D198();
  v107 = *(_QWORD *)(v105 - 8);
  v28 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v102 = (char *)&v85 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v104 = (char *)&v85 - v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v111 + 16))(v10, v3 + *(int *)(a1 + 52), v7);
  v31 = *(_QWORD *)(v3 + 48);
  swift_getKeyPath();
  v119 = v31;
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  v32 = *(void **)(v31 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
  swift_getKeyPath();
  v119 = (uint64_t)v32;
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  v33 = v32;
  sub_23A70D00C();
  swift_release();
  LOBYTE(v21) = v33[OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting];

  LOBYTE(v119) = v21;
  v34 = v91;
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 16);
  v36 = v90;
  v85 = a1;
  v35(v90, v3, a1);
  v37 = v35;
  v88 = v35;
  v38 = *(unsigned __int8 *)(v34 + 80);
  v39 = v34;
  v40 = (v38 + 32) & ~v38;
  v86 = v40;
  v87 = v38 | 7;
  v92 += v40;
  v41 = swift_allocObject();
  v43 = v109;
  v42 = v110;
  *(_QWORD *)(v41 + 16) = v109;
  *(_QWORD *)(v41 + 24) = v42;
  v44 = *(void (**)(uint64_t, char *, uint64_t))(v39 + 32);
  v44(v41 + v40, v36, a1);
  v45 = v42;
  v46 = v89;
  sub_23A70D33C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v111 + 8))(v46, v43);
  v47 = *(_QWORD *)(v3 + 32);
  LOBYTE(v35) = *(_BYTE *)(v3 + 40);
  sub_23A6DF308(v47, (char)v35);
  LOBYTE(v40) = sub_23A6F6E34(v47, (char)v35);
  sub_23A6DF3F0(v47, (char)v35);
  LOBYTE(v119) = v40 & 1;
  v48 = v85;
  v37(v36, v3, v85);
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = v43;
  *(_QWORD *)(v49 + 24) = v45;
  v50 = v86;
  v51 = v36;
  v52 = v48;
  v44(v49 + v86, v36, v48);
  v53 = v93;
  v54 = v94;
  v55 = v112;
  sub_23A70D360();
  swift_release();
  (*(void (**)(char *, uint64_t))(v100 + 8))(v55, v54);
  v56 = *(_QWORD *)v3;
  LOBYTE(v35) = *(_BYTE *)(v3 + 8);
  sub_23A6DF2FC(*(_QWORD *)v3, (char)v35);
  sub_23A6F6FEC(v56, (char)v35, &v119);
  sub_23A6DF3E4(v56, (char)v35);
  v114 = v119;
  v88(v51, v3, v52);
  v57 = swift_allocObject();
  v58 = v110;
  *(_QWORD *)(v57 + 16) = v109;
  *(_QWORD *)(v57 + 24) = v58;
  v44(v57 + v50, v51, v52);
  v59 = v96;
  v60 = v99;
  v61 = v98;
  v62 = v97;
  sub_23A70D360();
  swift_release();
  swift_bridgeObjectRelease();
  v63 = v60;
  (*(void (**)(char *, uint64_t))(v101 + 8))(v53, v60);
  v64 = *(ValueMetadata **)(v3 + 64);
  v65 = *(_QWORD *)(v3 + 72);
  v66 = *(_QWORD *)(v3 + 80);
  v67 = *(_QWORD *)(v3 + 88);
  v68 = *(_BYTE *)(v3 + 96);
  v119 = *(_QWORD *)(v3 + 56);
  v120 = v64;
  v121 = v65;
  v122 = v66;
  v123 = v67;
  v124 = v68;
  v69 = *(_QWORD *)(v3 + 16);
  LOBYTE(v56) = *(_BYTE *)(v3 + 24);
  sub_23A6DF314(v119, (uint64_t)v64, v65, v66, v67, v68);
  sub_23A6DF2FC(v69, v56);
  sub_23A6F71C8(v69, v56, &v118);
  sub_23A6DF3E4(v69, v56);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v71 = sub_23A6E5E88();
  swift_getKeyPath();
  v114 = (uint64_t)v71;
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  sub_23A70D00C();
  swift_release();
  v72 = *(_QWORD *)(v71[3] + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver_state);
  swift_retain();

  swift_release();
  swift_getKeyPath();
  v114 = v72;
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  swift_release();
  LOBYTE(Strong) = *(_BYTE *)(v72 + 32);
  swift_release();
  v73 = *(_QWORD *)(v3 + 48);
  v114 = v63;
  v115 = &type metadata for PropagatedSceneSettings;
  v116 = v61;
  v117 = v62;
  v74 = swift_getOpaqueTypeConformance2();
  v75 = v102;
  v76 = (char)Strong;
  v77 = v103;
  sub_23A70AC68((uint64_t)&v119, &v118, v76, v73, v103, v74);
  swift_bridgeObjectRelease();
  sub_23A6DF3FC(v119, (uint64_t)v120, v121, v122, v123, v124);
  (*(void (**)(char *, uint64_t))(v106 + 8))(v59, v77);
  v78 = sub_23A6E1180();
  v113[0] = v74;
  v113[1] = v78;
  v79 = v105;
  MEMORY[0x23B855268](MEMORY[0x24BDED308], v105, v113);
  v80 = v107;
  v81 = *(void (**)(char *, char *, uint64_t))(v107 + 16);
  v82 = v104;
  v81(v104, v75, v79);
  v83 = *(void (**)(char *, uint64_t))(v80 + 8);
  v83(v75, v79);
  v81(v108, v82, v79);
  return ((uint64_t (*)(char *, uint64_t))v83)(v82, v79);
}

uint64_t sub_23A6E08CC(uint64_t a1, unsigned __int8 *a2)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  __int128 v9;

  v2 = *a2;
  if (qword_2569AF2E8 != -1)
    swift_once();
  v3 = sub_23A70D0E4();
  __swift_project_value_buffer(v3, (uint64_t)qword_2569B4540);
  v4 = sub_23A70D0CC();
  v5 = sub_23A70D57C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 67109120;
    LODWORD(v9) = v2;
    sub_23A70D5F4();
    _os_log_impl(&dword_23A6DA000, v4, v5, "#PresentationView isHosting: %{BOOL}d", v6, 8u);
    MEMORY[0x23B85534C](v6, -1, -1);
  }

  sub_23A6E1320();
  sub_23A70D138();
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = v9;
  sub_23A6F9870(v2, (uint64_t)sub_23A6E1388, v7);
  return swift_release();
}

void sub_23A6E0A44(uint64_t a1, unsigned __int8 *a2)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v2 = *a2;
  if (qword_2569AF2E8 != -1)
    swift_once();
  v3 = sub_23A70D0E4();
  __swift_project_value_buffer(v3, (uint64_t)qword_2569B4540);
  v4 = sub_23A70D0CC();
  v5 = sub_23A70D57C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 67109120;
    sub_23A70D5F4();
    _os_log_impl(&dword_23A6DA000, v4, v5, "#PresentationView drivesGeometry: %{BOOL}d", v6, 8u);
    MEMORY[0x23B85534C](v6, -1, -1);
  }

  sub_23A6F9E2C(v2);
}

uint64_t sub_23A6E0B5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v8;

  v2 = *a2;
  if (qword_2569AF2E8 != -1)
    swift_once();
  v3 = sub_23A70D0E4();
  __swift_project_value_buffer(v3, (uint64_t)qword_2569B4540);
  v4 = sub_23A70D0CC();
  v5 = sub_23A70D57C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23A6DA000, v4, v5, "#PresentationView propagatedSettings", v6, 2u);
    MEMORY[0x23B85534C](v6, -1, -1);
  }

  v8 = v2;
  return sub_23A6FA0CC(&v8);
}

uint64_t sub_23A6E0C50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_23A6E0C70()
{
  return sub_23A70D318();
}

unint64_t sub_23A6E0C8C()
{
  unint64_t result;

  result = qword_2569AF5D8;
  if (!qword_2569AF5D8)
  {
    result = MEMORY[0x23B855268](&protocol conformance descriptor for PropagatedSceneSettings, &type metadata for PropagatedSceneSettings);
    atomic_store(result, (unint64_t *)&qword_2569AF5D8);
  }
  return result;
}

uint64_t sub_23A6E0CD0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  sub_23A70D00C();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting);
  return result;
}

uint64_t sub_23A6E0D64()
{
  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  sub_23A70D000();
  return swift_release();
}

id sub_23A6E0E0C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  v4 = *(void **)(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
  *a2 = v4;
  return v4;
}

void sub_23A6E0EA4(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  v2 = v1;
  sub_23A70D000();
  swift_release();

}

uint64_t sub_23A6E0F68(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for PresentationView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return sub_23A6E08CC(a1, a2);
}

uint64_t objectdestroyTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for PresentationView(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  sub_23A6DF3E4(*(_QWORD *)v8, *(_BYTE *)(v8 + 8));
  sub_23A6DF3E4(*(_QWORD *)(v8 + 16), *(_BYTE *)(v8 + 24));
  sub_23A6DF3F0(*(_QWORD *)(v8 + 32), *(_BYTE *)(v8 + 40));
  swift_release();
  sub_23A6DF3FC(*(_QWORD *)(v8 + 56), *(_QWORD *)(v8 + 64), *(_QWORD *)(v8 + 72), *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), *(_BYTE *)(v8 + 96));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v8 + *(int *)(v6 + 52), v5);
  return swift_deallocObject();
}

void sub_23A6E109C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for PresentationView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  sub_23A6E0A44(a1, a2);
}

uint64_t sub_23A6E1108(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for PresentationView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return sub_23A6E0B5C(a1, a2);
}

unint64_t sub_23A6E1180()
{
  unint64_t result;

  result = qword_2569AF5F0;
  if (!qword_2569AF5F0)
  {
    result = MEMORY[0x23B855268](&unk_23A711B14, &type metadata for ApplySceneActivationPolicyAndSettingsViewModifer);
    atomic_store(result, (unint64_t *)&qword_2569AF5F0);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23A6E11DC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_23A6E1210(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_23A6E1220(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_23A70D78C();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_23A6E12B4(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_23A6E12D8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23A6E12F8@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_23A6E1320()
{
  unint64_t result;

  result = qword_2569AF5F8;
  if (!qword_2569AF5F8)
  {
    result = MEMORY[0x23B855268](&unk_23A710718, &_s23__Key_sceneTransitionerVN);
    atomic_store(result, (unint64_t *)&qword_2569AF5F8);
  }
  return result;
}

uint64_t sub_23A6E1364()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6E1388(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A6EF260(a1, a2, *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16));
}

uint64_t sub_23A6E1390()
{
  uint64_t v0;

  return sub_23A6E3E28(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_23A6E13AC()
{
  uint64_t v0;

  sub_23A6FB0F4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_23A6E13DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PresentationViewModel.Identity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A6E1420(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B855268](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A6E1460(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PresentationViewModel.Identity(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B8551D8](a1, v6, a5);
}

uint64_t sub_23A6E14C8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  ValueMetadata *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t OpaqueTypeConformance2;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  uint64_t v14;
  ValueMetadata *v15;
  uint64_t v16;
  unint64_t v17;

  v2 = a1[1];
  v3 = (ValueMetadata *)MEMORY[0x24BEE1328];
  v14 = *a1;
  v1 = v14;
  v15 = (ValueMetadata *)MEMORY[0x24BEE1328];
  v4 = MEMORY[0x24BEE1340];
  v16 = v2;
  v17 = MEMORY[0x24BEE1340];
  v5 = MEMORY[0x23B855220](255, &v14, MEMORY[0x24BDF30C8], 0);
  v14 = v1;
  v15 = v3;
  v16 = v2;
  v17 = v4;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v14 = v5;
  v15 = v3;
  v16 = OpaqueTypeConformance2;
  v17 = v4;
  v7 = MEMORY[0x24BDF38E8];
  v8 = MEMORY[0x23B855220](255, &v14, MEMORY[0x24BDF38E8], 0);
  v14 = v5;
  v15 = v3;
  v16 = OpaqueTypeConformance2;
  v17 = v4;
  v9 = swift_getOpaqueTypeConformance2();
  v10 = sub_23A6E0C8C();
  v14 = v8;
  v15 = &type metadata for PropagatedSceneSettings;
  v16 = v9;
  v17 = v10;
  MEMORY[0x23B855220](255, &v14, v7, 0);
  v11 = sub_23A70D198();
  v14 = v8;
  v15 = &type metadata for PropagatedSceneSettings;
  v16 = v9;
  v17 = v10;
  v13[0] = swift_getOpaqueTypeConformance2();
  v13[1] = sub_23A6E1180();
  return MEMORY[0x23B855268](MEMORY[0x24BDED308], v11, v13);
}

uint64_t sub_23A6E1614@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v18;

  v18 = a5;
  v9 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE35B8] + 8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v18 - v11;
  v14 = *v13;
  (*(void (**)(char *))(v10 + 16))((char *)&v18 - v11);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = a2;
  *((_QWORD *)v16 + 3) = v9;
  *((_QWORD *)v16 + 4) = a3;
  *((_QWORD *)v16 + 5) = a4;
  *((_QWORD *)v16 + 6) = a1;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v16[v15], v12, v9);
  swift_retain();
  View.transformSceneSettings<A>(_:_:)(v14, (uint64_t)sub_23A6E2CB0, (uint64_t)v16, a2, v14, a3);
  return swift_release();
}

uint64_t sub_23A6E1738(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v9 = *(_QWORD *)(*MEMORY[0x24BEE35B8] + *a2 + 8);
  v10 = sub_23A70D5E8();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - v11;
  v13 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v16 - v11, a3, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v12, 0, 1, v9);
  swift_retain();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF6B0);
  return SceneSettings.subscript.setter(v12, a2, v14, a6);
}

uint64_t View.sceneUnderLock(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E2A90(a1, a2, a3);
}

char *keypath_get_selector_underLock()
{
  return sel_underLock;
}

id sub_23A6E183C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_underLock);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E186C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUnderLock_, *a1);
}

uint64_t View.sceneStatusBarStyleOverridesToSuppress(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E1DF8(a1, a2, &qword_2569AF608, (uint64_t (*)(uint64_t))type metadata accessor for _UIStatusBarStyleOverrides, (uint64_t)&unk_23A70E918, a3);
}

char *keypath_get_selector_statusBarStyleOverridesToSuppress()
{
  return sel_statusBarStyleOverridesToSuppress;
}

id sub_23A6E18B0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_statusBarStyleOverridesToSuppress);
  *a2 = result;
  return result;
}

id sub_23A6E18E0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatusBarStyleOverridesToSuppress_, *a1);
}

uint64_t View.sceneDeactivationReasonMask(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E1DF8(a1, a2, &qword_2569AF610, (uint64_t (*)(uint64_t))type metadata accessor for UIApplicationSceneDeactivationReasonMask, (uint64_t)&unk_23A70E8F0, a3);
}

char *keypath_get_selector_deactivationReasons()
{
  return sel_deactivationReasons;
}

id sub_23A6E1924@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_deactivationReasons);
  *a2 = result;
  return result;
}

id sub_23A6E1954@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_deactivationReasons);
  *a2 = result;
  return result;
}

id sub_23A6E1984(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeactivationReasons_, *a1);
}

id sub_23A6E1998(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeactivationReasons_, *a1);
}

uint64_t View.sceneUserInterfaceStyle(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E1DF8(a1, a2, &qword_2569AF618, (uint64_t (*)(uint64_t))type metadata accessor for UIUserInterfaceStyle, (uint64_t)&unk_23A70E8C4, a3);
}

char *keypath_get_selector_userInterfaceStyle()
{
  return sel_userInterfaceStyle;
}

id sub_23A6E19DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_userInterfaceStyle);
  *a2 = result;
  return result;
}

id sub_23A6E1A0C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_userInterfaceStyle);
  *a2 = result;
  return result;
}

id sub_23A6E1A3C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUserInterfaceStyle_, *a1);
}

id sub_23A6E1A50(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUserInterfaceStyle_, *a1);
}

uint64_t View.sceneForcedStatusBarStyle(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;
  unint64_t v7;
  void *v9;

  KeyPath = (_QWORD *)swift_getKeyPath();
  sub_23A6E24A4(0, &qword_2569AF620);
  v9 = (void *)sub_23A70D5C4();
  v7 = sub_23A6E1B78();
  sub_23A6E1614(KeyPath, a1, a2, v7, a3);

  return swift_release();
}

char *keypath_get_selector_forcedStatusBarStyle()
{
  return sel_forcedStatusBarStyle;
}

id sub_23A6E1B2C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_forcedStatusBarStyle);
  *a2 = result;
  return result;
}

id sub_23A6E1B64(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setForcedStatusBarStyle_, *a1);
}

unint64_t sub_23A6E1B78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2569AF628;
  if (!qword_2569AF628)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569AF630);
    v2 = sub_23A6E1BF4(&qword_2569AF638, &qword_2569AF620);
    result = MEMORY[0x23B855268](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2569AF628);
  }
  return result;
}

uint64_t sub_23A6E1BF4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_23A6E24A4(255, a2);
    result = MEMORY[0x23B855268](MEMORY[0x24BEE5BE0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t View.sceneForcedStatusBarForegroundTransparent(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E2A90(a1, a2, a3);
}

char *keypath_get_selector_forcedStatusBarForegroundTransparent()
{
  return sel_forcedStatusBarForegroundTransparent;
}

id sub_23A6E1C4C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_forcedStatusBarForegroundTransparent);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E1C7C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setForcedStatusBarForegroundTransparent_, *a1);
}

uint64_t View.sceneCanShowAlerts(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E2A90(a1, a2, a3);
}

char *keypath_get_selector_canShowAlerts()
{
  return sel_canShowAlerts;
}

id sub_23A6E1CA8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_canShowAlerts);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E1CD8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCanShowAlerts_, *a1);
}

uint64_t View.sceneIdleModeEnabled(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E2A90(a1, a2, a3);
}

char *keypath_get_selector_idleModeEnabled()
{
  return sel_idleModeEnabled;
}

id sub_23A6E1D04@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_idleModeEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E1D34(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIdleModeEnabled_, *a1);
}

uint64_t View.sceneStatusBarDisabled(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E2A90(a1, a2, a3);
}

char *keypath_get_selector_statusBarDisabled()
{
  return sel_statusBarDisabled;
}

id sub_23A6E1D60@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_statusBarDisabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E1D90(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatusBarDisabled_, *a1);
}

uint64_t View.scenePeripheryInsets(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23A6E20F0(a1, a2, a3);
}

char *keypath_get_selector_peripheryInsets()
{
  return sel_peripheryInsets;
}

id sub_23A6E1DBC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_34Tm(a1, (SEL *)&selRef_peripheryInsets, a2);
}

id sub_23A6E1DC8(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_35Tm(a1, a2, a3, a4, (SEL *)&selRef_setPeripheryInsets_);
}

uint64_t View.sceneStatusBarParts(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E1DF8(a1, a2, &qword_2569AF648, (uint64_t (*)(uint64_t))type metadata accessor for _UIApplicationStatusBarPart, (uint64_t)&unk_23A70E89C, a3);
}

uint64_t sub_23A6E1DF8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t *a3@<X4>, uint64_t (*a4)(uint64_t)@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  _QWORD *KeyPath;
  uint64_t v13;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v13 = sub_23A6E1420(a3, a4, a5);
  sub_23A6E1614(KeyPath, a1, a2, v13, a6);
  return swift_release();
}

char *keypath_get_selector_statusBarParts()
{
  return sel_statusBarParts;
}

id sub_23A6E1EA4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_statusBarParts);
  *a2 = result;
  return result;
}

id sub_23A6E1ED4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatusBarParts_, *a1);
}

uint64_t View.sceneStatusBarAvoidanceFrame(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;
  uint64_t v7;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v7 = sub_23A6E1420(&qword_2569AF650, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD830]);
  sub_23A6E1614(KeyPath, a1, a2, v7, a3);
  return swift_release();
}

char *keypath_get_selector_statusBarAvoidanceFrame()
{
  return sel_statusBarAvoidanceFrame;
}

id sub_23A6E1FA8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*a1, sel_statusBarAvoidanceFrame);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_23A6E1FDC(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_35Tm(a1, a2, a3, a4, (SEL *)&selRef_setStatusBarAvoidanceFrame_);
}

uint64_t View.sceneStatusBarHeight(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23A6E2914(a1, a2, a3);
}

char *keypath_get_selector_statusBarHeight()
{
  return sel_statusBarHeight;
}

id sub_23A6E2000@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_statusBarHeight);
  *a2 = v4;
  return result;
}

id sub_23A6E2030(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatusBarHeight_, *a1);
}

unint64_t sub_23A6E2044()
{
  unint64_t result;

  result = qword_2569AF658;
  if (!qword_2569AF658)
  {
    result = MEMORY[0x23B855268](MEMORY[0x24BEE50E0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2569AF658);
  }
  return result;
}

uint64_t View.sceneSystemMinimumMargin(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23A6E2914(a1, a2, a3);
}

char *keypath_get_selector_systemMinimumMargin()
{
  return sel_systemMinimumMargin;
}

id sub_23A6E20A0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_systemMinimumMargin);
  *a2 = v4;
  return result;
}

id sub_23A6E20D0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSystemMinimumMargin_, *a1);
}

uint64_t View.sceneSafeAreaInsets(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23A6E20F0(a1, a2, a3);
}

uint64_t sub_23A6E20F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;
  uint64_t v7;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v7 = sub_23A6E1420(&qword_2569AF640, (uint64_t (*)(uint64_t))type metadata accessor for UIEdgeInsets, MEMORY[0x24BEBCBA8]);
  sub_23A6E1614(KeyPath, a1, a2, v7, a3);
  return swift_release();
}

char *keypath_get_selector_safeAreaInsetsPortrait()
{
  return sel_safeAreaInsetsPortrait;
}

id sub_23A6E21AC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_34Tm(a1, (SEL *)&selRef_safeAreaInsetsPortrait, a2);
}

id keypath_get_34Tm@<X0>(id *a1@<X0>, SEL *a2@<X3>, _QWORD *a3@<X8>)
{
  id result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(*a1, *a2);
  *a3 = v5;
  a3[1] = v6;
  a3[2] = v7;
  a3[3] = v8;
  return result;
}

id sub_23A6E21E8(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_35Tm(a1, a2, a3, a4, (SEL *)&selRef_setSafeAreaInsetsPortrait_);
}

id keypath_set_35Tm(double *a1, id *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*a2, *a5, *a1, a1[1], a1[2], a1[3]);
}

uint64_t View.sceneHomeAffordanceOverlayAllowance(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23A6E2914(a1, a2, a3);
}

char *keypath_get_selector_homeAffordanceOverlayAllowance()
{
  return sel_homeAffordanceOverlayAllowance;
}

id sub_23A6E2220@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_homeAffordanceOverlayAllowance);
  *a2 = v4;
  return result;
}

id sub_23A6E2250(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHomeAffordanceOverlayAllowance_, *a1);
}

uint64_t View.sceneDeviceOrientation(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E1DF8(a1, a2, &qword_2569AF660, (uint64_t (*)(uint64_t))type metadata accessor for BSDeviceOrientation, (uint64_t)&unk_23A70E874, a3);
}

char *keypath_get_selector_deviceOrientation()
{
  return sel_deviceOrientation;
}

id sub_23A6E2294@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_deviceOrientation);
  *a2 = result;
  return result;
}

id sub_23A6E22C4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeviceOrientation_, *a1);
}

uint64_t View.sceneArtworkSubtype(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E25B8(a1, a2, MEMORY[0x24BEE1788], a3);
}

char *keypath_get_selector_artworkSubtype()
{
  return sel_artworkSubtype;
}

id sub_23A6E22F8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_artworkSubtype);
  *a2 = result;
  return result;
}

id sub_23A6E2328(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setArtworkSubtype_, *a1);
}

uint64_t View.sceneCornerRadiusConfiguration(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *KeyPath;
  unint64_t v9;
  id v10;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v9 = sub_23A6E2428();
  v10 = a1;
  sub_23A6E1614(KeyPath, a2, a3, v9, a4);

  return swift_release();
}

char *keypath_get_selector_cornerRadiusConfiguration()
{
  return sel_cornerRadiusConfiguration;
}

id sub_23A6E23DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_cornerRadiusConfiguration);
  *a2 = result;
  return result;
}

id sub_23A6E2414(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCornerRadiusConfiguration_, *a1);
}

unint64_t sub_23A6E2428()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2569AF668;
  if (!qword_2569AF668)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569AF670);
    v2 = sub_23A6E1BF4(&qword_2569AF678, &qword_2569AF680);
    result = MEMORY[0x23B855268](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2569AF668);
  }
  return result;
}

uint64_t sub_23A6E24A4(uint64_t a1, unint64_t *a2)
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

uint64_t View.sceneHostContextIdentifierForSnapshotting(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;

  KeyPath = (_QWORD *)swift_getKeyPath();
  sub_23A6E1614(KeyPath, a1, a2, MEMORY[0x24BEE4510], a3);
  return swift_release();
}

char *keypath_get_selector_hostContextIdentifierForSnapshotting()
{
  return sel_hostContextIdentifierForSnapshotting;
}

id sub_23A6E2560@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_hostContextIdentifierForSnapshotting);
  *a2 = (_DWORD)result;
  return result;
}

id sub_23A6E2590(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHostContextIdentifierForSnapshotting_, *a1);
}

uint64_t View.scenePresenterRenderIdentifierForSnapshotting(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E25B8(a1, a2, MEMORY[0x24BEE4588], a3);
}

uint64_t sub_23A6E25B8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  _QWORD *KeyPath;

  KeyPath = (_QWORD *)swift_getKeyPath();
  sub_23A6E1614(KeyPath, a1, a2, a3, a4);
  return swift_release();
}

char *keypath_get_selector_scenePresenterRenderIdentifierForSnapshotting()
{
  return sel_scenePresenterRenderIdentifierForSnapshotting;
}

id sub_23A6E2640@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_scenePresenterRenderIdentifierForSnapshotting);
  *a2 = result;
  return result;
}

id sub_23A6E2670(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScenePresenterRenderIdentifierForSnapshotting_, *a1);
}

uint64_t View.sceneAccessibilityContrast(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E1DF8(a1, a2, &qword_2569AF688, (uint64_t (*)(uint64_t))type metadata accessor for UIAccessibilityContrast, (uint64_t)&unk_23A70E848, a3);
}

char *keypath_get_selector_accessibilityContrast()
{
  return sel_accessibilityContrast;
}

id sub_23A6E26B4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_accessibilityContrast);
  *a2 = result;
  return result;
}

id sub_23A6E26E4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAccessibilityContrast_, *a1);
}

uint64_t View.sceneScreenReferenceDisplayModeStatus(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E1DF8(a1, a2, &qword_2569AF690, (uint64_t (*)(uint64_t))type metadata accessor for ReferenceDisplayModeStatus, (uint64_t)&unk_23A70E81C, a3);
}

char *keypath_get_selector_screenReferenceDisplayModeStatus()
{
  return sel_screenReferenceDisplayModeStatus;
}

id sub_23A6E2728@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_screenReferenceDisplayModeStatus);
  *a2 = result;
  return result;
}

id sub_23A6E2758@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_screenReferenceDisplayModeStatus);
  *a2 = result;
  return result;
}

id sub_23A6E2788(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScreenReferenceDisplayModeStatus_, *a1);
}

id sub_23A6E279C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScreenReferenceDisplayModeStatus_, *a1);
}

uint64_t View.sceneEnhancedWindowingEnabled(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E2A90(a1, a2, a3);
}

char *keypath_get_selector_enhancedWindowingEnabled()
{
  return sel_enhancedWindowingEnabled;
}

id sub_23A6E27C8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_enhancedWindowingEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E27F8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_enhancedWindowingEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E2828(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEnhancedWindowingEnabled_, *a1);
}

id sub_23A6E283C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEnhancedWindowingEnabled_, *a1);
}

uint64_t View.sceneHostReferenceAngleMode(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E1DF8(a1, a2, &qword_2569AF698, (uint64_t (*)(uint64_t))type metadata accessor for UISSystemReferenceAngleMode, (uint64_t)&unk_23A70E7F4, a3);
}

char *keypath_get_selector_hostReferenceAngleMode()
{
  return sel_hostReferenceAngleMode;
}

id sub_23A6E2880@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_hostReferenceAngleMode);
  *a2 = result;
  return result;
}

id sub_23A6E28B0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_hostReferenceAngleMode);
  *a2 = result;
  return result;
}

id sub_23A6E28E0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHostReferenceAngleMode_, *a1);
}

id sub_23A6E28F4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHostReferenceAngleMode_, *a1);
}

uint64_t View.sceneAngleFromHostReferenceUprightDirection(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23A6E2914(a1, a2, a3);
}

uint64_t sub_23A6E2914@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;
  unint64_t v7;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v7 = sub_23A6E2044();
  sub_23A6E1614(KeyPath, a1, a2, v7, a3);
  return swift_release();
}

char *keypath_get_selector_angleFromHostReferenceUprightDirection()
{
  return sel_angleFromHostReferenceUprightDirection;
}

id sub_23A6E29A0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_angleFromHostReferenceUprightDirection);
  *a2 = v4;
  return result;
}

id sub_23A6E29D0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_angleFromHostReferenceUprightDirection);
  *a2 = v4;
  return result;
}

id sub_23A6E2A00(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAngleFromHostReferenceUprightDirection_, *a1);
}

id sub_23A6E2A14(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAngleFromHostReferenceUprightDirection_, *a1);
}

uint64_t View.sceneInLiveResize(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E2A90(a1, a2, a3);
}

char *keypath_get_selector_inLiveResize()
{
  return sel_inLiveResize;
}

id sub_23A6E2A40@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_inLiveResize);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E2A70(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInLiveResize_, *a1);
}

uint64_t View.sceneIsCapturingContentForAdditionalRenderingDestination(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E2A90(a1, a2, a3);
}

uint64_t sub_23A6E2A90@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;

  KeyPath = (_QWORD *)swift_getKeyPath();
  sub_23A6E1614(KeyPath, a1, a2, MEMORY[0x24BEE1340], a3);
  return swift_release();
}

char *keypath_get_selector_isCapturingContentForAdditionalRenderingDestination()
{
  return sel_isCapturingContentForAdditionalRenderingDestination;
}

id sub_23A6E2B10@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isCapturingContentForAdditionalRenderingDestination);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E2B40@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isCapturingContentForAdditionalRenderingDestination);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E2B70(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsCapturingContentForAdditionalRenderingDestination_, *a1);
}

id sub_23A6E2B84(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsCapturingContentForAdditionalRenderingDestination_, *a1);
}

uint64_t sub_23A6E2B98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569AF6A0);
  v2 = sub_23A70D198();
  v4[0] = v1;
  v4[1] = sub_23A6E2BF8();
  return MEMORY[0x23B855268](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_23A6E2BF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569AF6A8;
  if (!qword_2569AF6A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569AF6A0);
    result = MEMORY[0x23B855268](MEMORY[0x24BDF1248], v1);
    atomic_store(result, (unint64_t *)&qword_2569AF6A8);
  }
  return result;
}

uint64_t sub_23A6E2C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A6E2CB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 80);
  return sub_23A6E1738(a1, *(uint64_t **)(v1 + 48), v1 + ((v2 + 56) & ~v2), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_23A6E2CE4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void sub_23A6E2D10()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = __CFADD__(v1, v2);
  v4 = v1 + v2;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 40) = v4;
    if (v2 < v4)
    {
      sub_23A70D6D8();
      swift_bridgeObjectRelease();
      sub_23A70D7C8();
      sub_23A70D468();
      swift_bridgeObjectRelease();
      sub_23A70D468();
      sub_23A70D7C8();
      sub_23A70D468();
      swift_bridgeObjectRelease();
      sub_23A70D468();
      sub_23A6E3340();
      swift_allocError();
      *v5 = 0xD00000000000001ALL;
      v5[1] = 0x800000023A717550;
      swift_willThrow();
    }
  }
}

void sub_23A6E2E68(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[6];

  if ((objc_msgSend(a1, sel_isActive) & 1) == 0)
  {
    sub_23A6E2D10();
    if (v4)
    {
      v8 = v4;
      v9 = objc_msgSend(a1, sel_identifier);
      v10 = sub_23A70D444();
      v12 = v11;

      sub_23A6E3244();
      swift_allocError();
      *v13 = v4;
      v13[1] = v10;
      v13[2] = v12;
      swift_willThrow();

    }
    else
    {
      v14 = (_QWORD *)swift_allocObject();
      v14[2] = a2;
      v14[3] = a3;
      v14[4] = a1;
      v14[5] = v3;
      v15 = qword_2569AF2E8;
      swift_retain();
      v16 = a1;
      swift_retain();
      if (v15 != -1)
        swift_once();
      v17 = sub_23A70D0E4();
      __swift_project_value_buffer(v17, (uint64_t)qword_2569B4540);
      v18 = sub_23A70D0CC();
      v19 = sub_23A70D57C();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_23A6DA000, v18, v19, "#CappedSceneActivationPolicyModel activate", v20, 2u);
        MEMORY[0x23B85534C](v20, -1, -1);
      }

      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = sub_23A6E32BC;
      *(_QWORD *)(v21 + 24) = v14;
      v23[4] = sub_23A6DEC58;
      v23[5] = v21;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 1107296256;
      v23[2] = sub_23A6E30E4;
      v23[3] = &block_descriptor_0;
      v22 = _Block_copy(v23);
      swift_retain();
      swift_release();
      objc_msgSend(v16, sel_activate_, v22);
      _Block_release(v22);
      swift_release_n();
    }
  }
}

uint64_t sub_23A6E30C4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_23A6E30E4(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_23A6E3118()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CappedSceneActivationPolicyModel()
{
  return objc_opt_self();
}

void sub_23A6E315C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23A6E2E68(a1, a2, a3);
}

uint64_t sub_23A6E317C()
{
  return sub_23A70D7C8();
}

BOOL sub_23A6E31C0(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 32) == *(_QWORD *)(*(_QWORD *)a2 + 32);
}

unint64_t sub_23A6E31DC(uint64_t a1)
{
  unint64_t result;

  result = sub_23A6E3200();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23A6E3200()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569AF768;
  if (!qword_2569AF768)
  {
    v1 = type metadata accessor for CappedSceneActivationPolicyModel();
    result = MEMORY[0x23B855268](&unk_23A70F424, v1);
    atomic_store(result, (unint64_t *)&qword_2569AF768);
  }
  return result;
}

unint64_t sub_23A6E3244()
{
  unint64_t result;

  result = qword_2569AF770;
  if (!qword_2569AF770)
  {
    result = MEMORY[0x23B855268](&protocol conformance descriptor for SceneActivationPolicyError, &type metadata for SceneActivationPolicyError);
    atomic_store(result, (unint64_t *)&qword_2569AF770);
  }
  return result;
}

uint64_t sub_23A6E3288()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6E32BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v3, a1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, a1);
}

uint64_t sub_23A6E3308()
{
  return swift_deallocObject();
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

uint64_t sub_23A6E3330(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_23A6E3340()
{
  unint64_t result;

  result = qword_2569AF778;
  if (!qword_2569AF778)
  {
    result = MEMORY[0x23B855268](&unk_23A70F4D0, &type metadata for CappedSceneActivationPolicyModel.CappedInhibitorError);
    atomic_store(result, (unint64_t *)&qword_2569AF778);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for CappedSceneActivationPolicyModel.CappedInhibitorError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CappedSceneActivationPolicyModel.CappedInhibitorError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for CappedSceneActivationPolicyModel.CappedInhibitorError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for CappedSceneActivationPolicyModel.CappedInhibitorError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CappedSceneActivationPolicyModel.CappedInhibitorError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CappedSceneActivationPolicyModel.CappedInhibitorError(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CappedSceneActivationPolicyModel.CappedInhibitorError()
{
  return &type metadata for CappedSceneActivationPolicyModel.CappedInhibitorError;
}

uint64_t sub_23A6E34C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v18;

  v18 = a5;
  v9 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE35B8] + 8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v18 - v11;
  v14 = *v13;
  (*(void (**)(char *))(v10 + 16))((char *)&v18 - v11);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = a2;
  *((_QWORD *)v16 + 3) = v9;
  *((_QWORD *)v16 + 4) = a3;
  *((_QWORD *)v16 + 5) = a4;
  *((_QWORD *)v16 + 6) = a1;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v16[v15], v12, v9);
  swift_retain();
  View.transformSceneSettings<A>(_:_:)(v14, (uint64_t)sub_23A6E3D90, (uint64_t)v16, a2, v14, a3);
  return swift_release();
}

uint64_t sub_23A6E35E4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v9 = *(_QWORD *)(*MEMORY[0x24BEE35B8] + *a2 + 8);
  v10 = sub_23A70D5E8();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - v11;
  v13 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v16 - v11, a3, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v12, 0, 1, v9);
  swift_retain();
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF7B0);
  return SceneSettings.subscript.setter(v12, a2, v14, a6);
}

uint64_t View.isSceneForeground(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;

  KeyPath = (_QWORD *)swift_getKeyPath();
  sub_23A6E34C0(KeyPath, a1, a2, MEMORY[0x24BEE1340], a3);
  return swift_release();
}

char *keypath_get_selector_isForeground()
{
  return sel_isForeground;
}

id sub_23A6E3754@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isForeground);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A6E3784(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setForeground_, *a1);
}

uint64_t View.sceneDisplayConfiguration(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *KeyPath;
  unint64_t v9;
  id v10;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v9 = sub_23A6E38A4();
  v10 = a1;
  sub_23A6E34C0(KeyPath, a2, a3, v9, a4);

  return swift_release();
}

id sub_23A6E382C()
{
  void *v0;

  return objc_msgSend(v0, sel_displayConfiguration);
}

id sub_23A6E3850@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_displayConfiguration);
  *a2 = result;
  return result;
}

_QWORD *sub_23A6E3888(_QWORD *result, id *a2)
{
  if (*result)
    return objc_msgSend(*a2, sel_setDisplayConfiguration_);
  return result;
}

unint64_t sub_23A6E38A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2569AF780;
  if (!qword_2569AF780)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569AF788);
    v2 = sub_23A6E1420(&qword_2569AF790, (uint64_t (*)(uint64_t))sub_23A6E3920, MEMORY[0x24BEE5BE0]);
    result = MEMORY[0x23B855268](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2569AF780);
  }
  return result;
}

unint64_t sub_23A6E3920()
{
  unint64_t result;

  result = qword_2569AF798;
  if (!qword_2569AF798)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569AF798);
  }
  return result;
}

uint64_t View.sceneLevel(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;
  unint64_t v7;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v7 = sub_23A6E2044();
  sub_23A6E34C0(KeyPath, a1, a2, v7, a3);
  return swift_release();
}

char *keypath_get_selector_level()
{
  return sel_level;
}

id sub_23A6E39EC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_level);
  *a2 = v4;
  return result;
}

id sub_23A6E3A1C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLevel_, *a1);
}

uint64_t View.sceneFrame(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *KeyPath;
  uint64_t v7;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v7 = sub_23A6E1420(&qword_2569AF650, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD830]);
  sub_23A6E34C0(KeyPath, a1, a2, v7, a3);
  return swift_release();
}

char *keypath_get_selector_frame()
{
  return sel_frame;
}

id sub_23A6E3AF0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*a1, sel_frame);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_23A6E3B24(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFrame_, *a1, a1[1], a1[2], a1[3]);
}

uint64_t View.sceneInterfaceOrientation(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E3BD4(a1, a2, &qword_2569AF7A0, (uint64_t (*)(uint64_t))type metadata accessor for BSInterfaceOrientation, (uint64_t)&unk_23A70E7CC, a3);
}

char *keypath_get_selector_interfaceOrientation()
{
  return sel_interfaceOrientation;
}

id sub_23A6E3B6C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_interfaceOrientation);
  *a2 = result;
  return result;
}

id sub_23A6E3B9C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInterfaceOrientation_, *a1);
}

uint64_t View.sceneInterruptionPolicy(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23A6E3BD4(a1, a2, &qword_2569AF7A8, (uint64_t (*)(uint64_t))type metadata accessor for FBSSceneInterruptionPolicy, (uint64_t)&unk_23A70E7A4, a3);
}

uint64_t sub_23A6E3BD4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t *a3@<X4>, uint64_t (*a4)(uint64_t)@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  _QWORD *KeyPath;
  uint64_t v13;

  KeyPath = (_QWORD *)swift_getKeyPath();
  v13 = sub_23A6E1420(a3, a4, a5);
  sub_23A6E34C0(KeyPath, a1, a2, v13, a6);
  return swift_release();
}

char *keypath_get_selector_interruptionPolicy()
{
  return sel_interruptionPolicy;
}

id sub_23A6E3C80@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_interruptionPolicy);
  *a2 = result;
  return result;
}

id sub_23A6E3CB0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInterruptionPolicy_, *a1);
}

uint64_t sub_23A6E3CC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569AF6A0);
  v2 = sub_23A70D198();
  v4[0] = v1;
  v4[1] = sub_23A6E2BF8();
  return MEMORY[0x23B855268](MEMORY[0x24BDED308], v2, v4);
}

uint64_t sub_23A6E3D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A6E3D90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 80);
  return sub_23A6E35E4(a1, *(uint64_t **)(v1 + 48), v1 + ((v2 + 56) & ~v2), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_23A6E3DB4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6E437C();
  sub_23A70D00C();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting);
}

uint64_t sub_23A6E3E28(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting) = a2;
  return result;
}

uint64_t sub_23A6E3E38(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t result;
  void *v6;
  void *v7;
  uint64_t KeyPath;

  swift_getKeyPath();
  sub_23A6E437C();
  sub_23A70D00C();
  swift_release();
  v3 = OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter);
  if (!v4 || (result = (uint64_t)objc_msgSend(v4, sel_isEqual_, a1), (result & 1) == 0))
  {
    if (a1)
      objc_msgSend(a1, sel_removeObserver_, v1);
    swift_getKeyPath();
    sub_23A70D00C();
    swift_release();
    v6 = *(void **)(v1 + v3);
    if (v6)
      objc_msgSend(v6, sel_addObserver_, v1);
    swift_getKeyPath();
    sub_23A70D00C();
    swift_release();
    v7 = *(void **)(v1 + v3);
    if (v7)
      objc_msgSend(v7, sel_isHosting);
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_23A70D000();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A6E3FEC()
{
  swift_getKeyPath();
  sub_23A6E437C();
  sub_23A70D00C();
  swift_release();
  return swift_unknownObjectRetain();
}

uint64_t sub_23A6E4064(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter) = a2;
  swift_unknownObjectRetain_n();
  sub_23A6E3E38(v2);
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A6E40C8()
{
  swift_getKeyPath();
  sub_23A6E437C();
  sub_23A70D000();
  return swift_release();
}

uint64_t sub_23A6E42B0()
{
  return type metadata accessor for UIPresenterObserver();
}

uint64_t type metadata accessor for UIPresenterObserver()
{
  uint64_t result;

  result = qword_2569AF860;
  if (!qword_2569AF860)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A6E42F4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70D03C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_23A6E437C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569AF8D0;
  if (!qword_2569AF8D0)
  {
    v1 = type metadata accessor for UIPresenterObserver();
    result = MEMORY[0x23B855268](&unk_23A70F6C0, v1);
    atomic_store(result, (unint64_t *)&qword_2569AF8D0);
  }
  return result;
}

uint64_t sub_23A6E43C4()
{
  return sub_23A6E40C8();
}

void sub_23A6E43E0()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting) = *(_BYTE *)(v0 + 24);
}

void sub_23A6E4400()
{
  sub_23A6E43E0();
}

uint64_t sub_23A6E4414(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[6];

  result = (uint64_t)objc_msgSend(a1, sel_isActive);
  if ((result & 1) == 0)
  {
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = a1;
    v8[5] = v3;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_23A6E32BC;
    *(_QWORD *)(v9 + 24) = v8;
    v12[4] = sub_23A6DEC28;
    v12[5] = v9;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 1107296256;
    v12[2] = sub_23A6E30E4;
    v12[3] = &block_descriptor_1;
    v10 = _Block_copy(v12);
    swift_retain();
    v11 = a1;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_activate_, v10);
    _Block_release(v10);
    return swift_release_n();
  }
  return result;
}

uint64_t sub_23A6E4540()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnlimitedSceneActivationPolicyModel()
{
  return objc_opt_self();
}

uint64_t sub_23A6E4584(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A6E4414(a1, a2, a3);
}

uint64_t sub_23A6E45A4()
{
  return 1;
}

unint64_t sub_23A6E45AC(uint64_t a1)
{
  unint64_t result;

  result = sub_23A6E45D0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23A6E45D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569AF980;
  if (!qword_2569AF980)
  {
    v1 = type metadata accessor for UnlimitedSceneActivationPolicyModel();
    result = MEMORY[0x23B855268](&unk_23A70F774, v1);
    atomic_store(result, (unint64_t *)&qword_2569AF980);
  }
  return result;
}

uint64_t sub_23A6E4614()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6E4648()
{
  return swift_deallocObject();
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

uint64_t sub_23A6E4670()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for InertGeometryDriver()
{
  return objc_opt_self();
}

uint64_t sub_23A6E46A4()
{
  uint64_t AssociatedTypeWitness;
  unint64_t v1;
  unint64_t v2;
  uint64_t inited;

  AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      inited = swift_initClassMetadata2();
      if (inited)
        return inited;
      else
        return 0;
    }
  }
  return AssociatedTypeWitness;
}

uint64_t sub_23A6E477C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t (*v38)(char *, uint64_t);
  char *v39;
  _QWORD v40[2];
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;

  v1 = v0;
  v2 = *v0;
  v4 = *(_QWORD *)(v2 + 80);
  v3 = *(_QWORD *)(v2 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = sub_23A70D5E8();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v40 - v8;
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](v7);
  v44 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v40 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v45 = (char *)v40 - v16;
  v42 = v4;
  v43 = v3;
  sub_23A70D810();
  v17 = (_QWORD *)((char *)v1 + *(_QWORD *)(*v1 + 128));
  swift_beginAccess();
  v18 = swift_bridgeObjectRetain();
  v19 = MEMORY[0x23B8549A4](v18, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)((char *)v1 + *(_QWORD *)(*v1 + 120));
  if (v19 >= 1 && v20 < v19)
  {
    v22 = swift_bridgeObjectRetain();
    v23 = MEMORY[0x23B8549A4](v22, AssociatedTypeWitness);
    result = swift_bridgeObjectRelease();
    if (__OFSUB__(v23, v20))
    {
      __break(1u);
      goto LABEL_16;
    }
    swift_beginAccess();
    v25 = sub_23A70D4EC();
    MEMORY[0x23B855268](MEMORY[0x24BEE12E8], v25);
    sub_23A70D570();
    swift_endAccess();
  }
  v26 = swift_bridgeObjectRetain();
  v27 = MEMORY[0x23B8549A4](v26, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  if ((v27 & 0x8000000000000000) == 0 && v27 == v20)
  {
    v46 = *v17;
    v28 = sub_23A70D4EC();
    MEMORY[0x23B855268](MEMORY[0x24BEE12E0], v28);
    sub_23A70D564();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, AssociatedTypeWitness);
    if ((_DWORD)result != 1)
    {
      v29 = (char *)v1 + *(_QWORD *)(*v1 + 112);
      v30 = v42;
      swift_getAssociatedConformanceWitness();
      v40[1] = v29;
      sub_23A70D72C();
      v41 = *(void (**)(char *, uint64_t))(v10 + 8);
      v41(v9, AssociatedTypeWitness);
      v31 = v45;
      if ((sub_23A70D420() & 1) != 0)
      {
        v46 = 0;
        v47 = 0xE000000000000000;
        sub_23A70D6D8();
        sub_23A70D468();
        v48 = v20;
        sub_23A70D7C8();
        sub_23A70D468();
        swift_bridgeObjectRelease();
        sub_23A70D468();
        v32 = v43;
        swift_getAssociatedTypeWitness();
        sub_23A70D7E0();
        v33 = v46;
        v34 = v47;
        v36 = type metadata accessor for TimedSceneActivationPolicyModel.TimedInhibitorError(0, v30, v32, v35);
        MEMORY[0x23B855268](&unk_23A70F958, v36);
        swift_allocError();
        *v37 = v33;
        v37[1] = v34;
        swift_willThrow();
        v38 = (uint64_t (*)(char *, uint64_t))v41;
        v41(v15, AssociatedTypeWitness);
        return v38(v31, AssociatedTypeWitness);
      }
      v41(v15, AssociatedTypeWitness);
      goto LABEL_13;
    }
LABEL_16:
    __break(1u);
    return result;
  }
LABEL_13:
  v39 = v45;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v44, v45, AssociatedTypeWitness);
  swift_beginAccess();
  sub_23A70D4EC();
  sub_23A70D4E0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v39, AssociatedTypeWitness);
}

void sub_23A6E4C34(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[6];

  if ((objc_msgSend(a1, sel_isActive) & 1) == 0)
  {
    sub_23A6E477C();
    if (v4)
    {
      v8 = v4;
      v9 = objc_msgSend(a1, sel_identifier);
      v10 = sub_23A70D444();
      v12 = v11;

      sub_23A6E3244();
      swift_allocError();
      *v13 = v4;
      v13[1] = v10;
      v13[2] = v12;
      swift_willThrow();

    }
    else
    {
      v14 = (_QWORD *)swift_allocObject();
      v14[2] = a2;
      v14[3] = a3;
      v14[4] = a1;
      v14[5] = v3;
      v15 = qword_2569AF2E8;
      v16 = a1;
      swift_retain();
      if (v15 != -1)
        swift_once();
      v17 = sub_23A70D0E4();
      __swift_project_value_buffer(v17, (uint64_t)qword_2569B4540);
      v18 = sub_23A70D0CC();
      v19 = sub_23A70D57C();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_23A6DA000, v18, v19, "#TimedSceneActivationPolicyModel activate", v20, 2u);
        MEMORY[0x23B85534C](v20, -1, -1);
      }

      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = sub_23A6E32BC;
      *(_QWORD *)(v21 + 24) = v14;
      v23[4] = sub_23A6DEC28;
      v23[5] = v21;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 1107296256;
      v23[2] = sub_23A6E30E4;
      v23[3] = &block_descriptor_2;
      v22 = _Block_copy(v23);
      swift_retain();
      swift_release();
      objc_msgSend(v16, sel_activate_, v22);
      _Block_release(v22);
      swift_release_n();
    }
  }
}

uint64_t sub_23A6E4E88()
{
  sub_23A70D7C8();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  sub_23A70D468();
  swift_getAssociatedTypeWitness();
  sub_23A70D7E0();
  return 0;
}

BOOL sub_23A6E4F48(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  return (sub_23A70D42C() & 1) != 0
      && *(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 120)) == *(_QWORD *)(a2 + *(_QWORD *)(*(_QWORD *)a2 + 120));
}

uint64_t *sub_23A6E506C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;

  v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 104), *(_QWORD *)(v1 + 80));
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 112);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v2, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A6E510C()
{
  sub_23A6E506C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TimedSceneActivationPolicyModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TimedSceneActivationPolicyModel);
}

void sub_23A6E513C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23A6E4C34(a1, a2, a3);
}

uint64_t sub_23A6E515C()
{
  return sub_23A6E4E88();
}

BOOL sub_23A6E517C(uint64_t *a1, uint64_t *a2)
{
  return sub_23A6E4F48(*a1, *a2);
}

uint64_t sub_23A6E5188(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B855268](&unk_23A70F888);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A6E51B4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6E51E0()
{
  return swift_deallocObject();
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

uint64_t type metadata accessor for TimedSceneActivationPolicyModel.TimedInhibitorError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TimedSceneActivationPolicyModel.TimedInhibitorError);
}

uint64_t sub_23A6E5214()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A6E521C()
{
  return sub_23A70D180();
}

uint64_t sub_23A6E5228()
{
  unsigned __int8 v1;

  sub_23A6E5260();
  sub_23A70D1EC();
  return v1;
}

unint64_t sub_23A6E5260()
{
  unint64_t result;

  result = qword_2569AFB30;
  if (!qword_2569AFB30)
  {
    result = MEMORY[0x23B855268](&unk_23A70F9D0, &_s29__Key_sceneViewsDriveGeometryVN);
    atomic_store(result, (unint64_t *)&qword_2569AFB30);
  }
  return result;
}

ValueMetadata *_s29__Key_sceneViewsDriveGeometryVMa()
{
  return &_s29__Key_sceneViewsDriveGeometryVN;
}

id sub_23A6E52B4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  sub_23A70D00C();
  swift_release();
  return *(id *)(v0 + 24);
}

void sub_23A6E5338(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = a2;
  v3 = a2;

}

uint64_t sub_23A6E5368()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A6E5404@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A6E54A8()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  swift_bridgeObjectRetain();
  sub_23A70D000();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6E5560(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 32) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6E55C4(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  sub_23A70D00C();
  swift_release();
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  swift_beginAccess();
  sub_23A7066C8(v1);
  swift_endAccess();
  swift_release();
  swift_getKeyPath();
  sub_23A70D018();
  return swift_release();
}

uint64_t sub_23A6E56F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectUnownedDestroy();

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC12DrawingBoard9HostModel___observationRegistrar;
  v2 = sub_23A70D03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A6E5760()
{
  return type metadata accessor for HostModel();
}

uint64_t type metadata accessor for HostModel()
{
  uint64_t result;

  result = qword_2569AFB70;
  if (!qword_2569AFB70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A6E57A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70D03C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A6E5838()
{
  void *Strong;
  void *v1;
  char v2;

  sub_23A6E58A0();
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v1 = (void *)swift_unknownObjectUnownedLoadStrong();
  v2 = sub_23A70D5DC();

  return v2 & 1;
}

unint64_t sub_23A6E58A0()
{
  unint64_t result;

  result = qword_2569AFC90;
  if (!qword_2569AFC90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569AFC90);
  }
  return result;
}

uint64_t sub_23A6E58E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *Strong;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  char v42;
  uint64_t KeyPath;
  char v45;
  _QWORD v46[2];
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v7 = v6;
  v50 = a4;
  v51 = a6;
  v48 = a5;
  v49 = a3;
  v10 = sub_23A70CFF4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for PresentationViewModel.Identity(0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v46 - v18;
  v20 = *(_QWORD *)a2;
  v53 = *(unsigned int *)(a2 + 8);
  v54 = v20;
  v52 = *(unsigned __int8 *)(a2 + 12);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v22 = objc_msgSend(Strong, sel_identifier);

  v23 = sub_23A70D444();
  v25 = v24;

  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v13, v10);
  v26 = (uint64_t *)&v19[*(int *)(v14 + 20)];
  *v26 = v23;
  v26[1] = v25;
  swift_getKeyPath();
  v57 = v7;
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  v27 = *(_QWORD *)(v7 + 32);
  if (!*(_QWORD *)(v27 + 16))
    goto LABEL_12;
  swift_bridgeObjectRetain();
  v28 = sub_23A706834((uint64_t)v19);
  if ((v29 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_23A6E13DC((uint64_t)v19, (uint64_t)v17);
    swift_getKeyPath();
    v56 = v7;
    swift_retain();
    sub_23A70D00C();
    swift_release();
    v34 = *(void **)(v7 + 24);
    swift_getKeyPath();
    v56 = v7;
    v35 = v34;
    v47 = v19;
    v36 = v50;
    swift_retain();
    sub_23A70D00C();
    swift_release();
    v37 = *(void **)(v7 + 24);
    type metadata accessor for PresentationViewModel(0);
    v38 = swift_allocObject();
    v39 = v37;
    v46[1] = v7 + 32;
    v40 = v51;
    swift_retain();
    LOBYTE(v56) = v52;
    v30 = sub_23A6E6438(v7, (uint64_t)v17, v54, v53 | ((unint64_t)v52 << 32), (uint64_t)v35, v49, v36, (uint64_t)v39, v48, v40, v38);
    swift_release();

    v19 = v47;
    swift_release();

    swift_release();
    sub_23A6E13DC((uint64_t)v19, (uint64_t)v17);
    swift_getKeyPath();
    v56 = v7;
    swift_retain();
    sub_23A70D00C();
    swift_release();
    v56 = v7;
    swift_getKeyPath();
    sub_23A70D024();
    swift_release();
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v55 = *(_QWORD *)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0x8000000000000000;
    sub_23A708418(v30, (uint64_t)v17, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v7 + 32) = v55;
    swift_bridgeObjectRelease();
    sub_23A6E1460((uint64_t)v17);
    swift_endAccess();
    v56 = v7;
    swift_getKeyPath();
    sub_23A70D018();
    swift_release();
    goto LABEL_18;
  }
  v30 = *(_QWORD *)(*(_QWORD *)(v27 + 56) + 8 * v28);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v56 = v30;
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  v31 = v30 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity;
  if (*(_QWORD *)(v30 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity) != v54)
    goto LABEL_17;
  v32 = *(_DWORD *)(v31 + 8);
  if (*(_BYTE *)(v31 + 12) == 1)
  {
    if (v32)
    {
      if ((_DWORD)v53)
        v33 = v52;
      else
        v33 = 0;
      if ((v33 & 1) != 0)
        goto LABEL_18;
LABEL_17:
      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      v56 = v30;
      sub_23A70D000();
      swift_release();
      goto LABEL_18;
    }
    if ((_DWORD)v53)
      v45 = 0;
    else
      v45 = v52;
    if ((v45 & 1) == 0)
      goto LABEL_17;
  }
  else
  {
    if (v32 == (_DWORD)v53)
      v42 = v52;
    else
      v42 = 1;
    if ((v42 & 1) != 0)
      goto LABEL_17;
  }
LABEL_18:
  sub_23A6E1460((uint64_t)v19);
  return v30;
}

uint64_t sub_23A6E5E64()
{
  uint64_t result;

  result = swift_slowAlloc();
  qword_2569AFB38 = result;
  return result;
}

_QWORD *sub_23A6E5E88()
{
  void *v0;
  _QWORD *v1;
  id v2;
  id v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  if (qword_2569AF2E0 != -1)
    swift_once();
  if (objc_getAssociatedObject(v0, (const void *)qword_2569AFB38))
  {
    sub_23A70D60C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_23A6E6720((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_23A6E6768((uint64_t)v7);
    goto LABEL_10;
  }
  type metadata accessor for HostModel();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    type metadata accessor for HostModel();
    v1 = (_QWORD *)swift_allocObject();
    v2 = v0;
    v1[4] = sub_23A704E58(MEMORY[0x24BEE4AF8]);
    sub_23A70D030();
    swift_unknownObjectUnownedInit();
    v3 = objc_allocWithZone((Class)type metadata accessor for HostableSceneObserver());
    v1[3] = sub_23A6EA6F0(v2);
    objc_setAssociatedObject(v2, (const void *)qword_2569AFB38, v1, (void *)1);
    return v1;
  }
  return (_QWORD *)v5;
}

uint64_t sub_23A6E5FE4()
{
  uint64_t v0;

  return sub_23A6E5560(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23A6E6004(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;

  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  swift_unknownObjectRetain();
  sub_23A70D00C();
  swift_release();
  v8 = a2;
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  v4 = (uint64_t *)(a2 + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__eventHandlers);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v4;
  *v4 = 0x8000000000000000;
  sub_23A6E62D4(a1, a1, isUniquelyReferenced_nonNull_native, &v7, (void (*)(void))sub_23A707024, (uint64_t)&off_250B8D600, (void (*)(void))sub_23A708010);
  *v4 = v7;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v8 = a2;
  swift_getKeyPath();
  sub_23A70D018();
  return swift_release();
}

uint64_t sub_23A6E616C(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;

  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  swift_unknownObjectRetain();
  sub_23A70D00C();
  swift_release();
  v8 = a2;
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  v4 = (uint64_t *)(a2 + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__actionHandlers);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v4;
  *v4 = 0x8000000000000000;
  sub_23A6E62D4(a1, a1, isUniquelyReferenced_nonNull_native, &v7, (void (*)(void))sub_23A707030, (uint64_t)&off_250B8D5F0, (void (*)(void))sub_23A70801C);
  *v4 = v7;
  swift_bridgeObjectRelease();
  swift_endAccess();
  v8 = a2;
  swift_getKeyPath();
  sub_23A70D018();
  return swift_release();
}

uint64_t sub_23A6E62D4(uint64_t a1, uint64_t a2, char a3, _QWORD *a4, void (*a5)(void), uint64_t a6, void (*a7)(void))
{
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t result;
  unint64_t v25;
  char v26;

  v14 = (_QWORD *)*a4;
  v16 = sub_23A706804(a2);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= v19 && (a3 & 1) != 0)
    {
LABEL_7:
      v22 = (_QWORD *)*a4;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = (uint64_t *)(v22[7] + 16 * v16);
        result = swift_unknownObjectRelease();
        *v23 = a1;
        v23[1] = a6;
        return result;
      }
      return sub_23A6E63F0(v16, a2, a1, v22, a6);
    }
    if (v21 >= v19 && (a3 & 1) == 0)
    {
      a7();
      goto LABEL_7;
    }
    a5();
    v25 = sub_23A706804(a2);
    if ((v20 & 1) == (v26 & 1))
    {
      v16 = v25;
      v22 = (_QWORD *)*a4;
      if ((v20 & 1) != 0)
        goto LABEL_8;
      return sub_23A6E63F0(v16, a2, a1, v22, a6);
    }
  }
  result = sub_23A70D804();
  __break(1u);
  return result;
}

unint64_t sub_23A6E63F0(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  v5 = (_QWORD *)(a4[7] + 16 * result);
  *v5 = a3;
  v5[1] = a5;
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

uint64_t sub_23A6E6438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t Strong;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v33;

  *(_QWORD *)(a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UIPresenterObserver()), sel_init);
  *(_QWORD *)(a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__scenePresenter) = 0;
  *(_QWORD *)(a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel___uiSceneViewModel) = 0;
  sub_23A70D030();
  v15 = MEMORY[0x24BEE4AF8];
  v16 = sub_23A704FDC(MEMORY[0x24BEE4AF8]);
  v33 = a7;
  if ((v15 & 0xC000000000000000) != 0 && sub_23A70D75C())
  {
    v17 = a1;
    v18 = a2;
    v19 = sub_23A6E9B68(MEMORY[0x24BEE4AF8]);
  }
  else
  {
    v17 = a1;
    v18 = a2;
    v19 = MEMORY[0x24BEE4B08];
  }
  v20 = type metadata accessor for NullSceneActivationPolicyModel();
  v21 = swift_allocObject();
  v22 = sub_23A6E1420(&qword_2569AFC98, (uint64_t (*)(uint64_t))type metadata accessor for NullSceneActivationPolicyModel, (uint64_t)&unk_23A710A58);
  *(_QWORD *)(a11 + 16) = v16;
  *(_QWORD *)(a11 + 24) = v19;
  *(_BYTE *)(a11 + 32) = 0;
  *(_OWORD *)(a11 + 40) = 0u;
  *(_OWORD *)(a11 + 56) = 0u;
  *(_QWORD *)(a11 + 72) = 0;
  *(_BYTE *)(a11 + 80) = 4;
  *(_QWORD *)(a11 + 88) = v21;
  *(_QWORD *)(a11 + 112) = v20;
  *(_QWORD *)(a11 + 120) = v22;
  *(_QWORD *)(a11 + 128) = v17;
  sub_23A6E13DC(v18, a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity);
  v23 = a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity;
  *(_QWORD *)v23 = a3;
  *(_DWORD *)(v23 + 8) = a4;
  *(_BYTE *)(v23 + 12) = BYTE4(a4) & 1;
  *(_QWORD *)(a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_eventHandlerRegistry + 8) = &off_250B8C970;
  swift_unknownObjectUnownedInit();
  v24 = (_QWORD *)(a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_sceneEventHandler);
  *v24 = a6;
  v24[1] = v33;
  *(_QWORD *)(a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_actionHandlerRegistry + 8) = &off_250B8C958;
  swift_unknownObjectUnownedInit();
  v25 = (_QWORD *)(a11 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_sceneActionHandler);
  *v25 = a9;
  v25[1] = a10;
  Strong = swift_unknownObjectUnownedLoadStrong();
  swift_retain();
  swift_retain();
  swift_retain();
  v27 = swift_retain();
  sub_23A6E6004(v27, Strong);
  swift_unknownObjectRelease();
  swift_release();
  v28 = swift_unknownObjectUnownedLoadStrong();
  v29 = swift_retain();
  sub_23A6E616C(v29, v28);
  swift_unknownObjectRelease();
  swift_release();
  sub_23A6E1460(v18);
  return a11;
}

uint64_t sub_23A6E66DC()
{
  uint64_t v0;

  return sub_23A6FB290(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(unsigned int *)(v0 + 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32));
}

uint64_t sub_23A6E6720(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AFCA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A6E6768(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AFCA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A6E67A8()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UISceneViewRepresentableViewModel()
{
  return objc_opt_self();
}

uint64_t sub_23A6E67F4()
{
  return swift_initClassMetadata2();
}

void sub_23A6E6844(char *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  v4 = *(void **)(a3 + 32);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_5;
  }
  v9[4] = sub_23A6E6958;
  v9[5] = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A6E30E4;
  v9[3] = &block_descriptor_3;
  v5 = _Block_copy(v9);
  swift_release();
  objc_msgSend(v4, sel_modifyPresentationContext_, v5);
  _Block_release(v5);
  if ((swift_isEscapingClosureAtFileLocation() & 1) == 0)
  {
    v6 = objc_msgSend(v4, sel_presentationView);
LABEL_5:
    v7 = *(void **)&a1[qword_2569AFD68];
    *(_QWORD *)&a1[qword_2569AFD68] = v6;
    v8 = v6;

    objc_msgSend(a1, sel_setNeedsLayout);
    return;
  }
  __break(1u);
}

id sub_23A6E6958(void *a1)
{
  objc_msgSend(a1, sel_setAppearanceStyle_, 2);
  objc_msgSend(a1, sel_setClippingDisabled_, 1);
  return objc_msgSend(a1, sel_setPresentedLayerTypes_, 26);
}

id sub_23A6E69A8()
{
  uint64_t *v0;
  uint64_t v1;
  objc_class *v2;
  char *v3;
  objc_super v5;

  v1 = *v0;
  v2 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE00);
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[qword_2569AFD68] = 0;
  *(_QWORD *)&v3[qword_2569AFD70] = 0;
  *(_QWORD *)&v3[qword_2569AFD60] = v1;
  v5.receiver = v3;
  v5.super_class = v2;
  swift_retain();
  return objc_msgSendSuper2(&v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

void sub_23A6E6A34(char *a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23A6E6844(a1, a2, *v2);
}

uint64_t sub_23A6E6A40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + qword_2569AFD60) + 16))();
}

uint64_t sub_23A6E6A74()
{
  return sub_23A70D228();
}

uint64_t sub_23A6E6AB4()
{
  sub_23A6E6E64();
  return sub_23A70D288();
}

uint64_t sub_23A6E6B04()
{
  sub_23A6E6E64();
  return sub_23A70D234();
}

void sub_23A6E6B54()
{
  sub_23A6E6E64();
  sub_23A70D27C();
  __break(1u);
}

void sub_23A6E6B78(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_23A6E6EA8();
}

void sub_23A6E6B9C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  objc_super v18;

  v1 = v0;
  v18.receiver = v0;
  v18.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v18, sel_layoutSubviews);
  v2 = qword_2569AFD70;
  v3 = *(void **)&v0[qword_2569AFD70];
  v4 = qword_2569AFD68;
  v5 = *(void **)&v0[qword_2569AFD68];
  if (!v3)
  {
    if (!v5)
      return;
    goto LABEL_12;
  }
  if (!v5)
  {
LABEL_5:
    v9 = objc_msgSend(v3, sel_presenter);
    if (v9)
    {
      objc_msgSend(v9, sel_invalidate);
      swift_unknownObjectRelease();
    }
    v10 = *(void **)&v1[v2];
    if (v10)
      objc_msgSend(v10, sel_removeFromSuperview);
LABEL_9:
    v5 = *(void **)&v1[v4];
    if (!v5)
    {
      v11 = 0;
LABEL_13:
      v12 = *(void **)&v1[v2];
      *(_QWORD *)&v1[v2] = v11;
      v13 = v11;

      v14 = *(void **)&v1[v2];
      if (v14)
      {
        v15 = objc_msgSend(v14, sel_presenter);
        if (v15)
        {
          objc_msgSend(v15, sel_activate);
          swift_unknownObjectRelease();
        }
      }
      goto LABEL_16;
    }
LABEL_12:
    objc_msgSend(v1, sel_addSubview_, v5);
    v11 = *(void **)&v1[v4];
    goto LABEL_13;
  }
  v6 = v3;
  v7 = v5;
  v8 = sub_23A70D5DC();

  if ((v8 & 1) == 0)
  {
    v3 = *(void **)&v1[v2];
    if (!v3)
      goto LABEL_9;
    goto LABEL_5;
  }
LABEL_16:
  v16 = *(void **)&v1[v4];
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v17, sel_setFrame_);

  }
}

void sub_23A6E6D44(void *a1)
{
  id v1;

  v1 = a1;
  sub_23A6E6B9C();

}

void sub_23A6E6D78()
{
  sub_23A6E6F20();
}

void sub_23A6E6D94(uint64_t a1)
{
  swift_release();

}

uint64_t type metadata accessor for ContainerUIView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ContainerUIView);
}

ValueMetadata *type metadata accessor for UISceneViewRepresentable()
{
  return &type metadata for UISceneViewRepresentable;
}

uint64_t sub_23A6E6DF8()
{
  return MEMORY[0x24BDF5560];
}

unint64_t sub_23A6E6E08()
{
  unint64_t result;

  result = qword_2569AFDF8;
  if (!qword_2569AFDF8)
  {
    result = MEMORY[0x23B855268](&unk_23A70FC2C, &type metadata for UISceneViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_2569AFDF8);
  }
  return result;
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

unint64_t sub_23A6E6E64()
{
  unint64_t result;

  result = qword_2569AFE08;
  if (!qword_2569AFE08)
  {
    result = MEMORY[0x23B855268](&unk_23A70FC88, &type metadata for UISceneViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_2569AFE08);
  }
  return result;
}

void sub_23A6E6EA8()
{
  char *v0;

  *(_QWORD *)&v0[qword_2569AFD68] = 0;
  *(_QWORD *)&v0[qword_2569AFD70] = 0;

  sub_23A70D750();
  __break(1u);
}

void sub_23A6E6F20()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t PropagatedSceneSettings.init()@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_23A70D75C())
    result = sub_23A6E9B68(MEMORY[0x24BEE4AF8]);
  else
    result = MEMORY[0x24BEE4B08];
  *a1 = result;
  return result;
}

uint64_t sub_23A6E6FA4@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_23A70D75C())
    v4 = sub_23A6E9B68(MEMORY[0x24BEE4AF8]);
  else
    v4 = MEMORY[0x24BEE4B08];
  v5 = 0;
  v11 = v4;
  while (2)
  {
    switch(v5)
    {
      case 0:
        v6 = (unint64_t *)&qword_2569AFE28;
        goto LABEL_5;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        v6 = &qword_2569AFE30;
LABEL_5:
        sub_23A6E24A4(0, v6);
        v7 = **(_QWORD **)(a1 + 8 * v5);
        swift_retain();
        sub_23A6E8070(&v10, v7);
        swift_release();
        if (++v5 != 9)
          continue;
        *a2 = v11;
        for (i = 8; (unint64_t)(i - 1) < 8; --i)
        {
          sub_23A6E24A4(0, &qword_2569AFE30);
          swift_release();
        }
        if (i)
        {
          __break(1u);
LABEL_16:
          __break(1u);
          JUMPOUT(0x23A6E7144);
        }
        sub_23A6E24A4(0, (unint64_t *)&qword_2569AFE28);
        return swift_release();
      default:
        goto LABEL_16;
    }
  }
}

unint64_t PropagatedSceneSettings.init<each A>(_:)@<X0>(uint64_t **a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t result;
  uint64_t **v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_23A70D75C())
  {
    result = sub_23A6E9B68(MEMORY[0x24BEE4AF8]);
    v12 = result;
    if (!a2)
      goto LABEL_10;
  }
  else
  {
    result = MEMORY[0x24BEE4B08];
    v12 = MEMORY[0x24BEE4B08];
    if (!a2)
    {
LABEL_10:
      *a3 = result;
      return result;
    }
  }
  v7 = a1;
  v8 = a2;
  do
  {
    v9 = *v7++;
    v10 = *v9;
    swift_retain();
    sub_23A6E8070(&v11, v10);
    swift_release();
    --v8;
  }
  while (v8);
  *a3 = v12;
  do
  {
    result = swift_release();
    --a2;
  }
  while (a2);
  return result;
}

uint64_t PropagatedSceneSettings.insert<A>(_:)(uint64_t a1)
{
  uint64_t v3;

  swift_retain();
  sub_23A6E8070(&v3, a1);
  return swift_release();
}

uint64_t PropagatedSceneSettings.remove<A>(_:)()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = swift_retain();
  sub_23A6E9824(v1, v0);
  swift_release();
  return swift_release();
}

uint64_t static PropagatedSceneSettings.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_23A6E72E0(*a1, *a2);
}

uint64_t sub_23A6E72E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t i;

  v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v4)
      return sub_23A70D684();
    v7 = v5;
    v8 = a2;
    return sub_23A6E96D0(v7, v8);
  }
  if (v4)
  {
    if (a2 < 0)
      v7 = a2;
    else
      v7 = a2 & 0xFFFFFFFFFFFFFF8;
    v8 = a1;
    return sub_23A6E96D0(v7, v8);
  }
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v22 = a1 + 56;
  v9 = 1 << *(_BYTE *)(a1 + 32);
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(a1 + 56);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
  v12 = 0;
  v23 = (unint64_t)(v9 + 63) >> 6;
  v13 = a2 + 56;
  if (!v11)
    goto LABEL_22;
LABEL_20:
  v11 &= v11 - 1;
  for (i = v12; ; i = v16)
  {
    swift_retain();
    v18 = sub_23A70D408();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v13 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
    {
LABEL_42:
      swift_release();
      return 0;
    }
    v21 = ~v19;
    while ((sub_23A70D42C() & 1) == 0)
    {
      v20 = (v20 + 1) & v21;
      if (((*(_QWORD *)(v13 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
        goto LABEL_42;
    }
    result = swift_release();
    v12 = i;
    if (v11)
      goto LABEL_20;
LABEL_22:
    v14 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_47;
    }
    if (v14 >= v23)
      return 1;
    v15 = *(_QWORD *)(v22 + 8 * v14);
    v16 = v12 + 1;
    if (!v15)
    {
      v16 = v12 + 2;
      if (v12 + 2 >= v23)
        return 1;
      v15 = *(_QWORD *)(v22 + 8 * v16);
      if (!v15)
      {
        v16 = v12 + 3;
        if (v12 + 3 >= v23)
          return 1;
        v15 = *(_QWORD *)(v22 + 8 * v16);
        if (!v15)
        {
          v16 = v12 + 4;
          if (v12 + 4 >= v23)
            return 1;
          v15 = *(_QWORD *)(v22 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_37:
    v11 = (v15 - 1) & v15;
  }
  v17 = v12 + 5;
  if (v12 + 5 >= v23)
    return 1;
  v15 = *(_QWORD *)(v22 + 8 * v17);
  if (v15)
  {
    v16 = v12 + 5;
    goto LABEL_37;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v23)
      return 1;
    v15 = *(_QWORD *)(v22 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_37;
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_23A6E75E0(uint64_t *a1, uint64_t *a2)
{
  return sub_23A6E72E0(*a1, *a2);
}

uint64_t sub_23A6E75EC@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  _QWORD v12[9];

  KeyPath = swift_getKeyPath();
  v12[0] = &KeyPath;
  v10 = swift_getKeyPath();
  v12[1] = &v10;
  v9 = swift_getKeyPath();
  v12[2] = &v9;
  v8 = swift_getKeyPath();
  v12[3] = &v8;
  v7 = swift_getKeyPath();
  v12[4] = &v7;
  v6 = swift_getKeyPath();
  v12[5] = &v6;
  v5 = swift_getKeyPath();
  v12[6] = &v5;
  v4 = swift_getKeyPath();
  v12[7] = &v4;
  v3 = swift_getKeyPath();
  v12[8] = &v3;
  return sub_23A6E6FA4((uint64_t)v12, a1);
}

uint64_t sub_23A6E76F4()
{
  sub_23A6E0C8C();
  return sub_23A70D180();
}

uint64_t EnvironmentValues.propagatedSettings.getter()
{
  sub_23A6E9DCC();
  return sub_23A70D1EC();
}

uint64_t sub_23A6E7778@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_23A6E9DCC();
  result = sub_23A70D1EC();
  *a1 = v3;
  return result;
}

uint64_t sub_23A6E77C4()
{
  sub_23A6E9DCC();
  swift_bridgeObjectRetain();
  return sub_23A70D1F8();
}

uint64_t EnvironmentValues.propagatedSettings.setter()
{
  sub_23A6E9DCC();
  return sub_23A70D1F8();
}

uint64_t (*EnvironmentValues.propagatedSettings.modify(uint64_t a1))(_QWORD *a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_23A6E9DCC();
  sub_23A70D1EC();
  return sub_23A6E78A8;
}

uint64_t sub_23A6E78A8(_QWORD *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0)
    return sub_23A70D1F8();
  swift_bridgeObjectRetain();
  sub_23A70D1F8();
  return swift_bridgeObjectRelease();
}

uint64_t View.propagateSceneSettings(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getKeyPath();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_23A70D330();
  swift_release();
  return swift_release();
}

uint64_t sub_23A6E79CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF4F8);
  v3 = sub_23A70D6B4();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_23A70D5D0();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23A6E7C68()
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
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AFE40);
  v3 = sub_23A70D6B4();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v27 = (_QWORD *)(v2 + 56);
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
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v14 = v13 | (v11 << 6);
      }
      else
      {
        v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v8)
          goto LABEL_33;
        v16 = v27[v15];
        ++v11;
        if (!v16)
        {
          v11 = v15 + 1;
          if (v15 + 1 >= v8)
            goto LABEL_33;
          v16 = v27[v11];
          if (!v16)
          {
            v11 = v15 + 2;
            if (v15 + 2 >= v8)
              goto LABEL_33;
            v16 = v27[v11];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero(v27, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v27 = -1 << v26;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v27[v17];
              if (!v16)
              {
                while (1)
                {
                  v11 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v16 = v27[v11];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v11 = v17;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v11 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
      result = sub_23A70D408();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v9 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v9 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_23A6E7F44(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_23A70D5D0();
  result = sub_23A70D654();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

unint64_t sub_23A6E7FC4(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
  sub_23A70D408();
  result = sub_23A70D654();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_23A6E8070(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    swift_retain();
    v8 = sub_23A70D678();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
      swift_dynamicCast();
      *a1 = v18;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_23A70D66C();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v16 = sub_23A6E85A4(v7, result + 1);
    v20 = v16;
    if (*(_QWORD *)(v16 + 24) <= *(_QWORD *)(v16 + 16))
    {
      swift_retain();
      sub_23A6E7C68();
      v17 = v20;
    }
    else
    {
      v17 = v16;
      swift_retain();
    }
    sub_23A6E7FC4(a2, v17);
    *v3 = v17;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
  v10 = sub_23A70D408();
  v11 = -1 << *(_BYTE *)(v6 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v2;
    *v2 = 0x8000000000000000;
    v15 = swift_retain();
    sub_23A6E8994(v15, v12, isUniquelyReferenced_nonNull_native);
    *v2 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  v13 = ~v11;
  while ((sub_23A70D42C() & 1) == 0)
  {
    v12 = (v12 + 1) & v13;
    if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      goto LABEL_11;
  }
  swift_release();
  swift_bridgeObjectRelease();
  *a1 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v12);
  swift_retain();
  return 0;
}

uint64_t sub_23A6E8308(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_23A70D678();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_23A6E24A4(0, (unint64_t *)&qword_2569AFF10);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_23A70D66C();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_23A6E87A0(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_23A6E79CC();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_23A6E7F44((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_23A70D5D0();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_23A6E24A4(0, (unint64_t *)&qword_2569AFF10);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_23A70D5DC();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_23A70D5DC();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_23A6E8B10((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_23A6E85A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AFE40);
    v2 = sub_23A70D6C0();
    v14 = v2;
    sub_23A70D660();
    for (; sub_23A70D690(); ++*(_QWORD *)(v2 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
      swift_dynamicCast();
      if (*(_QWORD *)(v2 + 24) <= *(_QWORD *)(v2 + 16))
      {
        sub_23A6E7C68();
        v2 = v14;
      }
      result = sub_23A70D408();
      v4 = v2 + 56;
      v5 = -1 << *(_BYTE *)(v2 + 32);
      v6 = result & ~v5;
      v7 = v6 >> 6;
      if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
      {
        v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v9 = 0;
        v10 = (unint64_t)(63 - v5) >> 6;
        do
        {
          if (++v7 == v10 && (v9 & 1) != 0)
          {
            __break(1u);
            return result;
          }
          v11 = v7 == v10;
          if (v7 == v10)
            v7 = 0;
          v9 |= v11;
          v12 = *(_QWORD *)(v4 + 8 * v7);
        }
        while (v12 == -1);
        v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      }
      *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
      *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_23A6E87A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF4F8);
    v2 = sub_23A70D6C0();
    v14 = v2;
    sub_23A70D660();
    if (sub_23A70D690())
    {
      sub_23A6E24A4(0, (unint64_t *)&qword_2569AFF10);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_23A6E79CC();
          v2 = v14;
        }
        result = sub_23A70D5D0();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_23A70D690());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_23A6E8994(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23A6E7C68();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_23A6E8C94();
      goto LABEL_12;
    }
    sub_23A6E8FE4();
  }
  v8 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
  result = sub_23A70D408();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = ~v9;
    do
    {
      result = sub_23A70D42C();
      if ((result & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v10;
    }
    while (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v11 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * a2) = v5;
  v12 = *(_QWORD *)(v11 + 16);
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (!v13)
  {
    *(_QWORD *)(v11 + 16) = v14;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23A70D7F8();
  __break(1u);
  return result;
}

void sub_23A6E8B10(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_23A6E79CC();
  }
  else
  {
    if (v7 > v6)
    {
      sub_23A6E8E3C();
      goto LABEL_14;
    }
    sub_23A6E9294();
  }
  v8 = *v3;
  v9 = sub_23A70D5D0();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_23A6E24A4(0, (unint64_t *)&qword_2569AFF10);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_23A70D5DC();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_23A70D7F8();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_23A70D5DC();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

void *sub_23A6E8C94()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AFE40);
  v2 = *v0;
  v3 = sub_23A70D6A8();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = (void *)swift_retain();
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_23A6E8E3C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF4F8);
  v2 = *v0;
  v3 = sub_23A70D6A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A6E8FE4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  int64_t v25;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AFE40);
  v2 = sub_23A70D6B4();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
    result = swift_release();
LABEL_35:
    *v0 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v5 = v1 + 56;
  if (v4 < 64)
    v6 = ~(-1 << v4);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v1 + 56);
  v25 = (unint64_t)(v4 + 63) >> 6;
  v8 = v2 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v25)
      goto LABEL_33;
    v15 = *(_QWORD *)(v5 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v25)
        goto LABEL_33;
      v15 = *(_QWORD *)(v5 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v25)
          goto LABEL_33;
        v15 = *(_QWORD *)(v5 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v13);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
    result = sub_23A70D408();
    v18 = -1 << *(_BYTE *)(v3 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v23 = v20 == v22;
        if (v20 == v22)
          v20 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v17;
    ++*(_QWORD *)(v3 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v25)
  {
LABEL_33:
    result = swift_release_n();
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v25)
      goto LABEL_33;
    v15 = *(_QWORD *)(v5 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23A6E9294()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF4F8);
  v3 = sub_23A70D6B4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_23A70D5D0();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_23A6E950C(unint64_t result)
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
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_23A70D648();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
        v10 = sub_23A70D408() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 >= v9 && v2 >= v10)
          {
LABEL_16:
            v13 = *(_QWORD *)(v3 + 48);
            v14 = (_QWORD *)(v13 + 8 * v2);
            v15 = (_QWORD *)(v13 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v14 >= v15 + 1))
            {
              *v14 = *v15;
              v2 = v6;
            }
          }
        }
        else if (v10 >= v9 || v2 >= v10)
        {
          goto LABEL_16;
        }
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
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_23A6E96D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  char v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23A70D66C();
  if (v3 != result)
    return 0;
  v5 = 0;
  v6 = a2 + 56;
  v7 = 1 << *(_BYTE *)(a2 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    v9 &= v9 - 1;
LABEL_6:
    swift_retain();
    v11 = sub_23A70D69C();
    result = swift_release();
    if ((v11 & 1) == 0)
      return 0;
  }
  v12 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v12 >= v10)
    return 1;
  v13 = *(_QWORD *)(v6 + 8 * v12);
  ++v5;
  if (v13)
    goto LABEL_19;
  v5 = v12 + 1;
  if (v12 + 1 >= v10)
    return 1;
  v13 = *(_QWORD *)(v6 + 8 * v5);
  if (v13)
  {
LABEL_19:
    v9 = (v13 - 1) & v13;
    goto LABEL_6;
  }
  v14 = v12 + 2;
  if (v14 >= v10)
    return 1;
  v13 = *(_QWORD *)(v6 + 8 * v14);
  if (v13)
  {
    v5 = v14;
    goto LABEL_19;
  }
  while (1)
  {
    v5 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v5 >= v10)
      return 1;
    v13 = *(_QWORD *)(v6 + 8 * v5);
    ++v14;
    if (v13)
      goto LABEL_19;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_23A6E9824(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;

  v3 = *a2;
  if ((*a2 & 0xC000000000000001) != 0)
  {
    if (v3 < 0)
      v5 = *a2;
    else
      v5 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    swift_retain();
    v6 = sub_23A70D69C();
    swift_release();
    if ((v6 & 1) != 0)
    {
      v7 = sub_23A6E99E8(v5, a1, a2);
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
  v8 = sub_23A70D408();
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v3 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    goto LABEL_11;
  v11 = ~v9;
  while ((sub_23A70D42C() & 1) == 0)
  {
    v10 = (v10 + 1) & v11;
    if (((*(_QWORD *)(v3 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v14 = *a2;
  v15 = *a2;
  *a2 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_23A6E8C94();
    v14 = v15;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(v14 + 48) + 8 * v10);
  sub_23A6E950C(v10);
  *a2 = v15;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_23A6E99E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  swift_bridgeObjectRelease();
  v4 = sub_23A70D66C();
  v5 = swift_unknownObjectRetain();
  v6 = sub_23A6E85A4(v5, v4);
  v13 = v6;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
  v7 = sub_23A70D408();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    while ((sub_23A70D42C() & 1) == 0)
    {
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
      {
        swift_release();
        __break(1u);
        break;
      }
    }
    swift_release();
    v11 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v9);
    sub_23A6E950C(v9);
    if ((sub_23A70D42C() & 1) != 0)
    {
      *a3 = v13;
      return v11;
    }
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_23A6E9B68(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v1 = result;
  v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23A70D75C();
    result = swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AFE40);
      result = sub_23A70D6CC();
      v3 = result;
      v19 = v1;
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_23A70D75C();
      result = swift_bridgeObjectRelease();
      if (!v4)
        return v3;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  v19 = v1;
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return v3;
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v18 = v4;
  while ((v19 & 0xC000000000000001) != 0)
  {
    result = MEMORY[0x23B854BC0](v6, v19);
    v8 = result;
    v9 = __OFADD__(v6++, 1);
    if (v9)
      goto LABEL_25;
LABEL_17:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
    result = sub_23A70D408();
    v10 = -1 << *(_BYTE *)(v3 + 32);
    v11 = result & ~v10;
    v12 = v11 >> 6;
    v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
    v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      v15 = ~v10;
      while (1)
      {
        result = sub_23A70D42C();
        if ((result & 1) != 0)
          break;
        v11 = (v11 + 1) & v15;
        v12 = v11 >> 6;
        v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
        v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0)
        {
          v4 = v18;
          goto LABEL_22;
        }
      }
      result = swift_release();
      v4 = v18;
      if (v6 == v18)
        return v3;
    }
    else
    {
LABEL_22:
      *(_QWORD *)(v7 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v8;
      v16 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v16, 1);
      v17 = v16 + 1;
      if (v9)
        goto LABEL_26;
      *(_QWORD *)(v3 + 16) = v17;
      if (v6 == v4)
        return v3;
    }
  }
  if (v6 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_27;
  v8 = *(_QWORD *)(v19 + 32 + 8 * v6);
  result = swift_retain();
  v9 = __OFADD__(v6++, 1);
  if (!v9)
    goto LABEL_17;
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_23A6E9DCC()
{
  unint64_t result;

  result = qword_2569AFE10;
  if (!qword_2569AFE10)
  {
    result = MEMORY[0x23B855268](&unk_23A70FDBC, &_s24__Key_propagatedSettingsVN);
    atomic_store(result, (unint64_t *)&qword_2569AFE10);
  }
  return result;
}

uint64_t sub_23A6E9E10@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_23A6E9DCC();
  result = sub_23A70D1EC();
  *a1 = v3;
  return result;
}

uint64_t sub_23A6E9E60()
{
  swift_release();
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for PropagatedSceneSettings()
{
  return &type metadata for PropagatedSceneSettings;
}

uint64_t sub_23A6E9E94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569AFE18);
  v2 = sub_23A70D198();
  v4[0] = v1;
  v4[1] = sub_23A6E9EF4();
  return MEMORY[0x23B855268](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_23A6E9EF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569AFE20;
  if (!qword_2569AFE20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569AFE18);
    result = MEMORY[0x23B855268](MEMORY[0x24BDF1248], v1);
    atomic_store(result, (unint64_t *)&qword_2569AFE20);
  }
  return result;
}

ValueMetadata *_s24__Key_propagatedSettingsVMa()
{
  return &_s24__Key_propagatedSettingsVN;
}

char *keypath_get_selector_displayConfiguration()
{
  return sel_displayConfiguration;
}

id sub_23A6E9F5C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_displayConfiguration);
  *a2 = result;
  return result;
}

id sub_23A6E9FCC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_interfaceOrientation);
  *a2 = result;
  return result;
}

id sub_23A6E9FFC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInterfaceOrientation_, *a1);
}

void sub_23A6EA010(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23A70D75C();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF4F8);
      v3 = sub_23A70D6CC();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_23A70D75C();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x23B854BC0](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_23A70D5D0();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_23A6E24A4(0, (unint64_t *)&qword_2569AFF10);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_23A70D5DC();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_23A70D5DC();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_23A70D5D0();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_23A6E24A4(0, (unint64_t *)&qword_2569AFF10);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_23A70D5DC();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_23A70D5DC();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_23A6EA36C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_23A6EA374()
{
  return sub_23A6EA468();
}

uint64_t sub_23A6EA388@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6EA51C(a1, &OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__eventHandlers, a2);
}

uint64_t sub_23A6EA39C()
{
  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  swift_bridgeObjectRetain();
  sub_23A70D000();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6EA454()
{
  return sub_23A6EA468();
}

uint64_t sub_23A6EA468()
{
  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A6EA508@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6EA51C(a1, &OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__actionHandlers, a2);
}

uint64_t sub_23A6EA51C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = *a1;
  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  sub_23A70D00C();
  swift_release();
  v6 = (_QWORD *)(v5 + *a2);
  swift_beginAccess();
  *a3 = *v6;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A6EA5D0()
{
  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  swift_bridgeObjectRetain();
  sub_23A70D000();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6EA688(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v4;

  v4 = (_QWORD *)(a1 + *a3);
  swift_beginAccess();
  *v4 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

id sub_23A6EA6F0(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  objc_super v8;

  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__eventHandlers] = sub_23A708C34(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__actionHandlers] = sub_23A708C40(v3);
  v4 = v1;
  sub_23A70D030();
  *(_QWORD *)&v4[OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver_scene] = a1;
  type metadata accessor for SceneState();
  swift_allocObject();
  v5 = a1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver_state] = sub_23A6EEF64(v5);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for HostableSceneObserver();
  v6 = objc_msgSendSuper2(&v8, sel_init);
  objc_msgSend(v5, sel_addObserver_, v6);

  return v6;
}

id sub_23A6EA818()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HostableSceneObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A6EA8CC()
{
  return type metadata accessor for HostableSceneObserver();
}

uint64_t type metadata accessor for HostableSceneObserver()
{
  uint64_t result;

  result = qword_2569AFEA0;
  if (!qword_2569AFEA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A6EA910()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70D03C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_23A6EA9A8(void *a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D000();
  swift_release();
  v4 = objc_msgSend(a1, sel_uiPresentationManager);
  swift_getKeyPath();
  sub_23A70D000();
  swift_release();

  v6 = a2;
  v7 = 0u;
  v8 = 0u;
  v9 = 0;
  v10 = 0x2000000000000000;
  v11 = 0;
  v12 = 0;
  v5 = a2;
  sub_23A6EAB14((uint64_t)&v6);

}

void sub_23A6EAB14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  void (*v20)(_QWORD *);
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD v34[12];

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v24 = *(_QWORD *)(a1 + 24);
  v25 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v30 = *(id *)(v1 + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver_scene);
  v10 = objc_msgSend(v30, sel_identifier);
  v28 = sub_23A70D444();
  v29 = v11;

  swift_getKeyPath();
  v34[0] = v2;
  v31 = v8;
  v32 = v7;
  v33 = v6;
  sub_23A6EBF7C(v25, v3, v4, v24, v5, v6, v7);
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  sub_23A70D00C();
  swift_release();
  v12 = (uint64_t *)(v2 + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__eventHandlers);
  swift_beginAccess();
  v13 = *v12;
  v26 = *v12 + 64;
  v14 = 1 << *(_BYTE *)(*v12 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(*v12 + 64);
  v27 = (unint64_t)(v14 + 63) >> 6;
  swift_bridgeObjectRetain();
  v17 = 0;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v17 << 6);
      goto LABEL_5;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v21 >= v27)
      goto LABEL_21;
    v22 = *(_QWORD *)(v26 + 8 * v21);
    ++v17;
    if (!v22)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v27)
        goto LABEL_21;
      v22 = *(_QWORD *)(v26 + 8 * v17);
      if (!v22)
      {
        v17 = v21 + 2;
        if (v21 + 2 >= v27)
          goto LABEL_21;
        v22 = *(_QWORD *)(v26 + 8 * v17);
        if (!v22)
          break;
      }
    }
LABEL_20:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_5:
    v20 = *(void (**)(_QWORD *))(*(_QWORD *)(*(_QWORD *)(v13 + 56) + 16 * v19)
                                          + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_sceneEventHandler);
    v34[0] = v30;
    v34[1] = v28;
    v34[2] = v29;
    v34[3] = v25;
    v34[4] = v3;
    v34[5] = v4;
    v34[6] = v24;
    v34[7] = v5;
    v34[8] = v33;
    v34[9] = v32;
    v34[10] = v31;
    v34[11] = v9;
    swift_unknownObjectRetain();
    v20(v34);
    swift_unknownObjectRelease();
  }
  v23 = v21 + 3;
  if (v23 >= v27)
  {
LABEL_21:
    swift_bridgeObjectRelease();

    swift_release();
    sub_23A6EBFD8(v25, v3, v4, v24, v5, v33, v32);
    return;
  }
  v22 = *(_QWORD *)(v26 + 8 * v23);
  if (v22)
  {
    v17 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    v17 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v17 >= v27)
      goto LABEL_21;
    v22 = *(_QWORD *)(v26 + 8 * v17);
    ++v23;
    if (v22)
      goto LABEL_20;
  }
LABEL_23:
  __break(1u);
}

void sub_23A6EAE98(void *a1)
{
  id v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, sel_contentState);
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D000();
  swift_release();
  v2 = objc_msgSend(a1, sel_contentState);
  v3 = 0u;
  v4 = 0u;
  v5 = 0;
  v6 = 0x6000000000000000;
  v7 = 0;
  v8 = 0;
  sub_23A6EAB14((uint64_t)&v2);
}

uint64_t sub_23A6EB2F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

id sub_23A6EB300@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  swift_release();
  v4 = *(void **)(v3 + 48);
  *a2 = v4;
  return v4;
}

void sub_23A6EB38C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  v2 = v1;
  sub_23A70D000();
  swift_release();

}

void sub_23A6EB440(void *a1)
{
  id v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D000();
  swift_release();
  swift_getKeyPath();
  sub_23A70D000();
  swift_release();
  v3 = a1;
  v4 = 0u;
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = a1;
  sub_23A6EAB14((uint64_t)&v3);

}

void sub_23A6EB57C(void *a1)
{
  id v2;
  id v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  v2 = a1;
  sub_23A70D000();
  swift_release();

  v4 = a1;
  v5 = 0u;
  v6 = 0u;
  v7 = 0;
  v8 = 0x4000000000000000;
  v9 = 0;
  v10 = 0;
  v3 = v2;
  sub_23A6EAB14((uint64_t)&v4);

}

void sub_23A6EB678(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = sub_23A70D0E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569AF2E8 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2569B4540);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_retain_n();
  v9 = a2;
  v10 = sub_23A70D0CC();
  v11 = sub_23A70D594();
  if (os_log_type_enabled(v10, (os_log_type_t)v11))
  {
    v23 = v11;
    v24 = v5;
    v12 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v25 = a1;
    v26 = v22;
    *(_DWORD *)v12 = 136446466;
    type metadata accessor for PresentationViewModel(0);
    swift_retain();
    v13 = sub_23A70D450();
    v25 = sub_23A6F8508(v13, v14, &v26);
    sub_23A70D5F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    v15 = objc_msgSend(v9, sel_succinctDescription);
    if (v15)
    {
      v16 = v15;
      v17 = sub_23A70D444();
      v19 = v18;

      v25 = sub_23A6F8508(v17, v19, &v26);
      sub_23A70D5F4();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A6DA000, v10, (os_log_type_t)v23, "#action_handling %{public}s handled action %{public}s", (uint8_t *)v12, 0x16u);
      v20 = v22;
      swift_arrayDestroy();
      MEMORY[0x23B85534C](v20, -1, -1);
      MEMORY[0x23B85534C](v12, -1, -1);

      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v4);
    }
    else
    {

      __break(1u);
    }
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_23A6EB930(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  char *v29;
  void *v30;
  unsigned __int8 *v31;
  int v32;
  void (*v33)(id *__return_ptr, void *, void *);
  void *Strong;
  id v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v1 = a1;
  v44 = MEMORY[0x24BEE4B08];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_23A70D660();
    sub_23A6DD7B4();
    sub_23A6E1420((unint64_t *)&qword_2569AF4F0, (uint64_t (*)(uint64_t))sub_23A6DD7B4, MEMORY[0x24BEE5BD8]);
    result = sub_23A70D558();
    v1 = v45;
    v37 = v46;
    v3 = v47;
    v4 = v48;
    v5 = v49;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v37 = a1 + 56;
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(a1 + 56);
    result = swift_bridgeObjectRetain();
    v4 = 0;
  }
  v36 = (unint64_t)(v3 + 64) >> 6;
  v38 = v1;
  while (2)
  {
    if ((v1 & 0x8000000000000000) == 0)
    {
      if (v5)
      {
        v9 = (v5 - 1) & v5;
        v10 = __clz(__rbit64(v5)) | (v4 << 6);
        v11 = v4;
      }
      else
      {
        v13 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_58;
        if (v13 >= v36)
          goto LABEL_55;
        v14 = *(_QWORD *)(v37 + 8 * v13);
        v11 = v4 + 1;
        if (!v14)
        {
          v11 = v4 + 2;
          if (v4 + 2 >= v36)
            goto LABEL_55;
          v14 = *(_QWORD *)(v37 + 8 * v11);
          if (!v14)
          {
            v11 = v4 + 3;
            if (v4 + 3 >= v36)
              goto LABEL_55;
            v14 = *(_QWORD *)(v37 + 8 * v11);
            if (!v14)
            {
              v11 = v4 + 4;
              if (v4 + 4 >= v36)
                goto LABEL_55;
              v14 = *(_QWORD *)(v37 + 8 * v11);
              if (!v14)
              {
                v15 = v4 + 5;
                do
                {
                  if (v36 == v15)
                    goto LABEL_55;
                  v14 = *(_QWORD *)(v37 + 8 * v15++);
                }
                while (!v14);
                v11 = v15 - 1;
              }
            }
          }
        }
        v9 = (v14 - 1) & v14;
        v10 = __clz(__rbit64(v14)) + (v11 << 6);
      }
      v12 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
      if (v12)
        goto LABEL_31;
LABEL_55:
      sub_23A6EBED4();
      return v44;
    }
    if (!sub_23A70D690())
      goto LABEL_55;
    sub_23A6DD7B4();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v12 = v43;
    swift_unknownObjectRelease();
    v11 = v4;
    v9 = v5;
    if (!v12)
      goto LABEL_55;
LABEL_31:
    v41 = v11;
    v42 = v12;
    v40 = v9;
    swift_getKeyPath();
    v43 = v39;
    sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
    sub_23A70D00C();
    swift_release();
    v16 = &v39[OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__actionHandlers];
    swift_beginAccess();
    v17 = *(_QWORD *)v16;
    v18 = *(_QWORD *)v16 + 64;
    v19 = 1 << *(_BYTE *)(*(_QWORD *)v16 + 32);
    if (v19 < 64)
      v20 = ~(-1 << v19);
    else
      v20 = -1;
    v21 = v20 & *(_QWORD *)(*(_QWORD *)v16 + 64);
    v22 = (unint64_t)(v19 + 63) >> 6;
    result = swift_bridgeObjectRetain();
    v23 = 0;
    while (v21)
    {
      v24 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      v25 = v24 | (v23 << 6);
LABEL_52:
      v29 = *(char **)(*(_QWORD *)(v17 + 56) + 16 * v25);
      swift_getKeyPath();
      v43 = v29;
      sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
      swift_unknownObjectRetain();
      sub_23A70D00C();
      swift_release();
      v30 = *(void **)&v29[OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver];
      swift_getKeyPath();
      v43 = v30;
      sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
      v31 = v30;
      sub_23A70D00C();
      swift_release();
      v32 = v31[OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting];

      if (v32 == 1)
      {
        v33 = *(void (**)(id *__return_ptr, void *, void *))&v29[OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_sceneActionHandler];
        Strong = (void *)swift_unknownObjectUnownedLoadStrong();
        v33(&v43, Strong, v42);

        if (v43 != 1)
        {
          v35 = v42;
          sub_23A6E8308(&v43, v35);

          sub_23A6EB678((uint64_t)v29, v35);
          swift_release();

          result = swift_unknownObjectRelease();
          goto LABEL_9;
        }
      }
      result = swift_unknownObjectRelease();
    }
    v26 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
      goto LABEL_57;
    }
    if (v26 >= v22)
      goto LABEL_8;
    v27 = *(_QWORD *)(v18 + 8 * v26);
    ++v23;
    if (v27)
      goto LABEL_51;
    v23 = v26 + 1;
    if (v26 + 1 >= v22)
      goto LABEL_8;
    v27 = *(_QWORD *)(v18 + 8 * v23);
    if (v27)
      goto LABEL_51;
    v23 = v26 + 2;
    if (v26 + 2 >= v22)
      goto LABEL_8;
    v27 = *(_QWORD *)(v18 + 8 * v23);
    if (v27)
    {
LABEL_51:
      v21 = (v27 - 1) & v27;
      v25 = __clz(__rbit64(v27)) + (v23 << 6);
      goto LABEL_52;
    }
    v28 = v26 + 3;
    if (v28 >= v22)
    {
LABEL_8:

      result = swift_release();
LABEL_9:
      v5 = v40;
      v4 = v41;
      v1 = v38;
      continue;
    }
    break;
  }
  v27 = *(_QWORD *)(v18 + 8 * v28);
  if (v27)
  {
    v23 = v28;
    goto LABEL_51;
  }
  while (1)
  {
    v23 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v23 >= v22)
      goto LABEL_8;
    v27 = *(_QWORD *)(v18 + 8 * v23);
    ++v28;
    if (v27)
      goto LABEL_51;
  }
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
  return result;
}

uint64_t sub_23A6EBED4()
{
  return swift_release();
}

uint64_t sub_23A6EBEDC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6EA51C(a1, &OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__actionHandlers, a2);
}

uint64_t sub_23A6EBF14()
{
  uint64_t v0;

  return sub_23A6EA688(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__actionHandlers);
}

void sub_23A6EBF3C()
{
  uint64_t v0;

  sub_23A6EED28(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_23A6EBF54@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6EA51C(a1, &OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__eventHandlers, a2);
}

id sub_23A6EBF7C(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, unint64_t a7)
{
  void *v7;
  id v8;

  switch(a7 >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
      result = result;
      break;
    case 4uLL:
      v7 = (void *)(a7 & 0x1FFFFFFFFFFFFFFFLL);
      sub_23A6DF314((uint64_t)result, a2, a3, a4, a5, a6);
      v8 = v7;
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void sub_23A6EBFD8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, unint64_t a7)
{
  void *v7;

  switch(a7 >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:

      break;
    case 4uLL:
      v7 = (void *)(a7 & 0x1FFFFFFFFFFFFFFFLL);
      sub_23A6DF3FC((uint64_t)a1, a2, a3, a4, a5, a6);

      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_23A6EC034()
{
  uint64_t v0;

  return sub_23A6EA688(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__eventHandlers);
}

uint64_t sub_23A6EC05C()
{
  uint64_t v0;

  return sub_23A6EEB4C(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_23A6EC080()
{
  uint64_t v0;

  return sub_23A6EE9BC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23A6EC0A0()
{
  uint64_t v0;

  return sub_23A6EE800(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_23A6EC0C4()
{
  uint64_t v0;

  sub_23A6EED58(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_23A6EC0E4()
{
  sub_23A6EBF3C();
}

uint64_t sub_23A6EC0F8()
{
  return sub_23A6EC05C();
}

void sub_23A6EC10C()
{
  sub_23A6EC0C4();
}

uint64_t sub_23A6EC120()
{
  uint64_t v0;

  v0 = sub_23A70D0E4();
  __swift_allocate_value_buffer(v0, qword_2569B4540);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569B4540);
  return sub_23A70D0D8();
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

uint64_t sub_23A6EC1D4()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle);
  sub_23A6EDFD4(v1, *(void **)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle + 8));
  return v1;
}

id sub_23A6EC260@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle);
  v5 = *(void **)(v3 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle + 8);
  *a2 = v4;
  a2[1] = (uint64_t)v5;
  return sub_23A6EDFD4(v4, v5);
}

uint64_t sub_23A6EC2E4(uint64_t *a1)
{
  uint64_t v1;
  void *v2;

  v1 = *a1;
  v2 = (void *)a1[1];
  swift_getKeyPath();
  sub_23A6EDFD4(v1, v2);
  sub_23A6EDF8C();
  sub_23A70D000();
  sub_23A6EDFE4(v1, v2);
  return swift_release();
}

void *sub_23A6EC394()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration);
  v2 = v1;
  return v1;
}

id sub_23A6EC410@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  v4 = *(void **)(v3 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration);
  *a2 = v4;
  return v4;
}

uint64_t sub_23A6EC48C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_23A6EDF8C();
  v2 = v1;
  sub_23A70D000();

  return swift_release();
}

double sub_23A6EC528()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  return *(double *)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__level);
}

double sub_23A6EC59C@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  result = *(double *)(v3 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__level);
  *a2 = result;
  return result;
}

uint64_t sub_23A6EC618()
{
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D000();
  return swift_release();
}

uint64_t sub_23A6EC6B0()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__isForeground);
}

uint64_t sub_23A6EC724@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__isForeground);
  return result;
}

uint64_t sub_23A6EC7A0()
{
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D000();
  return swift_release();
}

double sub_23A6EC830()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  return *(double *)(v0 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__frame);
}

__n128 sub_23A6EC8AC@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  result = *(__n128 *)(v3 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__frame);
  v5 = *(_OWORD *)(v3 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__frame + 16);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_23A6EC92C()
{
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D000();
  return swift_release();
}

uint64_t sub_23A6EC9D4()
{
  return sub_23A6ECA9C((uint64_t)&unk_23A7104A0, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__interfaceOrientation);
}

uint64_t sub_23A6EC9E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6ECB1C(a1, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__interfaceOrientation, a2);
}

uint64_t sub_23A6EC9FC()
{
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D000();
  return swift_release();
}

uint64_t sub_23A6ECA88()
{
  return sub_23A6ECA9C((uint64_t)&unk_23A7104C8, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__userInterfaceStyle);
}

uint64_t sub_23A6ECA9C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  swift_release();
  return *(_QWORD *)(v2 + *a2);
}

uint64_t sub_23A6ECB08@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6ECB1C(a1, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__userInterfaceStyle, a2);
}

uint64_t sub_23A6ECB1C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = *a1;
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D00C();
  result = swift_release();
  *a3 = *(_QWORD *)(v5 + *a2);
  return result;
}

uint64_t sub_23A6ECB9C()
{
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D000();
  return swift_release();
}

uint64_t sub_23A6ECC28()
{
  return sub_23A6ECA9C((uint64_t)&unk_23A7104F0, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__deviceOrientation);
}

uint64_t sub_23A6ECC3C()
{
  swift_getKeyPath();
  sub_23A6EDF8C();
  sub_23A70D000();
  return swift_release();
}

id sub_23A6ECCC8(void *a1)
{
  _BYTE *v1;
  _OWORD *v3;
  __int128 v4;
  _BYTE *v5;
  id v6;
  objc_super v8;

  *(_OWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle] = xmmword_23A710300;
  *(_QWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__level] = 0x7FF8000000000000;
  v1[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__isForeground] = 0;
  v3 = &v1[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__frame];
  v4 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  *v3 = *MEMORY[0x24BDBF070];
  v3[1] = v4;
  *(_QWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__interfaceOrientation] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__userInterfaceStyle] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__deviceOrientation] = 0;
  v5 = v1;
  sub_23A70D030();
  swift_unknownObjectUnownedInit();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for HostedSceneObserver();
  v6 = objc_msgSendSuper2(&v8, sel_init);
  objc_msgSend(a1, sel_add_, v6);
  sub_23A6ECDF0(a1);

  return v6;
}

uint64_t sub_23A6ECDF0(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  unsigned int v36;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0018);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(a1, sel_settings);
  v7 = objc_msgSend(v6, sel_displayConfiguration);

  v8 = objc_msgSend(a1, sel_settings);
  objc_msgSend(v8, sel_level);
  v10 = v9;

  v11 = objc_msgSend(a1, sel_settings);
  objc_msgSend(v11, sel_frame);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = objc_msgSend(a1, sel_settings);
  v36 = objc_msgSend(v20, sel_isForeground);

  v21 = objc_msgSend(a1, sel_settings);
  v22 = objc_msgSend(v21, sel_interfaceOrientation);

  v23 = objc_msgSend(a1, sel_settings);
  objc_opt_self();
  v24 = (void *)swift_dynamicCastObjCClass();
  v25 = v24;
  if (v24)
  {
    v26 = objc_msgSend(v24, sel_userInterfaceStyle);
    v27 = objc_msgSend(v25, sel_deviceOrientation);
  }
  else
  {

    v27 = 0;
    v26 = 0;
  }
  v28 = sub_23A70D528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v5, 1, 1, v28);
  sub_23A70D510();
  v29 = v1;
  v30 = v7;
  v31 = sub_23A70D504();
  v32 = swift_allocObject();
  v33 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v32 + 16) = v31;
  *(_QWORD *)(v32 + 24) = v33;
  *(_QWORD *)(v32 + 32) = v29;
  *(_QWORD *)(v32 + 40) = v7;
  *(_QWORD *)(v32 + 48) = v10;
  *(_QWORD *)(v32 + 56) = v13;
  *(_QWORD *)(v32 + 64) = v15;
  *(_QWORD *)(v32 + 72) = v17;
  *(_QWORD *)(v32 + 80) = v19;
  *(_BYTE *)(v32 + 88) = v36;
  *(_QWORD *)(v32 + 96) = v22;
  *(_QWORD *)(v32 + 104) = v26;
  *(_QWORD *)(v32 + 112) = v27;
  sub_23A6ED458((uint64_t)v5, (uint64_t)&unk_2569B0058, v32);

  return swift_release();
}

uint64_t sub_23A6ED09C(double a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v15;

  *(_QWORD *)(v13 + 88) = a13;
  *(_QWORD *)(v13 + 96) = v15;
  *(_QWORD *)(v13 + 80) = a12;
  *(_BYTE *)(v13 + 112) = a11;
  *(double *)(v13 + 64) = a4;
  *(double *)(v13 + 72) = a5;
  *(double *)(v13 + 48) = a2;
  *(double *)(v13 + 56) = a3;
  *(double *)(v13 + 40) = a1;
  *(_QWORD *)(v13 + 24) = a9;
  *(_QWORD *)(v13 + 32) = a10;
  sub_23A70D510();
  *(_QWORD *)(v13 + 104) = sub_23A70D504();
  sub_23A70D4F8();
  return swift_task_switch();
}

uint64_t sub_23A6ED128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = *(_QWORD *)(v0 + 88);
  v19 = *(_QWORD *)(v0 + 96);
  v17 = *(_QWORD *)(v0 + 80);
  v16 = *(_BYTE *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v15 = *(_OWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 24);
  v4 = *(void **)(v0 + 32);
  swift_release();
  swift_getKeyPath();
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *(_QWORD *)(v0 + 16) = v5;
  sub_23A6EDF8C();
  v7 = v4;
  sub_23A70D000();
  swift_release();

  swift_task_dealloc();
  swift_getKeyPath();
  v8 = swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v3;
  *(_QWORD *)(v0 + 16) = v5;
  sub_23A70D000();
  swift_release();
  swift_task_dealloc();
  swift_getKeyPath();
  v9 = swift_task_alloc();
  *(_QWORD *)(v9 + 16) = v5;
  *(_OWORD *)(v9 + 24) = v15;
  *(_QWORD *)(v9 + 40) = v2;
  *(_QWORD *)(v9 + 48) = v1;
  *(_QWORD *)(v0 + 16) = v5;
  sub_23A70D000();
  swift_release();
  swift_task_dealloc();
  swift_getKeyPath();
  v10 = swift_task_alloc();
  *(_QWORD *)(v10 + 16) = v5;
  *(_BYTE *)(v10 + 24) = v16;
  *(_QWORD *)(v0 + 16) = v5;
  sub_23A70D000();
  swift_release();
  swift_task_dealloc();
  swift_getKeyPath();
  v11 = swift_task_alloc();
  *(_QWORD *)(v11 + 16) = v5;
  *(_QWORD *)(v11 + 24) = v17;
  *(_QWORD *)(v0 + 16) = v5;
  sub_23A70D000();
  swift_release();
  swift_task_dealloc();
  swift_getKeyPath();
  v12 = swift_task_alloc();
  *(_QWORD *)(v12 + 16) = v5;
  *(_QWORD *)(v12 + 24) = v18;
  *(_QWORD *)(v0 + 16) = v5;
  sub_23A70D000();
  swift_release();
  swift_task_dealloc();
  swift_getKeyPath();
  v13 = swift_task_alloc();
  *(_QWORD *)(v13 + 16) = v5;
  *(_QWORD *)(v13 + 24) = v19;
  *(_QWORD *)(v0 + 16) = v5;
  sub_23A70D000();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A6ED458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23A70D528();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23A70D51C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23A6EDE54(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A70D4F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_23A6ED5C8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HostedSceneObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A6ED670()
{
  return type metadata accessor for HostedSceneObserver();
}

uint64_t type metadata accessor for HostedSceneObserver()
{
  uint64_t result;

  result = qword_2569AFFA8;
  if (!qword_2569AFFA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A6ED6B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70D03C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A6ED768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v6;

  *(_BYTE *)(v6 + 48) = a5;
  *(_QWORD *)(v6 + 24) = a4;
  *(_QWORD *)(v6 + 32) = a6;
  sub_23A70D510();
  *(_QWORD *)(v6 + 40) = sub_23A70D504();
  sub_23A70D4F8();
  return swift_task_switch();
}

uint64_t sub_23A6ED7D8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  id v5;

  v1 = *(void **)(v0 + 32);
  v2 = *(unsigned __int8 *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 24);
  swift_release();
  swift_getKeyPath();
  v4 = (_QWORD *)swift_task_alloc();
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  *(_QWORD *)(v0 + 16) = v3;
  sub_23A6EDF8C();
  v5 = v1;
  sub_23A70D000();

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for HostHandle(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v4 = v3;
  return a1;
}

void destroy for HostHandle(uint64_t a1)
{

}

uint64_t assignWithCopy for HostHandle(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a1 + 8);
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v5 = v4;

  return a1;
}

uint64_t assignWithTake for HostHandle(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for HostHandle(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HostHandle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for HostHandle()
{
  return &type metadata for HostHandle;
}

uint64_t sub_23A6EDB38(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A6EDB9C;
  return v6(a1);
}

uint64_t sub_23A6EDB9C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23A6EDBE8(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0018);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v6 = objc_msgSend(a1, sel_isLocal);
    v7 = objc_msgSend(a1, sel_auditToken);
    objc_msgSend(v7, sel_copy);

    sub_23A70D60C();
    swift_unknownObjectRelease();
    sub_23A6E24A4(0, &qword_2569B0030);
    if (swift_dynamicCast())
      v8 = (void *)v15[1];
    else
      v8 = 0;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = sub_23A70D528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
  sub_23A70D510();
  v10 = v8;
  v11 = v1;
  v12 = sub_23A70D504();
  v13 = swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = v14;
  *(_QWORD *)(v13 + 32) = v11;
  *(_BYTE *)(v13 + 40) = v6;
  *(_QWORD *)(v13 + 48) = v8;
  sub_23A6ED458((uint64_t)v5, (uint64_t)&unk_2569B0028, v13);
  swift_release();

}

uint64_t sub_23A6EDD9C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23A6EDDD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23A6EE2D8;
  return sub_23A6ED768(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_23A6EDE54(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0018);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A6EDE94()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6EDEB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A6EDF28;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2569B0038 + dword_2569B0038))(a1, v4);
}

uint64_t sub_23A6EDF28()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23A6EDF78()
{
  sub_23A6EDFF4();
}

unint64_t sub_23A6EDF8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0048;
  if (!qword_2569B0048)
  {
    v1 = type metadata accessor for HostedSceneObserver();
    result = MEMORY[0x23B855268](&unk_23A7103BC, v1);
    atomic_store(result, &qword_2569B0048);
  }
  return result;
}

id sub_23A6EDFD4(uint64_t a1, void *a2)
{
  id result;

  if (a2 != (void *)1)
    return a2;
  return result;
}

void sub_23A6EDFE4(uint64_t a1, void *a2)
{
  if (a2 != (void *)1)

}

void sub_23A6EDFF4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;

  v1 = v0[3];
  v2 = (void *)v0[4];
  v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__hostHandle);
  v4 = *v3;
  v5 = (void *)v3[1];
  *v3 = v1;
  v3[1] = (uint64_t)v2;
  sub_23A6EDFD4(v1, v2);
  sub_23A6EDFE4(v4, v5);
}

uint64_t sub_23A6EE048()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23A6EE07C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(double *)(v1 + 48);
  v9 = *(double *)(v1 + 56);
  v10 = *(double *)(v1 + 64);
  v11 = *(double *)(v1 + 72);
  v12 = *(double *)(v1 + 80);
  v13 = *(_BYTE *)(v1 + 88);
  v14 = *(_QWORD *)(v1 + 96);
  v15 = *(_QWORD *)(v1 + 104);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v16;
  *v16 = v2;
  v16[1] = sub_23A6EDF28;
  return sub_23A6ED09C(v8, v9, v10, v11, v12, a1, v4, v5, v6, v7, v13, v14, v15);
}

void sub_23A6EE158()
{
  sub_23A6EE29C();
}

double sub_23A6EE174()
{
  uint64_t v0;
  double result;

  result = *(double *)(v0 + 24);
  *(double *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__level) = result;
  return result;
}

double sub_23A6EE194()
{
  double result;

  *(_QWORD *)&result = sub_23A6EE27C().n128_u64[0];
  return result;
}

void sub_23A6EE1B0()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__isForeground) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_23A6EE1C8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6ECB1C(a1, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__interfaceOrientation, a2);
}

void sub_23A6EE1F0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__interfaceOrientation) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_23A6EE204@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6ECB1C(a1, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__userInterfaceStyle, a2);
}

void sub_23A6EE22C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__userInterfaceStyle) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_23A6EE240@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6ECB1C(a1, &OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__deviceOrientation, a2);
}

void sub_23A6EE268()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__deviceOrientation) = *(_QWORD *)(v0 + 24);
}

__n128 sub_23A6EE27C()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__frame;
  result = *(__n128 *)(v0 + 24);
  v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)v1 = result;
  *(_OWORD *)(v1 + 16) = v3;
  return result;
}

void sub_23A6EE29C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12DrawingBoard19HostedSceneObserver__displayConfiguration) = v2;
  v4 = v2;

}

void sub_23A6EE2DC()
{
  sub_23A6EE268();
}

void sub_23A6EE2F0()
{
  sub_23A6EE22C();
}

void sub_23A6EE304()
{
  sub_23A6EE1F0();
}

double sub_23A6EE318()
{
  return sub_23A6EE174();
}

void sub_23A6EE330()
{
  sub_23A6EE1B0();
}

uint64_t FBScene.sceneState.getter()
{
  _QWORD *v0;
  uint64_t v1;

  v0 = sub_23A6E5E88();
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  sub_23A70D00C();
  swift_release();
  v1 = *(_QWORD *)(v0[3] + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver_state);
  swift_retain();
  swift_release();
  return v1;
}

uint64_t SceneState.isActive.getter()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

id sub_23A6EE474@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  sub_23A70D00C();
  swift_release();
  v4 = *(void **)(v3 + 24);
  *a2 = v4;
  return v4;
}

void sub_23A6EE500(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
  v2 = v1;
  sub_23A70D000();
  swift_release();

}

void *sub_23A6EE5BC()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  swift_release();
  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

uint64_t SceneState.isValid.getter()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_23A6EE6CC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_23A6EE758()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D000();
  return swift_release();
}

uint64_t sub_23A6EE800(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

uint64_t SceneState.contentState.getter()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  swift_release();
  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_23A6EE88C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  result = swift_release();
  *a2 = *(_QWORD *)(v3 + 24);
  return result;
}

uint64_t sub_23A6EE918()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D000();
  return swift_release();
}

uint64_t sub_23A6EE9BC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_23A6EE9C4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 32);
  return result;
}

uint64_t sub_23A6EEA54()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D000();
  return swift_release();
}

uint64_t type metadata accessor for SceneState()
{
  uint64_t result;

  result = qword_2569B0090;
  if (!qword_2569B0090)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A6EEB4C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

void *SceneState.clientHandle.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  swift_release();
  v1 = *(void **)(v0 + 40);
  v2 = v1;
  return v1;
}

id sub_23A6EEBE0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D00C();
  swift_release();
  v4 = *(void **)(v3 + 40);
  *a2 = v4;
  return v4;
}

void sub_23A6EEC70(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  v2 = v1;
  sub_23A70D000();
  swift_release();

}

void sub_23A6EED28(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = a2;
  v3 = a2;

}

void sub_23A6EED58(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = a2;
  v3 = a2;

}

uint64_t SceneState.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12DrawingBoard10SceneState___observationRegistrar;
  v2 = sub_23A70D03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SceneState.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12DrawingBoard10SceneState___observationRegistrar;
  v2 = sub_23A70D03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A6EEE3C()
{
  return type metadata accessor for SceneState();
}

uint64_t sub_23A6EEE44()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70D03C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SceneState()
{
  return swift_lookUpClassMethod();
}

void sub_23A6EEEEC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = v2;
  v4 = v2;

}

void sub_23A6EEF20()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24) = *(_QWORD *)(v0 + 24);
}

void sub_23A6EEF2C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = *(_BYTE *)(v0 + 24);
}

void sub_23A6EEF3C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 32) = *(_BYTE *)(v0 + 24);
}

void sub_23A6EEF4C()
{
  uint64_t v0;

  sub_23A6E5338(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_23A6EEF64(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;

  *(_QWORD *)(v1 + 40) = 0;
  *(_QWORD *)(v1 + 48) = 0;
  sub_23A70D030();
  *(_BYTE *)(v1 + 16) = objc_msgSend(a1, sel_isValid);
  *(_QWORD *)(v1 + 24) = objc_msgSend(a1, sel_contentState);
  *(_BYTE *)(v1 + 32) = objc_msgSend(a1, sel_isActive);
  v3 = objc_msgSend(a1, sel_clientHandle);
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  sub_23A70D000();
  swift_release();

  v4 = objc_msgSend(a1, sel_uiPresentationManager);
  swift_getKeyPath();
  sub_23A70D000();
  swift_release();

  return v1;
}

void sub_23A6EF0EC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = v2;
  v4 = v2;

}

void sub_23A6EF120()
{
  sub_23A6EEEEC();
}

uint64_t (*Transaction.sceneTransitioner.getter())(uint64_t, uint64_t)
{
  __int128 v1;

  sub_23A6E1320();
  sub_23A70D138();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_23A6EF2B8;
}

void sub_23A6EF1A0(_QWORD *a1@<X8>)
{
  *a1 = nullsub_1;
  a1[1] = 0;
}

double sub_23A6EF1B4@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_23A6E1320();
  sub_23A70D138();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_23A6EF204()
{
  sub_23A6E1320();
  swift_retain();
  return sub_23A70D144();
}

uint64_t sub_23A6EF260(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, uint64_t *))
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2;
  v5 = a1;
  return a3(&v5, &v4);
}

uint64_t sub_23A6EF294()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t Transaction.sceneTransitioner.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  sub_23A6E1320();
  return sub_23A70D144();
}

uint64_t sub_23A6EF32C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

void (*Transaction.sceneTransitioner.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_23A6E1320();
  sub_23A70D138();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = *((_OWORD *)v3 + 1);
  *v3 = sub_23A6EF2B8;
  v3[1] = v4;
  return sub_23A6EF3EC;
}

void sub_23A6EF3EC(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  if ((a2 & 1) != 0)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    v2[2] = (uint64_t)sub_23A6EFBD8;
    v2[3] = v5;
    swift_retain();
    sub_23A70D144();
    swift_release();
  }
  else
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v3;
    v2[2] = (uint64_t)sub_23A6EFBD8;
    v2[3] = v6;
    sub_23A70D144();
  }
  free(v2);
}

uint64_t sub_23A6EF4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t Transaction.init(sceneTransitioner:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  sub_23A6E1320();
  sub_23A70D144();
  return 0;
}

uint64_t Transaction.init(actions:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = a1;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_23A6EFBAC;
  *(_QWORD *)(v3 + 24) = v2;
  sub_23A6E1320();
  sub_23A70D144();
  return 0;
}

uint64_t sub_23A6EF5F4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t Transaction.init(action:)(void *a1)
{
  uint64_t inited;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0140);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A7106B0;
  *(_QWORD *)(inited + 32) = a1;
  v12 = inited;
  sub_23A70D4A4();
  if (v12 >> 62)
  {
    v7 = a1;
    swift_bridgeObjectRetain();
    v8 = sub_23A70D75C();
    swift_bridgeObjectRelease();
    if (v8)
      goto LABEL_3;
LABEL_5:
    v6 = MEMORY[0x24BEE4B08];
    goto LABEL_6;
  }
  v3 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  v4 = a1;
  if (!v3)
    goto LABEL_5;
LABEL_3:
  sub_23A6EA010(v12);
  v6 = v5;
LABEL_6:
  swift_bridgeObjectRelease();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v6;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_23A6EFBAC;
  *(_QWORD *)(v10 + 24) = v9;
  sub_23A6E1320();
  sub_23A70D144();

  return 0;
}

uint64_t withSceneTransition<A>(transitioner:body:)(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath;
  uint64_t v5;

  KeyPath = swift_getKeyPath();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  swift_retain();
  sub_23A6EF828(KeyPath);
  swift_release();
  return swift_release();
}

uint64_t sub_23A6EF828(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  MEMORY[0x24BDAC7A8](a1);
  v4[1] = 0;
  (*(void (**)(char *))(v1 + 16))((char *)v4 - v2);
  swift_setAtWritableKeyPath();
  swift_retain();
  sub_23A70D1B0();
  return swift_release_n();
}

uint64_t withSceneActions<A>(_:body:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = a1;
  swift_bridgeObjectRetain();
  withSceneTransition<A>(transitioner:body:)((uint64_t)sub_23A6EFB84, v2);
  return swift_release();
}

void sub_23A6EF9AC(uint64_t a1, void *a2)
{
  id v3;

  sub_23A6DD7B4();
  sub_23A6DD7F0();
  v3 = (id)sub_23A70D540();
  objc_msgSend(a2, sel_setActions_, v3);

}

uint64_t withSceneAction<A>(_:body:)(void *a1)
{
  uint64_t inited;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0140);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A7106B0;
  *(_QWORD *)(inited + 32) = a1;
  v10 = inited;
  sub_23A70D4A4();
  if (v10 >> 62)
  {
    v7 = a1;
    swift_bridgeObjectRetain();
    v8 = sub_23A70D75C();
    swift_bridgeObjectRelease();
    if (v8)
      goto LABEL_3;
LABEL_5:
    v6 = MEMORY[0x24BEE4B08];
    goto LABEL_6;
  }
  v3 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  v4 = a1;
  if (!v3)
    goto LABEL_5;
LABEL_3:
  sub_23A6EA010(v10);
  v6 = v5;
LABEL_6:
  swift_bridgeObjectRelease();
  withSceneActions<A>(_:body:)(v6);
  return swift_bridgeObjectRelease();
}

double sub_23A6EFB30@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_23A6E1320();
  sub_23A70D138();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

void sub_23A6EFB84(uint64_t a1, void *a2)
{
  sub_23A6EF9AC(a1, a2);
}

ValueMetadata *_s23__Key_sceneTransitionerVMa()
{
  return &_s23__Key_sceneTransitionerVN;
}

uint64_t sub_23A6EFC54()
{
  sub_23A70D870();
  sub_23A70D87C();
  return sub_23A70D894();
}

uint64_t sub_23A6EFC94()
{
  return sub_23A70D87C();
}

uint64_t sub_23A6EFCB8()
{
  sub_23A70D870();
  sub_23A70D87C();
  return sub_23A70D894();
}

uint64_t sub_23A6EFCF4()
{
  return 0x6567617373656DLL;
}

uint64_t sub_23A6EFD0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A70D7EC();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A6EFDA0()
{
  return 0;
}

void sub_23A6EFDAC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23A6EFDB8()
{
  sub_23A6F0130();
  return sub_23A70D8F4();
}

uint64_t sub_23A6EFDE0()
{
  sub_23A6F0130();
  return sub_23A70D900();
}

uint64_t type metadata accessor for LocalSceneActivationContext()
{
  return objc_opt_self();
}

void *sub_23A6EFE3C(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  objc_class *ObjectType;

  v3 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0178);
  v5 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A6F0130();
  v9 = v3;
  sub_23A70D8A0();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v10 = v5;
    v11 = v17;
    v12 = sub_23A70D798();
    v14 = (uint64_t *)&v9[OBJC_IVAR____TtC12DrawingBoard27LocalSceneActivationContext_message];
    *v14 = v12;
    v14[1] = v15;

    v18.receiver = v9;
    v18.super_class = ObjectType;
    v8 = objc_msgSendSuper2(&v18, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v8;
}

void *sub_23A6EFFCC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  void *result;

  v6 = objc_allocWithZone(v2);
  result = sub_23A6EFE3C(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_23A6F0018(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0188);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A6F0130();
  sub_23A70D8AC();
  sub_23A70D7A4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23A6F0130()
{
  unint64_t result;

  result = qword_2569B0180;
  if (!qword_2569B0180)
  {
    result = MEMORY[0x23B855268](&unk_23A71094C, &type metadata for LocalSceneActivationContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B0180);
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

ValueMetadata *type metadata accessor for LocalSceneConnectionDefinition()
{
  return &type metadata for LocalSceneConnectionDefinition;
}

uint64_t getEnumTagSinglePayload for LocalSceneActivationContext.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocalSceneActivationContext.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A6F0238 + 4 * byte_23A710750[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A6F0258 + 4 * byte_23A710755[v4]))();
}

_BYTE *sub_23A6F0238(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A6F0258(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A6F0260(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A6F0268(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A6F0270(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A6F0278(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23A6F0284()
{
  return 0;
}

ValueMetadata *type metadata accessor for LocalSceneActivationContext.CodingKeys()
{
  return &type metadata for LocalSceneActivationContext.CodingKeys;
}

unint64_t sub_23A6F02A0()
{
  unint64_t result;

  result = qword_2569B0190;
  if (!qword_2569B0190)
  {
    result = MEMORY[0x23B855268](&unk_23A7108BC, &type metadata for LocalSceneActivationContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B0190);
  }
  return result;
}

uint64_t sub_23A6F02E4()
{
  return sub_23A6F032C(&qword_2569B0198, (uint64_t)&unk_23A7107D4);
}

uint64_t sub_23A6F0308()
{
  return sub_23A6F032C(&qword_2569B01A0, (uint64_t)&unk_23A7107AC);
}

uint64_t sub_23A6F032C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for LocalSceneActivationContext();
    result = MEMORY[0x23B855268](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t (*sub_23A6F0368())@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A6F0378;
}

uint64_t sub_23A6F0378@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t result;
  __int128 v7[2];
  _QWORD v8[5];

  v3 = (void *)*__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v8[3] = type metadata accessor for LocalWindowSceneDelegate();
  v8[4] = &off_250B8D990;
  v8[0] = v3;
  sub_23A6F05A4((uint64_t)v8, (uint64_t)v7);
  v4 = swift_allocObject();
  sub_23A6F060C(v7, v4 + 16);
  v5 = v3;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_23A6F0624;
  *(_QWORD *)(result + 24) = v4;
  *a2 = sub_23A6EF32C;
  a2[1] = result;
  return result;
}

uint64_t sub_23A6F0430(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  sub_23A70D108();
  return swift_release();
}

unint64_t sub_23A6F04C4()
{
  unint64_t result;

  result = qword_2569B01A8;
  if (!qword_2569B01A8)
  {
    result = MEMORY[0x23B855268](&unk_23A71082C, &type metadata for LocalSceneActivationContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B01A8);
  }
  return result;
}

unint64_t sub_23A6F050C()
{
  unint64_t result;

  result = qword_2569B01B0;
  if (!qword_2569B01B0)
  {
    result = MEMORY[0x23B855268](&unk_23A710854, &type metadata for LocalSceneActivationContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B01B0);
  }
  return result;
}

uint64_t sub_23A6F0550()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6F0574(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_23A6F05A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A6F05E8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_23A6F060C(__int128 *a1, uint64_t a2)
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

uint64_t sub_23A6F0624(uint64_t a1, void *a2)
{
  return sub_23A70276C(a2);
}

id sub_23A6F0658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(qword_2569AF550);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_23A7109A0;
  *(_QWORD *)(v6 + 32) = a4(a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF548);
  v7 = (void *)sub_23A70D48C();
  swift_bridgeObjectRelease();
  return v7;
}

void sub_23A6F06DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  objc_class *v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  objc_super v14;
  void *v15;

  v15 = &unk_2569BF5B0;
  v7 = swift_dynamicCastObjCProtocolConditional();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (objc_class *)type metadata accessor for ContentBuilderBox();
    v10 = (char *)objc_allocWithZone(v9);
    v11 = &v10[OBJC_IVAR____TtC12DrawingBoard17ContentBuilderBox_builder];
    *(_QWORD *)v11 = a3;
    *((_QWORD *)v11 + 1) = a4;
    v14.receiver = v10;
    v14.super_class = v9;
    v12 = a1;
    swift_retain();
    v13 = objc_msgSendSuper2(&v14, sel_init);
    objc_msgSend(v8, sel_setBuilderBox_, v13);

  }
}

id sub_23A6F07BC()
{
  return sub_23A6F086C(type metadata accessor for LocalSceneExtension.HostComponent);
}

id sub_23A6F07D4(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_23A6F081C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, sel_initWithScene_, a3);
}

id sub_23A6F0860()
{
  return sub_23A6F086C(type metadata accessor for LocalSceneExtension.ClientComponent);
}

id sub_23A6F086C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for LocalSceneExtension()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LocalSceneExtension.HostComponent()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LocalSceneExtension.ClientComponent()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for NullSceneActivationPolicyModel()
{
  return objc_opt_self();
}

unint64_t sub_23A6F0958(uint64_t a1)
{
  unint64_t result;

  result = sub_23A6F097C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23A6F097C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B02C8;
  if (!qword_2569B02C8)
  {
    v1 = type metadata accessor for NullSceneActivationPolicyModel();
    result = MEMORY[0x23B855268](&unk_23A710A30, v1);
    atomic_store(result, (unint64_t *)&qword_2569B02C8);
  }
  return result;
}

_QWORD *LocalSceneStore.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v19;

  v8 = sub_23A70CFF4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B02D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A7109A0;
  swift_retain();
  sub_23A70CFE8();
  v13 = sub_23A70CFD0();
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a1;
  v16[5] = a2;
  *(_QWORD *)(inited + 32) = v13;
  *(_QWORD *)(inited + 40) = v15;
  *(_BYTE *)(inited + 48) = 1;
  *(_QWORD *)(inited + 56) = sub_23A6F3DCC;
  *(_QWORD *)(inited + 64) = v16;
  type metadata accessor for LocalSceneStore(0);
  swift_allocObject();
  v17 = sub_23A6F3C10(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_release();
  return v17;
}

uint64_t sub_23A6F0B20()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02E0, type metadata accessor for LocalSceneStore.WorkspaceDelegate, (uint64_t)&unk_23A710B80);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A6F0BC8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02E0, type metadata accessor for LocalSceneStore.WorkspaceDelegate, (uint64_t)&unk_23A710B80);
  sub_23A70D00C();
  swift_release();
  v4 = (_QWORD *)(v3 + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate__scenes);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A6F0C78()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02E0, type metadata accessor for LocalSceneStore.WorkspaceDelegate, (uint64_t)&unk_23A710B80);
  swift_bridgeObjectRetain();
  sub_23A70D000();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6F0D30(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)(a1 + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate__scenes);
  swift_beginAccess();
  *v3 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

id sub_23A6F0EC8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalSceneStore.WorkspaceDelegate(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_QWORD *LocalSceneStore.Configuration.init<A>(identifier:isForeground:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a6;
  result[3] = a7;
  result[4] = a4;
  result[5] = a5;
  *(_QWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  *(_BYTE *)(a8 + 16) = a3;
  *(_QWORD *)(a8 + 24) = sub_23A6F3DCC;
  *(_QWORD *)(a8 + 32) = result;
  return result;
}

uint64_t sub_23A6F0FCC(void *a1)
{
  int *v2;
  uint64_t v3;
  uint64_t *v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;

  v2 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2569B0538);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
  swift_storeEnumTagMultiPayload();
  v5 = a1;
  v6 = sub_23A70C7A8();

  *(uint64_t *)((char *)v4 + v2[9]) = (uint64_t)v6;
  v7 = (uint64_t *)((char *)v4 + v2[10]);
  *v7 = nullsub_1;
  v7[1] = 0;
  v8 = (uint64_t *)((char *)v4 + v2[11]);
  *v8 = 2156765168;
  v8[1] = 0xA400000000000000;
  sub_23A6F4EF8();
  return sub_23A70D3CC();
}

uint64_t sub_23A6F10B8(void *a1)
{
  int *v2;
  uint64_t v3;
  uint64_t *v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;

  v2 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2569B0538);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
  swift_storeEnumTagMultiPayload();
  v5 = a1;
  v6 = sub_23A70C7A8();

  *(uint64_t *)((char *)v4 + v2[9]) = (uint64_t)v6;
  v7 = (uint64_t *)((char *)v4 + v2[10]);
  *v7 = nullsub_1;
  v7[1] = 0;
  v8 = (uint64_t *)((char *)v4 + v2[11]);
  *v8 = 2225512432;
  v8[1] = 0xA400000000000000;
  sub_23A6F4EF8();
  return sub_23A70D3CC();
}

uint64_t sub_23A6F11A4(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);

  v1 = MEMORY[0x24BDAC7A8](a1);
  v2(v1);
  return sub_23A70D3CC();
}

uint64_t sub_23A6F1218()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02F8, type metadata accessor for LocalSceneStore, (uint64_t)&protocol conformance descriptor for LocalSceneStore);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  swift_retain();
  swift_retain();
  swift_retain();
  return v1;
}

uint64_t sub_23A6F12D8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)*a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02F8, type metadata accessor for LocalSceneStore, (uint64_t)&protocol conformance descriptor for LocalSceneStore);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  v4 = v3[5];
  v5 = v3[6];
  *a2 = v3[4];
  a2[1] = v4;
  a2[2] = v5;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_23A6F1394()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02F8, type metadata accessor for LocalSceneStore, (uint64_t)&protocol conformance descriptor for LocalSceneStore);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23A70D000();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A6F147C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  a1[4] = a2;
  a1[5] = a3;
  a1[6] = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A6F1520()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02E0, type metadata accessor for LocalSceneStore.WorkspaceDelegate, (uint64_t)&unk_23A710B80);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

id sub_23A6F15C8(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  id result;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(v1 + 16);
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02E0, type metadata accessor for LocalSceneStore.WorkspaceDelegate, (uint64_t)&unk_23A710B80);
  sub_23A70D00C();
  swift_release();
  v4 = (uint64_t *)(v3 + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate__scenes);
  result = (id)swift_beginAccess();
  v6 = *v4;
  if ((v6 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v7 = MEMORY[0x23B854BC0](a1, v6);
    swift_bridgeObjectRelease();
    return (id)v7;
  }
  else
  {
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10) > a1)
    {
      return *(id *)(v6 + 8 * a1 + 32);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23A6F16D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  id v9;

  v3 = *(_QWORD *)(v1 + 16);
  swift_getKeyPath();
  v4 = v3 + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate___observationRegistrar;
  sub_23A6E1420(&qword_2569B02E0, type metadata accessor for LocalSceneStore.WorkspaceDelegate, (uint64_t)&unk_23A710B80);
  sub_23A70D00C();
  swift_release();
  v5 = (uint64_t *)(v3 + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate__scenes);
  swift_beginAccess();
  if ((unint64_t)*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_23A70D75C();
    swift_bridgeObjectRelease();
    if (v6 < 0)
    {
      __break(1u);
LABEL_11:
      swift_bridgeObjectRetain();
      v7 = (void *)MEMORY[0x23B854BC0](a1, v4);
      swift_bridgeObjectRelease();
      return (uint64_t)v7;
    }
  }
  else
  {
    v6 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = 0;
  if (a1 < 0 || v6 <= a1)
    return (uint64_t)v7;
  swift_getKeyPath();
  sub_23A70D00C();
  result = swift_release();
  v4 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
    goto LABEL_11;
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a1)
  {
    v7 = *(void **)(v4 + 8 * a1 + 32);
    v9 = v7;
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

id sub_23A6F1860(__int128 *a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 *v14;
  id v15;
  id v16;
  uint64_t v17;
  id result;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  id v23;
  char isEscapingClosureAtFileLocation;
  uint64_t ObjCClassFromMetadata;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 *v29;
  id v30;
  id v31;
  _BYTE v32[16];
  __int128 *v33;
  uint64_t v34;
  _QWORD aBlock[6];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39[3];
  __int128 v40;

  v2 = a1[1];
  v36 = *a1;
  v37 = v2;
  v3 = *(_QWORD *)a1;
  v4 = *((_QWORD *)a1 + 1);
  v5 = *((unsigned __int8 *)a1 + 16);
  v6 = v36;
  v38 = *((_QWORD *)a1 + 4);
  v39[0] = v3;
  v39[1] = v4;
  v39[2] = v5;
  v40 = *(__int128 *)((char *)a1 + 24);
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_23A6F3E30((uint64_t)&v36);
  sub_23A6E1420(&qword_2569B02F8, type metadata accessor for LocalSceneStore, (uint64_t)&protocol conformance descriptor for LocalSceneStore);
  sub_23A70D00C();
  swift_release();
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  swift_beginAccess();
  sub_23A6F1D70(v39, v6, *((uint64_t *)&v6 + 1));
  swift_endAccess();
  aBlock[0] = v1;
  swift_getKeyPath();
  sub_23A70D018();
  swift_release();
  v7 = *(void **)(v1 + 24);
  v8 = (void *)sub_23A70D438();
  v9 = objc_msgSend(v7, sel_sceneWithIdentifier_, v8, aBlock[0]);

  if (!v9)
  {
    v19 = swift_allocObject();
    v20 = v37;
    *(_OWORD *)(v19 + 16) = v36;
    *(_OWORD *)(v19 + 32) = v20;
    *(_QWORD *)(v19 + 48) = v38;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = sub_23A6F3E68;
    *(_QWORD *)(v21 + 24) = v19;
    aBlock[4] = sub_23A6DEC58;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A6F244C;
    aBlock[3] = &block_descriptor_4;
    v22 = _Block_copy(aBlock);
    sub_23A6F3E30((uint64_t)&v36);
    swift_retain();
    swift_release();
    v23 = objc_msgSend(v7, sel_createScene_, v22);
    _Block_release(v22);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      type metadata accessor for LocalSceneExtension();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      type metadata accessor for LocalSceneExtension.HostComponent();
      result = objc_msgSend(v23, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata());
      if (!result)
      {
LABEL_21:
        __break(1u);
        return result;
      }
      v26 = swift_dynamicCastClass();
      if (v26)
      {
        v27 = (void *)v26;
        v29 = (__int128 *)*((_QWORD *)&v37 + 1);
        v28 = v38;
        swift_retain();
        if (objc_msgSend(v27, sel_isValid)
          && (v30 = objc_msgSend(v27, sel_hostScene)) != 0)
        {
          v33 = v29;
          v34 = v28;
          v31 = (id)MEMORY[0x24BDAC7A8](v30);
          sub_23A6DD838(sub_23A6F3E98, (uint64_t)v32);
          swift_release();

          swift_unknownObjectRelease();
          return (id)swift_release();
        }
        else
        {
          swift_release();

          swift_unknownObjectRelease();
          return (id)swift_release();
        }
      }
LABEL_20:
      result = (id)swift_unknownObjectRelease();
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_18;
  }
  type metadata accessor for LocalSceneExtension();
  v10 = swift_getObjCClassFromMetadata();
  type metadata accessor for LocalSceneExtension.HostComponent();
  if (!objc_msgSend(v9, sel_componentForExtension_ofClass_, v10, swift_getObjCClassFromMetadata()))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v11 = swift_dynamicCastClass();
  if (!v11)
  {
LABEL_18:
    swift_unknownObjectRelease();
    goto LABEL_19;
  }
  v12 = (void *)v11;
  v14 = (__int128 *)*((_QWORD *)&v37 + 1);
  v13 = v38;
  swift_retain();
  if (objc_msgSend(v12, sel_isValid)
    && (v15 = objc_msgSend(v12, sel_hostScene)) != 0)
  {
    v33 = v14;
    v34 = v13;
    v16 = (id)MEMORY[0x24BDAC7A8](v15);
    sub_23A6DD838(sub_23A6F4F54, (uint64_t)v32);

    v17 = swift_release();
  }
  else
  {
    v17 = swift_release();
  }
  MEMORY[0x24BDAC7A8](v17);
  v33 = &v36;
  sub_23A6DD838(sub_23A6F3EA0, (uint64_t)v32);

  return (id)swift_unknownObjectRelease();
}

uint64_t *sub_23A6F1D70(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *result;
  uint64_t v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29[8];
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34[8];
  uint64_t v35;

  sub_23A6F4DF8((uint64_t)a1, (uint64_t)v30);
  v7 = (uint64_t *)v30[1];
  v25 = v30[0];
  v26 = v31;
  v8 = v33;
  v27 = v32;
  v9 = *v3;
  v10 = (_QWORD *)v3[1];
  swift_retain();
  swift_retain();
  v28 = a3;
  v11 = sub_23A6F273C(a2, a3, v9, v10);
  LOBYTE(a3) = v12;
  v14 = v13;
  swift_release();
  swift_release();
  if ((a3 & 1) != 0)
  {
    sub_23A6F4DF8((uint64_t)a1, (uint64_t)v34);
    if (v35)
    {
      v17 = v7;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_23A6F295C(a2, v28);
      v22 = v3[2];
      v3 += 2;
      v21 = v22;
      swift_bridgeObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v3 = v22;
      v7 = a1;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_23A6F2AD4(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v21 = *v3;
      }
      v15 = *(_QWORD *)(v21 + 16);
      v18 = *(_QWORD *)(v21 + 24);
      v16 = v15 + 1;
      if (v15 < v18 >> 1)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  else
  {
    sub_23A6F4DF8((uint64_t)a1, (uint64_t)v34);
    if (v35)
    {
      v15 = (unint64_t)a1;
      v16 = v3[2];
      v17 = v7;
      swift_bridgeObjectRetain();
      swift_retain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = sub_23A70034C(v16);
      if ((v11 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else
      {
        v18 = *(_QWORD *)(v16 + 16);
        if (v11 < v18)
        {
          v19 = v16 + 40 * v11;
          swift_bridgeObjectRetain();
          swift_retain();
          swift_release();
          swift_bridgeObjectRelease();
          *(_QWORD *)(v19 + 32) = v25;
          *(_QWORD *)(v19 + 40) = v7;
          *(_BYTE *)(v19 + 48) = v26 & 1;
          *(_QWORD *)(v19 + 56) = v27;
          *(_QWORD *)(v19 + 64) = v8;
          swift_bridgeObjectRelease();
          sub_23A6F4E40(a1);
          result = sub_23A6F4E40(a1);
          v3[2] = v16;
          return result;
        }
      }
      __break(1u);
LABEL_17:
      sub_23A6F2AD4(v18 > 1, v16, 1);
      v21 = *v3;
LABEL_12:
      *(_QWORD *)(v21 + 16) = v16;
      v24 = v21 + 40 * v15;
      *(_QWORD *)(v24 + 32) = v25;
      *(_QWORD *)(v24 + 40) = v17;
      *(_BYTE *)(v24 + 48) = v26 & 1;
      *(_QWORD *)(v24 + 56) = v27;
      *(_QWORD *)(v24 + 64) = v8;
      swift_bridgeObjectRelease();
      sub_23A6F4E40(v7);
      result = sub_23A6F4E40(v7);
      *v3 = v21;
      return result;
    }
    sub_23A6F3090(v11, v14);
    swift_bridgeObjectRelease();
    sub_23A6F320C(v11, (uint64_t)v29);
    swift_bridgeObjectRelease();
    swift_release();
  }
  return (uint64_t *)swift_bridgeObjectRelease();
}

uint64_t sub_23A6F2030(void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  _QWORD aBlock[6];

  v4 = objc_msgSend((id)objc_opt_self(), sel_localIdentity);
  objc_msgSend(a1, sel_setClientIdentity_, v4);

  v5 = (void *)sub_23A70D438();
  objc_msgSend(a1, sel_setIdentifier_, v5);

  v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalSceneSpecification()), sel_init);
  objc_msgSend(a1, sel_setSpecification_, v6);

  result = (uint64_t)objc_msgSend(a1, sel_respondsToSelector_, sel_configureParameters_);
  if ((result & 1) != 0)
  {
    MEMORY[0x24BDAC7A8](result);
    v10[2] = a2;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = sub_23A6F4D98;
    *(_QWORD *)(v8 + 24) = v10;
    aBlock[4] = sub_23A6F4F58;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A6E30E4;
    aBlock[3] = &block_descriptor_18_0;
    v9 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    objc_msgSend(a1, sel_configureParameters_, v9);
    _Block_release(v9);
    swift_release();
    LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
    swift_unknownObjectRelease();
    result = swift_release();
    if ((v9 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_23A6F2214(void *a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD v9[6];

  v4 = swift_allocObject();
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 48) = *(_QWORD *)(a2 + 32);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_23A6F4DE0;
  *(_QWORD *)(v6 + 24) = v4;
  v9[4] = sub_23A6DEC28;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A6E30E4;
  v9[3] = &block_descriptor_27;
  v7 = _Block_copy(v9);
  sub_23A6F3E30(a2);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_updateSettingsWithBlock_, v7);
  _Block_release(v7);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a1 & 1) != 0)
    __break(1u);
  return result;
}

id sub_23A6F2350(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  NSString *v5;
  SEL v6;
  id result;

  objc_msgSend(a1, sel_setForeground_, *(unsigned __int8 *)(a2 + 16));
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE38450]), sel_init);
  v4 = objc_msgSend(v3, sel_mainConfiguration);

  objc_msgSend(a1, sel_setDisplayConfiguration_, v4);
  v5 = (NSString *)sub_23A70D438();
  v6 = NSSelectorFromString(v5);

  objc_msgSend(a1, sel_addPropagatedProperty_, v6);
  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
    return objc_msgSend(result, sel_setInterfaceOrientationMode_, 2);
  return result;
}

uint64_t sub_23A6F244C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

void sub_23A6F2488()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(v0 + 24);
  v2 = (void *)sub_23A70D438();
  v3 = objc_msgSend(v1, sel_sceneWithIdentifier_, v2);

  objc_msgSend(v3, sel_invalidate);
}

_QWORD *LocalSceneStore.__allocating_init(_:)(uint64_t a1)
{
  _QWORD *v2;

  swift_allocObject();
  v2 = sub_23A6F3C10(a1);
  swift_bridgeObjectRelease();
  return v2;
}

{
  _QWORD *v2;

  type metadata accessor for LocalSceneStore(0);
  swift_allocObject();
  v2 = sub_23A6F3C10(a1);
  swift_bridgeObjectRelease();
  return v2;
}

_QWORD *LocalSceneStore.init(_:)(uint64_t a1)
{
  _QWORD *v1;

  v1 = sub_23A6F3C10(a1);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t type metadata accessor for LocalSceneStore(uint64_t a1)
{
  return sub_23A6F3DF4(a1, qword_2569B0388);
}

uint64_t LocalSceneStore.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC12DrawingBoard15LocalSceneStore___observationRegistrar;
  v2 = sub_23A70D03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LocalSceneStore.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC12DrawingBoard15LocalSceneStore___observationRegistrar;
  v2 = sub_23A70D03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A6F26C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_23A70D120();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23A70D1C8();
}

uint64_t sub_23A6F273C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v7 = a4[2];
  if (a3)
  {
    v8 = (_QWORD *)(a3 + 16);
    swift_retain();
    v9 = sub_23A6F2D48(a1, a2, (uint64_t)(a4 + 4), v7, v8);
    swift_release();
  }
  else
  {
    if (!v7)
      return 0;
    v10 = a4[4] == a1 && a4[5] == a2;
    if (v10 || (sub_23A70D7EC() & 1) != 0)
      return 0;
    if (v7 == 1)
      return 0;
    if (a4[6] == a1 && a4[7] == a2 || (sub_23A70D7EC() & 1) != 0)
      return 1;
    if (v7 == 2)
      return 0;
    if (a4[8] == a1 && a4[9] == a2 || (sub_23A70D7EC() & 1) != 0)
      return 2;
    if (v7 == 3)
      return 0;
    if (a4[10] == a1 && a4[11] == a2 || (sub_23A70D7EC() & 1) != 0)
    {
      return 3;
    }
    else
    {
      v12 = a4 + 13;
      v13 = 3;
      v14 = 4;
      while (1)
      {
        if (v7 == v14)
          return 0;
        ++v13;
        if (*(v12 - 1) == a1 && *v12 == a2)
          break;
        v9 = v14++;
        v12 += 2;
        if ((sub_23A70D7EC() & 1) != 0)
          return v9;
      }
      return v13;
    }
  }
  return v9;
}

uint64_t sub_23A6F295C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v8 = v2[1];
  v6 = v2 + 1;
  v7 = v8;
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  *v6 = v8;
  if ((result & 1) == 0)
  {
    result = sub_23A6F2AF0(0, *(_QWORD *)(v7 + 16) + 1, 1);
    v7 = *v6;
  }
  v11 = *(_QWORD *)(v7 + 16);
  v10 = *(_QWORD *)(v7 + 24);
  if (v11 >= v10 >> 1)
  {
    result = sub_23A6F2AF0(v10 > 1, v11 + 1, 1);
    v7 = *v6;
  }
  *(_QWORD *)(v7 + 16) = v11 + 1;
  v12 = v7 + 16 * v11;
  *(_QWORD *)(v12 + 32) = a1;
  *(_QWORD *)(v12 + 40) = a2;
  v3[1] = v7;
  v13 = *(_QWORD *)(v7 + 16);
  v14 = *v3;
  if (*v3)
  {
    swift_beginAccess();
    if (MEMORY[0x23B854560](*(_QWORD *)(v14 + 16) & 0x3FLL) >= v13)
    {
      result = swift_isUniquelyReferenced_native();
      v15 = *v3;
      if (!(_DWORD)result)
      {
        if (!v15)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        v15 = sub_23A70D0A8();
        result = swift_release();
        *v3 = v15;
      }
      if (v15)
        return sub_23A70D060();
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v13 < 0x10)
  {
    return result;
  }
  return sub_23A6F2B0C();
}

uint64_t sub_23A6F2AD4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A700050(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A6F2AF0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A7001D0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A6F2B0C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v1 = *v0;
  v2 = v0[1];
  if (*v0)
  {
    swift_beginAccess();
    v3 = *(_QWORD *)(v1 + 24) & 0x3FLL;
    v4 = *(_QWORD *)(v2 + 16);
    if (v3)
      goto LABEL_7;
  }
  else
  {
    v3 = 0;
    v4 = *(_QWORD *)(v2 + 16);
  }
  if (v4 < 0x10)
  {
    v5 = 0;
    goto LABEL_11;
  }
LABEL_7:
  v6 = MEMORY[0x23B854584](v4);
  if (v3 <= v6)
    v7 = v6;
  else
    v7 = v3;
  v5 = sub_23A6F2BAC(v2, v7, 0, v3);
LABEL_11:
  result = swift_release();
  *v0 = v5;
  return result;
}

uint64_t sub_23A6F2BAC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = MEMORY[0x23B854584](*(_QWORD *)(a1 + 16));
  v9 = 0;
  if ((a3 & 1) != 0)
    v10 = 0;
  else
    v10 = a2;
  if (v10 <= v8)
    v10 = v8;
  if (v10 <= a4)
    v11 = a4;
  else
    v11 = v10;
  if (v11 >= 5)
  {
    v9 = MEMORY[0x23B854590]();
    sub_23A6F2C30(a1, (_QWORD *)(v9 + 16));
  }
  return v9;
}

uint64_t sub_23A6F2C30(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v4 = 0;
    while (1)
    {
      sub_23A70D870();
      swift_bridgeObjectRetain();
      sub_23A70D45C();
      result = sub_23A70D894();
      if (__OFSUB__(1 << *a2, 1))
        break;
      v5 = sub_23A70D048();
      swift_bridgeObjectRelease();
      if (v5)
      {
        while (1)
          sub_23A70D084();
      }
      result = sub_23A70D078();
      if (++v4 == v2)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23A6F2D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;

  sub_23A70D870();
  sub_23A70D45C();
  result = sub_23A70D894();
  if (__OFSUB__(1 << *a5, 1))
  {
    __break(1u);
  }
  else
  {
    sub_23A70D048();
    v10 = sub_23A70D06C();
    v11 = v10;
    if ((v12 & 1) == 0)
    {
      v13 = (_QWORD *)(a3 + 16 * v10);
      if (*v13 != a1 || v13[1] != a2)
      {
        do
        {
          if ((sub_23A70D7EC() & 1) != 0)
            break;
          sub_23A70D084();
          v14 = sub_23A70D06C();
          v11 = v14;
          if ((v15 & 1) != 0)
            break;
          v16 = (_QWORD *)(a3 + 16 * v14);
        }
        while (*v16 != a1 || v16[1] != a2);
      }
    }
    return v11;
  }
  return result;
}

uint64_t sub_23A6F2EB0(uint64_t result, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (result < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v3 = v2;
  v5 = result;
  v8 = v2[1];
  v6 = v2 + 1;
  v7 = v8;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v6 = v8;
  if (isUniquelyReferenced_nonNull_native && (unint64_t)v5 <= *(_QWORD *)(v7 + 24) >> 1)
  {
    v10 = *v3;
    if (*v3)
      goto LABEL_5;
  }
  else
  {
    if (*(_QWORD *)(v7 + 16) <= v5)
      v15 = v5;
    else
      v15 = *(_QWORD *)(v7 + 16);
    sub_23A6F2AF0(isUniquelyReferenced_nonNull_native, v15, 0);
    v7 = *v6;
    v10 = *v3;
    if (*v3)
    {
LABEL_5:
      swift_beginAccess();
      v11 = *(_QWORD *)(v10 + 16) & 0x3FLL;
      v12 = MEMORY[0x23B854584](v5);
      v13 = v12;
      if ((a2 & 1) != 0)
      {
        v14 = v12;
        if (v11 >= v12)
          goto LABEL_20;
      }
      else
      {
        swift_beginAccess();
        v14 = *(_QWORD *)(v10 + 24) & 0x3FLL;
        if (v11 >= v13)
          goto LABEL_20;
      }
LABEL_16:
      if (v14 <= v13)
        v17 = v13;
      else
        v17 = v14;
      goto LABEL_30;
    }
  }
  v16 = MEMORY[0x23B854584](v5);
  v13 = v16;
  v11 = 0;
  if ((a2 & 1) != 0)
    v14 = v16;
  else
    v14 = 0;
  if (v16 > 0)
    goto LABEL_16;
LABEL_20:
  if (v14 <= v13)
    v18 = v13;
  else
    v18 = v14;
  result = MEMORY[0x23B854584](*(_QWORD *)(v7 + 16));
  if (result <= v18)
    v19 = v18;
  else
    v19 = result;
  if (v19 < v11)
  {
    if (v14 <= v19)
      v17 = v19;
    else
      v17 = v14;
LABEL_30:
    v20 = sub_23A6F2BAC(v7, v17, 0, v14);
    result = swift_release();
    *v3 = v20;
    return result;
  }
  if (!v10 || (result = swift_isUniquelyReferenced_native(), (_DWORD)result))
  {
    v21 = *v3;
    if (*v3)
      goto LABEL_35;
LABEL_39:
    if (!v14)
      return result;
    __break(1u);
    goto LABEL_41;
  }
  result = *v3;
  if (!*v3)
  {
LABEL_42:
    __break(1u);
    return result;
  }
  v21 = sub_23A70D0A8();
  result = swift_release();
  *v3 = v21;
  if (!v21)
    goto LABEL_39;
LABEL_35:
  result = swift_beginAccess();
  if ((*(_QWORD *)(v21 + 24) & 0x3FLL) != v14)
    *(_QWORD *)(v21 + 24) = *(_QWORD *)(v21 + 24) & 0xFFFFFFFFFFFFFFC0 | v14 & 0x3F;
  return result;
}

unint64_t sub_23A6F3090(int64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(v2[1] + 16);
  v5 = *v2;
  if (!*v2)
  {
    if (v4)
      return sub_23A6F32FC(a1);
    goto LABEL_15;
  }
  swift_beginAccess();
  if ((*(_QWORD *)(v5 + 16) & 0x3FLL) == (*(_QWORD *)(v5 + 24) & 0x3FLL))
  {
    if (!v4)
      goto LABEL_15;
  }
  else if (v4 <= sub_23A70D09C())
  {
LABEL_15:
    v10 = sub_23A6F32FC(a1);
    sub_23A6F2B0C();
    return v10;
  }
  result = swift_isUniquelyReferenced_native();
  v8 = *v2;
  if (!(_DWORD)result)
  {
    if (!v8)
      goto LABEL_20;
    v8 = sub_23A70D0A8();
    result = swift_release();
    *v2 = v8;
  }
  if (v8)
  {
    swift_retain();
    result = sub_23A6F33D4(a2, (_QWORD *)(v8 + 16), v8 + 32, (uint64_t)v2);
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (a1 + 1 >= a1)
    {
      v9 = v2[1];
      swift_retain();
      sub_23A6F35A4(a1, a1 + 1, v9, (_QWORD *)(v8 + 16));
      swift_release();
      swift_release();
      return sub_23A6F32FC(a1);
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_23A6F320C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_23A70034C(v5);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v5 + 40 * a1;
    v10 = *(_QWORD *)(v8 + 32);
    v11 = *(_QWORD *)(v8 + 40);
    v9 = v8 + 32;
    v12 = *(_BYTE *)(v9 + 16);
    *(_QWORD *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v11;
    *(_BYTE *)(a2 + 16) = v12;
    *(_OWORD *)(a2 + 24) = *(_OWORD *)(v9 + 24);
    if ((uint64_t)(v7 - a1) >= 0)
    {
      result = (uint64_t)memmove((void *)v9, (const void *)(v9 + 40), 40 * (v7 - a1));
      *(_QWORD *)(v5 + 16) = v7;
      *v2 = v5;
      return result;
    }
  }
  result = sub_23A70D78C();
  __break(1u);
  return result;
}

uint64_t sub_23A6F32FC(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_23A700338(v3);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      v7 = v3 + 16 * a1;
      v8 = *(_QWORD *)(v7 + 32);
      memmove((void *)(v7 + 32), (const void *)(v7 + 48), 16 * v6);
      *(_QWORD *)(v3 + 16) = v5;
      *v1 = v3;
      return v8;
    }
  }
  result = sub_23A70D78C();
  __break(1u);
  return result;
}

unint64_t sub_23A6F33D4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = a1;
  v15 = sub_23A70D048();
  sub_23A70D084();
  if (!v15)
    return sub_23A70D060();
  v7 = a1;
  v8 = sub_23A70D054();
  while (1)
  {
    result = sub_23A70D06C();
    if ((v10 & 1) != 0)
      break;
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      break;
    }
    if (result >= *(_QWORD *)(*(_QWORD *)(a4 + 8) + 16))
      goto LABEL_16;
    sub_23A70D870();
    swift_bridgeObjectRetain();
    sub_23A70D45C();
    v11 = sub_23A70D894();
    result = swift_bridgeObjectRelease();
    v12 = 1 << *a2;
    if (__OFSUB__(v12, 1))
      goto LABEL_17;
    v13 = (v12 - 1) & v11;
    if (v6 >= v8)
    {
      if (v13 < v8)
        goto LABEL_3;
LABEL_12:
      if (v6 < v13)
        goto LABEL_3;
      goto LABEL_13;
    }
    if (v13 < v8)
      goto LABEL_12;
LABEL_13:
    sub_23A70D06C();
    sub_23A70D060();
    v6 = v7;
LABEL_3:
    sub_23A70D084();
    v7 = a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A6F35A4(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;

  v5 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (v5 >= 1)
  {
    v7 = result;
    v8 = *(_QWORD *)(a3 + 16);
    v9 = v8 - v5;
    if ((uint64_t)v8 < v5)
      ++v9;
    if (result < v9 >> 1)
    {
      result = MEMORY[0x23B854560](*a4 & 0x3FLL);
      if (result / 3 > v7)
      {
        if (v7 < 0)
        {
LABEL_64:
          __break(1u);
          goto LABEL_65;
        }
        if (v8 < v7)
        {
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
        if (v7)
        {
          swift_retain();
          v10 = 0;
          while (1)
          {
            sub_23A70D870();
            swift_bridgeObjectRetain();
            sub_23A70D45C();
            result = sub_23A70D894();
            if (__OFSUB__(1 << *a4, 1))
              break;
            if (sub_23A70D048())
            {
              while (1)
              {
                v11 = sub_23A70D06C();
                if ((v12 & 1) == 0 && v11 == v10)
                  break;
                sub_23A70D084();
              }
            }
            result = v10 + v5;
            if (__OFADD__(v10, v5))
              goto LABEL_56;
            ++v10;
            sub_23A70D078();
            swift_bridgeObjectRelease();
            if (v10 == v7)
            {
              result = swift_release();
              goto LABEL_20;
            }
          }
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        goto LABEL_20;
      }
      sub_23A70D048();
      v19 = sub_23A70D06C();
      if ((v20 & 1) != 0 || v19 >= v7)
      {
LABEL_32:
        result = sub_23A70D084();
LABEL_20:
        v13 = a4[1];
        if (__OFSUB__(v13 >> 6, v5))
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        v14 = 1 << *a4;
        v15 = __OFSUB__(v14, 1);
        v16 = v14 - 1;
        if (v15)
        {
LABEL_63:
          __break(1u);
          goto LABEL_64;
        }
        v17 = (v16 & (((v13 >> 6) - v5) >> 63)) + (v13 >> 6) - v5;
        if (v17 < v16)
          v16 = 0;
        a4[1] = a4[1] & 0x3FLL | ((v17 - v16) << 6);
        return result;
      }
      if (!__OFADD__(v19, v5))
      {
        sub_23A70D078();
        goto LABEL_32;
      }
      __break(1u);
LABEL_38:
      sub_23A70D048();
      v21 = sub_23A70D06C();
      if ((v22 & 1) == 0 && v21 >= v4)
      {
        v15 = __OFSUB__(v21, v5);
        result = v21 - v5;
        if (v15)
        {
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        sub_23A70D078();
      }
      return sub_23A70D084();
    }
    v4 = a2;
    v18 = v8 - a2;
    if (__OFSUB__(v8, a2))
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    result = MEMORY[0x23B854560](*a4 & 0x3FLL);
    if (v18 >= result / 3)
      goto LABEL_38;
    if ((uint64_t)v8 < v4)
    {
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    if (v4 < 0)
    {
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    if (v8 != v4)
    {
      if (v8 <= v4)
      {
LABEL_68:
        __break(1u);
        return result;
      }
      swift_retain();
      while (1)
      {
        sub_23A70D870();
        swift_bridgeObjectRetain();
        sub_23A70D45C();
        result = sub_23A70D894();
        if (__OFSUB__(1 << *a4, 1))
          goto LABEL_58;
        if (sub_23A70D048())
        {
          while (1)
          {
            v23 = sub_23A70D06C();
            if ((v24 & 1) == 0 && v23 == v4)
              break;
            sub_23A70D084();
          }
        }
        result = v4 - v5;
        if (__OFSUB__(v4, v5))
          goto LABEL_59;
        ++v4;
        sub_23A70D078();
        swift_bridgeObjectRelease();
        if (v4 == v8)
          return swift_release();
      }
    }
  }
  return result;
}

void sub_23A6F3A40(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23A70D75C();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B854BCCLL);
}

uint64_t sub_23A6F3AA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD *v17;

  v2 = MEMORY[0x24BEE4AF8];
  v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a1 + 16);
  sub_23A6F2EB0(v3, 0);
  sub_23A6F2AD4(0, v3, 0);
  v4 = v2;
  swift_bridgeObjectRetain();
  if (v3)
  {
    v5 = (_OWORD *)(a1 + 72);
    do
    {
      v7 = *((_QWORD *)v5 - 5);
      v6 = *((_QWORD *)v5 - 4);
      v9 = *((_QWORD *)v5 - 3);
      v8 = *((_QWORD *)v5 - 2);
      v10 = *((_BYTE *)v5 - 8);
      v16 = *v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      if (!v6)
        break;
      result = sub_23A6F273C(v7, v6, 0, v17);
      if ((v12 & 1) == 0)
      {
        __break(1u);
        return result;
      }
      sub_23A6F295C(v7, v6);
      v14 = *(_QWORD *)(v4 + 16);
      v13 = *(_QWORD *)(v4 + 24);
      if (v14 >= v13 >> 1)
        sub_23A6F2AD4(v13 > 1, v14 + 1, 1);
      v5 = (_OWORD *)((char *)v5 + 56);
      *(_QWORD *)(v4 + 16) = v14 + 1;
      v15 = v4 + 40 * v14;
      *(_QWORD *)(v15 + 32) = v9;
      *(_QWORD *)(v15 + 40) = v8;
      *(_BYTE *)(v15 + 48) = v10;
      *(_OWORD *)(v15 + 56) = v16;
      swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  swift_bridgeObjectRelease();
  return 0;
}

_QWORD *sub_23A6F3C10(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;

  v2 = v1;
  v4 = sub_23A70CFF4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[2] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalSceneStore.WorkspaceDelegate(0)), sel_init);
  sub_23A70CFE8();
  sub_23A70CFD0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = objc_allocWithZone(MEMORY[0x24BE38110]);
  v9 = (void *)sub_23A70D438();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithIdentifier_, v9);

  v2[3] = v10;
  v2[4] = sub_23A6F3AA8(MEMORY[0x24BEE4AF8]);
  v2[5] = v11;
  v2[6] = v12;
  sub_23A70D030();
  objc_msgSend(v10, sel_setDelegate_, v2[2]);
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v14 = (_QWORD *)(a1 + 64);
    do
    {
      v15 = *(v14 - 3);
      v16 = *((_BYTE *)v14 - 16);
      v17 = *(v14 - 1);
      v18 = *v14;
      *(_QWORD *)&v21 = *(v14 - 4);
      *((_QWORD *)&v21 + 1) = v15;
      v22 = v16;
      v23 = v17;
      v24 = v18;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_23A6F1860(&v21);
      swift_release();
      swift_bridgeObjectRelease();
      v14 += 5;
      --v13;
    }
    while (v13);
  }
  return v2;
}

uint64_t sub_23A6F3DA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6F3DCC(uint64_t a1)
{
  return sub_23A6F11A4(a1);
}

uint64_t type metadata accessor for LocalSceneStore.WorkspaceDelegate(uint64_t a1)
{
  return sub_23A6F3DF4(a1, (uint64_t *)&unk_2569B0518);
}

uint64_t sub_23A6F3DF4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A6F3E30(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_23A6F3E68(void *a1)
{
  uint64_t v1;

  return sub_23A6F2030(a1, v1 + 16);
}

uint64_t sub_23A6F3E70()
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

void sub_23A6F3E98(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_23A6F06DC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

id sub_23A6F3EA0(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_setForeground_, *(unsigned __int8 *)(*(_QWORD *)(v1 + 16) + 16));
}

uint64_t sub_23A6F3EB4()
{
  return type metadata accessor for LocalSceneStore(0);
}

uint64_t sub_23A6F3EBC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70D03C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for LocalSceneStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LocalSceneStore.scenes.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of LocalSceneStore.subscript.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of LocalSceneStore.insertScene(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of LocalSceneStore.removeScene(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of LocalSceneStore.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_23A6F3F94()
{
  return type metadata accessor for LocalSceneStore.WorkspaceDelegate(0);
}

uint64_t sub_23A6F3F9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70D03C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t destroy for LocalSceneStore.Configuration()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for LocalSceneStore.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for LocalSceneStore.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LocalSceneStore.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalSceneStore.Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalSceneStore.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalSceneStore.Configuration()
{
  return &type metadata for LocalSceneStore.Configuration;
}

uint64_t sub_23A6F41F0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = v1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02E0, type metadata accessor for LocalSceneStore.WorkspaceDelegate, (uint64_t)&unk_23A710B80);
  v4 = a1;
  sub_23A70D00C();
  swift_release();
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate__scenes);
  v6 = swift_beginAccess();
  MEMORY[0x23B854950](v6);
  if (*(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23A70D4B0();
  sub_23A70D4C8();
  sub_23A70D4A4();
  swift_endAccess();
  swift_getKeyPath();
  sub_23A70D018();
  return swift_release();
}

uint64_t sub_23A6F4358(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v20;

  v3 = v2;
  if (a1 >> 62)
    goto LABEL_18;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v5)
  {
    v6 = 0;
    v20 = v3;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x23B854BC0](v6, a1);
      else
        v7 = *(id *)(a1 + 8 * v6 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_identifier, v20);
      v10 = sub_23A70D444();
      v12 = v11;

      v13 = objc_msgSend(a2, sel_identifier);
      v3 = sub_23A70D444();
      v15 = v14;

      if (v10 == v3 && v12 == v15)
      {

        swift_bridgeObjectRelease_n();
        return v6;
      }
      v17 = sub_23A70D7EC();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
        return v6;
      v18 = v6 + 1;
      if (__OFADD__(v6, 1))
        break;
      ++v6;
      if (v18 == v5)
        return 0;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v5 = sub_23A70D75C();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_23A6F44F8(unint64_t *a1, void *a2)
{
  uint64_t v2;
  unint64_t v5;
  char v6;
  char v7;
  id v8;
  unint64_t i;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  unint64_t v23;
  id v24;
  id v25;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  unint64_t v39;

  v5 = swift_bridgeObjectRetain();
  v38 = a2;
  v39 = sub_23A6F4358(v5, a2);
  v7 = v6;
  swift_bridgeObjectRelease();
  v37 = v2;
  if (v2)
    return v39;
  if ((v7 & 1) == 0)
  {
    v8 = (id)(v39 + 1);
    if (__OFADD__(v39, 1))
      goto LABEL_60;
    if (*a1 >> 62)
    {
LABEL_61:
      swift_bridgeObjectRetain();
      v35 = sub_23A70D75C();
      swift_bridgeObjectRelease();
      if (v8 != (id)v35)
        goto LABEL_6;
    }
    else if (v8 != *(id *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (i = v39 + 5; ; ++i)
      {
        v10 = i - 4;
        v11 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          v12 = (id)MEMORY[0x23B854BC0](i - 4);
        }
        else
        {
          if ((v10 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
            goto LABEL_61;
          }
          if (v10 >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_51;
          v12 = *(id *)(v11 + 8 * i);
        }
        v13 = v12;
        v14 = objc_msgSend(v12, sel_identifier, v37);
        v15 = sub_23A70D444();
        v17 = v16;

        v8 = objc_msgSend(v38, sel_identifier);
        v18 = sub_23A70D444();
        v20 = v19;

        if (v15 == v18 && v17 == v20)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_38;
        }
        v22 = sub_23A70D7EC();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v22 & 1) != 0)
          goto LABEL_38;
        if (v10 != v39)
          break;
LABEL_35:
        if (__OFADD__(v39, 1))
          goto LABEL_53;
        ++v39;
LABEL_38:
        v8 = (id)(i - 3);
        if (__OFADD__(v10, 1))
          goto LABEL_52;
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          v32 = sub_23A70D75C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v32 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v8 == (id)v32)
          return v39;
      }
      v23 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v24 = (id)MEMORY[0x23B854BC0](v39, *a1);
        v23 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_21:
          if ((v10 & 0x8000000000000000) != 0)
            goto LABEL_56;
          if (v10 >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_57;
          v25 = *(id *)(v23 + 8 * i);
          goto LABEL_24;
        }
      }
      else
      {
        if ((v39 & 0x8000000000000000) != 0)
          goto LABEL_54;
        if (v39 >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_55;
        v24 = *(id *)(v23 + 8 * v39 + 32);
        if ((v23 & 0xC000000000000001) == 0)
          goto LABEL_21;
      }
      v25 = (id)MEMORY[0x23B854BC0](i - 4, v23);
      v23 = *a1;
LABEL_24:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v23;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v23 & 0x8000000000000000) != 0
        || (v23 & 0x4000000000000000) != 0)
      {
        sub_23A6F3A40(v23);
      }
      v27 = *(void **)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v39 + 0x20);
      *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v39 + 0x20) = v25;

      sub_23A70D4A4();
      v28 = *a1;
      v29 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v28;
      if (!v29 || (v28 & 0x8000000000000000) != 0 || (v28 & 0x4000000000000000) != 0)
        sub_23A6F3A40(v28);
      if ((v10 & 0x8000000000000000) != 0)
        goto LABEL_58;
      v30 = v28 & 0xFFFFFFFFFFFFFF8;
      if (v10 >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_59;
      v31 = *(void **)(v30 + 8 * i);
      *(_QWORD *)(v30 + 8 * i) = v24;

      sub_23A70D4A4();
      goto LABEL_35;
    }
    return v39;
  }
  v33 = *a1;
  if (!(v33 >> 62))
    return *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v36 = sub_23A70D75C();
  swift_bridgeObjectRelease();
  return v36;
}

uint64_t sub_23A6F48C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_23A70D75C();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_23A70D75C();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_23A70D75C();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x23B854BCC](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_23A6F4D5C();
  swift_arrayDestroy();
  if (!v5)
    return sub_23A70D4A4();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_23A70D75C();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_23A70D4A4();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_23A70D75C();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_23A70D78C();
  __break(1u);
  return result;
}

void sub_23A6F4BC0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B02E0, type metadata accessor for LocalSceneStore.WorkspaceDelegate, (uint64_t)&unk_23A710B80);
  v4 = a1;
  sub_23A70D00C();
  swift_release();
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  v5 = (unint64_t *)(v2 + OBJC_IVAR____TtCC12DrawingBoard15LocalSceneStore17WorkspaceDelegate__scenes);
  swift_beginAccess();
  v6 = sub_23A6F44F8(v5, v4);

  if (*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23A70D75C();
    swift_bridgeObjectRelease();
    if (v7 >= v6)
      goto LABEL_3;
  }
  else
  {
    v7 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7 >= v6)
    {
LABEL_3:
      sub_23A6F48C8(v6, v7);
      swift_endAccess();
      swift_getKeyPath();
      sub_23A70D018();
      swift_release();
      return;
    }
  }
  __break(1u);
}

unint64_t sub_23A6F4D5C()
{
  unint64_t result;

  result = qword_2569B0528;
  if (!qword_2569B0528)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569B0528);
  }
  return result;
}

uint64_t sub_23A6F4D98(void *a1)
{
  uint64_t v1;

  return sub_23A6F2214(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23A6F4DA0()
{
  return swift_deallocObject();
}

uint64_t objectdestroy_6Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

id sub_23A6F4DE0(void *a1)
{
  uint64_t v1;

  return sub_23A6F2350(a1, v1 + 16);
}

uint64_t sub_23A6F4DE8()
{
  return swift_deallocObject();
}

uint64_t sub_23A6F4DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_23A6F4E40(uint64_t *a1)
{
  sub_23A6F4E70(*a1, a1[1]);
  return a1;
}

uint64_t sub_23A6F4E70(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A6F4EA0()
{
  uint64_t v0;

  return sub_23A6F147C(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_23A6F4EBC()
{
  uint64_t v0;

  return sub_23A6F0D30(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23A6F4ED4()
{
  return sub_23A70D1BC();
}

unint64_t sub_23A6F4EF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0548;
  if (!qword_2569B0548)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0538);
    result = MEMORY[0x23B855268](&unk_23A711650, v1);
    atomic_store(result, (unint64_t *)&qword_2569B0548);
  }
  return result;
}

id sub_23A6F4F88()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContentBuilderBox();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContentBuilderBox()
{
  return objc_opt_self();
}

uint64_t destroy for AnyFBValue()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AnyFBValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v3 = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AnyFBValue(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
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
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

_OWORD *assignWithTake for AnyFBValue(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneEvent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyFBValue()
{
  return &type metadata for AnyFBValue;
}

uint64_t sub_23A6F52F0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A6F52F8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23A6F5374(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = ((v6 + 8) & ~v6) + *(_QWORD *)(v5 + 64);
  v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || v7 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v12 = ((unint64_t)a1 + v6 + 8) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 8) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
  }
  return a1;
}

uint64_t sub_23A6F5430(uint64_t a1, uint64_t a2)
{
  swift_release();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

_QWORD *sub_23A6F5474(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  swift_retain();
  v9(v7, v8, v4);
  return a1;
}

_QWORD *sub_23A6F54E4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_QWORD *sub_23A6F5554(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_23A6F55A4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_23A6F560C(_QWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  uint64_t v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 8) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(_WORD *)((char *)a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v7 + 8) & ~v7);
      v15 = *a1;
      if (*a1 >= 0xFFFFFFFFuLL)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
  }
  v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((_BYTE *)a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_23A6F56E0 + 4 * byte_23A710BF8[(v9 - 1)]))();
}

void sub_23A6F5750(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)) + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for FBValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FBValue);
}

uint64_t sub_23A6F5950()
{
  sub_23A70D7D4();
  return sub_23A70D414();
}

uint64_t sub_23A6F59A4(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char v14;
  void (*v15)(char *, _QWORD *, uint64_t);
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v7 = type metadata accessor for FBValue(0, a3, a4, a5);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - v12;
  sub_23A70D63C();
  v14 = MEMORY[0x23B854B00](*a1, *a2);
  v15 = *(void (**)(char *, _QWORD *, uint64_t))(v8 + 16);
  v15(v13, a1, v7);
  v15(v11, a2, v7);
  if ((v14 & 1) != 0)
    v16 = sub_23A70D42C();
  else
    v16 = 0;
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v11, v7);
  v17(v13, v7);
  return v16 & 1;
}

double sub_23A6F5ADC@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  _OWORD v11[6];

  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v5);
  sub_23A6F5B78(v5, a1[2], a1[3], a1[4], (uint64_t (**)())v11);
  v7 = v11[3];
  a2[2] = v11[2];
  a2[3] = v7;
  v8 = v11[5];
  a2[4] = v11[4];
  a2[5] = v8;
  result = *(double *)v11;
  v10 = v11[1];
  *a2 = v11[0];
  a2[1] = v10;
  return result;
}

uint64_t sub_23A6F5B78@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)();
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t (*v21)();
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t (*v26)();
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t (*v30)();
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)();
  uint64_t v34;
  uint64_t (*v35)();
  uint64_t result;
  uint64_t (**v37)();
  uint64_t (*v38)();
  uint64_t (*v39)();
  uint64_t (*v40)();
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (**v46)();
  uint64_t (*v47)();
  uint64_t (*v48)();
  uint64_t (*v49)();
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  char *v54;

  v52 = a3;
  v53 = a2;
  v46 = a5;
  v7 = type metadata accessor for FBValue(0, a2, a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v41 - v10;
  v51 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v54 = a1;
  v51((char *)&v41 - v10, (uint64_t)a1, v7);
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = (v12 + 40) & ~v12;
  v14 = v12 | 7;
  v43 = v13 + v9;
  v15 = (uint64_t (*)())swift_allocObject();
  v49 = v15;
  v50 = a4;
  v16 = v52;
  v17 = v53;
  *((_QWORD *)v15 + 2) = v53;
  *((_QWORD *)v15 + 3) = v16;
  *((_QWORD *)v15 + 4) = a4;
  v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v18((char *)v15 + v13, v11, v7);
  v42 = v18;
  v19 = a1;
  v20 = v51;
  v51(v11, (uint64_t)v19, v7);
  v21 = (uint64_t (*)())swift_allocObject();
  v48 = v21;
  *((_QWORD *)v21 + 2) = v17;
  *((_QWORD *)v21 + 3) = v16;
  v22 = v16;
  *((_QWORD *)v21 + 4) = a4;
  v44 = v13;
  v18((char *)v21 + v13, v11, v7);
  v23 = v54;
  v24 = v20;
  v20(v11, (uint64_t)v54, v7);
  v25 = v14;
  v26 = (uint64_t (*)())swift_allocObject();
  v47 = v26;
  v27 = v53;
  *((_QWORD *)v26 + 2) = v53;
  *((_QWORD *)v26 + 3) = v22;
  v28 = v50;
  *((_QWORD *)v26 + 4) = v50;
  v29 = v42;
  v42((char *)v26 + v13, v11, v7);
  v24(v11, (uint64_t)v23, v7);
  v45 = v25;
  v30 = (uint64_t (*)())swift_allocObject();
  v31 = v52;
  *((_QWORD *)v30 + 2) = v27;
  *((_QWORD *)v30 + 3) = v31;
  *((_QWORD *)v30 + 4) = v28;
  v32 = v44;
  v29((char *)v30 + v44, v11, v7);
  v51(v11, (uint64_t)v54, v7);
  v33 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v33 + 2) = v27;
  *((_QWORD *)v33 + 3) = v31;
  v34 = v50;
  *((_QWORD *)v33 + 4) = v50;
  v29((char *)v33 + v32, v11, v7);
  v29(v11, v54, v7);
  v35 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v35 + 2) = v53;
  *((_QWORD *)v35 + 3) = v31;
  *((_QWORD *)v35 + 4) = v34;
  result = ((uint64_t (*)(char *, char *, uint64_t))v29)((char *)v35 + v32, v11, v7);
  v37 = v46;
  v38 = v49;
  *v46 = sub_23A6F641C;
  v37[1] = v38;
  v39 = v47;
  v37[2] = (uint64_t (*)())sub_23A6F64E0;
  v37[3] = v39;
  v37[4] = (uint64_t (*)())sub_23A6F6550;
  v37[5] = v30;
  v40 = v48;
  v37[6] = (uint64_t (*)())sub_23A6F646C;
  v37[7] = v40;
  v37[8] = (uint64_t (*)())sub_23A6F65B8;
  v37[9] = v33;
  v37[10] = sub_23A6F66B4;
  v37[11] = v35;
  return result;
}

uint64_t sub_23A6F5E54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1 + *(int *)(v4 + 44));
  v7[1] = a1;
  swift_unknownObjectRetain();
  swift_setAtReferenceWritableKeyPath();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A6F5EEC()
{
  sub_23A70D468();
  sub_23A70D7D4();
  sub_23A70D7E0();
  sub_23A70D468();
  sub_23A70D7E0();
  sub_23A70D468();
  return 0;
}

uint64_t sub_23A6F5F94()
{
  sub_23A70D870();
  sub_23A6F5950();
  return sub_23A70D894();
}

uint64_t sub_23A6F5FD8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t **a4@<X8>)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char *v9;

  v6 = *a1;
  *a4 = a1;
  v7 = (uint64_t *)(v6 + *MEMORY[0x24BEE35B8]);
  v8 = v7[1];
  v9 = (char *)a4 + *(int *)(type metadata accessor for FBValue(0, *v7, v8, a3) + 44);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v9, a2, v8);
}

uint64_t sub_23A6F604C()
{
  sub_23A70D870();
  sub_23A6F5950();
  return sub_23A70D894();
}

uint64_t sub_23A6F6090(_QWORD *a1, _QWORD *a2, uint64_t *a3)
{
  return sub_23A6F59A4(a1, a2, a3[2], a3[3], a3[4]);
}

void sub_23A6F60A0()
{
  JUMPOUT(0x23B855268);
}

uint64_t sub_23A6F60B0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  char v21;
  uint64_t v23;
  _QWORD *v24;
  _QWORD v25[4];

  v24 = a2;
  v9 = type metadata accessor for FBValue(255, a3, a4, a5);
  v10 = sub_23A70D5E8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - v13;
  v15 = *(_QWORD *)(v9 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (uint64_t *)((char *)&v23 - v17);
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(a1 + 32))(v25, v16);
  v19 = swift_dynamicCast();
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  if ((v19 & 1) != 0)
  {
    v20(v14, 0, 1, v9);
    (*(void (**)(_QWORD *, char *, uint64_t))(v15 + 32))(v18, v14, v9);
    v21 = sub_23A6F59A4(v24, v18, a3, a4, a5);
    (*(void (**)(_QWORD *, uint64_t))(v15 + 8))(v18, v9);
  }
  else
  {
    v20(v14, 1, 1, v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    v21 = 0;
  }
  return v21 & 1;
}

uint64_t sub_23A6F6234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;

  swift_unknownObjectRetain();
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    type metadata accessor for FBValue(0, a3, a4, a5);
    sub_23A6F5E54(v9);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23A6F62CC()
{
  void (**v0)(_BYTE *);
  void (*v1)(_BYTE *);
  _BYTE v3[72];

  v1 = *v0;
  sub_23A70D870();
  v1(v3);
  return sub_23A70D894();
}

uint64_t sub_23A6F630C()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_23A6F632C()
{
  void (**v0)(_BYTE *);
  void (*v1)(_BYTE *);
  _BYTE v3[72];

  v1 = *v0;
  sub_23A70D870();
  v1(v3);
  return sub_23A70D894();
}

uint64_t sub_23A6F6368()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_23A6F6388(uint64_t a1, _OWORD *a2)
{
  uint64_t (*v2)(_OWORD *);
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[6];

  v2 = *(uint64_t (**)(_OWORD *))(a1 + 16);
  v3 = a2[3];
  v7[2] = a2[2];
  v7[3] = v3;
  v4 = a2[5];
  v7[4] = a2[4];
  v7[5] = v4;
  v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return v2(v7) & 1;
}

unint64_t sub_23A6F63D4()
{
  unint64_t result;

  result = qword_2569B0600;
  if (!qword_2569B0600)
  {
    result = MEMORY[0x23B855268](&unk_23A710CC8, &type metadata for AnyFBValue);
    atomic_store(result, (unint64_t *)&qword_2569B0600);
  }
  return result;
}

uint64_t sub_23A6F641C()
{
  uint64_t *v0;

  type metadata accessor for FBValue(0, v0[2], v0[3], v0[4]);
  return sub_23A6F5950();
}

uint64_t sub_23A6F646C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_0;

  v3 = v1[3];
  v4 = type metadata accessor for FBValue(0, v1[2], v3, v1[4]);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  v6 = (uint64_t)v1 + *(int *)(v4 + 44) + ((v5 + 40) & ~v5);
  a1[3] = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a1);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_0, v6, v3);
}

uint64_t sub_23A6F64E0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FBValue(0, v3, v4, v5) - 8) + 80);
  return sub_23A6F60B0(a1, (_QWORD *)((char *)v1 + ((v6 + 40) & ~v6)), v3, v4, v5);
}

uint64_t sub_23A6F6550@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t *boxed_opaque_existential_0;

  v3 = type metadata accessor for FBValue(0, v1[2], v1[3], v1[4]);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (char *)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  a1[3] = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a1);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v4 + 16))(boxed_opaque_existential_0, v5, v3);
}

uint64_t sub_23A6F65B8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FBValue(0, v3, v4, v5) - 8) + 80);
  return sub_23A6F6234(a1, (uint64_t)v1 + ((v6 + 40) & ~v6), v3, v4, v5);
}

uint64_t objectdestroyTm_0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;

  v1 = v0[3];
  v2 = type metadata accessor for FBValue(0, v0[2], v1, v0[4]);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  v4 = (char *)v0 + ((v3 + 40) & ~v3);
  swift_release();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(&v4[*(int *)(v2 + 44)], v1);
  return swift_deallocObject();
}

uint64_t sub_23A6F66B4()
{
  uint64_t *v0;

  type metadata accessor for FBValue(0, v0[2], v0[3], v0[4]);
  return sub_23A6F5EEC();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t sub_23A6F6730@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_23A6E5260();
  result = sub_23A70D1EC();
  *a1 = v3;
  return result;
}

uint64_t sub_23A6F677C()
{
  sub_23A6E5260();
  return sub_23A70D1F8();
}

__n128 SceneView.init(_:priority:forLayers:activationPolicy:)@<Q0>(void *a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  int v16;
  char v17;
  __int128 v18;
  int *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  __n128 result;
  _BYTE v24[4];
  int v25;
  uint64_t v26;
  __n128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = a2;
  v9 = sub_23A70CFF4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v24[-v14];
  v16 = *a3;
  v17 = *((_BYTE *)a3 + 4);
  v18 = *a4;
  v27 = (__n128)a4[1];
  v28 = v18;
  v26 = *((_QWORD *)a4 + 4);
  v25 = *((unsigned __int8 *)a4 + 40);
  *(_QWORD *)a5 = swift_getKeyPath();
  *(_QWORD *)(a5 + 8) = 0;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = swift_getKeyPath();
  *(_QWORD *)(a5 + 32) = 0;
  *(_BYTE *)(a5 + 40) = 0;
  v19 = (int *)type metadata accessor for SceneView();
  sub_23A70CFE8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v13, v15, v9);
  sub_23A70D390();
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v15, v9);
  v20 = sub_23A6E5E88();

  *(_QWORD *)(a5 + v19[7]) = v20;
  v21 = a5 + v19[8];
  *(_QWORD *)v21 = v29;
  *(_DWORD *)(v21 + 8) = v16;
  *(_BYTE *)(v21 + 12) = v17;
  v22 = a5 + v19[9];
  result = v27;
  *(_OWORD *)v22 = v28;
  *(__n128 *)(v22 + 16) = result;
  *(_QWORD *)(v22 + 32) = v26;
  *(_BYTE *)(v22 + 40) = v25;
  return result;
}

uint64_t SceneView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  char *v6;
  int *v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  _OWORD v40[2];
  _OWORD v41[6];
  _OWORD v42[2];

  v2 = v1;
  v38 = a1;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0608);
  MEMORY[0x24BDAC7A8](v37);
  v4 = (_OWORD *)((char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = sub_23A70CFF4();
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v6 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for SceneView();
  v34[1] = *(uint64_t *)((char *)v1 + v7[7]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
  sub_23A70D39C();
  v8 = (char *)v1 + v7[8];
  v9 = *(_QWORD *)v8;
  v10 = *((_DWORD *)v8 + 2);
  LOBYTE(v8) = v8[12];
  *(_QWORD *)&v41[0] = v9;
  DWORD2(v41[0]) = v10;
  BYTE12(v41[0]) = (_BYTE)v8;
  v11 = *v1;
  v12 = v2[1];
  v13 = *((_BYTE *)v2 + 16);
  sub_23A6F7798();
  v14 = sub_23A6F73B0(v11, v12, v13);
  v16 = v15;
  sub_23A6F77A4();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = v16;
  v18 = v2[3];
  v19 = v2[4];
  LOBYTE(v14) = *((_BYTE *)v2 + 40);
  sub_23A6F7798();
  v20 = sub_23A6F75B0(v18, v19, v14);
  v22 = v21;
  sub_23A6F77A4();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v20;
  *(_QWORD *)(v23 + 24) = v22;
  v24 = sub_23A6E58E4((uint64_t)v6, (uint64_t)v41, (uint64_t)sub_23A6DEC58, v17, (uint64_t)sub_23A6F77B0, v23);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v36);
  v25 = (__int128 *)((char *)v2 + v7[9]);
  v26 = v25[1];
  v39 = *v25;
  v40[0] = v26;
  *(_OWORD *)((char *)v40 + 9) = *(__int128 *)((char *)v25 + 25);
  swift_retain();
  sub_23A6F77E4((uint64_t)&v39);
  sub_23A6DFC08(v24, &v39, (uint64_t)v41);
  sub_23A6E13DC(v24 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity, (uint64_t)v4 + *(int *)(v37 + 52));
  swift_release();
  v27 = v41[5];
  v4[4] = v41[4];
  v4[5] = v27;
  v4[6] = v42[0];
  *(_OWORD *)((char *)v4 + 105) = *(_OWORD *)((char *)v42 + 9);
  v28 = v41[1];
  *v4 = v41[0];
  v4[1] = v28;
  v29 = v41[3];
  v4[2] = v41[2];
  v4[3] = v29;
  KeyPath = swift_getKeyPath();
  v31 = v38;
  sub_23A6F8C0C((uint64_t)v4, v38, &qword_2569B0608);
  v32 = v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569B0618) + 36);
  *(_QWORD *)v32 = KeyPath;
  *(_BYTE *)(v32 + 8) = 1;
  return sub_23A6F78AC((uint64_t)v4);
}

double sub_23A6F6C88@<D0>(_OWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23A6F8BC8, a1);
}

double sub_23A6F6C9C@<D0>(_OWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23A6F8BC8, a1);
}

uint64_t sub_23A6F6CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A6F6D78(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_23A6F8BC8);
}

uint64_t sub_23A6F6CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A6F6D78(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_23A6F8BC8);
}

double sub_23A6F6CE8@<D0>(_OWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23A6F8B84, a1);
}

double keypath_getTm@<D0>(void (*a1)(void)@<X3>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  a1();
  sub_23A70D1EC();
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

double sub_23A6F6D50@<D0>(_OWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23A6F8B84, a1);
}

uint64_t sub_23A6F6D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A6F6D78(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_23A6F8B84);
}

uint64_t sub_23A6F6D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  a5(a1, a2);
  swift_retain();
  return sub_23A70D1F8();
}

uint64_t sub_23A6F6DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A6F6D78(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_23A6F8B84);
}

uint64_t type metadata accessor for SceneView()
{
  uint64_t result;

  result = qword_2569B0678;
  if (!qword_2569B0678)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A6F6E34(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_23A70D1E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_23A70D588();
  v9 = sub_23A70D2A0();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_23A6F8508(1819242306, 0xE400000000000000, &v15);
    sub_23A70D5F4();
    _os_log_impl(&dword_23A6DA000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85534C](v12, -1, -1);
    MEMORY[0x23B85534C](v11, -1, -1);
  }

  sub_23A70D1D4();
  swift_getAtKeyPath();
  sub_23A6DF3F0(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_23A6F6FEC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[3];
  uint64_t v18;

  v6 = sub_23A70D1E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a3 = a1;
    return sub_23A6DF2FC(a1, 1);
  }
  else
  {
    sub_23A6DF2FC(a1, 0);
    v10 = sub_23A70D588();
    v11 = sub_23A70D2A0();
    v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v17[1] = a3;
      v15 = v14;
      v18 = v14;
      *(_DWORD *)v13 = 136315138;
      v17[2] = sub_23A6F8508(0xD000000000000017, 0x800000023A7180E0, &v18);
      sub_23A70D5F4();
      _os_log_impl(&dword_23A6DA000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85534C](v15, -1, -1);
      MEMORY[0x23B85534C](v13, -1, -1);
    }

    sub_23A70D1D4();
    swift_getAtKeyPath();
    sub_23A6DF3E4(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_23A6F71C8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD v19[3];
  uint64_t v20;

  v6 = sub_23A70D1E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a3 = a1;
    return sub_23A6DF2FC(a1, 1);
  }
  else
  {
    sub_23A6DF2FC(a1, 0);
    v10 = sub_23A70D588();
    v11 = sub_23A70D2A0();
    v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v19[1] = a3;
      v15 = v14;
      v20 = v14;
      *(_DWORD *)v13 = 136315138;
      v19[0] = v13 + 4;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AF7B0);
      v16 = sub_23A70D90C();
      v19[2] = sub_23A6F8508(v16, v17, &v20);
      sub_23A70D5F4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A6DA000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85534C](v15, -1, -1);
      MEMORY[0x23B85534C](v13, -1, -1);
    }

    sub_23A70D1D4();
    swift_getAtKeyPath();
    sub_23A6DF3E4(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_23A6F73B0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;

  v5 = sub_23A70D1E0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    v9 = sub_23A70D588();
    v10 = sub_23A70D2A0();
    v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      v15[0] = v12 + 4;
      v15[1] = sub_23A6F8508(0xD000000000000012, 0x800000023A718100, &v16);
      sub_23A70D5F4();
      _os_log_impl(&dword_23A6DA000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85534C](v13, -1, -1);
      MEMORY[0x23B85534C](v12, -1, -1);
    }

    sub_23A70D1D4();
    swift_getAtKeyPath();
    sub_23A6F77A4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v16;
  }
  return a1;
}

uint64_t sub_23A6F758C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A6F75B0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = sub_23A70D1E0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    v9 = sub_23A70D588();
    v10 = sub_23A70D2A0();
    v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v20 = v18;
      *(_DWORD *)v12 = 136315138;
      v17[1] = v12 + 4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569B06F0);
      v13 = sub_23A70D90C();
      v19 = sub_23A6F8508(v13, v14, &v20);
      sub_23A70D5F4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A6DA000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      v15 = v18;
      swift_arrayDestroy();
      MEMORY[0x23B85534C](v15, -1, -1);
      MEMORY[0x23B85534C](v12, -1, -1);
    }

    sub_23A70D1D4();
    swift_getAtKeyPath();
    sub_23A6F77A4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v20;
  }
  return a1;
}

uint64_t sub_23A6F7798()
{
  return swift_retain();
}

uint64_t sub_23A6F77A4()
{
  return swift_release();
}

uint64_t sub_23A6F77B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_23A6F77E4(uint64_t a1)
{
  sub_23A6DF314(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return a1;
}

uint64_t sub_23A6F7818@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_23A6E5260();
  result = sub_23A70D1EC();
  *a1 = v3;
  return result;
}

uint64_t sub_23A6F7864()
{
  sub_23A6E5260();
  return sub_23A70D1F8();
}

uint64_t sub_23A6F78AC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0608);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A6F78EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for SceneView(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v30 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v30 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    v9 = *((_BYTE *)a2 + 16);
    sub_23A6F7798();
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    v10 = a2[3];
    v11 = a2[4];
    v12 = *((_BYTE *)a2 + 40);
    sub_23A6F7798();
    *(_QWORD *)(a1 + 24) = v10;
    *(_QWORD *)(a1 + 32) = v11;
    *(_BYTE *)(a1 + 40) = v12;
    v13 = a3[6];
    v14 = a1 + v13;
    v15 = (uint64_t)a2 + v13;
    v16 = sub_23A70CFF4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
    *(_QWORD *)(v14 + *(int *)(v17 + 28)) = *(_QWORD *)(v15 + *(int *)(v17 + 28));
    v18 = a3[8];
    *(_QWORD *)(a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    v19 = (_QWORD *)(a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    *(_QWORD *)((char *)v19 + 5) = *(_QWORD *)((char *)v20 + 5);
    *v19 = *v20;
    v21 = a3[9];
    v22 = a1 + v21;
    v23 = (uint64_t)a2 + v21;
    v24 = *(_QWORD *)v23;
    v25 = *(_QWORD *)(v23 + 8);
    v26 = *(_QWORD *)(v23 + 16);
    v27 = *(_QWORD *)(v23 + 24);
    v28 = *(_QWORD *)(v23 + 32);
    v29 = *(_BYTE *)(v23 + 40);
    swift_retain();
    swift_retain();
    sub_23A6DF314(v24, v25, v26, v27, v28, v29);
    *(_QWORD *)v22 = v24;
    *(_QWORD *)(v22 + 8) = v25;
    *(_QWORD *)(v22 + 16) = v26;
    *(_QWORD *)(v22 + 24) = v27;
    *(_QWORD *)(v22 + 32) = v28;
    *(_BYTE *)(v22 + 40) = v29;
  }
  return a1;
}

uint64_t destroy for SceneView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23A6F77A4();
  sub_23A6F77A4();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
  swift_release();
  swift_release();
  v6 = a1 + *(int *)(a2 + 36);
  return sub_23A6DF3FC(*(_QWORD *)v6, *(_QWORD *)(v6 + 8), *(_QWORD *)(v6 + 16), *(_QWORD *)(v6 + 24), *(_QWORD *)(v6 + 32), *(_BYTE *)(v6 + 40));
}

uint64_t initializeWithCopy for SceneView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23A6F7798();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = a2[3];
  v10 = a2[4];
  v11 = *((_BYTE *)a2 + 40);
  sub_23A6F7798();
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_BYTE *)(a1 + 40) = v11;
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = (uint64_t)a2 + v12;
  v15 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
  *(_QWORD *)(v13 + *(int *)(v16 + 28)) = *(_QWORD *)(v14 + *(int *)(v16 + 28));
  v17 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)((char *)a2 + v17);
  *(_QWORD *)((char *)v18 + 5) = *(_QWORD *)((char *)v19 + 5);
  *v18 = *v19;
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = (uint64_t)a2 + v20;
  v23 = *(_QWORD *)v22;
  v24 = *(_QWORD *)(v22 + 8);
  v25 = *(_QWORD *)(v22 + 16);
  v26 = *(_QWORD *)(v22 + 24);
  v27 = *(_QWORD *)(v22 + 32);
  v28 = *(_BYTE *)(v22 + 40);
  swift_retain();
  swift_retain();
  sub_23A6DF314(v23, v24, v25, v26, v27, v28);
  *(_QWORD *)v21 = v23;
  *(_QWORD *)(v21 + 8) = v24;
  *(_QWORD *)(v21 + 16) = v25;
  *(_QWORD *)(v21 + 24) = v26;
  *(_QWORD *)(v21 + 32) = v27;
  *(_BYTE *)(v21 + 40) = v28;
  return a1;
}

uint64_t assignWithCopy for SceneView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23A6F7798();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_23A6F77A4();
  v9 = a2[3];
  v10 = a2[4];
  v11 = *((_BYTE *)a2 + 40);
  sub_23A6F7798();
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_BYTE *)(a1 + 40) = v11;
  sub_23A6F77A4();
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = (uint64_t)a2 + v12;
  v15 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
  *(_QWORD *)(v13 + *(int *)(v16 + 28)) = *(_QWORD *)(v14 + *(int *)(v16 + 28));
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = (uint64_t)a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v20 = *(_DWORD *)(v19 + 8);
  *(_BYTE *)(v18 + 12) = *(_BYTE *)(v19 + 12);
  *(_DWORD *)(v18 + 8) = v20;
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = (uint64_t)a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = *(_QWORD *)(v23 + 8);
  v26 = *(_QWORD *)(v23 + 16);
  v27 = *(_QWORD *)(v23 + 24);
  v28 = *(_QWORD *)(v23 + 32);
  v29 = *(_BYTE *)(v23 + 40);
  sub_23A6DF314(*(_QWORD *)v23, v25, v26, v27, v28, v29);
  v30 = *(_QWORD *)v22;
  v31 = *(_QWORD *)(v22 + 8);
  v32 = *(_QWORD *)(v22 + 16);
  v33 = *(_QWORD *)(v22 + 24);
  v34 = *(_QWORD *)(v22 + 32);
  *(_QWORD *)v22 = v24;
  *(_QWORD *)(v22 + 8) = v25;
  *(_QWORD *)(v22 + 16) = v26;
  *(_QWORD *)(v22 + 24) = v27;
  *(_QWORD *)(v22 + 32) = v28;
  v35 = *(_BYTE *)(v22 + 40);
  *(_BYTE *)(v22 + 40) = v29;
  sub_23A6DF3FC(v30, v31, v32, v33, v34, v35);
  return a1;
}

uint64_t initializeWithTake for SceneView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
  *(_QWORD *)(v7 + *(int *)(v10 + 28)) = *(_QWORD *)(v8 + *(int *)(v10 + 28));
  v11 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *(_QWORD *)((char *)v12 + 5) = *(_QWORD *)((char *)v13 + 5);
  *v12 = *v13;
  v14 = a3[9];
  v15 = (_OWORD *)(a1 + v14);
  v16 = (_OWORD *)(a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  *(_OWORD *)((char *)v15 + 25) = *(_OWORD *)((char *)v16 + 25);
  return a1;
}

uint64_t assignWithTake for SceneView(uint64_t a1, uint64_t a2, int *a3)
{
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23A6F77A4();
  v7 = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = v7;
  sub_23A6F77A4();
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
  *(_QWORD *)(v9 + *(int *)(v12 + 28)) = *(_QWORD *)(v10 + *(int *)(v12 + 28));
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_release();
  v13 = a3[8];
  v14 = a3[9];
  v15 = a1 + v13;
  v16 = a2 + v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_DWORD *)(v15 + 8) = *(_DWORD *)(v16 + 8);
  *(_BYTE *)(v15 + 12) = *(_BYTE *)(v16 + 12);
  v17 = a1 + v14;
  v18 = a2 + v14;
  v19 = *(_QWORD *)(v18 + 32);
  v20 = *(_BYTE *)(v18 + 40);
  v21 = *(_QWORD *)v17;
  v22 = *(_QWORD *)(v17 + 8);
  v23 = *(_QWORD *)(v17 + 16);
  v24 = *(_QWORD *)(v17 + 24);
  v25 = *(_QWORD *)(v17 + 32);
  v26 = *(_BYTE *)(v17 + 40);
  v27 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + 16) = v27;
  *(_QWORD *)(v17 + 32) = v19;
  *(_BYTE *)(v17 + 40) = v20;
  sub_23A6DF3FC(v21, v22, v23, v24, v25, v26);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A6F7FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 24), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A6F8080(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0610);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

void sub_23A6F8100()
{
  unint64_t v0;

  sub_23A6F8194();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23A6F8194()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2569B0688[0])
  {
    sub_23A70CFF4();
    v0 = sub_23A70D3A8();
    if (!v1)
      atomic_store(v0, qword_2569B0688);
  }
}

unint64_t sub_23A6F81EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569B06C8;
  if (!qword_2569B06C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0618);
    v2[0] = sub_23A6F8288(&qword_2569B06D0, &qword_2569B0608, MEMORY[0x24BDF44C8]);
    v2[1] = sub_23A6F8288(&qword_2569B06D8, &qword_2569B06E0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B855268](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569B06C8);
  }
  return result;
}

uint64_t sub_23A6F8288(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B855268](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A6F82C8@<X0>(uint64_t a1@<X8>)
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
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = sub_23A70D1E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A6F8C0C(v2, (uint64_t)v10, &qword_2569B0540);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_23A70D120();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_23A70D588();
    v14 = sub_23A70D2A0();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_23A6F8508(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_23A70D5F4();
      _os_log_impl(&dword_23A6DA000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85534C](v18, -1, -1);
      MEMORY[0x23B85534C](v16, -1, -1);
    }

    sub_23A70D1D4();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_23A6F8508(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A6F85D8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A6F8790((uint64_t)v12, *a3);
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
      sub_23A6F8790((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23A6F85D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A70D600();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A6F87CC(a5, a6);
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
  v8 = sub_23A70D708();
  if (!v8)
  {
    sub_23A70D744();
    __break(1u);
LABEL_17:
    result = sub_23A70D78C();
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

uint64_t sub_23A6F8790(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A6F87CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A6F8860(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A6F8A38(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A6F8A38(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A6F8860(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A6F89D4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A70D6E4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A70D744();
      __break(1u);
LABEL_10:
      v2 = sub_23A70D474();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A70D78C();
    __break(1u);
LABEL_14:
    result = sub_23A70D744();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A6F89D4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B06E8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A6F8A38(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B06E8);
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
  result = sub_23A70D78C();
  __break(1u);
  return result;
}

unint64_t sub_23A6F8B84()
{
  unint64_t result;

  result = qword_2569B06F8;
  if (!qword_2569B06F8)
  {
    result = MEMORY[0x23B855268](&unk_23A711A4C, &_s24__Key_sceneActionHandlerVN);
    atomic_store(result, (unint64_t *)&qword_2569B06F8);
  }
  return result;
}

unint64_t sub_23A6F8BC8()
{
  unint64_t result;

  result = qword_2569B0700;
  if (!qword_2569B0700)
  {
    result = MEMORY[0x23B855268](&unk_23A711918, &_s23__Key_sceneEventHandlerVN);
    atomic_store(result, (unint64_t *)&qword_2569B0700);
  }
  return result;
}

uint64_t sub_23A6F8C0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void static SceneActivationPolicy.activated.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 1;
  *(_QWORD *)(a1 + 8) = j_nullsub_1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 40) = 1;
}

double static SceneActivationPolicy.unspecified.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 40) = 4;
  return result;
}

uint64_t static SceneActivationPolicy.activated(transitioner:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = 1;
  *(_QWORD *)(a3 + 8) = a1;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 16) = a2;
  *(_BYTE *)(a3 + 40) = 1;
  return swift_retain();
}

uint64_t static SceneActivationPolicy.remainActivated.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23A70D8E8();
  *(_QWORD *)a1 = 3;
  *(_QWORD *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = j_nullsub_1;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 2;
  return result;
}

uint64_t static SceneActivationPolicy.remainActivated(transitioner:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23A70D8E8();
  *(_QWORD *)a3 = 3;
  *(_QWORD *)(a3 + 8) = v6;
  *(_QWORD *)(a3 + 16) = v7;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = a2;
  *(_BYTE *)(a3 + 40) = 2;
  return swift_retain();
}

double static SceneActivationPolicy.deactivated.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = nullsub_1;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t static SceneActivationPolicy.deactivated(transitioner:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)a3 = sub_23A6DEC58;
  *(_QWORD *)(a3 + 8) = v6;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 40) = 0;
  return swift_retain();
}

uint64_t SceneActivationPolicy.init(activateWithMaximumAttempts:transitioner:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = a3;
  *(_BYTE *)(a4 + 40) = 1;
  return result;
}

uint64_t SceneActivationPolicy.init(activateWithMaximumAttempts:withinPeriod:transitioner:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  *(_BYTE *)(a6 + 40) = 2;
  return result;
}

uint64_t sub_23A6F8DEC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23A6F8E10()
{
  __int128 *v0;
  uint64_t v1;
  __int128 v2;
  __int128 v3;

  sub_23A6F954C(v0, &v2);
  v1 = sub_23A70D720();
  MEMORY[0x24BDAC7A8](v1);
  sub_23A6F954C(v0, &v3);
  __asm { BR              X10 }
}

uint64_t sub_23A6F8EA8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for DeactivationSceneActivationPolicyModel();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v1 - 128);
  v0[3] = v2;
  v0[4] = sub_23A6E1420(&qword_2569B0728, (uint64_t (*)(uint64_t))type metadata accessor for DeactivationSceneActivationPolicyModel, (uint64_t)&unk_23A711D80);
  *v0 = v3;
  return swift_retain();
}

void sub_23A6F911C()
{
  __int128 *v0;
  __int128 v1;

  sub_23A6F954C(v0, &v1);
  __asm { BR              X10 }
}

uint64_t sub_23A6F9174()
{
  return 0x6176697463616544;
}

void sub_23A6F92B4()
{
  __int128 *v0;
  _OWORD v1[3];

  sub_23A6F954C(v0, v1);
  sub_23A6F911C();
}

uint64_t sub_23A6F92E8(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))((char *)sub_23A6F9324
                                                                 + 4 * byte_23A710E95[*(unsigned __int8 *)(a1 + 40)]))(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16));
}

BOOL sub_23A6F9324@<W0>(int a1@<W8>)
{
  return a1 == 0;
}

BOOL sub_23A6F9330@<W0>(uint64_t a1@<X2>, uint64_t a2@<X3>, int a3@<W8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return a3 == 4 && (v4 | v5 | v3 | a1 | a2) == 0;
}

BOOL sub_23A6F9354@<W0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1 == 1 && v2 == v1;
}

BOOL sub_23A6F9378@<W0>(int a1@<W8>)
{
  return a1 == 3;
}

void static SceneActivationPolicy.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X15 }
}

BOOL sub_23A6F93CC@<W0>(int a1@<W8>)
{
  return a1 == 0;
}

uint64_t sub_23A6F9438(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))((char *)sub_23A6F9474
                                                                 + 4 * byte_23A710E9F[*(unsigned __int8 *)(a1 + 40)]))(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16));
}

BOOL sub_23A6F9474@<W0>(int a1@<W8>)
{
  return a1 == 0;
}

BOOL sub_23A6F9480@<W0>(uint64_t a1@<X2>, uint64_t a2@<X3>, int a3@<W8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return a3 == 4 && (v4 | v5 | v3 | a1 | a2) == 0;
}

BOOL sub_23A6F94A4@<W0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1 == 1 && v2 == v1;
}

BOOL sub_23A6F94C8@<W0>(int a1@<W8>)
{
  return a1 == 3;
}

double static SceneActivationPolicy.remainActivatedWithUnlimitedAttempts.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = j_nullsub_1;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_BYTE *)(a1 + 40) = 3;
  return result;
}

uint64_t static SceneActivationPolicy.remainActivatedWithUnlimitedAttempts(transitioner:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 40) = 3;
  return swift_retain();
}

void SceneActivationPolicy.description.getter()
{
  __int128 *v0;
  _OWORD v1[3];

  sub_23A6F954C(v0, v1);
  sub_23A6F911C();
}

_OWORD *sub_23A6F954C(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SceneActivationPolicy()
{
  return &type metadata for SceneActivationPolicy;
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwxx_0(uint64_t a1)
{
  return sub_23A6DF3FC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_23A6DF314(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_23A6DF314(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_23A6DF3FC(v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v3;
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_23A6DF3FC(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s12DrawingBoard21SceneActivationPolicyV4KindOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A6F979C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) <= 3u)
    return *(unsigned __int8 *)(a1 + 40);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_23A6F97B4(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SceneActivationPolicy.Kind()
{
  return &type metadata for SceneActivationPolicy.Kind;
}

unint64_t sub_23A6F97E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0718;
  if (!qword_2569B0718)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0710);
    result = MEMORY[0x23B855268](&unk_23A70F8D8, v1);
    atomic_store(result, (unint64_t *)&qword_2569B0718);
  }
  return result;
}

uint64_t sub_23A6F9834(uint64_t a1)
{
  sub_23A6DF3FC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return a1;
}

void sub_23A6F9870(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[3];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v28 = a2;
  v6 = type metadata accessor for PresentationViewModel.Identity(0);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569AF2E8 != -1)
    swift_once();
  v9 = sub_23A70D0E4();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2569B4540);
  swift_retain_n();
  v11 = sub_23A70D0CC();
  v12 = sub_23A70D57C();
  v13 = os_log_type_enabled(v11, v12);
  v27 = a3;
  if (v13)
  {
    v14 = swift_slowAlloc();
    v26[1] = v10;
    v15 = v14;
    v16 = swift_slowAlloc();
    v29[0] = v16;
    *(_DWORD *)v15 = 136315394;
    sub_23A6E13DC(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity, (uint64_t)v8);
    v17 = &v8[*(int *)(v6 + 20)];
    v18 = *((_QWORD *)v17 + 1);
    *(_QWORD *)&v31 = *(_QWORD *)v17;
    *((_QWORD *)&v31 + 1) = v18;
    swift_bridgeObjectRetain();
    sub_23A70D468();
    sub_23A70CFF4();
    sub_23A6E1420(&qword_2569AF600, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    sub_23A70D7C8();
    sub_23A70D468();
    swift_bridgeObjectRelease();
    v19 = v31;
    sub_23A6E1460((uint64_t)v8);
    *(_QWORD *)&v31 = sub_23A6F8508(v19, *((unint64_t *)&v19 + 1), v29);
    sub_23A70D5F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 1024;
    LODWORD(v31) = a1 & 1;
    sub_23A70D5F4();
    _os_log_impl(&dword_23A6DA000, v11, v12, "#PresentationViewModel %s --BEGIN HOSTING CHANGE-- %{BOOL}d", (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x23B85534C](v16, -1, -1);
    MEMORY[0x23B85534C](v15, -1, -1);

    if ((a1 & 1) == 0)
    {
LABEL_5:
      v33 = 0;
      v31 = 0u;
      v32 = 0u;
      sub_23A6FB670((uint64_t)&v31);
      sub_23A6FEC0C((uint64_t)&v31);
      swift_getKeyPath();
      *(_QWORD *)&v31 = v3;
      sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
      sub_23A70D00C();
      swift_release();
      swift_beginAccess();
      v29[0] = *(_QWORD *)(v3 + 24);
      v30 = 0;
      swift_bridgeObjectRetain();
      sub_23A6FC614(v29, &v30);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  else
  {

    swift_release_n();
    if ((a1 & 1) == 0)
      goto LABEL_5;
  }
  *(_QWORD *)&v31 = 0;
  swift_getKeyPath();
  v29[0] = v3;
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  v30 = *(_QWORD *)(v3 + 24);
  swift_bridgeObjectRetain();
  sub_23A6FC614((uint64_t *)&v31, &v30);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  *(_QWORD *)&v31 = v3;
  sub_23A70D00C();
  swift_release();
  if (*(_BYTE *)(v3 + 32) != 1)
    goto LABEL_11;
  swift_getKeyPath();
  *(_QWORD *)&v31 = v3;
  sub_23A70D00C();
  swift_release();
  if (!*(_QWORD *)(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__scenePresenter))
    goto LABEL_11;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v20 = sub_23A70D5A0();
  swift_unknownObjectRelease();
  if (v20)
  {
    *((_QWORD *)&v32 + 1) = sub_23A70D0F0();
    v33 = MEMORY[0x24BEBC8F8];
    *(_QWORD *)&v31 = v20;
  }
  else
  {
LABEL_11:
    v33 = 0;
    v31 = 0u;
    v32 = 0u;
  }
  v21 = v27;
  sub_23A6FB670((uint64_t)&v31);
  sub_23A6FEC0C((uint64_t)&v31);
  swift_getKeyPath();
  *(_QWORD *)&v31 = v3;
  sub_23A70D00C();
  swift_release();
  *(_QWORD *)&v31 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  v22 = v28;
  sub_23A6FC464((uint64_t *)&v31, v28, v21);
  swift_bridgeObjectRelease();
  sub_23A6FCE7C(v22, v21);
LABEL_13:
  v23 = sub_23A70D0CC();
  v24 = sub_23A70D57C();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_23A6DA000, v23, v24, "#PresentationViewModel --END HOSTING CHANGE--", v25, 2u);
    MEMORY[0x23B85534C](v25, -1, -1);
  }

}

void sub_23A6F9E2C(int a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  void *v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v2 = v1;
  swift_getKeyPath();
  *(_QWORD *)&v9 = v1;
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  v4 = *(unsigned __int8 *)(v1 + 32);
  swift_getKeyPath();
  sub_23A70D00C();
  swift_release();
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  *(_BYTE *)(v1 + 32) = a1;
  swift_getKeyPath();
  sub_23A70D018();
  swift_release();
  swift_getKeyPath();
  sub_23A70D00C();
  swift_release();
  v5 = *(void **)(v1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
  swift_getKeyPath();
  *(_QWORD *)&v9 = v5;
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  v6 = v5;
  sub_23A70D00C();
  swift_release();
  v7 = v6[OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting];

  if (v7 == 1 && ((v4 ^ a1) & 1) != 0)
  {
    if ((a1 & 1) == 0)
      goto LABEL_7;
    swift_getKeyPath();
    *(_QWORD *)&v9 = v2;
    sub_23A70D00C();
    swift_release();
    if (!*(_QWORD *)(v2 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__scenePresenter))
      goto LABEL_7;
    swift_getObjectType();
    swift_unknownObjectRetain();
    v8 = sub_23A70D5A0();
    swift_unknownObjectRelease();
    if (v8)
    {
      *((_QWORD *)&v10 + 1) = sub_23A70D0F0();
      v11 = MEMORY[0x24BEBC8F8];
      *(_QWORD *)&v9 = v8;
    }
    else
    {
LABEL_7:
      v11 = 0;
      v9 = 0u;
      v10 = 0u;
    }
    sub_23A6FB670((uint64_t)&v9);
    sub_23A6FEC0C((uint64_t)&v9);
  }
}

uint64_t sub_23A6FA0CC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *a1;
  swift_getKeyPath();
  v10 = v1;
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 24);
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A70D00C();
  swift_release();
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  *(_QWORD *)(v1 + 24) = v2;
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_23A70D018();
  swift_release();
  swift_getKeyPath();
  sub_23A70D00C();
  swift_release();
  v4 = *(void **)(v1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
  swift_getKeyPath();
  v9 = (uint64_t)v4;
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  v5 = v4;
  sub_23A70D00C();
  swift_release();
  v6 = v5[OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting];

  if (v6 == 1 && (sub_23A6E72E0(v3, v2) & 1) == 0)
  {
    v8 = v2;
    v9 = v3;
    swift_bridgeObjectRetain();
    sub_23A6FC614(&v9, &v8);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6FA308@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  sub_23A70D00C();
  swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter);
  return swift_unknownObjectRetain();
}

uint64_t sub_23A6FA3A0()
{
  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  swift_unknownObjectRetain();
  sub_23A70D000();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A6FA458@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  int v4;
  char v5;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  result = swift_release();
  v4 = *(_DWORD *)(v1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity + 8);
  v5 = *(_BYTE *)(v1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity + 12);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity);
  *(_DWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 12) = v5;
  return result;
}

uint64_t sub_23A6FA500(void *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t ObjCClassFromMetadata;
  NSString *v21;
  SEL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  swift_getObjectType();
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_23A70D660();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
    result = sub_23A70D558();
    a2 = v26;
    v24 = v27;
    v4 = v28;
    v5 = v29;
    v6 = v30;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a2 + 32);
    v24 = a2 + 56;
    v4 = ~v7;
    v8 = -v7;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v6 = v9 & *(_QWORD *)(a2 + 56);
    result = swift_bridgeObjectRetain();
    v5 = 0;
  }
  v10 = (unint64_t)(v4 + 64) >> 6;
  while (a2 < 0)
  {
    if (!sub_23A70D690())
      return sub_23A6EBED4();
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
    swift_dynamicCast();
    swift_unknownObjectRelease();
    v13 = v5;
    v11 = v6;
    if (!v25)
      return sub_23A6EBED4();
LABEL_33:
    sub_23A70D624();
    result = swift_isClassType();
    if ((result & 1) == 0)
      goto LABEL_39;
    swift_retain();
    sub_23A70D618();
    v19 = v18;
    swift_release();
    if (v19)
    {
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      if ((objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, ObjCClassFromMetadata) & 1) != 0)
      {
        v21 = (NSString *)sub_23A70D438();
        v22 = NSSelectorFromString(v21);

        objc_msgSend(a1, sel_addPropagatedProperty_, v22);
      }
      swift_bridgeObjectRelease();
    }
    result = swift_release();
    v5 = v13;
    v6 = v11;
  }
  if (v6)
  {
    v11 = (v6 - 1) & v6;
    v12 = __clz(__rbit64(v6)) | (v5 << 6);
    v13 = v5;
LABEL_32:
    v17 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v12);
    swift_retain();
    if (!v17)
      return sub_23A6EBED4();
    goto LABEL_33;
  }
  v14 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v14 >= v10)
      return sub_23A6EBED4();
    v15 = *(_QWORD *)(v24 + 8 * v14);
    v13 = v5 + 1;
    if (!v15)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v10)
        return sub_23A6EBED4();
      v15 = *(_QWORD *)(v24 + 8 * v13);
      if (!v15)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v10)
          return sub_23A6EBED4();
        v15 = *(_QWORD *)(v24 + 8 * v13);
        if (!v15)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v10)
            return sub_23A6EBED4();
          v15 = *(_QWORD *)(v24 + 8 * v13);
          if (!v15)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v10)
              return sub_23A6EBED4();
            v15 = *(_QWORD *)(v24 + 8 * v13);
            if (!v15)
            {
              v16 = v5 + 6;
              while (v10 != v16)
              {
                v15 = *(_QWORD *)(v24 + 8 * v16++);
                if (v15)
                {
                  v13 = v16 - 1;
                  goto LABEL_31;
                }
              }
              return sub_23A6EBED4();
            }
          }
        }
      }
    }
LABEL_31:
    v11 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v13 << 6);
    goto LABEL_32;
  }
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23A6FA824(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  SEL v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v2 = a2;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_23A70D660();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
    result = sub_23A70D558();
    v2 = v25;
    v23 = v26;
    v4 = v27;
    v5 = v28;
    v6 = v29;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a2 + 32);
    v23 = a2 + 56;
    v4 = ~v7;
    v8 = -v7;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v6 = v9 & *(_QWORD *)(a2 + 56);
    result = swift_bridgeObjectRetain();
    v5 = 0;
  }
  v10 = (unint64_t)(v4 + 64) >> 6;
  while (v2 < 0)
  {
    if (!sub_23A70D690())
      return sub_23A6EBED4();
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AFE38);
    swift_dynamicCast();
    swift_unknownObjectRelease();
    v13 = v5;
    v11 = v6;
    if (!v24)
      return sub_23A6EBED4();
LABEL_32:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0930);
    if (swift_dynamicCastClass())
    {
      swift_retain();
      sub_23A70D618();
      v19 = v18;
      swift_release();
      if (v19)
      {
        v20 = (NSString *)sub_23A70D438();
        v21 = NSSelectorFromString(v20);

        objc_msgSend(a1, sel_removePropagatedProperty_, v21);
        swift_bridgeObjectRelease();
      }
    }
    result = swift_release();
    v5 = v13;
    v6 = v11;
  }
  if (v6)
  {
    v11 = (v6 - 1) & v6;
    v12 = __clz(__rbit64(v6)) | (v5 << 6);
    v13 = v5;
LABEL_31:
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v12);
    swift_retain();
    if (!v17)
      return sub_23A6EBED4();
    goto LABEL_32;
  }
  v14 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v14 >= v10)
      return sub_23A6EBED4();
    v15 = *(_QWORD *)(v23 + 8 * v14);
    v13 = v5 + 1;
    if (!v15)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v10)
        return sub_23A6EBED4();
      v15 = *(_QWORD *)(v23 + 8 * v13);
      if (!v15)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v10)
          return sub_23A6EBED4();
        v15 = *(_QWORD *)(v23 + 8 * v13);
        if (!v15)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v10)
            return sub_23A6EBED4();
          v15 = *(_QWORD *)(v23 + 8 * v13);
          if (!v15)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v10)
              return sub_23A6EBED4();
            v15 = *(_QWORD *)(v23 + 8 * v13);
            if (!v15)
            {
              v16 = v5 + 6;
              while (v10 != v16)
              {
                v15 = *(_QWORD *)(v23 + 8 * v16++);
                if (v15)
                {
                  v13 = v16 - 1;
                  goto LABEL_30;
                }
              }
              return sub_23A6EBED4();
            }
          }
        }
      }
    }
LABEL_30:
    v11 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v13 << 6);
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A6FAB20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  return sub_23A6FEB60(v1 + 16, a1);
}

uint64_t sub_23A6FABC8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  return sub_23A6FEB60(v3 + 16, a2);
}

uint64_t sub_23A6FAC70(uint64_t a1)
{
  _BYTE v2[112];

  sub_23A6FEB60(a1, (uint64_t)v2);
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D000();
  swift_release();
  return sub_23A6FEBAC((uint64_t)v2);
}

uint64_t sub_23A6FAD28(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1 + 16;
  swift_beginAccess();
  sub_23A6FEBD8(a2, v3);
  return swift_endAccess();
}

uint64_t sub_23A6FAD88()
{
  sub_23A70D870();
  sub_23A70CFF4();
  sub_23A6E1420((unint64_t *)&qword_2569B0920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A70D414();
  swift_bridgeObjectRetain();
  sub_23A70D45C();
  swift_bridgeObjectRelease();
  return sub_23A70D894();
}

uint64_t sub_23A6FAE2C()
{
  sub_23A70CFF4();
  sub_23A6E1420((unint64_t *)&qword_2569B0920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A70D414();
  swift_bridgeObjectRetain();
  sub_23A70D45C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6FAEB4()
{
  sub_23A70D870();
  sub_23A70CFF4();
  sub_23A6E1420((unint64_t *)&qword_2569B0920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A70D414();
  swift_bridgeObjectRetain();
  sub_23A70D45C();
  swift_bridgeObjectRelease();
  return sub_23A70D894();
}

uint64_t sub_23A6FAF54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + *(int *)(a1 + 20));
  swift_bridgeObjectRetain();
  sub_23A70D468();
  sub_23A70CFF4();
  sub_23A6E1420(&qword_2569AF600, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_23A70D7C8();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23A6FAFF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if ((sub_23A70CFDC() & 1) == 0)
    return 0;
  v6 = *(int *)(a3 + 20);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1])
    return 1;
  else
    return sub_23A70D7EC();
}

id sub_23A6FB068()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  return *(id *)(v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
}

void sub_23A6FB0F4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver) = a2;
  v3 = a2;

}

uint64_t sub_23A6FB12C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  int v5;
  char v6;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  result = swift_release();
  v5 = *(_DWORD *)(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity + 8);
  v6 = *(_BYTE *)(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity + 12);
  *(_QWORD *)a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity);
  *(_DWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 12) = v6;
  return result;
}

uint64_t sub_23A6FB1D4()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D000();
  return swift_release();
}

uint64_t sub_23A6FB290(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = result + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity;
  *(_QWORD *)v3 = a2;
  *(_DWORD *)(v3 + 8) = a3;
  *(_BYTE *)(v3 + 12) = BYTE4(a3) & 1;
  return result;
}

uint64_t sub_23A6FB2B0()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  return swift_unknownObjectRetain();
}

uint64_t sub_23A6FB340@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__scenePresenter);
  return swift_unknownObjectRetain();
}

uint64_t sub_23A6FB3D8()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  swift_unknownObjectRetain();
  sub_23A70D000();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A6FB490()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  return swift_retain();
}

uint64_t sub_23A6FB520@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel___uiSceneViewModel);
  return swift_retain();
}

uint64_t sub_23A6FB5B8()
{
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  swift_retain();
  sub_23A70D000();
  swift_release();
  return swift_release();
}

void sub_23A6FB670(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void *Strong;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[40];

  sub_23A6FEC68(a1, (uint64_t)&v12);
  if (v13)
  {
    sub_23A6F060C(&v12, (uint64_t)v14);
    if (qword_2569AF2E8 != -1)
      swift_once();
    v1 = sub_23A70D0E4();
    __swift_project_value_buffer(v1, (uint64_t)qword_2569B4540);
    v2 = sub_23A70D0CC();
    v3 = sub_23A70D57C();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_23A6DA000, v2, v3, "#HostModel adding _UISceneHostGeometrySceneExtension and presentation driver", v4, 2u);
      MEMORY[0x23B85534C](v4, -1, -1);
    }

    Strong = (void *)swift_unknownObjectUnownedLoadStrong();
    sub_23A6FECB0();
    objc_msgSend(Strong, sel_addExtension_, swift_getObjCClassFromMetadata());

    v6 = (void *)swift_unknownObjectUnownedLoadStrong();
    sub_23A70D5B8();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    sub_23A6FEC0C((uint64_t)&v12);
    if (qword_2569AF2E8 != -1)
      swift_once();
    v7 = sub_23A70D0E4();
    __swift_project_value_buffer(v7, (uint64_t)qword_2569B4540);
    v8 = sub_23A70D0CC();
    v9 = sub_23A70D57C();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23A6DA000, v8, v9, "#HostModel removing _UISceneHostGeometrySceneExtension", v10, 2u);
      MEMORY[0x23B85534C](v10, -1, -1);
    }

    v11 = (void *)swift_unknownObjectUnownedLoadStrong();
    sub_23A6FECB0();
    objc_msgSend(v11, sel_removeExtension_, swift_getObjCClassFromMetadata());

  }
}

uint64_t sub_23A6FB8A8(void *a1)
{
  uint64_t result;

  if (a1)
    objc_msgSend(a1, sel_invalidate);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23A6FB90C();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A6FB90C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t Strong;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = type metadata accessor for PresentationViewModel.Identity(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569AF2E8 != -1)
    swift_once();
  v5 = sub_23A70D0E4();
  __swift_project_value_buffer(v5, (uint64_t)qword_2569B4540);
  swift_retain_n();
  v6 = sub_23A70D0CC();
  v7 = sub_23A70D57C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_DWORD *)v8 = 136446210;
    v20 = v9;
    sub_23A6E13DC(v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity, (uint64_t)v4);
    v10 = (uint64_t *)&v4[*(int *)(v2 + 20)];
    v11 = v10[1];
    v18 = *v10;
    v19 = v11;
    swift_bridgeObjectRetain();
    sub_23A70D468();
    sub_23A70CFF4();
    sub_23A6E1420(&qword_2569AF600, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    sub_23A70D7C8();
    sub_23A70D468();
    swift_bridgeObjectRelease();
    v12 = v18;
    v13 = v19;
    sub_23A6E1460((uint64_t)v4);
    v18 = sub_23A6F8508(v12, v13, &v20);
    sub_23A70D5F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A6DA000, v6, v7, "#ScenePresentation %{public}s Invalidated!", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85534C](v9, -1, -1);
    MEMORY[0x23B85534C](v8, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  Strong = swift_unknownObjectUnownedLoadStrong();
  sub_23A7005C0(v1, Strong);
  swift_unknownObjectRelease();
  v15 = swift_unknownObjectUnownedLoadStrong();
  sub_23A700750(v1, v15);
  swift_unknownObjectRelease();
  return sub_23A6E55C4(v1);
}

void sub_23A6FBBD0(NSObject **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  char ***v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unsigned __int8 *v30;
  int v31;
  uint64_t v32;
  char v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  os_log_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  os_log_t *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53[5];

  v4 = v3;
  v46 = a2;
  v47 = a3;
  v6 = type metadata accessor for PresentationViewModel.Identity(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  swift_getKeyPath();
  v53[2] = v4;
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  v10 = *(NSObject **)(v4 + 16);
  swift_getKeyPath();
  v51 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A70D00C();
  swift_release();
  v51 = v4;
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  *(_QWORD *)(v4 + 16) = v9;
  swift_bridgeObjectRelease();
  v51 = v4;
  swift_getKeyPath();
  sub_23A70D018();
  swift_release();
  if (qword_2569AF2E8 != -1)
    swift_once();
  v11 = sub_23A70D0E4();
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_2569B4540);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v49 = v12;
  v13 = sub_23A70D0CC();
  v14 = sub_23A70D57C();
  LODWORD(v48) = v14;
  v15 = &off_2569B0000;
  if (os_log_type_enabled(v13, v14))
  {
    v16 = swift_slowAlloc();
    v50 = v9;
    v17 = v16;
    v45 = swift_slowAlloc();
    v53[0] = v45;
    *(_DWORD *)v17 = 136446722;
    sub_23A6E13DC(v4 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity, (uint64_t)v8);
    v18 = (uint64_t *)&v8[*(int *)(v6 + 20)];
    v19 = v18[1];
    v51 = *v18;
    v52 = v19;
    swift_bridgeObjectRetain();
    v44 = v13;
    sub_23A70D468();
    sub_23A70CFF4();
    sub_23A6E1420(&qword_2569AF600, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    sub_23A70D7C8();
    sub_23A70D468();
    swift_bridgeObjectRelease();
    v20 = v51;
    v21 = v52;
    sub_23A6E1460((uint64_t)v8);
    v51 = sub_23A6F8508(v20, v21, v53);
    sub_23A70D5F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 1024;
    swift_getKeyPath();
    v51 = v4;
    sub_23A70D00C();
    swift_release();
    v22 = *(void **)(v4 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
    swift_getKeyPath();
    v51 = (uint64_t)v22;
    sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
    v23 = v22;
    sub_23A70D00C();
    swift_release();
    LODWORD(v20) = v23[OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting];
    swift_release();

    v15 = &off_2569B0000;
    LODWORD(v51) = v20;
    sub_23A70D5F4();
    swift_release();
    *(_WORD *)(v17 + 18) = 1024;
    v24 = sub_23A70D510();
    MEMORY[0x24BDAC7A8](v24);
    v25 = v50;
    *(&v44 - 2) = v10;
    *(&v44 - 1) = v25;
    LOBYTE(v20) = sub_23A7049A8((void (*)(_QWORD *__return_ptr))sub_23A701384, (uint64_t)&(&v44)[-4], (char)"DrawingBoard/SceneSettings.swift");
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    LODWORD(v51) = (v20 & 1) == 0;
    sub_23A70D5F4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26 = v44;
    _os_log_impl(&dword_23A6DA000, v44, (os_log_type_t)v48, "#PresentationViewModel %{public}s --BEGIN APPLY SETTINGS-- %{BOOL}d %{BOOL}d", (uint8_t *)v17, 0x18u);
    v27 = v45;
    swift_arrayDestroy();
    MEMORY[0x23B85534C](v27, -1, -1);
    v28 = v17;
    v9 = v50;
    MEMORY[0x23B85534C](v28, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_getKeyPath();
  v51 = v4;
  sub_23A70D00C();
  swift_release();
  v29 = *(char **)((char *)v15[234] + v4);
  swift_getKeyPath();
  v51 = (uint64_t)v29;
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  v30 = v29;
  sub_23A70D00C();
  swift_release();
  v31 = v30[OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting];

  if (v31 == 1)
  {
    v32 = sub_23A70D510();
    MEMORY[0x24BDAC7A8](v32);
    *(&v44 - 2) = v10;
    *(&v44 - 1) = v9;
    v33 = sub_23A7049A8((void (*)(_QWORD *__return_ptr))sub_23A701384, (uint64_t)&(&v44)[-4], (char)"DrawingBoard/SceneSettings.swift");
    swift_bridgeObjectRelease();
    if ((v33 & 1) == 0)
    {
      swift_bridgeObjectRetain_n();
      v34 = sub_23A70D0CC();
      v35 = sub_23A70D57C();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        v37 = swift_slowAlloc();
        v48 = &v44;
        *(_DWORD *)v36 = 136446210;
        v50 = (v36 + 4);
        v51 = v37;
        MEMORY[0x24BDAC7A8](v37);
        *(&v44 - 2) = v9;
        swift_bridgeObjectRetain();
        v38 = sub_23A704B38((void (*)(_QWORD *__return_ptr))sub_23A701398, (uint64_t)&(&v44)[-4]);
        v40 = v39;
        swift_bridgeObjectRelease();
        v53[0] = sub_23A6F8508(v38, v40, &v51);
        sub_23A70D5F4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23A6DA000, v34, v35, "#PresentationViewModel applying: %{public}s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B85534C](v37, -1, -1);
        MEMORY[0x23B85534C](v36, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v51 = (uint64_t)v9;
      sub_23A6FC464(&v51, v46, v47);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v41 = sub_23A70D0CC();
  v42 = sub_23A70D57C();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_23A6DA000, v41, v42, "#PresentationViewModel --END APPLY SETTINGS--", v43, 2u);
    MEMORY[0x23B85534C](v43, -1, -1);
  }

}

void sub_23A6FC464(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *Strong;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD v16[6];

  v4 = v3;
  v7 = *a1;
  if (qword_2569AF2E8 != -1)
    swift_once();
  v8 = sub_23A70D0E4();
  __swift_project_value_buffer(v8, (uint64_t)qword_2569B4540);
  v9 = sub_23A70D0CC();
  v10 = sub_23A70D57C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23A6DA000, v9, v10, "#HostModel --BEGIN UPDATE--", v11, 2u);
    MEMORY[0x23B85534C](v11, -1, -1);
  }

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  MEMORY[0x24BDAC7A8]();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = v4;
  v16[5] = v7;
  sub_23A6DD838(sub_23A6FED5C, (uint64_t)v16);

  v13 = sub_23A70D0CC();
  v14 = sub_23A70D57C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23A6DA000, v13, v14, "--END UPDATE--", v15, 2u);
    MEMORY[0x23B85534C](v15, -1, -1);
  }

}

uint64_t sub_23A6FC614(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD v9[6];

  v2 = *a1;
  v3 = *a2;
  Strong = swift_unknownObjectUnownedLoadStrong();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_23A6FEB30;
  *(_QWORD *)(v6 + 24) = v5;
  v9[4] = sub_23A6DEC58;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A6E30E4;
  v9[3] = &block_descriptor_5;
  v7 = _Block_copy(v9);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend((id)Strong, sel_updateSettingsWithBlock_, v7);

  _Block_release(v7);
  LOBYTE(Strong) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((Strong & 1) != 0)
    __break(1u);
  return result;
}

void sub_23A6FC768(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v3 = v2;
  v19 = a2;
  v15 = type metadata accessor for PresentationViewModel.Identity(0);
  MEMORY[0x24BDAC7A8](v15);
  v16 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v6 = a1[1];
  v9 = a1[2];
  v8 = a1[3];
  v10 = a1[4];
  v11 = *((_BYTE *)a1 + 40);
  swift_getKeyPath();
  v12 = v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel___observationRegistrar;
  v20 = v3;
  v17 = sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  v18 = v12;
  sub_23A70D00C();
  swift_release();
  swift_beginAccess();
  v13 = *(unsigned __int8 *)(v3 + 80);
  v20 = v7;
  v21 = v6;
  v22 = v9;
  v23 = v8;
  v24 = v10;
  v25 = v11;
  __asm { BR              X10 }
}

void sub_23A6FC890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;

  if (v5)
  {
    *(_QWORD *)(v9 - 280) = v1;
    if (qword_2569AF2E8 != -1)
      swift_once();
    *(_QWORD *)(v9 - 272) = v4;
    v10 = sub_23A70D0E4();
    __swift_project_value_buffer(v10, (uint64_t)qword_2569B4540);
    swift_retain();
    sub_23A6DF314(v6, v2, v8, v7, v3, v5);
    swift_retain();
    sub_23A6DF314(v6, v2, v8, v7, v3, v5);
    v11 = sub_23A70D0CC();
    v12 = sub_23A70D57C();
    v13 = v12;
    if (os_log_type_enabled(v11, v12))
    {
      v14 = swift_slowAlloc();
      *(_QWORD *)(v9 - 304) = v7;
      v15 = v14;
      v16 = swift_slowAlloc();
      *(_QWORD *)(v9 - 288) = v16;
      *(_QWORD *)(v9 - 224) = v16;
      *(_DWORD *)v15 = 136446466;
      *(_QWORD *)(v9 - 312) = v15 + 4;
      v17 = *(_QWORD *)(v9 - 256);
      sub_23A6E13DC(v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity, v17);
      v18 = (_QWORD *)(v17 + *(int *)(*(_QWORD *)(v9 - 264) + 20));
      v19 = v18[1];
      *(_QWORD *)(v9 - 200) = *v18;
      *(_QWORD *)(v9 - 192) = v19;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v9 - 264) = v11;
      sub_23A70D468();
      sub_23A70CFF4();
      *(_DWORD *)(v9 - 292) = v13;
      sub_23A6E1420(&qword_2569AF600, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      sub_23A70D7C8();
      sub_23A70D468();
      swift_bridgeObjectRelease();
      v20 = *(_QWORD *)(v9 - 200);
      v21 = *(_QWORD *)(v9 - 192);
      sub_23A6E1460(v17);
      *(_QWORD *)(v9 - 200) = sub_23A6F8508(v20, v21, (uint64_t *)(v9 - 224));
      *(_QWORD *)(v9 - 256) = v9 - 192;
      sub_23A70D5F4();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      *(_QWORD *)(v9 - 312) = v15 + 14;
      v22 = *(_QWORD *)(v9 - 304);
      sub_23A6DF314(v6, v2, v8, v22, v3, v5);
      sub_23A6F911C();
      v24 = v23;
      v26 = v25;
      sub_23A6DF3FC(v6, v2, v8, v22, v3, v5);
      v27 = v24;
      v28 = v22;
      *(_QWORD *)(v9 - 200) = sub_23A6F8508(v27, v26, (uint64_t *)(v9 - 224));
      sub_23A70D5F4();
      swift_bridgeObjectRelease();
      sub_23A6DF3FC(v6, v2, v8, v22, v3, v5);
      sub_23A6DF3FC(v6, v2, v8, v22, v3, v5);
      v29 = *(NSObject **)(v9 - 264);
      _os_log_impl(&dword_23A6DA000, v29, (os_log_type_t)*(_DWORD *)(v9 - 292), "#PresentationViewModel %{public}s update policy %s", (uint8_t *)v15, 0x16u);
      v30 = *(_QWORD *)(v9 - 288);
      swift_arrayDestroy();
      MEMORY[0x23B85534C](v30, -1, -1);
      MEMORY[0x23B85534C](v15, -1, -1);

    }
    else
    {
      swift_release_n();
      sub_23A6DF3FC(v6, v2, v8, v7, v3, v5);
      sub_23A6DF3FC(v6, v2, v8, v7, v3, v5);

      v28 = v7;
    }
    swift_getKeyPath();
    *(_QWORD *)(v9 - 200) = v0;
    sub_23A6DF314(v6, v2, v8, v28, v3, v5);
    *(_DWORD *)(v9 - 256) = v5;
    sub_23A70D00C();
    swift_release();
    *(_QWORD *)(v9 - 200) = v0;
    swift_getKeyPath();
    sub_23A70D024();
    swift_release();
    v31 = *(_QWORD *)(v0 + 40);
    v32 = *(_QWORD *)(v0 + 48);
    v33 = *(_QWORD *)(v0 + 56);
    v34 = *(_QWORD *)(v0 + 64);
    v35 = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v0 + 40) = v6;
    *(_QWORD *)(v0 + 48) = v2;
    *(_QWORD *)(v0 + 56) = v8;
    *(_QWORD *)(v0 + 64) = v28;
    *(_QWORD *)(v0 + 72) = v3;
    v36 = *(_BYTE *)(v0 + 80);
    *(_BYTE *)(v0 + 80) = *(_DWORD *)(v9 - 256);
    sub_23A6DF3FC(v31, v32, v33, v34, v35, v36);
    *(_QWORD *)(v9 - 200) = v0;
    swift_getKeyPath();
    sub_23A70D018();
    swift_release();
    sub_23A6F8E10();
    swift_getKeyPath();
    *(_QWORD *)(v9 - 224) = v0;
    sub_23A70D00C();
    swift_release();
    *(_QWORD *)(v9 - 224) = v0;
    swift_getKeyPath();
    sub_23A70D024();
    swift_release();
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_1(v0 + 88);
    sub_23A6F060C((__int128 *)(v9 - 200), v0 + 88);
    swift_endAccess();
    *(_QWORD *)(v9 - 224) = v0;
    swift_getKeyPath();
    sub_23A70D018();
    swift_release();
    sub_23A6FCE7C(*(_QWORD *)(v9 - 232), *(_QWORD *)(v9 - 272));
  }
}

void sub_23A6FCE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 *v20;
  int v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  os_log_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *Strong;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD v46[2];
  uint8_t *v47;
  int v48;
  uint64_t v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60[5];
  char v61;

  v3 = v2;
  v52 = a2;
  v51 = a1;
  v4 = type metadata accessor for PresentationViewModel.Identity(0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569AF2E8 != -1)
    swift_once();
  v7 = sub_23A70D0E4();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2569B4540);
  swift_retain_n();
  v9 = sub_23A70D0CC();
  v10 = sub_23A70D57C();
  v11 = os_log_type_enabled(v9, v10);
  v54 = v8;
  if (v11)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136446210;
    v60[0] = v13;
    sub_23A6E13DC(v2 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity, (uint64_t)v6);
    v14 = (uint64_t *)&v6[*(int *)(v4 + 20)];
    v15 = v14[1];
    v55 = *v14;
    v56 = v15;
    swift_bridgeObjectRetain();
    sub_23A70D468();
    sub_23A70CFF4();
    sub_23A6E1420(&qword_2569AF600, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    sub_23A70D7C8();
    sub_23A70D468();
    swift_bridgeObjectRelease();
    v16 = v55;
    v17 = v56;
    sub_23A6E1460((uint64_t)v6);
    v55 = sub_23A6F8508(v16, v17, v60);
    sub_23A70D5F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A6DA000, v9, v10, "#PresentationViewModel %{public}s --BEGIN APPLY POLICY--", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85534C](v13, -1, -1);
    MEMORY[0x23B85534C](v12, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  v18 = v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel___observationRegistrar;
  v55 = v3;
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  v53 = v18;
  sub_23A70D00C();
  swift_release();
  v19 = *(void **)(v3 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
  swift_getKeyPath();
  v55 = (uint64_t)v19;
  sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
  v20 = v19;
  sub_23A70D00C();
  swift_release();
  v21 = v20[OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting];

  if (v21 == 1)
  {
    swift_retain_n();
    v22 = sub_23A70D0CC();
    v23 = sub_23A70D57C();
    v24 = v23;
    if (os_log_type_enabled(v22, v23))
    {
      v50 = v22;
      v25 = swift_slowAlloc();
      v48 = v24;
      v26 = (uint8_t *)v25;
      v49 = swift_slowAlloc();
      v55 = v49;
      v47 = v26;
      *(_DWORD *)v26 = 136446210;
      v46[1] = v26 + 12;
      v46[0] = v26 + 4;
      swift_getKeyPath();
      v60[0] = v3;
      sub_23A70D00C();
      swift_release();
      swift_beginAccess();
      v27 = *(_QWORD *)(v3 + 40);
      v28 = *(_QWORD *)(v3 + 48);
      v29 = *(_QWORD *)(v3 + 56);
      v30 = *(_QWORD *)(v3 + 64);
      v31 = *(_QWORD *)(v3 + 72);
      v60[0] = v27;
      v60[1] = v28;
      v60[2] = v29;
      v60[3] = v30;
      v60[4] = v31;
      v61 = *(_BYTE *)(v3 + 80);
      v32 = v61;
      sub_23A6DF314(v27, v28, v29, v30, v31, v61);
      sub_23A6F911C();
      v34 = v33;
      v36 = v35;
      sub_23A6DF3FC(v27, v28, v29, v30, v31, v32);
      v59 = sub_23A6F8508(v34, v36, &v55);
      sub_23A70D5F4();
      swift_release_n();
      swift_bridgeObjectRelease();
      v37 = v50;
      v38 = v47;
      _os_log_impl(&dword_23A6DA000, v50, (os_log_type_t)v48, "#PresentationViewModel apply %{public}s", v47, 0xCu);
      v39 = v49;
      swift_arrayDestroy();
      MEMORY[0x23B85534C](v39, -1, -1);
      MEMORY[0x23B85534C](v38, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    swift_getKeyPath();
    v55 = v3;
    sub_23A70D00C();
    swift_release();
    swift_beginAccess();
    sub_23A6F05A4(v3 + 88, (uint64_t)&v55);
    v40 = v57;
    v41 = v58;
    __swift_project_boxed_opaque_existential_1(&v55, v57);
    Strong = (void *)swift_unknownObjectUnownedLoadStrong();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 16))(Strong, v51, v52, v40, v41);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v55);
  }
  v43 = sub_23A70D0CC();
  v44 = sub_23A70D57C();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_23A6DA000, v43, v44, "#PresentationViewModel --END APPLY POLICY--", v45, 2u);
    MEMORY[0x23B85534C](v45, -1, -1);
  }

}

uint64_t sub_23A6FD878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23A6FEBAC(v0 + 16);
  swift_release();
  sub_23A6E1460(v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity);
  swift_release();
  sub_23A70059C(v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_eventHandlerRegistry);
  swift_release();
  sub_23A70059C(v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_actionHandlerRegistry);

  swift_unknownObjectRelease();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel___observationRegistrar;
  v2 = sub_23A70D03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_23A6FD954()
{
  sub_23A6FD878();
  return swift_deallocClassInstance();
}

uint64_t sub_23A6FD978()
{
  return type metadata accessor for PresentationViewModel(0);
}

uint64_t type metadata accessor for PresentationViewModel(uint64_t a1)
{
  return sub_23A6F3DF4(a1, qword_2569B07A0);
}

uint64_t sub_23A6FD994()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for PresentationViewModel.Identity(319);
  if (v1 <= 0x3F)
  {
    result = sub_23A70D03C();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t type metadata accessor for PresentationViewModel.Identity(uint64_t a1)
{
  return sub_23A6F3DF4(a1, qword_2569B08D8);
}

uint64_t destroy for PresentationViewModel.Configuration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A6DF3FC(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  return __swift_destroy_boxed_opaque_existential_1(a1 + 72);
}

uint64_t initializeWithCopy for PresentationViewModel.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a2 + 56);
  v10 = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A6DF314(v5, v6, v7, v8, v9, v10);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_BYTE *)(a1 + 64) = v10;
  v11 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 96) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 72, a2 + 72);
  return a1;
}

uint64_t assignWithCopy for PresentationViewModel.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_BYTE *)(a2 + 64);
  sub_23A6DF314(v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  v15 = *(_BYTE *)(a1 + 64);
  *(_BYTE *)(a1 + 64) = v9;
  sub_23A6DF3FC(v10, v11, v12, v13, v14, v15);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 72), (uint64_t *)(a2 + 72));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for PresentationViewModel.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 56);
  v5 = *(_BYTE *)(a2 + 64);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v4;
  v11 = *(_BYTE *)(a1 + 64);
  *(_BYTE *)(a1 + 64) = v5;
  sub_23A6DF3FC(v6, v7, v8, v9, v10, v11);
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for PresentationViewModel.Configuration(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PresentationViewModel.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
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
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PresentationViewModel.Configuration()
{
  return &type metadata for PresentationViewModel.Configuration;
}

uint64_t *sub_23A6FDF34(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A70CFF4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23A6FDFC8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6FE010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A6FE078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A6FE0F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_23A6FE150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_23A70CFF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A6FE1BC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A6FE1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A70CFF4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23A6FE248()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A6FE254(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A70CFF4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23A6FE2D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70CFF4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A6FE340()
{
  return sub_23A6E1420((unint64_t *)&unk_2569B0910, type metadata accessor for PresentationViewModel.Identity, (uint64_t)&unk_23A711090);
}

uint64_t sub_23A6FE36C(uint64_t result, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = (void *)result;
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_23A6FA824(v4, a2);
    result = swift_bridgeObjectRelease();
  }
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_23A6FA500(v4, a3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_23A6FE3E4(void *a1, void *a2, void (*a3)(void *, id), uint64_t a4, uint64_t a5, uint64_t a6)
{
  __objc2_class *v8;
  void *Strong;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  NSObject *v27;

  v8 = _TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget;
  if (a2)
  {
    Strong = (void *)swift_unknownObjectUnownedLoadStrong();
    v12 = a2;
    a3(Strong, v12);

    if (qword_2569AF2E8 != -1)
      swift_once();
    v13 = sub_23A70D0E4();
    __swift_project_value_buffer(v13, (uint64_t)qword_2569B4540);
    v14 = v12;
    v15 = sub_23A70D0CC();
    v16 = sub_23A70D57C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138543362;
      v19 = v14;
      sub_23A70D5F4();
      *v18 = a2;

      _os_log_impl(&dword_23A6DA000, v15, v16, "context: %{public}@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569B0950);
      swift_arrayDestroy();
      v20 = v18;
      v8 = _TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget;
      MEMORY[0x23B85534C](v20, -1, -1);
      MEMORY[0x23B85534C](v17, -1, -1);

    }
    else
    {

    }
  }
  sub_23A6FE718((uint64_t)a1, a6);
  if (v8[18].vtable != (void *)-1)
    swift_once();
  v21 = sub_23A70D0E4();
  __swift_project_value_buffer(v21, (uint64_t)qword_2569B4540);
  v22 = a1;
  v23 = sub_23A70D0CC();
  v24 = sub_23A70D57C();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v25 = 138543362;
    v27 = v22;
    sub_23A70D5F4();
    *v26 = v22;

    _os_log_impl(&dword_23A6DA000, v23, v24, "sending: %{public}@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569B0950);
    swift_arrayDestroy();
    MEMORY[0x23B85534C](v26, -1, -1);
    MEMORY[0x23B85534C](v25, -1, -1);
  }
  else
  {

    v23 = v22;
  }

}

uint64_t sub_23A6FE718(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  unint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  swift_bridgeObjectRetain();
  v17 = (uint64_t)sub_23A6FEDE0(a2);
  sub_23A6FED68(&v17);
  swift_bridgeObjectRelease();
  v3 = v17;
  if (v17 < 0 || (v17 & 0x4000000000000000) != 0)
    goto LABEL_22;
  v4 = *(_QWORD *)(v17 + 16);
  if (v4)
  {
    while (1)
    {
      v14 = v3 & 0xC000000000000001;
      if ((v3 & 0xC000000000000001) != 0)
      {
        MEMORY[0x23B854BC0](0, v3);
        if (!*(_QWORD *)(a2 + 16))
          goto LABEL_25;
      }
      else
      {
        if (!*(_QWORD *)(v3 + 16))
          goto LABEL_26;
        swift_retain();
        if (!*(_QWORD *)(a2 + 16))
        {
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
          result = swift_release();
          __break(1u);
          return result;
        }
      }
      v5 = swift_retain();
      v6 = sub_23A706798(v5);
      if ((v7 & 1) != 0)
        break;
LABEL_18:
      swift_release();
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      swift_bridgeObjectRetain();
      v4 = sub_23A70D75C();
      swift_release();
      if (!v4)
        return swift_release();
    }
    v8 = 0;
    v15 = v3;
    while (1)
    {
      v9 = *(void (**)(uint64_t))(*(_QWORD *)(a2 + 56) + 96 * v6 + 64);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_release();
      v9(a1);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v3 = v15;
      if (v4 - 1 == v8)
        break;
      v10 = v8 + 1;
      if (v14)
      {
        MEMORY[0x23B854BC0](v8 + 1, v15);
        if (__OFADD__(v10, 1))
          goto LABEL_19;
      }
      else
      {
        if (v10 >= *(_QWORD *)(v15 + 16))
          goto LABEL_21;
        swift_retain();
        if (__OFADD__(v10, 1))
          goto LABEL_19;
      }
      if (!*(_QWORD *)(a2 + 16))
        goto LABEL_20;
      v11 = swift_retain();
      v6 = sub_23A706798(v11);
      ++v8;
      if ((v12 & 1) == 0)
        goto LABEL_18;
    }
  }
  return swift_release();
}

uint64_t sub_23A6FE960(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *a1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity;
  v3 = *a2 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel_identity;
  if ((sub_23A70CFDC() & 1) == 0)
    return 0;
  v4 = *(int *)(type metadata accessor for PresentationViewModel.Identity(0) + 20);
  v5 = *(_QWORD *)(v2 + v4);
  v6 = *(_QWORD *)(v2 + v4 + 8);
  v7 = (_QWORD *)(v3 + v4);
  if (v5 == *v7 && v6 == v7[1])
    return 1;
  else
    return sub_23A70D7EC();
}

unint64_t sub_23A6FE9E4()
{
  sub_23A70D6D8();
  swift_bridgeObjectRelease();
  type metadata accessor for PresentationViewModel.Identity(0);
  swift_bridgeObjectRetain();
  sub_23A70D468();
  sub_23A70CFF4();
  sub_23A6E1420(&qword_2569AF600, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_23A70D7C8();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  return 0xD000000000000018;
}

unint64_t sub_23A6FEAE8()
{
  return sub_23A6FE9E4();
}

uint64_t sub_23A6FEB20()
{
  return objectdestroyTm_1((void (*)(_QWORD))MEMORY[0x24BEE4BC0], (void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t sub_23A6FEB30(uint64_t a1)
{
  uint64_t v1;

  return sub_23A6FE36C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A6FEB38()
{
  return swift_deallocObject();
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

uint64_t sub_23A6FEB60(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for PresentationViewModel.Configuration(a2, a1);
  return a2;
}

uint64_t sub_23A6FEB94()
{
  uint64_t v0;

  return sub_23A6FAD28(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23A6FEBAC(uint64_t a1)
{
  destroy for PresentationViewModel.Configuration(a1);
  return a1;
}

uint64_t sub_23A6FEBD8(uint64_t a1, uint64_t a2)
{
  assignWithCopy for PresentationViewModel.Configuration(a2, a1);
  return a2;
}

uint64_t sub_23A6FEC0C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0938);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A6FEC54()
{
  return sub_23A701234();
}

uint64_t sub_23A6FEC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0938);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A6FECB0()
{
  unint64_t result;

  result = qword_2569B0940;
  if (!qword_2569B0940)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569B0940);
  }
  return result;
}

uint64_t sub_23A6FECEC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_23A6F8508(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23A70D5F4();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

void sub_23A6FED5C(void *a1, void *a2)
{
  uint64_t v2;

  sub_23A6FE3E4(a1, a2, *(void (**)(void *, id))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_23A6FED68(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_23A700360();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_23A6FEEC8(v6);
  return sub_23A70D714();
}

_QWORD *sub_23A6FEDE0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0140);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_23A7003A4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23A6EBED4();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23A6FEEC8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t ObjCClassFromMetadata;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  char v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  unint64_t v94;
  char *v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;

  v2 = a1;
  v3 = a1[1];
  result = sub_23A70D7BC();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_158;
    if (v3)
      return sub_23A6FF8E0(0, v3, 1, v2);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
  {
    result = sub_23A70D744();
    __break(1u);
    return result;
  }
  v98 = result;
  v101 = v3;
  v96 = v2;
  if (v3 < 2)
  {
    v9 = (char *)MEMORY[0x24BEE4AF8];
    v105 = MEMORY[0x24BEE4AF8];
    v103 = (char *)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v39 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      goto LABEL_122;
    }
  }
  else
  {
    v6 = v2;
    v7 = v5 >> 1;
    sub_23A70D63C();
    v8 = sub_23A70D4BC();
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v2 = v6;
    v103 = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v105 = v8;
  }
  v10 = 0;
  v97 = *v2 - 8;
  v9 = (char *)MEMORY[0x24BEE4AF8];
  v11 = v3;
  v104 = *v2;
  do
  {
    v12 = v10++;
    v100 = v12;
    if (v10 >= v11)
      goto LABEL_47;
    swift_retain();
    swift_retain();
    v13 = sub_23A6DC838();
    if (v1)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      goto LABEL_134;
    }
    v14 = v13;
    swift_release();
    swift_release();
    v15 = v12 + 2;
    if (v15 >= v101)
    {
      v10 = v15;
      v21 = v104;
LABEL_36:
      if ((v14 & 1) == 0)
        goto LABEL_37;
LABEL_40:
      v12 = v100;
      if (v10 >= v100)
      {
        if (v100 < v10)
        {
          v22 = (uint64_t *)(v97 + 8 * v10);
          v23 = v10;
          v24 = v100;
          v25 = (uint64_t *)(v21 + 8 * v100);
          while (1)
          {
            if (v24 != --v23)
            {
              if (!v21)
                goto LABEL_164;
              v26 = *v25;
              *v25 = *v22;
              *v22 = v26;
            }
            ++v24;
            --v22;
            ++v25;
            if (v24 >= v23)
              goto LABEL_47;
          }
        }
        goto LABEL_47;
      }
      goto LABEL_161;
    }
    swift_retain();
    swift_retain();
    v16 = sub_23A70D624();
    if (swift_isClassType())
      v17 = v16;
    else
      v17 = 0;
    if (!v17)
    {
      while (1)
      {
LABEL_166:
        swift_retain();
        sub_23A70D6D8();
        sub_23A70D468();
        sub_23A70D63C();
        sub_23A70D738();
        sub_23A70D750();
        __break(1u);
      }
    }
    while (1)
    {
      v19 = sub_23A70D624();
      if (!swift_isClassType())
        v19 = 0;
      if (!v19)
        goto LABEL_166;
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      LOBYTE(ObjCClassFromMetadata) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, ObjCClassFromMetadata);
      swift_release();
      swift_release();
      if ((ObjCClassFromMetadata & 1) != 0)
        break;
      v21 = v104;
      if ((v14 & 1) != 0)
      {
        v10 = v15;
        goto LABEL_40;
      }
      v10 = v15 + 1;
      if (v15 + 1 >= v101)
        goto LABEL_37;
LABEL_21:
      swift_retain();
      swift_retain();
      v18 = sub_23A70D624();
      if (swift_isClassType())
        v17 = v18;
      else
        v17 = 0;
      v15 = v10;
      if (!v17)
        goto LABEL_166;
    }
    v21 = v104;
    if (((v14 ^ (v19 == v17)) & 1) != 0)
    {
      v10 = v15 + 1;
      if (v15 + 1 >= v101)
        goto LABEL_36;
      goto LABEL_21;
    }
    v10 = v15;
    if ((v14 & 1) != 0)
      goto LABEL_40;
LABEL_37:
    v12 = v100;
LABEL_47:
    if (v10 < v101)
    {
      if (__OFSUB__(v10, v12))
        goto LABEL_157;
      if (v10 - v12 < v98)
      {
        if (__OFADD__(v12, v98))
          goto LABEL_159;
        v27 = v101;
        if (v12 + v98 < v101)
          v27 = v12 + v98;
        if (v27 >= v12)
        {
          if (v10 != v27)
          {
            v95 = v9;
            v28 = (_QWORD *)(v97 + 8 * v10);
            v99 = v27;
            do
            {
              v29 = v12;
              v102 = v28;
              v30 = v28;
              do
              {
                swift_retain();
                swift_retain();
                v31 = sub_23A70D624();
                if (swift_isClassType())
                  v32 = v31;
                else
                  v32 = 0;
                if (!v32)
                  goto LABEL_166;
                v33 = sub_23A70D624();
                if (!swift_isClassType())
                  v33 = 0;
                if (!v33)
                  goto LABEL_166;
                v34 = swift_getObjCClassFromMetadata();
                v35 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, v34);
                swift_release();
                swift_release();
                if (v33 == v32 || (v35 & 1) == 0)
                  break;
                if (!v104)
                  goto LABEL_162;
                v36 = *v30;
                *v30 = v30[1];
                v30[1] = v36;
                --v30;
                ++v29;
              }
              while (v10 != v29);
              ++v10;
              v28 = v102 + 1;
              v12 = v100;
            }
            while (v10 != v99);
            v10 = v99;
            v9 = v95;
          }
          goto LABEL_71;
        }
LABEL_160:
        __break(1u);
LABEL_161:
        __break(1u);
LABEL_162:
        __break(1u);
LABEL_163:
        __break(1u);
LABEL_164:
        __break(1u);
LABEL_165:
        __break(1u);
        goto LABEL_166;
      }
    }
LABEL_71:
    if (v10 < v12)
      goto LABEL_153;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_23A6FFE9C(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v38 = *((_QWORD *)v9 + 2);
    v37 = *((_QWORD *)v9 + 3);
    v39 = v38 + 1;
    v40 = v104;
    if (v38 >= v37 >> 1)
    {
      v88 = sub_23A6FFE9C((char *)(v37 > 1), v38 + 1, 1, v9);
      v40 = v104;
      v9 = v88;
    }
    *((_QWORD *)v9 + 2) = v39;
    v41 = v9 + 32;
    v42 = &v9[16 * v38 + 32];
    *(_QWORD *)v42 = v100;
    *((_QWORD *)v42 + 1) = v10;
    if (v38)
    {
      while (2)
      {
        v43 = v39 - 1;
        if (v39 >= 4)
        {
          v48 = &v41[16 * v39];
          v49 = *((_QWORD *)v48 - 8);
          v50 = *((_QWORD *)v48 - 7);
          v54 = __OFSUB__(v50, v49);
          v51 = v50 - v49;
          if (v54)
            goto LABEL_141;
          v53 = *((_QWORD *)v48 - 6);
          v52 = *((_QWORD *)v48 - 5);
          v54 = __OFSUB__(v52, v53);
          v46 = v52 - v53;
          v47 = v54;
          if (v54)
            goto LABEL_142;
          v55 = v39 - 2;
          v56 = &v41[16 * v39 - 32];
          v58 = *(_QWORD *)v56;
          v57 = *((_QWORD *)v56 + 1);
          v54 = __OFSUB__(v57, v58);
          v59 = v57 - v58;
          if (v54)
            goto LABEL_144;
          v54 = __OFADD__(v46, v59);
          v60 = v46 + v59;
          if (v54)
            goto LABEL_147;
          if (v60 >= v51)
          {
            v78 = &v41[16 * v43];
            v80 = *(_QWORD *)v78;
            v79 = *((_QWORD *)v78 + 1);
            v54 = __OFSUB__(v79, v80);
            v81 = v79 - v80;
            if (v54)
              goto LABEL_151;
            v71 = v46 < v81;
          }
          else
          {
LABEL_90:
            if ((v47 & 1) != 0)
              goto LABEL_143;
            v55 = v39 - 2;
            v61 = &v41[16 * v39 - 32];
            v63 = *(_QWORD *)v61;
            v62 = *((_QWORD *)v61 + 1);
            v64 = __OFSUB__(v62, v63);
            v65 = v62 - v63;
            v66 = v64;
            if (v64)
              goto LABEL_146;
            v67 = &v41[16 * v43];
            v69 = *(_QWORD *)v67;
            v68 = *((_QWORD *)v67 + 1);
            v54 = __OFSUB__(v68, v69);
            v70 = v68 - v69;
            if (v54)
              goto LABEL_149;
            if (__OFADD__(v65, v70))
              goto LABEL_150;
            if (v65 + v70 < v46)
              goto LABEL_102;
            v71 = v46 < v70;
          }
          if (v71)
            v43 = v55;
        }
        else
        {
          if (v39 == 3)
          {
            v45 = *((_QWORD *)v9 + 4);
            v44 = *((_QWORD *)v9 + 5);
            v54 = __OFSUB__(v44, v45);
            v46 = v44 - v45;
            v47 = v54;
            goto LABEL_90;
          }
          v72 = *((_QWORD *)v9 + 4);
          v73 = *((_QWORD *)v9 + 5);
          v54 = __OFSUB__(v73, v72);
          v65 = v73 - v72;
          v66 = v54;
LABEL_102:
          if ((v66 & 1) != 0)
            goto LABEL_145;
          v74 = &v41[16 * v43];
          v76 = *(_QWORD *)v74;
          v75 = *((_QWORD *)v74 + 1);
          v54 = __OFSUB__(v75, v76);
          v77 = v75 - v76;
          if (v54)
            goto LABEL_148;
          if (v77 < v65)
            goto LABEL_119;
        }
        v82 = v43 - 1;
        if (v43 - 1 >= v39)
        {
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
          goto LABEL_160;
        }
        if (!v40)
          goto LABEL_163;
        v83 = &v41[16 * v82];
        v84 = *(_QWORD *)v83;
        v85 = &v41[16 * v43];
        v86 = *((_QWORD *)v85 + 1);
        sub_23A6FFB44((char *)(v40 + 8 * *(_QWORD *)v83), (char *)(v40 + 8 * *(_QWORD *)v85), v40 + 8 * v86, v103);
        if (v1)
          goto LABEL_133;
        if (v86 < v84)
          goto LABEL_138;
        if (v43 > *((_QWORD *)v9 + 2))
          goto LABEL_139;
        *(_QWORD *)v83 = v84;
        *(_QWORD *)&v41[16 * v82 + 8] = v86;
        v87 = *((_QWORD *)v9 + 2);
        if (v43 >= v87)
          goto LABEL_140;
        v39 = v87 - 1;
        memmove(&v41[16 * v43], v85 + 16, 16 * (v87 - 1 - v43));
        *((_QWORD *)v9 + 2) = v87 - 1;
        v40 = v104;
        if (v87 <= 2)
          goto LABEL_119;
        continue;
      }
    }
    v39 = 1;
LABEL_119:
    v11 = v101;
  }
  while (v10 < v101);
LABEL_122:
  if (v39 >= 2)
  {
    v89 = *v96;
    do
    {
      v90 = v39 - 2;
      if (v39 < 2)
        goto LABEL_152;
      if (!v89)
        goto LABEL_165;
      v91 = *(_QWORD *)&v9[16 * v90 + 32];
      v92 = *(_QWORD *)&v9[16 * v39 + 24];
      sub_23A6FFB44((char *)(v89 + 8 * v91), (char *)(v89 + 8 * *(_QWORD *)&v9[16 * v39 + 16]), v89 + 8 * v92, v103);
      if (v1)
        break;
      if (v92 < v91)
        goto LABEL_154;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v9 = sub_23A70003C((uint64_t)v9);
      if (v90 >= *((_QWORD *)v9 + 2))
        goto LABEL_155;
      v93 = &v9[16 * v90 + 32];
      *(_QWORD *)v93 = v91;
      *((_QWORD *)v93 + 1) = v92;
      v94 = *((_QWORD *)v9 + 2);
      if (v39 > v94)
        goto LABEL_156;
      memmove(&v9[16 * v39 + 16], &v9[16 * v39 + 32], 16 * (v94 - v39));
      *((_QWORD *)v9 + 2) = v94 - 1;
      v39 = v94 - 1;
    }
    while (v94 > 2);
  }
LABEL_133:
  swift_bridgeObjectRelease();
LABEL_134:
  *(_QWORD *)((v105 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_23A70D4A4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A6FF8E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjCClassFromMetadata;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD *v16;

  v15 = result;
  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = (_QWORD *)(*a4 + 8 * a3 - 8);
LABEL_5:
    v7 = v15;
    v16 = v6;
    while (1)
    {
      swift_retain();
      swift_retain();
      v8 = sub_23A70D624();
      v9 = swift_isClassType() ? v8 : 0;
      if (!v9)
        break;
      v10 = sub_23A70D624();
      if (!swift_isClassType())
        v10 = 0;
      if (!v10)
        break;
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isSubclassOfClass_, ObjCClassFromMetadata);
      swift_release();
      result = swift_release();
      if (v10 != v9 && (v12 & 1) != 0)
      {
        if (!v5)
        {
          __break(1u);
          break;
        }
        v13 = *v6;
        *v6 = v6[1];
        v6[1] = v13;
        --v6;
        if (v4 != ++v7)
          continue;
      }
      ++v4;
      v6 = v16 + 1;
      if (v4 == a2)
        return result;
      goto LABEL_5;
    }
    swift_retain();
    sub_23A70D6D8();
    sub_23A70D468();
    sub_23A70D63C();
    sub_23A70D738();
    result = sub_23A70D750();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A6FFB44(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char v16;
  char v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char v24;
  char v25;
  char *v26;
  char *v27;
  uint64_t result;
  char *v29;
  char *v30;
  char *v31;
  const void *v32;
  char *v33;

  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  v33 = __src;
  v32 = __dst;
  v30 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      v19 = v4;
      if (__dst != a2 || &a2[8 * v13] <= __dst)
      {
        memmove(__dst, a2, 8 * v13);
        __dst = v30;
      }
      v20 = &__dst[8 * v13];
      v31 = v20;
      v33 = v6;
      if (v7 >= v6 || v11 < 8)
        goto LABEL_48;
      v21 = (char *)(a3 - 8);
      v22 = v6;
      v29 = v7;
      while (1)
      {
        v23 = v20;
        v20 -= 8;
        v22 -= 8;
        swift_retain();
        swift_retain();
        v24 = sub_23A6DC838();
        if (v19)
          goto LABEL_47;
        v25 = v24;
        v26 = v21 + 8;
        swift_release();
        swift_release();
        if ((v25 & 1) != 0)
        {
          v27 = v30;
          if (v26 != v6 || v21 >= v6)
            *(_QWORD *)v21 = *(_QWORD *)v22;
          v33 = v22;
          v19 = 0;
          v20 = v23;
        }
        else
        {
          v31 = v20;
          v27 = v30;
          if (v26 < v23 || v21 >= v23 || v26 != v23)
            *(_QWORD *)v21 = *(_QWORD *)v20;
          v22 = v6;
          v19 = 0;
        }
        if (v22 > v29)
        {
          v21 -= 8;
          v6 = v22;
          if (v20 > v27)
            continue;
        }
        goto LABEL_48;
      }
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst)
    {
      memmove(__dst, __src, 8 * v10);
      __dst = v30;
    }
    v14 = &__dst[8 * v10];
    v31 = v14;
    if ((unint64_t)v6 >= a3 || v8 < 8)
      goto LABEL_48;
    while (1)
    {
      v15 = __dst;
      swift_retain();
      swift_retain();
      v16 = sub_23A6DC838();
      if (v4)
        break;
      v17 = v16;
      swift_release();
      swift_release();
      if ((v17 & 1) != 0)
      {
        v18 = v6 + 8;
        if (v7 < v6 || v7 >= v18 || v7 != v6)
          *(_QWORD *)v7 = *(_QWORD *)v6;
        __dst = v15;
      }
      else
      {
        if (v7 != v15)
          *(_QWORD *)v7 = *(_QWORD *)v15;
        __dst = v15 + 8;
        v32 = v15 + 8;
        v18 = v6;
      }
      v7 += 8;
      v33 = v7;
      if (__dst < v14)
      {
        v6 = v18;
        if ((unint64_t)v18 < a3)
          continue;
      }
      goto LABEL_48;
    }
LABEL_47:
    swift_release();
    swift_release();
LABEL_48:
    sub_23A6FFF94((void **)&v33, &v32, &v31);
    return 1;
  }
  result = sub_23A70D78C();
  __break(1u);
  return result;
}

char *sub_23A6FFE9C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569B0960);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23A6FFF94(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_23A70D78C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_23A70003C(uint64_t a1)
{
  return sub_23A6FFE9C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A700050(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B02D0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23A70D78C();
  __break(1u);
  return result;
}

uint64_t sub_23A7001D0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0978);
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
  result = sub_23A70D78C();
  __break(1u);
  return result;
}

uint64_t sub_23A700338(uint64_t a1)
{
  return sub_23A7001D0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A70034C(uint64_t a1)
{
  return sub_23A700050(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_23A700360()
{
  JUMPOUT(0x23B854C80);
}

uint64_t sub_23A700374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A705E1C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A7003A4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
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
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v16);
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    ++v11;
    result = swift_retain();
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

uint64_t sub_23A70059C(uint64_t a1)
{
  swift_unknownObjectUnownedDestroy();
  return a1;
}

uint64_t sub_23A7005C0(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v11;

  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  sub_23A70D00C();
  swift_release();
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  v4 = (uint64_t *)(a2 + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__eventHandlers);
  swift_beginAccess();
  v5 = sub_23A706804(a1);
  if ((v6 & 1) != 0)
  {
    v7 = v5;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v4;
    v11 = *v4;
    *v4 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_23A708010();
      v9 = v11;
    }
    sub_23A70778C(v7, v9);
    *v4 = v9;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  swift_getKeyPath();
  sub_23A70D018();
  return swift_release();
}

uint64_t sub_23A700750(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v11;

  swift_getKeyPath();
  sub_23A6E1420((unint64_t *)&unk_2569AFF20, (uint64_t (*)(uint64_t))type metadata accessor for HostableSceneObserver, (uint64_t)&unk_23A710154);
  sub_23A70D00C();
  swift_release();
  swift_getKeyPath();
  sub_23A70D024();
  swift_release();
  v4 = (uint64_t *)(a2 + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver__actionHandlers);
  swift_beginAccess();
  v5 = sub_23A706804(a1);
  if ((v6 & 1) != 0)
  {
    v7 = v5;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v4;
    v11 = *v4;
    *v4 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_23A70801C();
      v9 = v11;
    }
    sub_23A70778C(v7, v9);
    *v4 = v9;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  swift_getKeyPath();
  sub_23A70D018();
  return swift_release();
}

uint64_t sub_23A7008E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  _QWORD *v6;
  int v7;
  char v8;
  int v9;
  int v10;
  objc_class *v11;
  char *v12;
  char *v14;
  id v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  void *v29;
  id v30;
  char v31;
  void *v32;
  void *v33;
  uint64_t KeyPath;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  objc_super v50;

  v1 = v0;
  swift_getKeyPath();
  *(_QWORD *)&v47 = v0;
  sub_23A6E1420(&qword_2569AF5E0, type metadata accessor for PresentationViewModel, (uint64_t)&unk_23A711120);
  sub_23A70D00C();
  swift_release();
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel___uiSceneViewModel);
  v46 = OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel___uiSceneViewModel;
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 40);
    v4 = *(_DWORD *)(v2 + 48);
    v5 = *(unsigned __int8 *)(v2 + 52);
  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
  }
  swift_getKeyPath();
  *(_QWORD *)&v47 = v0;
  sub_23A70D00C();
  swift_release();
  v6 = (_QWORD *)(v0 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity);
  if (!v2 || v3 != *v6)
    goto LABEL_19;
  v7 = *((_DWORD *)v6 + 2);
  v8 = *((_BYTE *)v6 + 12);
  if (v5)
  {
    if (v4)
    {
      if (!v7)
        v8 = 0;
      if ((v8 & 1) != 0)
        goto LABEL_34;
LABEL_19:
      swift_getKeyPath();
      *(_QWORD *)&v47 = v0;
      sub_23A70D00C();
      swift_release();
      v9 = *((_DWORD *)v6 + 2);
      v10 = *((unsigned __int8 *)v6 + 12);
      v11 = (objc_class *)type metadata accessor for LayerTarget._UILayerTarget();
      v12 = (char *)objc_allocWithZone(v11);
      if (v10 == 1 && v9 == 0)
      {
        swift_deallocPartialClassInstance();
        v25 = *(_QWORD *)(v1 + 128);
        swift_getKeyPath();
        *(_QWORD *)&v47 = v25;
        sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
        sub_23A70D00C();
        swift_release();
        v26 = *(char **)(v25 + 24);
        v27 = *(_QWORD *)&v26[OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver_state];
        swift_getKeyPath();
        *(_QWORD *)&v47 = v27;
        sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
        v28 = v26;
        sub_23A70D00C();
        swift_release();
        v29 = *(void **)(v27 + 48);
        v30 = v29;

        if (v29)
        {
          swift_getKeyPath();
          *(_QWORD *)&v47 = v1;
          sub_23A70D00C();
          swift_release();
          v31 = *((_BYTE *)v6 + 12);
          DWORD2(v47) = *((_DWORD *)v6 + 2);
          BYTE12(v47) = v31;
          sub_23A70146C();
          v32 = (void *)sub_23A70D438();
          swift_bridgeObjectRelease();
          swift_getKeyPath();
          *(_QWORD *)&v47 = v1;
          sub_23A70D00C();
          swift_release();
          v24 = objc_msgSend(v30, sel_createPresenterWithIdentifier_priority_, v32, *v6);

        }
        else
        {
          v24 = 0;
        }
      }
      else
      {
        v14 = &v12[OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target];
        *(_DWORD *)v14 = v9;
        v14[4] = v10;
        v50.receiver = v12;
        v50.super_class = v11;
        v15 = objc_msgSendSuper2(&v50, sel_init);
        v16 = *(_QWORD *)(v1 + 128);
        swift_getKeyPath();
        *(_QWORD *)&v47 = v16;
        sub_23A6E1420(&qword_2569AF5E8, (uint64_t (*)(uint64_t))type metadata accessor for HostModel, (uint64_t)&unk_23A70FA78);
        sub_23A70D00C();
        swift_release();
        v17 = *(char **)(v16 + 24);
        v18 = *(_QWORD *)&v17[OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver_state];
        swift_getKeyPath();
        *(_QWORD *)&v47 = v18;
        sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
        v19 = v17;
        sub_23A70D00C();
        swift_release();
        v20 = *(void **)(v18 + 48);
        v21 = v20;

        if (v20)
        {
          swift_getKeyPath();
          *(_QWORD *)&v47 = v1;
          sub_23A70D00C();
          swift_release();
          v22 = *((_BYTE *)v6 + 12);
          DWORD2(v47) = *((_DWORD *)v6 + 2);
          BYTE12(v47) = v22;
          sub_23A70146C();
          v23 = (void *)sub_23A70D438();
          swift_bridgeObjectRelease();
          swift_getKeyPath();
          *(_QWORD *)&v47 = v1;
          sub_23A70D00C();
          swift_release();
          v24 = objc_msgSend(v21, sel_createPresenterForLayerTarget_identifier_priority_, v15, v23, *v6);

        }
        else
        {

          v24 = 0;
        }
      }
      swift_getKeyPath();
      *(_QWORD *)&v47 = v1;
      sub_23A70D00C();
      swift_release();
      v33 = *(void **)(v1 + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__presenterObserver);
      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      *(_QWORD *)&v47 = v33;
      sub_23A6E1420((unint64_t *)&qword_2569AF8D0, (uint64_t (*)(uint64_t))type metadata accessor for UIPresenterObserver, (uint64_t)&unk_23A70F6C0);
      v35 = v33;
      swift_unknownObjectRetain();
      sub_23A70D000();

      swift_release();
      swift_unknownObjectRelease();
      if (v24
        && (objc_msgSend(v24, sel_activate),
            swift_getObjectType(),
            swift_unknownObjectRetain(),
            v36 = sub_23A70D5A0(),
            swift_unknownObjectRelease(),
            v36))
      {
        *((_QWORD *)&v48 + 1) = sub_23A70D0F0();
        v49 = MEMORY[0x24BEBC8F8];
        *(_QWORD *)&v47 = v36;
      }
      else
      {
        v49 = 0;
        v47 = 0u;
        v48 = 0u;
      }
      sub_23A6FB670((uint64_t)&v47);
      sub_23A6FEC0C((uint64_t)&v47);
      v37 = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](v37);
      *(_QWORD *)&v47 = v1;
      swift_unknownObjectRetain();
      sub_23A70D000();
      swift_release();
      swift_unknownObjectRelease();
      swift_getKeyPath();
      *(_QWORD *)&v47 = v1;
      sub_23A70D00C();
      swift_release();
      v38 = *v6;
      v39 = *((_DWORD *)v6 + 2);
      v40 = *((_BYTE *)v6 + 12);
      v41 = swift_allocObject();
      swift_weakInit();
      v42 = swift_allocObject();
      *(_QWORD *)(v42 + 16) = v24;
      *(_QWORD *)(v42 + 24) = v41;
      type metadata accessor for UISceneViewRepresentableViewModel();
      v43 = swift_allocObject();
      *(_DWORD *)(v43 + 48) = v39;
      *(_BYTE *)(v43 + 52) = v40;
      *(_QWORD *)(v43 + 32) = v24;
      *(_QWORD *)(v43 + 40) = v38;
      *(_QWORD *)(v43 + 16) = sub_23A7012E8;
      *(_QWORD *)(v43 + 24) = v42;
      v44 = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](v44);
      *(_QWORD *)&v47 = v1;
      swift_unknownObjectRetain_n();
      sub_23A70D000();
      swift_unknownObjectRelease();
      swift_release();
      swift_release();
      goto LABEL_34;
    }
    if (v7)
      v8 = 0;
    if ((v8 & 1) == 0)
      goto LABEL_19;
  }
  else
  {
    if (v4 != v7)
      v8 = 1;
    if ((v8 & 1) != 0)
      goto LABEL_19;
  }
LABEL_34:
  swift_getKeyPath();
  *(_QWORD *)&v47 = v1;
  sub_23A70D00C();
  swift_release();
  result = *(_QWORD *)(v1 + v46);
  if (!result)
  {
    result = sub_23A70D750();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A70121C()
{
  uint64_t v0;

  return sub_23A6E4064(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23A701234()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__scenePresenter) = *(_QWORD *)(v0 + 24);
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A701274()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A701298()
{
  return objectdestroyTm_1((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroyTm_1(void (*a1)(_QWORD), void (*a2)(_QWORD))
{
  uint64_t v2;

  a1(*(_QWORD *)(v2 + 16));
  a2(*(_QWORD *)(v2 + 24));
  return swift_deallocObject();
}

uint64_t sub_23A7012E8()
{
  uint64_t v0;

  return sub_23A6FB8A8(*(void **)(v0 + 16));
}

uint64_t sub_23A7012F0()
{
  return sub_23A701344();
}

void sub_23A701314()
{
  uint64_t v0;
  int v1;
  char v2;
  uint64_t v3;

  v1 = *(_DWORD *)(v0 + 32);
  v2 = *(_BYTE *)(v0 + 36);
  v3 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel__uiScenePresenterIdentity;
  *(_QWORD *)v3 = *(_QWORD *)(v0 + 24);
  *(_DWORD *)(v3 + 8) = v1;
  *(_BYTE *)(v3 + 12) = v2;
}

uint64_t sub_23A701344()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12DrawingBoard21PresentationViewModel___uiSceneViewModel) = *(_QWORD *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_23A701384@<X0>(_BYTE *a1@<X8>)
{
  return sub_23A7013B0(a1);
}

uint64_t sub_23A701398@<X0>(uint64_t *a1@<X8>)
{
  return sub_23A7061F0(a1);
}

uint64_t sub_23A7013B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = sub_23A705E1C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
  *a1 = result & 1;
  return result;
}

uint64_t sub_23A7013E4()
{
  return sub_23A70121C();
}

_QWORD *__swift_memcpy13_8(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for UIScenePresenterIdentity(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 13))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for UIScenePresenterIdentity(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 13) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UIScenePresenterIdentity()
{
  return &type metadata for UIScenePresenterIdentity;
}

uint64_t sub_23A70146C()
{
  uint64_t v0;
  int v1;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(v0 + 12);
  v3 = sub_23A70D7C8();
  sub_23A70D468();
  if (v1 != 1)
  {
    sub_23A70D7C8();
    sub_23A70D468();
    swift_bridgeObjectRelease();
  }
  sub_23A70D468();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23A701578()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 12);
  sub_23A70D870();
  sub_23A70D87C();
  sub_23A70D87C();
  if (v1 != 1)
    sub_23A70D888();
  return sub_23A70D894();
}

uint64_t sub_23A701604()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 12);
  sub_23A70D87C();
  if (v1 == 1)
    return sub_23A70D87C();
  sub_23A70D87C();
  return sub_23A70D888();
}

uint64_t sub_23A70166C()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 12);
  sub_23A70D870();
  sub_23A70D87C();
  sub_23A70D87C();
  if (v1 != 1)
    sub_23A70D888();
  return sub_23A70D894();
}

uint64_t sub_23A7016F8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;

  if (*(_QWORD *)a1 == *(_QWORD *)a2)
  {
    v2 = *(_DWORD *)(a1 + 8);
    v3 = *(_DWORD *)(a2 + 8);
    if (*(_BYTE *)(a1 + 12) == 1)
    {
      if (v2)
      {
        if (*(_BYTE *)(a2 + 12))
          return v3 != 0;
      }
      else if (*(_BYTE *)(a2 + 12))
      {
        return v3 == 0;
      }
    }
    else
    {
      if (v2 == v3)
        v5 = *(_BYTE *)(a2 + 12);
      else
        v5 = 1;
      if ((v5 & 1) == 0)
        return 1;
    }
  }
  return 0;
}

unint64_t sub_23A701764()
{
  unint64_t result;

  result = qword_2569B0980;
  if (!qword_2569B0980)
  {
    result = MEMORY[0x23B855268](&unk_23A71139C, &type metadata for UIScenePresenterIdentity);
    atomic_store(result, (unint64_t *)&qword_2569B0980);
  }
  return result;
}

uint64_t sub_23A7017A8(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  char v7;
  char *v8;
  _BYTE v9[24];
  uint64_t v10;

  sub_23A701EA8(a1, (uint64_t)v9);
  if (v10)
  {
    type metadata accessor for LayerTarget._UILayerTarget();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v2 = *(_DWORD *)(v1
                     + OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target);
      v3 = *(unsigned __int8 *)(v1
                              + OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target
                              + 4);
      v4 = *(_DWORD *)&v8[OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target];
      v5 = v8[OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target
                             + 4];

      if (v3 == 1)
      {
        if (v2)
        {
          if (v5)
            return v4 != 0;
        }
        else if (v5)
        {
          return v4 == 0;
        }
      }
      else
      {
        if (v2 == v4)
          v7 = v5;
        else
          v7 = 1;
        if ((v7 & 1) == 0)
          return 1;
      }
    }
  }
  else
  {
    sub_23A6E6768((uint64_t)v9);
  }
  return 0;
}

BOOL sub_23A7018F8(id a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;

  v3 = v1 + OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target;
  v4 = *(_DWORD *)(v1
                 + OBJC_IVAR____TtCO12DrawingBoard11LayerTargetP33_503B1B848CE68D8EEDC1C0DE3CC3DEEF14_UILayerTarget_target);
  if (*(_BYTE *)(v3 + 4) != 1)
    return objc_msgSend(a1, sel_type) == (id)1 && v4 == objc_msgSend(a1, sel_contextID);
  return !v4 || objc_msgSend(a1, sel_type) == (id)3 || objc_msgSend(a1, sel_type) == (id)4;
}

id sub_23A701A18()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LayerTarget._UILayerTarget();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LayerTarget.hash(into:)()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 4) == 1)
    return sub_23A70D87C();
  sub_23A70D87C();
  return sub_23A70D888();
}

uint64_t static LayerTarget.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *(unsigned __int8 *)(a2 + 4);
  v3 = (*(_DWORD *)a1 == *(_DWORD *)a2) & ~v2;
  if (*(_DWORD *)a2)
    v4 = *(unsigned __int8 *)(a2 + 4);
  else
    v4 = 0;
  if (*(_DWORD *)a2)
    v2 = 0;
  if (*(_DWORD *)a1)
    v5 = v4;
  else
    v5 = v2;
  if (*(_BYTE *)(a1 + 4) == 1)
    return v5;
  else
    return v3;
}

uint64_t LayerTarget.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 4);
  sub_23A70D870();
  sub_23A70D87C();
  if (v1 != 1)
    sub_23A70D888();
  return sub_23A70D894();
}

uint64_t sub_23A701B58()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 4);
  sub_23A70D870();
  sub_23A70D87C();
  if (v1 != 1)
    sub_23A70D888();
  return sub_23A70D894();
}

uint64_t sub_23A701BD0()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 4) == 1)
    return sub_23A70D87C();
  sub_23A70D87C();
  return sub_23A70D888();
}

uint64_t sub_23A701C28()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 4);
  sub_23A70D870();
  sub_23A70D87C();
  if (v1 != 1)
    sub_23A70D888();
  return sub_23A70D894();
}

uint64_t sub_23A701C9C(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *(unsigned __int8 *)(a2 + 4);
  v3 = (*(_DWORD *)a1 == *(_DWORD *)a2) & ~v2;
  if (*(_DWORD *)a2)
    v4 = *(unsigned __int8 *)(a2 + 4);
  else
    v4 = 0;
  if (*(_DWORD *)a2)
    v2 = 0;
  if (*(_DWORD *)a1)
    v5 = v4;
  else
    v5 = v2;
  if (*(_BYTE *)(a1 + 4) == 1)
    return v5;
  else
    return v3;
}

uint64_t LayerTarget.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 4) == 1)
  {
    if (*(_DWORD *)v0)
      return 0x6472616F6279656BLL;
    else
      return 0x726579614C6C6C61;
  }
  else
  {
    sub_23A70D7C8();
    sub_23A70D468();
    swift_bridgeObjectRelease();
    return 0x3A747865746E6F63;
  }
}

unint64_t sub_23A701D94()
{
  unint64_t result;

  result = qword_2569B0990;
  if (!qword_2569B0990)
  {
    result = MEMORY[0x23B855268](&protocol conformance descriptor for LayerTarget, &type metadata for LayerTarget);
    atomic_store(result, (unint64_t *)&qword_2569B0990);
  }
  return result;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for LayerTarget(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LayerTarget(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_23A701E3C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A701E58(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LayerTarget()
{
  return &type metadata for LayerTarget;
}

uint64_t type metadata accessor for LayerTarget._UILayerTarget()
{
  return objc_opt_self();
}

uint64_t sub_23A701EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569AFCA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t SceneActivationPolicyError.sceneIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SceneActivationPolicyError.description.getter()
{
  sub_23A70D6D8();
  sub_23A70D468();
  swift_bridgeObjectRetain();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  sub_23A70D468();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0948);
  sub_23A70D738();
  return 0;
}

uint64_t destroy for SceneActivationPolicyError(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *_s12DrawingBoard26SceneActivationPolicyErrorVwCP_0(_QWORD *a1, uint64_t a2)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(id *)a2;
  v5 = *(id *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  *a1 = v4;
  a1[1] = v7;
  a1[2] = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SceneActivationPolicyError(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  void *v6;

  v4 = *(id *)a2;
  v5 = *(id *)a2;
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SceneActivationPolicyError(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneActivationPolicyError(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneActivationPolicyError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneActivationPolicyError()
{
  return &type metadata for SceneActivationPolicyError;
}

void sub_23A7021B8()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  uint64_t ObjCClassFromMetadata;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char *v10;
  void (*v11)(id);
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  objc_super v19;

  v1 = v0;
  v19.receiver = v0;
  v19.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v19, sel__readySceneForConnection);
  objc_msgSend(v0, sel_setDelegate_, *(_QWORD *)&v0[OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene__delegate]);
  v2 = objc_msgSend(v0, sel__FBSScene);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB58]), sel_initWithWindowScene_, v0);
  objc_msgSend(v3, sel_makeKeyAndVisible);
  type metadata accessor for LocalSceneExtension();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  type metadata accessor for LocalSceneExtension.ClientComponent();
  if (objc_msgSend(v2, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata()))
  {
    v5 = (void *)swift_dynamicCastClassUnconditional();
    if (objc_msgSend(v5, sel_isValid))
    {
      v6 = objc_msgSend(v5, sel_clientScene);
      if (v6)
      {
        v7 = v6;
        v8 = objc_msgSend(v6, sel_settings);

        v9 = (void *)swift_dynamicCastObjCProtocolConditional();
        if (v9)
        {
          v10 = (char *)objc_msgSend(v9, sel_builderBox);
          v11 = *(void (**)(id))&v10[OBJC_IVAR____TtC12DrawingBoard17ContentBuilderBox_builder];
          swift_retain();

          v11(v2);
          swift_release();
          v12 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569B0B60));
          v13 = (void *)sub_23A70D210();
          objc_msgSend(v3, sel_setRootViewController_, v13);

          v14 = (void *)objc_opt_self();
          v15 = v3;
          v16 = objc_msgSend(v14, sel_blueColor);
          objc_msgSend(v15, sel_setBackgroundColor_, v16);

          swift_unknownObjectRelease();
          v17 = *(void **)&v1[OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene_myWindow];
          *(_QWORD *)&v1[OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene_myWindow] = v15;

          return;
        }

      }
    }
    sub_23A70D750();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0B58);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_23A7109A0;
    *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v18 + 32) = 0xD000000000000030;
    *(_QWORD *)(v18 + 40) = 0x800000023A718510;
    sub_23A70D858();

    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for LocalWindowScene()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LocalWindowSceneDelegate()
{
  return objc_opt_self();
}

uint64_t sub_23A70276C(void *a1)
{
  uint64_t v2;
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0B58);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23A7109A0;
  sub_23A70D6D8();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(a1, sel_description);
  sub_23A70D444();

  sub_23A70D468();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 0xD00000000000001ELL;
  *(_QWORD *)(v2 + 40) = 0x800000023A7185C0;
  sub_23A70D858();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A70286C()
{
  uint64_t result;
  uint64_t v1;
  id v2;
  void *v3;

  type metadata accessor for LocalSceneActivationContext();
  sub_23A7029B0();
  result = sub_23A70D5AC();
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0B58);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_23A7109A0;
    sub_23A70D6D8();
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v3, sel_description);
    sub_23A70D444();

    sub_23A70D468();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v1 + 32) = 0xD00000000000001ELL;
    *(_QWORD *)(v1 + 40) = 0x800000023A7184F0;
    sub_23A70D858();

    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_23A7029B0()
{
  unint64_t result;

  result = qword_2569B0B50;
  if (!qword_2569B0B50)
  {
    result = MEMORY[0x23B855268](&unk_23A7108E4, &type metadata for LocalSceneConnectionDefinition);
    atomic_store(result, (unint64_t *)&qword_2569B0B50);
  }
  return result;
}

void sub_23A7029F4()
{
  unint64_t v0;

  sub_23A703100();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *sub_23A702A80(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23A70D120();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = a3[11];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23A702B90(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_23A70D120();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_23A702C20(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23A70D120();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[11];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_23A702D04(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  if (a1 != a2)
  {
    sub_23A6DEB98((uint64_t)a1, &qword_2569B0540);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23A70D120();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_retain();
  swift_release();
  v7 = a3[10];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  v11 = a3[11];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_23A702E28(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_23A70D120();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  return a1;
}

char *sub_23A702EE4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_23A6DEB98((uint64_t)a1, &qword_2569B0540);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0540);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23A70D120();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_release();
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  swift_release();
  v8 = a3[11];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A702FE0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A702FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2569B0B70);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23A70306C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A703078(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2569B0B70);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SceneViewHostedContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SceneViewHostedContent);
}

void sub_23A703100()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2569B0BF8)
  {
    sub_23A70D120();
    v0 = sub_23A70D12C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2569B0BF8);
  }
}

uint64_t sub_23A703154()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23A70318C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[2];
  _QWORD v59[3];
  _QWORD v60[3];

  v42 = a1;
  v54 = a2;
  v3 = sub_23A70D120();
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v51 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v48 = (uint64_t)&v41 - v6;
  v7 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0C00);
  swift_getTupleTypeMetadata3();
  v8 = sub_23A70D3E4();
  MEMORY[0x23B855268](MEMORY[0x24BDF5428], v8);
  v9 = sub_23A70D3C0();
  v43 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v41 - v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0C08);
  v12 = sub_23A70D198();
  v45 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v41 - v13;
  v15 = sub_23A70D198();
  v47 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v41 - v16;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0C10);
  v18 = sub_23A70D198();
  v50 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v46 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v49 = (uint64_t)&v41 - v21;
  v22 = *(_QWORD *)(v42 + 24);
  v55 = v7;
  v56 = v22;
  v57 = v44;
  sub_23A70D204();
  sub_23A70D3B4();
  sub_23A70D36C();
  v23 = MEMORY[0x23B855268](MEMORY[0x24BDF4700], v9);
  sub_23A70D324();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v9);
  sub_23A70D3D8();
  v24 = sub_23A6F8288(&qword_2569B0C18, &qword_2569B0C08, MEMORY[0x24BDF1028]);
  v60[0] = v23;
  v60[1] = v24;
  v25 = MEMORY[0x23B855268](MEMORY[0x24BDED308], v12, v60);
  sub_23A70D348();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v12);
  v26 = v48;
  sub_23A6F82C8(v48);
  v27 = v51;
  v28 = v52;
  v29 = v53;
  (*(void (**)(char *, _QWORD, uint64_t))(v52 + 104))(v51, *MEMORY[0x24BDEB3F0], v53);
  v30 = v26;
  v31 = v27;
  LOBYTE(v27) = sub_23A70D114();
  v32 = *(void (**)(char *, uint64_t))(v28 + 8);
  v32(v31, v29);
  v32((char *)v30, v29);
  if ((v27 & 1) != 0)
    v33 = sub_23A70D36C();
  else
    v33 = sub_23A70D384();
  v59[2] = v33;
  sub_23A70D2AC();
  v59[0] = v25;
  v59[1] = MEMORY[0x24BDEDBB8];
  v34 = MEMORY[0x24BDED308];
  v35 = MEMORY[0x23B855268](MEMORY[0x24BDED308], v15, v59);
  v36 = (uint64_t)v46;
  sub_23A70D300();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v17, v15);
  v37 = sub_23A6F8288(&qword_2569B0C20, &qword_2569B0C10, MEMORY[0x24BDF06D0]);
  v58[0] = v35;
  v58[1] = v37;
  MEMORY[0x23B855268](v34, v18, v58);
  v38 = v49;
  sub_23A6E1610(v36, v18, v49);
  v39 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
  v39(v36, v18);
  sub_23A6E0C50(v38, v18, v54);
  return ((uint64_t (*)(uint64_t, uint64_t))v39)(v38, v18);
}

uint64_t sub_23A7036A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  _QWORD v58[3];
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
  char v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74[4];
  _OWORD v75[8];
  _BYTE v76[135];
  char v77;
  __int128 v78;
  _OWORD v79[9];
  char v80;
  _OWORD v81[10];
  char v82;

  v4 = a3;
  v49 = a3;
  v54 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0C28);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = *(_QWORD *)(a2 - 8);
  v10 = v51;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v45 - v14;
  v52 = (char *)&v45 - v14;
  v17 = type metadata accessor for SceneViewHostedContent(0, a2, v4, v16);
  (*(void (**)(void))(a1 + *(int *)(v17 + 40)))();
  v50 = v13;
  sub_23A6E1610((uint64_t)v13, a2, (uint64_t)v15);
  v53 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18 = a2;
  v53(v13, a2);
  v19 = (_QWORD *)(a1 + *(int *)(v17 + 44));
  v20 = a1;
  v21 = v19[1];
  *(_QWORD *)&v81[0] = *v19;
  *((_QWORD *)&v81[0] + 1) = v21;
  sub_23A704204();
  swift_bridgeObjectRetain();
  v22 = sub_23A70D2DC();
  v24 = v23;
  LOBYTE(v4) = v25 & 1;
  v26 = sub_23A70D2B8();
  v27 = v48;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v48, 1, 1, v26);
  sub_23A70D2C4();
  sub_23A6DEB98(v27, &qword_2569B0C28);
  v28 = sub_23A70D2D0();
  v47 = v29;
  v48 = v28;
  LOBYTE(v27) = v30;
  v46 = v31;
  swift_release();
  sub_23A704248(v22, v24, v4);
  swift_bridgeObjectRelease();
  v32 = sub_23A70D204();
  v33 = v18;
  v34 = v49;
  sub_23A703AF4(v20, v18, v49, v35, (uint64_t)v75);
  *(_OWORD *)&v76[71] = v75[4];
  *(_OWORD *)&v76[87] = v75[5];
  *(_OWORD *)&v76[103] = v75[6];
  *(_OWORD *)&v76[119] = v75[7];
  *(_OWORD *)&v76[7] = v75[0];
  *(_OWORD *)&v76[23] = v75[1];
  *(_OWORD *)&v76[39] = v75[2];
  v77 = 1;
  *(_OWORD *)&v76[55] = v75[3];
  v36 = sub_23A70D378();
  v37 = sub_23A70D2AC();
  *(_OWORD *)((char *)&v79[5] + 1) = *(_OWORD *)&v76[80];
  *(_OWORD *)((char *)&v79[6] + 1) = *(_OWORD *)&v76[96];
  *(_OWORD *)((char *)&v79[7] + 1) = *(_OWORD *)&v76[112];
  *(_OWORD *)((char *)&v79[1] + 1) = *(_OWORD *)&v76[16];
  *(_OWORD *)((char *)&v79[2] + 1) = *(_OWORD *)&v76[32];
  *(_OWORD *)((char *)&v79[3] + 1) = *(_OWORD *)&v76[48];
  *(_OWORD *)((char *)&v79[4] + 1) = *(_OWORD *)&v76[64];
  v78 = (unint64_t)v32;
  LOBYTE(v79[0]) = 1;
  *(_OWORD *)((char *)v79 + 1) = *(_OWORD *)v76;
  *(_QWORD *)&v79[8] = *(_QWORD *)&v76[127];
  *((_QWORD *)&v79[8] + 1) = v36;
  v80 = v37;
  v38 = (uint64_t)v50;
  v39 = v52;
  v40 = v33;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v50, v52, v33);
  v41 = v47;
  v70 = v48;
  v71 = v47;
  v72 = v27 & 1;
  v73 = v46;
  v74[0] = v38;
  v74[1] = (uint64_t)&v70;
  v67 = v79[7];
  v68 = v79[8];
  v69 = v80;
  v63 = v79[3];
  v64 = v79[4];
  v65 = v79[5];
  v66 = v79[6];
  v59 = v78;
  v60 = v79[0];
  v61 = v79[1];
  v62 = v79[2];
  v74[2] = (uint64_t)&v59;
  v42 = v48;
  sub_23A704258(v48, v47, v27 & 1);
  swift_bridgeObjectRetain();
  sub_23A704268((uint64_t)&v78);
  v58[0] = v40;
  v58[1] = MEMORY[0x24BDF1FA8];
  v58[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0C00);
  v55 = v34;
  v56 = MEMORY[0x24BDF1F80];
  v57 = sub_23A70434C();
  sub_23A704040(v74, 3uLL, (uint64_t)v58);
  sub_23A7043E8((uint64_t)&v78);
  sub_23A704248(v42, v41, v27 & 1);
  swift_bridgeObjectRelease();
  v43 = (uint64_t (*)(uint64_t, uint64_t))v53;
  v53(v39, v40);
  v81[8] = v67;
  v81[9] = v68;
  v82 = v69;
  v81[4] = v63;
  v81[5] = v64;
  v81[6] = v65;
  v81[7] = v66;
  v81[0] = v59;
  v81[1] = v60;
  v81[2] = v61;
  v81[3] = v62;
  sub_23A7043E8((uint64_t)v81);
  sub_23A704248(v70, v71, v72);
  swift_bridgeObjectRelease();
  return v43(v38, v40);
}

uint64_t sub_23A703AF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  void *Strong;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  id v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v7 = *(int *)(type metadata accessor for SceneViewHostedContent(0, a2, a3, a4) + 36);
  v8 = *(_QWORD *)(a1 + v7);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v10 = objc_msgSend(Strong, sel_identifier);

  sub_23A70D444();
  sub_23A704204();
  v11 = sub_23A70D2DC();
  v46 = v12;
  v47 = v11;
  v42 = v13;
  v48 = v14;
  swift_getKeyPath();
  sub_23A6E1420(qword_2569B0C50, (uint64_t (*)(uint64_t))type metadata accessor for HostedPreviewModel, (uint64_t)&unk_23A711CC0);
  sub_23A70D00C();
  swift_release();
  v15 = *(void **)(v8 + 24);
  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0048, (uint64_t (*)(uint64_t))type metadata accessor for HostedSceneObserver, (uint64_t)&unk_23A7103BC);
  v16 = v15;
  sub_23A70D00C();
  swift_release();

  type metadata accessor for CGRect(0);
  sub_23A70D450();
  v17 = sub_23A70D2DC();
  v43 = v18;
  v44 = v17;
  v37 = v19;
  v45 = v20;
  v21 = *(_QWORD *)(a1 + v7);
  swift_getKeyPath();
  sub_23A70D00C();
  swift_release();
  v22 = *(void **)(v21 + 24);
  swift_getKeyPath();
  v23 = v22;
  sub_23A70D00C();
  swift_release();

  v24 = (id)BSInterfaceOrientationDescription();
  sub_23A70D444();

  v25 = sub_23A70D2DC();
  v39 = v26;
  v40 = v25;
  LOBYTE(v16) = v27;
  v41 = v28;
  swift_getKeyPath();
  sub_23A70D00C();
  swift_release();
  v29 = *(void **)(v21 + 24);
  swift_getKeyPath();
  v30 = v29;
  sub_23A70D00C();
  swift_release();

  v31 = v16 & 1;
  LOBYTE(v16) = v37 & 1;
  sub_23A70D468();
  swift_bridgeObjectRelease();
  v36 = sub_23A70D2DC();
  v38 = v32;
  LOBYTE(v23) = v33 & 1;
  *(_QWORD *)a5 = v47;
  *(_QWORD *)(a5 + 8) = v46;
  *(_BYTE *)(a5 + 16) = v42 & 1;
  *(_QWORD *)(a5 + 24) = v48;
  *(_QWORD *)(a5 + 32) = v44;
  *(_QWORD *)(a5 + 40) = v43;
  *(_BYTE *)(a5 + 48) = (_BYTE)v16;
  *(_QWORD *)(a5 + 56) = v45;
  *(_QWORD *)(a5 + 64) = v40;
  *(_QWORD *)(a5 + 72) = v39;
  *(_BYTE *)(a5 + 80) = v31;
  *(_QWORD *)(a5 + 88) = v41;
  *(_QWORD *)(a5 + 96) = v36;
  *(_QWORD *)(a5 + 104) = v32;
  *(_BYTE *)(a5 + 112) = v33 & 1;
  *(_QWORD *)(a5 + 120) = v34;
  sub_23A704258(v47, v46, v42 & 1);
  swift_bridgeObjectRetain();
  sub_23A704258(v44, v43, (char)v16);
  swift_bridgeObjectRetain();
  sub_23A704258(v40, v39, v31);
  swift_bridgeObjectRetain();
  sub_23A704258(v36, v38, (char)v23);
  swift_bridgeObjectRetain();
  sub_23A704248(v36, v38, (char)v23);
  swift_bridgeObjectRelease();
  sub_23A704248(v40, v39, v31);
  swift_bridgeObjectRelease();
  sub_23A704248(v44, v43, (char)v16);
  swift_bridgeObjectRelease();
  sub_23A704248(v47, v46, v42 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A704040(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8](a1);
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_23A70D3F0();
  }
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_23A70D3F0();
}

uint64_t sub_23A7041F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23A7036A8(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_23A704204()
{
  unint64_t result;

  result = qword_2569B0C30;
  if (!qword_2569B0C30)
  {
    result = MEMORY[0x23B855268](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2569B0C30);
  }
  return result;
}

uint64_t sub_23A704248(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23A704258(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23A704268(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_BYTE *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_BYTE *)(a1 + 104);
  v10 = *(_QWORD *)(a1 + 128);
  v11 = *(_QWORD *)(a1 + 120);
  v9 = *(_BYTE *)(a1 + 136);
  sub_23A704258(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_23A704258(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_23A704258(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_23A704258(v11, v10, v9);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

unint64_t sub_23A70434C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2569B0C38;
  if (!qword_2569B0C38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0C00);
    v2[0] = sub_23A6F8288(&qword_2569B0C40, &qword_2569B0C48, MEMORY[0x24BDF4700]);
    v2[1] = sub_23A6F8288(&qword_2569B0C20, &qword_2569B0C10, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x23B855268](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2569B0C38);
  }
  return result;
}

uint64_t sub_23A7043E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_BYTE *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_BYTE *)(a1 + 104);
  v10 = *(_QWORD *)(a1 + 128);
  v11 = *(_QWORD *)(a1 + 120);
  v9 = *(_BYTE *)(a1 + 136);
  sub_23A704248(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_23A704248(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_23A704248(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_23A704248(v11, v10, v9);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A7044EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0C00);
  swift_getTupleTypeMetadata3();
  v0 = sub_23A70D3E4();
  MEMORY[0x23B855268](MEMORY[0x24BDF5428], v0);
  v1 = sub_23A70D3C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0C08);
  v2 = sub_23A70D198();
  v3 = sub_23A70D198();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0C10);
  v4 = sub_23A70D198();
  v9[0] = MEMORY[0x23B855268](MEMORY[0x24BDF4700], v1);
  v9[1] = sub_23A6F8288(&qword_2569B0C18, &qword_2569B0C08, MEMORY[0x24BDF1028]);
  v5 = MEMORY[0x24BDED308];
  v8[0] = MEMORY[0x23B855268](MEMORY[0x24BDED308], v2, v9);
  v8[1] = MEMORY[0x24BDEDBB8];
  v7[0] = MEMORY[0x23B855268](v5, v3, v8);
  v7[1] = sub_23A6F8288(&qword_2569B0C20, &qword_2569B0C10, MEMORY[0x24BDF06D0]);
  return MEMORY[0x23B855268](v5, v4, v7);
}

uint64_t SceneSettings.subscript.setter(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t *v25;
  void (*v26)(uint64_t **, uint64_t *);
  uint64_t *v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35[12];

  v6 = *a2;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(*MEMORY[0x24BEE35B8] + v6 + 8);
  v30 = a4;
  v31 = (uint64_t *)type metadata accessor for FBValue(0, v7, v8, a4);
  v29 = *(v31 - 1);
  MEMORY[0x24BDAC7A8](v31);
  v10 = (uint64_t **)((char *)&v29 - v9);
  v11 = sub_23A70D5E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v29 - v14;
  v16 = *(_QWORD *)(v8 - 8);
  v17 = MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v29 - v20;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v33 = a1;
  v22(v15, (uint64_t)a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, v8) == 1)
  {
    v23 = *(void (**)(char *, uint64_t))(v12 + 8);
    v23(v15, v11);
    sub_23A7064F0((uint64_t)a2, v35);
    v23(v33, v11);
    sub_23A706608(v35);
    return swift_release();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v15, v8);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v8);
    sub_23A6F5FD8(a2, (uint64_t)v19, v30, v10);
    v25 = v31;
    sub_23A6F5ADC(v31, v35);
    v26 = *(void (**)(uint64_t **, uint64_t *))(v29 + 8);
    swift_retain_n();
    v26(v10, v25);
    v27 = v32;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = *v27;
    *v27 = 0x8000000000000000;
    sub_23A7081C8(v35, (uint64_t)a2, isUniquelyReferenced_nonNull_native);
    *v27 = v34;
    swift_release_n();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v33, v11);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v21, v8);
  }
}

uint64_t View.transformSceneSettings<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v11;

  swift_getKeyPath();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = a6;
  v11[5] = a2;
  v11[6] = a3;
  swift_retain();
  sub_23A70D330();
  swift_release();
  return swift_release();
}

uint64_t sub_23A7049A8(void (*a1)(_QWORD *__return_ptr), uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v10[2];

  sub_23A70D504();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) != 0)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = a1;
    *(_QWORD *)(v7 + 24) = a2;
    a1(v10);
    if (v3)
    {
      swift_release();
      return a3 & 1;
    }
    a3 = v10[0];
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return a3 & 1;
    __break(1u);
  }
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_23A70D6D8();
  sub_23A70D468();
  sub_23A70D90C();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  sub_23A70D468();
  result = sub_23A70D750();
  __break(1u);
  return result;
}

uint64_t sub_23A704B38(void (*a1)(_QWORD *__return_ptr), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v9[2];

  sub_23A70D504();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) != 0)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    v6 = a2;
    a1(v9);
    if (v2)
    {
      swift_release();
      return v6;
    }
    v6 = v9[0];
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return v6;
    __break(1u);
  }
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_23A70D6D8();
  sub_23A70D468();
  sub_23A70D90C();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  sub_23A70D468();
  result = sub_23A70D750();
  __break(1u);
  return result;
}

uint64_t sub_23A704CCC(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  char isEscapingClosureAtFileLocation;

  sub_23A70D504();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    goto LABEL_6;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  a1();
  if (v2)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_6:
    sub_23A70D6D8();
    sub_23A70D468();
    sub_23A70D90C();
    sub_23A70D468();
    swift_bridgeObjectRelease();
    sub_23A70D468();
    result = sub_23A70D750();
    __break(1u);
  }
  return result;
}

unint64_t sub_23A704E58(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0D18);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0CE8);
  v6 = sub_23A70D780();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_23A7090C4(v12, (uint64_t)v5);
    result = sub_23A706834((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = type metadata accessor for PresentationViewModel.Identity(0);
    result = sub_23A708FC4((uint64_t)v5, v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_23A704FDC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0CF0);
  v2 = (_QWORD *)sub_23A70D780();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (__int128 *)(a1 + 64);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 4);
    v6 = *((_QWORD *)v4 - 3);
    v17 = *v4;
    v18 = *(v4 - 1);
    v15 = v4[2];
    v16 = v4[1];
    v14 = v4[3];
    v7 = *((_QWORD *)v4 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    result = sub_23A706798(v5);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v5;
    v10 = v2[7] + 96 * result;
    *(_QWORD *)v10 = v6;
    *(_OWORD *)(v10 + 8) = v18;
    *(_OWORD *)(v10 + 24) = v17;
    *(_OWORD *)(v10 + 40) = v16;
    *(_OWORD *)(v10 + 56) = v15;
    *(_OWORD *)(v10 + 72) = v14;
    *(_QWORD *)(v10 + 88) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 = (__int128 *)((char *)v4 + 104);
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

unint64_t sub_23A705184@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_23A704FDC(MEMORY[0x24BEE4AF8]);
  *a1 = result;
  return result;
}

uint64_t sub_23A7051B0()
{
  sub_23A6F8288(&qword_2569B0D20, (uint64_t *)&unk_2569AF7B0, (uint64_t)&protocol conformance descriptor for SceneSettings<A>);
  return sub_23A70D180();
}

uint64_t sub_23A705218()
{
  sub_23A709080();
  return sub_23A70D1EC();
}

uint64_t SceneSettings.subscript.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A705554(a1, 105, a2);
}

uint64_t sub_23A705254@<X0>(_QWORD **a1@<X1>, uint64_t a2@<X8>)
{
  _QWORD *v3;

  v3 = *a1;
  swift_bridgeObjectRetain();
  SceneSettings.subscript.getter(v3, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A7052A8(uint64_t a1, uint64_t a2, uint64_t **a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v6 = *(uint64_t *)((char *)a3 + a4 - 24);
  v7 = *(uint64_t *)((char *)a3 + a4 - 8);
  v8 = sub_23A70D5E8();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - v9;
  v11 = *a3;
  (*(void (**)(char *, uint64_t))(v12 + 16))((char *)&v17 - v9, a1);
  v15 = type metadata accessor for SceneSettings(0, v6, v13, v14);
  swift_retain();
  return SceneSettings.subscript.setter(v10, v11, v15, v7);
}

void (*SceneSettings.subscript.modify(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4))(uint64_t ***a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  v10 = sub_23A70D5E8();
  v9[4] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v13 = malloc(v12);
  v9[7] = v13;
  SceneSettings.subscript.getter(a2, (uint64_t)v13);
  return sub_23A705428;
}

void sub_23A705428(uint64_t ***a1, char a2)
{
  uint64_t **v2;
  char *v3;
  char *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  v2 = *a1;
  v3 = (char *)(*a1)[6];
  v4 = (char *)(*a1)[7];
  if ((a2 & 1) != 0)
  {
    v5 = v2[4];
    v6 = v2[5];
    v7 = (uint64_t)v2[2];
    v9 = *v2;
    v8 = (uint64_t)v2[1];
    ((void (*)(uint64_t *, char *, uint64_t *))v6[2])((*a1)[6], v4, v5);
    swift_retain();
    SceneSettings.subscript.setter(v3, v9, v8, v7);
    ((void (*)(char *, uint64_t *))v6[1])(v4, v5);
  }
  else
  {
    v10 = (uint64_t)v2[2];
    v12 = *v2;
    v11 = (uint64_t)v2[1];
    swift_retain();
    SceneSettings.subscript.setter(v4, v12, v11, v10);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t SceneSettings.subscript.getter@<X0>(_QWORD *a1@<X1>, uint64_t a2@<X8>)
{
  swift_bridgeObjectRetain();
  sub_23A705554(a1, 139, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A70554C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A705554(a1, 139, a2);
}

uint64_t sub_23A705554@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  void (*v16)(_OWORD *__return_ptr, uint64_t);
  uint64_t v17;
  int v18;
  uint64_t v19;
  void (*v20)(char *, _QWORD, uint64_t, uint64_t);
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  void (*v25)(_OWORD *__return_ptr, uint64_t);
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[2];
  _OWORD v29[2];

  v6 = *(_QWORD *)(*MEMORY[0x24BEE35B8] + *a1 + 8);
  v7 = sub_23A70D5E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - v9;
  v11 = *v3;
  if (!*(_QWORD *)(v11 + 16))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a3, 1, 1, v6);
  v12 = swift_retain();
  v13 = sub_23A706798(v12);
  if ((v14 & 1) == 0)
  {
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a3, 1, 1, v6);
  }
  v15 = *(_QWORD *)(v11 + 56) + 96 * v13;
  v26 = *(_QWORD *)(v15 + 8);
  v27 = a3;
  v16 = *(void (**)(_OWORD *__return_ptr, uint64_t))(v15 + 48);
  v24 = a2;
  v25 = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v17 = swift_release();
  v25(v28, v17);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_23A708408(v28, v29);
  sub_23A6F8790((uint64_t)v29, (uint64_t)v28);
  v18 = swift_dynamicCast();
  v19 = *(_QWORD *)(v6 - 8);
  v20 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56);
  if (v18)
  {
    v20(v10, 0, 1, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    v21 = *(void (**)(uint64_t, char *, uint64_t))(v19 + 32);
    v22 = v27;
    v21(v27, v10, v6);
    return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v20)(v22, 0, 1, v6);
  }
  else
  {
    v20(v10, 1, 1, v6);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    *(_QWORD *)&v28[0] = 0;
    *((_QWORD *)&v28[0] + 1) = 0xE000000000000000;
    sub_23A70D6D8();
    sub_23A70D468();
    sub_23A70D90C();
    sub_23A70D468();
    swift_bridgeObjectRelease();
    sub_23A70D468();
    sub_23A70D738();
    result = sub_23A70D750();
    __break(1u);
  }
  return result;
}

uint64_t SceneSettings.subscript.setter(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  sub_23A708D54(a1, a2, a3, a4, a5);
  v6 = sub_23A70D5E8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
}

uint64_t sub_23A7058C4(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t *v25;
  void (*v26)(uint64_t **, uint64_t *);
  uint64_t *v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35[12];

  v6 = (uint64_t *)(*a2 + *MEMORY[0x24BEE35B8]);
  v7 = *v6;
  v8 = v6[1];
  v30 = a4;
  v31 = (uint64_t *)type metadata accessor for FBValue(0, v7, v8, a4);
  v29 = *(v31 - 1);
  MEMORY[0x24BDAC7A8](v31);
  v10 = (uint64_t **)((char *)&v29 - v9);
  v11 = sub_23A70D5E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v29 - v14;
  v16 = *(_QWORD *)(v8 - 8);
  v17 = MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v29 - v20;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v33 = a1;
  v22(v15, (uint64_t)a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, v8) == 1)
  {
    v23 = *(void (**)(char *, uint64_t))(v12 + 8);
    v23(v15, v11);
    sub_23A7064F0((uint64_t)a2, v35);
    v23(v33, v11);
    sub_23A706608(v35);
    return swift_release();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v15, v8);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v8);
    sub_23A6F5FD8(a2, (uint64_t)v19, v30, v10);
    v25 = v31;
    sub_23A6F5ADC(v31, v35);
    v26 = *(void (**)(uint64_t **, uint64_t *))(v29 + 8);
    swift_retain_n();
    v26(v10, v25);
    v27 = v32;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = *v27;
    *v27 = 0x8000000000000000;
    sub_23A7081C8(v35, (uint64_t)a2, isUniquelyReferenced_nonNull_native);
    *v27 = v34;
    swift_release_n();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v33, v11);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v21, v8);
  }
}

void (*SceneSettings.subscript.modify(_QWORD *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5))(uint64_t **a1, char a2)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  void *v15;

  v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  v11[2] = a4;
  *v11 = a2;
  v12 = sub_23A70D5E8();
  v11[5] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v11[6] = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v11[7] = malloc(v14);
  v15 = malloc(v14);
  v11[8] = v15;
  SceneSettings.subscript.getter(a3, (uint64_t)v15);
  return sub_23A705C1C;
}

void sub_23A705C1C(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(void *, uint64_t);

  v2 = *a1;
  v3 = (void *)(*a1)[7];
  v4 = (void *)(*a1)[8];
  v5 = (*a1)[5];
  v6 = (*a1)[6];
  v7 = (*a1)[3];
  v9 = (uint64_t *)(*a1)[1];
  v8 = (*a1)[2];
  v10 = **a1;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[7], v4, v5);
    swift_retain();
    sub_23A708D54((uint64_t)v3, v10, v9, v8, v7);
    v11 = *(void (**)(void *, uint64_t))(v6 + 8);
    v11(v3, v5);
  }
  else
  {
    swift_retain();
    sub_23A708D54((uint64_t)v4, v10, v9, v8, v7);
    v11 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v11(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_23A705CFC(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;

  v2 = *a1;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v5 = *v1;
  *v1 = 0x8000000000000000;
  sub_23A7085FC(v2, (uint64_t)sub_23A708908, 0, isUniquelyReferenced_nonNull_native, &v5);
  *v1 = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A705D74@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  sub_23A704FDC(MEMORY[0x24BEE4AF8]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t static SceneSettings.== infix(_:_:)(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];

  v4 = *a1;
  v5 = *a2;
  sub_23A70D510();
  v7[2] = a3;
  v7[3] = v4;
  v7[4] = v5;
  return sub_23A7049A8((void (*)(_QWORD *__return_ptr))sub_23A708DF8, (uint64_t)v7, (char)"DrawingBoard/SceneSettings.swift") & 1;
}

uint64_t sub_23A705E1C(uint64_t result, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  char v16;
  uint64_t (*v17)(uint64_t *);
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v22;
  int64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v2 = 0;
  v18 = result + 64;
  v3 = 1 << *(_BYTE *)(result + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(result + 64);
  v19 = (unint64_t)(v3 + 63) >> 6;
  v20 = result;
  while (1)
  {
    if (v5)
    {
      v22 = (v5 - 1) & v5;
      v23 = v2;
      v6 = __clz(__rbit64(v5)) | (v2 << 6);
      goto LABEL_22;
    }
    v7 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v7 >= v19)
      return 1;
    v8 = *(_QWORD *)(v18 + 8 * v7);
    v9 = v2 + 1;
    if (!v8)
    {
      v9 = v7 + 1;
      if (v7 + 1 >= v19)
        return 1;
      v8 = *(_QWORD *)(v18 + 8 * v9);
      if (!v8)
      {
        v9 = v7 + 2;
        if (v7 + 2 >= v19)
          return 1;
        v8 = *(_QWORD *)(v18 + 8 * v9);
        if (!v8)
          break;
      }
    }
LABEL_21:
    v22 = (v8 - 1) & v8;
    v23 = v9;
    v6 = __clz(__rbit64(v8)) + (v9 << 6);
LABEL_22:
    v11 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8 * v6);
    v12 = *(_QWORD *)(result + 56) + 96 * v6;
    v13 = *(_QWORD *)(v12 + 88);
    v26 = *(_QWORD *)v12;
    v24 = *(_OWORD *)(v12 + 24);
    v27 = *(_OWORD *)(v12 + 8);
    v28 = v24;
    v25 = *(_OWORD *)(v12 + 56);
    v29 = *(_OWORD *)(v12 + 40);
    v30 = v25;
    v31 = *(_OWORD *)(v12 + 72);
    v32 = v13;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v14 = sub_23A706798(v11);
    v16 = v15;
    swift_release();
    if ((v16 & 1) == 0)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      return 0;
    }
    v17 = *(uint64_t (**)(uint64_t *))(*(_QWORD *)(a2 + 56) + 96 * v14 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    LOBYTE(v17) = v17(&v26);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    result = v20;
    v5 = v22;
    v2 = v23;
    if ((v17 & 1) == 0)
      return 0;
  }
  v10 = v7 + 3;
  if (v10 >= v19)
    return 1;
  v8 = *(_QWORD *)(v18 + 8 * v10);
  if (v8)
  {
    v9 = v10;
    goto LABEL_21;
  }
  while (1)
  {
    v9 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v9 >= v19)
      return 1;
    v8 = *(_QWORD *)(v18 + 8 * v9);
    ++v10;
    if (v8)
      goto LABEL_21;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A70617C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return static SceneSettings.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16));
}

uint64_t SceneSettings.description.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD v5[6];

  v3 = *v1;
  sub_23A70D510();
  v5[2] = *(_QWORD *)(a1 + 16);
  v5[3] = v3;
  return sub_23A704B38((void (*)(_QWORD *__return_ptr))sub_23A708E2C, (uint64_t)v5);
}

uint64_t sub_23A7061F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  sub_23A70D63C();
  swift_bridgeObjectRetain();
  v2 = sub_23A70D3FC();
  v4 = v3;
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_23A70626C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_23A709080();
  result = sub_23A70D1EC();
  *a1 = v3;
  return result;
}

uint64_t sub_23A7062B8()
{
  sub_23A709080();
  swift_bridgeObjectRetain();
  return sub_23A70D1F8();
}

uint64_t sub_23A706314(uint64_t *a1, void (*a2)(uint64_t *))
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  sub_23A708E44();
  swift_bridgeObjectRetain();
  sub_23A704FDC(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  v6 = v3;
  a2(&v6);
  v5 = v6;
  sub_23A705CFC(&v5);
  return swift_bridgeObjectRelease();
}

uint64_t View.sceneSettings<A>(_:_:)()
{
  swift_getKeyPath();
  sub_23A708E44();
  swift_bridgeObjectRetain();
  sub_23A704FDC(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  sub_23A70D30C();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t View.sceneSettings<A>(_:_:)(uint64_t a1, void (*a2)(unint64_t *))
{
  uint64_t v3;
  unint64_t v5;

  v3 = MEMORY[0x24BEE4AF8];
  v5 = sub_23A704FDC(MEMORY[0x24BEE4AF8]);
  a2(&v5);
  swift_getKeyPath();
  sub_23A708E44();
  sub_23A704FDC(v3);
  swift_bridgeObjectRelease();
  sub_23A70D30C();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23A7064F0@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23A706798(a1);
  LOBYTE(a1) = v7;
  result = swift_bridgeObjectRelease();
  v9 = 0uLL;
  v10 = 0uLL;
  v11 = 0uLL;
  v12 = 0uLL;
  v13 = 0uLL;
  v14 = 0uLL;
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v3;
    v24 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23A707BB8();
      v16 = v24;
    }
    swift_release();
    v17 = (__int128 *)(*(_QWORD *)(v16 + 56) + 96 * v6);
    v22 = v17[1];
    v23 = *v17;
    v20 = v17[3];
    v21 = v17[2];
    v18 = v17[5];
    v19 = v17[4];
    sub_23A7072F8(v6, v16);
    *v3 = v16;
    result = swift_bridgeObjectRelease();
    v14 = v18;
    v13 = v19;
    v12 = v20;
    v11 = v21;
    v10 = v22;
    v9 = v23;
  }
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  a2[3] = v12;
  a2[4] = v13;
  a2[5] = v14;
  return result;
}

uint64_t *sub_23A706608(uint64_t *a1)
{
  sub_23A706658(*a1);
  return a1;
}

uint64_t sub_23A706658(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A7066C8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_23A706834(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23A707DF0();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = type metadata accessor for PresentationViewModel.Identity(0);
  sub_23A6E1460(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_23A7074C8(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_23A706798(uint64_t a1)
{
  uint64_t v2;

  sub_23A70D63C();
  v2 = sub_23A70D408();
  return sub_23A707924(a1, v2);
}

unint64_t sub_23A706804(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A70D864();
  return sub_23A7079EC(a1, v2);
}

unint64_t sub_23A706834(uint64_t a1)
{
  uint64_t v2;

  sub_23A70D870();
  sub_23A70CFF4();
  sub_23A708F7C();
  sub_23A70D414();
  type metadata accessor for PresentationViewModel.Identity(0);
  swift_bridgeObjectRetain();
  sub_23A70D45C();
  swift_bridgeObjectRelease();
  v2 = sub_23A70D894();
  return sub_23A707A88(a1, v2);
}

uint64_t sub_23A7068D8(uint64_t a1, char a2)
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
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0CF0);
  v35 = a2;
  v6 = sub_23A70D774();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v34[v21];
        ++v13;
        if (!v22)
        {
          v13 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v34[v13];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v35 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v34[v23];
            if (!v22)
            {
              while (1)
              {
                v13 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_40;
                if (v13 >= v33)
                  goto LABEL_33;
                v22 = v34[v13];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v13 = v23;
          }
        }
LABEL_30:
        v10 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v20);
      v29 = *(_QWORD *)(v5 + 56) + 96 * v20;
      v30 = *(_QWORD *)v29;
      v39 = *(_OWORD *)(v29 + 24);
      v40 = *(_OWORD *)(v29 + 8);
      v37 = *(_OWORD *)(v29 + 56);
      v38 = *(_OWORD *)(v29 + 40);
      v36 = *(_OWORD *)(v29 + 72);
      v31 = *(_QWORD *)(v29 + 88);
      if ((v35 & 1) == 0)
      {
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
      }
      sub_23A70D63C();
      result = sub_23A70D408();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v17) = v28;
      v18 = *(_QWORD *)(v7 + 56) + 96 * v17;
      *(_QWORD *)v18 = v30;
      *(_OWORD *)(v18 + 8) = v40;
      *(_OWORD *)(v18 + 24) = v39;
      *(_OWORD *)(v18 + 40) = v38;
      *(_OWORD *)(v18 + 56) = v37;
      *(_OWORD *)(v18 + 72) = v36;
      *(_QWORD *)(v18 + 88) = v31;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23A706C74(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;

  v3 = v2;
  v5 = type metadata accessor for PresentationViewModel.Identity(0);
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0CE8);
  v42 = a2;
  v9 = sub_23A70D774();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v39 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v37 = v2;
  v38 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_22;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v38)
      break;
    v22 = v39;
    v23 = v39[v21];
    ++v17;
    if (!v23)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v38)
        goto LABEL_34;
      v23 = v39[v17];
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v38)
        {
LABEL_34:
          swift_release();
          v3 = v37;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = v39[v24];
        if (!v23)
        {
          while (1)
          {
            v17 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v17 >= v38)
              goto LABEL_34;
            v23 = v39[v17];
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v17 = v24;
      }
    }
LABEL_21:
    v14 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v40 + 72);
    v26 = *(_QWORD *)(v8 + 48) + v25 * v20;
    if ((v42 & 1) != 0)
    {
      sub_23A708FC4(v26, (uint64_t)v7);
      v27 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v20);
    }
    else
    {
      sub_23A6E13DC(v26, (uint64_t)v7);
      v27 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v20);
      swift_retain();
    }
    sub_23A70D870();
    sub_23A70CFF4();
    sub_23A708F7C();
    sub_23A70D414();
    swift_bridgeObjectRetain();
    sub_23A70D45C();
    swift_bridgeObjectRelease();
    result = sub_23A70D894();
    v28 = -1 << *(_BYTE *)(v10 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v15 + 8 * (v29 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v15 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v15 + 8 * v30);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = sub_23A708FC4((uint64_t)v7, *(_QWORD *)(v10 + 48) + v25 * v18);
    *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v18) = v27;
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v37;
  v22 = v39;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v8 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_23A707024(uint64_t a1, char a2)
{
  return sub_23A70703C(a1, a2, &qword_2569B0D00);
}

uint64_t sub_23A707030(uint64_t a1, char a2)
{
  return sub_23A70703C(a1, a2, &qword_2569B0CF8);
}

uint64_t sub_23A70703C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  __int128 v32;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  result = sub_23A70D774();
  v8 = result;
  if (*(_QWORD *)(v6 + 16))
  {
    v31 = v4;
    v9 = 0;
    v10 = (_QWORD *)(v6 + 64);
    v11 = 1 << *(_BYTE *)(v6 + 32);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v6 + 64);
    v14 = (unint64_t)(v11 + 63) >> 6;
    v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v21 = v20 | (v9 << 6);
      }
      else
      {
        v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v22 >= v14)
          goto LABEL_33;
        v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          v9 = v22 + 1;
          if (v22 + 1 >= v14)
            goto LABEL_33;
          v23 = v10[v9];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v14)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v4 = v31;
                goto LABEL_40;
              }
              v30 = 1 << *(_BYTE *)(v6 + 32);
              if (v30 >= 64)
                bzero((void *)(v6 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v10 = -1 << v30;
              v4 = v31;
              *(_QWORD *)(v6 + 16) = 0;
              break;
            }
            v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                v9 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v9 >= v14)
                  goto LABEL_33;
                v23 = v10[v9];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v9 = v24;
          }
        }
LABEL_30:
        v13 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      v29 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v21);
      v32 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + 16 * v21);
      if ((a2 & 1) == 0)
        swift_unknownObjectRetain();
      result = sub_23A70D864();
      v16 = -1 << *(_BYTE *)(v8 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v15 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v15 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v18 == v26;
          if (v18 == v26)
            v18 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v15 + 8 * v18);
        }
        while (v28 == -1);
        v19 = __clz(__rbit64(~v28)) + (v18 << 6);
      }
      *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v19) = v29;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + 16 * v19) = v32;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v4 = v8;
  return result;
}

unint64_t sub_23A7072F8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  const void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A70D648();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      sub_23A70D63C();
      do
      {
        result = sub_23A70D408();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 >= v8 && v3 >= (uint64_t)v9)
          {
LABEL_16:
            v12 = *(_QWORD *)(a2 + 48);
            v13 = (_QWORD *)(v12 + 8 * v3);
            v14 = (_QWORD *)(v12 + 8 * v6);
            if (v3 != v6 || v13 >= v14 + 1)
              *v13 = *v14;
            v15 = *(_QWORD *)(a2 + 56);
            result = v15 + 96 * v3;
            v16 = (const void *)(v15 + 96 * v6);
            if (v3 != v6 || (v3 = v6, result >= (unint64_t)v16 + 96))
            {
              result = (unint64_t)memmove((void *)result, v16, 0x60uLL);
              v3 = v6;
            }
          }
        }
        else if (v9 >= v8 || v3 >= (uint64_t)v9)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23A7074C8(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v31 = type metadata accessor for PresentationViewModel.Identity(0);
  v4 = *(_QWORD *)(v31 - 8);
  result = MEMORY[0x24BDAC7A8](v31);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_23A70D648();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v30 = (result + 1) & v11;
      v12 = *(_QWORD *)(v4 + 72);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        sub_23A6E13DC(*(_QWORD *)(a2 + 48) + v12 * v10, (uint64_t)v7);
        sub_23A70D870();
        sub_23A70CFF4();
        sub_23A708F7C();
        sub_23A70D414();
        swift_bridgeObjectRetain();
        sub_23A70D45C();
        swift_bridgeObjectRelease();
        v17 = sub_23A70D894();
        result = sub_23A6E1460((uint64_t)v7);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v30)
        {
          if (v18 < v30)
          {
            v12 = v14;
          }
          else
          {
            v12 = v14;
            if (a1 >= (uint64_t)v18)
              goto LABEL_12;
          }
        }
        else
        {
          v12 = v14;
          if (v18 >= v30 || a1 >= (uint64_t)v18)
          {
LABEL_12:
            v19 = *(_QWORD *)(a2 + 48);
            result = v19 + v12 * a1;
            if (v12 * a1 < v15 || result >= v19 + v15 + v12)
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_17:
              v13 = v16;
            }
            else if (v12 * a1 != v15)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_17;
            }
            v20 = *(_QWORD *)(a2 + 56);
            v21 = (_QWORD *)(v20 + 8 * a1);
            v22 = (_QWORD *)(v20 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v21 >= v22 + 1))
            {
              *v21 = *v22;
              a1 = v10;
            }
          }
        }
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v23 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v24 = *v23;
    v25 = (-1 << a1) - 1;
  }
  else
  {
    v23 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v25 = *v23;
    v24 = (-1 << a1) - 1;
  }
  *v23 = v25 & v24;
  v26 = *(_QWORD *)(a2 + 16);
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23A707790(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A70D648();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_23A70D864();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_QWORD *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_OWORD *)(v15 + 16 * v3);
            v17 = (_OWORD *)(v15 + 16 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23A707924(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    sub_23A70D63C();
    do
    {
      if ((sub_23A70D42C() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_23A7079EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_23A707A88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = type metadata accessor for PresentationViewModel.Identity(0);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v2 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      sub_23A6E13DC(*(_QWORD *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      if ((sub_23A70CFDC() & 1) != 0)
      {
        v13 = *(int *)(v5 + 20);
        v14 = *(_QWORD *)&v8[v13];
        v15 = *(_QWORD *)&v8[v13 + 8];
        v16 = (_QWORD *)(a1 + v13);
        v17 = v14 == *v16 && v15 == v16[1];
        if (v17 || (sub_23A70D7EC() & 1) != 0)
          break;
      }
      sub_23A6E1460((uint64_t)v8);
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        return v10;
    }
    sub_23A6E1460((uint64_t)v8);
  }
  return v10;
}

void *sub_23A707BB8()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  __int128 v29;
  __int128 v30;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0CF0);
  v2 = *v0;
  v3 = sub_23A70D768();
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
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 96 * v15;
    v19 = *(_QWORD *)(v2 + 56) + v18;
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(v19 + 88);
    v22 = *(_OWORD *)(v19 + 8);
    v29 = *(_OWORD *)(v19 + 24);
    v23 = *(_OWORD *)(v19 + 40);
    v30 = *(_OWORD *)(v19 + 56);
    v24 = *(_OWORD *)(v19 + 72);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v25 = *(_QWORD *)(v4 + 56) + v18;
    *(_QWORD *)v25 = v20;
    *(_OWORD *)(v25 + 8) = v22;
    *(_OWORD *)(v25 + 24) = v29;
    *(_OWORD *)(v25 + 40) = v23;
    *(_OWORD *)(v25 + 56) = v30;
    *(_OWORD *)(v25 + 72) = v24;
    *(_QWORD *)(v25 + 88) = v21;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    result = (void *)swift_retain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23A707DF0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  uint64_t v9;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for PresentationViewModel.Identity(0);
  v26 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0CE8);
  v5 = *v0;
  v6 = sub_23A70D768();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v25 = v1;
  result = (void *)(v6 + 64);
  v9 = v5 + 64;
  v10 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  v12 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v13 = 1 << *(_BYTE *)(v5 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v5 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v9 + 8 * v22);
    ++v12;
    if (!v23)
    {
      v12 = v22 + 1;
      if (v22 + 1 >= v16)
        goto LABEL_26;
      v23 = *(_QWORD *)(v9 + 8 * v12);
      if (!v23)
        break;
    }
LABEL_25:
    v15 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v26 + 72) * v18;
    sub_23A6E13DC(*(_QWORD *)(v5 + 48) + v19, (uint64_t)v4);
    v20 = 8 * v18;
    v21 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v18);
    sub_23A708FC4((uint64_t)v4, *(_QWORD *)(v7 + 48) + v19);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v20) = v21;
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v9 + 8 * v24);
  if (v23)
  {
    v12 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v9 + 8 * v12);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23A708010()
{
  return sub_23A708028(&qword_2569B0D00);
}

void *sub_23A70801C()
{
  return sub_23A708028(&qword_2569B0CF8);
}

void *sub_23A708028(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_23A70D768();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14)
      goto LABEL_26;
    v22 = *(_QWORD *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      v10 = v21 + 1;
      if (v21 + 1 >= v14)
        goto LABEL_26;
      v22 = *(_QWORD *)(v7 + 8 * v10);
      if (!v22)
        break;
    }
LABEL_25:
    v13 = (v22 - 1) & v22;
    v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
    v19 = 16 * v16;
    v20 = *(_OWORD *)(*(_QWORD *)(v3 + 56) + v19);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    *(_OWORD *)(*(_QWORD *)(v5 + 56) + v19) = v20;
    result = (void *)swift_unknownObjectRetain();
  }
  v23 = v21 + 2;
  if (v23 >= v14)
    goto LABEL_26;
  v22 = *(_QWORD *)(v7 + 8 * v23);
  if (v22)
  {
    v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v22 = *(_QWORD *)(v7 + 8 * v10);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23A7081C8(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  uint64_t result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  char v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v4 = v3;
  v8 = *v3;
  v10 = sub_23A706798(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_23A707BB8();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = (_OWORD *)(v16[7] + 96 * v10);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      result = swift_release();
      v19 = a1[3];
      v17[2] = a1[2];
      v17[3] = v19;
      v20 = a1[5];
      v17[4] = a1[4];
      v17[5] = v20;
      v21 = a1[1];
      *v17 = *a1;
      v17[1] = v21;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_QWORD *)(v16[6] + 8 * v10) = a2;
    v24 = (_OWORD *)(v16[7] + 96 * v10);
    v25 = a1[1];
    *v24 = *a1;
    v24[1] = v25;
    v26 = a1[5];
    v24[4] = a1[4];
    v24[5] = v26;
    v27 = a1[3];
    v24[2] = a1[2];
    v24[3] = v27;
    v28 = v16[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (!v29)
    {
      v16[2] = v30;
      return swift_retain();
    }
    goto LABEL_14;
  }
  sub_23A7068D8(v13, a3 & 1);
  v22 = sub_23A706798(a2);
  if ((v14 & 1) == (v23 & 1))
  {
    v10 = v22;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_23A70D63C();
  result = sub_23A70D804();
  __break(1u);
  return result;
}

uint64_t sub_23A708384@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_23A709080();
  result = sub_23A70D1EC();
  *a1 = v3;
  return result;
}

uint64_t sub_23A7083D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A7083F8(uint64_t *a1)
{
  uint64_t v1;

  return sub_23A706314(a1, *(void (**)(uint64_t *))(v1 + 40));
}

_OWORD *sub_23A708408(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23A708418(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for PresentationViewModel.Identity(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  v13 = sub_23A706834(a2);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  v17 = v12;
  v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    v19 = *v4;
    if ((v17 & 1) != 0)
    {
LABEL_8:
      v20 = v19[7];
      result = swift_release();
      *(_QWORD *)(v20 + 8 * v13) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_23A707DF0();
    goto LABEL_7;
  }
  sub_23A706C74(v16, a3 & 1);
  v22 = sub_23A706834(a2);
  if ((v17 & 1) != (v23 & 1))
  {
LABEL_14:
    result = sub_23A70D804();
    __break(1u);
    return result;
  }
  v13 = v22;
  v19 = *v4;
  if ((v17 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  sub_23A6E13DC(a2, (uint64_t)v10);
  return sub_23A70856C(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_23A70856C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for PresentationViewModel.Identity(0);
  result = sub_23A708FC4(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_23A7085FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40[20];
  _BYTE v41[104];
  _QWORD v42[14];
  _QWORD *v43;

  v43 = a5;
  v6 = -1 << *(_BYTE *)(a1 + 32);
  v7 = ~v6;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = -v6;
  v40[13] = a1;
  v40[14] = a1 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v40[15] = v7;
  v40[16] = 0;
  v40[17] = v10 & v8;
  v40[18] = a2;
  v40[19] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23A7089A4((uint64_t)v41);
  sub_23A709038((uint64_t)v41, (uint64_t)v40);
  sub_23A709038((uint64_t)v41, (uint64_t)v42);
  if (v42[0])
  {
    while (1)
    {
      v14 = v40[0];
      v13 = v40[1];
      v15 = v40[2];
      v16 = v40[3];
      v17 = v40[4];
      v32 = v40[5];
      v33 = v40[6];
      v34 = v40[7];
      v35 = v40[8];
      v36 = v40[9];
      v37 = v40[10];
      v38 = v40[11];
      v39 = v40[12];
      v18 = (_QWORD *)*v43;
      v20 = sub_23A706798(v40[0]);
      v21 = v18[2];
      v22 = (v19 & 1) == 0;
      v23 = v21 + v22;
      if (__OFADD__(v21, v22))
        break;
      v24 = v19;
      if (v18[3] >= v23)
      {
        if ((a4 & 1) == 0)
          sub_23A707BB8();
      }
      else
      {
        sub_23A7068D8(v23, a4 & 1);
        v25 = sub_23A706798(v14);
        if ((v24 & 1) != (v26 & 1))
          goto LABEL_19;
        v20 = v25;
      }
      v27 = (_QWORD *)*v43;
      if ((v24 & 1) != 0)
      {
        swift_release();
        v12 = (uint64_t *)(v27[7] + 96 * v20);
        *v12 = v13;
        v12[1] = v15;
        v12[2] = v16;
        v12[3] = v17;
        v12[4] = v32;
        v12[5] = v33;
        v12[6] = v34;
        v12[7] = v35;
        v12[8] = v36;
        v12[9] = v37;
        v12[10] = v38;
        v12[11] = v39;
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        v27[(v20 >> 6) + 8] |= 1 << v20;
        *(_QWORD *)(v27[6] + 8 * v20) = v14;
        v28 = (uint64_t *)(v27[7] + 96 * v20);
        *v28 = v13;
        v28[1] = v15;
        v28[2] = v16;
        v28[3] = v17;
        v28[4] = v32;
        v28[5] = v33;
        v28[6] = v34;
        v28[7] = v35;
        v28[8] = v36;
        v28[9] = v37;
        v28[10] = v38;
        v28[11] = v39;
        v29 = v27[2];
        v30 = __OFADD__(v29, 1);
        v31 = v29 + 1;
        if (v30)
          goto LABEL_18;
        v27[2] = v31;
      }
      sub_23A7089A4((uint64_t)v41);
      sub_23A709038((uint64_t)v41, (uint64_t)v40);
      sub_23A709038((uint64_t)v41, (uint64_t)v42);
      a4 = 1;
      if (!v42[0])
        goto LABEL_5;
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    sub_23A70D63C();
    result = sub_23A70D804();
    __break(1u);
  }
  else
  {
LABEL_5:
    swift_release();
    swift_bridgeObjectRelease();
    sub_23A6EBED4();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A708908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v4;
  v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v5;
  *(_QWORD *)(a2 + 96) = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_23A7089A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  int64_t v29;
  void (*v30)(_OWORD *__return_ptr, _QWORD *);
  _OWORD v31[6];
  uint64_t v32;
  _QWORD v33[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v3 = *v1;
  v5 = v1[3];
  v4 = v1[4];
  v6 = v5;
  if (v4)
  {
    v7 = (v4 - 1) & v4;
    v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
    v9 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v8);
    v10 = *(_QWORD *)(v3 + 56) + 96 * v8;
    v11 = *(_QWORD *)v10;
    v12 = *(_QWORD *)(v10 + 88);
    v30 = (void (*)(_OWORD *__return_ptr, _QWORD *))v1[5];
    v33[0] = v9;
    v33[1] = v11;
    v34 = *(_OWORD *)(v10 + 8);
    v13 = *(_OWORD *)(v10 + 40);
    v35 = *(_OWORD *)(v10 + 24);
    v36 = v13;
    v14 = *(_OWORD *)(v10 + 56);
    v15 = *(_OWORD *)(v10 + 72);
    v1[3] = v6;
    v1[4] = v7;
    v37 = v14;
    v38 = v15;
    v39 = v12;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v30(v31, v33);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    result = swift_release();
    v17 = v31[0];
    v18 = v31[1];
    v19 = v31[2];
    v20 = v31[3];
    v21 = v31[4];
    v22 = v31[5];
    v23 = v32;
LABEL_23:
    *(_OWORD *)a1 = v17;
    *(_OWORD *)(a1 + 16) = v18;
    *(_OWORD *)(a1 + 32) = v19;
    *(_OWORD *)(a1 + 48) = v20;
    *(_OWORD *)(a1 + 64) = v21;
    *(_OWORD *)(a1 + 80) = v22;
    *(_QWORD *)(a1 + 96) = v23;
    return result;
  }
  v24 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    v25 = (unint64_t)(v1[2] + 64) >> 6;
    if (v24 < v25)
    {
      v26 = v1[1];
      v27 = *(_QWORD *)(v26 + 8 * v24);
      if (v27)
      {
LABEL_7:
        v7 = (v27 - 1) & v27;
        v8 = __clz(__rbit64(v27)) + (v24 << 6);
        v6 = v24;
        goto LABEL_3;
      }
      v28 = v5 + 2;
      v6 = v5 + 1;
      if (v5 + 2 < v25)
      {
        v27 = *(_QWORD *)(v26 + 8 * v28);
        if (v27)
        {
LABEL_10:
          v24 = v28;
          goto LABEL_7;
        }
        v6 = v5 + 2;
        if (v5 + 3 < v25)
        {
          v27 = *(_QWORD *)(v26 + 8 * (v5 + 3));
          if (v27)
          {
            v24 = v5 + 3;
            goto LABEL_7;
          }
          v28 = v5 + 4;
          v6 = v5 + 3;
          if (v5 + 4 < v25)
          {
            v27 = *(_QWORD *)(v26 + 8 * v28);
            if (v27)
              goto LABEL_10;
            v24 = v5 + 5;
            v6 = v5 + 4;
            if (v5 + 5 < v25)
            {
              v27 = *(_QWORD *)(v26 + 8 * v24);
              if (v27)
                goto LABEL_7;
              v6 = v25 - 1;
              v29 = v5 + 6;
              while (v25 != v29)
              {
                v27 = *(_QWORD *)(v26 + 8 * v29++);
                if (v27)
                {
                  v24 = v29 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v23 = 0;
    v1[3] = v6;
    v1[4] = 0;
    v17 = 0uLL;
    v18 = 0uLL;
    v19 = 0uLL;
    v20 = 0uLL;
    v21 = 0uLL;
    v22 = 0uLL;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

unint64_t sub_23A708C34(uint64_t a1)
{
  return sub_23A708C4C(a1, &qword_2569B0D00);
}

unint64_t sub_23A708C40(uint64_t a1)
{
  return sub_23A708C4C(a1, &qword_2569B0CF8);
}

unint64_t sub_23A708C4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  unint64_t result;
  __int128 v7;
  char v8;
  _OWORD *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  _OWORD *v13;
  char v14;
  __int128 v15;
  __int128 v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v4 = (_QWORD *)sub_23A70D780();
  v5 = *(_QWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 40);
  result = sub_23A706804(v5);
  v7 = v15;
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_unknownObjectRetain();
    return (unint64_t)v4;
  }
  v9 = (_OWORD *)(a1 + 64);
  while (1)
  {
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v5;
    *(_OWORD *)(v4[7] + 16 * result) = v7;
    v10 = v4[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v4[2] = v12;
    if (!--v2)
      goto LABEL_8;
    v13 = (_OWORD *)((char *)v9 + 24);
    v5 = *((_QWORD *)v9 - 1);
    v16 = *v9;
    swift_unknownObjectRetain();
    result = sub_23A706804(v5);
    v9 = v13;
    v7 = v16;
    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A708D54(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v8 = sub_23A70D5E8();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v14 - v9, a1);
  return sub_23A7058C4(v10, a3, v12, a5);
}

uint64_t sub_23A708DF8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = sub_23A705E1C(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
  *a1 = result & 1;
  return result;
}

uint64_t sub_23A708E2C@<X0>(uint64_t *a1@<X8>)
{
  return sub_23A7061F0(a1);
}

unint64_t sub_23A708E44()
{
  unint64_t result;

  result = qword_2569AFE28;
  if (!qword_2569AFE28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569AFE28);
  }
  return result;
}

uint64_t sub_23A708E88()
{
  return 24;
}

__n128 sub_23A708E94(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_23A708EA8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for SceneSettings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SceneSettings);
}

uint64_t sub_23A708EBC(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzSo23FBSMutableSceneSettingsCRbd__r__lAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVy12DrawingBoard0eF0VyADGGGAaBHPxAaBHD1__AmA0cL0HPyHCHCTm(a1, &qword_2569AF6A0, (unint64_t *)&qword_2569AF6A8, MEMORY[0x24BDF1248]);
}

uint64_t sub_23A708ED8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzSo23FBSMutableSceneSettingsCRbd__r__lAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVy12DrawingBoard0eF0VyADGGGAaBHPxAaBHD1__AmA0cL0HPyHCHCTm(a1, &qword_2569B0CD8, &qword_2569B0CE0, MEMORY[0x24BDF1028]);
}

uint64_t get_witness_table_7SwiftUI4ViewRzSo23FBSMutableSceneSettingsCRbd__r__lAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVy12DrawingBoard0eF0VyADGGGAaBHPxAaBHD1__AmA0cL0HPyHCHCTm(uint64_t a1, uint64_t *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v7 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
  v8 = sub_23A70D198();
  v10[0] = v7;
  v10[1] = sub_23A6F8288(a3, a2, a4);
  return MEMORY[0x23B855268](MEMORY[0x24BDED308], v8, v10);
}

unint64_t sub_23A708F7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0920;
  if (!qword_2569B0920)
  {
    v1 = sub_23A70CFF4();
    result = MEMORY[0x23B855268](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_2569B0920);
  }
  return result;
}

uint64_t sub_23A708FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PresentationViewModel.Identity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A709008()
{
  return swift_deallocObject();
}

uint64_t sub_23A709018()
{
  return swift_deallocObject();
}

uint64_t sub_23A709028()
{
  return swift_deallocObject();
}

uint64_t sub_23A709038(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0D08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A709080()
{
  unint64_t result;

  result = qword_2569B0D10;
  if (!qword_2569B0D10)
  {
    result = MEMORY[0x23B855268](&unk_23A711814, &_s19__Key_sceneSettingsVN);
    atomic_store(result, (unint64_t *)&qword_2569B0D10);
  }
  return result;
}

uint64_t sub_23A7090C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0D18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *_s19__Key_sceneSettingsVMa()
{
  return &_s19__Key_sceneSettingsVN;
}

uint64_t View.onSceneActivationPolicyError(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DB78, (uint64_t)sub_23A709E40, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A70967C);
}

void sub_23A709138()
{
  __asm { BR              X10 }
}

uint64_t sub_23A709188()
{
  char v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  char v10;

  v10 = v0;
  v7 = v1;
  sub_23A70D6D8();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v8 = objc_msgSend(v7, sel_description);
    sub_23A70D444();

  }
  sub_23A70D468();
  swift_bridgeObjectRelease();
  sub_23A6EBFD8(v1, v6, v5, v4, v3, v10, v2);
  return 0x636165446C6C6977;
}

uint64_t sub_23A709580()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  sub_23A70D468();
  sub_23A709138();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t (*sub_23A709620())(uint64_t)
{
  __int128 v1;

  sub_23A6F8BC8();
  sub_23A70D1EC();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_23A70A5B0;
}

uint64_t sub_23A70967C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getKeyPath();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_23A70D330();
  swift_release();
  return swift_release();
}

uint64_t sub_23A709720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a1;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a2;
  v7[3] = a3;
  v7[4] = sub_23A6DEC28;
  v7[5] = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23A70A22C;
  *(_QWORD *)(v8 + 24) = v7;
  *(_QWORD *)a1 = sub_23A6DEC58;
  *(_QWORD *)(a1 + 8) = v8;
  return swift_retain();
}

uint64_t sub_23A7097CC(uint64_t *a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t (*a4)(uint64_t *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
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

  v5 = a1[1];
  v6 = a1[2];
  v7 = a1[3];
  v8 = a1[4];
  v9 = a1[5];
  v11 = a1[6];
  v10 = a1[7];
  v12 = a1[8];
  v15 = a1[10];
  v16 = a1[9];
  v14 = a1[11];
  v18 = *a1;
  v4 = v18;
  v19 = v5;
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v23 = v9;
  v24 = v11;
  v25 = v10;
  v26 = v12;
  v27 = v16;
  v28 = v15;
  v29 = v14;
  a2(&v18);
  v18 = v4;
  v19 = v5;
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v23 = v9;
  v24 = v11;
  v25 = v10;
  v26 = v12;
  v27 = v16;
  v28 = v15;
  v29 = v14;
  return a4(&v18);
}

uint64_t View.onSceneWillActivate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DBA0, (uint64_t)sub_23A709E48, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A70967C);
}

uint64_t sub_23A7098A0(uint64_t result, uint64_t (*a2)(_QWORD))
{
  unint64_t v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x8_t v5;

  v2 = *(_QWORD *)(result + 72);
  if (v2 >> 61 == 5)
  {
    v3 = vorrq_s8(vorrq_s8(*(int8x16_t *)(result + 80), *(int8x16_t *)(result + 40)), vorrq_s8(*(int8x16_t *)(result + 56), *(int8x16_t *)(result + 24)));
    v4 = vextq_s8(v3, v3, 8uLL);
    v5 = vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
    if (v2 == 0xA000000000000000 && *(_QWORD *)&v5 == 0)
      return a2(*(_QWORD *)result);
  }
  return result;
}

uint64_t View.onSceneDidActivate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DBC8, (uint64_t)sub_23A709E50, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A70967C);
}

uint64_t sub_23A70992C(uint64_t result, uint64_t (*a2)(_QWORD))
{
  unint64_t v2;
  int8x16_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 72);
  if (v2 >> 61 == 5)
  {
    v3 = vorrq_s8(*(int8x16_t *)(result + 40), *(int8x16_t *)(result + 56));
    v4 = *(_QWORD *)&vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) | *(_QWORD *)(result + 32);
    if (*(_OWORD *)(result + 80) == 0 && v2 == 0xA000000000000000 && *(_QWORD *)(result + 24) == 1 && v4 == 0)
      return a2(*(_QWORD *)result);
  }
  return result;
}

uint64_t View.onSceneWillDeactivate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DBF0, (uint64_t)sub_23A709E58, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))View.onSceneDeactivate(_:));
}

void sub_23A7099BC(uint64_t a1, id a2, void (*a3)(uint64_t, id))
{
  id v5;

  if (a2)
    v5 = objc_msgSend(a2, sel_error);
  else
    v5 = 0;
  a3(a1, v5);

}

uint64_t View.onSceneDeactivate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DC18, (uint64_t)sub_23A709E60, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A70967C);
}

void sub_23A709A40(uint64_t *a1, void (*a2)(uint64_t, void *))
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v2 = a1[9];
  if (!(v2 >> 61))
  {
    v4 = a1[7];
    v11 = a1[8];
    v6 = a1[5];
    v5 = a1[6];
    v8 = (void *)a1[3];
    v7 = a1[4];
    v9 = *a1;
    v10 = v8;
    a2(v9, v8);
    sub_23A6EBFD8(v8, v7, v6, v5, v4, v11, v2);
  }
}

uint64_t View.onSceneInvalidate(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DC40, (uint64_t)sub_23A6DEC58, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))View.onSceneInvalidated(_:));
}

uint64_t View.onSceneInvalidated(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DC68, (uint64_t)sub_23A709E68, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A70967C);
}

void sub_23A709B18(uint64_t *a1, void (*a2)(uint64_t, void *))
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v2 = a1[9];
  if (v2 >> 61 == 1)
  {
    v4 = a1[7];
    v11 = a1[8];
    v6 = a1[5];
    v5 = a1[6];
    v8 = (void *)a1[3];
    v7 = a1[4];
    v9 = *a1;
    v10 = v8;
    a2(v9, v8);
    sub_23A6EBFD8(v8, v7, v6, v5, v4, v11, v2);
  }
}

uint64_t View.onSceneClientConnect(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DC90, (uint64_t)sub_23A709E70, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A70967C);
}

void sub_23A709BD8(_QWORD *a1, void (*a2)(_QWORD, void *))
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = a1[9];
  if (v2 >> 61 == 2)
  {
    v3 = a1[7];
    v8 = a1[8];
    v5 = a1[5];
    v4 = a1[6];
    v7 = (void *)a1[3];
    v6 = a1[4];
    a2(*a1, v7);
    sub_23A6EBFD8(v7, v6, v5, v4, v3, v8, v2);
  }
}

uint64_t View.onSceneContentState(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A709C98(a1, a2, a3, a4, (uint64_t)&unk_250B8DCB8, (uint64_t)sub_23A709E78, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A70967C);
}

uint64_t sub_23A709C98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;

  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  swift_retain();
  a7(a6, v13, a3, a4);
  return swift_release();
}

uint64_t sub_23A709D28(uint64_t result, void (*a2)(uint64_t, _QWORD *, _QWORD *))
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  _QWORD v16[3];
  _QWORD v17[5];
  char v18;

  v2 = *(_QWORD *)(result + 72);
  if (v2 >> 61 == 4)
  {
    v4 = *(_QWORD *)(result + 80);
    v5 = *(_QWORD *)(result + 88);
    v7 = *(_QWORD *)(result + 48);
    v6 = *(_QWORD *)(result + 56);
    v9 = *(_QWORD *)(result + 32);
    v8 = *(_QWORD *)(result + 40);
    v10 = *(_QWORD *)(result + 24);
    v11 = *(_QWORD *)result;
    v12 = (void *)(v2 & 0x1FFFFFFFFFFFFFFFLL);
    v13 = *(_BYTE *)(result + 64);
    v17[0] = v10;
    v17[1] = v9;
    v17[2] = v8;
    v17[3] = v7;
    v17[4] = v6;
    v18 = v13;
    v15 = v11;
    v16[0] = v2 & 0x1FFFFFFFFFFFFFFFLL;
    v16[1] = v4;
    v16[2] = v5;
    sub_23A6DF314(v10, v9, v8, v7, v6, v13);
    v14 = v12;
    swift_bridgeObjectRetain();
    a2(v15, v17, v16);

    swift_bridgeObjectRelease();
    return sub_23A6DF3FC(v10, v9, v8, v7, v6, v13);
  }
  return result;
}

uint64_t sub_23A709E1C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A709E40(uint64_t a1)
{
  uint64_t v1;

  return sub_23A709D28(a1, *(void (**)(uint64_t, _QWORD *, _QWORD *))(v1 + 16));
}

uint64_t sub_23A709E48(uint64_t a1)
{
  uint64_t v1;

  return sub_23A7098A0(a1, *(uint64_t (**)(_QWORD))(v1 + 16));
}

uint64_t sub_23A709E50(uint64_t a1)
{
  uint64_t v1;

  return sub_23A70992C(a1, *(uint64_t (**)(_QWORD))(v1 + 16));
}

void sub_23A709E58(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_23A7099BC(a1, a2, *(void (**)(uint64_t, id))(v2 + 16));
}

void sub_23A709E60(uint64_t *a1)
{
  uint64_t v1;

  sub_23A709A40(a1, *(void (**)(uint64_t, void *))(v1 + 16));
}

void sub_23A709E68(uint64_t *a1)
{
  uint64_t v1;

  sub_23A709B18(a1, *(void (**)(uint64_t, void *))(v1 + 16));
}

void sub_23A709E70(_QWORD *a1)
{
  uint64_t v1;

  sub_23A709BD8(a1, *(void (**)(_QWORD, void *))(v1 + 16));
}

_QWORD *sub_23A709E78(_QWORD *result)
{
  uint64_t v1;

  if (result[9] >> 61 == 3)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*result, result[3]);
  return result;
}

uint64_t sub_23A709EB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0D28);
  v2 = sub_23A70D198();
  v4[0] = v1;
  v4[1] = sub_23A709F10();
  return MEMORY[0x23B855268](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_23A709F10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0D30;
  if (!qword_2569B0D30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0D28);
    result = MEMORY[0x23B855268](MEMORY[0x24BDF1248], v1);
    atomic_store(result, (unint64_t *)&qword_2569B0D30);
  }
  return result;
}

void destroy for SceneEvent(uint64_t a1)
{

  swift_bridgeObjectRelease();
  sub_23A6EBFD8(*(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

_QWORD *initializeWithCopy for SceneEvent(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v15;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v15 = *(void **)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a2 + 72);
  v12 = *(_QWORD *)(a2 + 80);
  v11 = *(_QWORD *)(a2 + 88);
  v13 = v3;
  swift_bridgeObjectRetain();
  sub_23A6EBF7C(v15, v5, v6, v7, v8, v9, v10);
  a1[3] = v15;
  a1[4] = v5;
  a1[5] = v6;
  a1[6] = v7;
  a1[7] = v8;
  a1[8] = v9;
  a1[9] = v10;
  a1[10] = v12;
  a1[11] = v11;
  return a1;
}

uint64_t assignWithCopy for SceneEvent(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  sub_23A6EBF7C(v7, v8, v9, v10, v11, v12, v13);
  v16 = *(void **)(a1 + 24);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 56);
  v21 = *(_QWORD *)(a1 + 64);
  v22 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  sub_23A6EBFD8(v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

uint64_t assignWithTake for SceneEvent(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 88);
  v7 = *(void **)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = v6;
  sub_23A6EBFD8(v7, v8, v9, v10, v11, v12, v13);
  return a1;
}

ValueMetadata *type metadata accessor for SceneEvent()
{
  return &type metadata for SceneEvent;
}

uint64_t sub_23A70A1F8(uint64_t a1)
{
  uint64_t v1;

  return sub_23A709720(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A70A200()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A70A22C(uint64_t *a1)
{
  uint64_t v1;

  return sub_23A7097CC(a1, *(void (**)(uint64_t *))(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t (**)(uint64_t *))(v1 + 32));
}

ValueMetadata *_s23__Key_sceneEventHandlerVMa()
{
  return &_s23__Key_sceneEventHandlerVN;
}

void destroy for SceneEvent.Kind(uint64_t a1)
{
  sub_23A6EBFD8(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

_QWORD *initializeWithCopy for SceneEvent.Kind(_QWORD *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  sub_23A6EBF7C(*(id *)a2, v4, v5, v6, v7, v8, v9);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  return a1;
}

uint64_t assignWithCopy for SceneEvent.Kind(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  sub_23A6EBF7C(*(id *)a2, v4, v5, v6, v7, v8, v9);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  sub_23A6EBFD8(v12, v13, v14, v15, v16, v17, v18);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for SceneEvent.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;

  v3 = *(_QWORD *)(a2 + 64);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  v12 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v12;
  *(_QWORD *)(a1 + 64) = v3;
  sub_23A6EBFD8(v4, v6, v5, v7, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneEvent.Kind(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40) >> 3;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

double storeEnumTagSinglePayload for SceneEvent.Kind(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      result = 0.0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_QWORD *)(a1 + 32) = 0;
      *(_QWORD *)(a1 + 40) = 8 * -a2;
      *(_QWORD *)(a1 + 56) = 0;
      *(_QWORD *)(a1 + 64) = 0;
      *(_QWORD *)(a1 + 48) = 0;
      return result;
    }
    *(_BYTE *)(a1 + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_23A70A504(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 48) >> 61;
  if (v1 <= 4)
    return v1;
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_23A70A520(uint64_t result)
{
  *(_QWORD *)(result + 48) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_23A70A530(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2 < 5)
  {
    v2 = *(_QWORD *)(result + 48) & 0xFFFFFFFFFFFFFF8 | (a2 << 61);
    *(_QWORD *)(result + 40) &= 7uLL;
    *(_QWORD *)(result + 48) = v2;
  }
  else
  {
    *(_QWORD *)result = (a2 - 5);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0xA000000000000000;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 64) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneEvent.Kind()
{
  return &type metadata for SceneEvent.Kind;
}

BOOL static SceneActionResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t View.onSceneAction(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getKeyPath();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_23A70D330();
  swift_release();
  return swift_release();
}

uint64_t SceneActionResult.hash(into:)()
{
  return sub_23A70D87C();
}

uint64_t SceneActionResult.hashValue.getter()
{
  sub_23A70D870();
  sub_23A70D87C();
  return sub_23A70D894();
}

BOOL sub_23A70A6DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A70A6F4()
{
  sub_23A70D870();
  sub_23A70D87C();
  return sub_23A70D894();
}

uint64_t sub_23A70A738()
{
  return sub_23A70D87C();
}

uint64_t sub_23A70A760()
{
  sub_23A70D870();
  sub_23A70D87C();
  return sub_23A70D894();
}

void sub_23A70A7A0(_QWORD *a1@<X8>)
{
  *a1 = sub_23A6EFDAC;
  a1[1] = 0;
}

uint64_t (*sub_23A70A7B0())(uint64_t, uint64_t)
{
  __int128 v1;

  sub_23A6F8B84();
  sub_23A70D1EC();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_23A70AC4C;
}

uint64_t sub_23A70A814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a1;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a2;
  v7[3] = a3;
  v7[4] = sub_23A6E1388;
  v7[5] = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23A70AB88;
  *(_QWORD *)(v8 + 24) = v7;
  *(_QWORD *)a1 = sub_23A70AC08;
  *(_QWORD *)(a1 + 8) = v8;
  return swift_retain();
}

uint64_t sub_23A70A8C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A70A8E4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A70A814(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_23A70A8F0()
{
  unint64_t result;

  result = qword_2569B0D38;
  if (!qword_2569B0D38)
  {
    result = MEMORY[0x23B855268](&protocol conformance descriptor for SceneActionResult, &type metadata for SceneActionResult);
    atomic_store(result, (unint64_t *)&qword_2569B0D38);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SceneActionResult(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SceneActionResult(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A70AA1C + 4 * byte_23A711955[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A70AA50 + 4 * byte_23A711950[v4]))();
}

uint64_t sub_23A70AA50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A70AA58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A70AA60);
  return result;
}

uint64_t sub_23A70AA6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A70AA74);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A70AA78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A70AA80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A70AA8C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A70AA94(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SceneActionResult()
{
  return &type metadata for SceneActionResult;
}

uint64_t sub_23A70AAB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0D40);
  v2 = sub_23A70D198();
  v4[0] = v1;
  v4[1] = sub_23A70AB10();
  return MEMORY[0x23B855268](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_23A70AB10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0D48;
  if (!qword_2569B0D48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0D40);
    result = MEMORY[0x23B855268](MEMORY[0x24BDF1248], v1);
    atomic_store(result, (unint64_t *)&qword_2569B0D48);
  }
  return result;
}

uint64_t sub_23A70AB5C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_23A70AB88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  _QWORD *(*v7)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _QWORD *result;
  char v9;
  uint64_t v10;

  v7 = *(_QWORD *(**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 32);
  result = (*(_QWORD *(**)(char *__return_ptr))(v3 + 16))((char *)&v10 + 1);
  if (BYTE1(v10) == 1)
  {
    result = v7(&v10, a1, a2);
    v9 = v10;
  }
  else
  {
    v9 = 0;
  }
  *a3 = v9;
  return result;
}

uint64_t sub_23A70AC08(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

ValueMetadata *_s24__Key_sceneActionHandlerVMa()
{
  return &_s24__Key_sceneActionHandlerVN;
}

uint64_t sub_23A70AC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_23A70AC68(uint64_t a1, uint64_t *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD v16[5];
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *a2;
  v13 = *(_BYTE *)(a1 + 40);
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = v9;
  v16[3] = v10;
  v16[4] = v11;
  v17 = v13;
  v18 = v12;
  v19 = a3;
  v20 = a4;
  sub_23A6DF314(v7, v8, v9, v10, v11, v13);
  swift_bridgeObjectRetain();
  swift_retain();
  MEMORY[0x23B854824](v16, a5, &type metadata for ApplySceneActivationPolicyAndSettingsViewModifer, a6);
  sub_23A6DF3FC(v7, v8, v9, v10, v11, v13);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A70AD5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD v9[4];
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v1 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 48);
  v7 = *(_BYTE *)(v0 + 40);
  sub_23A70D6D8();
  swift_bridgeObjectRelease();
  v10 = 0x203A7963696C6F70;
  v11 = 0xE800000000000000;
  v12 = v1;
  v13 = v2;
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v7;
  sub_23A6DF314(v1, v2, v3, v4, v5, v7);
  sub_23A6F911C();
  sub_23A70D468();
  swift_bridgeObjectRelease();
  sub_23A6DF3FC(v1, v2, v3, v4, v5, v7);
  sub_23A70D468();
  sub_23A70D510();
  v9[2] = v6;
  swift_bridgeObjectRetain();
  sub_23A704B38((void (*)(_QWORD *__return_ptr))sub_23A701398, (uint64_t)v9);
  sub_23A70D468();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23A70AED4@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t OpaqueTypeConformance2;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  ValueMetadata *v30;
  unint64_t v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v28 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0D50);
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0D58);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[1];
  v8 = v1[3];
  v39 = v1[2];
  v40 = v8;
  v9 = v1[1];
  v37 = *v1;
  v38 = v9;
  v42 = v37;
  v43 = v9;
  v44 = v39;
  v41 = *((_QWORD *)v1 + 8);
  v45 = *((_QWORD *)v1 + 6);
  v33 = v37;
  v34 = v7;
  v35 = v39;
  v36 = *((_QWORD *)v1 + 6);
  v10 = swift_allocObject();
  v11 = v1[3];
  *(_OWORD *)(v10 + 48) = v1[2];
  *(_OWORD *)(v10 + 64) = v11;
  *(_QWORD *)(v10 + 80) = *((_QWORD *)v1 + 8);
  v12 = v1[1];
  *(_OWORD *)(v10 + 16) = *v1;
  *(_OWORD *)(v10 + 32) = v12;
  sub_23A70C064((uint64_t)&v42);
  sub_23A70C0A4((uint64_t)&v37);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0D60);
  v14 = sub_23A70C0F8();
  v15 = sub_23A70C144();
  sub_23A70D360();
  swift_release();
  sub_23A6DF3FC(v33, *((uint64_t *)&v33 + 1), v34, *((uint64_t *)&v34 + 1), v35, SBYTE8(v35));
  swift_bridgeObjectRelease();
  v33 = v42;
  v34 = v43;
  v35 = v44;
  v36 = v45;
  v16 = swift_allocObject();
  v17 = v40;
  *(_OWORD *)(v16 + 48) = v39;
  *(_OWORD *)(v16 + 64) = v17;
  *(_QWORD *)(v16 + 80) = v41;
  v18 = v38;
  *(_OWORD *)(v16 + 16) = v37;
  *(_OWORD *)(v16 + 32) = v18;
  sub_23A70C064((uint64_t)&v42);
  sub_23A70C0A4((uint64_t)&v37);
  v29 = v13;
  v30 = &type metadata for ActivationAndSettings;
  v31 = v14;
  v32 = v15;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_23A70D33C();
  swift_release();
  sub_23A6DF3FC(v33, *((uint64_t *)&v33 + 1), v34, *((uint64_t *)&v34 + 1), v35, SBYTE8(v35));
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v2);
  LOBYTE(v29) = BYTE8(v40);
  v20 = swift_allocObject();
  v21 = v40;
  *(_OWORD *)(v20 + 48) = v39;
  *(_OWORD *)(v20 + 64) = v21;
  *(_QWORD *)(v20 + 80) = v41;
  v22 = v38;
  *(_OWORD *)(v20 + 16) = v37;
  *(_OWORD *)(v20 + 32) = v22;
  sub_23A70C0A4((uint64_t)&v37);
  *(_QWORD *)&v33 = v2;
  *((_QWORD *)&v33 + 1) = &type metadata for ActivationAndSettings;
  *(_QWORD *)&v34 = OpaqueTypeConformance2;
  *((_QWORD *)&v34 + 1) = v15;
  swift_getOpaqueTypeConformance2();
  v23 = v26;
  sub_23A70D360();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v6, v23);
}

void sub_23A70B2CC(uint64_t a1)
{
  __asm { BR              X9 }
}

void sub_23A70B334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _DWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  _QWORD v23[16];

  if (!v5)
  {
    v9 = sub_23A70D510();
    *(_QWORD *)(v8 - 168) = v1;
    MEMORY[0x24BDAC7A8](v9);
    v23[2] = v6;
    v23[3] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = sub_23A7049A8((void (*)(_QWORD *__return_ptr))sub_23A70C2B8, (uint64_t)v23, (char)"DrawingBoard/SceneSettings.swift");
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = *(_QWORD *)(v8 - 168);
    if ((v10 & 1) != 0)
    {
      if (qword_2569AF2E8 != -1)
        swift_once();
      v12 = sub_23A70D0E4();
      __swift_project_value_buffer(v12, (uint64_t)qword_2569B4540);
      sub_23A6DF314(v0, v2, v3, v11, v4, 0);
      swift_bridgeObjectRetain();
      sub_23A6DF314(v0, v2, v3, v11, v4, 0);
      swift_bridgeObjectRetain();
      v13 = sub_23A70D0CC();
      v14 = sub_23A70D57C();
      if (os_log_type_enabled(v13, v14))
      {
        *(_QWORD *)(v8 - 176) = v13;
        v15 = (_DWORD *)swift_slowAlloc();
        v16 = swift_slowAlloc();
        *(_QWORD *)(v8 - 184) = v16;
        *(_QWORD *)(v8 - 104) = v7;
        *(_QWORD *)(v8 - 96) = v16;
        *(_QWORD *)(v8 - 192) = v15;
        *v15 = 136315138;
        *(_QWORD *)(v8 - 200) = v15 + 1;
        *(_QWORD *)(v8 - 152) = v0;
        *(_QWORD *)(v8 - 144) = v2;
        *(_QWORD *)(v8 - 136) = v3;
        *(_QWORD *)(v8 - 128) = v11;
        *(_QWORD *)(v8 - 120) = v4;
        *(_BYTE *)(v8 - 112) = 0;
        v17 = sub_23A70AD5C();
        *(_QWORD *)(v8 - 152) = sub_23A6F8508(v17, v18, (uint64_t *)(v8 - 96));
        v11 = *(_QWORD *)(v8 - 168);
        sub_23A70D5F4();
        swift_bridgeObjectRelease();
        sub_23A6DF3FC(v0, v2, v3, v11, v4, 0);
        swift_bridgeObjectRelease();
        sub_23A6DF3FC(v0, v2, v3, v11, v4, 0);
        swift_bridgeObjectRelease();
        v19 = *(NSObject **)(v8 - 176);
        v20 = v14;
        v21 = *(uint8_t **)(v8 - 192);
        _os_log_impl(&dword_23A6DA000, v19, v20, "#SceneActivationPolicyViewModifer (initial): %s", v21, 0xCu);
        v22 = *(_QWORD *)(v8 - 184);
        swift_arrayDestroy();
        MEMORY[0x23B85534C](v22, -1, -1);
        MEMORY[0x23B85534C](v21, -1, -1);

      }
      else
      {
        sub_23A6DF3FC(v0, v2, v3, v11, v4, 0);
        swift_bridgeObjectRelease();
        sub_23A6DF3FC(v0, v2, v3, v11, v4, 0);

        swift_bridgeObjectRelease();
      }
      *(_QWORD *)(v8 - 152) = v7;
      swift_bridgeObjectRetain();
      sub_23A6FBBD0((NSObject **)(v8 - 152), (uint64_t)j_nullsub_1, 0);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v8 - 152) = v0;
      *(_QWORD *)(v8 - 144) = v2;
      *(_QWORD *)(v8 - 136) = v3;
      *(_QWORD *)(v8 - 128) = v11;
      *(_QWORD *)(v8 - 120) = v4;
      *(_BYTE *)(v8 - 112) = 0;
      sub_23A6DF314(v0, v2, v3, v11, v4, 0);
      sub_23A6FC768((uint64_t *)(v8 - 152), (uint64_t)nullsub_1);
      sub_23A6DF3FC(v0, v2, v3, v11, v4, 0);
    }
  }
}

uint64_t sub_23A70B714(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  NSObject *log;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  __int128 v25;

  v2 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  if (qword_2569AF2E8 != -1)
    swift_once();
  v9 = sub_23A70D0E4();
  __swift_project_value_buffer(v9, (uint64_t)qword_2569B4540);
  sub_23A6DF314(v2, v3, v4, v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_23A6DF314(v2, v3, v4, v5, v6, v7);
  swift_bridgeObjectRetain();
  v10 = sub_23A70D0CC();
  v11 = sub_23A70D57C();
  if (os_log_type_enabled(v10, v11))
  {
    log = v10;
    v12 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    *(_QWORD *)&v25 = v17;
    *(_DWORD *)v12 = 136315138;
    *((_QWORD *)&v19 + 1) = v3;
    v20 = v4;
    v21 = v5;
    v22 = v6;
    v23 = v7;
    v24 = v8;
    v13 = sub_23A70AD5C();
    *(_QWORD *)&v19 = sub_23A6F8508(v13, v14, (uint64_t *)&v25);
    sub_23A70D5F4();
    swift_bridgeObjectRelease();
    sub_23A6DF3FC(v2, v3, v4, v5, v6, v7);
    swift_bridgeObjectRelease();
    sub_23A6DF3FC(v2, v3, v4, v5, v6, v7);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A6DA000, log, v11, "#SceneActivationPolicyViewModifer (changed): %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85534C](v17, -1, -1);
    MEMORY[0x23B85534C](v12, -1, -1);

  }
  else
  {
    sub_23A6DF3FC(v2, v3, v4, v5, v6, v7);
    swift_bridgeObjectRelease();
    sub_23A6DF3FC(v2, v3, v4, v5, v6, v7);

    swift_bridgeObjectRelease();
  }
  *(_QWORD *)&v25 = v8;
  sub_23A6E1320();
  swift_bridgeObjectRetain();
  sub_23A70D138();
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = v19;
  sub_23A6FBBD0((NSObject **)&v25, (uint64_t)sub_23A6E1388, v15);
  swift_release();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v19 = v2;
  *((_QWORD *)&v19 + 1) = v3;
  v20 = v4;
  v21 = v5;
  v22 = v6;
  v23 = v7;
  sub_23A6DF314(v2, v3, v4, v5, v6, v7);
  sub_23A70D138();
  *(_OWORD *)(swift_allocObject() + 16) = v25;
  sub_23A6FC768((uint64_t *)&v19, (uint64_t)sub_23A70AC4C);
  swift_release();
  return sub_23A6DF3FC(v19, *((uint64_t *)&v19 + 1), v20, v21, v22, v23);
}

uint64_t sub_23A70BAD8(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  _DWORD v20[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B0018);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a2;
  if (qword_2569AF2E8 != -1)
    swift_once();
  v9 = sub_23A70D0E4();
  __swift_project_value_buffer(v9, (uint64_t)qword_2569B4540);
  v10 = sub_23A70D0CC();
  v11 = sub_23A70D57C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v12 = 67109120;
    v20[3] = v8;
    sub_23A70D5F4();
    _os_log_impl(&dword_23A6DA000, v10, v11, "#SceneActivationPolicyViewModifer isActive: %{BOOL}d", v12, 8u);
    MEMORY[0x23B85534C](v12, -1, -1);
  }

  v13 = sub_23A70D528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  sub_23A70D510();
  sub_23A70C0A4(a3);
  v14 = sub_23A70D504();
  v15 = swift_allocObject();
  v16 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v16;
  v17 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v15 + 64) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v15 + 80) = v17;
  *(_QWORD *)(v15 + 96) = *(_QWORD *)(a3 + 64);
  v18 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v15 + 32) = *(_OWORD *)a3;
  *(_OWORD *)(v15 + 48) = v18;
  sub_23A6ED458((uint64_t)v7, (uint64_t)&unk_2569B0D80, v15);
  return swift_release();
}

uint64_t sub_23A70BCB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_23A70D510();
  *(_QWORD *)(v4 + 24) = sub_23A70D504();
  sub_23A70D4F8();
  return swift_task_switch();
}

uint64_t sub_23A70BD24()
{
  uint64_t v0;

  swift_release();
  sub_23A6FCE7C((uint64_t)j_nullsub_1, 0);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A70BD70()
{
  return sub_23A70D168();
}

uint64_t destroy for ApplySceneActivationPolicyAndSettingsViewModifer(uint64_t a1)
{
  sub_23A6DF3FC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for ApplySceneActivationPolicyAndSettingsViewModifer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_BYTE *)(a2 + 40);
  sub_23A6DF314(*(_QWORD *)a2, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ApplySceneActivationPolicyAndSettingsViewModifer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_BYTE *)(a2 + 40);
  sub_23A6DF314(*(_QWORD *)a2, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  v15 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v9;
  sub_23A6DF3FC(v10, v11, v12, v13, v14, v15);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ApplySceneActivationPolicyAndSettingsViewModifer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  char v12;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_BYTE *)(a2 + 40);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 32) = v4;
  v12 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v5;
  sub_23A6DF3FC(v6, v7, v8, v9, v10, v12);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ApplySceneActivationPolicyAndSettingsViewModifer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ApplySceneActivationPolicyAndSettingsViewModifer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ApplySceneActivationPolicyAndSettingsViewModifer()
{
  return &type metadata for ApplySceneActivationPolicyAndSettingsViewModifer;
}

uint64_t sub_23A70C048()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23A70C05C(uint64_t a1)
{
  sub_23A70B2CC(a1);
}

uint64_t sub_23A70C064(uint64_t a1)
{
  sub_23A6DF314(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A70C0A4(uint64_t a1)
{
  sub_23A6DF314(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

unint64_t sub_23A70C0F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0D68;
  if (!qword_2569B0D68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0D60);
    result = MEMORY[0x23B855268](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_2569B0D68);
  }
  return result;
}

unint64_t sub_23A70C144()
{
  unint64_t result;

  result = qword_2569B0D70;
  if (!qword_2569B0D70)
  {
    result = MEMORY[0x23B855268](&unk_23A711BB0, &type metadata for ActivationAndSettings);
    atomic_store(result, &qword_2569B0D70);
  }
  return result;
}

uint64_t sub_23A70C18C(uint64_t a1, uint64_t a2)
{
  return sub_23A70B714(a1, a2);
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;

  sub_23A6DF3FC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A70C1D8(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return sub_23A70BAD8(a1, a2, v2 + 16);
}

uint64_t sub_23A70C1E0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  sub_23A6DF3FC(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A70C228(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_23A6EDF28;
  return sub_23A70BCB8(a1, v4, v5, v1 + 32);
}

uint64_t sub_23A70C294()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A70C2B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_23A700374(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t destroy for ActivationAndSettings(uint64_t a1)
{
  sub_23A6DF3FC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ActivationAndSettings(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_BYTE *)(a2 + 40);
  sub_23A6DF314(*(_QWORD *)a2, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ActivationAndSettings(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_BYTE *)(a2 + 40);
  sub_23A6DF314(*(_QWORD *)a2, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  v15 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v9;
  sub_23A6DF3FC(v10, v11, v12, v13, v14, v15);
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

uint64_t assignWithTake for ActivationAndSettings(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  char v12;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_BYTE *)(a2 + 40);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 32) = v4;
  v12 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v5;
  sub_23A6DF3FC(v6, v7, v8, v9, v10, v12);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivationAndSettings(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivationAndSettings(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivationAndSettings()
{
  return &type metadata for ActivationAndSettings;
}

uint64_t sub_23A70C54C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0D58);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0D50);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B0D60);
  sub_23A70C0F8();
  sub_23A70C144();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

void sub_23A70C628(uint64_t a1)
{
  __asm { BR              X15 }
}

uint64_t sub_23A70C684()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD v6[12];

  if (v0)
  {
    v4 = 0;
  }
  else
  {
    v3 = sub_23A70D510();
    MEMORY[0x24BDAC7A8](v3);
    v6[2] = v1;
    v6[3] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v4 = sub_23A7049A8((void (*)(_QWORD *__return_ptr))sub_23A70C794, (uint64_t)v6, (char)"DrawingBoard/SceneSettings.swift");
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4 & 1;
}

uint64_t sub_23A70C794@<X0>(_BYTE *a1@<X8>)
{
  return sub_23A70C2B8(a1);
}

_QWORD *sub_23A70C7A8()
{
  void *v0;
  _QWORD *v1;
  id v2;
  id v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  if (qword_2569AF2F0 != -1)
    swift_once();
  if (objc_getAssociatedObject(v0, (const void *)qword_2569B0D88))
  {
    sub_23A70D60C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_23A6E6720((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_23A6E6768((uint64_t)v7);
    goto LABEL_10;
  }
  type metadata accessor for HostedPreviewModel();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    type metadata accessor for HostedPreviewModel();
    v1 = (_QWORD *)swift_allocObject();
    v2 = v0;
    sub_23A70D030();
    swift_unknownObjectUnownedInit();
    v3 = objc_allocWithZone((Class)type metadata accessor for HostedSceneObserver());
    v1[3] = sub_23A6ECCC8(v2);
    objc_setAssociatedObject(v2, (const void *)qword_2569B0D88, v1, (void *)1);
    return v1;
  }
  return (_QWORD *)v5;
}

id sub_23A70C900()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_23A70CCBC();
  sub_23A70D00C();
  swift_release();
  return *(id *)(v0 + 24);
}

id sub_23A70C96C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_23A70CCBC();
  sub_23A70D00C();
  swift_release();
  v4 = *(void **)(v3 + 24);
  *a2 = v4;
  return v4;
}

void sub_23A70C9E0(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_23A70CCBC();
  v2 = v1;
  sub_23A70D000();
  swift_release();

}

uint64_t sub_23A70CA7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectUnownedDestroy();

  v1 = v0 + OBJC_IVAR____TtC12DrawingBoard18HostedPreviewModel___observationRegistrar;
  v2 = sub_23A70D03C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A70CADC()
{
  uint64_t result;

  result = swift_slowAlloc();
  qword_2569B0D88 = result;
  return result;
}

uint64_t UIUserInterfaceStyle.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 1802658148;
  v2 = 0x6E776F6E6B6E75;
  if (a1 == 1)
    v2 = 0x746867696CLL;
  if (a1 != 2)
    v1 = v2;
  if (a1)
    return v1;
  else
    return 0x6669636570736E75;
}

uint64_t sub_23A70CB74()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = 1802658148;
  v3 = 0x6E776F6E6B6E75;
  if (*v0 == 1)
    v3 = 0x746867696CLL;
  if (v1 != 2)
    v2 = v3;
  if (v1)
    return v2;
  else
    return 0x6669636570736E75;
}

uint64_t sub_23A70CBEC()
{
  return type metadata accessor for HostedPreviewModel();
}

uint64_t type metadata accessor for HostedPreviewModel()
{
  uint64_t result;

  result = qword_2569B0DC0;
  if (!qword_2569B0DC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A70CC30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A70D03C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_23A70CCBC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0C50[0];
  if (!qword_2569B0C50[0])
  {
    v1 = type metadata accessor for HostedPreviewModel();
    result = MEMORY[0x23B855268](&unk_23A711CC0, v1);
    atomic_store(result, qword_2569B0C50);
  }
  return result;
}

void sub_23A70CD04()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = v2;
  v4 = v2;

}

id sub_23A70CD38(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id result;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[6];

  result = objc_msgSend(a1, sel_isActive);
  if ((_DWORD)result)
  {
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = a1;
    v8[5] = v3;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_23A6E32BC;
    *(_QWORD *)(v9 + 24) = v8;
    v12[4] = sub_23A6DEC28;
    v12[5] = v9;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 1107296256;
    v12[2] = sub_23A6E30E4;
    v12[3] = &block_descriptor_6;
    v10 = _Block_copy(v12);
    swift_retain();
    v11 = a1;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_deactivate_, v10);
    _Block_release(v10);
    return (id)swift_release_n();
  }
  return result;
}

uint64_t type metadata accessor for DeactivationSceneActivationPolicyModel()
{
  return objc_opt_self();
}

id sub_23A70CE84(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_23A70CD38(a1, a2, a3);
}

unint64_t sub_23A70CEA4(uint64_t a1)
{
  unint64_t result;

  result = sub_23A70CEC8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23A70CEC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B0F40;
  if (!qword_2569B0F40)
  {
    v1 = type metadata accessor for DeactivationSceneActivationPolicyModel();
    result = MEMORY[0x23B855268](&unk_23A711D58, v1);
    atomic_store(result, (unint64_t *)&qword_2569B0F40);
  }
  return result;
}

uint64_t sub_23A70CF0C()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A70CF40()
{
  return swift_deallocObject();
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

uint64_t type metadata accessor for LocalSceneSettingsExtension()
{
  return objc_opt_self();
}

uint64_t sub_23A70CFD0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A70CFDC()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23A70CFE8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A70CFF4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A70D000()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_23A70D00C()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_23A70D018()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_23A70D024()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_23A70D030()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_23A70D03C()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_23A70D048()
{
  return MEMORY[0x24BE18B90]();
}

uint64_t sub_23A70D054()
{
  return MEMORY[0x24BE18B98]();
}

uint64_t sub_23A70D060()
{
  return MEMORY[0x24BE18BA0]();
}

uint64_t sub_23A70D06C()
{
  return MEMORY[0x24BE18BA8]();
}

uint64_t sub_23A70D078()
{
  return MEMORY[0x24BE18BB0]();
}

uint64_t sub_23A70D084()
{
  return MEMORY[0x24BE18BB8]();
}

uint64_t sub_23A70D090()
{
  return MEMORY[0x24BE18BC0]();
}

uint64_t sub_23A70D09C()
{
  return MEMORY[0x24BE18BC8]();
}

uint64_t sub_23A70D0A8()
{
  return MEMORY[0x24BE18BD0]();
}

uint64_t sub_23A70D0B4()
{
  return MEMORY[0x24BE18BD8]();
}

uint64_t sub_23A70D0C0()
{
  return MEMORY[0x24BE18BE0]();
}

uint64_t sub_23A70D0CC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A70D0D8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A70D0E4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A70D0F0()
{
  return MEMORY[0x24BEBC900]();
}

uint64_t sub_23A70D0FC()
{
  return MEMORY[0x24BEBC9B0]();
}

uint64_t sub_23A70D108()
{
  return MEMORY[0x24BEBC9B8]();
}

uint64_t sub_23A70D114()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_23A70D120()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23A70D12C()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23A70D138()
{
  return MEMORY[0x24BDEB8C8]();
}

uint64_t sub_23A70D144()
{
  return MEMORY[0x24BDEB8D0]();
}

uint64_t sub_23A70D150()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23A70D15C()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23A70D168()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23A70D174()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_23A70D180()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_23A70D18C()
{
  return MEMORY[0x24BDECBC0]();
}

uint64_t sub_23A70D198()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23A70D1A4()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_23A70D1B0()
{
  return MEMORY[0x24BDED5F8]();
}

uint64_t sub_23A70D1BC()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_23A70D1C8()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_23A70D1D4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23A70D1E0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23A70D1EC()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_23A70D1F8()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_23A70D204()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23A70D210()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_23A70D21C()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_23A70D228()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_23A70D234()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_23A70D240()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_23A70D24C()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_23A70D258()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_23A70D264()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_23A70D270()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_23A70D27C()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_23A70D288()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_23A70D294()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_23A70D2A0()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23A70D2AC()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23A70D2B8()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_23A70D2C4()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_23A70D2D0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23A70D2DC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23A70D2E8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23A70D2F4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23A70D300()
{
  return MEMORY[0x24BDF20E8]();
}

uint64_t sub_23A70D30C()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_23A70D318()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23A70D324()
{
  return MEMORY[0x24BDF2810]();
}

uint64_t sub_23A70D330()
{
  return MEMORY[0x24BDF3008]();
}

uint64_t sub_23A70D33C()
{
  return MEMORY[0x24BDF30C0]();
}

uint64_t sub_23A70D348()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_23A70D354()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23A70D360()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_23A70D36C()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23A70D378()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23A70D384()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_23A70D390()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23A70D39C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23A70D3A8()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_23A70D3B4()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_23A70D3C0()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_23A70D3CC()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_23A70D3D8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23A70D3E4()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_23A70D3F0()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_23A70D3FC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23A70D408()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23A70D414()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23A70D420()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_23A70D42C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A70D438()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A70D444()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A70D450()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A70D45C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A70D468()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A70D474()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A70D480()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A70D48C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A70D498()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A70D4A4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A70D4B0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A70D4BC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23A70D4C8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A70D4D4()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_23A70D4E0()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23A70D4EC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23A70D4F8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A70D504()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23A70D510()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23A70D51C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A70D528()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A70D534()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_23A70D540()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23A70D54C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23A70D558()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_23A70D564()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_23A70D570()
{
  return MEMORY[0x24BEE1A80]();
}

uint64_t sub_23A70D57C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A70D588()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23A70D594()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A70D5A0()
{
  return MEMORY[0x24BEBCC68]();
}

uint64_t sub_23A70D5AC()
{
  return MEMORY[0x24BEBCDD0]();
}

uint64_t sub_23A70D5B8()
{
  return MEMORY[0x24BEBCFE0]();
}

uint64_t sub_23A70D5C4()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_23A70D5D0()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23A70D5DC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23A70D5E8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A70D5F4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A70D600()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A70D60C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A70D618()
{
  return MEMORY[0x24BEE20B8]();
}

uint64_t sub_23A70D624()
{
  return MEMORY[0x24BEE20C8]();
}

uint64_t sub_23A70D630()
{
  return MEMORY[0x24BEE20D8]();
}

uint64_t sub_23A70D63C()
{
  return MEMORY[0x24BEE20E8]();
}

uint64_t sub_23A70D648()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A70D654()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23A70D660()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23A70D66C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23A70D678()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_23A70D684()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t sub_23A70D690()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23A70D69C()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_23A70D6A8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23A70D6B4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23A70D6C0()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_23A70D6CC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23A70D6D8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A70D6E4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A70D6F0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A70D6FC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23A70D708()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A70D714()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A70D720()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23A70D72C()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_23A70D738()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A70D744()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A70D750()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A70D75C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A70D768()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A70D774()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A70D780()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A70D78C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A70D798()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A70D7A4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A70D7B0()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_23A70D7BC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23A70D7C8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A70D7D4()
{
  return MEMORY[0x24BEE35A8]();
}

uint64_t sub_23A70D7E0()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23A70D7EC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A70D7F8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23A70D804()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A70D810()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23A70D81C()
{
  return MEMORY[0x24BEE7148]();
}

uint64_t sub_23A70D828()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A70D834()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A70D840()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A70D84C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A70D858()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23A70D864()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23A70D870()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A70D87C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A70D888()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A70D894()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A70D8A0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A70D8AC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A70D8B8()
{
  return MEMORY[0x24BEE4830]();
}

uint64_t sub_23A70D8C4()
{
  return MEMORY[0x24BEE4860]();
}

uint64_t sub_23A70D8D0()
{
  return MEMORY[0x24BEE4880]();
}

uint64_t sub_23A70D8DC()
{
  return MEMORY[0x24BEE4898]();
}

uint64_t sub_23A70D8E8()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_23A70D8F4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A70D900()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23A70D90C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x24BE0BC18]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4F20]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x24BEE7240]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x24BEE4FA8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

