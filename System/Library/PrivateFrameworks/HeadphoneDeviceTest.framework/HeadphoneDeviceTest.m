uint64_t sub_23DAAEF88()
{
  uint64_t v1;

  v1 = sub_23DAB3354();
  __swift_allocate_value_buffer(v1, qword_256CE1A90);
  __swift_project_value_buffer(v1, (uint64_t)qword_256CE1A90);
  sub_23DAB33CC();
  sub_23DAB33CC();
  return sub_23DAB3348();
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

uint64_t sub_23DAAF0D8()
{
  uint64_t v0;

  if (qword_256CE1800 != -1)
    swift_once();
  v0 = sub_23DAB3354();
  return __swift_project_value_buffer(v0, (uint64_t)qword_256CE1A90);
}

uint64_t sub_23DAAF138@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23DAAF0D8();
  v1 = sub_23DAB3354();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v3);
}

uint64_t static HeadphoneUITestDeviceProvider.== infix(_:_:)()
{
  char v1;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_endAccess();
  v1 = sub_23DAB33D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

_QWORD *HeadphoneUITestDeviceProvider.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = a1;
  v6 = v1;
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *(_QWORD *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_endAccess();
  v5[0] = v3;
  v5[1] = v4;
  sub_23DAB34C8();
  result = v5;
  sub_23DAAF324();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_23DAAF324()
{
  swift_bridgeObjectRelease();
}

HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional __swiftcall HeadphoneUITestDeviceProvider.DeviceType.init(rawValue:)(Swift::Int rawValue)
{
  char v3;

  if (rawValue == 8212)
  {
    v3 = 0;
    return (HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional)(v3 & 1);
  }
  if (rawValue == 8214)
  {
    v3 = 1;
    return (HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional)(v3 & 1);
  }
  return (HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional)2;
}

uint64_t HeadphoneUITestDeviceProvider.DeviceType.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 8214;
  else
    return 8212;
}

uint64_t sub_23DAAF404()
{
  sub_23DAB3204();
  return sub_23DAB34BC() & 1;
}

uint64_t sub_23DAAF44C()
{
  sub_23DAB3204();
  return sub_23DAB3414();
}

uint64_t sub_23DAAF488()
{
  sub_23DAB3204();
  return sub_23DAB342C();
}

uint64_t sub_23DAAF4CC()
{
  sub_23DAB3204();
  return sub_23DAB3420();
}

HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional sub_23DAAF510@<W0>(Swift::Int *a1@<X0>, HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional *a2@<X8>)
{
  HeadphoneDeviceTest::HeadphoneUITestDeviceProvider::DeviceType_optional result;

  result.value = HeadphoneUITestDeviceProvider.DeviceType.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_23DAAF53C@<X0>(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t result;

  result = HeadphoneUITestDeviceProvider.DeviceType.rawValue.getter(*v1 & 1);
  *a1 = result;
  return result;
}

uint64_t sub_23DAAF56C()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v0 + 16);
  swift_retain();
  swift_endAccess();
  if (v5)
    return v5;
  sub_23DAB3330();
  v2 = sub_23DAB3324();
  swift_retain();
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v2;
  swift_release();
  swift_endAccess();
  return v2;
}

uint64_t sub_23DAAF65C(uint64_t a1)
{
  uint64_t v1;

  swift_retain();
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_23DAAF6CC(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_23DAAF56C();
  return sub_23DAAF704;
}

uint64_t sub_23DAAF704(uint64_t *a1, char a2)
{
  uint64_t v3;

  if ((a2 & 1) == 0)
    return sub_23DAAF65C(*a1);
  v3 = *a1;
  swift_retain();
  sub_23DAAF65C(v3);
  return swift_release();
}

uint64_t variable initialization expression of HeadphoneUITestDeviceProvider.$__lazy_storage_$_replayData()
{
  return 0;
}

uint64_t variable initialization expression of HeadphoneUITestDeviceProvider.deviceType()
{
  return 2;
}

uint64_t sub_23DAAF780()
{
  uint64_t v0;
  unsigned int v2;

  swift_beginAccess();
  v2 = *(unsigned __int8 *)(v0 + 24);
  swift_endAccess();
  return v2;
}

uint64_t sub_23DAAF7C8(char a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_BYTE *)(v1 + 24) = a1;
  return swift_endAccess();
}

uint64_t (*sub_23DAAF810())()
{
  swift_beginAccess();
  return sub_23DAAF850;
}

uint64_t sub_23DAAF850()
{
  return swift_endAccess();
}

id variable initialization expression of HeadphoneUITestDeviceProvider.defaults()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  id v4;

  sub_23DAAF96C();
  v0 = sub_23DAB33CC();
  v4 = sub_23DAAF9D0(v0, v1);
  if (v4)
    return v4;
  sub_23DAB34A4();
  __break(1u);
  return (id)v3;
}

unint64_t sub_23DAAF96C()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_256CE1580;
  if (!qword_256CE1580)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_256CE1580);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_23DAAF9D0(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_23DAB2804(a1, a2);
}

void *sub_23DAAFA14()
{
  uint64_t v0;
  id v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v0 + 32);
  v1 = v3;
  swift_endAccess();
  return v3;
}

void sub_23DAAFA60(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = a1;
  swift_beginAccess();
  v3 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

  swift_endAccess();
}

uint64_t (*sub_23DAAFABC())()
{
  swift_beginAccess();
  return sub_23DAAF850;
}

uint64_t variable initialization expression of HeadphoneUITestDeviceProvider.randomHexAddress()
{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  sub_23DAB33CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE1588);
  sub_23DAB34B0();
  v4 = v0;
  arc4random();
  v2 = MEMORY[0x24BEE1768];
  v4[3] = MEMORY[0x24BEE1768];
  v3 = MEMORY[0x24BEE17F0];
  v4[4] = MEMORY[0x24BEE17F0];
  sub_23DAAFCE8();
  sub_23DAAFD50();
  sub_23DAAFDB8();
  sub_23DAB3438();
  arc4random();
  v4[8] = v2;
  v4[9] = v3;
  sub_23DAB3438();
  sub_23DAAFE20();
  v5 = sub_23DAB33C0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x24263A954]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

unint64_t sub_23DAAFCE8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_256CE1590;
  if (!qword_256CE1590)
  {
    v0 = MEMORY[0x24263A96C](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&qword_256CE1590);
    return v0;
  }
  return v2;
}

unint64_t sub_23DAAFD50()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_256CE1598;
  if (!qword_256CE1598)
  {
    v0 = MEMORY[0x24263A96C](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&qword_256CE1598);
    return v0;
  }
  return v2;
}

unint64_t sub_23DAAFDB8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_256CE15A0;
  if (!qword_256CE15A0)
  {
    v0 = MEMORY[0x24263A96C](MEMORY[0x24BEE4538], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_256CE15A0);
    return v0;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_23DAAFE20()
{
  sub_23DAB3444();
  sub_23DAB3270();
}

uint64_t sub_23DAAFE60()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_23DAAFEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23DAAFF24())()
{
  swift_beginAccess();
  return sub_23DAAF850;
}

uint64_t HeadphoneUITestDeviceProvider.__allocating_init(withBaseDeviceType:)(char a1)
{
  swift_allocObject();
  return HeadphoneUITestDeviceProvider.init(withBaseDeviceType:)(a1 & 1);
}

uint64_t HeadphoneUITestDeviceProvider.init(withBaseDeviceType:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  id v14;

  *(_QWORD *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 24) = 2;
  sub_23DAAF96C();
  v2 = sub_23DAB33CC();
  v14 = sub_23DAAF9D0(v2, v3);
  if (v14)
  {
    *(_QWORD *)(v13 + 32) = v14;
    sub_23DAB33CC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CE1588);
    sub_23DAB34B0();
    v9 = v4;
    arc4random();
    v7 = MEMORY[0x24BEE1768];
    v9[3] = MEMORY[0x24BEE1768];
    v8 = MEMORY[0x24BEE17F0];
    v9[4] = MEMORY[0x24BEE17F0];
    sub_23DAAFCE8();
    sub_23DAAFD50();
    sub_23DAAFDB8();
    sub_23DAB3438();
    arc4random();
    v9[8] = v7;
    v9[9] = v8;
    sub_23DAB3438();
    sub_23DAAFE20();
    v10 = sub_23DAB33C0();
    v11 = v5;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v13 + 40) = v10;
    *(_QWORD *)(v13 + 48) = v11;
    swift_beginAccess();
    *(_BYTE *)(v13 + 24) = a1 & 1;
    swift_endAccess();
    sub_23DAAF56C();
    HeadphoneUITestDeviceProvider.DeviceType.rawValue.getter(a1 & 1);
    sub_23DAB3318();
    swift_release();
    return v13;
  }
  else
  {
    result = sub_23DAB34A4();
    __break(1u);
  }
  return result;
}

uint64_t HeadphoneUITestDeviceProvider.applyDeviceColor(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB0384();
  sub_23DAB03EC();
  sub_23DAB0454();
  sub_23DAB3408();
  sub_23DAB32AC();
  swift_release();
  swift_retain();
  return v1;
}

unint64_t sub_23DAB0384()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_256CE15A8;
  if (!qword_256CE15A8)
  {
    v0 = MEMORY[0x24263A96C](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_256CE15A8);
    return v0;
  }
  return v2;
}

unint64_t sub_23DAB03EC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_256CE15B0;
  if (!qword_256CE15B0)
  {
    v0 = MEMORY[0x24263A96C](MEMORY[0x24BEE4518], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_256CE15B0);
    return v0;
  }
  return v2;
}

unint64_t sub_23DAB0454()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_256CE15B8;
  if (!qword_256CE15B8)
  {
    v0 = MEMORY[0x24263A96C](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&qword_256CE15B8);
    return v0;
  }
  return v2;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryChargingCase(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB32DC();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryChargingLeft(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB32E8();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryChargingRight(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB330C();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryChargingMain(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB32F4();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryLevelCase(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB32B8();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryLevelLeft(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB32C4();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryLevelRight(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB3300();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyBatteryLevelMain(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  sub_23DAB32D0();
  swift_release();
  swift_retain();
  return v1;
}

uint64_t HeadphoneUITestDeviceProvider.applyName(_:)()
{
  uint64_t v1;

  sub_23DAAF56C();
  swift_bridgeObjectRetain();
  sub_23DAB32A0();
  swift_release();
  swift_retain();
  return v1;
}

Swift::Void __swiftcall HeadphoneUITestDeviceProvider.apply()()
{
  unint64_t v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;

  sub_23DAB3294();
  sub_23DAB3288();
  sub_23DAAF56C();
  sub_23DAB3330();
  sub_23DAB0BBC();
  v9 = sub_23DAB327C();
  v10 = v0;
  swift_release();
  swift_release();
  if ((v10 & 0xF000000000000000) != 0xF000000000000000)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15C8);
    sub_23DAB34B0();
    v5 = v1;
    swift_beginAccess();
    v3 = v8[5];
    v4 = v8[6];
    swift_bridgeObjectRetain();
    swift_endAccess();
    *v5 = v3;
    v5[1] = v4;
    sub_23DAB0C2C(v9, v10);
    v5[2] = v9;
    v5[3] = v10;
    sub_23DAAFE20();
    v7 = sub_23DAB3378();
    swift_beginAccess();
    v6 = (id)v8[4];
    v2 = v6;
    swift_endAccess();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(*v8 + 320))(v7, 0, 0, v6);

    swift_bridgeObjectRelease();
    sub_23DAB0CB4(v9, v10);
  }
}

unint64_t sub_23DAB0BBC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_256CE15C0;
  if (!qword_256CE15C0)
  {
    v0 = sub_23DAB3330();
    v1 = MEMORY[0x24263A96C](MEMORY[0x24BE3F570], v0);
    atomic_store(v1, (unint64_t *)&qword_256CE15C0);
    return v1;
  }
  return v3;
}

uint64_t sub_23DAB0C2C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_retain();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_23DAB0CB4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_release();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

void HeadphoneUITestDeviceProvider.apply(withAction:)(void (*a1)(void))
{
  unint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;

  sub_23DAB3294();
  sub_23DAB3288();
  sub_23DAAF56C();
  sub_23DAB3330();
  sub_23DAB0BBC();
  v13 = sub_23DAB327C();
  v14 = v1;
  swift_release();
  swift_release();
  if ((v14 & 0xF000000000000000) != 0xF000000000000000)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15C8);
    sub_23DAB34B0();
    v6 = v2;
    swift_beginAccess();
    v4 = v12[5];
    v5 = v12[6];
    swift_bridgeObjectRetain();
    swift_endAccess();
    *v6 = v4;
    v6[1] = v5;
    sub_23DAB0C2C(v13, v14);
    v6[2] = v13;
    v6[3] = v14;
    sub_23DAAFE20();
    v7 = sub_23DAB3378();
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*v12 + 320))(v7, 0, 0);
    swift_bridgeObjectRelease();
    sub_23DAB34B0();
    v10 = v3;
    swift_beginAccess();
    v8 = v12[5];
    v9 = v12[6];
    swift_bridgeObjectRetain();
    swift_endAccess();
    *v10 = v8;
    v10[1] = v9;
    sub_23DAB0C2C(v13, v14);
    v10[2] = v13;
    v10[3] = v14;
    sub_23DAAFE20();
    sub_23DAB3378();
    a1();
    swift_bridgeObjectRelease();
    sub_23DAB0CB4(v13, v14);
  }
}

void HeadphoneUITestDeviceProvider.apply(_:applicator:defaults:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, void *a4)
{
  id v4;
  id v5;
  uint64_t v6;

  sub_23DAB1238((uint64_t)a2);
  if (a2)
  {
    swift_bridgeObjectRetain();
    a2(a1);
    swift_bridgeObjectRelease();
    swift_release();
  }
  v4 = a4;
  if (a4)
  {
    swift_bridgeObjectRetain();
    v6 = sub_23DAB336C();
    swift_bridgeObjectRelease();
    sub_23DAB33CC();
    v5 = (id)sub_23DAB33B4();
    swift_bridgeObjectRelease();
    objc_msgSend(a4, sel_setObject_forKey_, v6, v5);

    swift_unknownObjectRelease();
  }
}

uint64_t sub_23DAB1238(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t HeadphoneUITestDeviceProvider.applyReturnData()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v18[7];
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t *v24;
  _QWORD *v25;
  _BYTE **v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t *v32;
  uint32_t v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  uint32_t v78;
  uint64_t v79;
  uint64_t v80;

  v80 = 0;
  v71 = 0;
  v72 = 0;
  v63 = 0;
  v57 = sub_23DAB3354();
  v58 = *(_QWORD *)(v57 - 8);
  v59 = (*(_QWORD *)(v58 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v60 = (char *)v18 - v59;
  v80 = v0;
  sub_23DAB3294();
  v62 = sub_23DAB3288();
  v1 = sub_23DAAF56C();
  v65 = &v79;
  v79 = v1;
  v64 = sub_23DAB3330();
  sub_23DAB0BBC();
  v2 = sub_23DAB327C();
  v66 = 0;
  v67 = v2;
  v68 = v3;
  v69 = 0;
  v53 = v3;
  v52 = v2;
  swift_release();
  swift_release();
  v54 = v52;
  v55 = v53;
  v56 = v66;
  v49 = v66;
  v50 = v53;
  v51 = v52;
  if ((v53 & 0xF000000000000000) == 0xF000000000000000)
  {
    v11 = v60;
    v12 = sub_23DAAF0D8();
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v11, v12, v57);
    v35 = sub_23DAB333C();
    v34 = sub_23DAB345C();
    v32 = &v77;
    v77 = 2;
    v30 = sub_23DAB0384();
    v31 = sub_23DAB03EC();
    sub_23DAB0454();
    sub_23DAB3408();
    v33 = v78;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15D0);
    v36 = sub_23DAB34B0();
    if (os_log_type_enabled(v35, (os_log_type_t)v34))
    {
      v13 = v49;
      v20 = (uint8_t *)sub_23DAB348C();
      v18[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15D8);
      v19 = 0;
      v21 = sub_23DAB28B0(0);
      v22 = sub_23DAB28B0(v19);
      v26 = &v76;
      v76 = v20;
      v27 = &v75;
      v75 = v21;
      v24 = &v74;
      v74 = v22;
      v23 = 0;
      sub_23DAB2908(0, &v76);
      sub_23DAB2908(v23, v26);
      v73 = v36;
      v25 = v18;
      MEMORY[0x24BDAC7A8](v18);
      v14 = v27;
      v15 = &v18[-6];
      v28 = &v18[-6];
      v15[2] = v26;
      v15[3] = v14;
      v15[4] = v16;
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15E0);
      sub_23DAB298C();
      sub_23DAB33FC();
      if (v13)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_23DAAD000, v35, (os_log_type_t)v34, "HeadphoneManager-Replay: applyReturnData encode data failed!", v20, v33);
        v18[5] = 0;
        sub_23DAB2A70(v21);
        sub_23DAB2A70(v22);
        sub_23DAB3474();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
    return sub_23DAB3360();
  }
  else
  {
    v47 = v51;
    v48 = v50;
    v43 = v50;
    v44 = v51;
    v71 = v51;
    v72 = v50;
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15C8);
    v41 = sub_23DAB34B0();
    v40 = v4;
    v37 = &v70;
    swift_beginAccess();
    v38 = *(_QWORD *)(v61 + 40);
    v39 = *(_QWORD *)(v61 + 48);
    swift_bridgeObjectRetain();
    swift_endAccess();
    v5 = v39;
    v6 = v40;
    v7 = v44;
    v8 = v43;
    *v40 = v38;
    v6[1] = v5;
    sub_23DAB0C2C(v7, v8);
    v9 = v40;
    v10 = v43;
    v40[2] = v44;
    v9[3] = v10;
    sub_23DAAFE20();
    v45 = sub_23DAB3378();
    sub_23DAB0CB4(v44, v43);
    return v45;
  }
}

uint64_t HeadphoneUITestDeviceProvider.store(in:)()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15F0);
  sub_23DAB3450();
  return swift_release();
}

void HeadphoneUITestDeviceProvider.applyAll(inSet:applicator:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v9;
  void *v10;

  swift_beginAccess();
  v10 = *(void **)(v3 + 32);
  v4 = v10;
  swift_endAccess();
  if (v10)
  {
    v5 = *a1;
    swift_bridgeObjectRetain();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(*(_QWORD *)v9 + 352))(v5, v10, a2, a3);
    swift_bridgeObjectRelease();

  }
}

uint64_t HeadphoneUITestDeviceProvider.apply(valuesForContainer:defaults:applicator:)(uint64_t a1, void *a2, void (*a3)())
{
  id v3;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15F8);
  sub_23DAB2ADC();
  sub_23DAB33E4();
  sub_23DAB3360();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE1608);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE1610);
  sub_23DAB2B4C();
  sub_23DAB33F0();
  sub_23DAB2BBC();
  sub_23DAB3390();
  v5 = sub_23DAB3384();
  swift_bridgeObjectRelease();
  if (v5 > 0)
  {
    v3 = a2;
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(*(_QWORD *)v8 + 320))(v9, 0, 0, a2);

    sub_23DAB1238((uint64_t)a3);
    if (a3)
    {
      swift_bridgeObjectRetain();
      a3();
      swift_bridgeObjectRelease();
      swift_release();
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DAB1DA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t *v34;
  uint64_t *v35;
  _BYTE **v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t *v49;
  uint32_t v50;
  int v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  char v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE *v86;
  uint64_t v87;
  uint32_t v88;
  uint64_t v89;
  uint64_t v90;

  v64 = a2;
  v65 = a1;
  v90 = 0;
  v81 = 0;
  v82 = 0;
  v72 = 0;
  v66 = sub_23DAB3354();
  v67 = *(_QWORD *)(v66 - 8);
  v68 = (*(_QWORD *)(v67 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v69 = (char *)&v20 - v68;
  v70 = *v2;
  v90 = v70;
  sub_23DAB3294();
  v71 = sub_23DAB3288();
  v3 = sub_23DAAF56C();
  v75 = &v89;
  v89 = v3;
  v73 = sub_23DAB3330();
  sub_23DAB0BBC();
  v4 = v74;
  v5 = sub_23DAB327C();
  v76 = (uint64_t)v4;
  v77 = v5;
  v78 = v6;
  v79 = v4;
  if (v4)
  {
    v21 = v79;
    v22 = 0;
    v23 = 0xF000000000000000;
    v24 = 0;
    swift_release();
    swift_release();

    v61 = v22;
    v62 = v23;
    v63 = v24;
  }
  else
  {
    v60 = v78;
    v59 = v77;
    swift_release();
    swift_release();
    v61 = v59;
    v62 = v60;
    v63 = v76;
  }
  v56 = v63;
  v57 = v62;
  v58 = v61;
  if ((v62 & 0xF000000000000000) == 0xF000000000000000)
  {
    v7 = v69;
    v8 = sub_23DAAF0D8();
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v7, v8, v66);
    v52 = sub_23DAB333C();
    v51 = sub_23DAB3468();
    v49 = &v87;
    v87 = 2;
    v47 = sub_23DAB0384();
    v48 = sub_23DAB03EC();
    sub_23DAB0454();
    sub_23DAB3408();
    v50 = v88;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15D0);
    v53 = sub_23DAB34B0();
    if (os_log_type_enabled(v52, (os_log_type_t)v51))
    {
      v30 = (uint8_t *)sub_23DAB348C();
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15D8);
      v29 = 0;
      v31 = sub_23DAB28B0(0);
      v32 = sub_23DAB28B0(v29);
      v36 = &v86;
      v86 = v30;
      v37 = &v85;
      v85 = v31;
      v34 = &v84;
      v84 = v32;
      v33 = 0;
      sub_23DAB2908(0, &v86);
      sub_23DAB2908(v33, v36);
      v83 = v53;
      v35 = &v20;
      MEMORY[0x24BDAC7A8](&v20);
      v15 = v37;
      v16 = &v20 - 6;
      v38 = &v20 - 6;
      v16[2] = (uint64_t)v36;
      v16[3] = (uint64_t)v15;
      v16[4] = v17;
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CE15E0);
      sub_23DAB298C();
      v18 = v56;
      sub_23DAB33FC();
      v40 = v18;
      if (v18)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_23DAAD000, v52, (os_log_type_t)v51, "HeadphoneManager-Replay: apply valuesForContainer encode data failed!", v30, v50);
        v26 = 0;
        sub_23DAB2A70(v31);
        sub_23DAB2A70(v32);
        sub_23DAB3474();
        swift_bridgeObjectRelease();
        v27 = v40;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v27 = v56;
    }
    v25 = v27;

    (*(void (**)(char *, uint64_t))(v67 + 8))(v69, v66);
    v19 = v64;
    result = v25;
    *v64 = 0;
    v19[1] = 0;
    v19[2] = 0;
    v19[3] = 0;
    v46 = result;
  }
  else
  {
    v54 = v58;
    v55 = v57;
    v45 = v57;
    v44 = v58;
    v81 = v58;
    v82 = v57;
    sub_23DAB0C2C(v58, v57);
    v41 = &v80;
    swift_beginAccess();
    v42 = *(_QWORD *)(v70 + 40);
    v43 = *(_QWORD *)(v70 + 48);
    swift_bridgeObjectRetain();
    swift_endAccess();
    v9 = v42;
    v10 = v64;
    v11 = v43;
    v12 = v44;
    v13 = v45;
    *v64 = v44;
    v10[1] = v13;
    v10[2] = v9;
    v10[3] = v11;
    sub_23DAB0CB4(v12, v13);
    result = v56;
    v46 = v56;
  }
  return result;
}

uint64_t sub_23DAB2470(uint64_t a1, __int128 *a2)
{
  __int128 v3;

  v3 = *a2;
  sub_23DAB0C2C(v3, *((unint64_t *)&v3 + 1));
  swift_bridgeObjectRetain();
  sub_23DAB0C2C(v3, *((unint64_t *)&v3 + 1));
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CE1610);
  sub_23DAB339C();
  swift_bridgeObjectRelease();
  return sub_23DAB0CB4(v3, *((unint64_t *)&v3 + 1));
}

Swift::Void __swiftcall HeadphoneUITestDeviceProvider.resetAll()()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  void *v4;

  swift_beginAccess();
  v4 = *(void **)(v0 + 32);
  v1 = v4;
  swift_endAccess();
  if (v4)
  {
    v3 = v4;
  }
  else
  {
    sub_23DAB34A4();
    __break(1u);
  }
  sub_23DAB33CC();
  v2 = (id)sub_23DAB33B4();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_removeObjectForKey_, v2);

}

uint64_t HeadphoneUITestDeviceProvider.deinit()
{
  uint64_t v0;
  uint64_t v2;

  sub_23DAB2BE4();
  sub_23DAB2C0C((id *)(v0 + 32));
  sub_23DAAF324();
  return v2;
}

uint64_t HeadphoneUITestDeviceProvider.__deallocating_deinit()
{
  HeadphoneUITestDeviceProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t HeadphoneUITestDeviceProvider.hashValue.getter()
{
  type metadata accessor for HeadphoneUITestDeviceProvider();
  sub_23DAB2C58();
  return sub_23DAB3498();
}

uint64_t sub_23DAB2780()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 368))();
}

uint64_t sub_23DAB27A8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 112))();
}

uint64_t sub_23DAB27D0()
{
  return sub_23DAB33A8();
}

uint64_t sub_23DAB27E4()
{
  return static HeadphoneUITestDeviceProvider.== infix(_:_:)() & 1;
}

id sub_23DAB2804(uint64_t a1, uint64_t a2)
{
  id v2;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    v6 = sub_23DAB33B4();
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v7, sel_initWithSuiteName_, v6);
  }
  else
  {
    v2 = objc_msgSend(v7, sel_initWithSuiteName_, 0);
  }
  v5 = v2;

  return v5;
}

uint64_t sub_23DAB28B0(uint64_t a1)
{
  if (a1)
    return sub_23DAB348C();
  else
    return 0;
}

uint64_t sub_23DAB2908(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23DAB291C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23DAB2960(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return sub_23DAB291C(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_23DAB298C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_256CE15E8;
  if (!qword_256CE15E8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256CE15E0);
    v1 = MEMORY[0x24263A96C](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_256CE15E8);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x24263A960](255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

uint64_t sub_23DAB2A70(uint64_t result)
{
  if (result)
  {
    sub_23DAB3480();
    return sub_23DAB3474();
  }
  return result;
}

unint64_t sub_23DAB2ADC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_256CE1600;
  if (!qword_256CE1600)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256CE15F0);
    v1 = MEMORY[0x24263A96C](MEMORY[0x24BEE1718], v0);
    atomic_store(v1, (unint64_t *)&qword_256CE1600);
    return v1;
  }
  return v3;
}

unint64_t sub_23DAB2B4C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_256CE1618;
  if (!qword_256CE1618)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256CE1608);
    v1 = MEMORY[0x24263A96C](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_256CE1618);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_23DAB2BBC()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_23DAB2BE4()
{
  swift_release();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_23DAB2C0C(id *a1)
{

}

uint64_t type metadata accessor for HeadphoneUITestDeviceProvider()
{
  return objc_opt_self();
}

unint64_t sub_23DAB2C58()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_256CE1620;
  if (!qword_256CE1620)
  {
    v0 = type metadata accessor for HeadphoneUITestDeviceProvider();
    v1 = MEMORY[0x24263A96C](&protocol conformance descriptor for HeadphoneUITestDeviceProvider, v0);
    atomic_store(v1, (unint64_t *)&qword_256CE1620);
    return v1;
  }
  return v3;
}

unint64_t sub_23DAB2CC8()
{
  return sub_23DAB2CDC();
}

unint64_t sub_23DAB2CDC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_256CE1628;
  if (!qword_256CE1628)
  {
    v0 = MEMORY[0x24263A96C](&protocol conformance descriptor for HeadphoneUITestDeviceProvider.DeviceType, &type metadata for HeadphoneUITestDeviceProvider.DeviceType);
    atomic_store(v0, (unint64_t *)&qword_256CE1628);
    return v0;
  }
  return v2;
}

unint64_t sub_23DAB2D48()
{
  return sub_23DAB2D5C();
}

unint64_t sub_23DAB2D5C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_256CE1630;
  if (!qword_256CE1630)
  {
    v0 = type metadata accessor for HeadphoneUITestDeviceProvider();
    v1 = MEMORY[0x24263A96C](&protocol conformance descriptor for HeadphoneUITestDeviceProvider, v0);
    atomic_store(v1, (unint64_t *)&qword_256CE1630);
    return v1;
  }
  return v3;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HeadphoneUITestDeviceProvider.DeviceType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for HeadphoneUITestDeviceProvider.DeviceType(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t sub_23DAB31D0(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *sub_23DAB31E0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HeadphoneUITestDeviceProvider.DeviceType()
{
  return &type metadata for HeadphoneUITestDeviceProvider.DeviceType;
}

unint64_t sub_23DAB3204()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_256CE17F0;
  if (!qword_256CE17F0)
  {
    v0 = MEMORY[0x24263A96C](&protocol conformance descriptor for HeadphoneUITestDeviceProvider.DeviceType, &type metadata for HeadphoneUITestDeviceProvider.DeviceType);
    atomic_store(v0, (unint64_t *)&qword_256CE17F0);
    return v0;
  }
  return v2;
}

void sub_23DAB3270()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t sub_23DAB327C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23DAB3288()
{
  return MEMORY[0x24BDCB3E8]();
}

uint64_t sub_23DAB3294()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23DAB32A0()
{
  return MEMORY[0x24BE3F500]();
}

uint64_t sub_23DAB32AC()
{
  return MEMORY[0x24BE3F508]();
}

uint64_t sub_23DAB32B8()
{
  return MEMORY[0x24BE3F510]();
}

uint64_t sub_23DAB32C4()
{
  return MEMORY[0x24BE3F518]();
}

uint64_t sub_23DAB32D0()
{
  return MEMORY[0x24BE3F520]();
}

uint64_t sub_23DAB32DC()
{
  return MEMORY[0x24BE3F528]();
}

uint64_t sub_23DAB32E8()
{
  return MEMORY[0x24BE3F530]();
}

uint64_t sub_23DAB32F4()
{
  return MEMORY[0x24BE3F538]();
}

uint64_t sub_23DAB3300()
{
  return MEMORY[0x24BE3F540]();
}

uint64_t sub_23DAB330C()
{
  return MEMORY[0x24BE3F548]();
}

uint64_t sub_23DAB3318()
{
  return MEMORY[0x24BE3F550]();
}

uint64_t sub_23DAB3324()
{
  return MEMORY[0x24BE3F558]();
}

uint64_t sub_23DAB3330()
{
  return MEMORY[0x24BE3F560]();
}

uint64_t sub_23DAB333C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DAB3348()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23DAB3354()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DAB3360()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_23DAB336C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23DAB3378()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23DAB3384()
{
  return MEMORY[0x24BEE0398]();
}

uint64_t sub_23DAB3390()
{
  return MEMORY[0x24BEE03E0]();
}

uint64_t sub_23DAB339C()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_23DAB33A8()
{
  return MEMORY[0x24BEE0630]();
}

uint64_t sub_23DAB33B4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DAB33C0()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23DAB33CC()
{
  return MEMORY[0x24BEE0AF8]();
}

uint64_t sub_23DAB33D8()
{
  return MEMORY[0x24BEE0B08]();
}

uint64_t sub_23DAB33E4()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_23DAB33F0()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_23DAB33FC()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_23DAB3408()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t sub_23DAB3414()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_23DAB3420()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_23DAB342C()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_23DAB3438()
{
  return MEMORY[0x24BEE1108]();
}

uint64_t sub_23DAB3444()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23DAB3450()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_23DAB345C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DAB3468()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DAB3474()
{
  return MEMORY[0x24BEE1BE0]();
}

uint64_t sub_23DAB3480()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_23DAB348C()
{
  return MEMORY[0x24BEE1C20]();
}

uint64_t sub_23DAB3498()
{
  return MEMORY[0x24BEE2380]();
}

uint64_t sub_23DAB34A4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DAB34B0()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t sub_23DAB34BC()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_23DAB34C8()
{
  return MEMORY[0x24BEE42F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

