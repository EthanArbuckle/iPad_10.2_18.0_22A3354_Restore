uint64_t sub_23DB64698()
{
  uint64_t v0;

  v0 = sub_23DB6DA0C();
  __swift_allocate_value_buffer(v0, qword_25431D138);
  __swift_project_value_buffer(v0, (uint64_t)qword_25431D138);
  return sub_23DB6DA00();
}

HeadphoneProxFeatureService::HeadphoneProxFeatureManager::HeadphoneProxFeature_optional __swiftcall HeadphoneProxFeatureManager.HeadphoneProxFeature.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HeadphoneProxFeatureService::HeadphoneProxFeatureManager::HeadphoneProxFeature_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23DB6DB68();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t HeadphoneProxFeatureManager.HeadphoneProxFeature.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23DB647A8 + 4 * byte_23DB6DFD0[*v0]))(0xD000000000000014, 0x800000023DB6E1C0);
}

uint64_t sub_23DB647A8()
{
  return 0x77654E7374616877;
}

unint64_t sub_23DB647C0()
{
  return 0xD000000000000010;
}

uint64_t sub_23DB647DC()
{
  return 0x7473654764616568;
}

void sub_23DB647FC(char *a1)
{
  sub_23DB64808(*a1);
}

void sub_23DB64808(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_23DB64854(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23DB648C8 + 4 * byte_23DB6DFD8[a2]))(0x77654E7374616877);
}

uint64_t sub_23DB648C8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x77654E7374616877 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_23DB6DB80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23DB6497C()
{
  char *v0;

  sub_23DB64984(*v0);
}

void sub_23DB64984(char a1)
{
  sub_23DB6DBA4();
  __asm { BR              X10 }
}

uint64_t sub_23DB649DC()
{
  sub_23DB6DA84();
  swift_bridgeObjectRelease();
  return sub_23DB6DBB0();
}

void sub_23DB64A58(uint64_t a1)
{
  char *v1;

  sub_23DB64A60(a1, *v1);
}

void sub_23DB64A60(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23DB64AA8()
{
  sub_23DB6DA84();
  return swift_bridgeObjectRelease();
}

void sub_23DB64B10(uint64_t a1)
{
  char *v1;

  sub_23DB64B18(a1, *v1);
}

void sub_23DB64B18(uint64_t a1, char a2)
{
  sub_23DB6DBA4();
  __asm { BR              X10 }
}

uint64_t sub_23DB64B6C()
{
  sub_23DB6DA84();
  swift_bridgeObjectRelease();
  return sub_23DB6DBB0();
}

HeadphoneProxFeatureService::HeadphoneProxFeatureManager::HeadphoneProxFeature_optional sub_23DB64BE8(Swift::String *a1)
{
  return HeadphoneProxFeatureManager.HeadphoneProxFeature.init(rawValue:)(*a1);
}

uint64_t sub_23DB64BF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HeadphoneProxFeatureManager.HeadphoneProxFeature.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23DB64C18()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t aBlock;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  type metadata accessor for HeadphoneProxFeatureManager();
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v0 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09A38]), sel_init);
  *(_QWORD *)(v0 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09A20]), sel_init);
  *(_QWORD *)(v0 + 48) = 0;
  swift_unknownObjectWeakInit();
  *(_DWORD *)(v0 + 64) = -1;
  if (qword_25431D130 != -1)
    swift_once();
  v1 = sub_23DB6DA0C();
  __swift_project_value_buffer(v1, (uint64_t)qword_25431D138);
  v2 = sub_23DB6D9F4();
  v3 = sub_23DB6DAC0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23DB63000, v2, v3, "HeadphoneProxFeatureService: Init", v4, 2u);
    MEMORY[0x24263BCC4](v4, -1, -1);
  }

  v5 = objc_allocWithZone(MEMORY[0x24BE09A40]);
  v6 = (void *)sub_23DB6DA54();
  v7 = objc_msgSend(v5, sel_initWithBluetoothAddress_, v6);

  objc_msgSend(v7, sel_setHeadGesturesVersion_, 1);
  objc_msgSend(v7, sel_setVoiceQualityVersion_, 1);
  objc_msgSend(v7, sel_setWhatsNewVersion_, 1);
  objc_msgSend(v7, sel_setHeartRateVersion_, 1);
  *(_QWORD *)(v0 + 56) = v7;
  sub_23DB65490();
  swift_beginAccess();
  v8 = MEMORY[0x24BDAC760];
  if (*(_DWORD *)(v0 + 64) == -1)
  {
    sub_23DB6D824(0, &qword_256CE7418);
    v9 = sub_23DB6DAD8();
    v10 = swift_allocObject();
    swift_weakInit();
    v22 = sub_23DB6D85C;
    v23 = v10;
    aBlock = v8;
    v19 = 1107296256;
    v20 = sub_23DB65224;
    v21 = &block_descriptor_41;
    v11 = _Block_copy(&aBlock);
    swift_release();
    swift_beginAccess();
    notify_register_dispatch("com.apple.AudioAccessory.daemonStarted", (int *)(v0 + 64), v9, v11);
    swift_endAccess();
    _Block_release(v11);

  }
  v12 = *(void **)(v0 + 32);
  v22 = sub_23DB65260;
  v23 = 0;
  aBlock = v8;
  v19 = 1107296256;
  v20 = sub_23DB6526C;
  v21 = &block_descriptor_34;
  v13 = _Block_copy(&aBlock);
  v14 = v12;
  objc_msgSend(v14, sel_setInterruptionHandler_, v13);
  _Block_release(v13);

  v15 = *(void **)(v0 + 32);
  v22 = sub_23DB65298;
  v23 = 0;
  aBlock = v8;
  v19 = 1107296256;
  v20 = sub_23DB6526C;
  v21 = &block_descriptor_37;
  v16 = _Block_copy(&aBlock);
  v17 = v15;
  objc_msgSend(v17, sel_setInvalidationHandler_, v16);
  _Block_release(v16);

  qword_25431D110 = v0;
}

uint64_t static HeadphoneProxFeatureManager.shared.getter()
{
  if (qword_25431D128 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_23DB64FF4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 40;
  swift_beginAccess();
  result = MEMORY[0x24263BD0C](v4);
  v6 = *(_QWORD *)(v3 + 48);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_23DB6504C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 48) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_23DB650A4()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x24263BD0C](v0 + 40);
}

uint64_t sub_23DB650E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 48) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_23DB65148(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x24263BD0C](v1 + 40);
  v5 = *(_QWORD *)(v1 + 48);
  v3[3] = v4;
  v3[4] = v5;
  return sub_23DB651B4;
}

void sub_23DB651B4(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 48) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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

uint64_t sub_23DB65224(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_23DB65260()
{
  sub_23DB652A4("HeadphoneProxFeatureService: Cloud Service Interruption Received");
}

uint64_t sub_23DB6526C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_23DB65298()
{
  sub_23DB652A4("HeadphoneProxFeatureService: Cloud Service Invalidation Received");
}

void sub_23DB652A4(const char *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  NSObject *oslog;

  if (qword_25431D130 != -1)
    swift_once();
  v2 = sub_23DB6DA0C();
  __swift_project_value_buffer(v2, (uint64_t)qword_25431D138);
  oslog = sub_23DB6D9F4();
  v3 = sub_23DB6DAC0();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23DB63000, oslog, v3, a1, v4, 2u);
    MEMORY[0x24263BCC4](v4, -1, -1);
  }

}

unint64_t sub_23DB65378(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE73F0);
  v2 = (_QWORD *)sub_23DB6DB50();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_23DB6BD7C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

void sub_23DB65490()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09A38]), sel_init);
  v2 = *(void **)(v0 + 24);
  *(_QWORD *)(v0 + 24) = v1;

  v3 = *(void **)(v0 + 24);
  v4 = swift_allocObject();
  swift_weakInit();
  v25 = sub_23DB6C114;
  v26 = v4;
  v5 = MEMORY[0x24BDAC760];
  v21 = MEMORY[0x24BDAC760];
  v22 = 1107296256;
  v23 = sub_23DB6526C;
  v24 = &block_descriptor_9;
  v6 = _Block_copy(&v21);
  v7 = v3;
  swift_release();
  objc_msgSend(v7, sel_setInterruptionHandler_, v6);
  _Block_release(v6);

  v8 = *(void **)(v0 + 24);
  v9 = swift_allocObject();
  swift_weakInit();
  v25 = sub_23DB6C120;
  v26 = v9;
  v21 = v5;
  v22 = 1107296256;
  v23 = sub_23DB6526C;
  v24 = &block_descriptor_13;
  v10 = _Block_copy(&v21);
  v11 = v8;
  swift_release();
  objc_msgSend(v11, sel_setInvalidationHandler_, v10);
  _Block_release(v10);

  v12 = *(void **)(v0 + 24);
  v25 = sub_23DB6C268;
  v26 = v0;
  v21 = v5;
  v22 = 1107296256;
  v23 = sub_23DB65E98;
  v24 = &block_descriptor_16;
  v13 = _Block_copy(&v21);
  v14 = v12;
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_setDeviceFoundHandler_, v13);
  _Block_release(v13);

  v15 = *(void **)(v0 + 24);
  v25 = sub_23DB6C270;
  v26 = v0;
  v21 = v5;
  v22 = 1107296256;
  v23 = sub_23DB65E98;
  v24 = &block_descriptor_19;
  v16 = _Block_copy(&v21);
  swift_retain();
  v17 = v15;
  swift_release();
  objc_msgSend(v17, sel_setDeviceLostHandler_, v16);
  _Block_release(v16);

  v18 = *(void **)(v0 + 24);
  v25 = sub_23DB65EE8;
  v26 = 0;
  v21 = v5;
  v22 = 1107296256;
  v23 = sub_23DB66124;
  v24 = &block_descriptor_22;
  v19 = _Block_copy(&v21);
  v20 = v18;
  objc_msgSend(v20, sel_activateWithCompletion_, v19);
  _Block_release(v19);

}

void sub_23DB65758(void *a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  SEL *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char v15;
  char v16;
  os_log_type_t v17;
  uint8_t *v18;
  Class isa;
  unint64_t v20;
  char v21;
  id v22;
  unsigned int v23;
  _BOOL4 v24;
  id v25;
  char isUniquelyReferenced_nonNull_native;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_log_t v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char v52;
  id v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  BOOL v58;
  _QWORD *v59;
  unint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  Class v63;
  uint64_t ObjectType;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  os_log_t v70;
  uint64_t v71;
  objc_class *v72;

  v4 = sub_23DB6DA0C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (SEL *)&unk_250E7D000;
  v9 = objc_msgSend(a1, sel_bluetoothAddress);
  if (!v9)
  {
    if (qword_25431D130 != -1)
      swift_once();
    __swift_project_value_buffer(v4, (uint64_t)qword_25431D138);
    v70 = (os_log_t)sub_23DB6D9F4();
    v17 = sub_23DB6DAB4();
    if (os_log_type_enabled(v70, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_23DB63000, v70, v17, "HeadphoneProxFeatureService: AADevice has no address", v18, 2u);
      MEMORY[0x24263BCC4](v18, -1, -1);
    }

    return;
  }
  v10 = v9;
  v69 = v5;
  sub_23DB6DA60();

  v11 = sub_23DB6DA78();
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = a2 + 2;
  swift_beginAccess();
  v70 = a2;
  if (*((_QWORD *)a2[2].isa + 2))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23DB6BD7C(v11, v13);
    v16 = v15 ^ 1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 1;
  }
  isa = v14->isa;
  if (!*((_QWORD *)v14->isa + 2))
    goto LABEL_14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = sub_23DB6BD7C(v11, v13);
  if ((v21 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    objc_msgSend(a1, sel_bobbleCapability);
    v24 = 0;
    goto LABEL_15;
  }
  v22 = *(id *)(*((_QWORD *)isa + 7) + 8 * v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend(v22, sel_bobbleCapability);

  v8 = (SEL *)&unk_250E7D000;
  v24 = v23 == objc_msgSend(a1, sel_bobbleCapability);
LABEL_15:
  swift_beginAccess();
  v25 = a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v72 = v14->isa;
  v14->isa = (Class)0x8000000000000000;
  v68 = v25;
  sub_23DB6CC44((uint64_t)v25, v11, v13, isUniquelyReferenced_nonNull_native);
  v14->isa = v72;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v16 & 1 | !v24)
  {
    v27 = v70 + 5;
    swift_beginAccess();
    v28 = MEMORY[0x24263BD0C](v27);
    swift_unknownObjectRelease();
    if (v28)
    {
      if (qword_25431D130 != -1)
        swift_once();
      v29 = __swift_project_value_buffer(v4, (uint64_t)qword_25431D138);
      v30 = v69;
      (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v7, v29, v4);
      v31 = v70;
      swift_retain_n();
      v32 = sub_23DB6D9F4();
      v33 = sub_23DB6DAC0();
      v34 = v33;
      if (os_log_type_enabled(v32, v33))
      {
        v35 = swift_slowAlloc();
        v67 = v27;
        v36 = v35;
        v66 = swift_slowAlloc();
        v72 = (objc_class *)v66;
        *(_DWORD *)v36 = 136315650;
        if ((v16 & 1) != 0)
          v37 = 5457241;
        else
          v37 = 20302;
        if ((v16 & 1) != 0)
          v38 = 0xE300000000000000;
        else
          v38 = 0xE200000000000000;
        v71 = sub_23DB6B73C(v37, v38, (uint64_t *)&v72);
        HIDWORD(v65) = v34;
        sub_23DB6DAE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        if (v24)
          v39 = 20302;
        else
          v39 = 5457241;
        if (v24)
          v40 = 0xE200000000000000;
        else
          v40 = 0xE300000000000000;
        v71 = sub_23DB6B73C(v39, v40, (uint64_t *)&v72);
        sub_23DB6DAE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 22) = 2080;
        v41 = MEMORY[0x24263BD0C](v67);
        swift_unknownObjectRelease();
        if (v41)
          v42 = 5457241;
        else
          v42 = 20302;
        if (v41)
          v43 = 0xE300000000000000;
        else
          v43 = 0xE200000000000000;
        v71 = sub_23DB6B73C(v42, v43, (uint64_t *)&v72);
        v8 = (SEL *)&unk_250E7D000;
        sub_23DB6DAE4();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DB63000, v32, BYTE4(v65), "HeadphoneProxFeatureService: Device Found: First Time of Connection: %s, Capability Ready: %s, Delegate Set: %s", (uint8_t *)v36, 0x20u);
        v44 = v66;
        swift_arrayDestroy();
        MEMORY[0x24263BCC4](v44, -1, -1);
        v45 = v36;
        v27 = v67;
        MEMORY[0x24263BCC4](v45, -1, -1);

        (*(void (**)(char *, uint64_t))(v69 + 8))(v7, v4);
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v4);
      }
      v46 = v68;
      v47 = objc_msgSend(v68, v8[139]);
      if (v47)
      {
        v48 = v47;
        v49 = sub_23DB6DA60();
        v51 = v50;

      }
      else
      {
        v49 = 0;
        v51 = 0;
      }
      v52 = sub_23DB685A8(v49, v51);
      swift_bridgeObjectRelease();
      if ((v52 & 1) == 0)
        goto LABEL_52;
      v53 = objc_msgSend(v46, v8[139]);
      if (v53)
      {
        v54 = v53;
        v55 = sub_23DB6DA60();
        v57 = v56;

      }
      else
      {
        v55 = 0;
        v57 = 0;
      }
      v58 = sub_23DB671B4(v55, v57);
      swift_bridgeObjectRelease();
      if (v58)
      {
        v59 = sub_23DB6B538(0, 1, 1, MEMORY[0x24BEE4AF8]);
        v61 = v59[2];
        v60 = v59[3];
        if (v61 >= v60 >> 1)
          v59 = sub_23DB6B538((_QWORD *)(v60 > 1), v61 + 1, 1, v59);
        v59[2] = v61 + 1;
        v62 = &v59[2 * v61];
        v62[4] = 0x77654E7374616877;
        v62[5] = 0xE800000000000000;
        if (!v59[2])
          goto LABEL_55;
      }
      else
      {
LABEL_52:
        v59 = (_QWORD *)MEMORY[0x24BEE4AF8];
        if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
        {
LABEL_55:
          swift_bridgeObjectRelease();
          return;
        }
      }
      if (MEMORY[0x24263BD0C](v27))
      {
        v63 = v31[6].isa;
        ObjectType = swift_getObjectType();
        (*((void (**)(id, _QWORD *, uint64_t, Class))v63 + 1))(v46, v59, ObjectType, v63);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return;
      }
      goto LABEL_55;
    }
  }
}

void sub_23DB65E98(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23DB65EE8(void *a1)
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
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = sub_23DB6DA0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25431D130 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_25431D138);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = a1;
  v9 = sub_23DB6D9F4();
  v10 = sub_23DB6DAC0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v18 = v3;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    v20 = v13;
    if (a1)
      v14 = 0x64656C696146;
    else
      v14 = 0x6564656563637553;
    if (a1)
      v15 = 0xE600000000000000;
    else
      v15 = 0xE900000000000064;
    v19 = sub_23DB6B73C(v14, v15, &v20);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23DB63000, v9, v10, "HeadphoneProxFeatureService: Device Manager Activation %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263BCC4](v13, -1, -1);
    MEMORY[0x24263BCC4](v12, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v5, v2);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_23DB66124(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_23DB66178(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v25;
  NSObject *oslog;
  uint64_t aBlock;
  uint64_t v28;

  if (a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = qword_25431D130;
    swift_bridgeObjectRetain();
    if (v5)
    {
      if (v6 != -1)
        swift_once();
      v25 = sub_23DB6DA0C();
      __swift_project_value_buffer(v25, (uint64_t)qword_25431D138);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v7 = sub_23DB6D9F4();
      v8 = sub_23DB6DAC0();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = swift_slowAlloc();
        v10 = swift_slowAlloc();
        aBlock = v10;
        *(_DWORD *)v9 = 136315394;
        swift_bridgeObjectRetain();
        v28 = sub_23DB6B73C(a1, a2, &aBlock);
        sub_23DB6DAE4();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v9 + 12) = 2080;
        v11 = MEMORY[0x24263B874](a3, &type metadata for HeadphoneProxFeatureManager.HeadphoneProxFeature);
        v28 = sub_23DB6B73C(v11, v12, &aBlock);
        sub_23DB6DAE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DB63000, v7, v8, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: %s", (uint8_t *)v9, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24263BCC4](v10, -1, -1);
        MEMORY[0x24263BCC4](v9, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      v21 = objc_allocWithZone(MEMORY[0x24BE09A40]);
      swift_bridgeObjectRetain();
      v22 = (void *)sub_23DB6DA54();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v21, sel_initWithBluetoothAddress_, v22);

      objc_msgSend(v23, sel_setHeadGesturesVersion_, 0);
      objc_msgSend(v23, sel_setVoiceQualityVersion_, 0);
      objc_msgSend(v23, sel_setWhatsNewVersion_, 0);
      objc_msgSend(v23, sel_setHeartRateVersion_, 0);
      swift_bridgeObjectRetain();
      __asm { BR              X9 }
    }
    if (v6 != -1)
      swift_once();
    v16 = sub_23DB6DA0C();
    __swift_project_value_buffer(v16, (uint64_t)qword_25431D138);
    swift_bridgeObjectRetain();
    v17 = sub_23DB6D9F4();
    v18 = sub_23DB6DAC0();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      aBlock = v20;
      *(_DWORD *)v19 = 136315138;
      swift_bridgeObjectRetain();
      v28 = sub_23DB6B73C(a1, a2, &aBlock);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23DB63000, v17, v18, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Showed Feature Empty, Return", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v20, -1, -1);
      MEMORY[0x24263BCC4](v19, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_25431D130 != -1)
      swift_once();
    v13 = sub_23DB6DA0C();
    __swift_project_value_buffer(v13, (uint64_t)qword_25431D138);
    oslog = sub_23DB6D9F4();
    v14 = sub_23DB6DAC0();
    if (os_log_type_enabled(oslog, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23DB63000, oslog, v14, "HeadphoneProxFeatureService: setProxCardShowedFeatures: Invalid Device, Return", v15, 2u);
      MEMORY[0x24263BCC4](v15, -1, -1);
    }

  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

BOOL sub_23DB671B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  os_log_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  id v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  int AppBooleanValue;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  void *v63;
  uint64_t v64;
  os_log_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  id v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77[3];
  id v78;

  v3 = v2;
  v6 = sub_23DB6DA0C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v66 - v11;
  if (!a2)
    goto LABEL_18;
  v13 = sub_23DB6DA78();
  v15 = v14;
  swift_beginAccess();
  v16 = *(_QWORD *)(v2 + 16);
  if (!*(_QWORD *)(v16 + 16))
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    if (qword_25431D130 != -1)
      swift_once();
    v38 = __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v38, v6);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v39 = sub_23DB6D9F4();
    v40 = sub_23DB6DAC0();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = swift_slowAlloc();
      v42 = (id)swift_slowAlloc();
      v75 = v7;
      v43 = v42;
      v78 = v42;
      *(_DWORD *)v41 = 136315394;
      if (a2)
      {
        v44 = a2;
      }
      else
      {
        a1 = 4999502;
        v44 = 0xE300000000000000;
      }
      v74 = v6;
      swift_bridgeObjectRetain();
      v77[0] = sub_23DB6B73C(a1, v44, (uint64_t *)&v78);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2080;
      swift_beginAccess();
      sub_23DB6D824(0, &qword_256CE73D0);
      swift_bridgeObjectRetain();
      v45 = sub_23DB6DA48();
      v47 = v46;
      swift_bridgeObjectRelease();
      v76 = sub_23DB6B73C(v45, v47, (uint64_t *)&v78);
      sub_23DB6DAE4();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB63000, v39, v40, "HeadphoneProxFeatureService: shouldShowHeadGesturesCard: Invalid Device, Return false address: %s %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v43, -1, -1);
      MEMORY[0x24263BCC4](v41, -1, -1);

      (*(void (**)(char *, uint64_t))(v75 + 8))(v10, v74);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_23DB6BD7C(v13, v15);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  v19 = *(id *)(*(_QWORD *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (objc_msgSend(v19, sel_bobbleCapability) != 2)
  {
    swift_bridgeObjectRelease();
    if (qword_25431D130 != -1)
      swift_once();
    __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
    swift_retain_n();
    v49 = sub_23DB6D9F4();
    v50 = sub_23DB6DAC0();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v77[0] = v52;
      v71 = v19;
      *(_DWORD *)v51 = 136315138;
      sub_23DB6D824(0, &qword_256CE73D0);
      swift_bridgeObjectRetain();
      v53 = sub_23DB6DA48();
      v55 = v54;
      swift_bridgeObjectRelease();
      v78 = (id)sub_23DB6B73C(v53, v55, v77);
      sub_23DB6DAE4();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB63000, v49, v50, "HeadphoneProxFeatureService: shouldShowHeadGesturesCard: device does not support head gesture, Return false %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v52, -1, -1);
      MEMORY[0x24263BCC4](v51, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    return 0;
  }
  v20 = sub_23DB6A850(v13, v15);
  v73 = objc_msgSend(v20, sel_headGesturesVersion);
  v72 = objc_msgSend(*(id *)(v3 + 56), sel_headGesturesVersion);
  if (qword_25431D130 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v21, v6);
  swift_bridgeObjectRetain_n();
  v22 = v20;
  swift_retain_n();
  v23 = v22;
  v24 = sub_23DB6D9F4();
  v25 = sub_23DB6DAC0();
  v69 = v25;
  v26 = os_log_type_enabled(v24, v25);
  v70 = v23;
  if (v26)
  {
    v27 = swift_slowAlloc();
    v71 = v19;
    v28 = v27;
    v67 = swift_slowAlloc();
    v77[0] = v67;
    *(_DWORD *)v28 = 136315906;
    v66 = v24;
    swift_bridgeObjectRetain();
    v78 = (id)sub_23DB6B73C(v13, v15, v77);
    v75 = v7;
    sub_23DB6DAE4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v28 + 12) = 2080;
    if (v73 >= v72)
      v29 = 20302;
    else
      v29 = 5457241;
    if (v73 >= v72)
      v30 = 0xE200000000000000;
    else
      v30 = 0xE300000000000000;
    v68 = v21;
    v78 = (id)sub_23DB6B73C(v29, v30, v77);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 22) = 2080;
    v78 = objc_msgSend(v23, sel_headGesturesVersion);
    sub_23DB6BDE0();
    v74 = v6;
    v31 = sub_23DB6DAFC();
    v78 = (id)sub_23DB6B73C(v31, v32, v77);
    sub_23DB6DAE4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 32) = 2080;
    v78 = objc_msgSend(*(id *)(v3 + 56), sel_headGesturesVersion);
    v33 = sub_23DB6DAFC();
    v78 = (id)sub_23DB6B73C(v33, v34, v77);
    sub_23DB6DAE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    v35 = v66;
    _os_log_impl(&dword_23DB63000, v66, (os_log_type_t)v69, "HeadphoneProxFeatureService: [%s] shouldShowHeadGesturesCard: %s, Current Version: %s, Taget Version: %s", (uint8_t *)v28, 0x2Au);
    v36 = v67;
    swift_arrayDestroy();
    MEMORY[0x24263BCC4](v36, -1, -1);
    v37 = v28;
    v19 = v71;
    MEMORY[0x24263BCC4](v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v75 + 8))(v12, v74);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  v56 = (__CFString *)sub_23DB6DA54();
  CFPreferencesAppSynchronize(v56);

  v57 = (__CFString *)sub_23DB6DA54();
  v58 = (__CFString *)sub_23DB6DA54();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v57, v58, 0);

  if (!AppBooleanValue)
  {
    swift_bridgeObjectRelease();

LABEL_38:
    return v73 < v72 || AppBooleanValue != 0;
  }
  swift_bridgeObjectRetain();
  v60 = sub_23DB6D9F4();
  v61 = sub_23DB6DAC0();
  if (!os_log_type_enabled(v60, v61))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_38;
  }
  v62 = (uint8_t *)swift_slowAlloc();
  v63 = v19;
  v64 = swift_slowAlloc();
  v77[0] = v64;
  *(_DWORD *)v62 = 136315138;
  swift_bridgeObjectRetain();
  v78 = (id)sub_23DB6B73C(v13, v15, v77);
  sub_23DB6DAE4();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_23DB63000, v60, v61, "HeadphoneProxFeatureService: [%s] shouldShowHeadGesturesCard: Force Show!", v62, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x24263BCC4](v64, -1, -1);
  MEMORY[0x24263BCC4](v62, -1, -1);

  return v73 < v72 || AppBooleanValue != 0;
}

void sub_23DB67C68(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (**v22)(char *, _QWORD);
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void (**v51)(char *, _QWORD);
  uint64_t v52;
  uint64_t v53;
  uint64_t aBlock[6];
  uint64_t v55;
  uint64_t v56;

  v4 = v3;
  v8 = sub_23DB6DA0C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v49 - v13;
  if (a2)
  {
    LODWORD(v53) = a3;
    v15 = a1;
    v16 = sub_23DB6DA78();
    v18 = v17;
    swift_beginAccess();
    v19 = *(_QWORD *)(v4 + 16);
    if (*(_QWORD *)(v19 + 16))
    {
      swift_bridgeObjectRetain();
      v20 = sub_23DB6BD7C(v16, v18);
      if ((v21 & 1) != 0)
      {
        v52 = v4;
        v22 = (void (**)(char *, _QWORD))*(id *)(*(_QWORD *)(v19 + 56) + 8 * v20);
        swift_bridgeObjectRelease();
        if (qword_25431D130 != -1)
          swift_once();
        v23 = __swift_project_value_buffer(v8, (uint64_t)qword_25431D138);
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v23, v8);
        swift_bridgeObjectRetain();
        v24 = sub_23DB6D9F4();
        v25 = sub_23DB6DAC0();
        v26 = os_log_type_enabled(v24, v25);
        v27 = v53;
        if (v26)
        {
          v28 = swift_slowAlloc();
          v51 = v22;
          v29 = v28;
          v50 = swift_slowAlloc();
          aBlock[0] = v50;
          *(_DWORD *)v29 = 136315394;
          swift_bridgeObjectRetain();
          v56 = sub_23DB6B73C(v16, v18, aBlock);
          sub_23DB6DAE4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v29 + 12) = 2080;
          if ((v27 & 1) != 0)
            v30 = 0x64656C62616E45;
          else
            v30 = 0x64656C6261736944;
          if ((v27 & 1) != 0)
            v31 = 0xE700000000000000;
          else
            v31 = 0xE800000000000000;
          v56 = sub_23DB6B73C(v30, v31, aBlock);
          sub_23DB6DAE4();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23DB63000, v24, v25, "HeadphoneProxFeatureService: [%s] setHeadGesturesConfig: %s", (uint8_t *)v29, 0x16u);
          v32 = v50;
          swift_arrayDestroy();
          MEMORY[0x24263BCC4](v32, -1, -1);
          v33 = v29;
          v22 = v51;
          MEMORY[0x24263BCC4](v33, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
        v44 = v52;
        if ((v27 & 1) != 0)
        {
          v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09A30]), sel_init);
          objc_msgSend(v45, sel_setHeadGestureToggle_, 1);
          v46 = *(id *)(v44 + 24);
          v47 = objc_msgSend(v22, sel_identifier);
          if (!v47)
          {
            sub_23DB6DA60();
            v47 = (id)sub_23DB6DA54();
            swift_bridgeObjectRelease();
          }
          aBlock[4] = (uint64_t)sub_23DB68308;
          aBlock[5] = 0;
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_23DB66124;
          aBlock[3] = (uint64_t)&block_descriptor_3;
          v48 = _Block_copy(aBlock);
          objc_msgSend(v46, sel_sendDeviceConfig_identifier_completion_, v45, v47, v48);
          _Block_release(v48);

        }
        else
        {

        }
        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    a1 = v15;
  }
  if (qword_25431D130 != -1)
    swift_once();
  v34 = __swift_project_value_buffer(v8, (uint64_t)qword_25431D138);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v34, v8);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v35 = sub_23DB6D9F4();
  v36 = sub_23DB6DAC0();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = swift_slowAlloc();
    v53 = swift_slowAlloc();
    v56 = v53;
    *(_DWORD *)v37 = 136315394;
    swift_beginAccess();
    v50 = a1;
    sub_23DB6D824(0, &qword_256CE73D0);
    v52 = v8;
    swift_bridgeObjectRetain();
    v38 = sub_23DB6DA48();
    v51 = (void (**)(char *, _QWORD))v9;
    v40 = v39;
    swift_bridgeObjectRelease();
    v55 = sub_23DB6B73C(v38, v40, &v56);
    sub_23DB6DAE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2080;
    if (a2)
      v41 = v50;
    else
      v41 = 4999502;
    if (a2)
      v42 = a2;
    else
      v42 = 0xE300000000000000;
    swift_bridgeObjectRetain();
    v55 = sub_23DB6B73C(v41, v42, &v56);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DB63000, v35, v36, "HeadphoneProxFeatureService: setHeadGesturesConfig: Invalid Device, Return %s %s", (uint8_t *)v37, 0x16u);
    v43 = v53;
    swift_arrayDestroy();
    MEMORY[0x24263BCC4](v43, -1, -1);
    MEMORY[0x24263BCC4](v37, -1, -1);

    v51[1](v12, v52);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

void sub_23DB68308(void *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *oslog;
  uint64_t v16;

  if (a1)
  {
    v2 = a1;
    if (qword_25431D130 != -1)
      swift_once();
    v3 = sub_23DB6DA0C();
    __swift_project_value_buffer(v3, (uint64_t)qword_25431D138);
    v4 = a1;
    v5 = a1;
    oslog = sub_23DB6D9F4();
    v6 = sub_23DB6DAB4();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v16 = v8;
      *(_DWORD *)v7 = 136315138;
      v9 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CE7408);
      v10 = sub_23DB6DA6C();
      sub_23DB6B73C(v10, v11, &v16);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23DB63000, oslog, v6, "HeadphoneProxFeatureService:  Failed to update AAD Device Config for Bobble, Error: %s ", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v8, -1, -1);
      MEMORY[0x24263BCC4](v7, -1, -1);

      return;
    }

  }
  else
  {
    if (qword_25431D130 != -1)
      swift_once();
    v12 = sub_23DB6DA0C();
    __swift_project_value_buffer(v12, (uint64_t)qword_25431D138);
    oslog = sub_23DB6D9F4();
    v13 = sub_23DB6DAC0();
    if (os_log_type_enabled(oslog, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_23DB63000, oslog, v13, "HeadphoneProxFeatureService: Successfully Updated AAD Device Config for Bobble", v14, 2u);
      MEMORY[0x24263BCC4](v14, -1, -1);
    }
  }

}

uint64_t sub_23DB685A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void (*v43)(_BYTE *);
  id v44;
  id v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  int AppBooleanValue;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  _BYTE v73[4];
  int v74;
  os_log_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83[3];
  id v84;

  v3 = v2;
  v6 = sub_23DB6DA0C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v73[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v73[-v11];
  if (!a2)
    goto LABEL_10;
  v13 = sub_23DB6DA78();
  v15 = v14;
  swift_beginAccess();
  v16 = *(_QWORD *)(v2 + 16);
  if (!*(_QWORD *)(v16 + 16))
  {
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    if (qword_25431D130 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v10, v23, v6);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v24 = sub_23DB6D9F4();
    v25 = sub_23DB6DAC0();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v79 = (id)swift_slowAlloc();
      v84 = v79;
      *(_DWORD *)v26 = 136315394;
      v78 = v26 + 4;
      swift_beginAccess();
      v81 = v6;
      sub_23DB6D824(0, &qword_256CE73D0);
      v80 = v7;
      swift_bridgeObjectRetain();
      v27 = sub_23DB6DA48();
      v28 = a1;
      v30 = v29;
      swift_bridgeObjectRelease();
      v82 = sub_23DB6B73C(v27, v30, (uint64_t *)&v84);
      sub_23DB6DAE4();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2080;
      if (a2)
        v31 = v28;
      else
        v31 = 4999502;
      if (a2)
        v32 = a2;
      else
        v32 = 0xE300000000000000;
      swift_bridgeObjectRetain();
      v82 = sub_23DB6B73C(v31, v32, (uint64_t *)&v84);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB63000, v24, v25, "HeadphoneProxFeatureService: shouldShowWhatsNewCard: Invalid Device, Return %s %s", (uint8_t *)v26, 0x16u);
      v33 = v79;
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v33, -1, -1);
      MEMORY[0x24263BCC4](v26, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v80 + 8))(v10, v81);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v10, v6);
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_23DB6BD7C(v13, v15);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  v19 = *(id *)(*(_QWORD *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (objc_msgSend(v19, sel_bobbleCapability) != 2)
  {
    swift_bridgeObjectRelease();
    if (qword_25431D130 != -1)
      swift_once();
    __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
    swift_retain_n();
    v35 = sub_23DB6D9F4();
    v36 = sub_23DB6DAC0();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v83[0] = v38;
      *(_DWORD *)v37 = 136315138;
      sub_23DB6D824(0, &qword_256CE73D0);
      v79 = v19;
      swift_bridgeObjectRetain();
      v39 = sub_23DB6DA48();
      v41 = v40;
      swift_bridgeObjectRelease();
      v84 = (id)sub_23DB6B73C(v39, v41, v83);
      sub_23DB6DAE4();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB63000, v35, v36, "HeadphoneProxFeatureService: shouldShowWhatsNewCard: device does not support head gesture, Return false %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v38, -1, -1);
      MEMORY[0x24263BCC4](v37, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    return 0;
  }
  v20 = sub_23DB6A850(v13, v15);
  v21 = objc_msgSend(v20, sel_whatsNewVersion);
  if (v21 >= objc_msgSend(*(id *)(v3 + 56), sel_whatsNewVersion))
  {
    LODWORD(v78) = 0;
  }
  else
  {
    v22 = objc_msgSend(v20, sel_headGesturesVersion);
    LODWORD(v78) = v22 < objc_msgSend(*(id *)(v3 + 56), sel_headGesturesVersion);
  }
  if (qword_25431D130 != -1)
    swift_once();
  v42 = __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
  v43 = *(void (**)(_BYTE *))(v7 + 16);
  v77 = v42;
  v43(v12);
  v44 = v20;
  swift_retain_n();
  v45 = v44;
  swift_bridgeObjectRetain_n();
  v46 = v45;
  v47 = sub_23DB6D9F4();
  v48 = sub_23DB6DAC0();
  v49 = v48;
  if (os_log_type_enabled(v47, v48))
  {
    v50 = swift_slowAlloc();
    v79 = v19;
    v51 = v50;
    v76 = swift_slowAlloc();
    v83[0] = v76;
    *(_DWORD *)v51 = 136316418;
    v75 = v47;
    swift_bridgeObjectRetain();
    v84 = (id)sub_23DB6B73C(v13, v15, v83);
    v74 = v49;
    sub_23DB6DAE4();
    swift_bridgeObjectRelease_n();
    v81 = v6;
    *(_WORD *)(v51 + 12) = 2080;
    if ((_DWORD)v78)
      v52 = 5457241;
    else
      v52 = 20302;
    if ((_DWORD)v78)
      v53 = 0xE300000000000000;
    else
      v53 = 0xE200000000000000;
    v84 = (id)sub_23DB6B73C(v52, v53, v83);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 22) = 2080;
    v84 = objc_msgSend(v46, sel_whatsNewVersion);
    sub_23DB6BDE0();
    v80 = v7;
    v54 = sub_23DB6DAFC();
    v84 = (id)sub_23DB6B73C(v54, v55, v83);
    sub_23DB6DAE4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 32) = 2080;
    v84 = objc_msgSend(*(id *)(v3 + 56), sel_whatsNewVersion);
    v56 = sub_23DB6DAFC();
    v84 = (id)sub_23DB6B73C(v56, v57, v83);
    sub_23DB6DAE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 42) = 2080;
    v84 = objc_msgSend(v46, sel_headGesturesVersion);
    v58 = sub_23DB6DAFC();
    v84 = (id)sub_23DB6B73C(v58, v59, v83);
    sub_23DB6DAE4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 52) = 2080;
    v84 = objc_msgSend(*(id *)(v3 + 56), sel_headGesturesVersion);
    v60 = sub_23DB6DAFC();
    v84 = (id)sub_23DB6B73C(v60, v61, v83);
    sub_23DB6DAE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    v62 = v75;
    _os_log_impl(&dword_23DB63000, v75, (os_log_type_t)v74, "HeadphoneProxFeatureService: [%s] shouldShowWhatsNewCard: %s, WN Current: %s, WN Taget: %s | HG Current: %s, HG Taget: %s", (uint8_t *)v51, 0x3Eu);
    v63 = v76;
    swift_arrayDestroy();
    MEMORY[0x24263BCC4](v63, -1, -1);
    v64 = v51;
    v19 = v79;
    MEMORY[0x24263BCC4](v64, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v80 + 8))(v12, v81);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  }
  v65 = (__CFString *)sub_23DB6DA54();
  CFPreferencesAppSynchronize(v65);

  v66 = (__CFString *)sub_23DB6DA54();
  v67 = (__CFString *)sub_23DB6DA54();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v66, v67, 0);

  if (AppBooleanValue)
  {
    swift_bridgeObjectRetain();
    v69 = sub_23DB6D9F4();
    v70 = sub_23DB6DAC0();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      v72 = swift_slowAlloc();
      v83[0] = v72;
      v79 = v19;
      *(_DWORD *)v71 = 136315138;
      swift_bridgeObjectRetain();
      v84 = (id)sub_23DB6B73C(v13, v15, v83);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23DB63000, v69, v70, "HeadphoneProxFeatureService: [%s] shouldShowWhatsNewCard: Force Show!", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v72, -1, -1);
      MEMORY[0x24263BCC4](v71, -1, -1);

      goto LABEL_45;
    }

    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();

  }
LABEL_45:
  if (AppBooleanValue)
    return 1;
  else
    return v78;
}

BOOL sub_23DB69194(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _BOOL8 v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  id v56;
  id v57;
  NSObject *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  os_log_t v70;
  uint64_t v71;
  id v72;
  int v73;
  id v74;
  _QWORD *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79[3];
  uint64_t v80[2];

  v3 = v2;
  v80[1] = *MEMORY[0x24BDAC8D0];
  v6 = sub_23DB6DA0C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v69 - v11;
  if (!a2)
    goto LABEL_21;
  v13 = sub_23DB6DA78();
  v15 = v14;
  swift_beginAccess();
  v16 = *(_QWORD *)(v2 + 16);
  if (!*(_QWORD *)(v16 + 16))
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    if (qword_25431D130 != -1)
      swift_once();
    v44 = __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v44, v6);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v45 = sub_23DB6D9F4();
    v46 = sub_23DB6DAC0();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = swift_slowAlloc();
      v75 = (_QWORD *)swift_slowAlloc();
      v80[0] = (uint64_t)v75;
      *(_DWORD *)v47 = 136315394;
      v74 = (id)(v47 + 4);
      swift_beginAccess();
      v76 = (id)v6;
      sub_23DB6D824(0, &qword_256CE73D0);
      v77 = v7;
      swift_bridgeObjectRetain();
      v48 = sub_23DB6DA48();
      v49 = a1;
      v51 = v50;
      swift_bridgeObjectRelease();
      v78 = sub_23DB6B73C(v48, v51, v80);
      sub_23DB6DAE4();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2080;
      if (a2)
        v52 = v49;
      else
        v52 = 4999502;
      if (a2)
        v53 = a2;
      else
        v53 = 0xE300000000000000;
      swift_bridgeObjectRetain();
      v78 = sub_23DB6B73C(v52, v53, v80);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB63000, v45, v46, "HeadphoneProxFeatureService: shouldShowHeartRateMonitor: Invalid Device, Return %s %s", (uint8_t *)v47, 0x16u);
      v54 = v75;
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v54, -1, -1);
      MEMORY[0x24263BCC4](v47, -1, -1);

      (*(void (**)(char *, id))(v77 + 8))(v10, v76);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_23DB6BD7C(v13, v15);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
  v19 = *(id *)(*(_QWORD *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = v19;
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_coreBluetoothDevice) & 1) == 0
    || (objc_msgSend(v20, sel_respondsToSelector_, sel_coreBluetoothDevice) & 1) == 0)
  {
    swift_bridgeObjectRelease();

    goto LABEL_35;
  }
  v21 = objc_msgSend(v20, sel_coreBluetoothDevice);

  if (!v21)
  {
LABEL_47:
    swift_bridgeObjectRelease();
LABEL_35:
    if (qword_25431D130 != -1)
      swift_once();
    __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
    v56 = v20;
    swift_retain_n();
    v57 = v56;
    v58 = sub_23DB6D9F4();
    v59 = sub_23DB6DAC0();
    if (!os_log_type_enabled(v58, (os_log_type_t)v59))
    {

      swift_release_n();
      return 0;
    }
    LODWORD(v76) = v59;
    v60 = swift_slowAlloc();
    v75 = (_QWORD *)swift_slowAlloc();
    v77 = swift_slowAlloc();
    v79[0] = v77;
    *(_DWORD *)v60 = 136315394;
    sub_23DB6D824(0, &qword_256CE73D0);
    swift_bridgeObjectRetain();
    v61 = sub_23DB6DA48();
    v63 = v62;
    swift_bridgeObjectRelease();
    v80[0] = sub_23DB6B73C(v61, v63, v79);
    sub_23DB6DAE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v60 + 12) = 2112;
    v64 = v57;
    if (objc_msgSend(v64, sel_respondsToSelector_, sel_coreBluetoothDevice)
      && (objc_msgSend(v64, sel_respondsToSelector_, 0x250E7D5AAuLL) & 1) != 0)
    {
      v65 = objc_msgSend(v64, (SEL)0x250E7D5AALL);

      if (v65)
      {
        v80[0] = (uint64_t)v65;
        sub_23DB6DAE4();
LABEL_45:
        v66 = v75;
        *v75 = v65;

        _os_log_impl(&dword_23DB63000, v58, (os_log_type_t)v76, "HeadphoneProxFeatureService: shouldShowWhatsNewCard: device does not support head gesture, Return false %s cbDevice: %@", (uint8_t *)v60, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256CE73E0);
        swift_arrayDestroy();
        MEMORY[0x24263BCC4](v66, -1, -1);
        v67 = v77;
        swift_arrayDestroy();
        MEMORY[0x24263BCC4](v67, -1, -1);
        MEMORY[0x24263BCC4](v60, -1, -1);

        return 0;
      }
    }
    else
    {

    }
    v80[0] = 0;
    sub_23DB6DAE4();
    v65 = 0;
    goto LABEL_45;
  }
  if (objc_msgSend(v21, sel_productID) != 8221)
  {

    goto LABEL_47;
  }
  v75 = v21;
  v22 = sub_23DB6A850(v13, v15);
  v23 = objc_msgSend(v22, sel_heartRateVersion);
  v24 = objc_msgSend(*(id *)(v3 + 56), sel_heartRateVersion);
  v76 = v23;
  v72 = v24;
  v25 = v23 < v24;
  if (qword_25431D130 != -1)
    swift_once();
  v26 = __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v26, v6);
  v27 = v22;
  swift_retain_n();
  swift_bridgeObjectRetain();
  v74 = v27;
  v28 = sub_23DB6D9F4();
  v29 = sub_23DB6DAC0();
  v73 = v29;
  v30 = os_log_type_enabled(v28, v29);
  v31 = v75;
  if (v30)
  {
    v32 = swift_slowAlloc();
    v77 = v7;
    v33 = v32;
    v71 = swift_slowAlloc();
    v79[0] = v71;
    *(_DWORD *)v33 = 136315906;
    v70 = v28;
    swift_bridgeObjectRetain();
    v80[0] = sub_23DB6B73C(v13, v15, v79);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease_n();
    v34 = v3;
    *(_WORD *)(v33 + 12) = 2080;
    if (v76 >= v72)
      v35 = 20302;
    else
      v35 = 5457241;
    if (v76 >= v72)
      v36 = 0xE200000000000000;
    else
      v36 = 0xE300000000000000;
    v80[0] = sub_23DB6B73C(v35, v36, v79);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 22) = 2080;
    v37 = v74;
    v80[0] = (uint64_t)objc_msgSend(v74, sel_heartRateVersion);
    sub_23DB6BDE0();
    v76 = (id)v6;
    v38 = sub_23DB6DAFC();
    v80[0] = sub_23DB6B73C(v38, v39, v79);
    sub_23DB6DAE4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 32) = 2080;
    v80[0] = (uint64_t)objc_msgSend(*(id *)(v34 + 56), sel_heartRateVersion);
    v40 = sub_23DB6DAFC();
    v80[0] = sub_23DB6B73C(v40, v41, v79);
    sub_23DB6DAE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    v42 = v70;
    _os_log_impl(&dword_23DB63000, v70, (os_log_type_t)v73, "HeadphoneProxFeatureService: [%s] shouldShowHeartRateMonitor: %s, Current Version: %s, Taget Version: %s", (uint8_t *)v33, 0x2Au);
    v43 = v71;
    swift_arrayDestroy();
    MEMORY[0x24263BCC4](v43, -1, -1);
    MEMORY[0x24263BCC4](v33, -1, -1);

    (*(void (**)(char *, id))(v77 + 8))(v12, v76);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    v68 = v74;

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  return v25;
}

id AudioAccessoryDevice.cbDevice.getter()
{
  void *v0;
  id v1;
  id v2;

  v1 = v0;
  if (objc_msgSend(v1, sel_respondsToSelector_, sel_coreBluetoothDevice)
    && (objc_msgSend(v1, sel_respondsToSelector_, sel_coreBluetoothDevice) & 1) != 0)
  {
    v2 = objc_msgSend(v1, sel_coreBluetoothDevice);

  }
  else
  {

    return 0;
  }
  return v2;
}

char *sub_23DB69CDC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  int AppBooleanValue;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  os_log_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  id v42;
  __CFString *v43;
  __CFString *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  const char *v60;
  char *v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  os_log_t v72;
  int v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81[3];
  char *v82;

  v3 = v2;
  v6 = sub_23DB6DA0C();
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v71 - v10;
  v82 = (char *)MEMORY[0x24BEE4AF8];
  if (a2)
  {
    v76 = v9;
    v79 = v8;
    swift_bridgeObjectRetain();
    v78 = a1;
    v12 = sub_23DB6A850(a1, a2);
    v13 = objc_msgSend(v12, sel_headGesturesVersion);
    v14 = objc_msgSend(*(id *)(v2 + 56), sel_headGesturesVersion);
    v15 = (__CFString *)sub_23DB6DA54();
    v77 = "v16@?0@\"NSError\"8";
    v16 = (__CFString *)sub_23DB6DA54();
    AppBooleanValue = CFPreferencesGetAppBooleanValue(v15, v16, 0);

    if (v13 < v14 || AppBooleanValue)
    {
      if (qword_25431D130 != -1)
        swift_once();
      v18 = __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
      v19 = v79;
      (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v11, v18, v6);
      swift_bridgeObjectRetain_n();
      v20 = v12;
      swift_retain_n();
      v21 = v20;
      v22 = sub_23DB6D9F4();
      v23 = sub_23DB6DAC0();
      v24 = v23;
      if (os_log_type_enabled(v22, v23))
      {
        v25 = swift_slowAlloc();
        v74 = swift_slowAlloc();
        v81[0] = v74;
        *(_DWORD *)v25 = 136315906;
        v73 = v24;
        swift_bridgeObjectRetain();
        v80 = (id)sub_23DB6B73C(v78, a2, v81);
        sub_23DB6DAE4();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v25 + 12) = 2080;
        v72 = v22;
        v80 = objc_msgSend(v21, sel_headGesturesVersion);
        sub_23DB6BDE0();
        v75 = v12;
        v26 = sub_23DB6DAFC();
        v80 = (id)sub_23DB6B73C(v26, v27, v81);
        sub_23DB6DAE4();

        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 22) = 2080;
        v80 = objc_msgSend(*(id *)(v3 + 56), sel_headGesturesVersion);
        v12 = v75;
        v28 = sub_23DB6DAFC();
        v80 = (id)sub_23DB6B73C(v28, v29, v81);
        sub_23DB6DAE4();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 32) = 2080;
        if (AppBooleanValue)
          v30 = 5457241;
        else
          v30 = 20302;
        if (AppBooleanValue)
          v31 = 0xE300000000000000;
        else
          v31 = 0xE200000000000000;
        v80 = (id)sub_23DB6B73C(v30, v31, v81);
        sub_23DB6DAE4();
        swift_bridgeObjectRelease();
        v32 = v72;
        _os_log_impl(&dword_23DB63000, v72, (os_log_type_t)v73, "HeadphoneProxFeatureService: [%s] getWhatsNewNotShowedFeatures: Head Gestures: Yes, Current Version: %s, Target Version: %s, Force Show: %s", (uint8_t *)v25, 0x2Au);
        v33 = v74;
        swift_arrayDestroy();
        MEMORY[0x24263BCC4](v33, -1, -1);
        MEMORY[0x24263BCC4](v25, -1, -1);

        (*(void (**)(char *, uint64_t))(v79 + 8))(v11, v6);
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v6);
      }
      v38 = v82;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v38 = sub_23DB6B644(0, *((_QWORD *)v38 + 2) + 1, 1, v38);
      v40 = *((_QWORD *)v38 + 2);
      v39 = *((_QWORD *)v38 + 3);
      if (v40 >= v39 >> 1)
        v38 = sub_23DB6B644((char *)(v39 > 1), v40 + 1, 1, v38);
      *((_QWORD *)v38 + 2) = v40 + 1;
      v38[v40 + 32] = 1;
      v82 = v38;
    }
    v41 = objc_msgSend(v12, sel_voiceQualityVersion);
    v42 = objc_msgSend(*(id *)(v3 + 56), sel_voiceQualityVersion);
    v43 = (__CFString *)sub_23DB6DA54();
    v44 = (__CFString *)sub_23DB6DA54();
    v45 = CFPreferencesGetAppBooleanValue(v43, v44, 0);

    if (v41 < v42 || v45)
    {
      if (qword_25431D130 != -1)
        swift_once();
      v46 = __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
      v47 = v79;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16))(v76, v46, v6);
      swift_bridgeObjectRetain_n();
      v48 = v12;
      swift_retain_n();
      v49 = v48;
      v50 = sub_23DB6D9F4();
      v51 = sub_23DB6DAC0();
      v52 = v51;
      if (os_log_type_enabled(v50, v51))
      {
        v53 = swift_slowAlloc();
        v77 = (const char *)swift_slowAlloc();
        v81[0] = (uint64_t)v77;
        *(_DWORD *)v53 = 136315906;
        swift_bridgeObjectRetain();
        v80 = (id)sub_23DB6B73C(v78, a2, v81);
        sub_23DB6DAE4();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v53 + 12) = 2080;
        v75 = v12;
        v80 = objc_msgSend(v49, sel_voiceQualityVersion);
        sub_23DB6BDE0();
        LODWORD(v74) = v52;
        v54 = sub_23DB6DAFC();
        v80 = (id)sub_23DB6B73C(v54, v55, v81);
        sub_23DB6DAE4();

        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 22) = 2080;
        v80 = objc_msgSend(*(id *)(v3 + 56), sel_voiceQualityVersion);
        v56 = sub_23DB6DAFC();
        v80 = (id)sub_23DB6B73C(v56, v57, v81);
        v12 = v75;
        sub_23DB6DAE4();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 32) = 2080;
        if (v45)
          v58 = 5457241;
        else
          v58 = 20302;
        if (v45)
          v59 = 0xE300000000000000;
        else
          v59 = 0xE200000000000000;
        v80 = (id)sub_23DB6B73C(v58, v59, v81);
        sub_23DB6DAE4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DB63000, v50, (os_log_type_t)v74, "HeadphoneProxFeatureService: [%s] getWhatsNewNotShowedFeatures: Voice Quality: Yes, Current Version: %s, Target Version: %s, Force Show: %s", (uint8_t *)v53, 0x2Au);
        v60 = v77;
        swift_arrayDestroy();
        MEMORY[0x24263BCC4](v60, -1, -1);
        MEMORY[0x24263BCC4](v53, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v76, v6);
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v76, v6);
      }
      v61 = v82;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v61 = sub_23DB6B644(0, *((_QWORD *)v61 + 2) + 1, 1, v61);
      v63 = *((_QWORD *)v61 + 2);
      v62 = *((_QWORD *)v61 + 3);
      if (v63 >= v62 >> 1)
        v61 = sub_23DB6B644((char *)(v62 > 1), v63 + 1, 1, v61);
      *((_QWORD *)v61 + 2) = v63 + 1;
      v61[v63 + 32] = 2;
      v82 = v61;
    }
    if (qword_25431D130 != -1)
      swift_once();
    __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
    v64 = v82;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v65 = sub_23DB6D9F4();
    v66 = sub_23DB6DAC0();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = swift_slowAlloc();
      v68 = swift_slowAlloc();
      v81[0] = v68;
      *(_DWORD *)v67 = 136315394;
      swift_bridgeObjectRetain();
      v80 = (id)sub_23DB6B73C(v78, a2, v81);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v67 + 12) = 2080;
      v69 = MEMORY[0x24263B874](v64, &type metadata for HeadphoneProxFeatureManager.HeadphoneProxFeature);
      v80 = (id)sub_23DB6B73C(v69, v70, v81);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB63000, v65, v66, "HeadphoneProxFeatureService: [%s] getWhatsNewNotShowedFeatures: notShowedFeatureSet: %s", (uint8_t *)v67, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v68, -1, -1);
      MEMORY[0x24263BCC4](v67, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

    }
    swift_beginAccess();
    return v82;
  }
  else
  {
    if (qword_25431D130 != -1)
      swift_once();
    __swift_project_value_buffer(v6, (uint64_t)qword_25431D138);
    v34 = sub_23DB6D9F4();
    v35 = sub_23DB6DAC0();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_23DB63000, v34, v35, "HeadphoneProxFeatureService: getWhatsNewNotShowedFeatures: Invalid Device, Return", v36, 2u);
      MEMORY[0x24263BCC4](v36, -1, -1);
    }

    return (char *)MEMORY[0x24BEE4AF8];
  }
}

id sub_23DB6A850(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  NSObject *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t aBlock[6];

  v5 = sub_23DB6DA30();
  v30 = *(_QWORD *)(v5 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v29 - v9;
  v11 = swift_allocObject();
  v12 = objc_allocWithZone(MEMORY[0x24BE09A40]);
  swift_bridgeObjectRetain();
  v13 = (void *)sub_23DB6DA54();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithBluetoothAddress_, v13);

  objc_msgSend(v14, sel_setHeadGesturesVersion_, 1);
  objc_msgSend(v14, sel_setVoiceQualityVersion_, 1);
  objc_msgSend(v14, sel_setWhatsNewVersion_, 1);
  objc_msgSend(v14, sel_setHeartRateVersion_, 1);
  *(_QWORD *)(v11 + 16) = v14;
  v31 = v11 + 16;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v16 = *(void **)(v2 + 32);
  v17 = (void *)sub_23DB6DA54();
  v18 = (_QWORD *)swift_allocObject();
  v29 = a1;
  v18[2] = a1;
  v18[3] = a2;
  v18[4] = v11;
  v18[5] = v15;
  aBlock[4] = (uint64_t)sub_23DB6D180;
  aBlock[5] = (uint64_t)v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_23DB6B03C;
  aBlock[3] = (uint64_t)&block_descriptor_31;
  v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  v20 = v15;
  swift_release();
  objc_msgSend(v16, sel_fetchAAProxCardsInfoForDeviceWithAddress_completion_, v17, v19);
  _Block_release(v19);

  sub_23DB6DA24();
  MEMORY[0x24263B808](v8, 1.0);
  v21 = *(void (**)(char *, uint64_t))(v30 + 8);
  v21(v8, v5);
  sub_23DB6DACC();
  v21(v10, v5);
  if ((sub_23DB6DA18() & 1) == 0)
    goto LABEL_7;
  if (qword_25431D130 != -1)
    swift_once();
  v22 = sub_23DB6DA0C();
  __swift_project_value_buffer(v22, (uint64_t)qword_25431D138);
  swift_bridgeObjectRetain_n();
  v23 = sub_23DB6D9F4();
  v24 = sub_23DB6DAC0();
  if (!os_log_type_enabled(v23, v24))
  {

    swift_bridgeObjectRelease_n();
LABEL_7:

    goto LABEL_8;
  }
  v25 = (uint8_t *)swift_slowAlloc();
  v26 = swift_slowAlloc();
  aBlock[0] = v26;
  *(_DWORD *)v25 = 136315138;
  swift_bridgeObjectRetain();
  v32 = sub_23DB6B73C(v29, a2, aBlock);
  sub_23DB6DAE4();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_23DB63000, v23, v24, "HeadphoneProxFeatureService: [%s] getProxCardInfoForDevice: Timed Out", v25, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x24263BCC4](v26, -1, -1);
  MEMORY[0x24263BCC4](v25, -1, -1);

LABEL_8:
  swift_beginAccess();
  v27 = *(id *)(v11 + 16);
  swift_release();
  return v27;
}

void sub_23DB6AC64()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14[2];
  uint64_t v15;
  unint64_t v16;

  objc_msgSend(v0, sel_whatsNewVersion);
  sub_23DB6DB74();
  v15 = 0x654E207374616857;
  v16 = 0xEB00000000203A77;
  sub_23DB6DA90();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_voiceQualityVersion);
  sub_23DB6DB74();
  sub_23DB6DA90();
  swift_bridgeObjectRelease();
  sub_23DB6DA90();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_headGesturesVersion);
  sub_23DB6DB74();
  sub_23DB6DA90();
  swift_bridgeObjectRelease();
  sub_23DB6DA90();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_heartRateVersion);
  sub_23DB6DB74();
  strcpy((char *)v14, ", Heart Rate: ");
  HIBYTE(v14[1]) = -18;
  sub_23DB6DA90();
  swift_bridgeObjectRelease();
  sub_23DB6DA90();
  swift_bridgeObjectRelease();
  if (qword_25431D130 != -1)
    swift_once();
  v1 = sub_23DB6DA0C();
  __swift_project_value_buffer(v1, (uint64_t)qword_25431D138);
  v3 = v15;
  v2 = v16;
  v4 = v0;
  swift_bridgeObjectRetain();
  v5 = sub_23DB6D9F4();
  v6 = sub_23DB6DAC0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v14[0] = v8;
    *(_DWORD *)v7 = 136315394;
    v9 = objc_msgSend(v4, sel_bluetoothAddress);
    v10 = sub_23DB6DA60();
    v13 = v3;
    v12 = v11;

    sub_23DB6B73C(v10, v12, v14);
    sub_23DB6DAE4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_23DB6B73C(v13, v2, v14);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23DB63000, v5, v6, "HeadphoneProxFeatureService: [%s] printProxCardInfo: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263BCC4](v8, -1, -1);
    MEMORY[0x24263BCC4](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_23DB6B03C(uint64_t a1, void *a2, void *a3)
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

id *HeadphoneProxFeatureManager.deinit()
{
  id *v0;

  objc_msgSend(v0[3], sel_invalidate);
  objc_msgSend(v0[4], sel_invalidate);
  swift_bridgeObjectRelease();

  sub_23DB6BE64((uint64_t)(v0 + 5));
  return v0;
}

uint64_t HeadphoneProxFeatureManager.__deallocating_deinit()
{
  id *v0;

  objc_msgSend(v0[3], sel_invalidate);
  objc_msgSend(v0[4], sel_invalidate);
  swift_bridgeObjectRelease();

  sub_23DB6BE64((uint64_t)(v0 + 5));
  return swift_deallocClassInstance();
}

uint64_t sub_23DB6B178()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23DB6B19C(void *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *oslog;
  uint64_t v19;
  uint64_t v20;

  v3 = *(_QWORD *)(v1 + 16);
  v2 = *(_QWORD *)(v1 + 24);
  if (a1)
  {
    if (qword_25431D130 != -1)
      swift_once();
    v5 = sub_23DB6DA0C();
    __swift_project_value_buffer(v5, (uint64_t)qword_25431D138);
    swift_bridgeObjectRetain();
    v6 = a1;
    swift_bridgeObjectRetain();
    v7 = a1;
    oslog = sub_23DB6D9F4();
    v8 = sub_23DB6DAC0();
    if (os_log_type_enabled(oslog, v8))
    {
      v9 = swift_slowAlloc();
      v10 = swift_slowAlloc();
      v20 = v10;
      *(_DWORD *)v9 = 136315394;
      swift_bridgeObjectRetain();
      v19 = sub_23DB6B73C(v3, v2, &v20);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v9 + 12) = 2080;
      swift_getErrorValue();
      v11 = sub_23DB6DB98();
      sub_23DB6B73C(v11, v12, &v20);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23DB63000, oslog, v8, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Failed: %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v10, -1, -1);
      v13 = v9;
LABEL_10:
      MEMORY[0x24263BCC4](v13, -1, -1);

      return;
    }
    swift_bridgeObjectRelease_n();

  }
  else
  {
    if (qword_25431D130 != -1)
      swift_once();
    v14 = sub_23DB6DA0C();
    __swift_project_value_buffer(v14, (uint64_t)qword_25431D138);
    swift_bridgeObjectRetain_n();
    oslog = sub_23DB6D9F4();
    v15 = sub_23DB6DAC0();
    if (os_log_type_enabled(oslog, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19 = v17;
      *(_DWORD *)v16 = 136315138;
      swift_bridgeObjectRetain();
      v20 = sub_23DB6B73C(v3, v2, &v19);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23DB63000, oslog, v15, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Succeeded", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v17, -1, -1);
      v13 = (uint64_t)v16;
      goto LABEL_10;
    }
    swift_bridgeObjectRelease_n();
  }

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

_QWORD *sub_23DB6B538(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CE73F8);
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
    sub_23DB6CF50(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_23DB6B644(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CE7400);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23DB6D044(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23DB6B73C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23DB6B80C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23DB6D7A8((uint64_t)v12, *a3);
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
      sub_23DB6D7A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23DB6B80C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23DB6DAF0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23DB6B9C4(a5, a6);
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
  v8 = sub_23DB6DB20();
  if (!v8)
  {
    sub_23DB6DB2C();
    __break(1u);
LABEL_17:
    result = sub_23DB6DB5C();
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

uint64_t sub_23DB6B9C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23DB6BA58(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DB6BC30(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23DB6BC30(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23DB6BA58(uint64_t a1, unint64_t a2)
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
      v3 = sub_23DB6BBCC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23DB6DB14();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23DB6DB2C();
      __break(1u);
LABEL_10:
      v2 = sub_23DB6DA9C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23DB6DB5C();
    __break(1u);
LABEL_14:
    result = sub_23DB6DB2C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23DB6BBCC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE7410);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23DB6BC30(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CE7410);
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
  result = sub_23DB6DB5C();
  __break(1u);
  return result;
}

unint64_t sub_23DB6BD7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DB6DBA4();
  sub_23DB6DA84();
  v4 = sub_23DB6DBB0();
  return sub_23DB6C5B8(a1, a2, v4);
}

unint64_t sub_23DB6BDE0()
{
  unint64_t result;

  result = qword_256CE73D8;
  if (!qword_256CE73D8)
  {
    result = MEMORY[0x24263BC58](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_256CE73D8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24263BC4C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23DB6BE64(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_23DB6BE8C()
{
  unint64_t result;

  result = qword_256CE73E8;
  if (!qword_256CE73E8)
  {
    result = MEMORY[0x24263BC58](&protocol conformance descriptor for HeadphoneProxFeatureManager.HeadphoneProxFeature, &type metadata for HeadphoneProxFeatureManager.HeadphoneProxFeature);
    atomic_store(result, (unint64_t *)&qword_256CE73E8);
  }
  return result;
}

uint64_t dispatch thunk of HeadphoneProxFeatureDeviceDelegate.readyToShow(device:features:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for HeadphoneProxFeatureManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for HeadphoneProxFeatureManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.setProxCardShowedFeatures(deviceAddress:showedFeatures:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.shouldShowHeadGesturesCard(deviceAddress:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.setHeadGesturesConfig(deviceAddress:enabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.shouldShowWhatsNewCard(deviceAddress:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.shouldShowHeartRateMonitor(deviceAddress:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.getWhatsNewNotShowedFeatures(deviceAddress:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HeadphoneProxFeatureManager.HeadphoneProxFeature(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HeadphoneProxFeatureManager.HeadphoneProxFeature(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DB6C05C + 4 * byte_23DB6DFED[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23DB6C090 + 4 * byte_23DB6DFE8[v4]))();
}

uint64_t sub_23DB6C090(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DB6C098(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DB6C0A0);
  return result;
}

uint64_t sub_23DB6C0AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DB6C0B4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23DB6C0B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DB6C0C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DB6C0CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23DB6C0D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HeadphoneProxFeatureManager.HeadphoneProxFeature()
{
  return &type metadata for HeadphoneProxFeatureManager.HeadphoneProxFeature;
}

uint64_t sub_23DB6C0F0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DB6C114()
{
  return sub_23DB6C12C("HeadphoneProxFeatureService: Device Manager Interrupted");
}

uint64_t sub_23DB6C120()
{
  return sub_23DB6C12C("HeadphoneProxFeatureService: Device Manager Invalidated");
}

uint64_t sub_23DB6C12C(const char *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;

  if (qword_25431D130 != -1)
    swift_once();
  v2 = sub_23DB6DA0C();
  __swift_project_value_buffer(v2, (uint64_t)qword_25431D138);
  v3 = sub_23DB6D9F4();
  v4 = sub_23DB6DAC0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23DB63000, v3, v4, a1, v5, 2u);
    MEMORY[0x24263BCC4](v5, -1, -1);
  }

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v7 = result;
    v8 = sub_23DB65378(MEMORY[0x24BEE4AF8]);
    swift_beginAccess();
    *(_QWORD *)(v7 + 16) = v8;
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void sub_23DB6C268(void *a1)
{
  NSObject *v1;

  sub_23DB65758(a1, v1);
}

void sub_23DB6C270(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  NSObject *v22;
  NSObject *v23;

  if (qword_25431D130 != -1)
    swift_once();
  v2 = sub_23DB6DA0C();
  __swift_project_value_buffer(v2, (uint64_t)qword_25431D138);
  v3 = a1;
  v4 = sub_23DB6D9F4();
  v5 = sub_23DB6DAC0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v23 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = objc_msgSend(v3, sel_description);
    v9 = sub_23DB6DA60();
    v11 = v10;

    sub_23DB6B73C(v9, v11, (uint64_t *)&v23);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23DB63000, v4, v5, "HeadphoneProxFeatureService: Device Lost: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263BCC4](v7, -1, -1);
    MEMORY[0x24263BCC4](v6, -1, -1);
  }
  else
  {

  }
  v12 = objc_msgSend(v3, sel_bluetoothAddress);
  if (v12)
  {
    v13 = v12;
    v14 = sub_23DB6DA60();
    v16 = v15;

    swift_beginAccess();
    v17 = sub_23DB6C698(v14, v16);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = v3;
    v17 = sub_23DB6D9F4();
    v19 = sub_23DB6DAB4();
    if (os_log_type_enabled(v17, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v20 = 138412290;
      v23 = v18;
      v22 = v18;
      sub_23DB6DAE4();
      *v21 = v18;

      _os_log_impl(&dword_23DB63000, v17, v19, "HeadphoneProxFeatureService: aad has no address %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CE73E0);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v21, -1, -1);
      MEMORY[0x24263BCC4](v20, -1, -1);
    }
    else
    {

      v17 = v18;
    }
  }

}

unint64_t sub_23DB6C5B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23DB6DB80() & 1) == 0)
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
      while (!v14 && (sub_23DB6DB80() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23DB6C698(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23DB6BD7C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23DB6CDA0();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_23DB6CA70(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23DB6C764(uint64_t a1, char a2)
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
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE73F0);
  v38 = a2;
  v6 = sub_23DB6DB44();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
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
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_23DB6DBA4();
    sub_23DB6DA84();
    result = sub_23DB6DBB0();
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
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_23DB6CA70(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
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
    result = sub_23DB6DB08();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23DB6DBA4();
        swift_bridgeObjectRetain();
        sub_23DB6DA84();
        v9 = sub_23DB6DBB0();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
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

void sub_23DB6CC44(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23DB6BD7C(a2, a3);
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
    sub_23DB6CDA0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_23DB6C764(v15, a4 & 1);
  v20 = sub_23DB6BD7C(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_23DB6DB8C();
  __break(1u);
}

id sub_23DB6CDA0()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE73F0);
  v2 = *v0;
  v3 = sub_23DB6DB38();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
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

uint64_t sub_23DB6CF50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23DB6DB5C();
  __break(1u);
  return result;
}

char *sub_23DB6D044(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_23DB6DB5C();
  __break(1u);
  return result;
}

uint64_t sub_23DB6D128()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23DB6D14C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

void sub_23DB6D180(void *a1, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31[3];

  v4 = v2[2];
  v3 = v2[3];
  v5 = v2[5];
  v6 = (id *)(v2[4] + 16);
  if (a2)
  {
    if (qword_25431D130 != -1)
      swift_once();
    v7 = sub_23DB6DA0C();
    __swift_project_value_buffer(v7, (uint64_t)qword_25431D138);
    swift_bridgeObjectRetain_n();
    v8 = sub_23DB6D9F4();
    v9 = sub_23DB6DAC0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v31[0] = v11;
      *(_DWORD *)v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_23DB6B73C(v4, v3, v31);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23DB63000, v8, v9, "HeadphoneProxFeatureService: [%s] getProxCardInfoForDevice: Failed, Go with Target Info", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v11, -1, -1);
      MEMORY[0x24263BCC4](v10, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v18 = objc_allocWithZone(MEMORY[0x24BE09A40]);
    swift_bridgeObjectRetain();
    v19 = (void *)sub_23DB6DA54();
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v18, sel_initWithBluetoothAddress_, v19);

    objc_msgSend(v20, sel_setHeadGesturesVersion_, 1);
    objc_msgSend(v20, sel_setVoiceQualityVersion_, 1);
    objc_msgSend(v20, sel_setWhatsNewVersion_, 1);
    objc_msgSend(v20, sel_setHeartRateVersion_, 1);
LABEL_13:
    swift_beginAccess();
    v21 = *v6;
    *v6 = v20;
    goto LABEL_20;
  }
  if (!a1)
  {
    if (qword_25431D130 != -1)
      swift_once();
    v22 = sub_23DB6DA0C();
    __swift_project_value_buffer(v22, (uint64_t)qword_25431D138);
    swift_bridgeObjectRetain_n();
    v23 = sub_23DB6D9F4();
    v24 = sub_23DB6DAC0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v31[0] = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      sub_23DB6B73C(v4, v3, v31);
      sub_23DB6DAE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23DB63000, v23, v24, "HeadphoneProxFeatureService: [%s] getProxCardInfoForDevice: Prox Card Info NOT Existing, Go with Default Info", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263BCC4](v26, -1, -1);
      MEMORY[0x24263BCC4](v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v29 = objc_allocWithZone(MEMORY[0x24BE09A40]);
    swift_bridgeObjectRetain();
    v30 = (void *)sub_23DB6DA54();
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v29, sel_initWithBluetoothAddress_, v30);

    objc_msgSend(v20, sel_setHeadGesturesVersion_, 0);
    objc_msgSend(v20, sel_setVoiceQualityVersion_, 0);
    objc_msgSend(v20, sel_setWhatsNewVersion_, 0);
    objc_msgSend(v20, sel_setHeartRateVersion_, 0);
    goto LABEL_13;
  }
  if (qword_25431D130 != -1)
    swift_once();
  v13 = sub_23DB6DA0C();
  __swift_project_value_buffer(v13, (uint64_t)qword_25431D138);
  swift_bridgeObjectRetain_n();
  v14 = sub_23DB6D9F4();
  v15 = sub_23DB6DAC0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v31[0] = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    sub_23DB6B73C(v4, v3, v31);
    sub_23DB6DAE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23DB63000, v14, v15, "HeadphoneProxFeatureService: [%s] getProxCardInfoForDevice: Prox Card Info Retrieved", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263BCC4](v17, -1, -1);
    MEMORY[0x24263BCC4](v16, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_beginAccess();
  v21 = *v6;
  *v6 = a1;
  v27 = a1;
LABEL_20:

  swift_beginAccess();
  v28 = *v6;
  sub_23DB6AC64();

  dispatch_group_leave(v5);
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

uint64_t sub_23DB6D7A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t sub_23DB6D824(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23DB6D85C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;

  if (qword_25431D130 != -1)
    swift_once();
  v0 = sub_23DB6DA0C();
  __swift_project_value_buffer(v0, (uint64_t)qword_25431D138);
  v1 = sub_23DB6D9F4();
  v2 = sub_23DB6DAC0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23DB63000, v1, v2, "HeadphoneProxFeatureService: audioaccessoryd started", v3, 2u);
    MEMORY[0x24263BCC4](v3, -1, -1);
  }

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    v6 = sub_23DB65378(MEMORY[0x24BEE4AF8]);
    swift_beginAccess();
    *(_QWORD *)(v5 + 16) = v6;
    swift_bridgeObjectRelease();
    objc_msgSend(*(id *)(v5 + 24), sel_invalidate);
    sub_23DB65490();
    return swift_release();
  }
  return result;
}

uint64_t sub_23DB6D9F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DB6DA00()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23DB6DA0C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DB6DA18()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_23DB6DA24()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23DB6DA30()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23DB6DA3C()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_23DB6DA48()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23DB6DA54()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DB6DA60()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23DB6DA6C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23DB6DA78()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_23DB6DA84()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DB6DA90()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23DB6DA9C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DB6DAA8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23DB6DAB4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DB6DAC0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DB6DACC()
{
  return MEMORY[0x24BEE5650]();
}

uint64_t sub_23DB6DAD8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23DB6DAE4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DB6DAF0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DB6DAFC()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_23DB6DB08()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23DB6DB14()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DB6DB20()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DB6DB2C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DB6DB38()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23DB6DB44()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23DB6DB50()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23DB6DB5C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DB6DB68()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23DB6DB74()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23DB6DB80()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DB6DB8C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23DB6DB98()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23DB6DBA4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DB6DBB0()
{
  return MEMORY[0x24BEE4328]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

