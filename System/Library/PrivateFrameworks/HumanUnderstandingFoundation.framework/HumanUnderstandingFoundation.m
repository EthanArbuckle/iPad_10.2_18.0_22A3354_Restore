id sub_217746194(void *a1, void *a2, void *a3)
{
  id v6;

  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAmbientLightColorComponent0_ambientLightColorComponent1_ambientLightColorComponent2_, a1, a2, a3);

  return v6;
}

void AmbientLightMonitor.sendEvent(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;

  objc_msgSend(*(id *)(v1 + 40), sel_sendEvent_, a1);
  if (qword_253F2C868 != -1)
    swift_once();
  v2 = sub_21774789C();
  v19 = sub_21774787C(v2, (uint64_t)qword_253F2CAA0);
  v3 = sub_21775E2C8();
  if (sub_21774784C(v3, v4, v5, v6, v7, v8, v9, v10, v17, v19))
  {
    *(_WORD *)sub_217746660() = 0;
    sub_2177466B4(&dword_217744000, v11, v12, "Finished writing ambient light values to the biome stream", v13, v14, v15, v16, v18, v20);
    sub_217747834();
  }

}

uint64_t sub_2177462A0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_2177462B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  v5 = a4;
  handleAmbientLightEvent(_:_:_:_:)(a1);

}

void handleAmbientLightEvent(_:_:_:_:)(uint64_t a1)
{
  double Current;
  uint64_t v3;
  os_log_type_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;

  if (a1)
  {
    swift_retain();
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - *(double *)(a1 + 48) < 10.0)
    {
      swift_release();
      return;
    }
    *(double *)(a1 + 48) = Current;
    IOHIDEventGetDoubleValue();
    IOHIDEventGetDoubleValue();
    IOHIDEventGetDoubleValue();
    sub_2177464C0();
    sub_217746728(0, &qword_253F2C9E0);
    v18 = (void *)sub_21775E274();
    v19 = (void *)sub_21775E274();
    v20 = (void *)sub_21775E274();
    v24 = sub_217746194(v18, v19, v20);
    AmbientLightMonitor.sendEvent(_:)((uint64_t)v24);
    swift_release();
  }
  else
  {
    if (qword_253F2C868 != -1)
      swift_once();
    v3 = sub_21774789C();
    v23 = sub_21774787C(v3, (uint64_t)qword_253F2CAA0);
    v4 = sub_21775E2C8();
    if (sub_21774784C(v4, v5, v6, v7, v8, v9, v10, v11, v21, v23))
    {
      *(_WORD *)sub_217746660() = 0;
      sub_2177466B4(&dword_217744000, v12, v13, "AmbientLightMonitor handleAmbientLightEvent() target is nil", v14, v15, v16, v17, v22, v24);
      sub_217747834();
    }
  }

}

void sub_2177464C0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  __n128 *v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v2 = v0;
  v3 = (uint64_t *)(v0 + 56);
  sub_2177478A4();
  if (*(_QWORD *)(*(_QWORD *)(v2 + 56) + 16) > 4uLL)
  {
    v1 = *(_QWORD *)(v2 + 64);
    sub_217746620(&qword_253F2C880);
    v7 = (__n128 *)sub_217747874();
    sub_2177477F8(v7, (__n128)xmmword_21775EAA0);
    v5 = *(_QWORD *)(v2 + 56);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v2 + 56) = v5;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      goto LABEL_10;
    if ((v1 & 0x8000000000000000) == 0)
      goto LABEL_5;
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
    sub_217746620(&qword_253F2C880);
    v4 = (__n128 *)sub_217747874();
    sub_2177477F8(v4, (__n128)xmmword_21775EAA0);
    sub_217751A64();
    v5 = *(_QWORD *)(*v3 + 16);
    sub_217751AC4(v5);
    v6 = *v3;
    *(_QWORD *)(v6 + 16) = v5 + 1;
    sub_217747890(v6 + 8 * v5);
    while (1)
    {
      v10 = *(_QWORD *)(v2 + 64);
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (!v11)
        break;
      __break(1u);
LABEL_10:
      sub_217747764(v5);
      v5 = v13;
      *v3 = v13;
      if ((v1 & 0x8000000000000000) != 0)
        goto LABEL_11;
LABEL_5:
      if (v1 >= *(_QWORD *)(v5 + 16))
        goto LABEL_12;
      v9 = v5 + 8 * v1;
      v3 = *(uint64_t **)(v9 + 32);
      sub_217747890(v9);
      swift_bridgeObjectRelease();
    }
    *(_QWORD *)(v2 + 64) = v12 % 5;
  }
}

uint64_t sub_217746620(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A11AD8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_217746660()
{
  return swift_slowAlloc();
}

uint64_t sub_21774666C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_217746674(uint64_t a1)
{
  uint64_t v1;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 - 176);
  return swift_bridgeObjectRelease();
}

uint64_t sub_217746684()
{
  return sub_21775E1A8();
}

uint64_t sub_2177466A4()
{
  return sub_21775E0A0();
}

uint64_t sub_2177466AC()
{
  return swift_retain();
}

void sub_2177466B4(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log)
{
  os_log_type_t v10;
  uint8_t *v11;

  _os_log_impl(a1, log, v10, a4, v11, 2u);
}

void sub_2177466C8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t sub_2177466E8()
{
  return swift_bridgeObjectRelease();
}

BOOL sub_217746718(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t sub_217746728(uint64_t a1, unint64_t *a2)
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

HumanUnderstandingFoundation::AmbientLightType_optional __swiftcall AmbientLightType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 8;
  if ((unint64_t)rawValue < 8)
    v2 = rawValue;
  *v1 = v2;
  return (HumanUnderstandingFoundation::AmbientLightType_optional)rawValue;
}

uint64_t AmbientLightType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_21774677C(char *a1, char *a2)
{
  return sub_21774FE70(*a1, *a2);
}

void sub_217746788()
{
  sub_21775B1DC();
}

uint64_t sub_217746790()
{
  return sub_21774FE80();
}

void sub_217746798()
{
  sub_21775B25C();
}

HumanUnderstandingFoundation::AmbientLightType_optional sub_2177467A0(Swift::Int *a1)
{
  return AmbientLightType.init(rawValue:)(*a1);
}

uint64_t sub_2177467A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = AmbientLightType.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2177467CC()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for AmbientLightMonitor();
  v0 = swift_allocObject();
  result = sub_217746848(1);
  qword_253F2C878 = v0;
  return result;
}

uint64_t static AmbientLightMonitor.shared.getter()
{
  if (qword_253F2C8C0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_217746848(char a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  void *v12;
  __IOHIDEventSystemClient *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;

  v3 = (_QWORD *)v1;
  v16 = sub_21775E2E0();
  v4 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_217747818();
  sub_21775E2D4();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  sub_217747840();
  MEMORY[0x24BDAC7A8]();
  sub_21775E160();
  sub_217747840();
  MEMORY[0x24BDAC7A8]();
  sub_21774785C();
  *(_OWORD *)(v1 + 16) = xmmword_21775EA90;
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  v6 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 48) = 0;
  *(_QWORD *)(v1 + 56) = v6;
  sub_217746728(0, &qword_253F2C9D8);
  sub_21775E154();
  sub_217747778(&qword_253F2C9D0, v5, MEMORY[0x24BEE5698]);
  sub_217746620(&qword_253F2C9B8);
  sub_2177477B8((unint64_t *)&unk_253F2C9C0, &qword_253F2C9B8);
  sub_21775E334();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v2, *MEMORY[0x24BEE5750], v16);
  *(_QWORD *)(v1 + 72) = sub_21775E2F8();
  v7 = objc_msgSend((id)BiomeLibrary(), sel_ContextualUnderstanding);
  swift_unknownObjectRelease();
  v8 = objc_msgSend(v7, sel_AmbientLight);
  swift_unknownObjectRelease();
  v3[4] = v8;
  v3[5] = objc_msgSend(v8, sel_source);
  if ((a1 & 1) == 0)
    return (uint64_t)v3;
  v9 = IOHIDEventSystemClientCreateWithType();
  v10 = (void *)v3[10];
  v3[10] = v9;

  result = v3[10];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  result = IOHIDEventSystemClientScheduleWithDispatchQueue();
  if (!v3[10])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  swift_retain();
  result = IOHIDEventSystemClientRegisterEventCallback();
  v12 = (void *)v3[10];
  if (v12)
  {
    v13 = v12;
    v14 = (__CFString *)sub_21775E1B4();
    v15 = (void *)sub_21775E244();
    IOHIDEventSystemClientSetProperty(v13, v14, v15);

    return (uint64_t)v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

HumanUnderstandingFoundation::AmbientLightType __swiftcall AmbientLightMonitor.getCurrentAmbientLightType()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
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
  dispatch_semaphore_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  NSObject *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int64_t v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int64_t v47;
  unint64_t v48;
  int64_t v49;
  HumanUnderstandingFoundation::AmbientLightType result;
  _QWORD v51[2];
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD aBlock[7];

  v52 = v0;
  v60 = sub_21775E130();
  v58 = *(_QWORD *)(v60 - 8);
  sub_217747840();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_21774785C();
  v61 = sub_21775E184();
  v59 = *(_QWORD *)(v61 - 8);
  sub_217747840();
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v56 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v57 = (char *)v51 - v6;
  v7 = sub_21775E148();
  v55 = *(_QWORD *)(v7 - 8);
  sub_217747840();
  MEMORY[0x24BDAC7A8](v8);
  sub_217747818();
  v9 = sub_21775E160();
  v53 = *(_QWORD *)(v9 - 8);
  v54 = v9;
  sub_217747840();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_217747874();
  sub_217747460();
  *(_QWORD *)(v13 + 16) = sub_21775E1A8();
  v51[0] = v13 + 16;
  v14 = dispatch_semaphore_create(0);
  v15 = *(void **)(v1 + 72);
  v16 = (_QWORD *)sub_217747874();
  v16[2] = v1;
  v16[3] = v13;
  v16[4] = v14;
  aBlock[4] = sub_2177474D0;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2177473B4;
  aBlock[3] = &unk_24D802C88;
  v17 = _Block_copy(aBlock);
  v18 = v15;
  swift_retain();
  v51[1] = v13;
  swift_retain();
  v19 = v14;
  sub_21775E154();
  v62 = MEMORY[0x24BEE4AF8];
  sub_217747778(&qword_254F00270, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_217746620(&qword_254F00278);
  sub_2177477B8(&qword_254F00280, &qword_254F00278);
  sub_21775E334();
  MEMORY[0x219A1152C](0, v12, v2, v17);
  _Block_release(v17);

  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v2, v7);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v12, v54);
  swift_release();
  v20 = v56;
  sub_21775E16C();
  *v3 = 1;
  v21 = v58;
  v22 = v60;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v58 + 104))(v3, *MEMORY[0x24BEE5420], v60);
  v23 = v57;
  sub_21775E178();
  (*(void (**)(_QWORD *, uint64_t))(v21 + 8))(v3, v22);
  v24 = *(void (**)(char *, uint64_t))(v59 + 8);
  v25 = v20;
  v26 = v61;
  v24(v25, v61);
  sub_21775E304();
  v24(v23, v26);
  if ((sub_21775E13C() & 1) != 0)
  {
    if (qword_253F2C868 != -1)
      goto LABEL_33;
    goto LABEL_3;
  }
  v31 = (uint64_t *)v51[0];
  sub_2177478A4();
  v32 = 0;
  v33 = 0;
  v34 = *v31;
  v35 = *v31;
  v36 = 1 << *(_BYTE *)(*v31 + 32);
  v37 = -1;
  if (v36 < 64)
    v37 = ~(-1 << v36);
  v39 = *(_QWORD *)(v35 + 64);
  v38 = v35 + 64;
  v40 = v37 & v39;
  v41 = (unint64_t)(v36 + 63) >> 6;
  v42 = 7;
  while (1)
  {
    v43 = v42;
    v44 = v32;
    if (v40)
    {
      v45 = __clz(__rbit64(v40));
      v40 &= v40 - 1;
      v46 = v45 | (v33 << 6);
      goto LABEL_24;
    }
    v47 = v33 + 1;
    if (__OFADD__(v33, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v47 >= v41)
      goto LABEL_28;
    v48 = *(_QWORD *)(v38 + 8 * v47);
    ++v33;
    if (!v48)
    {
      v33 = v47 + 1;
      if (v47 + 1 >= v41)
        goto LABEL_28;
      v48 = *(_QWORD *)(v38 + 8 * v33);
      if (!v48)
      {
        v33 = v47 + 2;
        if (v47 + 2 >= v41)
          goto LABEL_28;
        v48 = *(_QWORD *)(v38 + 8 * v33);
        if (!v48)
          break;
      }
    }
LABEL_23:
    v40 = (v48 - 1) & v48;
    v46 = __clz(__rbit64(v48)) + (v33 << 6);
LABEL_24:
    v42 = *(unsigned __int8 *)(*(_QWORD *)(v34 + 48) + v46);
    v32 = *(_QWORD *)(*(_QWORD *)(v34 + 56) + 8 * v46);
    if (v44 >= v32 && (v32 != v44 || v42 >= v43))
    {
      v32 = v44;
      v42 = v43;
    }
  }
  v49 = v47 + 3;
  if (v49 >= v41)
  {
LABEL_28:
    sub_2177478B0();
    goto LABEL_30;
  }
  v48 = *(_QWORD *)(v38 + 8 * v49);
  if (v48)
  {
    v33 = v49;
    goto LABEL_23;
  }
  while (1)
  {
    v33 = v49 + 1;
    if (__OFADD__(v49, 1))
      break;
    if (v33 >= v41)
      goto LABEL_28;
    v48 = *(_QWORD *)(v38 + 8 * v33);
    ++v49;
    if (v48)
      goto LABEL_23;
  }
LABEL_32:
  __break(1u);
LABEL_33:
  swift_once();
LABEL_3:
  v27 = sub_21774789C();
  v28 = sub_21774787C(v27, (uint64_t)qword_253F2CAA0);
  v29 = sub_21775E2C8();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)sub_217746660();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_217744000, v28, v29, "AmbientLightMonitor getCurrentAmbientLightType() timed out waiting for semaphore", v30, 2u);
    sub_217747834();
  }
  sub_2177478B0();

  LOBYTE(v43) = 7;
LABEL_30:

  *v52 = v43;
  return result;
}

uint64_t sub_2177470B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  _QWORD *v27;
  char v28[24];

  swift_beginAccess();
  v4 = *(_QWORD *)(a1 + 56);
  v26 = *(_QWORD *)(v4 + 16);
  if (!v26)
    return sub_21775E310();
  v5 = (uint64_t *)(a2 + 16);
  swift_bridgeObjectRetain();
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD *)(v4 + 8 * v6 + 32);
    v8 = *(_QWORD *)(v7 + 16);
    if (!v8)
      break;
    if (v8 == 1)
      goto LABEL_23;
    if (v8 < 3)
      goto LABEL_24;
    sub_217747300(v28, *(double *)(v7 + 32), *(double *)(v7 + 40), *(double *)(v7 + 48));
    v9 = v28[0];
    swift_beginAccess();
    v10 = *v5;
    if (*(_QWORD *)(*v5 + 16) && (v11 = sub_21774D1C8(v9), (v12 & 1) != 0))
      v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
    else
      v13 = 0;
    swift_endAccess();
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_25;
    swift_beginAccess();
    swift_isUniquelyReferenced_nonNull_native();
    v16 = *v5;
    v27 = (_QWORD *)*v5;
    *v5 = 0x8000000000000000;
    v17 = sub_21774D1C8(v9);
    if (__OFADD__(*(_QWORD *)(v16 + 16), (v18 & 1) == 0))
      goto LABEL_26;
    v19 = v17;
    v20 = v18;
    sub_217746620(&qword_254F00358);
    if ((sub_21775E3D0() & 1) != 0)
    {
      v21 = sub_21774D1C8(v9);
      if ((v20 & 1) != (v22 & 1))
        goto LABEL_28;
      v19 = v21;
    }
    if ((v20 & 1) != 0)
    {
      *(_QWORD *)(v27[7] + 8 * v19) = v15;
    }
    else
    {
      v27[(v19 >> 6) + 8] |= 1 << v19;
      *(_BYTE *)(v27[6] + v19) = v9;
      *(_QWORD *)(v27[7] + 8 * v19) = v15;
      v23 = v27[2];
      v14 = __OFADD__(v23, 1);
      v24 = v23 + 1;
      if (v14)
        goto LABEL_27;
      v27[2] = v24;
    }
    ++v6;
    *v5 = (uint64_t)v27;
    swift_bridgeObjectRelease();
    swift_endAccess();
    if (v26 == v6)
    {
      swift_bridgeObjectRelease();
      return sub_21775E310();
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  result = sub_21775E484();
  __break(1u);
  return result;
}

void sub_217747300(char *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  char v4;
  double v7;

  if (a3 >= 4.0)
  {
    if (a3 < 100.0 && a4 < a2 && a4 < a3)
    {
      v4 = 1;
    }
    else
    {
      v7 = a2 * 0.8;
      if (a3 >= 200.0 || v7 > a4)
      {
        if (a3 >= 1000.0 || v7 <= a4)
        {
          if (a3 >= 30000.0 || v7 <= a4)
          {
            if (a3 >= 10000.0)
              v4 = 6;
            else
              v4 = 5;
          }
          else
          {
            v4 = 4;
          }
        }
        else
        {
          v4 = 3;
        }
      }
      else
      {
        v4 = 2;
      }
    }
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
}

uint64_t sub_2177473B4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id *AmbientLightMonitor.deinit()
{
  id *v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AmbientLightMonitor.__deallocating_deinit()
{
  AmbientLightMonitor.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_21774743C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_217747460()
{
  unint64_t result;

  result = qword_254F00268;
  if (!qword_254F00268)
  {
    result = MEMORY[0x219A11AF0](&protocol conformance descriptor for AmbientLightType, &type metadata for AmbientLightType);
    atomic_store(result, (unint64_t *)&qword_254F00268);
  }
  return result;
}

uint64_t sub_21774749C()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2177474D0()
{
  uint64_t v0;

  return sub_2177470B4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2177474DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2177474EC()
{
  return swift_release();
}

uint64_t sub_2177474F4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A11AE4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21774753C()
{
  unint64_t result;

  result = qword_254F00288;
  if (!qword_254F00288)
  {
    result = MEMORY[0x219A11AF0](&protocol conformance descriptor for AmbientLightType, &type metadata for AmbientLightType);
    atomic_store(result, (unint64_t *)&qword_254F00288);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for AmbientLightType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AmbientLightType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AmbientLightType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21774765C + 4 * byte_21775EAE5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_217747690 + 4 * byte_21775EAE0[v4]))();
}

uint64_t sub_217747690(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_217747698(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2177476A0);
  return result;
}

uint64_t sub_2177476AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2177476B4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2177476B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2177476C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2177476CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2177476D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AmbientLightType()
{
  return &type metadata for AmbientLightType;
}

uint64_t type metadata accessor for AmbientLightMonitor()
{
  return objc_opt_self();
}

uint64_t method lookup function for AmbientLightMonitor()
{
  return swift_lookUpClassMethod();
}

void type metadata accessor for IOHIDEventSystemClient()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254F00350)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254F00350);
  }
}

void sub_217747764(uint64_t a1)
{
  sub_217756CD4(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_217747778(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A11AF0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2177477B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_2177474F4(a2);
    result = MEMORY[0x219A11AF0](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2177477F8(__n128 *a1, __n128 a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  a1[1] = a2;
  a1[2].n128_u64[0] = v4;
  a1[2].n128_u64[1] = v3;
  a1[3].n128_u64[0] = v2;
  return swift_beginAccess();
}

uint64_t sub_217747818()
{
  return 0;
}

void sub_217747834()
{
  JUMPOUT(0x219A11B68);
}

BOOL sub_21774784C(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

uint64_t sub_217747874()
{
  return swift_allocObject();
}

uint64_t sub_21774787C(uint64_t a1, uint64_t a2)
{
  sub_2177462A0(a1, a2);
  return sub_21775E0F4();
}

uint64_t sub_217747890@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 32) = v1;
  return swift_endAccess();
}

uint64_t sub_21774789C()
{
  return sub_21775E10C();
}

uint64_t sub_2177478A4()
{
  return swift_beginAccess();
}

uint64_t sub_2177478B0()
{
  return swift_release();
}

uint64_t sub_2177478B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = sub_21774D218(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_21774790C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[4];

  sub_21774C9D8(a1, (uint64_t)v10);
  sub_217746620(&qword_254F003C0);
  sub_217746620(&qword_254F003E0);
  if (!swift_dynamicCast())
    return sub_21774C9D8(a2, a3);
  sub_21774C9D8(a2, (uint64_t)v10);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return sub_21774C9D8(a2, a3);
  }
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10[0] = v9;
  sub_21774D480(v9, sub_21774D44C, 0, isUniquelyReferenced_nonNull_native, v10);
  if (v3)
  {
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    v7 = v10[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10[0] = v7;
    return swift_dynamicCast();
  }
  return result;
}

uint64_t BMContextualUnderstandingSoundAnalysis.asHierarchicalDictionary()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  __n128 *inited;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __n128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v41;
  __n128 *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __n128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  unint64_t v56;
  char v57;
  unint64_t v58;
  char v59;
  uint64_t *v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  unint64_t v68;
  char v69;
  char v70;
  char v71;
  unint64_t v72;
  char v73;
  uint64_t *v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  unint64_t v79;
  uint64_t v80;
  BOOL v81;
  int64_t v82;
  uint64_t result;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int64_t v87;
  _BYTE *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103[3];
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  _BYTE v108[32];
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;

  sub_217746620(&qword_254F003C0);
  v0 = sub_21775E1A8();
  v1 = BMContextualUnderstandingSoundAnalysis.asFlatDictionary()();
  sub_21774FBE4(v1, &qword_254F003C8);
  v2 = static BMContextualUnderstandingSoundAnalysis.soundHierarchyDictionary()();
  v3 = v2;
  v4 = 0;
  v5 = *(_QWORD *)(v1 + 64);
  v86 = v1 + 64;
  v89 = v1;
  v6 = 1 << *(_BYTE *)(v1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v87 = (unint64_t)(v6 + 63) >> 6;
  v88 = v108;
  v90 = &v111;
  v94 = &v102;
  v85 = v87 - 1;
  *((_QWORD *)&v9 + 1) = 2;
  *(_QWORD *)&v9 = 136315138;
  v92 = v9;
  v91 = MEMORY[0x24BEE4AD8] + 8;
  v99 = v2;
  if ((v7 & v5) == 0)
    goto LABEL_6;
LABEL_4:
  v10 = __clz(__rbit64(v8));
  v11 = (v8 - 1) & v8;
  v12 = v10 | (v4 << 6);
LABEL_5:
  v13 = *(_QWORD *)(v89 + 56);
  v14 = (_QWORD *)(*(_QWORD *)(v89 + 48) + 16 * v12);
  v15 = v14[1];
  *(_QWORD *)&v107 = *v14;
  *((_QWORD *)&v107 + 1) = v15;
  sub_21774C9D8(v13 + 32 * v12, (uint64_t)v88);
  sub_21774FB64();
  while (1)
  {
    sub_21774CA20((uint64_t)&v107, (uint64_t)&v109, &qword_254F003D0);
    v18 = v110;
    if (!v110)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return v0;
    }
    v95 = v11;
    v96 = v4;
    v97 = 0;
    v98 = v0;
    v19 = v109;
    sub_21774FAE0((uint64_t)v90, (uint64_t)&v107);
    v105 = v19;
    v106 = v18;
    swift_bridgeObjectRetain_n();
    v20 = sub_2177478B8(v19, v18, v3);
    v22 = v21;
    sub_21774FA48();
    if (v22)
      v23 = v20;
    else
      v23 = 1953460082;
    if (!v22)
      v22 = 0xE400000000000000;
    v24 = (_QWORD *)sub_21775E1A8();
    v25 = v23 == 1953460082 && v22 == 0xE400000000000000;
    if (!v25 && (sub_21774FA74() & 1) == 0)
      break;
LABEL_26:
    swift_bridgeObjectRelease();
    v27 = v97;
    v26 = v98;
    v3 = v99;
    if (v24[2])
    {
      sub_21774FA48();
    }
    else
    {
      sub_217746620(&qword_254F003D8);
      inited = (__n128 *)swift_initStackObject();
      sub_21774FBF8(inited, v29, v30, v31, v32, v33, v34, v35, v84, v85, v86, v87, (uint64_t)v88, v89, (uint64_t)v90, v91, v92, *((uint64_t *)&v92 + 1), v93,
        (uint64_t)v94,
        v95,
        v96,
        v97,
        v98,
        v36);
      *(_QWORD *)(v37 + 32) = v19;
      *(_QWORD *)(v37 + 40) = v18;
      sub_21774C9D8((uint64_t)&v107, v38);
      v39 = sub_21775E1A8();
      sub_21774FAB0();
      v24 = (_QWORD *)v39;
    }
    swift_bridgeObjectRetain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v103[0] = v26;
    sub_21774D480((uint64_t)v24, (uint64_t)sub_21774D44C, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v103);
    if (v27)
      goto LABEL_87;
    v0 = v103[0];
    sub_21774FAB0();
    sub_21774FA90();
    sub_21774FB84();
    sub_21774FAB0();
    swift_bridgeObjectRelease();
    v8 = v95;
    v4 = v96;
    if (v95)
      goto LABEL_4;
LABEL_6:
    v16 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_82;
    if (v16 < v87)
    {
      v17 = *(_QWORD *)(v86 + 8 * v16);
      if (v17)
        goto LABEL_9;
      v4 += 2;
      if (v16 + 1 >= v87)
      {
        v4 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v86 + 8 * v4);
        if (v17)
        {
          ++v16;
LABEL_9:
          v11 = (v17 - 1) & v17;
          v12 = __clz(__rbit64(v17)) + (v16 << 6);
          v4 = v16;
          goto LABEL_5;
        }
        if (v16 + 2 < v87)
        {
          v17 = *(_QWORD *)(v86 + 8 * (v16 + 2));
          if (v17)
          {
            v16 += 2;
            goto LABEL_9;
          }
          v82 = v16 + 3;
          if (v16 + 3 < v87)
          {
            v17 = *(_QWORD *)(v86 + 8 * v82);
            if (!v17)
            {
              while (1)
              {
                v16 = v82 + 1;
                if (__OFADD__(v82, 1))
                  goto LABEL_83;
                if (v16 >= v87)
                {
                  v4 = v85;
                  goto LABEL_14;
                }
                v17 = *(_QWORD *)(v86 + 8 * v16);
                ++v82;
                if (v17)
                  goto LABEL_9;
              }
            }
            v16 += 3;
            goto LABEL_9;
          }
          v4 = v16 + 2;
        }
      }
    }
LABEL_14:
    v11 = 0;
    memset(v108, 0, sizeof(v108));
    v107 = 0u;
  }
  swift_beginAccess();
  while (1)
  {
    v41 = v18;
    v18 = v22;
    sub_217746620(&qword_254F003D8);
    v42 = (__n128 *)swift_initStackObject();
    sub_21774FBF8(v42, v43, v44, v45, v46, v47, v48, v49, v84, v85, v86, v87, (uint64_t)v88, v89, (uint64_t)v90, v91, v92, *((uint64_t *)&v92 + 1), v93,
      (uint64_t)v94,
      v95,
      v96,
      v97,
      v98,
      v50);
    *(_QWORD *)(v51 + 32) = v19;
    *(_QWORD *)(v51 + 40) = v41;
    sub_21774C9D8((uint64_t)&v107, v52);
    swift_bridgeObjectRetain();
    v53 = sub_21775E1A8();
    v104 = sub_217746620(&qword_254F003E0);
    v103[0] = v53;
    sub_21774FAE0((uint64_t)v103, (uint64_t)&v101);
    swift_isUniquelyReferenced_nonNull_native();
    v100 = v23;
    v54 = sub_21774FBAC(v23, v22);
    if (__OFADD__(v24[2], (v55 & 1) == 0))
      break;
    v56 = v54;
    v57 = v55;
    sub_217746620(&qword_254F003E8);
    if ((sub_21775E3D0() & 1) != 0)
    {
      v58 = sub_21774D218(v23, v22);
      if ((v57 & 1) != (v59 & 1))
        goto LABEL_86;
      v56 = v58;
    }
    if ((v57 & 1) != 0)
    {
      sub_21774D810((uint64_t)&v101, v24[7] + 32 * v56);
    }
    else
    {
      sub_21774FB54((uint64_t)&v24[v56 >> 6]);
      v60 = (uint64_t *)(v24[6] + 16 * v56);
      *v60 = v23;
      v60[1] = v22;
      sub_21774FAE0((uint64_t)&v101, v24[7] + 32 * v56);
      v61 = v24[2];
      v62 = __OFADD__(v61, 1);
      v63 = v61 + 1;
      if (v62)
        goto LABEL_81;
      v24[2] = v63;
      sub_21774666C();
    }
    sub_21774FA48();
    sub_21774FA90();
    v64 = v105;
    v65 = v106;
    sub_21774FC0C();
    swift_bridgeObjectRetain();
    v66 = sub_21774FBAC(v64, v65);
    LOBYTE(v64) = v67;
    sub_21774FAB0();
    if ((v64 & 1) != 0)
    {
      swift_isUniquelyReferenced_nonNull_native();
      v101 = (uint64_t)v24;
      sub_21775E3D0();
      v24 = (_QWORD *)v101;
      swift_bridgeObjectRelease();
      sub_21774FAE0(v24[7] + 32 * v66, (uint64_t)v103);
      sub_21775E3E8();
      sub_21774FA90();
    }
    else
    {
      sub_21774FB24();
    }
    sub_21774FB7C();
    sub_21774D3F4((uint64_t)v103, &qword_254F003F0);
    v105 = v23;
    v106 = v22;
    sub_21774666C();
    sub_21774FBA4();
    if (!v24[2])
      goto LABEL_84;
    sub_21774666C();
    v68 = sub_21774FBAC(v23, v22);
    if ((v69 & 1) != 0)
      sub_21774C9D8(v24[7] + 32 * v68, (uint64_t)v103);
    else
      sub_21774FB24();
    sub_21774FA48();
    if (v104 == 1)
      goto LABEL_85;
    sub_21774FB84();
    sub_21774FAE0((uint64_t)v103, (uint64_t)&v107);
    if (!*(_QWORD *)(v99 + 16)
      || (sub_21774FAD8(),
          sub_21774FC0C(),
          sub_21774FB34(),
          v71 = v70,
          swift_bridgeObjectRelease(),
          sub_21774FB7C(),
          (v71 & 1) == 0))
    {
      if (qword_254F00250 != -1)
        swift_once();
      v75 = sub_21775E10C();
      sub_2177462A0(v75, (uint64_t)qword_254F00EE0);
      v76 = sub_21775E0F4();
      v77 = sub_21775E2B0();
      if (os_log_type_enabled(v76, v77))
      {
        v78 = (uint8_t *)swift_slowAlloc();
        v103[0] = swift_slowAlloc();
        *(_DWORD *)v78 = v92;
        v80 = v105;
        v79 = v106;
        sub_21774FAD8();
        v101 = sub_21774CA64(v80, v79, v103);
        sub_21775E31C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_217744000, v76, v77, "Soundname: %s is not contained in hierarchy dictionary", v78, 0xCu);
        swift_arrayDestroy();
        sub_217747834();
      }

      goto LABEL_59;
    }
    if (!*(_QWORD *)(v99 + 16))
      goto LABEL_59;
    sub_21774FC0C();
    v72 = sub_21774FB34();
    if ((v73 & 1) == 0)
    {
      sub_21774FB7C();
LABEL_59:
      v22 = 0xE400000000000000;
      v23 = 1953460082;
      goto LABEL_60;
    }
    v74 = (uint64_t *)(*(_QWORD *)(v99 + 56) + 16 * v72);
    v23 = *v74;
    v22 = v74[1];
    swift_bridgeObjectRetain();
    sub_21774FB7C();
LABEL_60:
    v81 = v23 == 1953460082 && v22 == 0xE400000000000000;
    v19 = v100;
    if (v81 || (sub_21774FA74() & 1) != 0)
      goto LABEL_26;
  }
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  sub_21774FB24();
LABEL_85:
  __break(1u);
LABEL_86:
  sub_21775E484();
  __break(1u);
LABEL_87:
  result = sub_21774FA90();
  __break(1u);
  return result;
}

uint64_t BMContextualUnderstandingSoundAnalysis.asFlatDictionary()()
{
  void *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  double v17;
  char v18;
  unint64_t v19;
  double v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  _BOOL8 v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  double v35;
  double v36;
  unint64_t v37;
  char v38;
  double v39;
  unint64_t v40;
  char v41;
  char v42;
  unint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t result;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  id v56;
  _QWORD *v57;

  v1 = (_QWORD *)sub_21774FB10();
  v2 = sub_21774FB10();
  v3 = objc_msgSend(v0, sel_classifiedSounds);
  sub_21774FBE4((uint64_t)v3, &qword_254F003F8);
  v4 = sub_21775E250();

  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_38:
    sub_21774FAB0();
    v50 = sub_21774FB64();
    v51 = sub_21774BBC8(v50);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    return v51;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  v5 = sub_21775E40C();
  sub_21774FAB0();
  if (!v5)
    goto LABEL_38;
LABEL_3:
  v53 = v4;
  v54 = v4 & 0xC000000000000001;
  v6 = 4;
  while (1)
  {
    if (v54)
      v7 = (id)MEMORY[0x219A115B0](v6 - 4, v4);
    else
      v7 = *(id *)(v4 + 8 * v6);
    v8 = v7;
    if (__OFADD__(v6 - 4, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    v9 = sub_21774EE78(v7);
    if (!v10)
      break;
    v11 = v9;
    v12 = v10;
    v13 = 0.0;
    if (v1[2])
    {
      v14 = sub_21774FB6C();
      if ((v15 & 1) != 0)
        v13 = *(double *)(v1[7] + 8 * v14);
    }
    v55 = v6 - 3;
    v56 = v8;
    if (!*(_QWORD *)(v2 + 16))
      goto LABEL_18;
    sub_21774666C();
    v16 = sub_21774FA38();
    v17 = 1.0;
    if ((v18 & 1) != 0)
      v17 = *(double *)(*(_QWORD *)(v2 + 56) + 8 * v16);
    sub_21774FA48();
    v13 = v13 * v17;
    if (*(_QWORD *)(v2 + 16))
    {
      sub_21774666C();
      v19 = sub_21774FA38();
      v20 = 0.0;
      if ((v21 & 1) != 0)
        v20 = *(double *)(*(_QWORD *)(v2 + 56) + 8 * v19);
    }
    else
    {
LABEL_18:
      sub_21774666C();
      v20 = 0.0;
    }
    swift_isUniquelyReferenced_nonNull_native();
    v57 = (_QWORD *)v2;
    v22 = sub_21774FA38();
    v24 = *(_QWORD *)(v2 + 16);
    v25 = (v23 & 1) == 0;
    v2 = v24 + v25;
    if (__OFADD__(v24, v25))
      goto LABEL_40;
    v26 = v22;
    v27 = v23;
    v4 = sub_217746620(&qword_254F00400);
    if ((sub_21775E3D0() & 1) != 0)
    {
      v28 = sub_21774FB04();
      if ((v27 & 1) != (v29 & 1))
        goto LABEL_49;
      v26 = v28;
    }
    v2 = (uint64_t)v57;
    if ((v27 & 1) != 0)
    {
      *(double *)(v57[7] + 8 * v26) = v20 + 1.0;
    }
    else
    {
      sub_21774FB54((uint64_t)&v57[v26 >> 6]);
      v30 = (uint64_t *)(v57[6] + 16 * v26);
      *v30 = v11;
      v30[1] = v12;
      *(_QWORD *)(v57[7] + 8 * v26) = v31;
      v32 = v57[2];
      v33 = __OFADD__(v32, 1);
      v34 = v32 + 1;
      if (v33)
        goto LABEL_43;
      v57[2] = v34;
      sub_21774666C();
    }
    sub_21774FA48();
    sub_21774FA90();
    objc_msgSend(v56, sel_confidence);
    if (!v57[2])
      goto LABEL_41;
    v36 = v35;
    sub_21774666C();
    v37 = sub_21774FA38();
    if ((v38 & 1) == 0)
      goto LABEL_48;
    v39 = *(double *)(v57[7] + 8 * v37);
    sub_21774FA48();
    swift_isUniquelyReferenced_nonNull_native();
    v40 = sub_21774FB6C();
    v42 = v41;
    if (__OFADD__(v1[2], (v41 & 1) == 0))
      goto LABEL_42;
    v43 = v40;
    v4 = v53;
    if ((sub_21775E3D0() & 1) != 0)
    {
      v44 = sub_21774FB04();
      if ((v42 & 1) != (v45 & 1))
        goto LABEL_49;
      v43 = v44;
    }
    if ((v42 & 1) != 0)
    {
      *(double *)(v1[7] + 8 * v43) = (v13 + v36) / v39;
    }
    else
    {
      sub_21774FB54((uint64_t)&v1[v43 >> 6]);
      v46 = (uint64_t *)(v1[6] + 16 * v43);
      *v46 = v11;
      v46[1] = v12;
      *(_QWORD *)(v1[7] + 8 * v43) = v47;
      v48 = v1[2];
      v33 = __OFADD__(v48, 1);
      v49 = v48 + 1;
      if (v33)
        goto LABEL_44;
      v1[2] = v49;
      sub_21774666C();
    }

    sub_21774FA48();
    sub_21774FA90();
    ++v6;
    if (v55 == v5)
      goto LABEL_38;
  }
  __break(1u);
LABEL_48:
  sub_21774FA48();
  __break(1u);
LABEL_49:
  result = sub_21775E484();
  __break(1u);
  return result;
}

uint64_t static BMContextualUnderstandingSoundAnalysis.soundHierarchyDictionary()()
{
  uint64_t v0;

  sub_217746620(&qword_254F00408);
  v0 = sub_217747874();
  *(_QWORD *)(v0 + 32) = 0x6F6964726F636361;
  *(_QWORD *)(v0 + 40) = 0xE90000000000006ELL;
  *(_QWORD *)(v0 + 64) = 0x63697473756F6361;
  *(_QWORD *)(v0 + 72) = 0xEF7261746975675FLL;
  *(_QWORD *)(v0 + 96) = 0x646E6F635F726961;
  *(_QWORD *)(v0 + 104) = 0xEF72656E6F697469;
  *(_QWORD *)(v0 + 128) = 0x6E726F685F726961;
  *(_QWORD *)(v0 + 160) = 0x7466617263726961;
  *(_QWORD *)(v0 + 192) = 0x656E616C70726961;
  *(_QWORD *)(v0 + 208) = 0x7466617263726961;
  *(_QWORD *)(v0 + 256) = 0x6C635F6D72616C61;
  *(_QWORD *)(v0 + 288) = 0x636E616C75626D61;
  *(_QWORD *)(v0 + 296) = 0xEF6E657269735F65;
  *(_QWORD *)(v0 + 352) = 0x657375616C707061;
  *(_QWORD *)(v0 + 368) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 376) = 0x800000021775F470;
  strcpy((char *)(v0 + 384), "artillery_fire");
  *(_BYTE *)(v0 + 399) = -18;
  *(_QWORD *)(v0 + 408) = 0x800000021775F490;
  *(_QWORD *)(v0 + 416) = 0x656C62626162;
  *(_QWORD *)(v0 + 432) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 440) = 0x800000021775F470;
  *(_QWORD *)(v0 + 448) = 0x7972635F79626162;
  *(_QWORD *)(v0 + 456) = 0xEB00000000676E69;
  strcpy((char *)(v0 + 464), "crying_sobbing");
  *(_BYTE *)(v0 + 479) = -18;
  strcpy((char *)(v0 + 480), "baby_laughter");
  *(_WORD *)(v0 + 494) = -4864;
  *(_QWORD *)(v0 + 512) = 0x7365706970676162;
  *(_QWORD *)(v0 + 544) = 0x6F6A6E6162;
  *(_QWORD *)(v0 + 584) = 0x800000021775F4D0;
  *(_QWORD *)(v0 + 608) = 0x7572645F73736162;
  *(_QWORD *)(v0 + 616) = 0xE90000000000006DLL;
  *(_QWORD *)(v0 + 640) = 0x6975675F73736162;
  *(_QWORD *)(v0 + 672) = 0x6E6F6F73736162;
  *(_QWORD *)(v0 + 712) = 0x800000021775F510;
  *(_QWORD *)(v0 + 736) = 0x635F656C74746162;
  *(_QWORD *)(v0 + 744) = 0xEA00000000007972;
  *(_QWORD *)(v0 + 768) = 0x786F625F74616562;
  *(_QWORD *)(v0 + 776) = 0xEB00000000676E69;
  *(_QWORD *)(v0 + 800) = 0x7A7A75625F656562;
  *(_QWORD *)(v0 + 832) = 1885693282;
  *(_QWORD *)(v0 + 896) = 0x616C5F796C6C6562;
  *(_QWORD *)(v0 + 904) = 0xEB00000000686775;
  *(_QWORD *)(v0 + 928) = 0x656C6379636962;
  strcpy((char *)(v0 + 960), "bicycle_bell");
  *(_BYTE *)(v0 + 973) = 0;
  *(_WORD *)(v0 + 974) = -5120;
  *(_QWORD *)(v0 + 1032) = 0x800000021775F5D0;
  *(_QWORD *)(v0 + 1048) = 0x800000021775F5F0;
  strcpy((char *)(v0 + 1056), "bird_flapping");
  *(_QWORD *)(v0 + 1088) = 0x7571735F64726962;
  *(_QWORD *)(v0 + 1096) = 0xEB000000006B7761;
  *(_QWORD *)(v0 + 1112) = 0x800000021775F5F0;
  *(_QWORD *)(v0 + 1128) = 0x800000021775F5F0;
  *(_QWORD *)(v0 + 1152) = 0x676E69746962;
  *(_QWORD *)(v0 + 1184) = 0x7265646E656C62;
  *(_QWORD *)(v0 + 1248) = 0x676E696C696F62;
  *(_QWORD *)(v0 + 1280) = 0x676E696F6F62;
  *(_QWORD *)(v0 + 1312) = 1836019554;
  strcpy((char *)(v0 + 1376), "bowling_impact");
  *(_BYTE *)(v0 + 1391) = -18;
  *(_QWORD *)(v0 + 1472) = 1886549346;
  *(_QWORD *)(v0 + 1504) = 7566690;
  *(_QWORD *)(v0 + 1536) = 0x6172656D6163;
  *(_QWORD *)(v0 + 1568) = 0x6E75675F706163;
  *(_QWORD *)(v0 + 1632) = 0x6E726F685F726163;
  strcpy((char *)(v0 + 1664), "car_passing_by");
  *(_BYTE *)(v0 + 1679) = -18;
  *(_QWORD *)(v0 + 1696) = 7627107;
  *(_QWORD *)(v0 + 1728) = 0x776F656D5F746163;
  *(_QWORD *)(v0 + 1744) = 7627107;
  *(_QWORD *)(v0 + 1760) = 0x727275705F746163;
  *(_QWORD *)(v0 + 1776) = 7627107;
  *(_QWORD *)(v0 + 1792) = 0x6F6C6C6563;
  *(_QWORD *)(v0 + 1824) = 0x7761736E69616863;
  *(_QWORD *)(v0 + 1856) = 0x72657474616863;
  *(_QWORD *)(v0 + 1888) = 0x676E697265656863;
  *(_QWORD *)(v0 + 1920) = 0x676E6977656863;
  strcpy((char *)(v0 + 1984), "chicken_cluck");
  *(_WORD *)(v0 + 1998) = -4864;
  strcpy((char *)(v0 + 2016), "child_singing");
  *(_WORD *)(v0 + 2030) = -4864;
  strcpy((char *)(v0 + 2048), "child_speech");
  *(_BYTE *)(v0 + 2061) = 0;
  *(_WORD *)(v0 + 2062) = -5120;
  *(_QWORD *)(v0 + 2088) = 0x800000021775F710;
  strcpy((char *)(v0 + 2144), "choir_singing");
  *(_WORD *)(v0 + 2158) = -4864;
  strcpy((char *)(v0 + 2176), "chopping_food");
  *(_WORD *)(v0 + 2190) = -4864;
  strcpy((char *)(v0 + 2208), "chopping_wood");
  *(_WORD *)(v0 + 2222) = -4864;
  *(_QWORD *)(v0 + 2240) = 0x5F656C6B63756863;
  *(_QWORD *)(v0 + 2248) = 0xEF656C74726F6863;
  *(_QWORD *)(v0 + 2272) = 0x625F686372756863;
  *(_QWORD *)(v0 + 2280) = 0xEB000000006C6C65;
  *(_QWORD *)(v0 + 2312) = 0x800000021775F730;
  *(_QWORD *)(v0 + 2336) = 0x676E697070616C63;
  *(_QWORD *)(v0 + 2368) = 0x74656E6972616C63;
  *(_QWORD *)(v0 + 2400) = 0x6B63696C63;
  *(_QWORD *)(v0 + 2432) = 0x6B636F6C63;
  strcpy((char *)(v0 + 2464), "coin_dropping");
  strcpy((char *)(v0 + 2496), "conversation");
  *(_BYTE *)(v0 + 2509) = 0;
  *(_WORD *)(v0 + 2510) = -5120;
  *(_QWORD *)(v0 + 2528) = 0x6867756F63;
  *(_QWORD *)(v0 + 2560) = 0x6F6F6D5F776F63;
  *(_QWORD *)(v0 + 2592) = 0x6C6C6562776F63;
  *(_QWORD *)(v0 + 2624) = 0x685F65746F796F63;
  *(_QWORD *)(v0 + 2632) = 0xEB000000006C776FLL;
  strcpy((char *)(v0 + 2656), "cricket_chirp");
  *(_WORD *)(v0 + 2670) = -4864;
  *(_QWORD *)(v0 + 2688) = 0x7761635F776F7263;
  *(_QWORD *)(v0 + 2720) = 0x64776F7263;
  *(_QWORD *)(v0 + 2760) = 0x800000021775F770;
  *(_QWORD *)(v0 + 2784) = 0x676E696873757263;
  strcpy((char *)(v0 + 2816), "crying_sobbing");
  *(_BYTE *)(v0 + 2831) = -18;
  *(_QWORD *)(v0 + 2856) = 0x800000021775F7B0;
  *(_QWORD *)(v0 + 2888) = 0x800000021775F7D0;
  *(_QWORD *)(v0 + 2944) = 0x6469726567646964;
  *(_QWORD *)(v0 + 2952) = 0xEA00000000006F6FLL;
  *(_QWORD *)(v0 + 3008) = 0x7263735F63736964;
  *(_QWORD *)(v0 + 3016) = 0xEF676E6968637461;
  *(_QWORD *)(v0 + 3048) = 0x800000021775F810;
  *(_QWORD *)(v0 + 3104) = 0x6B7261625F676F64;
  *(_QWORD *)(v0 + 3136) = 0x5F776F625F676F64;
  *(_QWORD *)(v0 + 3144) = 0xEB00000000776F77;
  *(_QWORD *)(v0 + 3168) = 0x776F72675F676F64;
  *(_QWORD *)(v0 + 3200) = 0x6C776F685F676F64;
  *(_QWORD *)(v0 + 3232) = 0x6D6968775F676F64;
  *(_QWORD *)(v0 + 3240) = 0xEB00000000726570;
  *(_QWORD *)(v0 + 3072) = 6778724;
  *(_QWORD *)(v0 + 3120) = 6778724;
  *(_QWORD *)(v0 + 3152) = 6778724;
  *(_QWORD *)(v0 + 3184) = 6778724;
  *(_QWORD *)(v0 + 3216) = 6778724;
  *(_QWORD *)(v0 + 3248) = 6778724;
  *(_QWORD *)(v0 + 1720) = 0x800000021775F6D0;
  *(_QWORD *)(v0 + 3096) = 0x800000021775F6D0;
  *(_QWORD *)(v0 + 3272) = 0x800000021775F6D0;
  *(_QWORD *)(v0 + 3360) = 0x6C65625F726F6F64;
  *(_QWORD *)(v0 + 3392) = 0x616C735F726F6F64;
  *(_QWORD *)(v0 + 3400) = 0xE90000000000006DLL;
  strcpy((char *)(v0 + 3424), "door_sliding");
  *(_QWORD *)(v0 + 3456) = 0x625F656C62756F64;
  *(_QWORD *)(v0 + 3464) = 0xEB00000000737361;
  *(_QWORD *)(v0 + 3496) = 0x800000021775F830;
  *(_QWORD *)(v0 + 3520) = 0x6C6C697264;
  *(_QWORD *)(v0 + 3584) = 0x74696B5F6D757264;
  *(_QWORD *)(v0 + 3616) = 0x6175715F6B637564;
  *(_QWORD *)(v0 + 3648) = 0x676E69746165;
  *(_QWORD *)(v0 + 1296) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 1304) = 0x800000021775F470;
  *(_QWORD *)(v0 + 1336) = 0x800000021775F490;
  *(_QWORD *)(v0 + 3688) = 0xEF7261746975675FLL;
  *(_BYTE *)(v0 + 3727) = -18;
  *(_QWORD *)(v0 + 3680) = 0x6369727463656C65;
  strcpy((char *)(v0 + 3712), "electric_piano");
  *(_QWORD *)(v0 + 3744) = 0x6369727463656C65;
  *(_QWORD *)(v0 + 3752) = 0xEF7265766168735FLL;
  *(_QWORD *)(v0 + 3784) = 0x800000021775F870;
  *(_QWORD *)(v0 + 3808) = 0x6C6775625F6B6C65;
  *(_QWORD *)(v0 + 1592) = 0x800000021775F490;
  *(_QWORD *)(v0 + 3912) = 0x800000021775F890;
  strcpy((char *)(v0 + 3936), "engine_idling");
  *(_WORD *)(v0 + 3950) = -4864;
  *(_QWORD *)(v0 + 3968) = 0x6B5F656E69676E65;
  *(_QWORD *)(v0 + 3976) = 0xEF676E696B636F6ELL;
  *(_QWORD *)(v0 + 4000) = 0x735F656E69676E65;
  *(_QWORD *)(v0 + 4008) = 0xEF676E6974726174;
  *(_QWORD *)(v0 + 4032) = 0x6E6F697470757265;
  *(_QWORD *)(v0 + 4096) = 1953653094;
  *(_BYTE *)(v0 + 4143) = -18;
  strcpy((char *)(v0 + 4128), "female_singing");
  strcpy((char *)(v0 + 4160), "female_speech");
  *(_WORD *)(v0 + 4174) = -4864;
  *(_QWORD *)(v0 + 4192) = 0x735F7265676E6966;
  strcpy((char *)(v0 + 4256), "fire_crackle");
  *(_QWORD *)(v0 + 4224) = 1701996902;
  *(_QWORD *)(v0 + 4272) = 1701996902;
  *(_QWORD *)(v0 + 4296) = 0x800000021775F8D0;
  *(_QWORD *)(v0 + 4320) = 0x6361726365726966;
  *(_QWORD *)(v0 + 4328) = 0xEB0000000072656BLL;
  *(_QWORD *)(v0 + 4352) = 0x6B726F7765726966;
  *(_QWORD *)(v0 + 4384) = 0x6574756C66;
  *(_QWORD *)(v0 + 4416) = 0x7A7A75625F796C66;
  *(_QWORD *)(v0 + 4448) = 0x6E726F68676F66;
  *(_QWORD *)(v0 + 4512) = 0x685F68636E657266;
  *(_QWORD *)(v0 + 4520) = 0xEB000000006E726FLL;
  *(_QWORD *)(v0 + 4576) = 0x6F72635F676F7266;
  *(_QWORD *)(v0 + 4584) = 0xEA00000000006B61;
  *(_QWORD *)(v0 + 4544) = 1735357030;
  *(_QWORD *)(v0 + 4592) = 1735357030;
  *(_QWORD *)(v0 + 4608) = 0x665F676E69797266;
  *(_QWORD *)(v0 + 4640) = 0x676E696C67726167;
  *(_QWORD *)(v0 + 4672) = 1886609767;
  *(_QWORD *)(v0 + 4704) = 0x676E696C67676967;
  strcpy((char *)(v0 + 4768), "glass_breaking");
  *(_QWORD *)(v0 + 4800) = 0x6C635F7373616C67;
  *(_QWORD *)(v0 + 4808) = 0xEB000000006B6E69;
  strcpy((char *)(v0 + 4736), "glass_abstract");
  strcpy((char *)(v0 + 4784), "glass_abstract");
  strcpy((char *)(v0 + 4816), "glass_abstract");
  strcpy((char *)(v0 + 4832), "glockenspiel");
  *(_BYTE *)(v0 + 4845) = 0;
  *(_WORD *)(v0 + 4846) = -5120;
  *(_QWORD *)(v0 + 4864) = 1735290727;
  *(_QWORD *)(v0 + 4896) = 0x6F685F65736F6F67;
  *(_QWORD *)(v0 + 4904) = 0xEA00000000006B6ELL;
  strcpy((char *)(v0 + 4960), "guitar_strum");
  *(_BYTE *)(v0 + 4973) = 0;
  *(_WORD *)(v0 + 4974) = -5120;
  strcpy((char *)(v0 + 4992), "guitar_tapping");
  *(_BYTE *)(v0 + 5007) = -18;
  *(_QWORD *)(v0 + 5024) = 0x5F746F68736E7567;
  *(_QWORD *)(v0 + 5032) = 0xEF657269666E7567;
  *(_QWORD *)(v0 + 1840) = 0x656E69676E65;
  *(_QWORD *)(v0 + 1872) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 1880) = 0x800000021775F470;
  *(_QWORD *)(v0 + 1904) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 1912) = 0x800000021775F470;
  *(_QWORD *)(v0 + 4056) = 0x800000021775F490;
  *(_QWORD *)(v0 + 4072) = 0x800000021775F490;
  *(_QWORD *)(v0 + 4344) = 0x800000021775F490;
  *(_QWORD *)(v0 + 4376) = 0x800000021775F490;
  *(_QWORD *)(v0 + 5048) = 0x800000021775F490;
  *(_QWORD *)(v0 + 5056) = 0x676E696C67727567;
  *(_QWORD *)(v0 + 5088) = 0x7972645F72696168;
  *(_QWORD *)(v0 + 5120) = 0x72656D6D6168;
  strcpy((char *)(v0 + 5152), "hammond_organ");
  *(_WORD *)(v0 + 5166) = -4864;
  *(_QWORD *)(v0 + 2352) = 0x73646E6168;
  *(_QWORD *)(v0 + 2448) = 0xD000000000000013;
  *(_QWORD *)(v0 + 2456) = 0x800000021775F3F0;
  *(_WORD *)(v0 + 2478) = -4864;
  *(_QWORD *)(v0 + 2480) = 0xD000000000000018;
  *(_QWORD *)(v0 + 4208) = 0x73646E6168;
  *(_QWORD *)(v0 + 5184) = 0x73646E6168;
  *(_QWORD *)(v0 + 5216) = 0x63696E6F6D726168;
  *(_QWORD *)(v0 + 5248) = 1886544232;
  *(_QWORD *)(v0 + 5280) = 0x6863697370726168;
  *(_QWORD *)(v0 + 4616) = 0xEB00000000646F6FLL;
  *(_QWORD *)(v0 + 5288) = 0xEB0000000064726FLL;
  *(_QWORD *)(v0 + 5312) = 0x6165627472616568;
  *(_QWORD *)(v0 + 5320) = 0xE900000000000074;
  strcpy((char *)(v0 + 5344), "hedge_trimmer");
  *(_WORD *)(v0 + 5358) = -4864;
  *(_QWORD *)(v0 + 5376) = 0x74706F63696C6568;
  *(_QWORD *)(v0 + 2192) = 0xD000000000000018;
  *(_QWORD *)(v0 + 2200) = 0x800000021775F530;
  *(_QWORD *)(v0 + 2424) = 0x800000021775F550;
  *(_QWORD *)(v0 + 2440) = 0xE500000000000000;
  strcpy((char *)(v0 + 2320), "alarm_abstract");
  *(_BYTE *)(v0 + 2335) = -18;
  *(_QWORD *)(v0 + 2344) = 0xE800000000000000;
  *(_QWORD *)(v0 + 2360) = 0xE500000000000000;
  *(_QWORD *)(v0 + 2408) = 0xE500000000000000;
  *(_QWORD *)(v0 + 2416) = 0xD000000000000020;
  *(_QWORD *)(v0 + 2376) = 0xE800000000000000;
  *(_QWORD *)(v0 + 2384) = 0x736E695F646E6977;
  *(_QWORD *)(v0 + 2392) = 0xEF746E656D757274;
  *(_QWORD *)(v0 + 5392) = 0x7466617263726961;
  *(_QWORD *)(v0 + 5408) = 0x7461685F6968;
  *(_QWORD *)(v0 + 2912) = 0x6C61626D7963;
  *(_QWORD *)(v0 + 5424) = 0x6C61626D7963;
  *(_QWORD *)(v0 + 5440) = 0x707563636968;
  *(_QWORD *)(v0 + 5472) = 0x6C635F6573726F68;
  *(_QWORD *)(v0 + 5480) = 0xEF706F6C635F7069;
  *(_QWORD *)(v0 + 5504) = 0x656E5F6573726F68;
  *(_QWORD *)(v0 + 5512) = 0xEB00000000686769;
  strcpy((char *)(v0 + 2224), "wood_abstract");
  *(_QWORD *)(v0 + 2296) = 0xE400000000000000;
  *(_QWORD *)(v0 + 2304) = 0xD000000000000013;
  *(_QWORD *)(v0 + 2736) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 5536) = 0xD00000000000001CLL;
  *(_WORD *)(v0 + 2238) = -4864;
  *(_QWORD *)(v0 + 2256) = 0x726574686775616CLL;
  *(_QWORD *)(v0 + 2264) = 0xE800000000000000;
  *(_QWORD *)(v0 + 2288) = 1819043170;
  *(_QWORD *)(v0 + 2744) = 0x800000021775F470;
  *(_QWORD *)(v0 + 5544) = 0x800000021775F470;
  *(_QWORD *)(v0 + 5664) = 0x676E696D6D7568;
  strcpy((char *)(v0 + 5760), "keys_jangling");
  *(_WORD *)(v0 + 5774) = -4864;
  *(_QWORD *)(v0 + 5792) = 0x6B636F6E6BLL;
  *(_QWORD *)(v0 + 3328) = 1919905636;
  *(_QWORD *)(v0 + 3376) = 1919905636;
  *(_QWORD *)(v0 + 3408) = 1919905636;
  *(_QWORD *)(v0 + 3440) = 1919905636;
  *(_QWORD *)(v0 + 5808) = 1919905636;
  *(_QWORD *)(v0 + 5856) = 0x776F6D5F6E77616CLL;
  *(_QWORD *)(v0 + 2064) = 0x686365657073;
  *(_QWORD *)(v0 + 2072) = 0xE600000000000000;
  *(_QWORD *)(v0 + 2080) = 0xD000000000000011;
  *(_QWORD *)(v0 + 2160) = 0x676E69676E6973;
  *(_QWORD *)(v0 + 2168) = 0xE700000000000000;
  *(_QWORD *)(v0 + 2104) = 0xE500000000000000;
  *(_QWORD *)(v0 + 2112) = 0x656D696863;
  *(_QWORD *)(v0 + 2120) = 0xE500000000000000;
  *(_QWORD *)(v0 + 2128) = 1819043170;
  *(_QWORD *)(v0 + 2136) = 0xE400000000000000;
  *(_QWORD *)(v0 + 2096) = 0x74756F6873;
  *(_QWORD *)(v0 + 3872) = 0x656E69676E65;
  *(_QWORD *)(v0 + 3920) = 0x656E69676E65;
  *(_QWORD *)(v0 + 3952) = 0x656E69676E65;
  *(_QWORD *)(v0 + 3984) = 0x656E69676E65;
  *(_QWORD *)(v0 + 4016) = 0x656E69676E65;
  *(_QWORD *)(v0 + 5872) = 0x656E69676E65;
  *(_QWORD *)(v0 + 5888) = 0x616F725F6E6F696CLL;
  *(_QWORD *)(v0 + 2040) = 0xE700000000000000;
  *(_QWORD *)(v0 + 5896) = 0xE900000000000072;
  *(_QWORD *)(v0 + 5952) = 0x645F64697571696CLL;
  *(_QWORD *)(v0 + 2032) = 0x676E69676E6973;
  *(_QWORD *)(v0 + 2000) = 0xD000000000000013;
  *(_QWORD *)(v0 + 2008) = 0x800000021775F6F0;
  *(_QWORD *)(v0 + 4200) = 0xEF676E697070616ELL;
  *(_QWORD *)(v0 + 5960) = 0xEF676E6970706972;
  *(_QWORD *)(v0 + 1976) = 0xE400000000000000;
  *(_QWORD *)(v0 + 1936) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1960) = 0x800000021775F6F0;
  *(_QWORD *)(v0 + 1968) = 1819766630;
  *(_QWORD *)(v0 + 1944) = 0x800000021775F610;
  *(_QWORD *)(v0 + 1952) = 0xD000000000000013;
  *(_QWORD *)(v0 + 5992) = 0x800000021775F930;
  strcpy((char *)(v0 + 6016), "liquid_pouring");
  *(_BYTE *)(v0 + 6031) = -18;
  *(_QWORD *)(v0 + 1928) = 0xE700000000000000;
  *(_QWORD *)(v0 + 6056) = 0xEF676E6968736F6CLL;
  *(_QWORD *)(v0 + 1896) = 0xE800000000000000;
  *(_QWORD *)(v0 + 6088) = 0x800000021775F950;
  *(_QWORD *)(v0 + 6048) = 0x735F64697571696CLL;
  *(_QWORD *)(v0 + 6112) = 0x735F64697571696CLL;
  *(_QWORD *)(v0 + 6120) = 0xEF676E6979617270;
  *(_QWORD *)(v0 + 1864) = 0xE700000000000000;
  *(_QWORD *)(v0 + 6152) = 0x800000021775F970;
  *(_QWORD *)(v0 + 1848) = 0xE600000000000000;
  *(_QWORD *)(v0 + 1816) = 0x800000021775F650;
  *(_QWORD *)(v0 + 1832) = 0xE800000000000000;
  *(_QWORD *)(v0 + 6184) = 0x800000021775F990;
  *(_QWORD *)(v0 + 1784) = 0xE300000000000000;
  *(_QWORD *)(v0 + 1800) = 0xE500000000000000;
  *(_QWORD *)(v0 + 1808) = 0xD000000000000017;
  strcpy((char *)(v0 + 6240), "male_singing");
  *(_QWORD *)(v0 + 1752) = 0xE300000000000000;
  *(_QWORD *)(v0 + 1768) = 0xE800000000000000;
  *(_BYTE *)(v0 + 6253) = 0;
  *(_WORD *)(v0 + 6254) = -5120;
  *(_QWORD *)(v0 + 6272) = 0x6570735F656C616DLL;
  *(_QWORD *)(v0 + 6280) = 0xEB00000000686365;
  *(_QWORD *)(v0 + 1736) = 0xE800000000000000;
  *(_QWORD *)(v0 + 6336) = 0x6E696C6F646E616DLL;
  *(_QWORD *)(v0 + 1712) = 0xD000000000000019;
  *(_QWORD *)(v0 + 6376) = 0x800000021775F9B0;
  *(_BYTE *)(v0 + 1693) = 0;
  *(_WORD *)(v0 + 1694) = -5120;
  *(_QWORD *)(v0 + 1704) = 0xE300000000000000;
  strcpy((char *)(v0 + 6400), "mechanical_fan");
  strcpy((char *)(v0 + 1680), "car_abstract");
  *(_BYTE *)(v0 + 6415) = -18;
  *(_QWORD *)(v0 + 1640) = 0xE800000000000000;
  strcpy((char *)(v0 + 1648), "car_abstract");
  *(_BYTE *)(v0 + 1661) = 0;
  *(_WORD *)(v0 + 1662) = -5120;
  strcpy((char *)(v0 + 1600), "car_abstract");
  *(_BYTE *)(v0 + 1613) = 0;
  *(_WORD *)(v0 + 1614) = -5120;
  *(_QWORD *)(v0 + 1616) = 0xD000000000000016;
  *(_QWORD *)(v0 + 1624) = 0x800000021775F6B0;
  strcpy((char *)(v0 + 6464), "microwave_oven");
  *(_BYTE *)(v0 + 6479) = -18;
  *(_QWORD *)(v0 + 1576) = 0xE700000000000000;
  *(_QWORD *)(v0 + 1584) = 0xD000000000000012;
  strcpy((char *)(v0 + 6496), "mosquito_buzz");
  *(_WORD *)(v0 + 6510) = -4864;
  *(_QWORD *)(v0 + 1544) = 0xE600000000000000;
  *(_QWORD *)(v0 + 1552) = 0xD000000000000013;
  *(_QWORD *)(v0 + 1560) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 1512) = 0xE300000000000000;
  *(_QWORD *)(v0 + 1520) = 0xD000000000000016;
  *(_QWORD *)(v0 + 1528) = 0x800000021775F6B0;
  *(_QWORD *)(v0 + 1488) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1496) = 0x800000021775F610;
  *(_QWORD *)(v0 + 1400) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 1408) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1480) = 0xE400000000000000;
  *(_QWORD *)(v0 + 1456) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 1464) = 0x800000021775F690;
  *(_QWORD *)(v0 + 1440) = 0x6E69687461657262;
  *(_QWORD *)(v0 + 1448) = 0xE900000000000067;
  *(_QWORD *)(v0 + 1416) = 0x800000021775F670;
  *(_QWORD *)(v0 + 1424) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1432) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 816) = 0x746365736E69;
  *(_QWORD *)(v0 + 1360) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1368) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 1392) = 0xD000000000000018;
  *(_QWORD *)(v0 + 2672) = 0x746365736E69;
  *(_QWORD *)(v0 + 4432) = 0x746365736E69;
  *(_QWORD *)(v0 + 5696) = 0x746365736E69;
  *(_QWORD *)(v0 + 6512) = 0x746365736E69;
  *(_QWORD *)(v0 + 1344) = 0xD000000000000017;
  *(_QWORD *)(v0 + 1352) = 0x800000021775F650;
  *(_QWORD *)(v0 + 6568) = 0x800000021775F9D0;
  *(_QWORD *)(v0 + 1320) = 0xE400000000000000;
  *(_QWORD *)(v0 + 1328) = 0xD000000000000012;
  *(_QWORD *)(v0 + 6592) = 0x637963726F746F6DLL;
  *(_QWORD *)(v0 + 6600) = 0xEA0000000000656CLL;
  strcpy((char *)(v0 + 6624), "mouse_patter");
  *(_QWORD *)(v0 + 1288) = 0xE600000000000000;
  *(_QWORD *)(v0 + 1264) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 1272) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 1216) = 0xD000000000000016;
  *(_QWORD *)(v0 + 1256) = 0xE700000000000000;
  *(_QWORD *)(v0 + 1224) = 0x800000021775F630;
  *(_QWORD *)(v0 + 1232) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1240) = 0x800000021775F410;
  *(_BYTE *)(v0 + 6637) = 0;
  *(_WORD *)(v0 + 6638) = -5120;
  strcpy((char *)(v0 + 6784), "nose_blowing");
  *(_QWORD *)(v0 + 1192) = 0xE700000000000000;
  *(_QWORD *)(v0 + 1200) = 0xD000000000000018;
  *(_QWORD *)(v0 + 1208) = 0x800000021775F530;
  *(_BYTE *)(v0 + 6797) = 0;
  *(_WORD *)(v0 + 6798) = -5120;
  *(_QWORD *)(v0 + 1160) = 0xE600000000000000;
  *(_QWORD *)(v0 + 1168) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1176) = 0x800000021775F610;
  *(_QWORD *)(v0 + 6816) = 1701798511;
  *(_QWORD *)(v0 + 1120) = 0xD000000000000011;
  *(_QWORD *)(v0 + 1136) = 1685219682;
  *(_QWORD *)(v0 + 1144) = 0xE400000000000000;
  *(_QWORD *)(v0 + 6848) = 0x6E6165636FLL;
  *(_QWORD *)(v0 + 6880) = 0x727473656863726FLL;
  *(_QWORD *)(v0 + 1080) = 0xE400000000000000;
  *(_QWORD *)(v0 + 1104) = 0xD000000000000011;
  *(_QWORD *)(v0 + 5224) = 0xE900000000000061;
  *(_QWORD *)(v0 + 6888) = 0xE900000000000061;
  *(_QWORD *)(v0 + 992) = 1685219682;
  *(_WORD *)(v0 + 1070) = -4864;
  *(_QWORD *)(v0 + 1072) = 1685219682;
  *(_QWORD *)(v0 + 1000) = 0xE400000000000000;
  *(_QWORD *)(v0 + 1008) = 0xD000000000000015;
  *(_QWORD *)(v0 + 1040) = 0xD000000000000011;
  *(_QWORD *)(v0 + 1016) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 1024) = 0xD000000000000010;
  *(_QWORD *)(v0 + 6656) = 0x636973756DLL;
  *(_QWORD *)(v0 + 6704) = 0x636973756DLL;
  *(_QWORD *)(v0 + 6896) = 0x636973756DLL;
  *(_QWORD *)(v0 + 944) = 0xD000000000000023;
  *(_QWORD *)(v0 + 976) = 1819043170;
  *(_QWORD *)(v0 + 984) = 0xE400000000000000;
  *(_QWORD *)(v0 + 952) = 0x800000021775F580;
  *(_QWORD *)(v0 + 6912) = 0x6E6167726FLL;
  *(_QWORD *)(v0 + 6944) = 0x746F6F685F6C776FLL;
  *(_QWORD *)(v0 + 920) = 0xE800000000000000;
  *(_QWORD *)(v0 + 936) = 0xE700000000000000;
  strcpy((char *)(v0 + 7008), "person_running");
  *(_BYTE *)(v0 + 7023) = -18;
  *(_QWORD *)(v0 + 912) = 0x726574686775616CLL;
  *(_QWORD *)(v0 + 864) = 1819043170;
  *(_QWORD *)(v0 + 872) = 0xE400000000000000;
  *(_QWORD *)(v0 + 880) = 0xD000000000000018;
  *(_QWORD *)(v0 + 888) = 0x800000021775F430;
  *(_QWORD *)(v0 + 840) = 0xE400000000000000;
  *(_QWORD *)(v0 + 848) = 0xD000000000000020;
  *(_QWORD *)(v0 + 856) = 0x800000021775F550;
  *(_QWORD *)(v0 + 7048) = 0x800000021775F9F0;
  *(_QWORD *)(v0 + 400) = 0xD000000000000012;
  *(_QWORD *)(v0 + 792) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 808) = 0xE800000000000000;
  *(_QWORD *)(v0 + 824) = 0xE600000000000000;
  *(_OWORD *)(v0 + 16) = xmmword_21775ECB0;
  *(_QWORD *)(v0 + 48) = 0xD000000000000012;
  *(_QWORD *)(v0 + 56) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 752) = 0x74756F6873;
  *(_QWORD *)(v0 + 760) = 0xE500000000000000;
  *(_QWORD *)(v0 + 784) = 0xD000000000000012;
  *(_QWORD *)(v0 + 80) = 0x726174697567;
  *(_QWORD *)(v0 + 88) = 0xE600000000000000;
  *(_QWORD *)(v0 + 704) = 0xD000000000000017;
  *(_QWORD *)(v0 + 720) = 0xD000000000000018;
  *(_QWORD *)(v0 + 728) = 0x800000021775F530;
  *(_QWORD *)(v0 + 112) = 0xD000000000000013;
  *(_QWORD *)(v0 + 120) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 664) = 0xE600000000000000;
  *(_QWORD *)(v0 + 680) = 0xE700000000000000;
  *(_QWORD *)(v0 + 688) = 0x736E695F646E6977;
  *(_QWORD *)(v0 + 696) = 0xEF746E656D757274;
  *(_QWORD *)(v0 + 632) = 0xE400000000000000;
  *(_QWORD *)(v0 + 648) = 0xEB00000000726174;
  *(_QWORD *)(v0 + 656) = 0x726174697567;
  *(_QWORD *)(v0 + 136) = 0xE800000000000000;
  *(_QWORD *)(v0 + 144) = 0x6B63757274;
  *(_QWORD *)(v0 + 152) = 0xE500000000000000;
  *(_QWORD *)(v0 + 560) = 0xD000000000000019;
  *(_QWORD *)(v0 + 624) = 1836413540;
  *(_QWORD *)(v0 + 568) = 0x800000021775F4B0;
  *(_QWORD *)(v0 + 576) = 0xD000000000000011;
  *(_QWORD *)(v0 + 592) = 0xD000000000000018;
  *(_QWORD *)(v0 + 600) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 168) = 0xE800000000000000;
  *(_QWORD *)(v0 + 176) = 0xD000000000000010;
  *(_QWORD *)(v0 + 520) = 0xE800000000000000;
  *(_QWORD *)(v0 + 528) = 0xD000000000000012;
  *(_QWORD *)(v0 + 536) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 552) = 0xE500000000000000;
  *(_QWORD *)(v0 + 184) = 0x800000021775F410;
  *(_QWORD *)(v0 + 200) = 0xE800000000000000;
  *(_QWORD *)(v0 + 216) = 0xE800000000000000;
  *(_QWORD *)(v0 + 496) = 0x726574686775616CLL;
  *(_QWORD *)(v0 + 504) = 0xE800000000000000;
  strcpy((char *)(v0 + 224), "alarm_abstract");
  *(_BYTE *)(v0 + 239) = -18;
  *(_QWORD *)(v0 + 240) = 0xD000000000000018;
  *(_QWORD *)(v0 + 248) = 0x800000021775F430;
  *(_QWORD *)(v0 + 264) = 0xEB000000006B636FLL;
  strcpy((char *)(v0 + 272), "alarm_abstract");
  *(_BYTE *)(v0 + 287) = -18;
  *(_QWORD *)(v0 + 424) = 0xE600000000000000;
  *(_QWORD *)(v0 + 304) = 0xD000000000000011;
  *(_QWORD *)(v0 + 312) = 0x800000021775F450;
  *(_QWORD *)(v0 + 320) = 0x615F6C616D696E61;
  *(_QWORD *)(v0 + 328) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 336) = 1953460082;
  *(_QWORD *)(v0 + 344) = 0xE400000000000000;
  *(_QWORD *)(v0 + 360) = 0xE800000000000000;
  *(_QWORD *)(v0 + 2488) = 0x800000021775F530;
  *(_QWORD *)(v0 + 2512) = 0x686365657073;
  *(_QWORD *)(v0 + 2520) = 0xE600000000000000;
  *(_QWORD *)(v0 + 2536) = 0xE500000000000000;
  *(_QWORD *)(v0 + 2544) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 2552) = 0x800000021775F690;
  *(_QWORD *)(v0 + 2568) = 0xE700000000000000;
  *(_QWORD *)(v0 + 2576) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 2584) = 0x800000021775F750;
  *(_QWORD *)(v0 + 2600) = 0xE700000000000000;
  *(_QWORD *)(v0 + 2608) = 1819043170;
  *(_QWORD *)(v0 + 2616) = 0xE400000000000000;
  *(_QWORD *)(v0 + 2640) = 0xD000000000000015;
  *(_QWORD *)(v0 + 2648) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 2680) = 0xE600000000000000;
  *(_QWORD *)(v0 + 2696) = 0xE800000000000000;
  *(_QWORD *)(v0 + 2704) = 1685219682;
  *(_QWORD *)(v0 + 2712) = 0xE400000000000000;
  *(_QWORD *)(v0 + 2728) = 0xE500000000000000;
  *(_QWORD *)(v0 + 2752) = 0xD000000000000013;
  *(_QWORD *)(v0 + 2768) = 0xD000000000000020;
  *(_QWORD *)(v0 + 2776) = 0x800000021775F550;
  *(_QWORD *)(v0 + 2792) = 0xE800000000000000;
  *(_QWORD *)(v0 + 2800) = 0xD000000000000020;
  *(_QWORD *)(v0 + 2808) = 0x800000021775F550;
  *(_QWORD *)(v0 + 2832) = 0xD000000000000014;
  *(_QWORD *)(v0 + 2840) = 0x800000021775F790;
  *(_QWORD *)(v0 + 2848) = 0xD000000000000013;
  *(_QWORD *)(v0 + 2864) = 0xD000000000000018;
  *(_QWORD *)(v0 + 2872) = 0x800000021775F530;
  *(_QWORD *)(v0 + 2880) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2896) = 0xD000000000000018;
  *(_QWORD *)(v0 + 2904) = 0x800000021775F530;
  *(_QWORD *)(v0 + 2920) = 0xE600000000000000;
  *(_QWORD *)(v0 + 2928) = 0x6973737563726570;
  *(_QWORD *)(v0 + 2936) = 0xEA00000000006E6FLL;
  *(_QWORD *)(v0 + 2960) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2968) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 2976) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2984) = 0x800000021775F610;
  *(_QWORD *)(v0 + 2992) = 0xD000000000000015;
  *(_QWORD *)(v0 + 3000) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 3024) = 0xD000000000000012;
  *(_QWORD *)(v0 + 3032) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 3040) = 0xD000000000000010;
  *(_QWORD *)(v0 + 3056) = 0xD000000000000018;
  *(_QWORD *)(v0 + 3064) = 0x800000021775F530;
  strcpy((char *)(v0 + 7072), "person_walking");
  *(_BYTE *)(v0 + 4783) = -18;
  *(_BYTE *)(v0 + 7087) = -18;
  *(_QWORD *)(v0 + 5576) = 0x800000021775F910;
  *(_QWORD *)(v0 + 7032) = 0x800000021775F910;
  *(_QWORD *)(v0 + 7064) = 0x800000021775F910;
  *(_QWORD *)(v0 + 7096) = 0x800000021775F910;
  *(_QWORD *)(v0 + 7104) = 0x6F6E616970;
  *(_QWORD *)(v0 + 7136) = 0x6B6E696F5F676970;
  *(_QWORD *)(v0 + 7168) = 0x645F6E6F65676970;
  *(_QWORD *)(v0 + 7176) = 0xEF6F6F635F65766FLL;
  *(_QWORD *)(v0 + 6960) = 1685219682;
  *(_QWORD *)(v0 + 7184) = 1685219682;
  *(_QWORD *)(v0 + 7208) = 0x800000021775FA10;
  *(_BYTE *)(v0 + 7247) = -18;
  *(_BYTE *)(v0 + 7279) = -18;
  *(_QWORD *)(v0 + 7304) = 0x800000021775FA30;
  strcpy((char *)(v0 + 7232), "playing_hockey");
  strcpy((char *)(v0 + 7264), "playing_squash");
  strcpy((char *)(v0 + 7328), "playing_tennis");
  *(_BYTE *)(v0 + 7343) = -18;
  *(_QWORD *)(v0 + 7368) = 0x800000021775FA50;
  strcpy((char *)(v0 + 7424), "police_siren");
  *(_BYTE *)(v0 + 7437) = 0;
  *(_WORD *)(v0 + 7438) = -5120;
  *(_QWORD *)(v0 + 3848) = 0x800000021775F450;
  *(_QWORD *)(v0 + 4312) = 0x800000021775F450;
  *(_QWORD *)(v0 + 7448) = 0x800000021775F450;
  *(_QWORD *)(v0 + 7456) = 0x6F745F7265776F70;
  *(_QWORD *)(v0 + 7464) = 0xEA00000000006C6FLL;
  strcpy((char *)(v0 + 7488), "power_windows");
  *(_WORD *)(v0 + 7502) = -4864;
  *(_QWORD *)(v0 + 7520) = 0x7265746E697270;
  strcpy((char *)(v0 + 7616), "railroad_car");
  *(_QWORD *)(v0 + 7784) = 0x800000021775FA90;
  *(_BYTE *)(v0 + 3437) = 0;
  *(_WORD *)(v0 + 3438) = -5120;
  strcpy((char *)(v0 + 8160), "scuba_diving");
  *(_BYTE *)(v0 + 8173) = 0;
  *(_WORD *)(v0 + 8174) = -5120;
  *(_QWORD *)(v0 + 4360) = 0xE900000000000073;
  *(_QWORD *)(v0 + 8200) = 0xE900000000000073;
  strcpy((char *)(v0 + 8224), "sewing_machine");
  *(_BYTE *)(v0 + 8239) = -18;
  *(_QWORD *)(v0 + 8256) = 0x6C625F7065656873;
  *(_QWORD *)(v0 + 8264) = 0xEB00000000746165;
  *(_QWORD *)(v0 + 4504) = 0x800000021775F750;
  *(_QWORD *)(v0 + 5496) = 0x800000021775F750;
  *(_QWORD *)(v0 + 5528) = 0x800000021775F750;
  *(_QWORD *)(v0 + 6216) = 0x800000021775F750;
  *(_QWORD *)(v0 + 7160) = 0x800000021775F750;
  *(_QWORD *)(v0 + 8280) = 0x800000021775F750;
  *(_QWORD *)(v0 + 8288) = 0x7261666F6873;
  *(_QWORD *)(v0 + 8352) = 1751607667;
  *(_QWORD *)(v0 + 8384) = 0x65636E656C6973;
  strcpy((char *)(v0 + 8448), "singing_bowl");
  *(_BYTE *)(v0 + 8461) = 0;
  *(_WORD *)(v0 + 8462) = -5120;
  *(_QWORD *)(v0 + 8488) = 0x800000021775FAD0;
  *(_QWORD *)(v0 + 8576) = 0x616F626574616B73;
  *(_QWORD *)(v0 + 6760) = 0x800000021775F580;
  *(_QWORD *)(v0 + 8600) = 0x800000021775F580;
  *(_QWORD *)(v0 + 8640) = 0x616D735F70616C73;
  *(_BYTE *)(v0 + 8719) = -18;
  *(_QWORD *)(v0 + 8736) = 0x69685F656B616E73;
  *(_QWORD *)(v0 + 8744) = 0xEA00000000007373;
  strcpy((char *)(v0 + 8768), "snake_rattle");
  *(_QWORD *)(v0 + 8800) = 0x72645F6572616E73;
  *(_QWORD *)(v0 + 8808) = 0xEA00000000006D75;
  *(_QWORD *)(v0 + 4720) = 0x726574686775616CLL;
  *(_QWORD *)(v0 + 5824) = 0x726574686775616CLL;
  *(_QWORD *)(v0 + 8880) = 0x726574686775616CLL;
  *(_QWORD *)(v0 + 9000) = 0x800000021775F550;
  *(_QWORD *)(v0 + 9008) = 1953460082;
  *(_QWORD *)(v0 + 8952) = 0x800000021775F430;
  *(_QWORD *)(v0 + 8960) = 0xD000000000000018;
  *(_QWORD *)(v0 + 8968) = 0x800000021775F430;
  *(_QWORD *)(v0 + 8976) = 1953460082;
  *(_QWORD *)(v0 + 8984) = 0xE400000000000000;
  *(_QWORD *)(v0 + 8992) = 0xD000000000000020;
  *(_QWORD *)(v0 + 4688) = 0x6E69687461657262;
  *(_QWORD *)(v0 + 8912) = 0x6E69687461657262;
  *(_QWORD *)(v0 + 8920) = 0xE900000000000067;
  *(_QWORD *)(v0 + 8928) = 0xD000000000000018;
  *(_QWORD *)(v0 + 8936) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 8944) = 0xD000000000000018;
  *(_QWORD *)(v0 + 8896) = 0x676E69726F6E73;
  *(_QWORD *)(v0 + 6808) = 0x800000021775F690;
  *(_QWORD *)(v0 + 8872) = 0xE700000000000000;
  *(_QWORD *)(v0 + 8888) = 0xE800000000000000;
  *(_QWORD *)(v0 + 8904) = 0xE700000000000000;
  *(_QWORD *)(v0 + 7816) = 0x800000021775F690;
  *(_QWORD *)(v0 + 8856) = 0x800000021775F690;
  *(_QWORD *)(v0 + 8864) = 0x72656B63696E73;
  *(_QWORD *)(v0 + 8840) = 0xE600000000000000;
  *(_QWORD *)(v0 + 8848) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 8832) = 0x657A65656E73;
  *(_BYTE *)(v0 + 4269) = 0;
  *(_WORD *)(v0 + 4270) = -5120;
  *(_QWORD *)(v0 + 8816) = 1836413540;
  *(_QWORD *)(v0 + 8824) = 0xE400000000000000;
  *(_BYTE *)(v0 + 8781) = 0;
  *(_WORD *)(v0 + 8782) = -5120;
  *(_QWORD *)(v0 + 8752) = 0xD000000000000015;
  *(_QWORD *)(v0 + 8760) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 8784) = 0xD000000000000015;
  *(_QWORD *)(v0 + 8792) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 3672) = 0x800000021775F610;
  *(_QWORD *)(v0 + 4120) = 0x800000021775F610;
  *(_QWORD *)(v0 + 4664) = 0x800000021775F610;
  *(_QWORD *)(v0 + 5464) = 0x800000021775F610;
  strcpy((char *)(v0 + 8720), "alarm_abstract");
  *(_BYTE *)(v0 + 8735) = -18;
  *(_QWORD *)(v0 + 8696) = 0x800000021775F610;
  strcpy((char *)(v0 + 8704), "smoke_detector");
  *(_QWORD *)(v0 + 8680) = 0xE500000000000000;
  *(_QWORD *)(v0 + 8688) = 0xD000000000000012;
  *(_QWORD *)(v0 + 3624) = 0xEA00000000006B63;
  *(_QWORD *)(v0 + 8648) = 0xEA00000000006B63;
  *(_QWORD *)(v0 + 8672) = 0x7072756C73;
  *(_QWORD *)(v0 + 8656) = 0xD000000000000020;
  *(_QWORD *)(v0 + 8664) = 0x800000021775F550;
  *(_QWORD *)(v0 + 8608) = 0x676E69696B73;
  *(_QWORD *)(v0 + 8616) = 0xE600000000000000;
  *(_QWORD *)(v0 + 8624) = 0xD000000000000018;
  *(_QWORD *)(v0 + 8632) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 8584) = 0xEA00000000006472;
  *(_QWORD *)(v0 + 6752) = 0xD000000000000023;
  *(_QWORD *)(v0 + 8592) = 0xD000000000000023;
  *(_QWORD *)(v0 + 8560) = 0xD000000000000019;
  *(_QWORD *)(v0 + 8568) = 0x800000021775F4B0;
  *(_QWORD *)(v0 + 8544) = 0x7261746973;
  *(_QWORD *)(v0 + 8520) = 0xE500000000000000;
  strcpy((char *)(v0 + 8528), "alarm_abstract");
  *(_BYTE *)(v0 + 8543) = -18;
  *(_QWORD *)(v0 + 8552) = 0xE500000000000000;
  *(_QWORD *)(v0 + 8512) = 0x6E65726973;
  *(_QWORD *)(v0 + 5616) = 1953460082;
  *(_QWORD *)(v0 + 8472) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 8480) = 0xD000000000000014;
  *(_QWORD *)(v0 + 8496) = 0xD000000000000018;
  *(_QWORD *)(v0 + 8504) = 0x800000021775F530;
  *(_QWORD *)(v0 + 6672) = 1953460082;
  *(_QWORD *)(v0 + 6736) = 1953460082;
  *(_QWORD *)(v0 + 8424) = 0xE700000000000000;
  *(_QWORD *)(v0 + 8432) = 0xD000000000000014;
  *(_QWORD *)(v0 + 8440) = 0x800000021775F790;
  *(_QWORD *)(v0 + 8464) = 0xD000000000000012;
  *(_QWORD *)(v0 + 8400) = 1953460082;
  *(_QWORD *)(v0 + 4496) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 8376) = 0x800000021775F790;
  *(_QWORD *)(v0 + 8392) = 0xE700000000000000;
  *(_QWORD *)(v0 + 8408) = 0xE400000000000000;
  *(_QWORD *)(v0 + 8416) = 0x676E69676E6973;
  *(_QWORD *)(v0 + 5488) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 8328) = 0xE500000000000000;
  *(_QWORD *)(v0 + 8336) = 0xD000000000000014;
  *(_QWORD *)(v0 + 8344) = 0x800000021775F790;
  *(_QWORD *)(v0 + 8360) = 0xE400000000000000;
  *(_QWORD *)(v0 + 8368) = 0xD000000000000014;
  *(_QWORD *)(v0 + 5520) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 6208) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 8296) = 0xE600000000000000;
  *(_QWORD *)(v0 + 8304) = 0xD000000000000012;
  *(_QWORD *)(v0 + 8312) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 8320) = 0x74756F6873;
  *(_QWORD *)(v0 + 7152) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 8272) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 7224) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 7256) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 8240) = 0xD000000000000013;
  *(_QWORD *)(v0 + 8248) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 7288) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 7320) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 7352) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 8208) = 0x7265746177;
  *(_QWORD *)(v0 + 8216) = 0xE500000000000000;
  *(_QWORD *)(v0 + 7384) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 7960) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 8184) = 0x800000021775F4F0;
  *(_QWORD *)(v0 + 0x2000) = 0x657661775F616573;
  *(_QWORD *)(v0 + 8176) = 0xD000000000000018;
  *(_QWORD *)(v0 + 8128) = 0x6E696D6165726373;
  *(_QWORD *)(v0 + 8120) = 0x800000021775F530;
  *(_QWORD *)(v0 + 8136) = 0xE900000000000067;
  *(_QWORD *)(v0 + 8144) = 0xD000000000000014;
  *(_QWORD *)(v0 + 8152) = 0x800000021775F790;
  *(_QWORD *)(v0 + 8096) = 0x73726F7373696373;
  *(_QWORD *)(v0 + 8088) = 0xEF746E656D757274;
  *(_QWORD *)(v0 + 8104) = 0xE800000000000000;
  *(_QWORD *)(v0 + 8112) = 0xD000000000000018;
  *(_QWORD *)(v0 + 8064) = 0x6E6F68706F786173;
  strcpy((char *)(v0 + 8048), "tools_abstract");
  *(_BYTE *)(v0 + 8063) = -18;
  *(_QWORD *)(v0 + 8072) = 0xE900000000000065;
  *(_QWORD *)(v0 + 8080) = 0x736E695F646E6977;
  *(_QWORD *)(v0 + 8032) = 7823731;
  *(_QWORD *)(v0 + 8008) = 0xE700000000000000;
  *(_QWORD *)(v0 + 8016) = 0xD000000000000016;
  *(_QWORD *)(v0 + 8024) = 0x800000021775F630;
  *(_QWORD *)(v0 + 8040) = 0xE300000000000000;
  *(_QWORD *)(v0 + 6584) = 0x800000021775F630;
  *(_QWORD *)(v0 + 7992) = 0x800000021775F630;
  *(_QWORD *)(v0 + 8000) = 0x676E696C696173;
  *(_QWORD *)(v0 + 7984) = 0xD000000000000016;
  *(_QWORD *)(v0 + 7976) = 0x800000021775FAB0;
  *(_QWORD *)(v0 + 7952) = 0xD000000000000018;
  *(_QWORD *)(v0 + 7968) = 0xD000000000000013;
  strcpy((char *)(v0 + 7904), "rooster_crow");
  *(_QWORD *)(v0 + 7928) = 0x800000021775F6F0;
  strcpy((char *)(v0 + 7936), "rope_skipping");
  *(_QWORD *)(v0 + 7920) = 0xD000000000000013;
  *(_WORD *)(v0 + 7950) = -4864;
  *(_BYTE *)(v0 + 7917) = 0;
  *(_WORD *)(v0 + 7918) = -5120;
  *(_QWORD *)(v0 + 7888) = 0x6E6F6870656C6574;
  *(_QWORD *)(v0 + 7896) = 0xE900000000000065;
  *(_WORD *)(v0 + 7854) = -4864;
  *(_QWORD *)(v0 + 7872) = 0x656E6F74676E6972;
  *(_QWORD *)(v0 + 7856) = 0x6B63757274;
  *(_QWORD *)(v0 + 7864) = 0xE500000000000000;
  *(_QWORD *)(v0 + 7880) = 0xE800000000000000;
  strcpy((char *)(v0 + 7840), "reverse_beeps");
  *(_QWORD *)(v0 + 3904) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 6800) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 7824) = 0xD000000000000015;
  *(_QWORD *)(v0 + 7832) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 7808) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 7792) = 0x6973737563726570;
  *(_QWORD *)(v0 + 7800) = 0xEA00000000006E6FLL;
  *(_QWORD *)(v0 + 7752) = 0x800000021775FA70;
  *(_QWORD *)(v0 + 7744) = 0xD000000000000010;
  *(_QWORD *)(v0 + 7760) = 0xD000000000000013;
  *(_QWORD *)(v0 + 7768) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 7776) = 0xD000000000000011;
  *(_QWORD *)(v0 + 7712) = 0x676E6970706172;
  *(_QWORD *)(v0 + 7704) = 0xE500000000000000;
  *(_QWORD *)(v0 + 7720) = 0xE700000000000000;
  *(_QWORD *)(v0 + 7728) = 0x676E69676E6973;
  *(_QWORD *)(v0 + 7736) = 0xE700000000000000;
  *(_QWORD *)(v0 + 7680) = 0x706F72646E696172;
  *(_QWORD *)(v0 + 7672) = 0xE500000000000000;
  *(_QWORD *)(v0 + 7688) = 0xE800000000000000;
  *(_QWORD *)(v0 + 7696) = 0x7265746177;
  *(_QWORD *)(v0 + 7648) = 1852399986;
  *(_QWORD *)(v0 + 7632) = 0x6E69617274;
  *(_QWORD *)(v0 + 7640) = 0xE500000000000000;
  *(_QWORD *)(v0 + 7656) = 0xE400000000000000;
  *(_QWORD *)(v0 + 7664) = 0x7265746177;
  *(_BYTE *)(v0 + 7629) = 0;
  *(_WORD *)(v0 + 7630) = -5120;
  *(_QWORD *)(v0 + 7560) = 0xE800000000000000;
  strcpy((char *)(v0 + 7568), "car_abstract");
  *(_QWORD *)(v0 + 7600) = 0xD000000000000010;
  *(_QWORD *)(v0 + 7608) = 0x800000021775F410;
  *(_BYTE *)(v0 + 7581) = 0;
  *(_WORD *)(v0 + 7582) = -5120;
  strcpy((char *)(v0 + 7584), "rail_transport");
  *(_BYTE *)(v0 + 7599) = -18;
  *(_QWORD *)(v0 + 7552) = 0x7261635F65636172;
  *(_QWORD *)(v0 + 4176) = 0x686365657073;
  *(_QWORD *)(v0 + 6288) = 0x686365657073;
  *(_QWORD *)(v0 + 7528) = 0xE700000000000000;
  *(_QWORD *)(v0 + 7536) = 0xD000000000000013;
  *(_QWORD *)(v0 + 7544) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 9024) = 0x686365657073;
  strcpy((char *)(v0 + 7504), "car_abstract");
  *(_BYTE *)(v0 + 7517) = 0;
  *(_WORD *)(v0 + 7518) = -5120;
  *(_QWORD *)(v0 + 9056) = 0x6B6165757173;
  *(_QWORD *)(v0 + 9096) = 0x800000021775FAF0;
  strcpy((char *)(v0 + 7472), "tools_abstract");
  *(_BYTE *)(v0 + 7487) = -18;
  *(_QWORD *)(v0 + 3696) = 0x726174697567;
  *(_QWORD *)(v0 + 4928) = 0x726174697567;
  *(_QWORD *)(v0 + 4976) = 0x726174697567;
  *(_QWORD *)(v0 + 5008) = 0x726174697567;
  *(_QWORD *)(v0 + 7416) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 7440) = 0xD000000000000011;
  *(_QWORD *)(v0 + 9104) = 0x726174697567;
  *(_QWORD *)(v0 + 9120) = 0x6E61706C65657473;
  *(_QWORD *)(v0 + 7392) = 0xD000000000000019;
  *(_QWORD *)(v0 + 7400) = 0x800000021775F4B0;
  *(_QWORD *)(v0 + 7408) = 0xD000000000000012;
  *(_QWORD *)(v0 + 9152) = 0x625F6D6165727473;
  *(_QWORD *)(v0 + 9160) = 0xEF676E696C627275;
  *(_QWORD *)(v0 + 7360) = 0xD000000000000012;
  *(_QWORD *)(v0 + 7376) = 0xD000000000000018;
  strcpy((char *)(v0 + 9184), "subway_metro");
  *(_BYTE *)(v0 + 9197) = 0;
  *(_WORD *)(v0 + 9198) = -5120;
  *(_QWORD *)(v0 + 7344) = 0xD000000000000018;
  *(_QWORD *)(v0 + 9216) = 0x69736568746E7973;
  *(_QWORD *)(v0 + 9224) = 0xEB0000000072657ALL;
  *(_QWORD *)(v0 + 7312) = 0xD000000000000018;
  *(_QWORD *)(v0 + 3736) = 0x800000021775F850;
  *(_QWORD *)(v0 + 3800) = 0x800000021775F850;
  *(_QWORD *)(v0 + 7280) = 0xD000000000000018;
  *(_QWORD *)(v0 + 7296) = 0xD000000000000014;
  *(_QWORD *)(v0 + 5176) = 0x800000021775F850;
  *(_QWORD *)(v0 + 5304) = 0x800000021775F850;
  *(_QWORD *)(v0 + 5736) = 0x800000021775F850;
  *(_QWORD *)(v0 + 6936) = 0x800000021775F850;
  *(_QWORD *)(v0 + 7216) = 0xD000000000000018;
  *(_QWORD *)(v0 + 7248) = 0xD000000000000018;
  *(_QWORD *)(v0 + 7128) = 0x800000021775F850;
  *(_QWORD *)(v0 + 9240) = 0x800000021775F850;
  *(_QWORD *)(v0 + 9248) = 0x616C626174;
  *(_QWORD *)(v0 + 7192) = 0xE400000000000000;
  *(_QWORD *)(v0 + 7200) = 0xD000000000000011;
  *(_QWORD *)(v0 + 9280) = 0x6972756F626D6174;
  *(_QWORD *)(v0 + 3568) = 0x6973737563726570;
  *(_QWORD *)(v0 + 3600) = 0x6973737563726570;
  *(_QWORD *)(v0 + 4880) = 0x6973737563726570;
  *(_QWORD *)(v0 + 7144) = 0xE800000000000000;
  *(_QWORD *)(v0 + 6320) = 0x6973737563726570;
  *(_QWORD *)(v0 + 6976) = 0x6973737563726570;
  *(_QWORD *)(v0 + 9296) = 0x6973737563726570;
  *(_QWORD *)(v0 + 7088) = 0xD000000000000019;
  *(_QWORD *)(v0 + 7112) = 0xE500000000000000;
  *(_QWORD *)(v0 + 7120) = 0xD000000000000010;
  *(_QWORD *)(v0 + 9312) = 7364980;
  *(_QWORD *)(v0 + 3080) = 0xE300000000000000;
  *(_QWORD *)(v0 + 3128) = 0xE300000000000000;
  *(_QWORD *)(v0 + 7040) = 0xD000000000000010;
  *(_QWORD *)(v0 + 7056) = 0xD000000000000019;
  *(_QWORD *)(v0 + 3160) = 0xE300000000000000;
  *(_QWORD *)(v0 + 3192) = 0xE300000000000000;
  *(_QWORD *)(v0 + 6984) = 0xEA00000000006E6FLL;
  *(_QWORD *)(v0 + 6992) = 0xD000000000000012;
  *(_QWORD *)(v0 + 7000) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 7024) = 0xD000000000000019;
  *(_QWORD *)(v0 + 3224) = 0xE300000000000000;
  *(_QWORD *)(v0 + 3256) = 0xE300000000000000;
  *(_QWORD *)(v0 + 9320) = 0xE300000000000000;
  *(_QWORD *)(v0 + 6952) = 0xE800000000000000;
  *(_QWORD *)(v0 + 6968) = 0xE400000000000000;
  *(_QWORD *)(v0 + 9344) = 0x676E6972616574;
  strcpy((char *)(v0 + 4464), "alarm_abstract");
  strcpy((char *)(v0 + 9392), "alarm_abstract");
  *(_QWORD *)(v0 + 6928) = 0xD000000000000010;
  *(_QWORD *)(v0 + 9416) = 0x800000021775FB10;
  *(_QWORD *)(v0 + 6904) = 0xE500000000000000;
  *(_QWORD *)(v0 + 6920) = 0xE500000000000000;
  *(_QWORD *)(v0 + 9376) = 0x6E6F6870656C6574;
  *(_QWORD *)(v0 + 9424) = 0x6E6F6870656C6574;
  *(_QWORD *)(v0 + 9440) = 0x6E696D6572656874;
  *(_QWORD *)(v0 + 6856) = 0xE500000000000000;
  *(_QWORD *)(v0 + 6864) = 0x7265746177;
  *(_QWORD *)(v0 + 6872) = 0xE500000000000000;
  *(_QWORD *)(v0 + 9472) = 0x68745F706D756874;
  *(_QWORD *)(v0 + 6824) = 0xE400000000000000;
  *(_QWORD *)(v0 + 6832) = 0x736E695F646E6977;
  *(_QWORD *)(v0 + 6840) = 0xEF746E656D757274;
  *(_QWORD *)(v0 + 9480) = 0xEA00000000006475;
  *(_QWORD *)(v0 + 9504) = 0x7265646E756874;
  strcpy((char *)(v0 + 9520), "thunderstorm");
  strcpy((char *)(v0 + 9536), "thunderstorm");
  *(_BYTE *)(v0 + 9533) = 0;
  *(_WORD *)(v0 + 9534) = -5120;
  *(_BYTE *)(v0 + 9549) = 0;
  *(_WORD *)(v0 + 9550) = -5120;
  *(_QWORD *)(v0 + 6768) = 0xD000000000000010;
  *(_QWORD *)(v0 + 6776) = 0x800000021775F410;
  *(_QWORD *)(v0 + 9568) = 1801677172;
  *(_QWORD *)(v0 + 9600) = 0x636F745F6B636974;
  *(_QWORD *)(v0 + 6744) = 0xE400000000000000;
  *(_QWORD *)(v0 + 6696) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 6712) = 0xE500000000000000;
  *(_QWORD *)(v0 + 6720) = 0xD000000000000016;
  *(_QWORD *)(v0 + 6728) = 0x800000021775F8B0;
  *(_QWORD *)(v0 + 9608) = 0xE90000000000006BLL;
  *(_QWORD *)(v0 + 6648) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 6664) = 0xE500000000000000;
  *(_QWORD *)(v0 + 6680) = 0xE400000000000000;
  *(_QWORD *)(v0 + 6688) = 0xD000000000000012;
  *(_QWORD *)(v0 + 6424) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 6440) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 6608) = 0xD000000000000016;
  *(_QWORD *)(v0 + 6616) = 0x800000021775F6B0;
  *(_QWORD *)(v0 + 6640) = 0xD000000000000015;
  *(_QWORD *)(v0 + 9592) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 9624) = 0x800000021775F3F0;
  *(_QWORD *)(v0 + 9632) = 0x696E61706D6974;
  *(_QWORD *)(v0 + 3552) = 1836413540;
  *(_QWORD *)(v0 + 6560) = 0xD000000000000013;
  *(_QWORD *)(v0 + 6576) = 0xD000000000000016;
  *(_QWORD *)(v0 + 6520) = 0xE600000000000000;
  *(_QWORD *)(v0 + 6528) = 0xD000000000000016;
  *(_QWORD *)(v0 + 6536) = 0x800000021775F6B0;
  *(_QWORD *)(v0 + 6544) = 0xD000000000000010;
  *(_QWORD *)(v0 + 6552) = 0x800000021775F410;
  *(_QWORD *)(v0 + 9264) = 1836413540;
  *(_QWORD *)(v0 + 9648) = 1836413540;
  strcpy((char *)(v0 + 9664), "toilet_flush");
  *(_QWORD *)(v0 + 6480) = 0xD000000000000018;
  *(_QWORD *)(v0 + 6488) = 0x800000021775F530;
  *(_BYTE *)(v0 + 9677) = 0;
  *(_WORD *)(v0 + 9678) = -5120;
  strcpy((char *)(v0 + 3536), "tools_abstract");
  strcpy((char *)(v0 + 5136), "tools_abstract");
  strcpy((char *)(v0 + 5360), "tools_abstract");
  *(_QWORD *)(v0 + 6448) = 0xD000000000000018;
  *(_QWORD *)(v0 + 6456) = 0x800000021775F430;
  strcpy((char *)(v0 + 9696), "tools_abstract");
  *(_BYTE *)(v0 + 3551) = -18;
  *(_QWORD *)(v0 + 6416) = 0xD000000000000013;
  *(_QWORD *)(v0 + 6432) = 0xD000000000000013;
  *(_BYTE *)(v0 + 4479) = -18;
  *(_QWORD *)(v0 + 6368) = 0xD000000000000011;
  *(_QWORD *)(v0 + 6384) = 0xD000000000000011;
  *(_QWORD *)(v0 + 6392) = 0x800000021775F8F0;
  *(_BYTE *)(v0 + 4751) = -18;
  *(_BYTE *)(v0 + 4799) = -18;
  *(_QWORD *)(v0 + 6328) = 0xEA00000000006E6FLL;
  *(_QWORD *)(v0 + 6344) = 0xE800000000000000;
  *(_QWORD *)(v0 + 6352) = 0xD000000000000019;
  *(_QWORD *)(v0 + 6360) = 0x800000021775F4B0;
  *(_BYTE *)(v0 + 4831) = -18;
  *(_BYTE *)(v0 + 5151) = -18;
  *(_BYTE *)(v0 + 5375) = -18;
  *(_QWORD *)(v0 + 6296) = 0xE600000000000000;
  *(_QWORD *)(v0 + 6304) = 0xD000000000000011;
  *(_QWORD *)(v0 + 6312) = 0x800000021775F8F0;
  *(_BYTE *)(v0 + 9407) = -18;
  *(_BYTE *)(v0 + 9711) = -18;
  *(_QWORD *)(v0 + 9728) = 0x75726268746F6F74;
  *(_QWORD *)(v0 + 6256) = 0x676E69676E6973;
  *(_QWORD *)(v0 + 6264) = 0xE700000000000000;
  *(_QWORD *)(v0 + 9736) = 0xEA00000000006873;
  strcpy((char *)(v0 + 9760), "traffic_noise");
  *(_QWORD *)(v0 + 6224) = 0x615F6C616D696E61;
  *(_QWORD *)(v0 + 6232) = 0xEF74636172747362;
  *(_WORD *)(v0 + 9774) = -4864;
  *(_QWORD *)(v0 + 6176) = 0xD000000000000016;
  *(_QWORD *)(v0 + 6192) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 6200) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 9824) = 0x6F685F6E69617274;
  *(_QWORD *)(v0 + 9832) = 0xEA00000000006E72;
  *(_QWORD *)(v0 + 6128) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 6160) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 6168) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 6136) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 6144) = 0xD000000000000010;
  *(_QWORD *)(v0 + 9864) = 0x800000021775FB30;
  *(_QWORD *)(v0 + 6064) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 6072) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 6080) = 0xD000000000000010;
  *(_QWORD *)(v0 + 6096) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 6104) = 0xEF74636172747362;
  strcpy((char *)(v0 + 9200), "rail_transport");
  strcpy((char *)(v0 + 9808), "rail_transport");
  strcpy((char *)(v0 + 9872), "rail_transport");
  *(_QWORD *)(v0 + 6032) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 6040) = 0xEF74636172747362;
  *(_BYTE *)(v0 + 9215) = -18;
  *(_BYTE *)(v0 + 9823) = -18;
  *(_BYTE *)(v0 + 9887) = -18;
  *(_QWORD *)(v0 + 5976) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 5984) = 0xD000000000000018;
  *(_QWORD *)(v0 + 6000) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 6008) = 0xEF74636172747362;
  strcpy((char *)(v0 + 9888), "train_whistle");
  *(_QWORD *)(v0 + 5936) = 0xD000000000000018;
  *(_QWORD *)(v0 + 5944) = 0x800000021775F430;
  *(_QWORD *)(v0 + 5968) = 0x615F64697571696CLL;
  *(_WORD *)(v0 + 9902) = -4864;
  *(_QWORD *)(v0 + 5904) = 0xD000000000000015;
  *(_QWORD *)(v0 + 5912) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 5920) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 5928) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 9792) = 0x6E69617274;
  *(_QWORD *)(v0 + 9840) = 0x6E69617274;
  *(_QWORD *)(v0 + 9904) = 0x6E69617274;
  *(_QWORD *)(v0 + 5864) = 0xEA00000000007265;
  *(_QWORD *)(v0 + 5880) = 0xE600000000000000;
  *(_QWORD *)(v0 + 9920) = 0x656E6F626D6F7274;
  *(_QWORD *)(v0 + 9952) = 0x6B63757274;
  *(_QWORD *)(v0 + 5816) = 0xE400000000000000;
  *(_QWORD *)(v0 + 5832) = 0xE800000000000000;
  *(_QWORD *)(v0 + 5840) = 0xD000000000000014;
  *(_QWORD *)(v0 + 5848) = 0x800000021775F790;
  *(_QWORD *)(v0 + 3864) = 0x800000021775F6B0;
  *(_QWORD *)(v0 + 9784) = 0x800000021775F6B0;
  *(_QWORD *)(v0 + 9976) = 0x800000021775F6B0;
  *(_QWORD *)(v0 + 5776) = 0xD000000000000018;
  *(_QWORD *)(v0 + 5784) = 0x800000021775F530;
  *(_QWORD *)(v0 + 5800) = 0xE500000000000000;
  *(_QWORD *)(v0 + 9984) = 0x7465706D757274;
  *(_QWORD *)(v0 + 5720) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 5728) = 0xD000000000000010;
  *(_QWORD *)(v0 + 5744) = 0xD000000000000012;
  *(_QWORD *)(v0 + 5752) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 4536) = 0x800000021775F670;
  *(_QWORD *)(v0 + 5672) = 0xE700000000000000;
  *(_QWORD *)(v0 + 5680) = 0xD000000000000014;
  *(_QWORD *)(v0 + 5688) = 0x800000021775F790;
  *(_QWORD *)(v0 + 5704) = 0xE600000000000000;
  *(_QWORD *)(v0 + 5712) = 0xD000000000000015;
  *(_QWORD *)(v0 + 9944) = 0x800000021775F670;
  *(_QWORD *)(v0 + 10008) = 0x800000021775F670;
  *(_QWORD *)(v0 + 5632) = 0xD000000000000014;
  *(_QWORD *)(v0 + 5640) = 0x800000021775F790;
  *(_QWORD *)(v0 + 5648) = 0xD000000000000015;
  *(_QWORD *)(v0 + 5656) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 10016) = 0x665F676E696E7574;
  *(_QWORD *)(v0 + 5592) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 5600) = 0xD000000000000015;
  *(_QWORD *)(v0 + 5608) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 5624) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10024) = 0xEB000000006B726FLL;
  *(_QWORD *)(v0 + 5560) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 5568) = 0xD000000000000019;
  *(_QWORD *)(v0 + 5584) = 0xD000000000000015;
  strcpy((char *)(v0 + 10048), "turkey_gobble");
  *(_WORD *)(v0 + 10062) = -4864;
  *(_QWORD *)(v0 + 3632) = 1819766630;
  *(_QWORD *)(v0 + 4480) = 1819766630;
  *(_QWORD *)(v0 + 5552) = 0xD000000000000015;
  *(_QWORD *)(v0 + 4912) = 1819766630;
  *(_QWORD *)(v0 + 10064) = 1819766630;
  *(_QWORD *)(v0 + 10080) = 0x7469727765707974;
  *(_QWORD *)(v0 + 5096) = 0xEA00000000007265;
  *(_QWORD *)(v0 + 5384) = 0xEA00000000007265;
  *(_QWORD *)(v0 + 10088) = 0xEA00000000007265;
  *(_QWORD *)(v0 + 10152) = 0x800000021775FB50;
  *(_QWORD *)(v0 + 5432) = 0xE600000000000000;
  *(_QWORD *)(v0 + 5448) = 0xE600000000000000;
  *(_QWORD *)(v0 + 5456) = 0xD000000000000012;
  *(_QWORD *)(v0 + 10096) = 0x676E69707974;
  *(_QWORD *)(v0 + 10112) = 0x676E69707974;
  *(_QWORD *)(v0 + 10160) = 0x676E69707974;
  *(_QWORD *)(v0 + 10176) = 0x656C656C756B75;
  *(_QWORD *)(v0 + 5416) = 0xE600000000000000;
  *(_QWORD *)(v0 + 10216) = 0x800000021775FB70;
  strcpy((char *)(v0 + 10240), "vacuum_cleaner");
  *(_QWORD *)(v0 + 5400) = 0xE800000000000000;
  *(_BYTE *)(v0 + 10255) = -18;
  *(_QWORD *)(v0 + 10280) = 0x800000021775F410;
  *(_QWORD *)(v0 + 10312) = 0x800000021775FB90;
  strcpy((char *)(v0 + 10320), "car_abstract");
  *(_BYTE *)(v0 + 10333) = 0;
  *(_WORD *)(v0 + 10334) = -5120;
  *(_QWORD *)(v0 + 5328) = 0xD000000000000015;
  *(_QWORD *)(v0 + 5336) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 10336) = 0x6F68706172626976;
  *(_QWORD *)(v0 + 9288) = 0xEA0000000000656ELL;
  *(_QWORD *)(v0 + 10344) = 0xEA0000000000656ELL;
  *(_QWORD *)(v0 + 5296) = 0xD000000000000010;
  *(_QWORD *)(v0 + 3488) = 0xD000000000000011;
  *(_QWORD *)(v0 + 5232) = 0xD000000000000012;
  *(_QWORD *)(v0 + 5240) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 5256) = 0xE400000000000000;
  *(_QWORD *)(v0 + 5264) = 0xD000000000000012;
  *(_QWORD *)(v0 + 5272) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 3840) = 0xD000000000000011;
  *(_QWORD *)(v0 + 4288) = 0xD000000000000011;
  *(_QWORD *)(v0 + 4304) = 0xD000000000000011;
  *(_QWORD *)(v0 + 5192) = 0xE500000000000000;
  *(_QWORD *)(v0 + 5200) = 0xD000000000000015;
  *(_QWORD *)(v0 + 5208) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 4848) = 0xD000000000000011;
  *(_QWORD *)(v0 + 9136) = 0xD000000000000011;
  *(_QWORD *)(v0 + 10352) = 0xD000000000000011;
  *(_QWORD *)(v0 + 4856) = 0x800000021775F8F0;
  *(_QWORD *)(v0 + 5168) = 0xD000000000000010;
  *(_QWORD *)(v0 + 9144) = 0x800000021775F8F0;
  *(_QWORD *)(v0 + 10360) = 0x800000021775F8F0;
  strcpy((char *)(v0 + 10368), "violin_fiddle");
  *(_QWORD *)(v0 + 5104) = 0xD000000000000018;
  *(_QWORD *)(v0 + 5112) = 0x800000021775F530;
  *(_QWORD *)(v0 + 5128) = 0xE600000000000000;
  *(_WORD *)(v0 + 10382) = -4864;
  *(_QWORD *)(v0 + 3472) = 0xD000000000000017;
  *(_QWORD *)(v0 + 5064) = 0xE800000000000000;
  *(_QWORD *)(v0 + 5072) = 0x7265746177;
  *(_QWORD *)(v0 + 5080) = 0xE500000000000000;
  *(_QWORD *)(v0 + 10384) = 0xD000000000000017;
  *(_QWORD *)(v0 + 3480) = 0x800000021775F650;
  *(_QWORD *)(v0 + 10392) = 0x800000021775F650;
  *(_QWORD *)(v0 + 10432) = 0x75705F7265746177;
  *(_QWORD *)(v0 + 5040) = 0xD000000000000012;
  *(_QWORD *)(v0 + 10440) = 0xEA0000000000706DLL;
  *(_QWORD *)(v0 + 10224) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 10448) = 0x615F64697571696CLL;
  *(_QWORD *)(v0 + 4984) = 0xE600000000000000;
  *(_QWORD *)(v0 + 5016) = 0xE600000000000000;
  *(_QWORD *)(v0 + 3728) = 0xD000000000000010;
  *(_QWORD *)(v0 + 3776) = 0xD000000000000010;
  *(_QWORD *)(v0 + 3792) = 0xD000000000000010;
  *(_QWORD *)(v0 + 4936) = 0xE600000000000000;
  *(_QWORD *)(v0 + 4944) = 0xD000000000000019;
  *(_QWORD *)(v0 + 4952) = 0x800000021775F4B0;
  *(_QWORD *)(v0 + 4528) = 0xD000000000000010;
  *(_QWORD *)(v0 + 4888) = 0xEA00000000006E6FLL;
  *(_QWORD *)(v0 + 4920) = 0xE400000000000000;
  *(_QWORD *)(v0 + 9232) = 0xD000000000000010;
  *(_QWORD *)(v0 + 9936) = 0xD000000000000010;
  *(_QWORD *)(v0 + 10000) = 0xD000000000000010;
  *(_QWORD *)(v0 + 10272) = 0xD000000000000010;
  *(_QWORD *)(v0 + 10304) = 0xD000000000000010;
  *(_QWORD *)(v0 + 10464) = 0xD000000000000010;
  *(_QWORD *)(v0 + 4872) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10472) = 0x800000021775FBB0;
  *(_QWORD *)(v0 + 10496) = 0x6C61667265746177;
  *(_QWORD *)(v0 + 3816) = 0xE900000000000065;
  *(_QWORD *)(v0 + 9384) = 0xE900000000000065;
  *(_QWORD *)(v0 + 9432) = 0xE900000000000065;
  *(_QWORD *)(v0 + 3176) = 0xE90000000000006CLL;
  *(_QWORD *)(v0 + 3368) = 0xE90000000000006CLL;
  *(_QWORD *)(v0 + 10504) = 0xE90000000000006CLL;
  *(_QWORD *)(v0 + 9168) = 0x7265746177;
  *(_QWORD *)(v0 + 10400) = 0x7265746177;
  *(_QWORD *)(v0 + 10512) = 0x7265746177;
  *(_QWORD *)(v0 + 10536) = 0x800000021775FBD0;
  *(_QWORD *)(v0 + 10560) = 0x6972657073696877;
  *(_QWORD *)(v0 + 4752) = 0xD000000000000018;
  *(_QWORD *)(v0 + 4760) = 0x800000021775F430;
  *(_QWORD *)(v0 + 10568) = 0xEA0000000000676ELL;
  *(_QWORD *)(v0 + 4696) = 0xE900000000000067;
  *(_QWORD *)(v0 + 4712) = 0xE800000000000000;
  *(_QWORD *)(v0 + 4728) = 0xE800000000000000;
  *(_QWORD *)(v0 + 9048) = 0x800000021775F790;
  *(_QWORD *)(v0 + 10584) = 0x800000021775F790;
  *(_QWORD *)(v0 + 10592) = 0x6E696C7473696877;
  *(_QWORD *)(v0 + 4648) = 0xE800000000000000;
  *(_QWORD *)(v0 + 4656) = 0xD000000000000012;
  *(_QWORD *)(v0 + 4680) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10600) = 0xE900000000000067;
  *(_QWORD *)(v0 + 10616) = 0x800000021775F7F0;
  *(_QWORD *)(v0 + 4624) = 0xD000000000000018;
  *(_QWORD *)(v0 + 4632) = 0x800000021775F530;
  *(_QWORD *)(v0 + 9584) = 0xD000000000000013;
  *(_QWORD *)(v0 + 9616) = 0xD000000000000013;
  *(_QWORD *)(v0 + 10208) = 0xD000000000000013;
  *(_QWORD *)(v0 + 10624) = 0xD000000000000013;
  *(_QWORD *)(v0 + 4600) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10632) = 0x800000021775FBF0;
  *(_QWORD *)(v0 + 4552) = 0xE400000000000000;
  *(_QWORD *)(v0 + 4560) = 0xD000000000000015;
  *(_QWORD *)(v0 + 4568) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 9360) = 0xD000000000000020;
  *(_QWORD *)(v0 + 9488) = 0xD000000000000020;
  *(_QWORD *)(v0 + 10640) = 0xD000000000000020;
  *(_QWORD *)(v0 + 9368) = 0x800000021775F550;
  *(_QWORD *)(v0 + 9496) = 0x800000021775F550;
  *(_QWORD *)(v0 + 10648) = 0x800000021775F550;
  *(_QWORD *)(v0 + 4488) = 0xE400000000000000;
  *(_QWORD *)(v0 + 3832) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 10552) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 10664) = 0x800000021775F5B0;
  *(_QWORD *)(v0 + 3280) = 0x615F6C616D696E61;
  *(_QWORD *)(v0 + 4440) = 0xE600000000000000;
  *(_QWORD *)(v0 + 4456) = 0xE700000000000000;
  *(_QWORD *)(v0 + 10672) = 0x615F6C616D696E61;
  *(_QWORD *)(v0 + 3288) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 4392) = 0xE500000000000000;
  *(_QWORD *)(v0 + 4400) = 0x736E695F646E6977;
  *(_QWORD *)(v0 + 4408) = 0xEF746E656D757274;
  *(_QWORD *)(v0 + 4424) = 0xE800000000000000;
  *(_QWORD *)(v0 + 10232) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 10456) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 10680) = 0xEF74636172747362;
  *(_QWORD *)(v0 + 3856) = 0xD000000000000016;
  *(_QWORD *)(v0 + 4240) = 0xD000000000000016;
  *(_QWORD *)(v0 + 4368) = 0xD000000000000012;
  *(_QWORD *)(v0 + 4336) = 0xD000000000000012;
  *(_QWORD *)(v0 + 9408) = 0xD000000000000016;
  *(_QWORD *)(v0 + 9552) = 0xD000000000000016;
  *(_QWORD *)(v0 + 9776) = 0xD000000000000016;
  *(_QWORD *)(v0 + 9856) = 0xD000000000000016;
  *(_QWORD *)(v0 + 9968) = 0xD000000000000016;
  *(_QWORD *)(v0 + 10416) = 0xD000000000000016;
  *(_QWORD *)(v0 + 10704) = 0xD000000000000016;
  *(_QWORD *)(v0 + 4248) = 0x800000021775F8B0;
  *(_QWORD *)(v0 + 4280) = 0xE400000000000000;
  *(_QWORD *)(v0 + 9560) = 0x800000021775F8B0;
  *(_QWORD *)(v0 + 10424) = 0x800000021775F8B0;
  *(_QWORD *)(v0 + 10712) = 0x800000021775F8B0;
  *(_QWORD *)(v0 + 10720) = 0x6968635F646E6977;
  *(_QWORD *)(v0 + 3576) = 0xEA00000000006E6FLL;
  *(_QWORD *)(v0 + 4216) = 0xE500000000000000;
  *(_QWORD *)(v0 + 4232) = 0xE400000000000000;
  *(_QWORD *)(v0 + 3608) = 0xEA00000000006E6FLL;
  *(_QWORD *)(v0 + 9304) = 0xEA00000000006E6FLL;
  *(_QWORD *)(v0 + 10728) = 0xEA0000000000656DLL;
  *(_QWORD *)(v0 + 10736) = 0x656D696863;
  *(_QWORD *)(v0 + 4184) = 0xE600000000000000;
  *(_QWORD *)(v0 + 10752) = 0x736E695F646E6977;
  *(_QWORD *)(v0 + 10760) = 0xEF746E656D757274;
  *(_QWORD *)(v0 + 3664) = 0xD000000000000012;
  *(_QWORD *)(v0 + 4048) = 0xD000000000000012;
  *(_QWORD *)(v0 + 4144) = 0x676E69676E6973;
  *(_QWORD *)(v0 + 4152) = 0xE700000000000000;
  *(_QWORD *)(v0 + 4064) = 0xD000000000000012;
  *(_QWORD *)(v0 + 4080) = 0xD000000000000018;
  *(_QWORD *)(v0 + 4088) = 0x800000021775F430;
  *(_QWORD *)(v0 + 4104) = 0xE400000000000000;
  *(_QWORD *)(v0 + 4112) = 0xD000000000000012;
  *(_QWORD *)(v0 + 9456) = 0xD000000000000012;
  *(_QWORD *)(v0 + 10528) = 0xD000000000000012;
  *(_QWORD *)(v0 + 10768) = 0xD000000000000012;
  *(_QWORD *)(v0 + 3824) = 0xD000000000000015;
  *(_QWORD *)(v0 + 4024) = 0xE600000000000000;
  *(_QWORD *)(v0 + 4040) = 0xE800000000000000;
  *(_QWORD *)(v0 + 9464) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 10544) = 0xD000000000000015;
  *(_QWORD *)(v0 + 10608) = 0xD000000000000015;
  *(_QWORD *)(v0 + 10656) = 0xD000000000000015;
  *(_QWORD *)(v0 + 10776) = 0x800000021775F3D0;
  *(_QWORD *)(v0 + 10784) = 0xD000000000000015;
  *(_QWORD *)(v0 + 10792) = 0x800000021775FC10;
  *(_QWORD *)(v0 + 3928) = 0xE600000000000000;
  *(_QWORD *)(v0 + 3992) = 0xE600000000000000;
  *(_QWORD *)(v0 + 3960) = 0xE600000000000000;
  *(_QWORD *)(v0 + 9040) = 0xD000000000000014;
  *(_QWORD *)(v0 + 10576) = 0xD000000000000014;
  *(_QWORD *)(v0 + 10816) = 0xD000000000000014;
  *(_QWORD *)(v0 + 10824) = 0x800000021775FC30;
  *(_QWORD *)(v0 + 10688) = 1684957559;
  *(_QWORD *)(v0 + 10800) = 1684957559;
  *(_QWORD *)(v0 + 10832) = 1684957559;
  *(_QWORD *)(v0 + 3320) = 0x800000021775F430;
  *(_QWORD *)(v0 + 3880) = 0xE600000000000000;
  *(_QWORD *)(v0 + 3888) = 0xD000000000000018;
  *(_QWORD *)(v0 + 3896) = 0x800000021775F430;
  *(_QWORD *)(v0 + 9720) = 0x800000021775F430;
  *(_QWORD *)(v0 + 10296) = 0x800000021775F430;
  *(_QWORD *)(v0 + 10872) = 0x800000021775F430;
  strcpy((char *)(v0 + 10880), "wood_cracking");
  *(_WORD *)(v0 + 10894) = -4864;
  strcpy((char *)(v0 + 10848), "wood_abstract");
  strcpy((char *)(v0 + 10896), "wood_abstract");
  *(_WORD *)(v0 + 10862) = -4864;
  *(_WORD *)(v0 + 10910) = -4864;
  *(_QWORD *)(v0 + 10912) = 0x676E6974697277;
  *(_QWORD *)(v0 + 10032) = 1819043170;
  *(_QWORD *)(v0 + 10944) = 1819043193;
  *(_QWORD *)(v0 + 3336) = 0xE400000000000000;
  *(_QWORD *)(v0 + 3760) = 0xD000000000000018;
  *(_QWORD *)(v0 + 3768) = 0x800000021775F530;
  *(_QWORD *)(v0 + 3384) = 0xE400000000000000;
  *(_QWORD *)(v0 + 3416) = 0xE400000000000000;
  *(_QWORD *)(v0 + 3448) = 0xE400000000000000;
  *(_QWORD *)(v0 + 3560) = 0xE400000000000000;
  *(_QWORD *)(v0 + 3640) = 0xE400000000000000;
  *(_QWORD *)(v0 + 3704) = 0xE600000000000000;
  *(_QWORD *)(v0 + 3656) = 0xE600000000000000;
  *(_QWORD *)(v0 + 9016) = 0xE400000000000000;
  *(_QWORD *)(v0 + 9272) = 0xE400000000000000;
  *(_QWORD *)(v0 + 9576) = 0xE400000000000000;
  *(_QWORD *)(v0 + 9656) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10040) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10072) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10696) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10808) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10840) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10952) = 0xE400000000000000;
  *(_QWORD *)(v0 + 10960) = 0x74756F6873;
  *(_QWORD *)(v0 + 3512) = 0x800000021775F530;
  *(_QWORD *)(v0 + 3528) = 0xE500000000000000;
  *(_QWORD *)(v0 + 3592) = 0xE800000000000000;
  *(_QWORD *)(v0 + 9176) = 0xE500000000000000;
  *(_QWORD *)(v0 + 9256) = 0xE500000000000000;
  *(_QWORD *)(v0 + 9800) = 0xE500000000000000;
  *(_QWORD *)(v0 + 9848) = 0xE500000000000000;
  *(_QWORD *)(v0 + 9912) = 0xE500000000000000;
  *(_QWORD *)(v0 + 9960) = 0xE500000000000000;
  *(_QWORD *)(v0 + 10408) = 0xE500000000000000;
  *(_QWORD *)(v0 + 10520) = 0xE500000000000000;
  *(_QWORD *)(v0 + 10744) = 0xE500000000000000;
  *(_QWORD *)(v0 + 10968) = 0xE500000000000000;
  *(_QWORD *)(v0 + 10976) = 0x676E696C65646F79;
  *(_QWORD *)(v0 + 3112) = 0xE800000000000000;
  *(_QWORD *)(v0 + 3208) = 0xE800000000000000;
  *(_QWORD *)(v0 + 3504) = 0xD000000000000018;
  *(_QWORD *)(v0 + 9128) = 0xE800000000000000;
  *(_QWORD *)(v0 + 9448) = 0xE800000000000000;
  *(_QWORD *)(v0 + 9928) = 0xE800000000000000;
  *(_QWORD *)(v0 + 10984) = 0xE800000000000000;
  *(_QWORD *)(v0 + 3088) = 0xD000000000000019;
  *(_QWORD *)(v0 + 3264) = 0xD000000000000019;
  *(_QWORD *)(v0 + 3296) = 0xD000000000000018;
  *(_QWORD *)(v0 + 3304) = 0x800000021775F530;
  *(_QWORD *)(v0 + 3312) = 0xD000000000000018;
  *(_QWORD *)(v0 + 3344) = 0xD000000000000018;
  *(_QWORD *)(v0 + 3352) = 0x800000021775F530;
  *(_QWORD *)(v0 + 9032) = 0xE600000000000000;
  *(_QWORD *)(v0 + 9064) = 0xE600000000000000;
  *(_QWORD *)(v0 + 9072) = 0xD000000000000018;
  *(_QWORD *)(v0 + 9080) = 0x800000021775F530;
  *(_QWORD *)(v0 + 9112) = 0xE600000000000000;
  *(_QWORD *)(v0 + 9328) = 0xD000000000000018;
  *(_QWORD *)(v0 + 9336) = 0x800000021775F530;
  *(_QWORD *)(v0 + 9352) = 0xE700000000000000;
  *(_QWORD *)(v0 + 9512) = 0xE700000000000000;
  *(_QWORD *)(v0 + 9640) = 0xE700000000000000;
  *(_QWORD *)(v0 + 9680) = 0xD000000000000018;
  *(_QWORD *)(v0 + 9688) = 0x800000021775F530;
  *(_QWORD *)(v0 + 9712) = 0xD000000000000018;
  *(_QWORD *)(v0 + 9744) = 0xD000000000000018;
  *(_QWORD *)(v0 + 9752) = 0x800000021775F530;
  *(_QWORD *)(v0 + 9992) = 0xE700000000000000;
  *(_QWORD *)(v0 + 10104) = 0xE600000000000000;
  *(_QWORD *)(v0 + 10120) = 0xE600000000000000;
  *(_QWORD *)(v0 + 10128) = 0xD000000000000018;
  *(_QWORD *)(v0 + 10136) = 0x800000021775F530;
  *(_QWORD *)(v0 + 10144) = 0xD000000000000018;
  *(_QWORD *)(v0 + 10168) = 0xE600000000000000;
  *(_QWORD *)(v0 + 10184) = 0xE700000000000000;
  *(_QWORD *)(v0 + 10256) = 0xD000000000000018;
  *(_QWORD *)(v0 + 10264) = 0x800000021775F530;
  *(_QWORD *)(v0 + 10288) = 0xD000000000000018;
  *(_QWORD *)(v0 + 10480) = 0xD000000000000018;
  *(_QWORD *)(v0 + 10488) = 0x800000021775F530;
  *(_QWORD *)(v0 + 10864) = 0xD000000000000018;
  *(_QWORD *)(v0 + 10920) = 0xE700000000000000;
  *(_QWORD *)(v0 + 10928) = 0xD000000000000018;
  *(_QWORD *)(v0 + 10936) = 0x800000021775F530;
  *(_QWORD *)(v0 + 10992) = 0x676E69676E6973;
  *(_QWORD *)(v0 + 11000) = 0xE700000000000000;
  *(_QWORD *)(v0 + 11008) = 0x72657070697ALL;
  *(_QWORD *)(v0 + 11016) = 0xE600000000000000;
  *(_QWORD *)(v0 + 11024) = 0xD000000000000018;
  *(_QWORD *)(v0 + 11032) = 0x800000021775F530;
  *(_QWORD *)(v0 + 11040) = 0x72656874697ALL;
  *(_QWORD *)(v0 + 11048) = 0xE600000000000000;
  *(_QWORD *)(v0 + 9088) = 0xD000000000000019;
  *(_QWORD *)(v0 + 10192) = 0xD000000000000019;
  *(_QWORD *)(v0 + 11056) = 0xD000000000000019;
  *(_QWORD *)(v0 + 10200) = 0x800000021775F4B0;
  *(_QWORD *)(v0 + 11064) = 0x800000021775F4B0;
  return sub_21775E1A8();
}

unint64_t sub_21774BBC8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  unint64_t v17;
  char v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[16];
  uint64_t v36;
  _BYTE v37[40];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    sub_217746620(&qword_254F00450);
    v2 = (_QWORD *)sub_21775E430();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v30 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v29 = (unint64_t)(63 - v3) >> 6;
  v6 = &v34;
  v7 = &v36;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v10 = MEMORY[0x24BEE13C8];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v31 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
          goto LABEL_34;
        if (v12 >= v29)
        {
LABEL_31:
          sub_21774EED8();
          return (unint64_t)v2;
        }
        v13 = *(_QWORD *)(v30 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v29)
            goto LABEL_31;
          v13 = *(_QWORD *)(v30 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v29)
              goto LABEL_31;
            v13 = *(_QWORD *)(v30 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v29)
                goto LABEL_31;
              v13 = *(_QWORD *)(v30 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v29)
                  goto LABEL_31;
                v13 = *(_QWORD *)(v30 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      goto LABEL_35;
                    if (v14 >= v29)
                      goto LABEL_31;
                    v13 = *(_QWORD *)(v30 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_25;
                  }
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_25:
        v31 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v32 = *v16;
      v33 = v16[1];
      swift_bridgeObjectRetain();
      sub_217746620(&qword_254F003C0);
      swift_dynamicCast();
      sub_21774CA20((uint64_t)v6, (uint64_t)v7, &qword_254F003C0);
      sub_21774CA20((uint64_t)v7, (uint64_t)v37, &qword_254F003C0);
      sub_21774CA20((uint64_t)v37, (uint64_t)v35, &qword_254F003C0);
      result = sub_21774D218(v32, v33);
      v17 = result;
      if ((v18 & 1) == 0)
        break;
      v19 = v9;
      v20 = v7;
      v21 = v6;
      v22 = v1;
      v23 = v10;
      v24 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v24 = v32;
      v24[1] = v33;
      v10 = v23;
      v1 = v22;
      v6 = v21;
      v7 = v20;
      v9 = v19;
      result = sub_21774D810((uint64_t)v35, v2[7] + 32 * v17);
      v5 = v31;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v25 = (uint64_t *)(v2[6] + 16 * result);
    *v25 = v32;
    v25[1] = v33;
    result = sub_21774CA20((uint64_t)v35, v2[7] + 32 * result, &qword_254F003C0);
    v26 = v2[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_33;
    v2[2] = v28;
    v5 = v31;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_21774BF20(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  _OWORD *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  _OWORD v49[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    sub_217746620(&qword_254F00448);
    v2 = (_QWORD *)sub_21774FB44();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v41 = v1 + 64;
  sub_21774FAB8();
  v5 = v4 & v3;
  v40 = (unint64_t)(63 - v6) >> 6;
  v7 = &v46;
  v8 = &v48;
  sub_21774FB64();
  v9 = 0;
  v10 = (uint64_t *)&unk_254F00428;
  v11 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v43 = (v5 - 1) & v5;
        v12 = __clz(__rbit64(v5)) | (v9 << 6);
      }
      else
      {
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
          goto LABEL_34;
        if (v13 >= v40)
        {
LABEL_31:
          sub_21774EED8();
          return;
        }
        if (!*(_QWORD *)(v41 + 8 * v13))
        {
          sub_21774FBD8();
          if (v14 == v15)
            goto LABEL_31;
          sub_21774FBC0();
          if (!v16)
          {
            sub_21774FBD8();
            if (v14 == v15)
              goto LABEL_31;
            sub_21774FBC0();
            if (!v17)
            {
              sub_21774FBD8();
              if (v14 == v15)
                goto LABEL_31;
              sub_21774FBC0();
              if (!v19)
              {
                v20 = v18 + 4;
                if (v20 >= v40)
                  goto LABEL_31;
                if (!*(_QWORD *)(v41 + 8 * v20))
                {
                  while (!__OFADD__(v20, 1))
                  {
                    sub_21774FBD8();
                    if (v14 == v15)
                      goto LABEL_31;
                    sub_21774FBC0();
                    v20 = v21 + 1;
                    if (v22)
                      goto LABEL_25;
                  }
                  goto LABEL_35;
                }
              }
            }
          }
        }
LABEL_25:
        sub_21774FAE8();
        v9 = v23;
      }
      v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v12);
      v44 = *v24;
      v45 = v24[1];
      v25 = *(id *)(*(_QWORD *)(v1 + 56) + 8 * v12);
      swift_bridgeObjectRetain();
      sub_217746620(v10);
      swift_dynamicCast();
      sub_21774F954(v7, v8);
      sub_21774F954(v8, v49);
      sub_21774F954(v49, &v47);
      v26 = sub_21774D218(v44, v45);
      v27 = v26;
      if ((v28 & 1) == 0)
        break;
      v42 = v9;
      v29 = v8;
      v30 = v7;
      v31 = v1;
      v32 = v11;
      v33 = v10;
      v34 = (uint64_t *)(v2[6] + 16 * v26);
      swift_bridgeObjectRelease();
      *v34 = v44;
      v34[1] = v45;
      v10 = v33;
      v11 = v32;
      v1 = v31;
      v7 = v30;
      v8 = v29;
      v9 = v42;
      v35 = (_OWORD *)(v2[7] + 32 * v27);
      sub_21774F964((uint64_t)v35);
      sub_21774F954(&v47, v35);
      v5 = v43;
    }
    if (v2[2] >= v2[3])
      break;
    sub_21774FB90((v26 >> 3) & 0x1FFFFFFFFFFFFFF8);
    v37 = (uint64_t *)(v36 + 16 * v27);
    *v37 = v44;
    v37[1] = v45;
    sub_21774F954(&v47, (_OWORD *)(v2[7] + 32 * v27));
    v38 = v2[2];
    v15 = __OFADD__(v38, 1);
    v39 = v38 + 1;
    if (v15)
      goto LABEL_33;
    v2[2] = v39;
    v5 = v43;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
}

void sub_21774C218(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    sub_217746620(&qword_254F00418);
    v2 = (_QWORD *)sub_21774FB44();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v41 = v1 + 64;
  sub_21774FAB8();
  v5 = v4 & v3;
  v40 = (unint64_t)(63 - v6) >> 6;
  sub_21774FB64();
  v7 = 0;
  v8 = (unint64_t *)&qword_254F00420;
  v9 = 0x24BDBFF98uLL;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v42 = (v5 - 1) & v5;
        v10 = __clz(__rbit64(v5)) | (v7 << 6);
      }
      else
      {
        v11 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_34;
        if (v11 >= v40)
        {
LABEL_31:
          sub_21774EED8();
          return;
        }
        if (!*(_QWORD *)(v41 + 8 * v11))
        {
          sub_21774FBCC();
          if (v12 == v13)
            goto LABEL_31;
          sub_21774FBEC();
          if (!v14)
          {
            sub_21774FBCC();
            if (v12 == v13)
              goto LABEL_31;
            sub_21774FBEC();
            if (!v15)
            {
              sub_21774FBCC();
              if (v12 == v13)
                goto LABEL_31;
              sub_21774FBEC();
              if (!v17)
              {
                v18 = v16 + 4;
                if (v18 >= v40)
                  goto LABEL_31;
                if (!*(_QWORD *)(v41 + 8 * v18))
                {
                  while (!__OFADD__(v18, 1))
                  {
                    sub_21774FBCC();
                    if (v12 == v13)
                      goto LABEL_31;
                    sub_21774FBEC();
                    v18 = v19 + 1;
                    if (v20)
                      goto LABEL_25;
                  }
                  goto LABEL_35;
                }
              }
            }
          }
        }
LABEL_25:
        sub_21774FAE8();
        v7 = v21;
      }
      v22 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v10);
      v24 = *v22;
      v23 = v22[1];
      v25 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v10);
      sub_217746728(0, v8);
      sub_21774666C();
      v26 = v25;
      sub_217746620(&qword_254F00428);
      swift_dynamicCast();
      v27 = sub_21774FB04();
      v28 = v27;
      if ((v29 & 1) == 0)
        break;
      v30 = v1;
      v31 = v7;
      v32 = v9;
      v33 = v8;
      v34 = (_QWORD *)(v2[6] + 16 * v27);
      swift_bridgeObjectRelease();
      *v34 = v24;
      v34[1] = v23;
      v35 = v2[7];

      *(_QWORD *)(v35 + 8 * v28) = v43;
      v8 = v33;
      v9 = v32;
      v7 = v31;
      v1 = v30;
      v5 = v42;
    }
    if (v2[2] >= v2[3])
      break;
    sub_21774FB90((v27 >> 3) & 0x1FFFFFFFFFFFFFF8);
    v37 = (_QWORD *)(v36 + 16 * v28);
    *v37 = v24;
    v37[1] = v23;
    *(_QWORD *)(v2[7] + 8 * v28) = v43;
    v38 = v2[2];
    v13 = __OFADD__(v38, 1);
    v39 = v38 + 1;
    if (v13)
      goto LABEL_33;
    v2[2] = v39;
    v5 = v42;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
}

uint64_t static BMContextualUnderstandingSoundAnalysis.soundHierarchyLabels()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  sub_21774FBE4(a1, &qword_254F003C8);
  v1 = static BMContextualUnderstandingSoundAnalysis.soundHierarchyDictionary()();
  v2 = sub_21774C6DC(v1);
  v3 = static BMContextualUnderstandingSoundAnalysis.soundHierarchyDictionary()();
  v4 = sub_21774C55C(v3);
  sub_21774C858(v4, v2);
  swift_bridgeObjectRetain();
  sub_21774DA6C();
  v6 = v5;
  sub_21774FBA4();
  v8 = v6;
  sub_21774DA04(&v8);
  sub_21774FBA4();
  return v8;
}

uint64_t sub_21774C55C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  unint64_t v20;

  v18 = sub_21775E2A4();
  result = sub_21774EE40(a1, v19);
  v3 = v19[0];
  v4 = v19[1];
  v5 = v19[3];
  v6 = v20;
  v7 = (unint64_t)(v19[2] + 64) >> 6;
  if (!v20)
    goto LABEL_3;
LABEL_2:
  v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v9 = v8 | (v5 << 6);
  while (1)
  {
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 56) + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_21774D858(&v17, v15, v16);
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_2;
LABEL_3:
    v10 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v10 >= v7)
      goto LABEL_21;
    v11 = *(_QWORD *)(v4 + 8 * v10);
    v12 = v5 + 1;
    if (!v11)
    {
      v12 = v5 + 2;
      if (v5 + 2 >= v7)
        goto LABEL_21;
      v11 = *(_QWORD *)(v4 + 8 * v12);
      if (!v11)
      {
        v12 = v5 + 3;
        if (v5 + 3 >= v7)
          goto LABEL_21;
        v11 = *(_QWORD *)(v4 + 8 * v12);
        if (!v11)
        {
          v12 = v5 + 4;
          if (v5 + 4 >= v7)
            goto LABEL_21;
          v11 = *(_QWORD *)(v4 + 8 * v12);
          if (!v11)
          {
            v12 = v5 + 5;
            if (v5 + 5 >= v7)
              goto LABEL_21;
            v11 = *(_QWORD *)(v4 + 8 * v12);
            if (!v11)
            {
              v13 = v5 + 6;
              while (v13 < v7)
              {
                v11 = *(_QWORD *)(v4 + 8 * v13++);
                if (v11)
                {
                  v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_21:
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v5 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_21774C6DC(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  unint64_t v20;

  v18 = sub_21775E2A4();
  result = sub_21774EE40(a1, v19);
  v3 = v19[0];
  v4 = v19[1];
  v5 = v19[3];
  v6 = v20;
  v7 = (unint64_t)(v19[2] + 64) >> 6;
  if (!v20)
    goto LABEL_3;
LABEL_2:
  v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v9 = v8 | (v5 << 6);
  while (1)
  {
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_21774D858(&v17, v15, v16);
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_2;
LABEL_3:
    v10 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v10 >= v7)
      goto LABEL_21;
    v11 = *(_QWORD *)(v4 + 8 * v10);
    v12 = v5 + 1;
    if (!v11)
    {
      v12 = v5 + 2;
      if (v5 + 2 >= v7)
        goto LABEL_21;
      v11 = *(_QWORD *)(v4 + 8 * v12);
      if (!v11)
      {
        v12 = v5 + 3;
        if (v5 + 3 >= v7)
          goto LABEL_21;
        v11 = *(_QWORD *)(v4 + 8 * v12);
        if (!v11)
        {
          v12 = v5 + 4;
          if (v5 + 4 >= v7)
            goto LABEL_21;
          v11 = *(_QWORD *)(v4 + 8 * v12);
          if (!v11)
          {
            v12 = v5 + 5;
            if (v5 + 5 >= v7)
              goto LABEL_21;
            v11 = *(_QWORD *)(v4 + 8 * v12);
            if (!v11)
            {
              v13 = v5 + 6;
              while (v13 < v7)
              {
                v11 = *(_QWORD *)(v4 + 8 * v13++);
                if (v11)
                {
                  v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_21:
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v5 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_21774C858(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = result;
  v3 = 0;
  v18 = a2;
  v4 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  if (!v7)
    goto LABEL_5;
LABEL_4:
  v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v9 | (v3 << 6); ; i = __clz(__rbit64(v12)) + (v3 << 6))
  {
    v14 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v15 = *v14;
    v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_21774D858(&v17, v15, v16);
    result = swift_bridgeObjectRelease();
    if (v7)
      goto LABEL_4;
LABEL_5:
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_20:
    v7 = (v12 - 1) & v12;
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_21774C9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_217746620(&qword_254F003C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21774CA20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_217746620(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21774CA64(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_21774CB30(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21774F984((uint64_t)v12, *a3);
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
      sub_21774F984((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_21774FAD8();
  }
  sub_21774F964((uint64_t)v12);
  return v7;
}

uint64_t sub_21774CB30(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_21774CC84((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_21775E328();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_21774CD48(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_21775E37C();
    if (!v8)
    {
      result = sub_21775E3F4();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_21774CC84(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_21775E43C();
  __break(1u);
  return result;
}

uint64_t sub_21774CD48(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21774CDDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_21774CFB0(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_21774CFB0((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21774CDDC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_21775E238();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_21774CF4C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_21775E364();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_21775E43C();
  __break(1u);
LABEL_14:
  result = sub_21775E3F4();
  __break(1u);
  return result;
}

_QWORD *sub_21774CF4C(uint64_t a1, uint64_t a2)
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
  sub_217746620(&qword_254F00458);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21774CFB0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_217746620(&qword_254F00458);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_21774D148(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21774D084(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_21774D084(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_21775E43C();
  __break(1u);
  return result;
}

char *sub_21774D148(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_21775E43C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_21774D1C8(unsigned __int8 a1)
{
  uint64_t v2;

  sub_21774FBB4();
  sub_21775E4B4();
  v2 = sub_21775E4C0();
  return sub_21774D274(a1, v2);
}

unint64_t sub_21774D218(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21774FBB4();
  sub_21775E214();
  v4 = sub_21775E4C0();
  return sub_21774D314(a1, a2, v4);
}

unint64_t sub_21774D274(unsigned __int8 a1, uint64_t a2)
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
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_21774D314(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21775E46C() & 1) == 0)
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
      while (!v14 && (sub_21775E46C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21774D3F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_217746620(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21774D430(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_21774D44C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_2177583A4((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

void sub_21774D480(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  void *v5;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  id v24;
  id v25[4];
  _QWORD v26[4];
  _BYTE v27[32];
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;

  sub_217758CA4(&v32);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_217758CE4(&v30);
  v8 = *((_QWORD *)&v30 + 1);
  if (!*((_QWORD *)&v30 + 1))
  {
LABEL_16:
    swift_release();
    swift_bridgeObjectRelease();
    sub_21774EED8();
    swift_release();
    return;
  }
  v33 = &v31;
  while (1)
  {
    v9 = v30;
    v28 = v30;
    v29 = v8;
    sub_21774CA20((uint64_t)v33, (uint64_t)v27, &qword_254F003C0);
    v10 = *(_QWORD **)a5;
    v12 = sub_21774D218(v9, v8);
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      sub_21775E484();
      __break(1u);
      goto LABEL_22;
    }
    v16 = v11;
    if (v10[3] < v15)
      break;
    if ((a4 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_217746620(&qword_254F003E8);
      sub_21775E3DC();
      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v19 = *(_QWORD **)a5;
    *(_QWORD *)(*(_QWORD *)a5 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    v20 = (uint64_t *)(v19[6] + 16 * v12);
    *v20 = v9;
    v20[1] = v8;
    sub_21774CA20((uint64_t)v27, v19[7] + 32 * v12, &qword_254F003C0);
    v21 = v19[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_20;
    v19[2] = v23;
LABEL_15:
    sub_217758CE4(&v30);
    v8 = *((_QWORD *)&v30 + 1);
    a4 = 1;
    if (!*((_QWORD *)&v30 + 1))
      goto LABEL_16;
  }
  sub_21775792C(v15, a4 & 1);
  v17 = sub_21774D218(v9, v8);
  if ((v16 & 1) != (v18 & 1))
    goto LABEL_21;
  v12 = v17;
  if ((v16 & 1) == 0)
    goto LABEL_13;
LABEL_10:
  sub_21774C9D8(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v12, (uint64_t)v25);
  sub_21774790C((uint64_t)v25, (uint64_t)v27, (uint64_t)v26);
  if (!v5)
  {
    sub_21774D3F4((uint64_t)v25, &qword_254F003C0);
    sub_21774D3F4((uint64_t)v27, &qword_254F003C0);
    swift_bridgeObjectRelease();
    sub_21774D810((uint64_t)v26, *(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v12);
    goto LABEL_15;
  }
  sub_21774D3F4((uint64_t)v25, &qword_254F003C0);
  v25[0] = v5;
  v24 = v5;
  sub_217746620(&qword_254F00460);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_21774D3F4((uint64_t)v27, &qword_254F003C0);
    swift_bridgeObjectRelease();
    sub_21774EED8();
    swift_release();

    return;
  }
LABEL_22:
  v26[0] = 0;
  v26[1] = 0xE000000000000000;
  sub_21775E358();
  sub_21775E220();
  sub_21775E3C4();
  sub_21775E220();
  sub_21775E400();
  __break(1u);
}

uint64_t sub_21774D810(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_217746620(&qword_254F003C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21774D858(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_21775E4A8();
  swift_bridgeObjectRetain();
  sub_21775E214();
  v8 = sub_21775E4C0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_21775E46C() & 1) != 0)
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
      if (v19 || (sub_21775E46C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21774E84C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

void sub_21774DA04(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_217754F94();
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_21774DCA8(v5);
  *a1 = v2;
}

void sub_21774DA6C()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_21774FA1C();
  if (*(_QWORD *)(v0 + 16))
  {
    sub_217746620(&qword_253F2CA18);
    v1 = (const void *)sub_217747874();
    v2 = j__malloc_size(v1);
    sub_2177466C8(v2 - 32);
    sub_21774EEE0(v3, v4, v5, v6);
    sub_21774FA04();
    sub_21774F9DC();
    if (!v7)
      __break(1u);
  }
  sub_21774F9C0();
}

void sub_21774DAE0()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_21774FA1C();
  if (*(_QWORD *)(v0 + 16))
  {
    sub_217746620(&qword_254F00430);
    v1 = (const void *)sub_217747874();
    v2 = j__malloc_size(v1);
    sub_21774FA50(v2);
    sub_21774F0DC(v3, v4, v5, v6);
    sub_21774FA98();
    sub_21774F9DC();
    if (!v7)
      __break(1u);
  }
  sub_21774F9C0();
}

void sub_21774DB50()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_21774FA1C();
  if (*(_QWORD *)(v0 + 16))
  {
    sub_217746620(&qword_254F00438);
    v1 = (const void *)sub_217747874();
    v2 = j__malloc_size(v1);
    sub_21774FA50(v2);
    sub_21774F31C(v3, v4, v5, v6);
    sub_21774FA98();
    sub_21774F9DC();
    if (!v7)
      __break(1u);
  }
  sub_21774F9C0();
}

void sub_21774DBC0()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_21774FA1C();
  if (*(_QWORD *)(v0 + 16))
  {
    sub_217746620(&qword_254F00440);
    v1 = (const void *)sub_217747874();
    v2 = j__malloc_size(v1);
    sub_2177466C8(v2 - 32);
    sub_21774F534(v3, v4, v5, v6);
    sub_21774FA04();
    sub_21774F9DC();
    if (!v7)
      __break(1u);
  }
  sub_21774F9C0();
}

void sub_21774DC34()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_21774FA1C();
  if (*(_QWORD *)(v0 + 16))
  {
    sub_217746620(&qword_253F2CA18);
    v1 = (const void *)sub_217747874();
    v2 = j__malloc_size(v1);
    sub_2177466C8(v2 - 32);
    sub_21774F754(v3, v4, v5, v6);
    sub_21774FA04();
    sub_21774F9DC();
    if (!v7)
      __break(1u);
  }
  sub_21774F9C0();
}

void sub_21774DCA8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  char v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  BOOL v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;

  v3 = a1[1];
  v4 = sub_21775E454();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_21774E30C(0, v3, 1, a1);
      return;
    }
    goto LABEL_144;
  }
  v5 = v4;
  sub_217751988(v3 / 2);
  v98 = v6;
  v99 = v3;
  v100 = v7;
  v96 = a1;
  if (v3 <= 0)
  {
    v101 = MEMORY[0x24BEE4AF8];
    v33 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    if (v33 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(_QWORD *)(v98 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_149;
    }
    v88 = *v96;
    while (1)
    {
      v89 = v33 - 2;
      if (v33 < 2)
        break;
      if (!v88)
        goto LABEL_153;
      v90 = (char *)v101;
      v91 = *(_QWORD *)(v101 + 32 + 16 * v89);
      v92 = *(_QWORD *)(v101 + 32 + 16 * (v33 - 1) + 8);
      sub_21774E3D0((char *)(v88 + 16 * v91), (char *)(v88 + 16 * *(_QWORD *)(v101 + 32 + 16 * (v33 - 1))), v88 + 16 * v92, v100);
      if (v1)
        goto LABEL_106;
      if (v92 < v91)
        goto LABEL_139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v90 = sub_217754F80(v101);
      if (v89 >= *((_QWORD *)v90 + 2))
        goto LABEL_140;
      v93 = &v90[16 * v89 + 32];
      *(_QWORD *)v93 = v91;
      *((_QWORD *)v93 + 1) = v92;
      v94 = *((_QWORD *)v90 + 2);
      if (v33 > v94)
        goto LABEL_141;
      memmove(&v90[16 * v33 + 16], &v90[16 * v33 + 32], 16 * (v94 - v33));
      v101 = (uint64_t)v90;
      *((_QWORD *)v90 + 2) = v94 - 1;
      v33 = v94 - 1;
      v3 = v99;
      if (v94 <= 2)
        goto LABEL_121;
    }
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
    return;
  }
  v97 = v5;
  v8 = 0;
  v9 = *a1;
  v95 = *a1 + 8;
  v101 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v10 = v8++;
    if (v8 >= v3)
      goto LABEL_32;
    v11 = (uint64_t *)(v9 + 16 * v8);
    v12 = *v11;
    v13 = v11[1];
    v14 = (_QWORD *)(v9 + 16 * v10);
    if (v12 == *v14 && v13 == v14[1])
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v3)
        goto LABEL_31;
      v16 = 0;
LABEL_13:
      v18 = (_QWORD *)(v95 + 16 * v17);
      do
      {
        v19 = (_QWORD *)(v9 + 16 * v8);
        if (*(v18 - 1) == *v19 && *v18 == v19[1])
        {
          if ((v16 & 1) != 0)
            goto LABEL_24;
        }
        else if (((v16 ^ sub_21775E46C()) & 1) != 0)
        {
          goto LABEL_23;
        }
        v18 += 2;
        v21 = v17 + 1;
        v8 = v17;
        v17 = v21;
      }
      while (v21 < v3);
      v17 = v21;
      goto LABEL_23;
    }
    v16 = sub_21775E46C();
    v17 = v10 + 2;
    if (v10 + 2 < v3)
      goto LABEL_13;
LABEL_23:
    v8 = v17;
    if ((v16 & 1) == 0)
      goto LABEL_32;
LABEL_24:
    if (v17 < v10)
      goto LABEL_148;
    if (v10 < v17)
    {
      v22 = 16 * v17;
      v23 = 16 * v10;
      v24 = v17;
      v25 = v10;
      do
      {
        if (v25 != --v24)
        {
          if (!v9)
            goto LABEL_152;
          v26 = v9 + v22;
          v27 = *(_QWORD *)(v9 + v23);
          v28 = *(_QWORD *)(v9 + v23 + 8);
          *(_OWORD *)(v9 + v23) = *(_OWORD *)(v9 + v22 - 16);
          *(_QWORD *)(v26 - 16) = v27;
          *(_QWORD *)(v26 - 8) = v28;
        }
        ++v25;
        v22 -= 16;
        v23 += 16;
      }
      while (v25 < v24);
    }
LABEL_31:
    v8 = v17;
LABEL_32:
    if (v8 >= v3)
      goto LABEL_41;
    if (__OFSUB__(v8, v10))
      goto LABEL_143;
    if (v8 - v10 >= v97)
      goto LABEL_41;
    if (__OFADD__(v10, v97))
      goto LABEL_146;
    if (v10 + v97 >= v3)
      v29 = v3;
    else
      v29 = v10 + v97;
    if (v29 < v10)
      goto LABEL_147;
    if (v8 == v29)
    {
LABEL_41:
      v30 = (char *)v101;
    }
    else
    {
      v81 = (_QWORD *)(v9 + 16 * v8);
      v30 = (char *)v101;
      do
      {
        v82 = (uint64_t *)(v9 + 16 * v8);
        v83 = *v82;
        v84 = v82[1];
        v85 = v10;
        v86 = v81;
        do
        {
          v87 = v83 == *(v86 - 2) && v84 == *(v86 - 1);
          if (v87 || (sub_21775E46C() & 1) == 0)
            break;
          if (!v9)
            goto LABEL_150;
          v83 = *v86;
          v84 = v86[1];
          *(_OWORD *)v86 = *((_OWORD *)v86 - 1);
          *(v86 - 1) = v84;
          *(v86 - 2) = v83;
          v86 -= 2;
          ++v85;
        }
        while (v8 != v85);
        ++v8;
        v81 += 2;
      }
      while (v8 != v29);
      v8 = v29;
    }
    if (v8 < v10)
      goto LABEL_142;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v30 = sub_217754E90(0, *((_QWORD *)v30 + 2) + 1, 1, v30);
    v32 = *((_QWORD *)v30 + 2);
    v31 = *((_QWORD *)v30 + 3);
    v33 = v32 + 1;
    if (v32 >= v31 >> 1)
      v30 = sub_217754E90((char *)(v31 > 1), v32 + 1, 1, v30);
    *((_QWORD *)v30 + 2) = v33;
    v34 = v30 + 32;
    v35 = &v30[16 * v32 + 32];
    *(_QWORD *)v35 = v10;
    *((_QWORD *)v35 + 1) = v8;
    v101 = (uint64_t)v30;
    if (v32)
      break;
    v33 = 1;
LABEL_90:
    v3 = v99;
    if (v8 >= v99)
      goto LABEL_110;
  }
  while (1)
  {
    v36 = v33 - 1;
    if (v33 >= 4)
    {
      v41 = &v34[16 * v33];
      v42 = *((_QWORD *)v41 - 8);
      v43 = *((_QWORD *)v41 - 7);
      v47 = __OFSUB__(v43, v42);
      v44 = v43 - v42;
      if (v47)
        goto LABEL_127;
      v46 = *((_QWORD *)v41 - 6);
      v45 = *((_QWORD *)v41 - 5);
      v47 = __OFSUB__(v45, v46);
      v39 = v45 - v46;
      v40 = v47;
      if (v47)
        goto LABEL_128;
      v48 = v33 - 2;
      v49 = &v34[16 * v33 - 32];
      v51 = *(_QWORD *)v49;
      v50 = *((_QWORD *)v49 + 1);
      v47 = __OFSUB__(v50, v51);
      v52 = v50 - v51;
      if (v47)
        goto LABEL_129;
      v47 = __OFADD__(v39, v52);
      v53 = v39 + v52;
      if (v47)
        goto LABEL_131;
      if (v53 >= v44)
      {
        v71 = &v34[16 * v36];
        v73 = *(_QWORD *)v71;
        v72 = *((_QWORD *)v71 + 1);
        v47 = __OFSUB__(v72, v73);
        v74 = v72 - v73;
        if (v47)
          goto LABEL_137;
        v64 = v39 < v74;
        goto LABEL_79;
      }
    }
    else
    {
      if (v33 != 3)
      {
        v65 = *((_QWORD *)v30 + 4);
        v66 = *((_QWORD *)v30 + 5);
        v47 = __OFSUB__(v66, v65);
        v58 = v66 - v65;
        v59 = v47;
        goto LABEL_73;
      }
      v38 = *((_QWORD *)v30 + 4);
      v37 = *((_QWORD *)v30 + 5);
      v47 = __OFSUB__(v37, v38);
      v39 = v37 - v38;
      v40 = v47;
    }
    if ((v40 & 1) != 0)
      goto LABEL_130;
    v48 = v33 - 2;
    v54 = &v34[16 * v33 - 32];
    v56 = *(_QWORD *)v54;
    v55 = *((_QWORD *)v54 + 1);
    v57 = __OFSUB__(v55, v56);
    v58 = v55 - v56;
    v59 = v57;
    if (v57)
      goto LABEL_132;
    v60 = &v34[16 * v36];
    v62 = *(_QWORD *)v60;
    v61 = *((_QWORD *)v60 + 1);
    v47 = __OFSUB__(v61, v62);
    v63 = v61 - v62;
    if (v47)
      goto LABEL_134;
    if (__OFADD__(v58, v63))
      goto LABEL_136;
    if (v58 + v63 >= v39)
    {
      v64 = v39 < v63;
LABEL_79:
      if (v64)
        v36 = v48;
      goto LABEL_81;
    }
LABEL_73:
    if ((v59 & 1) != 0)
      goto LABEL_133;
    v67 = &v34[16 * v36];
    v69 = *(_QWORD *)v67;
    v68 = *((_QWORD *)v67 + 1);
    v47 = __OFSUB__(v68, v69);
    v70 = v68 - v69;
    if (v47)
      goto LABEL_135;
    if (v70 < v58)
      goto LABEL_90;
LABEL_81:
    v75 = v36 - 1;
    if (v36 - 1 >= v33)
    {
      __break(1u);
LABEL_124:
      __break(1u);
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
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v9)
      goto LABEL_151;
    v76 = &v34[16 * v75];
    v77 = *(_QWORD *)v76;
    v78 = &v34[16 * v36];
    v79 = *((_QWORD *)v78 + 1);
    sub_21774E3D0((char *)(v9 + 16 * *(_QWORD *)v76), (char *)(v9 + 16 * *(_QWORD *)v78), v9 + 16 * v79, v100);
    if (v1)
      break;
    if (v79 < v77)
      goto LABEL_124;
    if (v36 > *(_QWORD *)(v101 + 16))
      goto LABEL_125;
    *(_QWORD *)v76 = v77;
    *(_QWORD *)&v34[16 * v75 + 8] = v79;
    v80 = *(_QWORD *)(v101 + 16);
    if (v36 >= v80)
      goto LABEL_126;
    v30 = (char *)v101;
    v33 = v80 - 1;
    memmove(&v34[16 * v36], v78 + 16, 16 * (v80 - 1 - v36));
    *(_QWORD *)(v101 + 16) = v80 - 1;
    if (v80 <= 2)
      goto LABEL_90;
  }
LABEL_106:
  swift_bridgeObjectRelease();
  if (v99 < -1)
    goto LABEL_145;
  *(_QWORD *)(v98 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_21774E30C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 16 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1))
          break;
        result = sub_21775E46C();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        result = *v12;
        v10 = v12[1];
        *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_21774E3D0(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v14;
  char *v15;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 16;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 16;
  if (v9 >= v11)
  {
    sub_2177576F0(a2, (uint64_t)(a3 - (_QWORD)a2) / 16, a4);
    v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16)
      goto LABEL_47;
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      v20 = (char *)(v12 - 16);
      v21 = *(_QWORD *)(v12 - 16) == *((_QWORD *)v6 - 2) && *(_QWORD *)(v12 - 8) == *((_QWORD *)v6 - 1);
      if (v21 || (sub_21775E46C() & 1) == 0)
      {
        v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23)
          goto LABEL_43;
      }
      else
      {
        v22 = v19 != v6 || v18 >= v6;
        v20 = v6 - 16;
        v6 -= 16;
        if (!v22)
          goto LABEL_43;
      }
      *(_OWORD *)v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4)
        goto LABEL_47;
    }
  }
  sub_2177576F0(a1, (a2 - a1) / 16, a4);
  v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v14 && (sub_21775E46C() & 1) != 0)
        break;
      v15 = v4;
      v14 = v7 == v4;
      v4 += 16;
      if (!v14)
        goto LABEL_15;
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_21;
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 16;
    if (v14)
      goto LABEL_16;
LABEL_15:
    *(_OWORD *)v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  sub_2177576F0(v4, (uint64_t)(v12 - (_QWORD)v4) / 16, v6);
  return 1;
}

uint64_t sub_21774E574()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  sub_217746620(&qword_254F00410);
  v3 = sub_21775E34C();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_21775E4A8();
      sub_21775E214();
      result = sub_21775E4C0();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_21774D430(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21774E84C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_21774E574();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_21774E9E4();
      goto LABEL_22;
    }
    sub_21774EB94();
  }
  v11 = *v4;
  sub_21775E4A8();
  sub_21775E214();
  result = sub_21775E4C0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_21775E46C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_21775E478();
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
          result = sub_21775E46C();
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

void *sub_21774E9E4()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  sub_217746620(&qword_254F00410);
  v2 = *v0;
  v3 = sub_21775E340();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21774EB94()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  sub_217746620(&qword_254F00410);
  v3 = sub_21775E34C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_21775E4A8();
    swift_bridgeObjectRetain();
    sub_21775E214();
    result = sub_21775E4C0();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21774EE40@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_21774EE78(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_soundName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_21775E1C0();

  return v3;
}

uint64_t sub_21774EED8()
{
  return swift_release();
}

uint64_t sub_21774EEE0(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_21774F0DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

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
LABEL_39:
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
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v27 = -1 << *(_BYTE *)(a4 + 32);
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (uint64_t *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(_QWORD *)(a4 + 56) + 32 * v16;
    v24 = *(_QWORD *)v23;
    v25 = *(_QWORD *)(v23 + 8);
    v26 = *(_OWORD *)(v23 + 16);
    *(_QWORD *)v11 = v22;
    *(_QWORD *)(v11 + 8) = v21;
    *(_QWORD *)(v11 + 16) = v24;
    *(_QWORD *)(v11 + 24) = v25;
    *(_OWORD *)(v11 + 32) = v26;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      goto LABEL_38;
    }
    v11 += 48;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = swift_unknownObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v27;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_21774F31C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  uint64_t v22;
  uint64_t v23;

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
LABEL_39:
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
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v23 = -1 << *(_BYTE *)(a4 + 32);
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
    v22 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    result = swift_retain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_21774F534(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  __int128 v22;

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
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    v22 = *(_OWORD *)(*(_QWORD *)(a4 + 56) + 16 * v16);
    *(_QWORD *)v11 = *v20;
    *(_QWORD *)(v11 + 8) = v21;
    *(_OWORD *)(v11 + 16) = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      goto LABEL_38;
    }
    v11 += 32;
    swift_bridgeObjectRetain();
    result = swift_unknownObjectRetain();
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

uint64_t sub_21774F754(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

_OWORD *sub_21774F954(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21774F964(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21774F984(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21774F9DC()
{
  return sub_21774EED8();
}

uint64_t sub_21774FA04()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_21774FA38()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21774D218(v1, v0);
}

uint64_t sub_21774FA48()
{
  return swift_bridgeObjectRelease();
}

void sub_21774FA50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = 2 * ((a1 - 32) / v3);
}

uint64_t sub_21774FA74()
{
  return sub_21775E46C();
}

uint64_t sub_21774FA90()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21774FA98()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21774FAB0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21774FAD8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21774FAE0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_21774CA20(a1, a2, v2);
}

unint64_t sub_21774FB04()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21774D218(v1, v0);
}

uint64_t sub_21774FB10()
{
  return sub_21775E1A8();
}

unint64_t sub_21774FB34()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21774D218(v0, v1);
}

uint64_t sub_21774FB44()
{
  return sub_21775E430();
}

void sub_21774FB54(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t sub_21774FB64()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_21774FB6C()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21774D218(v1, v0);
}

uint64_t sub_21774FB7C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21774FB84()
{
  uint64_t *v0;
  uint64_t v1;

  return sub_21774D3F4(v1 - 192, v0);
}

void sub_21774FB90(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + a1) |= v1;
}

uint64_t sub_21774FBA4()
{
  return swift_bridgeObjectRelease();
}

unint64_t sub_21774FBAC(uint64_t a1, uint64_t a2)
{
  return sub_21774D218(a1, a2);
}

uint64_t sub_21774FBB4()
{
  return sub_21775E4A8();
}

uint64_t sub_21774FBE4(uint64_t a1, unint64_t *a2)
{
  return sub_217746728(0, a2);
}

__n128 sub_21774FBF8(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__n128 a25)
{
  __n128 result;

  result = a25;
  a1[1] = a25;
  return result;
}

uint64_t sub_21774FC0C()
{
  return swift_bridgeObjectRetain();
}

uint64_t initializeBufferWithCopyOfBuffer for Feature(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Feature()
{
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for Feature(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Feature(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = v4;
  return a1;
}

__n128 initializeWithTake for Feature(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for Feature(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 24) = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for Feature(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Feature(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

uint64_t sub_21774FE10(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_21774FE3C + 4 * asc_21775ED00[a1]))("ContextualUnderstanding", 23);
}

const char *sub_21774FE3C()
{
  return "HumanUnderstandingEvidence";
}

BOOL sub_21774FE70(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_21774FE80()
{
  return sub_21775E4B4();
}

uint64_t sub_21774FEA4()
{
  sub_21775E4A8();
  sub_21775E4B4();
  return sub_21775E4C0();
}

uint64_t sub_21774FEE8()
{
  return sub_21774FEA4();
}

uint64_t sub_21774FEF0()
{
  sub_21775E4A8();
  sub_21775E4B4();
  return sub_21775E4C0();
}

const char *sub_21774FF30()
{
  return "HumanUnderstanding";
}

uint64_t sub_21774FF44()
{
  unsigned __int8 *v0;

  return sub_21774FE10(*v0);
}

uint64_t static HUFeatureFlags.isContextualUnderstandingEnabled()()
{
  return sub_217750004(0);
}

unint64_t sub_21774FF68()
{
  unint64_t result;

  result = qword_253F2C8B0;
  if (!qword_253F2C8B0)
  {
    result = MEMORY[0x219A11AF0](&unk_21775EDB4, &type metadata for HUFeatureFlags.FeaturesKey);
    atomic_store(result, (unint64_t *)&qword_253F2C8B0);
  }
  return result;
}

uint64_t static HUFeatureFlags.isHumanUnderstandingEvidenceEnabled()()
{
  return sub_217750004(1);
}

uint64_t static HUFeatureFlags.isHumanUnderstandingDataCollectionEnabled()()
{
  return sub_217750004(3);
}

uint64_t static HUFeatureFlags.isContextualUnderstandingNotificationsEnabled()()
{
  return sub_217750004(2);
}

uint64_t sub_217750004(char a1)
{
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v5 = &type metadata for HUFeatureFlags.FeaturesKey;
  v6 = sub_21774FF68();
  v4[0] = a1;
  v2 = sub_21775E0E8();
  sub_21774F964((uint64_t)v4);
  return v2 & 1;
}

id HUFeatureFlags.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HUFeatureFlags.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HUFeatureFlags.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HUFeatureFlags()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for HUFeatureFlags.FeaturesKey(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HUFeatureFlags.FeaturesKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21775020C + 4 * byte_21775ED09[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_217750240 + 4 * byte_21775ED04[v4]))();
}

uint64_t sub_217750240(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_217750248(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x217750250);
  return result;
}

uint64_t sub_21775025C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x217750264);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_217750268(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_217750270(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HUFeatureFlags.FeaturesKey()
{
  return &type metadata for HUFeatureFlags.FeaturesKey;
}

unint64_t sub_217750290()
{
  unint64_t result;

  result = qword_254F00468;
  if (!qword_254F00468)
  {
    result = MEMORY[0x219A11AF0](&unk_21775ED8C, &type metadata for HUFeatureFlags.FeaturesKey);
    atomic_store(result, (unint64_t *)&qword_254F00468);
  }
  return result;
}

uint64_t sub_2177502CC()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for FeatureManager();
  v0 = swift_allocObject();
  result = FeatureManager.init()();
  qword_254F00470 = v0;
  return result;
}

uint64_t FeatureManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  FeatureManager.init()();
  return v0;
}

uint64_t static FeatureManager.defaultManager.getter()
{
  if (qword_254F00240 != -1)
    swift_once();
  return swift_retain();
}

uint64_t FeatureManager.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = v0;
  v2 = sub_21775E0A0();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  static Paths.featureManagerBaseDirectory()();
  type metadata accessor for FeatureRegistry();
  swift_allocObject();
  *(_QWORD *)(v1 + 112) = FeatureRegistry.init(with:)((uint64_t)v4);
  return v1;
}

id sub_217750408(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  id result;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;

  sub_217746620(&qword_254F00428);
  v2 = (_QWORD *)sub_21775E1A8();
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = (uint64_t *)(a1 + 40);
    while (1)
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      swift_bridgeObjectRetain();
      swift_retain();
      FeatureRegistry.feature(for:)(v6, v5, (uint64_t)&v25);
      swift_release();
      v7 = v26;
      if (v26)
      {
        v8 = v27;
        v9 = (uint64_t)v25;
        v10 = (void *)sub_21775E1B4();
        v24 = objc_msgSend(v8, sel_featureValueForName_, v10);

        sub_2177507E8(v9, v7);
      }
      else
      {
        v24 = 0;
      }
      swift_isUniquelyReferenced_nonNull_native();
      v25 = v2;
      v11 = sub_21774D218(v6, v5);
      if (__OFADD__(v2[2], (v12 & 1) == 0))
        break;
      v13 = v11;
      v14 = v12;
      sub_217746620(&qword_254F00478);
      if ((sub_21775E3D0() & 1) != 0)
      {
        v15 = sub_21774D218(v6, v5);
        if ((v14 & 1) != (v16 & 1))
          goto LABEL_19;
        v13 = v15;
      }
      v2 = v25;
      if ((v14 & 1) != 0)
      {
        v17 = v25[7];

        *(_QWORD *)(v17 + 8 * v13) = v24;
      }
      else
      {
        v25[(v13 >> 6) + 8] |= 1 << v13;
        v18 = (uint64_t *)(v2[6] + 16 * v13);
        *v18 = v6;
        v18[1] = v5;
        *(_QWORD *)(v2[7] + 8 * v13) = v24;
        v19 = v2[2];
        v20 = __OFADD__(v19, 1);
        v21 = v19 + 1;
        if (v20)
          goto LABEL_18;
        v2[2] = v21;
        swift_bridgeObjectRetain();
      }
      v4 += 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    result = (id)sub_21775E484();
    __break(1u);
  }
  else
  {
LABEL_16:
    sub_21774BF20((uint64_t)v2);
    swift_bridgeObjectRelease();
    v22 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
    return sub_217750704();
  }
  return result;
}

uint64_t FeatureManager.deinit()
{
  uint64_t v0;

  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t FeatureManager.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t FeatureManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2177506EC()
{
  return FeatureManager.unownedExecutor.getter();
}

id sub_217750704()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_21775E190();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_21775E040();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_2177507E8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for FeatureManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for FeatureManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeatureManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of FeatureManager.featureValues(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

Swift::Void __swiftcall FeatureRegistry.printRegistry()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __n128 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __n128 *v20;
  uint64_t v21;
  uint64_t v22;
  __n128 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  __n128 *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  __n128 *v54;
  uint64_t v55;
  __n128 *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  __int128 v68;
  uint64_t v69[3];
  uint64_t ObjectType;
  unint64_t v71;

  v1 = sub_21775E0A0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)sub_217746620(&qword_254F00548);
  v6 = sub_21775500C();
  v68 = xmmword_21775ECA0;
  *(_OWORD *)(v6 + 16) = xmmword_21775ECA0;
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 32) = 0;
  *(_QWORD *)(v6 + 40) = 0xE000000000000000;
  sub_217754FF8();
  sub_217755124();
  v8 = (__n128 *)sub_21775500C();
  sub_217755018(v8);
  sub_2177550F8();
  *(_QWORD *)(v9 + 32) = 0xD000000000000028;
  *(_QWORD *)(v9 + 40) = v10;
  sub_217754FF8();
  sub_217755124();
  v62 = v0;
  sub_217755098();
  sub_21774DBC0();
  v12 = v11;
  sub_2177466E8();
  v69[0] = v12;
  v13 = 0;
  sub_217751BBC(v69, (uint64_t (*)(uint64_t))sub_217754FD0, (uint64_t (*)(_QWORD *))sub_217753080);
  v59 = v4;
  v65 = v2;
  v66 = v1;
  sub_2177466E8();
  v14 = *(_QWORD *)(v69[0] + 16);
  if (v14)
  {
    v63 = v69[0];
    v64 = 0;
    v15 = (unint64_t *)(v69[0] + 56);
    v67 = 0xD000000000000012;
    do
    {
      v16 = *v15;
      v17 = sub_21775500C();
      *(_OWORD *)(v17 + 16) = v68;
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      sub_217751B10(30);
      sub_2177550C4();
      strcpy((char *)v69, "Signal: ");
      BYTE1(v69[1]) = 0;
      WORD1(v69[1]) = 0;
      HIDWORD(v69[1]) = -402653184;
      ObjectType = swift_getObjectType();
      v71 = v16;
      sub_217746620(&qword_254F00550);
      sub_21775E1F0();
      sub_21775E220();
      swift_bridgeObjectRelease();
      sub_21775E220();
      sub_21775E220();
      sub_217755124();
      v18 = v69[0];
      v19 = v69[1];
      *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v17 + 32) = v18;
      *(_QWORD *)(v17 + 40) = v19;
      sub_217754FF8();
      swift_unknownObjectRelease();
      sub_21774FB7C();
      v15 += 4;
      --v14;
    }
    while (v14);
    swift_release();
    v7 = MEMORY[0x24BEE0D00];
    v13 = v64;
  }
  else
  {
    swift_release();
  }
  v20 = (__n128 *)sub_21775500C();
  sub_217755018(v20);
  v61 = (uint64_t)" provides output: ";
  *(_QWORD *)(v21 + 32) = 0xD000000000000028;
  *(_QWORD *)(v21 + 40) = 0x8000000217760110;
  sub_217754FF8();
  sub_2177466E8();
  v22 = sub_21775500C();
  *(_OWORD *)(v22 + 16) = v68;
  *(_QWORD *)(v22 + 56) = v7;
  *(_QWORD *)(v22 + 32) = 0;
  *(_QWORD *)(v22 + 40) = 0xE000000000000000;
  sub_217754FF8();
  sub_2177466E8();
  v23 = (__n128 *)sub_21775500C();
  sub_217755018(v23);
  sub_2177550F8();
  *(_QWORD *)(v24 + 32) = 0xD000000000000028;
  *(_QWORD *)(v24 + 40) = v25;
  sub_217754FF8();
  sub_2177466E8();
  sub_217755098();
  sub_21774DB50();
  v27 = v26;
  sub_2177466E8();
  v69[0] = v27;
  sub_217751BBC(v69, (uint64_t (*)(uint64_t))sub_217754FBC, (uint64_t (*)(_QWORD *))sub_2177529BC);
  v58 = v13;
  if (v13)
    goto LABEL_15;
  sub_2177466E8();
  v60 = v69[0];
  v28 = *(_QWORD *)(v69[0] + 16);
  v67 = (unint64_t)v5;
  v29 = v59;
  if (v28)
  {
    v30 = (uint64_t *)(v60 + 48);
    sub_2177550F8();
    v63 = v31;
    v64 = v32;
    do
    {
      v33 = *v30;
      v30 += 3;
      v34 = sub_21775500C();
      *(_OWORD *)(v34 + 16) = v68;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_217751B10(35);
      sub_2177550C4();
      strcpy((char *)v69, "Transformer: ");
      HIWORD(v69[1]) = -4864;
      v35 = objc_msgSend(objc_msgSend(*(id *)(v33 + 16), sel_modelDescription), sel_modelURL);
      sub_217755164();
      sub_21775E088();

      sub_21775E058();
      (*(void (**)(char *, unint64_t))(v65 + 8))(v29, v66);
      v5 = (void *)v67;
      sub_21775E220();
      sub_21774FBA4();
      sub_21775E220();
      sub_21775E220();
      v7 = MEMORY[0x24BEE0D00];
      swift_bridgeObjectRelease();
      v36 = v69[0];
      v37 = v69[1];
      *(_QWORD *)(v34 + 56) = v7;
      *(_QWORD *)(v34 + 32) = v36;
      *(_QWORD *)(v34 + 40) = v37;
      sub_217754FF8();
      swift_release();
      sub_2177550DC();
      --v28;
    }
    while (v28);
  }
  swift_release();
  v38 = (__n128 *)sub_21775500C();
  sub_217755018(v38);
  v39 = v61 | 0x8000000000000000;
  *(_QWORD *)(v40 + 32) = 0xD000000000000028;
  *(_QWORD *)(v40 + 40) = v39;
  sub_217754FF8();
  sub_21774FBA4();
  v41 = sub_21775500C();
  *(_OWORD *)(v41 + 16) = v68;
  *(_QWORD *)(v41 + 56) = v7;
  *(_QWORD *)(v41 + 32) = 0;
  *(_QWORD *)(v41 + 40) = 0xE000000000000000;
  sub_217754FF8();
  sub_21774FBA4();
  v42 = (__n128 *)sub_21775500C();
  sub_217755018(v42);
  sub_2177550F8();
  *(_QWORD *)(v43 + 32) = 0xD000000000000028;
  *(_QWORD *)(v43 + 40) = v44;
  sub_217754FF8();
  sub_21774FBA4();
  sub_217755178();
  sub_217755098();
  sub_21774DAE0();
  v46 = v45;
  sub_2177466E8();
  ObjectType = v46;
  v47 = v58;
  sub_217751BBC(&ObjectType, (uint64_t (*)(uint64_t))sub_217754FA8, (uint64_t (*)(_QWORD *))sub_2177522D0);
  if (v47)
  {
LABEL_15:
    swift_release();
    __break(1u);
  }
  else
  {
    sub_2177466E8();
    v65 = ObjectType;
    v48 = *(_QWORD *)(ObjectType + 16);
    v49 = MEMORY[0x24BEE0D00];
    if (v48)
    {
      v50 = v65 + 64;
      v66 = 0xD000000000000013;
      do
      {
        v50 += 48;
        v51 = sub_21775500C();
        *(_OWORD *)(v51 + 16) = v68;
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        sub_217751B10(21);
        sub_2177550C4();
        ObjectType = v66;
        v71 = 0x80000002177601A0;
        swift_bridgeObjectRetain();
        sub_21775E220();
        sub_2177550DC();
        v52 = ObjectType;
        v53 = v71;
        *(_QWORD *)(v51 + 56) = v49;
        *(_QWORD *)(v51 + 32) = v52;
        *(_QWORD *)(v51 + 40) = v53;
        sub_217754FF8();
        sub_21775511C();
        sub_2177550DC();
        swift_bridgeObjectRelease();
        --v48;
      }
      while (v48);
    }
    swift_release();
    v54 = (__n128 *)sub_21775500C();
    sub_21775518C(v54);
    sub_2177550E4(v55, v61);
    sub_217754FF8();
    sub_21774FBA4();
    v56 = (__n128 *)sub_21775500C();
    sub_21775518C(v56);
    *(_QWORD *)(v57 + 32) = 0;
    *(_QWORD *)(v57 + 40) = 0xE000000000000000;
    sub_217754FF8();
    sub_21774FBA4();
    sub_217755048();
  }
}

uint64_t sub_217750EE0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = swift_bridgeObjectRetain();
  v5 = a2(v4);
  swift_bridgeObjectRelease();
  v8 = v5;
  sub_217751B54(&v8);
  v6 = v8;
  if (v2)
    swift_release();
  return v6;
}

Swift::Void __swiftcall FeatureRegistry.printFeature(for:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  __n128 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __n128 *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __n128 *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  int64_t v61;
  int64_t v62;
  unint64_t v63;
  unint64_t v64;
  int64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __n128 *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD v106[2];
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  __int128 v113;
  uint64_t ObjectType;
  uint64_t v115;
  uint64_t v116[3];
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v4 = sub_21775E0A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217755178();
  v8 = *(_QWORD *)(v1 + 32);
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_29;
  swift_bridgeObjectRetain();
  v9 = sub_21774D218(countAndFlagsBits, (uint64_t)object);
  if ((v10 & 1) == 0)
  {
    sub_21775510C();
LABEL_29:
    swift_endAccess();
    sub_217746620(&qword_254F00548);
    v80 = sub_21775500C();
    *(_OWORD *)(v80 + 16) = xmmword_21775ECA0;
    *(_QWORD *)(v80 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v80 + 32) = 0xD00000000000004DLL;
    *(_QWORD *)(v80 + 40) = 0x80000002177601C0;
    sub_217754FF8();
LABEL_40:
    swift_bridgeObjectRelease();
    sub_217755048();
    return;
  }
  v112 = v5;
  v11 = *(_QWORD *)(v8 + 56) + 32 * v9;
  v12 = *(_QWORD *)(v11 + 8);
  v13 = *(_QWORD *)(v11 + 16);
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_21775510C();
  v14 = sub_217746620(&qword_254F00548);
  v15 = sub_21775500C();
  v113 = xmmword_21775ECA0;
  *(_OWORD *)(v15 + 16) = xmmword_21775ECA0;
  v16 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v15 + 32) = 0;
  *(_QWORD *)(v15 + 40) = 0xE000000000000000;
  sub_217754FF8();
  sub_2177466E8();
  v17 = (__n128 *)sub_21775500C();
  sub_217755028(v17);
  sub_217755038(v18, (uint64_t)"Feature --------------------------------");
  sub_217754FF8();
  sub_2177466E8();
  v19 = (_QWORD *)sub_21775500C();
  sub_217746674((uint64_t)v19);
  v118 = 0x203A656D614ELL;
  v119 = 0xE600000000000000;
  swift_bridgeObjectRetain();
  sub_21775E220();
  v109 = v12;
  sub_21774FBA4();
  v20 = sub_2177550A4();
  v19[7] = v16;
  v19[4] = v20;
  v19[5] = v21;
  nullsub_1(v19);
  sub_217754FF8();
  sub_2177466E8();
  v22 = (__n128 *)sub_21775500C();
  sub_217755028(v22);
  v108 = " provides output: ";
  *(_QWORD *)(v23 + 32) = 0xD000000000000028;
  *(_QWORD *)(v23 + 40) = 0x8000000217760110;
  nullsub_1(v23);
  sub_217754FF8();
  sub_2177466E8();
  v24 = sub_21775500C();
  sub_217755078(v24);
  sub_217754FF8();
  sub_2177466E8();
  v117 = MEMORY[0x24BEE4AF8];
  type metadata accessor for Transformer();
  v25 = swift_dynamicCastClass();
  v110 = v13;
  v111 = v14;
  if (!v25)
  {
    swift_getObjectType();
    v81 = sub_217751C30(v13);
    if (v81)
    {
      v83 = v81;
      v84 = v82;
      sub_2177551A0();
      swift_bridgeObjectRelease();
      sub_217746620(&qword_254F00558);
      v85 = swift_allocObject();
      *(_OWORD *)(v85 + 16) = v113;
      *(_QWORD *)(v85 + 32) = v83;
      *(_QWORD *)(v85 + 40) = v84;
      v37 = 0;
      v117 = nullsub_1(v85);
    }
    else
    {
      v37 = 0;
    }
    goto LABEL_35;
  }
  v26 = v25;
  v27 = (__n128 *)sub_21775500C();
  sub_217755028(v27);
  sub_217755038(v28, (uint64_t)"Depends on Transformer -----------------");
  sub_2177551A0();
  sub_217754FF8();
  sub_2177466E8();
  v29 = sub_21775500C();
  *(_OWORD *)(v29 + 16) = v113;
  sub_217751B10(20);
  sub_2177550C4();
  v118 = 0xD000000000000012;
  v119 = 0x80000002177602A0;
  v30 = objc_msgSend(objc_msgSend(*(id *)(v26 + 16), sel_modelDescription), sel_modelURL);
  sub_217755164();
  sub_21775E088();

  sub_21775E058();
  (*(void (**)(char *, uint64_t))(v112 + 8))(v7, v4);
  sub_21775E220();
  swift_bridgeObjectRelease();
  v31 = sub_2177550A4();
  *(_QWORD *)(v29 + 56) = v16;
  *(_QWORD *)(v29 + 32) = v31;
  *(_QWORD *)(v29 + 40) = v32;
  nullsub_1(v29);
  sub_217754FF8();
  sub_2177466E8();
  v33 = (_QWORD *)sub_21775500C();
  sub_217746674((uint64_t)v33);
  v118 = 0x203A737475706E49;
  v119 = 0xE800000000000000;
  v34 = objc_msgSend(*(id *)(v26 + 16), (SEL)&stru_24D803AC0.size + 2);
  v35 = objc_msgSend(v34, sel_inputDescriptionsByName);

  sub_217751C64();
  v36 = sub_21775E19C();

  v37 = 0;
  v38 = sub_217750EE0(v36, (uint64_t (*)(uint64_t))sub_21774DC34);
  sub_2177466E8();
  MEMORY[0x219A1149C](v38, v16);
  v40 = v39;
  sub_21775E220();
  swift_bridgeObjectRelease();
  sub_21775510C();
  v41 = sub_2177550A4();
  v33[7] = v16;
  v33[4] = v41;
  v33[5] = v42;
  nullsub_1(v33);
  sub_217754FF8();
  sub_2177466E8();
  v43 = (_QWORD *)sub_21775500C();
  sub_217746674((uint64_t)v43);
  sub_21775512C();
  v118 = v44;
  v119 = 0xE900000000000020;
  v45 = objc_msgSend(objc_msgSend(*(id *)(v26 + 16), sel_modelDescription), sel_outputDescriptionsByName);
  sub_217755164();
  v46 = sub_21775E19C();

  v47 = sub_217750EE0(v46, (uint64_t (*)(uint64_t))sub_21774DC34);
  sub_2177466E8();
  MEMORY[0x219A1149C](v47, v16);
  sub_21775E220();
  sub_2177550DC();
  swift_bridgeObjectRelease();
  v48 = sub_2177550A4();
  v43[7] = v16;
  v43[4] = v48;
  v43[5] = v49;
  nullsub_1(v43);
  sub_217754FF8();
  sub_2177466E8();
  v50 = (__n128 *)sub_21775500C();
  sub_217755028(v50);
  *(_QWORD *)(v51 + 32) = 0xD000000000000028;
  *(_QWORD *)(v51 + 40) = 0x8000000217760110;
  nullsub_1(v51);
  sub_217754FF8();
  sub_2177466E8();
  v52 = sub_21775500C();
  sub_217755078(v52);
  sub_217754FF8();
  sub_2177466E8();
  v53 = *(_QWORD *)(v26 + 24);
  type metadata accessor for MultiFeatureProvider();
  v54 = swift_dynamicCastClass();
  if (!v54)
  {
    sub_217755104();
LABEL_35:
    v86 = (__n128 *)sub_21775500C();
    sub_217755028(v86);
    sub_217755038(v87, (uint64_t)"Depends on Signals ---------------------");
    sub_217754FF8();
    sub_2177466E8();
    v88 = v117;
    v116[0] = v117;
    swift_bridgeObjectRetain_n();
    sub_217751BBC(v116, (uint64_t (*)(uint64_t))sub_217754FE4, (uint64_t (*)(_QWORD *))sub_217753718);
    if (v37)
      goto LABEL_43;
    v107 = v88;
    sub_21774FBA4();
    v112 = v116[0];
    v89 = *(_QWORD *)(v116[0] + 16);
    v90 = MEMORY[0x24BEE0D00];
    if (v89)
    {
      v91 = (uint64_t *)(v112 + 40);
      do
      {
        v93 = (void *)*(v91 - 1);
        v92 = *v91;
        *(_OWORD *)(sub_21775500C() + 16) = v113;
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        strcpy((char *)v116, "Signal Name: ");
        HIWORD(v116[1]) = -4864;
        ObjectType = swift_getObjectType();
        v115 = v92;
        sub_217746620(&qword_254F00550);
        sub_21775E1F0();
        sub_217755158();
        sub_21774FB7C();
        v94 = sub_21775E208();
        sub_2177550CC(v94, v95);
        sub_217754FF8();
        sub_2177466E8();
        v96 = sub_21775500C();
        sub_217746674(v96);
        sub_21775512C();
        v116[0] = v97;
        v116[1] = 0xE900000000000020;
        v98 = objc_msgSend(v93, sel_featureNames);
        v99 = sub_21775E298();

        v100 = sub_217750EE0(v99, (uint64_t (*)(uint64_t))sub_21774DA6C);
        sub_21774FB7C();
        MEMORY[0x219A1149C](v100, v90);
        sub_217755158();
        sub_21774FBA4();
        sub_21774FB7C();
        v101 = sub_21775E208();
        sub_2177550CC(v101, v102);
        sub_217754FF8();
        sub_21775511C();
        sub_21774FBA4();
        v91 += 2;
        --v89;
      }
      while (v89);
    }
    swift_bridgeObjectRelease();
    swift_release();
    v103 = sub_21775500C();
    *(_OWORD *)(v103 + 16) = v113;
    *(_QWORD *)(v103 + 56) = v90;
    v104 = sub_2177550E4(v103, (uint64_t)v108);
    nullsub_1(v104);
    sub_217754FF8();
    sub_21774FBA4();
    v105 = sub_21775500C();
    *(_OWORD *)(v105 + 16) = v113;
    *(_QWORD *)(v105 + 56) = v90;
    *(_QWORD *)(v105 + 32) = 0;
    *(_QWORD *)(v105 + 40) = 0xE000000000000000;
    nullsub_1(v105);
    sub_217754FF8();
    sub_21774FBA4();
    sub_217755104();
    goto LABEL_40;
  }
  v55 = v54;
  v107 = 0;
  sub_217755178();
  v56 = *(_QWORD *)(v55 + 16);
  v57 = *(_QWORD *)(v56 + 64);
  v112 = v56 + 64;
  v58 = 1 << *(_BYTE *)(v56 + 32);
  v59 = -1;
  if (v58 < 64)
    v59 = ~(-1 << v58);
  v60 = v59 & v57;
  v61 = (unint64_t)(v58 + 63) >> 6;
  v106[1] = v53;
  sub_2177551A0();
  swift_bridgeObjectRetain();
  v62 = 0;
  while (v60)
  {
    v63 = __clz(__rbit64(v60));
    v60 &= v60 - 1;
    v64 = v63 | (v62 << 6);
LABEL_26:
    v72 = *(_QWORD *)(*(_QWORD *)(v56 + 56) + 8 * v64);
    swift_getObjectType();
    v73 = sub_217751C30(v72);
    if (v73)
    {
      v75 = v73;
      v76 = v74;
      swift_unknownObjectRetain_n();
      sub_217751A70((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_217756F48);
      v77 = *(_QWORD *)(v117 + 16);
      sub_217751AD0(v77, (uint64_t (*)(BOOL))sub_217756F48);
      v78 = v117;
      *(_QWORD *)(v117 + 16) = v77 + 1;
      v79 = v78 + 16 * v77;
      *(_QWORD *)(v79 + 32) = v75;
      *(_QWORD *)(v79 + 40) = v76;
      sub_21775511C();
    }
  }
  v65 = v62 + 1;
  if (__OFADD__(v62, 1))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v65 >= v61)
    goto LABEL_30;
  v66 = *(_QWORD *)(v112 + 8 * v65);
  ++v62;
  if (v66)
    goto LABEL_25;
  v62 = v65 + 1;
  if (v65 + 1 >= v61)
    goto LABEL_30;
  sub_21775516C();
  if (v66)
    goto LABEL_25;
  v62 = v67 + 2;
  if (v67 + 2 >= v61)
    goto LABEL_30;
  sub_21775516C();
  if (v66)
    goto LABEL_25;
  v62 = v68 + 3;
  if (v68 + 3 >= v61)
    goto LABEL_30;
  sub_21775516C();
  if (v66)
  {
LABEL_25:
    v60 = (v66 - 1) & v66;
    v64 = __clz(__rbit64(v66)) + (v62 << 6);
    goto LABEL_26;
  }
  v70 = v69 + 4;
  if (v70 >= v61)
  {
LABEL_30:
    swift_unknownObjectRelease();
    swift_release();
    sub_217755104();
    v37 = v107;
    goto LABEL_35;
  }
  v66 = *(_QWORD *)(v112 + 8 * v70);
  if (v66)
  {
    v62 = v70;
    goto LABEL_25;
  }
  while (1)
  {
    v62 = v70 + 1;
    if (__OFADD__(v70, 1))
      break;
    if (v62 >= v61)
      goto LABEL_30;
    sub_21775516C();
    v70 = v71 + 1;
    if (v66)
      goto LABEL_25;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  swift_release();
  __break(1u);
}

void sub_217751988(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_2177550AC();
    sub_217755060();
    __break(1u);
  }
  else
  {
    if (a1)
      *(_QWORD *)(sub_21775E268() + 16) = a1;
    sub_21775514C();
  }
}

void sub_2177519F4(uint64_t a1, uint64_t *a2)
{
  if (a1 < 0)
  {
    sub_2177550AC();
    sub_217755060();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      sub_217746620(a2);
      *(_QWORD *)(sub_21775E268() + 16) = a1;
    }
    sub_21775514C();
  }
}

uint64_t sub_217751A64()
{
  return sub_217751A70((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_217756CD4);
}

uint64_t sub_217751A70(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if (!(_DWORD)result)
  {
    result = a1(result, *(_QWORD *)(v3 + 16) + 1, 1, v3);
    *v1 = result;
  }
  return result;
}

uint64_t sub_217751AC4(uint64_t a1)
{
  return sub_217751AD0(a1, (uint64_t (*)(BOOL))sub_217756CD4);
}

uint64_t sub_217751AD0(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

uint64_t sub_217751B10(uint64_t a1)
{
  if (a1 < 16)
    return 0;
  sub_21775E358();
  return 0;
}

void sub_217751B54(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_217754F94();
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_217751CA0(v5);
  *a1 = v2;
}

uint64_t sub_217751BBC(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((sub_217755114() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_217751C30(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

unint64_t sub_217751C64()
{
  unint64_t result;

  result = qword_254F00560;
  if (!qword_254F00560)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254F00560);
  }
  return result;
}

void sub_217751CA0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  char v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  BOOL v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;

  v3 = a1[1];
  v4 = sub_21775E454();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_217753F84(0, v3, 1, a1);
      return;
    }
    goto LABEL_144;
  }
  v5 = v4;
  sub_217751988(v3 / 2);
  v115 = v6;
  v116 = v3;
  v117 = v7;
  v113 = a1;
  if (v3 <= 0)
  {
    v118 = MEMORY[0x24BEE4AF8];
    v33 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    if (v33 < 2)
    {
LABEL_121:
      v103 = swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        sub_217755140(v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, (uint64_t)v113, v114, v115);
        return;
      }
      goto LABEL_149;
    }
    v96 = *v113;
    while (1)
    {
      v97 = v33 - 2;
      if (v33 < 2)
        break;
      if (!v96)
        goto LABEL_153;
      v98 = (char *)v118;
      v99 = *(_QWORD *)(v118 + 32 + 16 * v97);
      v100 = *(_QWORD *)(v118 + 32 + 16 * (v33 - 1) + 8);
      sub_21775447C((char *)(v96 + 16 * v99), (char *)(v96 + 16 * *(_QWORD *)(v118 + 32 + 16 * (v33 - 1))), v96 + 16 * v100, v117);
      if (v1)
        goto LABEL_106;
      if (v100 < v99)
        goto LABEL_139;
      if ((sub_217755114() & 1) == 0)
        v98 = sub_217754F80(v118);
      if (v97 >= *((_QWORD *)v98 + 2))
        goto LABEL_140;
      v101 = &v98[16 * v97 + 32];
      *(_QWORD *)v101 = v99;
      *((_QWORD *)v101 + 1) = v100;
      v102 = *((_QWORD *)v98 + 2);
      if (v33 > v102)
        goto LABEL_141;
      memmove(&v98[16 * v33 + 16], &v98[16 * v33 + 32], 16 * (v102 - v33));
      v118 = (uint64_t)v98;
      *((_QWORD *)v98 + 2) = v102 - 1;
      v33 = v102 - 1;
      v3 = v116;
      if (v102 <= 2)
        goto LABEL_121;
    }
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
    return;
  }
  v114 = v5;
  v8 = 0;
  v9 = *a1;
  v112 = *a1 + 8;
  v118 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v10 = v8++;
    if (v8 >= v3)
      goto LABEL_32;
    v11 = (uint64_t *)(v9 + 16 * v8);
    v12 = *v11;
    v13 = v11[1];
    v14 = (_QWORD *)(v9 + 16 * v10);
    if (v12 == *v14 && v13 == v14[1])
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v3)
        goto LABEL_31;
      v16 = 0;
LABEL_13:
      v18 = (_QWORD *)(v112 + 16 * v17);
      do
      {
        v19 = (_QWORD *)(v9 + 16 * v8);
        if (*(v18 - 1) == *v19 && *v18 == v19[1])
        {
          if ((v16 & 1) != 0)
            goto LABEL_24;
        }
        else if (((v16 ^ sub_217755090()) & 1) != 0)
        {
          goto LABEL_23;
        }
        v18 += 2;
        v21 = v17 + 1;
        v8 = v17;
        v17 = v21;
      }
      while (v21 < v3);
      v17 = v21;
      goto LABEL_23;
    }
    v16 = sub_217755090();
    v17 = v10 + 2;
    if (v10 + 2 < v3)
      goto LABEL_13;
LABEL_23:
    v8 = v17;
    if ((v16 & 1) == 0)
      goto LABEL_32;
LABEL_24:
    if (v17 < v10)
      goto LABEL_148;
    if (v10 < v17)
    {
      v22 = 16 * v17;
      v23 = 16 * v10;
      v24 = v17;
      v25 = v10;
      do
      {
        if (v25 != --v24)
        {
          if (!v9)
            goto LABEL_152;
          v26 = v9 + v22;
          v27 = *(_QWORD *)(v9 + v23);
          v28 = *(_QWORD *)(v9 + v23 + 8);
          *(_OWORD *)(v9 + v23) = *(_OWORD *)(v9 + v22 - 16);
          *(_QWORD *)(v26 - 16) = v27;
          *(_QWORD *)(v26 - 8) = v28;
        }
        ++v25;
        v22 -= 16;
        v23 += 16;
      }
      while (v25 < v24);
    }
LABEL_31:
    v8 = v17;
LABEL_32:
    if (v8 >= v3)
      goto LABEL_41;
    if (__OFSUB__(v8, v10))
      goto LABEL_143;
    if (v8 - v10 >= v114)
      goto LABEL_41;
    if (__OFADD__(v10, v114))
      goto LABEL_146;
    if (v10 + v114 >= v3)
      v29 = v3;
    else
      v29 = v10 + v114;
    if (v29 < v10)
      goto LABEL_147;
    if (v8 == v29)
    {
LABEL_41:
      v30 = (char *)v118;
    }
    else
    {
      v81 = (_QWORD *)(v9 + 16 * v8);
      v30 = (char *)v118;
      do
      {
        v82 = (uint64_t *)(v9 + 16 * v8);
        v83 = *v82;
        v84 = v82[1];
        v85 = v10;
        v86 = v81;
        do
        {
          v87 = v83 == *(v86 - 2) && v84 == *(v86 - 1);
          if (v87 || (sub_217755090() & 1) == 0)
            break;
          if (!v9)
            goto LABEL_150;
          v83 = *v86;
          v84 = v86[1];
          *(_OWORD *)v86 = *((_OWORD *)v86 - 1);
          *(v86 - 1) = v84;
          *(v86 - 2) = v83;
          v86 -= 2;
          ++v85;
        }
        while (v8 != v85);
        ++v8;
        v81 += 2;
      }
      while (v8 != v29);
      v8 = v29;
    }
    if (v8 < v10)
      goto LABEL_142;
    if ((sub_217755114() & 1) == 0)
      v30 = sub_217755180(0, *((_QWORD *)v30 + 2) + 1);
    v32 = *((_QWORD *)v30 + 2);
    v31 = *((_QWORD *)v30 + 3);
    v33 = v32 + 1;
    if (v32 >= v31 >> 1)
      v30 = sub_217755180((char *)(v31 > 1), v32 + 1);
    *((_QWORD *)v30 + 2) = v33;
    v34 = v30 + 32;
    v35 = &v30[16 * v32 + 32];
    *(_QWORD *)v35 = v10;
    *((_QWORD *)v35 + 1) = v8;
    v118 = (uint64_t)v30;
    if (v32)
      break;
    v33 = 1;
LABEL_90:
    v3 = v116;
    if (v8 >= v116)
      goto LABEL_110;
  }
  while (1)
  {
    v36 = v33 - 1;
    if (v33 >= 4)
    {
      v41 = &v34[16 * v33];
      v42 = *((_QWORD *)v41 - 8);
      v43 = *((_QWORD *)v41 - 7);
      v47 = __OFSUB__(v43, v42);
      v44 = v43 - v42;
      if (v47)
        goto LABEL_127;
      v46 = *((_QWORD *)v41 - 6);
      v45 = *((_QWORD *)v41 - 5);
      v47 = __OFSUB__(v45, v46);
      v39 = v45 - v46;
      v40 = v47;
      if (v47)
        goto LABEL_128;
      v48 = v33 - 2;
      v49 = &v34[16 * v33 - 32];
      v51 = *(_QWORD *)v49;
      v50 = *((_QWORD *)v49 + 1);
      v47 = __OFSUB__(v50, v51);
      v52 = v50 - v51;
      if (v47)
        goto LABEL_129;
      v47 = __OFADD__(v39, v52);
      v53 = v39 + v52;
      if (v47)
        goto LABEL_131;
      if (v53 >= v44)
      {
        v71 = &v34[16 * v36];
        v73 = *(_QWORD *)v71;
        v72 = *((_QWORD *)v71 + 1);
        v47 = __OFSUB__(v72, v73);
        v74 = v72 - v73;
        if (v47)
          goto LABEL_137;
        v64 = v39 < v74;
        goto LABEL_79;
      }
    }
    else
    {
      if (v33 != 3)
      {
        v65 = *((_QWORD *)v30 + 4);
        v66 = *((_QWORD *)v30 + 5);
        v47 = __OFSUB__(v66, v65);
        v58 = v66 - v65;
        v59 = v47;
        goto LABEL_73;
      }
      v38 = *((_QWORD *)v30 + 4);
      v37 = *((_QWORD *)v30 + 5);
      v47 = __OFSUB__(v37, v38);
      v39 = v37 - v38;
      v40 = v47;
    }
    if ((v40 & 1) != 0)
      goto LABEL_130;
    v48 = v33 - 2;
    v54 = &v34[16 * v33 - 32];
    v56 = *(_QWORD *)v54;
    v55 = *((_QWORD *)v54 + 1);
    v57 = __OFSUB__(v55, v56);
    v58 = v55 - v56;
    v59 = v57;
    if (v57)
      goto LABEL_132;
    v60 = &v34[16 * v36];
    v62 = *(_QWORD *)v60;
    v61 = *((_QWORD *)v60 + 1);
    v47 = __OFSUB__(v61, v62);
    v63 = v61 - v62;
    if (v47)
      goto LABEL_134;
    if (__OFADD__(v58, v63))
      goto LABEL_136;
    if (v58 + v63 >= v39)
    {
      v64 = v39 < v63;
LABEL_79:
      if (v64)
        v36 = v48;
      goto LABEL_81;
    }
LABEL_73:
    if ((v59 & 1) != 0)
      goto LABEL_133;
    v67 = &v34[16 * v36];
    v69 = *(_QWORD *)v67;
    v68 = *((_QWORD *)v67 + 1);
    v47 = __OFSUB__(v68, v69);
    v70 = v68 - v69;
    if (v47)
      goto LABEL_135;
    if (v70 < v58)
      goto LABEL_90;
LABEL_81:
    v75 = v36 - 1;
    if (v36 - 1 >= v33)
    {
      __break(1u);
LABEL_124:
      __break(1u);
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
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v9)
      goto LABEL_151;
    v76 = &v34[16 * v75];
    v77 = *(_QWORD *)v76;
    v78 = &v34[16 * v36];
    v79 = *((_QWORD *)v78 + 1);
    sub_21775447C((char *)(v9 + 16 * *(_QWORD *)v76), (char *)(v9 + 16 * *(_QWORD *)v78), v9 + 16 * v79, v117);
    if (v1)
      break;
    if (v79 < v77)
      goto LABEL_124;
    if (v36 > *(_QWORD *)(v118 + 16))
      goto LABEL_125;
    *(_QWORD *)v76 = v77;
    *(_QWORD *)&v34[16 * v75 + 8] = v79;
    v80 = *(_QWORD *)(v118 + 16);
    if (v36 >= v80)
      goto LABEL_126;
    v30 = (char *)v118;
    v33 = v80 - 1;
    memmove(&v34[16 * v36], v78 + 16, 16 * (v80 - 1 - v36));
    *(_QWORD *)(v118 + 16) = v80 - 1;
    if (v80 <= 2)
      goto LABEL_90;
  }
LABEL_106:
  v88 = swift_bridgeObjectRelease();
  if (v116 < -1)
    goto LABEL_145;
  sub_217755140(v88, v89, v90, v91, v92, v93, v94, v95, v111, v112, (uint64_t)v113, v114, v115);
}

void sub_2177522D0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  BOOL v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  char v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;

  v3 = a1[1];
  v4 = sub_21775E454();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_217754044(0, v3, 1, a1);
      return;
    }
    goto LABEL_144;
  }
  v5 = v4;
  sub_2177519F4(v3 / 2, &qword_254F00578);
  v112 = v6;
  v113 = v3;
  v115 = v7;
  v110 = a1;
  if (v3 <= 0)
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v50 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    v100 = v10;
    if (v50 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v113 >= -1)
      {
        *(_QWORD *)(v112 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_149;
    }
    v101 = *v110;
    while (1)
    {
      v102 = v50 - 2;
      if (v50 < 2)
        break;
      if (!v101)
        goto LABEL_153;
      v103 = v100;
      v104 = *(_QWORD *)&v100[16 * v102 + 32];
      v105 = *(_QWORD *)&v100[16 * v50 + 24];
      sub_217754618((char *)(v101 + 48 * v104), (char *)(v101 + 48 * *(_QWORD *)&v100[16 * v50 + 16]), v101 + 48 * v105, v115);
      if (v1)
        goto LABEL_106;
      if (v105 < v104)
        goto LABEL_139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v103 = sub_217754F80((uint64_t)v103);
      if (v102 >= *((_QWORD *)v103 + 2))
        goto LABEL_140;
      v106 = &v103[16 * v102 + 32];
      *(_QWORD *)v106 = v104;
      *((_QWORD *)v106 + 1) = v105;
      v107 = *((_QWORD *)v103 + 2);
      if (v50 > v107)
        goto LABEL_141;
      memmove(&v103[16 * v50 + 16], &v103[16 * v50 + 32], 16 * (v107 - v50));
      v100 = v103;
      *((_QWORD *)v103 + 2) = v107 - 1;
      v50 = v107 - 1;
      if (v107 <= 2)
        goto LABEL_121;
    }
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
    return;
  }
  v111 = v5;
  v8 = 0;
  v9 = *a1;
  v108 = *a1 + 40;
  v109 = *a1 + 8;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v114 = *a1;
  while (1)
  {
    v11 = v8++;
    if (v8 >= v3)
      goto LABEL_32;
    v12 = (uint64_t *)(v9 + 48 * v8);
    v13 = *v12;
    v14 = v12[1];
    v15 = (_QWORD *)(v9 + 48 * v11);
    if (v13 == *v15 && v14 == v15[1])
    {
      v18 = v11 + 2;
      if (v11 + 2 >= v113)
        goto LABEL_31;
      v17 = 0;
    }
    else
    {
      v17 = sub_21775E46C();
      v18 = v11 + 2;
      if (v11 + 2 >= v113)
        goto LABEL_23;
    }
    v19 = (_QWORD *)(v109 + 48 * v18);
    do
    {
      v20 = (_QWORD *)(v9 + 48 * v8);
      if (*(v19 - 1) == *v20 && *v19 == v20[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_24;
      }
      else if (((v17 ^ sub_21775E46C()) & 1) != 0)
      {
        goto LABEL_23;
      }
      v19 += 6;
      v22 = v18 + 1;
      v8 = v18;
      v18 = v22;
    }
    while (v22 < v113);
    v18 = v22;
LABEL_23:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_24:
      if (v18 < v11)
        goto LABEL_148;
      if (v11 < v18)
      {
        v23 = 48 * v18;
        v24 = 48 * v11;
        v25 = v18;
        v26 = v11;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_152;
            v27 = (_OWORD *)(v9 + v24);
            v28 = *(_OWORD *)(v9 + v24);
            v29 = v9 + v23;
            v30 = *(_QWORD *)(v9 + v24 + 16);
            v31 = *(_QWORD *)(v9 + v24 + 40);
            v32 = *(_OWORD *)(v9 + v24 + 24);
            v34 = *(_OWORD *)(v9 + v23 - 32);
            v33 = *(_OWORD *)(v9 + v23 - 16);
            *v27 = *(_OWORD *)(v9 + v23 - 48);
            v27[1] = v34;
            v27[2] = v33;
            *(_OWORD *)(v29 - 48) = v28;
            *(_QWORD *)(v29 - 32) = v30;
            *(_OWORD *)(v29 - 24) = v32;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v26;
          v23 -= 48;
          v24 += 48;
        }
        while (v26 < v25);
      }
LABEL_31:
      v8 = v18;
    }
LABEL_32:
    if (v8 < v113)
    {
      if (__OFSUB__(v8, v11))
        goto LABEL_143;
      if (v8 - v11 < v111)
      {
        if (__OFADD__(v11, v111))
          goto LABEL_146;
        if (v11 + v111 >= v113)
          v35 = v113;
        else
          v35 = v11 + v111;
        if (v35 < v11)
          goto LABEL_147;
        if (v8 != v35)
        {
          v36 = v108 + 48 * v8;
          do
          {
            v37 = (uint64_t *)(v9 + 48 * v8);
            v38 = *v37;
            v39 = v37[1];
            v40 = v11;
            v41 = v36;
            do
            {
              v42 = (_OWORD *)(v41 - 88);
              v43 = v38 == *(_QWORD *)(v41 - 88) && v39 == *(_QWORD *)(v41 - 80);
              if (v43 || (sub_21775E46C() & 1) == 0)
                break;
              if (!v9)
                goto LABEL_150;
              v45 = *(_OWORD *)(v41 - 72);
              v44 = *(_OWORD *)(v41 - 56);
              *(_QWORD *)(v41 - 48) = *(_QWORD *)v41;
              v41 -= 48;
              v38 = *(_QWORD *)(v41 + 8);
              v39 = *(_QWORD *)(v41 + 16);
              v46 = *(_QWORD *)(v41 + 24);
              v47 = *(_OWORD *)(v41 + 32);
              v42[3] = *v42;
              v42[4] = v45;
              v42[5] = v44;
              *(_QWORD *)(v41 - 40) = v38;
              *(_QWORD *)(v41 - 32) = v39;
              *(_QWORD *)(v41 - 24) = v46;
              *(_OWORD *)(v41 - 16) = v47;
              ++v40;
            }
            while (v8 != v40);
            ++v8;
            v36 += 48;
          }
          while (v8 != v35);
          v8 = v35;
        }
      }
    }
    if (v8 < v11)
      goto LABEL_142;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_217754E90(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v49 = *((_QWORD *)v10 + 2);
    v48 = *((_QWORD *)v10 + 3);
    v50 = v49 + 1;
    if (v49 >= v48 >> 1)
      v10 = sub_217754E90((char *)(v48 > 1), v49 + 1, 1, v10);
    *((_QWORD *)v10 + 2) = v50;
    v51 = v10 + 32;
    v52 = &v10[16 * v49 + 32];
    *(_QWORD *)v52 = v11;
    *((_QWORD *)v52 + 1) = v8;
    if (v49)
      break;
    v50 = 1;
    v9 = v114;
LABEL_101:
    v3 = v113;
    if (v8 >= v113)
      goto LABEL_110;
  }
  v9 = v114;
  while (1)
  {
    v53 = v50 - 1;
    if (v50 >= 4)
    {
      v58 = &v51[16 * v50];
      v59 = *((_QWORD *)v58 - 8);
      v60 = *((_QWORD *)v58 - 7);
      v64 = __OFSUB__(v60, v59);
      v61 = v60 - v59;
      if (v64)
        goto LABEL_127;
      v63 = *((_QWORD *)v58 - 6);
      v62 = *((_QWORD *)v58 - 5);
      v64 = __OFSUB__(v62, v63);
      v56 = v62 - v63;
      v57 = v64;
      if (v64)
        goto LABEL_128;
      v65 = v50 - 2;
      v66 = &v51[16 * v50 - 32];
      v68 = *(_QWORD *)v66;
      v67 = *((_QWORD *)v66 + 1);
      v64 = __OFSUB__(v67, v68);
      v69 = v67 - v68;
      if (v64)
        goto LABEL_129;
      v64 = __OFADD__(v56, v69);
      v70 = v56 + v69;
      if (v64)
        goto LABEL_131;
      if (v70 >= v61)
      {
        v88 = &v51[16 * v53];
        v90 = *(_QWORD *)v88;
        v89 = *((_QWORD *)v88 + 1);
        v64 = __OFSUB__(v89, v90);
        v91 = v89 - v90;
        if (v64)
          goto LABEL_137;
        v81 = v56 < v91;
        goto LABEL_90;
      }
    }
    else
    {
      if (v50 != 3)
      {
        v82 = *((_QWORD *)v10 + 4);
        v83 = *((_QWORD *)v10 + 5);
        v64 = __OFSUB__(v83, v82);
        v75 = v83 - v82;
        v76 = v64;
        goto LABEL_84;
      }
      v55 = *((_QWORD *)v10 + 4);
      v54 = *((_QWORD *)v10 + 5);
      v64 = __OFSUB__(v54, v55);
      v56 = v54 - v55;
      v57 = v64;
    }
    if ((v57 & 1) != 0)
      goto LABEL_130;
    v65 = v50 - 2;
    v71 = &v51[16 * v50 - 32];
    v73 = *(_QWORD *)v71;
    v72 = *((_QWORD *)v71 + 1);
    v74 = __OFSUB__(v72, v73);
    v75 = v72 - v73;
    v76 = v74;
    if (v74)
      goto LABEL_132;
    v77 = &v51[16 * v53];
    v79 = *(_QWORD *)v77;
    v78 = *((_QWORD *)v77 + 1);
    v64 = __OFSUB__(v78, v79);
    v80 = v78 - v79;
    if (v64)
      goto LABEL_134;
    if (__OFADD__(v75, v80))
      goto LABEL_136;
    if (v75 + v80 >= v56)
    {
      v81 = v56 < v80;
LABEL_90:
      if (v81)
        v53 = v65;
      goto LABEL_92;
    }
LABEL_84:
    if ((v76 & 1) != 0)
      goto LABEL_133;
    v84 = &v51[16 * v53];
    v86 = *(_QWORD *)v84;
    v85 = *((_QWORD *)v84 + 1);
    v64 = __OFSUB__(v85, v86);
    v87 = v85 - v86;
    if (v64)
      goto LABEL_135;
    if (v87 < v75)
      goto LABEL_101;
LABEL_92:
    v92 = v53 - 1;
    if (v53 - 1 >= v50)
    {
      __break(1u);
LABEL_124:
      __break(1u);
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
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v9)
      goto LABEL_151;
    v93 = v10;
    v94 = v9;
    v95 = &v51[16 * v92];
    v96 = *(_QWORD *)v95;
    v97 = &v51[16 * v53];
    v98 = *((_QWORD *)v97 + 1);
    sub_217754618((char *)(v94 + 48 * *(_QWORD *)v95), (char *)(v94 + 48 * *(_QWORD *)v97), v94 + 48 * v98, v115);
    if (v1)
      break;
    if (v98 < v96)
      goto LABEL_124;
    if (v53 > *((_QWORD *)v93 + 2))
      goto LABEL_125;
    *(_QWORD *)v95 = v96;
    *(_QWORD *)&v51[16 * v92 + 8] = v98;
    v99 = *((_QWORD *)v93 + 2);
    if (v53 >= v99)
      goto LABEL_126;
    v10 = v93;
    v50 = v99 - 1;
    memmove(&v51[16 * v53], v97 + 16, 16 * (v99 - 1 - v53));
    *((_QWORD *)v93 + 2) = v99 - 1;
    v81 = v99 > 2;
    v9 = v114;
    if (!v81)
      goto LABEL_101;
  }
LABEL_106:
  swift_bridgeObjectRelease();
  if (v113 < -1)
    goto LABEL_145;
  *(_QWORD *)(v112 + 16) = 0;
  swift_bridgeObjectRelease();
}

void sub_2177529BC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  __int128 v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v69;
  char v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;

  v3 = a1[1];
  v4 = sub_21775E454();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_217754130(0, v3, 1, a1);
      return;
    }
    goto LABEL_144;
  }
  v5 = v4;
  sub_2177519F4(v3 / 2, &qword_254F00580);
  v105 = v6;
  v106 = v3;
  v108 = v7;
  v103 = a1;
  if (v3 <= 0)
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v44 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    v93 = v10;
    if (v44 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v106 >= -1)
      {
        *(_QWORD *)(v105 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_149;
    }
    v94 = *v103;
    while (1)
    {
      v95 = v44 - 2;
      if (v44 < 2)
        break;
      if (!v94)
        goto LABEL_153;
      v96 = v93;
      v97 = *(_QWORD *)&v93[16 * v95 + 32];
      v98 = *(_QWORD *)&v93[16 * v44 + 24];
      sub_2177547DC((char *)(v94 + 24 * v97), (char *)(v94 + 24 * *(_QWORD *)&v93[16 * v44 + 16]), v94 + 24 * v98, v108);
      if (v1)
        goto LABEL_106;
      if (v98 < v97)
        goto LABEL_139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v96 = sub_217754F80((uint64_t)v96);
      if (v95 >= *((_QWORD *)v96 + 2))
        goto LABEL_140;
      v99 = &v96[16 * v95 + 32];
      *(_QWORD *)v99 = v97;
      *((_QWORD *)v99 + 1) = v98;
      v100 = *((_QWORD *)v96 + 2);
      if (v44 > v100)
        goto LABEL_141;
      memmove(&v96[16 * v44 + 16], &v96[16 * v44 + 32], 16 * (v100 - v44));
      v93 = v96;
      *((_QWORD *)v96 + 2) = v100 - 1;
      v44 = v100 - 1;
      if (v100 <= 2)
        goto LABEL_121;
    }
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
    return;
  }
  v104 = v5;
  v8 = 0;
  v9 = *a1;
  v101 = *a1 - 24;
  v102 = *a1 + 8;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v107 = v9;
  while (1)
  {
    v11 = v8++;
    if (v8 >= v3)
      goto LABEL_32;
    v12 = (uint64_t *)(v9 + 24 * v8);
    v13 = *v12;
    v14 = v12[1];
    v15 = (_QWORD *)(v9 + 24 * v11);
    if (v13 == *v15 && v14 == v15[1])
    {
      v18 = v11 + 2;
      if (v11 + 2 >= v106)
        goto LABEL_31;
      v17 = 0;
    }
    else
    {
      v17 = sub_21775E46C();
      v18 = v11 + 2;
      if (v11 + 2 >= v106)
        goto LABEL_23;
    }
    v19 = (_QWORD *)(v102 + 24 * v18);
    do
    {
      v20 = (_QWORD *)(v9 + 24 * v8);
      if (*(v19 - 1) == *v20 && *v19 == v20[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_24;
      }
      else if (((v17 ^ sub_21775E46C()) & 1) != 0)
      {
        goto LABEL_23;
      }
      v19 += 3;
      v22 = v18 + 1;
      v8 = v18;
      v18 = v22;
    }
    while (v22 < v106);
    v18 = v22;
LABEL_23:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_24:
      if (v18 < v11)
        goto LABEL_148;
      if (v11 < v18)
      {
        v23 = 24 * v18;
        v24 = 24 * v11;
        v25 = v18;
        v26 = v11;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_152;
            v27 = v9 + v24;
            v28 = v9 + v23;
            v29 = *(_QWORD *)(v9 + v24);
            v30 = *(_OWORD *)(v9 + v24 + 8);
            v31 = *(_OWORD *)(v9 + v23 - 24);
            *(_QWORD *)(v27 + 16) = *(_QWORD *)(v9 + v23 - 8);
            *(_OWORD *)v27 = v31;
            *(_QWORD *)(v28 - 24) = v29;
            *(_OWORD *)(v28 - 16) = v30;
          }
          ++v26;
          v23 -= 24;
          v24 += 24;
        }
        while (v26 < v25);
      }
LABEL_31:
      v8 = v18;
    }
LABEL_32:
    if (v8 < v106)
    {
      if (__OFSUB__(v8, v11))
        goto LABEL_143;
      if (v8 - v11 < v104)
      {
        if (__OFADD__(v11, v104))
          goto LABEL_146;
        if (v11 + v104 >= v106)
          v32 = v106;
        else
          v32 = v11 + v104;
        if (v32 < v11)
          goto LABEL_147;
        if (v8 != v32)
        {
          v33 = v101 + 24 * v8;
          do
          {
            v34 = (uint64_t *)(v9 + 24 * v8);
            v35 = *v34;
            v36 = v34[1];
            v37 = v11;
            v38 = v33;
            do
            {
              v39 = v35 == *(_QWORD *)v38 && v36 == *(_QWORD *)(v38 + 8);
              if (v39 || (sub_21775E46C() & 1) == 0)
                break;
              if (!v9)
                goto LABEL_150;
              v40 = *(_OWORD *)(v38 + 32);
              v41 = *(_QWORD *)(v38 + 16);
              v35 = *(_QWORD *)(v38 + 24);
              *(_OWORD *)(v38 + 24) = *(_OWORD *)v38;
              *(_QWORD *)(v38 + 40) = v41;
              *(_QWORD *)v38 = v35;
              *(_OWORD *)(v38 + 8) = v40;
              v36 = v40;
              v38 -= 24;
              ++v37;
            }
            while (v8 != v37);
            ++v8;
            v33 += 24;
          }
          while (v8 != v32);
          v8 = v32;
        }
      }
    }
    if (v8 < v11)
      goto LABEL_142;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_217754E90(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v43 = *((_QWORD *)v10 + 2);
    v42 = *((_QWORD *)v10 + 3);
    v44 = v43 + 1;
    if (v43 >= v42 >> 1)
      v10 = sub_217754E90((char *)(v42 > 1), v43 + 1, 1, v10);
    *((_QWORD *)v10 + 2) = v44;
    v45 = v10 + 32;
    v46 = &v10[16 * v43 + 32];
    *(_QWORD *)v46 = v11;
    *((_QWORD *)v46 + 1) = v8;
    if (v43)
      break;
    v44 = 1;
    v9 = v107;
LABEL_101:
    v3 = v106;
    if (v8 >= v106)
      goto LABEL_110;
  }
  v9 = v107;
  while (1)
  {
    v47 = v44 - 1;
    if (v44 >= 4)
    {
      v52 = &v45[16 * v44];
      v53 = *((_QWORD *)v52 - 8);
      v54 = *((_QWORD *)v52 - 7);
      v58 = __OFSUB__(v54, v53);
      v55 = v54 - v53;
      if (v58)
        goto LABEL_127;
      v57 = *((_QWORD *)v52 - 6);
      v56 = *((_QWORD *)v52 - 5);
      v58 = __OFSUB__(v56, v57);
      v50 = v56 - v57;
      v51 = v58;
      if (v58)
        goto LABEL_128;
      v59 = v44 - 2;
      v60 = &v45[16 * v44 - 32];
      v62 = *(_QWORD *)v60;
      v61 = *((_QWORD *)v60 + 1);
      v58 = __OFSUB__(v61, v62);
      v63 = v61 - v62;
      if (v58)
        goto LABEL_129;
      v58 = __OFADD__(v50, v63);
      v64 = v50 + v63;
      if (v58)
        goto LABEL_131;
      if (v64 >= v55)
      {
        v82 = &v45[16 * v47];
        v84 = *(_QWORD *)v82;
        v83 = *((_QWORD *)v82 + 1);
        v58 = __OFSUB__(v83, v84);
        v85 = v83 - v84;
        if (v58)
          goto LABEL_137;
        v75 = v50 < v85;
        goto LABEL_90;
      }
    }
    else
    {
      if (v44 != 3)
      {
        v76 = *((_QWORD *)v10 + 4);
        v77 = *((_QWORD *)v10 + 5);
        v58 = __OFSUB__(v77, v76);
        v69 = v77 - v76;
        v70 = v58;
        goto LABEL_84;
      }
      v49 = *((_QWORD *)v10 + 4);
      v48 = *((_QWORD *)v10 + 5);
      v58 = __OFSUB__(v48, v49);
      v50 = v48 - v49;
      v51 = v58;
    }
    if ((v51 & 1) != 0)
      goto LABEL_130;
    v59 = v44 - 2;
    v65 = &v45[16 * v44 - 32];
    v67 = *(_QWORD *)v65;
    v66 = *((_QWORD *)v65 + 1);
    v68 = __OFSUB__(v66, v67);
    v69 = v66 - v67;
    v70 = v68;
    if (v68)
      goto LABEL_132;
    v71 = &v45[16 * v47];
    v73 = *(_QWORD *)v71;
    v72 = *((_QWORD *)v71 + 1);
    v58 = __OFSUB__(v72, v73);
    v74 = v72 - v73;
    if (v58)
      goto LABEL_134;
    if (__OFADD__(v69, v74))
      goto LABEL_136;
    if (v69 + v74 >= v50)
    {
      v75 = v50 < v74;
LABEL_90:
      if (v75)
        v47 = v59;
      goto LABEL_92;
    }
LABEL_84:
    if ((v70 & 1) != 0)
      goto LABEL_133;
    v78 = &v45[16 * v47];
    v80 = *(_QWORD *)v78;
    v79 = *((_QWORD *)v78 + 1);
    v58 = __OFSUB__(v79, v80);
    v81 = v79 - v80;
    if (v58)
      goto LABEL_135;
    if (v81 < v69)
      goto LABEL_101;
LABEL_92:
    v86 = v47 - 1;
    if (v47 - 1 >= v44)
    {
      __break(1u);
LABEL_124:
      __break(1u);
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
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v9)
      goto LABEL_151;
    v87 = v9;
    v88 = &v45[16 * v86];
    v89 = *(_QWORD *)v88;
    v90 = &v45[16 * v47];
    v91 = *((_QWORD *)v90 + 1);
    sub_2177547DC((char *)(v87 + 24 * *(_QWORD *)v88), (char *)(v87 + 24 * *(_QWORD *)v90), v87 + 24 * v91, v108);
    if (v1)
      break;
    if (v91 < v89)
      goto LABEL_124;
    if (v47 > *((_QWORD *)v10 + 2))
      goto LABEL_125;
    *(_QWORD *)v88 = v89;
    *(_QWORD *)&v45[16 * v86 + 8] = v91;
    v92 = *((_QWORD *)v10 + 2);
    if (v47 >= v92)
      goto LABEL_126;
    v44 = v92 - 1;
    memmove(&v45[16 * v47], v90 + 16, 16 * (v92 - 1 - v47));
    *((_QWORD *)v10 + 2) = v92 - 1;
    v75 = v92 > 2;
    v9 = v107;
    if (!v75)
      goto LABEL_101;
  }
LABEL_106:
  swift_bridgeObjectRelease();
  if (v106 < -1)
    goto LABEL_145;
  *(_QWORD *)(v105 + 16) = 0;
  swift_bridgeObjectRelease();
}

void sub_217753080(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  char v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;

  v3 = a1[1];
  v4 = sub_21775E454();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_21775420C(0, v3, 1, a1);
      return;
    }
    goto LABEL_144;
  }
  v5 = v4;
  sub_2177519F4(v3 / 2, &qword_254F00588);
  v105 = v6;
  v106 = v3;
  v107 = v7;
  v103 = a1;
  if (v3 <= 0)
  {
    v108 = MEMORY[0x24BEE4AF8];
    v36 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    if (v36 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(_QWORD *)(v105 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_149;
    }
    v94 = *v103;
    while (1)
    {
      v95 = v36 - 2;
      if (v36 < 2)
        break;
      if (!v94)
        goto LABEL_153;
      v96 = (char *)v108;
      v97 = *(_QWORD *)(v108 + 32 + 16 * v95);
      v98 = *(_QWORD *)(v108 + 32 + 16 * (v36 - 1) + 8);
      sub_217754998((char *)(v94 + 32 * v97), (char *)(v94 + 32 * *(_QWORD *)(v108 + 32 + 16 * (v36 - 1))), v94 + 32 * v98, v107);
      if (v1)
        goto LABEL_106;
      if (v98 < v97)
        goto LABEL_139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v96 = sub_217754F80(v108);
      if (v95 >= *((_QWORD *)v96 + 2))
        goto LABEL_140;
      v99 = &v96[16 * v95 + 32];
      *(_QWORD *)v99 = v97;
      *((_QWORD *)v99 + 1) = v98;
      v100 = *((_QWORD *)v96 + 2);
      if (v36 > v100)
        goto LABEL_141;
      memmove(&v96[16 * v36 + 16], &v96[16 * v36 + 32], 16 * (v100 - v36));
      v108 = (uint64_t)v96;
      *((_QWORD *)v96 + 2) = v100 - 1;
      v36 = v100 - 1;
      v3 = v106;
      if (v100 <= 2)
        goto LABEL_121;
    }
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
    return;
  }
  v104 = v5;
  v8 = 0;
  v9 = *a1;
  v101 = *a1 - 32;
  v102 = *a1 + 8;
  v108 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v10 = v8++;
    if (v8 >= v3)
      goto LABEL_32;
    v11 = (uint64_t *)(v9 + 32 * v8);
    v12 = *v11;
    v13 = v11[1];
    v14 = (_QWORD *)(v9 + 32 * v10);
    if (v12 == *v14 && v13 == v14[1])
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v3)
        goto LABEL_31;
      v16 = 0;
LABEL_13:
      v18 = (_QWORD *)(v102 + 32 * v17);
      do
      {
        v19 = (_QWORD *)(v9 + 32 * v8);
        if (*(v18 - 1) == *v19 && *v18 == v19[1])
        {
          if ((v16 & 1) != 0)
            goto LABEL_24;
        }
        else if (((v16 ^ sub_21775E46C()) & 1) != 0)
        {
          goto LABEL_23;
        }
        v18 += 4;
        v21 = v17 + 1;
        v8 = v17;
        v17 = v21;
      }
      while (v21 < v3);
      v17 = v21;
      goto LABEL_23;
    }
    v16 = sub_21775E46C();
    v17 = v10 + 2;
    if (v10 + 2 < v3)
      goto LABEL_13;
LABEL_23:
    v8 = v17;
    if ((v16 & 1) == 0)
      goto LABEL_32;
LABEL_24:
    if (v17 < v10)
      goto LABEL_148;
    if (v10 < v17)
    {
      v22 = 32 * v17;
      v23 = 32 * v10;
      v24 = v17;
      v25 = v10;
      do
      {
        if (v25 != --v24)
        {
          if (!v9)
            goto LABEL_152;
          v26 = (_OWORD *)(v9 + v23);
          v27 = v9 + v22;
          v28 = *(_QWORD *)(v9 + v23);
          v29 = *(_QWORD *)(v9 + v23 + 24);
          v30 = *(_OWORD *)(v9 + v23 + 8);
          v31 = *(_OWORD *)(v9 + v22 - 16);
          *v26 = *(_OWORD *)(v9 + v22 - 32);
          v26[1] = v31;
          *(_QWORD *)(v27 - 32) = v28;
          *(_OWORD *)(v27 - 24) = v30;
          *(_QWORD *)(v27 - 8) = v29;
        }
        ++v25;
        v22 -= 32;
        v23 += 32;
      }
      while (v25 < v24);
    }
LABEL_31:
    v8 = v17;
LABEL_32:
    if (v8 >= v3)
      goto LABEL_41;
    if (__OFSUB__(v8, v10))
      goto LABEL_143;
    if (v8 - v10 >= v104)
      goto LABEL_41;
    if (__OFADD__(v10, v104))
      goto LABEL_146;
    if (v10 + v104 >= v3)
      v32 = v3;
    else
      v32 = v10 + v104;
    if (v32 < v10)
      goto LABEL_147;
    if (v8 == v32)
    {
LABEL_41:
      v33 = (char *)v108;
    }
    else
    {
      v84 = v101 + 32 * v8;
      v33 = (char *)v108;
      do
      {
        v85 = (uint64_t *)(v9 + 32 * v8);
        v86 = *v85;
        v87 = v85[1];
        v88 = v10;
        v89 = v84;
        do
        {
          v90 = v86 == *(_QWORD *)v89 && v87 == *(_QWORD *)(v89 + 8);
          if (v90 || (sub_21775E46C() & 1) == 0)
            break;
          if (!v9)
            goto LABEL_150;
          v86 = *(_QWORD *)(v89 + 32);
          v91 = *(_QWORD *)(v89 + 56);
          v92 = *(_OWORD *)(v89 + 40);
          v93 = *(_OWORD *)(v89 + 16);
          *(_OWORD *)(v89 + 32) = *(_OWORD *)v89;
          *(_OWORD *)(v89 + 48) = v93;
          *(_QWORD *)v89 = v86;
          *(_OWORD *)(v89 + 8) = v92;
          *(_QWORD *)(v89 + 24) = v91;
          v87 = v92;
          v89 -= 32;
          ++v88;
        }
        while (v8 != v88);
        ++v8;
        v84 += 32;
      }
      while (v8 != v32);
      v8 = v32;
    }
    if (v8 < v10)
      goto LABEL_142;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v33 = sub_217754E90(0, *((_QWORD *)v33 + 2) + 1, 1, v33);
    v35 = *((_QWORD *)v33 + 2);
    v34 = *((_QWORD *)v33 + 3);
    v36 = v35 + 1;
    if (v35 >= v34 >> 1)
      v33 = sub_217754E90((char *)(v34 > 1), v35 + 1, 1, v33);
    *((_QWORD *)v33 + 2) = v36;
    v37 = v33 + 32;
    v38 = &v33[16 * v35 + 32];
    *(_QWORD *)v38 = v10;
    *((_QWORD *)v38 + 1) = v8;
    v108 = (uint64_t)v33;
    if (v35)
      break;
    v36 = 1;
LABEL_90:
    v3 = v106;
    if (v8 >= v106)
      goto LABEL_110;
  }
  while (1)
  {
    v39 = v36 - 1;
    if (v36 >= 4)
    {
      v44 = &v37[16 * v36];
      v45 = *((_QWORD *)v44 - 8);
      v46 = *((_QWORD *)v44 - 7);
      v50 = __OFSUB__(v46, v45);
      v47 = v46 - v45;
      if (v50)
        goto LABEL_127;
      v49 = *((_QWORD *)v44 - 6);
      v48 = *((_QWORD *)v44 - 5);
      v50 = __OFSUB__(v48, v49);
      v42 = v48 - v49;
      v43 = v50;
      if (v50)
        goto LABEL_128;
      v51 = v36 - 2;
      v52 = &v37[16 * v36 - 32];
      v54 = *(_QWORD *)v52;
      v53 = *((_QWORD *)v52 + 1);
      v50 = __OFSUB__(v53, v54);
      v55 = v53 - v54;
      if (v50)
        goto LABEL_129;
      v50 = __OFADD__(v42, v55);
      v56 = v42 + v55;
      if (v50)
        goto LABEL_131;
      if (v56 >= v47)
      {
        v74 = &v37[16 * v39];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        v50 = __OFSUB__(v75, v76);
        v77 = v75 - v76;
        if (v50)
          goto LABEL_137;
        v67 = v42 < v77;
        goto LABEL_79;
      }
    }
    else
    {
      if (v36 != 3)
      {
        v68 = *((_QWORD *)v33 + 4);
        v69 = *((_QWORD *)v33 + 5);
        v50 = __OFSUB__(v69, v68);
        v61 = v69 - v68;
        v62 = v50;
        goto LABEL_73;
      }
      v41 = *((_QWORD *)v33 + 4);
      v40 = *((_QWORD *)v33 + 5);
      v50 = __OFSUB__(v40, v41);
      v42 = v40 - v41;
      v43 = v50;
    }
    if ((v43 & 1) != 0)
      goto LABEL_130;
    v51 = v36 - 2;
    v57 = &v37[16 * v36 - 32];
    v59 = *(_QWORD *)v57;
    v58 = *((_QWORD *)v57 + 1);
    v60 = __OFSUB__(v58, v59);
    v61 = v58 - v59;
    v62 = v60;
    if (v60)
      goto LABEL_132;
    v63 = &v37[16 * v39];
    v65 = *(_QWORD *)v63;
    v64 = *((_QWORD *)v63 + 1);
    v50 = __OFSUB__(v64, v65);
    v66 = v64 - v65;
    if (v50)
      goto LABEL_134;
    if (__OFADD__(v61, v66))
      goto LABEL_136;
    if (v61 + v66 >= v42)
    {
      v67 = v42 < v66;
LABEL_79:
      if (v67)
        v39 = v51;
      goto LABEL_81;
    }
LABEL_73:
    if ((v62 & 1) != 0)
      goto LABEL_133;
    v70 = &v37[16 * v39];
    v72 = *(_QWORD *)v70;
    v71 = *((_QWORD *)v70 + 1);
    v50 = __OFSUB__(v71, v72);
    v73 = v71 - v72;
    if (v50)
      goto LABEL_135;
    if (v73 < v61)
      goto LABEL_90;
LABEL_81:
    v78 = v39 - 1;
    if (v39 - 1 >= v36)
    {
      __break(1u);
LABEL_124:
      __break(1u);
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
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v9)
      goto LABEL_151;
    v79 = &v37[16 * v78];
    v80 = *(_QWORD *)v79;
    v81 = &v37[16 * v39];
    v82 = *((_QWORD *)v81 + 1);
    sub_217754998((char *)(v9 + 32 * *(_QWORD *)v79), (char *)(v9 + 32 * *(_QWORD *)v81), v9 + 32 * v82, v107);
    if (v1)
      break;
    if (v82 < v80)
      goto LABEL_124;
    if (v39 > *(_QWORD *)(v108 + 16))
      goto LABEL_125;
    *(_QWORD *)v79 = v80;
    *(_QWORD *)&v37[16 * v78 + 8] = v82;
    v83 = *(_QWORD *)(v108 + 16);
    if (v39 >= v83)
      goto LABEL_126;
    v33 = (char *)v108;
    v36 = v83 - 1;
    memmove(&v37[16 * v39], v81 + 16, 16 * (v83 - 1 - v39));
    *(_QWORD *)(v108 + 16) = v83 - 1;
    if (v83 <= 2)
      goto LABEL_90;
  }
LABEL_106:
  swift_bridgeObjectRelease();
  if (v106 < -1)
    goto LABEL_145;
  *(_QWORD *)(v105 + 16) = 0;
  swift_bridgeObjectRelease();
}

void sub_217753718(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  int v24;
  __int128 *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  __int128 v29;
  uint64_t v30;
  _OWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _OWORD *v104;
  char *v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t v109;

  v3 = a1[1];
  v4 = sub_21775E454();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_2177542E0(0, v3, 1, a1);
      return;
    }
    goto LABEL_146;
  }
  v5 = v4;
  v106 = v1;
  sub_2177519F4(v3 / 2, &qword_254F00570);
  v100 = v6;
  v105 = v7;
  v103 = v3;
  v98 = a1;
  if (v3 <= 0)
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v41 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    if (v41 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(_QWORD *)(v100 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_151;
    }
    v90 = *v98;
    while (1)
    {
      v91 = v41 - 2;
      if (v41 < 2)
        break;
      if (!v90)
        goto LABEL_155;
      v92 = *(_QWORD *)&v10[16 * v91 + 32];
      v93 = *(_QWORD *)&v10[16 * v41 + 24];
      sub_217754B44((char *)(v90 + 16 * v92), (char *)(v90 + 16 * *(_QWORD *)&v10[16 * v41 + 16]), v90 + 16 * v93, v105);
      if (v106)
        goto LABEL_107;
      if (v93 < v92)
        goto LABEL_141;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v10 = sub_217754F80((uint64_t)v10);
      if (v91 >= *((_QWORD *)v10 + 2))
        goto LABEL_142;
      v94 = &v10[16 * v91 + 32];
      *(_QWORD *)v94 = v92;
      *((_QWORD *)v94 + 1) = v93;
      v95 = *((_QWORD *)v10 + 2);
      if (v41 > v95)
        goto LABEL_143;
      memmove(&v10[16 * v41 + 16], &v10[16 * v41 + 32], 16 * (v95 - v41));
      *((_QWORD *)v10 + 2) = v95 - 1;
      v41 = v95 - 1;
      v3 = v103;
      if (v95 <= 2)
        goto LABEL_121;
    }
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
    return;
  }
  v99 = v5;
  v8 = 0;
  v9 = *a1;
  v96 = *a1 - 16;
  v97 = *a1 + 40;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v109 = *a1;
  while (1)
  {
    v11 = v8 + 1;
    v102 = v8;
    if (v8 + 1 < v3)
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_217746620(&qword_254F00550);
      v12 = sub_21775E1F0();
      v14 = v13;
      swift_getObjectType();
      if (v12 == sub_21775E1F0() && v14 == v15)
        v107 = 0;
      else
        v107 = sub_21775E46C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      v3 = v103;
      v11 = v8 + 2;
      v9 = v109;
      if (v8 + 2 < v103)
      {
        v17 = v97 + 16 * v8;
        while (1)
        {
          v18 = v11;
          swift_getObjectType();
          swift_unknownObjectRetain();
          swift_unknownObjectRetain();
          v19 = sub_21775E1F0();
          v21 = v20;
          swift_getObjectType();
          v23 = v19 == sub_21775E1F0() && v21 == v22;
          v24 = v23 ? 0 : sub_21775E46C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          if (((v107 ^ v24) & 1) != 0)
            break;
          ++v11;
          v17 += 16;
          v3 = v103;
          if (v18 + 1 >= v103)
          {
            v11 = v103;
            goto LABEL_23;
          }
        }
        v3 = v103;
LABEL_23:
        v8 = v102;
      }
      if ((v107 & 1) != 0)
      {
        if (v11 < v8)
          goto LABEL_148;
        if (v8 < v11)
        {
          v25 = (__int128 *)(v96 + 16 * v11);
          v26 = v11;
          v27 = v8;
          v28 = (__int128 *)(v109 + 16 * v8);
          do
          {
            if (v27 != --v26)
            {
              if (!v109)
                goto LABEL_154;
              v29 = *v28;
              *v28 = *v25;
              *v25 = v29;
            }
            ++v27;
            --v25;
            ++v28;
          }
          while (v27 < v26);
        }
      }
    }
    if (v11 < v3)
    {
      if (__OFSUB__(v11, v8))
        goto LABEL_145;
      if (v11 - v8 < v99)
      {
        if (__OFADD__(v8, v99))
          goto LABEL_149;
        if (v8 + v99 >= v3)
          v30 = v3;
        else
          v30 = v8 + v99;
        if (v30 < v8)
          goto LABEL_150;
        if (v11 != v30)
        {
          v101 = v30;
          v31 = (_OWORD *)(v96 + 16 * v11);
          do
          {
            v104 = v31;
            while (1)
            {
              swift_getObjectType();
              swift_unknownObjectRetain();
              swift_unknownObjectRetain();
              sub_217746620(&qword_254F00550);
              v32 = sub_21775E1F0();
              v34 = v33;
              swift_getObjectType();
              if (v32 == sub_21775E1F0() && v34 == v35)
                break;
              v37 = sub_21775E46C();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v9 = v109;
              if ((v37 & 1) == 0)
                goto LABEL_52;
              if (!v109)
                goto LABEL_152;
              v38 = v31[1];
              v31[1] = *v31;
              *v31-- = v38;
              if (v11 == ++v8)
                goto LABEL_52;
            }
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease_n();
            v9 = v109;
LABEL_52:
            ++v11;
            v31 = v104 + 1;
            v8 = v102;
          }
          while (v11 != v101);
          v11 = v101;
        }
      }
    }
    if (v11 < v8)
      goto LABEL_144;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_217754E90(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v40 = *((_QWORD *)v10 + 2);
    v39 = *((_QWORD *)v10 + 3);
    v41 = v40 + 1;
    if (v40 >= v39 >> 1)
      v10 = sub_217754E90((char *)(v39 > 1), v40 + 1, 1, v10);
    *((_QWORD *)v10 + 2) = v41;
    v42 = v10 + 32;
    v43 = &v10[16 * v40 + 32];
    *(_QWORD *)v43 = v8;
    *((_QWORD *)v43 + 1) = v11;
    v108 = v11;
    if (v40)
      break;
    v41 = 1;
LABEL_102:
    v3 = v103;
    v8 = v108;
    if (v108 >= v103)
      goto LABEL_110;
  }
  while (1)
  {
    v44 = v41 - 1;
    if (v41 >= 4)
    {
      v49 = &v42[16 * v41];
      v50 = *((_QWORD *)v49 - 8);
      v51 = *((_QWORD *)v49 - 7);
      v55 = __OFSUB__(v51, v50);
      v52 = v51 - v50;
      if (v55)
        goto LABEL_129;
      v54 = *((_QWORD *)v49 - 6);
      v53 = *((_QWORD *)v49 - 5);
      v55 = __OFSUB__(v53, v54);
      v47 = v53 - v54;
      v48 = v55;
      if (v55)
        goto LABEL_130;
      v56 = v41 - 2;
      v57 = &v42[16 * v41 - 32];
      v59 = *(_QWORD *)v57;
      v58 = *((_QWORD *)v57 + 1);
      v55 = __OFSUB__(v58, v59);
      v60 = v58 - v59;
      if (v55)
        goto LABEL_131;
      v55 = __OFADD__(v47, v60);
      v61 = v47 + v60;
      if (v55)
        goto LABEL_133;
      if (v61 >= v52)
      {
        v79 = &v42[16 * v44];
        v81 = *(_QWORD *)v79;
        v80 = *((_QWORD *)v79 + 1);
        v55 = __OFSUB__(v80, v81);
        v82 = v80 - v81;
        if (v55)
          goto LABEL_139;
        v72 = v47 < v82;
        goto LABEL_91;
      }
    }
    else
    {
      if (v41 != 3)
      {
        v73 = *((_QWORD *)v10 + 4);
        v74 = *((_QWORD *)v10 + 5);
        v55 = __OFSUB__(v74, v73);
        v66 = v74 - v73;
        v67 = v55;
        goto LABEL_85;
      }
      v46 = *((_QWORD *)v10 + 4);
      v45 = *((_QWORD *)v10 + 5);
      v55 = __OFSUB__(v45, v46);
      v47 = v45 - v46;
      v48 = v55;
    }
    if ((v48 & 1) != 0)
      goto LABEL_132;
    v56 = v41 - 2;
    v62 = &v42[16 * v41 - 32];
    v64 = *(_QWORD *)v62;
    v63 = *((_QWORD *)v62 + 1);
    v65 = __OFSUB__(v63, v64);
    v66 = v63 - v64;
    v67 = v65;
    if (v65)
      goto LABEL_134;
    v68 = &v42[16 * v44];
    v70 = *(_QWORD *)v68;
    v69 = *((_QWORD *)v68 + 1);
    v55 = __OFSUB__(v69, v70);
    v71 = v69 - v70;
    if (v55)
      goto LABEL_136;
    if (__OFADD__(v66, v71))
      goto LABEL_138;
    if (v66 + v71 >= v47)
    {
      v72 = v47 < v71;
LABEL_91:
      if (v72)
        v44 = v56;
      goto LABEL_93;
    }
LABEL_85:
    if ((v67 & 1) != 0)
      goto LABEL_135;
    v75 = &v42[16 * v44];
    v77 = *(_QWORD *)v75;
    v76 = *((_QWORD *)v75 + 1);
    v55 = __OFSUB__(v76, v77);
    v78 = v76 - v77;
    if (v55)
      goto LABEL_137;
    if (v78 < v66)
      goto LABEL_102;
LABEL_93:
    v83 = v44 - 1;
    if (v44 - 1 >= v41)
    {
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
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
      goto LABEL_140;
    }
    if (!v9)
      goto LABEL_153;
    v84 = v10;
    v85 = &v42[16 * v83];
    v86 = *(_QWORD *)v85;
    v87 = &v42[16 * v44];
    v88 = *((_QWORD *)v87 + 1);
    sub_217754B44((char *)(v9 + 16 * *(_QWORD *)v85), (char *)(v9 + 16 * *(_QWORD *)v87), v9 + 16 * v88, v105);
    if (v106)
      break;
    if (v88 < v86)
      goto LABEL_126;
    if (v44 > *((_QWORD *)v84 + 2))
      goto LABEL_127;
    *(_QWORD *)v85 = v86;
    *(_QWORD *)&v42[16 * v83 + 8] = v88;
    v89 = *((_QWORD *)v84 + 2);
    if (v44 >= v89)
      goto LABEL_128;
    v10 = v84;
    v106 = 0;
    v41 = v89 - 1;
    memmove(&v42[16 * v44], v87 + 16, 16 * (v89 - 1 - v44));
    *((_QWORD *)v10 + 2) = v89 - 1;
    v9 = v109;
    if (v89 <= 2)
      goto LABEL_102;
  }
LABEL_107:
  swift_bridgeObjectRelease();
  if (v103 < -1)
    goto LABEL_147;
  *(_QWORD *)(v100 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_217753F84(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 16 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1))
          break;
        result = sub_217755090();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        result = *v12;
        v10 = v12[1];
        *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_217754044(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 48 * a3 + 40;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 48 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = v8;
      do
      {
        v13 = (_OWORD *)(v12 - 88);
        if (result == *(_QWORD *)(v12 - 88) && v10 == *(_QWORD *)(v12 - 80))
          break;
        result = sub_21775E46C();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        v16 = *(_OWORD *)(v12 - 72);
        v15 = *(_OWORD *)(v12 - 56);
        *(_QWORD *)(v12 - 48) = *(_QWORD *)v12;
        v12 -= 48;
        result = *(_QWORD *)(v12 + 8);
        v10 = *(_QWORD *)(v12 + 16);
        v17 = *(_QWORD *)(v12 + 24);
        v18 = *(_OWORD *)(v12 + 32);
        v13[3] = *v13;
        v13[4] = v16;
        v13[5] = v15;
        *(_QWORD *)(v12 - 40) = result;
        *(_QWORD *)(v12 - 32) = v10;
        *(_QWORD *)(v12 - 24) = v17;
        *(_OWORD *)(v12 - 16) = v18;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 48;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_217754130(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 24 * a3 - 24;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 24 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = v8;
      do
      {
        if (result == *(_QWORD *)v12 && v10 == *(_QWORD *)(v12 + 8))
          break;
        result = sub_21775E46C();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        v14 = *(_OWORD *)(v12 + 32);
        v15 = *(_QWORD *)(v12 + 16);
        result = *(_QWORD *)(v12 + 24);
        *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
        *(_QWORD *)(v12 + 40) = v15;
        *(_QWORD *)v12 = result;
        *(_OWORD *)(v12 + 8) = v14;
        v10 = v14;
        v12 -= 24;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 24;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_21775420C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 32 * a3 - 32;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 32 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = v8;
      do
      {
        if (result == *(_QWORD *)v12 && v10 == *(_QWORD *)(v12 + 8))
          break;
        result = sub_21775E46C();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        result = *(_QWORD *)(v12 + 32);
        v14 = *(_QWORD *)(v12 + 56);
        v15 = *(_OWORD *)(v12 + 40);
        v16 = *(_OWORD *)(v12 + 16);
        *(_OWORD *)(v12 + 32) = *(_OWORD *)v12;
        *(_OWORD *)(v12 + 48) = v16;
        *(_QWORD *)v12 = result;
        *(_OWORD *)(v12 + 8) = v15;
        *(_QWORD *)(v12 + 24) = v14;
        v10 = v15;
        v12 -= 32;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 32;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_2177542E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  __int128 v13;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;

  v15 = result;
  if (a3 != a2)
  {
    v4 = a3;
    v17 = *a4;
    v5 = (_OWORD *)(*a4 + 16 * a3 - 16);
    while (2)
    {
      v6 = v15;
      v16 = v5;
      while (1)
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        sub_217746620(&qword_254F00550);
        v7 = sub_21775E1F0();
        v9 = v8;
        swift_getObjectType();
        if (v7 == sub_21775E1F0() && v9 == v10)
          break;
        v12 = sub_21775E46C();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v12 & 1) != 0)
        {
          if (!v17)
          {
            __break(1u);
            return result;
          }
          v13 = v5[1];
          v5[1] = *v5;
          *v5-- = v13;
          if (v4 != ++v6)
            continue;
        }
        goto LABEL_13;
      }
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      result = swift_bridgeObjectRelease_n();
LABEL_13:
      ++v4;
      v5 = v16 + 1;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_21775447C(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v14;
  char *v15;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 16;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 16;
  if (v9 >= v11)
  {
    sub_2177576F0(a2, (uint64_t)(a3 - (_QWORD)a2) / 16, a4);
    v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16)
      goto LABEL_47;
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      v20 = (char *)(v12 - 16);
      v21 = *(_QWORD *)(v12 - 16) == *((_QWORD *)v6 - 2) && *(_QWORD *)(v12 - 8) == *((_QWORD *)v6 - 1);
      if (v21 || (sub_217755090() & 1) == 0)
      {
        v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23)
          goto LABEL_43;
      }
      else
      {
        v22 = v19 != v6 || v18 >= v6;
        v20 = v6 - 16;
        v6 -= 16;
        if (!v22)
          goto LABEL_43;
      }
      *(_OWORD *)v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4)
        goto LABEL_47;
    }
  }
  sub_2177576F0(a1, (a2 - a1) / 16, a4);
  v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v14 && (sub_217755090() & 1) != 0)
        break;
      v15 = v4;
      v14 = v7 == v4;
      v4 += 16;
      if (!v14)
        goto LABEL_15;
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_21;
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 16;
    if (v14)
      goto LABEL_16;
LABEL_15:
    *(_OWORD *)v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  sub_2177576F0(v4, (uint64_t)(v12 - (_QWORD)v4) / 16, v6);
  return 1;
}

uint64_t sub_217754618(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 48;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 48;
  if (v9 >= v11)
  {
    sub_2177577A4(a2, (uint64_t)(a3 - (_QWORD)a2) / 48, a4);
    v12 = &v4[48 * v11];
    if (v7 >= v6 || v10 < 48)
      goto LABEL_43;
    v18 = (char *)(a3 - 48);
    while (1)
    {
      v19 = v18 + 48;
      v20 = v12 - 48;
      v21 = *((_QWORD *)v12 - 6) == *((_QWORD *)v6 - 6) && *((_QWORD *)v12 - 5) == *((_QWORD *)v6 - 5);
      if (v21 || (sub_21775E46C() & 1) == 0)
      {
        v23 = v19 != v12 || v18 >= v12;
        v12 -= 48;
        if (!v23)
          goto LABEL_39;
      }
      else
      {
        v22 = v19 != v6 || v18 >= v6;
        v20 = v6 - 48;
        v6 -= 48;
        if (!v22)
          goto LABEL_39;
      }
      v24 = *(_OWORD *)v20;
      v25 = *((_OWORD *)v20 + 2);
      *((_OWORD *)v18 + 1) = *((_OWORD *)v20 + 1);
      *((_OWORD *)v18 + 2) = v25;
      *(_OWORD *)v18 = v24;
LABEL_39:
      v18 -= 48;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_43;
    }
  }
  sub_2177577A4(a1, (a2 - a1) / 48, a4);
  v12 = &v4[48 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 48)
  {
    while (1)
    {
      v13 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v13 && (sub_21775E46C() & 1) != 0)
        break;
      v14 = v4;
      v13 = v7 == v4;
      v4 += 48;
      if (!v13)
        goto LABEL_13;
LABEL_14:
      v7 += 48;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v14 = v6;
    v13 = v7 == v6;
    v6 += 48;
    if (v13)
      goto LABEL_14;
LABEL_13:
    v15 = *(_OWORD *)v14;
    v16 = *((_OWORD *)v14 + 2);
    *((_OWORD *)v7 + 1) = *((_OWORD *)v14 + 1);
    *((_OWORD *)v7 + 2) = v16;
    *(_OWORD *)v7 = v15;
    goto LABEL_14;
  }
LABEL_19:
  v6 = v7;
LABEL_43:
  sub_2177577A4(v4, (v12 - v4) / 48, v6);
  return 1;
}

uint64_t sub_2177547DC(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v14;
  char *v15;
  __int128 v16;
  unint64_t v19;
  char *v20;
  char *v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  __int128 v25;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  if (v9 >= v11)
  {
    sub_217757748(a2, (uint64_t)(a3 - (_QWORD)a2) / 24, a4);
    v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24)
      goto LABEL_47;
    v19 = a3 - 24;
    while (1)
    {
      v20 = (char *)(v19 + 24);
      v21 = v12 - 24;
      v22 = *((_QWORD *)v12 - 3) == *((_QWORD *)v6 - 3) && *((_QWORD *)v12 - 2) == *((_QWORD *)v6 - 2);
      if (v22 || (sub_21775E46C() & 1) == 0)
      {
        v24 = v20 != v12 || v19 >= (unint64_t)v12;
        v12 -= 24;
        if (!v24)
          goto LABEL_43;
      }
      else
      {
        v23 = v20 != v6 || v19 >= (unint64_t)v6;
        v21 = v6 - 24;
        v6 -= 24;
        if (!v23)
          goto LABEL_43;
      }
      v25 = *(_OWORD *)v21;
      *(_QWORD *)(v19 + 16) = *((_QWORD *)v21 + 2);
      *(_OWORD *)v19 = v25;
LABEL_43:
      v19 -= 24;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_47;
    }
  }
  sub_217757748(a1, (a2 - a1) / 24, a4);
  v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v14 && (sub_21775E46C() & 1) != 0)
        break;
      v15 = v4;
      v14 = v7 == v4;
      v4 += 24;
      if (!v14)
        goto LABEL_15;
LABEL_16:
      v7 += 24;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_21;
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 24;
    if (v14)
      goto LABEL_16;
LABEL_15:
    v16 = *(_OWORD *)v15;
    *((_QWORD *)v7 + 2) = *((_QWORD *)v15 + 2);
    *(_OWORD *)v7 = v16;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  sub_217757748(v4, (v12 - v4) / 24, v6);
  return 1;
}

uint64_t sub_217754998(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  char *v14;
  __int128 v15;
  char *v17;
  char *v18;
  char *v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  __int128 v23;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 32;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 32;
  if (v9 >= v11)
  {
    sub_217757744(a2, (uint64_t)(a3 - (_QWORD)a2) / 32, a4);
    v12 = (unint64_t)&v4[32 * v11];
    if (v7 >= v6 || v10 < 32)
      goto LABEL_43;
    v17 = (char *)(a3 - 32);
    while (1)
    {
      v18 = v17 + 32;
      v19 = (char *)(v12 - 32);
      v20 = *(_QWORD *)(v12 - 32) == *((_QWORD *)v6 - 4) && *(_QWORD *)(v12 - 24) == *((_QWORD *)v6 - 3);
      if (v20 || (sub_21775E46C() & 1) == 0)
      {
        v22 = v18 != (char *)v12 || (unint64_t)v17 >= v12;
        v12 -= 32;
        if (!v22)
          goto LABEL_39;
      }
      else
      {
        v21 = v18 != v6 || v17 >= v6;
        v19 = v6 - 32;
        v6 -= 32;
        if (!v21)
          goto LABEL_39;
      }
      v23 = *((_OWORD *)v19 + 1);
      *(_OWORD *)v17 = *(_OWORD *)v19;
      *((_OWORD *)v17 + 1) = v23;
LABEL_39:
      v17 -= 32;
      if (v6 <= v7 || v12 <= (unint64_t)v4)
        goto LABEL_43;
    }
  }
  sub_217757744(a1, (a2 - a1) / 32, a4);
  v12 = (unint64_t)&v4[32 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      v13 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v13 && (sub_21775E46C() & 1) != 0)
        break;
      v14 = v4;
      v13 = v7 == v4;
      v4 += 32;
      if (!v13)
        goto LABEL_13;
LABEL_14:
      v7 += 32;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v14 = v6;
    v13 = v7 == v6;
    v6 += 32;
    if (v13)
      goto LABEL_14;
LABEL_13:
    v15 = *((_OWORD *)v14 + 1);
    *(_OWORD *)v7 = *(_OWORD *)v14;
    *((_OWORD *)v7 + 1) = v15;
    goto LABEL_14;
  }
LABEL_19:
  v6 = v7;
LABEL_43:
  sub_217757744(v4, (uint64_t)(v12 - (_QWORD)v4) / 32, v6);
  return 1;
}

uint64_t sub_217754B44(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  char *v21;
  BOOL v22;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  char *v34;
  BOOL v35;
  unint64_t v36;
  BOOL v37;
  char *v40;
  char *v41;
  char *v42;
  unint64_t v43;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 16;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 16;
  if (v9 >= v11)
  {
    sub_2177576F0(a2, (uint64_t)(a3 - (_QWORD)a2) / 16, a4);
    v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16)
      goto LABEL_52;
    v40 = v7;
    v41 = v4;
    v25 = (char *)(a3 - 16);
    while (1)
    {
      v43 = (unint64_t)v12;
      v26 = v12 - 16;
      v27 = v6 - 16;
      swift_getObjectType();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_217746620(&qword_254F00550);
      v28 = sub_21775E1F0();
      v30 = v29;
      swift_getObjectType();
      if (v28 == sub_21775E1F0() && v30 == v31)
        v33 = 0;
      else
        v33 = sub_21775E46C();
      v34 = v25 + 16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if ((v33 & 1) != 0)
      {
        v35 = v34 != v6 || v25 >= v6;
        v6 -= 16;
        v36 = (unint64_t)v40;
        v12 = (char *)v43;
        if (!v35)
          goto LABEL_47;
      }
      else
      {
        v37 = v34 != (char *)v43 || (unint64_t)v25 >= v43;
        v27 = v26;
        v12 = v26;
        v36 = (unint64_t)v40;
        if (!v37)
          goto LABEL_47;
      }
      *(_OWORD *)v25 = *(_OWORD *)v27;
LABEL_47:
      v25 -= 16;
      if ((unint64_t)v6 <= v36 || v12 <= v41)
      {
        v4 = v41;
        goto LABEL_52;
      }
    }
  }
  sub_2177576F0(a1, (a2 - a1) / 16, a4);
  v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    v42 = &v4[16 * v9];
    while (1)
    {
      v14 = v6;
      swift_getObjectType();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      sub_217746620(&qword_254F00550);
      v15 = sub_21775E1F0();
      v17 = v16;
      swift_getObjectType();
      if (v15 == sub_21775E1F0() && v17 == v18)
        break;
      v20 = sub_21775E46C();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
        goto LABEL_14;
      v21 = v14;
      v6 = v14 + 16;
      v22 = v7 == v14;
LABEL_15:
      v12 = v42;
      if (!v22)
        *(_OWORD *)v7 = *(_OWORD *)v21;
      v7 += 16;
      if (v4 >= v42 || (unint64_t)v6 >= a3)
        goto LABEL_22;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_14:
    v21 = v4;
    v22 = v7 == v4;
    v4 += 16;
    v6 = v14;
    goto LABEL_15;
  }
LABEL_22:
  v6 = v7;
LABEL_52:
  sub_2177576F0(v4, (v12 - v4) / 16, v6);
  return 1;
}

char *sub_217754E90(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_217746620(&qword_254F00568);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  sub_21774FBA4();
  return v10;
}

char *sub_217754F80(uint64_t a1)
{
  return sub_217754E90(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_217754F94()
{
  sub_21775ABFC();
}

void sub_217754FA8(uint64_t a1)
{
  sub_21775AC18(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_217754FBC()
{
  sub_21775ACD8();
}

void sub_217754FD0()
{
  sub_21775ADAC();
}

void sub_217754FE4()
{
  sub_21775AE70();
}

uint64_t sub_217754FF8()
{
  return sub_21775E49C();
}

uint64_t sub_21775500C()
{
  return swift_allocObject();
}

__n128 sub_217755018(__n128 *a1)
{
  unint64_t v1;
  uint64_t v2;
  __n128 result;

  result = *(__n128 *)(v2 - 144);
  a1[1] = result;
  a1[3].n128_u64[1] = v1;
  return result;
}

__n128 sub_217755028(__n128 *a1)
{
  unint64_t v1;
  uint64_t v2;
  __n128 result;

  result = *(__n128 *)(v2 - 176);
  a1[1] = result;
  a1[3].n128_u64[1] = v1;
  return result;
}

uint64_t sub_217755038@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 32) = v2;
  *(_QWORD *)(a1 + 40) = (a2 - 32) | 0x8000000000000000;
  return nullsub_1();
}

uint64_t sub_217755060()
{
  return sub_21775E3F4();
}

uint64_t sub_217755078(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v2 - 176);
  *(_QWORD *)(a1 + 56) = v1;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0xE000000000000000;
  return nullsub_1();
}

uint64_t sub_217755090()
{
  return sub_21775E46C();
}

uint64_t sub_217755098()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_2177550A4()
{
  return sub_21775E208();
}

uint64_t sub_2177550C4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2177550CC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[7] = v3;
  v2[4] = a1;
  v2[5] = a2;
  return nullsub_1(v2);
}

uint64_t sub_2177550DC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2177550E4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(result + 32) = 0xD000000000000028;
  *(_QWORD *)(result + 40) = a2 | 0x8000000000000000;
  return result;
}

uint64_t sub_217755104()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_21775510C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_217755114()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_21775511C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_217755124()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_217755140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(_QWORD *)(a13 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_217755158()
{
  return sub_21775E220();
}

void sub_217755164()
{
  void *v0;

}

uint64_t sub_217755178()
{
  return swift_beginAccess();
}

char *sub_217755180(char *a1, int64_t a2)
{
  char *v2;

  return sub_217754E90(a1, a2, 1, v2);
}

__n128 sub_21775518C(__n128 *a1)
{
  unint64_t v1;
  uint64_t v2;
  __n128 result;

  result = *(__n128 *)(v2 - 144);
  a1[1] = result;
  a1[3].n128_u64[1] = v1;
  return result;
}

uint64_t sub_2177551A0()
{
  return swift_unknownObjectRetain();
}

void FeatureRegistry.__allocating_init()()
{
  uint64_t v0;

  v0 = sub_2177466A4();
  MEMORY[0x24BDAC7A8](v0);
  static Paths.featureManagerBaseDirectory()();
  sub_217759310();
  sub_2177593F4();
  sub_2177592F8();
}

uint64_t FeatureRegistry.feature(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  sub_217755178();
  v7 = *(_QWORD *)(v3 + 32);
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_5;
  sub_21774FB64();
  v8 = sub_21774D218(a1, a2);
  if ((v9 & 1) == 0)
  {
    sub_21774FBA4();
LABEL_5:
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return swift_endAccess();
  }
  v10 = *(_QWORD *)(v7 + 56) + 32 * v8;
  v11 = *(_QWORD *)(v10 + 8);
  *(_QWORD *)a3 = *(_QWORD *)v10;
  *(_QWORD *)(a3 + 8) = v11;
  *(_OWORD *)(a3 + 16) = *(_OWORD *)(v10 + 16);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_21774FBA4();
  return swift_endAccess();
}

void FeatureRegistry.__allocating_init(with:)()
{
  sub_217759310();
  sub_2177593F4();
  sub_2177592F8();
}

_QWORD *FeatureRegistry.init(with:)(uint64_t a1)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_217746620(&qword_254F00570);
  v1[2] = sub_217746684();
  type metadata accessor for Transformer();
  v1[3] = sub_217746684();
  v1[4] = sub_217746684();
  v3 = (char *)v1 + OBJC_IVAR____TtC28HumanUnderstandingFoundation15FeatureRegistry_baseDir;
  v4 = sub_2177466A4();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  v1[2] = sub_217755464();
  swift_bridgeObjectRelease();
  v6 = swift_bridgeObjectRetain();
  v7 = sub_217755818(v6);
  swift_bridgeObjectRelease();
  v1[3] = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21774FC0C();
  v8 = sub_217756788();
  v9 = sub_21775944C(v8);
  v10 = sub_2177569B0();
  v11 = sub_21775944C(v10);
  v12 = sub_217756BE0(v11, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  sub_217755178();
  v1[4] = v12;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_217755464()
{
  char *v0;
  uint64_t v1;
  char *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int64_t v7;
  int v8;
  int v9;
  char v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  int64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;

  if (qword_254F00258 != -1)
    goto LABEL_44;
  while (1)
  {
    v0 = (char *)MEMORY[0x24BEE4AF8];
    v35 = *(_QWORD *)(qword_254F00EF8 + 16);
    if (!v35)
      break;
    v34 = qword_254F00EF8 + 32;
    swift_bridgeObjectRetain_n();
    v1 = 0;
    v2 = v0;
    while (1)
    {
      v39 = *(_OWORD *)(v34 + 16 * v1);
      v3 = objc_msgSend((id)swift_unknownObjectRetain(), sel_featureNames);
      v4 = sub_21775E298();

      v5 = *(_QWORD *)(v4 + 16);
      if (v5)
        break;
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v6 = v0;
LABEL_15:
      v21 = *((_QWORD *)v6 + 2);
      v22 = *((_QWORD *)v2 + 2);
      v23 = v22 + v21;
      if (__OFADD__(v22, v21))
        goto LABEL_40;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || v23 > *((_QWORD *)v2 + 3) >> 1)
      {
        if (v22 <= v23)
          v25 = v22 + v21;
        else
          v25 = v22;
        v2 = sub_217756D90(isUniquelyReferenced_nonNull_native, v25, 1, (uint64_t)v2);
      }
      if (*((_QWORD *)v6 + 2))
      {
        v26 = *((_QWORD *)v2 + 2);
        if ((*((_QWORD *)v2 + 3) >> 1) - v26 < v21)
          goto LABEL_42;
        v27 = (unint64_t)&v2[32 * v26 + 32];
        v28 = (unint64_t)(v6 + 32);
        if (v28 < v27 + 32 * v21 && v27 < v28 + 32 * v21)
        {
          result = sub_21775E43C();
          __break(1u);
          return result;
        }
        sub_217746620(&qword_254F006A8);
        swift_arrayInitWithCopy();
        if (v21)
        {
          v30 = *((_QWORD *)v2 + 2);
          v31 = __OFADD__(v30, v21);
          v32 = v30 + v21;
          if (v31)
            goto LABEL_43;
          *((_QWORD *)v2 + 2) = v32;
        }
      }
      else if (v21)
      {
        goto LABEL_41;
      }
      ++v1;
      swift_bridgeObjectRelease();
      if (v1 == v35)
      {
        sub_2177593EC();
        return sub_2177565D4((uint64_t)v2, &qword_254F006B0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_217758434);
      }
    }
    v36 = v1;
    v37 = v2;
    sub_21775AB94();
    v6 = v0;
    v7 = sub_21775B014(v4);
    v9 = v8;
    v11 = v10 & 1;
    v38 = v4 + 56;
    while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(_BYTE *)(v4 + 32))
    {
      if (((*(_QWORD *)(v38 + (((unint64_t)v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        goto LABEL_38;
      if (*(_DWORD *)(v4 + 36) != v9)
        goto LABEL_39;
      v12 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v7);
      v40 = *v12;
      v13 = v4;
      v14 = v12[1];
      v16 = *((_QWORD *)v6 + 2);
      v15 = *((_QWORD *)v6 + 3);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      if (v16 >= v15 >> 1)
        sub_21775AB94();
      *((_QWORD *)v6 + 2) = v16 + 1;
      v17 = &v6[32 * v16];
      *((_QWORD *)v17 + 4) = v40;
      *((_QWORD *)v17 + 5) = v14;
      *((_OWORD *)v17 + 3) = v39;
      v18 = sub_21775AF30(v7, v9, v11 & 1, v13);
      v7 = v18;
      v9 = v19;
      v11 = v20 & 1;
      --v5;
      v4 = v13;
      if (!v5)
      {
        sub_21775912C(v18, v19, v20 & 1);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        v0 = (char *)MEMORY[0x24BEE4AF8];
        v1 = v36;
        v2 = v37;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    swift_once();
  }
  v2 = (char *)MEMORY[0x24BEE4AF8];
  return sub_2177565D4((uint64_t)v2, &qword_254F006B0, (void (*)(uint64_t, uint64_t, uint64_t *))sub_217758434);
}

uint64_t sub_217755818(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void (*v22)(unint64_t, uint64_t);
  id v23;
  void *v24;
  id v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, unint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char v51;
  BOOL v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t *v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  NSObject *v68;
  os_log_type_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  _BOOL8 v98;
  unint64_t v99;
  unint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  id v110;
  NSObject *v111;
  os_log_type_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  void (*v119)(uint64_t, uint64_t);
  uint64_t result;
  _QWORD v121[2];
  __int128 v122;
  char *v123;
  uint64_t v124;
  id v125;
  void (*v126)(char *, uint64_t);
  uint64_t v127;
  uint64_t v128;
  void (*v129)(unint64_t, uint64_t);
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  void (*v137)(char *, uint64_t, uint64_t);
  unint64_t v138;
  void *v139;
  char *v140;
  id v141;
  os_log_t v142;
  uint64_t v143;
  __int128 v144;
  uint64_t v145;
  char v146;
  id v147[2];

  v143 = a1;
  v147[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_217746620(&qword_253F2C9F0);
  MEMORY[0x24BDAC7A8](v2);
  v136 = (char *)v121 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2177466A4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  isUniquelyReferenced_nonNull_native = (unint64_t)v121 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v126 = (void (*)(char *, uint64_t))((char *)v121 - v10);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v133 = (char *)v121 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v121 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v121 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (uint64_t)v121 - v19;
  v124 = type metadata accessor for Transformer();
  v21 = (_QWORD *)sub_21775E1A8();
  v137 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v137(v18, v1 + OBJC_IVAR____TtC28HumanUnderstandingFoundation15FeatureRegistry_baseDir, v4);
  sub_21775E07C();
  v134 = v5;
  v22 = *(void (**)(unint64_t, uint64_t))(v5 + 8);
  sub_2177593CC((uint64_t)v18);
  v23 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v24 = (void *)sub_21775E064();
  v147[0] = 0;
  v25 = objc_msgSend(v23, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v24, 0, 1, v147);

  v26 = v147[0];
  v27 = (unint64_t)&loc_21775E000;
  v130 = v4;
  v129 = v22;
  if (!v25)
  {
    v106 = v147[0];
    v4 = sub_21775E040();

    swift_willThrow();
    if (qword_254F00250 != -1)
      goto LABEL_103;
    goto LABEL_91;
  }
  v28 = sub_21775E250();
  v29 = v26;

  v132 = *(_QWORD *)(v28 + 16);
  v135 = v28;
  if (!v132)
  {
    v33 = (uint64_t)v136;
    goto LABEL_94;
  }
  v31 = 0;
  v139 = 0;
  v32 = v134;
  v131 = v28 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
  v123 = &v146;
  *(_QWORD *)&v30 = 136315394;
  v122 = v30;
  v121[1] = MEMORY[0x24BEE4AD8] + 8;
  v33 = (uint64_t)v136;
  v34 = (void (*)(uint64_t, unint64_t, uint64_t))v137;
  v128 = v20;
  v140 = v15;
LABEL_4:
  if (v31 >= *(_QWORD *)(v135 + 16))
    goto LABEL_102;
  v35 = *(_QWORD *)(v32 + 72);
  v138 = v31;
  v34(v33, v131 + v35 * v31, v4);
  sub_2177593E0(v33, 0);
  if (sub_217759120(v33, 1, v4) == 1)
    goto LABEL_95;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 32))(v15, v33, v4);
  sub_217746728(0, &qword_254F00680);
  v36 = (uint64_t)v133;
  v34((uint64_t)v133, (unint64_t)v15, v4);
  v37 = v139;
  v38 = sub_217756674(v36);
  if (v37)
  {
    sub_2177593CC((uint64_t)v15);

    v139 = 0;
    goto LABEL_88;
  }
  v139 = 0;
  v141 = v38;
  v39 = objc_msgSend(v38, sel_modelDescription);
  v40 = objc_msgSend(v39, sel_inputDescriptionsByName);

  v127 = sub_217746728(0, (unint64_t *)&qword_254F00560);
  v41 = sub_21775E19C();

  v20 = 0;
  v42 = v41 + 64;
  sub_217759260();
  v4 = v44 & v43;
  v142 = (os_log_t)((unint64_t)(v45 + 63) >> 6);
  v46 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v47 = v143;
    if (v4)
    {
      v48 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v49 = v48 | (v20 << 6);
      goto LABEL_36;
    }
    if (__OFADD__(v20, 1))
    {
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
LABEL_102:
      __break(1u);
LABEL_103:
      swift_once();
LABEL_91:
      v107 = sub_21775E10C();
      sub_2177462A0(v107, (uint64_t)qword_254F00EE0);
      v108 = v130;
      v137((char *)isUniquelyReferenced_nonNull_native, v20, v130);
      v109 = (id)v4;
      v110 = (id)v4;
      v111 = sub_21775E0F4();
      v112 = sub_21775E2BC();
      if (os_log_type_enabled(v111, v112))
      {
        v113 = sub_217759354();
        v128 = v20;
        v114 = v113;
        *(_QWORD *)&v144 = sub_217759354();
        v147[0] = (id)v144;
        *(_DWORD *)v114 = *(_QWORD *)(v27 + 3688);
        sub_2177590D4();
        v115 = sub_21775E460();
        v145 = sub_217759290(v115, v116);
        sub_217759300();
        sub_2177466E8();
        v129(isUniquelyReferenced_nonNull_native, v108);
        *(_WORD *)(v114 + 12) = 2080;
        swift_getErrorValue();
        v117 = sub_21775E490();
        v145 = sub_217759290(v117, v118);
        sub_217759300();
        sub_2177466E8();
        sub_217759210();
        sub_217759210();
        _os_log_impl(&dword_217744000, v111, v112, "Could not enumerate files in directory: %s with error: %s", (uint8_t *)v114, 0x16u);
        swift_arrayDestroy();
        sub_217747834();
      }

      sub_217759210();
      sub_217759210();
      v119 = (void (*)(uint64_t, uint64_t))v129;
      v129(isUniquelyReferenced_nonNull_native, v108);
      sub_217759210();
      v119(v20, v108);
      return (uint64_t)v21;
    }
    sub_217759428();
    if (v51 == v52)
      goto LABEL_49;
    v53 = *(_QWORD *)(v42 + 8 * v50);
    v20 = v50;
    if (!v53)
    {
      v20 = v50 + 1;
      sub_21775933C();
      if (v51 == v52)
        goto LABEL_49;
      v53 = *(_QWORD *)(v42 + 8 * v20);
      if (!v53)
      {
        v20 = v54 + 2;
        sub_21775933C();
        if (v51 == v52)
          goto LABEL_49;
        v53 = *(_QWORD *)(v42 + 8 * v20);
        if (!v53)
        {
          v20 = v55 + 3;
          sub_21775933C();
          if (v51 == v52)
            goto LABEL_49;
          v53 = *(_QWORD *)(v42 + 8 * v20);
          if (!v53)
          {
            v20 = v56 + 4;
            sub_21775933C();
            if (v51 == v52)
              goto LABEL_49;
            v53 = *(_QWORD *)(v42 + 8 * v20);
            if (!v53)
              break;
          }
        }
      }
    }
LABEL_35:
    v4 = (v53 - 1) & v53;
    v49 = __clz(__rbit64(v53)) + (v20 << 6);
LABEL_36:
    v59 = (unint64_t *)(*(_QWORD *)(v41 + 48) + 16 * v49);
    isUniquelyReferenced_nonNull_native = *v59;
    v27 = v59[1];
    v60 = *(_QWORD *)(v47 + 16);
    sub_2177592F0();
    if (!v60)
      goto LABEL_44;
    sub_2177592F0();
    v61 = sub_21774D218(isUniquelyReferenced_nonNull_native, v27);
    if ((v62 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_44:
      if (qword_254F00250 != -1)
        swift_once();
      v66 = sub_21775E10C();
      sub_2177462A0(v66, (uint64_t)qword_254F00EE0);
      v67 = v126;
      v4 = v130;
      v137((char *)v126, (uint64_t)v140, v130);
      sub_2177592F0();
      v68 = sub_21775E0F4();
      v69 = sub_21775E2BC();
      v70 = v69;
      if (os_log_type_enabled(v68, v69))
      {
        v71 = sub_217759354();
        v142 = v68;
        v72 = v71;
        *(_QWORD *)&v144 = sub_217759354();
        v147[0] = (id)v144;
        *(_DWORD *)v72 = v122;
        v125 = (id)(v72 + 4);
        sub_2177590D4();
        LODWORD(v127) = v70;
        v73 = sub_21775E460();
        v145 = sub_217759290(v73, v74);
        sub_21775E31C();
        sub_2177466E8();
        sub_21775927C();
        *(_WORD *)(v72 + 12) = 2080;
        sub_2177592F0();
        v145 = sub_21774CA64(isUniquelyReferenced_nonNull_native, v27, (uint64_t *)v147);
        sub_21775E31C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_217744000, v142, (os_log_type_t)v127, "Could not find corresponding Signal for Transformer: %s with input: %s", (uint8_t *)v72, 0x16u);
        swift_arrayDestroy();
        sub_217747834();
      }
      sub_2177593EC();

      sub_21775927C();
      swift_bridgeObjectRelease();
      sub_2177592C8();

      v15 = v140;
LABEL_87:
      v67(v15, v4);
      v20 = v128;
LABEL_88:
      v34 = (void (*)(uint64_t, unint64_t, uint64_t))v137;
      v31 = v138 + 1;
      v33 = (uint64_t)v136;
      v32 = v134;
      if (v138 + 1 == v132)
      {
LABEL_94:
        sub_2177593E0(v33, 1);
LABEL_95:
        swift_bridgeObjectRelease();
        sub_2177593CC(v20);
        return (uint64_t)v21;
      }
      goto LABEL_4;
    }
    v144 = *(_OWORD *)(*(_QWORD *)(v47 + 56) + 16 * v61);
    swift_unknownObjectRetain_n();
    sub_2177593EC();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2177593D4(0, *(_QWORD *)(v46 + 16) + 1);
      v46 = v64;
    }
    isUniquelyReferenced_nonNull_native = *(_QWORD *)(v46 + 16);
    v63 = *(_QWORD *)(v46 + 24);
    if (isUniquelyReferenced_nonNull_native >= v63 >> 1)
    {
      sub_2177593D4(v63 > 1, isUniquelyReferenced_nonNull_native + 1);
      v46 = v65;
    }
    *(_QWORD *)(v46 + 16) = isUniquelyReferenced_nonNull_native + 1;
    *(_OWORD *)(v46 + 16 * isUniquelyReferenced_nonNull_native + 32) = v144;
    swift_unknownObjectRelease();
  }
  sub_217759428();
  if (v51 != v52)
  {
    v53 = *(_QWORD *)(v42 + 8 * v57);
    if (!v53)
    {
      while (1)
      {
        v20 = v57 + 1;
        if (__OFADD__(v57, 1))
          break;
        sub_21775933C();
        if (v51 == v52)
          goto LABEL_49;
        v53 = *(_QWORD *)(v42 + 8 * v20);
        v57 = v58 + 1;
        if (v53)
          goto LABEL_35;
      }
      __break(1u);
LABEL_105:
      __break(1u);
    }
    v20 = v57;
    goto LABEL_35;
  }
LABEL_49:
  sub_2177592C8();
  sub_217747874();
  v75 = v141;
  v76 = sub_21775CE80(v75, v46);
  v125 = v75;
  v77 = objc_msgSend(v75, sel_modelDescription);
  v78 = objc_msgSend(v77, sel_outputDescriptionsByName);

  v79 = sub_21775E19C();
  v4 = 0;
  v141 = (id)(v79 + 64);
  *(_QWORD *)&v144 = v79;
  sub_217759260();
  v82 = v81 & v80;
  v142 = (os_log_t)((unint64_t)(v83 + 63) >> 6);
  if ((v81 & v80) != 0)
  {
LABEL_50:
    v84 = __clz(__rbit64(v82));
    v82 &= v82 - 1;
    v85 = v84 | (v4 << 6);
    goto LABEL_76;
  }
  while (2)
  {
    if (__OFADD__(v4, 1))
      goto LABEL_101;
    sub_217759428();
    v15 = v140;
    if (v51 == v52)
      goto LABEL_86;
    v87 = *((_QWORD *)v141 + v86);
    v4 = v86;
    if (!v87)
    {
      v4 = v86 + 1;
      sub_217759348();
      if (v51 == v52)
        goto LABEL_86;
      sub_217759320();
      if (!v87)
      {
        v4 = v88 + 2;
        sub_217759348();
        if (v51 == v52)
          goto LABEL_86;
        sub_217759320();
        if (!v87)
        {
          v4 = v89 + 3;
          sub_217759348();
          if (v51 == v52)
            goto LABEL_86;
          sub_217759320();
          if (!v87)
          {
            v4 = v90 + 4;
            sub_217759348();
            if (v51 == v52)
              goto LABEL_86;
            sub_217759320();
            if (!v87)
            {
              sub_217759428();
              if (v51 == v52)
              {
LABEL_86:

                sub_2177592C8();
                swift_release();
                v4 = v130;
                v67 = (void (*)(char *, uint64_t))v129;
                goto LABEL_87;
              }
              v87 = *((_QWORD *)v141 + v91);
              if (!v87)
              {
                while (1)
                {
                  v4 = v91 + 1;
                  if (__OFADD__(v91, 1))
                    goto LABEL_105;
                  sub_217759348();
                  if (v51 == v52)
                    goto LABEL_86;
                  sub_217759320();
                  v91 = v92 + 1;
                  if (v87)
                    goto LABEL_75;
                }
              }
              v4 = v91;
            }
          }
        }
      }
    }
LABEL_75:
    v82 = (v87 - 1) & v87;
    v85 = __clz(__rbit64(v87)) + (v4 << 6);
LABEL_76:
    v93 = (uint64_t *)(*(_QWORD *)(v144 + 48) + 16 * v85);
    v94 = *v93;
    v20 = v93[1];
    sub_21774FC0C();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v147[0] = v21;
    v95 = sub_21774D218(v94, v20);
    v97 = v21[2];
    v98 = (v96 & 1) == 0;
    v21 = (_QWORD *)(v97 + v98);
    if (__OFADD__(v97, v98))
    {
      __break(1u);
LABEL_99:
      __break(1u);
      goto LABEL_100;
    }
    v99 = v95;
    v27 = v96;
    sub_217746620(&qword_254F00688);
    if ((sub_21775E3D0() & 1) == 0)
    {
LABEL_80:
      v21 = v147[0];
      if ((v27 & 1) != 0)
      {
        v102 = *((_QWORD *)v147[0] + 7);
        swift_release();
        *(_QWORD *)(v102 + 8 * v99) = v76;
      }
      else
      {
        *((_QWORD *)v147[0] + (v99 >> 6) + 8) |= 1 << v99;
        v103 = (uint64_t *)(v21[6] + 16 * v99);
        *v103 = v94;
        v103[1] = v20;
        *(_QWORD *)(v21[7] + 8 * v99) = v76;
        v104 = v21[2];
        v52 = __OFADD__(v104, 1);
        v105 = v104 + 1;
        if (v52)
          goto LABEL_99;
        v21[2] = v105;
        sub_21774FC0C();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v82)
        goto LABEL_50;
      continue;
    }
    break;
  }
  v100 = sub_21774D218(v94, v20);
  if ((v27 & 1) == (v101 & 1))
  {
    v99 = v100;
    goto LABEL_80;
  }
  result = sub_21775E484();
  __break(1u);
  return result;
}

uint64_t FeatureRegistry.featureNames.getter()
{
  uint64_t v0;

  sub_217755178();
  v0 = swift_bridgeObjectRetain();
  return sub_21774C6D8(v0);
}

uint64_t sub_2177565D4(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_217746620(a2);
    v4 = sub_21775E430();
  }
  else
  {
    v4 = MEMORY[0x24BEE4B00];
  }
  v7 = v4;
  v5 = sub_21774FB64();
  a3(v5, 1, &v7);
  sub_21774FBA4();
  return v7;
}

id sub_217756674(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;
  uint64_t v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = (void *)sub_21775E064();
  v11[0] = 0;
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_error_, v2, v11);

  v4 = v11[0];
  if (v3)
  {
    v5 = sub_21775E0A0();
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
    v7 = v4;
    v6(a1, v5);
  }
  else
  {
    v8 = v11[0];
    sub_21775E040();

    swift_willThrow();
    v9 = sub_21775E0A0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_217756788()
{
  uint64_t v0;
  int64_t v1;
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v19[5];
  int64_t v20;

  sub_21774EE3C(v19);
  v0 = v19[0];
  v18 = v19[1];
  v1 = v19[3];
  v2 = v19[4];
  v20 = (unint64_t)(v19[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  v4 = MEMORY[0x24BEE4AF8];
  if (!v2)
    goto LABEL_3;
LABEL_2:
  v5 = __clz(__rbit64(v2));
  v2 &= v2 - 1;
  v6 = v5 | (v1 << 6);
  while (1)
  {
    v11 = (uint64_t *)(*(_QWORD *)(v0 + 48) + 16 * v6);
    v13 = *v11;
    v12 = v11[1];
    v14 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 8 * v6);
    swift_bridgeObjectRetain_n();
    swift_retain();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_217757004(0, *(_QWORD *)(v4 + 16) + 1, 1, v4);
      v4 = result;
    }
    v16 = *(_QWORD *)(v4 + 16);
    v15 = *(_QWORD *)(v4 + 24);
    if (v16 >= v15 >> 1)
    {
      result = (uint64_t)sub_217757004((char *)(v15 > 1), v16 + 1, 1, v4);
      v4 = result;
    }
    *(_QWORD *)(v4 + 16) = v16 + 1;
    v17 = (_QWORD *)(v4 + 48 * v16);
    v17[4] = v13;
    v17[5] = v12;
    v17[6] = v13;
    v17[7] = v12;
    v17[8] = v14;
    v17[9] = &protocol witness table for Transformer;
    if (v2)
      goto LABEL_2;
LABEL_3:
    v7 = v1 + 1;
    if (__OFADD__(v1, 1))
      break;
    if (v7 >= v20)
      goto LABEL_25;
    v8 = *(_QWORD *)(v18 + 8 * v7);
    v9 = v1 + 1;
    if (!v8)
    {
      v9 = v1 + 2;
      if (v1 + 2 >= v20)
        goto LABEL_25;
      v8 = *(_QWORD *)(v18 + 8 * v9);
      if (!v8)
      {
        v9 = v1 + 3;
        if (v1 + 3 >= v20)
          goto LABEL_25;
        v8 = *(_QWORD *)(v18 + 8 * v9);
        if (!v8)
        {
          v9 = v1 + 4;
          if (v1 + 4 >= v20)
            goto LABEL_25;
          v8 = *(_QWORD *)(v18 + 8 * v9);
          if (!v8)
          {
            v9 = v1 + 5;
            if (v1 + 5 >= v20)
              goto LABEL_25;
            v8 = *(_QWORD *)(v18 + 8 * v9);
            if (!v8)
            {
              v10 = v1 + 6;
              while (v10 < v20)
              {
                v8 = *(_QWORD *)(v18 + 8 * v10++);
                if (v8)
                {
                  v9 = v10 - 1;
                  goto LABEL_18;
                }
              }
LABEL_25:
              swift_release();
              return v4;
            }
          }
        }
      }
    }
LABEL_18:
    v2 = (v8 - 1) & v8;
    v6 = __clz(__rbit64(v8)) + (v9 << 6);
    v1 = v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_2177569B0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  int64_t v20;
  _QWORD v21[5];
  int64_t v22;

  sub_21774EE3C(v21);
  v0 = v21[0];
  v22 = v21[3];
  v1 = v21[4];
  v19 = v21[1];
  v20 = (unint64_t)(v21[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  v3 = MEMORY[0x24BEE4AF8];
  if (!v1)
    goto LABEL_3;
LABEL_2:
  v4 = __clz(__rbit64(v1));
  v1 &= v1 - 1;
  v5 = v4 | (v22 << 6);
  while (1)
  {
    v10 = (uint64_t *)(*(_QWORD *)(v0 + 48) + 16 * v5);
    v12 = *v10;
    v11 = v10[1];
    v13 = (uint64_t *)(*(_QWORD *)(v0 + 56) + 16 * v5);
    v14 = *v13;
    v15 = *(_QWORD *)(v13[1] + 8);
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_217757004(0, *(_QWORD *)(v3 + 16) + 1, 1, v3);
      v3 = result;
    }
    v17 = *(_QWORD *)(v3 + 16);
    v16 = *(_QWORD *)(v3 + 24);
    if (v17 >= v16 >> 1)
    {
      result = (uint64_t)sub_217757004((char *)(v16 > 1), v17 + 1, 1, v3);
      v3 = result;
    }
    *(_QWORD *)(v3 + 16) = v17 + 1;
    v18 = (_QWORD *)(v3 + 48 * v17);
    v18[4] = v12;
    v18[5] = v11;
    v18[6] = v12;
    v18[7] = v11;
    v18[8] = v14;
    v18[9] = v15;
    if (v1)
      goto LABEL_2;
LABEL_3:
    v6 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v6 >= v20)
      goto LABEL_25;
    v7 = *(_QWORD *)(v19 + 8 * v6);
    v8 = v22 + 1;
    if (!v7)
    {
      v8 = v22 + 2;
      if (v22 + 2 >= v20)
        goto LABEL_25;
      v7 = *(_QWORD *)(v19 + 8 * v8);
      if (!v7)
      {
        v8 = v22 + 3;
        if (v22 + 3 >= v20)
          goto LABEL_25;
        v7 = *(_QWORD *)(v19 + 8 * v8);
        if (!v7)
        {
          v8 = v22 + 4;
          if (v22 + 4 >= v20)
            goto LABEL_25;
          v7 = *(_QWORD *)(v19 + 8 * v8);
          if (!v7)
          {
            v8 = v22 + 5;
            if (v22 + 5 >= v20)
              goto LABEL_25;
            v7 = *(_QWORD *)(v19 + 8 * v8);
            if (!v7)
            {
              v9 = v22 + 6;
              while (v9 < v20)
              {
                v7 = *(_QWORD *)(v19 + 8 * v9++);
                if (v7)
                {
                  v8 = v9 - 1;
                  goto LABEL_18;
                }
              }
LABEL_25:
              swift_release();
              return v3;
            }
          }
        }
      }
    }
LABEL_18:
    v1 = (v7 - 1) & v7;
    v5 = __clz(__rbit64(v7)) + (v8 << 6);
    v22 = v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_217756BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_217758718(a1, (uint64_t)sub_21775909C, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

void FeatureRegistry.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC28HumanUnderstandingFoundation15FeatureRegistry_baseDir;
  v2 = sub_2177466A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_2177592F8();
}

uint64_t FeatureRegistry.__deallocating_deinit()
{
  FeatureRegistry.deinit();
  return swift_deallocClassInstance();
}

void sub_217756CD4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if ((a3 & 1) != 0)
  {
    sub_2177592E0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_217746694();
    }
  }
  sub_2177592D0();
  if (v5)
  {
    sub_217746620(&qword_253F2C9E8);
    v11 = sub_217747874();
    v12 = j__malloc_size((const void *)v11);
    *(_QWORD *)(v11 + 16) = v4;
    *(_QWORD *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 8);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_21775766C((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(_QWORD *)(a4 + 16) = 0;
    sub_21774FBA4();
  }
  else
  {
    v13 = sub_21775932C();
    sub_2177570F8(v13, v14, v15, v16);
  }
  sub_217759440();
}

char *sub_217756D90(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_217746620(&qword_254F006C0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_217757804((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21775720C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

void sub_217756E7C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if ((a3 & 1) != 0)
  {
    sub_2177592E0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_217746694();
    }
  }
  sub_2177592D0();
  if (v5)
  {
    sub_217746620(&qword_254F00698);
    v11 = sub_217747874();
    v12 = j__malloc_size((const void *)v11);
    *(_QWORD *)(v11 + 16) = v4;
    *(_QWORD *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_217757748((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(_QWORD *)(a4 + 16) = 0;
    sub_21774FBA4();
  }
  else
  {
    v13 = sub_21775932C();
    sub_217757320(v13, v14, v15, v16);
  }
}

void sub_217756F48(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if ((a3 & 1) != 0)
  {
    sub_2177592E0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_217746694();
    }
  }
  sub_2177592D0();
  if (v5)
  {
    sub_217746620(&qword_254F00558);
    v11 = sub_217747874();
    v12 = j__malloc_size((const void *)v11);
    *(_QWORD *)(v11 + 16) = v4;
    *(_QWORD *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_2177576F0((char *)(a4 + 32), v4, (char *)(v11 + 32));
    *(_QWORD *)(a4 + 16) = 0;
    sub_21774FBA4();
  }
  else
  {
    v13 = sub_21775932C();
    sub_21775743C(v13, v14, v15, v16);
  }
  sub_217759440();
}

char *sub_217757004(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_217746620(&qword_254F00668);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_2177577A8((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_217757550(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_2177570F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_217746620(&qword_253F2C9B0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_21775E43C();
  __break(1u);
  return result;
}

uint64_t sub_21775720C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      sub_217746620(&qword_254F006A8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_21775E43C();
  __break(1u);
  return result;
}

uint64_t sub_217757320(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      sub_217746620(&qword_254F006A0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_21775E43C();
  __break(1u);
  return result;
}

uint64_t sub_21775743C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_217746620(&qword_254F00570);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_21775E43C();
  __break(1u);
  return result;
}

uint64_t sub_217757550(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      sub_217746620(&qword_254F00670);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_21775E43C();
  __break(1u);
  return result;
}

char *sub_21775766C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_21775E43C();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_2177576F0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2177466F0();
    result = (char *)sub_2177591C8();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_2177591B8(a3, result);
  }
  return result;
}

char *sub_217757748(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2177466F0();
    result = (char *)sub_2177591C8();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)sub_2177591B8(a3, result);
  }
  return result;
}

char *sub_2177577A8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2177466F0();
    result = (char *)sub_2177591C8();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)sub_2177591B8(a3, result);
  }
  return result;
}

char *sub_217757804(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2177466F0();
    result = (char *)sub_2177591C8();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)sub_2177591B8(a3, result);
  }
  return result;
}

uint64_t sub_217757858()
{
  return type metadata accessor for FeatureRegistry();
}

uint64_t type metadata accessor for FeatureRegistry()
{
  uint64_t result;

  result = qword_254F005B8;
  if (!qword_254F005B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_217757898()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21775E0A0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FeatureRegistry()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeatureRegistry.__allocating_init(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_21775792C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  _QWORD *v31;
  _BYTE v32[32];

  v6 = v2;
  sub_2177593B8();
  sub_217746620(&qword_254F00450);
  v8 = sub_21775E424();
  if (*(_QWORD *)(v3 + 16))
  {
    sub_2177592B0();
    v31 = v9;
    sub_217759240();
    v30 = v10;
    sub_217759434();
    v11 = 0;
    if (!v5)
      goto LABEL_4;
LABEL_3:
    sub_217759414();
    for (i = v12 | (v11 << 6); ; i = v17 + (v11 << 6))
    {
      v18 = *(_QWORD *)(v3 + 56) + 32 * i;
      if ((a2 & 1) != 0)
      {
        sub_217759138(v18, (uint64_t)v32, &qword_254F003C0);
      }
      else
      {
        sub_21774C9D8(v18, (uint64_t)v32);
        swift_bridgeObjectRetain();
      }
      sub_21775E4A8();
      sub_21775935C();
      sub_21775E4C0();
      sub_217759220();
      if (v19)
      {
        sub_217759390();
        while (++v22 != v23 || (v21 & 1) == 0)
        {
          v24 = v22 == v23;
          if (v22 == v23)
            v22 = 0;
          v21 |= v24;
          if (*(_QWORD *)(v4 + 8 * v22) != -1)
          {
            sub_217759368();
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return;
      }
      sub_2177593A4();
LABEL_28:
      sub_2177591E0(v20);
      sub_217759138((uint64_t)v32, v26 + 32 * v25, &qword_254F003C0);
      ++*(_QWORD *)(v8 + 16);
      if (v5)
        goto LABEL_3;
LABEL_4:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_39;
      if (v14 >= v30)
        break;
      v15 = v31;
      ++v11;
      if (!v31[v14])
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v30)
          goto LABEL_30;
        if (!v31[v11])
        {
          v16 = v14 + 2;
          if (v16 >= v30)
          {
LABEL_30:
            sub_217759218();
            if ((a2 & 1) == 0)
              goto LABEL_37;
            goto LABEL_33;
          }
          if (!v31[v16])
          {
            while (1)
            {
              v11 = v16 + 1;
              if (__OFADD__(v16, 1))
                goto LABEL_40;
              if (v11 >= v30)
                goto LABEL_30;
              ++v16;
              if (v31[v11])
                goto LABEL_15;
            }
          }
          v11 = v16;
        }
      }
LABEL_15:
      sub_217759400();
    }
    sub_217759218();
    v15 = v31;
    if ((a2 & 1) == 0)
      goto LABEL_37;
LABEL_33:
    sub_21775937C();
    if (v28 != v29)
      *v15 = -1 << v27;
    else
      sub_21775929C(v27);
    *(_QWORD *)(v3 + 16) = 0;
  }
LABEL_37:
  sub_217759218();
  *v6 = v8;
}

uint64_t sub_217757B60(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  sub_217746620(&qword_254F006B0);
  v36 = a2;
  v6 = sub_21775E424();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v2;
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  if (!v10)
    goto LABEL_7;
LABEL_6:
  v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v19)) + (v14 << 6))
  {
    v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v23 = *v21;
    v22 = v21[1];
    v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * i);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_21775E4A8();
    sub_21775E214();
    result = sub_21775E4C0();
    v24 = -1 << *(_BYTE *)(v7 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) == 0)
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v26);
        if (v31 != -1)
        {
          v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    v32 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v27);
    *v32 = v23;
    v32[1] = v22;
    *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v27) = v37;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v17 = v14 + 1;
    if (__OFADD__(v14, 1))
      goto LABEL_41;
    if (v17 >= v11)
    {
      swift_release();
      v3 = v34;
      v18 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v35 + 8 * v17);
    ++v14;
    if (!v19)
    {
      v14 = v17 + 1;
      if (v17 + 1 >= v11)
        goto LABEL_32;
      v19 = *(_QWORD *)(v35 + 8 * v14);
      if (!v19)
        break;
    }
LABEL_18:
    v10 = (v19 - 1) & v19;
  }
  v20 = v17 + 2;
  if (v20 < v11)
  {
    v19 = *(_QWORD *)(v35 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        v14 = v20 + 1;
        if (__OFADD__(v20, 1))
          goto LABEL_42;
        if (v14 >= v11)
          goto LABEL_32;
        v19 = *(_QWORD *)(v35 + 8 * v14);
        ++v20;
        if (v19)
          goto LABEL_18;
      }
    }
    v14 = v20;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  v3 = v34;
LABEL_34:
  if ((v36 & 1) != 0)
  {
    v33 = 1 << *(_BYTE *)(v5 + 32);
    if (v33 >= 64)
      sub_21774D430(0, (unint64_t)(v33 + 63) >> 6, v18);
    else
      *v18 = -1 << v33;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_217757E60(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  _QWORD *v31;
  char v32;

  v6 = v2;
  sub_2177593B8();
  sub_217746620(&qword_254F00690);
  v32 = a2;
  v8 = sub_21775E424();
  if (!*(_QWORD *)(v3 + 16))
    goto LABEL_36;
  sub_2177592B0();
  v31 = v9;
  sub_217759240();
  v30 = v10;
  sub_217759434();
  v11 = 0;
  if (!v5)
    goto LABEL_4;
LABEL_3:
  sub_217759414();
  for (i = v12 | (v11 << 6); ; i = v17 + (v11 << 6))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * i);
    if ((v32 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_21775E4A8();
    sub_21775935C();
    sub_21775E4C0();
    sub_217759220();
    if (v19)
    {
      sub_217759390();
      while (++v22 != v23 || (v21 & 1) == 0)
      {
        v24 = v22 == v23;
        if (v22 == v23)
          v22 = 0;
        v21 |= v24;
        if (*(_QWORD *)(v4 + 8 * v22) != -1)
        {
          sub_217759368();
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return;
    }
    sub_2177593A4();
LABEL_27:
    sub_2177591E0(v20);
    *(_QWORD *)(v26 + 8 * v25) = v18;
    ++*(_QWORD *)(v8 + 16);
    if (v5)
      goto LABEL_3;
LABEL_4:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_38;
    if (v14 >= v30)
    {
      sub_217759218();
      v15 = v31;
      goto LABEL_31;
    }
    v15 = v31;
    ++v11;
    if (!v31[v14])
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_29;
      if (!v31[v11])
        break;
    }
LABEL_15:
    sub_217759400();
  }
  v16 = v14 + 2;
  if (v16 < v30)
  {
    if (!v31[v16])
    {
      while (1)
      {
        v11 = v16 + 1;
        if (__OFADD__(v16, 1))
          goto LABEL_39;
        if (v11 >= v30)
          goto LABEL_29;
        ++v16;
        if (v31[v11])
          goto LABEL_15;
      }
    }
    v11 = v16;
    goto LABEL_15;
  }
LABEL_29:
  sub_217759218();
LABEL_31:
  if ((v32 & 1) != 0)
  {
    sub_21775937C();
    if (v28 != v29)
      *v15 = -1 << v27;
    else
      sub_21775929C(v27);
    *(_QWORD *)(v3 + 16) = 0;
  }
LABEL_36:
  sub_217759218();
  *v6 = v8;
}

uint64_t sub_21775807C(uint64_t a1, char a2)
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
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  char v38;
  __int128 v39;

  v3 = v2;
  v5 = *v2;
  sub_217746620(&qword_254F00660);
  v38 = a2;
  v6 = sub_21775E424();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v37 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
      v21 = *v19;
      v20 = v19[1];
      v22 = *(_QWORD *)(v5 + 56) + 32 * i;
      v23 = *(_QWORD *)v22;
      v39 = *(_OWORD *)(v22 + 8);
      v24 = *(_QWORD *)(v22 + 24);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
      }
      sub_21775E4A8();
      sub_21775E214();
      result = sub_21775E4C0();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) == 0)
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v25) >> 6;
        while (++v27 != v30 || (v29 & 1) == 0)
        {
          v31 = v27 == v30;
          if (v27 == v30)
            v27 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v11 + 8 * v27);
          if (v32 != -1)
          {
            v28 = __clz(__rbit64(~v32)) + (v27 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      v33 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v28);
      *v33 = v21;
      v33[1] = v20;
      v34 = *(_QWORD *)(v7 + 56) + 32 * v28;
      *(_QWORD *)v34 = v23;
      *(_OWORD *)(v34 + 8) = v39;
      *(_QWORD *)(v34 + 24) = v24;
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_39;
      if (v16 >= v36)
        goto LABEL_32;
      v17 = v37[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v36)
          goto LABEL_32;
        v17 = v37[v13];
        if (!v17)
        {
          v18 = v16 + 2;
          if (v18 >= v36)
          {
LABEL_32:
            swift_release();
            v3 = v2;
            if ((v38 & 1) != 0)
            {
              v35 = 1 << *(_BYTE *)(v5 + 32);
              if (v35 >= 64)
                sub_21774D430(0, (unint64_t)(v35 + 63) >> 6, v37);
              else
                *v37 = -1 << v35;
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          v17 = v37[v18];
          if (!v17)
          {
            while (1)
            {
              v13 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_40;
              if (v13 >= v36)
                goto LABEL_32;
              v17 = v37[v13];
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          v13 = v18;
        }
      }
LABEL_18:
      v10 = (v17 - 1) & v17;
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2177583A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21774C9D8(a4, a1);
  sub_21774FB64();
  return a2;
}

uint64_t sub_2177583DC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *a1 = a4;
  a1[1] = a5;
  a1[2] = a6;
  a1[3] = a7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a2;
}

void sub_217758434(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  _OWORD *i;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v25;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  for (i = (_OWORD *)(swift_bridgeObjectRetain() + 48); ; i += 2)
  {
    v7 = *((_QWORD *)i - 2);
    v6 = *((_QWORD *)i - 1);
    v25 = *i;
    v8 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v10 = sub_21774D218(v7, v6);
    v11 = v8[2];
    v12 = (v9 & 1) == 0;
    v13 = v11 + v12;
    if (__OFADD__(v11, v12))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_21775E484();
      __break(1u);
      goto LABEL_20;
    }
    v14 = v9;
    if (v8[3] < v13)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v9 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      sub_217746620(&qword_254F006B8);
      sub_21775E3DC();
      if ((v14 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v17 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    v18 = (uint64_t *)(v17[6] + 16 * v10);
    *v18 = v7;
    v18[1] = v6;
    *(_OWORD *)(v17[7] + 16 * v10) = v25;
    v19 = v17[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_18;
    v17[2] = v21;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_217757B60(v13, a2 & 1);
  v15 = sub_21774D218(v7, v6);
  if ((v14 & 1) != (v16 & 1))
    goto LABEL_19;
  v10 = v15;
  if ((v14 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v22 = (void *)swift_allocError();
  swift_willThrow();
  v23 = v22;
  sub_217746620(&qword_254F00460);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_20:
  sub_21775E358();
  sub_21775E220();
  sub_21775E3C4();
  sub_21775E220();
  sub_21775E400();
  __break(1u);
}

uint64_t sub_217758718(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t result;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[3];
  uint64_t v42;

  sub_217758CA8(a1, a2, a3, v41);
  v37 = v41[0];
  v38 = v41[1];
  v39 = v41[2];
  v40 = v42;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_217758EC0(&v33);
  v7 = *((_QWORD *)&v33 + 1);
  if (*((_QWORD *)&v33 + 1))
  {
    while (1)
    {
      v8 = v33;
      v9 = v34;
      v10 = v35;
      v32 = v36;
      v11 = (_QWORD *)*a5;
      v13 = sub_21774D218(v33, v7);
      v14 = v11[2];
      v15 = (v12 & 1) == 0;
      v16 = v14 + v15;
      if (__OFADD__(v14, v15))
        break;
      v17 = v12;
      if (v11[3] >= v16)
      {
        if ((a4 & 1) == 0)
        {
          sub_217746620(&qword_254F00658);
          sub_21775E3DC();
        }
      }
      else
      {
        sub_21775807C(v16, a4 & 1);
        v18 = sub_21774D218(v8, v7);
        if ((v17 & 1) != (v19 & 1))
          goto LABEL_16;
        v13 = v18;
      }
      v20 = (_QWORD *)*a5;
      if ((v17 & 1) != 0)
      {
        v21 = v20[7] + 32 * v13;
        v23 = *(_QWORD *)v21;
        v22 = *(_QWORD *)(v21 + 8);
        swift_bridgeObjectRetain();
        v31 = *(_OWORD *)(v21 + 16);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        v24 = v20[7] + 32 * v13;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        *(_QWORD *)v24 = v23;
        *(_QWORD *)(v24 + 8) = v22;
        *(_OWORD *)(v24 + 16) = v31;
      }
      else
      {
        v20[(v13 >> 6) + 8] |= 1 << v13;
        v25 = (uint64_t *)(v20[6] + 16 * v13);
        *v25 = v8;
        v25[1] = v7;
        v26 = v20[7] + 32 * v13;
        *(_QWORD *)v26 = v9;
        *(_QWORD *)(v26 + 8) = v10;
        *(_OWORD *)(v26 + 16) = v32;
        v27 = v20[2];
        v28 = __OFADD__(v27, 1);
        v29 = v27 + 1;
        if (v28)
          goto LABEL_15;
        v20[2] = v29;
      }
      sub_217758EC0(&v33);
      v7 = *((_QWORD *)&v33 + 1);
      a4 = 1;
      if (!*((_QWORD *)&v33 + 1))
        goto LABEL_13;
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    result = sub_21775E484();
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    swift_release();
    sub_21774EED8();
    return swift_release();
  }
  return result;
}

void sub_217758970(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v29;
  __int128 v31;

  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v4)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return;
  }
  v5 = 0;
  v6 = a1 + 40;
  while (1)
  {
    if (v5 >= *(_QWORD *)(a1 + 16))
    {
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      sub_21775E484();
      __break(1u);
      goto LABEL_24;
    }
    v7 = *(_QWORD *)(v6 + 32);
    v31 = *(_OWORD *)(v6 + 16);
    v9 = *(_QWORD *)v6;
    v8 = *(_QWORD *)(v6 + 8);
    v10 = *(_QWORD *)(v6 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    if (!v9)
      goto LABEL_18;
    v29 = v8;
    v11 = (_QWORD *)*a3;
    v13 = sub_21774D218(v10, v9);
    v14 = v11[2];
    v15 = (v12 & 1) == 0;
    v16 = v14 + v15;
    if (__OFADD__(v14, v15))
      goto LABEL_21;
    v17 = v12;
    if (v11[3] < v16)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v12 & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      sub_217746620(&qword_254F00658);
      sub_21775E3DC();
      if ((v17 & 1) != 0)
        goto LABEL_16;
    }
LABEL_12:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v13 >> 6) + 64) |= 1 << v13;
    v21 = (uint64_t *)(v20[6] + 16 * v13);
    *v21 = v10;
    v21[1] = v9;
    v22 = v20[7] + 32 * v13;
    *(_QWORD *)v22 = v29;
    *(_OWORD *)(v22 + 8) = v31;
    *(_QWORD *)(v22 + 24) = v7;
    v23 = v20[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_22;
    ++v5;
    v20[2] = v25;
    v6 += 48;
    a2 = 1;
    if (v4 == v5)
      goto LABEL_18;
  }
  sub_21775807C(v16, a2 & 1);
  v18 = sub_21774D218(v10, v9);
  if ((v17 & 1) != (v19 & 1))
    goto LABEL_23;
  v13 = v18;
  if ((v17 & 1) == 0)
    goto LABEL_12;
LABEL_16:
  v26 = (void *)swift_allocError();
  swift_willThrow();
  v27 = v26;
  sub_217746620(&qword_254F00460);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_24:
  sub_21775E358();
  sub_21775E220();
  sub_21775E3C4();
  sub_21775E220();
  sub_21775E400();
  __break(1u);
}

uint64_t sub_217758CA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

void sub_217758CE4(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  _OWORD v20[3];
  _OWORD v21[3];
  __int128 v22;
  _OWORD v23[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_21774C9D8(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v23);
    *(_QWORD *)&v22 = v13;
    *((_QWORD *)&v22 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v18 < v15)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v23, 0, sizeof(v23));
  v22 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  sub_217759138((uint64_t)&v22, (uint64_t)v21, &qword_254F003D0);
  if (*((_QWORD *)&v21[0] + 1))
  {
    v20[0] = v21[0];
    v20[1] = v21[1];
    v20[2] = v21[2];
    v19(v20);
    sub_217759178((uint64_t)v20);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
}

uint64_t sub_217758EC0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *);
  __int128 v16;
  uint64_t result;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  _QWORD v24[4];
  __int128 v25;

  v3 = *v1;
  v5 = v1[3];
  v4 = v1[4];
  v6 = v5;
  if (v4)
  {
    v7 = (v4 - 1) & v4;
    v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
    v9 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v8);
    v10 = *v9;
    v11 = v9[1];
    v12 = *(_QWORD *)(v3 + 56) + 32 * v8;
    v13 = *(_QWORD *)v12;
    v14 = *(_QWORD *)(v12 + 8);
    v15 = (void (*)(_QWORD *))v1[5];
    v24[0] = v10;
    v24[1] = v11;
    v24[2] = v13;
    v24[3] = v14;
    v16 = *(_OWORD *)(v12 + 16);
    v1[3] = v6;
    v1[4] = v7;
    v25 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v15(v24);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v18 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    v19 = (unint64_t)(v1[2] + 64) >> 6;
    if (v18 < v19)
    {
      v20 = v1[1];
      v21 = *(_QWORD *)(v20 + 8 * v18);
      if (v21)
      {
LABEL_7:
        v7 = (v21 - 1) & v21;
        v8 = __clz(__rbit64(v21)) + (v18 << 6);
        v6 = v18;
        goto LABEL_3;
      }
      v22 = v5 + 2;
      v6 = v5 + 1;
      if (v5 + 2 < v19)
      {
        v21 = *(_QWORD *)(v20 + 8 * v22);
        if (v21)
        {
LABEL_10:
          v18 = v22;
          goto LABEL_7;
        }
        v6 = v5 + 2;
        if (v5 + 3 < v19)
        {
          v21 = *(_QWORD *)(v20 + 8 * (v5 + 3));
          if (v21)
          {
            v18 = v5 + 3;
            goto LABEL_7;
          }
          v22 = v5 + 4;
          v6 = v5 + 3;
          if (v5 + 4 < v19)
          {
            v21 = *(_QWORD *)(v20 + 8 * v22);
            if (v21)
              goto LABEL_10;
            v18 = v5 + 5;
            v6 = v5 + 4;
            if (v5 + 5 < v19)
            {
              v21 = *(_QWORD *)(v20 + 8 * v18);
              if (v21)
                goto LABEL_7;
              v6 = v19 - 1;
              v23 = v5 + 6;
              while (v23 < v19)
              {
                v21 = *(_QWORD *)(v20 + 8 * v23++);
                if (v21)
                {
                  v18 = v23 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v1[3] = v6;
    v1[4] = 0;
    *a1 = 0u;
    a1[1] = 0u;
    a1[2] = 0u;
  }
  return result;
}

uint64_t sub_21775909C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_2177583DC(a2 + 2, *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
  *a2 = result;
  a2[1] = v4;
  return result;
}

unint64_t sub_2177590D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254F00678;
  if (!qword_254F00678)
  {
    v1 = sub_21775E0A0();
    result = MEMORY[0x219A11AF0](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_254F00678);
  }
  return result;
}

uint64_t sub_217759114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_217759120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_21775912C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_217759138(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_217746620(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  sub_2177592F8();
}

uint64_t sub_217759178(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_217746620(&qword_254F006C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_2177591B8@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t sub_2177591C8()
{
  return sub_21775E43C();
}

void sub_2177591E0(unint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v2 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
  v5 = (_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * a1);
  *v5 = v4;
  v5[1] = v3;
}

void sub_217759210()
{
  void *v0;

}

uint64_t sub_217759218()
{
  return swift_release();
}

uint64_t sub_21775927C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 296))(v0, v1);
}

uint64_t sub_217759290(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_21774CA64(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t sub_21775929C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_21774D430(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t sub_2177592C8()
{
  return swift_release();
}

uint64_t sub_2177592F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_217759300()
{
  return sub_21775E31C();
}

uint64_t sub_217759310()
{
  return swift_allocObject();
}

uint64_t sub_21775932C()
{
  return 0;
}

uint64_t sub_217759354()
{
  return swift_slowAlloc();
}

uint64_t sub_21775935C()
{
  return sub_21775E214();
}

uint64_t sub_2177593CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void sub_2177593D4(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_217756F48(a1, a2, 1, v2);
}

uint64_t sub_2177593E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_217759114(a1, a2, 1, v2);
}

uint64_t sub_2177593EC()
{
  return swift_bridgeObjectRelease_n();
}

_QWORD *sub_2177593F4()
{
  uint64_t v0;

  return FeatureRegistry.init(with:)(v0);
}

uint64_t sub_217759434()
{
  return swift_retain();
}

uint64_t sub_21775944C(uint64_t a1)
{
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t *);

  return sub_2177565D4(a1, v1, v2);
}

uint64_t sub_217759458(uint64_t a1)
{
  return sub_2177594FC(a1, qword_254F00EC8);
}

uint64_t *sub_217759470(uint64_t a1, uint64_t *a2)
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

uint64_t sub_2177594B0(uint64_t a1)
{
  return sub_2177594FC(a1, qword_254F00EE0);
}

uint64_t sub_2177594DC(uint64_t a1)
{
  return sub_2177594FC(a1, qword_253F2CAA0);
}

uint64_t sub_2177594FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21775E10C();
  sub_217759470(v3, a2);
  sub_2177462A0(v3, (uint64_t)a2);
  return sub_21775E100();
}

uint64_t MLFeatureProvider.toDict()(uint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  void *v9;

  v3 = objc_msgSend(v1, sel_featureNames);
  v4 = sub_21775E298();

  v5 = sub_21775E1A8();
  v8[2] = a1;
  v9 = v1;
  v6 = sub_217759730(v5, (void (*)(uint64_t *, _QWORD *))sub_217759704, (uint64_t)v8, v4);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_217759628(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  Swift::String_optional v8;

  v5 = *a2;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  v6 = (void *)sub_21775E1B4();
  v7 = objc_msgSend(a3, sel_featureValueForName_, v6);

  if (v7 && (v8 = MLFeatureValue.toString()(), v7, v8.value._object))
  {
    sub_21775C59C(v8.value._countAndFlagsBits, (uint64_t)v8.value._object, v5, v4);
  }
  else
  {
    sub_21775C388(v5, v4);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_217759704(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_217759628(a1, a2, *(void **)(v2 + 24));
}

uint64_t sub_21775971C(uint64_t a1, void (*a2)(uint64_t *, _QWORD *), uint64_t a3, uint64_t a4)
{
  return sub_217759730(a1, a2, a3, a4);
}

uint64_t sub_217759730(uint64_t a1, void (*a2)(uint64_t *, _QWORD *), uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;

  v22 = a1;
  v7 = a4 + 56;
  v8 = 1 << *(_BYTE *)(a4 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a4 + 56);
  v11 = (unint64_t)(v8 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  if (!v10)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    v19 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * i);
    v20 = v19[1];
    v21[0] = *v19;
    v21[1] = v20;
    swift_bridgeObjectRetain();
    a2(&v22, v21);
    if (v4)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v10)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v13++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v11)
      goto LABEL_26;
    v17 = *(_QWORD *)(v7 + 8 * v13);
    if (!v17)
      break;
LABEL_17:
    v10 = (v17 - 1) & v17;
  }
  v18 = v13 + 1;
  if (v13 + 1 >= v11)
    goto LABEL_26;
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
    goto LABEL_16;
  v18 = v13 + 2;
  if (v13 + 2 >= v11)
    goto LABEL_26;
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
    goto LABEL_16;
  v18 = v13 + 3;
  if (v13 + 3 >= v11)
    goto LABEL_26;
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
    goto LABEL_16;
  v18 = v13 + 4;
  if (v13 + 4 >= v11)
  {
LABEL_26:
    swift_release();
    return v22;
  }
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
  {
LABEL_16:
    v13 = v18;
    goto LABEL_17;
  }
  while (1)
  {
    v13 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v13 >= v11)
      goto LABEL_26;
    v17 = *(_QWORD *)(v7 + 8 * v13);
    ++v18;
    if (v17)
      goto LABEL_17;
  }
LABEL_28:
  __break(1u);
  return result;
}

Swift::String __swiftcall MLFeatureProvider.toJSONString()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  Swift::String result;
  id v16[2];

  v1 = v0;
  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_21775E1E4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = (void *)objc_opt_self();
  MLFeatureProvider.toDict()(v1);
  v4 = (void *)sub_21775E190();
  swift_bridgeObjectRelease();
  v16[0] = 0;
  v5 = objc_msgSend(v3, sel_dataWithJSONObject_options_error_, v4, 1, v16);

  v6 = v16[0];
  if (!v5)
  {
    v11 = v6;
    v12 = (void *)sub_21775E040();

    swift_willThrow();
LABEL_6:
    v9 = 0;
    v10 = 0xE000000000000000;
    goto LABEL_7;
  }
  sub_21775E0AC();

  sub_21775E1D8();
  v7 = sub_21775E1CC();
  if (!v8)
  {
    sub_217759AB4();
    goto LABEL_6;
  }
  v9 = v7;
  v10 = v8;
  sub_217759AB4();
LABEL_7:
  v13 = v9;
  v14 = (void *)v10;
  result._object = v14;
  result._countAndFlagsBits = v13;
  return result;
}

uint64_t sub_217759A70(uint64_t a1, unint64_t a2)
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

uint64_t sub_217759AB4()
{
  unint64_t v0;
  uint64_t v1;

  return sub_217759A70(v1, v0);
}

Swift::String_optional __swiftcall MLFeatureValue.toString()()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  Swift::String_optional result;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_type);
  v3 = 0;
  v4 = 0;
  switch((unint64_t)v2)
  {
    case 1uLL:
      sub_217759BF4((uint64_t)v2, sel_int64Value);
      v5 = sub_21775E460();
      goto LABEL_4;
    case 2uLL:
      objc_msgSend(v1, sel_doubleValue);
      v5 = sub_21775E280();
LABEL_4:
      v3 = v5;
      v4 = v6;
      goto LABEL_11;
    case 3uLL:
      v7 = sub_217759BF4((uint64_t)v2, sel_stringValue);
      v8 = sub_21775E1C0();
      goto LABEL_8;
    case 4uLL:
      goto LABEL_11;
    case 5uLL:
      v10 = sub_217759BF4((uint64_t)v2, sel_multiArrayValue);
      if (v10)
      {
        v7 = v10;
        v8 = sub_217759BFC();
LABEL_8:
        v3 = v8;
        v4 = v9;

      }
      else
      {
        v3 = 0;
        v4 = 0;
      }
LABEL_11:
      v11 = v3;
      v12 = v4;
      result.value._object = v12;
      result.value._countAndFlagsBits = v11;
      return result;
    default:
      v4 = 0;
      goto LABEL_11;
  }
}

id sub_217759BF4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_217759BFC()
{
  void *v0;
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
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = sub_217746620(&qword_254F006D0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  sub_217759E94();
  v5 = v4 - v3;
  v6 = sub_217746620(&qword_254F006D8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  sub_217759E94();
  v10 = v9 - v8;
  v11 = sub_217746620(&qword_254F006E0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  sub_217759E94();
  v15 = v14 - v13;
  v16 = objc_msgSend(v0, sel_dataType);
  if (v16 == (id)65568)
  {
    v20 = v0;
    v18 = MEMORY[0x24BEE14E8];
    sub_21775E118();
    sub_217759E54(&qword_254F006F0, &qword_254F006D8);
    v19 = sub_21775E124();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    if (v16 == (id)65600)
    {
      v23 = v0;
      v24 = MEMORY[0x24BEE13C8];
      sub_21775E118();
      sub_217759E54(&qword_254F006E8, &qword_254F006D0);
      v25 = sub_21775E124();
      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
      v21 = v25;
      v22 = v24;
      goto LABEL_8;
    }
    if (v16 != (id)131104)
      return 0;
    v17 = v0;
    v18 = MEMORY[0x24BEE3F88];
    sub_21775E118();
    sub_217759E54(&qword_254F006F8, &qword_254F006E0);
    v19 = sub_21775E124();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  }
  v21 = v19;
  v22 = v18;
LABEL_8:
  v26 = MEMORY[0x219A1149C](v21, v22);
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_217759E54(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_2177474F4(a2);
    result = MEMORY[0x219A11AF0](MEMORY[0x24BDBFCD0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_217759EA4(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int v13;
  int v14;
  char v15;
  char v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  int64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_50;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!v2)
      break;
    v4 = 0;
    v41 = v1;
    v42 = v1 & 0xC000000000000001;
    v39 = (char *)(v1 + 32);
    v40 = v2;
    v5 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      if (v42)
      {
        v6 = (void *)MEMORY[0x219A115B0](v4, v1);
      }
      else
      {
        v6 = *(void **)&v39[8 * v4];
        swift_unknownObjectRetain();
      }
      v7 = __OFADD__(v4++, 1);
      if (v7)
        break;
      v44 = v5;
      v8 = objc_msgSend(v6, sel_featureNames);
      v9 = sub_21775E298();

      v10 = *(_QWORD *)(v9 + 16);
      if (v10)
      {
        v43 = v4;
        sub_21775ABC8();
        v11 = v3;
        v12 = sub_21775B014(v9);
        v14 = v13;
        v16 = v15 & 1;
        while ((v12 & 0x8000000000000000) == 0 && v12 < 1 << *(_BYTE *)(v9 + 32))
        {
          if (((*(_QWORD *)(v9 + 56 + (((unint64_t)v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
            goto LABEL_43;
          if (*(_DWORD *)(v9 + 36) != v14)
            goto LABEL_44;
          v46 = v16;
          v17 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 16 * v12);
          v18 = v17[1];
          v45 = *v17;
          v1 = (unint64_t)v6;
          v20 = *(_QWORD *)(v11 + 16);
          v19 = *(_QWORD *)(v11 + 24);
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          if (v20 >= v19 >> 1)
            sub_21775ABC8();
          *(_QWORD *)(v11 + 16) = v20 + 1;
          v21 = (_QWORD *)(v11 + 24 * v20);
          v21[4] = v45;
          v21[5] = v18;
          v21[6] = v1;
          v22 = sub_21775AF30(v12, v14, v46 & 1, v9);
          v12 = v22;
          v14 = v23;
          v16 = v24 & 1;
          --v10;
          v6 = (void *)v1;
          if (!v10)
          {
            sub_21775912C(v22, v23, v16);
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            v2 = v40;
            v1 = v41;
            v3 = MEMORY[0x24BEE4AF8];
            v4 = v43;
            goto LABEL_20;
          }
        }
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        break;
      }
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v11 = v3;
LABEL_20:
      v25 = v11;
      v26 = *(_QWORD *)(v11 + 16);
      v5 = v44;
      v27 = *(_QWORD *)(v44 + 16);
      v28 = v27 + v26;
      if (__OFADD__(v27, v26))
        goto LABEL_46;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v28 > *(_QWORD *)(v44 + 24) >> 1)
      {
        if (v27 <= v28)
          v30 = v27 + v26;
        else
          v30 = v27;
        sub_217756E7C(isUniquelyReferenced_nonNull_native, v30, 1, v44);
        v5 = v31;
      }
      if (*(_QWORD *)(v25 + 16))
      {
        v32 = *(_QWORD *)(v5 + 16);
        if ((*(_QWORD *)(v5 + 24) >> 1) - v32 < v26)
          goto LABEL_48;
        v33 = v5 + 24 * v32 + 32;
        if (v25 + 32 < v33 + 24 * v26 && v33 < v25 + 32 + 24 * v26)
        {
          sub_21775B094();
          sub_21775B0EC();
          result = sub_21775B0B8();
          __break(1u);
          return result;
        }
        sub_217746620(&qword_254F006A0);
        swift_arrayInitWithCopy();
        if (v26)
        {
          v35 = *(_QWORD *)(v5 + 16);
          v7 = __OFADD__(v35, v26);
          v36 = v35 + v26;
          if (v7)
            goto LABEL_49;
          *(_QWORD *)(v5 + 16) = v36;
        }
      }
      else if (v26)
      {
        goto LABEL_47;
      }
      swift_bridgeObjectRelease();
      if (v4 == v2)
        goto LABEL_41;
    }
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    swift_bridgeObjectRetain();
    v2 = sub_21775E40C();
  }
  v5 = MEMORY[0x24BEE4AF8];
LABEL_41:
  swift_bridgeObjectRelease_n();
  *(_QWORD *)(v38 + 16) = sub_21775A278(v5);
  return v38;
}

uint64_t sub_21775A278(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_217746620(&qword_254F00690);
    v3 = sub_21775E430();
  }
  else
  {
    v3 = MEMORY[0x24BEE4B00];
  }
  v6 = v3;
  sub_21775A9C0(a1, 1, &v6);
  v4 = v6;
  if (v1)
    swift_release();
  return v4;
}

uint64_t MultiFeatureProvider.featureNames.getter()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = swift_bridgeObjectRetain();
  return sub_21774C6D8(v0);
}

MLFeatureValue_optional __swiftcall MultiFeatureProvider.featureValue(for:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  unint64_t v5;
  char v6;
  void *v7;
  void *v8;
  objc_class *v9;
  Swift::Bool v10;
  objc_class *v11;
  MLFeatureValue_optional result;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 16);
  if (!*(_QWORD *)(v4 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  v5 = sub_21774D218(countAndFlagsBits, (uint64_t)object);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    v9 = 0;
    goto LABEL_6;
  }
  v7 = *(void **)(*(_QWORD *)(v4 + 56) + 8 * v5);
  swift_unknownObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_21775E1B4();
  v9 = (objc_class *)objc_msgSend(v7, sel_featureValueForName_, v8);
  swift_unknownObjectRelease();

LABEL_6:
  v11 = v9;
  result.value.super.isa = v11;
  result.is_nil = v10;
  return result;
}

uint64_t MultiFeatureProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MultiFeatureProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_21775A514(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_21775E43C();
  __break(1u);
  return result;
}

uint64_t sub_21775A5E0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  if (a2 < 0)
  {
    sub_21775B094();
    sub_21775B124();
  }
  else
  {
    sub_21775B0FC();
    if (v4 + 24 * v3 <= v2 || v2 + 24 * v3 <= v4)
    {
      sub_217746620(&qword_254F006A0);
      sub_21775B0C4();
      return sub_21775B0A8();
    }
    sub_21775B094();
    sub_21775B0EC();
  }
  result = sub_21775B0B8();
  __break(1u);
  return result;
}

uint64_t sub_21775A680(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  if (a2 < 0)
  {
    sub_21775B094();
    sub_21775B124();
  }
  else
  {
    sub_21775B0FC();
    if (v4 + 16 * v3 <= v2 || v2 + 16 * v3 <= v4)
    {
      sub_217746620(&qword_254F00570);
      sub_21775B0C4();
      return sub_21775B0A8();
    }
    sub_21775B094();
    sub_21775B0EC();
  }
  result = sub_21775B0B8();
  __break(1u);
  return result;
}

uint64_t sub_21775A71C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (v3 = a1 + 48 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_21775E43C();
    __break(1u);
  }
  else
  {
    sub_217746620(&qword_254F00578);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21775A80C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (v3 = a1 + 24 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_21775E43C();
    __break(1u);
  }
  else
  {
    sub_217746620(&qword_254F00580);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21775A8FC(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t result;

  if (a2 < 0)
  {
    sub_21775B094();
    sub_21775B124();
  }
  else
  {
    sub_21775B0FC();
    if (v4 + 32 * v3 <= v2 || v2 + 32 * v3 <= v4)
    {
      sub_217746620(v5);
      sub_21775B0C4();
      return sub_21775B0A8();
    }
    sub_21775B094();
    sub_21775B0EC();
  }
  result = sub_21775B0B8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MultiFeatureProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for MultiFeatureProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_21775A9C0(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  for (i = (uint64_t *)(a1 + 48); ; i += 3)
  {
    v8 = *(i - 2);
    v7 = *(i - 1);
    v9 = *i;
    v10 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v12 = sub_21774D218(v8, v7);
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      break;
    v16 = v11;
    if (v10[3] >= v15)
    {
      if ((a2 & 1) == 0)
      {
        sub_217746620(&qword_254F007A0);
        sub_21775E3DC();
      }
    }
    else
    {
      sub_217757E60(v15, a2 & 1);
      v17 = sub_21774D218(v8, v7);
      if ((v16 & 1) != (v18 & 1))
        goto LABEL_18;
      v12 = v17;
    }
    v19 = (_QWORD *)*a3;
    if ((v16 & 1) != 0)
    {
      v20 = *(_QWORD *)(v19[7] + 8 * v12);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      v21 = v19[7];
      swift_unknownObjectRelease();
      *(_QWORD *)(v21 + 8 * v12) = v20;
    }
    else
    {
      v19[(v12 >> 6) + 8] |= 1 << v12;
      v22 = (uint64_t *)(v19[6] + 16 * v12);
      *v22 = v8;
      v22[1] = v7;
      *(_QWORD *)(v19[7] + 8 * v12) = v9;
      v23 = v19[2];
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
        goto LABEL_17;
      v19[2] = v25;
    }
    a2 = 1;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  result = sub_21775E484();
  __break(1u);
  return result;
}

void sub_21775AB94()
{
  _QWORD *v0;
  uint64_t v1;

  sub_21775ADC8();
  *v0 = v1;
}

void sub_21775ABC8()
{
  _QWORD *v0;
  uint64_t v1;

  sub_21775ACF4();
  *v0 = v1;
}

void sub_21775ABFC()
{
  sub_21775AE8C();
}

void sub_21775AC18(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;

  if ((a3 & 1) != 0)
  {
    sub_2177592E0();
    if (v7 != v8)
    {
      sub_21775B144();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_217746694();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (v10)
  {
    sub_217746620(&qword_254F00430);
    v11 = (_QWORD *)sub_217747874();
    v12 = j__malloc_size(v11);
    v11[2] = v9;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 48);
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v11 + 4);
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    sub_2177577A4(v14, v9, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21775A71C(v14, v9, v13);
  }
  sub_21775B10C();
  sub_217746708();
}

void sub_21775ACD8()
{
  sub_21775ACF4();
}

void sub_21775ACF4()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  void (*v2)(uint64_t);
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v16;

  sub_21775B0D8();
  if ((v6 & 1) != 0)
  {
    sub_2177592E0();
    if (v7 != v8)
    {
      sub_21775B144();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_217746694();
    }
  }
  sub_21775B134();
  if (v5)
  {
    sub_21775B150(v9, v10, v11, v12, v13);
    v14 = (_QWORD *)sub_217747874();
    v15 = j__malloc_size(v14);
    v14[2] = v4;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 24);
  }
  v16 = sub_21775B114();
  if ((v3 & 1) != 0)
  {
    v2(v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v16);
  }
  sub_21775B10C();
}

void sub_21775ADAC()
{
  sub_21775ADC8();
}

void sub_21775ADC8()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_21775B0D8();
  if ((v5 & 1) != 0)
  {
    sub_2177592E0();
    if (v6 != v7)
    {
      sub_21775B144();
      if (v6)
      {
        __break(1u);
        return;
      }
      sub_217746694();
    }
  }
  sub_21775B134();
  if (v4)
  {
    sub_21775B150(v8, v9, v10, v11, v12);
    v13 = (_QWORD *)sub_217747874();
    v14 = j__malloc_size(v13);
    v13[2] = v3;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 32);
  }
  v15 = sub_21775B114();
  if ((v2 & 1) != 0)
  {
    v1(v15);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_21775A8FC(v15, v16);
  }
  sub_21775B10C();
  sub_217746708();
}

void sub_21775AE70()
{
  sub_21775AE8C();
}

void sub_21775AE8C()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  void (*v2)(uint64_t);
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v16;

  sub_21775B0D8();
  if ((v6 & 1) != 0)
  {
    sub_2177592E0();
    if (v7 != v8)
    {
      sub_21775B144();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_217746694();
    }
  }
  sub_21775B134();
  if (v5)
  {
    sub_21775B150(v9, v10, v11, v12, v13);
    v14 = (_QWORD *)sub_217747874();
    v15 = j__malloc_size(v14);
    v14[2] = v4;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 16);
  }
  v16 = sub_21775B114();
  if ((v3 & 1) != 0)
  {
    v2(v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v16);
  }
  sub_21775B10C();
  sub_217746708();
}

int64_t sub_21775AF30(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    v10 = *(_QWORD *)(v6 + 8 * v9);
    if (v10)
      return __clz(__rbit64(v10)) + (v9 << 6);
    v11 = (unint64_t)(result + 63) >> 6;
    v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      v10 = *(_QWORD *)(v6 + 8 * v9);
      if (v10)
        return __clz(__rbit64(v10)) + (v9 << 6);
      while (v5 + 3 < v11)
      {
        v10 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_21775B014(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_21775B0A8()
{
  return swift_arrayInitWithCopy();
}

uint64_t sub_21775B0B8()
{
  return sub_21775E43C();
}

uint64_t sub_21775B0C4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_21775B10C()
{
  return swift_release();
}

uint64_t sub_21775B114()
{
  uint64_t v0;

  return v0 + 32;
}

uint64_t sub_21775B150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_217746620(a5);
}

uint64_t sub_21775B158(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aSimulatounitte[8 * a1] == *(_QWORD *)&aSimulatounitte[8 * a2]
    && *(_QWORD *)&aR[8 * a1] == *(_QWORD *)&aR[8 * a2])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_21775E46C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_21775B1DC()
{
  sub_21775E4A8();
  sub_21775C120();
  sub_21775E4C0();
  sub_21775C114();
}

uint64_t sub_21775B210()
{
  return sub_21775B28C();
}

uint64_t sub_21775B21C()
{
  sub_21775E214();
  return swift_bridgeObjectRelease();
}

void sub_21775B25C()
{
  sub_21775E4A8();
  sub_21775C120();
  sub_21775E4C0();
  sub_21775C114();
}

uint64_t sub_21775B28C()
{
  sub_21775E4A8();
  sub_21775E214();
  swift_bridgeObjectRelease();
  return sub_21775E4C0();
}

void static Paths.featureManagerBaseDirectory()()
{
  uint64_t v0;
  uint64_t v1;

  sub_2177466A4();
  sub_21775C0F4();
  MEMORY[0x24BDAC7A8](v1);
  sub_21775C0C0();
  if (qword_253F2CA10 != -1)
    swift_once();
  sub_2177462A0(v0, (uint64_t)qword_253F2C9F8);
  sub_21775C0D8();
  sub_21775C13C();
  sub_21775C134();
  sub_21775C12C();
  sub_21775C0E4();
  sub_217746708();
}

HumanUnderstandingFoundation::Paths::Environment_optional __swiftcall Paths.Environment.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  HumanUnderstandingFoundation::Paths::Environment_optional result;

  v2 = v1;
  v3 = sub_21775E448();
  swift_bridgeObjectRelease();
  v4 = 3;
  if (v3 < 3)
    v4 = v3;
  *v2 = v4;
  sub_217759440();
  return result;
}

void *static Paths.Environment.allCases.getter()
{
  return &unk_24D802C10;
}

uint64_t Paths.Environment.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aSimulatounitte[8 * *v0];
}

uint64_t sub_21775B430(char *a1, char *a2)
{
  return sub_21775B158(*a1, *a2);
}

uint64_t sub_21775B43C()
{
  return sub_21775B210();
}

uint64_t sub_21775B444()
{
  return sub_21775B21C();
}

uint64_t sub_21775B44C()
{
  return sub_21775B28C();
}

HumanUnderstandingFoundation::Paths::Environment_optional sub_21775B454(Swift::String *a1)
{
  return Paths.Environment.init(rawValue:)(*a1);
}

uint64_t sub_21775B460@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Paths.Environment.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_21775B484(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D802C10;
}

uint64_t static Paths.baseDirectory(with:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  int v25;
  NSString *v26;
  uint64_t result;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = sub_21775E0DC();
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2177466A4();
  v36 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v33 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v33 - v14;
  v16 = sub_217746620(&qword_253F2C9F0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v33 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v33 - v23;
  v25 = *a1;
  v35 = a2;
  sub_21775C108(a2, 1);
  if (v25)
  {
    if (v25 != 1)
    {
      v29 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
      v30 = objc_msgSend(v29, sel_URLsForDirectory_inDomains_, 5, 1);

      v31 = sub_21775E250();
      sub_21775B848(v31, (uint64_t)v19);
      swift_bridgeObjectRelease();
      if (sub_217759120((uint64_t)v19, 1, v7) == 1)
      {
        sub_21775BC10((uint64_t)v19);
        result = sub_21775E400();
        __break(1u);
        return result;
      }
      v28 = v36;
      (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v10, v19, v7);
      sub_21775E070();
      v15 = v10;
      goto LABEL_9;
    }
    v26 = NSTemporaryDirectory();
    sub_21775E1C0();

    sub_21775E04C();
    swift_bridgeObjectRelease();
    sub_21775E0D0();
    sub_21775E0C4();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v34);
    sub_21775E07C();
    swift_bridgeObjectRelease();
    v15 = v13;
  }
  else
  {
    result = (uint64_t)getenv("SIMULATOR_SHARED_RESOURCES_DIRECTORY");
    if (!result)
      return result;
    sub_21775E22C();
    sub_21775E04C();
    swift_bridgeObjectRelease();
    sub_21775E07C();
    v22 = v24;
  }
  v28 = v36;
LABEL_9:
  (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v7);
  v32 = v35;
  sub_21775BC10(v35);
  sub_21775C108((uint64_t)v22, 0);
  return sub_21775BC50((uint64_t)v22, v32);
}

uint64_t sub_21775B848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_21775E0A0();
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return sub_217759114(a2, v7, 1, v6);
}

uint64_t sub_21775B8C0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_21775E0A0();
  sub_217759470(v0, qword_253F2C9F8);
  v1 = sub_2177462A0(v0, (uint64_t)qword_253F2C9F8);
  return sub_21775B908(v1);
}

uint64_t sub_21775B908@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t result;
  _BYTE v10[15];
  unsigned __int8 v11;

  v2 = sub_217746620(&qword_253F2C9F0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v7 = &v10[-v6];
  v11 = 2;
  static Paths.baseDirectory(with:)(&v11, (uint64_t)&v10[-v6]);
  sub_21775C078((uint64_t)v7, (uint64_t)v5);
  v8 = sub_21775E0A0();
  result = sub_217759120((uint64_t)v5, 1, v8);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_21775BC10((uint64_t)v7);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, v5, v8);
  }
  return result;
}

uint64_t static Paths.baseDirectory.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_253F2CA10 != -1)
    swift_once();
  v2 = sub_2177466A4();
  v3 = sub_2177462A0(v2, (uint64_t)qword_253F2C9F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void static Paths.baseDirectory(with:createIfNeeded:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;

  if (qword_253F2CA10 != -1)
    swift_once();
  v4 = sub_2177466A4();
  sub_2177462A0(v4, (uint64_t)qword_253F2C9F8);
  sub_21775E07C();
  if ((a3 & 1) != 0)
    sub_21775BAEC();
  else
    sub_217759440();
}

void sub_21775BAEC()
{
  id v0;
  void *v1;
  unsigned int v2;
  id v3;
  id v4;
  void *v5;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_21775E094();
  v1 = (void *)sub_21775E1B4();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v1, 1, 0, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    v5 = (void *)sub_21775E040();

    swift_willThrow();
  }
}

uint64_t sub_21775BC10(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_217746620(&qword_253F2C9F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21775BC50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_217746620(&qword_253F2C9F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void static Paths.topDirectory()()
{
  uint64_t v0;

  if (qword_253F2CA10 != -1)
    swift_once();
  v0 = sub_2177466A4();
  sub_2177462A0(v0, (uint64_t)qword_253F2C9F8);
  sub_21775C0D8();
  sub_21775BAEC();
}

void static Paths.biomeStreamsDirectory()()
{
  uint64_t v0;
  uint64_t v1;

  sub_2177466A4();
  sub_21775C0F4();
  MEMORY[0x24BDAC7A8](v1);
  sub_21775C0C0();
  if (qword_253F2CA10 != -1)
    swift_once();
  sub_2177462A0(v0, (uint64_t)qword_253F2C9F8);
  sub_21775C0D8();
  sub_21775C13C();
  sub_21775C134();
  sub_21775C12C();
  sub_21775C0E4();
  sub_217746708();
}

void static Paths.humanUnderstandingEvidenceBaseDirectory()()
{
  uint64_t v0;
  uint64_t v1;

  sub_2177466A4();
  sub_21775C0F4();
  MEMORY[0x24BDAC7A8](v1);
  sub_21775C0C0();
  if (qword_253F2CA10 != -1)
    swift_once();
  sub_2177462A0(v0, (uint64_t)qword_253F2C9F8);
  sub_21775C0D8();
  sub_21775C13C();
  sub_21775C134();
  sub_21775C12C();
  sub_21775C0E4();
  sub_217746708();
}

unint64_t sub_21775BE90()
{
  unint64_t result;

  result = qword_254F007A8;
  if (!qword_254F007A8)
  {
    result = MEMORY[0x219A11AF0](&protocol conformance descriptor for Paths.Environment, &type metadata for Paths.Environment);
    atomic_store(result, (unint64_t *)&qword_254F007A8);
  }
  return result;
}

unint64_t sub_21775BED0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254F007B0;
  if (!qword_254F007B0)
  {
    v1 = sub_2177474F4(&qword_254F007B8);
    result = MEMORY[0x219A11AF0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254F007B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Paths()
{
  return &type metadata for Paths;
}

uint64_t getEnumTagSinglePayload for Paths.Environment(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Paths.Environment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21775BFF8 + 4 * byte_21775EF15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21775C02C + 4 * byte_21775EF10[v4]))();
}

uint64_t sub_21775C02C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21775C034(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21775C03CLL);
  return result;
}

uint64_t sub_21775C048(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21775C050);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21775C054(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21775C05C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Paths.Environment()
{
  return &type metadata for Paths.Environment;
}

uint64_t sub_21775C078(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_217746620(&qword_253F2C9F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21775C0D8()
{
  return sub_21775E07C();
}

uint64_t sub_21775C0E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_21775C108(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_217759114(a1, a2, 1, v2);
}

uint64_t sub_21775C120()
{
  return sub_21775E4B4();
}

void sub_21775C12C()
{
  sub_21775BAEC();
}

uint64_t sub_21775C134()
{
  return sub_21775E07C();
}

void sub_21775C13C()
{
  sub_21775BAEC();
}

void sub_21775C144()
{
  qword_254F00EF8 = MEMORY[0x24BEE4AF8];
}

void *BackfillableSignal.allFeatures(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  void *v13;
  uint64_t v14;

  v7 = objc_msgSend(v3, sel_featureNames);
  v8 = sub_21775E298();

  sub_21775C238();
  v9 = sub_21775E1A8();
  v12[2] = a2;
  v12[3] = a3;
  v13 = v3;
  v14 = a1;
  v10 = sub_21775971C(v9, (void (*)(uint64_t *, _QWORD *))sub_21775C32C, (uint64_t)v12, v8);
  swift_bridgeObjectRelease();
  sub_21774C218(v10);
  sub_21775CBC0();
  return v3;
}

unint64_t sub_21775C238()
{
  unint64_t result;

  result = qword_254F00420;
  if (!qword_254F00420)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254F00420);
  }
  return result;
}

void sub_21775C274(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  void *v13;

  v10 = *a2;
  v9 = a2[1];
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 16);
  swift_bridgeObjectRetain();
  v12 = v11(v10, v9, a4, a5, a6);
  if (v12)
  {
    sub_21775C620(v12, v10, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = (void *)sub_21775C494(v10, v9);
    swift_bridgeObjectRelease();

  }
}

void sub_21775C32C(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  sub_21775C274(a1, a2, v2[4], v2[5], v2[2], v2[3]);
}

uint64_t BackfillableSignal.allFeatures(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  v4 = BackfillableSignal.allFeatures(for:)(a1, a2, a3);
  sub_21775C970((uint64_t)v4);
  sub_21775CBC0();
  return v3;
}

uint64_t sub_21775C388(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21774D218(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_217746620(qword_254F007D0);
  sub_21775E3D0();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 16 * v6);
  sub_21775E3E8();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21775C494(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21774D218(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_217746620(&qword_254F007C8);
  sub_21775E3D0();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v6);
  sub_21775C238();
  sub_21775E3E8();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21775C59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v10;

  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v4;
  *v4 = 0x8000000000000000;
  sub_21775C69C(a1, a2, a3, a4);
  *v4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21775C620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_21775C7C8(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21775C69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_21774D218(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  sub_217746620(qword_254F007D0);
  if ((sub_21775E3D0() & 1) == 0)
    goto LABEL_5;
  v15 = sub_21774D218(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_21775E484();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = (uint64_t *)(v17[7] + 16 * v13);
    result = swift_bridgeObjectRelease();
    *v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_21775C8DC(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_21775C7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_21774D218(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  sub_217746620(&qword_254F007C8);
  if ((sub_21775E3D0() & 1) == 0)
    goto LABEL_5;
  v13 = sub_21774D218(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_21775E484();
    __break(1u);
    return;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];

    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_21775C928(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_21775C8DC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

unint64_t sub_21775C928(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

void sub_21775C970(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  Swift::String_optional v21;
  uint64_t countAndFlagsBits;
  void *object;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_217746620(&qword_254F007C0);
  v2 = sub_21775E418();
  v3 = (_QWORD *)v2;
  v4 = 0;
  v32 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = a1 + 64;
  v5 = v7;
  v8 = 1 << *(_BYTE *)(v6 - 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v5;
  v29 = v6;
  v30 = (unint64_t)(v8 + 63) >> 6;
  v31 = v2 + 64;
  if ((v9 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v11 | (v4 << 6); ; i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v32 + 48) + 16 * i);
    v18 = *v16;
    v17 = v16[1];
    v19 = *(void **)(*(_QWORD *)(v32 + 56) + 8 * i);
    if (v19)
    {
      swift_bridgeObjectRetain();
      v20 = v19;
      v21 = MLFeatureValue.toString()();
      if (v21.value._object)
      {
        countAndFlagsBits = v21.value._countAndFlagsBits;
        object = v21.value._object;

        goto LABEL_24;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      v20 = 0;
    }

    swift_bridgeObjectRelease();
    countAndFlagsBits = 0;
    object = (void *)0xE000000000000000;
LABEL_24:
    *(_QWORD *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v24 = (_QWORD *)(v3[6] + 16 * i);
    *v24 = v18;
    v24[1] = v17;
    v25 = (uint64_t *)(v3[7] + 16 * i);
    *v25 = countAndFlagsBits;
    v25[1] = (uint64_t)object;
    v26 = v3[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v3[2] = v28;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_29;
    if (v13 >= v30)
      return;
    v14 = *(_QWORD *)(v29 + 8 * v13);
    ++v4;
    if (!v14)
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v30)
        return;
      v14 = *(_QWORD *)(v29 + 8 * v4);
      if (!v14)
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v30)
          return;
        v14 = *(_QWORD *)(v29 + 8 * v4);
        if (!v14)
          break;
      }
    }
LABEL_18:
    v10 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v30)
    return;
  v14 = *(_QWORD *)(v29 + 8 * v15);
  if (v14)
  {
    v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v4 >= v30)
      return;
    v14 = *(_QWORD *)(v29 + 8 * v4);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_30:
  __break(1u);
}

uint64_t dispatch thunk of Signal.signalName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BackfillableSignal.featureValue(for:date:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_21775CBC0()
{
  return swift_bridgeObjectRelease();
}

uint64_t TimestampedItem.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + qword_254F00F00;
  v4 = sub_21775CE78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TimestampedItem.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 16))(a1, v1 + *(_QWORD *)(*(_QWORD *)v1 + 96));
}

void TimestampedItem.__allocating_init(timestamp:value:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  TimestampedItem.init(timestamp:value:)(a1, a2);
  sub_217759440();
}

uint64_t *TimestampedItem.init(timestamp:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *v2;
  v6 = (uint64_t)v2 + qword_254F00F00;
  v7 = sub_21775CE78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a1, v7);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 80) - 8) + 32))((uint64_t)v2 + *(_QWORD *)(*v2 + 96), a2);
  return v2;
}

void TimestampedItem.deinit()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = (uint64_t)v0 + qword_254F00F00;
  v3 = sub_21775CE78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 96));
  sub_217759440();
}

uint64_t TimestampedItem.__deallocating_deinit()
{
  TimestampedItem.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_21775CD74@<X0>(uint64_t a1@<X8>)
{
  return TimestampedItem.timestamp.getter(a1);
}

uint64_t dispatch thunk of Timestamped.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_21775CDA0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21775E0B8();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for TimestampedItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21775CE4C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TimestampedItem);
}

uint64_t method lookup function for TimestampedItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TimestampedItem.__allocating_init(timestamp:value:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_21775CE4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x219A11A9C](a1, v6, a5);
}

uint64_t sub_21775CE78()
{
  return sub_21775E0B8();
}

uint64_t sub_21775CE80(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  unint64_t v6;
  uint64_t v7;

  v3 = v2;
  *(_QWORD *)(v3 + 16) = a1;
  v5 = a1;
  v6 = sub_21775CEF8(a2);
  swift_bridgeObjectRelease();
  type metadata accessor for MultiFeatureProvider();
  swift_allocObject();
  v7 = sub_217759EA4(v6);

  *(_QWORD *)(v3 + 24) = v7;
  return v3;
}

uint64_t sub_21775CEF8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v5 = MEMORY[0x24BEE4AF8];
    sub_21775E3A0();
    v4 = a1 + 32;
    do
    {
      v4 += 16;
      swift_unknownObjectRetain_n();
      sub_217746620(&qword_254F00570);
      sub_217746620((uint64_t *)&unk_254F00900);
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_21775E388();
      sub_21775E3AC();
      sub_21775E3B8();
      sub_21775E394();
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

uint64_t Transformer.featureNames.getter()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_modelDescription);
  v2 = objc_msgSend(v1, sel_outputDescriptionsByName);

  sub_217751C64();
  v3 = sub_21775E19C();

  return sub_21774C6D8(v3);
}

MLFeatureValue_optional __swiftcall Transformer.featureValue(for:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  Swift::Bool v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13[2];
  MLFeatureValue_optional result;

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(void **)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v13[0] = 0;
  v4 = objc_msgSend(v2, sel_predictionFromFeatures_error_, v3, v13);
  if (v4)
  {
    v5 = v4;
    v6 = v13[0];
    v7 = (void *)sub_21775E1B4();
    v8 = (objc_class *)objc_msgSend(v5, sel_featureValueForName_, v7);
    swift_unknownObjectRelease();

  }
  else
  {
    v10 = v13[0];
    v11 = (void *)sub_21775E040();

    swift_willThrow();
    v8 = 0;
  }
  v12 = v8;
  result.value.super.isa = v12;
  result.is_nil = v9;
  return result;
}

uint64_t Transformer.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t Transformer.__deallocating_deinit()
{
  Transformer.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Transformer()
{
  return objc_opt_self();
}

uint64_t method lookup function for Transformer()
{
  return swift_lookUpClassMethod();
}

void sub_21775D2A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  void (*v14)(_xpc_activity_s *);
  _QWORD *v15;

  v10 = 0xD00000000000001DLL;
  v11 = 0x80000002177605E0;
  sub_21775E220();
  v6 = (void *)*MEMORY[0x24BDAC5A0];
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0xD00000000000001DLL;
  v7[3] = 0x80000002177605E0;
  v7[4] = a3;
  v7[5] = a4;
  v14 = sub_21775DE60;
  v15 = v7;
  v10 = MEMORY[0x24BDAC760];
  v11 = 1107296256;
  v12 = sub_21775D754;
  v13 = &unk_24D803288;
  v8 = _Block_copy(&v10);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  v9 = sub_21775E1FC();
  swift_bridgeObjectRelease();
  xpc_activity_register((const char *)(v9 + 32), v6, v8);
  swift_release();
  _Block_release(v8);
}

void sub_21775D3C4(_xpc_activity_s *a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void (*v19)(_QWORD);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  if (xpc_activity_get_state(a1) == 2 && xpc_activity_should_defer(a1))
  {
    if (!xpc_activity_set_state(a1, 3))
    {
      if (qword_254F00248 != -1)
        swift_once();
      v8 = sub_21775E10C();
      sub_2177462A0(v8, (uint64_t)qword_254F00EC8);
      v9 = sub_21775E2B0();
      swift_bridgeObjectRetain_n();
      v10 = sub_21775E0F4();
      v11 = v9;
      if (os_log_type_enabled(v10, v9))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        v13 = swift_slowAlloc();
        v24 = v13;
        *(_DWORD *)v12 = 136315138;
        swift_bridgeObjectRetain();
        sub_21774CA64(a2, a3, &v24);
        sub_21775E31C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_217744000, v10, v11, "%s should defer before task start, but failed to set state to XPC_ACTIVITY_STATE_DEFER", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A11B68](v13, -1, -1);
        MEMORY[0x219A11B68](v12, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    if (qword_254F00248 != -1)
      swift_once();
    v14 = sub_21775E10C();
    sub_2177462A0(v14, (uint64_t)qword_254F00EC8);
    v15 = sub_21775E2C8();
    swift_bridgeObjectRetain_n();
    v16 = sub_21775E0F4();
    v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = a4;
      v20 = a2;
      v21 = swift_slowAlloc();
      v24 = v21;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      sub_21774CA64(v20, a3, &v24);
      sub_21775E31C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_217744000, v16, v17, "%s started running XPC Activity task block", v18, 0xCu);
      swift_arrayDestroy();
      v22 = v21;
      a2 = v20;
      a4 = v19;
      MEMORY[0x219A11B68](v22, -1, -1);
      MEMORY[0x219A11B68](v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    type metadata accessor for XPCActivity();
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = a1;
    v23[3] = a2;
    v23[4] = a3;
    v23[5] = 0;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    a4(v23);
    swift_release();
  }
}

uint64_t sub_21775D754(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void (*registerXPCActivityHandler.getter())(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21775D2A4;
}

Swift::Bool __swiftcall XPCActivity.deferIfNecessary()()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  _xpc_activity_s *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17[3];
  Swift::Bool v18;

  v2 = v0;
  v18 = 0;
  v3 = *(_xpc_activity_s **)(v0 + 16);
  if (xpc_activity_should_defer(v3))
  {
    if (xpc_activity_set_state(v3, 3))
    {
      if (qword_254F00248 != -1)
        swift_once();
      v4 = sub_21775E10C();
      v5 = sub_2177462A0(v4, (uint64_t)qword_254F00EC8);
      v6 = (uint8_t *)sub_21775E2B0();
      sub_2177466AC();
      v7 = sub_21775E0F4();
      if (sub_217746718(v7))
      {
        swift_slowAlloc();
        v17[0] = sub_21775DE74();
        *(_DWORD *)v6 = 136315138;
        v8 = *(_QWORD *)(v2 + 24);
        v9 = *(_QWORD *)(v2 + 32);
        swift_bridgeObjectRetain();
        sub_21774CA64(v8, v9, v17);
        sub_21775E31C();
        sub_21775B10C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_217744000, v5, v1, "%s XPC Activity should defer, but failed to set state to XPC_ACTIVITY_STATE_DEFER", v6, 0xCu);
        sub_21775DE84();
        sub_217747834();
      }

      sub_21775B10C();
    }
    v18 = 1;
  }
  if (qword_254F00248 != -1)
    swift_once();
  v10 = sub_21775E10C();
  v11 = sub_2177462A0(v10, (uint64_t)qword_254F00EC8);
  v12 = sub_21775E2C8();
  sub_2177466AC();
  v13 = sub_21775E0F4();
  if (sub_217746718(v13))
  {
    swift_slowAlloc();
    v17[0] = sub_21775DE74();
    *(_DWORD *)v12 = 136315394;
    v14 = *(_QWORD *)(v2 + 24);
    v15 = *(_QWORD *)(v2 + 32);
    swift_bridgeObjectRetain();
    sub_21774CA64(v14, v15, v17);
    sub_21775E31C();
    sub_21775B10C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 1024;
    sub_21775E31C();
    _os_log_impl(&dword_217744000, v11, v1, "%s XPC Activity deferIfNecessary returned %{BOOL}d", (uint8_t *)v12, 0x12u);
    sub_21775DE84();
    sub_217747834();
  }

  sub_21775B10C();
  swift_beginAccess();
  return v18;
}

void XPCActivity.register(deferralBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];

  v5 = (_QWORD *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  v8[4] = sub_21775DDD4;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_21775D754;
  v8[3] = &unk_24D803220;
  v6 = _Block_copy(v8);
  swift_retain();
  sub_2177466AC();
  swift_release();
  v7 = xpc_activity_add_eligibility_changed_handler();
  _Block_release(v6);
  *(_QWORD *)(v2 + 40) = v7;
}

uint64_t sub_21775DB60(_xpc_activity_s *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;

  result = xpc_activity_should_defer(a1);
  if ((_DWORD)result)
  {
    if (qword_254F00248 != -1)
      swift_once();
    v6 = sub_21775E10C();
    sub_2177462A0(v6, (uint64_t)qword_254F00EC8);
    v7 = sub_21775E2C8();
    swift_retain();
    v8 = sub_21775E0F4();
    v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      v16 = a3;
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v17 = v11;
      *(_DWORD *)v10 = 136315138;
      v13 = *(_QWORD *)(a2 + 24);
      v12 = *(_QWORD *)(a2 + 32);
      swift_bridgeObjectRetain();
      sub_21774CA64(v13, v12, &v17);
      sub_21775E31C();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_217744000, v8, v9, "%s XPC Activity registered deferral block will be invoked", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A11B68](v11, -1, -1);
      MEMORY[0x219A11B68](v10, -1, -1);

      return v16(v14);
    }
    else
    {

      v15 = swift_release();
      return a3(v15);
    }
  }
  return result;
}

uint64_t XPCActivity.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t XPCActivity.__deallocating_deinit()
{
  XPCActivity.deinit();
  return swift_deallocClassInstance();
}

BOOL sub_21775DD64()
{
  return XPCActivity.deferIfNecessary()();
}

void sub_21775DD88(uint64_t a1, uint64_t a2)
{
  XPCActivity.register(deferralBlock:)(a1, a2);
}

uint64_t sub_21775DDA8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21775DDD4(_xpc_activity_s *a1)
{
  uint64_t v1;

  return sub_21775DB60(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_21775DDE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_21775DDF0()
{
  return swift_release();
}

uint64_t dispatch thunk of DeferrableActivity.deferIfNecessary()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DeferrableActivity.register(deferralBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for XPCActivity()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCActivity()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_21775DE34()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_21775DE60(_xpc_activity_s *a1)
{
  uint64_t v1;

  sub_21775D3C4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(_QWORD))(v1 + 32));
}

uint64_t sub_21775DE74()
{
  return swift_slowAlloc();
}

uint64_t sub_21775DE84()
{
  return swift_arrayDestroy();
}

void sub_21775DFC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21775DFDC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21775DFEC(uint64_t a1)
{

}

void sub_21775DFF4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t sub_21775E040()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21775E04C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21775E058()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_21775E064()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21775E070()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_21775E07C()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21775E088()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21775E094()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_21775E0A0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21775E0AC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21775E0B8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21775E0C4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21775E0D0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21775E0DC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21775E0E8()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_21775E0F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21775E100()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21775E10C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21775E118()
{
  return MEMORY[0x24BDBFCC0]();
}

uint64_t sub_21775E124()
{
  return MEMORY[0x24BDBFDB0]();
}

uint64_t sub_21775E130()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_21775E13C()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_21775E148()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21775E154()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21775E160()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21775E16C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21775E178()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_21775E184()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_21775E190()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21775E19C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21775E1A8()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21775E1B4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21775E1C0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21775E1CC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_21775E1D8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21775E1E4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21775E1F0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21775E1FC()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_21775E208()
{
  return MEMORY[0x24BEE0AE0]();
}

uint64_t sub_21775E214()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21775E220()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21775E22C()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_21775E238()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21775E244()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21775E250()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21775E25C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21775E268()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21775E274()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_21775E280()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_21775E28C()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_21775E298()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_21775E2A4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21775E2B0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21775E2BC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21775E2C8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21775E2D4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21775E2E0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21775E2EC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21775E2F8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21775E304()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_21775E310()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_21775E31C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21775E328()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21775E334()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21775E340()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21775E34C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21775E358()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21775E364()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21775E370()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21775E37C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21775E388()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21775E394()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21775E3A0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21775E3AC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21775E3B8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21775E3C4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21775E3D0()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_21775E3DC()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_21775E3E8()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_21775E3F4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21775E400()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21775E40C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21775E418()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21775E424()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21775E430()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21775E43C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21775E448()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21775E454()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21775E460()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21775E46C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21775E478()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21775E484()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21775E490()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21775E49C()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_21775E4A8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21775E4B4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21775E4C0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x24BDD8270]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x24BDD8370]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x24BDD8398]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x24BDD83B8]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x24BDD83E8](client, key, property);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return MEMORY[0x24BDB05C8]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

