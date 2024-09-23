void sub_235F00580()
{
  qword_256393B78 = 0x6E6C7566646E694DLL;
  unk_256393B80 = 0xEB00000000737365;
}

uint64_t static MindfulnessAccessibilityIdentifier.base.getter()
{
  return sub_235F0071C(&qword_256393B70, &qword_256393B78);
}

uint64_t sub_235F005CC()
{
  uint64_t result;

  sub_235F12AB4();
  if (qword_256393B70 != -1)
    swift_once();
  result = swift_bridgeObjectRelease();
  qword_256393B90 = 0xD00000000000001ELL;
  *(_QWORD *)algn_256393B98 = 0x8000000235F14320;
  return result;
}

uint64_t static MindfulnessAccessibilityIdentifier.SessionSummaryView.base.getter()
{
  return sub_235F0071C(&qword_256393B88, &qword_256393B90);
}

uint64_t sub_235F00678()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  if (qword_256393B88 != -1)
    swift_once();
  v1 = qword_256393B90;
  v2 = *(_QWORD *)algn_256393B98;
  swift_bridgeObjectRetain();
  result = sub_235F12964();
  qword_256393BA8 = v1;
  unk_256393BB0 = v2;
  return result;
}

uint64_t static MindfulnessAccessibilityIdentifier.SessionSummaryView.closeButton.getter()
{
  return sub_235F0071C(&qword_256393BA0, &qword_256393BA8);
}

uint64_t sub_235F0071C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t static MindfulnessAccessibilityIdentifier.build(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393C78);
  sub_235F007FC();
  return sub_235F1291C();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E5CAC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_235F007FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256393C80;
  if (!qword_256393C80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256393C78);
    result = MEMORY[0x23B7E5CC4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_256393C80);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E5CB8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MindfulnessAccessibilityIdentifier()
{
  return &type metadata for MindfulnessAccessibilityIdentifier;
}

ValueMetadata *type metadata accessor for MindfulnessAccessibilityIdentifier.SessionSummaryView()
{
  return &type metadata for MindfulnessAccessibilityIdentifier.SessionSummaryView;
}

void sub_235F008AC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_235F008B4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_235F008C8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_235F008D4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_235F008F0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_235F00910(uint64_t result, int a2, int a3)
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
  sub_235F009FC(a1, &qword_256393C88);
}

uint64_t initializeBufferWithCopyOfBuffer for FitnessPlusSessionProvider.SessionInformation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_235F00988(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_235F009A8(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_235F009FC(a1, &qword_256393C90);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_235F009FC(a1, &qword_256393C98);
}

void sub_235F009FC(uint64_t a1, unint64_t *a2)
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

uint64_t HKWorkout.isFitnessPlusWorkout.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;

  v1 = objc_msgSend(v0, sel_metadata);
  if (!v1)
  {
    v10 = 0u;
    v11 = 0u;
    goto LABEL_8;
  }
  v2 = v1;
  v3 = sub_235F12910();

  v4 = sub_235F1288C();
  if (!*(_QWORD *)(v3 + 16) || (v6 = sub_235F01370(v4, v5), (v7 & 1) == 0))
  {
    v10 = 0u;
    v11 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_235F013D4(*(_QWORD *)(v3 + 56) + 32 * v6, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v11 + 1))
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = 1;
LABEL_9:
  sub_235F01458((uint64_t)&v10, &qword_256393CA0);
  return v8;
}

BOOL sub_235F00B3C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void (*v19)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  unsigned int (*v21)(uint64_t, uint64_t, uint64_t);
  _BYTE *v22;
  _BYTE *v23;
  _BYTE *v24;
  void (*v25)(_BYTE *, uint64_t);
  id v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  _BYTE v31[4];
  int v32;
  _BYTE *v33;
  _BYTE *v34;
  id v35;

  v1 = sub_235F127B4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v33 = &v31[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393CA8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v31[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393CB0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v34 = &v31[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = &v31[-v11];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v31[-v13];
  v35 = v0;
  v15 = objc_msgSend(v0, sel_metadata);
  if (v15)
  {
    v16 = v15;
    sub_235F12910();

  }
  sub_235F12790();
  sub_235F127A8();
  sub_235F1279C();
  v17 = (void *)sub_235F12778();
  swift_release();
  swift_bridgeObjectRelease();
  if (v17)
  {
    v18 = v17;
    sub_235F12784();

    v19 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v19(v14, 0, 1, v1);
  }
  else
  {
    v19 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v19(v14, 1, 1, v1);
  }
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v2 + 104))(v12, *MEMORY[0x24BEC5CD0], v1);
  v19(v12, 0, 1, v1);
  v20 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_235F01410((uint64_t)v14, (uint64_t)v6);
  sub_235F01410((uint64_t)v12, v20);
  v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v21((uint64_t)v6, 1, v1) == 1)
  {
    sub_235F01458((uint64_t)v12, &qword_256393CB0);
    sub_235F01458((uint64_t)v14, &qword_256393CB0);
    if (v21(v20, 1, v1) == 1)
    {
      sub_235F01458((uint64_t)v6, &qword_256393CB0);
LABEL_13:

      return 1;
    }
    goto LABEL_11;
  }
  v22 = v34;
  sub_235F01410((uint64_t)v6, (uint64_t)v34);
  if (v21(v20, 1, v1) == 1)
  {
    sub_235F01458((uint64_t)v12, &qword_256393CB0);
    sub_235F01458((uint64_t)v14, &qword_256393CB0);
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v22, v1);
LABEL_11:
    sub_235F01458((uint64_t)v6, &qword_256393CA8);
    goto LABEL_14;
  }
  v23 = v22;
  v24 = v33;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 32))(v33, v20, v1);
  sub_235F01494();
  v32 = sub_235F12928();
  v25 = *(void (**)(_BYTE *, uint64_t))(v2 + 8);
  v25(v24, v1);
  sub_235F01458((uint64_t)v12, &qword_256393CB0);
  sub_235F01458((uint64_t)v14, &qword_256393CB0);
  v25(v23, v1);
  sub_235F01458((uint64_t)v6, &qword_256393CB0);
  if ((v32 & 1) != 0)
    goto LABEL_13;
LABEL_14:
  v27 = v35;
  if (objc_msgSend(v35, sel_workoutActivityType) == (id)82)
  {

    return 0;
  }
  else
  {
    v28 = objc_msgSend(v27, sel_workoutActivities);
    sub_235F014DC();
    v29 = sub_235F12988();

    if (v29 >> 62)
    {
      swift_bridgeObjectRetain();
      v30 = sub_235F12AF0();
      swift_bridgeObjectRelease();
    }
    else
    {
      v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();

    return v30 > 1;
  }
}

uint64_t sub_235F00FAC()
{
  return sub_235F00FC4(MEMORY[0x24BEC5CC8]);
}

uint64_t sub_235F00FB8()
{
  return sub_235F00FC4(MEMORY[0x24BEC5CC0]);
}

uint64_t sub_235F00FC4(unsigned int *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  int v23;
  uint64_t *v24;
  char v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unsigned int *v33;

  v33 = a1;
  v2 = sub_235F127B4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v31 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393CA8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393CB0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v32 = (uint64_t)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v30 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v30 - v14;
  v16 = objc_msgSend(v1, sel_metadata);
  if (v16)
  {
    v17 = v16;
    sub_235F12910();

  }
  sub_235F12790();
  sub_235F127A8();
  sub_235F1279C();
  v18 = (void *)sub_235F12778();
  swift_release();
  swift_bridgeObjectRelease();
  if (v18)
  {
    v19 = v18;
    sub_235F12784();

    v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v20(v15, 0, 1, v2);
  }
  else
  {
    v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v20(v15, 1, 1, v2);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v13, *v33, v2);
  v20(v13, 0, 1, v2);
  v21 = (uint64_t)&v7[*(int *)(v5 + 48)];
  sub_235F01410((uint64_t)v15, (uint64_t)v7);
  sub_235F01410((uint64_t)v13, v21);
  v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v22((uint64_t)v7, 1, v2) == 1)
  {

    sub_235F01458((uint64_t)v13, &qword_256393CB0);
    sub_235F01458((uint64_t)v15, &qword_256393CB0);
    v23 = v22(v21, 1, v2);
    if (v23 == 1)
      v24 = &qword_256393CB0;
    else
      v24 = &qword_256393CA8;
    if (v23 == 1)
      v25 = -1;
    else
      v25 = 0;
  }
  else
  {
    v26 = v32;
    sub_235F01410((uint64_t)v7, v32);
    if (v22(v21, 1, v2) == 1)
    {

      sub_235F01458((uint64_t)v13, &qword_256393CB0);
      sub_235F01458((uint64_t)v15, &qword_256393CB0);
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v26, v2);
      v25 = 0;
      v24 = &qword_256393CA8;
    }
    else
    {
      v27 = v31;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v31, v21, v2);
      sub_235F01494();
      v25 = sub_235F12928();

      v28 = *(void (**)(char *, uint64_t))(v3 + 8);
      v28(v27, v2);
      v24 = &qword_256393CB0;
      sub_235F01458((uint64_t)v13, &qword_256393CB0);
      sub_235F01458((uint64_t)v15, &qword_256393CB0);
      v28((char *)v26, v2);
    }
  }
  sub_235F01458((uint64_t)v7, v24);
  return v25 & 1;
}

unint64_t sub_235F01370(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_235F12B98();
  sub_235F12958();
  v4 = sub_235F12BB0();
  return sub_235F01518(a1, a2, v4);
}

uint64_t sub_235F013D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235F01410(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393CB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F01458(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_235F01494()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256393CB8;
  if (!qword_256393CB8)
  {
    v1 = sub_235F127B4();
    result = MEMORY[0x23B7E5CC4](MEMORY[0x24BEC5CF8], v1);
    atomic_store(result, (unint64_t *)&qword_256393CB8);
  }
  return result;
}

unint64_t sub_235F014DC()
{
  unint64_t result;

  result = qword_256393CC0;
  if (!qword_256393CC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256393CC0);
  }
  return result;
}

unint64_t sub_235F01518(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_235F12B44() & 1) == 0)
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
      while (!v14 && (sub_235F12B44() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_235F015FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5[3];
  uint64_t v6;
  uint64_t v7;

  sub_235F12808();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393CD8);
  v7 = sub_235F01AC8(&qword_256393CE0, &qword_256393CD8);
  __swift_allocate_boxed_opaque_existential_1(v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393CE8);
  sub_235F125C8();
  v0 = sub_235F126B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  sub_235F127CC();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393CF0);
  v7 = sub_235F01AC8(&qword_256393CF8, &qword_256393CF0);
  __swift_allocate_boxed_opaque_existential_1(v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393D00);
  sub_235F125C8();
  v1 = sub_235F126B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393D08);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_235F130C0;
  *(_QWORD *)(v2 + 32) = v0;
  *(_QWORD *)(v2 + 40) = v1;
  sub_235F126AC();
  swift_bridgeObjectRelease();
  v3 = sub_235F126A0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s11SeymourCore12DependenciesC10ActivityUIE08activityE05queue18wheelchairUseCacheACSo012OS_dispatch_G0C_So013_HKWheelchairi14CharacteristicJ0CtFZ_0(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[40];

  sub_235F125F8();
  MEMORY[0x23B7E5394](a1);
  sub_235F125EC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393CC8);
  sub_235F125EC();
  v4 = sub_235F127F0();
  swift_allocObject();
  v5 = sub_235F127E4();
  v17 = v4;
  v18 = MEMORY[0x24BE8E250];
  v16 = v5;
  sub_235F019E4((uint64_t)v19, (uint64_t)v15);
  sub_235F12808();
  swift_allocObject();
  swift_retain();
  sub_235F127FC();
  sub_235F128F8();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = sub_235F12874();
  swift_allocObject();
  v9 = sub_235F12868();
  v17 = v8;
  v18 = MEMORY[0x24BE86E40];
  v16 = v9;
  v10 = sub_235F12838();
  swift_allocObject();
  v11 = sub_235F12820();
  sub_235F1282C();
  v17 = v10;
  v18 = MEMORY[0x24BE8E418];
  v16 = v11;
  v15[3] = sub_235F01A28();
  v15[4] = MEMORY[0x24BE8ED68];
  v15[0] = a2;
  sub_235F127CC();
  swift_allocObject();
  swift_retain();
  v12 = a2;
  sub_235F127C0();
  v13 = sub_235F125E0();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_235F019E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_235F01A28()
{
  unint64_t result;

  result = qword_256393CD0;
  if (!qword_256393CD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256393CD0);
  }
  return result;
}

uint64_t sub_235F01A64()
{
  return sub_235F015FC();
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

uint64_t sub_235F01AC8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7E5CC4](MEMORY[0x24BE885D0], v4);
    atomic_store(result, a1);
  }
  return result;
}

id sub_235F01B08()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01CA8]), sel_init);
  v1 = FIUIColorSpecRGB(0x9Bu, 0x6Eu, 0xFAu);
  objc_msgSend(v0, sel_setNonGradientTextColor_, v1);

  v2 = FIUIColorSpecRGB(0x16u, 0x10u, 0x28u);
  objc_msgSend(v0, sel_setGradientDarkColor_, v2);

  v3 = FIUIColorSpecRGB(0x2Fu, 0x21u, 0x5Au);
  objc_msgSend(v0, sel_setGradientLightColor_, v3);

  v4 = FIUIColorSpecRGB(0x9Bu, 0x6Eu, 0xFAu);
  objc_msgSend(v0, sel_setAdjustmentButtonBackgroundColor_, v4);

  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_whiteColor);
  objc_msgSend(v0, sel_setValueDisplayColor_, v6);

  v7 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonTextColor_, v7);

  v8 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonDisabledTextColor_, v8);

  return v0;
}

id sub_235F01CBC()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01CA8]), sel_init);
  v1 = FIUIColorSpecRGB(0, 0xFFu, 0xA8u);
  objc_msgSend(v0, sel_setNonGradientTextColor_, v1);

  v2 = FIUIColorSpecRGB(2u, 0x23u, 0x1Cu);
  objc_msgSend(v0, sel_setGradientDarkColor_, v2);

  v3 = FIUIColorSpecRGB(4u, 0x33u, 0x23u);
  objc_msgSend(v0, sel_setGradientLightColor_, v3);

  v4 = FIUIColorSpecRGB(0, 0xFFu, 0xA8u);
  objc_msgSend(v0, sel_setAdjustmentButtonBackgroundColor_, v4);

  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_whiteColor);
  objc_msgSend(v0, sel_setValueDisplayColor_, v6);

  v7 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonTextColor_, v7);

  v8 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonDisabledTextColor_, v8);

  return v0;
}

id sub_235F01E70()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01CA8]), sel_init);
  v1 = FIUIColorSpecRGB(0x3Au, 0xE9u, 0xE6u);
  objc_msgSend(v0, sel_setNonGradientTextColor_, v1);

  v2 = FIUIColorSpecRGB(0, 0x25u, 0x22u);
  objc_msgSend(v0, sel_setGradientDarkColor_, v2);

  v3 = FIUIColorSpecRGB(0, 0x3Du, 0x39u);
  objc_msgSend(v0, sel_setGradientLightColor_, v3);

  v4 = FIUIColorSpecRGB(0x3Au, 0xE9u, 0xE6u);
  objc_msgSend(v0, sel_setAdjustmentButtonBackgroundColor_, v4);

  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_whiteColor);
  objc_msgSend(v0, sel_setValueDisplayColor_, v6);

  v7 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonTextColor_, v7);

  v8 = objc_msgSend(v5, sel_blackColor);
  objc_msgSend(v0, sel_setButtonDisabledTextColor_, v8);

  return v0;
}

id sub_235F02024(id a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id result;
  uint64_t v15;

  v2 = sub_235F127B4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_workoutActivityType) == (id)84)
  {
    a1 = objc_msgSend((id)objc_opt_self(), sel_diveColors);
    if (a1)
      return a1;
    __break(1u);
  }
  v6 = objc_msgSend(a1, sel_metadata);
  if (v6)
  {
    v7 = v6;
    sub_235F12910();

  }
  sub_235F12790();
  sub_235F127A8();
  sub_235F1279C();
  v8 = (void *)sub_235F12778();
  swift_release();
  swift_bridgeObjectRelease();
  if (v8)
  {
    sub_235F12784();
    v9 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
    if (v9 == *MEMORY[0x24BEC5CB8])
    {
      sub_235F1276C();
      if (swift_dynamicCastClass())
      {
        v10 = v8;
        v11 = (void *)sub_235F12760();
        v12 = objc_msgSend(v11, sel_goalTypeIdentifier);

        v13 = objc_msgSend((id)objc_opt_self(), sel_metricColorsForGoalTypeIdentifier_, v12);
        return v13;
      }
      result = objc_msgSend((id)objc_opt_self(), sel_metricColorsForGoalTypeIdentifier_, objc_msgSend(a1, sel__goalType));
      goto LABEL_22;
    }
    if (v9 == *MEMORY[0x24BEC5CD0])
    {
      result = sub_235F01B08();
LABEL_22:
      a1 = result;

      return a1;
    }
    if (v9 == *MEMORY[0x24BEC5CC0])
    {
      result = sub_235F01CBC();
      goto LABEL_22;
    }
    if (v9 == *MEMORY[0x24BEC5CC8])
    {
      result = sub_235F01E70();
      goto LABEL_22;
    }
    if (v9 != *MEMORY[0x24BEC5CB0])
    {
      a1 = objc_msgSend((id)objc_opt_self(), sel_metricColorsForGoalTypeIdentifier_, objc_msgSend(a1, sel__goalType));

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return a1;
    }
    result = objc_msgSend((id)objc_opt_self(), sel_noMetricColors);
    if (result)
      goto LABEL_22;
    __break(1u);
  }
  else if (sub_235F00B3C())
  {
    return sub_235F01B08();
  }
  else
  {
    return objc_msgSend((id)objc_opt_self(), sel_metricColorsForGoalTypeIdentifier_, objc_msgSend(a1, sel__goalType));
  }
  return result;
}

id FIUIColorSpecRGB(unsigned int a1, unsigned int a2, unsigned int a3)
{
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", (double)a1 / 255.0, (double)a2 / 255.0, (double)a3 / 255.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_235F02404(double a1, double a2)
{
  void *v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t result;
  id v12;
  _QWORD v13[6];

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_, a1, a2);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v2;
  *(double *)(v6 + 24) = a1;
  *(double *)(v6 + 32) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_235F025D8;
  *(_QWORD *)(v7 + 24) = v6;
  v13[4] = sub_235F02604;
  v13[5] = v7;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_235F10A30;
  v13[3] = &block_descriptor;
  v8 = _Block_copy(v13);
  v9 = v2;
  swift_retain();
  swift_release();
  v10 = objc_msgSend(v5, sel_imageWithActions_, v8);

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v5 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v12 = objc_msgSend(v10, sel_imageWithRenderingMode_, objc_msgSend(v9, sel_renderingMode));
    swift_release();

    return (uint64_t)v12;
  }
  return result;
}

uint64_t sub_235F025B4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_235F025D8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_235F025F4()
{
  return swift_deallocObject();
}

uint64_t sub_235F02604(uint64_t a1)
{
  uint64_t v1;

  return sub_235F10A10(a1, *(uint64_t (**)(void))(v1 + 16));
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

uint64_t sub_235F02624()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = sub_235F12A48();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235F128EC();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_235F12A3C();
  MEMORY[0x24BDAC7A8](v5);
  sub_235F0810C(0, &qword_256393E88);
  sub_235F12A30();
  sub_235F128E0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_235F12A6C();
  qword_256393D10 = result;
  return result;
}

unint64_t sub_235F02770(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EB8);
  v2 = (_QWORD *)sub_235F12B14();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (char *)(a1 + 56);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 3);
    v6 = *((_QWORD *)v4 - 2);
    v7 = (void *)*((_QWORD *)v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    sub_235F07A94(v7, v8);
    result = sub_235F01370(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = v2[7] + 16 * result;
    *(_QWORD *)v12 = v7;
    *(_BYTE *)(v12 + 8) = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v2[2] = v15;
    v4 += 32;
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

uint64_t AppIconImageProvider.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_235F02770(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t AppIconImageProvider.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_235F02770(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t sub_235F02900(uint64_t a1, uint64_t a2, char a3, double a4)
{
  _QWORD *v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 136) = v4;
  *(double *)(v5 + 128) = a4;
  *(_BYTE *)(v5 + 73) = a3;
  *(_QWORD *)(v5 + 112) = a1;
  *(_QWORD *)(v5 + 120) = a2;
  *(_QWORD *)(v5 + 144) = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393D20);
  *(_QWORD *)(v5 + 152) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_235F02970()
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t result;
  void *v19;
  int v20;
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
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  if (qword_256393C70 != -1)
    swift_once();
  v1 = (const void *)(v0 + 16);
  v2 = v0 + 64;
  v3 = sub_235F128B0();
  __swift_project_value_buffer(v3, (uint64_t)qword_2563943B0);
  swift_bridgeObjectRetain_n();
  v4 = sub_235F12898();
  v5 = sub_235F12A24();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 120);
  if (v6)
  {
    v34 = *(_QWORD *)(v0 + 112);
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v35 = v9;
    *(_DWORD *)v8 = 136315394;
    *(_QWORD *)(v0 + 96) = sub_235F06A38(0xD00000000000002ELL, 0x8000000235F143A0, &v35);
    sub_235F12A90();
    *(_WORD *)(v8 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 104) = sub_235F06A38(v34, v7, &v35);
    v2 = v0 + 64;
    v1 = (const void *)(v0 + 16);
    sub_235F12A90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235EFE000, v4, v5, "%s bundleID: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E5D30](v9, -1, -1);
    MEMORY[0x23B7E5D30](v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v10 = sub_235F077CC(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), *(_BYTE *)(v0 + 73), *(double *)(v0 + 128));
  v12 = v11;
  *(_QWORD *)(v0 + 160) = v10;
  *(_QWORD *)(v0 + 168) = v11;
  *(_QWORD *)(v0 + 64) = 0;
  *(_BYTE *)(v0 + 72) = -1;
  if (qword_256393BB8 != -1)
    swift_once();
  v13 = *(_QWORD *)(v0 + 136);
  v14 = qword_256393D10;
  v15 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v0 + 176) = v15;
  v15[2] = v2;
  v15[3] = v13;
  v15[4] = v10;
  v15[5] = v12;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_235F078E8;
  *(_QWORD *)(v16 + 24) = v15;
  *(_QWORD *)(v0 + 48) = sub_235F07904;
  *(_QWORD *)(v0 + 56) = v16;
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_235F034A0;
  *(_QWORD *)(v0 + 40) = &block_descriptor_0;
  v17 = _Block_copy(v1);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v14, v17);
  _Block_release(v17);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v13 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v19 = *(void **)(v0 + 64);
    *(_QWORD *)(v0 + 184) = v19;
    v20 = *(unsigned __int8 *)(v0 + 72);
    *(_BYTE *)(v0 + 74) = v20;
    if (v20 == 255)
    {
      v22 = *(_QWORD *)(v0 + 144);
      v21 = *(_QWORD *)(v0 + 152);
      v23 = *(_QWORD *)(v0 + 136);
      v24 = *(_QWORD *)(v0 + 128);
      v25 = *(_BYTE *)(v0 + 73);
      v27 = *(_QWORD *)(v0 + 112);
      v26 = *(_QWORD *)(v0 + 120);
      sub_235F129D0();
      v28 = sub_235F129E8();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v21, 0, 1, v28);
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = 0;
      *(_QWORD *)(v29 + 24) = 0;
      *(_BYTE *)(v29 + 32) = v25;
      *(_QWORD *)(v29 + 40) = v23;
      *(_QWORD *)(v29 + 48) = v27;
      *(_QWORD *)(v29 + 56) = v26;
      *(_QWORD *)(v29 + 64) = v24;
      swift_bridgeObjectRetain();
      swift_retain();
      v30 = sub_235F04344(v21, (uint64_t)&unk_256393D30, v29);
      *(_QWORD *)(v0 + 208) = v30;
      v31 = swift_task_alloc();
      *(_QWORD *)(v0 + 216) = v31;
      *(_QWORD *)(v31 + 16) = v23;
      *(_QWORD *)(v31 + 24) = v10;
      *(_QWORD *)(v31 + 32) = v12;
      *(_QWORD *)(v31 + 40) = v30;
      *(_BYTE *)(v31 + 48) = 0;
      *(_QWORD *)(v31 + 56) = v22;
      v32 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 224) = v32;
      *v32 = v0;
      v32[1] = sub_235F02FF0;
      return sub_235F12B2C();
    }
    else
    {
      sub_235F07A94(v19, v20 & 1);
      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
      {
        sub_235F07A5C(*(void **)(v0 + 64), *(_BYTE *)(v0 + 72));
        swift_release();
        swift_task_dealloc();
        return (*(uint64_t (**)(void *))(v0 + 8))(v19);
      }
      else
      {
        sub_235F07A94(v19, 0);
        v33 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 192) = v33;
        sub_235F0810C(0, (unint64_t *)&qword_256393D38);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256393D40);
        *v33 = v0;
        v33[1] = sub_235F02F0C;
        return sub_235F129F4();
      }
    }
  }
  return result;
}

uint64_t sub_235F02F0C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235F02F70()
{
  uint64_t v0;
  void *v1;
  unsigned __int8 v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 184);
  v2 = *(_BYTE *)(v0 + 74);
  sub_235F07A5C(v1, v2);
  sub_235F07A5C(v1, v2);
  v3 = *(_QWORD *)(v0 + 88);
  sub_235F07A5C(*(void **)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_235F02FF0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235F0304C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v1;
  sub_235F0810C(0, (unint64_t *)&qword_256393D38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393D40);
  *v1 = v0;
  v1[1] = sub_235F030E4;
  return sub_235F129F4();
}

uint64_t sub_235F030E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_235F03150()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = v0[20];
  v1 = v0[21];
  v4 = v0[17];
  v3 = v0[18];
  v5 = (void *)v0[10];
  v0[31] = v5;
  v6 = v5;
  v7 = swift_task_alloc();
  v0[32] = v7;
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v2;
  *(_QWORD *)(v7 + 32) = v1;
  *(_QWORD *)(v7 + 40) = v5;
  *(_BYTE *)(v7 + 48) = 1;
  *(_QWORD *)(v7 + 56) = v3;
  v8 = (_QWORD *)swift_task_alloc();
  v0[33] = v8;
  *v8 = v0;
  v8[1] = sub_235F03218;
  return sub_235F12B2C();
}

uint64_t sub_235F03218()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235F03274()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 248);
  swift_bridgeObjectRelease();

  swift_release();
  v2 = *(_QWORD *)(v0 + 248);
  sub_235F07A5C(*(void **)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_235F032F0()
{
  uint64_t v0;
  void *v1;
  unsigned __int8 v2;

  v1 = *(void **)(v0 + 184);
  v2 = *(_BYTE *)(v0 + 74);
  sub_235F07A5C(v1, v2);
  sub_235F07A5C(v1, v2);
  sub_235F07A5C(*(void **)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F03368()
{
  uint64_t v0;

  swift_release();
  sub_235F07A5C(*(void **)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_235F033C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  id v12;
  char v13;
  void *v14;
  unsigned __int8 v15;

  swift_beginAccess();
  v8 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_235F01370(a3, a4);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(v8 + 56) + 16 * v9;
      v12 = *(id *)v11;
      v13 = *(_BYTE *)(v11 + 8);
      sub_235F07A94(*(id *)v11, v13);
    }
    else
    {
      v12 = 0;
      v13 = -1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
    v13 = -1;
  }
  v14 = *(void **)a1;
  *(_QWORD *)a1 = v12;
  v15 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v13;
  sub_235F07A5C(v14, v15);
}

uint64_t sub_235F034A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_235F034C0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v6;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256393D20);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_235F129E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  *(_QWORD *)(v16 + 32) = v6;
  *(_QWORD *)(v16 + 40) = a1;
  *(_QWORD *)(v16 + 48) = a2;
  *(_BYTE *)(v16 + 56) = a3;
  *(double *)(v16 + 64) = a6;
  *(_QWORD *)(v16 + 72) = a4;
  *(_QWORD *)(v16 + 80) = a5;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235F03AB4((uint64_t)v14, (uint64_t)&unk_256393D50, v16);
  return swift_release();
}

uint64_t sub_235F035D0(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  v9[16] = a9;
  v9[17] = v18;
  v14 = sub_235F128C8();
  v9[18] = v14;
  v9[19] = *(_QWORD *)(v14 - 8);
  v9[20] = swift_task_alloc();
  v15 = sub_235F128EC();
  v9[21] = v15;
  v9[22] = *(_QWORD *)(v15 - 8);
  v9[23] = swift_task_alloc();
  v16 = (_QWORD *)swift_task_alloc();
  v9[24] = v16;
  *v16 = v9;
  v16[1] = sub_235F036A8;
  return sub_235F02900(a6, a7, a8, a1);
}

uint64_t sub_235F036A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 208) = a1;
  return swift_task_switch();
}

uint64_t sub_235F0371C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = (void *)v0[26];
  v2 = v0[23];
  v3 = v0[20];
  v13 = v0[22];
  v14 = v0[21];
  v4 = v0[18];
  v12 = v0[19];
  v6 = v0[16];
  v5 = v0[17];
  sub_235F0810C(0, &qword_256393E88);
  v7 = (void *)sub_235F12A54();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v5;
  v8[4] = v1;
  v0[12] = sub_235F08238;
  v0[13] = v8;
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_235F03A88;
  v0[11] = &block_descriptor_42;
  v9 = _Block_copy(v0 + 8);
  swift_retain();
  v10 = v1;
  sub_235F128E0();
  v0[15] = MEMORY[0x24BEE4AF8];
  sub_235F08178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393E98);
  sub_235F081C0();
  sub_235F12AA8();
  MEMORY[0x23B7E5820](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v14);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_235F038D0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = (void *)v0[25];
  v2 = v0[23];
  v3 = v0[20];
  v13 = v0[22];
  v14 = v0[21];
  v4 = v0[18];
  v12 = v0[19];
  v5 = v0[16];
  v6 = v0[17];
  sub_235F0810C(0, &qword_256393E88);
  v7 = (void *)sub_235F12A54();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v6;
  v8[4] = v1;
  v0[6] = sub_235F08170;
  v0[7] = v8;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_235F03A88;
  v0[5] = &block_descriptor_35;
  v9 = _Block_copy(v0 + 2);
  swift_retain();
  v10 = v1;
  sub_235F128E0();
  v0[14] = MEMORY[0x24BEE4AF8];
  sub_235F08178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393E98);
  sub_235F081C0();
  sub_235F12AA8();
  MEMORY[0x23B7E5820](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v14);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_235F03A88(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_235F03AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_235F129E8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_235F129DC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_235F01458(a1, &qword_256393D20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235F12994();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_235F03C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_235F129E8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_235F129DC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_235F01458(a1, &qword_256393D20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235F12994();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  sub_235F0810C(0, (unint64_t *)&qword_256393D38);
  return swift_task_create();
}

uint64_t sub_235F03D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  char *v24;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[6];

  v27 = a6;
  v31 = a5;
  v9 = sub_235F128EC();
  v32 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v30 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393EB0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_235F128C8();
  v28 = *(_QWORD *)(v15 - 8);
  v29 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256393BB8 != -1)
    swift_once();
  v26 = qword_256393D10;
  sub_235F128BC();
  v18 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  v19 = (*(unsigned __int8 *)(v12 + 80) + 49) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  *(_QWORD *)(v20 + 24) = a3;
  *(_QWORD *)(v20 + 32) = a4;
  v21 = v31;
  *(_QWORD *)(v20 + 40) = v31;
  v22 = v27 & 1;
  *(_BYTE *)(v20 + 48) = v27 & 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v20 + v19, v14, v11);
  aBlock[4] = sub_235F08320;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F03A88;
  aBlock[3] = &block_descriptor_51;
  v23 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_235F07A94(v21, v22);
  v24 = v30;
  sub_235F128E0();
  MEMORY[0x23B7E5820](0, v24, v17, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v33);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v29);
  swift_release();
  return swift_release();
}

uint64_t sub_235F03FF0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  uint64_t Strong;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v10 = Strong;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_235F07A94(a4, a5 & 1);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *(_QWORD *)(v10 + 16);
    *(_QWORD *)(v10 + 16) = 0x8000000000000000;
    sub_235F073A4((uint64_t)a4, a5 & 1, a2, a3, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v10 + 16) = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EB0);
  return sub_235F129AC();
}

uint64_t sub_235F04104(uint64_t a1, double a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;

  *(double *)(v8 + 72) = a2;
  *(_QWORD *)(v8 + 64) = a1;
  if ((a5 & 1) != 0)
  {
    v12 = swift_task_alloc();
    *(_QWORD *)(v8 + 80) = v12;
    *(_QWORD *)v12 = v8;
    *(_QWORD *)(v12 + 8) = sub_235F041B4;
    *(double *)(v12 + 56) = a2;
    *(_QWORD *)(v12 + 40) = a7;
    *(_QWORD *)(v12 + 48) = a8;
  }
  else
  {
    v13 = swift_task_alloc();
    *(_QWORD *)(v8 + 88) = v13;
    *(_QWORD *)v13 = v8;
    *(_QWORD *)(v13 + 8) = sub_235F0427C;
    *(double *)(v13 + 48) = a2;
    *(_QWORD *)(v13 + 32) = a7;
    *(_QWORD *)(v13 + 40) = a8;
  }
  return swift_task_switch();
}

uint64_t sub_235F041B4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  v4 = (_QWORD *)*v2;
  swift_task_dealloc();
  if (v1)
    return ((uint64_t (*)(void))v4[1])();
  else
    return swift_task_switch();
}

uint64_t sub_235F04228()
{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 24);
  v2 = *(uint64_t **)(v0 + 64);
  v3 = sub_235F02404(*(double *)(v0 + 72), *(double *)(v0 + 72));

  *v2 = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F0427C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)*v2;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = v1;
  v4 = (_QWORD *)*v2;
  swift_task_dealloc();
  if (v1)
    return ((uint64_t (*)(void))v4[1])();
  else
    return swift_task_switch();
}

uint64_t sub_235F042F0()
{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 48);
  v2 = *(uint64_t **)(v0 + 64);
  v3 = sub_235F02404(*(double *)(v0 + 72), *(double *)(v0 + 72));

  *v2 = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F04344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_235F129E8();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_235F129DC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_235F01458(a1, &qword_256393D20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235F12994();
    swift_unknownObjectRelease();
  }
LABEL_5:
  sub_235F0810C(0, (unint64_t *)&qword_256393D38);
  return swift_task_create();
}

void sub_235F04484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393F30);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v11 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v12 = objc_msgSend(v11, sel_sharedDeviceConnection);
  if (v12)
  {
    v13 = v12;
    v14 = (void *)sub_235F12934();
    aBlock[4] = sub_235F09770;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235F04B58;
    aBlock[3] = &block_descriptor_77;
    v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_fetchWatchAppBundleIDForCompanionAppBundleID_completion_, v14, v15);
    _Block_release(v15);
    swift_release();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235F04628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
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
  _QWORD aBlock[6];

  v28 = a6;
  v29 = a1;
  v31 = a4;
  v32 = a5;
  v30 = a2;
  v33 = sub_235F128C8();
  v36 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235F128EC();
  v34 = *(_QWORD *)(v8 - 8);
  v35 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393F30);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = sub_235F128D4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F0810C(0, &qword_256393E88);
  (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BEE5480], v14);
  v27 = sub_235F12A78();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v28, v11);
  v18 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v19 = (char *)swift_allocObject();
  v20 = v30;
  *((_QWORD *)v19 + 2) = v29;
  *((_QWORD *)v19 + 3) = v20;
  v21 = v32;
  *((_QWORD *)v19 + 4) = v31;
  *((_QWORD *)v19 + 5) = v21;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v19[v18], (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  aBlock[4] = sub_235F0984C;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F03A88;
  aBlock[3] = &block_descriptor_83;
  v22 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_235F128E0();
  v37 = MEMORY[0x24BEE4AF8];
  sub_235F08178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393E98);
  sub_235F081C0();
  v23 = v33;
  sub_235F12AA8();
  v24 = (void *)v27;
  MEMORY[0x23B7E5820](0, v10, v7, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v23);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v35);
  return swift_release();
}

void sub_235F04904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD aBlock[6];

  v16[1] = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393F30);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v10)
  {
    v11 = v10;
    if (!a2)
      swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = (void *)sub_235F12934();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v7);
    v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v14 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v13, (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    aBlock[4] = sub_235F098EC;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235F04B04;
    aBlock[3] = &block_descriptor_89;
    v15 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v11, sel_getIconForBundleID_iconVariant_block_timeout_, v12, 50, v15, 20.0);
    _Block_release(v15);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235F04AC0(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393F30);
  return sub_235F129AC();
}

void sub_235F04B04(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_235F04B58(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, uint64_t, void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    v5 = sub_235F12940();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_retain();
  v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235F04BD8(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
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
  _QWORD aBlock[6];

  v27 = a2;
  v28 = a3;
  v26 = a1;
  v29 = sub_235F128C8();
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235F128EC();
  v30 = *(_QWORD *)(v7 - 8);
  v31 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393F40);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = sub_235F128D4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F0810C(0, &qword_256393E88);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BEE5480], v13);
  v25 = sub_235F12A78();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v10);
  v17 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v18 = swift_allocObject();
  v19 = v28;
  *(_QWORD *)(v18 + 16) = v27;
  *(_QWORD *)(v18 + 24) = v19;
  *(double *)(v18 + 32) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v17, (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  aBlock[4] = sub_235F099B0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F03A88;
  aBlock[3] = &block_descriptor_100;
  v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_235F128E0();
  v33 = MEMORY[0x24BEE4AF8];
  sub_235F08178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393E98);
  sub_235F081C0();
  v21 = v29;
  sub_235F12AA8();
  v22 = (void *)v25;
  MEMORY[0x23B7E5820](0, v9, v6, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v21);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v31);
  return swift_release();
}

uint64_t sub_235F04EB0(double a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_235F12934();
  objc_msgSend(v2, sel__applicationIconImageForBundleIdentifier_format_scale_, v3, 2, a1);

  __swift_instantiateConcreteTypeFromMangledName(&qword_256393F40);
  return sub_235F129AC();
}

void sub_235F04F58(uint64_t a1, uint64_t a2, uint64_t a3, int a4, double a5, double a6)
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  _QWORD aBlock[6];

  v43 = a1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
  v45 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v45 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v44 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_bagSubProfile);
  if (v14)
  {
    v15 = v14;
    v41 = v11;
    v42 = a4;
    sub_235F12940();

    v16 = objc_msgSend(v13, sel_bagSubProfileVersion);
    if (v16)
    {
      v17 = v16;
      sub_235F12940();

      v18 = (void *)sub_235F12934();
      swift_bridgeObjectRelease();
      v19 = (void *)sub_235F12934();
      swift_bridgeObjectRelease();
      v20 = objc_msgSend((id)objc_opt_self(), sel_bagForProfile_profileVersion_, v18, v19);

      v21 = objc_allocWithZone(MEMORY[0x24BE08238]);
      v22 = v20;
      v40 = v22;
      v23 = (void *)sub_235F12934();
      v24 = (void *)sub_235F12934();
      v25 = objc_msgSend(v21, sel_initWithType_clientIdentifier_clientVersion_bag_, 0, v23, v24, v22);

      __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE8);
      v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_235F130F0;
      v27 = a2;
      *(_QWORD *)(v26 + 32) = a2;
      *(_QWORD *)(v26 + 40) = a3;
      swift_bridgeObjectRetain();
      v28 = (void *)sub_235F1297C();
      swift_bridgeObjectRelease();
      v39 = v25;
      objc_msgSend(v25, sel_setBundleIdentifiers_, v28);

      v29 = objc_msgSend(v25, sel_perform);
      v31 = v44;
      v30 = v45;
      v32 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v43, v41);
      v33 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
      v34 = (v12 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
      v35 = swift_allocObject();
      *(_QWORD *)(v35 + 16) = v27;
      *(_QWORD *)(v35 + 24) = a3;
      (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v35 + v33, v31, v32);
      *(double *)(v35 + v34) = a5;
      v36 = v35 + ((v34 + 15) & 0xFFFFFFFFFFFFFFF8);
      *(double *)v36 = a6;
      *(_BYTE *)(v36 + 8) = v42 & 1;
      aBlock[4] = sub_235F094D4;
      aBlock[5] = v35;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_235F065A0;
      aBlock[3] = &block_descriptor_65;
      v37 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      swift_release();
      objc_msgSend(v29, sel_addFinishBlock_, v37);
      _Block_release(v37);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_235F052F0(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6, double a7, double a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  id v48;
  _QWORD *v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  void *v59;
  double v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  char *v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  id v77;
  id v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  id v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 aBlock;
  __int128 v101;
  void (*v102)(uint64_t, unint64_t, int, void *);
  uint64_t v103;
  uint64_t v104[2];

  v95 = a6;
  v99 = a5;
  v97 = a3;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EF0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v17 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = sub_235F125A4();
  v96 = *(_QWORD *)(v94 - 8);
  v18 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v20 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v92 - v21;
  if (!a1)
    goto LABEL_14;
  v23 = objc_msgSend(a1, sel_responseDictionary);
  if (!v23)
    goto LABEL_14;
  v24 = v23;
  v25 = sub_235F12910();
  v98 = v13;
  v26 = v25;

  v27 = sub_235F05FB0(v26);
  v13 = v98;
  swift_bridgeObjectRelease();
  if (!v27)
    goto LABEL_14;
  if (!*(_QWORD *)(v27 + 16) || (v28 = sub_235F01370(1635017060, 0xE400000000000000), (v29 & 1) == 0))
  {
    aBlock = 0u;
    v101 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_235F013D4(*(_QWORD *)(v27 + 56) + 32 * v28, (uint64_t)&aBlock);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v101 + 1))
    goto LABEL_13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393F08);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_14;
  if (!*(_QWORD *)(v104[0] + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v93 = *(_QWORD **)(v104[0] + 32);
  swift_bridgeObjectRetain();
  v30 = v93;
  swift_bridgeObjectRelease();
  if (v30[2] && (v31 = sub_235F01370(0x7475626972747461, 0xEA00000000007365), (v32 & 1) != 0))
  {
    sub_235F013D4(v30[7] + 32 * v31, (uint64_t)&aBlock);
  }
  else
  {
    aBlock = 0u;
    v101 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v101 + 1))
    goto LABEL_13;
  v49 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_256393F10);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_14;
  v93 = v49;
  v50 = v104[0];
  if (*(_QWORD *)(v104[0] + 16) && (v51 = sub_235F01370(0xD000000000000012, 0x8000000235F14750), (v52 & 1) != 0))
  {
    sub_235F013D4(*(_QWORD *)(v50 + 56) + 32 * v51, (uint64_t)&aBlock);
  }
  else
  {
    aBlock = 0u;
    v101 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v101 + 1))
    goto LABEL_13;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_14;
  v53 = v104[0];
  if (*(_QWORD *)(v104[0] + 16) && (v54 = sub_235F01370(7565161, 0xE300000000000000), (v55 & 1) != 0))
  {
    sub_235F013D4(*(_QWORD *)(v53 + 56) + 32 * v54, (uint64_t)&aBlock);
  }
  else
  {
    aBlock = 0u;
    v101 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v101 + 1))
    goto LABEL_13;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_14;
  v56 = v104[0];
  if (*(_QWORD *)(v104[0] + 16) && (v57 = sub_235F01370(0x6B726F77747261, 0xE700000000000000), (v58 & 1) != 0))
  {
    sub_235F013D4(*(_QWORD *)(v56 + 56) + 32 * v57, (uint64_t)&aBlock);
  }
  else
  {
    aBlock = 0u;
    v101 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v101 + 1))
  {
LABEL_13:
    sub_235F01458((uint64_t)&aBlock, &qword_256393CA0);
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393F18);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v93 = objc_allocWithZone(MEMORY[0x24BE081F0]);
    v59 = (void *)sub_235F12904();
    swift_bridgeObjectRelease();
    v93 = objc_msgSend(v93, sel_initWithArtworkDictionary_, v59);

    v60 = a7 * a8;
    if ((v95 & 1) != 0)
    {
      if (qword_256393BC0 != -1)
        swift_once();
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_235F12940();
    }
    if ((~*(_QWORD *)&v60 & 0x7FF0000000000000) != 0)
    {
      if (v60 > -9.22337204e18)
      {
        if (v60 < 9.22337204e18)
        {
          v61 = sub_235F12934();
          swift_bridgeObjectRelease();
          v62 = (void *)v61;
          v63 = objc_msgSend(v93, sel_URLWithHeight_width_cropStyle_format_, (uint64_t)v60, (uint64_t)v60, v61, *MEMORY[0x24BE07E38]);

          if (v63)
          {
            sub_235F12598();

            v64 = v96;
            v65 = *(void (**)(char *, char *, uint64_t))(v96 + 32);
            v66 = v20;
            v67 = v94;
            v65(v17, v66, v94);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v64 + 56))(v17, 0, 1, v67);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v17, 1, v67) != 1)
            {
              v65(v22, v17, v67);
              v68 = objc_msgSend((id)objc_opt_self(), sel_ephemeralSessionConfiguration);
              v69 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v68);

              v70 = (void *)sub_235F1258C();
              v71 = v98;
              (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v99, v98);
              v72 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
              v73 = swift_allocObject();
              (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v73 + v72, (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v71);
              v102 = sub_235F095A0;
              v103 = v73;
              *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
              *((_QWORD *)&aBlock + 1) = 1107296256;
              *(_QWORD *)&v101 = sub_235F064F0;
              *((_QWORD *)&v101 + 1) = &block_descriptor_71;
              v74 = _Block_copy(&aBlock);
              swift_release();
              v75 = objc_msgSend(v69, sel_dataTaskWithURL_completionHandler_, v70, v74);
              _Block_release(v74);

              objc_msgSend(v75, sel_resume);
              (*(void (**)(char *, uint64_t))(v96 + 8))(v22, v67);
              return;
            }
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v96 + 56))(v17, 1, 1, v94);
          }
          sub_235F01458((uint64_t)v17, &qword_256393EF0);
          if (qword_256393C70 == -1)
            goto LABEL_60;
          goto LABEL_72;
        }
LABEL_71:
        __break(1u);
LABEL_72:
        swift_once();
LABEL_60:
        v76 = sub_235F128B0();
        __swift_project_value_buffer(v76, (uint64_t)qword_2563943B0);
        swift_bridgeObjectRetain();
        v77 = a2;
        swift_bridgeObjectRetain();
        v78 = a2;
        v79 = sub_235F12898();
        v80 = sub_235F12A24();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = swift_slowAlloc();
          v82 = swift_slowAlloc();
          v104[0] = v82;
          *(_DWORD *)v81 = 136315394;
          swift_bridgeObjectRetain();
          *(_QWORD *)&aBlock = sub_235F06A38(v97, a4, v104);
          sub_235F12A90();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v81 + 12) = 2080;
          if (a2)
          {
            swift_getErrorValue();
            v83 = Error.logOutput.getter();
            v85 = v84;
          }
          else
          {
            v83 = 0;
            v85 = 0;
          }
          *(_QWORD *)&aBlock = v83;
          *((_QWORD *)&aBlock + 1) = v85;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256393F00);
          v86 = sub_235F12A84();
          v88 = v87;
          swift_bridgeObjectRelease();
          *(_QWORD *)&aBlock = sub_235F06A38(v86, v88, v104);
          sub_235F12A90();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_235EFE000, v79, v80, "Failed to fetch icon from store for bundle id: %s: %s", (uint8_t *)v81, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x23B7E5D30](v82, -1, -1);
          MEMORY[0x23B7E5D30](v81, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();

        }
        v89 = (uint64_t)a2;
        if (!a2)
        {
          sub_235F09550();
          v89 = swift_allocError();
          *v90 = 0;
        }
        *(_QWORD *)&aBlock = v89;
        v91 = a2;
        sub_235F129A0();

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_71;
  }
LABEL_14:
  if (qword_256393C70 != -1)
    swift_once();
  v33 = sub_235F128B0();
  __swift_project_value_buffer(v33, (uint64_t)qword_2563943B0);
  swift_bridgeObjectRetain();
  v34 = a2;
  swift_bridgeObjectRetain();
  v35 = a2;
  v36 = sub_235F12898();
  v37 = sub_235F12A24();
  if (os_log_type_enabled(v36, v37))
  {
    v98 = v13;
    v38 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v104[0] = v39;
    *(_DWORD *)v38 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)&aBlock = sub_235F06A38(v97, a4, v104);
    sub_235F12A90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 2080;
    if (a2)
    {
      swift_getErrorValue();
      v40 = Error.logOutput.getter();
      v42 = v41;
    }
    else
    {
      v40 = 0;
      v42 = 0;
    }
    *(_QWORD *)&aBlock = v40;
    *((_QWORD *)&aBlock + 1) = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256393F00);
    v43 = sub_235F12A84();
    v45 = v44;
    swift_bridgeObjectRelease();
    *(_QWORD *)&aBlock = sub_235F06A38(v43, v45, v104);
    sub_235F12A90();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235EFE000, v36, v37, "Failed to fetch icon from store for bundle id: %s: %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E5D30](v39, -1, -1);
    MEMORY[0x23B7E5D30](v38, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v46 = (uint64_t)a2;
  if (!a2)
  {
    sub_235F09550();
    v46 = swift_allocError();
    *v47 = 0;
  }
  *(_QWORD *)&aBlock = v46;
  v48 = a2;
  sub_235F129A0();
}

unint64_t sub_235F05FB0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256393F20);
    v2 = (_QWORD *)sub_235F12B14();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_37;
      if (v13 >= v22)
      {
LABEL_33:
        sub_235F096E0();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v22)
          goto LABEL_33;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v22)
            goto LABEL_33;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v22)
              goto LABEL_33;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v22)
                goto LABEL_33;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_38;
                  if (v12 >= v22)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_235F096A4(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_235F013D4(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_235F096A4((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_235F01458((uint64_t)v30, &qword_256393F28);
      swift_bridgeObjectRelease();
      sub_235F096E0();
      swift_release();
      return 0;
    }
    sub_235F013D4((uint64_t)v31 + 8, (uint64_t)v25);
    sub_235F01458((uint64_t)v30, &qword_256393F28);
    sub_235F096E8(v25, v26);
    v27 = v24;
    sub_235F096E8(v26, v28);
    v16 = v27;
    sub_235F096E8(v28, v29);
    sub_235F096E8(v29, &v27);
    result = sub_235F01370(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      result = (unint64_t)sub_235F096E8(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_235F096E8(&v27, (_OWORD *)(v2[7] + 32 * result));
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_8:
    v7 = v12;
    v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void sub_235F06380(uint64_t a1, unint64_t a2, int a3, id a4)
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _BYTE *v10;
  id v11;
  _BYTE *v12;

  if (a2 >> 60 == 15)
  {
    if (!a4)
    {
      sub_235F09550();
      swift_allocError();
      a4 = 0;
      *v10 = 0;
    }
    v11 = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
    sub_235F129A0();
  }
  else
  {
    v6 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    sub_235F09660(a1, a2);
    v7 = (void *)sub_235F125B0();
    v8 = objc_msgSend(v6, sel_initWithData_, v7);

    if (v8)
    {
      v9 = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
      sub_235F129AC();
      sub_235F09608(a1, a2);

    }
    else
    {
      sub_235F09550();
      swift_allocError();
      *v12 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
      sub_235F129A0();
      sub_235F09608(a1, a2);
    }
  }
}

uint64_t sub_235F064F0(uint64_t a1, void *a2, void *a3, void *a4)
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
    v6 = (void *)sub_235F125BC();
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

  sub_235F09608((uint64_t)v6, v10);
  return swift_release();
}

void sub_235F065A0(uint64_t a1, void *a2, void *a3)
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

uint64_t AppIconImageProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AppIconImageProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

BOOL static AppIconImageProvider.IconFetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AppIconImageProvider.IconFetchError.hash(into:)()
{
  return sub_235F12BA4();
}

uint64_t AppIconImageProvider.IconFetchError.hashValue.getter()
{
  sub_235F12B98();
  sub_235F12BA4();
  return sub_235F12BB0();
}

BOOL sub_235F066D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_235F066F0()
{
  sub_235F12B98();
  sub_235F12BA4();
  return sub_235F12BB0();
}

uint64_t sub_235F06734()
{
  return sub_235F12BA4();
}

uint64_t sub_235F0675C()
{
  sub_235F12B98();
  sub_235F12BA4();
  return sub_235F12BB0();
}

void sub_235F067AC()
{
  qword_2563943A0 = 25187;
  *(_QWORD *)algn_2563943A8 = 0xE200000000000000;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id sub_235F067DC(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_235F12934();
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
    sub_235F12580();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_235F068B4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_235F068C4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_235F068F8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_235F0695C;
  return v6(a1);
}

uint64_t sub_235F0695C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_235F069A8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_235F069C8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_235F06A38(v6, v7, a3);
  v8 = *a1 + 8;
  sub_235F12A90();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_235F06A38(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235F06B08(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235F013D4((uint64_t)v12, *a3);
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
      sub_235F013D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_235F06B08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235F12A9C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235F06CC0(a5, a6);
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
  v8 = sub_235F12AD8();
  if (!v8)
  {
    sub_235F12AE4();
    __break(1u);
LABEL_17:
    result = sub_235F12B20();
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

uint64_t sub_235F06CC0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235F06D54(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235F06F2C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235F06F2C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235F06D54(uint64_t a1, unint64_t a2)
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
      v3 = sub_235F06EC8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235F12AC0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235F12AE4();
      __break(1u);
LABEL_10:
      v2 = sub_235F12970();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235F12B20();
    __break(1u);
LABEL_14:
    result = sub_235F12AE4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235F06EC8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EA8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235F06F2C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256393EA8);
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
  result = sub_235F12B20();
  __break(1u);
  return result;
}

_BYTE **sub_235F07078(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_235F07088(uint64_t a1, char a2)
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
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  uint64_t v37;
  int64_t v38;
  _QWORD *v39;
  char v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EB8);
  v40 = a2;
  v6 = sub_235F12B08();
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
    while (1)
    {
      if (v10)
      {
        v21 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v22 = v21 | (v13 << 6);
      }
      else
      {
        v23 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v38)
          goto LABEL_33;
        v24 = v39[v23];
        ++v13;
        if (!v24)
        {
          v13 = v23 + 1;
          if (v23 + 1 >= v38)
            goto LABEL_33;
          v24 = v39[v13];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v38)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v40 & 1) != 0)
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
            v24 = v39[v25];
            if (!v24)
            {
              while (1)
              {
                v13 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v13 >= v38)
                  goto LABEL_33;
                v24 = v39[v13];
                ++v25;
                if (v24)
                  goto LABEL_30;
              }
            }
            v13 = v25;
          }
        }
LABEL_30:
        v10 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v13 << 6);
      }
      v30 = 16 * v22;
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *v31;
      v32 = v31[1];
      v34 = *(_QWORD *)(v5 + 56) + v30;
      v35 = *(void **)v34;
      v36 = *(_BYTE *)(v34 + 8);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_235F07A94(v35, v36);
      }
      sub_235F12B98();
      sub_235F12958();
      result = sub_235F12BB0();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v16 == v27;
          if (v16 == v27)
            v16 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v29 == -1);
        v17 = __clz(__rbit64(~v29)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 16 * v17;
      v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
      *v19 = v33;
      v19[1] = v32;
      v20 = *(_QWORD *)(v7 + 56) + v18;
      *(_QWORD *)v20 = v35;
      *(_BYTE *)(v20 + 8) = v36;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_235F073A4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  int v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_235F01370(a3, a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_13;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_9;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_235F07548();
    goto LABEL_9;
  }
  sub_235F07088(v17, a5 & 1);
  v20 = sub_235F01370(a3, a4);
  if ((v18 & 1) != (v21 & 1))
  {
LABEL_13:
    sub_235F12B5C();
    __break(1u);
    return;
  }
  v14 = v20;
LABEL_9:
  v22 = a2 & 1;
  v23 = *v6;
  if ((v18 & 1) != 0)
  {
    v24 = v22 != 0;
    v25 = v23[7] + 16 * v14;
    sub_235F07A74(*(id *)v25, *(_BYTE *)(v25 + 8));
    *(_QWORD *)v25 = a1;
    *(_BYTE *)(v25 + 8) = v24;
  }
  else
  {
    sub_235F074F0(v14, a3, a4, a1, v22, v23);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_235F074F0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = a6[7] + 16 * result;
  *(_QWORD *)v7 = a4;
  *(_BYTE *)(v7 + 8) = a5 & 1;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

void *sub_235F07548()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  _QWORD *v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EB8);
  v2 = *v0;
  v3 = sub_235F12AFC();
  v4 = v3;
  v5 = *(_QWORD *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    v5 = *(_QWORD *)(v2 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v4 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
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
    v26 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v14)
      goto LABEL_26;
    v27 = *(_QWORD *)(v7 + 8 * v26);
    ++v10;
    if (!v27)
    {
      v10 = v26 + 1;
      if (v26 + 1 >= v14)
        goto LABEL_26;
      v27 = *(_QWORD *)(v7 + 8 * v10);
      if (!v27)
        break;
    }
LABEL_25:
    v13 = (v27 - 1) & v27;
    v16 = __clz(__rbit64(v27)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = *(_QWORD *)(v2 + 56);
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(void **)(v18 + v17);
    v23 = *(_BYTE *)(v18 + v17 + 8);
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v17);
    *v24 = v21;
    v24[1] = v20;
    v25 = *(_QWORD *)(v4 + 56) + v17;
    *(_QWORD *)v25 = v22;
    *(_BYTE *)(v25 + 8) = v23;
    swift_bridgeObjectRetain();
    result = sub_235F07A94(v22, v23);
  }
  v28 = v26 + 2;
  if (v28 >= v14)
    goto LABEL_26;
  v27 = *(_QWORD *)(v7 + 8 * v28);
  if (v27)
  {
    v10 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v27 = *(_QWORD *)(v7 + 8 * v10);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_235F07714(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_235F0777C;
  return v5(v2 + 16);
}

uint64_t sub_235F0777C()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_235F077CC(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256393F48);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_235F13100;
  v9 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  v10 = sub_235F099E8();
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  *(_QWORD *)(v8 + 96) = v9;
  *(_QWORD *)(v8 + 104) = v10;
  v11 = 0x656E6F685069;
  if ((a3 & 1) != 0)
    v11 = 0x6863746177;
  v12 = 0xE600000000000000;
  if ((a3 & 1) != 0)
    v12 = 0xE500000000000000;
  *(_QWORD *)(v8 + 64) = v10;
  *(_QWORD *)(v8 + 72) = v11;
  v13 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v8 + 80) = v12;
  v14 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v8 + 136) = v13;
  *(_QWORD *)(v8 + 144) = v14;
  *(double *)(v8 + 112) = a4;
  swift_bridgeObjectRetain();
  return sub_235F1294C();
}

uint64_t sub_235F078BC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_235F078E8()
{
  uint64_t *v0;

  sub_235F033C8(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_235F078F4()
{
  return swift_deallocObject();
}

uint64_t sub_235F07904()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_235F0793C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235F07970(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_QWORD *)(v1 + 56);
  v10 = *(double *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_235F07A10;
  return sub_235F04104(a1, v10, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_235F07A10()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_235F07A5C(void *a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_235F07A74(a1, a2 & 1);
}

void sub_235F07A74(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

uint64_t sub_235F07A80(uint64_t a1)
{
  uint64_t v1;

  return sub_235F03D60(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40), *(unsigned __int8 *)(v1 + 48));
}

id sub_235F07A94(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

uint64_t sub_235F07AA0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F07ADC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  double v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_BYTE *)(v1 + 56);
  v10 = *(double *)(v1 + 64);
  v11 = *(_QWORD *)(v1 + 72);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_235F07A10;
  return sub_235F035D0(v10, a1, v4, v5, v6, v7, v8, v9, v11);
}

unint64_t sub_235F07B8C()
{
  unint64_t result;

  result = qword_256393D58;
  if (!qword_256393D58)
  {
    result = MEMORY[0x23B7E5CC4](&protocol conformance descriptor for AppIconImageProvider.IconFetchError, &type metadata for AppIconImageProvider.IconFetchError);
    atomic_store(result, (unint64_t *)&qword_256393D58);
  }
  return result;
}

uint64_t type metadata accessor for AppIconImageProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for AppIconImageProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppIconImageProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AppIconImageProvider.fetchAppIcon(bundleID:isWatch:preferredWidth:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, double);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, double))(**(int **)(*(_QWORD *)v4 + 120)
                                                                  + *(_QWORD *)(*(_QWORD *)v4 + 120));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_235F07C88;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_235F07C88(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of AppIconImageProvider.fetchAppIcon(bundleID:isWatch:preferredWidth:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppIconImageProvider.IconFetchError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppIconImageProvider.IconFetchError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235F07DCC + 4 * byte_235F13115[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_235F07E00 + 4 * byte_235F13110[v4]))();
}

uint64_t sub_235F07E00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F07E08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235F07E10);
  return result;
}

uint64_t sub_235F07E1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235F07E24);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_235F07E28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F07E30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F07E3C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235F07E48(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppIconImageProvider.IconFetchError()
{
  return &type metadata for AppIconImageProvider.IconFetchError;
}

uint64_t initializeBufferWithCopyOfBuffer for AppIconImageProvider.AppIconCacheStatus(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_235F07A94(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void destroy for AppIconImageProvider.AppIconCacheStatus(uint64_t a1)
{
  sub_235F07A74(*(id *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for AppIconImageProvider.AppIconCacheStatus(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_235F07A94(*(id *)a2, v4);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_235F07A74(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for AppIconImageProvider.AppIconCacheStatus(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_235F07A74(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppIconImageProvider.AppIconCacheStatus(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppIconImageProvider.AppIconCacheStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_235F07FE4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_235F07FEC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppIconImageProvider.AppIconCacheStatus()
{
  return &type metadata for AppIconImageProvider.AppIconCacheStatus;
}

uint64_t sub_235F08008()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F0802C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_235F09A30;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256393E68 + dword_256393E68))(a1, v4);
}

uint64_t sub_235F0809C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_235F09A30;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256393E78 + dword_256393E78))(a1, v4);
}

uint64_t sub_235F0810C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235F08144()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235F08170()
{
  return sub_235F08240(1);
}

unint64_t sub_235F08178()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256393E90;
  if (!qword_256393E90)
  {
    v1 = sub_235F128C8();
    result = MEMORY[0x23B7E5CC4](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_256393E90);
  }
  return result;
}

unint64_t sub_235F081C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256393EA0;
  if (!qword_256393EA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256393E98);
    result = MEMORY[0x23B7E5CC4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256393EA0);
  }
  return result;
}

uint64_t sub_235F0820C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235F08238()
{
  return sub_235F08240(0);
}

uint64_t sub_235F08240(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 16))(*(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_235F08270()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235F08294()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393EB0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 49) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_bridgeObjectRelease();
  sub_235F07A74(*(id *)(v0 + 40), *(_BYTE *)(v0 + 48));
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_235F08320()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EB0);
  return sub_235F03FF0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(_BYTE *)(v0 + 48));
}

uint64_t sub_235F0835C(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v4;

  *(double *)(v4 + 56) = a4;
  *(_BYTE *)(v4 + 136) = a3;
  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_235F0837C()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  if (qword_256393C70 != -1)
    swift_once();
  v1 = sub_235F128B0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2563943B0);
  swift_bridgeObjectRetain_n();
  v2 = sub_235F12898();
  v3 = sub_235F12A24();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v0[6];
  if (v4)
  {
    v9 = v0[5];
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v10 = v7;
    *(_DWORD *)v6 = 136315394;
    v0[3] = sub_235F06A38(0xD000000000000034, 0x8000000235F146C0, &v10);
    sub_235F12A90();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[4] = sub_235F06A38(v9, v5, &v10);
    sub_235F12A90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235EFE000, v2, v3, "%s bundleID: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E5D30](v7, -1, -1);
    MEMORY[0x23B7E5D30](v6, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v0[8] = objc_opt_self();
  v0[9] = sub_235F129C4();
  v0[10] = sub_235F129B8();
  sub_235F12994();
  return swift_task_switch();
}

uint64_t sub_235F085CC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 64);
  swift_release();
  *(_QWORD *)(v0 + 88) = objc_msgSend(v1, sel_mainScreen);
  return swift_task_switch();
}

uint64_t sub_235F08628()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 96) = sub_235F129B8();
  sub_235F12994();
  return swift_task_switch();
}

uint64_t sub_235F08688()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 88);
  swift_release();
  objc_msgSend(v1, sel_scale);
  *(_QWORD *)(v0 + 104) = v2;

  return swift_task_switch();
}

uint64_t sub_235F086DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_BYTE *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v6;
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *(_QWORD *)(v6 + 32) = v2;
  *(_QWORD *)(v6 + 40) = v1;
  *(_BYTE *)(v6 + 48) = v3;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v7;
  sub_235F0810C(0, (unint64_t *)&qword_256393D38);
  *v7 = v0;
  v7[1] = sub_235F087BC;
  return sub_235F12B50();
}

uint64_t sub_235F087BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235F08828()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_235F08834()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F08868(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(double *)(v3 + 56) = a3;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a2;
  return swift_task_switch();
}

uint64_t sub_235F08884()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;

  if (qword_256393C70 != -1)
    swift_once();
  v1 = sub_235F128B0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2563943B0);
  swift_bridgeObjectRetain_n();
  v2 = sub_235F12898();
  v3 = sub_235F12A24();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v0[6];
  if (v4)
  {
    v13 = v0[5];
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v14 = v7;
    *(_DWORD *)v6 = 136315394;
    v0[3] = sub_235F06A38(0xD00000000000002BLL, 0x8000000235F14690, &v14);
    sub_235F12A90();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[4] = sub_235F06A38(v13, v5, &v14);
    sub_235F12A90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235EFE000, v2, v3, "%s bundleID: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E5D30](v7, -1, -1);
    MEMORY[0x23B7E5D30](v6, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v9 = v0[5];
  v8 = v0[6];
  v10 = swift_task_alloc();
  v0[8] = v10;
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v8;
  v11 = (_QWORD *)swift_task_alloc();
  v0[9] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393ED0);
  *v11 = v0;
  v11[1] = sub_235F08B04;
  return sub_235F12B2C();
}

uint64_t sub_235F08B04()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235F08B60()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_QWORD *)(v0 + 16))
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = sub_235F08BF0;
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v2 + 56) = *(_QWORD *)(v0 + 56);
  *(_BYTE *)(v2 + 136) = 1;
  *(_QWORD *)(v2 + 40) = v4;
  *(_QWORD *)(v2 + 48) = v3;
  return swift_task_switch();
}

uint64_t sub_235F08BF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_235F08C44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_235F08C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _BYTE *v9;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v4 = sub_235F067DC(v1, v2, 0);
  *(_QWORD *)(v0 + 40) = v4;
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_235F12934();
  v7 = objc_msgSend(v5, sel__sourceWithBundleIdentifier_name_productType_options_, v6, 0, 0, 0);
  *(_QWORD *)(v0 + 48) = v7;

  if (v7)
  {
    if ((v4 != 0) | objc_msgSend(v7, sel__hasFirstPartyBundleID) & 1)
    {
LABEL_3:
      *(_QWORD *)(v0 + 56) = objc_opt_self();
      *(_QWORD *)(v0 + 64) = sub_235F129C4();
      *(_QWORD *)(v0 + 72) = sub_235F129B8();
      sub_235F12994();
      return swift_task_switch();
    }
  }
  else if (v4)
  {
    goto LABEL_3;
  }
  sub_235F09550();
  swift_allocError();
  *v9 = 0;
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F08E10()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);
  swift_release();
  *(_QWORD *)(v0 + 80) = objc_msgSend(v1, sel_mainScreen);
  return swift_task_switch();
}

uint64_t sub_235F08E6C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 88) = sub_235F129B8();
  sub_235F12994();
  return swift_task_switch();
}

uint64_t sub_235F08ECC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 80);
  swift_release();
  objc_msgSend(v1, sel_scale);
  *(_QWORD *)(v0 + 96) = v2;

  return swift_task_switch();
}

uint64_t sub_235F08F20()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = v0[12];
  v3 = v0[3];
  v2 = v0[4];
  v4 = (_QWORD *)swift_task_alloc();
  v0[13] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  v5 = (_QWORD *)swift_task_alloc();
  v0[14] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393ED0);
  *v5 = v0;
  v5[1] = sub_235F08FE0;
  return sub_235F12B50();
}

uint64_t sub_235F08FE0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235F0904C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_235F09084()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F090C8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(double *)(v3 + 48) = a3;
  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_235F090E4()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  if (qword_256393C70 != -1)
    swift_once();
  v1 = sub_235F128B0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2563943B0);
  swift_bridgeObjectRetain_n();
  v2 = sub_235F12898();
  v3 = sub_235F12A24();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v0[5];
  if (v4)
  {
    v11 = v0[4];
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136315394;
    v0[2] = sub_235F06A38(0xD00000000000002BLL, 0x8000000235F147E0, &v12);
    sub_235F12A90();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_235F06A38(v11, v5, &v12);
    sub_235F12A90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235EFE000, v2, v3, "%s bundleID: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E5D30](v7, -1, -1);
    MEMORY[0x23B7E5D30](v6, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v8 = (_QWORD *)swift_task_alloc();
  v0[7] = v8;
  *v8 = v0;
  v8[1] = sub_235F09318;
  v9 = v0[5];
  v8[3] = v0[4];
  v8[4] = v9;
  return swift_task_switch();
}

uint64_t sub_235F09318(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (_QWORD *)*v2;
  v5 = (_QWORD *)*v2;
  swift_task_dealloc();
  if (v1)
  {

LABEL_3:
    v6 = swift_task_alloc();
    v4[8] = v6;
    *(_QWORD *)v6 = v5;
    *(_QWORD *)(v6 + 8) = sub_235F093DC;
    v8 = v4[4];
    v7 = v4[5];
    *(_QWORD *)(v6 + 56) = v4[6];
    *(_BYTE *)(v6 + 136) = 0;
    *(_QWORD *)(v6 + 40) = v8;
    *(_QWORD *)(v6 + 48) = v7;
    return swift_task_switch();
  }
  if (!a1)
    goto LABEL_3;
  return ((uint64_t (*)(uint64_t))v5[1])(a1);
}

uint64_t sub_235F093DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

void sub_235F09430(uint64_t a1)
{
  uint64_t v1;

  sub_235F04484(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_235F09438(uint64_t a1)
{
  uint64_t v1;

  sub_235F04F58(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 48), *(double *)(v1 + 32), *(double *)(v1 + 40));
}

uint64_t sub_235F09448()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_235F094D4(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_235F052F0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v2 + v6, *(unsigned __int8 *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(double *)(v2 + v7), *(double *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)));
}

unint64_t sub_235F09550()
{
  unint64_t result;

  result = qword_256393EF8;
  if (!qword_256393EF8)
  {
    result = MEMORY[0x23B7E5CC4](&protocol conformance descriptor for AppIconImageProvider.IconFetchError, &type metadata for AppIconImageProvider.IconFetchError);
    atomic_store(result, (unint64_t *)&qword_256393EF8);
  }
  return result;
}

uint64_t sub_235F09594()
{
  return objectdestroy_67Tm(&qword_256393EE0);
}

void sub_235F095A0(uint64_t a1, unint64_t a2, int a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
  sub_235F06380(a1, a2, a3, a4);
}

uint64_t sub_235F09608(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_235F0961C(a1, a2);
  return a1;
}

uint64_t sub_235F0961C(uint64_t a1, unint64_t a2)
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

uint64_t sub_235F09660(uint64_t a1, unint64_t a2)
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

uint64_t sub_235F096A4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_235F096E0()
{
  return swift_release();
}

_OWORD *sub_235F096E8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_235F096F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393F30);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_235F09770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256393F30) - 8) + 80);
  return sub_235F04628(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), v3 + ((v7 + 32) & ~v7));
}

uint64_t sub_235F097CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393F30);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_235F0984C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256393F30) - 8) + 80);
  sub_235F04904(v0[2], v0[3], v0[4], v0[5], (uint64_t)v0 + ((v1 + 48) & ~v1));
}

uint64_t sub_235F09884()
{
  return objectdestroy_67Tm(&qword_256393F30);
}

uint64_t objectdestroy_67Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_235F098EC(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393F30);
  return sub_235F04AC0(a1);
}

uint64_t sub_235F0992C(uint64_t a1)
{
  uint64_t v1;

  return sub_235F04BD8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(double *)(v1 + 32));
}

uint64_t sub_235F09938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393F40);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_235F099B0()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256393F40);
  return sub_235F04EB0(*(double *)(v0 + 32));
}

unint64_t sub_235F099E8()
{
  unint64_t result;

  result = qword_256393F50;
  if (!qword_256393F50)
  {
    result = MEMORY[0x23B7E5CC4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256393F50);
  }
  return result;
}

void sub_235F09A80()
{
  qword_256393F58 = 0x7373656E746946;
  unk_256393F60 = 0xE700000000000000;
}

uint64_t static FitnessAccessibilityIdentifier.base.getter()
{
  return sub_235F0071C(&qword_256393BC8, &qword_256393F58);
}

uint64_t sub_235F09AC4(uint64_t a1)
{
  return sub_235F0A1AC(a1, 0xD000000000000013, &qword_256393F68, 0x8000000235F14950, &qword_256393F70);
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.base.getter()
{
  return sub_235F0071C(&qword_256393BD0, &qword_256393F68);
}

uint64_t sub_235F09B0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_235F12AB4();
  if (qword_256393BD0 != -1)
    swift_once();
  v1 = qword_256393F68;
  v0 = qword_256393F70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_235F12964();
  qword_256393F78 = v1;
  unk_256393F80 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.accountSettingsButton.getter()
{
  return sub_235F0071C(&qword_256393BD8, &qword_256393F78);
}

uint64_t sub_235F09BE4(uint64_t a1)
{
  return sub_235F09C48(a1, 0x73676E69722ELL, 0xE600000000000000, &qword_256393F88, &qword_256393F90);
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.rings.getter()
{
  return sub_235F0071C(&qword_256393BE0, &qword_256393F88);
}

uint64_t sub_235F09C24(uint64_t a1)
{
  return sub_235F09C48(a1, 0x65636E616C61622ELL, 0xE800000000000000, &qword_256393F98, &qword_256393FA0);
}

uint64_t sub_235F09C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  if (qword_256393BD0 != -1)
    swift_once();
  v8 = qword_256393F68;
  v9 = qword_256393F70;
  swift_bridgeObjectRetain();
  result = sub_235F12964();
  *a4 = v8;
  *a5 = v9;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.balance.getter()
{
  return sub_235F0071C(&qword_256393BE8, &qword_256393F98);
}

uint64_t sub_235F09D00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_235F12AB4();
  if (qword_256393BD0 != -1)
    swift_once();
  v1 = qword_256393F68;
  v0 = qword_256393F70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_235F12964();
  qword_256393FA8 = v1;
  unk_256393FB0 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.fitnessPlusUpNext.getter()
{
  return sub_235F0071C(&qword_256393BF0, &qword_256393FA8);
}

uint64_t sub_235F09DD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_235F12AB4();
  if (qword_256393BD0 != -1)
    swift_once();
  v1 = qword_256393F68;
  v0 = qword_256393F70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_235F12964();
  qword_256393FB8 = v1;
  unk_256393FC0 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.editSummaryButton.getter()
{
  return sub_235F0071C(&qword_256393BF8, &qword_256393FB8);
}

uint64_t sub_235F09EB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_235F12AB4();
  if (qword_256393BD0 != -1)
    swift_once();
  v1 = qword_256393F68;
  v0 = qword_256393F70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_235F12964();
  qword_256393FC8 = v1;
  unk_256393FD0 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.plusSignButton.getter()
{
  return sub_235F0071C(&qword_256393C00, &qword_256393FC8);
}

uint64_t sub_235F09F90(uint64_t a1)
{
  return sub_235F09C48(a1, 0x747542656E6F642ELL, 0xEB000000006E6F74, &qword_256393FD8, &qword_256393FE0);
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.doneButton.getter()
{
  return sub_235F0071C(&qword_256393C08, &qword_256393FD8);
}

uint64_t sub_235F09FDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_235F12AB4();
  if (qword_256393BD0 != -1)
    swift_once();
  v1 = qword_256393F68;
  v0 = qword_256393F70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_235F12964();
  qword_256393FE8 = v1;
  unk_256393FF0 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.seeAllCategoriesButton.getter()
{
  return sub_235F0071C(&qword_256393C10, &qword_256393FE8);
}

void sub_235F0A0B4()
{
  strcpy((char *)&qword_256393FF8, "DeleteButton");
  unk_256394005 = 0;
  unk_256394006 = -5120;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.deleteButton.getter()
{
  return sub_235F0071C(&qword_256393C18, &qword_256393FF8);
}

void sub_235F0A100()
{
  qword_256394008 = 0x7474754274696445;
  unk_256394010 = 0xEA00000000006E6FLL;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.editButton.getter()
{
  return sub_235F0071C(&qword_256393C20, &qword_256394008);
}

void sub_235F0A148()
{
  qword_256394018 = 1954047316;
  unk_256394020 = 0xE400000000000000;
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.text.getter()
{
  return sub_235F0071C(&qword_256393C28, &qword_256394018);
}

uint64_t sub_235F0A184(uint64_t a1)
{
  return sub_235F0A1AC(a1, 0xD000000000000025, &qword_256394028, 0x8000000235F148A0, &qword_256394030);
}

uint64_t sub_235F0A1AC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;

  if (qword_256393BC8 != -1)
    result = swift_once();
  *a3 = a2;
  *a5 = a4;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView.base.getter()
{
  return sub_235F0071C(&qword_256393C30, &qword_256394028);
}

uint64_t sub_235F0A22C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_235F12AB4();
  if (qword_256393C30 != -1)
    swift_once();
  v1 = qword_256394028;
  v0 = qword_256394030;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_235F12964();
  qword_256394038 = v1;
  unk_256394040 = v0;
  return result;
}

uint64_t static FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView.addOrSwapButton.getter()
{
  return sub_235F0071C(&qword_256393C38, &qword_256394038);
}

uint64_t static FitnessAccessibilityIdentifier.build(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393C78);
  sub_235F007FC();
  return sub_235F1291C();
}

ValueMetadata *type metadata accessor for FitnessAccessibilityIdentifier()
{
  return &type metadata for FitnessAccessibilityIdentifier;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityIdentifier.SummaryView()
{
  return &type metadata for FitnessAccessibilityIdentifier.SummaryView;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView()
{
  return &type metadata for FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView;
}

uint64_t FitnessPlusSessionProvider.__allocating_init(healthStore:)(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  FitnessPlusSessionProvider.init(healthStore:)(a1);
  return v2;
}

id FitnessPlusSessionProvider.init(healthStore:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8[2];

  v2 = v1;
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD4250]), sel_initWithHealthStore_, a1);
  if (result)
  {
    v5 = result;
    sub_235F0810C(0, &qword_256393E88);
    v6 = (void *)sub_235F12A54();
    v7 = _s11SeymourCore12DependenciesC10ActivityUIE08activityE05queue18wheelchairUseCacheACSo012OS_dispatch_G0C_So013_HKWheelchairi14CharacteristicJ0CtFZ_0((uint64_t)v6, v5);

    *(_QWORD *)(v2 + 16) = v7;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256393CE8);
    sub_235F125EC();
    swift_release();
    sub_235F0F270(v8, v2 + 24);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256394048);
    sub_235F125EC();
    swift_release();
    sub_235F0F270(v8, v2 + 64);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256393D00);
    sub_235F125EC();
    swift_release();

    sub_235F0F270(v8, v2 + 104);
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_235F0A524(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
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
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t (**v28)(uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t (**v41)(void **);
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t (**v55)(void *);
  id v56;
  char *v57;
  void (*v58)(char *, uint64_t);
  void (*v59)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v60;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  __int128 v76[3];

  v66 = a2;
  v67 = a3;
  v65 = a1;
  v73 = *v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394050);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v62 - v12;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394058);
  v14 = *(_QWORD *)(v64 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  v16 = MEMORY[0x24BDAC7A8](v64);
  v63 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v74 = (char *)&v62 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394060);
  v70 = *(_QWORD *)(v18 - 8);
  v71 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v68 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v75 = (char *)&v62 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v72 = (char *)&v62 - v23;
  sub_235F0C7F4(a1, (uint64_t)v13);
  sub_235F019E4((uint64_t)(v4 + 3), (uint64_t)v76);
  v24 = swift_allocObject();
  sub_235F0F270(v76, v24 + 16);
  *(double *)(v24 + 56) = a4;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v25 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v26 = (v9 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v27 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v27 + v25, v11, v7);
  v28 = (uint64_t (**)(uint64_t))(v27 + v26);
  *v28 = sub_235F0F2AC;
  v28[1] = (uint64_t (*)(uint64_t))v24;
  sub_235F0810C(0, (unint64_t *)&qword_256393D38);
  v29 = v74;
  sub_235F1270C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  v30 = swift_allocObject();
  v32 = v66;
  v31 = v67;
  *(_QWORD *)(v30 + 16) = v66;
  *(_QWORD *)(v30 + 24) = v31;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = sub_235F0F2E8;
  *(_QWORD *)(v33 + 24) = v30;
  v34 = v14;
  v35 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v36 = v63;
  v37 = v64;
  v35(v63, v29, v64);
  v38 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v39 = (v15 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v40 + v38, v36, v37);
  v41 = (uint64_t (**)(void **))(v40 + v39);
  *v41 = sub_235F0F318;
  v41[1] = (uint64_t (*)(void **))v33;
  v42 = v31;
  swift_retain();
  v43 = v75;
  sub_235F1270C();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v74, v37);
  v44 = (_QWORD *)swift_allocObject();
  v45 = v65;
  v44[2] = v65;
  v44[3] = v32;
  v46 = v73;
  v44[4] = v42;
  v44[5] = v46;
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = sub_235F0F380;
  *(_QWORD *)(v47 + 24) = v44;
  v48 = v70;
  v49 = v71;
  v50 = v68;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v68, v43, v71);
  v51 = v48;
  v52 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  v53 = (v69 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  v54 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v51 + 32))(v54 + v52, v50, v49);
  v55 = (uint64_t (**)(void *))(v54 + v53);
  *v55 = sub_235F0F39C;
  v55[1] = (uint64_t (*)(void *))v47;
  swift_retain();
  v56 = v45;
  v57 = v72;
  sub_235F1270C();
  v58 = *(void (**)(char *, uint64_t))(v51 + 8);
  v58(v75, v49);
  v59 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_235F12724();
  v60 = swift_allocObject();
  *(_QWORD *)(v60 + 16) = 0;
  *(_QWORD *)(v60 + 24) = 0;
  v59(sub_235F0F3B8, v60);
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v58)(v57, v49);
}

uint64_t sub_235F0AA00(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;

  v3 = sub_235F126E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235F1267C();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235F126F4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F1261C();
  sub_235F12670();
  sub_235F0FFDC((uint64_t)v9);
  sub_235F126DC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_235F12814();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_235F0AB70(void *a1, void *a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t (*v25)(_QWORD, _QWORD);
  uint64_t v26;

  if (qword_256393C70 != -1)
    swift_once();
  v6 = sub_235F128B0();
  __swift_project_value_buffer(v6, (uint64_t)qword_2563943B0);
  v7 = a2;
  v8 = a1;
  v9 = v7;
  v10 = a1;
  v11 = sub_235F12898();
  v12 = sub_235F12A18();
  if (os_log_type_enabled(v11, v12))
  {
    v25 = a3;
    v13 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v13 = 136315650;
    v14 = sub_235F12BBC();
    sub_235F06A38(v14, v15, &v26);
    sub_235F12A90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    v16 = objc_msgSend(v9, sel_description);
    v17 = sub_235F12940();
    v19 = v18;

    sub_235F06A38(v17, v19, &v26);
    sub_235F12A90();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 22) = 2080;
    swift_getErrorValue();
    v20 = Error.logOutput.getter();
    sub_235F06A38(v20, v21, &v26);
    sub_235F12A90();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235EFE000, v11, v12, "%s: Failed to fetch image for %s: %s.", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B7E5D30](v24, -1, -1);
    v22 = v13;
    a3 = v25;
    MEMORY[0x23B7E5D30](v22, -1, -1);

  }
  else
  {

  }
  return a3(a1, 1);
}

uint64_t sub_235F0AE4C(void *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t (**v30)();
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t (**v41)(uint64_t);
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t (**v55)(void *);
  id v56;
  char *v57;
  void (*v58)(char *, uint64_t);
  void (*v59)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v60;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  void *v76;
  __int128 v77[2];
  __int128 v78[3];

  v66 = a3;
  v67 = a2;
  v76 = a1;
  v73 = *v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394050);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v62 - v13;
  v65 = __swift_instantiateConcreteTypeFromMangledName(qword_256394068);
  v15 = *(_QWORD *)(v65 - 8);
  v64 = *(_QWORD *)(v15 + 64);
  v16 = MEMORY[0x24BDAC7A8](v65);
  v63 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v74 = (char *)&v62 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394060);
  v70 = *(_QWORD *)(v19 - 8);
  v71 = v19;
  v69 = *(_QWORD *)(v70 + 64);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v68 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v75 = (char *)&v62 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v72 = (char *)&v62 - v24;
  v25 = swift_allocObject();
  swift_weakInit();
  sub_235F019E4((uint64_t)(v5 + 13), (uint64_t)v78);
  sub_235F019E4((uint64_t)(v5 + 3), (uint64_t)v77);
  v26 = swift_allocObject();
  sub_235F0F270(v78, v26 + 16);
  sub_235F0F270(v77, v26 + 56);
  *(double *)(v26 + 96) = a4;
  *(_QWORD *)(v26 + 104) = v25;
  *(double *)(v26 + 112) = a5;
  sub_235F0C7F4(v76, (uint64_t)v14);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = sub_235F0F414;
  *(_QWORD *)(v27 + 24) = v26;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  v28 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v29 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v29 + v28, v12, v8);
  v30 = (uint64_t (**)())(v29 + ((v10 + v28 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v30 = sub_235F0F42C;
  v30[1] = (uint64_t (*)())v27;
  swift_retain();
  v31 = v74;
  sub_235F1270C();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v32 = swift_allocObject();
  v33 = v67;
  v34 = v66;
  *(_QWORD *)(v32 + 16) = v67;
  *(_QWORD *)(v32 + 24) = v34;
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = sub_235F0F47C;
  *(_QWORD *)(v35 + 24) = v32;
  v36 = v63;
  v37 = v65;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v63, v31, v65);
  v38 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v39 = (v64 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v40 + v38, v36, v37);
  v41 = (uint64_t (**)(uint64_t))(v40 + v39);
  *v41 = sub_235F0F494;
  v41[1] = (uint64_t (*)(uint64_t))v35;
  v42 = v34;
  swift_retain();
  v64 = MEMORY[0x24BEE4AE0] + 8;
  v43 = v75;
  sub_235F1270C();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v74, v37);
  v44 = (_QWORD *)swift_allocObject();
  v45 = v76;
  v44[2] = v76;
  v44[3] = v33;
  v46 = v73;
  v44[4] = v42;
  v44[5] = v46;
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = sub_235F0F4FC;
  *(_QWORD *)(v47 + 24) = v44;
  v48 = v70;
  v49 = v71;
  v50 = v68;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v68, v43, v71);
  v51 = v48;
  v52 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  v53 = (v69 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  v54 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v51 + 32))(v54 + v52, v50, v49);
  v55 = (uint64_t (**)(void *))(v54 + v53);
  *v55 = sub_235F10A04;
  v55[1] = (uint64_t (*)(void *))v47;
  swift_retain();
  v56 = v45;
  v57 = v72;
  sub_235F1270C();
  v58 = *(void (**)(char *, uint64_t))(v51 + 8);
  v58(v75, v49);
  v59 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_235F12724();
  v60 = swift_allocObject();
  *(_QWORD *)(v60 + 16) = 0;
  *(_QWORD *)(v60 + 24) = 0;
  v59(sub_235F0F3B8, v60);
  swift_release();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v58)(v57, v49);
}

uint64_t sub_235F0B3D4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D1>)
{
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t (**v45)(void **);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t (**v56)(uint64_t *);
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  void *v67;
  char *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t (**v78)(uint64_t);
  void (*v79)(char *, uint64_t);
  _QWORD v81[2];
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;

  v98 = a3;
  v105 = a5;
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394190);
  v85 = *(_QWORD *)(v86 - 8);
  v10 = MEMORY[0x24BDAC7A8](v86);
  v83 = (char *)v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v84 = (uint64_t)v81 - v12;
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394058);
  v92 = *(_QWORD **)(v93 - 8);
  v97 = v92[8];
  v13 = MEMORY[0x24BDAC7A8](v93);
  v91 = (char *)v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v90 = (char *)v81 - v15;
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394060);
  v107 = *(_QWORD *)(v104 - 8);
  v16 = MEMORY[0x24BDAC7A8](v104);
  v102 = (char *)v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v103 = (char *)v81 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v95 = (char *)v81 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v106 = (char *)v81 - v23;
  v101 = v24;
  MEMORY[0x24BDAC7A8](v22);
  v108 = (char *)v81 - v25;
  v88 = sub_235F126E8();
  v87 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v27 = (char *)v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_235F1267C();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)v81 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_235F126F4();
  v99 = *(_QWORD *)(v31 - 8);
  v100 = v31;
  MEMORY[0x24BDAC7A8](v31);
  v33 = (_QWORD *)((char *)v81 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  v89 = a4 + 16;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_235F12628();
  v96 = sub_235F127D8();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_235F12610();
  v94 = sub_235F127D8();
  swift_bridgeObjectRelease();
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = 0;
  v35 = (_QWORD *)swift_allocObject();
  v35[3] = 0;
  v35[4] = 0;
  v35[2] = 0;
  v81[1] = a1;
  sub_235F1261C();
  sub_235F12670();
  sub_235F0FFDC((uint64_t)v30);
  sub_235F126DC();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v27, v88);
  __swift_project_boxed_opaque_existential_1(v98, v98[3]);
  v36 = v90;
  v98 = v33;
  sub_235F12814();
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = sub_235F103BC;
  *(_QWORD *)(v37 + 24) = v34;
  v38 = v92;
  v39 = v91;
  v40 = v93;
  ((void (*)(char *, char *, uint64_t))v92[2])(v91, v36, v93);
  v41 = v38;
  v42 = (*((unsigned __int8 *)v38 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v38 + 80);
  v43 = (v97 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
  v44 = swift_allocObject();
  ((void (*)(unint64_t, char *, uint64_t))v41[4])(v44 + v42, v39, v40);
  v45 = (uint64_t (**)(void **))(v44 + v43);
  *v45 = sub_235F10A08;
  v45[1] = (uint64_t (*)(void **))v37;
  v97 = v34;
  swift_retain();
  v46 = MEMORY[0x24BEE4AE0] + 8;
  sub_235F1270C();
  ((void (*)(char *, uint64_t))v41[1])(v36, v40);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v47 = v84;
    sub_235F0CE90(v84, a6);
    v48 = swift_allocObject();
    *(_QWORD *)(v48 + 16) = sub_235F104F8;
    *(_QWORD *)(v48 + 24) = v35;
    v49 = v85;
    v50 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 16);
    v93 = v46;
    v51 = v83;
    v52 = v86;
    v50(v83, v47, v86);
    v53 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v54 = (v82 + v53 + 7) & 0xFFFFFFFFFFFFFFF8;
    v55 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v55 + v53, v51, v52);
    v56 = (uint64_t (**)(uint64_t *))(v55 + v54);
    *v56 = sub_235F10510;
    v56[1] = (uint64_t (*)(uint64_t *))v48;
    swift_retain();
    v57 = v95;
    sub_235F1270C();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v52);
  }
  else
  {
    v57 = v95;
    sub_235F12730();
  }
  v59 = v106;
  v58 = v107;
  v95 = *(char **)(v107 + 32);
  v60 = v104;
  ((void (*)(char *, char *, uint64_t))v95)(v106, v57, v104);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563941D0);
  v61 = *(_QWORD *)(v58 + 72);
  v62 = *(unsigned __int8 *)(v58 + 80);
  v63 = v58;
  v93 = v62 | 7;
  v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_235F130C0;
  v65 = v64 + ((v62 + 32) & ~v62);
  v66 = *(_QWORD **)(v63 + 16);
  v92 = v66;
  ((void (*)(uint64_t, char *, uint64_t))v66)(v65, v108, v60);
  ((void (*)(uint64_t, char *, uint64_t))v66)(v65 + v61, v59, v60);
  v109 = v64;
  sub_235F0810C(0, &qword_256393E88);
  v67 = (void *)sub_235F12A54();
  sub_235F12880();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563941D8);
  sub_235F10404();
  v68 = v103;
  sub_235F12700();

  swift_bridgeObjectRelease();
  v69 = (_QWORD *)swift_allocObject();
  v70 = v97;
  v71 = v94;
  v69[2] = v96;
  v69[3] = v71;
  v69[4] = v70;
  v69[5] = v35;
  v72 = swift_allocObject();
  *(_QWORD *)(v72 + 16) = sub_235F1048C;
  *(_QWORD *)(v72 + 24) = v69;
  v73 = swift_allocObject();
  *(_QWORD *)(v73 + 16) = sub_235F10498;
  *(_QWORD *)(v73 + 24) = v72;
  v74 = v102;
  ((void (*)(char *, char *, uint64_t))v92)(v102, v68, v60);
  v75 = (v62 + 16) & ~v62;
  v76 = (v101 + v75 + 7) & 0xFFFFFFFFFFFFFFF8;
  v77 = swift_allocObject();
  ((void (*)(uint64_t, char *, uint64_t))v95)(v77 + v75, v74, v60);
  v78 = (uint64_t (**)(uint64_t))(v77 + v76);
  *v78 = sub_235F104C0;
  v78[1] = (uint64_t (*)(uint64_t))v73;
  swift_retain();
  swift_retain();
  sub_235F1270C();
  v79 = *(void (**)(char *, uint64_t))(v107 + 8);
  v79(v68, v60);
  v79(v106, v60);
  v79(v108, v60);
  (*(void (**)(_QWORD *, uint64_t))(v99 + 8))(v98, v100);
  swift_release();
  return swift_release();
}

void sub_235F0BC88(void **a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v3;
  v5 = v3;

}

void sub_235F0BCE4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = *a1;
  v3 = a1[1];
  v5 = (void *)a1[2];
  swift_beginAccess();
  v6 = a2[2];
  v7 = a2[3];
  v8 = (void *)a2[4];
  a2[2] = v4;
  a2[3] = v3;
  a2[4] = v5;
  swift_bridgeObjectRetain();
  v9 = v5;
  sub_235F1026C(v6, v7, v8);
}

id sub_235F0BD70@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X8>)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  swift_beginAccess();
  v10 = *(void **)(a3 + 16);
  swift_beginAccess();
  v11 = a4[2];
  v12 = a4[3];
  v13 = (void *)a4[4];
  *a5 = a1;
  a5[1] = a2;
  a5[2] = v10;
  a5[3] = v11;
  a5[4] = v12;
  a5[5] = v13;
  v14 = v10;
  v15 = a1;
  v16 = a2;
  return sub_235F0F5A8(v11, v12, v13);
}

void sub_235F0BE1C(uint64_t a1, void (*a2)(id *))
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11[6];
  char v12;

  v3 = *(void **)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  v5 = *(void **)(a1 + 24);
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11[0] = *(id *)a1;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v12 = 0;
  v8 = v4;
  v9 = v11[0];
  v10 = v3;
  sub_235F0F5A8((uint64_t)v5, (uint64_t)v6, v7);
  a2(v11);

  sub_235F1026C((uint64_t)v5, (uint64_t)v6, v7);
}

void sub_235F0BED4(void *a1, void *a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void (*v25)(_QWORD);
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  if (qword_256393C70 != -1)
    swift_once();
  v6 = sub_235F128B0();
  __swift_project_value_buffer(v6, (uint64_t)qword_2563943B0);
  v7 = a2;
  v8 = a1;
  v9 = v7;
  v10 = a1;
  v11 = sub_235F12898();
  v12 = sub_235F12A18();
  if (os_log_type_enabled(v11, v12))
  {
    v25 = a3;
    v13 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v13 = 136315650;
    v14 = sub_235F12BBC();
    v31 = sub_235F06A38(v14, v15, &v26);
    sub_235F12A90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    v16 = objc_msgSend(v9, sel_description);
    v17 = sub_235F12940();
    v19 = v18;

    v31 = sub_235F06A38(v17, v19, &v26);
    sub_235F12A90();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 22) = 2080;
    swift_getErrorValue();
    v20 = Error.logOutput.getter();
    v31 = sub_235F06A38(v20, v21, &v26);
    sub_235F12A90();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235EFE000, v11, v12, "%s: Failed to fetch session information for %s: %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B7E5D30](v24, -1, -1);
    v22 = v13;
    a3 = v25;
    MEMORY[0x23B7E5D30](v22, -1, -1);

  }
  else
  {

  }
  v26 = (uint64_t)a1;
  v27 = 0u;
  v28 = 0u;
  v29 = 0;
  v30 = 1;
  v23 = a1;
  a3(&v26);

}

uint64_t sub_235F0C1D4(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 40) = v2;
  *(double *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 24) = a1;
  return swift_task_switch();
}

uint64_t sub_235F0C1F4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = v0[5];
  v2 = v0[4];
  v3 = v0[3];
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  sub_235F0810C(0, (unint64_t *)&qword_256393D38);
  *v5 = v0;
  v5[1] = sub_235F0C2C4;
  return sub_235F12B50();
}

uint64_t sub_235F0C2C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235F0C330()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F0C364(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_235F0A524(a4, (uint64_t)sub_235F100EC, v11, a2);
  return swift_release();
}

uint64_t sub_235F0C458(void *a1, char a2)
{
  id v2;
  id v4;

  if ((a2 & 1) != 0)
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
    return sub_235F129A0();
  }
  else
  {
    v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
    return sub_235F129AC();
  }
}

uint64_t sub_235F0C4C4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 48) = v4;
  *(double *)(v5 + 32) = a3;
  *(double *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_235F0C4E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = v0[6];
  v3 = v0[4];
  v2 = v0[5];
  v4 = v0[3];
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  v5[2] = v1;
  v5[3] = v4;
  v5[4] = v3;
  v5[5] = v2;
  v6 = (_QWORD *)swift_task_alloc();
  v0[8] = v6;
  *v6 = v0;
  v6[1] = sub_235F0C59C;
  return sub_235F12B50();
}

uint64_t sub_235F0C59C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_235F0C610()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F0C644(uint64_t a1, double a2, double a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563941B8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  sub_235F0AE4C(a5, (uint64_t)sub_235F100A0, v13, a2, a3);
  return swift_release();
}

uint64_t sub_235F0C740(uint64_t a1)
{
  void *v1;
  id v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v1 = *(void **)a1;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563941B8);
    return sub_235F129A0();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 24);
    v7 = *(void **)(a1 + 8);
    v8 = *(id *)(a1 + 16);
    v9 = v1;
    v10 = v7;
    sub_235F0F5A8(v6, v5, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563941B8);
    return sub_235F129AC();
  }
}

uint64_t sub_235F0C7F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t (**v28)(uint64_t *);
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;

  v45 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563941E8);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v42 - v8;
  v10 = sub_235F126D0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(a1, sel_metadata);
  if (!v14)
  {
    v47 = 0u;
    v48 = 0u;
    goto LABEL_9;
  }
  v15 = v14;
  v43 = v3;
  v16 = sub_235F12910();

  v17 = sub_235F1288C();
  if (!*(_QWORD *)(v16 + 16) || (v19 = sub_235F01370(v17, v18), (v20 & 1) == 0))
  {
    v47 = 0u;
    v48 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_235F013D4(*(_QWORD *)(v16 + 56) + 32 * v19, (uint64_t)&v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v48 + 1))
  {
LABEL_9:
    sub_235F01458((uint64_t)&v47, &qword_256393CA0);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_235F126C4();
    v21 = v44 + 8;
    v22 = v44[11];
    v44 = (_QWORD *)v44[12];
    v42 = __swift_project_boxed_opaque_existential_1(v21, v22);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563941F0);
    v23 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_235F130F0;
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 16))(v24 + v23, v13, v10);
    sub_235F12844();
    swift_bridgeObjectRelease();
    v25 = v43;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v43);
    v26 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v27 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v27 + v26, v7, v25);
    v28 = (uint64_t (**)(uint64_t *))(v27 + ((v5 + v26 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v28 = sub_235F0CE88;
    v28[1] = 0;
    sub_235F12634();
    sub_235F1270C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
LABEL_10:
  if (qword_256393C70 != -1)
    swift_once();
  v30 = sub_235F128B0();
  __swift_project_value_buffer(v30, (uint64_t)qword_2563943B0);
  v31 = a1;
  v32 = sub_235F12898();
  v33 = sub_235F12A18();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    *(_QWORD *)&v47 = v35;
    *(_DWORD *)v34 = 136315394;
    v46 = sub_235F06A38(0xD000000000000018, 0x8000000235F14A70, (uint64_t *)&v47);
    sub_235F12A90();
    *(_WORD *)(v34 + 12) = 2080;
    v36 = objc_msgSend(v31, sel_description);
    v37 = sub_235F12940();
    v39 = v38;

    v46 = sub_235F06A38(v37, v39, (uint64_t *)&v47);
    sub_235F12A90();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235EFE000, v32, v33, "%s failed to load catalog workout identifier for session: %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E5D30](v35, -1, -1);
    MEMORY[0x23B7E5D30](v34, -1, -1);
  }
  else
  {

  }
  sub_235F10018();
  v40 = swift_allocError();
  *v41 = 0;
  *(_QWORD *)(swift_allocObject() + 16) = v40;
  sub_235F12634();
  return sub_235F12718();
}

uint64_t sub_235F0CD30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;

  v2 = sub_235F12634();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  if (*(_QWORD *)(a1 + 16))
  {
    v5 = *(unsigned __int8 *)(v3 + 80);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1 + ((v5 + 32) & ~v5), v2);
    v6 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v6 + ((v5 + 16) & ~v5), (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    return sub_235F12718();
  }
  else
  {
    sub_235F10018();
    v8 = swift_allocError();
    *v9 = 1;
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    return sub_235F12718();
  }
}

uint64_t sub_235F0CE88(uint64_t *a1)
{
  return sub_235F0CD30(*a1);
}

uint64_t sub_235F0CE90@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t (**v31)();
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t (**v42)();
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t (**v53)(void **);
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71[3];

  v70 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394180);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = v4;
  v59 = *(_QWORD *)(v5 + 64);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v56 = (char *)&v55 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394188);
  v62 = *(_QWORD *)(v10 - 8);
  v63 = *(_QWORD *)(v62 + 64);
  v64 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v61 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v60 = (char *)&v55 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394058);
  v67 = *(_QWORD *)(v14 - 8);
  v68 = *(_QWORD *)(v67 + 64);
  v69 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v66 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v65 = (char *)&v55 - v17;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0xE000000000000000;
  sub_235F019E4(v2 + 64, (uint64_t)v71);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  sub_235F0F270(v71, v19 + 24);
  sub_235F019E4(v2 + 24, (uint64_t)v71);
  v20 = swift_allocObject();
  v55 = v20;
  sub_235F0F270(v71, v20 + 16);
  *(double *)(v20 + 56) = a2;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 88));
  swift_retain();
  sub_235F12604();
  v21 = v56;
  sub_235F1285C();
  swift_bridgeObjectRelease();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = sub_235F0FDB8;
  *(_QWORD *)(v22 + 24) = v19;
  v57 = v19;
  v23 = v5;
  v24 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v25 = v58;
  v26 = v6;
  v24(v58, v21, v6);
  v27 = v23;
  v28 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v29 = (v59 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v30 + v28, v25, v26);
  v31 = (uint64_t (**)())(v30 + v29);
  *v31 = sub_235F109FC;
  v31[1] = (uint64_t (*)())v22;
  sub_235F1264C();
  swift_retain();
  v32 = v60;
  sub_235F1270C();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v26);
  v33 = swift_allocObject();
  v34 = v55;
  *(_QWORD *)(v33 + 16) = sub_235F0FDC4;
  *(_QWORD *)(v33 + 24) = v34;
  v36 = v61;
  v35 = v62;
  v37 = v64;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v61, v32, v64);
  v38 = v35;
  v39 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  v40 = (v63 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v41 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v41 + v39, v36, v37);
  v42 = (uint64_t (**)())(v41 + v40);
  *v42 = sub_235F109FC;
  v42[1] = (uint64_t (*)())v33;
  sub_235F0810C(0, (unint64_t *)&qword_256393D38);
  swift_retain();
  v43 = v65;
  sub_235F1270C();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v32, v37);
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = sub_235F0FE54;
  *(_QWORD *)(v44 + 24) = v18;
  v46 = v66;
  v45 = v67;
  v47 = v43;
  v48 = v69;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v66, v43, v69);
  v49 = v45;
  v50 = (*(unsigned __int8 *)(v45 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  v51 = (v68 + v50 + 7) & 0xFFFFFFFFFFFFFFF8;
  v52 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v52 + v50, v46, v48);
  v53 = (uint64_t (**)(void **))(v52 + v51);
  *v53 = sub_235F0FE6C;
  v53[1] = (uint64_t (*)(void **))v44;
  swift_retain();
  sub_235F1270C();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v47, v48);
  return swift_release();
}

uint64_t sub_235F0D3BC@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563941A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235F12664();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235F12754();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F12688();
  v16 = sub_235F12658();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (*(_QWORD *)(v16 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v7, v16 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), v12);
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v7, v17, 1, v12);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    sub_235F01458((uint64_t)v7, &qword_2563941A8);
    sub_235F10018();
    v18 = swift_allocError();
    *v19 = 1;
    *(_QWORD *)(swift_allocObject() + 16) = v18;
    sub_235F1264C();
    return sub_235F12718();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v7, v12);
    v21 = sub_235F12748();
    v23 = v22;
    swift_beginAccess();
    *(_QWORD *)(a1 + 16) = v21;
    *(_QWORD *)(a1 + 24) = v23;
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    sub_235F1273C();
    sub_235F12850();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

uint64_t sub_235F0D650@<X0>(_QWORD *a1@<X1>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;

  v14 = a2;
  v15 = sub_235F126F4();
  v3 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235F126E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235F1267C();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F12640();
  sub_235F12670();
  sub_235F0FFDC((uint64_t)v12);
  sub_235F126DC();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_235F12814();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v15);
}

id sub_235F0D7C8@<X0>(void **a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v5;
  uint64_t v6;

  v5 = *a1;
  swift_beginAccess();
  v6 = *(_QWORD *)(a2 + 24);
  *a3 = *(_QWORD *)(a2 + 16);
  a3[1] = v6;
  a3[2] = v5;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t FitnessPlusSessionProvider.deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  return v0;
}

uint64_t FitnessPlusSessionProvider.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  return swift_deallocClassInstance();
}

BOOL static FitnessPlusSessionProvider.FetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t FitnessPlusSessionProvider.FetchError.hash(into:)()
{
  return sub_235F12BA4();
}

uint64_t FitnessPlusSessionProvider.FetchError.hashValue.getter()
{
  sub_235F12B98();
  sub_235F12BA4();
  return sub_235F12BB0();
}

id FitnessPlusSessionProvider.SessionInformation.title.getter()
{
  id *v0;

  return *v0;
}

id FitnessPlusSessionProvider.SessionInformation.subtitle.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

void *FitnessPlusSessionProvider.SessionInformation.artwork.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

id FitnessPlusSessionProvider.SessionInformation.trainer.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = v1[3];
  v3 = v1[4];
  v4 = (void *)v1[5];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  return sub_235F0F5A8(v2, v3, v4);
}

uint64_t FitnessPlusSessionProvider.TrainerInformation.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id FitnessPlusSessionProvider.TrainerInformation.artwork.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t sub_235F0D99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  void (*v13)(uint64_t, _QWORD *);
  _QWORD *v14;

  __swift_instantiateConcreteTypeFromMangledName(a6);
  v13 = (void (*)(uint64_t, _QWORD *))sub_235F12724();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a1;
  v14[5] = a2;
  swift_retain();
  swift_retain();
  v13(a8, v14);
  swift_release();
  return swift_release();
}

uint64_t sub_235F0DA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  void (*v13)(uint64_t, _QWORD *);
  _QWORD *v14;

  __swift_instantiateConcreteTypeFromMangledName(a6);
  v13 = (void (*)(uint64_t, _QWORD *))sub_235F12724();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a1;
  v14[5] = a2;
  swift_retain();
  swift_retain();
  v13(a8, v14);
  swift_release();
  return swift_release();
}

uint64_t sub_235F0DAE4(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  id v7;

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  v7 = a1;
  return sub_235F1270C();
}

void sub_235F0DB68(void (*a1)(void **), uint64_t a2, void (*a3)(void **__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  void *v6;
  void *v7;
  char v8;

  a3(&v7, a5);
  v6 = v7;
  v8 = 0;
  a1(&v7);
  sub_235F102FC(v6, 0);
}

uint64_t sub_235F0DBE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(uint64_t (*)(uint64_t), _QWORD *);
  _QWORD *v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256394060);
  v9 = (void (*)(uint64_t (*)(uint64_t), _QWORD *))sub_235F12724();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_235F105CC, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_235F0DC88(void *a1, char a2, uint64_t (*a3)(void **), uint64_t a4, void (*a5)(void *))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v15;
  void (*v16)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v17;
  void *v18;
  char v19;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394060);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v15 = a1;
    a5(a1);
    v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_235F12724();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a3;
    *(_QWORD *)(v17 + 24) = a4;
    swift_retain();
    v16(sub_235F0F3B8, v17);
    swift_release();
    swift_release();
    sub_235F102FC(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    v18 = a1;
    v19 = 0;
    return a3(&v18);
  }
}

uint64_t sub_235F0DDC0(void *a1, char a2, void (*a3)(void **), uint64_t a4, void (*a5)(_QWORD *), uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t (*)(), uint64_t);
  uint64_t v18;
  id v20;
  void (*v21)(_QWORD *);
  void *v22;

  v21 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563941C8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (void (**)(_QWORD *))((char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394050);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *v12 = a1;
    swift_storeEnumTagMultiPayload();
    v20 = a1;
    v21(v12);
    return sub_235F01458((uint64_t)v12, &qword_2563941C8);
  }
  else
  {
    v22 = a1;
    swift_bridgeObjectRetain();
    a3(&v22);
    v17 = (void (*)(uint64_t (*)(), uint64_t))sub_235F12724();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v21;
    *(_QWORD *)(v18 + 24) = a6;
    swift_retain();
    v17(sub_235F0FFD8, v18);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    return swift_bridgeObjectRelease();
  }
}

void sub_235F0DF64(void *a1, char a2, void (*a3)(id *), uint64_t a4, void (*a5)(id *), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void (*v16)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v17;
  id v18;
  id v19;
  char v20;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394060);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a1;
  if ((a2 & 1) != 0)
  {
    v20 = 1;
    v18 = a1;
    a5(&v19);
    sub_235F0FEDC(a1);
  }
  else
  {
    v15 = a1;
    a3(&v19);
    v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_235F12724();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a5;
    *(_QWORD *)(v17 + 24) = a6;
    swift_retain();
    v16(sub_235F0F3B8, v17);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);

  }
}

void sub_235F0E0B0(uint64_t a1, void (*a2)(id *), uint64_t a3, void (*a4)(id *), uint64_t a5)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (*v20)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  void (*v28)(id *);
  void (*v29)(id *);
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[7];
  _BYTE v38[64];

  v30 = a5;
  v29 = a4;
  v27[1] = a3;
  v28 = a2;
  sub_235F10190(a1, (uint64_t)v37);
  v7 = (void *)v37[0];
  v6 = (void *)v37[1];
  v8 = (void *)v37[2];
  v9 = v37[3];
  v11 = v37[4];
  v10 = (void *)v37[5];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394060);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F10190(a1, (uint64_t)v38);
  v31 = v7;
  if ((v38[48] & 1) != 0)
  {
    LOBYTE(v32) = 1;
    v16 = v7;
    v29(&v31);
    sub_235F101D8(a1);
  }
  else
  {
    v32 = v6;
    v33 = v8;
    v34 = v9;
    v35 = v11;
    v36 = v10;
    v17 = v8;
    v18 = v7;
    v19 = v6;
    sub_235F0F5A8(v9, v11, v10);
    v28(&v31);
    v20 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_235F12724();
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v29;
    *(_QWORD *)(v21 + 24) = v30;
    swift_retain();
    v20(sub_235F0F3B8, v21);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v22 = v32;
    v24 = v33;
    v23 = v34;
    v25 = v35;
    v26 = v36;

    sub_235F1026C(v23, v25, v26);
  }
}

void sub_235F0E288(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(id *), uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id v17;
  id v18;
  void (*v19)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  void (*v23)(id *);
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  char v29;

  v23 = a4;
  v24 = a5;
  v21[1] = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_256394068);
  v22 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235F12634();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563941C8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (id *)((char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_235F10318(a1, (uint64_t)v16, &qword_2563941C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v25 = *v16;
    v17 = v25;
    v26 = 0u;
    v27 = 0u;
    v28 = 0;
    v29 = 1;
    v18 = v25;
    v23(&v25);

  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v11 + 32))(v13, v16, v10);
    a2(v13);
    v19 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_235F12724();
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v23;
    *(_QWORD *)(v20 + 24) = v24;
    swift_retain();
    v19(sub_235F10360, v20);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v7);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

void sub_235F0E4A0(void *a1, char a2, void (*a3)(id *), uint64_t a4, void (*a5)(id *), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void (*v16)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v17;
  id v18;
  id v19[3];
  char v20;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394190);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v19[1] = 0;
    v19[2] = 0;
    v19[0] = a1;
    v20 = 1;
    v18 = a1;
    a5(v19);
    sub_235F0FEDC(a1);
  }
  else
  {
    v19[0] = a1;
    v15 = a1;
    a3(v19);
    v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_235F12724();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a5;
    *(_QWORD *)(v17 + 24) = a6;
    swift_retain();
    v16(sub_235F0FEEC, v17);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);

  }
}

void sub_235F0E5F0(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(id *), uint64_t a5, uint64_t (*a6)(_QWORD), uint64_t *a7, uint64_t a8, uint64_t a9)
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
  id *v22;
  id v23;
  id v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  _QWORD v27[2];
  void (*v28)(char *);
  uint64_t v29;
  void (*v30)(id *);
  uint64_t v31;
  id v32;
  char v33;

  v29 = a8;
  v30 = a4;
  v31 = a5;
  v27[1] = a3;
  v28 = a2;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394058);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a6(0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v27 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(a7);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (id *)((char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_235F10318(a1, (uint64_t)v22, a7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v32 = *v22;
    v23 = v32;
    v33 = 1;
    v24 = v32;
    v30(&v32);

  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v17 + 32))(v19, v22, v16);
    v28(v19);
    v25 = (void (*)(uint64_t, uint64_t))sub_235F12724();
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v30;
    *(_QWORD *)(v26 + 24) = v31;
    swift_retain();
    v25(a9, v26);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

uint64_t sub_235F0E7EC(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(void **), uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  void *v19;
  id v20;
  uint64_t v22;
  void (*v23)(uint64_t (*)(), uint64_t);
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *);
  uint64_t v27;
  uint64_t v28;
  void (*v29)(void **);
  uint64_t v30;

  v29 = a4;
  v30 = a5;
  v25 = a3;
  v26 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394198);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (void **)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394188);
  v27 = *(_QWORD *)(v9 - 8);
  v28 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235F12694();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563941A0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (void **)((char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_235F10318(a1, (uint64_t)v18, &qword_2563941A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19 = *v18;
    *v8 = *v18;
    swift_storeEnumTagMultiPayload();
    v20 = v19;
    v29(v8);

    return sub_235F01458((uint64_t)v8, &qword_256394198);
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v13 + 32))(v15, v18, v12);
    v26(v15);
    v22 = v28;
    v23 = (void (*)(uint64_t (*)(), uint64_t))sub_235F12724();
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v29;
    *(_QWORD *)(v24 + 24) = v30;
    swift_retain();
    v23(sub_235F0FFD8, v24);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

void sub_235F0EA40(void *a1, char a2, void (*a3)(uint64_t), uint64_t a4, void (*a5)(void **), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t (*)(), uint64_t);
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  char v24;

  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_256394068);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v20 = a1;
    v21 = 0u;
    v22 = 0u;
    v23 = 0;
    v24 = 1;
    v18 = a1;
    a5(&v20);
    sub_235F102FC(a1, 1);
  }
  else
  {
    a3(v13);
    v16 = (void (*)(uint64_t (*)(), uint64_t))sub_235F12724();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a5;
    *(_QWORD *)(v17 + 24) = a6;
    swift_retain();
    v16(sub_235F10A0C, v17);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
}

void sub_235F0EB84(void *a1, uint64_t a2, void *a3, char a4, void (*a5)(void **), uint64_t a6, void (*a7)(void **), uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  void (*v19)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v20;
  id v21;
  void (*v22)(void **);
  void *v23;
  uint64_t v24;
  id v25;

  v22 = a7;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394060);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 1) != 0)
  {
    v23 = a1;
    LOBYTE(v24) = 1;
    v21 = a1;
    v22(&v23);
    sub_235F0FF44(a1, a2, a3, 1);
  }
  else
  {
    v23 = a1;
    v24 = a2;
    v25 = a3;
    swift_bridgeObjectRetain();
    v18 = a3;
    a5(&v23);
    v19 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_235F12724();
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v22;
    *(_QWORD *)(v20 + 24) = a8;
    swift_retain();
    v19(sub_235F0F3B8, v20);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);

    swift_bridgeObjectRelease();
  }
}

void sub_235F0ECFC(void (*a1)(void **), uint64_t a2, void (*a3)(void **__return_ptr, uint64_t *), uint64_t a4, uint64_t *a5)
{
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v7 = *a5;
  a3(&v8, &v7);
  v6 = v8;
  v9 = 0;
  a1(&v8);
  sub_235F102FC(v6, 0);
}

uint64_t sub_235F0ED7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  id v12;
  id v13;
  id v14;

  v5 = *(void **)a1;
  v6 = *(void **)(a1 + 8);
  v8 = *(void **)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = v5;
  v11[5] = v6;
  v11[6] = v8;
  v11[7] = v7;
  v11[8] = v9;
  v11[9] = v10;
  v12 = v8;
  v13 = v5;
  v14 = v6;
  sub_235F0F5A8(v7, v9, v10);
  swift_retain();
  return sub_235F1270C();
}

void sub_235F0EE34(void (*a1)(_OWORD *), uint64_t a2, void (*a3)(void **__return_ptr, _OWORD *), uint64_t a4, _OWORD *a5)
{
  __int128 v6;
  void *v7;
  _OWORD v8[3];
  void *v9;

  v6 = a5[1];
  v8[0] = *a5;
  v8[1] = v6;
  v8[2] = a5[2];
  a3(&v9, v8);
  v7 = v9;
  *(_QWORD *)&v8[0] = v9;
  BYTE8(v8[0]) = 0;
  a1(v8);
  sub_235F102FC(v7, 0);
}

uint64_t sub_235F0EEBC(uint64_t result, uint64_t (*a2)(_OWORD *))
{
  char v2;
  __int128 v3;
  _OWORD v4[3];
  char v5;

  v2 = *(_BYTE *)(result + 48);
  v3 = *(_OWORD *)(result + 16);
  v4[0] = *(_OWORD *)result;
  v4[1] = v3;
  v4[2] = *(_OWORD *)(result + 32);
  v5 = v2;
  if (a2)
    return a2(v4);
  return result;
}

uint64_t sub_235F0EF04(void **a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD *v6;
  id v7;

  v5 = *a1;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = v5;
  v7 = v5;
  swift_retain();
  return sub_235F1270C();
}

void sub_235F0EF84(void (*a1)(_QWORD *), uint64_t a2, void (*a3)(_QWORD *__return_ptr, uint64_t *), uint64_t a4, uint64_t *a5)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[3];
  char v11;

  v9 = *a5;
  a3(v10, &v9);
  v6 = (void *)v10[0];
  v7 = v10[1];
  v8 = (void *)v10[2];
  v11 = 0;
  a1(v10);
  sub_235F0FF44(v6, v7, v8, 0);
}

uint64_t sub_235F0F024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  swift_retain();
  return sub_235F1270C();
}

void sub_235F0F08C(void (*a1)(_QWORD *), uint64_t a2, void (*a3)(_QWORD *__return_ptr))
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  char v11;

  a3(v10);
  v4 = (void *)v10[0];
  v5 = (void *)v10[1];
  v6 = (void *)v10[2];
  v7 = v10[3];
  v8 = v10[4];
  v9 = (void *)v10[5];
  v11 = 0;
  a1(v10);
  sub_235F10210(v4, v5, v6, v7, v8, v9, 0);
}

uint64_t sub_235F0F150(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;

  v6 = *a1;
  v5 = a1[1];
  v7 = (void *)a1[2];
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = v6;
  v8[5] = v5;
  v8[6] = v7;
  swift_bridgeObjectRetain();
  v9 = v7;
  swift_retain();
  return sub_235F1270C();
}

void sub_235F0F1E8(void (*a1)(void **), uint64_t a2, void (*a3)(void **__return_ptr, void **), uint64_t a4, uint64_t a5)
{
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;

  v7 = *(void **)a5;
  v8 = *(_OWORD *)(a5 + 8);
  a3(&v9, &v7);
  v6 = v9;
  v7 = v9;
  LOBYTE(v8) = 0;
  a1(&v7);
  sub_235F102FC(v6, 0);
}

uint64_t sub_235F0F270(__int128 *a1, uint64_t a2)
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

uint64_t sub_235F0F288()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_235F0F2AC(uint64_t a1)
{
  uint64_t v1;

  return sub_235F0AA00(a1, (_QWORD *)(v1 + 16));
}

uint64_t sub_235F0F2B8()
{
  return objectdestroy_2Tm(&qword_256394050);
}

uint64_t sub_235F0F2C4(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_256394050, (uint64_t)&unk_25074D4F8, (uint64_t)sub_235F10668, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0D99C);
}

uint64_t sub_235F0F2E8(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, 0);
}

uint64_t sub_235F0F318(void **a1)
{
  uint64_t v1;

  return sub_235F0EF04(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_235F0F34C()
{
  return objectdestroy_2Tm(&qword_256394058);
}

uint64_t sub_235F0F358(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_256394058, (uint64_t)&unk_25074D480, (uint64_t)sub_235F10618, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0D99C);
}

uint64_t sub_235F0F380(void *a1)
{
  uint64_t v1;

  return sub_235F0AB70(a1, *(void **)(v1 + 16), *(uint64_t (**)(_QWORD, _QWORD))(v1 + 24));
}

uint64_t sub_235F0F39C(void *a1)
{
  uint64_t v1;

  return sub_235F0DAE4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_235F0F3A4()
{
  return objectdestroy_2Tm(&qword_256394060);
}

uint64_t sub_235F0F3BC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235F0F3E0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F0F414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_235F0B3D4(a1, (_QWORD *)(v2 + 16), (_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 104), a2, *(double *)(v2 + 112));
}

uint64_t sub_235F0F42C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_235F0F44C()
{
  return objectdestroy_2Tm(&qword_256394050);
}

uint64_t sub_235F0F458(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_256394050, (uint64_t)&unk_25074D138, (uint64_t)sub_235F1030C, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0DA40);
}

void sub_235F0F47C(uint64_t a1)
{
  uint64_t v1;

  sub_235F0BE1C(a1, *(void (**)(id *))(v1 + 16));
}

uint64_t sub_235F0F494(uint64_t a1)
{
  uint64_t v1;

  return sub_235F0ED7C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_235F0F49C()
{
  return objectdestroy_2Tm(qword_256394068);
}

uint64_t sub_235F0F4A8(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, qword_256394068, (uint64_t)&unk_25074D0C0, (uint64_t)sub_235F10140, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0DA40);
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_235F0F4FC(void *a1)
{
  uint64_t v1;

  sub_235F0BED4(a1, *(void **)(v1 + 16), *(void (**)(_QWORD))(v1 + 24));
}

uint64_t sub_235F0F518()
{
  return objectdestroy_2Tm(&qword_256394060);
}

uint64_t sub_235F0F524(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256394060) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (uint64_t *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_235F0DBE0(a1, a2, v2 + v6, *v7, v7[1]);
}

uint64_t sub_235F0F590(uint64_t a1)
{
  uint64_t v1;

  return sub_235F0C364(a1, *(double *)(v1 + 32), *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235F0F59C(uint64_t a1)
{
  uint64_t v1;

  return sub_235F0C644(a1, *(double *)(v1 + 32), *(double *)(v1 + 40), *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

id sub_235F0F5A8(uint64_t a1, uint64_t a2, void *a3)
{
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return a3;
  }
  return result;
}

unint64_t sub_235F0F5DC()
{
  unint64_t result;

  result = qword_256394080;
  if (!qword_256394080)
  {
    result = MEMORY[0x23B7E5CC4](&protocol conformance descriptor for FitnessPlusSessionProvider.FetchError, &type metadata for FitnessPlusSessionProvider.FetchError);
    atomic_store(result, (unint64_t *)&qword_256394080);
  }
  return result;
}

uint64_t type metadata accessor for FitnessPlusSessionProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for FitnessPlusSessionProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.__allocating_init(healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.fetchImage(for:width:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.fetchSessionInformation(for:sessionImageWidth:trainerImageWidth:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.fetchImage(forSession:width:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, double);

  v8 = (uint64_t (*)(uint64_t, double))(**(int **)(*(_QWORD *)v2 + 136) + *(_QWORD *)(*(_QWORD *)v2 + 136));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_235F07C88;
  return v8(a1, a2);
}

uint64_t dispatch thunk of FitnessPlusSessionProvider.fetchSessionInformation(for:sessionImageWidth:trainerImageWidth:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, double, double);

  v12 = (uint64_t (*)(uint64_t, uint64_t, double, double))(**(int **)(*(_QWORD *)v4 + 144)
                                                                 + *(_QWORD *)(*(_QWORD *)v4 + 144));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_235F07A10;
  return v12(a1, a2, a3, a4);
}

uint64_t storeEnumTagSinglePayload for FitnessPlusSessionProvider.FetchError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235F0F7B0 + 4 * byte_235F132B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_235F0F7E4 + 4 * byte_235F132B0[v4]))();
}

uint64_t sub_235F0F7E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F0F7EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235F0F7F4);
  return result;
}

uint64_t sub_235F0F800(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235F0F808);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_235F0F80C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F0F814(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FitnessPlusSessionProvider.FetchError()
{
  return &type metadata for FitnessPlusSessionProvider.FetchError;
}

void destroy for FitnessPlusSessionProvider.SessionInformation(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 32))
  {
    swift_bridgeObjectRelease();

  }
}

_QWORD *initializeWithCopy for FitnessPlusSessionProvider.SessionInformation(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v4 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *(void **)(a2 + 16);
  a1[2] = v6;
  v7 = *(_QWORD *)(a2 + 32);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (v7)
  {
    a1[3] = *(_QWORD *)(a2 + 24);
    a1[4] = v7;
    v11 = *(void **)(a2 + 40);
    a1[5] = v11;
    swift_bridgeObjectRetain();
    v12 = v11;
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
    a1[5] = *(_QWORD *)(a2 + 40);
  }
  return a1;
}

uint64_t assignWithCopy for FitnessPlusSessionProvider.SessionInformation(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  __int128 v22;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  v10 = *(void **)(a1 + 16);
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11;

  v13 = (_OWORD *)(a1 + 24);
  v14 = (_OWORD *)(a2 + 24);
  v15 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v15)
    {
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v16 = *(void **)(a2 + 40);
      v17 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v16;
      v18 = v16;

    }
    else
    {
      sub_235F0FA20(a1 + 24);
      v21 = *(_QWORD *)(a2 + 40);
      *v13 = *v14;
      *(_QWORD *)(a1 + 40) = v21;
    }
  }
  else if (v15)
  {
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    v19 = *(void **)(a2 + 40);
    *(_QWORD *)(a1 + 40) = v19;
    swift_bridgeObjectRetain();
    v20 = v19;
  }
  else
  {
    v22 = *v14;
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *v13 = v22;
  }
  return a1;
}

uint64_t sub_235F0FA20(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FitnessPlusSessionProvider.SessionInformation(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_5;
  v7 = *(_QWORD *)(a2 + 32);
  if (!v7)
  {
    sub_235F0FA20(a1 + 24);
LABEL_5:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    return a1;
  }
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  v8 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for FitnessPlusSessionProvider.SessionInformation(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FitnessPlusSessionProvider.SessionInformation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FitnessPlusSessionProvider.SessionInformation()
{
  return &type metadata for FitnessPlusSessionProvider.SessionInformation;
}

void destroy for FitnessPlusSessionProvider.TrainerInformation(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *_s10ActivityUI26FitnessPlusSessionProviderC18TrainerInformationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for FitnessPlusSessionProvider.TrainerInformation(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

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

uint64_t assignWithTake for FitnessPlusSessionProvider.TrainerInformation(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for FitnessPlusSessionProvider.TrainerInformation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FitnessPlusSessionProvider.TrainerInformation(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FitnessPlusSessionProvider.TrainerInformation()
{
  return &type metadata for FitnessPlusSessionProvider.TrainerInformation;
}

uint64_t sub_235F0FD68()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235F0FD8C()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

uint64_t sub_235F0FDB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F0D3BC(*(_QWORD *)(v1 + 16), (_QWORD *)(v1 + 24), a1);
}

uint64_t sub_235F0FDC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F0D650((_QWORD *)(v1 + 16), a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_235F0FDF4()
{
  return objectdestroy_2Tm(&qword_256394180);
}

uint64_t sub_235F0FE00(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_256394180, (uint64_t)&unk_25074CFF8, (uint64_t)sub_235F0FFC8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0D99C);
}

uint64_t sub_235F0FE24()
{
  return objectdestroy_2Tm(&qword_256394188);
}

uint64_t sub_235F0FE30(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_256394188, (uint64_t)&unk_25074CFA8, (uint64_t)sub_235F0FF78, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0D99C);
}

id sub_235F0FE54@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_235F0D7C8(a1, v2, a2);
}

uint64_t sub_235F0FE6C(void **a1)
{
  uint64_t v1;

  return sub_235F0EF04(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_235F0FE9C()
{
  return objectdestroy_2Tm(&qword_256394058);
}

uint64_t sub_235F0FEA8(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_256394058, (uint64_t)&unk_25074CF30, (uint64_t)sub_235F0FED0, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0DA40);
}

uint64_t sub_235F0FED0(uint64_t a1)
{
  return sub_235F10868(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235F0E4A0);
}

void sub_235F0FEDC(id a1)
{

}

uint64_t sub_235F0FEEC(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(__int128 *);
  uint64_t v3;
  char v4;
  __int128 v5;
  uint64_t v6;
  char v7;

  v2 = *(uint64_t (**)(__int128 *))(v1 + 16);
  v3 = *(_QWORD *)(result + 16);
  v4 = *(_BYTE *)(result + 24);
  v5 = *(_OWORD *)result;
  v6 = v3;
  v7 = v4;
  if (v2)
    return v2(&v5);
  return result;
}

void sub_235F0FF38(void (*a1)(_QWORD *), uint64_t a2)
{
  uint64_t v2;

  sub_235F0EF84(a1, a2, *(void (**)(_QWORD *__return_ptr, uint64_t *))(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t *)(v2 + 32));
}

void sub_235F0FF44(void *a1, uint64_t a2, void *a3, char a4)
{
  if ((a4 & 1) != 0)
  {

  }
  else
  {
    swift_bridgeObjectRelease();

  }
}

void sub_235F0FF78(uint64_t a1)
{
  uint64_t v1;

  sub_235F0E5F0(a1, *(void (**)(char *))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(id *))(v1 + 32), *(_QWORD *)(v1 + 40), (uint64_t (*)(_QWORD))MEMORY[0x24BE89400], &qword_256394198, (uint64_t)&unk_25074CFD0, (uint64_t)sub_235F0F3B8);
}

uint64_t sub_235F0FFC8(uint64_t a1)
{
  uint64_t v1;

  return sub_235F0E7EC(a1, *(void (**)(char *))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(void **))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_235F0FFDC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235F1267C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_235F10018()
{
  unint64_t result;

  result = qword_2563941B0;
  if (!qword_2563941B0)
  {
    result = MEMORY[0x23B7E5CC4](&protocol conformance descriptor for FitnessPlusSessionProvider.FetchError, &type metadata for FitnessPlusSessionProvider.FetchError);
    atomic_store(result, (unint64_t *)&qword_2563941B0);
  }
  return result;
}

uint64_t sub_235F1005C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_235F10080()
{
  return sub_235F1098C();
}

uint64_t sub_235F10094()
{
  return objectdestroy_67Tm(&qword_2563941B8);
}

uint64_t sub_235F100A0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563941B8);
  return sub_235F0C740(a1);
}

uint64_t sub_235F100E0()
{
  return objectdestroy_67Tm(&qword_256393EE0);
}

uint64_t sub_235F100EC(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
  return sub_235F0C458(a1, v3);
}

void sub_235F10140(uint64_t a1)
{
  _QWORD *v1;
  void (*v2)(id *);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(id *);
  _BYTE v6[56];

  v2 = (void (*)(id *))v1[2];
  v3 = v1[3];
  v5 = (void (*)(id *))v1[4];
  v4 = v1[5];
  sub_235F10190(a1, (uint64_t)v6);
  sub_235F0E0B0((uint64_t)v6, v2, v3, v5, v4);
}

uint64_t sub_235F10190(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563941C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F101D8(uint64_t a1)
{
  sub_235F10210(*(void **)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_BYTE *)(a1 + 48));
  return a1;
}

void sub_235F10210(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, char a7)
{
  if ((a7 & 1) != 0)
  {

  }
  else
  {

    sub_235F1026C(a4, a5, a6);
  }
}

void sub_235F1026C(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_235F102A0()
{
  uint64_t v0;

  swift_release();

  if (*(_QWORD *)(v0 + 64))
  {
    swift_bridgeObjectRelease();

  }
  return swift_deallocObject();
}

void sub_235F102F0(void (*a1)(_OWORD *), uint64_t a2)
{
  uint64_t v2;

  sub_235F0EE34(a1, a2, *(void (**)(void **__return_ptr, _OWORD *))(v2 + 16), *(_QWORD *)(v2 + 24), (_OWORD *)(v2 + 32));
}

void sub_235F102FC(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

void sub_235F1030C(uint64_t a1)
{
  uint64_t v1;

  sub_235F0E288(a1, *(void (**)(char *))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(id *))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_235F10318(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235F10360(uint64_t a1)
{
  uint64_t v1;

  return sub_235F0EEBC(a1, *(uint64_t (**)(_OWORD *))(v1 + 16));
}

uint64_t sub_235F10368()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_235F1038C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
  {
    swift_bridgeObjectRelease();

  }
  return swift_deallocObject();
}

void sub_235F103BC(void **a1)
{
  uint64_t v1;

  sub_235F0BC88(a1, v1);
}

uint64_t sub_235F103D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F103F8()
{
  return objectdestroy_2Tm(&qword_256394058);
}

unint64_t sub_235F10404()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563941E0;
  if (!qword_2563941E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563941D8);
    result = MEMORY[0x23B7E5CC4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2563941E0);
  }
  return result;
}

uint64_t sub_235F10450()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

id sub_235F1048C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_235F0BD70(*(void **)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD **)(v1 + 40), a1);
}

uint64_t sub_235F10498()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_235F104C0(uint64_t a1)
{
  uint64_t v1;

  return sub_235F0F024(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_235F104C8()
{
  return objectdestroy_2Tm(&qword_256394060);
}

uint64_t sub_235F104D4(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_256394060, (uint64_t)&unk_25074D390, (uint64_t)sub_235F105B0, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0DA40);
}

void sub_235F104F8(uint64_t *a1)
{
  _QWORD *v1;

  sub_235F0BCE4(a1, v1);
}

uint64_t sub_235F10510(uint64_t *a1)
{
  uint64_t v1;

  return sub_235F0F150(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_235F10518()
{
  return objectdestroy_2Tm(&qword_256394190);
}

uint64_t sub_235F10524(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_256394190, (uint64_t)&unk_25074D318, (uint64_t)sub_235F1054C, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0DA40);
}

void sub_235F1054C(uint64_t a1)
{
  uint64_t v1;

  sub_235F0EB84(*(void **)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_BYTE *)(a1 + 24), *(void (**)(void **))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(void **))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_235F1056C()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_235F105A0(void (*a1)(void **), uint64_t a2)
{
  uint64_t v2;

  sub_235F0F1E8(a1, a2, *(void (**)(void **__return_ptr, void **))(v2 + 16), *(_QWORD *)(v2 + 24), v2 + 32);
}

uint64_t sub_235F105B0(uint64_t a1)
{
  return sub_235F10868(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235F0EA40);
}

void sub_235F105C0(void (*a1)(_QWORD *), uint64_t a2)
{
  uint64_t v2;

  sub_235F0F08C(a1, a2, *(void (**)(_QWORD *__return_ptr))(v2 + 16));
}

uint64_t sub_235F105CC(uint64_t a1)
{
  return sub_235F10868(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235F0DC88);
}

uint64_t sub_235F105DC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_235F10608(void (*a1)(void **), uint64_t a2)
{
  uint64_t v2;

  sub_235F0DB68(a1, a2, *(void (**)(void **__return_ptr, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_235F10618(uint64_t a1)
{
  return sub_235F10868(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235F0DF64);
}

uint64_t objectdestroy_101Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_235F10658(void (*a1)(void **), uint64_t a2)
{
  uint64_t v2;

  sub_235F0ECFC(a1, a2, *(void (**)(void **__return_ptr, uint64_t *))(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t *)(v2 + 32));
}

void sub_235F10668(uint64_t a1)
{
  uint64_t v1;

  sub_235F0E5F0(a1, *(void (**)(char *))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(id *))(v1 + 32), *(_QWORD *)(v1 + 40), (uint64_t (*)(_QWORD))MEMORY[0x24BE890D0], &qword_2563941C8, (uint64_t)&unk_25074D520, (uint64_t)sub_235F0F3B8);
}

uint64_t sub_235F106B4(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  char v3;
  uint64_t v4;
  char v5;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = *(_BYTE *)(result + 8);
  v4 = *(_QWORD *)result;
  v5 = v3;
  if (v2)
    return v2(&v4);
  return result;
}

uint64_t sub_235F106F4()
{
  return objectdestroy_2Tm(&qword_2563941E8);
}

uint64_t objectdestroy_2Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F10774(uint64_t a1, uint64_t a2)
{
  return sub_235F10798(a1, a2, &qword_2563941E8, (uint64_t)&unk_25074D598, (uint64_t)sub_235F1085C, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))sub_235F0D99C);
}

uint64_t sub_235F10798(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t *, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  v14 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v15 = (_QWORD *)(v6 + ((*(_QWORD *)(v13 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a6(a1, a2, v6 + v14, *v15, v15[1], a3, a4, a5);
}

uint64_t objectdestroy_95Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F1085C(uint64_t a1)
{
  return sub_235F10868(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235F0DDC0);
}

uint64_t sub_235F10868(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), v2[2], v2[3], v2[4], v2[5]);
}

uint64_t objectdestroy_23Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F108B4()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
}

uint64_t sub_235F108DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_235F12634();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_235F1093C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_235F12634();
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80)), v3);
}

id sub_235F1098C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  swift_willThrow();
  return v1;
}

uint64_t sub_235F10A10(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_235F10A30(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t WorkoutImageProvider.__allocating_init(healthStore:)(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;

  v2 = swift_allocObject();
  type metadata accessor for FitnessPlusSessionProvider();
  swift_allocObject();
  v3 = a1;
  *(_QWORD *)(v2 + 24) = FitnessPlusSessionProvider.init(healthStore:)(v3);
  type metadata accessor for AppIconImageProvider();
  v4 = swift_allocObject();
  v5 = sub_235F02770(MEMORY[0x24BEE4AF8]);

  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v2 + 16) = v4;
  return v2;
}

uint64_t WorkoutImageProvider.init(healthStore:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;

  v2 = v1;
  type metadata accessor for FitnessPlusSessionProvider();
  swift_allocObject();
  v4 = a1;
  *(_QWORD *)(v2 + 24) = FitnessPlusSessionProvider.init(healthStore:)(v4);
  type metadata accessor for AppIconImageProvider();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_235F02770(MEMORY[0x24BEE4AF8]);

  *(_QWORD *)(v2 + 16) = v5;
  return v2;
}

uint64_t WorkoutImageProvider.__allocating_init(fitnessPlusWorkoutProvider:appIconImageProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = a1;
  return result;
}

uint64_t WorkoutImageProvider.init(fitnessPlusWorkoutProvider:appIconImageProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = a1;
  return v2;
}

uint64_t sub_235F10BD0(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 40) = v2;
  *(double *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 24) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393D20);
  *(_QWORD *)(v3 + 48) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_235F10C34()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  _QWORD *v8;

  v2 = v0[5];
  v1 = v0[6];
  v3 = v0[4];
  v4 = (void *)v0[3];
  v5 = sub_235F129E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 1, 1, v5);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v2;
  v6[5] = v4;
  v6[6] = v3;
  swift_retain();
  v7 = v4;
  v0[7] = sub_235F03C00(v1, (uint64_t)&unk_256394208, (uint64_t)v6);
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = v8;
  sub_235F11CF4();
  *v8 = v0;
  v8[1] = sub_235F10D24;
  return sub_235F12A00();
}

uint64_t sub_235F10D24()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235F10D78()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_235F10DB8(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(double *)(v6 + 32) = a2;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a6;
  return swift_task_switch();
}

uint64_t sub_235F10DD4()
{
  uint64_t v0;
  id *v1;

  v1 = *(id **)(v0 + 16);
  *v1 = sub_235F117C8(*(void **)(v0 + 24), *(double *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_235F10E0C(void *a1, void (*a2)(id, _QWORD), uint64_t a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unsigned int v21;
  id v22;
  id v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44[2];

  v5 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393D20);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((HKWorkout.isFitnessPlusWorkout.getter() & 1) != 0)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = a2;
    *(_QWORD *)(v13 + 24) = a3;
    swift_retain();
    swift_retain();
    sub_235F0A524(a1, (uint64_t)sub_235F11E64, v13, a4);
    swift_release();
    swift_release();
    return;
  }
  if (objc_msgSend(a1, sel_fiui_isConnectedGymWorkout))
  {
    v14 = objc_msgSend(a1, sel_device);
    if (v14)
    {
      v15 = v14;
      if (a4 <= 60.0)
        v16 = a4;
      else
        v16 = 60.0;
      v17 = objc_msgSend((id)objc_opt_self(), sel_iconForConnectedGymDevice_preferredIconWidth_, v14, v16);
      if (v17)
      {
        v18 = v17;
        v44[0] = v17;
        a2(v18, 0);

LABEL_15:
        return;
      }

    }
  }
  v19 = objc_msgSend(a1, sel_sourceRevision);
  v20 = objc_msgSend(v19, sel_source);

  v21 = objc_msgSend(v20, sel__hasFirstPartyBundleID);
  v22 = objc_msgSend(a1, sel_sourceRevision);
  v23 = objc_msgSend(v22, sel_source);

  if (v21)
  {
    v24 = objc_msgSend(v23, sel__isAppleWatch);

    if ((v24 & 1) != 0 || objc_msgSend(a1, sel__isWatchWorkout))
    {
      v44[0] = sub_235F117C8(a1, a4);
      a2(v44[0], 0);
      goto LABEL_15;
    }
    v40 = *(_QWORD *)(v5 + 16);
    v41 = sub_235F129E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v12, 1, 1, v41);
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = 0;
    *(_QWORD *)(v34 + 24) = 0;
    *(_QWORD *)(v34 + 32) = v40;
    *(_QWORD *)(v34 + 40) = 0xD000000000000010;
    *(_QWORD *)(v34 + 48) = 0x8000000235F14700;
    *(_BYTE *)(v34 + 56) = 0;
    *(double *)(v34 + 64) = a4;
    *(_QWORD *)(v34 + 72) = a2;
    *(_QWORD *)(v34 + 80) = a3;
    swift_retain_n();
    swift_retain();
    v35 = &unk_256394218;
  }
  else
  {
    v25 = objc_msgSend(v23, sel_bundleIdentifier);

    v26 = (void *)sub_235F12940();
    v28 = v27;

    v29 = objc_msgSend((id)objc_opt_self(), sel_hiddenApplications);
    sub_235F12A0C();
    v30 = sub_235F12988();

    MEMORY[0x24BDAC7A8](v31);
    v44[-2] = v26;
    v44[-1] = v28;
    LOBYTE(v29) = sub_235F11474(sub_235F11D30, (uint64_t)&v44[-4], v30);
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0)
    {
      v36 = *(_QWORD *)(v5 + 16);
      swift_retain();
      v37 = objc_msgSend(a1, sel_sourceRevision);
      v38 = objc_msgSend(v37, sel_source);

      LOBYTE(v37) = objc_msgSend(v38, sel__isAppleWatch);
      if ((v37 & 1) != 0)
        v39 = 1;
      else
        v39 = objc_msgSend(a1, sel__isWatchWorkout);
      v42 = sub_235F129E8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v12, 1, 1, v42);
      v43 = swift_allocObject();
      *(_QWORD *)(v43 + 16) = 0;
      *(_QWORD *)(v43 + 24) = 0;
      *(_QWORD *)(v43 + 32) = v36;
      *(_QWORD *)(v43 + 40) = v26;
      *(_QWORD *)(v43 + 48) = v28;
      *(_BYTE *)(v43 + 56) = v39;
      *(double *)(v43 + 64) = a4;
      *(_QWORD *)(v43 + 72) = a2;
      *(_QWORD *)(v43 + 80) = a3;
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_235F03AB4((uint64_t)v12, (uint64_t)&unk_256393D50, v43);
      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
    v32 = *(_QWORD *)(v5 + 16);
    v33 = sub_235F129E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v12, 1, 1, v33);
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = 0;
    *(_QWORD *)(v34 + 24) = 0;
    *(_QWORD *)(v34 + 32) = v32;
    *(_QWORD *)(v34 + 40) = 0xD000000000000010;
    *(_QWORD *)(v34 + 48) = 0x8000000235F14700;
    *(_BYTE *)(v34 + 56) = 0;
    *(double *)(v34 + 64) = a4;
    *(_QWORD *)(v34 + 72) = a2;
    *(_QWORD *)(v34 + 80) = a3;
    swift_retain_n();
    swift_retain();
    v35 = &unk_256394210;
  }
  sub_235F03AB4((uint64_t)v12, (uint64_t)v35, v34);
LABEL_24:
  swift_release();
  swift_release();
}

uint64_t sub_235F113D0(id *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v5 = objc_msgSend(*a1, sel_bundleIdentifier);
  v6 = sub_235F12940();
  v8 = v7;

  if (v6 == a2 && v8 == a3)
    v10 = 1;
  else
    v10 = sub_235F12B44();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_235F11474(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  id v15;

  if (a3 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_235F12AF0())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B7E588C](v6 - 4, a3) : *(id *)(a3 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v15 = v7;
      v10 = a1(&v15);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v12 & 1;
      }
      v11 = v10;

      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v12 = 1;
        return v12 & 1;
      }
      ++v6;
      if (v9 == v5)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  v12 = 0;
  return v12 & 1;
}

uint64_t sub_235F115A4(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 40) = v2;
  *(double *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 24) = a1;
  return swift_task_switch();
}

uint64_t sub_235F115C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = v0[5];
  v2 = v0[4];
  v3 = v0[3];
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  sub_235F11CF4();
  *v5 = v0;
  v5[1] = sub_235F0C2C4;
  return sub_235F12B50();
}

uint64_t sub_235F11684(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_235F10E0C(a4, (void (*)(id, _QWORD))sub_235F100EC, v11, a2);
  return swift_release();
}

uint64_t WorkoutImageProvider.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t WorkoutImageProvider.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

id sub_235F117C8(void *a1, double a2)
{
  id v4;
  id v5;
  id result;
  void *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD aBlock[6];

  v4 = objc_msgSend((id)objc_opt_self(), sel_effectiveActivityTypeWithWorkout_, a1);
  v5 = sub_235F02024(a1);
  result = (id)FIUIStaticWorkoutIconImage();
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = result;
  v8 = objc_msgSend(result, sel_imageWithRenderingMode_, 2);

  result = objc_msgSend(v5, sel_nonGradientTextColor);
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v9 = result;
  v10 = objc_msgSend(v8, sel_imageWithTintColor_, result);

  objc_msgSend(a1, sel_fiui_completionFactor);
  v12 = v11;
  v13 = sub_235F02024(a1);
  v32 = v5;
  if ((sub_235F00FAC() & 1) != 0
    || sub_235F00B3C()
    || (sub_235F00FB8() & 1) != 0
    || objc_msgSend(a1, sel_workoutActivityType) == (id)84)
  {
    v14 = objc_msgSend(v13, sel_gradientDarkColor);
    v15 = objc_msgSend(v13, sel_gradientLightColor);
    v16 = (id)FIUICircularGradientImage();

LABEL_8:
    v17 = (a2 - a2) * 0.5;
    v18 = (a2 - a2 * 0.583333333) * 0.5;
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_, a2, a2);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v16;
    *(double *)(v20 + 24) = v17;
    *(double *)(v20 + 32) = v17;
    *(double *)(v20 + 40) = a2;
    *(double *)(v20 + 48) = a2;
    *(_QWORD *)(v20 + 56) = v10;
    *(double *)(v20 + 64) = v18;
    *(double *)(v20 + 72) = v18;
    *(double *)(v20 + 80) = a2 * 0.583333333;
    *(double *)(v20 + 88) = a2 * 0.583333333;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = sub_235F120A0;
    *(_QWORD *)(v21 + 24) = v20;
    aBlock[4] = sub_235F07904;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235F10A30;
    aBlock[3] = &block_descriptor_1;
    v22 = _Block_copy(aBlock);
    v23 = v16;
    v24 = v10;
    swift_retain();
    swift_release();
    v25 = objc_msgSend(v19, sel_imageWithActions_, v22);

    _Block_release(v22);
    LOBYTE(v24) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((v24 & 1) == 0)
      return v25;
    __break(1u);
    goto LABEL_16;
  }
  if (!objc_msgSend(a1, sel__goalType))
  {
    v16 = (id)FIUICircularWorkoutGradientImage();
    goto LABEL_8;
  }
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01CC0]), sel_initWithNumberOfRings_, 1);
  *(float *)&v27 = v12;
  objc_msgSend(v26, sel_setPercentage_ofRingAtIndex_animated_, 0, 0, v27);
  *(float *)&v28 = a2;
  objc_msgSend(v26, sel_setGroupDiameter_, v28);
  v29 = a2 * 0.105769231;
  *(float *)&v29 = a2 * 0.105769231;
  objc_msgSend(v26, sel_setThickness_, v29);
  result = objc_msgSend(v13, sel_gradientDarkColor);
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v30 = result;
  result = objc_msgSend(v13, sel_gradientLightColor);
  if (result)
  {
    v31 = result;
    objc_msgSend(v26, sel_setTopColor_bottomColor_ofRingAtIndex_, v30, result, 0);

    v16 = objc_msgSend((id)objc_opt_self(), sel_renderRingGroup_withRenderer_, v26, 0);
    goto LABEL_8;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_235F11C4C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235F11C80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 48);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_235F09A30;
  v6[4] = v5;
  v6[2] = a1;
  v6[3] = v4;
  return swift_task_switch();
}

unint64_t sub_235F11CF4()
{
  unint64_t result;

  result = qword_256393D38;
  if (!qword_256393D38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256393D38);
  }
  return result;
}

uint64_t sub_235F11D30(id *a1)
{
  uint64_t v1;

  return sub_235F113D0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24)) & 1;
}

uint64_t sub_235F11D50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  double v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_BYTE *)(v1 + 56);
  v10 = *(double *)(v1 + 64);
  v11 = *(_QWORD *)(v1 + 72);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_235F09A30;
  return sub_235F035D0(v10, a1, v4, v5, v6, v7, v8, v9, v11);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F11E40()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F11E64(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(a1, a2 & 1);
}

uint64_t sub_235F11E88(uint64_t a1)
{
  uint64_t v1;

  return sub_235F11684(a1, *(double *)(v1 + 32), *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t type metadata accessor for WorkoutImageProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for WorkoutImageProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WorkoutImageProvider.__allocating_init(healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of WorkoutImageProvider.__allocating_init(fitnessPlusWorkoutProvider:appIconImageProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of WorkoutImageProvider.placeholderImage(for:width:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of WorkoutImageProvider.placeholderImage(for:width:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, double);

  v8 = (uint64_t (*)(uint64_t, double))(**(int **)(*(_QWORD *)v2 + 168) + *(_QWORD *)(*(_QWORD *)v2 + 168));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_235F11F48;
  return v8(a1, a2);
}

uint64_t sub_235F11F48(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of WorkoutImageProvider.fetchImage(for:width:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of WorkoutImageProvider.fetchImage(for:width:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, double);

  v8 = (uint64_t (*)(uint64_t, double))(**(int **)(*(_QWORD *)v2 + 184) + *(_QWORD *)(*(_QWORD *)v2 + 184));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_235F07C88;
  return v8(a1, a2);
}

uint64_t sub_235F12010()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256393EE0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_235F12074()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_235F120A0()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = *(void **)(v0 + 56);
  v2 = *(double *)(v0 + 64);
  v3 = *(double *)(v0 + 72);
  v4 = *(double *)(v0 + 80);
  v5 = *(double *)(v0 + 88);
  objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
  return objc_msgSend(v1, sel_drawInRect_blendMode_alpha_, 0, v2, v3, v4, v5, 1.0);
}

uint64_t sub_235F12110()
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

void sub_235F12138()
{
  qword_256394340 = 0x7974697669746341;
  *(_QWORD *)algn_256394348 = 0xE800000000000000;
}

uint64_t static ActivityAccessibilityIdentifier.base.getter()
{
  return sub_235F0071C(&qword_256393C40, &qword_256394340);
}

uint64_t sub_235F1217C()
{
  uint64_t result;

  if (qword_256393C40 != -1)
    result = swift_once();
  qword_256394350 = 0xD000000000000014;
  *(_QWORD *)algn_256394358 = 0x8000000235F14B40;
  return result;
}

uint64_t static ActivityAccessibilityIdentifier.LandingView.base.getter()
{
  return sub_235F0071C(&qword_256393C48, &qword_256394350);
}

uint64_t sub_235F121F8()
{
  uint64_t result;

  sub_235F12AB4();
  if (qword_256393C40 != -1)
    swift_once();
  result = swift_bridgeObjectRelease();
  qword_256394360 = 0xD00000000000001ALL;
  *(_QWORD *)algn_256394368 = 0x8000000235F14B20;
  return result;
}

uint64_t static ActivityAccessibilityIdentifier.MetricGraphicView.base.getter()
{
  return sub_235F0071C(&qword_256393C50, &qword_256394360);
}

uint64_t sub_235F122A4(uint64_t a1)
{
  return sub_235F1234C(a1, 0x65766F6D2ELL, 0xE500000000000000, &qword_256394370, &qword_256394378);
}

uint64_t static ActivityAccessibilityIdentifier.MetricGraphicView.move.getter()
{
  return sub_235F0071C(&qword_256393C58, &qword_256394370);
}

uint64_t sub_235F122E4(uint64_t a1)
{
  return sub_235F1234C(a1, 0x736963726578652ELL, 0xE900000000000065, &qword_256394380, &qword_256394388);
}

uint64_t static ActivityAccessibilityIdentifier.MetricGraphicView.exercise.getter()
{
  return sub_235F0071C(&qword_256393C60, &qword_256394380);
}

uint64_t sub_235F1232C(uint64_t a1)
{
  return sub_235F1234C(a1, 0x646E6174732ELL, 0xE600000000000000, &qword_256394390, &qword_256394398);
}

uint64_t sub_235F1234C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  if (qword_256393C50 != -1)
    swift_once();
  v8 = qword_256394360;
  v9 = *(_QWORD *)algn_256394368;
  swift_bridgeObjectRetain();
  result = sub_235F12964();
  *a4 = v8;
  *a5 = v9;
  return result;
}

uint64_t static ActivityAccessibilityIdentifier.MetricGraphicView.stand.getter()
{
  return sub_235F0071C(&qword_256393C68, &qword_256394390);
}

uint64_t static ActivityAccessibilityIdentifier.build(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256393C78);
  sub_235F007FC();
  return sub_235F1291C();
}

ValueMetadata *type metadata accessor for ActivityAccessibilityIdentifier()
{
  return &type metadata for ActivityAccessibilityIdentifier;
}

ValueMetadata *type metadata accessor for ActivityAccessibilityIdentifier.LandingView()
{
  return &type metadata for ActivityAccessibilityIdentifier.LandingView;
}

ValueMetadata *type metadata accessor for ActivityAccessibilityIdentifier.MetricGraphicView()
{
  return &type metadata for ActivityAccessibilityIdentifier.MetricGraphicView;
}

uint64_t Error.logOutput.getter()
{
  sub_235F12B38();
  return 0;
}

uint64_t sub_235F124C4()
{
  uint64_t v0;

  v0 = sub_235F128B0();
  __swift_allocate_value_buffer(v0, qword_2563943B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2563943B0);
  return sub_235F128A4();
}

uint64_t sub_235F12538(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
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

uint64_t sub_235F12580()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_235F1258C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_235F12598()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_235F125A4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_235F125B0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_235F125BC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_235F125C8()
{
  return MEMORY[0x24BE885C8]();
}

uint64_t sub_235F125D4()
{
  return MEMORY[0x24BE8DD48]();
}

uint64_t sub_235F125E0()
{
  return MEMORY[0x24BE88CB0]();
}

uint64_t sub_235F125EC()
{
  return MEMORY[0x24BE88CB8]();
}

uint64_t sub_235F125F8()
{
  return MEMORY[0x24BE88CC8]();
}

uint64_t sub_235F12604()
{
  return MEMORY[0x24BE88FB8]();
}

uint64_t sub_235F12610()
{
  return MEMORY[0x24BE88FE0]();
}

uint64_t sub_235F1261C()
{
  return MEMORY[0x24BE89028]();
}

uint64_t sub_235F12628()
{
  return MEMORY[0x24BE890C0]();
}

uint64_t sub_235F12634()
{
  return MEMORY[0x24BE890D0]();
}

uint64_t sub_235F12640()
{
  return MEMORY[0x24BE893E8]();
}

uint64_t sub_235F1264C()
{
  return MEMORY[0x24BE89400]();
}

uint64_t sub_235F12658()
{
  return MEMORY[0x24BE895C0]();
}

uint64_t sub_235F12664()
{
  return MEMORY[0x24BE895E0]();
}

uint64_t sub_235F12670()
{
  return MEMORY[0x24BE8A1A0]();
}

uint64_t sub_235F1267C()
{
  return MEMORY[0x24BE8A1A8]();
}

uint64_t sub_235F12688()
{
  return MEMORY[0x24BE8B2F8]();
}

uint64_t sub_235F12694()
{
  return MEMORY[0x24BE8B320]();
}

uint64_t sub_235F126A0()
{
  return MEMORY[0x24BE8BC28]();
}

uint64_t sub_235F126AC()
{
  return MEMORY[0x24BE8BC30]();
}

uint64_t sub_235F126B8()
{
  return MEMORY[0x24BE8BC38]();
}

uint64_t sub_235F126C4()
{
  return MEMORY[0x24BE8BF68]();
}

uint64_t sub_235F126D0()
{
  return MEMORY[0x24BE8BF98]();
}

uint64_t sub_235F126DC()
{
  return MEMORY[0x24BE8C710]();
}

uint64_t sub_235F126E8()
{
  return MEMORY[0x24BE8C720]();
}

uint64_t sub_235F126F4()
{
  return MEMORY[0x24BE8D698]();
}

uint64_t sub_235F12700()
{
  return MEMORY[0x24BE85DE8]();
}

uint64_t sub_235F1270C()
{
  return MEMORY[0x24BE8D6D0]();
}

uint64_t sub_235F12718()
{
  return MEMORY[0x24BE8D6D8]();
}

uint64_t sub_235F12724()
{
  return MEMORY[0x24BE8D6E0]();
}

uint64_t sub_235F12730()
{
  return MEMORY[0x24BE8D6E8]();
}

uint64_t sub_235F1273C()
{
  return MEMORY[0x24BE8D7E0]();
}

uint64_t sub_235F12748()
{
  return MEMORY[0x24BE8D808]();
}

uint64_t sub_235F12754()
{
  return MEMORY[0x24BE8D820]();
}

uint64_t sub_235F12760()
{
  return MEMORY[0x24BEC5550]();
}

uint64_t sub_235F1276C()
{
  return MEMORY[0x24BEC5558]();
}

uint64_t sub_235F12778()
{
  return MEMORY[0x24BEC56A0]();
}

uint64_t sub_235F12784()
{
  return MEMORY[0x24BEC56E8]();
}

uint64_t sub_235F12790()
{
  return MEMORY[0x24BEC5700]();
}

uint64_t sub_235F1279C()
{
  return MEMORY[0x24BEC5870]();
}

uint64_t sub_235F127A8()
{
  return MEMORY[0x24BEC5878]();
}

uint64_t sub_235F127B4()
{
  return MEMORY[0x24BEC5CE8]();
}

uint64_t sub_235F127C0()
{
  return MEMORY[0x24BE8DEB8]();
}

uint64_t sub_235F127CC()
{
  return MEMORY[0x24BE8DEC8]();
}

uint64_t sub_235F127D8()
{
  return MEMORY[0x24BE8DEF8]();
}

uint64_t sub_235F127E4()
{
  return MEMORY[0x24BE8E258]();
}

uint64_t sub_235F127F0()
{
  return MEMORY[0x24BE8E260]();
}

uint64_t sub_235F127FC()
{
  return MEMORY[0x24BE8E2C8]();
}

uint64_t sub_235F12808()
{
  return MEMORY[0x24BE8E2D8]();
}

uint64_t sub_235F12814()
{
  return MEMORY[0x24BE8E390]();
}

uint64_t sub_235F12820()
{
  return MEMORY[0x24BE8E408]();
}

uint64_t sub_235F1282C()
{
  return MEMORY[0x24BE8E410]();
}

uint64_t sub_235F12838()
{
  return MEMORY[0x24BE8E420]();
}

uint64_t sub_235F12844()
{
  return MEMORY[0x24BE86820]();
}

uint64_t sub_235F12850()
{
  return MEMORY[0x24BE86920]();
}

uint64_t sub_235F1285C()
{
  return MEMORY[0x24BE86968]();
}

uint64_t sub_235F12868()
{
  return MEMORY[0x24BE86E48]();
}

uint64_t sub_235F12874()
{
  return MEMORY[0x24BE86E50]();
}

uint64_t sub_235F12880()
{
  return MEMORY[0x24BE86F48]();
}

uint64_t sub_235F1288C()
{
  return MEMORY[0x24BE87338]();
}

uint64_t sub_235F12898()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235F128A4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235F128B0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235F128BC()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_235F128C8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_235F128D4()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_235F128E0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_235F128EC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_235F128F8()
{
  return MEMORY[0x24BE8EE38]();
}

uint64_t sub_235F12904()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235F12910()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235F1291C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_235F12928()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235F12934()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235F12940()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235F1294C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_235F12958()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235F12964()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235F12970()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235F1297C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_235F12988()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_235F12994()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_235F129A0()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_235F129AC()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_235F129B8()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_235F129C4()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_235F129D0()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_235F129DC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_235F129E8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_235F129F4()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_235F12A00()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_235F12A0C()
{
  return MEMORY[0x24BE042E0]();
}

uint64_t sub_235F12A18()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235F12A24()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235F12A30()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_235F12A3C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_235F12A48()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_235F12A54()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_235F12A60()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_235F12A6C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_235F12A78()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_235F12A84()
{
  return MEMORY[0x24BE8DCC8]();
}

uint64_t sub_235F12A90()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235F12A9C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235F12AA8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_235F12AB4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_235F12AC0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235F12ACC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_235F12AD8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235F12AE4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235F12AF0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235F12AFC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235F12B08()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_235F12B14()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235F12B20()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235F12B2C()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_235F12B38()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_235F12B44()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235F12B50()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_235F12B5C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235F12B68()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_235F12B74()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_235F12B80()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_235F12B8C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_235F12B98()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235F12BA4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235F12BB0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_235F12BBC()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t FIUICircularGradientImage()
{
  return MEMORY[0x24BE37808]();
}

uint64_t FIUICircularWorkoutGradientImage()
{
  return MEMORY[0x24BE37810]();
}

uint64_t FIUIStaticWorkoutIconImage()
{
  return MEMORY[0x24BE378E0]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

