id static DRPDropletPrototypeSettingsDomain.rootSettings()()
{
  id result;
  objc_super v1;

  v1.receiver = (id)swift_getObjCClassFromMetadata();
  v1.super_class = (Class)&OBJC_METACLASS___DRPDropletPrototypeSettingsDomain;
  result = objc_msgSendSuper2(&v1, sel_rootSettings);
  if (result)
  {
    objc_opt_self();
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static DRPDropletPrototypeSettingsDomain.domainGroupName()()
{
  return 0x6F42676E69727053;
}

uint64_t static DRPDropletPrototypeSettingsDomain.domainName()()
{
  return 0x5574656C706F7244;
}

uint64_t static DRPDropletPrototypeSettingsDomain.rootSettingsClass()()
{
  return type metadata accessor for DRPDropletPrototypeSettings(0);
}

unint64_t type metadata accessor for DRPDropletPrototypeSettingsDomain()
{
  unint64_t result;

  result = qword_2569C25F8;
  if (!qword_2569C25F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569C25F8);
  }
  return result;
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
  sub_23A814884(a1, &qword_2569C2600);
}

__n128 __swift_memcpy80_4(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_23A8140F8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A814118(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 80) = v3;
  return result;
}

void type metadata accessor for CAColorMatrix(uint64_t a1)
{
  sub_23A814884(a1, &qword_2569C2608);
}

void type metadata accessor for UIRectEdge(uint64_t a1)
{
  sub_23A814884(a1, (unint64_t *)&unk_2569C2610);
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_23A814884(a1, &qword_2542D7FA8);
}

uint64_t initializeBufferWithCopyOfBuffer for DropletParticipantTrackingView.ParticipantGeometry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_23A8141C4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A8141E4(uint64_t result, int a2, int a3)
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
  sub_23A814884(a1, &qword_2569C2620);
}

void type metadata accessor for DropletFluidBehaviorType(uint64_t a1)
{
  sub_23A814884(a1, &qword_2569C2628);
}

_QWORD *sub_23A814238@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23A814248(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_23A814254@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_23A814260(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_23A814274(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23A81427C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_23A814290@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_23A8142A4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_23A8142B8(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_23A8142E8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_23A814314@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_23A814338(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23A81434C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23A814360(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_23A814374@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_23A814388(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_23A81439C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_23A8143B0(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_23A8143C4()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_23A8143D4()
{
  return sub_23A84C318();
}

_QWORD *sub_23A8143EC(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_23A814400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x23B85857C](&unk_23A84DEC0, a3);
  return sub_23A84C198();
}

uint64_t sub_23A81444C()
{
  return sub_23A8145BC(&qword_2569C2630, (uint64_t (*)(uint64_t))type metadata accessor for CGColor, (uint64_t)&unk_23A84DE50);
}

uint64_t sub_23A814478@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_23A8146AC(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_23A8144B4(uint64_t a1)
{
  MEMORY[0x23B85857C](&unk_23A84DEC0, a1);
  return sub_23A84C1B0();
}

uint64_t sub_23A8144F0()
{
  MEMORY[0x23B85857C](&unk_23A84DEC0);
  return sub_23A84C1A4();
}

uint64_t sub_23A814538(uint64_t a1, uint64_t a2)
{
  sub_23A84C42C();
  MEMORY[0x23B85857C](&unk_23A84DEC0, a2);
  sub_23A84C1A4();
  return sub_23A84C444();
}

uint64_t sub_23A814590()
{
  return sub_23A8145BC(&qword_2569C2638, (uint64_t (*)(uint64_t))type metadata accessor for CGColor, (uint64_t)&unk_23A84DE7C);
}

uint64_t sub_23A8145BC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B85857C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A8145FC()
{
  return sub_23A8145BC(&qword_2569C2640, (uint64_t (*)(uint64_t))type metadata accessor for UIRectEdge, (uint64_t)&unk_23A84DF2C);
}

uint64_t sub_23A814628()
{
  return sub_23A8145BC(&qword_2569C2648, (uint64_t (*)(uint64_t))type metadata accessor for UIRectEdge, (uint64_t)&unk_23A84DEF8);
}

uint64_t sub_23A814654()
{
  return sub_23A8145BC(&qword_2569C2650, (uint64_t (*)(uint64_t))type metadata accessor for UIRectEdge, (uint64_t)&unk_23A84DF58);
}

uint64_t sub_23A814680()
{
  return sub_23A8145BC(&qword_2569C2658, (uint64_t (*)(uint64_t))type metadata accessor for UIRectEdge, (uint64_t)&unk_23A84DF94);
}

uint64_t sub_23A8146AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
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

uint64_t sub_23A814708(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A814728(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 128) = v3;
  return result;
}

void type metadata accessor for CATransform3D(uint64_t a1)
{
  sub_23A814884(a1, &qword_2542D7FD0);
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

uint64_t sub_23A81479C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A8147BC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_23A814884(a1, &qword_2569C26C8);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_23A814884(a1, &qword_2569C26D0);
}

uint64_t getEnumTagSinglePayload for KeylineWidth(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for KeylineWidth(uint64_t result, int a2, int a3)
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
  sub_23A814884(a1, &qword_2569C26D8);
}

void sub_23A814884(uint64_t a1, unint64_t *a2)
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

void sub_23A8148E8(double a1)
{
  char *v1;
  double v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius];
  *(double *)&v1[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius] = a1;
  if (v2 != a1)
  {
    if (a1 <= 0.0 == v2 > 0.0)
      sub_23A814EB0();
    v3 = objc_msgSend(v1, sel_layer);
    v4 = (void *)sub_23A84C18C();
    if (qword_2569C2570 != -1)
      swift_once();
    v5 = (id)sub_23A84C210();
    objc_msgSend(v3, sel_setValue_forKeyPath_, v4, v5);

  }
}

id sub_23A8149E0(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  objc_super v20;

  v4[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius] = 0;
  v20.receiver = v4;
  v20.super_class = (Class)type metadata accessor for BlurredView();
  v9 = objc_msgSendSuper2(&v20, sel_initWithFrame_, a1, a2, a3, a4);
  sub_23A84C21C();
  v10 = objc_allocWithZone(MEMORY[0x24BDE56B0]);
  v11 = v9;
  v12 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_initWithType_, v12);

  v14 = (void *)sub_23A84C2B8();
  objc_msgSend(v13, sel_setValue_forKeyPath_, v14, *MEMORY[0x24BDE5B18]);

  objc_msgSend(v13, sel_setEnabled_, 0);
  v15 = objc_msgSend(v11, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_23A84E0E0;
  *(_QWORD *)(v16 + 56) = sub_23A815020();
  *(_QWORD *)(v16 + 32) = v13;
  v17 = v13;
  v18 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setFilters_, v18);

  return v11;
}

uint64_t sub_23A814D6C()
{
  uint64_t result;

  sub_23A84C21C();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  sub_23A84C240();
  sub_23A84C21C();
  sub_23A84C240();
  result = swift_bridgeObjectRelease();
  qword_2569C3B80 = 0x2E737265746C6966;
  *(_QWORD *)algn_2569C3B88 = 0xE800000000000000;
  return result;
}

uint64_t sub_23A814E0C()
{
  uint64_t result;

  sub_23A84C330();
  swift_bridgeObjectRelease();
  sub_23A84C21C();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  result = sub_23A84C240();
  qword_2569C3B90 = 0x2E737265746C6966;
  *(_QWORD *)algn_2569C3B98 = 0xE800000000000000;
  return result;
}

void sub_23A814EB0()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_layer);
  v2 = (void *)sub_23A84C294();
  if (qword_2569C2578 != -1)
    swift_once();
  v3 = (id)sub_23A84C210();
  objc_msgSend(v1, sel_setValue_forKeyPath_, v2);

}

id sub_23A814F8C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlurredView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BlurredView()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B858564]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A815020()
{
  unint64_t result;

  result = qword_2542D8030;
  if (!qword_2542D8030)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D8030);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FrameRateReason(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FrameRateReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A815144 + 4 * byte_23A84E101[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A815178 + 4 * asc_23A84E0FC[v4]))();
}

uint64_t sub_23A815178(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A815180(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A815188);
  return result;
}

uint64_t sub_23A815194(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A81519CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A8151A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8151A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8151B4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A8151C0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FrameRateReason()
{
  return &type metadata for FrameRateReason;
}

BOOL sub_23A8151DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A8151F4()
{
  sub_23A84C42C();
  sub_23A84C438();
  return sub_23A84C444();
}

uint64_t sub_23A815238()
{
  return sub_23A84C438();
}

uint64_t sub_23A815260()
{
  sub_23A84C42C();
  sub_23A84C438();
  return sub_23A84C444();
}

_DWORD *sub_23A8152A0@<X0>(_DWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_23A8152C0(_DWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_23A8152D0()
{
  unint64_t result;

  result = qword_2569C2778;
  if (!qword_2569C2778)
  {
    result = MEMORY[0x23B85857C](&unk_23A84E190, &type metadata for FrameRateReason);
    atomic_store(result, (unint64_t *)&qword_2569C2778);
  }
  return result;
}

unint64_t sub_23A815318()
{
  unint64_t result;

  result = qword_2542D7DE0;
  if (!qword_2542D7DE0)
  {
    result = MEMORY[0x23B85857C](&unk_23A84E118, &type metadata for FrameRateReason);
    atomic_store(result, (unint64_t *)&qword_2542D7DE0);
  }
  return result;
}

uint64_t sub_23A81535C()
{
  return 47;
}

uint64_t DRPDropletPrototypeSettings.suppressCompositingFilterMultiply.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterMultiply);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.suppressCompositingFilterMultiply.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterMultiply);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.suppressCompositingFilterDestOut.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterDestOut);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.suppressCompositingFilterDestOut.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterDestOut);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.suppressDropletEffectFilters.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressDropletEffectFilters);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.suppressDropletEffectFilters.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_suppressDropletEffectFilters);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.rightEdgeHintSize.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintSize;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.rightEdgeHintSize.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintSize);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.rightEdgeHintDropletRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintDropletRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.rightEdgeHintDropletRadius.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintDropletRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.edgeHintKeylineInnerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineInnerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.edgeHintKeylineInnerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineInnerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.edgeHintKeylineOuterWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineOuterWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.edgeHintKeylineOuterWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineOuterWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id DRPDropletPrototypeSettings.edgeHintKeylineAdaptiveColorMatrix.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineAdaptiveColorMatrix);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeHintKeylineAdaptiveColorMatrix.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineAdaptiveColorMatrix);
}

id DRPDropletPrototypeSettings.edgeHintCenterXAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterXAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeHintCenterXAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterXAnimationSettings);
}

id DRPDropletPrototypeSettings.edgeHintCenterYAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterYAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeHintCenterYAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterYAnimationSettings);
}

id DRPDropletPrototypeSettings.edgeHintContainerWidthAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerWidthAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeHintContainerWidthAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerWidthAnimationSettings);
}

id DRPDropletPrototypeSettings.edgeHintContainerHeightAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerHeightAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeHintContainerHeightAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerHeightAnimationSettings);
}

id DRPDropletPrototypeSettings.edgeHintKeylineStyleAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineStyleAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeHintKeylineStyleAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineStyleAnimationSettings);
}

double DRPDropletPrototypeSettings.edgeContentPresentedKeylineInnerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineInnerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.edgeContentPresentedKeylineInnerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineInnerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.edgeContentPresentedKeylineOuterWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineOuterWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.edgeContentPresentedKeylineOuterWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineOuterWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id DRPDropletPrototypeSettings.edgeContentPresentedKeylineAdaptiveColorMatrix.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineAdaptiveColorMatrix);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeContentPresentedKeylineAdaptiveColorMatrix.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineAdaptiveColorMatrix);
}

id DRPDropletPrototypeSettings.edgeContentPresentedCenterXAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterXAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeContentPresentedCenterXAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterXAnimationSettings);
}

id DRPDropletPrototypeSettings.edgeContentPresentedCenterYAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterYAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeContentPresentedCenterYAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterYAnimationSettings);
}

id DRPDropletPrototypeSettings.edgeContentPresentedContainerWidthAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerWidthAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeContentPresentedContainerWidthAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerWidthAnimationSettings);
}

id DRPDropletPrototypeSettings.edgeContentPresentedContainerHeightAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerHeightAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeContentPresentedContainerHeightAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerHeightAnimationSettings);
}

id DRPDropletPrototypeSettings.edgeContentPresentedKeylineStyleAnimationSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineStyleAnimationSettings);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.edgeContentPresentedKeylineStyleAnimationSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineStyleAnimationSettings);
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeBlurRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeBlurRadius.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftLargeWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftSmallWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleSoftSmallWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeBlurRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeBlurRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeBlurRadius.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeBlurRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardLargeWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardSmallKeylineSoft.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallKeylineSoft);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardSmallKeylineSoft.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallKeylineSoft);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardSmallWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleHardSmallWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletPrototypeSettings.intelligentEdgeLightEDRGainAmount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightEDRGainAmount;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletPrototypeSettings.intelligentEdgeLightEDRGainAmount.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightEDRGainAmount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleColorMatrix.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleColorMatrix);
  swift_beginAccess();
  return *v1;
}

void DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleColorMatrix.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleColorMatrix);
}

id DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleDefaultBehaviorSettings.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
  swift_beginAccess();
  return *v1;
}

void sub_23A8170D0(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

void DRPDropletPrototypeSettings.intelligentEdgeLightKeylineStyleDefaultBehaviorSettings.setter(void *a1)
{
  sub_23A817134(a1, &OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
}

void sub_23A817134(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

Swift::Void __swiftcall DRPDropletPrototypeSettings.setDefaultValues()()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;
  __int128 v17;

  v1 = v0;
  v16.super_class = (Class)DRPDropletPrototypeSettings;
  objc_msgSendSuper2(&v16, sel_setDefaultValues);
  objc_msgSend(v0, sel_setSuppressCompositingFilterMultiply_, 0);
  objc_msgSend(v0, sel_setSuppressCompositingFilterDestOut_, 0);
  objc_msgSend(v0, sel_setRightEdgeHintSize_, 53.3333333);
  objc_msgSend(v0, sel_setRightEdgeHintDropletRadius_, 25.0);
  objc_msgSend(v0, sel_setEdgeHintKeylineInnerWidth_, 0.0);
  objc_msgSend(v0, sel_setEdgeHintKeylineOuterWidth_, 2.5);
  v2 = objc_msgSend(v0, sel_edgeHintKeylineAdaptiveColorMatrix);
  sub_23A81761C();

  v3 = objc_msgSend(v1, sel_edgeHintCenterXAnimationSettings);
  sub_23A8177E8();

  v4 = objc_msgSend(v1, sel_edgeHintCenterYAnimationSettings);
  sub_23A8177E8();

  v5 = objc_msgSend(v1, sel_edgeHintContainerWidthAnimationSettings);
  sub_23A8177E8();

  v6 = objc_msgSend(v1, sel_edgeHintContainerHeightAnimationSettings);
  sub_23A8177E8();

  v7 = objc_msgSend(v1, sel_edgeHintKeylineStyleAnimationSettings);
  sub_23A8179B0();

  objc_msgSend(v1, sel_setEdgeContentPresentedKeylineInnerWidth_, 0.0);
  objc_msgSend(v1, sel_setEdgeContentPresentedKeylineOuterWidth_, 2.5);
  v8 = objc_msgSend(v1, sel_edgeContentPresentedKeylineAdaptiveColorMatrix);
  sub_23A81761C();

  v9 = objc_msgSend(v1, sel_edgeContentPresentedCenterXAnimationSettings);
  sub_23A8177E8();

  v10 = objc_msgSend(v1, sel_edgeContentPresentedCenterYAnimationSettings);
  sub_23A8177E8();

  v11 = objc_msgSend(v1, sel_edgeContentPresentedContainerWidthAnimationSettings);
  sub_23A8177E8();

  v12 = objc_msgSend(v1, sel_edgeContentPresentedContainerHeightAnimationSettings);
  sub_23A8177E8();

  v13 = objc_msgSend(v1, sel_edgeContentPresentedKeylineStyleAnimationSettings);
  sub_23A8179B0();

  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftLargeBlurRadius_, 20.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftLargeWidth_, 10.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftSmallKeylineSoft_, 0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleSoftSmallWidth_, 2.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardLargeBlurRadius_, 16.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardLargeWidth_, 12.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardSmallKeylineSoft_, 1);
  objc_msgSend(v1, sel_setIntelligentEdgeLightKeylineStyleHardSmallWidth_, 10.0);
  objc_msgSend(v1, sel_setIntelligentEdgeLightEDRGainAmount_, 2.0);
  v14 = objc_msgSend(v1, sel_intelligentEdgeLightKeylineStyleColorMatrix);
  CAColorMatrixMakeMultiplyColor();
  sub_23A842A74((float *)&v17);

  v15 = objc_msgSend(v1, sel_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
  sub_23A8179B0();

}

id sub_23A81761C()
{
  void *v0;

  objc_msgSend(v0, sel_setDefaultValues);
  objc_msgSend(v0, sel_setM11_, 0.0);
  objc_msgSend(v0, sel_setM12_, 0.0);
  objc_msgSend(v0, sel_setM13_, 0.0);
  objc_msgSend(v0, sel_setM14_, 0.0);
  objc_msgSend(v0, sel_setM15_, 0.943);
  objc_msgSend(v0, sel_setM21_, 0.0);
  objc_msgSend(v0, sel_setM22_, 0.0);
  objc_msgSend(v0, sel_setM23_, 0.0);
  objc_msgSend(v0, sel_setM24_, 0.0);
  objc_msgSend(v0, sel_setM25_, 0.943);
  objc_msgSend(v0, sel_setM31_, 0.0);
  objc_msgSend(v0, sel_setM32_, 0.0);
  objc_msgSend(v0, sel_setM33_, 0.0);
  objc_msgSend(v0, sel_setM34_, 0.0);
  objc_msgSend(v0, sel_setM35_, 0.943);
  objc_msgSend(v0, sel_setM41_, -0.213);
  objc_msgSend(v0, sel_setM42_, -0.715);
  objc_msgSend(v0, sel_setM43_, -0.072);
  objc_msgSend(v0, sel_setM44_, 0.14);
  return objc_msgSend(v0, sel_setM45_, 0.0);
}

void sub_23A8177E8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  _BYTE v19[16];

  v1 = v0;
  v2 = sub_23A84C1C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v1, sel_setDefaultValues);
  objc_msgSend(v1, sel_setDampingRatio_, 0.7);
  objc_msgSend(v1, sel_setResponse_, 0.6);
  objc_msgSend(v1, sel_setBehaviorType_, 1);
  v6 = (void *)sub_23A84C210();
  objc_msgSend(v1, sel_setName_, v6);

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7B330]), sel_initWithDefaultValues);
  if (v7)
  {
    v8 = v7;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEB36F0], v2);
    sub_23A84C1BC();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    v19[15] = 1;
    sub_23A81A214();
    v15 = sub_23A84C1D4();
    LODWORD(v16) = v10;
    LODWORD(v17) = v12;
    LODWORD(v18) = v14;
    objc_msgSend(v8, sel_setFrameRateRange_highFrameRateReason_, v15, v16, v17, v18);
    objc_msgSend(v1, sel_setPreferredFrameRateRange_, v8);

  }
  else
  {
    __break(1u);
  }
}

void sub_23A8179B0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  _BYTE v19[16];

  v1 = v0;
  v2 = sub_23A84C1C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v1, sel_setDefaultValues);
  objc_msgSend(v1, sel_setDampingRatio_, 0.95);
  objc_msgSend(v1, sel_setResponse_, 0.2);
  objc_msgSend(v1, sel_setTrackingDampingRatio_, 1.0);
  objc_msgSend(v1, sel_setTrackingResponse_, 0.15);
  objc_msgSend(v1, sel_setBehaviorType_, 1);
  v6 = (void *)sub_23A84C210();
  objc_msgSend(v1, sel_setName_, v6);

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7B330]), sel_initWithDefaultValues);
  if (v7)
  {
    v8 = v7;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEB36F0], v2);
    sub_23A84C1BC();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    v19[15] = 1;
    sub_23A81A214();
    v15 = sub_23A84C1D4();
    LODWORD(v16) = v10;
    LODWORD(v17) = v12;
    LODWORD(v18) = v14;
    objc_msgSend(v8, sel_setFrameRateRange_highFrameRateReason_, v15, v16, v17, v18);
    objc_msgSend(v1, sel_setPreferredFrameRateRange_, v8);

  }
  else
  {
    __break(1u);
  }
}

void _sSo27DRPDropletPrototypeSettingsC9DropletUIE24settingsControllerModuleSo8PTModuleCSgyFZ_0()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  id v125;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  void *v142;
  id v143;
  unint64_t v144;
  unint64_t v145;
  void *v146;
  void *v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  id v168;
  id v169;
  uint64_t v170;
  id v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  _OWORD v177[2];
  __int128 v178;
  uint64_t v179;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23A84E0E0;
  v175 = (void *)objc_opt_self();
  v1 = objc_msgSend(v175, sel_actionWithSettingsKeyPath_, 0);
  v2 = (void *)sub_23A84C210();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_rowWithTitle_action_, v2, v1);

  if (!v4)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v163 = v3;
  v5 = (void *)objc_opt_self();
  v6 = sub_23A81A1DC(0, &qword_2569C2880);
  *(_QWORD *)(v0 + 56) = v6;
  *(_QWORD *)(v0 + 32) = v4;
  v7 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v8 = v5;
  v9 = objc_msgSend(v5, sel_sectionWithRows_, v7);

  v162 = v9;
  if (!v9)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23A84E220;
  v11 = (void *)sub_23A84C210();
  v12 = (void *)sub_23A84C210();
  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_rowWithTitle_valueKeyPath_, v11, v12);

  if (!v14)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v15 = sub_23A81A1DC(0, &qword_2569C2888);
  *(_QWORD *)(v10 + 56) = v15;
  *(_QWORD *)(v10 + 32) = v14;
  v16 = (void *)sub_23A84C210();
  v17 = (void *)sub_23A84C210();
  v18 = objc_msgSend(v13, sel_rowWithTitle_valueKeyPath_, v16, v17);

  if (!v18)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  *(_QWORD *)(v10 + 88) = v15;
  *(_QWORD *)(v10 + 64) = v18;
  v19 = (void *)sub_23A84C210();
  v20 = (void *)sub_23A84C210();
  v21 = objc_msgSend(v13, sel_rowWithTitle_valueKeyPath_, v19, v20);

  if (!v21)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  *(_QWORD *)(v10 + 120) = v15;
  *(_QWORD *)(v10 + 96) = v21;
  v22 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v23 = (void *)sub_23A84C210();
  v24 = objc_msgSend(v8, sel_sectionWithRows_title_, v22, v23);

  v161 = v24;
  if (!v24)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_23A84E230;
  v26 = (void *)sub_23A84C210();
  v27 = (void *)sub_23A84C210();
  v173 = (void *)objc_opt_self();
  v28 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v26, v27);

  if (!v28)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (!objc_msgSend(v28, sel_precision_, 3))
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v177, &v178);
  v29 = sub_23A81A1DC(0, (unint64_t *)&qword_2569C2890);
  swift_dynamicCast();

  v170 = v29;
  *(_QWORD *)(v25 + 56) = v29;
  *(_QWORD *)(v25 + 32) = v176;
  v30 = (void *)sub_23A84C210();
  v31 = (void *)sub_23A84C210();
  v32 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v30, v31);

  if (!v32)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  v169 = v8;
  if (!objc_msgSend(v32, sel_precision_, 3))
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v177, &v178);
  swift_dynamicCast();

  *(_QWORD *)(v25 + 88) = v170;
  *(_QWORD *)(v25 + 64) = v176;
  v33 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v34 = (void *)sub_23A84C210();
  v35 = objc_msgSend(v8, sel_sectionWithRows_title_, v33, v34);

  if (!v35)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_23A84E240;
  v37 = (void *)sub_23A84C210();
  v38 = (void *)sub_23A84C210();
  v39 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v37, v38);

  if (!v39)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (!objc_msgSend(v39, sel_precision_, 3))
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v177, &v178);
  swift_dynamicCast();

  *(_QWORD *)(v36 + 56) = v170;
  *(_QWORD *)(v36 + 32) = v176;
  v40 = (void *)sub_23A84C210();
  v41 = (void *)sub_23A84C210();
  v42 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v40, v41);

  if (!v42)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (!objc_msgSend(v42, sel_precision_, 3))
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  v160 = v35;
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v177, &v178);
  swift_dynamicCast();

  *(_QWORD *)(v36 + 88) = v170;
  *(_QWORD *)(v36 + 64) = v176;
  v43 = (void *)sub_23A84C210();
  v44 = (void *)sub_23A84C210();
  v45 = (void *)objc_opt_self();
  v46 = objc_msgSend(v45, sel_rowWithTitle_childSettingsKeyPath_, v43, v44);

  if (!v46)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  v47 = sub_23A81A1DC(0, &qword_2569C2898);
  *(_QWORD *)(v36 + 120) = v47;
  *(_QWORD *)(v36 + 96) = v46;
  v48 = (void *)sub_23A84C210();
  v49 = (void *)sub_23A84C210();
  v50 = objc_msgSend(v45, sel_rowWithTitle_childSettingsKeyPath_, v48, v49);

  if (!v50)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  *(_QWORD *)(v36 + 152) = v47;
  *(_QWORD *)(v36 + 128) = v50;
  v51 = (void *)sub_23A84C210();
  v52 = (void *)sub_23A84C210();
  v53 = objc_msgSend(v45, sel_rowWithTitle_childSettingsKeyPath_, v51, v52);

  if (!v53)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  *(_QWORD *)(v36 + 184) = v47;
  *(_QWORD *)(v36 + 160) = v53;
  v54 = (void *)sub_23A84C210();
  v55 = (void *)sub_23A84C210();
  v56 = objc_msgSend(v45, sel_rowWithTitle_childSettingsKeyPath_, v54, v55);

  if (!v56)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  *(_QWORD *)(v36 + 216) = v47;
  *(_QWORD *)(v36 + 192) = v56;
  v57 = (void *)sub_23A84C210();
  v58 = (void *)sub_23A84C210();
  v59 = objc_msgSend(v45, sel_rowWithTitle_childSettingsKeyPath_, v57, v58);

  if (!v59)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  *(_QWORD *)(v36 + 248) = v47;
  *(_QWORD *)(v36 + 224) = v59;
  v60 = (void *)sub_23A84C210();
  v61 = (void *)sub_23A84C210();
  v167 = v45;
  v62 = objc_msgSend(v45, sel_rowWithTitle_childSettingsKeyPath_, v60, v61);

  if (!v62)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  *(_QWORD *)(v36 + 280) = v47;
  *(_QWORD *)(v36 + 256) = v62;
  v63 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v64 = (void *)sub_23A84C210();
  v65 = objc_msgSend(v169, sel_sectionWithRows_title_, v63, v64);

  if (!v65)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_23A84E240;
  v67 = (void *)sub_23A84C210();
  v68 = (void *)sub_23A84C210();
  v69 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v67, v68);

  if (!v69)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  if (!objc_msgSend(v69, sel_precision_, 3))
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v166 = v65;
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v177, &v178);
  swift_dynamicCast();

  *(_QWORD *)(v66 + 56) = v170;
  *(_QWORD *)(v66 + 32) = v176;
  v70 = (void *)sub_23A84C210();
  v71 = (void *)sub_23A84C210();
  v72 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v70, v71);

  if (!v72)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  if (!objc_msgSend(v72, sel_precision_, 3))
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v177, &v178);
  swift_dynamicCast();

  *(_QWORD *)(v66 + 88) = v170;
  *(_QWORD *)(v66 + 64) = v176;
  v73 = (void *)sub_23A84C210();
  v74 = (void *)sub_23A84C210();
  v75 = objc_msgSend(v167, sel_rowWithTitle_childSettingsKeyPath_, v73, v74);

  if (!v75)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  *(_QWORD *)(v66 + 120) = v47;
  *(_QWORD *)(v66 + 96) = v75;
  v76 = (void *)sub_23A84C210();
  v77 = (void *)sub_23A84C210();
  v78 = objc_msgSend(v167, sel_rowWithTitle_childSettingsKeyPath_, v76, v77);

  if (!v78)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  *(_QWORD *)(v66 + 152) = v47;
  *(_QWORD *)(v66 + 128) = v78;
  v79 = (void *)sub_23A84C210();
  v80 = (void *)sub_23A84C210();
  v81 = objc_msgSend(v167, sel_rowWithTitle_childSettingsKeyPath_, v79, v80);

  if (!v81)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  *(_QWORD *)(v66 + 184) = v47;
  *(_QWORD *)(v66 + 160) = v81;
  v82 = (void *)sub_23A84C210();
  v83 = (void *)sub_23A84C210();
  v84 = objc_msgSend(v167, sel_rowWithTitle_childSettingsKeyPath_, v82, v83);

  if (!v84)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  *(_QWORD *)(v66 + 216) = v47;
  *(_QWORD *)(v66 + 192) = v84;
  v85 = (void *)sub_23A84C210();
  v86 = (void *)sub_23A84C210();
  v87 = objc_msgSend(v167, sel_rowWithTitle_childSettingsKeyPath_, v85, v86);

  if (!v87)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  *(_QWORD *)(v66 + 248) = v47;
  *(_QWORD *)(v66 + 224) = v87;
  v88 = (void *)sub_23A84C210();
  v89 = (void *)sub_23A84C210();
  v90 = objc_msgSend(v167, sel_rowWithTitle_childSettingsKeyPath_, v88, v89);

  if (!v90)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  *(_QWORD *)(v66 + 280) = v47;
  *(_QWORD *)(v66 + 256) = v90;
  v91 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v92 = (void *)sub_23A84C210();
  v93 = objc_msgSend(v169, sel_sectionWithRows_title_, v91, v92);

  if (!v93)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  v165 = v93;
  v94 = swift_allocObject();
  *(_OWORD *)(v94 + 16) = xmmword_23A84E250;
  v95 = (void *)sub_23A84C210();
  v96 = (void *)sub_23A84C210();
  v97 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v95, v96);

  if (!v97)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  *(_QWORD *)(v94 + 56) = v170;
  *(_QWORD *)(v94 + 32) = v97;
  v98 = (void *)sub_23A84C210();
  v99 = (void *)sub_23A84C210();
  v100 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v98, v99);

  if (!v100)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  *(_QWORD *)(v94 + 88) = v170;
  *(_QWORD *)(v94 + 64) = v100;
  v101 = (void *)sub_23A84C210();
  v102 = (void *)sub_23A84C210();
  v103 = objc_msgSend(v13, sel_rowWithTitle_valueKeyPath_, v101, v102);

  if (!v103)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  *(_QWORD *)(v94 + 120) = v15;
  *(_QWORD *)(v94 + 96) = v103;
  v104 = (void *)sub_23A84C210();
  v105 = (void *)sub_23A84C210();
  v106 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v104, v105);

  if (!v106)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  *(_QWORD *)(v94 + 152) = v170;
  *(_QWORD *)(v94 + 128) = v106;
  v107 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v108 = (void *)sub_23A84C210();
  v109 = objc_msgSend(v169, sel_sectionWithRows_title_, v107, v108);

  v164 = v109;
  if (!v109)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  v110 = swift_allocObject();
  *(_OWORD *)(v110 + 16) = xmmword_23A84E250;
  v111 = (void *)sub_23A84C210();
  v112 = (void *)sub_23A84C210();
  v113 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v111, v112);

  if (!v113)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  *(_QWORD *)(v110 + 56) = v170;
  *(_QWORD *)(v110 + 32) = v113;
  v114 = (void *)sub_23A84C210();
  v115 = (void *)sub_23A84C210();
  v116 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v114, v115);

  if (!v116)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  *(_QWORD *)(v110 + 88) = v170;
  *(_QWORD *)(v110 + 64) = v116;
  v117 = (void *)sub_23A84C210();
  v118 = (void *)sub_23A84C210();
  v119 = objc_msgSend(v13, sel_rowWithTitle_valueKeyPath_, v117, v118);

  if (!v119)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  *(_QWORD *)(v110 + 120) = v15;
  *(_QWORD *)(v110 + 96) = v119;
  v120 = (void *)sub_23A84C210();
  v121 = (void *)sub_23A84C210();
  v122 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v120, v121);

  if (!v122)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  *(_QWORD *)(v110 + 152) = v170;
  *(_QWORD *)(v110 + 128) = v122;
  v123 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v124 = (void *)sub_23A84C210();
  v125 = objc_msgSend(v169, sel_sectionWithRows_title_, v123, v124);

  if (!v125)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  v168 = v125;
  v126 = swift_allocObject();
  *(_OWORD *)(v126 + 16) = xmmword_23A84E220;
  v127 = (void *)sub_23A84C210();
  v128 = (void *)sub_23A84C210();
  v129 = objc_msgSend(v173, sel_rowWithTitle_valueKeyPath_, v127, v128);

  if (!v129)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  *(_QWORD *)(v126 + 56) = v170;
  *(_QWORD *)(v126 + 32) = v129;
  v130 = (void *)sub_23A84C210();
  v131 = (void *)sub_23A84C210();
  v132 = objc_msgSend(v167, sel_rowWithTitle_childSettingsKeyPath_, v130, v131);

  if (!v132)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  *(_QWORD *)(v126 + 88) = v47;
  *(_QWORD *)(v126 + 64) = v132;
  v133 = (void *)sub_23A84C210();
  v134 = (void *)sub_23A84C210();
  v135 = objc_msgSend(v167, sel_rowWithTitle_childSettingsKeyPath_, v133, v134);

  if (!v135)
  {
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
LABEL_103:
    __break(1u);
    return;
  }
  *(_QWORD *)(v126 + 120) = v47;
  *(_QWORD *)(v126 + 96) = v135;
  v136 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v137 = (void *)sub_23A84C210();
  v138 = objc_msgSend(v169, sel_sectionWithRows_title_, v136, v137);

  v174 = v138;
  if (!v138)
    goto LABEL_102;
  *(_QWORD *)&v177[0] = MEMORY[0x24BEE4AF8];
  v139 = 50;
  sub_23A82640C(0, 50, 0);
  v140 = *(_QWORD *)&v177[0];
  do
  {
    v141 = objc_msgSend(v175, sel_actionWithSettingsKeyPath_, 0);
    v142 = (void *)sub_23A84C210();
    v143 = objc_msgSend(v163, sel_rowWithTitle_action_, v142, v141);

    if (!v143)
    {
      __break(1u);
      goto LABEL_56;
    }
    v179 = v6;
    *(_QWORD *)&v178 = v143;
    *(_QWORD *)&v177[0] = v140;
    v145 = *(_QWORD *)(v140 + 16);
    v144 = *(_QWORD *)(v140 + 24);
    if (v145 >= v144 >> 1)
    {
      sub_23A82640C((char *)(v144 > 1), v145 + 1, 1);
      v140 = *(_QWORD *)&v177[0];
    }
    *(_QWORD *)(v140 + 16) = v145 + 1;
    sub_23A81A1CC(&v178, (_OWORD *)(v140 + 32 * v145 + 32));
    --v139;
  }
  while (v139);
  v146 = (void *)sub_23A84C258();
  swift_release();
  v147 = (void *)sub_23A84C210();
  v148 = objc_msgSend(v169, sel_sectionWithRows_title_, v146, v147);

  if (!v148)
    goto LABEL_103;
  v149 = swift_allocObject();
  *(_OWORD *)(v149 + 16) = xmmword_23A84E260;
  v150 = sub_23A81A1DC(0, &qword_2569C28A0);
  *(_QWORD *)(v149 + 32) = v162;
  *(_QWORD *)(v149 + 56) = v150;
  *(_QWORD *)(v149 + 64) = v161;
  *(_QWORD *)(v149 + 88) = v150;
  *(_QWORD *)(v149 + 96) = v164;
  *(_QWORD *)(v149 + 120) = v150;
  *(_QWORD *)(v149 + 128) = v168;
  *(_QWORD *)(v149 + 152) = v150;
  *(_QWORD *)(v149 + 160) = v174;
  *(_QWORD *)(v149 + 184) = v150;
  *(_QWORD *)(v149 + 192) = v160;
  *(_QWORD *)(v149 + 216) = v150;
  *(_QWORD *)(v149 + 224) = v166;
  *(_QWORD *)(v149 + 248) = v150;
  *(_QWORD *)(v149 + 256) = v165;
  *(_QWORD *)(v149 + 312) = v150;
  *(_QWORD *)(v149 + 280) = v150;
  *(_QWORD *)(v149 + 288) = v148;
  v171 = v162;
  v151 = v161;
  v172 = v164;
  v152 = v168;
  v153 = v174;
  v154 = v160;
  v155 = v166;
  v156 = v165;
  v157 = v148;
  v158 = (void *)sub_23A84C210();
  v159 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  objc_msgSend(v169, sel_moduleWithTitle_contents_, v158, v159);

}

char *keypath_get_selector_suppressCompositingFilterMultiply()
{
  return sel_suppressCompositingFilterMultiply;
}

id sub_23A819754@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_suppressCompositingFilterMultiply);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A819784(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuppressCompositingFilterMultiply_, *a1);
}

char *keypath_get_selector_suppressCompositingFilterDestOut()
{
  return sel_suppressCompositingFilterDestOut;
}

id sub_23A8197A4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_suppressCompositingFilterDestOut);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A8197D4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuppressCompositingFilterDestOut_, *a1);
}

char *keypath_get_selector_suppressDropletEffectFilters()
{
  return sel_suppressDropletEffectFilters;
}

id sub_23A8197F4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_suppressDropletEffectFilters);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A819824(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuppressDropletEffectFilters_, *a1);
}

char *keypath_get_selector_rightEdgeHintSize()
{
  return sel_rightEdgeHintSize;
}

id sub_23A819844@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_rightEdgeHintSize);
  *a2 = v4;
  return result;
}

id sub_23A819874(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRightEdgeHintSize_, *a1);
}

char *keypath_get_selector_rightEdgeHintDropletRadius()
{
  return sel_rightEdgeHintDropletRadius;
}

id sub_23A819894@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_rightEdgeHintDropletRadius);
  *a2 = v4;
  return result;
}

id sub_23A8198C4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRightEdgeHintDropletRadius_, *a1);
}

char *keypath_get_selector_edgeHintKeylineInnerWidth()
{
  return sel_edgeHintKeylineInnerWidth;
}

id sub_23A8198E4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_edgeHintKeylineInnerWidth);
  *a2 = v4;
  return result;
}

id sub_23A819914(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintKeylineInnerWidth_, *a1);
}

char *keypath_get_selector_edgeHintKeylineOuterWidth()
{
  return sel_edgeHintKeylineOuterWidth;
}

id sub_23A819934@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_edgeHintKeylineOuterWidth);
  *a2 = v4;
  return result;
}

id sub_23A819964(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintKeylineOuterWidth_, *a1);
}

char *keypath_get_selector_edgeHintKeylineAdaptiveColorMatrix()
{
  return sel_edgeHintKeylineAdaptiveColorMatrix;
}

id sub_23A819984@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeHintKeylineAdaptiveColorMatrix);
  *a2 = result;
  return result;
}

id sub_23A8199BC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintKeylineAdaptiveColorMatrix_, *a1);
}

char *keypath_get_selector_edgeHintCenterXAnimationSettings()
{
  return sel_edgeHintCenterXAnimationSettings;
}

id sub_23A8199DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeHintCenterXAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819A14(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintCenterXAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeHintCenterYAnimationSettings()
{
  return sel_edgeHintCenterYAnimationSettings;
}

id sub_23A819A34@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeHintCenterYAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819A6C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintCenterYAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeHintContainerWidthAnimationSettings()
{
  return sel_edgeHintContainerWidthAnimationSettings;
}

id sub_23A819A8C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeHintContainerWidthAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819AC4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintContainerWidthAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeHintContainerHeightAnimationSettings()
{
  return sel_edgeHintContainerHeightAnimationSettings;
}

id sub_23A819AE4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeHintContainerHeightAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819B1C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintContainerHeightAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeHintKeylineStyleAnimationSettings()
{
  return sel_edgeHintKeylineStyleAnimationSettings;
}

id sub_23A819B3C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeHintKeylineStyleAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819B74(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeHintKeylineStyleAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedKeylineInnerWidth()
{
  return sel_edgeContentPresentedKeylineInnerWidth;
}

id sub_23A819B94@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_edgeContentPresentedKeylineInnerWidth);
  *a2 = v4;
  return result;
}

id sub_23A819BC4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedKeylineInnerWidth_, *a1);
}

char *keypath_get_selector_edgeContentPresentedKeylineOuterWidth()
{
  return sel_edgeContentPresentedKeylineOuterWidth;
}

id sub_23A819BE4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_edgeContentPresentedKeylineOuterWidth);
  *a2 = v4;
  return result;
}

id sub_23A819C14(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedKeylineOuterWidth_, *a1);
}

char *keypath_get_selector_edgeContentPresentedKeylineAdaptiveColorMatrix()
{
  return sel_edgeContentPresentedKeylineAdaptiveColorMatrix;
}

id sub_23A819C34@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeContentPresentedKeylineAdaptiveColorMatrix);
  *a2 = result;
  return result;
}

id sub_23A819C6C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedKeylineAdaptiveColorMatrix_, *a1);
}

char *keypath_get_selector_edgeContentPresentedCenterXAnimationSettings()
{
  return sel_edgeContentPresentedCenterXAnimationSettings;
}

id sub_23A819C8C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeContentPresentedCenterXAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819CC4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedCenterXAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedCenterYAnimationSettings()
{
  return sel_edgeContentPresentedCenterYAnimationSettings;
}

id sub_23A819CE4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeContentPresentedCenterYAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819D1C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedCenterYAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedContainerWidthAnimationSettings()
{
  return sel_edgeContentPresentedContainerWidthAnimationSettings;
}

id sub_23A819D3C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeContentPresentedContainerWidthAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819D74(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedContainerWidthAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedContainerHeightAnimationSettings()
{
  return sel_edgeContentPresentedContainerHeightAnimationSettings;
}

id sub_23A819D94@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeContentPresentedContainerHeightAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819DCC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedContainerHeightAnimationSettings_, *a1);
}

char *keypath_get_selector_edgeContentPresentedKeylineStyleAnimationSettings()
{
  return sel_edgeContentPresentedKeylineStyleAnimationSettings;
}

id sub_23A819DEC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_edgeContentPresentedKeylineStyleAnimationSettings);
  *a2 = result;
  return result;
}

id sub_23A819E24(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEdgeContentPresentedKeylineStyleAnimationSettings_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius()
{
  return sel_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius;
}

id sub_23A819E44@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius);
  *a2 = v4;
  return result;
}

id sub_23A819E74(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftLargeBlurRadius_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftLargeWidth()
{
  return sel_intelligentEdgeLightKeylineStyleSoftLargeWidth;
}

id sub_23A819E94@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftLargeWidth);
  *a2 = v4;
  return result;
}

id sub_23A819EC4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftLargeWidth_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft()
{
  return sel_intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft;
}

id sub_23A819EE4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A819F14(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftSmallKeylineSoft_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleSoftSmallWidth()
{
  return sel_intelligentEdgeLightKeylineStyleSoftSmallWidth;
}

id sub_23A819F34@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleSoftSmallWidth);
  *a2 = v4;
  return result;
}

id sub_23A819F64(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleSoftSmallWidth_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardLargeBlurRadius()
{
  return sel_intelligentEdgeLightKeylineStyleHardLargeBlurRadius;
}

id sub_23A819F84@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardLargeBlurRadius);
  *a2 = v4;
  return result;
}

id sub_23A819FB4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardLargeBlurRadius_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardLargeWidth()
{
  return sel_intelligentEdgeLightKeylineStyleHardLargeWidth;
}

id sub_23A819FD4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardLargeWidth);
  *a2 = v4;
  return result;
}

id sub_23A81A004(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardLargeWidth_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardSmallKeylineSoft()
{
  return sel_intelligentEdgeLightKeylineStyleHardSmallKeylineSoft;
}

id sub_23A81A024@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardSmallKeylineSoft);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A81A054(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardSmallKeylineSoft_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleHardSmallWidth()
{
  return sel_intelligentEdgeLightKeylineStyleHardSmallWidth;
}

id sub_23A81A074@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleHardSmallWidth);
  *a2 = v4;
  return result;
}

id sub_23A81A0A4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleHardSmallWidth_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightEDRGainAmount()
{
  return sel_intelligentEdgeLightEDRGainAmount;
}

id sub_23A81A0C4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightEDRGainAmount);
  *a2 = v4;
  return result;
}

id sub_23A81A0F4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightEDRGainAmount_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleColorMatrix()
{
  return sel_intelligentEdgeLightKeylineStyleColorMatrix;
}

id sub_23A81A114@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleColorMatrix);
  *a2 = result;
  return result;
}

id sub_23A81A14C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleColorMatrix_, *a1);
}

char *keypath_get_selector_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings()
{
  return sel_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings;
}

id sub_23A81A16C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
  *a2 = result;
  return result;
}

id sub_23A81A1A4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntelligentEdgeLightKeylineStyleDefaultBehaviorSettings_, *a1);
}

uint64_t type metadata accessor for DRPDropletPrototypeSettings(uint64_t a1)
{
  return sub_23A81A1DC(a1, &qword_2542D7FE8);
}

_OWORD *sub_23A81A1CC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23A81A1DC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_23A81A214()
{
  unint64_t result;

  result = qword_2542D7DD8;
  if (!qword_2542D7DD8)
  {
    result = MEMORY[0x23B85857C](&unk_23A84E1B8, &type metadata for FrameRateReason);
    atomic_store(result, (unint64_t *)&qword_2542D7DD8);
  }
  return result;
}

double DRPDropletViewConfiguration.centerX.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_centerX;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.centerX.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_centerX);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.centerY.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_centerY;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.centerY.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_centerY);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletViewConfiguration.boundaryEdges.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t DRPDropletViewConfiguration.boundaryEdges.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.containerCornerRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.containerCornerRadius.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.containerHeight.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_containerHeight;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.containerHeight.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerHeight);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.containerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_containerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.containerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

__n128 DRPDropletViewConfiguration.containerTransform.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  v3 = v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerTransform;
  swift_beginAccess();
  v4 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  v5 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  result = *(__n128 *)(v3 + 32);
  v8 = *(_OWORD *)(v3 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v8;
  return result;
}

__n128 DRPDropletViewConfiguration.containerTransform.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  v3 = v1 + OBJC_IVAR___DRPDropletViewConfiguration_containerTransform;
  swift_beginAccess();
  v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 80) = v4;
  v5 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v3 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v3 + 112) = v5;
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v3 = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 16) = v6;
  result = *(__n128 *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(v3 + 32) = result;
  *(_OWORD *)(v3 + 48) = v8;
  return result;
}

double sub_23A81AB0C@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(*a1, sel_containerTransform);
  result = *(double *)&v4;
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  a2[5] = v9;
  a2[6] = v10;
  a2[7] = v11;
  return result;
}

id sub_23A81AB64(_OWORD *a1, void **a2)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  v2 = *a2;
  v3 = a1[1];
  v8[0] = *a1;
  v8[1] = v3;
  v4 = a1[3];
  v8[2] = a1[2];
  v8[3] = v4;
  v5 = a1[5];
  v8[4] = a1[4];
  v8[5] = v5;
  v6 = a1[7];
  v8[6] = a1[6];
  v8[7] = v6;
  return objc_msgSend(v2, sel_setContainerTransform_, v8);
}

void *DRPDropletViewConfiguration.dropletColor.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___DRPDropletViewConfiguration_dropletColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void DRPDropletViewConfiguration.dropletColor.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_dropletColor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

double DRPDropletViewConfiguration.dropletRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.dropletRadius.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletViewConfiguration.boundaryOutsets.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletViewConfiguration.boundaryOutsets.setter(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  double *v9;
  uint64_t result;

  v9 = (double *)(v4 + OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets);
  result = swift_beginAccess();
  *v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return result;
}

uint64_t DRPDropletViewConfiguration.keylineStyle.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t DRPDropletViewConfiguration.keylineStyle.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___DRPDropletViewConfiguration_keylineStyle);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t DRPDropletViewConfiguration.anyAnimationCompletionBlock()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  sub_23A821984(v1);
  return v1;
}

uint64_t sub_23A81B198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v7 = sub_23A84C21C();
  v9 = v8;
  swift_retain();
  v6(v7, v9, a3, a4);
  swift_release();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall DRPDropletViewConfiguration.removeAnyAnimationCompletionBlocks()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)(v0 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  *v1 = 0;
  v1[1] = 0;
  sub_23A823048(v2);
}

uint64_t DRPDropletViewConfiguration.addAnyAnimationCompletionBlock(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (**v5)(uint64_t, uint64_t, char, char);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;

  v5 = (uint64_t (**)(uint64_t, uint64_t, char, char))(v2
                                                             + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  v6 = *(_QWORD *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  v7 = *(_QWORD *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock + 8);
  if (v6)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a1;
    *(_QWORD *)(v9 + 24) = a2;
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = sub_23A81B380;
    v10[3] = v8;
    v10[4] = sub_23A81B380;
    v10[5] = v9;
    v11 = sub_23A821784;
  }
  else
  {
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = a1;
    v10[3] = a2;
    v11 = sub_23A81B380;
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v10;
  *v5 = sub_23A81B384;
  v5[1] = (uint64_t (*)(uint64_t, uint64_t, char, char))v12;
  swift_retain();
  sub_23A821984(v6);
  return sub_23A823048(v6);
}

uint64_t sub_23A81B35C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A81B384(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v4;
  uint64_t (*v5)(_QWORD *, char *, char *);
  char v7;
  char v8;
  _QWORD v9[2];

  v5 = *(uint64_t (**)(_QWORD *, char *, char *))(v4 + 16);
  v9[0] = a1;
  v9[1] = a2;
  v8 = a3;
  v7 = a4;
  return v5(v9, &v8, &v7);
}

uint64_t sub_23A81B3C4(_QWORD *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(*a1, a1[1], *a2, *a3);
}

uint64_t (*DRPDropletViewConfiguration.animationBlock(forKeyPath:)(uint64_t a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t (*v9)(uint64_t);
  __int128 v11;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap);
  swift_beginAccess();
  v6 = *v5;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  v7 = sub_23A8200A8(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v11 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + 16 * v7);
  swift_retain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(swift_allocObject() + 16) = v11;
  v9 = sub_23A8217F4;
LABEL_6:
  swift_endAccess();
  return v9;
}

void sub_23A81B560(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t DRPDropletViewConfiguration.addAlongsideAnimationBlock(forKeyPath:animationBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t (*v16)(_QWORD *);
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;

  v9 = (uint64_t *)(v4 + OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap);
  swift_beginAccess();
  v10 = *v9;
  if (!*(_QWORD *)(*v9 + 16))
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v11 = sub_23A8200A8(a1, a2);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    swift_endAccess();
    if (a3)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a3;
      v15[3] = a4;
      v16 = sub_23A821898;
      goto LABEL_8;
    }
    sub_23A821984(0);
LABEL_11:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v19 = sub_23A820384(a1, a2, (void (*)(unint64_t, uint64_t))sub_23A82DE68, &qword_2569C2A08);
    swift_bridgeObjectRelease();
    sub_23A823048(v19);
    return swift_endAccess();
  }
  v21 = *(_OWORD *)(*(_QWORD *)(v10 + 56) + 16 * v11);
  swift_retain();
  swift_bridgeObjectRelease();
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v21;
  swift_endAccess();
  if (!a3)
  {
    sub_23A821984(0);
    sub_23A823048((uint64_t)sub_23A821878);
    goto LABEL_11;
  }
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = a4;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = sub_23A821878;
  v15[3] = v13;
  v15[4] = sub_23A821898;
  v15[5] = v14;
  v16 = sub_23A821828;
LABEL_8:
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = v15;
  sub_23A821984(a3);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22 = *v9;
  *v9 = 0x8000000000000000;
  sub_23A820F34((uint64_t)sub_23A821878, v17, a1, a2, isUniquelyReferenced_nonNull_native, &qword_2569C2A08);
  *v9 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_23A81B8F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t DRPDropletViewConfiguration.behaviorSettings(forKeyPath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap);
  swift_beginAccess();
  v6 = *v5;
  if (*(_QWORD *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    v7 = sub_23A8200A8(a1, a2);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
      swift_unknownObjectRetain();
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
  swift_endAccess();
  return v9;
}

uint64_t DRPDropletViewConfiguration.setBehaviorSettingsForKeyPath(_:behaviorSettings:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v7 = (uint64_t *)(v3 + OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  if (a3)
  {
    swift_unknownObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v7;
    *v7 = 0x8000000000000000;
    sub_23A820DD8(a3, a1, a2, isUniquelyReferenced_nonNull_native);
    *v7 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23A8202B8(a1, a2);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  return swift_endAccess();
}

uint64_t (*DRPDropletViewConfiguration.animationCompletionBlock(forKeyPath:)(uint64_t a1, uint64_t a2))(char a1, char a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t (*v9)(char, char);
  __int128 v11;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap);
  swift_beginAccess();
  v6 = *v5;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  v7 = sub_23A8200A8(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v11 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + 16 * v7);
  swift_retain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(swift_allocObject() + 16) = v11;
  v9 = sub_23A8218BC;
LABEL_6:
  swift_endAccess();
  return v9;
}

id sub_23A81BC5C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[6];

  v10 = sub_23A84C21C();
  v12 = v11;
  v13 = a1;
  v14 = a4(v10, v12);
  v16 = v15;

  swift_bridgeObjectRelease();
  if (!v14)
    return 0;
  v19[4] = v14;
  v19[5] = v16;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 1107296256;
  v19[2] = a5;
  v19[3] = a6;
  v17 = _Block_copy(v19);
  swift_release();
  return v17;
}

uint64_t sub_23A81BD24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t DRPDropletViewConfiguration.addAnimationCompletionBlock(forKeyPath:animationCompletionBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;

  v9 = (uint64_t *)(v4 + OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap);
  swift_beginAccess();
  v10 = *v9;
  if (!*(_QWORD *)(*v9 + 16))
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v11 = sub_23A8200A8(a1, a2);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    swift_endAccess();
    if (a3)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a3;
      v15[3] = a4;
      v16 = sub_23A821994;
      goto LABEL_8;
    }
    sub_23A821984(0);
LABEL_11:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v19 = sub_23A820384(a1, a2, (void (*)(unint64_t, uint64_t))sub_23A82DE68, &qword_2569C2A00);
    swift_bridgeObjectRelease();
    sub_23A823048(v19);
    return swift_endAccess();
  }
  v21 = *(_OWORD *)(*(_QWORD *)(v10 + 56) + 16 * v11);
  swift_retain();
  swift_bridgeObjectRelease();
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v21;
  swift_endAccess();
  if (!a3)
  {
    sub_23A821984(0);
    sub_23A823048((uint64_t)sub_23A821878);
    goto LABEL_11;
  }
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = a4;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = sub_23A821878;
  v15[3] = v13;
  v15[4] = sub_23A821994;
  v15[5] = v14;
  v16 = sub_23A821924;
LABEL_8:
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = v15;
  sub_23A821984(a3);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22 = *v9;
  *v9 = 0x8000000000000000;
  sub_23A820F34((uint64_t)sub_23A821878, v17, a1, a2, isUniquelyReferenced_nonNull_native, &qword_2569C2A00);
  *v9 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

id DRPDropletViewConfiguration.init(centerX:centerY:boundaryEdges:containerCornerRadius:containerHeight:containerWidth:containerTransform:dropletColor:dropletRadius:boundaryOutsets:keylineStyle:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[7];
  uint64_t v30;
  uint64_t v31;

  v28 = *(_OWORD *)(a2 + 16);
  v27 = *(_OWORD *)(a2 + 32);
  v26 = *(_OWORD *)(a2 + 48);
  v25 = *(_OWORD *)(a2 + 64);
  v24 = *(_OWORD *)(a2 + 80);
  v23 = *(_OWORD *)(a2 + 96);
  v19 = *(_QWORD *)(a2 + 112);
  v20 = *(_QWORD *)(a2 + 120);
  v29[0] = *(_OWORD *)a2;
  v29[1] = v28;
  v29[2] = v27;
  v29[3] = v26;
  v29[4] = v25;
  v29[5] = v24;
  v29[6] = v23;
  v30 = v19;
  v31 = v20;
  v21 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCenterX_centerY_boundaryEdges_containerCornerRadius_containerHeight_containerWidth_containerTransform_dropletColor_dropletRadius_boundaryOutsets_keylineStyle_, a1, v29, a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, a17, a18);

  swift_unknownObjectRelease();
  return v21;
}

id DRPDropletViewConfiguration.init(centerX:centerY:boundaryEdges:containerCornerRadius:containerHeight:containerWidth:containerTransform:dropletColor:dropletRadius:boundaryOutsets:keylineStyle:)(uint64_t a1, _OWORD *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18)
{
  id v19;

  v19 = sub_23A8219BC(a1, a2, a3, a4, a9, a10, a11, a12, a13, a14, a15, a16, a5, a6, a7, a8, a17, a18);
  swift_unknownObjectRelease();

  return v19;
}

void __swiftcall DRPDropletViewConfiguration.init(viewConfiguration:)(DRPDropletViewConfiguration *__return_ptr retstr, DRPDropletViewConfiguration *viewConfiguration)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithViewConfiguration_, viewConfiguration);

}

uint64_t DRPDropletViewConfiguration.init(viewConfiguration:)(char *a1)
{
  void *v1;
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  int64_t v29;
  _OWORD *v30;
  unint64_t v31;
  unint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  char v41;
  unint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  char v48;
  uint64_t *v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  int64_t v61;
  _OWORD *v62;
  unint64_t v63;
  unint64_t v64;
  int64_t v65;
  unint64_t v66;
  int64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char v73;
  unint64_t v74;
  uint64_t v75;
  _BOOL8 v76;
  uint64_t v77;
  char v78;
  unint64_t v79;
  char v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  int64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  int64_t v95;
  unint64_t v96;
  int64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  char v103;
  unint64_t v104;
  uint64_t v105;
  _BOOL8 v106;
  uint64_t v107;
  char v108;
  unint64_t v109;
  char v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t result;
  double v120;
  double v121;
  double v122;
  char *v123;
  char *v124;
  double v125;
  uint64_t v126;
  int64_t v127;
  uint64_t v128;
  double v129;
  __int128 v130;
  __int128 v131;
  int64_t v132;
  uint64_t v133;
  uint64_t v134;

  objc_msgSend(a1, sel_centerX);
  v129 = v3;
  objc_msgSend(a1, sel_centerY);
  v125 = v4;
  v5 = objc_msgSend(a1, sel_boundaryEdges);
  objc_msgSend(a1, sel_containerCornerRadius);
  v122 = v6;
  objc_msgSend(a1, sel_containerHeight);
  v121 = v7;
  objc_msgSend(a1, sel_containerWidth);
  v120 = v8;
  objc_msgSend(a1, sel_containerTransform);
  v9 = objc_msgSend(a1, sel_dropletColor);
  objc_msgSend(a1, sel_dropletRadius);
  v11 = v10;
  objc_msgSend(a1, sel_boundaryOutsets);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v124 = a1;
  if (objc_msgSend(a1, sel_keylineStyle))
  {
    objc_opt_self();
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_copy);
    sub_23A84C30C();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8000);
    swift_dynamicCast();
    v20 = v133;
    swift_unknownObjectRelease();
  }
  else
  {
    v20 = 0;
  }
  v21 = objc_msgSend(v1, sel_initWithCenterX_centerY_boundaryEdges_containerCornerRadius_containerHeight_containerWidth_containerTransform_dropletColor_dropletRadius_boundaryOutsets_keylineStyle_, v5, &v134, v9, v20, v129, v125, v122, v121, v120, v11, v13, v15, v17, v19);
  swift_unknownObjectRelease();

  v22 = &a1[OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap];
  swift_beginAccess();
  v23 = *(_QWORD *)v22;
  v123 = (char *)v21;
  swift_bridgeObjectRetain();
  v24 = (_QWORD *)sub_23A81D010(MEMORY[0x24BEE4AF8], &qword_2569C2A08);
  v126 = v23 + 64;
  v25 = 1 << *(_BYTE *)(v23 + 32);
  v26 = -1;
  if (v25 < 64)
    v26 = ~(-1 << v25);
  v27 = v26 & *(_QWORD *)(v23 + 64);
  v28 = (unint64_t)(v25 + 63) >> 6;
  swift_bridgeObjectRetain();
  v29 = 0;
  while (1)
  {
    if (v27)
    {
      v31 = __clz(__rbit64(v27));
      v27 &= v27 - 1;
      v32 = v31 | (v29 << 6);
      goto LABEL_29;
    }
    v33 = v29 + 1;
    if (__OFADD__(v29, 1))
      goto LABEL_119;
    if (v33 >= v28)
      break;
    v34 = *(_QWORD *)(v126 + 8 * v33);
    ++v29;
    if (!v34)
    {
      v29 = v33 + 1;
      if (v33 + 1 >= v28)
        break;
      v34 = *(_QWORD *)(v126 + 8 * v29);
      if (!v34)
      {
        v29 = v33 + 2;
        if (v33 + 2 >= v28)
          break;
        v34 = *(_QWORD *)(v126 + 8 * v29);
        if (!v34)
        {
          v29 = v33 + 3;
          if (v33 + 3 >= v28)
            break;
          v34 = *(_QWORD *)(v126 + 8 * v29);
          if (!v34)
          {
            v29 = v33 + 4;
            if (v33 + 4 >= v28)
              break;
            v34 = *(_QWORD *)(v126 + 8 * v29);
            if (!v34)
            {
              v35 = v33 + 5;
              if (v35 >= v28)
                break;
              v34 = *(_QWORD *)(v126 + 8 * v35);
              if (!v34)
              {
                while (1)
                {
                  v29 = v35 + 1;
                  if (__OFADD__(v35, 1))
                    goto LABEL_122;
                  if (v29 >= v28)
                    goto LABEL_40;
                  v34 = *(_QWORD *)(v126 + 8 * v29);
                  ++v35;
                  if (v34)
                    goto LABEL_28;
                }
              }
              v29 = v35;
            }
          }
        }
      }
    }
LABEL_28:
    v27 = (v34 - 1) & v34;
    v32 = __clz(__rbit64(v34)) + (v29 << 6);
LABEL_29:
    v36 = 16 * v32;
    v37 = (uint64_t *)(*(_QWORD *)(v23 + 48) + v36);
    v39 = *v37;
    v38 = v37[1];
    v130 = *(_OWORD *)(*(_QWORD *)(v23 + 56) + v36);
    swift_bridgeObjectRetain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v42 = sub_23A8200A8(v39, v38);
    v43 = v24[2];
    v44 = (v41 & 1) == 0;
    v45 = v43 + v44;
    if (__OFADD__(v43, v44))
    {
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
      goto LABEL_123;
    }
    v46 = v41;
    if (v24[3] >= v45)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v41 & 1) != 0)
          goto LABEL_7;
      }
      else
      {
        sub_23A8213E0(&qword_2569C2A08);
        if ((v46 & 1) != 0)
          goto LABEL_7;
      }
    }
    else
    {
      sub_23A820788(v45, isUniquelyReferenced_nonNull_native, &qword_2569C2A08);
      v47 = sub_23A8200A8(v39, v38);
      if ((v46 & 1) != (v48 & 1))
        goto LABEL_125;
      v42 = v47;
      if ((v46 & 1) != 0)
      {
LABEL_7:
        v30 = (_OWORD *)(v24[7] + 16 * v42);
        swift_release();
        *v30 = v130;
        goto LABEL_8;
      }
    }
    v24[(v42 >> 6) + 8] |= 1 << v42;
    v49 = (uint64_t *)(v24[6] + 16 * v42);
    *v49 = v39;
    v49[1] = v38;
    *(_OWORD *)(v24[7] + 16 * v42) = v130;
    v50 = v24[2];
    v51 = __OFADD__(v50, 1);
    v52 = v50 + 1;
    if (v51)
      goto LABEL_116;
    v24[2] = v52;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_40:
  swift_release();
  swift_bridgeObjectRelease();
  v53 = &v123[OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap];
  swift_beginAccess();
  *(_QWORD *)v53 = v24;
  swift_bridgeObjectRelease();
  v54 = &v124[OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap];
  swift_beginAccess();
  v55 = *(_QWORD *)v54;
  swift_bridgeObjectRetain();
  v56 = (_QWORD *)sub_23A81D010(MEMORY[0x24BEE4AF8], &qword_2569C2A00);
  v57 = v55 + 64;
  v58 = 1 << *(_BYTE *)(v55 + 32);
  v59 = -1;
  if (v58 < 64)
    v59 = ~(-1 << v58);
  v60 = v59 & *(_QWORD *)(v55 + 64);
  v127 = (unint64_t)(v58 + 63) >> 6;
  swift_bridgeObjectRetain();
  v61 = 0;
  while (2)
  {
    if (v60)
    {
      v63 = __clz(__rbit64(v60));
      v60 &= v60 - 1;
      v64 = v63 | (v61 << 6);
      goto LABEL_65;
    }
    v65 = v61 + 1;
    if (__OFADD__(v61, 1))
      goto LABEL_120;
    if (v65 < v127)
    {
      v66 = *(_QWORD *)(v57 + 8 * v65);
      ++v61;
      if (!v66)
      {
        v61 = v65 + 1;
        if (v65 + 1 >= v127)
          break;
        v66 = *(_QWORD *)(v57 + 8 * v61);
        if (!v66)
        {
          v61 = v65 + 2;
          if (v65 + 2 >= v127)
            break;
          v66 = *(_QWORD *)(v57 + 8 * v61);
          if (!v66)
          {
            v61 = v65 + 3;
            if (v65 + 3 >= v127)
              break;
            v66 = *(_QWORD *)(v57 + 8 * v61);
            if (!v66)
            {
              v61 = v65 + 4;
              if (v65 + 4 >= v127)
                break;
              v66 = *(_QWORD *)(v57 + 8 * v61);
              if (!v66)
              {
                v67 = v65 + 5;
                if (v67 >= v127)
                  break;
                v66 = *(_QWORD *)(v57 + 8 * v67);
                if (!v66)
                {
                  while (1)
                  {
                    v61 = v67 + 1;
                    if (__OFADD__(v67, 1))
                      break;
                    if (v61 >= v127)
                      goto LABEL_76;
                    v66 = *(_QWORD *)(v57 + 8 * v61);
                    ++v67;
                    if (v66)
                      goto LABEL_64;
                  }
LABEL_123:
                  __break(1u);
                  goto LABEL_124;
                }
                v61 = v67;
              }
            }
          }
        }
      }
LABEL_64:
      v60 = (v66 - 1) & v66;
      v64 = __clz(__rbit64(v66)) + (v61 << 6);
LABEL_65:
      v68 = 16 * v64;
      v69 = (uint64_t *)(*(_QWORD *)(v55 + 48) + v68);
      v71 = *v69;
      v70 = v69[1];
      v131 = *(_OWORD *)(*(_QWORD *)(v55 + 56) + v68);
      swift_bridgeObjectRetain();
      swift_retain();
      v72 = swift_isUniquelyReferenced_nonNull_native();
      v74 = sub_23A8200A8(v71, v70);
      v75 = v56[2];
      v76 = (v73 & 1) == 0;
      v77 = v75 + v76;
      if (__OFADD__(v75, v76))
        goto LABEL_114;
      v78 = v73;
      if (v56[3] >= v77)
      {
        if ((v72 & 1) != 0)
        {
          if ((v73 & 1) == 0)
            goto LABEL_72;
        }
        else
        {
          sub_23A8213E0(&qword_2569C2A00);
          if ((v78 & 1) == 0)
            goto LABEL_72;
        }
      }
      else
      {
        sub_23A820788(v77, v72, &qword_2569C2A00);
        v79 = sub_23A8200A8(v71, v70);
        if ((v78 & 1) != (v80 & 1))
          goto LABEL_125;
        v74 = v79;
        if ((v78 & 1) == 0)
        {
LABEL_72:
          v56[(v74 >> 6) + 8] |= 1 << v74;
          v81 = (uint64_t *)(v56[6] + 16 * v74);
          *v81 = v71;
          v81[1] = v70;
          *(_OWORD *)(v56[7] + 16 * v74) = v131;
          v82 = v56[2];
          v51 = __OFADD__(v82, 1);
          v83 = v82 + 1;
          if (v51)
            goto LABEL_117;
          v56[2] = v83;
          swift_bridgeObjectRetain();
          goto LABEL_44;
        }
      }
      v62 = (_OWORD *)(v56[7] + 16 * v74);
      swift_release();
      *v62 = v131;
LABEL_44:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
LABEL_76:
  swift_release();
  swift_bridgeObjectRelease();
  v84 = &v123[OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap];
  swift_beginAccess();
  *(_QWORD *)v84 = v56;
  swift_bridgeObjectRelease();
  v85 = &v124[OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap];
  swift_beginAccess();
  v86 = *(_QWORD *)v85;
  swift_bridgeObjectRetain();
  v87 = (_QWORD *)sub_23A81D134(MEMORY[0x24BEE4AF8]);
  v128 = v86 + 64;
  v88 = 1 << *(_BYTE *)(v86 + 32);
  v89 = -1;
  if (v88 < 64)
    v89 = ~(-1 << v88);
  v90 = v89 & *(_QWORD *)(v86 + 64);
  v132 = (unint64_t)(v88 + 63) >> 6;
  swift_bridgeObjectRetain();
  v91 = 0;
  while (2)
  {
    if (v90)
    {
      v93 = __clz(__rbit64(v90));
      v90 &= v90 - 1;
      v94 = v93 | (v91 << 6);
      goto LABEL_101;
    }
    v95 = v91 + 1;
    if (__OFADD__(v91, 1))
      goto LABEL_121;
    if (v95 >= v132)
    {
LABEL_112:
      swift_release();
      swift_bridgeObjectRelease();
      v114 = &v123[OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap];
      swift_beginAccess();
      *(_QWORD *)v114 = v87;
      swift_bridgeObjectRelease();
      v115 = *(_QWORD *)&v124[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
      v116 = *(_QWORD *)&v124[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock + 8];
      sub_23A821984(v115);

      v117 = (uint64_t *)&v123[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
      v118 = *(_QWORD *)&v123[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
      *v117 = v115;
      v117[1] = v116;
      sub_23A823048(v118);

      return (uint64_t)v123;
    }
    v96 = *(_QWORD *)(v128 + 8 * v95);
    ++v91;
    if (v96)
      goto LABEL_100;
    v91 = v95 + 1;
    if (v95 + 1 >= v132)
      goto LABEL_112;
    v96 = *(_QWORD *)(v128 + 8 * v91);
    if (v96)
      goto LABEL_100;
    v91 = v95 + 2;
    if (v95 + 2 >= v132)
      goto LABEL_112;
    v96 = *(_QWORD *)(v128 + 8 * v91);
    if (v96)
      goto LABEL_100;
    v91 = v95 + 3;
    if (v95 + 3 >= v132)
      goto LABEL_112;
    v96 = *(_QWORD *)(v128 + 8 * v91);
    if (v96)
      goto LABEL_100;
    v91 = v95 + 4;
    if (v95 + 4 >= v132)
      goto LABEL_112;
    v96 = *(_QWORD *)(v128 + 8 * v91);
    if (v96)
    {
LABEL_100:
      v90 = (v96 - 1) & v96;
      v94 = __clz(__rbit64(v96)) + (v91 << 6);
LABEL_101:
      v98 = (uint64_t *)(*(_QWORD *)(v86 + 48) + 16 * v94);
      v100 = *v98;
      v99 = v98[1];
      v101 = *(_QWORD *)(*(_QWORD *)(v86 + 56) + 8 * v94);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      v102 = swift_isUniquelyReferenced_nonNull_native();
      v104 = sub_23A8200A8(v100, v99);
      v105 = v87[2];
      v106 = (v103 & 1) == 0;
      v107 = v105 + v106;
      if (__OFADD__(v105, v106))
        goto LABEL_115;
      v108 = v103;
      if (v87[3] < v107)
      {
        sub_23A820474(v107, v102);
        v109 = sub_23A8200A8(v100, v99);
        if ((v108 & 1) != (v110 & 1))
          goto LABEL_125;
        v104 = v109;
        if ((v108 & 1) == 0)
          goto LABEL_108;
LABEL_79:
        v92 = v87[7];
        swift_unknownObjectRelease();
        *(_QWORD *)(v92 + 8 * v104) = v101;
LABEL_80:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        continue;
      }
      if ((v102 & 1) != 0)
      {
        if ((v103 & 1) != 0)
          goto LABEL_79;
      }
      else
      {
        sub_23A82122C();
        if ((v108 & 1) != 0)
          goto LABEL_79;
      }
LABEL_108:
      v87[(v104 >> 6) + 8] |= 1 << v104;
      v111 = (uint64_t *)(v87[6] + 16 * v104);
      *v111 = v100;
      v111[1] = v99;
      *(_QWORD *)(v87[7] + 8 * v104) = v101;
      v112 = v87[2];
      v51 = __OFADD__(v112, 1);
      v113 = v112 + 1;
      if (v51)
        goto LABEL_118;
      v87[2] = v113;
      swift_bridgeObjectRetain();
      goto LABEL_80;
    }
    break;
  }
  v97 = v95 + 5;
  if (v97 >= v132)
    goto LABEL_112;
  v96 = *(_QWORD *)(v128 + 8 * v97);
  if (v96)
  {
    v91 = v97;
    goto LABEL_100;
  }
  while (1)
  {
    v91 = v97 + 1;
    if (__OFADD__(v97, 1))
      break;
    if (v91 >= v132)
      goto LABEL_112;
    v96 = *(_QWORD *)(v128 + 8 * v91);
    ++v97;
    if (v96)
      goto LABEL_100;
  }
LABEL_124:
  __break(1u);
LABEL_125:
  result = sub_23A84C414();
  __break(1u);
  return result;
}

unint64_t sub_23A81D010(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_23A84C3D8();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (_OWORD *)(a1 + 48);
  while (1)
  {
    v6 = *((_QWORD *)v5 - 2);
    v7 = *((_QWORD *)v5 - 1);
    v14 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    result = sub_23A8200A8(v6, v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v3[6] + 16 * result);
    *v10 = v6;
    v10[1] = v7;
    *(_OWORD *)(v3[7] + 16 * result) = v14;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v3[2] = v13;
    v5 += 2;
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

unint64_t sub_23A81D134(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8048);
  v2 = (_QWORD *)sub_23A84C3D8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    result = sub_23A8200A8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

uint64_t DRPDropletViewConfiguration.copy()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  id v3;
  uint64_t result;

  v3 = objc_msgSend(objc_allocWithZone((Class)DRPDropletViewConfiguration), sel_initWithViewConfiguration_, v1);
  result = type metadata accessor for DRPDropletViewConfiguration((uint64_t)v3);
  a1[3] = result;
  *a1 = v3;
  return result;
}

uint64_t DRPDropletViewConfiguration.description.getter()
{
  uint64_t v0;

  sub_23A81D438(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2988);
  sub_23A821C40((unint64_t *)&qword_2569C2990, &qword_2569C2988, MEMORY[0x24BEE12B0]);
  v0 = sub_23A84C1F8();
  swift_bridgeObjectRelease();
  return v0;
}

char *sub_23A81D438(char a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char *result;
  _QWORD v35[2];
  objc_super v36;
  unint64_t v37;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = v1;
  v43 = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8050);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A84E280;
  v36.receiver = v1;
  v36.super_class = (Class)DRPDropletViewConfiguration;
  v4 = objc_msgSendSuper2(&v36, sel_description);
  v5 = sub_23A84C21C();
  v7 = v6;

  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v7;
  *(_QWORD *)&v40 = 0x3A587265746E6563;
  *((_QWORD *)&v40 + 1) = 0xE900000000000020;
  objc_msgSend(v2, sel_centerX);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v8 = *((_QWORD *)&v40 + 1);
  *(_QWORD *)(v3 + 48) = v40;
  *(_QWORD *)(v3 + 56) = v8;
  *(_QWORD *)&v40 = 0x3A597265746E6563;
  *((_QWORD *)&v40 + 1) = 0xE900000000000020;
  objc_msgSend(v2, sel_centerY);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v9 = *((_QWORD *)&v40 + 1);
  *(_QWORD *)(v3 + 64) = v40;
  *(_QWORD *)(v3 + 72) = v9;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  sub_23A84C240();
  *(_QWORD *)&v39 = objc_msgSend(v2, sel_boundaryEdges);
  type metadata accessor for UIRectEdge(0);
  sub_23A84C390();
  v10 = *((_QWORD *)&v40 + 1);
  *(_QWORD *)(v3 + 80) = v40;
  *(_QWORD *)(v3 + 88) = v10;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v40 = 0xD000000000000017;
  *((_QWORD *)&v40 + 1) = 0x800000023A8503E0;
  objc_msgSend(v2, sel_containerCornerRadius);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v11 = *((_QWORD *)&v40 + 1);
  *(_QWORD *)(v3 + 96) = v40;
  *(_QWORD *)(v3 + 104) = v11;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v40 = 0xD000000000000011;
  *((_QWORD *)&v40 + 1) = 0x800000023A850400;
  objc_msgSend(v2, sel_containerHeight);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v12 = *((_QWORD *)&v40 + 1);
  *(_QWORD *)(v3 + 112) = v40;
  *(_QWORD *)(v3 + 120) = v12;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v40 = 0xD000000000000010;
  *((_QWORD *)&v40 + 1) = 0x800000023A850420;
  objc_msgSend(v2, sel_containerWidth);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v13 = *((_QWORD *)&v40 + 1);
  *(_QWORD *)(v3 + 128) = v40;
  *(_QWORD *)(v3 + 136) = v13;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  v39 = v40;
  sub_23A84C240();
  objc_msgSend(v2, sel_containerTransform);
  type metadata accessor for CATransform3D(0);
  sub_23A84C390();
  v14 = *((_QWORD *)&v39 + 1);
  *(_QWORD *)(v3 + 144) = v39;
  *(_QWORD *)(v3 + 152) = v14;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  strcpy((char *)&v40, "dropletColor: ");
  HIBYTE(v40) = -18;
  v15 = objc_msgSend(v2, sel_dropletColor);
  sub_23A84C054(v15);

  sub_23A84C240();
  swift_bridgeObjectRelease();
  v16 = *((_QWORD *)&v40 + 1);
  *(_QWORD *)(v3 + 160) = v40;
  *(_QWORD *)(v3 + 168) = v16;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  v39 = v40;
  sub_23A84C240();
  objc_msgSend(v2, sel_boundaryOutsets);
  *(_QWORD *)&v40 = v17;
  *((_QWORD *)&v40 + 1) = v18;
  v41 = v19;
  v42 = v20;
  type metadata accessor for UIEdgeInsets(0);
  sub_23A84C390();
  v21 = *((_QWORD *)&v39 + 1);
  *(_QWORD *)(v3 + 176) = v39;
  *(_QWORD *)(v3 + 184) = v21;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v40 = 0x5274656C706F7264;
  *((_QWORD *)&v40 + 1) = 0xEF203A7375696461;
  objc_msgSend(v2, sel_dropletRadius);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v22 = *((_QWORD *)&v40 + 1);
  *(_QWORD *)(v3 + 192) = v40;
  *(_QWORD *)(v3 + 200) = v22;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v39 = 0xD000000000000010;
  *((_QWORD *)&v39 + 1) = 0x800000023A850480;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C29E0);
  sub_23A84C1EC();
  swift_bridgeObjectRelease();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v23 = *((_QWORD *)&v39 + 1);
  *(_QWORD *)(v3 + 208) = v39;
  *(_QWORD *)(v3 + 216) = v23;
  *(_QWORD *)&v39 = 0;
  *((_QWORD *)&v39 + 1) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  v37 = 0xD00000000000001ALL;
  v38 = 0x800000023A8504A0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C29E8);
  sub_23A84C1EC();
  swift_bridgeObjectRelease();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v24 = v38;
  *(_QWORD *)(v3 + 224) = v37;
  *(_QWORD *)(v3 + 232) = v24;
  v37 = 0;
  v38 = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  v37 = 0xD00000000000001DLL;
  v38 = 0x800000023A8504C0;
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v25 = v38;
  *(_QWORD *)(v3 + 240) = v37;
  *(_QWORD *)(v3 + 248) = v25;
  v37 = 0;
  v38 = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  v35[1] = 0x800000023A8504E0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C29F0);
  sub_23A84C1EC();
  swift_bridgeObjectRelease();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + 256) = 0xD000000000000012;
  *(_QWORD *)(v3 + 264) = v35[1];
  if ((a1 & 1) != 0)
  {
    v26 = objc_msgSend(v2, sel_keylineStyle);
    if (v26)
    {
      v27 = v26;
      if ((objc_msgSend(v26, sel_respondsToSelector_, sel_debugDescription) & 1) != 0)
      {
        v28 = objc_msgSend(v27, sel_debugDescription);
        swift_unknownObjectRelease();
        sub_23A84C21C();

        sub_23A84C330();
        swift_bridgeObjectRelease();
        strcpy((char *)v35, "keylineStyle: ");
        HIBYTE(v35[1]) = -18;
        sub_23A84C240();
        goto LABEL_9;
      }
      swift_unknownObjectRelease();
    }
  }
  sub_23A84C330();
  swift_bridgeObjectRelease();
  strcpy((char *)v35, "keylineStyle: ");
  HIBYTE(v35[1]) = -18;
  v29 = objc_msgSend(v2, sel_keylineStyle);
  if (v29)
  {
    v30 = objc_msgSend(v29, sel_description);
    swift_unknownObjectRelease();
    sub_23A84C21C();

  }
  sub_23A84C240();
LABEL_9:
  swift_bridgeObjectRelease();
  v31 = v35[0];
  v32 = v35[1];
  result = sub_23A84B414((char *)1, 16, 1, (char *)v3);
  *((_QWORD *)result + 2) = 16;
  *((_QWORD *)result + 34) = v31;
  *((_QWORD *)result + 35) = v32;
  return result;
}

uint64_t DRPDropletViewConfiguration.debugDescription.getter()
{
  uint64_t v0;

  sub_23A81D438(1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2998);
  sub_23A821C40((unint64_t *)&unk_2569C29A0, &qword_2569C2998, MEMORY[0x24BEE2170]);
  v0 = sub_23A84C1F8();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL DRPDropletViewConfiguration.isEqual(_:)(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  char v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(_QWORD *, unsigned __int8 *, unsigned __int8 *);
  _BOOL8 v60;
  uint64_t v62;
  char *v63;
  _BYTE v64[24];
  uint64_t v65;

  v2 = v1;
  v3 = sub_23A821C80(a1, (uint64_t)v64);
  if (!v65)
  {
    sub_23A821CC8((uint64_t)v64);
    return 0;
  }
  type metadata accessor for DRPDropletViewConfiguration(v3);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v4 = sub_23A81E354(v1, v63);
  objc_msgSend(v1, sel_centerX);
  v6 = v5;
  objc_msgSend(v63, sel_centerX);
  if (v6 != v7)
    goto LABEL_27;
  objc_msgSend(v1, sel_centerY);
  v9 = v8;
  objc_msgSend(v63, sel_centerY);
  if (v9 != v10)
    goto LABEL_27;
  v11 = objc_msgSend(v1, sel_boundaryEdges);
  if (v11 != objc_msgSend(v63, sel_boundaryEdges))
    goto LABEL_27;
  objc_msgSend(v2, sel_containerCornerRadius);
  v13 = v12;
  objc_msgSend(v63, sel_containerCornerRadius);
  if (v13 != v14)
    goto LABEL_27;
  objc_msgSend(v2, sel_containerHeight);
  v16 = v15;
  objc_msgSend(v63, sel_containerHeight);
  if (v16 != v17)
    goto LABEL_27;
  objc_msgSend(v2, sel_containerWidth);
  v19 = v18;
  objc_msgSend(v63, sel_containerWidth);
  if (v19 != v20)
    goto LABEL_27;
  v21 = objc_msgSend(v2, sel_dropletColor);
  v22 = objc_msgSend(v63, sel_dropletColor);
  v23 = v22;
  if (!v21)
  {
    if (!v22)
      goto LABEL_16;

    return 0;
  }
  if (!v22)
  {

    return 0;
  }
  sub_23A81A1DC(0, (unint64_t *)&qword_2569C29B0);
  v24 = v21;
  v25 = sub_23A84C300();

  if ((v25 & 1) == 0)
    goto LABEL_27;
LABEL_16:
  objc_msgSend(v2, sel_dropletRadius);
  v27 = v26;
  objc_msgSend(v63, sel_dropletRadius);
  if (v27 != v28)
    goto LABEL_27;
  objc_msgSend(v2, sel_boundaryOutsets);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(v63, sel_boundaryOutsets);
  if (v30 != v40)
    goto LABEL_27;
  if (v32 != v37)
    goto LABEL_27;
  if (v34 != v38)
    goto LABEL_27;
  if (v36 != v39)
    goto LABEL_27;
  if ((v4 & 1) == 0)
    goto LABEL_27;
  v41 = (uint64_t *)&v2[OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap];
  swift_beginAccess();
  v42 = *v41;
  v43 = (uint64_t *)&v63[OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap];
  swift_beginAccess();
  v44 = *v43;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v45 = sub_23A81E3FC(v42, v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v45 & 1) == 0)
    goto LABEL_27;
  v46 = (uint64_t *)&v2[OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap];
  swift_beginAccess();
  v47 = *v46;
  v48 = (uint64_t *)&v63[OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap];
  swift_beginAccess();
  v49 = *v48;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v50 = sub_23A81E3FC(v47, v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v50 & 1) == 0)
    goto LABEL_27;
  v51 = (uint64_t *)&v2[OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap];
  swift_beginAccess();
  v52 = *v51;
  v53 = (uint64_t *)&v63[OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap];
  swift_beginAccess();
  v54 = *v53;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v55 = sub_23A81E3FC(v52, v54);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v55 & 1) == 0)
  {
LABEL_27:

    return 0;
  }
  v56 = *(_QWORD *)&v2[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
  v57 = *(_QWORD *)&v2[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock + 8];
  if (v56)
  {
    v58 = swift_allocObject();
    *(_QWORD *)(v58 + 16) = v56;
    *(_QWORD *)(v58 + 24) = v57;
    v59 = sub_23A81B3C4;
  }
  else
  {
    v59 = 0;
  }
  sub_23A821984(v56);
  sub_23A823048((uint64_t)v59);
  v62 = *(_QWORD *)&v63[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
  sub_23A821984(v62);

  if (!v62)
    return v56 == 0;
  v60 = v56 != 0;
  sub_23A823048(v62);
  return v60;
}

uint64_t sub_23A81E354(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = objc_msgSend(a1, sel_keylineStyle);
  v4 = objc_msgSend(a2, sel_keylineStyle);
  if (v3)
  {
    if (v4)
    {
      v5 = objc_msgSend(v3, sel_isEqual_, v4);
      swift_unknownObjectRelease();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    if (!v4)
      return 1;
    v5 = 0;
  }
  swift_unknownObjectRelease();
  return (uint64_t)v5;
}

uint64_t sub_23A81E3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;

  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = a1 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a1 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(63 - v6) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    v17 = v10;
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      if (!*(_QWORD *)(a2 + 16))
        goto LABEL_27;
      goto LABEL_7;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v18 >= v8)
      goto LABEL_30;
    v19 = *(_QWORD *)(v4 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v17 + 2;
      if (v17 + 2 >= v8)
        goto LABEL_30;
      v19 = *(_QWORD *)(v4 + 8 * v10);
      if (!v19)
      {
        v10 = v17 + 3;
        if (v17 + 3 >= v8)
          goto LABEL_30;
        v19 = *(_QWORD *)(v4 + 8 * v10);
        if (!v19)
        {
          v10 = v17 + 4;
          if (v17 + 4 >= v8)
            goto LABEL_30;
          v19 = *(_QWORD *)(v4 + 8 * v10);
          if (!v19)
          {
            v10 = v17 + 5;
            if (v17 + 5 >= v8)
              goto LABEL_30;
            v19 = *(_QWORD *)(v4 + 8 * v10);
            if (!v19)
              break;
          }
        }
      }
    }
LABEL_26:
    v7 = (v19 - 1) & v19;
    v12 = __clz(__rbit64(v19)) + (v10 << 6);
    if (!*(_QWORD *)(a2 + 16))
    {
LABEL_27:
      v21 = 0;
LABEL_31:
      sub_23A823118();
      return v21;
    }
LABEL_7:
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v15 = *v13;
    v14 = v13[1];
    swift_bridgeObjectRetain();
    sub_23A8200A8(v15, v14);
    LOBYTE(v15) = v16;
    result = swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
      goto LABEL_27;
  }
  v20 = v17 + 6;
  if (v17 + 6 >= v8)
  {
LABEL_30:
    v21 = 1;
    goto LABEL_31;
  }
  v19 = *(_QWORD *)(v4 + 8 * v20);
  if (v19)
  {
    v10 = v17 + 6;
    goto LABEL_26;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v8)
      goto LABEL_30;
    v19 = *(_QWORD *)(v4 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_34:
  __break(1u);
  return result;
}

void __swiftcall DRPDropletViewConfiguration.init()(DRPDropletViewConfiguration *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void DRPDropletViewConfiguration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DRPDropletViewConfiguration.change(to:preferAudioReactivity:canvasSize:)(uint64_t a1, char a2, double a3, double a4)
{
  void *v4;
  id v7;

  v7 = objc_msgSend(objc_allocWithZone((Class)DRPDropletContextIntelligentEdgeLightKeylineStyle), sel_initWithPreferringAudioReactivity_style_, a2 & 1, a1);
  objc_msgSend(v4, sel_setKeylineStyle_, v7);

  return objc_msgSend(v4, sel_defaultResetKeylineForCanvasSize_, a3, a4);
}

Swift::Void __swiftcall DRPDropletViewConfiguration.defaultResetKeyline(forCanvasSize:)(CGSize forCanvasSize)
{
  void *v1;
  id v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double width;
  double height;
  unint64_t v14;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[7];
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v2 = objc_msgSend(v1, sel_keylineStyle);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v1, sel_containerWidth);
    objc_msgSend(v1, sel_containerHeight);
    BSRectWithSize();
    objc_msgSend(v1, sel_containerTransform);
    CA_CGRectApplyTransform();
    BSRectWithSize();
    objc_msgSend(v1, sel_centerX);
    objc_msgSend(v1, sel_centerY);
    UIRectCenteredAboutPoint();
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    BSRectWithSize();
    v34.origin.x = v5;
    v34.origin.y = v7;
    v34.size.width = v9;
    v34.size.height = v11;
    v33 = CGRectIntersection(v32, v34);
    width = v33.size.width;
    height = v33.size.height;
    v14 = (unint64_t)objc_msgSend(v1, sel_boundaryEdges, v33.origin.x, v33.origin.y);
    if ((~v14 & 4) == 0 || (v14 & 1) != 0)
      v16 = height;
    else
      v16 = width;
    v17 = 0.0;
    if (v16 < 0.0)
      v18 = 0.0;
    else
      v18 = v16;
    v19 = objc_msgSend(v1, sel_boundaryEdges);
    objc_msgSend(v3, sel_innerWidth);
    v21 = v20;
    objc_msgSend(v3, sel_outerWidth);
    v23 = v22;
    objc_msgSend(v1, sel_dropletRadius);
    v25 = v24;
    objc_opt_self();
    v26 = (void *)swift_dynamicCastObjCClass();
    if (v26)
    {
      objc_msgSend(v26, sel_outerWidthBlurRadius);
      v17 = v27;
    }
    sub_23A821E60((uint64_t)v19, (uint64_t)v31, v18, v9, v11, v21, v23, (v25 + v25 + v17) * 2.8);
    v28 = v31[4];
    v29 = v31[5];
    v30 = v31[6];
    objc_msgSend(v3, sel_setKeylineOutsets_, v31[2], v31[3]);
    objc_msgSend(v3, sel_setKeylineFadeLengths_, v28, v29);
    objc_msgSend(v3, sel_setNormalizedStartLocation_, *(double *)&v30);
    objc_msgSend(v3, sel_setNormalizedStopLocation_, *((double *)&v30 + 1));
    swift_unknownObjectRelease();
  }
}

BOOL sub_23A81ECCC(_BOOL8 result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    if (qword_2542D7FC0 != -1)
      goto LABEL_20;
    while (1)
    {
      v2 = *((_QWORD *)off_2542D7FB0 + 2);
      if (!v2)
        break;
      if (*((_QWORD *)off_2542D7FB0 + 4) == v1)
        return 1;
      if (v2 == 1)
        break;
      if (*((_QWORD *)off_2542D7FB0 + 5) == v1)
        return 1;
      if (v2 == 2)
        break;
      for (i = 6; ; ++i)
      {
        v4 = i - 3;
        if (__OFADD__(i - 4, 1))
          break;
        v5 = *((_QWORD *)off_2542D7FB0 + i);
        result = v5 == v1;
        if (v5 == v1 || v4 == v2)
          return result;
      }
      __break(1u);
LABEL_20:
      swift_once();
    }
    return 0;
  }
  return result;
}

uint64_t sub_23A81EE70(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v16;
  double v17;
  void *ObjCClassFromMetadata;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t inited;
  unint64_t v35;
  double v36;
  double v37;
  uint64_t KeyPath;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  double v44;
  uint64_t v45;
  char v46;
  double v47;
  uint64_t v48;
  unint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  char v53;
  double v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  double v59;
  uint64_t v60;
  char v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  char v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  uint64_t v83;
  unint64_t v84;
  double v85;
  double v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  char v92;
  double v93;
  uint64_t v94;
  char v95;
  double v96;
  uint64_t v97;
  unint64_t v98;
  double v99;
  double v100;
  uint64_t v101;
  char v102;
  double v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  char v107;
  double v108;
  uint64_t v109;
  char v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  char v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  uint64_t v131;
  unint64_t v132;
  double v133;
  double v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  char v140;
  double v141;
  uint64_t v142;
  char v143;
  double v144;
  uint64_t v145;
  unint64_t v146;
  double v147;
  double v148;
  uint64_t v149;
  char v150;
  double v151;
  uint64_t v152;
  char v153;
  uint64_t v154;
  char v155;
  double v156;
  uint64_t v157;
  char v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  uint64_t v164;
  uint64_t v165;
  char v166;
  uint64_t v167;
  char v168;
  uint64_t v169;
  char v170;
  uint64_t v171;
  char v172;
  double v173;
  uint64_t result;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  uint64_t v183;
  unint64_t v184;
  double v185;
  double v186;
  uint64_t v187;
  char v188;
  uint64_t v189;
  char v190;
  uint64_t v191;
  char v192;
  double v193;
  uint64_t v194;
  char v195;
  double v196;
  uint64_t v197;
  unint64_t v198;
  double v199;
  double v200;
  uint64_t v201;
  char v202;
  double v203;
  uint64_t v204;
  char v205;
  uint64_t v206;
  char v207;
  double v208;
  uint64_t v209;
  char v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  uint64_t v216;
  uint64_t v217;
  char v218;
  uint64_t v219;
  char v220;
  _OWORD v221[9];

  if (!sub_23A81ECCC(a1))
  {
    __break(1u);
    goto LABEL_129;
  }
  v16 = a7 * 20.0 + a5;
  switch(a1)
  {
    case 1:
LABEL_5:
      v17 = v16;
      goto LABEL_6;
    case 8:
      v17 = a4;
      a4 = v16;
      goto LABEL_6;
    case 4:
      goto LABEL_5;
  }
  v17 = a4;
  a4 = v16;
  if (a1 == 2)
  {
LABEL_6:
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v221[0] = *MEMORY[0x24BDE5598];
    v221[1] = v19;
    v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v221[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v221[3] = v20;
    v21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v221[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v221[5] = v21;
    v22 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v221[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v221[7] = v22;
    v23 = objc_msgSend(ObjCClassFromMetadata, sel_edgeAdaptiveKeylineWithCanvasSize_edge_protrusionFromEdge_centerAlongEdge_containerSize_containerCornerRadius_transform3D_dropletRadius_, a1, v221, a2, a3, v16, a6, a4, v17, 0.0, a8);
    v24 = objc_msgSend(v23, sel_keylineStyle);
    if (!v24)
      return (uint64_t)v23;
    v25 = v24;
    switch(a1)
    {
      case 1:
        objc_msgSend(v24, sel_keylineFadeLengths);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_23A84E290;
        *(_QWORD *)(inited + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = inited;
        sub_23A84C270();
        v35 = *(_QWORD *)&v221[0];
        objc_msgSend(v23, sel_boundaryOutsets);
        v37 = v36;
        KeyPath = swift_getKeyPath();
        v39 = sub_23A83E184(KeyPath, v35);
        swift_release();
        if ((v39 & 1) != 0)
          v27 = v37;
        v40 = swift_getKeyPath();
        v41 = sub_23A83E184(v40, v35);
        swift_release();
        if ((v41 & 1) != 0)
          v29 = v37;
        v42 = swift_getKeyPath();
        v43 = sub_23A83E184(v42, v35);
        swift_release();
        if ((v43 & 1) != 0)
          v44 = v37;
        else
          v44 = v31;
        v45 = swift_getKeyPath();
        v46 = sub_23A83E184(v45, v35);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v46 & 1) != 0)
          v47 = v37;
        else
          v47 = v33;
        v48 = swift_initStackObject();
        *(_OWORD *)(v48 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v48 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v48;
        sub_23A84C270();
        v49 = *(_QWORD *)&v221[0];
        objc_msgSend(v23, sel_boundaryOutsets);
        v51 = v50;
        v52 = swift_getKeyPath();
        v53 = sub_23A83E184(v52, v49);
        swift_release();
        if ((v53 & 1) != 0)
          v54 = v51;
        else
          v54 = v27;
        v55 = swift_getKeyPath();
        v56 = sub_23A83E184(v55, v49);
        swift_release();
        if ((v56 & 1) != 0)
          v29 = v51;
        v57 = swift_getKeyPath();
        v58 = sub_23A83E184(v57, v49);
        swift_release();
        if ((v58 & 1) != 0)
          v59 = v51;
        else
          v59 = v44;
        v60 = swift_getKeyPath();
        v61 = sub_23A83E184(v60, v49);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v61 & 1) != 0)
          v62 = v51;
        else
          v62 = v47;
        objc_msgSend(v25, sel_setKeylineFadeLengths_, v54, v29, v59, v62);
        if (a5 <= 0.0)
          goto LABEL_99;
        objc_msgSend(v25, sel_setNormalizedStartLocation_, 0.0);
        objc_msgSend(v25, sel_setNormalizedStopLocation_, 1.0);
        objc_msgSend(v25, sel_keylineFadeLengths);
        v64 = v63;
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v71 = swift_initStackObject();
        *(_OWORD *)(v71 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v71 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v71;
        sub_23A84C270();
        v72 = *(_QWORD *)&v221[0];
        v73 = swift_getKeyPath();
        v74 = sub_23A83E184(v73, v72);
        swift_release();
        if ((v74 & 1) != 0)
          v64 = 0.0;
        break;
      case 2:
        objc_msgSend(v24, sel_keylineFadeLengths);
        v124 = v123;
        v126 = v125;
        v128 = v127;
        v130 = v129;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
        v131 = swift_initStackObject();
        *(_OWORD *)(v131 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v131 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v131;
        sub_23A84C270();
        v132 = *(_QWORD *)&v221[0];
        objc_msgSend(v23, sel_boundaryOutsets);
        v134 = v133;
        v135 = swift_getKeyPath();
        v136 = sub_23A83E184(v135, v132);
        swift_release();
        if ((v136 & 1) != 0)
          v124 = v134;
        v137 = swift_getKeyPath();
        v138 = sub_23A83E184(v137, v132);
        swift_release();
        if ((v138 & 1) != 0)
          v126 = v134;
        v139 = swift_getKeyPath();
        v140 = sub_23A83E184(v139, v132);
        swift_release();
        if ((v140 & 1) != 0)
          v141 = v134;
        else
          v141 = v128;
        v142 = swift_getKeyPath();
        v143 = sub_23A83E184(v142, v132);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v143 & 1) != 0)
          v144 = v134;
        else
          v144 = v130;
        v145 = swift_initStackObject();
        *(_OWORD *)(v145 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v145 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v145;
        sub_23A84C270();
        v146 = *(_QWORD *)&v221[0];
        objc_msgSend(v23, sel_boundaryOutsets);
        v148 = v147;
        v149 = swift_getKeyPath();
        v150 = sub_23A83E184(v149, v146);
        swift_release();
        if ((v150 & 1) != 0)
          v151 = v148;
        else
          v151 = v124;
        v152 = swift_getKeyPath();
        v153 = sub_23A83E184(v152, v146);
        swift_release();
        if ((v153 & 1) != 0)
          v126 = v148;
        v154 = swift_getKeyPath();
        v155 = sub_23A83E184(v154, v146);
        swift_release();
        if ((v155 & 1) != 0)
          v156 = v148;
        else
          v156 = v141;
        v157 = swift_getKeyPath();
        v158 = sub_23A83E184(v157, v146);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v158 & 1) != 0)
          v159 = v148;
        else
          v159 = v144;
        objc_msgSend(v25, sel_setKeylineFadeLengths_, v151, v126, v156, v159);
        if (a5 <= 0.0)
          goto LABEL_99;
        objc_msgSend(v25, sel_setNormalizedStartLocation_, 0.0);
        objc_msgSend(v25, sel_setNormalizedStopLocation_, 1.0);
        objc_msgSend(v25, sel_keylineFadeLengths);
        v64 = v160;
        v66 = v161;
        v68 = v162;
        v70 = v163;
        v164 = swift_initStackObject();
        *(_OWORD *)(v164 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v164 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v164;
        sub_23A84C270();
        v72 = *(_QWORD *)&v221[0];
        v165 = swift_getKeyPath();
        v166 = sub_23A83E184(v165, v72);
        swift_release();
        if ((v166 & 1) != 0)
          v64 = 0.0;
        break;
      case 8:
        objc_msgSend(v24, sel_keylineFadeLengths);
        v76 = v75;
        v78 = v77;
        v80 = v79;
        v82 = v81;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
        v83 = swift_initStackObject();
        *(_OWORD *)(v83 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v83 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v83;
        sub_23A84C270();
        v84 = *(_QWORD *)&v221[0];
        objc_msgSend(v23, sel_boundaryOutsets);
        v86 = v85;
        v87 = swift_getKeyPath();
        v88 = sub_23A83E184(v87, v84);
        swift_release();
        if ((v88 & 1) != 0)
          v76 = v86;
        v89 = swift_getKeyPath();
        v90 = sub_23A83E184(v89, v84);
        swift_release();
        if ((v90 & 1) != 0)
          v78 = v86;
        v91 = swift_getKeyPath();
        v92 = sub_23A83E184(v91, v84);
        swift_release();
        if ((v92 & 1) != 0)
          v93 = v86;
        else
          v93 = v80;
        v94 = swift_getKeyPath();
        v95 = sub_23A83E184(v94, v84);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v95 & 1) != 0)
          v96 = v86;
        else
          v96 = v82;
        v97 = swift_initStackObject();
        *(_OWORD *)(v97 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v97 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v97;
        sub_23A84C270();
        v98 = *(_QWORD *)&v221[0];
        objc_msgSend(v23, sel_boundaryOutsets);
        v100 = v99;
        v101 = swift_getKeyPath();
        v102 = sub_23A83E184(v101, v98);
        swift_release();
        if ((v102 & 1) != 0)
          v103 = v100;
        else
          v103 = v76;
        v104 = swift_getKeyPath();
        v105 = sub_23A83E184(v104, v98);
        swift_release();
        if ((v105 & 1) != 0)
          v78 = v100;
        v106 = swift_getKeyPath();
        v107 = sub_23A83E184(v106, v98);
        swift_release();
        if ((v107 & 1) != 0)
          v108 = v100;
        else
          v108 = v93;
        v109 = swift_getKeyPath();
        v110 = sub_23A83E184(v109, v98);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v110 & 1) != 0)
          v111 = v100;
        else
          v111 = v96;
        objc_msgSend(v25, sel_setKeylineFadeLengths_, v103, v78, v108, v111);
        if (a5 <= 0.0)
          goto LABEL_99;
        objc_msgSend(v25, sel_setNormalizedStartLocation_, 0.0);
        objc_msgSend(v25, sel_setNormalizedStopLocation_, 1.0);
        objc_msgSend(v25, sel_keylineFadeLengths);
        v64 = v112;
        v66 = v113;
        v68 = v114;
        v70 = v115;
        v116 = swift_initStackObject();
        *(_OWORD *)(v116 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v116 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v116;
        sub_23A84C270();
        v72 = *(_QWORD *)&v221[0];
        v117 = swift_getKeyPath();
        v118 = sub_23A83E184(v117, v72);
        swift_release();
        if ((v118 & 1) != 0)
          v64 = 0.0;
        v119 = swift_getKeyPath();
        v120 = sub_23A83E184(v119, v72);
        swift_release();
        if ((v120 & 1) != 0)
          v66 = 0.0;
        v121 = swift_getKeyPath();
        v122 = sub_23A83E184(v121, v72);
        swift_release();
        if ((v122 & 1) != 0)
          v68 = 0.0;
        goto LABEL_95;
      default:
        objc_msgSend(v24, sel_keylineFadeLengths);
        v176 = v175;
        v178 = v177;
        v180 = v179;
        v182 = v181;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
        v183 = swift_initStackObject();
        *(_OWORD *)(v183 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v183 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v183;
        sub_23A84C270();
        v184 = *(_QWORD *)&v221[0];
        objc_msgSend(v23, sel_boundaryOutsets);
        v186 = v185;
        v187 = swift_getKeyPath();
        v188 = sub_23A83E184(v187, v184);
        swift_release();
        if ((v188 & 1) != 0)
          v176 = v186;
        v189 = swift_getKeyPath();
        v190 = sub_23A83E184(v189, v184);
        swift_release();
        if ((v190 & 1) != 0)
          v178 = v186;
        v191 = swift_getKeyPath();
        v192 = sub_23A83E184(v191, v184);
        swift_release();
        if ((v192 & 1) != 0)
          v193 = v186;
        else
          v193 = v180;
        v194 = swift_getKeyPath();
        v195 = sub_23A83E184(v194, v184);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v195 & 1) != 0)
          v196 = v186;
        else
          v196 = v182;
        v197 = swift_initStackObject();
        *(_OWORD *)(v197 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v197 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v197;
        sub_23A84C270();
        v198 = *(_QWORD *)&v221[0];
        objc_msgSend(v23, sel_boundaryOutsets);
        v200 = v199;
        v201 = swift_getKeyPath();
        v202 = sub_23A83E184(v201, v198);
        swift_release();
        if ((v202 & 1) != 0)
          v203 = v200;
        else
          v203 = v176;
        v204 = swift_getKeyPath();
        v205 = sub_23A83E184(v204, v198);
        swift_release();
        if ((v205 & 1) != 0)
          v178 = v200;
        v206 = swift_getKeyPath();
        v207 = sub_23A83E184(v206, v198);
        swift_release();
        if ((v207 & 1) != 0)
          v208 = v200;
        else
          v208 = v193;
        v209 = swift_getKeyPath();
        v210 = sub_23A83E184(v209, v198);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v210 & 1) != 0)
          v211 = v200;
        else
          v211 = v196;
        objc_msgSend(v25, sel_setKeylineFadeLengths_, v203, v178, v208, v211);
        if (a5 <= 0.0)
          goto LABEL_99;
        objc_msgSend(v25, sel_setNormalizedStartLocation_, 0.0);
        objc_msgSend(v25, sel_setNormalizedStopLocation_, 1.0);
        objc_msgSend(v25, sel_keylineFadeLengths);
        v64 = v212;
        v66 = v213;
        v68 = v214;
        v70 = v215;
        v216 = swift_initStackObject();
        *(_OWORD *)(v216 + 16) = xmmword_23A84E290;
        *(_QWORD *)(v216 + 32) = swift_getKeyPath();
        *(_QWORD *)&v221[0] = v216;
        sub_23A84C270();
        v72 = *(_QWORD *)&v221[0];
        v217 = swift_getKeyPath();
        v218 = sub_23A83E184(v217, v72);
        swift_release();
        if ((v218 & 1) != 0)
          v64 = 0.0;
        v219 = swift_getKeyPath();
        v220 = sub_23A83E184(v219, v72);
        swift_release();
        if ((v220 & 1) != 0)
          v66 = 0.0;
LABEL_93:
        v169 = swift_getKeyPath();
        v170 = sub_23A83E184(v169, v72);
        swift_release();
        if ((v170 & 1) != 0)
          v68 = 0.0;
LABEL_95:
        v171 = swift_getKeyPath();
        v172 = sub_23A83E184(v171, v72);
        swift_bridgeObjectRelease();
        swift_release();
        if ((v172 & 1) != 0)
          v173 = 0.0;
        else
          v173 = v70;
        objc_msgSend(v25, sel_setKeylineFadeLengths_, v64, v66, v68, v173);
LABEL_99:
        swift_unknownObjectRelease();
        return (uint64_t)v23;
    }
    v167 = swift_getKeyPath();
    v168 = sub_23A83E184(v167, v72);
    swift_release();
    if ((v168 & 1) != 0)
      v66 = 0.0;
    goto LABEL_93;
  }
LABEL_129:
  result = sub_23A84C39C();
  __break(1u);
  return result;
}

double sub_23A81FEBC(uint64_t a1, double a2)
{
  uint64_t v3;
  double *v5;
  double v6;
  double v7;
  char v8;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C29D0);
    swift_bridgeObjectRetain();
    v5 = (double *)(a1 + 40);
    do
    {
      v6 = *v5;
      v5 += 2;
      v7 = v6;
      swift_getKeyPath();
      swift_retain_n();
      v8 = sub_23A84C204();
      swift_release();
      if ((v8 & 1) != 0)
        a2 = v7;
      swift_getKeyPath();
      sub_23A84C204();
      swift_release();
      swift_getKeyPath();
      sub_23A84C204();
      swift_release();
      swift_getKeyPath();
      sub_23A84C204();
      swift_release_n();
      swift_release();
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  return a2;
}

void sub_23A820094()
{
  off_2542D7FB0 = &unk_250BA7460;
}

unint64_t sub_23A8200A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A84C42C();
  sub_23A84C234();
  v4 = sub_23A84C444();
  return sub_23A82013C(a1, a2, v4);
}

unint64_t sub_23A82010C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A84C420();
  return sub_23A82021C(a1, v2);
}

unint64_t sub_23A82013C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A84C3FC() & 1) == 0)
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
      while (!v14 && (sub_23A84C3FC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23A82021C(uint64_t a1, uint64_t a2)
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

uint64_t sub_23A8202B8(uint64_t a1, uint64_t a2)
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
  v6 = sub_23A8200A8(a1, a2);
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
    sub_23A82122C();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_23A82DE6C(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23A820384(uint64_t a1, uint64_t a2, void (*a3)(unint64_t, uint64_t), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v7;
  unint64_t v10;
  char v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v7 = v4;
  swift_bridgeObjectRetain();
  v10 = sub_23A8200A8(a1, a2);
  LOBYTE(a2) = v11;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v7;
  v16 = *v7;
  *v7 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23A8213E0(a4);
    v13 = v16;
  }
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 16 * v10);
  a3(v10, v13);
  *v7 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_23A820474(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8048);
  v36 = a2;
  v6 = sub_23A84C3CC();
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
      swift_unknownObjectRetain();
    }
    sub_23A84C42C();
    sub_23A84C234();
    result = sub_23A84C444();
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

uint64_t sub_23A820788(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  __int128 v38;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = a2;
  v8 = sub_23A84C3CC();
  v9 = v8;
  if (*(_QWORD *)(v6 + 16))
  {
    v10 = 1 << *(_BYTE *)(v6 + 32);
    v37 = (_QWORD *)(v6 + 64);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v6 + 64);
    v36 = (unint64_t)(v10 + 63) >> 6;
    v13 = v8 + 64;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v12)
      {
        v22 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v23 = v22 | (v15 << 6);
      }
      else
      {
        v24 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v24 >= v36)
          goto LABEL_33;
        v25 = v37[v24];
        ++v15;
        if (!v25)
        {
          v15 = v24 + 1;
          if (v24 + 1 >= v36)
            goto LABEL_33;
          v25 = v37[v15];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v36)
            {
LABEL_33:
              swift_release();
              v4 = v3;
              if ((v7 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v6 + 32);
                if (v35 >= 64)
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v35;
                *(_QWORD *)(v6 + 16) = 0;
              }
              break;
            }
            v25 = v37[v26];
            if (!v25)
            {
              while (1)
              {
                v15 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_40;
                if (v15 >= v36)
                  goto LABEL_33;
                v25 = v37[v15];
                ++v26;
                if (v25)
                  goto LABEL_30;
              }
            }
            v15 = v26;
          }
        }
LABEL_30:
        v12 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      v31 = 16 * v23;
      v32 = (uint64_t *)(*(_QWORD *)(v6 + 48) + v31);
      v34 = *v32;
      v33 = v32[1];
      v38 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + v31);
      if ((v7 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_23A84C42C();
      sub_23A84C234();
      result = sub_23A84C444();
      v16 = -1 << *(_BYTE *)(v9 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v29 = v18 == v28;
          if (v18 == v28)
            v18 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v13 + 8 * v18);
        }
        while (v30 == -1);
        v19 = __clz(__rbit64(~v30)) + (v18 << 6);
      }
      *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = 16 * v19;
      v21 = (_QWORD *)(*(_QWORD *)(v9 + 48) + v20);
      *v21 = v34;
      v21[1] = v33;
      *(_OWORD *)(*(_QWORD *)(v9 + 56) + v20) = v38;
      ++*(_QWORD *)(v9 + 16);
    }
  }
  result = swift_release();
  *v4 = v9;
  return result;
}

uint64_t sub_23A820A8C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  int64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C29B8);
  v43 = a2;
  result = sub_23A84C3CC();
  v6 = result;
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = 0;
    v41 = (uint64_t *)(v4 + 64);
    v42 = v4;
    v8 = 1 << *(_BYTE *)(v4 + 32);
    v37 = -1 << v8;
    v38 = v8;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 64);
    v40 = (unint64_t)(v8 + 63) >> 6;
    v11 = result + 64;
    while (1)
    {
      if (v10)
      {
        v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v44 = v7;
        v18 = v17 | (v7 << 6);
      }
      else
      {
        v19 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        result = (uint64_t)v41;
        if (v19 >= v40)
          goto LABEL_33;
        v20 = v41[v19];
        v21 = v7 + 1;
        if (!v20)
        {
          v21 = v19 + 1;
          if (v19 + 1 >= v40)
            goto LABEL_33;
          v20 = v41[v21];
          if (!v20)
          {
            v22 = v19 + 2;
            if (v22 >= v40)
            {
LABEL_33:
              if ((v43 & 1) == 0)
                break;
              if (v38 >= 64)
                bzero(v41, 8 * v40);
              else
                *v41 = v37;
              v36 = v39;
              *(_QWORD *)(v4 + 16) = 0;
              result = swift_release();
              goto LABEL_39;
            }
            v20 = v41[v22];
            if (!v20)
            {
              while (1)
              {
                v21 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v21 >= v40)
                  goto LABEL_33;
                v20 = v41[v21];
                ++v22;
                if (v20)
                  goto LABEL_30;
              }
            }
            v21 = v22;
          }
        }
LABEL_30:
        v10 = (v20 - 1) & v20;
        v44 = v21;
        v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      v27 = *(_QWORD *)(v4 + 56);
      v28 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v18);
      v29 = v27 + 88 * v18;
      v30 = *(void **)v29;
      v31 = *(_QWORD *)(v29 + 8);
      v32 = *(_QWORD *)(v29 + 16);
      v33 = *(_QWORD *)(v29 + 24);
      v34 = *(_QWORD *)(v29 + 32);
      v35 = *(_QWORD *)(v29 + 48);
      v48 = *(_QWORD *)(v29 + 56);
      v49 = *(_QWORD *)(v29 + 40);
      v46 = *(_QWORD *)(v29 + 72);
      v47 = *(_QWORD *)(v29 + 64);
      v45 = *(_BYTE *)(v29 + 80);
      if ((v43 & 1) == 0)
        sub_23A8223E8(v30, v31, v32, v33, v34, v49, v35, v48, v47, v46, v45);
      result = sub_23A84C420();
      v12 = -1 << *(_BYTE *)(v6 + 32);
      v13 = result & ~v12;
      v14 = v13 >> 6;
      if (((-1 << v13) & ~*(_QWORD *)(v11 + 8 * (v13 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v11 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v12) >> 6;
        do
        {
          if (++v14 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v25 = v14 == v24;
          if (v14 == v24)
            v14 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v11 + 8 * v14);
        }
        while (v26 == -1);
        v15 = __clz(__rbit64(~v26)) + (v14 << 6);
      }
      *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v28;
      v16 = *(_QWORD *)(v6 + 56) + 88 * v15;
      *(_QWORD *)v16 = v30;
      *(_QWORD *)(v16 + 8) = v31;
      *(_QWORD *)(v16 + 16) = v32;
      *(_QWORD *)(v16 + 24) = v33;
      *(_QWORD *)(v16 + 32) = v34;
      *(_QWORD *)(v16 + 40) = v49;
      *(_QWORD *)(v16 + 48) = v35;
      *(_QWORD *)(v16 + 56) = v48;
      *(_QWORD *)(v16 + 64) = v47;
      *(_QWORD *)(v16 + 72) = v46;
      *(_BYTE *)(v16 + 80) = v45;
      ++*(_QWORD *)(v6 + 16);
      v4 = v42;
      v7 = v44;
    }
  }
  result = swift_release();
  v36 = v39;
LABEL_39:
  *v36 = v6;
  return result;
}

uint64_t sub_23A820DD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_23A8200A8(a2, a3);
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
    sub_23A82122C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_unknownObjectRelease();
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
  sub_23A820474(v15, a4 & 1);
  v21 = sub_23A8200A8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A84C414();
  __break(1u);
  return result;
}

uint64_t sub_23A820F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t *a6)
{
  _QWORD *v6;
  _QWORD *v8;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v8 = v6;
  v14 = *v6;
  v16 = sub_23A8200A8(a3, a4);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a5 & 1) == 0)
  {
    sub_23A8213E0(a6);
LABEL_7:
    v22 = (_QWORD *)*v8;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = (_QWORD *)(v22[7] + 16 * v16);
      result = swift_release();
      *v23 = a1;
      v23[1] = a2;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 16 * v16);
    *v27 = a3;
    v27[1] = a4;
    v28 = (_QWORD *)(v22[7] + 16 * v16);
    *v28 = a1;
    v28[1] = a2;
    v29 = v22[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v22[2] = v31;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23A820788(v19, a5 & 1, a6);
  v25 = sub_23A8200A8(a3, a4);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v8;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A84C414();
  __break(1u);
  return result;
}

uint64_t sub_23A8210B4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_23A82010C(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
        return sub_23A8223FC(a1, v16[7] + 88 * v10);
      return sub_23A8211C4(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_23A821598();
      goto LABEL_7;
    }
    sub_23A820A8C(v13, a3 & 1);
    v18 = sub_23A82010C(a2);
    if ((v14 & 1) == (v19 & 1))
    {
      v10 = v18;
      v16 = *v4;
      if ((v14 & 1) != 0)
        return sub_23A8223FC(a1, v16[7] + 88 * v10);
      return sub_23A8211C4(v10, a2, a1, v16);
    }
  }
  result = sub_23A84C414();
  __break(1u);
  return result;
}

uint64_t sub_23A8211C4(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_23A822438(a3, a4[7] + 88 * a1);
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

void *sub_23A82122C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8048);
  v2 = *v0;
  v3 = sub_23A84C3C0();
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
    result = (void *)swift_unknownObjectRetain();
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

void *sub_23A8213E0(uint64_t *a1)
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
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_23A84C3C0();
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
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v17);
    v20 = *v18;
    v19 = v18[1];
    v21 = *(_OWORD *)(*(_QWORD *)(v3 + 56) + v17);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = v20;
    v22[1] = v19;
    *(_OWORD *)(*(_QWORD *)(v5 + 56) + v17) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23A821598()
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
  void *v20;
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
  int64_t v31;
  unint64_t v32;
  int64_t v33;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C29B8);
  v2 = *v0;
  v3 = sub_23A84C3C0();
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
    v31 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v31 >= v13)
      goto LABEL_26;
    v32 = *(_QWORD *)(v6 + 8 * v31);
    ++v9;
    if (!v32)
    {
      v9 = v31 + 1;
      if (v31 + 1 >= v13)
        goto LABEL_26;
      v32 = *(_QWORD *)(v6 + 8 * v9);
      if (!v32)
        break;
    }
LABEL_25:
    v12 = (v32 - 1) & v32;
    v15 = __clz(__rbit64(v32)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 88 * v15;
    v19 = *(_QWORD *)(v2 + 56) + v18;
    v20 = *(void **)v19;
    v21 = *(_QWORD *)(v19 + 8);
    v22 = *(_QWORD *)(v19 + 16);
    v23 = *(_QWORD *)(v19 + 24);
    v24 = *(_QWORD *)(v19 + 32);
    v25 = *(_QWORD *)(v19 + 40);
    v26 = *(_QWORD *)(v19 + 48);
    v27 = *(_QWORD *)(v19 + 56);
    v28 = *(_QWORD *)(v19 + 64);
    v29 = *(_QWORD *)(v19 + 72);
    LOBYTE(v19) = *(_BYTE *)(v19 + 80);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v30 = *(_QWORD *)(v4 + 56) + v18;
    *(_QWORD *)v30 = v20;
    *(_QWORD *)(v30 + 8) = v21;
    *(_QWORD *)(v30 + 16) = v22;
    *(_QWORD *)(v30 + 24) = v23;
    *(_QWORD *)(v30 + 32) = v24;
    *(_QWORD *)(v30 + 40) = v25;
    *(_QWORD *)(v30 + 48) = v26;
    *(_QWORD *)(v30 + 56) = v27;
    *(_QWORD *)(v30 + 64) = v28;
    *(_QWORD *)(v30 + 72) = v29;
    *(_BYTE *)(v30 + 80) = v19;
    result = sub_23A8223E8(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v19);
  }
  v33 = v31 + 2;
  if (v33 >= v13)
    goto LABEL_26;
  v32 = *(_QWORD *)(v6 + 8 * v33);
  if (v32)
  {
    v9 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v32 = *(_QWORD *)(v6 + 8 * v9);
    ++v33;
    if (v32)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23A821784(_QWORD *a1, char *a2, char *a3)
{
  uint64_t v3;
  void (*v4)(_QWORD *, char *, char *);
  uint64_t (*v5)(_QWORD *, char *, char *);
  uint64_t v6;
  char v7;
  char v8;
  char v10;
  char v11;
  _QWORD v12[2];

  v4 = *(void (**)(_QWORD *, char *, char *))(v3 + 16);
  v5 = *(uint64_t (**)(_QWORD *, char *, char *))(v3 + 32);
  v6 = a1[1];
  v7 = *a2;
  v8 = *a3;
  v12[0] = *a1;
  v12[1] = v6;
  v11 = v7;
  v10 = v8;
  v4(v12, &v11, &v10);
  return v5(v12, &v11, &v10);
}

uint64_t sub_23A8217F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_23A821828(uint64_t *a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *);
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;

  v2 = *(void (**)(uint64_t *))(v1 + 16);
  v3 = *(uint64_t (**)(uint64_t *))(v1 + 32);
  v5 = *a1;
  v2(&v5);
  return v3(&v5);
}

uint64_t sub_23A821878()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23A821898(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_23A8218BC(char a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(char *, char *);
  char v5;
  char v6;

  v3 = *(uint64_t (**)(char *, char *))(v2 + 16);
  v6 = a1;
  v5 = a2;
  return v3(&v6, &v5);
}

uint64_t objectdestroy_13Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A821924(char *a1, char *a2)
{
  uint64_t v2;
  void (*v3)(char *, char *);
  uint64_t (*v4)(char *, char *);
  char v5;
  char v7;
  char v8;

  v3 = *(void (**)(char *, char *))(v2 + 16);
  v4 = *(uint64_t (**)(char *, char *))(v2 + 32);
  v5 = *a2;
  v8 = *a1;
  v7 = v5;
  v3(&v8, &v7);
  return v4(&v8, &v7);
}

uint64_t sub_23A821984(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23A821994(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

id sub_23A8219BC(uint64_t a1, _OWORD *a2, void *a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  char *v18;
  void **v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  id v43;
  double *v44;
  objc_super v48;

  v29 = (void **)&v18[OBJC_IVAR___DRPDropletViewConfiguration_dropletColor];
  *(_QWORD *)&v18[OBJC_IVAR___DRPDropletViewConfiguration_dropletColor] = 0;
  v30 = &v18[OBJC_IVAR___DRPDropletViewConfiguration_keylineStyle];
  *(_QWORD *)&v18[OBJC_IVAR___DRPDropletViewConfiguration_keylineStyle] = 0;
  v31 = &v18[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
  *(_QWORD *)v31 = 0;
  *((_QWORD *)v31 + 1) = 0;
  v32 = OBJC_IVAR___DRPDropletViewConfiguration_animationBlockMap;
  v33 = v18;
  v34 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v18[v32] = sub_23A81D010(MEMORY[0x24BEE4AF8], &qword_2569C2A08);
  v35 = OBJC_IVAR___DRPDropletViewConfiguration_animationCompletionBlockMap;
  *(_QWORD *)&v33[v35] = sub_23A81D010(v34, &qword_2569C2A00);
  v36 = OBJC_IVAR___DRPDropletViewConfiguration_behaviorSettingsMap;
  *(_QWORD *)&v33[v36] = sub_23A81D134(v34);
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_centerX] = a5;
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_centerY] = a6;
  *(_QWORD *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges] = a1;
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius] = a7;
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_containerHeight] = a8;
  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_containerWidth] = a9;
  v37 = &v33[OBJC_IVAR___DRPDropletViewConfiguration_containerTransform];
  v38 = a2[5];
  *((_OWORD *)v37 + 4) = a2[4];
  *((_OWORD *)v37 + 5) = v38;
  v39 = a2[7];
  *((_OWORD *)v37 + 6) = a2[6];
  *((_OWORD *)v37 + 7) = v39;
  v40 = a2[1];
  *(_OWORD *)v37 = *a2;
  *((_OWORD *)v37 + 1) = v40;
  v41 = a2[3];
  *((_OWORD *)v37 + 2) = a2[2];
  *((_OWORD *)v37 + 3) = v41;
  swift_beginAccess();
  v42 = *v29;
  *v29 = a3;
  v43 = a3;

  *(double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius] = a10;
  v44 = (double *)&v33[OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets];
  *v44 = a11;
  v44[1] = a12;
  *((_QWORD *)v44 + 2) = a17;
  *((_QWORD *)v44 + 3) = a18;
  swift_beginAccess();
  *(_QWORD *)v30 = a4;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
  v48.receiver = v33;
  v48.super_class = (Class)DRPDropletViewConfiguration;
  return objc_msgSendSuper2(&v48, sel_init);
}

uint64_t type metadata accessor for DRPDropletViewConfiguration(uint64_t a1)
{
  return sub_23A81A1DC(a1, (unint64_t *)&unk_2542D7FF0);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B858570](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A821C40(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B85857C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A821C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8080);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A821CC8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8080);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A821D08(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C29B8);
    v3 = (_QWORD *)sub_23A84C3D8();
    v4 = a1 + 64;
    while (1)
    {
      v19 = v1;
      v5 = *(_QWORD *)(v4 - 32);
      v6 = *(void **)(v4 - 24);
      v7 = *(_QWORD *)(v4 - 16);
      v8 = *(_QWORD *)(v4 - 8);
      v10 = *(_QWORD *)v4;
      v9 = *(_QWORD *)(v4 + 8);
      v22 = *(_QWORD *)(v4 + 24);
      v23 = *(_QWORD *)(v4 + 16);
      v11 = *(_QWORD *)(v4 + 48);
      v20 = *(_QWORD *)(v4 + 40);
      v21 = *(_QWORD *)(v4 + 32);
      v12 = *(_BYTE *)(v4 + 56);
      result = sub_23A82010C(v5);
      if ((v14 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v3[6] + 8 * result) = v5;
      v15 = v3[7] + 88 * result;
      *(_QWORD *)v15 = v6;
      *(_QWORD *)(v15 + 8) = v7;
      *(_QWORD *)(v15 + 16) = v8;
      *(_QWORD *)(v15 + 24) = v10;
      *(_QWORD *)(v15 + 32) = v9;
      *(_QWORD *)(v15 + 40) = v23;
      *(_QWORD *)(v15 + 48) = v22;
      *(_QWORD *)(v15 + 56) = v21;
      *(_QWORD *)(v15 + 64) = v20;
      *(_QWORD *)(v15 + 72) = v11;
      *(_BYTE *)(v15 + 80) = v12;
      v16 = v3[2];
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
        goto LABEL_10;
      v4 += 96;
      v3[2] = v18;
      sub_23A8223E8(v6, v7, v8, v10, v9, v23, v22, v21, v20, v11, v12);
      v1 = v19 - 1;
      if (v19 == 1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t sub_23A821E60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, double a8@<D5>)
{
  uint64_t v14;
  uint64_t v15;
  double v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  int32x2_t v32;
  int64x2_t v33;
  double v34;

  switch(a1)
  {
    case 1:
    case 4:
      goto LABEL_4;
    case 2:
      a5 = a4;
      goto LABEL_4;
    case 8:
      a5 = a4;
LABEL_4:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C29C8);
      v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_23A84E0E0;
      *(_QWORD *)(v14 + 32) = swift_getKeyPath();
      *(double *)(v14 + 40) = a6 - a5 + a3;
      v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_23A84E0E0;
      *(_QWORD *)(v15 + 32) = swift_getKeyPath();
      *(double *)(v15 + 40) = a6 + a7 + a6 + a7;
      v16 = 0.0;
      if (a3 >= 0.0)
        v16 = a3;
      v17 = v16 == 0.0;
      v34 = sub_23A81FEBC(v14, a8);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      swift_bridgeObjectRelease();
      v24 = sub_23A81FEBC(v15, a8 * 0.769230769);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      result = swift_bridgeObjectRelease();
      *(double *)a2 = a8;
      *(double *)(a2 + 8) = a8;
      *(double *)(a2 + 16) = a8;
      *(double *)(a2 + 24) = a8;
      *(double *)(a2 + 32) = v34;
      *(_QWORD *)(a2 + 40) = v19;
      *(_QWORD *)(a2 + 48) = v21;
      *(_QWORD *)(a2 + 56) = v23;
      *(double *)(a2 + 64) = v24;
      *(_QWORD *)(a2 + 72) = v26;
      *(_QWORD *)(a2 + 80) = v28;
      *(_QWORD *)(a2 + 88) = v30;
      v32 = vdup_n_s32(v17);
      v33.i64[0] = v32.u32[0];
      v33.i64[1] = v32.u32[1];
      *(int8x16_t *)(a2 + 96) = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v33, 0x3FuLL)), (int8x16_t)xmmword_23A84E2B0, (int8x16_t)xmmword_23A84E2A0);
      break;
    default:
      result = sub_23A84C39C();
      __break(1u);
      break;
  }
  return result;
}

char *keypath_get_selector_centerX()
{
  return sel_centerX;
}

id sub_23A8220A8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_centerX);
  *a2 = v4;
  return result;
}

id sub_23A8220D8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCenterX_, *a1);
}

char *keypath_get_selector_centerY()
{
  return sel_centerY;
}

id sub_23A8220F8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_centerY);
  *a2 = v4;
  return result;
}

id sub_23A822128(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCenterY_, *a1);
}

char *keypath_get_selector_boundaryEdges()
{
  return sel_boundaryEdges;
}

id sub_23A822148@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_boundaryEdges);
  *a2 = result;
  return result;
}

id sub_23A822178(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryEdges_, *a1);
}

char *keypath_get_selector_containerCornerRadius()
{
  return sel_containerCornerRadius;
}

id sub_23A822198@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_containerCornerRadius);
  *a2 = v4;
  return result;
}

id sub_23A8221C8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerCornerRadius_, *a1);
}

char *keypath_get_selector_containerHeight()
{
  return sel_containerHeight;
}

id sub_23A8221E8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_containerHeight);
  *a2 = v4;
  return result;
}

id sub_23A822218(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerHeight_, *a1);
}

char *keypath_get_selector_containerWidth()
{
  return sel_containerWidth;
}

id sub_23A822238@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_containerWidth);
  *a2 = v4;
  return result;
}

id sub_23A822268(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerWidth_, *a1);
}

char *keypath_get_selector_containerTransform()
{
  return sel_containerTransform;
}

char *keypath_get_selector_dropletColor()
{
  return sel_dropletColor;
}

id sub_23A82229C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_dropletColor);
  *a2 = result;
  return result;
}

id sub_23A8222D4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletColor_, *a1);
}

char *keypath_get_selector_dropletRadius()
{
  return sel_dropletRadius;
}

id sub_23A8222F4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_dropletRadius);
  *a2 = v4;
  return result;
}

id sub_23A822324(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletRadius_, *a1);
}

char *keypath_get_selector_boundaryOutsets()
{
  return sel_boundaryOutsets;
}

id sub_23A822344@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*a1, sel_boundaryOutsets);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_23A822378(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryOutsets_, *a1, a1[1], a1[2], a1[3]);
}

char *keypath_get_selector_keylineStyle()
{
  return sel_keylineStyle;
}

id sub_23A82239C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_keylineStyle);
  *a2 = result;
  return result;
}

id sub_23A8223D4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineStyle_, *a1);
}

id sub_23A8223E8(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11 == 1)
    return result;
  return result;
}

uint64_t sub_23A8223FC(uint64_t a1, uint64_t a2)
{
  assignWithTake for DropletBackgroundView.BackgroundType(a2, a1);
  return a2;
}

uint64_t sub_23A822438(uint64_t a1, uint64_t a2)
{
  __swift_memcpy81_8(a2, a1);
  return a2;
}

id sub_23A822474(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  id v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  double v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  double v64;
  uint64_t v65;
  double v66;
  double v67;
  _BYTE v68[32];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[32];
  uint64_t v73;
  uint64_t v74;

  if (sub_23A81ECCC(a1))
  {
    v14 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
    v15 = 0.0;
    if (a6 != 0.0)
      v15 = 2.0;
    v16 = v14;
    v17 = a4 * 0.5;
    v18 = a6 * 0.2 + v15;
    switch(a1)
    {
      case 1:
        v19 = v18 - v17;
        goto LABEL_10;
      case 2:
        v67 = a5;
        v20 = v18 - v17;
        goto LABEL_8;
      case 4:
        v19 = v17 + a3 - v18;
LABEL_10:
        v66 = a5;
        v67 = v19;
        goto LABEL_11;
      case 8:
        v67 = a5;
        v20 = v17 + a2 - v18;
LABEL_8:
        v66 = v20;
LABEL_11:
        objc_msgSend(v14, sel_edgeHintKeylineInnerWidth);
        v22 = v21;
        objc_msgSend(v16, sel_edgeHintKeylineOuterWidth);
        v24 = v23;
        sub_23A821E60(a1, (uint64_t)v68, v18, a4, a4, v22, v23, a7 * 2.8 + a7 * 2.8);
        v64 = a7;
        v65 = *(_QWORD *)v68;
        v63 = *(_OWORD *)&v68[8];
        v62 = *(_QWORD *)&v68[24];
        v25 = *((double *)&v69 + 1);
        v60 = *(double *)&v69;
        v26 = v70;
        v27 = *(_QWORD *)v72;
        v56 = *(_OWORD *)&v72[8];
        v58 = v71;
        v28 = *(_QWORD *)&v72[24];
        v29 = objc_msgSend(v16, sel_edgeHintKeylineAdaptiveColorMatrix);
        objc_msgSend(v29, sel_caColorMatrix);
        v52 = *(_OWORD *)&v68[16];
        v54 = *(_OWORD *)v68;
        v48 = v70;
        v50 = v69;
        v47 = v71;

        v30 = objc_allocWithZone((Class)DRPDropletContextAdaptiveKeylineStyle);
        *(_OWORD *)v68 = v54;
        *(_OWORD *)&v68[16] = v52;
        v69 = v50;
        v70 = v48;
        v71 = v47;
        v31 = objc_msgSend(v30, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v68, v22, v24, v60, v25, v26, v58, v27, v56, v28);
        v49 = *MEMORY[0x24BDE5598];
        v51 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
        v53 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
        v55 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
        v59 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
        v61 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
        v57 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
        v32 = *(_QWORD *)(MEMORY[0x24BDE5598] + 112);
        v33 = *(_QWORD *)(MEMORY[0x24BDE5598] + 120);
        v34 = objc_allocWithZone((Class)DRPDropletViewConfiguration);
        *(_OWORD *)v68 = v49;
        *(_OWORD *)&v68[16] = v51;
        v69 = v53;
        v70 = v55;
        v71 = v61;
        *(_OWORD *)v72 = v59;
        *(_OWORD *)&v72[16] = v57;
        v73 = v32;
        v74 = v33;
        v35 = objc_msgSend(v34, sel_initWithCenterX_centerY_boundaryEdges_containerCornerRadius_containerHeight_containerWidth_containerTransform_dropletColor_dropletRadius_boundaryOutsets_keylineStyle_, a1, v68, 0, v31, v66, v67, 0.0, a4, a4, v64, v65, v63, v62);
        v36 = (void *)sub_23A84C210();
        v37 = objc_msgSend(v16, sel_edgeHintCenterXAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v36, v37);

        v38 = (void *)sub_23A84C210();
        v39 = objc_msgSend(v16, sel_edgeHintCenterYAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v38, v39);

        v40 = (void *)sub_23A84C210();
        v41 = objc_msgSend(v16, sel_edgeHintContainerWidthAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v40, v41);

        v42 = (void *)sub_23A84C210();
        v43 = objc_msgSend(v16, sel_edgeHintContainerHeightAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v42, v43);

        v44 = (void *)sub_23A84C210();
        v45 = objc_msgSend(v16, sel_edgeHintKeylineStyleAnimationSettings);
        objc_msgSend(v35, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v44, v45);

        return v35;
      default:
        break;
    }
  }
  else
  {
    __break(1u);
  }
  sub_23A84C39C();
  __break(1u);
  JUMPOUT(0x23A8229CCLL);
}

id sub_23A8229EC(uint64_t a1, uint64_t *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  double v57;
  uint64_t v58;
  __int128 v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
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
  _BYTE v83[32];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v67 = *a2;
  v82 = a2[1];
  v81 = a2[2];
  v80 = a2[3];
  v79 = a2[4];
  v78 = a2[5];
  v77 = a2[6];
  v76 = a2[7];
  v75 = a2[8];
  v74 = a2[9];
  v73 = a2[10];
  v72 = a2[11];
  v71 = a2[12];
  v70 = a2[13];
  v69 = a2[14];
  v68 = a2[15];
  if (sub_23A81ECCC(a1))
  {
    v66 = a9;
    switch(a1)
    {
      case 1:
        v19 = a5 + a8 * -0.5;
        goto LABEL_8;
      case 2:
        v65 = a6;
        v20 = a5 + a7 * -0.5;
        goto LABEL_6;
      case 4:
        v19 = a8 * 0.5 + a4 - a5;
LABEL_8:
        v64 = a6;
        v65 = v19;
        goto LABEL_9;
      case 8:
        v65 = a6;
        v20 = a7 * 0.5 + a3 - a5;
LABEL_6:
        v64 = v20;
LABEL_9:
        v21 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
        objc_msgSend(v21, sel_edgeContentPresentedKeylineInnerWidth);
        v23 = v22;
        v57 = v22;
        objc_msgSend(v21, sel_edgeContentPresentedKeylineOuterWidth);
        v25 = v24;
        BSRectWithSize();
        *(_QWORD *)v83 = v67;
        *(_QWORD *)&v83[8] = v82;
        *(_QWORD *)&v83[16] = v81;
        *(_QWORD *)&v83[24] = v80;
        *(_QWORD *)&v84 = v79;
        *((_QWORD *)&v84 + 1) = v78;
        *(_QWORD *)&v85 = v77;
        *((_QWORD *)&v85 + 1) = v76;
        *(_QWORD *)&v86 = v75;
        *((_QWORD *)&v86 + 1) = v74;
        v87 = v73;
        *(_QWORD *)&v88 = v72;
        *((_QWORD *)&v88 + 1) = v71;
        v89 = v70;
        v90 = v69;
        v91 = v68;
        CA_CGRectApplyTransform();
        sub_23A821E60(a1, (uint64_t)v83, a5, v26, v27, v23, v25, a10 * 2.8 + a10 * 2.8);
        v62 = a7;
        v63 = *(_QWORD *)v83;
        v59 = *(_OWORD *)&v83[8];
        v28 = *(double *)&v84;
        v58 = *(_QWORD *)&v83[24];
        v30 = *((double *)&v84 + 1);
        v29 = *(double *)&v85;
        v60 = a10;
        v61 = a8;
        v31 = *((double *)&v85 + 1);
        v32 = v87;
        v55 = v88;
        v56 = v86;
        v33 = v89;
        v34 = objc_msgSend(v21, sel_edgeContentPresentedKeylineAdaptiveColorMatrix);
        objc_msgSend(v34, sel_caColorMatrix);
        v53 = *(_OWORD *)&v83[16];
        v54 = *(_OWORD *)v83;
        v51 = v85;
        v52 = v84;
        v50 = v86;

        v35 = objc_allocWithZone((Class)DRPDropletContextAdaptiveKeylineStyle);
        *(_OWORD *)v83 = v54;
        *(_OWORD *)&v83[16] = v53;
        v84 = v52;
        v85 = v51;
        v86 = v50;
        v36 = objc_msgSend(v35, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v83, v57, v25, v28, v30, v29, v31, v56, v32, v55, v33);
        v37 = objc_allocWithZone((Class)DRPDropletViewConfiguration);
        *(_QWORD *)v83 = v67;
        *(_QWORD *)&v83[8] = v82;
        *(_QWORD *)&v83[16] = v81;
        *(_QWORD *)&v83[24] = v80;
        *(_QWORD *)&v84 = v79;
        *((_QWORD *)&v84 + 1) = v78;
        *(_QWORD *)&v85 = v77;
        *((_QWORD *)&v85 + 1) = v76;
        *(_QWORD *)&v86 = v75;
        *((_QWORD *)&v86 + 1) = v74;
        v87 = v73;
        *(_QWORD *)&v88 = v72;
        *((_QWORD *)&v88 + 1) = v71;
        v89 = v70;
        v90 = v69;
        v91 = v68;
        v38 = objc_msgSend(v37, sel_initWithCenterX_centerY_boundaryEdges_containerCornerRadius_containerHeight_containerWidth_containerTransform_dropletColor_dropletRadius_boundaryOutsets_keylineStyle_, a1, v83, 0, v36, v64, v65, v66, v61, v62, v60, v63, v59, v58);
        v39 = (void *)sub_23A84C210();
        v40 = objc_msgSend(v21, sel_edgeContentPresentedCenterXAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v39, v40);

        v41 = (void *)sub_23A84C210();
        v42 = objc_msgSend(v21, sel_edgeContentPresentedCenterYAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v41, v42);

        v43 = (void *)sub_23A84C210();
        v44 = objc_msgSend(v21, sel_edgeContentPresentedContainerWidthAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v43, v44);

        v45 = (void *)sub_23A84C210();
        v46 = objc_msgSend(v21, sel_edgeContentPresentedContainerHeightAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v45, v46);

        v47 = (void *)sub_23A84C210();
        v48 = objc_msgSend(v21, sel_edgeContentPresentedKeylineStyleAnimationSettings);
        objc_msgSend(v38, sel_setBehaviorSettingsForKeyPath_behaviorSettings_, v47, v48);

        return v38;
      default:
        break;
    }
  }
  else
  {
    __break(1u);
  }
  sub_23A84C39C();
  __break(1u);
  JUMPOUT(0x23A823028);
}

uint64_t sub_23A823048(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23A823058()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23A82307C(char a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v2 + 16) + 16))(*(_QWORD *)(v2 + 16), a1 & 1, a2 & 1);
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

uint64_t sub_23A8230B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_23A8230C0(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v4;
  uint64_t v7;
  id v8;

  v7 = *(_QWORD *)(v4 + 16);
  v8 = (id)sub_23A84C210();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v7 + 16))(v7, v8, a3 & 1, a4 & 1);

}

uint64_t sub_23A823118()
{
  return swift_release();
}

char *sub_23A823168(id a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char *v12;
  void *v13;
  void **v14;
  void *v15;
  id v16;
  id v17;
  char *v18;
  char *v19;

  if (a1)
  {
    objc_msgSend(a1, sel_bounds);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v9 = 0.0;
    v11 = 0.0;
    v5 = 0.0;
    v7 = 0.0;
  }
  v12 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, v5, v7, v9, v11);
  v13 = (void *)sub_23A84C210();
  objc_msgSend(v12, sel_setAccessibilityIdentifier_, v13);

  v14 = (void **)&v12[OBJC_IVAR___DRPDropletContainerView_contentView];
  swift_beginAccess();
  v15 = *v14;
  *v14 = a1;
  v16 = a1;

  *(_QWORD *)&v12[OBJC_IVAR___DRPDropletContainerView_participantViews] = a2;
  swift_bridgeObjectRelease();
  v17 = v12;
  if (a1)
  {
    v17 = v16;
    v18 = (char *)objc_msgSend(v17, sel_superview);
    if (!v18 || (v19 = v18, v18, v19 != v12))
      objc_msgSend(v12, sel_addSubview_, v17);

  }
  return v12;
}

void __swiftcall DRPDropletContainerView.init(coder:)(DRPDropletContainerView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void DRPDropletContainerView.init(coder:)()
{
  char *v0;
  char *v1;
  __int128 v2;

  *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContainerView_contentView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContainerView_boundaryEdges] = 0;
  v1 = &v0[OBJC_IVAR___DRPDropletContainerView_boundaryOutsets];
  v2 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *(_OWORD *)v1 = *MEMORY[0x24BEBE158];
  *((_OWORD *)v1 + 1) = v2;
  *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContainerView_participantViews] = MEMORY[0x24BEE4AF8];

  sub_23A84C39C();
  __break(1u);
}

void *DRPDropletContainerView.contentView.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___DRPDropletContainerView_contentView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void DRPDropletContainerView.contentView.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR___DRPDropletContainerView_contentView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;
  sub_23A823694(v4);

}

void sub_23A823694(id a1)
{
  char *v1;
  id *v3;
  id v4;
  char *v5;
  char *v6;

  v3 = (id *)&v1[OBJC_IVAR___DRPDropletContainerView_contentView];
  swift_beginAccess();
  if (*v3)
  {
    if (a1 && *v3 == a1)
      return;
  }
  else if (!a1)
  {
    return;
  }
  objc_msgSend(a1, sel_removeFromSuperview);
  if (*v3)
  {
    v4 = *v3;
    v5 = (char *)objc_msgSend(v4, sel_superview);
    if (!v5 || (v6 = v5, v5, v6 != v1))
      objc_msgSend(v1, sel_addSubview_, v4);

  }
}

id DRPDropletContainerView.continuousCornerRadius.getter()
{
  void *v0;

  return objc_msgSend(v0, sel__continuousCornerRadius);
}

id DRPDropletContainerView.continuousCornerRadius.setter()
{
  void *v0;

  return objc_msgSend(v0, sel__setContinuousCornerRadius_);
}

id DRPDropletContainerView._continuousCornerRadius.getter()
{
  objc_super v1;

  v1.super_class = (Class)DRPDropletContainerView;
  return objc_msgSendSuper2(&v1, sel__continuousCornerRadius);
}

uint64_t DRPDropletContainerView._continuousCornerRadius.setter()
{
  char *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v7, sel__setContinuousCornerRadius_);
  v1 = *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContainerView_participantViews];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v2)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_23A84C3B4();
  v2 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x23B858090](v4, v1);
      else
        v5 = *(id *)(v1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      objc_msgSend(v0, sel__continuousCornerRadius);
      objc_msgSend(v6, sel__setContinuousCornerRadius_);

    }
    while (v2 != v4);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t DRPDropletContainerView.boundaryEdges.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContainerView_boundaryEdges;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t DRPDropletContainerView.boundaryEdges.setter(uint64_t a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint32_t *p_align;
  _QWORD *v12;
  char *v13;
  char *v14;
  id v16;
  uint64_t v17;
  id v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29[8];

  v2 = v1;
  v4 = &v2[OBJC_IVAR___DRPDropletContainerView_boundaryEdges];
  result = swift_beginAccess();
  v6 = *(_QWORD *)v4;
  *(_QWORD *)v4 = a1;
  if (v6 != a1)
  {
    v7 = *(_QWORD *)&v2[OBJC_IVAR___DRPDropletContainerView_participantViews];
    if (v7 >> 62)
      goto LABEL_21;
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (; v8; v8 = sub_23A84C3B4())
    {
      v9 = 0;
      v10 = v7 & 0xC000000000000001;
      v26 = v7 + 32;
      p_align = &stru_250BABFE8.align;
      v12 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v25 = v7;
      v27 = v7 & 0xC000000000000001;
      v28 = v8;
      while (1)
      {
        v13 = v10 ? (char *)MEMORY[0x23B858090](v9, v7) : (char *)*(id *)(v26 + 8 * v9);
        v14 = v13;
        if (__OFADD__(v9++, 1))
          break;
        v16 = objc_msgSend(v2, *((SEL *)p_align + 192));
        v17 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges;
        v18 = *(id *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges];
        *(_QWORD *)&v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = v16;
        if (v16 == v18)
        {

        }
        else
        {
          v19 = &v14[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          v20 = *(_QWORD *)(*(_QWORD *)v19 + 16);
          if (v20)
          {
            v21 = v2;
            v22 = *(_QWORD *)v19 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_23A825398(v22, (uint64_t)v29, &qword_2569C2C40);
              v23 = (_QWORD *)MEMORY[0x23B858660](v29);
              if (v23)
              {
                v24 = v23;
                (*(void (**)(char *, _QWORD))((*v12 & *v23) + 0xC0))(v14, *(_QWORD *)&v14[v17]);

              }
              sub_23A825594((uint64_t)v29, &qword_2569C2C40);
              v22 += 8;
              --v20;
            }
            while (v20);

            swift_bridgeObjectRelease_n();
            v2 = v21;
            v7 = v25;
          }
          else
          {

          }
          v10 = v27;
          v8 = v28;
          p_align = (_DWORD *)(&stru_250BABFE8 + 24);
        }
        if (v9 == v8)
          return swift_bridgeObjectRelease_n();
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain_n();
    }
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

double DRPDropletContainerView.boundaryOutsets.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContainerView_boundaryOutsets;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContainerView.boundaryOutsets.setter(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  double *v10;
  uint64_t result;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint32_t *p_align;
  _QWORD *v24;
  char *v25;
  char *v26;
  double v28;
  double v29;
  double v30;
  double *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char v50[8];

  v5 = v4;
  v10 = (double *)&v4[OBJC_IVAR___DRPDropletContainerView_boundaryOutsets];
  result = swift_beginAccess();
  v12 = *v10;
  v13 = v10[1];
  v14 = v10[2];
  v15 = v10[3];
  *v10 = a1;
  v10[1] = a2;
  v10[2] = a3;
  v10[3] = a4;
  if (v12 != a1 || v13 != a2 || v14 != a3 || v15 != a4)
  {
    v19 = *(_QWORD *)&v5[OBJC_IVAR___DRPDropletContainerView_participantViews];
    if (v19 >> 62)
      goto LABEL_39;
    v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (; v20; v20 = sub_23A84C3B4())
    {
      v21 = 0;
      v22 = v19 & 0xC000000000000001;
      v47 = v19 + 32;
      p_align = &stru_250BABFE8.align;
      v24 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v46 = v19;
      v48 = v19 & 0xC000000000000001;
      v49 = v20;
      while (1)
      {
        v25 = v22 ? (char *)MEMORY[0x23B858090](v21, v19) : (char *)*(id *)(v47 + 8 * v21);
        v26 = v25;
        if (__OFADD__(v21++, 1))
          break;
        objc_msgSend(v5, *((SEL *)p_align + 199));
        v31 = (double *)&v26[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
        v32 = *(double *)&v26[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
        v33 = *(double *)&v26[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets + 8];
        v34 = *(double *)&v26[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets + 16];
        v35 = *(double *)&v26[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets + 24];
        *v31 = v36;
        v31[1] = v28;
        v31[2] = v29;
        v31[3] = v30;
        if (v36 == v32 && v28 == v33 && v29 == v34 && v30 == v35)
        {

        }
        else
        {
          v40 = &v26[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          v41 = *(_QWORD *)(*(_QWORD *)v40 + 16);
          if (v41)
          {
            v42 = v5;
            v43 = *(_QWORD *)v40 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_23A825398(v43, (uint64_t)v50, &qword_2569C2C40);
              v44 = (_QWORD *)MEMORY[0x23B858660](v50);
              if (v44)
              {
                v45 = v44;
                (*(void (**)(char *, double, double, double, double))((*v24 & *v44) + 0xC8))(v26, *v31, v31[1], v31[2], v31[3]);

              }
              sub_23A825594((uint64_t)v50, &qword_2569C2C40);
              v43 += 8;
              --v41;
            }
            while (v41);

            swift_bridgeObjectRelease_n();
            v5 = v42;
            v19 = v46;
          }
          else
          {

          }
          v22 = v48;
          v20 = v49;
          p_align = (_DWORD *)(&stru_250BABFE8 + 24);
        }
        if (v21 == v20)
          return swift_bridgeObjectRelease_n();
      }
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain_n();
    }
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

id DRPDropletContainerView.frame.getter()
{
  return sub_23A8240D4((SEL *)&selRef_frame);
}

uint64_t DRPDropletContainerView.frame.setter()
{
  return sub_23A82417C((SEL *)&selRef_setFrame_, (SEL *)&selRef_frame);
}

id DRPDropletContainerView.bounds.getter()
{
  return sub_23A8240D4((SEL *)&selRef_bounds);
}

id sub_23A8240D4(SEL *a1)
{
  objc_super v2;

  v2.super_class = (Class)DRPDropletContainerView;
  return objc_msgSendSuper2(&v2, *a1);
}

uint64_t DRPDropletContainerView.bounds.setter()
{
  return sub_23A82417C((SEL *)&selRef_setBounds_, (SEL *)&selRef_bounds);
}

uint64_t sub_23A82417C(SEL *a1, SEL *a2)
{
  char *v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v11, *a1);
  v5 = *(_QWORD *)&v2[OBJC_IVAR___DRPDropletContainerView_participantViews];
  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v6)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_23A84C3B4();
  v6 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_3:
  if (v6 >= 1)
  {
    v8 = 0;
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x23B858090](v8, v5);
      else
        v9 = *(id *)(v5 + 8 * v8 + 32);
      v10 = v9;
      ++v8;
      objc_msgSend(v2, *a2);
      objc_msgSend(v10, *a1);

    }
    while (v6 != v8);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

id DRPDropletContainerView.center.getter()
{
  objc_super v1;

  v1.super_class = (Class)DRPDropletContainerView;
  return objc_msgSendSuper2(&v1, sel_center);
}

uint64_t DRPDropletContainerView.center.setter()
{
  char *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v7, sel_setCenter_);
  v1 = *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContainerView_participantViews];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v2)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_23A84C3B4();
  v2 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x23B858090](v4, v1);
      else
        v5 = *(id *)(v1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      objc_msgSend(v0, sel_center);
      objc_msgSend(v6, sel_setCenter_);

    }
    while (v2 != v4);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

double DRPDropletContainerView.transform.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  objc_super v6;

  v6.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v6, sel_transform);
  result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t DRPDropletContainerView.transform.setter(_OWORD *a1)
{
  char *v1;
  __int128 v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  void *v8;
  _OWORD v9[3];
  objc_super v10;

  v10.super_class = (Class)DRPDropletContainerView;
  v2 = a1[1];
  v9[0] = *a1;
  v9[1] = v2;
  v9[2] = a1[2];
  objc_msgSendSuper2(&v10, sel_setTransform_, v9);
  v3 = *(_QWORD *)&v1[OBJC_IVAR___DRPDropletContainerView_participantViews];
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v4)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_23A84C3B4();
  v4 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x23B858090](v6, v3);
      else
        v7 = *(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      objc_msgSend(v1, sel_transform);
      objc_msgSend(v8, sel_setTransform_, v9);

    }
    while (v4 != v6);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

id DRPDropletContainerView.isHidden.getter()
{
  objc_super v1;

  v1.super_class = (Class)DRPDropletContainerView;
  return objc_msgSendSuper2(&v1, sel_isHidden);
}

uint64_t DRPDropletContainerView.isHidden.setter(char a1)
{
  char *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  id v6;
  void *v7;
  objc_super v8;

  v8.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v8, sel_setHidden_, a1 & 1);
  v2 = *(_QWORD *)&v1[OBJC_IVAR___DRPDropletContainerView_participantViews];
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v3)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_23A84C3B4();
  v3 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x23B858090](i, v2);
      else
        v6 = *(id *)(v2 + 8 * i + 32);
      v7 = v6;
      objc_msgSend(v6, sel_setHidden_, objc_msgSend(v1, sel_isHidden));

    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

double DRPDropletContainerView.transform3D.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v11, sel_transform3D);
  result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  return result;
}

uint64_t DRPDropletContainerView.transform3D.setter(_OWORD *a1)
{
  char *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  id v10;
  void *v11;
  _OWORD v12[8];
  objc_super v13;

  v13.super_class = (Class)DRPDropletContainerView;
  v2 = a1[1];
  v12[0] = *a1;
  v12[1] = v2;
  v3 = a1[3];
  v12[2] = a1[2];
  v12[3] = v3;
  v4 = a1[5];
  v12[4] = a1[4];
  v12[5] = v4;
  v5 = a1[7];
  v12[6] = a1[6];
  v12[7] = v5;
  objc_msgSendSuper2(&v13, sel_setTransform3D_, v12);
  v6 = *(_QWORD *)&v1[OBJC_IVAR___DRPDropletContainerView_participantViews];
  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v7)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_23A84C3B4();
  v7 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_3:
  if (v7 >= 1)
  {
    v9 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x23B858090](v9, v6);
      else
        v10 = *(id *)(v6 + 8 * v9 + 32);
      v11 = v10;
      ++v9;
      objc_msgSend(v1, sel_transform3D);
      objc_msgSend(v11, sel_setTransform3D_, v12);

    }
    while (v7 != v9);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t DRPDropletContainerView._setVelocity(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  _QWORD v27[2];
  unint64_t v28;
  uint64_t v29;
  objc_super v30;
  _QWORD v31[3];
  uint64_t v32;

  v27[1] = a2;
  v29 = a1;
  sub_23A825398(a1, (uint64_t)v31, (uint64_t *)&unk_2542D8080);
  v5 = v32;
  if (v32)
  {
    v6 = __swift_project_boxed_opaque_existential_0(v31, v32);
    v7 = *(_QWORD *)(v5 - 8);
    MEMORY[0x24BDAC7A8](v6, v6);
    v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = sub_23A84C3F0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
    if (a3)
    {
LABEL_3:
      v11 = (void *)sub_23A84C210();
      goto LABEL_6;
    }
  }
  else
  {
    v10 = 0;
    if (a3)
      goto LABEL_3;
  }
  v11 = 0;
LABEL_6:
  v30.receiver = v3;
  v30.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v30, sel__setVelocity_forKey_, v10, v11);
  swift_unknownObjectRelease();

  v12 = *(_QWORD *)&v3[OBJC_IVAR___DRPDropletContainerView_participantViews];
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain_n();
    result = sub_23A84C3B4();
    v13 = result;
    if (result)
      goto LABEL_8;
    return swift_bridgeObjectRelease_n();
  }
  v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain_n();
  if (!v13)
    return swift_bridgeObjectRelease_n();
LABEL_8:
  if (v13 >= 1)
  {
    v15 = 0;
    v28 = v12 & 0xC000000000000001;
    while (1)
    {
      if (v28)
        v17 = (id)MEMORY[0x23B858090](v15, v12);
      else
        v17 = *(id *)(v12 + 8 * v15 + 32);
      v18 = v17;
      sub_23A825398(v29, (uint64_t)v31, (uint64_t *)&unk_2542D8080);
      v19 = v32;
      if (v32)
      {
        v20 = __swift_project_boxed_opaque_existential_0(v31, v32);
        v21 = a3;
        v22 = *(_QWORD *)(v19 - 8);
        MEMORY[0x24BDAC7A8](v20, v20);
        v24 = (char *)v27 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v22 + 16))(v24);
        v25 = sub_23A84C3F0();
        v26 = *(void (**)(char *, uint64_t))(v22 + 8);
        a3 = v21;
        v26(v24, v19);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
        if (!v21)
          goto LABEL_19;
      }
      else
      {
        v25 = 0;
        if (!a3)
        {
LABEL_19:
          v16 = 0;
          goto LABEL_11;
        }
      }
      v16 = (void *)sub_23A84C210();
LABEL_11:
      ++v15;
      objc_msgSend(v18, sel__setVelocity_forKey_, v25, v16);

      swift_unknownObjectRelease();
      if (v13 == v15)
        return swift_bridgeObjectRelease_n();
    }
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall DRPDropletContainerView._removeAllRetargetableAnimations(_:)(Swift::Bool a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v9, sel__removeAllRetargetableAnimations_, a1);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR___DRPDropletContainerView_participantViews);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    return;
  }
  swift_bridgeObjectRetain_n();
  v4 = sub_23A84C3B4();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = a1;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x23B858090](v5, v3);
      else
        v7 = *(id *)(v3 + 8 * v5 + 32);
      v8 = v7;
      ++v5;
      objc_msgSend(v7, sel__removeAllRetargetableAnimations_, v6);

    }
    while (v4 != v5);
    goto LABEL_10;
  }
  __break(1u);
}

Swift::Void __swiftcall DRPDropletContainerView.layoutSubviews()()
{
  char *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  objc_super v17;

  v17.super_class = (Class)DRPDropletContainerView;
  objc_msgSendSuper2(&v17, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContainerView_participantViews];
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v10 = sub_23A84C3B4();
    if (!v10)
      goto LABEL_10;
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v10)
      goto LABEL_10;
  }
  if (v10 < 1)
  {
    __break(1u);
    return;
  }
  v11 = 0;
  do
  {
    if ((v9 & 0xC000000000000001) != 0)
      v12 = (id)MEMORY[0x23B858090](v11, v9);
    else
      v12 = *(id *)(v9 + 8 * v11 + 32);
    v13 = v12;
    ++v11;
    objc_msgSend(v12, sel_setBounds_, v2, v4, v6, v8);
    objc_msgSend(v0, sel_center);
    objc_msgSend(v13, sel_setCenter_);
    objc_msgSend(v0, sel_transform);
    objc_msgSend(v13, sel_setTransform_, &v16);

  }
  while (v10 != v11);
LABEL_10:
  swift_bridgeObjectRelease_n();
  v14 = objc_msgSend(v0, sel_contentView);
  if (v14)
  {
    v15 = v14;
    UIRectGetCenter();
    objc_msgSend(v15, sel_setCenter_);

  }
}

void (*sub_23A82524C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23A825324(v6, a2, a3);
  return sub_23A8252A0;
}

void (*sub_23A8252A4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23A8255D0(v6, a2, a3);
  return sub_23A8252A0;
}

void sub_23A8252F8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23A825324(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B858090](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_23A825390;
  }
  __break(1u);
  return result;
}

void sub_23A825390(id *a1)
{

}

uint64_t sub_23A825398(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

char *keypath_get_selector_contentView()
{
  return sel_contentView;
}

id sub_23A82542C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_contentView);
  *a2 = result;
  return result;
}

id sub_23A825464(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContentView_, *a1);
}

char *keypath_get_selector_continuousCornerRadius()
{
  return sel_continuousCornerRadius;
}

id sub_23A825484@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_continuousCornerRadius);
  *a2 = v4;
  return result;
}

id sub_23A8254B4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContinuousCornerRadius_, *a1);
}

id sub_23A8254C8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_boundaryEdges);
  *a2 = result;
  return result;
}

id sub_23A8254F8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryEdges_, *a1);
}

id sub_23A82550C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*a1, sel_boundaryOutsets);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_23A825540(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryOutsets_, *a1, a1[1], a1[2], a1[3]);
}

unint64_t type metadata accessor for DRPDropletContainerView()
{
  unint64_t result;

  result = qword_2542D7FE0;
  if (!qword_2542D7FE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D7FE0);
  }
  return result;
}

uint64_t sub_23A825594(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t (*sub_23A8255D0(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B858090](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_23A82563C;
  }
  __break(1u);
  return result;
}

id sub_23A825640(uint64_t a1, char a2, void *a3)
{
  void *v3;
  void *v4;
  id result;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _OWORD v13[2];
  _OWORD v14[2];

  v4 = v3;
  result = objc_msgSend(v4, sel_between_and_);
  if (!result)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v13, v14);
  sub_23A8257DC();
  swift_dynamicCast();
  v9 = v12;
  if ((a2 & 1) != 0)
  {
LABEL_5:
    if (!a3)
      return v9;
    v11 = a3;
    result = objc_msgSend(v9, sel_condition_, v11);
    if (result)
    {
      sub_23A84C30C();
      swift_unknownObjectRelease();
      sub_23A81A1CC(v13, v14);
      swift_dynamicCast();

      return v12;
    }
    goto LABEL_10;
  }
  v10 = v12;
  result = objc_msgSend(v10, sel_precision_, a1);
  if (result)
  {
    sub_23A84C30C();
    swift_unknownObjectRelease();
    sub_23A81A1CC(v13, v14);
    swift_dynamicCast();
    v9 = v12;

    goto LABEL_5;
  }
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23A8257DC()
{
  unint64_t result;

  result = qword_2569C2890;
  if (!qword_2569C2890)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569C2890);
  }
  return result;
}

void sub_23A825840()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v8 = objc_msgSend(v0, sel_layer);
  objc_opt_self();
  v1 = (void *)swift_dynamicCastObjCClassUnconditional();
  sub_23A81A1DC(0, (unint64_t *)&unk_2542D8038);
  v2 = sub_23A84C2F4();
  v3 = objc_msgSend(v1, sel_locations);
  if (!v3)
    goto LABEL_12;
  v4 = v3;
  v5 = sub_23A84C264();

  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
    || (v5 & 0x8000000000000000) != 0
    || (v5 & 0x4000000000000000) != 0)
  {
    sub_23A84B774(v5);
  }
  if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return;
  }
  v6 = *(void **)((v5 & 0xFFFFFFFFFFFFFF8) + 0x20);
  *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x20) = v2;

  sub_23A84C270();
  if (v5)
  {
    v7 = (void *)sub_23A84C258();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v1, sel_setLocations_, v7, v8);

}

void sub_23A8259B0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v8 = objc_msgSend(v0, sel_layer);
  objc_opt_self();
  v1 = (void *)swift_dynamicCastObjCClassUnconditional();
  sub_23A81A1DC(0, (unint64_t *)&unk_2542D8038);
  v2 = sub_23A84C2F4();
  v3 = objc_msgSend(v1, sel_locations);
  if (!v3)
    goto LABEL_12;
  v4 = v3;
  v5 = sub_23A84C264();

  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
    || (v5 & 0x8000000000000000) != 0
    || (v5 & 0x4000000000000000) != 0)
  {
    sub_23A84B774(v5);
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return;
  }
  v6 = *(void **)((v5 & 0xFFFFFFFFFFFFFF8) + 0x28);
  *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x28) = v2;

  sub_23A84C270();
  if (v5)
  {
    v7 = (void *)sub_23A84C258();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v1, sel_setLocations_, v7, v8);

}

id sub_23A825B24(uint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  void *v10;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_super v35;

  v35.receiver = v10;
  v35.super_class = (Class)type metadata accessor for GradientView();
  v21 = objc_msgSendSuper2(&v35, sel_initWithFrame_, a3, a4, a5, a6);
  v22 = objc_msgSend(v21, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setType_, *MEMORY[0x24BDE5C48]);

  v23 = objc_msgSend(v21, sel_layer);
  objc_opt_self();
  v24 = (void *)swift_dynamicCastObjCClassUnconditional();
  sub_23A825EA8(a2);
  swift_bridgeObjectRelease();
  v25 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setColors_, v25);

  v26 = objc_msgSend(v21, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setStartPoint_, a7, a8);

  v27 = objc_msgSend(v21, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setEndPoint_, a9, a10);

  v28 = objc_msgSend(v21, sel_layer);
  objc_opt_self();
  v29 = (void *)swift_dynamicCastObjCClassUnconditional();
  v30 = *(_QWORD *)(a1 + 16);
  if (v30)
  {
    sub_23A84C36C();
    sub_23A81A1DC(0, (unint64_t *)&unk_2542D8038);
    v31 = 0;
    do
    {
      v32 = v31 + 1;
      sub_23A84C2F4();
      sub_23A84C354();
      sub_23A84C378();
      sub_23A84C384();
      sub_23A84C360();
      v31 = v32;
    }
    while (v30 != v32);
  }
  swift_bridgeObjectRelease();
  sub_23A81A1DC(0, (unint64_t *)&unk_2542D8038);
  v33 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_setLocations_, v33);

  return v21;
}

char *sub_23A825EA8(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_23A84C3B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return (char *)v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_23A82640C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x23B858090](i, a1);
        type metadata accessor for CGColor(0);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A82640C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_23A82640C((char *)(v6 > 1), v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_23A81A1CC(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      type metadata accessor for CGColor(0);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A82640C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_23A82640C((char *)(v10 > 1), v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_23A81A1CC(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

char *sub_23A8260D8(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_23A84C3B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return (char *)v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_23A82640C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x23B858090](i, a1);
        sub_23A81A1DC(0, (unint64_t *)&qword_2569C2890);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A82640C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_23A82640C((char *)(v6 > 1), v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_23A81A1CC(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_23A81A1DC(0, (unint64_t *)&qword_2569C2890);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A82640C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_23A82640C((char *)(v10 > 1), v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_23A81A1CC(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

id sub_23A8263BC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GradientView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for GradientView()
{
  return objc_opt_self();
}

char *sub_23A82640C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23A826428(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23A826428(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

id sub_23A82652C(char a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t inited;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  if ((a1 & 1) != 0)
    v11 = a7;
  else
    v11 = 0.0;
  if ((a1 & 1) != 0)
    v12 = 0.0;
  else
    v12 = a7;
  if ((a1 & 1) != 0)
    v13 = 0.0;
  else
    v13 = a6;
  if ((a1 & 1) != 0)
    v14 = a6;
  else
    v14 = 0.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2A58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A84E230;
  *(_OWORD *)(inited + 32) = xmmword_23A84E350;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
  v16 = swift_initStackObject();
  *(_OWORD *)(v16 + 16) = xmmword_23A84E360;
  v17 = (void *)objc_opt_self();
  v18 = objc_msgSend(v17, sel_whiteColor);
  v19 = objc_msgSend(v18, sel_CGColor);

  *(_QWORD *)(v16 + 32) = v19;
  v20 = objc_msgSend(v17, sel_whiteColor);
  v21 = objc_msgSend(v20, sel_colorWithAlphaComponent_, 0.0);

  v22 = objc_msgSend(v21, sel_CGColor);
  *(_QWORD *)(v16 + 40) = v22;
  sub_23A84C270();
  v23 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  return sub_23A825B24(inited, v16, a2, a3, a4, a5, v13, v14, v12, v11);
}

uint64_t DRPDropletFluidBehaviorSettings.behaviorType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_behaviorType;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.behaviorType.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_behaviorType);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletFluidBehaviorSettings.name.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_name);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t DRPDropletFluidBehaviorSettings.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_name);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_23A8269A4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_name);
  if (v3)
  {
    v4 = v3;
    v5 = sub_23A84C21C();
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

void sub_23A826A08(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_23A84C210();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setName_);

}

double DRPDropletFluidBehaviorSettings.deceleration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_deceleration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.deceleration.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_deceleration);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.dampingRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_dampingRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.dampingRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_dampingRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.response.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_response;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.response.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_response);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.retargetImpulse.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_retargetImpulse;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.retargetImpulse.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_retargetImpulse);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.trackingDampingRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingDampingRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.trackingDampingRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingDampingRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.trackingResponse.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingResponse;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.trackingResponse.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingResponse);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.trackingRetargetImpulse.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingRetargetImpulse;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.trackingRetargetImpulse.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingRetargetImpulse);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletFluidBehaviorSettings.smoothingAndProjectionEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_smoothingAndProjectionEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletFluidBehaviorSettings.smoothingAndProjectionEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_smoothingAndProjectionEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.dampingRatioSmoothing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_dampingRatioSmoothing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.dampingRatioSmoothing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_dampingRatioSmoothing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.responseSmoothing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_responseSmoothing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.responseSmoothing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_responseSmoothing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.trackingDampingRatioSmoothing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingDampingRatioSmoothing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.trackingDampingRatioSmoothing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingDampingRatioSmoothing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.trackingResponseSmoothing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingResponseSmoothing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.trackingResponseSmoothing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingResponseSmoothing);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.inertialTargetSmoothingRatio.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_inertialTargetSmoothingRatio;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.inertialTargetSmoothingRatio.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_inertialTargetSmoothingRatio);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletFluidBehaviorSettings.inertialProjectionDeceleration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_inertialProjectionDeceleration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletFluidBehaviorSettings.inertialProjectionDeceleration.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_inertialProjectionDeceleration);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

void *DRPDropletFluidBehaviorSettings.preferredFrameRateRange.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void DRPDropletFluidBehaviorSettings.preferredFrameRateRange.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___DRPDropletFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

Swift::Void __swiftcall DRPDropletFluidBehaviorSettings.setDefaultValues()()
{
  void *v0;
  objc_super v1;

  v1.super_class = (Class)DRPDropletFluidBehaviorSettings;
  objc_msgSendSuper2(&v1, sel_setDefaultValues);
  objc_msgSend(v0, sel_setBehaviorType_, 1);
  objc_msgSend(v0, sel_setDeceleration_, 0.998);
  objc_msgSend(v0, sel_setDampingRatio_, 0.845);
  objc_msgSend(v0, sel_setResponse_, 0.531);
  objc_msgSend(v0, sel_setTrackingDampingRatio_, 0.86);
  objc_msgSend(v0, sel_setTrackingResponse_, 0.15);
  objc_msgSend(v0, sel_setRetargetImpulse_, 0.0);
  objc_msgSend(v0, sel_setTrackingRetargetImpulse_, 0.0);
  objc_msgSend(v0, sel_setDampingRatioSmoothing_, 0.0);
  objc_msgSend(v0, sel_setResponseSmoothing_, 0.0);
  objc_msgSend(v0, sel_setTrackingDampingRatioSmoothing_, 0.0);
  objc_msgSend(v0, sel_setTrackingResponseSmoothing_, 0.0);
  objc_msgSend(v0, sel_setSmoothingAndProjectionEnabled_, 0);
}

Swift::Void __swiftcall DRPDropletFluidBehaviorSettings.setDefaultCriticallyDampedValues()()
{
  void *v0;

  objc_msgSend(v0, sel_setDefaultValues);
  objc_msgSend(v0, sel_setDampingRatio_, 1.0);
  objc_msgSend(v0, sel_setResponse_, 0.336);
}

double DRPDropletFluidBehaviorSettings.parametersForTransition(from:to:)@<D0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  void *v3;
  id v6;
  char **v7;
  double v8;
  id v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char **v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double result;
  double v38;

  if (a2 == 1)
  {
    v6 = objc_msgSend(v3, sel_behaviorType);
    v7 = &selRef_dampingRatio;
    if (v6 != (id)1)
      v7 = &selRef_trackingDampingRatio;
    objc_msgSend(v3, *v7);
    v38 = v8;
    v9 = objc_msgSend(v3, sel_behaviorType);
    v10 = &selRef_response;
    if (v9 != (id)1)
      v10 = &selRef_trackingResponse;
    objc_msgSend(v3, *v10);
    v12 = v11;
    v13 = objc_msgSend(v3, sel_behaviorType);
    v14 = &selRef_retargetImpulse;
    if (v13 != (id)1)
      v14 = &selRef_trackingRetargetImpulse;
    objc_msgSend(v3, *v14);
    v16 = v15;
    v17 = 0.0;
    if (objc_msgSend(v3, sel_smoothingAndProjectionEnabled))
    {
      objc_msgSend(v3, sel_trackingDampingRatioSmoothing);
      v19 = v18;
      objc_msgSend(v3, sel_trackingResponseSmoothing);
      v21 = v20;
      if (a1)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
      }
      else
      {
        objc_msgSend(v3, sel_dampingRatio);
        v24 = v35;
        objc_msgSend(v3, sel_response);
        v23 = v36;
        v22 = 1;
      }
    }
    else
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v19 = 0;
      v21 = 0;
    }
    goto LABEL_19;
  }
  objc_msgSend(v3, sel_dampingRatio);
  v38 = v25;
  objc_msgSend(v3, sel_response);
  v12 = v26;
  objc_msgSend(v3, sel_retargetImpulse);
  v16 = v27;
  v23 = 0;
  if (!objc_msgSend(v3, sel_smoothingAndProjectionEnabled))
  {
    v22 = 0;
    v24 = 0;
    v19 = 0;
    v21 = 0;
LABEL_17:
    v17 = 0.0;
LABEL_19:
    v31 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v3, sel_dampingRatioSmoothing);
  v19 = v28;
  objc_msgSend(v3, sel_responseSmoothing);
  v21 = v29;
  if (a1 != 1)
  {
    v22 = 0;
    v24 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v3, sel_inertialProjectionDeceleration);
  v31 = v30;
  objc_msgSend(v3, sel_inertialTargetSmoothingRatio);
  v33 = v32;
  objc_msgSend(v3, sel_trackingResponse);
  v22 = 0;
  v17 = v33 * v34;
  v24 = 0;
LABEL_20:
  result = v38;
  *(double *)a3 = v38;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v22;
  *(_BYTE *)(a3 + 17) = v22;
  *(_QWORD *)(a3 + 24) = v24;
  *(_QWORD *)(a3 + 32) = v23;
  *(_QWORD *)(a3 + 40) = v19;
  *(_QWORD *)(a3 + 48) = v21;
  *(double *)(a3 + 56) = v17;
  *(_QWORD *)(a3 + 64) = v31;
  *(_QWORD *)(a3 + 72) = v16;
  return result;
}

uint64_t DRPDropletFluidBehaviorSettings.description.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  objc_super v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8050);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23A84E3B0;
  v18.receiver = v0;
  v18.super_class = (Class)DRPDropletFluidBehaviorSettings;
  v3 = objc_msgSendSuper2(&v18, sel_description);
  v4 = sub_23A84C21C();
  v6 = v5;

  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v6;
  v17[1] = 0xE000000000000000;
  sub_23A84C330();
  sub_23A84C240();
  objc_msgSend(v1, sel_behaviorType);
  type metadata accessor for DropletFluidBehaviorType(0);
  sub_23A84C390();
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = v17[1];
  v17[0] = 0x203A656D616ELL;
  v17[1] = 0xE600000000000000;
  v7 = objc_msgSend(v1, sel_name);
  if (v7)
  {
    v8 = v7;
    sub_23A84C21C();

  }
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = v17[0];
  *(_QWORD *)(v2 + 72) = v17[1];
  v17[1] = 0xE000000000000000;
  sub_23A84C330();
  sub_23A84C240();
  objc_msgSend(v1, sel_deceleration);
  sub_23A84C2AC();
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 88) = v17[1];
  sub_23A84C330();
  swift_bridgeObjectRelease();
  strcpy((char *)v17, "dampingRatio: ");
  HIBYTE(v17[1]) = -18;
  objc_msgSend(v1, sel_dampingRatio);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v9 = v17[1];
  *(_QWORD *)(v2 + 96) = v17[0];
  *(_QWORD *)(v2 + 104) = v9;
  strcpy((char *)v17, "response: ");
  BYTE3(v17[1]) = 0;
  HIDWORD(v17[1]) = -369098752;
  objc_msgSend(v1, sel_response);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v10 = v17[1];
  *(_QWORD *)(v2 + 112) = v17[0];
  *(_QWORD *)(v2 + 120) = v10;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_retargetImpulse);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 128) = 0xD000000000000011;
  *(_QWORD *)(v2 + 136) = 0x800000023A850880;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingDampingRatio);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 144) = 0xD000000000000016;
  *(_QWORD *)(v2 + 152) = 0x800000023A8508A0;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingResponse);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 160) = 0xD000000000000012;
  *(_QWORD *)(v2 + 168) = 0x800000023A8508C0;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingRetargetImpulse);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 176) = 0xD000000000000019;
  *(_QWORD *)(v2 + 184) = 0x800000023A8508E0;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_smoothingAndProjectionEnabled);
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 192) = 0xD00000000000001FLL;
  *(_QWORD *)(v2 + 200) = 0x800000023A850900;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_dampingRatioSmoothing);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 208) = 0xD000000000000017;
  *(_QWORD *)(v2 + 216) = 0x800000023A850920;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_responseSmoothing);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 224) = 0xD000000000000013;
  *(_QWORD *)(v2 + 232) = 0x800000023A850940;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingDampingRatioSmoothing);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 240) = 0xD00000000000001FLL;
  *(_QWORD *)(v2 + 248) = 0x800000023A850960;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_trackingResponseSmoothing);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 256) = 0xD00000000000001BLL;
  *(_QWORD *)(v2 + 264) = 0x800000023A850980;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_inertialTargetSmoothingRatio);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 272) = 0xD00000000000001ELL;
  *(_QWORD *)(v2 + 280) = 0x800000023A8509A0;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_inertialProjectionDeceleration);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 288) = 0xD000000000000020;
  *(_QWORD *)(v2 + 296) = 0x800000023A8509C0;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  v17[0] = 0xD000000000000019;
  v17[1] = 0x800000023A8509F0;
  v11 = objc_msgSend(v1, sel_preferredFrameRateRange);
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v11, sel_description);

    sub_23A84C21C();
  }
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v14 = v17[1];
  *(_QWORD *)(v2 + 304) = v17[0];
  *(_QWORD *)(v2 + 312) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2988);
  sub_23A82A7F0();
  v15 = sub_23A84C1F8();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t DRPDropletFluidBehaviorSettings.copy()@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t result;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)DRPDropletFluidBehaviorSettings), sel_init);
  objc_msgSend(v4, sel_setBehaviorType_, objc_msgSend(v2, sel_behaviorType));
  v5 = objc_msgSend(v2, sel_name);
  objc_msgSend(v4, sel_setName_, v5);

  objc_msgSend(v2, sel_deceleration);
  objc_msgSend(v4, sel_setDeceleration_);
  objc_msgSend(v2, sel_dampingRatio);
  objc_msgSend(v4, sel_setDampingRatio_);
  objc_msgSend(v2, sel_response);
  objc_msgSend(v4, sel_setResponse_);
  objc_msgSend(v2, sel_retargetImpulse);
  objc_msgSend(v4, sel_setRetargetImpulse_);
  objc_msgSend(v2, sel_trackingDampingRatio);
  objc_msgSend(v4, sel_setTrackingDampingRatio_);
  objc_msgSend(v2, sel_trackingResponse);
  objc_msgSend(v4, sel_setTrackingResponse_);
  objc_msgSend(v2, sel_trackingRetargetImpulse);
  objc_msgSend(v4, sel_setTrackingRetargetImpulse_);
  objc_msgSend(v4, sel_setSmoothingAndProjectionEnabled_, objc_msgSend(v2, sel_smoothingAndProjectionEnabled));
  objc_msgSend(v2, sel_dampingRatioSmoothing);
  objc_msgSend(v4, sel_setDampingRatioSmoothing_);
  objc_msgSend(v2, sel_responseSmoothing);
  objc_msgSend(v4, sel_setResponseSmoothing_);
  objc_msgSend(v2, sel_trackingDampingRatioSmoothing);
  objc_msgSend(v4, sel_setTrackingDampingRatioSmoothing_);
  objc_msgSend(v2, sel_trackingResponseSmoothing);
  objc_msgSend(v4, sel_setTrackingResponseSmoothing_);
  objc_msgSend(v2, sel_inertialTargetSmoothingRatio);
  objc_msgSend(v4, sel_setInertialTargetSmoothingRatio_);
  objc_msgSend(v2, sel_inertialProjectionDeceleration);
  objc_msgSend(v4, sel_setInertialProjectionDeceleration_);
  v6 = objc_msgSend(v2, sel_preferredFrameRateRange);
  objc_msgSend(v4, sel_setPreferredFrameRateRange_, v6);

  result = type metadata accessor for DRPDropletFluidBehaviorSettings(v7);
  a1[3] = result;
  *a1 = v4;
  return result;
}

BOOL DRPDropletFluidBehaviorSettings.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unsigned int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  unsigned int v57;
  id v58;
  void *v59;
  unsigned int v60;
  id v61;
  void *v62;
  unsigned int v63;
  id v64;
  void *v65;
  unsigned int v66;
  id v67;
  void *v68;
  unsigned int v69;
  id v70;
  void *v71;
  unsigned int v72;
  id v73;
  void *v74;
  unsigned int v75;
  _BOOL8 v76;
  id v78;
  void *v79;
  unsigned int v80;
  void *v82;
  _BYTE v83[24];
  uint64_t v84;

  v2 = sub_23A821C80(a1, (uint64_t)v83);
  if (!v84)
  {
    sub_23A821CC8((uint64_t)v83);
    return 0;
  }
  type metadata accessor for DRPDropletFluidBehaviorSettings(v2);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v3 = objc_msgSend(v1, sel_behaviorType);
  if (v3 != objc_msgSend(v82, sel_behaviorType))
    goto LABEL_58;
  v4 = objc_msgSend(v1, sel_name);
  if (v4)
  {
    v5 = v4;
    v6 = sub_23A84C21C();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = objc_msgSend(v82, sel_name);
  if (!v9)
  {
    if (!v8)
      goto LABEL_19;
    goto LABEL_17;
  }
  v10 = v9;
  v11 = sub_23A84C21C();
  v13 = v12;

  if (!v8)
  {
    if (!v13)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (!v13)
  {
LABEL_17:

    swift_bridgeObjectRelease();
    return 0;
  }
  if (v6 == v11 && v8 == v13)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = sub_23A84C3FC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
      goto LABEL_58;
  }
LABEL_19:
  objc_msgSend(v1, sel_deceleration);
  v16 = v15;
  objc_msgSend(v82, sel_deceleration);
  if (v16 != v17)
    goto LABEL_58;
  objc_msgSend(v1, sel_dampingRatio);
  v19 = v18;
  objc_msgSend(v82, sel_dampingRatio);
  if (v19 != v20)
    goto LABEL_58;
  objc_msgSend(v1, sel_response);
  v22 = v21;
  objc_msgSend(v82, sel_response);
  if (v22 != v23)
    goto LABEL_58;
  objc_msgSend(v1, sel_retargetImpulse);
  v25 = v24;
  objc_msgSend(v82, sel_retargetImpulse);
  if (v25 != v26)
    goto LABEL_58;
  objc_msgSend(v1, sel_trackingDampingRatio);
  v28 = v27;
  objc_msgSend(v82, sel_trackingDampingRatio);
  if (v28 != v29)
    goto LABEL_58;
  objc_msgSend(v1, sel_trackingResponse);
  v31 = v30;
  objc_msgSend(v82, sel_trackingResponse);
  if (v31 != v32)
    goto LABEL_58;
  objc_msgSend(v1, sel_trackingRetargetImpulse);
  v34 = v33;
  objc_msgSend(v82, sel_trackingRetargetImpulse);
  if (v34 != v35)
    goto LABEL_58;
  v36 = objc_msgSend(v1, sel_smoothingAndProjectionEnabled);
  if (v36 != objc_msgSend(v82, sel_smoothingAndProjectionEnabled))
    goto LABEL_58;
  objc_msgSend(v1, sel_dampingRatioSmoothing);
  v38 = v37;
  objc_msgSend(v82, sel_dampingRatioSmoothing);
  if (v38 != v39)
    goto LABEL_58;
  objc_msgSend(v1, sel_responseSmoothing);
  v41 = v40;
  objc_msgSend(v82, sel_responseSmoothing);
  if (v41 != v42)
    goto LABEL_58;
  objc_msgSend(v1, sel_trackingDampingRatioSmoothing);
  v44 = v43;
  objc_msgSend(v82, sel_trackingDampingRatioSmoothing);
  if (v44 != v45)
    goto LABEL_58;
  objc_msgSend(v1, sel_trackingResponseSmoothing);
  v47 = v46;
  objc_msgSend(v82, sel_trackingResponseSmoothing);
  if (v47 != v48)
    goto LABEL_58;
  objc_msgSend(v1, sel_inertialTargetSmoothingRatio);
  v50 = v49;
  objc_msgSend(v82, sel_inertialTargetSmoothingRatio);
  if (v50 != v51)
    goto LABEL_58;
  objc_msgSend(v1, sel_inertialProjectionDeceleration);
  v53 = v52;
  objc_msgSend(v82, sel_inertialProjectionDeceleration);
  if (v53 != v54)
    goto LABEL_58;
  v55 = objc_msgSend(v1, sel_preferredFrameRateRange);
  v56 = v55;
  if (v55)
  {
    v57 = objc_msgSend(v55, sel_highFrameRateReason);

  }
  else
  {
    v57 = 0;
  }
  v58 = objc_msgSend(v82, sel_preferredFrameRateRange);
  if (v58)
  {
    v59 = v58;
    v60 = objc_msgSend(v58, sel_highFrameRateReason);

    if (!v56 || v57 != v60)
      goto LABEL_58;
  }
  else if (v56)
  {
    goto LABEL_58;
  }
  v61 = objc_msgSend(v1, sel_preferredFrameRateRange);
  v62 = v61;
  if (v61)
  {
    v63 = objc_msgSend(v61, sel_minimum);

  }
  else
  {
    v63 = 0;
  }
  v64 = objc_msgSend(v82, sel_preferredFrameRateRange);
  if (v64)
  {
    v65 = v64;
    v66 = objc_msgSend(v64, sel_minimum);

    if (!v62 || v63 != v66)
      goto LABEL_58;
  }
  else if (v62)
  {
    goto LABEL_58;
  }
  v67 = objc_msgSend(v1, sel_preferredFrameRateRange);
  v68 = v67;
  if (v67)
  {
    v69 = objc_msgSend(v67, sel_maximum);

  }
  else
  {
    v69 = 0;
  }
  v70 = objc_msgSend(v82, sel_preferredFrameRateRange);
  if (v70)
  {
    v71 = v70;
    v72 = objc_msgSend(v70, sel_maximum);

    if (v68 && v69 == v72)
      goto LABEL_55;
LABEL_58:

    return 0;
  }
  if (v68)
    goto LABEL_58;
LABEL_55:
  v73 = objc_msgSend(v1, sel_preferredFrameRateRange);
  v74 = v73;
  if (v73)
  {
    v75 = objc_msgSend(v73, sel_preferred);

  }
  else
  {
    v75 = 0;
  }
  v78 = objc_msgSend(v82, sel_preferredFrameRateRange);
  v79 = v78;
  v76 = v78 == 0;
  if (v78)
  {
    v80 = objc_msgSend(v78, sel_preferred);

  }
  else
  {
    v80 = 0;
  }

  if (v74)
    return v79 && v75 == v80;
  return v76;
}

void _sSo31DRPDropletFluidBehaviorSettingsC9DropletUIE24settingsControllerModuleSo8PTModuleCSgyFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  unint64_t v73;
  unint64_t v74;
  void *v75;
  void *v76;
  id v77;
  unint64_t v78;
  unint64_t v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  unint64_t v85;
  unint64_t v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  unint64_t v92;
  unint64_t v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  unint64_t v99;
  unint64_t v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  unint64_t v106;
  unint64_t v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  unint64_t v113;
  unint64_t v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  unint64_t v120;
  unint64_t v121;
  void *v122;
  void *v123;
  id v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  _OWORD v139[2];
  __int128 v140;
  uint64_t v141;

  sub_23A81A1DC(0, &qword_2569C2B20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2B28);
  v0 = swift_allocObject();
  v1 = MEMORY[0x24BEE1768];
  *(_OWORD *)(v0 + 16) = xmmword_23A84E230;
  v2 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v0 + 56) = v1;
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)(v0 + 32) = 1;
  *(_QWORD *)(v0 + 96) = v1;
  *(_QWORD *)(v0 + 104) = v2;
  *(_QWORD *)(v0 + 72) = 2;
  v137 = (void *)sub_23A84C2C4();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A84E0E0;
  *(_QWORD *)(v3 + 56) = v1;
  *(_QWORD *)(v3 + 64) = v2;
  *(_QWORD *)(v3 + 32) = 2;
  v136 = (void *)sub_23A84C2C4();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23A84E0E0;
  *(_QWORD *)(v4 + 56) = v1;
  *(_QWORD *)(v4 + 64) = v2;
  *(_QWORD *)(v4 + 32) = 2;
  v135 = (void *)sub_23A84C2C4();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23A84E0E0;
  *(_QWORD *)(v5 + 56) = v1;
  *(_QWORD *)(v5 + 64) = v2;
  *(_QWORD *)(v5 + 32) = 2;
  v133 = (void *)sub_23A84C2C4();
  v6 = (void *)sub_23A84C210();
  v7 = (void *)sub_23A84C210();
  v8 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_valueKeyPath_, v6, v7);

  if (!v8)
  {
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v141 = sub_23A81A1DC(0, (unint64_t *)&unk_2569C2B30);
  *(_QWORD *)&v140 = v8;
  v9 = sub_23A84B514(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v11 = *((_QWORD *)v9 + 2);
  v10 = *((_QWORD *)v9 + 3);
  if (v11 >= v10 >> 1)
    v9 = sub_23A84B514((char *)(v10 > 1), v11 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v11 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v11 + 32]);
  v12 = (void *)sub_23A84C210();
  v13 = (void *)sub_23A84C210();
  v14 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_valueKeyPath_, v12, v13);

  if (!v14)
    goto LABEL_58;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_23A84E220;
  *(_QWORD *)(v15 + 32) = 0;
  *(_QWORD *)(v15 + 56) = v1;
  *(_QWORD *)(v15 + 64) = 1;
  *(_QWORD *)(v15 + 120) = v1;
  *(_QWORD *)(v15 + 88) = v1;
  *(_QWORD *)(v15 + 96) = 2;
  v16 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v17 = swift_allocObject();
  v18 = MEMORY[0x24BEE0D00];
  *(_OWORD *)(v17 + 16) = xmmword_23A84E220;
  *(_QWORD *)(v17 + 32) = 0x6E6F697463697246;
  *(_QWORD *)(v17 + 40) = 0xEF65636E756F4220;
  *(_QWORD *)(v17 + 56) = v18;
  *(_QWORD *)(v17 + 64) = 0x676E69727053;
  *(_QWORD *)(v17 + 72) = 0xE600000000000000;
  *(_QWORD *)(v17 + 120) = v18;
  *(_QWORD *)(v17 + 88) = v18;
  *(_QWORD *)(v17 + 96) = 0xD000000000000012;
  *(_QWORD *)(v17 + 104) = 0x800000023A850F20;
  v19 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v14, sel_possibleValues_titles_, v16, v19);

  if (!v20)
  {
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  v22 = *((_QWORD *)v9 + 2);
  v21 = *((_QWORD *)v9 + 3);
  if (v22 >= v21 >> 1)
    v9 = sub_23A84B514((char *)(v21 > 1), v22 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v22 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v22 + 32]);
  v23 = (void *)sub_23A84C210();
  v24 = (void *)sub_23A84C210();
  v25 = (void *)objc_opt_self();
  v26 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v23, v24);

  if (!v26)
    goto LABEL_60;
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_23A84E0E0;
  *(_QWORD *)(v27 + 56) = v1;
  *(_QWORD *)(v27 + 64) = v2;
  *(_QWORD *)(v27 + 32) = 0;
  v28 = (void *)sub_23A84C2C4();
  if (!objc_msgSend(v26, sel_between_and_, 0.0, 1.0))
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v139, &v140);
  v29 = sub_23A81A1DC(0, (unint64_t *)&qword_2569C2890);
  swift_dynamicCast();
  v30 = v28;
  if (!objc_msgSend(v138, sel_condition_, v30))
  {
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v139, &v140);
  swift_dynamicCast();

  v141 = v29;
  *(_QWORD *)&v140 = v138;
  v32 = *((_QWORD *)v9 + 2);
  v31 = *((_QWORD *)v9 + 3);
  if (v32 >= v31 >> 1)
    v9 = sub_23A84B514((char *)(v31 > 1), v32 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v32 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v32 + 32]);
  v33 = (void *)sub_23A84C210();
  v34 = (void *)sub_23A84C210();
  v35 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v33, v34);

  if (!v35)
    goto LABEL_63;
  v36 = v137;
  v37 = sub_23A825640(3, 0, v137);

  v141 = v29;
  *(_QWORD *)&v140 = v37;
  v39 = *((_QWORD *)v9 + 2);
  v38 = *((_QWORD *)v9 + 3);
  if (v39 >= v38 >> 1)
    v9 = sub_23A84B514((char *)(v38 > 1), v39 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v39 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v39 + 32]);
  v40 = (void *)sub_23A84C210();
  v41 = (void *)sub_23A84C210();
  v42 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v40, v41);

  if (!v42)
    goto LABEL_64;
  v43 = v36;
  v44 = sub_23A825640(3, 0, v137);

  v141 = v29;
  *(_QWORD *)&v140 = v44;
  v46 = *((_QWORD *)v9 + 2);
  v45 = *((_QWORD *)v9 + 3);
  if (v46 >= v45 >> 1)
    v9 = sub_23A84B514((char *)(v45 > 1), v46 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v46 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v46 + 32]);
  v47 = (void *)sub_23A84C210();
  v48 = (void *)sub_23A84C210();
  v49 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v47, v48);

  if (!v49)
    goto LABEL_65;
  v50 = v43;
  v51 = sub_23A825640(3, 0, v137);

  v141 = v29;
  *(_QWORD *)&v140 = v51;
  v53 = *((_QWORD *)v9 + 2);
  v52 = *((_QWORD *)v9 + 3);
  if (v53 >= v52 >> 1)
    v9 = sub_23A84B514((char *)(v52 > 1), v53 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v53 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v53 + 32]);
  v54 = (void *)sub_23A84C210();
  v55 = (void *)sub_23A84C210();
  v56 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v54, v55);

  if (!v56)
    goto LABEL_66;
  v57 = v136;
  v58 = sub_23A825640(3, 0, v136);

  v141 = v29;
  *(_QWORD *)&v140 = v58;
  v60 = *((_QWORD *)v9 + 2);
  v59 = *((_QWORD *)v9 + 3);
  if (v60 >= v59 >> 1)
    v9 = sub_23A84B514((char *)(v59 > 1), v60 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v60 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v60 + 32]);
  v61 = (void *)sub_23A84C210();
  v62 = (void *)sub_23A84C210();
  v63 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v61, v62);

  if (!v63)
    goto LABEL_67;
  v64 = v57;
  v65 = sub_23A825640(3, 0, v136);

  v141 = v29;
  *(_QWORD *)&v140 = v65;
  v67 = *((_QWORD *)v9 + 2);
  v66 = *((_QWORD *)v9 + 3);
  if (v67 >= v66 >> 1)
    v9 = sub_23A84B514((char *)(v66 > 1), v67 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v67 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v67 + 32]);
  v68 = (void *)sub_23A84C210();
  v69 = (void *)sub_23A84C210();
  v70 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v68, v69);

  if (!v70)
    goto LABEL_68;
  v71 = v50;
  v72 = sub_23A825640(3, 0, v137);

  v141 = v29;
  *(_QWORD *)&v140 = v72;
  v74 = *((_QWORD *)v9 + 2);
  v73 = *((_QWORD *)v9 + 3);
  if (v74 >= v73 >> 1)
    v9 = sub_23A84B514((char *)(v73 > 1), v74 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v74 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v74 + 32]);
  v75 = (void *)sub_23A84C210();
  v76 = (void *)sub_23A84C210();
  v77 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_valueKeyPath_, v75, v76);

  if (!v77)
    goto LABEL_69;
  v141 = sub_23A81A1DC(0, &qword_2569C2888);
  *(_QWORD *)&v140 = v77;
  v79 = *((_QWORD *)v9 + 2);
  v78 = *((_QWORD *)v9 + 3);
  if (v79 >= v78 >> 1)
    v9 = sub_23A84B514((char *)(v78 > 1), v79 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v79 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v79 + 32]);
  v80 = (void *)sub_23A84C210();
  v81 = (void *)sub_23A84C210();
  v82 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v80, v81);

  if (!v82)
    goto LABEL_70;
  v83 = v135;
  v84 = sub_23A825640(3, 0, v135);

  v141 = v29;
  *(_QWORD *)&v140 = v84;
  v86 = *((_QWORD *)v9 + 2);
  v85 = *((_QWORD *)v9 + 3);
  v134 = v64;
  if (v86 >= v85 >> 1)
    v9 = sub_23A84B514((char *)(v85 > 1), v86 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v86 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v86 + 32]);
  v87 = (void *)sub_23A84C210();
  v88 = (void *)sub_23A84C210();
  v89 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v87, v88);

  if (!v89)
    goto LABEL_71;
  v90 = v83;
  v91 = sub_23A825640(3, 0, v135);

  v141 = v29;
  *(_QWORD *)&v140 = v91;
  v93 = *((_QWORD *)v9 + 2);
  v92 = *((_QWORD *)v9 + 3);
  if (v93 >= v92 >> 1)
    v9 = sub_23A84B514((char *)(v92 > 1), v93 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v93 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v93 + 32]);
  v94 = (void *)sub_23A84C210();
  v95 = (void *)sub_23A84C210();
  v96 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v94, v95);

  if (!v96)
    goto LABEL_72;
  v97 = v133;
  v98 = sub_23A825640(3, 0, v133);

  v141 = v29;
  *(_QWORD *)&v140 = v98;
  v100 = *((_QWORD *)v9 + 2);
  v99 = *((_QWORD *)v9 + 3);
  if (v100 >= v99 >> 1)
    v9 = sub_23A84B514((char *)(v99 > 1), v100 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v100 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v100 + 32]);
  v101 = (void *)sub_23A84C210();
  v102 = (void *)sub_23A84C210();
  v103 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v101, v102);

  if (!v103)
    goto LABEL_73;
  v104 = v97;
  v105 = sub_23A825640(3, 0, v133);

  v141 = v29;
  *(_QWORD *)&v140 = v105;
  v107 = *((_QWORD *)v9 + 2);
  v106 = *((_QWORD *)v9 + 3);
  if (v107 >= v106 >> 1)
    v9 = sub_23A84B514((char *)(v106 > 1), v107 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v107 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v107 + 32]);
  v108 = (void *)sub_23A84C210();
  v109 = (void *)sub_23A84C210();
  v110 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v108, v109);

  if (!v110)
    goto LABEL_74;
  v111 = v104;
  v112 = sub_23A825640(3, 0, v133);

  v141 = v29;
  *(_QWORD *)&v140 = v112;
  v114 = *((_QWORD *)v9 + 2);
  v113 = *((_QWORD *)v9 + 3);
  if (v114 >= v113 >> 1)
    v9 = sub_23A84B514((char *)(v113 > 1), v114 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v114 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v114 + 32]);
  v115 = (void *)sub_23A84C210();
  v116 = (void *)sub_23A84C210();
  v117 = objc_msgSend(v25, sel_rowWithTitle_valueKeyPath_, v115, v116);

  if (!v117)
    goto LABEL_75;
  v118 = v111;
  v119 = sub_23A825640(7, 0, v133);

  v141 = v29;
  *(_QWORD *)&v140 = v119;
  v121 = *((_QWORD *)v9 + 2);
  v120 = *((_QWORD *)v9 + 3);
  if (v121 >= v120 >> 1)
    v9 = sub_23A84B514((char *)(v120 > 1), v121 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v121 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v121 + 32]);
  v122 = (void *)sub_23A84C210();
  v123 = (void *)sub_23A84C210();
  v124 = objc_msgSend((id)objc_opt_self(), sel_rowWithTitle_childSettingsKeyPath_, v122, v123);

  if (!v124)
    goto LABEL_76;
  v141 = sub_23A81A1DC(0, &qword_2569C2898);
  *(_QWORD *)&v140 = v124;
  v126 = *((_QWORD *)v9 + 2);
  v125 = *((_QWORD *)v9 + 3);
  if (v126 >= v125 >> 1)
    v9 = sub_23A84B514((char *)(v125 > 1), v126 + 1, 1, v9);
  *((_QWORD *)v9 + 2) = v126 + 1;
  sub_23A81A1CC(&v140, &v9[32 * v126 + 32]);
  v127 = swift_allocObject();
  *(_OWORD *)(v127 + 16) = xmmword_23A84E0E0;
  v128 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v129 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v130 = (void *)sub_23A84C210();
  v131 = objc_msgSend(v128, sel_sectionWithRows_title_, v129, v130);

  if (v131)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v127 + 56) = sub_23A81A1DC(0, &qword_2569C28A0);
    *(_QWORD *)(v127 + 32) = v131;
    v132 = (void *)sub_23A84C258();
    swift_bridgeObjectRelease();
    objc_msgSend(v128, sel_moduleWithTitle_contents_, 0, v132);

    return;
  }
LABEL_77:
  __break(1u);
}

unint64_t sub_23A82A7F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C2990;
  if (!qword_2569C2990)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569C2988);
    result = MEMORY[0x23B85857C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2569C2990);
  }
  return result;
}

uint64_t type metadata accessor for DRPDropletFluidBehaviorSettings(uint64_t a1)
{
  return sub_23A81A1DC(a1, &qword_2569C2B18);
}

char *keypath_get_selector_behaviorType()
{
  return sel_behaviorType;
}

id sub_23A82A85C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_behaviorType);
  *a2 = result;
  return result;
}

id sub_23A82A88C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBehaviorType_, *a1);
}

char *keypath_get_selector_name()
{
  return sel_name;
}

char *keypath_get_selector_deceleration()
{
  return sel_deceleration;
}

id sub_23A82A8C0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_deceleration);
  *a2 = v4;
  return result;
}

id sub_23A82A8F0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeceleration_, *a1);
}

char *keypath_get_selector_dampingRatio()
{
  return sel_dampingRatio;
}

id sub_23A82A910@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_dampingRatio);
  *a2 = v4;
  return result;
}

id sub_23A82A940(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDampingRatio_, *a1);
}

char *keypath_get_selector_response()
{
  return sel_response;
}

id sub_23A82A960@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_response);
  *a2 = v4;
  return result;
}

id sub_23A82A990(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResponse_, *a1);
}

char *keypath_get_selector_retargetImpulse()
{
  return sel_retargetImpulse;
}

id sub_23A82A9B0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_retargetImpulse);
  *a2 = v4;
  return result;
}

id sub_23A82A9E0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRetargetImpulse_, *a1);
}

char *keypath_get_selector_trackingDampingRatio()
{
  return sel_trackingDampingRatio;
}

id sub_23A82AA00@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingDampingRatio);
  *a2 = v4;
  return result;
}

id sub_23A82AA30(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingDampingRatio_, *a1);
}

char *keypath_get_selector_trackingResponse()
{
  return sel_trackingResponse;
}

id sub_23A82AA50@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingResponse);
  *a2 = v4;
  return result;
}

id sub_23A82AA80(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingResponse_, *a1);
}

char *keypath_get_selector_trackingRetargetImpulse()
{
  return sel_trackingRetargetImpulse;
}

id sub_23A82AAA0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingRetargetImpulse);
  *a2 = v4;
  return result;
}

id sub_23A82AAD0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingRetargetImpulse_, *a1);
}

char *keypath_get_selector_smoothingAndProjectionEnabled()
{
  return sel_smoothingAndProjectionEnabled;
}

id sub_23A82AAF0@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_smoothingAndProjectionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A82AB20(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSmoothingAndProjectionEnabled_, *a1);
}

char *keypath_get_selector_dampingRatioSmoothing()
{
  return sel_dampingRatioSmoothing;
}

id sub_23A82AB40@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_dampingRatioSmoothing);
  *a2 = v4;
  return result;
}

id sub_23A82AB70(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDampingRatioSmoothing_, *a1);
}

char *keypath_get_selector_responseSmoothing()
{
  return sel_responseSmoothing;
}

id sub_23A82AB90@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_responseSmoothing);
  *a2 = v4;
  return result;
}

id sub_23A82ABC0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResponseSmoothing_, *a1);
}

char *keypath_get_selector_trackingDampingRatioSmoothing()
{
  return sel_trackingDampingRatioSmoothing;
}

id sub_23A82ABE0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingDampingRatioSmoothing);
  *a2 = v4;
  return result;
}

id sub_23A82AC10(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingDampingRatioSmoothing_, *a1);
}

char *keypath_get_selector_trackingResponseSmoothing()
{
  return sel_trackingResponseSmoothing;
}

id sub_23A82AC30@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trackingResponseSmoothing);
  *a2 = v4;
  return result;
}

id sub_23A82AC60(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackingResponseSmoothing_, *a1);
}

char *keypath_get_selector_inertialTargetSmoothingRatio()
{
  return sel_inertialTargetSmoothingRatio;
}

id sub_23A82AC80@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_inertialTargetSmoothingRatio);
  *a2 = v4;
  return result;
}

id sub_23A82ACB0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInertialTargetSmoothingRatio_, *a1);
}

char *keypath_get_selector_inertialProjectionDeceleration()
{
  return sel_inertialProjectionDeceleration;
}

id sub_23A82ACD0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_inertialProjectionDeceleration);
  *a2 = v4;
  return result;
}

id sub_23A82AD00(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInertialProjectionDeceleration_, *a1);
}

char *keypath_get_selector_preferredFrameRateRange()
{
  return sel_preferredFrameRateRange;
}

id sub_23A82AD20@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_preferredFrameRateRange);
  *a2 = result;
  return result;
}

id sub_23A82AD58(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferredFrameRateRange_, *a1);
}

void sub_23A82AD6C(double a1)
{
  char *v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  char *v7;

  v2 = (char *)sub_23A82C82C();
  v3 = *(double *)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThreshouldInputAmount];
  *(double *)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThreshouldInputAmount] = a1;
  if (v3 != a1)
  {
    v7 = v2;
    if (a1 > 0.0 == v3 <= 0.0)
    {
      sub_23A82F7C0();
      v2 = v7;
    }
    v4 = objc_msgSend(v2, sel_layer);
    v5 = (void *)sub_23A84C18C();
    if (qword_2569C25A0 != -1)
      swift_once();
    v6 = sub_23A84C210();
    objc_msgSend(v4, sel_setValue_forKeyPath_, v5, v6);

    v2 = (char *)v6;
  }

}

void sub_23A82AE78(double a1)
{
  char *v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  char *v7;

  v2 = (char *)sub_23A82C768();
  v3 = *(double *)&v2[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius];
  *(double *)&v2[OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius] = a1;
  if (v3 != a1)
  {
    v7 = v2;
    if (a1 <= 0.0 == v3 > 0.0)
    {
      sub_23A814EB0();
      v2 = v7;
    }
    v4 = objc_msgSend(v2, sel_layer);
    v5 = (void *)sub_23A84C18C();
    if (qword_2569C2570 != -1)
      swift_once();
    v6 = sub_23A84C210();
    objc_msgSend(v4, sel_setValue_forKeyPath_, v5, v6);

    v2 = (char *)v6;
  }

}

uint64_t sub_23A82AF84()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_23A82B0F8();
  v1 = v0;
  v8 = MEMORY[0x24BEE4AF8];
  if (!(v0 >> 62))
  {
    v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease();
    return v7;
  }
  swift_bridgeObjectRetain();
  result = sub_23A84C3B4();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x23B858090](i, v1);
      else
        v5 = *(id *)(v1 + 8 * i + 32);
      v6 = v5;
      type metadata accessor for DropletParticipantView();
      if (swift_dynamicCastClass())
      {
        MEMORY[0x23B857FA0]();
        if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_23A84C27C();
        sub_23A84C288();
        sub_23A84C270();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    v7 = v8;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A82B0F8()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  unint64_t v5;
  id v6;
  id v7;
  unint64_t v8;

  v0 = sub_23A82C740();
  v1 = objc_msgSend(v0, sel_subviews);

  sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
  v2 = sub_23A84C264();

  v3 = sub_23A82C82C();
  v4 = objc_msgSend(v3, sel_subviews);

  v5 = sub_23A84C264();
  sub_23A8422AC(v5);
  v6 = sub_23A82C754();
  v7 = objc_msgSend(v6, sel_subviews);

  v8 = sub_23A84C264();
  sub_23A8422AC(v8);
  return v2;
}

_BYTE *sub_23A82B220(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  char v7;
  id v8;
  _BYTE *v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  _QWORD *v17;

  v7 = a2 & 1;
  v8 = sub_23A82C740();
  v9 = sub_23A82C388(v8, a1, v7, a3, a4);

  v10 = sub_23A82C754();
  sub_23A82BCA4(v10, a1, v7);

  v11 = sub_23A82C82C();
  v12 = sub_23A82BCA4(v11, a1, v7);

  v13 = swift_unknownObjectWeakAssign();
  v14 = MEMORY[0x23B858660](v13);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 80] != 2;
    v17 = v12;
    objc_msgSend(v15, sel_setHidden_, v16);

  }
  return v9;
}

void sub_23A82B334(double a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  char *v11;
  char *v12;
  double v14;
  uint64_t v15;
  double v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE v31[216];
  _QWORD v32[28];

  v2 = OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence;
  v3 = *(double *)(v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);
  *(double *)(v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence) = a1;
  if (v3 != a1)
  {
    v4 = v1;
    sub_23A82E744(v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v31, &qword_2569C2C00);
    sub_23A82E744((uint64_t)v31, (uint64_t)v32, &qword_2569C2C00);
    sub_23A82E734(v32);
    v5 = sub_23A82AF84();
    v6 = v5;
    if (v5 >> 62)
      goto LABEL_21;
    v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; v7 = sub_23A84C3B4())
    {
      v8 = 0;
      v9 = v6 & 0xC000000000000001;
      v30 = v6 + 32;
      v10 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v26 = v2;
      v27 = v6 & 0xC000000000000001;
      v28 = v7;
      v29 = v4;
      while (1)
      {
        v11 = v9 ? (char *)MEMORY[0x23B858090](v8, v6) : (char *)*(id *)(v30 + 8 * v8);
        v12 = v11;
        if (__OFADD__(v8++, 1))
          break;
        v14 = *(double *)(v4 + v2);
        v15 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence;
        v16 = *(double *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence];
        *(double *)&v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence] = v14;
        if (v14 == v16)
        {

        }
        else
        {
          v17 = v6;
          v18 = &v11[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          v19 = *(_QWORD *)(*(_QWORD *)v18 + 16);
          if (v19)
          {
            v20 = *(_QWORD *)v18 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_23A82E960(v20, (uint64_t)v31);
              v21 = (_QWORD *)MEMORY[0x23B858660](v31);
              if (v21)
              {
                v22 = v21;
                (*(void (**)(double))((*v10 & *v21) + 0x68))(*(double *)&v12[v15]);

              }
              sub_23A825594((uint64_t)v31, &qword_2569C2C40);
              v20 += 8;
              --v19;
            }
            while (v19);

            swift_bridgeObjectRelease_n();
            v2 = v26;
          }
          else
          {

          }
          v6 = v17;
          v7 = v28;
          v4 = v29;
          v9 = v27;
        }
        if (v8 == v7)
          goto LABEL_22;
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
    }
LABEL_22:
    swift_bridgeObjectRelease_n();
    v23 = sub_23A82C740();
    sub_23A8148E8(*(double *)(v4 + v2));

    v24 = sub_23A82C82C();
    sub_23A8148E8(*(double *)(v4 + v2));

    v25 = sub_23A82C754();
    sub_23A8148E8(*(double *)(v4 + v2));

  }
}

id sub_23A82B5C0(void *a1, double a2, double a3, double a4, double a5, double a6)
{
  void *v6;
  uint64_t v13;
  void *v14;
  char *v15;
  id v16;
  unsigned __int8 v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  double v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  objc_super v41;
  _BYTE v42[216];

  swift_getObjectType();
  v13 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters;
  v14 = (void *)objc_opt_self();
  v15 = v6;
  v16 = objc_msgSend(v14, sel_rootSettings);
  v17 = objc_msgSend(v16, sel_suppressDropletEffectFilters);

  *((_BYTE *)v6 + v13) = v17;
  v18 = &v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___mainEffectView] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___shadowEffectView] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView] = 0;
  v19 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes;
  *(_QWORD *)&v15[v19] = sub_23A821D08(MEMORY[0x24BEE4AF8]);

  v20 = (uint64_t)&v15[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry];
  sub_23A82E3C4((uint64_t)v42);
  sub_23A82E744((uint64_t)v42, v20, &qword_2569C2C00);
  *(double *)&v15[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence] = a6;
  v41.receiver = v15;
  v41.super_class = (Class)type metadata accessor for DropletParticipantTrackingView();
  v21 = objc_msgSendSuper2(&v41, sel_initWithFrame_, a2, a3, a4, a5);
  v22 = objc_msgSend(v14, sel_rootSettings);
  objc_msgSend(v22, sel_addKeyObserver_, v21);

  v23 = sub_23A82C754();
  objc_msgSend(a1, sel_addSubview_, v23);

  v24 = sub_23A82C768();
  v25 = sub_23A82C82C();
  objc_msgSend(v24, sel_addSubview_, v25);

  v26 = v21;
  v27 = sub_23A82C768();
  objc_msgSend(v26, sel_addSubview_, v27);

  v28 = v26;
  v29 = sub_23A82C740();
  objc_msgSend(v28, sel_addSubview_, v29);

  v30 = objc_msgSend(v28, sel_traitCollection);
  objc_msgSend(v30, sel_displayScale);
  v32 = v31;

  v33 = objc_msgSend(v28, sel_layer);
  objc_msgSend(v33, sel_setRasterizationScale_, v32);

  v34 = sub_23A82C754();
  v35 = objc_msgSend(v34, sel_layer);

  objc_msgSend(v35, sel_setRasterizationScale_, v32);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C2C08);
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_23A84E0E0;
  v37 = sub_23A84C1E0();
  v38 = MEMORY[0x24BEBC250];
  *(_QWORD *)(v36 + 32) = v37;
  *(_QWORD *)(v36 + 40) = v38;
  v39 = v28;
  sub_23A84C2E8();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_23A82C91C();
  sub_23A82D03C();
  sub_23A82D22C();

  return v39;
}

uint64_t sub_23A82B95C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v3 = v2;
  v6 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes;
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  sub_23A82E6C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_23A8210B4(a2, a1, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v3 + v6);
  *(_QWORD *)(v3 + v6) = v7;
  v10 = swift_bridgeObjectRetain();
  sub_23A82D704(v10, v9);
  LOBYTE(a1) = v11;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
  {
    sub_23A82C91C();
    sub_23A82D03C();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A82BA1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v2 = v1;
  v3 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  v5 = sub_23A82010C(a1);
  v7 = v6;
  swift_bridgeObjectRetain();
  if ((v7 & 1) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_23A821598();
    v8 = *(_QWORD *)(v4 + 56) + 88 * v5;
    v23 = *(_QWORD *)(v8 + 8);
    v24 = *(void **)v8;
    v9 = *(_QWORD *)(v8 + 32);
    v21 = *(_QWORD *)(v8 + 24);
    v22 = *(_QWORD *)(v8 + 16);
    v10 = *(_QWORD *)(v8 + 40);
    v11 = *(_QWORD *)(v8 + 48);
    v12 = *(_QWORD *)(v8 + 64);
    v20 = *(_QWORD *)(v8 + 56);
    v13 = *(_QWORD *)(v8 + 72);
    v14 = *(_BYTE *)(v8 + 80);
    sub_23A82E214(v5, v4);
    swift_bridgeObjectRelease();
    sub_23A82E644(v24, v23, v22, v21, v9, v10, v11, v20, v12, v13, v14);
  }
  v15 = *(_QWORD *)(v2 + v3);
  *(_QWORD *)(v2 + v3) = v4;
  v16 = swift_bridgeObjectRetain();
  sub_23A82D704(v16, v15);
  v18 = v17;
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    sub_23A82C91C();
    sub_23A82D03C();
  }
  return swift_bridgeObjectRelease();
}

void sub_23A82BBBC()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for DropletGroupView();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  v1 = sub_23A82C768();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  v2 = sub_23A82C82C();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  v3 = sub_23A82C740();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);

}

_QWORD *sub_23A82BCA4(void *a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  void *v18;
  double v19;
  char *v20;
  double v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  objc_class *v28;
  id v29;
  char *v30;
  _QWORD *v31;
  id v32;
  char *v33;
  _QWORD *v34;
  id v35;
  char *v36;
  _QWORD *v37;
  id v38;
  _QWORD *v39;
  uint64_t inited;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  id v46;
  id v47;
  char *v48;
  char *v49;
  char *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  void *v60;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v62;
  unint64_t v63;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  char *v70;
  char v72[8];
  _BYTE v73[216];
  _OWORD v74[13];
  uint64_t v75;
  objc_super v76;
  _OWORD v77[13];
  uint64_t v78;
  CGRect v79;
  CGRect v80;

  v65 = a2;
  v5 = OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence;
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);
  v7 = (objc_class *)type metadata accessor for DropletParticipantView();
  v8 = (char *)objc_allocWithZone(v7);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = 0;
  v9 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
  v10 = *MEMORY[0x24BEBE158];
  v11 = *(_QWORD *)(MEMORY[0x24BEBE158] + 8);
  v12 = *(_QWORD *)(MEMORY[0x24BEBE158] + 16);
  v13 = *(_QWORD *)(MEMORY[0x24BEBE158] + 24);
  *(_QWORD *)v9 = *MEMORY[0x24BEBE158];
  *((_QWORD *)v9 + 1) = v11;
  *((_QWORD *)v9 + 2) = v12;
  *((_QWORD *)v9 + 3) = v13;
  v14 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
  *(_QWORD *)v14 = v10;
  *((_QWORD *)v14 + 1) = v11;
  *((_QWORD *)v14 + 2) = v12;
  *((_QWORD *)v14 + 3) = v13;
  v15 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets];
  *(_QWORD *)v15 = v10;
  *((_QWORD *)v15 + 1) = v11;
  *((_QWORD *)v15 + 2) = v12;
  *((_QWORD *)v15 + 3) = v13;
  v16 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
  *((_OWORD *)v16 + 3) = 0u;
  *((_OWORD *)v16 + 4) = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  *(_OWORD *)v16 = 0u;
  v16[80] = 1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation] = 0x3FF0000000000000;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence] = v6;
  v76.receiver = v8;
  v76.super_class = v7;
  v17 = (char *)objc_msgSendSuper2(&v76, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v18 = v17;
  v19 = *(double *)(v3 + v5);
  v20 = (char *)OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence;
  v21 = *(double *)&v17[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence];
  *(double *)&v17[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence] = v19;
  if (v19 != v21)
  {
    v22 = &v17[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
    swift_beginAccess();
    v23 = *(_QWORD *)(*(_QWORD *)v22 + 16);
    if (v23)
    {
      v24 = *(_QWORD *)v22 + 32;
      swift_bridgeObjectRetain();
      v25 = (_QWORD *)MEMORY[0x24BEE4EA0];
      do
      {
        v26 = (_QWORD *)MEMORY[0x23B858660](v24);
        if (v26)
        {
          v27 = v26;
          (*(void (**)(double))((*v25 & *v26) + 0x68))(*(double *)&v20[(_QWORD)v18]);

        }
        v24 += 8;
        --v23;
      }
      while (v23);
      swift_bridgeObjectRelease();
    }
  }
  v28 = (objc_class *)type metadata accessor for DropletBoundaryView();
  v29 = objc_allocWithZone(v28);
  v30 = v18;
  v31 = sub_23A84BDA4(v30, 1);
  v32 = objc_allocWithZone(v28);
  v33 = v30;
  v34 = sub_23A84BDA4(v33, 2);
  v35 = objc_allocWithZone(v28);
  v36 = v33;
  v37 = sub_23A84BDA4(v36, 4);
  v38 = objc_allocWithZone(v28);
  v70 = v36;
  v39 = sub_23A84BDA4(v70, 8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A84E3C0;
  *(_QWORD *)(inited + 32) = v31;
  *(_QWORD *)(inited + 40) = v34;
  *(_QWORD *)(inited + 48) = v37;
  *(_QWORD *)(inited + 56) = v39;
  *(_QWORD *)&v77[0] = inited;
  v41 = v77;
  sub_23A84C270();
  v42 = *(_QWORD *)&v77[0];
  v43 = *(_QWORD *)&v77[0] & 0xC000000000000001;
  if ((*(_QWORD *)&v77[0] & 0xC000000000000001) == 0
    && *(_QWORD *)((*(_QWORD *)&v77[0] & 0xFFFFFFFFFFFFF8) + 0x10) < 4uLL)
  {
    __break(1u);
LABEL_31:
    v41 = sub_23A84B618(0, v41[2] + 1, 1, v41);
    *(_QWORD *)v20 = v41;
    goto LABEL_27;
  }
  v69 = v31;
  v68 = v34;
  v67 = v37;
  v66 = v39;
  v44 = 0;
  do
  {
    if (v43)
      v48 = (char *)MEMORY[0x23B858090](v44, v42);
    else
      v48 = (char *)*(id *)(v42 + 8 * v44 + 32);
    v49 = v48;
    objc_msgSend(a1, sel_bounds, v65);
    v80 = *(CGRect *)&v49[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds];
    *(CGRect *)&v49[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds] = v79;
    if (!CGRectEqualToRect(v79, v80))
    {
      sub_23A82E744((uint64_t)&v49[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry], (uint64_t)v73, &qword_2569C2C00);
      sub_23A82E744((uint64_t)v73, (uint64_t)v74, &qword_2569C2C00);
      if (!sub_23A82E734(v74))
      {
        v77[10] = v74[10];
        v77[11] = v74[11];
        v77[12] = v74[12];
        v78 = v75;
        v77[6] = v74[6];
        v77[7] = v74[7];
        v77[8] = v74[8];
        v77[9] = v74[9];
        v77[2] = v74[2];
        v77[3] = v74[3];
        v77[4] = v74[4];
        v77[5] = v74[5];
        v77[0] = v74[0];
        v77[1] = v74[1];
        sub_23A84BA94((double *)v77);
      }
    }
    ++v44;
    v45 = (char *)sub_23A82C740();
    v46 = *(id *)&v45[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor];

    v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v46);
    objc_msgSend(v49, sel_setBackgroundColor_, v47);

    objc_msgSend(a1, sel_addSubview_, v49);
  }
  while (v44 != 4);
  swift_bridgeObjectRelease();
  v50 = (char *)sub_23A82C740();
  v51 = *(id *)&v50[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor];

  v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v51);
  v37 = v70;
  objc_msgSend(v70, sel_setBackgroundColor_, v52);

  objc_msgSend(a1, sel_addSubview_, v70);
  if ((a3 & 1) == 0)
  {
    v53 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges;
    v54 = *(_QWORD *)&v70[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges];
    *(_QWORD *)&v70[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = v65;
    if (v54 != v65)
    {
      v55 = &v70[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
      swift_beginAccess();
      v56 = *(_QWORD *)(*(_QWORD *)v55 + 16);
      if (v56)
      {
        v57 = *(_QWORD *)v55 + 32;
        swift_bridgeObjectRetain();
        v58 = (_QWORD *)MEMORY[0x24BEE4EA0];
        do
        {
          v59 = (_QWORD *)MEMORY[0x23B858660](v57);
          if (v59)
          {
            v60 = v59;
            (*(void (**)(char *, _QWORD))((*v58 & *v59) + 0xC0))(v70, *(_QWORD *)&v70[v53]);

          }
          v57 += 8;
          --v56;
        }
        while (v56);
        swift_bridgeObjectRelease();
      }
    }
  }
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  sub_23A82E744((uint64_t)v74, (uint64_t)v72, &qword_2569C2C40);
  v20 = &v70[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
  swift_beginAccess();
  v41 = *(_QWORD **)v20;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v20 = v41;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_31;
LABEL_27:
  v63 = v41[2];
  v62 = v41[3];
  if (v63 >= v62 >> 1)
  {
    v41 = sub_23A84B618((_QWORD *)(v62 > 1), v63 + 1, 1, v41);
    *(_QWORD *)v20 = v41;
  }
  v41[2] = v63 + 1;
  sub_23A82E744((uint64_t)v72, (uint64_t)&v41[v63 + 4], &qword_2569C2C40);

  return v37;
}

_BYTE *sub_23A82C388(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v7;
  _BYTE *v8;
  float64x2_t *v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  void (*v35)(_BYTE *, _BYTE *);
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _BYTE v44[88];
  _BYTE v45[88];
  float64x2_t v46[2];
  char v47;
  _BYTE v48[88];
  _BYTE v49[88];
  _BYTE v50[96];

  v7 = sub_23A82BCA4(a1, a2, a3 & 1);
  objc_allocWithZone((Class)type metadata accessor for DropletBackgroundView());
  v8 = v7;
  sub_23A8468E4(v8);
  sub_23A82E744(a4, (uint64_t)v46, &qword_2569C2C28);
  if ((v47 & 1) == 0)
  {
    v9 = (float64x2_t *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
    v10 = v46[1];
    v11 = v46[0];
    v12 = *(float64x2_t *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
    v13 = *(float64x2_t *)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
    *v9 = v46[0];
    v9[1] = v10;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v11, v12), (int32x4_t)vceqq_f64(v10, v13))), 0xFuLL))) & 1) == 0)
    {
      v14 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
      swift_beginAccess();
      v15 = *(_QWORD *)(*(_QWORD *)v14 + 16);
      if (v15)
      {
        v16 = *(_QWORD *)v14 + 32;
        swift_bridgeObjectRetain();
        v17 = (_QWORD *)MEMORY[0x24BEE4EA0];
        do
        {
          v18 = (_QWORD *)MEMORY[0x23B858660](v16);
          if (v18)
          {
            v19 = v18;
            (*(void (**)(_BYTE *, float64_t, float64_t, float64_t, float64_t))((*v17 & *v18) + 0xD0))(v8, v9->f64[0], v9->f64[1], v9[1].f64[0], v9[1].f64[1]);

          }
          v16 += 8;
          --v15;
        }
        while (v15);
        swift_bridgeObjectRelease();
      }
    }
  }
  sub_23A82E744(a5, (uint64_t)v44, (uint64_t *)&unk_2569C2C30);
  if (v44[80] != 255)
  {
    sub_23A822438((uint64_t)v44, (uint64_t)v45);
    v20 = (uint64_t)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
    sub_23A822438((uint64_t)&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType], (uint64_t)v50);
    v21 = *(_QWORD *)(v20 + 16);
    v42 = *(_QWORD *)(v20 + 8);
    v43 = *(void **)v20;
    v22 = *(_QWORD *)(v20 + 32);
    v23 = *(_QWORD *)(v20 + 40);
    v40 = *(_QWORD *)(v20 + 48);
    v41 = *(_QWORD *)(v20 + 24);
    v24 = *(_QWORD *)(v20 + 64);
    v39 = *(_QWORD *)(v20 + 56);
    v25 = *(_QWORD *)(v20 + 72);
    v26 = *(_BYTE *)(v20 + 80);
    sub_23A822438((uint64_t)v45, v20);
    sub_23A82E6C0(a5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E6A0);
    sub_23A82E6C0(a5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E6A0);
    sub_23A82E6C0((uint64_t)v50, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
    sub_23A82E644(v43, v42, v21, v41, v22, v23, v40, v39, v24, v25, v26);
    sub_23A822438(v20, (uint64_t)v49);
    sub_23A82E6C0((uint64_t)v49, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
    v27 = sub_23A848068((uint64_t)v49, (uint64_t)v50);
    sub_23A82E6C0((uint64_t)v49, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);
    if ((v27 & 1) == 0)
    {
      v28 = &v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
      swift_beginAccess();
      v29 = *(_QWORD *)v28;
      v30 = *(_QWORD *)(*(_QWORD *)v28 + 16);
      if (v30)
      {
        v31 = v29 + 32;
        swift_bridgeObjectRetain();
        v32 = (_QWORD *)MEMORY[0x24BEE4EA0];
        do
        {
          v33 = MEMORY[0x23B858660](v31);
          if (v33)
          {
            v34 = (_QWORD *)v33;
            sub_23A822438(v20, (uint64_t)v48);
            v35 = *(void (**)(_BYTE *, _BYTE *))((*v32 & *v34) + 0xE0);
            sub_23A82E6C0((uint64_t)v48, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
            v35(v8, v48);
            sub_23A82E6C0((uint64_t)v48, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);

          }
          v31 += 8;
          --v30;
        }
        while (v30);
        swift_bridgeObjectRelease();
      }
      v36 = (void *)MEMORY[0x23B858660](&v8[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineParticipantView]);
      if (v36)
      {
        v37 = v36;
        objc_msgSend(v36, sel_setHidden_, *(unsigned __int8 *)(v20 + 80) != 2);

      }
    }
    sub_23A82E6C0(a5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E714);
    sub_23A82E6C0((uint64_t)v50, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);
  }
  return v8;
}

id sub_23A82C740()
{
  return sub_23A82C77C(&OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___mainEffectView, (uint64_t (*)(_QWORD))type metadata accessor for DropletEffectView);
}

id sub_23A82C754()
{
  return sub_23A82C77C(&OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___shadowEffectView, (uint64_t (*)(_QWORD))type metadata accessor for DropletEffectView);
}

id sub_23A82C768()
{
  return sub_23A82C77C(&OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView, (uint64_t (*)(_QWORD))type metadata accessor for BlurredView);
}

id sub_23A82C77C(uint64_t *a1, uint64_t (*a2)(_QWORD))
{
  char *v2;
  uint64_t v3;
  void *v4;
  id v5;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;

  v3 = *a1;
  v4 = *(void **)&v2[*a1];
  if (v4)
  {
    v5 = *(id *)&v2[*a1];
  }
  else
  {
    objc_msgSend(v2, sel_bounds);
    v11 = objc_msgSend(objc_allocWithZone((Class)a2(0)), sel_initWithFrame_, v7, v8, v9, v10);
    v12 = *(void **)&v2[v3];
    *(_QWORD *)&v2[v3] = v11;
    v5 = v11;

    v4 = 0;
  }
  v13 = v4;
  return v5;
}

id sub_23A82C82C()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v11;

  v1 = OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView];
  }
  else
  {
    v4 = v0;
    objc_msgSend(v0, sel_bounds);
    v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DropletEffectView()), sel_initWithFrame_, v5, v6, v7, v8);
    if (qword_2569C2588 != -1)
      swift_once();
    sub_23A82E9A8((id)qword_2569C3BA0);
    v10 = *(void **)&v4[v1];
    *(_QWORD *)&v4[v1] = v9;
    v3 = v9;

    v2 = 0;
  }
  v11 = v2;
  return v3;
}

void sub_23A82C91C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char v28;
  id v29;
  unsigned __int8 v30;
  id v31;
  unsigned __int8 v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v38;
  unsigned int v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  char v50;
  char *v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  uint64_t v59;
  double v60;
  id v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  _OWORD v65[2];
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  v2 = 1 << *(_BYTE *)(v1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(v1 + 64);
  v53 = (unint64_t)(v2 + 63) >> 6;
  v59 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  swift_bridgeObjectRetain_n();
  v7 = 0;
  while (v4)
  {
    v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v9 = v8 | (v7 << 6);
LABEL_26:
    v13 = *(_QWORD *)(v59 + 56) + 88 * v9;
    if (*(_BYTE *)(v13 + 80) != 1)
    {
LABEL_31:
      swift_release();
      swift_bridgeObjectRelease();
      v28 = 1;
      goto LABEL_33;
    }
    v14 = *(void **)v13;
    if (*(_QWORD *)v13)
    {
      v15 = *(_QWORD *)(v13 + 8);
      v16 = *(_QWORD *)(v13 + 16);
      v18 = *(_QWORD *)(v13 + 24);
      v17 = *(_QWORD *)(v13 + 32);
      v19 = *(_QWORD *)(v13 + 48);
      v57 = *(_QWORD *)(v13 + 40);
      v58 = v7;
      v20 = *(_QWORD *)(v13 + 64);
      v56 = *(_QWORD *)(v13 + 56);
      v21 = *(_QWORD *)(v13 + 72);
      v22 = (void *)objc_opt_self();
      v61 = v14;
      v23 = objc_msgSend(v22, sel_clearColor);
      if (v23)
      {
        v24 = v23;
        sub_23A81A1DC(0, (unint64_t *)&qword_2569C29B0);
        v54 = v17;
        v25 = v17;
        v26 = v21;
        sub_23A8223E8(v14, v15, v16, v18, v25, v57, v19, v56, v20, v21, 1);
        v27 = v24;
        v55 = sub_23A84C300();
        sub_23A82E644(v14, v15, v16, v18, v54, v57, v19, v56, v20, v26, 1);

        sub_23A82E644(v14, v15, v16, v18, v54, v57, v19, v56, v20, v26, 1);
        v7 = v58;
        if ((v55 & 1) == 0)
          goto LABEL_5;
      }
      else
      {
        sub_23A82E644(v14, v15, v16, v18, v17, v57, v19, v56, v20, v21, 1);
        v7 = v58;
LABEL_5:
        *(_QWORD *)&v66 = 0;
        objc_msgSend(v61, sel_getRed_green_blue_alpha_, 0, 0, 0, &v66);
        v5 = *(double *)&v66;
        if (*(double *)&v66 != 0.0)
          goto LABEL_31;
      }
    }
  }
  v10 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_62;
  }
  if (v10 >= v53)
    goto LABEL_32;
  v11 = *(_QWORD *)(v52 + 8 * v10);
  ++v7;
  if (v11)
    goto LABEL_25;
  v7 = v10 + 1;
  if (v10 + 1 >= v53)
    goto LABEL_32;
  v11 = *(_QWORD *)(v52 + 8 * v7);
  if (v11)
    goto LABEL_25;
  v7 = v10 + 2;
  if (v10 + 2 >= v53)
    goto LABEL_32;
  v11 = *(_QWORD *)(v52 + 8 * v7);
  if (v11)
    goto LABEL_25;
  v7 = v10 + 3;
  if (v10 + 3 >= v53)
    goto LABEL_32;
  v11 = *(_QWORD *)(v52 + 8 * v7);
  if (v11)
    goto LABEL_25;
  v7 = v10 + 4;
  if (v10 + 4 >= v53)
    goto LABEL_32;
  v11 = *(_QWORD *)(v52 + 8 * v7);
  if (v11)
    goto LABEL_25;
  v12 = v10 + 5;
  if (v12 >= v53)
    goto LABEL_32;
  v11 = *(_QWORD *)(v52 + 8 * v12);
  if (v11)
  {
    v7 = v12;
LABEL_25:
    v4 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v7 << 6);
    goto LABEL_26;
  }
  while (1)
  {
    v7 = v12 + 1;
    if (__OFADD__(v12, 1))
      __break(1u);
    if (v7 >= v53)
      break;
    v11 = *(_QWORD *)(v52 + 8 * v7);
    ++v12;
    if (v11)
      goto LABEL_25;
  }
LABEL_32:
  swift_release();
  swift_bridgeObjectRelease();
  v28 = 0;
LABEL_33:
  v29 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  v30 = objc_msgSend(v29, sel_suppressCompositingFilterMultiply);

  if ((v30 & 1) == 0)
  {
    if ((v28 & 1) != 0)
      goto LABEL_44;
    v6 = *(double *)&v51[OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth];
    v5 = *(double *)&v51[OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth + 8];
    if (qword_2569C25B8 == -1)
    {
LABEL_40:
      if (v6 == *(double *)&xmmword_2569C3BE8 && v5 == *((double *)&xmmword_2569C3BE8 + 1))
        goto LABEL_34;
LABEL_44:
      v38 = sub_23A82C754();
      v39 = objc_msgSend(v38, sel_isHidden);

      if (v39)
      {
        v40 = sub_23A82C754();
        objc_msgSend(v40, sel_setHidden_, 0);

      }
      v41 = (void *)*MEMORY[0x24BDE5B98];
      v42 = sub_23A84C21C();
      v44 = v43;
      v45 = v41;
      v46 = objc_msgSend(v51, sel_layer);
      v47 = objc_msgSend(v46, sel_compositingFilter);

      if (v47)
      {
        sub_23A84C30C();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v65, 0, sizeof(v65));
      }
      sub_23A82E744((uint64_t)v65, (uint64_t)&v66, (uint64_t *)&unk_2542D8080);
      if (*((_QWORD *)&v67 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          if (v63 == v42 && v64 == v44)
          {

            swift_bridgeObjectRelease_n();
            return;
          }
          v50 = sub_23A84C3FC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v48 = v51;
          if ((v50 & 1) != 0)
            goto LABEL_58;
          goto LABEL_57;
        }
      }
      else
      {
        sub_23A825594((uint64_t)&v66, (uint64_t *)&unk_2542D8080);
      }
      swift_bridgeObjectRelease();
      v48 = v51;
LABEL_57:
      v49 = objc_msgSend(v48, sel_layer);
      objc_msgSend(v49, sel_setCompositingFilter_, v45);

LABEL_58:
      return;
    }
LABEL_62:
    v60 = v5;
    v62 = v6;
    swift_once();
    v5 = v60;
    v6 = v62;
    goto LABEL_40;
  }
LABEL_34:
  v31 = sub_23A82C754();
  v32 = objc_msgSend(v31, sel_isHidden);

  if ((v32 & 1) == 0)
  {
    v33 = sub_23A82C754();
    objc_msgSend(v33, sel_setHidden_, 1);

  }
  v34 = objc_msgSend(v51, sel_layer);
  v35 = objc_msgSend(v34, sel_compositingFilter);

  if (v35)
  {
    sub_23A84C30C();
    swift_unknownObjectRelease();
    sub_23A825594((uint64_t)&v66, (uint64_t *)&unk_2542D8080);
    v36 = objc_msgSend(v51, sel_layer);
    objc_msgSend(v36, sel_setCompositingFilter_, 0);

  }
  else
  {
    v66 = 0u;
    v67 = 0u;
    sub_23A825594((uint64_t)&v66, (uint64_t *)&unk_2542D8080);
  }
}

void sub_23A82D03C()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  id v18;
  double v19;
  double v20;
  id v21;

  v1 = 0;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes);
  v3 = 1 << *(_BYTE *)(v2 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v2 + 64;
  v6 = v4 & *(_QWORD *)(v2 + 64);
  v7 = (unint64_t)(v3 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v1 << 6);
      goto LABEL_5;
    }
    v10 = v1 + 1;
    if (__OFADD__(v1, 1))
      break;
    if (v10 >= v7)
      goto LABEL_27;
    v11 = *(_QWORD *)(v5 + 8 * v10);
    ++v1;
    if (!v11)
    {
      v1 = v10 + 1;
      if (v10 + 1 >= v7)
        goto LABEL_27;
      v11 = *(_QWORD *)(v5 + 8 * v1);
      if (!v11)
      {
        v1 = v10 + 2;
        if (v10 + 2 >= v7)
          goto LABEL_27;
        v11 = *(_QWORD *)(v5 + 8 * v1);
        if (!v11)
        {
          v1 = v10 + 3;
          if (v10 + 3 >= v7)
            goto LABEL_27;
          v11 = *(_QWORD *)(v5 + 8 * v1);
          if (!v11)
          {
            v1 = v10 + 4;
            if (v10 + 4 >= v7)
              goto LABEL_27;
            v11 = *(_QWORD *)(v5 + 8 * v1);
            if (!v11)
            {
              v12 = v10 + 5;
              if (v12 >= v7)
              {
LABEL_27:
                v18 = sub_23A82C768();
                objc_msgSend(v18, sel_alpha);
                v20 = v19;

                if (v20 != 1.0)
                  return;
                v16 = sub_23A82C768();
                v17 = 0.0;
                goto LABEL_29;
              }
              v11 = *(_QWORD *)(v5 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  v1 = v12 + 1;
                  if (__OFADD__(v12, 1))
                    goto LABEL_32;
                  if (v1 >= v7)
                    goto LABEL_27;
                  v11 = *(_QWORD *)(v5 + 8 * v1);
                  ++v12;
                  if (v11)
                    goto LABEL_24;
                }
              }
              v1 = v12;
            }
          }
        }
      }
    }
LABEL_24:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v1 << 6);
LABEL_5:
    if (*(_BYTE *)(*(_QWORD *)(v2 + 56) + 88 * v9 + 80) == 2)
    {
      v13 = sub_23A82C768();
      objc_msgSend(v13, sel_alpha);
      v15 = v14;

      if (v15 != 0.0)
        return;
      v16 = sub_23A82C768();
      v17 = 1.0;
LABEL_29:
      v21 = v16;
      objc_msgSend(v16, sel_setAlpha_, v17);

      return;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
}

void sub_23A82D22C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  int v4;
  int v5;
  _BYTE *v6;
  int v7;
  int v8;
  _BYTE *v9;
  int v10;
  int v11;
  _BYTE *v12;
  int v13;
  int v14;
  _BYTE *v15;
  int v16;
  int v17;
  _BYTE *v18;
  int v19;
  int v20;
  _BYTE *v21;

  v1 = v0;
  v2 = sub_23A82C740();
  v3 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters;
  v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);
  v5 = v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride];
  v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = v4;
  if (v4 != v5)
    sub_23A82F7C0();

  v6 = sub_23A82C754();
  v7 = *(unsigned __int8 *)(v1 + v3);
  v8 = v6[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride];
  v6[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = v7;
  if (v7 != v8)
    sub_23A82F7C0();

  v9 = sub_23A82C82C();
  v10 = *(unsigned __int8 *)(v1 + v3);
  v11 = v9[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride];
  v9[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = v10;
  if (v10 != v11)
    sub_23A82F7C0();

  v12 = sub_23A82C740();
  v13 = *(unsigned __int8 *)(v1 + v3);
  v14 = v12[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride];
  v12[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] = v13;
  if (v13 != v14)
    sub_23A814EB0();

  v15 = sub_23A82C754();
  v16 = *(unsigned __int8 *)(v1 + v3);
  v17 = v15[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride];
  v15[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] = v16;
  if (v16 != v17)
    sub_23A814EB0();

  v18 = sub_23A82C82C();
  v19 = *(unsigned __int8 *)(v1 + v3);
  v20 = v18[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride];
  v18[OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride] = v19;
  if (v19 != v20)
  {
    v21 = v18;
    sub_23A814EB0();
    v18 = v21;
  }

}

void sub_23A82D378()
{
  void *v0;
  void *v1;
  char *v2;
  id v3;
  char v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;

  v1 = v0;
  type metadata accessor for CGColor(0);
  v2 = (char *)sub_23A82C740();
  v3 = *(id *)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor];

  if (qword_2569C2588 != -1)
    swift_once();
  sub_23A82E658();
  v4 = sub_23A84C198();

  if ((v4 & 1) != 0)
  {
    if (qword_2569C2590 != -1)
      swift_once();
    v5 = (void *)qword_2569C3BA8;
    v6 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v6, sel_setContentsMultiplyColor_, v5);

    v7 = sub_23A82C740();
    v8 = objc_msgSend(v7, sel_layer);
    goto LABEL_9;
  }
  v5 = (void *)qword_2569C3BA0;
  v9 = objc_msgSend(v1, sel_layer);
  v10 = objc_msgSend(v9, sel_contentsMultiplyColor);

  if (v10)
    goto LABEL_8;
  v12 = objc_msgSend(v1, sel_layer);
  v13 = objc_msgSend(v12, sel_contentsMultiplyColor);

  if (!v13
    || (v14 = v5,
        v15 = v13,
        v16 = sub_23A84C198(),
        v15,
        v15,
        v14,
        (v16 & 1) == 0))
  {
LABEL_8:
    v11 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v11, sel_setContentsMultiplyColor_, v5);

    v7 = sub_23A82C740();
    v8 = objc_msgSend(v7, sel_layer);
LABEL_9:
    v17 = v8;

    objc_msgSend(v17, sel_setRimColor_, v5);
  }
}

uint64_t sub_23A82D5F0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease();
}

id sub_23A82D64C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletGroupView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletGroupView()
{
  return objc_opt_self();
}

void sub_23A82D704(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
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
  char v82;
  char v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int64_t v93;
  uint64_t v96;
  int64_t v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;

  if (a1 == a2)
    return;
  v2 = a2;
  v3 = a1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v4 = 0;
  v92 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v93 = (unint64_t)(v5 + 63) >> 6;
  while (v7)
  {
    v96 = (v7 - 1) & v7;
    v97 = v4;
    v8 = __clz(__rbit64(v7)) | (v4 << 6);
LABEL_24:
    v13 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v8);
    v14 = *(_QWORD *)(v3 + 56) + 88 * v8;
    v16 = *(void **)v14;
    v15 = *(_QWORD *)(v14 + 8);
    v18 = *(_QWORD *)(v14 + 16);
    v17 = *(_QWORD *)(v14 + 24);
    v99 = *(_OWORD *)(v14 + 32);
    v100 = *(_QWORD *)(v14 + 48);
    v19 = *(_QWORD *)(v14 + 64);
    v98 = *(_QWORD *)(v14 + 56);
    v20 = *(_QWORD *)(v14 + 72);
    v21 = *(unsigned __int8 *)(v14 + 80);
    v22 = sub_23A82010C(v13);
    if ((v23 & 1) == 0)
      goto LABEL_43;
    v24 = *(_QWORD *)(v2 + 56) + 88 * v22;
    v26 = *(void **)v24;
    v25 = *(_QWORD *)(v24 + 8);
    v27 = *(_QWORD *)(v24 + 16);
    v28 = *(_QWORD *)(v24 + 24);
    v29 = *(_QWORD *)(v24 + 32);
    v30 = *(_QWORD *)(v24 + 40);
    v32 = *(_QWORD *)(v24 + 48);
    v31 = *(_QWORD *)(v24 + 56);
    v34 = *(_QWORD *)(v24 + 64);
    v33 = *(_QWORD *)(v24 + 72);
    v35 = *(unsigned __int8 *)(v24 + 80);
    if (v35)
    {
      v36 = v16;
      if (v35 == 1)
      {
        if (v21 != 1)
          goto LABEL_44;
        if (v26)
        {
          if (!v16)
          {
            v64 = v20;
            v75 = v19;
            v80 = v20;
            v65 = v19;
            v66 = v15;
            v67 = v15;
            v59 = *((_QWORD *)&v99 + 1);
            v58 = v99;
            v60 = v100;
            v61 = v98;
            sub_23A8223E8(0, v67, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v75, v80, 1);
            v83 = 1;
            v74 = v65;
            v79 = v64;
            v62 = 0;
LABEL_51:
            v63 = v66;
            goto LABEL_46;
          }
          v86 = v33;
          v89 = v28;
          v90 = v29;
          v91 = v31;
          v87 = v25;
          v88 = v27;
          sub_23A81A1DC(0, (unint64_t *)&qword_2569C29B0);
          sub_23A8223E8(v16, v15, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v19, v20, 1);
          sub_23A8223E8(v26, v87, v88, v89, v90, v30, v32, v91, v34, v86, 1);
          sub_23A8223E8(v16, v15, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v19, v20, 1);
          v84 = sub_23A84C300();
          sub_23A82E644(v16, v15, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v19, v20, 1);
          sub_23A82E644(v26, v87, v88, v89, v90, v30, v32, v91, v34, v86, 1);
          sub_23A82E644(v16, v15, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v19, v20, 1);
          v3 = a1;
          v2 = a2;
          v7 = v96;
          v4 = v97;
          if ((v84 & 1) == 0)
            return;
        }
        else
        {
          if (v16)
          {
            v68 = v20;
            v76 = v19;
            v81 = v20;
            v69 = v19;
            v70 = v36;
            v66 = v15;
            v71 = v15;
            v59 = *((_QWORD *)&v99 + 1);
            v58 = v99;
            v60 = v100;
            v61 = v98;
            sub_23A8223E8(v36, v71, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v76, v81, 1);
            v83 = 1;
            v74 = v69;
            v79 = v68;
            v62 = v70;
            goto LABEL_51;
          }
          v72 = v19;
          v77 = v20;
          v47 = v18;
          v48 = v17;
          v49 = v33;
          v50 = v29;
          v51 = v28;
          v52 = v27;
          v53 = v25;
          v54 = v31;
          sub_23A8223E8(0, v15, v47, v48, v99, *((uint64_t *)&v99 + 1), v100, v98, v72, v77, 1);
          sub_23A8223E8(0, v53, v52, v51, v50, v30, v32, v54, v34, v49, 1);
          v3 = a1;
          v2 = a2;
          v7 = v96;
          v4 = v97;
        }
      }
      else
      {
        if (v21 != 2)
        {
LABEL_44:
          v82 = v21;
          v85 = v20;
          v73 = v19;
          v78 = v20;
          v55 = v19;
          goto LABEL_45;
        }
        v46 = v16 ^ ((v26 & 1) == 0);
        sub_23A8223E8(v16, v15, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v19, v20, 2);
        v3 = a1;
        v2 = a2;
        v7 = v96;
        v4 = v97;
        if ((v46 & 1) == 0)
          return;
      }
    }
    else
    {
      if (v21)
      {
LABEL_43:
        v82 = v21;
        v85 = v20;
        v73 = v19;
        v78 = v20;
        v55 = v19;
        v36 = v16;
LABEL_45:
        v56 = v15;
        v57 = v15;
        v59 = *((_QWORD *)&v99 + 1);
        v58 = v99;
        v60 = v100;
        v61 = v98;
        sub_23A8223E8(v36, v57, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v73, v78, v82);
        v83 = v21;
        v74 = v55;
        v79 = v85;
        v62 = v16;
        v63 = v56;
LABEL_46:
        sub_23A82E644(v62, v63, v18, v17, v58, v59, v60, v61, v74, v79, v83);
        return;
      }
      if (*(float *)&v26 != *(float *)&v16)
        goto LABEL_47;
      v37.i64[0] = v31;
      v37.i64[1] = __PAIR64__(v33, HIDWORD(v34));
      v38.i64[0] = __PAIR64__(HIDWORD(v26), v25);
      v38.i64[1] = __PAIR64__(v27, HIDWORD(v25));
      v39.i64[0] = __PAIR64__(v30, HIDWORD(v29));
      v39.i64[1] = v32;
      v40.i64[0] = __PAIR64__(v28, HIDWORD(v27));
      v40.i64[1] = __PAIR64__(v29, HIDWORD(v28));
      v41.i64[0] = __PAIR64__(v17, HIDWORD(v18));
      v41.i64[1] = __PAIR64__(v99, HIDWORD(v17));
      v42.i64[0] = __PAIR64__(HIDWORD(v16), v15);
      v42.i64[1] = __PAIR64__(v18, HIDWORD(v15));
      v43.i64[0] = *(_QWORD *)((char *)&v99 + 4);
      v43.i64[1] = v100;
      v44.i64[0] = v98;
      v44.i64[1] = __PAIR64__(v20, HIDWORD(v19));
      if ((vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v38, v42), (int16x8_t)vceqq_f32(v40, v41)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v39, v43), (int16x8_t)vceqq_f32(v37, v44))), 7uLL))) & 1) == 0)
      {
LABEL_47:
        sub_23A8223E8(v16, v15, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v19, v20, 0);
        return;
      }
      v45 = *((float *)&v33 + 1);
      sub_23A8223E8(v16, v15, v18, v17, v99, *((uint64_t *)&v99 + 1), v100, v98, v19, v20, 0);
      v3 = a1;
      v2 = a2;
      v7 = v96;
      v4 = v97;
      if (v45 != *((float *)&v20 + 1))
        return;
    }
  }
  v9 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_53;
  }
  if (v9 >= v93)
    return;
  v10 = *(_QWORD *)(v92 + 8 * v9);
  v11 = v4 + 1;
  if (v10)
    goto LABEL_23;
  v11 = v4 + 2;
  if (v4 + 2 >= v93)
    return;
  v10 = *(_QWORD *)(v92 + 8 * v11);
  if (v10)
    goto LABEL_23;
  v11 = v4 + 3;
  if (v4 + 3 >= v93)
    return;
  v10 = *(_QWORD *)(v92 + 8 * v11);
  if (v10)
    goto LABEL_23;
  v11 = v4 + 4;
  if (v4 + 4 >= v93)
    return;
  v10 = *(_QWORD *)(v92 + 8 * v11);
  if (v10)
  {
LABEL_23:
    v96 = (v10 - 1) & v10;
    v97 = v11;
    v8 = __clz(__rbit64(v10)) + (v11 << 6);
    goto LABEL_24;
  }
  v12 = v4 + 5;
  if (v4 + 5 >= v93)
    return;
  v10 = *(_QWORD *)(v92 + 8 * v12);
  if (v10)
  {
    v11 = v4 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v11 >= v93)
      return;
    v10 = *(_QWORD *)(v92 + 8 * v11);
    ++v12;
    if (v10)
      goto LABEL_23;
  }
LABEL_53:
  __break(1u);
}

unint64_t sub_23A82DE6C(unint64_t result, uint64_t a2)
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
    result = sub_23A84C324();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23A84C42C();
        swift_bridgeObjectRetain();
        sub_23A84C234();
        v9 = sub_23A84C444();
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

unint64_t sub_23A82E040(unint64_t result, uint64_t a2)
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
  _OWORD *v15;
  _OWORD *v16;
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
    result = sub_23A84C324();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23A84C42C();
        swift_bridgeObjectRetain();
        sub_23A84C234();
        v9 = sub_23A84C444();
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
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
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

unint64_t sub_23A82E214(unint64_t result, uint64_t a2)
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
  const void *v16;
  BOOL v17;
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
    result = sub_23A84C324();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_23A84C420();
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
            result = v15 + 88 * v3;
            v16 = (const void *)(v15 + 88 * v6);
            if (88 * v3 < (uint64_t)(88 * v6)
              || (result < (unint64_t)v16 + 88 ? (v17 = v3 == v6) : (v17 = 0), v3 = v6, !v17))
            {
              result = (unint64_t)memmove((void *)result, v16, 0x58uLL);
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

double sub_23A82E3C4(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 208) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

void sub_23A82E3EC(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v2 = sub_23A82C740();
  v3 = a1;
  sub_23A82E9A8(v3);

  v4 = sub_23A82C754();
  v5 = v3;
  sub_23A82E9A8(v5);

  v6 = sub_23A82B0F8();
  v7 = v6;
  if (!(v6 >> 62))
  {
    v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    sub_23A82D378();
    return;
  }
  swift_bridgeObjectRetain();
  v8 = sub_23A84C3B4();
  if (!v8)
    goto LABEL_10;
LABEL_3:
  if (v8 >= 1)
  {
    v9 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x23B858090](v9, v7);
      else
        v10 = *(id *)(v7 + 8 * v9 + 32);
      v11 = v10;
      ++v9;
      v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v5);
      objc_msgSend(v11, sel_setBackgroundColor_, v12);

    }
    while (v8 != v9);
    goto LABEL_10;
  }
  __break(1u);
}

void sub_23A82E54C(void *a1)
{
  id v2;
  id v3;
  double v4;
  double v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;

  v2 = objc_msgSend(a1, sel_layer);
  v3 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v3, sel_displayScale);
  v5 = v4;

  objc_msgSend(v2, sel_setRasterizationScale_, v5);
  v6 = sub_23A82C754();
  v10 = objc_msgSend(v6, sel_layer);

  v7 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v7, sel_displayScale);
  v9 = v8;

  objc_msgSend(v10, sel_setRasterizationScale_, v9);
}

void sub_23A82E644(id a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11 == 1)

}

unint64_t sub_23A82E658()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C2C18;
  if (!qword_2569C2C18)
  {
    type metadata accessor for CGColor(255);
    result = MEMORY[0x23B85857C](&unk_23A84DEC0, v1);
    atomic_store(result, (unint64_t *)&qword_2569C2C18);
  }
  return result;
}

id sub_23A82E6A0(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255)
    return sub_23A8223E8(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  return result;
}

uint64_t sub_23A82E6C0(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 80);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v4);
  return a1;
}

void sub_23A82E714(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255)
    sub_23A82E644(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

BOOL sub_23A82E734(_QWORD *a1)
{
  return *a1 == 0;
}

uint64_t sub_23A82E744(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_23A82E788()
{
  _BYTE *v0;
  uint64_t v1;
  id v2;
  unsigned __int8 v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters;
  v2 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  v3 = objc_msgSend(v2, sel_suppressDropletEffectFilters);

  v0[v1] = v3;
  v4 = &v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth];
  *v4 = 0;
  v4[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___mainEffectView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___shadowEffectView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView] = 0;
  v5 = OBJC_IVAR____TtC9DropletUI16DropletGroupView_participantKeylineTypes;
  *(_QWORD *)&v0[v5] = sub_23A821D08(MEMORY[0x24BEE4AF8]);

  sub_23A84C39C();
  __break(1u);
}

void sub_23A82E888(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a1 == 0xD00000000000001CLL && a2 == 0x800000023A84EBB0 || (sub_23A84C3FC() & 1) != 0)
    {
      sub_23A82D22C();
    }
    else if (a1 == 0xD000000000000021 && a2 == 0x800000023A84EB50 || (sub_23A84C3FC() & 1) != 0)
    {
      sub_23A82C91C();
    }
  }
}

uint64_t sub_23A82E960(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23A82E9A8(void *a1)
{
  char *v1;
  char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v2 = v1;
  v3 = a1;
  v4 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor;
  v5 = *(void **)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor];
  *(_QWORD *)&v2[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor] = a1;
  type metadata accessor for CGColor(0);
  sub_23A82E658();
  v10 = v3;
  LOBYTE(v3) = sub_23A84C198();

  if ((v3 & 1) == 0)
  {
    v6 = objc_msgSend(v2, sel_layer);
    v7 = qword_2569C25A8;
    v8 = *(id *)&v2[v4];
    if (v7 != -1)
      swift_once();
    v9 = (void *)sub_23A84C210();
    objc_msgSend(v6, sel_setValue_forKeyPath_, v8, v9);

    sub_23A82F684();
  }

}

void sub_23A82EAD0(double a1)
{
  char *v1;
  uint64_t v2;
  double v3;
  _BOOL8 v4;
  id v5;
  id v6;

  v2 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke;
  v3 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke];
  *(double *)&v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke] = a1;
  if (v3 != a1)
  {
    if ((a1 == 0.0) == (v3 != 0.0))
    {
      v4 = a1 == 0.0;
      v5 = objc_msgSend(v1, sel_layer);
      objc_msgSend(v5, sel_setBorderPathIsBounds_, v4);

    }
    v6 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v6, sel_setBorderWidth_, *(double *)&v1[v2]);

  }
}

void sub_23A82EBAC(double a1)
{
  char *v1;
  uint64_t v3;
  double v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  id v9;

  v3 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke;
  v4 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke];
  *(double *)&v1[OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke] = a1;
  if (v4 != a1)
  {
    if ((a1 == 0.0) == (v4 != 0.0))
    {
      v5 = objc_msgSend(v1, sel_layer);
      v6 = v5;
      if (a1 == 0.0)
      {
        objc_msgSend(v5, sel_setRimPathIsBounds_, 1);

        v7 = objc_msgSend(v1, sel_layer);
        LODWORD(v8) = 0;
      }
      else
      {
        objc_msgSend(v5, sel_setRimPathIsBounds_, 0);

        v7 = objc_msgSend(v1, sel_layer);
        LODWORD(v8) = 1.0;
      }
      objc_msgSend(v7, sel_setRimOpacity_, v8);

    }
    v9 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v9, sel_setRimWidth_, *(double *)&v1[v3]);

  }
}

char *sub_23A82ECEC(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t inited;
  id v24;
  void *v25;
  objc_super v27;

  v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThreshouldInputAmount] = 0x3FE0000000000000;
  v9 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor;
  v10 = (void *)objc_opt_self();
  v11 = v4;
  v12 = objc_msgSend(v10, sel_blackColor);
  v13 = objc_msgSend(v12, sel_CGColor);

  *(_QWORD *)&v4[v9] = v13;
  *(_QWORD *)&v11[OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke] = 0;

  v27.receiver = v11;
  v27.super_class = (Class)type metadata accessor for DropletEffectView();
  v14 = objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
  sub_23A84C21C();
  v15 = objc_allocWithZone(MEMORY[0x24BDE56B0]);
  v16 = (char *)v14;
  v17 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v15, sel_initWithType_, v17);

  v19 = (void *)sub_23A84C18C();
  objc_msgSend(v18, sel_setValue_forKeyPath_, v19, *MEMORY[0x24BDE5AA8]);

  objc_msgSend(v18, sel_setValue_forKeyPath_, *(_QWORD *)&v16[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor], *MEMORY[0x24BDE5AD0]);
  v20 = objc_msgSend(v16, sel_layer);
  v21 = objc_msgSend(v16, sel_layer);
  v22 = objc_msgSend(v21, sel_filters);

  if (v22)
  {
    sub_23A84C264();

  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A84E0E0;
  *(_QWORD *)(inited + 56) = sub_23A81A1DC(0, (unint64_t *)&qword_2542D8030);
  *(_QWORD *)(inited + 32) = v18;
  v24 = v18;
  sub_23A8422B8(inited);
  v25 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_setFilters_, v25);

  sub_23A82F684();
  return v16;
}

uint64_t sub_23A82F118()
{
  void *v0;
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[216];
  _OWORD v14[13];
  uint64_t v15;
  objc_super v16;
  _OWORD v17[13];
  uint64_t v18;
  CGRect v19;
  CGRect v20;

  v1 = v0;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for DropletEffectView();
  objc_msgSendSuper2(&v16, sel_layoutSubviews);
  v2 = objc_msgSend(v0, sel_subviews);
  sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
  v3 = sub_23A84C264();

  if (v3 >> 62)
    goto LABEL_15;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_23A84C3B4())
  {
    v5 = 4;
    v6 = 0;
    if ((v3 & 0xC000000000000001) != 0)
    {
LABEL_4:
      v7 = (id)MEMORY[0x23B858090](v6, v3);
      goto LABEL_6;
    }
    while (1)
    {
      v7 = *(id *)(v3 + 8 * v5);
LABEL_6:
      v8 = v7;
      v9 = v6 + 1;
      if (__OFADD__(v6, 1))
        break;
      type metadata accessor for DropletBoundaryView();
      v10 = swift_dynamicCastClass();
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v1, sel_bounds);
        v20 = *(CGRect *)(v11 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds);
        *(CGRect *)(v11 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds) = v19;
        if (!CGRectEqualToRect(v19, v20))
        {
          sub_23A82F90C(v11 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v13);
          sub_23A82F90C((uint64_t)v13, (uint64_t)v14);
          if (!sub_23A82E734(v14))
          {
            v17[10] = v14[10];
            v17[11] = v14[11];
            v17[12] = v14[12];
            v18 = v15;
            v17[6] = v14[6];
            v17[7] = v14[7];
            v17[8] = v14[8];
            v17[9] = v14[9];
            v17[2] = v14[2];
            v17[3] = v14[3];
            v17[4] = v14[4];
            v17[5] = v14[5];
            v17[0] = v14[0];
            v17[1] = v14[1];
            sub_23A84BA94((double *)v17);
          }
        }
      }

      if (v9 == v4)
        return swift_bridgeObjectRelease_n();
      v6 = ++v5 - 4;
      if ((v3 & 0xC000000000000001) != 0)
        goto LABEL_4;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease_n();
}

void sub_23A82F364(uint64_t a1)
{
  sub_23A82F38C(a1, (SEL *)&selRef_whiteColor, &qword_2569C3BA0);
}

void sub_23A82F378(uint64_t a1)
{
  sub_23A82F38C(a1, (SEL *)&selRef_purpleColor, &qword_2569C3BA8);
}

void sub_23A82F38C(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id v4;
  id v5;

  v4 = objc_msgSend((id)objc_opt_self(), *a2);
  v5 = objc_msgSend(v4, sel_CGColor);

  *a3 = v5;
}

uint64_t sub_23A82F3F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8050);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23A84E3F0;
  if (qword_2569C25A0 != -1)
    swift_once();
  v1 = qword_2569C3BC0;
  *(_QWORD *)(v0 + 32) = qword_2569C3BB8;
  *(_QWORD *)(v0 + 40) = v1;
  v2 = qword_2569C25A8;
  swift_bridgeObjectRetain();
  if (v2 != -1)
    swift_once();
  v3 = qword_2569C3BD0;
  *(_QWORD *)(v0 + 48) = qword_2569C3BC8;
  *(_QWORD *)(v0 + 56) = v3;
  *(_QWORD *)(v0 + 64) = 0x68746469576D6972;
  *(_QWORD *)(v0 + 72) = 0xE800000000000000;
  *(_QWORD *)(v0 + 80) = 0x6957726564726F62;
  *(_QWORD *)(v0 + 88) = 0xEB00000000687464;
  *(_QWORD *)(v0 + 96) = 0x6D695274666F73;
  *(_QWORD *)(v0 + 104) = 0xE700000000000000;
  qword_2569C3BB0 = v0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A82F500(uint64_t a1)
{
  return sub_23A82F530(a1, MEMORY[0x24BDE5AA8], &qword_2569C3BB8, &qword_2569C3BC0);
}

uint64_t sub_23A82F518(uint64_t a1)
{
  return sub_23A82F530(a1, MEMORY[0x24BDE5AD0], &qword_2569C3BC8, &qword_2569C3BD0);
}

uint64_t sub_23A82F530(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;

  sub_23A84C21C();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  sub_23A84C240();
  sub_23A84C21C();
  sub_23A84C240();
  result = swift_bridgeObjectRelease();
  *a3 = 0x2E737265746C6966;
  *a4 = 0xE800000000000000;
  return result;
}

uint64_t sub_23A82F5E0()
{
  uint64_t result;

  sub_23A84C330();
  swift_bridgeObjectRelease();
  sub_23A84C21C();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  result = sub_23A84C240();
  qword_2569C3BD8 = 0x2E737265746C6966;
  unk_2569C3BE0 = 0xE800000000000000;
  return result;
}

void sub_23A82F684()
{
  char *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t *v4;
  char v5;
  id v6;
  id v7;

  v1 = v0;
  type metadata accessor for CGColor(0);
  v2 = qword_2569C2588;
  v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor];
  if (v2 != -1)
    swift_once();
  v4 = &qword_2569C3BA0;
  sub_23A82E658();
  v5 = sub_23A84C198();

  v6 = objc_msgSend(v0, sel_layer);
  if ((v5 & 1) != 0)
  {
    if (qword_2569C2590 != -1)
      swift_once();
    v4 = &qword_2569C3BA8;
  }
  objc_msgSend(v6, sel_setRimColor_, *v4);

  v7 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v7, sel_setBorderColor_, *v4);

}

void sub_23A82F7C0()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_layer);
  v2 = (void *)sub_23A84C294();
  if (qword_2569C25B0 != -1)
    swift_once();
  v3 = (id)sub_23A84C210();
  objc_msgSend(v1, sel_setValue_forKeyPath_, v2);

}

void sub_23A82F89C()
{
  uint64_t v0;

}

id sub_23A82F8AC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletEffectView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletEffectView()
{
  return objc_opt_self();
}

uint64_t sub_23A82F90C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A82F954()
{
  _BYTE *v0;
  uint64_t v1;
  id v2;
  id v3;

  v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_disableAlphaThresholdFilterOverride] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThreshouldInputAmount] = 0x3FE0000000000000;
  v1 = OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor;
  v2 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  v3 = objc_msgSend(v2, sel_CGColor);

  *(_QWORD *)&v0[v1] = v3;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_innerStroke] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI17DropletEffectView_outerStroke] = 0;

  sub_23A84C39C();
  __break(1u);
}

BOOL sub_23A82FA38(float *a1, float *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7]
      && a1[8] == a2[8]
      && a1[9] == a2[9]
      && a1[10] == a2[10]
      && a1[12] == a2[12]
      && a1[13] == a2[13]
      && a1[14] == a2[14]
      && a1[15] == a2[15]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && a1[19] == a2[19];
}

uint64_t sub_23A82FB64()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A82FB80(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A82FBA0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for WeakBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakBox);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B858528](a1, v6, a5);
}

ValueMetadata *type metadata accessor for KeylineWidth()
{
  return &type metadata for KeylineWidth;
}

void sub_23A82FC10()
{
  xmmword_2569C3BE8 = 0uLL;
}

double sub_23A82FC20@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  double result;

  result = (double)*a1 * 0.5;
  *a2 = result;
  a2[1] = result;
  return result;
}

double sub_23A82FC38@<D0>(float *a1@<X0>, double *a2@<X8>)
{
  double result;

  result = *a1 * 0.5;
  *a2 = result;
  a2[1] = result;
  return result;
}

BOOL sub_23A82FC50(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_23A82FC7C()
{
  return MEMORY[0x24BEE1560];
}

uint64_t sub_23A82FC88()
{
  return MEMORY[0x24BEE17E8];
}

double DRPDropletContextSolidColorKeylineStyle.innerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.innerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextSolidColorKeylineStyle.outerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.outerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextSolidColorKeylineStyle.keylineOutsets.getter()
{
  return sub_23A832A24(&OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineOutsets);
}

uint64_t DRPDropletContextSolidColorKeylineStyle.keylineOutsets.setter(double a1, double a2, double a3, double a4)
{
  return sub_23A832AE4(&OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineOutsets, a1, a2, a3, a4);
}

double DRPDropletContextSolidColorKeylineStyle.keylineFadeLengths.getter()
{
  return sub_23A832A24(&OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineFadeLengths);
}

uint64_t DRPDropletContextSolidColorKeylineStyle.keylineFadeLengths.setter(double a1, double a2, double a3, double a4)
{
  return sub_23A832AE4(&OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineFadeLengths, a1, a2, a3, a4);
}

double DRPDropletContextSolidColorKeylineStyle.normalizedStartLocation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.normalizedStartLocation.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextSolidColorKeylineStyle.normalizedStopLocation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.normalizedStopLocation.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id DRPDropletContextSolidColorKeylineStyle.color.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color);
  swift_beginAccess();
  return *v1;
}

void DRPDropletContextSolidColorKeylineStyle.color.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

id DRPDropletContextSolidColorKeylineStyle.init(width:boundaryFadeLength:color:)(void *a1, double a2, double a3)
{
  id v4;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithWidth_boundaryFadeLength_color_, a1, a2, a3);

  return v4;
}

{
  void *v3;
  id v5;

  v5 = objc_msgSend(v3, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_color_, a1, 0.0, a2, -(a2 + a3), -(a2 + a3), -(a2 + a3), -(a2 + a3), *(_QWORD *)&a3, *(_QWORD *)&a3, *(_QWORD *)&a3, *(_QWORD *)&a3);

  return v5;
}

id DRPDropletContextSolidColorKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:color:)(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  id v19;

  v19 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_color_, a1, a2, a3, a4, a5, a6, a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a17, a18);

  return v19;
}

id DRPDropletContextSolidColorKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:color:)(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  id v20;

  v20 = objc_msgSend(v18, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_color_, a1, *(_QWORD *)&a15, *(_QWORD *)&a16, a17, a18, 0, 0x3FF0000000000000);

  return v20;
}

id DRPDropletContextSolidColorKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:color:)(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __int128 a18, uint64_t a19)
{
  id v20;

  v20 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_color_, a1, a2, a3, a4, a5, a6, a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a17, a18, a19);

  return v20;
}

id DRPDropletContextSolidColorKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:color:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  double *v21;
  uint64_t v22;
  objc_super v24;

  *(double *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth) = a2;
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth) = a3;
  v21 = (double *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineOutsets);
  *v21 = a4;
  v21[1] = a5;
  v21[2] = a6;
  v21[3] = a7;
  v22 = v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineFadeLengths;
  *(double *)v22 = a8;
  *(double *)(v22 + 8) = a9;
  *(_QWORD *)(v22 + 16) = a17;
  *(_QWORD *)(v22 + 24) = a18;
  *(_QWORD *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation) = a19;
  *(_QWORD *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation) = a20;
  *(_QWORD *)(v20 + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color) = a1;
  v24.super_class = (Class)DRPDropletContextSolidColorKeylineStyle;
  return objc_msgSendSuper2(&v24, sel_init);
}

uint64_t DRPDropletContextSolidColorKeylineStyle.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  id v40;
  char v41;
  void *v43;
  _BYTE v44[24];
  uint64_t v45;

  v2 = sub_23A821C80(a1, (uint64_t)v44);
  if (!v45)
  {
    sub_23A821CC8((uint64_t)v44);
    goto LABEL_18;
  }
  type metadata accessor for DRPDropletContextSolidColorKeylineStyle(v2);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    v41 = 0;
    return v41 & 1;
  }
  objc_msgSend(v1, sel_innerWidth);
  v4 = v3;
  objc_msgSend(v43, sel_innerWidth);
  if (v4 != v5)
    goto LABEL_17;
  objc_msgSend(v1, sel_outerWidth);
  v7 = v6;
  objc_msgSend(v43, sel_outerWidth);
  if (v7 != v8)
    goto LABEL_17;
  objc_msgSend(v1, sel_keylineOutsets);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v43, sel_keylineOutsets);
  if (v10 != v20)
    goto LABEL_17;
  if (v12 != v17)
    goto LABEL_17;
  if (v14 != v18)
    goto LABEL_17;
  if (v16 != v19)
    goto LABEL_17;
  objc_msgSend(v1, sel_keylineFadeLengths);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v43, sel_keylineFadeLengths);
  if (v22 != v32
    || v24 != v29
    || v26 != v30
    || v28 != v31
    || (objc_msgSend(v1, sel_normalizedStartLocation),
        v34 = v33,
        objc_msgSend(v43, sel_normalizedStartLocation),
        v34 != v35)
    || (objc_msgSend(v1, sel_normalizedStopLocation),
        v37 = v36,
        objc_msgSend(v43, sel_normalizedStopLocation),
        v37 != v38))
  {
LABEL_17:

    goto LABEL_18;
  }
  sub_23A81A1DC(0, &qword_2569C2D60);
  v39 = objc_msgSend(v1, sel_color);
  v40 = objc_msgSend(v43, sel_color);
  v41 = sub_23A84C300();

  return v41 & 1;
}

uint64_t type metadata accessor for DRPDropletContextSolidColorKeylineStyle(uint64_t a1)
{
  return sub_23A81A1DC(a1, &qword_2569C2DF8);
}

uint64_t DRPDropletContextSolidColorKeylineStyle.copy()@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  id v23;
  id v24;
  uint64_t v25;
  uint64_t result;
  double v27;
  double v28;
  double v29;
  double v30;

  objc_msgSend(v1, sel_innerWidth);
  v30 = v3;
  objc_msgSend(v1, sel_outerWidth);
  v29 = v4;
  objc_msgSend(v1, sel_keylineOutsets);
  v27 = v6;
  v28 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v1, sel_keylineFadeLengths);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v1, sel_normalizedStartLocation);
  v20 = v19;
  objc_msgSend(v1, sel_normalizedStopLocation);
  v22 = v21;
  v23 = objc_msgSend(v1, sel_color);
  v24 = objc_msgSend(objc_allocWithZone((Class)DRPDropletContextSolidColorKeylineStyle), sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_color_, v23, v30, v29, v28, v27, v8, v10, v12, v14, v16, v18, v20, v22);

  result = type metadata accessor for DRPDropletContextSolidColorKeylineStyle(v25);
  a1[3] = result;
  *a1 = v24;
  return result;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.description.getter()
{
  return sub_23A833C6C((void (*)(void))sub_23A830B04);
}

uint64_t sub_23A830B04()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD v6[2];

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8050);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23A84E4F0;
  strcpy((char *)v6, "innerWidth: ");
  BYTE5(v6[1]) = 0;
  HIWORD(v6[1]) = -5120;
  objc_msgSend(v0, sel_innerWidth);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v2 = v6[1];
  *(_QWORD *)(v1 + 32) = v6[0];
  *(_QWORD *)(v1 + 40) = v2;
  strcpy((char *)v6, "outerWidth: ");
  BYTE5(v6[1]) = 0;
  HIWORD(v6[1]) = -5120;
  objc_msgSend(v0, sel_outerWidth);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v3 = v6[1];
  *(_QWORD *)(v1 + 48) = v6[0];
  *(_QWORD *)(v1 + 56) = v3;
  sub_23A84C330();
  sub_23A84C240();
  objc_msgSend(v0, sel_keylineOutsets);
  type metadata accessor for UIEdgeInsets(0);
  sub_23A84C390();
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = 0xE000000000000000;
  sub_23A84C330();
  sub_23A84C240();
  objc_msgSend(v0, sel_keylineFadeLengths);
  sub_23A84C390();
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 88) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStartLocation);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 96) = 0xD000000000000019;
  *(_QWORD *)(v1 + 104) = 0x800000023A851A60;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStopLocation);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 112) = 0xD000000000000018;
  *(_QWORD *)(v1 + 120) = 0x800000023A851A80;
  v4 = objc_msgSend(v0, sel_color);
  sub_23A84C054(v4);

  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 128) = strcpy((char *)v6, "color: ");
  *(_QWORD *)(v1 + 136) = 0xE700000000000000;
  return v1;
}

uint64_t DRPDropletContextSolidColorKeylineStyle.debugDescription.getter()
{
  return sub_23A833C6C((void (*)(void))sub_23A830B04);
}

void DRPDropletContextSolidColorKeylineStyle.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DRPDropletContextAdaptiveKeylineStyle.width.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_outerWidth);
}

id DRPDropletContextAdaptiveKeylineStyle.width.setter()
{
  void *v0;

  return objc_msgSend(v0, sel_setOuterWidth_);
}

double DRPDropletContextAdaptiveKeylineStyle.innerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.innerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextAdaptiveKeylineStyle.outerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.outerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextAdaptiveKeylineStyle.keylineOutsets.getter()
{
  return sub_23A832A24(&OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets);
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.keylineOutsets.setter(double a1, double a2, double a3, double a4)
{
  return sub_23A832AE4(&OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets, a1, a2, a3, a4);
}

double DRPDropletContextAdaptiveKeylineStyle.keylineFadeLengths.getter()
{
  return sub_23A832A24(&OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths);
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.keylineFadeLengths.setter(double a1, double a2, double a3, double a4)
{
  return sub_23A832AE4(&OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths, a1, a2, a3, a4);
}

double DRPDropletContextAdaptiveKeylineStyle.normalizedStartLocation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.normalizedStartLocation.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextAdaptiveKeylineStyle.normalizedStopLocation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.normalizedStopLocation.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

__n128 DRPDropletContextAdaptiveKeylineStyle.adaptiveColorMatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v3 = v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix;
  swift_beginAccess();
  v4 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v3 + 64);
  result = *(__n128 *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 DRPDropletContextAdaptiveKeylineStyle.adaptiveColorMatrix.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v3 = v1 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix;
  swift_beginAccess();
  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 48) = v4;
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(a1 + 64);
  result = *(__n128 *)(a1 + 16);
  *(_OWORD *)v3 = *(_OWORD *)a1;
  *(__n128 *)(v3 + 16) = result;
  return result;
}

double sub_23A83158C@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  objc_msgSend(*a1, sel_adaptiveColorMatrix);
  result = *(double *)&v4;
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  return result;
}

id sub_23A8315DC(_OWORD *a1, void **a2)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[5];

  v2 = *a2;
  v3 = a1[1];
  v6[0] = *a1;
  v6[1] = v3;
  v4 = a1[3];
  v6[2] = a1[2];
  v6[3] = v4;
  v6[4] = a1[4];
  return objc_msgSend(v2, sel_setAdaptiveColorMatrix_, v6);
}

id DRPDropletContextAdaptiveKeylineStyle.init(width:boundaryFadeLength:adaptiveColorMatrix:)(_OWORD *a1, double a2, double a3)
{
  id v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[5];

  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a1[1];
  v10[0] = *a1;
  v10[1] = v7;
  v8 = a1[3];
  v10[2] = a1[2];
  v10[3] = v8;
  v10[4] = a1[4];
  return objc_msgSend(v6, sel_initWithWidth_boundaryFadeLength_adaptiveColorMatrix_, v10, a2, a3);
}

{
  void *v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[5];

  v4 = a1[1];
  v7[0] = *a1;
  v7[1] = v4;
  v5 = a1[3];
  v7[2] = a1[2];
  v7[3] = v5;
  v7[4] = a1[4];
  return objc_msgSend(v3, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_adaptiveColorMatrix_, v7, 0.0, a2, -(a2 + a3), -(a2 + a3), -(a2 + a3), -(a2 + a3), *(_QWORD *)&a3, *(_QWORD *)&a3, *(_QWORD *)&a3, *(_QWORD *)&a3);
}

id DRPDropletContextAdaptiveKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:adaptiveColorMatrix:)(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  id v25;
  __int128 v26;
  __int128 v27;
  _OWORD v31[5];

  v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v26 = a1[1];
  v31[0] = *a1;
  v31[1] = v26;
  v27 = a1[3];
  v31[2] = a1[2];
  v31[3] = v27;
  v31[4] = a1[4];
  return objc_msgSend(v25, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_adaptiveColorMatrix_, v31, a2, a3, a4, a5, a6, a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a17, a18);
}

id DRPDropletContextAdaptiveKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:adaptiveColorMatrix:)(_OWORD *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  __int128 v19;
  __int128 v20;
  _OWORD v22[5];

  v19 = a1[1];
  v22[0] = *a1;
  v22[1] = v19;
  v20 = a1[3];
  v22[2] = a1[2];
  v22[3] = v20;
  v22[4] = a1[4];
  return objc_msgSend(v18, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v22, *(_QWORD *)&a15, *(_QWORD *)&a16, a17, a18, 0, 0x3FF0000000000000);
}

id DRPDropletContextAdaptiveKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:adaptiveColorMatrix:)(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __int128 a18, uint64_t a19)
{
  id v26;
  __int128 v27;
  __int128 v28;
  _OWORD v32[6];

  v26 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v27 = a1[1];
  v32[0] = *a1;
  v32[1] = v27;
  v28 = a1[3];
  v32[2] = a1[2];
  v32[3] = v28;
  v32[4] = a1[4];
  return objc_msgSend(v26, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v32, a2, a3, a4, a5, a6, a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a17, a18, a19);
}

id DRPDropletContextAdaptiveKeylineStyle.init(innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:adaptiveColorMatrix:)(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  double *v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  objc_super v27;

  *(double *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth) = a2;
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth) = a3;
  v21 = (double *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets);
  *v21 = a4;
  v21[1] = a5;
  v21[2] = a6;
  v21[3] = a7;
  v22 = v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths;
  *(double *)v22 = a8;
  *(double *)(v22 + 8) = a9;
  *(_QWORD *)(v22 + 16) = a17;
  *(_QWORD *)(v22 + 24) = a18;
  *(_QWORD *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation) = a19;
  *(_QWORD *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation) = a20;
  v23 = (_OWORD *)(v20 + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix);
  v24 = a1[3];
  v23[2] = a1[2];
  v23[3] = v24;
  v23[4] = a1[4];
  v25 = a1[1];
  *v23 = *a1;
  v23[1] = v25;
  v27.super_class = (Class)DRPDropletContextAdaptiveKeylineStyle;
  return objc_msgSendSuper2(&v27, sel_init);
}

BOOL DRPDropletContextAdaptiveKeylineStyle.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v2 = sub_23A821C80(a1, (uint64_t)&v43);
  if (!v45)
  {
    sub_23A821CC8((uint64_t)&v43);
    return 0;
  }
  type metadata accessor for DRPDropletContextAdaptiveKeylineStyle(v2);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v3 = (void *)v42;
  objc_msgSend(v1, sel_innerWidth);
  v5 = v4;
  objc_msgSend((id)v42, sel_innerWidth);
  if (v5 != v6)
    goto LABEL_17;
  objc_msgSend(v1, sel_outerWidth);
  v8 = v7;
  objc_msgSend((id)v42, sel_outerWidth);
  if (v8 != v9)
    goto LABEL_17;
  objc_msgSend(v1, sel_keylineOutsets);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend((id)v42, sel_keylineOutsets);
  if (v11 != v21)
    goto LABEL_17;
  if (v13 != v18)
    goto LABEL_17;
  if (v15 != v19)
    goto LABEL_17;
  if (v17 != v20)
    goto LABEL_17;
  objc_msgSend(v1, sel_keylineFadeLengths);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend((id)v42, sel_keylineFadeLengths);
  if (v23 != v33
    || v25 != v30
    || v27 != v31
    || v29 != v32
    || (objc_msgSend(v1, sel_normalizedStartLocation),
        v35 = v34,
        objc_msgSend((id)v42, sel_normalizedStartLocation),
        v35 != v36)
    || (objc_msgSend(v1, sel_normalizedStopLocation),
        v38 = v37,
        objc_msgSend((id)v42, sel_normalizedStopLocation),
        v38 != v39))
  {
LABEL_17:

    return 0;
  }
  objc_msgSend(v1, sel_adaptiveColorMatrix);
  objc_msgSend((id)v42, sel_adaptiveColorMatrix, v43, v44, v45, v46, v47, v48);

  return sub_23A82FA38((float *)&v42, (float *)&v43);
}

uint64_t type metadata accessor for DRPDropletContextAdaptiveKeylineStyle(uint64_t a1)
{
  return sub_23A81A1DC(a1, &qword_2542D8018);
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.copy()@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  id v23;
  id v24;
  uint64_t result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  objc_msgSend(v1, sel_innerWidth);
  v34 = v3;
  objc_msgSend(v1, sel_outerWidth);
  v33 = v4;
  objc_msgSend(v1, sel_keylineOutsets);
  v31 = v6;
  v32 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v1, sel_keylineFadeLengths);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v1, sel_normalizedStartLocation);
  v20 = v19;
  objc_msgSend(v1, sel_normalizedStopLocation);
  v22 = v21;
  objc_msgSend(v1, sel_adaptiveColorMatrix);
  v29 = v36;
  v30 = v35;
  v27 = v38;
  v28 = v37;
  v26 = v39;
  v23 = objc_allocWithZone((Class)DRPDropletContextAdaptiveKeylineStyle);
  v35 = v30;
  v36 = v29;
  v37 = v28;
  v38 = v27;
  v39 = v26;
  v24 = objc_msgSend(v23, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, &v35, v34, v33, v32, v31, v8, v10, v12, v14, v16, v18, v20, v22);
  result = type metadata accessor for DRPDropletContextAdaptiveKeylineStyle((uint64_t)v24);
  a1[3] = result;
  *a1 = v24;
  return result;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.description.getter()
{
  return sub_23A833C6C((void (*)(void))sub_23A831F04);
}

uint64_t sub_23A831F04()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8050);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23A84E4F0;
  strcpy((char *)&v8, "innerWidth: ");
  BYTE13(v8) = 0;
  HIWORD(v8) = -5120;
  objc_msgSend(v0, sel_innerWidth);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v2 = *((_QWORD *)&v8 + 1);
  *(_QWORD *)(v1 + 32) = v8;
  *(_QWORD *)(v1 + 40) = v2;
  strcpy((char *)&v8, "outerWidth: ");
  BYTE13(v8) = 0;
  HIWORD(v8) = -5120;
  objc_msgSend(v0, sel_outerWidth);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v3 = *((_QWORD *)&v8 + 1);
  *(_QWORD *)(v1 + 48) = v8;
  *(_QWORD *)(v1 + 56) = v3;
  sub_23A84C330();
  sub_23A84C240();
  objc_msgSend(v0, sel_keylineOutsets);
  type metadata accessor for UIEdgeInsets(0);
  sub_23A84C390();
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = 0xE000000000000000;
  sub_23A84C330();
  sub_23A84C240();
  objc_msgSend(v0, sel_keylineFadeLengths);
  v9 = v4;
  v10 = v5;
  sub_23A84C390();
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 88) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStartLocation);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 96) = 0xD000000000000019;
  *(_QWORD *)(v1 + 104) = 0x800000023A851A60;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStopLocation);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 112) = 0xD000000000000018;
  *(_QWORD *)(v1 + 120) = 0x800000023A851A80;
  *(_QWORD *)&v8 = 0;
  *((_QWORD *)&v8 + 1) = 0xE000000000000000;
  sub_23A84C330();
  v11 = v8;
  sub_23A84C240();
  objc_msgSend(v0, sel_adaptiveColorMatrix);
  type metadata accessor for CAColorMatrix(0);
  sub_23A84C390();
  v6 = *((_QWORD *)&v11 + 1);
  *(_QWORD *)(v1 + 128) = v11;
  *(_QWORD *)(v1 + 136) = v6;
  return v1;
}

uint64_t DRPDropletContextAdaptiveKeylineStyle.debugDescription.getter()
{
  return sub_23A833C6C((void (*)(void))sub_23A831F04);
}

void DRPDropletContextAdaptiveKeylineStyle.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.preferAudioReactivity.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.preferAudioReactivity.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.style.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.style.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.innerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.innerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.outerWidth.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.outerWidth.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.innerWidthSoft.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidthSoft);
  swift_beginAccess();
  return *v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.innerWidthSoft.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidthSoft);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.outerWidthBlurRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidthBlurRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.outerWidthBlurRadius.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidthBlurRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineOutsets.getter()
{
  return sub_23A832A24(&OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets);
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineOutsets.setter(double a1, double a2, double a3, double a4)
{
  return sub_23A832AE4(&OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets, a1, a2, a3, a4);
}

double sub_23A8329D4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = a1 + *a3;
  swift_beginAccess();
  return *(double *)v3;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineFadeLengths.getter()
{
  return sub_23A832A24(&OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths);
}

double sub_23A832A24(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return *(double *)v2;
}

uint64_t sub_23A832A74(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, _QWORD *a7)
{
  double *v11;
  uint64_t result;

  v11 = (double *)(a1 + *a7);
  result = swift_beginAccess();
  *v11 = a2;
  v11[1] = a3;
  v11[2] = a4;
  v11[3] = a5;
  return result;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.keylineFadeLengths.setter(double a1, double a2, double a3, double a4)
{
  return sub_23A832AE4(&OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths, a1, a2, a3, a4);
}

uint64_t sub_23A832AE4(_QWORD *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  double *v10;
  uint64_t result;

  v10 = (double *)(v5 + *a1);
  result = swift_beginAccess();
  *v10 = a2;
  v10[1] = a3;
  v10[2] = a4;
  v10[3] = a5;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.normalizedStartLocation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.normalizedStartLocation.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletContextIntelligentEdgeLightKeylineStyle.normalizedStopLocation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.normalizedStopLocation.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

void __swiftcall DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:)(DRPDropletContextIntelligentEdgeLightKeylineStyle *__return_ptr retstr, Swift::Bool preferringAudioReactivity)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPreferringAudioReactivity_, preferringAudioReactivity);
}

id DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:)(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_initWithPreferringAudioReactivity_style_, a1 & 1, 2);
}

id DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:)(char a1, uint64_t a2)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPreferringAudioReactivity_style_, a1 & 1, a2);
}

{
  void *v2;
  id v5;
  void *v6;
  char **v7;
  char **v8;
  char **v9;
  char **v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v5 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  v6 = v5;
  if (a2 == 1)
  {
    v7 = &selRef_intelligentEdgeLightKeylineStyleSoftLargeWidth;
    v8 = &selRef_intelligentEdgeLightKeylineStyleSoftSmallWidth;
    v9 = &selRef_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius;
    v10 = &selRef_intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft;
  }
  else
  {
    if (a2 != 2)
    {
      v11 = 0;
      v17 = 0.0;
      v15 = 0.0;
      v13 = 0.0;
      goto LABEL_7;
    }
    v7 = &selRef_intelligentEdgeLightKeylineStyleHardLargeWidth;
    v8 = &selRef_intelligentEdgeLightKeylineStyleHardSmallWidth;
    v9 = &selRef_intelligentEdgeLightKeylineStyleHardLargeBlurRadius;
    v10 = &selRef_intelligentEdgeLightKeylineStyleHardSmallKeylineSoft;
  }
  v11 = objc_msgSend(v5, *v10);
  objc_msgSend(v6, *v9);
  v13 = v12;
  objc_msgSend(v6, *v8);
  v15 = v14;
  objc_msgSend(v6, *v7);
  v17 = v16;
LABEL_7:
  v18 = objc_msgSend(v2, sel_initWithPreferringAudioReactivity_style_innerWidthSoft_outerWidthBlurRadius_innerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_, a1 & 1, a2, v11, v13, v15, v17, *MEMORY[0x24BEBE158], *(_QWORD *)(MEMORY[0x24BEBE158] + 8), *(_QWORD *)(MEMORY[0x24BEBE158] + 16), *(_QWORD *)(MEMORY[0x24BEBE158] + 24), 0, 0x3FF0000000000000);

  return v18;
}

id DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:innerWidthSoft:outerWidthBlurRadius:innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:)(char a1, uint64_t a2, char a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 a19, uint64_t a20)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPreferringAudioReactivity_style_innerWidthSoft_outerWidthBlurRadius_innerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_, a1 & 1, a2, a3 & 1, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, a17, a18, a19, a20);
}

id DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:innerWidthSoft:outerWidthBlurRadius:innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:)(char a1, uint64_t a2, char a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  double *v21;
  uint64_t v22;
  objc_super v24;

  *(_BYTE *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity) = a1;
  *(_QWORD *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style) = a2;
  *(_BYTE *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidthSoft) = a3;
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidthBlurRadius) = a4;
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth) = a5;
  *(double *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth) = a6;
  v21 = (double *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets);
  *v21 = a7;
  v21[1] = a8;
  v21[2] = a9;
  v21[3] = a10;
  v22 = v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths;
  *(double *)v22 = a11;
  *(_OWORD *)(v22 + 8) = a17;
  *(_QWORD *)(v22 + 24) = a18;
  *(_QWORD *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation) = a19;
  *(_QWORD *)(v20 + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation) = a20;
  v24.super_class = (Class)DRPDropletContextIntelligentEdgeLightKeylineStyle;
  return objc_msgSendSuper2(&v24, sel_init);
}

BOOL DRPDropletContextIntelligentEdgeLightKeylineStyle.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  unsigned int v3;
  id v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v47;
  _BYTE v48[24];
  uint64_t v49;

  v2 = sub_23A821C80(a1, (uint64_t)v48);
  if (v49)
  {
    type metadata accessor for DRPDropletContextIntelligentEdgeLightKeylineStyle(v2);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = objc_msgSend(v1, sel_preferAudioReactivity);
      if (v3 == objc_msgSend(v47, sel_preferAudioReactivity))
      {
        v4 = objc_msgSend(v1, sel_style);
        if (v4 == objc_msgSend(v47, sel_style))
        {
          v5 = objc_msgSend(v1, sel_innerWidthSoft);
          if (v5 == objc_msgSend(v47, sel_innerWidthSoft))
          {
            objc_msgSend(v1, sel_outerWidthBlurRadius);
            v7 = v6;
            objc_msgSend(v47, sel_outerWidthBlurRadius);
            if (v7 == v8)
            {
              objc_msgSend(v1, sel_innerWidth);
              v10 = v9;
              objc_msgSend(v47, sel_innerWidth);
              if (v10 == v11)
              {
                objc_msgSend(v1, sel_outerWidth);
                v13 = v12;
                objc_msgSend(v47, sel_outerWidth);
                if (v13 == v14)
                {
                  objc_msgSend(v1, sel_keylineOutsets);
                  v16 = v15;
                  v18 = v17;
                  v20 = v19;
                  v22 = v21;
                  objc_msgSend(v47, sel_keylineOutsets);
                  if (v16 == v26 && v18 == v23 && v20 == v24 && v22 == v25)
                  {
                    objc_msgSend(v1, sel_keylineFadeLengths);
                    v28 = v27;
                    v30 = v29;
                    v32 = v31;
                    v34 = v33;
                    objc_msgSend(v47, sel_keylineFadeLengths);
                    if (v28 == v38 && v30 == v35 && v32 == v36 && v34 == v37)
                    {
                      objc_msgSend(v1, sel_normalizedStartLocation);
                      v40 = v39;
                      objc_msgSend(v47, sel_normalizedStartLocation);
                      if (v40 == v41)
                      {
                        objc_msgSend(v1, sel_normalizedStopLocation);
                        v43 = v42;
                        objc_msgSend(v47, sel_normalizedStopLocation);
                        v45 = v44;

                        return v43 == v45;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

    }
  }
  else
  {
    sub_23A821CC8((uint64_t)v48);
  }
  return 0;
}

uint64_t type metadata accessor for DRPDropletContextIntelligentEdgeLightKeylineStyle(uint64_t a1)
{
  return sub_23A81A1DC(a1, &qword_2569C2E28);
}

uint64_t sub_23A833438(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  id v6;
  id v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_23A84C30C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = a1;
  }
  v8 = a4(v10);

  sub_23A821CC8((uint64_t)v10);
  return v8 & 1;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.copy()@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  id v27;
  uint64_t result;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v2 = v1;
  v4 = objc_msgSend(v1, sel_preferAudioReactivity);
  v5 = objc_msgSend(v2, sel_style);
  v6 = objc_msgSend(v2, sel_innerWidthSoft);
  objc_msgSend(v2, sel_outerWidthBlurRadius);
  v33 = v7;
  objc_msgSend(v2, sel_innerWidth);
  v32 = v8;
  objc_msgSend(v2, sel_outerWidth);
  v31 = v9;
  objc_msgSend(v2, sel_keylineOutsets);
  v29 = v11;
  v30 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v2, sel_keylineFadeLengths);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v2, sel_normalizedStartLocation);
  v25 = v24;
  objc_msgSend(v2, sel_normalizedStopLocation);
  v27 = objc_msgSend(objc_allocWithZone((Class)DRPDropletContextIntelligentEdgeLightKeylineStyle), sel_initWithPreferringAudioReactivity_style_innerWidthSoft_outerWidthBlurRadius_innerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_, v4, v5, v6, v33, v32, v31, v30, v29, v13, v15, v17, v19, v21, v23, v25, v26);
  result = type metadata accessor for DRPDropletContextIntelligentEdgeLightKeylineStyle((uint64_t)v27);
  a1[3] = result;
  *a1 = v27;
  return result;
}

uint64_t sub_23A83364C(void *a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr))
{
  id v4;
  uint64_t v5;
  _QWORD v7[4];

  v4 = a1;
  a3(v7);

  __swift_project_boxed_opaque_existential_0(v7, v7[3]);
  v5 = sub_23A84C3F0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.description.getter()
{
  return sub_23A833C6C((void (*)(void))sub_23A8336D4);
}

uint64_t sub_23A8336D4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8050);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23A84E500;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  v5[1] = 0x800000023A8519C0;
  objc_msgSend(v0, sel_preferAudioReactivity);
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = 0xD000000000000017;
  *(_QWORD *)(v1 + 40) = v5[1];
  strcpy((char *)v5, "style: ");
  objc_msgSend(v0, sel_style);
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = v5[0];
  *(_QWORD *)(v1 + 56) = 0xE700000000000000;
  strcpy((char *)v5, "innerWidth: ");
  BYTE5(v5[1]) = 0;
  HIWORD(v5[1]) = -5120;
  objc_msgSend(v0, sel_innerWidth);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v2 = v5[1];
  *(_QWORD *)(v1 + 64) = v5[0];
  *(_QWORD *)(v1 + 72) = v2;
  strcpy((char *)v5, "outerWidth: ");
  BYTE5(v5[1]) = 0;
  HIWORD(v5[1]) = -5120;
  objc_msgSend(v0, sel_outerWidth);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v3 = v5[1];
  *(_QWORD *)(v1 + 80) = v5[0];
  *(_QWORD *)(v1 + 88) = v3;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_innerWidthSoft);
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 96) = 0xD000000000000010;
  *(_QWORD *)(v1 + 104) = 0x800000023A8519E0;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_outerWidthBlurRadius);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 112) = 0xD000000000000016;
  *(_QWORD *)(v1 + 120) = 0x800000023A851A00;
  sub_23A84C330();
  sub_23A84C240();
  objc_msgSend(v0, sel_keylineOutsets);
  type metadata accessor for UIEdgeInsets(0);
  sub_23A84C390();
  *(_QWORD *)(v1 + 128) = 0;
  *(_QWORD *)(v1 + 136) = 0xE000000000000000;
  sub_23A84C330();
  sub_23A84C240();
  objc_msgSend(v0, sel_keylineFadeLengths);
  sub_23A84C390();
  *(_QWORD *)(v1 + 144) = 0;
  *(_QWORD *)(v1 + 152) = 0xE000000000000000;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStartLocation);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 160) = 0xD000000000000019;
  *(_QWORD *)(v1 + 168) = 0x800000023A851A60;
  sub_23A84C330();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_normalizedStopLocation);
  sub_23A84C2A0();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 176) = 0xD000000000000018;
  *(_QWORD *)(v1 + 184) = 0x800000023A851A80;
  return v1;
}

id sub_23A833BA8(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2988);
  sub_23A82A7F0();
  sub_23A84C1F8();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t DRPDropletContextIntelligentEdgeLightKeylineStyle.debugDescription.getter()
{
  return sub_23A833C6C((void (*)(void))sub_23A8336D4);
}

uint64_t sub_23A833C6C(void (*a1)(void))
{
  uint64_t v1;

  a1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2988);
  sub_23A82A7F0();
  v1 = sub_23A84C1F8();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t DRPDropletIntelligentLightStyle.debugDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 0x6567644564726168;
  v2 = 0x6E776F6E6B6E75;
  if (a1 == 1)
    v2 = 0x6567644574666F73;
  if (a1 != 2)
    v1 = v2;
  if (a1)
    return v1;
  else
    return 1701736302;
}

id _sSo39DRPDropletContextSolidColorKeylineStyleC9DropletUIEABycfC_0()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void DRPDropletContextIntelligentEdgeLightKeylineStyle.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

char *keypath_get_selector_width()
{
  return sel_width;
}

id sub_23A833DF0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_width);
  *a2 = v4;
  return result;
}

id sub_23A833E20(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setWidth_, *a1);
}

char *keypath_get_selector_innerWidth()
{
  return sel_innerWidth;
}

id sub_23A833E40@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_innerWidth);
  *a2 = v4;
  return result;
}

char *keypath_get_selector_outerWidth()
{
  return sel_outerWidth;
}

char *keypath_get_selector_keylineOutsets()
{
  return sel_keylineOutsets;
}

id sub_23A833E88@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineOutsets, a2);
}

id sub_23A833E94(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineOutsets_);
}

char *keypath_get_selector_keylineFadeLengths()
{
  return sel_keylineFadeLengths;
}

id sub_23A833EAC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineFadeLengths, a2);
}

id sub_23A833EB8(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineFadeLengths_);
}

char *keypath_get_selector_normalizedStartLocation()
{
  return sel_normalizedStartLocation;
}

id sub_23A833ED0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNormalizedStartLocation_, *a1);
}

char *keypath_get_selector_normalizedStopLocation()
{
  return sel_normalizedStopLocation;
}

id sub_23A833EF0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_normalizedStopLocation);
  *a2 = v4;
  return result;
}

id sub_23A833F20(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNormalizedStopLocation_, *a1);
}

char *keypath_get_selector_color()
{
  return sel_color;
}

id sub_23A833F40@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_color);
  *a2 = result;
  return result;
}

id sub_23A833F78(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setColor_, *a1);
}

id sub_23A833F8C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInnerWidth_, *a1);
}

id sub_23A833FA0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_outerWidth);
  *a2 = v4;
  return result;
}

id sub_23A833FD0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOuterWidth_, *a1);
}

id sub_23A833FE4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineOutsets, a2);
}

id sub_23A833FF0(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineOutsets_);
}

id sub_23A833FFC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineFadeLengths, a2);
}

id sub_23A834008(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineFadeLengths_);
}

id sub_23A834014@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_normalizedStartLocation);
  *a2 = v4;
  return result;
}

char *keypath_get_selector_adaptiveColorMatrix()
{
  return sel_adaptiveColorMatrix;
}

char *keypath_get_selector_preferAudioReactivity()
{
  return sel_preferAudioReactivity;
}

id sub_23A834064@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_preferAudioReactivity);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A834094(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferAudioReactivity_, *a1);
}

char *keypath_get_selector_style()
{
  return sel_style;
}

id sub_23A8340B4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_style);
  *a2 = result;
  return result;
}

id sub_23A8340E4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStyle_, *a1);
}

char *keypath_get_selector_innerWidthSoft()
{
  return sel_innerWidthSoft;
}

id sub_23A834104@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_innerWidthSoft);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A834134(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInnerWidthSoft_, *a1);
}

char *keypath_get_selector_outerWidthBlurRadius()
{
  return sel_outerWidthBlurRadius;
}

id sub_23A834154@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_outerWidthBlurRadius);
  *a2 = v4;
  return result;
}

id sub_23A834184(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOuterWidthBlurRadius_, *a1);
}

id sub_23A834198@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineOutsets, a2);
}

id sub_23A8341A4(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineOutsets_);
}

id sub_23A8341B0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, (SEL *)&selRef_keylineFadeLengths, a2);
}

id keypath_get_5Tm@<X0>(id *a1@<X0>, SEL *a2@<X3>, _QWORD *a3@<X8>)
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

id sub_23A8341EC(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, (SEL *)&selRef_setKeylineFadeLengths_);
}

id keypath_set_6Tm(double *a1, id *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*a2, *a5, *a1, a1[1], a1[2], a1[3]);
}

void sub_23A83427C(double a1)
{
  _QWORD *v1;
  double v2;
  _BYTE v3[216];
  _OWORD v4[13];
  uint64_t v5;
  _OWORD v6[13];
  uint64_t v7;

  v2 = *(double *)((char *)v1
                 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);
  *(double *)((char *)v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence) = a1;
  if (v2 != a1)
  {
    sub_23A82E744((uint64_t)v1 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v3, &qword_2569C2C00);
    sub_23A82E744((uint64_t)v3, (uint64_t)v4, &qword_2569C2C00);
    if (!sub_23A82E734(v4))
    {
      v6[10] = v4[10];
      v6[11] = v4[11];
      v6[12] = v4[12];
      v7 = v5;
      v6[6] = v4[6];
      v6[7] = v4[7];
      v6[8] = v4[8];
      v6[9] = v4[9];
      v6[2] = v4[2];
      v6[3] = v4[3];
      v6[4] = v4[4];
      v6[5] = v4[5];
      v6[0] = v4[0];
      v6[1] = v4[1];
      (*(void (**)(_OWORD *))((*MEMORY[0x24BEE4EA0] & *v1) + 0x90))(v6);
    }
  }
}

id sub_23A834358()
{
  void *v0;

  return objc_msgSend(v0, sel_removeFromSuperview);
}

BOOL sub_23A834368(uint64_t *a1, uint64_t *a2)
{
  _BOOL8 result;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CATransform3D b;
  CATransform3D a;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  result = 0;
  v4 = *a1;
  v5 = *(_OWORD *)(a1 + 7);
  v36 = *(_OWORD *)(a1 + 5);
  v37 = v5;
  v6 = *(_OWORD *)(a1 + 9);
  v7 = *(_OWORD *)(a1 + 11);
  v8 = *(_OWORD *)(a1 + 13);
  v9 = *(_OWORD *)(a1 + 15);
  v10 = *(_OWORD *)(a1 + 17);
  v11 = *(_OWORD *)(a1 + 19);
  v12 = *(_OWORD *)(a1 + 21);
  v13 = *(_OWORD *)(a1 + 23);
  v14 = *(_OWORD *)(a1 + 25);
  v15 = *a2;
  v16 = *(_OWORD *)(a2 + 5);
  v17 = *(_OWORD *)(a2 + 9);
  v40 = *(_OWORD *)(a2 + 7);
  v41 = v17;
  v38 = v6;
  v39 = v16;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 1), *(float64x2_t *)(a2 + 1)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 3), *(float64x2_t *)(a2 + 3)))), 0xFuLL))) & 1) != 0&& v4 == v15)
  {
    v26 = v14;
    v27 = v13;
    v28 = v12;
    v29 = v11;
    v30 = v10;
    v31 = v9;
    v32 = v8;
    v33 = v7;
    v24 = *(_OWORD *)(a2 + 13);
    v25 = *(_OWORD *)(a2 + 11);
    v22 = *(_OWORD *)(a2 + 17);
    v23 = *(_OWORD *)(a2 + 15);
    v20 = *(_OWORD *)(a2 + 21);
    v21 = *(_OWORD *)(a2 + 19);
    v18 = *(_OWORD *)(a2 + 25);
    v19 = *(_OWORD *)(a2 + 23);
    if ((sub_23A84C2D0() & 1) != 0)
    {
      *(_OWORD *)&a.m11 = v33;
      *(_OWORD *)&a.m13 = v32;
      *(_OWORD *)&a.m21 = v31;
      *(_OWORD *)&a.m23 = v30;
      *(_OWORD *)&a.m31 = v29;
      *(_OWORD *)&a.m33 = v28;
      *(_OWORD *)&a.m41 = v27;
      *(_OWORD *)&a.m43 = v26;
      *(_OWORD *)&b.m11 = v25;
      *(_OWORD *)&b.m13 = v24;
      *(_OWORD *)&b.m21 = v23;
      *(_OWORD *)&b.m23 = v22;
      *(_OWORD *)&b.m31 = v21;
      *(_OWORD *)&b.m33 = v20;
      *(_OWORD *)&b.m41 = v19;
      *(_OWORD *)&b.m43 = v18;
      return CATransform3DEqualToTransform(&a, &b);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_QWORD *sub_23A8344DC(char *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[27];
  char v45;
  objc_super v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[216];

  v3 = (uint64_t)&v1[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry];
  sub_23A82E3C4((uint64_t)v74);
  sub_23A82E744((uint64_t)v74, v3, &qword_2569C2C00);
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence] = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence];
  v46.receiver = v1;
  v46.super_class = (Class)type metadata accessor for DropletParticipantTrackingView();
  v4 = objc_msgSendSuper2(&v46, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  sub_23A82E744((uint64_t)&v47, (uint64_t)&v45, &qword_2569C2C40);
  v5 = &a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
  swift_beginAccess();
  v6 = *(_QWORD **)v5;
  v7 = v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_23A84B618(0, v6[2] + 1, 1, v6);
    *(_QWORD *)v5 = v6;
  }
  v10 = v6[2];
  v9 = v6[3];
  if (v10 >= v9 >> 1)
  {
    v6 = sub_23A84B618((_QWORD *)(v9 > 1), v10 + 1, 1, v6);
    *(_QWORD *)v5 = v6;
  }
  v6[2] = v10 + 1;
  sub_23A82E744((uint64_t)&v45, (uint64_t)&v6[v10 + 4], &qword_2569C2C40);
  v11 = a1;
  objc_msgSend(v11, sel_bounds);
  v42 = v13;
  v43 = v12;
  objc_msgSend(v11, sel_center);
  v40 = v15;
  v41 = v14;
  objc_msgSend(v11, sel_transform);
  v38 = v48;
  v39 = v47;
  v36 = v50;
  v37 = v49;
  v34 = v52;
  v35 = v51;
  objc_msgSend(v11, sel_transform3D);
  v16 = v47;
  v17 = v48;
  v18 = v49;
  v19 = v50;
  v20 = v51;
  v21 = v52;
  v22 = v53;
  v31 = v54;
  v32 = v55;
  v29 = v57;
  v30 = v56;
  v27 = v59;
  v28 = v58;
  v26 = v60;
  v23 = v61;
  v33 = v62;

  v47 = v11;
  v48 = v43;
  v49 = v42;
  v50 = v41;
  v51 = v40;
  v52 = v39;
  v53 = v38;
  v54 = v37;
  v55 = v36;
  v56 = v35;
  v57 = v34;
  v58 = v16;
  v59 = v17;
  v60 = v18;
  v61 = v19;
  v62 = v20;
  v63 = v21;
  v64 = v22;
  v65 = v31;
  v66 = v32;
  v67 = v30;
  v68 = v29;
  v69 = v28;
  v70 = v27;
  v71 = v26;
  v72 = v23;
  v73 = v33;
  v44[0] = v11;
  v44[1] = v43;
  v44[2] = v42;
  v44[3] = v41;
  v44[4] = v40;
  v44[5] = v39;
  v44[6] = v38;
  v44[7] = v37;
  v44[8] = v36;
  v44[9] = v35;
  v44[10] = v34;
  v44[11] = v16;
  v44[12] = v17;
  v44[13] = v18;
  v44[14] = v19;
  v44[15] = v20;
  v44[16] = v21;
  v44[17] = v22;
  v44[18] = v31;
  v44[19] = v32;
  v44[20] = v30;
  v44[21] = v29;
  v44[22] = v28;
  v44[23] = v27;
  v44[24] = v26;
  v44[25] = v23;
  v44[26] = v33;
  nullsub_1(v44);
  v24 = (uint64_t)v7 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry;
  sub_23A82E744((uint64_t)v44, (uint64_t)v7 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, &qword_2569C2C00);
  (*(void (**)(char **))((*MEMORY[0x24BEE4EA0] & *v7) + 0x90))(&v47);
  sub_23A82E744((uint64_t)v44, v24, &qword_2569C2C00);

  return v7;
}

id sub_23A834A20()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletParticipantTrackingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletParticipantTrackingView()
{
  return objc_opt_self();
}

__n128 __swift_memcpy216_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DropletParticipantTrackingView.ParticipantGeometry(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 216))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for DropletParticipantTrackingView.ParticipantGeometry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 216) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 216) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DropletParticipantTrackingView.ParticipantGeometry()
{
  return &type metadata for DropletParticipantTrackingView.ParticipantGeometry;
}

void sub_23A834B7C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;

  sub_23A821C80(a1, (uint64_t)v11);
  v5 = v12;
  if (!v12)
  {
    v10 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = __swift_project_boxed_opaque_existential_0(v11, v12);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v6, v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = sub_23A84C3F0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if (a3)
LABEL_3:
    a3 = (void *)sub_23A84C210();
LABEL_4:
  objc_msgSend(v3, sel__setVelocity_forKey_, v10, a3);
  swift_unknownObjectRelease();

}

id DRPDropletAnimationCoordinator.defaultBehaviorSettings.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings;
  if (*(_QWORD *)(v0 + OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings))
  {
    v2 = *(id *)(v0 + OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings);
  }
  else
  {
    v2 = sub_23A834D6C();
    *(_QWORD *)(v0 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t DRPDropletAnimationCoordinator.defaultBehaviorSettings.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings) = a1;
  return swift_unknownObjectRelease();
}

id sub_23A834D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  id v5;
  id result;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  _BYTE v18[16];

  v0 = sub_23A84C1C8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB3720]), sel_init);
  objc_msgSend(v5, sel_setDefaultValues);
  objc_msgSend(v5, sel_setBehaviorType_, 1);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7B330]), sel_initWithDefaultValues);
  if (result)
  {
    v7 = result;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BEB36F0], v0);
    sub_23A84C1BC();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v4, v0);
    v18[15] = 1;
    sub_23A81A214();
    v14 = sub_23A84C1D4();
    LODWORD(v15) = v9;
    LODWORD(v16) = v11;
    LODWORD(v17) = v13;
    objc_msgSend(v7, sel_setFrameRateRange_highFrameRateReason_, v14, v15, v16, v17);
    objc_msgSend(v5, sel_setPreferredFrameRateRange_, v7);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall DRPDropletAnimationCoordinator.apply(_:animated:tracking:containerView:contextView:)(DRPDropletViewConfiguration *_, Swift::Bool animated, Swift::Bool tracking, DRPDropletContainerView *containerView, DRPDropletContextView *contextView)
{
  uint64_t v8;
  id v9;
  DRPDropletContainerView *v10;
  DRPDropletContextView *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *__return_ptr);
  uint64_t v15;
  id v16;
  DRPDropletContainerView *v17;
  DRPDropletContextView *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *__return_ptr);
  uint64_t v22;
  id v23;
  DRPDropletContainerView *v24;
  DRPDropletContextView *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD *__return_ptr);
  uint64_t v29;
  id v30;
  DRPDropletContainerView *v31;
  DRPDropletContextView *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(_QWORD *__return_ptr);
  uint64_t v36;
  id v37;
  DRPDropletContainerView *v38;
  DRPDropletContextView *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_QWORD *__return_ptr);
  uint64_t v43;
  id v44;
  DRPDropletContainerView *v45;
  DRPDropletContextView *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(_QWORD *__return_ptr);
  uint64_t v50;
  id v51;
  DRPDropletContainerView *v52;
  DRPDropletContextView *v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(_QWORD *__return_ptr);
  uint64_t v57;
  id v58;
  DRPDropletContainerView *v59;
  DRPDropletContextView *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(_QWORD *__return_ptr);
  uint64_t v64;
  id v65;
  DRPDropletContainerView *v66;
  DRPDropletContextView *v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(_QWORD *__return_ptr);
  uint64_t v71;
  id v72;
  DRPDropletContainerView *v73;
  DRPDropletContextView *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(_QWORD *__return_ptr);
  uint64_t v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(_QWORD *__return_ptr);
  uint64_t v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  uint64_t v92;
  BOOL v93;
  uint64_t v94;
  char *v95;
  void *v97;

  -[DRPDropletViewConfiguration copy](_, sel_copy);
  sub_23A84C30C();
  swift_unknownObjectRelease();
  type metadata accessor for DRPDropletViewConfiguration(0);
  swift_dynamicCast();
  v8 = qword_2569C25C8;
  v9 = v97;
  v10 = containerView;
  v11 = contextView;
  if (v8 != -1)
    swift_once();
  v12 = qword_2569C2E90;
  v13 = *(_QWORD *)algn_2569C2E98;
  v14 = (void (*)(_QWORD *__return_ptr))qword_2569C2EA0;
  v15 = unk_2569C2EA8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  sub_23A83563C(v12, v13, v14, v15, animated, tracking, v16, v17, v18, v95);

  if (qword_2569C25C0 != -1)
    swift_once();
  v19 = qword_2569C2E70;
  v20 = *(_QWORD *)algn_2569C2E78;
  v21 = (void (*)(_QWORD *__return_ptr))qword_2569C2E80;
  v22 = unk_2569C2E88;
  v23 = v16;
  v24 = v17;
  v25 = v18;
  sub_23A835D60(v19, v20, v21, v22, animated, tracking, v23, v24, v25, v95);

  if (qword_2542D7E10 != -1)
    swift_once();
  v26 = qword_2542D7DF0;
  v27 = *(_QWORD *)algn_2542D7DF8;
  v28 = (void (*)(_QWORD *__return_ptr))qword_2542D7E00;
  v29 = unk_2542D7E08;
  v30 = v23;
  v31 = v24;
  v32 = v25;
  sub_23A836488(v26, v27, v28, v29, animated, tracking, v30, v31, v32, v95);

  if (qword_2542D7E78 != -1)
    swift_once();
  v33 = qword_2542D7E50;
  v34 = *(_QWORD *)algn_2542D7E58;
  v35 = (void (*)(_QWORD *__return_ptr))qword_2542D7E60;
  v36 = unk_2542D7E68;
  v37 = v30;
  v38 = v31;
  v39 = v32;
  sub_23A836BC4(v33, v34, v35, v36, animated, tracking, v37, v38, v39, v95);

  if (qword_2542D7E40 != -1)
    swift_once();
  v40 = qword_2542D7E20;
  v41 = *(_QWORD *)algn_2542D7E28;
  v42 = (void (*)(_QWORD *__return_ptr))qword_2542D7E30;
  v43 = unk_2542D7E38;
  v44 = v37;
  v45 = v38;
  v46 = v39;
  sub_23A8372E8(v40, v41, v42, v43, animated, tracking, v44, v45, v46, v95);

  if (qword_2542D7F30 != -1)
    swift_once();
  v47 = qword_2542D7F10;
  v48 = *(_QWORD *)algn_2542D7F18;
  v49 = (void (*)(_QWORD *__return_ptr))qword_2542D7F20;
  v50 = unk_2542D7F28;
  v51 = v44;
  v52 = v45;
  v53 = v46;
  sub_23A837A34(v47, v48, v49, v50, animated, tracking, v51, v52, v53, v95);

  if (qword_2542D7EA0 != -1)
    swift_once();
  v54 = qword_2542D7E80;
  v55 = *(_QWORD *)algn_2542D7E88;
  v56 = (void (*)(_QWORD *__return_ptr))qword_2542D7E90;
  v57 = unk_2542D7E98;
  v58 = v51;
  v59 = v52;
  v60 = v53;
  sub_23A838158(v54, v55, v56, v57, animated, tracking, v58, v59, v60, v95);

  if (qword_2542D7ED8 != -1)
    swift_once();
  v61 = qword_2542D7EB0;
  v62 = *(_QWORD *)algn_2542D7EB8;
  v63 = (void (*)(_QWORD *__return_ptr))qword_2542D7EC0;
  v64 = unk_2542D7EC8;
  v65 = v58;
  v66 = v59;
  v67 = v60;
  sub_23A8388B0(v61, v62, v63, v64, animated, tracking, v65, v66, v67, v95);

  if (qword_2542D7F08 != -1)
    swift_once();
  v68 = qword_2542D7EE0;
  v69 = *(_QWORD *)algn_2542D7EE8;
  v70 = (void (*)(_QWORD *__return_ptr))qword_2542D7EF0;
  v71 = unk_2542D7EF8;
  v72 = v65;
  v73 = v66;
  v74 = v67;
  sub_23A839008(v68, v69, v70, v71, animated, tracking, v72, v73, v74, v95);

  if (qword_2542D7F60 != -1)
    swift_once();
  v75 = qword_2542D7F40;
  v76 = *(_QWORD *)algn_2542D7F48;
  v77 = (void (*)(_QWORD *__return_ptr))qword_2542D7F50;
  v78 = unk_2542D7F58;
  v79 = v72;
  v80 = v73;
  v81 = v74;
  sub_23A839764(v75, v76, v77, v78, animated, tracking, v79, v80, v81, v95);

  if (qword_2542D7F98 != -1)
    swift_once();
  v82 = qword_2542D7F70;
  v83 = *(_QWORD *)algn_2542D7F78;
  v84 = (void (*)(_QWORD *__return_ptr))qword_2542D7F80;
  v85 = unk_2542D7F88;
  v86 = v79;
  v87 = v80;
  v88 = v81;
  sub_23A839E80(v82, v83, v84, v85, animated, tracking, v86, v87, v88, v95);

  v89 = *(void **)&v95[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable];
  v90 = v87;
  v91 = v89;
  objc_msgSend(v91, sel_setObject_forKey_, v86, v90);

  v92 = *(_QWORD *)&v95[OBJC_IVAR___DRPDropletAnimationCoordinator_id];
  v93 = __OFADD__(v92, 1);
  v94 = v92 + 1;
  if (v93)
    __break(1u);
  else
    *(_QWORD *)&v95[OBJC_IVAR___DRPDropletAnimationCoordinator_id] = v94;
}

id sub_23A835604(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_boundaryOutsets);
  return objc_msgSend(a4, sel_setBoundaryOutsets_);
}

uint64_t sub_23A83563C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v43;
  uint64_t v44;
  char *v45;
  void (*v46)(_QWORD *__return_ptr);
  uint64_t v47;
  void (*v49)(void *);
  char v50;
  void (*v51)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  uint64_t (*v52)(char, char);
  uint64_t v53;
  id v54;
  uint64_t v55;
  _QWORD v56[17];
  _BYTE v57[136];
  uint64_t v58;
  _BYTE v59[136];
  _BYTE v60[136];
  _QWORD v61[17];
  _QWORD v62[17];
  _BYTE v63[144];

  v17 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v17)
  {
    v18 = v17;
    a3(v61);
    sub_23A83B674((uint64_t)v61, (uint64_t)v62);

    sub_23A83B674((uint64_t)v62, (uint64_t)v57);
    nullsub_1(v57);
  }
  else
  {
    sub_23A83B654((uint64_t)v57);
  }
  sub_23A82E744((uint64_t)v57, (uint64_t)v63, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v62, a7);
  sub_23A83B674((uint64_t)v62, (uint64_t)v59);
  sub_23A82E744((uint64_t)v63, (uint64_t)v60, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v60) == 1)
  {
    v45 = a10;
    v50 = a5;
    sub_23A83B674((uint64_t)v59, (uint64_t)v56);
    nullsub_1(v56);
    sub_23A82E744((uint64_t)v63, (uint64_t)v57, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v56, (uint64_t)&v58, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v57);
  }
  else
  {
    sub_23A82E744((uint64_t)v63, (uint64_t)v56, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v56, (uint64_t)v57);
    sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v57);
    v20 = v19;
    sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v20 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v45 = a10;
    v50 = a5;
  }
  v21 = (void *)sub_23A84C210();
  v22 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v21);

  v46 = a3;
  v47 = a4;
  if (v22)
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v22;
    v49 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v49 = 0;
    v23 = 0;
  }
  v24 = (void *)sub_23A84C210();
  v25 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v24);

  v55 = v23;
  if (v25)
  {
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v25;
    v52 = sub_23A83C7CC;
    v53 = v26;
  }
  else
  {
    v52 = 0;
    v53 = 0;
  }
  v56[0] = sub_23A84C3E4();
  v56[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v54 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((v50 & 1) == 0)
  {
    objc_msgSend(a7, sel_boundaryOutsets);
    objc_msgSend(a8, sel_setBoundaryOutsets_);
    if (v22)
    {
      swift_retain();
      v49(a7);
      sub_23A823048((uint64_t)v49);
    }
    if (v25)
    {
      swift_retain();
      v52(1, 0);
      sub_23A823048((uint64_t)v52);
    }
    v41 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v41)
    {
      v42 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v41;
      v43 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v42)[2](v42, v43, 1, 0);

      _Block_release(v42);
    }
    if (v54)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v49);
      sub_23A823048((uint64_t)v52);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v49);
      sub_23A823048((uint64_t)v52);
    }
    return sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(v45, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v51 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&v45[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A835604;
  *(_QWORD *)(v32 + 24) = 0;
  v44 = a1;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = a6 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = a8;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v49;
  *(_QWORD *)(v32 + 72) = v55;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v52;
  *(_QWORD *)(v33 + 24) = v53;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = a6 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = a8;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v46;
  *(_QWORD *)(v33 + 88) = v47;
  *(_QWORD *)(v33 + 96) = v54;
  v34 = a7;
  v35 = a8;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v49);
  sub_23A821984((uint64_t)v52);
  swift_retain();
  swift_unknownObjectRetain();
  v51(v44, a2, v37, v30, a6 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v49);
  sub_23A823048((uint64_t)v52);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A835D60(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  void (*v24)(void *);
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v44;
  char v45;
  void (*v46)(_QWORD *__return_ptr);
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  void (*v50)(char, char);
  id v51;
  uint64_t v52;
  _QWORD v54[17];
  _BYTE v55[136];
  uint64_t v56;
  _BYTE v57[136];
  _BYTE v58[136];
  _QWORD v59[17];
  _QWORD v60[17];
  _BYTE v61[144];

  v17 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v17)
  {
    v18 = v17;
    a3(v59);
    sub_23A83B674((uint64_t)v59, (uint64_t)v60);

    sub_23A83B674((uint64_t)v60, (uint64_t)v55);
    nullsub_1(v55);
  }
  else
  {
    sub_23A83B654((uint64_t)v55);
  }
  sub_23A82E744((uint64_t)v55, (uint64_t)v61, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v60, a7);
  sub_23A83B674((uint64_t)v60, (uint64_t)v57);
  sub_23A82E744((uint64_t)v61, (uint64_t)v58, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v58) == 1)
  {
    v45 = a6;
    sub_23A83B674((uint64_t)v57, (uint64_t)v54);
    nullsub_1(v54);
    sub_23A82E744((uint64_t)v61, (uint64_t)v55, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v54, (uint64_t)&v56, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v55);
  }
  else
  {
    sub_23A82E744((uint64_t)v61, (uint64_t)v54, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v54, (uint64_t)v55);
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v55);
    v20 = v19;
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v20 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v45 = a6;
  }
  v21 = (void *)sub_23A84C210();
  v22 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v21);

  v46 = a3;
  v47 = a4;
  if (v22)
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v22;
    v24 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v52 = v23;
  if (v26)
  {
    v48 = swift_allocObject();
    *(_QWORD *)(v48 + 16) = v26;
    v50 = (void (*)(char, char))sub_23A83C7CC;
  }
  else
  {
    v50 = 0;
    v48 = 0;
  }
  v54[0] = sub_23A84C3E4();
  v54[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v51 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((a5 & 1) == 0)
  {
    objc_msgSend(a8, sel_setBoundaryEdges_, objc_msgSend(a7, sel_boundaryEdges));
    v41 = (uint64_t)v24;
    if (v22)
    {
      swift_retain();
      v24(a7);
      sub_23A823048((uint64_t)v24);
    }
    if (v26)
    {
      swift_retain();
      v50(1, 0);
      sub_23A823048((uint64_t)v50);
    }
    v42 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v42)
    {
      v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v42;
      v44 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v43)[2](v43, v44, 1, 0);

      _Block_release(v43);
    }
    if (v51)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v41);
      sub_23A823048((uint64_t)v50);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v41);
      sub_23A823048((uint64_t)v50);
    }
    return sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v49 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A83A59C;
  *(_QWORD *)(v32 + 24) = 0;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = v45 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = a8;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v24;
  *(_QWORD *)(v32 + 72) = v52;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v50;
  *(_QWORD *)(v33 + 24) = v48;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = v45 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = a8;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v46;
  *(_QWORD *)(v33 + 88) = v47;
  *(_QWORD *)(v33 + 96) = v51;
  v34 = a7;
  v35 = a8;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v24);
  sub_23A821984((uint64_t)v50);
  swift_retain();
  swift_unknownObjectRetain();
  v49(a1, a2, v37, v30, v45 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v24);
  sub_23A823048((uint64_t)v50);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A836488(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v18;
  id v19;
  char v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  void (*v25)(void *);
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v42;
  uint64_t v43;
  id v44;
  void (**v45)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v46;
  uint64_t v47;
  char v48;
  void (*v49)(_QWORD *__return_ptr);
  uint64_t v50;
  uint64_t v51;
  char v52;
  void (*v53)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  void (*v54)(char, char);
  id v55;
  uint64_t v56;
  _QWORD v57[17];
  _BYTE v58[136];
  uint64_t v59;
  _BYTE v60[136];
  _BYTE v61[136];
  _QWORD v62[17];
  _QWORD v63[17];
  _BYTE v64[144];

  v18 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v18)
  {
    v19 = v18;
    a3(v62);
    sub_23A83B674((uint64_t)v62, (uint64_t)v63);

    sub_23A83B674((uint64_t)v63, (uint64_t)v58);
    nullsub_1(v58);
  }
  else
  {
    sub_23A83B654((uint64_t)v58);
  }
  sub_23A82E744((uint64_t)v58, (uint64_t)v64, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v63, a7);
  sub_23A83B674((uint64_t)v63, (uint64_t)v60);
  sub_23A82E744((uint64_t)v64, (uint64_t)v61, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v61) == 1)
  {
    v52 = a5;
    sub_23A83B674((uint64_t)v60, (uint64_t)v57);
    nullsub_1(v57);
    sub_23A82E744((uint64_t)v64, (uint64_t)v58, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v57, (uint64_t)&v59, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v58);
  }
  else
  {
    sub_23A82E744((uint64_t)v64, (uint64_t)v57, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v57, (uint64_t)v58);
    sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v58);
    v21 = v20;
    sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v21 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v52 = a5;
  }
  v22 = (void *)sub_23A84C210();
  v23 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v22);

  v50 = a4;
  v49 = a3;
  v48 = a6;
  if (v23)
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v25 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v25 = 0;
    v24 = 0;
  }
  v26 = (void *)sub_23A84C210();
  v27 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v26);

  v56 = v24;
  if (v27)
  {
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = v27;
    v54 = (void (*)(char, char))sub_23A83C7CC;
  }
  else
  {
    v54 = 0;
    v51 = 0;
  }
  v57[0] = sub_23A84C3E4();
  v57[1] = v28;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v29 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v55 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v29);

  if ((v52 & 1) == 0)
  {
    v42 = objc_msgSend(a7, sel_dropletColor);
    objc_msgSend(a9, sel_setDropletColor_, v42);

    v43 = (uint64_t)v25;
    if (v23)
    {
      swift_retain();
      v25(a7);
      sub_23A823048((uint64_t)v25);
    }
    if (v27)
    {
      swift_retain();
      v54(1, 0);
      sub_23A823048((uint64_t)v54);
    }
    v44 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v44)
    {
      v45 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v44;
      v46 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v45)[2](v45, v46, 1, 0);

      _Block_release(v45);
    }
    if (v55)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v43);
      sub_23A823048((uint64_t)v54);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v43);
      sub_23A823048((uint64_t)v54);
    }
    return sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v30 = (void *)sub_23A84C210();
  v31 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v30);

  if (!v31)
  {
    v32 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v31 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v53 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = sub_23A83A5D8;
  *(_QWORD *)(v33 + 24) = 0;
  v47 = a1;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = v48 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = a8;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = v25;
  *(_QWORD *)(v33 + 72) = v56;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v54;
  *(_QWORD *)(v34 + 24) = v51;
  *(_BYTE *)(v34 + 32) = 1;
  *(_BYTE *)(v34 + 33) = v48 & 1;
  *(_QWORD *)(v34 + 40) = a7;
  *(_QWORD *)(v34 + 48) = a8;
  *(_QWORD *)(v34 + 56) = a9;
  *(_QWORD *)(v34 + 64) = a1;
  *(_QWORD *)(v34 + 72) = a2;
  *(_QWORD *)(v34 + 80) = v49;
  *(_QWORD *)(v34 + 88) = v50;
  *(_QWORD *)(v34 + 96) = v55;
  v35 = a7;
  v36 = a8;
  v37 = a9;
  swift_bridgeObjectRetain();
  v38 = v35;
  v39 = v36;
  v40 = v37;
  swift_retain();
  sub_23A821984((uint64_t)v25);
  sub_23A821984((uint64_t)v54);
  swift_retain();
  swift_unknownObjectRetain();
  v53(v47, a2, v38, v31, v48 & 1, sub_23A83B830, v33, sub_23A83B838, v34);
  sub_23A83BC68((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v25);
  sub_23A823048((uint64_t)v54);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A836BC4(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v18;
  id v19;
  char v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v44;
  void (**v45)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v46;
  uint64_t v47;
  char v48;
  void *v49;
  void (*v50)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  void (*v51)(_QWORD *__return_ptr);
  uint64_t v52;
  void (*v53)(void *);
  uint64_t (*v54)(char, char);
  uint64_t v55;
  id v56;
  uint64_t v57;
  _QWORD v58[17];
  _BYTE v59[136];
  uint64_t v60;
  _BYTE v61[136];
  _BYTE v62[136];
  _QWORD v63[17];
  _QWORD v64[17];
  _BYTE v65[144];

  v18 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v18)
  {
    v19 = v18;
    a3(v63);
    sub_23A83B674((uint64_t)v63, (uint64_t)v64);

    sub_23A83B674((uint64_t)v64, (uint64_t)v59);
    nullsub_1(v59);
  }
  else
  {
    sub_23A83B654((uint64_t)v59);
  }
  sub_23A82E744((uint64_t)v59, (uint64_t)v65, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v64, a7);
  sub_23A83B674((uint64_t)v64, (uint64_t)v61);
  sub_23A82E744((uint64_t)v65, (uint64_t)v62, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v62) == 1)
  {
    v48 = a6;
    v49 = a8;
    sub_23A83B674((uint64_t)v61, (uint64_t)v58);
    nullsub_1(v58);
    sub_23A82E744((uint64_t)v65, (uint64_t)v59, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v58, (uint64_t)&v60, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v59);
  }
  else
  {
    sub_23A82E744((uint64_t)v65, (uint64_t)v58, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v58, (uint64_t)v59);
    sub_23A83BC68((uint64_t)v65, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v59);
    v21 = v20;
    sub_23A83BC68((uint64_t)v65, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v21 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v65, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v48 = a6;
    v49 = a8;
  }
  v22 = (void *)sub_23A84C210();
  v23 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v22);

  v51 = a3;
  v52 = a4;
  if (v23)
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v53 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v53 = 0;
    v24 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v57 = v24;
  v27 = a5;
  if (v26)
  {
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v26;
    v54 = sub_23A83C7CC;
    v55 = v28;
  }
  else
  {
    v54 = 0;
    v55 = 0;
  }
  v58[0] = sub_23A84C3E4();
  v58[1] = v29;
  sub_23A84C240();
  v30 = a2;
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v31 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v56 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v31);

  if ((v27 & 1) == 0)
  {
    objc_msgSend(a7, sel_dropletRadius);
    objc_msgSend(a9, sel_setDropletRadius_);
    if (v23)
    {
      swift_retain();
      v53(a7);
      sub_23A823048((uint64_t)v53);
    }
    if (v26)
    {
      swift_retain();
      v54(1, 0);
      sub_23A823048((uint64_t)v54);
    }
    v44 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v44)
    {
      v45 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v44;
      v46 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v45)[2](v45, v46, 1, 0);

      _Block_release(v45);
    }
    if (v56)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v53);
      sub_23A823048((uint64_t)v54);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v53);
      sub_23A823048((uint64_t)v54);
    }
    return sub_23A83BC68((uint64_t)v65, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v32 = (void *)sub_23A84C210();
  v33 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v32);

  if (!v33)
  {
    v34 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v33 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v50 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = sub_23A83A630;
  *(_QWORD *)(v35 + 24) = 0;
  v47 = a1;
  *(_BYTE *)(v35 + 32) = 1;
  *(_BYTE *)(v35 + 33) = v48 & 1;
  *(_QWORD *)(v35 + 40) = a7;
  *(_QWORD *)(v35 + 48) = v49;
  *(_QWORD *)(v35 + 56) = a9;
  *(_QWORD *)(v35 + 64) = v53;
  *(_QWORD *)(v35 + 72) = v57;
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = v54;
  *(_QWORD *)(v36 + 24) = v55;
  *(_BYTE *)(v36 + 32) = 1;
  *(_BYTE *)(v36 + 33) = v48 & 1;
  *(_QWORD *)(v36 + 40) = a7;
  *(_QWORD *)(v36 + 48) = v49;
  *(_QWORD *)(v36 + 56) = a9;
  *(_QWORD *)(v36 + 64) = a1;
  *(_QWORD *)(v36 + 72) = v30;
  *(_QWORD *)(v36 + 80) = v51;
  *(_QWORD *)(v36 + 88) = v52;
  *(_QWORD *)(v36 + 96) = v56;
  v37 = a7;
  v38 = v49;
  v39 = a9;
  swift_bridgeObjectRetain();
  v40 = v37;
  v41 = v38;
  v42 = v39;
  swift_retain();
  sub_23A821984((uint64_t)v53);
  sub_23A821984((uint64_t)v54);
  swift_retain();
  swift_unknownObjectRetain();
  v50(v47, v30, v40, v33, v48 & 1, sub_23A83B830, v35, sub_23A83B838, v36);
  sub_23A83BC68((uint64_t)v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v53);
  sub_23A823048((uint64_t)v54);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v65, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A8372E8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v18;
  id v19;
  char v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v43;
  uint64_t v44;
  void (*v45)(_QWORD *__return_ptr);
  uint64_t v46;
  uint64_t v47;
  char v48;
  void (*v49)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  void *v50;
  void (*v51)(char, char);
  void (*v52)(void *);
  id v53;
  uint64_t v54;
  _QWORD v55[17];
  _BYTE v56[136];
  uint64_t v57;
  _BYTE v58[136];
  _BYTE v59[136];
  _QWORD v60[17];
  _QWORD v61[17];
  _BYTE v62[144];

  v18 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v18)
  {
    v19 = v18;
    a3(v60);
    sub_23A83B674((uint64_t)v60, (uint64_t)v61);

    sub_23A83B674((uint64_t)v61, (uint64_t)v56);
    nullsub_1(v56);
  }
  else
  {
    sub_23A83B654((uint64_t)v56);
  }
  sub_23A82E744((uint64_t)v56, (uint64_t)v62, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v61, a7);
  sub_23A83B674((uint64_t)v61, (uint64_t)v58);
  sub_23A82E744((uint64_t)v62, (uint64_t)v59, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v59) == 1)
  {
    v48 = a5;
    v45 = a3;
    sub_23A83B674((uint64_t)v58, (uint64_t)v55);
    nullsub_1(v55);
    sub_23A82E744((uint64_t)v62, (uint64_t)v56, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v55, (uint64_t)&v57, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v56);
  }
  else
  {
    sub_23A82E744((uint64_t)v62, (uint64_t)v55, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v55, (uint64_t)v56);
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v56);
    v21 = v20;
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v21 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v48 = a5;
    v45 = a3;
  }
  v22 = (void *)sub_23A84C210();
  v23 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v22);

  v46 = a4;
  v50 = a8;
  if (v23)
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v52 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v52 = 0;
    v24 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v54 = v24;
  if (v26)
  {
    v47 = swift_allocObject();
    *(_QWORD *)(v47 + 16) = v26;
    v51 = (void (*)(char, char))sub_23A83C7CC;
  }
  else
  {
    v51 = 0;
    v47 = 0;
  }
  v55[0] = sub_23A84C3E4();
  v55[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v53 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((v48 & 1) == 0)
  {
    objc_msgSend(a9, sel_applyKeylineStyle_forContainerView_, objc_msgSend(a7, sel_keylineStyle), v50);
    swift_unknownObjectRelease();
    if (v23)
    {
      swift_retain();
      v52(a7);
      sub_23A823048((uint64_t)v52);
    }
    if (v26)
    {
      swift_retain();
      v51(1, 0);
      sub_23A823048((uint64_t)v51);
    }
    v41 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v41)
    {
      v42 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v41;
      v43 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v42)[2](v42, v43, 1, 0);

      _Block_release(v42);
    }
    if (v53)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v52);
      sub_23A823048((uint64_t)v51);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v52);
      sub_23A823048((uint64_t)v51);
    }
    return sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v49 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A83A668;
  *(_QWORD *)(v32 + 24) = 0;
  v44 = a1;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = a6 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = v50;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v52;
  *(_QWORD *)(v32 + 72) = v54;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v51;
  *(_QWORD *)(v33 + 24) = v47;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = a6 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = v50;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v45;
  *(_QWORD *)(v33 + 88) = v46;
  *(_QWORD *)(v33 + 96) = v53;
  v34 = a7;
  v35 = v50;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v52);
  sub_23A821984((uint64_t)v51);
  swift_retain();
  swift_unknownObjectRetain();
  v49(v44, a2, v37, v30, a6 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v52);
  sub_23A823048((uint64_t)v51);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A837A34(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  void (*v24)(void *);
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v44;
  char v45;
  void (*v46)(_QWORD *__return_ptr);
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  void (*v50)(char, char);
  id v51;
  uint64_t v52;
  _QWORD v54[17];
  _BYTE v55[136];
  uint64_t v56;
  _BYTE v57[136];
  _BYTE v58[136];
  _QWORD v59[17];
  _QWORD v60[17];
  _BYTE v61[144];

  v17 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v17)
  {
    v18 = v17;
    a3(v59);
    sub_23A83B674((uint64_t)v59, (uint64_t)v60);

    sub_23A83B674((uint64_t)v60, (uint64_t)v55);
    nullsub_1(v55);
  }
  else
  {
    sub_23A83B654((uint64_t)v55);
  }
  sub_23A82E744((uint64_t)v55, (uint64_t)v61, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v60, a7);
  sub_23A83B674((uint64_t)v60, (uint64_t)v57);
  sub_23A82E744((uint64_t)v61, (uint64_t)v58, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v58) == 1)
  {
    v45 = a6;
    sub_23A83B674((uint64_t)v57, (uint64_t)v54);
    nullsub_1(v54);
    sub_23A82E744((uint64_t)v61, (uint64_t)v55, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v54, (uint64_t)&v56, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v55);
  }
  else
  {
    sub_23A82E744((uint64_t)v61, (uint64_t)v54, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v54, (uint64_t)v55);
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v55);
    v20 = v19;
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v20 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v45 = a6;
  }
  v21 = (void *)sub_23A84C210();
  v22 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v21);

  v46 = a3;
  v47 = a4;
  if (v22)
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v22;
    v24 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v52 = v23;
  if (v26)
  {
    v48 = swift_allocObject();
    *(_QWORD *)(v48 + 16) = v26;
    v50 = (void (*)(char, char))sub_23A83C7CC;
  }
  else
  {
    v50 = 0;
    v48 = 0;
  }
  v54[0] = sub_23A84C3E4();
  v54[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v51 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((a5 & 1) == 0)
  {
    objc_msgSend(a7, sel_containerCornerRadius);
    objc_msgSend(a8, sel_setContinuousCornerRadius_);
    v41 = (uint64_t)v24;
    if (v22)
    {
      swift_retain();
      v24(a7);
      sub_23A823048((uint64_t)v24);
    }
    if (v26)
    {
      swift_retain();
      v50(1, 0);
      sub_23A823048((uint64_t)v50);
    }
    v42 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v42)
    {
      v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v42;
      v44 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v43)[2](v43, v44, 1, 0);

      _Block_release(v43);
    }
    if (v51)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v41);
      sub_23A823048((uint64_t)v50);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v41);
      sub_23A823048((uint64_t)v50);
    }
    return sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v49 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A83A6C8;
  *(_QWORD *)(v32 + 24) = 0;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = v45 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = a8;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v24;
  *(_QWORD *)(v32 + 72) = v52;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v50;
  *(_QWORD *)(v33 + 24) = v48;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = v45 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = a8;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v46;
  *(_QWORD *)(v33 + 88) = v47;
  *(_QWORD *)(v33 + 96) = v51;
  v34 = a7;
  v35 = a8;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v24);
  sub_23A821984((uint64_t)v50);
  swift_retain();
  swift_unknownObjectRetain();
  v49(a1, a2, v37, v30, v45 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v24);
  sub_23A823048((uint64_t)v50);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A838158(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v18;
  id v19;
  char v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v43;
  uint64_t v44;
  void (*v45)(_QWORD *__return_ptr);
  uint64_t v46;
  void (*v47)(char, char);
  char v48;
  void (*v49)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  id v50;
  uint64_t v51;
  void (*v52)(void *);
  id v53;
  uint64_t v54;
  _QWORD v55[17];
  _BYTE v56[136];
  uint64_t v57;
  _BYTE v58[136];
  _BYTE v59[136];
  _QWORD v60[17];
  _QWORD v61[17];
  _BYTE v62[144];

  v18 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v18)
  {
    v19 = v18;
    a3(v60);
    sub_23A83B674((uint64_t)v60, (uint64_t)v61);

    sub_23A83B674((uint64_t)v61, (uint64_t)v56);
    nullsub_1(v56);
  }
  else
  {
    sub_23A83B654((uint64_t)v56);
  }
  sub_23A82E744((uint64_t)v56, (uint64_t)v62, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v61, a7);
  sub_23A83B674((uint64_t)v61, (uint64_t)v58);
  sub_23A82E744((uint64_t)v62, (uint64_t)v59, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v59) == 1)
  {
    v48 = a5;
    v45 = a3;
    sub_23A83B674((uint64_t)v58, (uint64_t)v55);
    nullsub_1(v55);
    sub_23A82E744((uint64_t)v62, (uint64_t)v56, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v55, (uint64_t)&v57, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v56);
  }
  else
  {
    sub_23A82E744((uint64_t)v62, (uint64_t)v55, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v55, (uint64_t)v56);
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v56);
    v21 = v20;
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v21 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v48 = a5;
    v45 = a3;
  }
  v22 = (void *)sub_23A84C210();
  v23 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v22);

  v46 = a4;
  v50 = a8;
  if (v23)
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v52 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v52 = 0;
    v24 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v54 = v24;
  if (v26)
  {
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = v26;
    v47 = (void (*)(char, char))sub_23A83C7CC;
  }
  else
  {
    v47 = 0;
    v51 = 0;
  }
  v55[0] = sub_23A84C3E4();
  v55[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v53 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((v48 & 1) == 0)
  {
    objc_msgSend(a7, sel_containerWidth);
    objc_msgSend(v50, sel_bounds);
    objc_msgSend(v50, sel_setBounds_);
    if (v23)
    {
      swift_retain();
      v52(a7);
      sub_23A823048((uint64_t)v52);
    }
    if (v26)
    {
      swift_retain();
      v47(1, 0);
      sub_23A823048((uint64_t)v47);
    }
    v41 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v41)
    {
      v42 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v41;
      v43 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v42)[2](v42, v43, 1, 0);

      _Block_release(v42);
    }
    if (v53)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v52);
      sub_23A823048((uint64_t)v47);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v52);
      sub_23A823048((uint64_t)v47);
    }
    return sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v49 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A83A700;
  *(_QWORD *)(v32 + 24) = 0;
  v44 = a1;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = a6 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = v50;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v52;
  *(_QWORD *)(v32 + 72) = v54;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v47;
  *(_QWORD *)(v33 + 24) = v51;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = a6 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = v50;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v45;
  *(_QWORD *)(v33 + 88) = v46;
  *(_QWORD *)(v33 + 96) = v53;
  v34 = a7;
  v35 = v50;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v52);
  sub_23A821984((uint64_t)v47);
  swift_retain();
  swift_unknownObjectRetain();
  v49(v44, a2, v37, v30, a6 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v52);
  sub_23A823048((uint64_t)v47);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A8388B0(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v18;
  id v19;
  char v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v43;
  uint64_t v44;
  void (*v45)(_QWORD *__return_ptr);
  uint64_t v46;
  void (*v47)(char, char);
  char v48;
  void (*v49)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  id v50;
  uint64_t v51;
  void (*v52)(void *);
  id v53;
  uint64_t v54;
  _QWORD v55[17];
  _BYTE v56[136];
  uint64_t v57;
  _BYTE v58[136];
  _BYTE v59[136];
  _QWORD v60[17];
  _QWORD v61[17];
  _BYTE v62[144];

  v18 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v18)
  {
    v19 = v18;
    a3(v60);
    sub_23A83B674((uint64_t)v60, (uint64_t)v61);

    sub_23A83B674((uint64_t)v61, (uint64_t)v56);
    nullsub_1(v56);
  }
  else
  {
    sub_23A83B654((uint64_t)v56);
  }
  sub_23A82E744((uint64_t)v56, (uint64_t)v62, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v61, a7);
  sub_23A83B674((uint64_t)v61, (uint64_t)v58);
  sub_23A82E744((uint64_t)v62, (uint64_t)v59, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v59) == 1)
  {
    v48 = a5;
    v45 = a3;
    sub_23A83B674((uint64_t)v58, (uint64_t)v55);
    nullsub_1(v55);
    sub_23A82E744((uint64_t)v62, (uint64_t)v56, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v55, (uint64_t)&v57, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v56);
  }
  else
  {
    sub_23A82E744((uint64_t)v62, (uint64_t)v55, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v55, (uint64_t)v56);
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v56);
    v21 = v20;
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v21 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v48 = a5;
    v45 = a3;
  }
  v22 = (void *)sub_23A84C210();
  v23 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v22);

  v46 = a4;
  v50 = a8;
  if (v23)
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v52 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v52 = 0;
    v24 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v54 = v24;
  if (v26)
  {
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = v26;
    v47 = (void (*)(char, char))sub_23A83C7CC;
  }
  else
  {
    v47 = 0;
    v51 = 0;
  }
  v55[0] = sub_23A84C3E4();
  v55[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v53 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((v48 & 1) == 0)
  {
    objc_msgSend(a7, sel_containerHeight);
    objc_msgSend(v50, sel_bounds);
    objc_msgSend(v50, sel_setBounds_);
    if (v23)
    {
      swift_retain();
      v52(a7);
      sub_23A823048((uint64_t)v52);
    }
    if (v26)
    {
      swift_retain();
      v47(1, 0);
      sub_23A823048((uint64_t)v47);
    }
    v41 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v41)
    {
      v42 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v41;
      v43 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v42)[2](v42, v43, 1, 0);

      _Block_release(v42);
    }
    if (v53)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v52);
      sub_23A823048((uint64_t)v47);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v52);
      sub_23A823048((uint64_t)v47);
    }
    return sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v49 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A83A758;
  *(_QWORD *)(v32 + 24) = 0;
  v44 = a1;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = a6 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = v50;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v52;
  *(_QWORD *)(v32 + 72) = v54;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v47;
  *(_QWORD *)(v33 + 24) = v51;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = a6 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = v50;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v45;
  *(_QWORD *)(v33 + 88) = v46;
  *(_QWORD *)(v33 + 96) = v53;
  v34 = a7;
  v35 = v50;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v52);
  sub_23A821984((uint64_t)v47);
  swift_retain();
  swift_unknownObjectRetain();
  v49(v44, a2, v37, v30, a6 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v52);
  sub_23A823048((uint64_t)v47);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A839008(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v18;
  id v19;
  char v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v43;
  uint64_t v44;
  void (*v45)(_QWORD *__return_ptr);
  uint64_t v46;
  void (*v47)(char, char);
  char v48;
  void (*v49)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  id v50;
  uint64_t v51;
  void (*v52)(void *);
  id v53;
  uint64_t v54;
  _QWORD v55[2];
  _BYTE v56[136];
  uint64_t v57;
  _BYTE v58[136];
  _BYTE v59[136];
  _QWORD v60[17];
  _QWORD v61[17];
  _BYTE v62[144];

  v18 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v18)
  {
    v19 = v18;
    a3(v60);
    sub_23A83B674((uint64_t)v60, (uint64_t)v61);

    sub_23A83B674((uint64_t)v61, (uint64_t)v56);
    nullsub_1(v56);
  }
  else
  {
    sub_23A83B654((uint64_t)v56);
  }
  sub_23A82E744((uint64_t)v56, (uint64_t)v62, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v61, a7);
  sub_23A83B674((uint64_t)v61, (uint64_t)v58);
  sub_23A82E744((uint64_t)v62, (uint64_t)v59, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v59) == 1)
  {
    v48 = a5;
    v45 = a3;
    sub_23A83B674((uint64_t)v58, (uint64_t)v55);
    nullsub_1(v55);
    sub_23A82E744((uint64_t)v62, (uint64_t)v56, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v55, (uint64_t)&v57, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v56);
  }
  else
  {
    sub_23A82E744((uint64_t)v62, (uint64_t)v55, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v55, (uint64_t)v56);
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v56);
    v21 = v20;
    sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v21 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v48 = a5;
    v45 = a3;
  }
  v22 = (void *)sub_23A84C210();
  v23 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v22);

  v46 = a4;
  v50 = a8;
  if (v23)
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v52 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v52 = 0;
    v24 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v54 = v24;
  if (v26)
  {
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = v26;
    v47 = (void (*)(char, char))sub_23A83C7CC;
  }
  else
  {
    v47 = 0;
    v51 = 0;
  }
  v55[0] = sub_23A84C3E4();
  v55[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v53 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((v48 & 1) == 0)
  {
    objc_msgSend(a7, sel_containerTransform);
    objc_msgSend(v50, sel_setTransform3D_, v55);
    if (v23)
    {
      swift_retain();
      v52(a7);
      sub_23A823048((uint64_t)v52);
    }
    if (v26)
    {
      swift_retain();
      v47(1, 0);
      sub_23A823048((uint64_t)v47);
    }
    v41 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v41)
    {
      v42 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v41;
      v43 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v42)[2](v42, v43, 1, 0);

      _Block_release(v42);
    }
    if (v53)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v52);
      sub_23A823048((uint64_t)v47);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048((uint64_t)v52);
      sub_23A823048((uint64_t)v47);
    }
    return sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v49 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A83A7B0;
  *(_QWORD *)(v32 + 24) = 0;
  v44 = a1;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = a6 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = v50;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v52;
  *(_QWORD *)(v32 + 72) = v54;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v47;
  *(_QWORD *)(v33 + 24) = v51;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = a6 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = v50;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v45;
  *(_QWORD *)(v33 + 88) = v46;
  *(_QWORD *)(v33 + 96) = v53;
  v34 = a7;
  v35 = v50;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v52);
  sub_23A821984((uint64_t)v47);
  swift_retain();
  swift_unknownObjectRetain();
  v49(v44, a2, v37, v30, a6 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v52);
  sub_23A823048((uint64_t)v47);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A839764(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  void (*v24)(void *);
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v44;
  void (*v45)(_QWORD *__return_ptr);
  uint64_t v46;
  uint64_t v47;
  char v48;
  void (*v49)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  void (*v50)(char, char);
  id v51;
  uint64_t v52;
  _QWORD v54[17];
  _BYTE v55[136];
  uint64_t v56;
  _BYTE v57[136];
  _BYTE v58[136];
  _QWORD v59[17];
  _QWORD v60[17];
  _BYTE v61[144];

  v17 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v17)
  {
    v18 = v17;
    a3(v59);
    sub_23A83B674((uint64_t)v59, (uint64_t)v60);

    sub_23A83B674((uint64_t)v60, (uint64_t)v55);
    nullsub_1(v55);
  }
  else
  {
    sub_23A83B654((uint64_t)v55);
  }
  sub_23A82E744((uint64_t)v55, (uint64_t)v61, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v60, a7);
  sub_23A83B674((uint64_t)v60, (uint64_t)v57);
  sub_23A82E744((uint64_t)v61, (uint64_t)v58, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v58) == 1)
  {
    v48 = a6;
    sub_23A83B674((uint64_t)v57, (uint64_t)v54);
    nullsub_1(v54);
    sub_23A82E744((uint64_t)v61, (uint64_t)v55, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v54, (uint64_t)&v56, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v55);
  }
  else
  {
    sub_23A82E744((uint64_t)v61, (uint64_t)v54, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v54, (uint64_t)v55);
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v55);
    v20 = v19;
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v20 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v48 = a6;
  }
  v21 = (void *)sub_23A84C210();
  v22 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v21);

  v45 = a3;
  v46 = a4;
  if (v22)
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v22;
    v24 = (void (*)(void *))sub_23A83C75C;
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v52 = v23;
  if (v26)
  {
    v47 = swift_allocObject();
    *(_QWORD *)(v47 + 16) = v26;
    v50 = (void (*)(char, char))sub_23A83C7CC;
  }
  else
  {
    v50 = 0;
    v47 = 0;
  }
  v54[0] = sub_23A84C3E4();
  v54[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v51 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((a5 & 1) == 0)
  {
    sub_23A83A81C(0, v48 & 1, a7, a8, a9);
    v41 = (uint64_t)v24;
    if (v22)
    {
      swift_retain();
      v24(a7);
      sub_23A823048((uint64_t)v24);
    }
    if (v26)
    {
      swift_retain();
      v50(1, 0);
      sub_23A823048((uint64_t)v50);
    }
    v42 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v42)
    {
      v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v42;
      v44 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v43)[2](v43, v44, 1, 0);

      _Block_release(v43);
    }
    if (v51)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v41);
      sub_23A823048((uint64_t)v50);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v41);
      sub_23A823048((uint64_t)v50);
    }
    return sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v49 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A83A81C;
  *(_QWORD *)(v32 + 24) = 0;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = v48 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = a8;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v24;
  *(_QWORD *)(v32 + 72) = v52;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v50;
  *(_QWORD *)(v33 + 24) = v47;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = v48 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = a8;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v45;
  *(_QWORD *)(v33 + 88) = v46;
  *(_QWORD *)(v33 + 96) = v51;
  v34 = a7;
  v35 = a8;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v24);
  sub_23A821984((uint64_t)v50);
  swift_retain();
  swift_unknownObjectRetain();
  v49(a1, a2, v37, v30, v48 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v24);
  sub_23A823048((uint64_t)v50);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23A839E80(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr), uint64_t a4, char a5, char a6, void *a7, void *a8, void *a9, char *a10)
{
  id v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v44;
  void (*v45)(_QWORD *__return_ptr);
  uint64_t v46;
  uint64_t v47;
  char v48;
  void (*v49)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t);
  void (*v50)(char, char);
  id v51;
  uint64_t v52;
  _QWORD v54[17];
  _BYTE v55[136];
  uint64_t v56;
  _BYTE v57[136];
  _BYTE v58[136];
  _QWORD v59[17];
  _QWORD v60[17];
  _BYTE v61[144];

  v17 = objc_msgSend(*(id *)&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable], sel_objectForKey_, a8);
  if (v17)
  {
    v18 = v17;
    a3(v59);
    sub_23A83B674((uint64_t)v59, (uint64_t)v60);

    sub_23A83B674((uint64_t)v60, (uint64_t)v55);
    nullsub_1(v55);
  }
  else
  {
    sub_23A83B654((uint64_t)v55);
  }
  sub_23A82E744((uint64_t)v55, (uint64_t)v61, &qword_2542D7DD0);
  ((void (*)(_QWORD *__return_ptr, void *))a3)(v60, a7);
  sub_23A83B674((uint64_t)v60, (uint64_t)v57);
  sub_23A82E744((uint64_t)v61, (uint64_t)v58, &qword_2542D7DD0);
  if (sub_23A83B6AC((uint64_t)v58) == 1)
  {
    v48 = a6;
    sub_23A83B674((uint64_t)v57, (uint64_t)v54);
    nullsub_1(v54);
    sub_23A82E744((uint64_t)v61, (uint64_t)v55, &qword_2542D7DD0);
    sub_23A82E744((uint64_t)v54, (uint64_t)&v56, &qword_2542D7DD0);
    sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B6C0);
    sub_23A83B6E0((uint64_t)v55);
  }
  else
  {
    sub_23A82E744((uint64_t)v61, (uint64_t)v54, &qword_2542D7DD0);
    sub_23A83B674((uint64_t)v54, (uint64_t)v55);
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83BCCC);
    sub_23A83B844((uint64_t)v55);
    v20 = v19;
    sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    if ((v20 & 1) != 0)
    {
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      return sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
    }
    v48 = a6;
  }
  v21 = (void *)sub_23A84C210();
  v22 = objc_msgSend(a7, sel_animationBlockForKeyPath_, v21);

  v45 = a3;
  v46 = a4;
  if (v22)
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v22;
    v24 = (void (*)(uint64_t))sub_23A83B83C;
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  v25 = (void *)sub_23A84C210();
  v26 = objc_msgSend(a7, sel_animationCompletionBlockForKeyPath_, v25);

  v52 = v23;
  if (v26)
  {
    v47 = swift_allocObject();
    *(_QWORD *)(v47 + 16) = v26;
    v50 = (void (*)(char, char))sub_23A82307C;
  }
  else
  {
    v50 = 0;
    v47 = 0;
  }
  v54[0] = sub_23A84C3E4();
  v54[1] = v27;
  sub_23A84C240();
  swift_bridgeObjectRetain();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v51 = objc_msgSend(a9, sel_acquireGeometricChangeAssertionForReason_, v28);

  if ((a5 & 1) == 0)
  {
    sub_23A83A9A4(0, v48 & 1, a7, a8, a9);
    v41 = (uint64_t)v24;
    if (v22)
    {
      swift_retain();
      v24((uint64_t)a7);
      sub_23A823048((uint64_t)v24);
    }
    if (v26)
    {
      swift_retain();
      v50(1, 0);
      sub_23A823048((uint64_t)v50);
    }
    v42 = objc_msgSend(a7, sel_anyAnimationCompletionBlock);
    if (v42)
    {
      v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v42;
      v44 = (void *)sub_23A84C210();
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v43)[2](v43, v44, 1, 0);

      _Block_release(v43);
    }
    if (v51)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_invalidate);
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v41);
      sub_23A823048((uint64_t)v50);
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
      sub_23A823048(v41);
      sub_23A823048((uint64_t)v50);
    }
    return sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  }
  v29 = (void *)sub_23A84C210();
  v30 = objc_msgSend(a7, sel_behaviorSettingsForKeyPath_, v29);

  if (!v30)
  {
    v31 = objc_msgSend(a10, sel_defaultBehaviorSettings);
    swift_getObjectType();
    v30 = sub_23A83ADBC();
    swift_unknownObjectRelease();
  }
  v49 = *(void (**)(uint64_t, uint64_t, id, id, _QWORD, uint64_t (*)(), uint64_t, uint64_t (*)(), uint64_t))&a10[OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock];
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_23A83A9A4;
  *(_QWORD *)(v32 + 24) = 0;
  *(_BYTE *)(v32 + 32) = 1;
  *(_BYTE *)(v32 + 33) = v48 & 1;
  *(_QWORD *)(v32 + 40) = a7;
  *(_QWORD *)(v32 + 48) = a8;
  *(_QWORD *)(v32 + 56) = a9;
  *(_QWORD *)(v32 + 64) = v24;
  *(_QWORD *)(v32 + 72) = v52;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v50;
  *(_QWORD *)(v33 + 24) = v47;
  *(_BYTE *)(v33 + 32) = 1;
  *(_BYTE *)(v33 + 33) = v48 & 1;
  *(_QWORD *)(v33 + 40) = a7;
  *(_QWORD *)(v33 + 48) = a8;
  *(_QWORD *)(v33 + 56) = a9;
  *(_QWORD *)(v33 + 64) = a1;
  *(_QWORD *)(v33 + 72) = a2;
  *(_QWORD *)(v33 + 80) = v45;
  *(_QWORD *)(v33 + 88) = v46;
  *(_QWORD *)(v33 + 96) = v51;
  v34 = a7;
  v35 = a8;
  v36 = a9;
  swift_bridgeObjectRetain();
  v37 = v34;
  v38 = v35;
  v39 = v36;
  swift_retain();
  sub_23A821984((uint64_t)v24);
  sub_23A821984((uint64_t)v50);
  swift_retain();
  swift_unknownObjectRetain();
  v49(a1, a2, v37, v30, v48 & 1, sub_23A83B830, v32, sub_23A83B838, v33);
  sub_23A83BC68((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B80C);
  sub_23A823048((uint64_t)v24);
  sub_23A823048((uint64_t)v50);
  swift_unknownObjectRelease();
  sub_23A83BC68((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A83B7D4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

id sub_23A83A59C(int a1, int a2, id a3, void *a4)
{
  return objc_msgSend(a4, sel_setBoundaryEdges_, objc_msgSend(a3, sel_boundaryEdges));
}

void sub_23A83A5D8(int a1, int a2, id a3, uint64_t a4, void *a5)
{
  id v6;

  v6 = objc_msgSend(a3, sel_dropletColor);
  objc_msgSend(a5, sel_setDropletColor_, v6);

}

id sub_23A83A630(int a1, int a2, id a3, uint64_t a4, void *a5)
{
  objc_msgSend(a3, sel_dropletRadius);
  return objc_msgSend(a5, sel_setDropletRadius_);
}

uint64_t sub_23A83A668(int a1, int a2, id a3, uint64_t a4, void *a5)
{
  objc_msgSend(a5, sel_applyKeylineStyle_forContainerView_, objc_msgSend(a3, sel_keylineStyle), a4);
  return swift_unknownObjectRelease();
}

id sub_23A83A6C8(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_containerCornerRadius);
  return objc_msgSend(a4, sel_setContinuousCornerRadius_);
}

id sub_23A83A700(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_containerWidth);
  objc_msgSend(a4, sel_bounds);
  return objc_msgSend(a4, sel_setBounds_);
}

id sub_23A83A758(int a1, int a2, id a3, void *a4)
{
  objc_msgSend(a3, sel_containerHeight);
  objc_msgSend(a4, sel_bounds);
  return objc_msgSend(a4, sel_setBounds_);
}

id sub_23A83A7B0(int a1, int a2, id a3, void *a4)
{
  __int128 v6;

  objc_msgSend(a3, sel_containerTransform);
  return objc_msgSend(a4, sel_setTransform3D_, &v6);
}

uint64_t sub_23A83A81C(char a1, char a2, void *a3, void *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t result;
  _QWORD v18[6];

  v10 = objc_opt_self();
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a1;
  *(_BYTE *)(v11 + 17) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  *(_QWORD *)(v11 + 32) = a4;
  *(_QWORD *)(v11 + 40) = a5;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_23A83BE08;
  *(_QWORD *)(v12 + 24) = v11;
  v18[4] = sub_23A83C758;
  v18[5] = v12;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_23A83A984;
  v18[3] = &block_descriptor_49;
  v13 = _Block_copy(v18);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  swift_retain();
  swift_release();
  objc_msgSend((id)v10, sel__modifyAnimationsByDecomposingGeometricTypes_animations_, 1, v13);
  _Block_release(v13);
  swift_release();
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v10 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_23A83A984(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_23A83A9A4(char a1, char a2, void *a3, void *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t result;
  _QWORD v18[6];

  v10 = objc_opt_self();
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a1;
  *(_BYTE *)(v11 + 17) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  *(_QWORD *)(v11 + 32) = a4;
  *(_QWORD *)(v11 + 40) = a5;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_23A83BD10;
  *(_QWORD *)(v12 + 24) = v11;
  v18[4] = sub_23A821878;
  v18[5] = v12;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_23A83A984;
  v18[3] = &block_descriptor_21;
  v13 = _Block_copy(v18);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  swift_retain();
  swift_release();
  objc_msgSend((id)v10, sel__modifyAnimationsByDecomposingGeometricTypes_animations_, 1, v13);
  _Block_release(v13);
  swift_release();
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v10 & 1) != 0)
    __break(1u);
  return result;
}

void sub_23A83ABA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v14 = (void *)objc_opt_self();
  v22 = a6;
  v23 = a7;
  v15 = MEMORY[0x24BDAC760];
  v18 = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23A83ACD8;
  v21 = &block_descriptor_0;
  v16 = _Block_copy(&v18);
  swift_retain();
  swift_release();
  v22 = a8;
  v23 = a9;
  v18 = v15;
  v19 = 1107296256;
  v20 = sub_23A81BD24;
  v21 = &block_descriptor_3;
  v17 = _Block_copy(&v18);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel__animateUsingSpringBehavior_tracking_animations_completion_, a4, a5 & 1, v16, v17);
  _Block_release(v17);
  _Block_release(v16);
}

uint64_t sub_23A83ACD8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void *sub_23A83ADBC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v5;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    v2 = (void *)v1;
    swift_unknownObjectRetain();
    objc_msgSend(v2, sel_copy);
    sub_23A84C30C();
    swift_unknownObjectRelease();
    sub_23A84C2DC();
    swift_dynamicCast();
    v3 = (void *)sub_23A84C210();
    objc_msgSend(v5, sel_setName_, v3);

    swift_unknownObjectRelease();
    return v5;
  }
  else
  {
    swift_unknownObjectRetain();
  }
  return (void *)v0;
}

void sub_23A83AEA8(char a1, char a2, void (*a3)(_QWORD, _QWORD), int a4, int a5, id a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;

  if (a3)
    a3(a1 & 1, a2 & 1);
  v16 = objc_msgSend(a6, sel_anyAnimationCompletionBlock);
  if (v16)
  {
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v16;
    v18 = (void *)sub_23A84C210();
    ((void (**)(_QWORD, void *, _QWORD, _QWORD))v17)[2](v17, v18, a1 & 1, a2 & 1);

    _Block_release(v17);
  }
  if (a13)
    objc_msgSend(a13, sel_invalidate);
}

uint64_t sub_23A83AFC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v5;
  _QWORD v6[17];

  v3 = a1;
  swift_getAtKeyPath();

  v6[0] = v5;
  sub_23A83BDC0((uint64_t)v6);
  return sub_23A83B674((uint64_t)v6, a2);
}

uint64_t sub_23A83B034@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[9];

  v3 = a1;
  swift_getAtKeyPath();

  v13[4] = v9;
  v13[5] = v10;
  v13[6] = v11;
  v13[7] = v12;
  v13[0] = v5;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v8;
  sub_23A83BEC8((uint64_t)v13);
  return sub_23A83B674((uint64_t)v13, a2);
}

uint64_t sub_23A83B0D4@<X0>(void *a1@<X0>, void (*a2)(_QWORD *)@<X2>, uint64_t a3@<X8>)
{
  id v5;
  uint64_t v7;
  _QWORD v8[17];

  v5 = a1;
  swift_getAtKeyPath();

  v8[0] = v7;
  a2(v8);
  return sub_23A83B674((uint64_t)v8, a3);
}

uint64_t sub_23A83B144@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v5;
  _QWORD v6[17];

  v3 = a1;
  swift_getAtKeyPath();

  v6[0] = v5;
  sub_23A83C17C((uint64_t)v6);
  return sub_23A83B674((uint64_t)v6, a2);
}

uint64_t sub_23A83B1B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  __int128 v5;
  __int128 v6;
  _OWORD v7[9];

  v3 = a1;
  swift_getAtKeyPath();

  v7[0] = v5;
  v7[1] = v6;
  sub_23A83C330((uint64_t)v7);
  return sub_23A83B674((uint64_t)v7, a2);
}

uint64_t sub_23A83B21C(uint64_t a1, uint64_t a2)
{
  char v3;
  _BYTE v5[136];
  _BYTE v6[136];

  sub_23A83B674(a1, (uint64_t)v5);
  sub_23A83B674(a2, (uint64_t)v6);
  sub_23A83B844((uint64_t)v5);
  return v3 & 1;
}

uint64_t sub_23A83B264()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2542D7F40 = 0x587265746E6563;
  *(_QWORD *)algn_2542D7F48 = 0xE700000000000000;
  qword_2542D7F50 = (uint64_t)sub_23A83BDB8;
  unk_2542D7F58 = result;
  return result;
}

uint64_t sub_23A83B2AC()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2542D7F70 = 0x597265746E6563;
  *(_QWORD *)algn_2542D7F78 = 0xE700000000000000;
  qword_2542D7F80 = (uint64_t)sub_23A83BDB8;
  unk_2542D7F88 = result;
  return result;
}

uint64_t sub_23A83B2F4()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2569C2E70, "boundaryEdges");
  *(_WORD *)&algn_2569C2E78[6] = -4864;
  qword_2569C2E80 = (uint64_t)sub_23A83C174;
  unk_2569C2E88 = result;
  return result;
}

uint64_t sub_23A83B348()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2569C2E90 = 0x797261646E756F62;
  *(_QWORD *)algn_2569C2E98 = 0xEF7374657374754FLL;
  qword_2569C2EA0 = (uint64_t)sub_23A83C328;
  unk_2569C2EA8 = result;
  return result;
}

uint64_t sub_23A83B39C()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2542D7F10 = 0xD000000000000015;
  *(_QWORD *)algn_2542D7F18 = 0x800000023A84E690;
  qword_2542D7F20 = (uint64_t)sub_23A83BDB8;
  unk_2542D7F28 = result;
  return result;
}

uint64_t sub_23A83B3E8()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2542D7EB0 = 0x656E6961746E6F63;
  *(_QWORD *)algn_2542D7EB8 = 0xEF74686769654872;
  qword_2542D7EC0 = (uint64_t)sub_23A83BDB8;
  unk_2542D7EC8 = result;
  return result;
}

uint64_t sub_23A83B43C()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2542D7E80, "containerWidth");
  algn_2542D7E88[7] = -18;
  qword_2542D7E90 = (uint64_t)sub_23A83BDB8;
  unk_2542D7E98 = result;
  return result;
}

uint64_t sub_23A83B490()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2542D7EE0 = 0xD000000000000012;
  *(_QWORD *)algn_2542D7EE8 = 0x800000023A84E5E0;
  qword_2542D7EF0 = (uint64_t)sub_23A83BEC0;
  unk_2542D7EF8 = result;
  return result;
}

uint64_t sub_23A83B4DC()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2542D7DF0, "dropletColor");
  algn_2542D7DF8[5] = 0;
  *(_WORD *)&algn_2542D7DF8[6] = -5120;
  qword_2542D7E00 = (uint64_t)sub_23A83C0FC;
  unk_2542D7E08 = result;
  return result;
}

uint64_t sub_23A83B52C()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2542D7E50, "dropletRadius");
  *(_WORD *)&algn_2542D7E58[6] = -4864;
  qword_2542D7E60 = (uint64_t)sub_23A83BDB8;
  unk_2542D7E68 = result;
  return result;
}

uint64_t sub_23A83B580()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2542D7E20, "keylineStyle");
  algn_2542D7E28[5] = 0;
  *(_WORD *)&algn_2542D7E28[6] = -5120;
  qword_2542D7E30 = (uint64_t)sub_23A83C030;
  unk_2542D7E38 = result;
  return result;
}

char *keypath_get_selector_defaultBehaviorSettings()
{
  return sel_defaultBehaviorSettings;
}

id sub_23A83B5DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_defaultBehaviorSettings);
  *a2 = result;
  return result;
}

id sub_23A83B614(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDefaultBehaviorSettings_, *a1);
}

uint64_t type metadata accessor for DRPDropletAnimationCoordinator(uint64_t a1)
{
  return sub_23A81A1DC(a1, (unint64_t *)&unk_2569C2ED8);
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

double sub_23A83B654(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 128) = -1;
  return result;
}

uint64_t sub_23A83B674(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  v2 = *(_OWORD *)(a1 + 16);
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 32) = v3;
  v5 = *(_OWORD *)(a1 + 80);
  v6 = *(_OWORD *)(a1 + 96);
  v7 = *(_OWORD *)(a1 + 112);
  *(_BYTE *)(a2 + 128) = *(_BYTE *)(a1 + 128);
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(_OWORD *)(a2 + 80) = v5;
  return a2;
}

uint64_t sub_23A83B6AC(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 128);
  if (v1 > 5)
    return (v1 ^ 0xFF) + 1;
  else
    return 0;
}

id sub_23A83B6C0(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a17 == 3)
    return result;
  if (a17 == 2)
    return (id)swift_unknownObjectRetain();
  return result;
}

uint64_t sub_23A83B6E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;

  v16 = *(void **)(a1 + 136);
  v2 = *(_QWORD *)(a1 + 152);
  v15 = *(_QWORD *)(a1 + 144);
  v3 = *(_QWORD *)(a1 + 160);
  v4 = *(_QWORD *)(a1 + 168);
  v5 = *(_QWORD *)(a1 + 176);
  v6 = *(_QWORD *)(a1 + 184);
  v7 = *(_QWORD *)(a1 + 192);
  v13 = *(_OWORD *)(a1 + 216);
  v14 = *(_OWORD *)(a1 + 200);
  v12 = *(_OWORD *)(a1 + 232);
  v9 = *(_QWORD *)(a1 + 248);
  v8 = *(_QWORD *)(a1 + 256);
  v10 = *(_BYTE *)(a1 + 264);
  sub_23A83B7D4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_BYTE *)(a1 + 128));
  sub_23A83B7D4(v16, v15, v2, v3, v4, v5, v6, v7, v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v9, v8, v10);
  return a1;
}

void sub_23A83B7D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned __int8 a17)
{
  if (a17 != 255)
    sub_23A83B80C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

void sub_23A83B80C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a17 == 3)
  {

  }
  else if (a17 == 2)
  {
    swift_unknownObjectRelease();
  }
}

uint64_t sub_23A83B83C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A81B8F0(a1, *(_QWORD *)(v1 + 16));
}

void sub_23A83B844(uint64_t a1)
{
  char *v1;
  _BYTE v2[136];

  sub_23A83B674(a1, (uint64_t)v2);
  v1 = (char *)sub_23A83B8A4 + 4 * byte_23A84E580[sub_23A83BD04((uint64_t)v2)];
  __asm { BR              X10 }
}

BOOL sub_23A83B8A4()
{
  uint64_t v0;
  double v1;
  _BYTE v4[136];
  uint64_t v5;

  v1 = *(double *)((uint64_t (*)(uint64_t *))nullsub_1)(&v5);
  sub_23A83B674(v0, (uint64_t)v4);
  return !sub_23A83BD04((uint64_t)v4) && v1 == *(double *)((uint64_t (*)(_BYTE *))nullsub_1)(v4);
}

uint64_t sub_23A83BC68(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 128);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), v4);
  return a1;
}

id sub_23A83BCCC(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned __int8 a17)
{
  if (a17 != 255)
    return sub_23A83B6C0(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
  return result;
}

uint64_t sub_23A83BD04(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

id sub_23A83BD10()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);
  objc_msgSend(*(id *)(v0 + 24), sel_centerY);
  objc_msgSend(v1, sel_center);
  return objc_msgSend(v1, sel_setCenter_);
}

uint64_t sub_23A83BD64()
{
  return swift_deallocObject();
}

id sub_23A83BD74@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_centerY);
  *a2 = v4;
  return result;
}

id sub_23A83BDA4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCenterY_, *a1);
}

uint64_t sub_23A83BDB8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A83AFC8(a1, a2);
}

uint64_t sub_23A83BDC0(uint64_t result)
{
  *(_BYTE *)(result + 128) = 0;
  return result;
}

uint64_t objectdestroy_14Tm()
{
  id *v0;

  return swift_deallocObject();
}

id sub_23A83BE08()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;

  v1 = *(void **)(v0 + 32);
  objc_msgSend(*(id *)(v0 + 24), sel_centerX);
  v3 = v2;
  objc_msgSend(v1, sel_center);
  return objc_msgSend(v1, sel_setCenter_, v3);
}

uint64_t sub_23A83BE5C()
{
  return swift_deallocObject();
}

id sub_23A83BE6C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_centerX);
  *a2 = v4;
  return result;
}

id sub_23A83BE9C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCenterX_, *a1);
}

uint64_t sub_23A83BEC0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A83B034(a1, a2);
}

uint64_t sub_23A83BEC8(uint64_t result)
{
  *(_BYTE *)(result + 128) = 1;
  return result;
}

id sub_23A83BEDC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_containerHeight);
  *a2 = v4;
  return result;
}

id sub_23A83BF0C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerHeight_, *a1);
}

uint64_t sub_23A83BF28()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

id sub_23A83BF4C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_containerWidth);
  *a2 = v4;
  return result;
}

id sub_23A83BF7C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerWidth_, *a1);
}

id sub_23A83BF98@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_containerCornerRadius);
  *a2 = v4;
  return result;
}

id sub_23A83BFC8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContainerCornerRadius_, *a1);
}

id sub_23A83BFE4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_keylineStyle);
  *a2 = result;
  return result;
}

id sub_23A83C01C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineStyle_, *a1);
}

uint64_t sub_23A83C030@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A83B0D4(a1, (void (*)(_QWORD *))sub_23A83C050, a2);
}

uint64_t sub_23A83C050(uint64_t result)
{
  *(_BYTE *)(result + 128) = 2;
  return result;
}

id sub_23A83C064@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_dropletRadius);
  *a2 = v4;
  return result;
}

id sub_23A83C094(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletRadius_, *a1);
}

id sub_23A83C0B0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_dropletColor);
  *a2 = result;
  return result;
}

id sub_23A83C0E8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletColor_, *a1);
}

uint64_t sub_23A83C0FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A83B0D4(a1, (void (*)(_QWORD *))sub_23A83C11C, a2);
}

uint64_t sub_23A83C11C(uint64_t result)
{
  *(_BYTE *)(result + 128) = 3;
  return result;
}

id sub_23A83C130@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_boundaryEdges);
  *a2 = result;
  return result;
}

id sub_23A83C160(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryEdges_, *a1);
}

uint64_t sub_23A83C174@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A83B144(a1, a2);
}

uint64_t sub_23A83C17C(uint64_t result)
{
  *(_BYTE *)(result + 128) = 4;
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();

  if (*(_QWORD *)(v0 + 64))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A83C1D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(uint64_t (**)(uint64_t))(v0 + 64);
  result = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(v0 + 16))(*(unsigned __int8 *)(v0 + 32), *(unsigned __int8 *)(v0 + 33), v1, *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  if (v2)
    return v2(v1);
  return result;
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_23A83C28C(char a1, char a2)
{
  uint64_t v2;
  int v3;

  if (*(_BYTE *)(v2 + 33))
    v3 = 256;
  else
    v3 = 0;
  sub_23A83AEA8(a1, a2, *(void (**)(_QWORD, _QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), v3 | *(unsigned __int8 *)(v2 + 32), *(id *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72), *(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 88), *(void **)(v2 + 96));
}

id sub_23A83C2DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*a1, sel_boundaryOutsets);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_23A83C310(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryOutsets_, *a1, a1[1], a1[2], a1[3]);
}

uint64_t sub_23A83C328@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A83B1B0(a1, a2);
}

uint64_t sub_23A83C330(uint64_t result)
{
  *(_BYTE *)(result + 128) = 5;
  return result;
}

void destroy for KnownValue(uint64_t a1)
{
  sub_23A83B80C(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_BYTE *)(a1 + 128));
}

uint64_t initializeWithCopy for KnownValue(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a2 + 112);
  v19 = *(_QWORD *)(a2 + 120);
  v20 = *(_BYTE *)(a2 + 128);
  sub_23A83B6C0(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_QWORD *)(a1 + 120) = v19;
  *(_BYTE *)(a1 + 128) = v20;
  return a1;
}

uint64_t assignWithCopy for KnownValue(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v27 = *(_QWORD *)(a2 + 72);
  v28 = *(_QWORD *)(a2 + 80);
  v29 = *(_QWORD *)(a2 + 88);
  v30 = *(_QWORD *)(a2 + 96);
  v31 = *(_QWORD *)(a2 + 104);
  v32 = *(_QWORD *)(a2 + 112);
  v33 = *(_QWORD *)(a2 + 120);
  v34 = *(_BYTE *)(a2 + 128);
  sub_23A83B6C0(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_OWORD *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 96);
  v23 = *(_QWORD *)(a1 + 112);
  v24 = *(_QWORD *)(a1 + 120);
  v25 = *(_BYTE *)(a1 + 128);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v27;
  *(_QWORD *)(a1 + 80) = v28;
  *(_QWORD *)(a1 + 88) = v29;
  *(_QWORD *)(a1 + 96) = v30;
  *(_QWORD *)(a1 + 104) = v31;
  *(_QWORD *)(a1 + 112) = v32;
  *(_QWORD *)(a1 + 120) = v33;
  *(_BYTE *)(a1 + 128) = v34;
  sub_23A83B80C(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25);
  return a1;
}

__n128 __swift_memcpy129_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for KnownValue(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v3 = *(_BYTE *)(a2 + 128);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 80);
  v14 = *(_OWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 112);
  v16 = *(_QWORD *)(a1 + 120);
  v17 = *(_BYTE *)(a1 + 128);
  v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(_BYTE *)(a1 + 128) = v3;
  sub_23A83B80C(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for KnownValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 129))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 128);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for KnownValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 128) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 129) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 129) = 0;
    if (a2)
      *(_BYTE *)(result + 128) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A83C740(uint64_t result, char a2)
{
  *(_BYTE *)(result + 128) = a2;
  return result;
}

ValueMetadata *type metadata accessor for KnownValue()
{
  return &type metadata for KnownValue;
}

void sub_23A83C7D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char v22;
  char v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  char v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  void (*v38)(char *, _BYTE *);
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  unsigned __int8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[24];
  uint64_t v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  char *v72;
  char v73[8];
  _BYTE v74[96];

  v1 = v0 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference;
  LODWORD(v2) = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 80);
  if ((_DWORD)v2 != 255)
  {
    v3 = *(id *)v1;
    v4 = *(_QWORD *)(v1 + 8);
    v5 = *(_QWORD *)(v1 + 16);
    v57 = *(_QWORD *)(v1 + 72);
    v58 = *(_QWORD *)(v1 + 64);
    v60 = *(_QWORD *)(v1 + 40);
    v61 = *(_QWORD *)(v1 + 24);
    v63 = *(_QWORD *)(v1 + 48);
    v64 = *(_QWORD *)(v1 + 32);
    v59 = *(_QWORD *)(v1 + 56);
    sub_23A8223E8(*(id *)v1, v4, v5, v61, v64, v60, v63, v59, v58, v57, v2);
    v6 = sub_23A82AF84();
    v54 = v2;
    v50 = v6;
    if (v6 >> 62)
      goto LABEL_39;
    v55 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (v55)
    {
      v7 = 0;
      v53 = v3;
      v51 = v5;
      v52 = v4;
      while ((v50 & 0xC000000000000001) != 0)
      {
        v9 = (char *)MEMORY[0x23B858090](v7, v50);
        v10 = __OFADD__(v7, 1);
        v11 = v7 + 1;
        if (v10)
          goto LABEL_38;
LABEL_12:
        v56 = v11;
        v72 = v9;
        v12 = (uint64_t)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
        v70 = *(void **)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
        v65 = *(_QWORD *)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 16];
        v66 = *(_QWORD *)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 8];
        *(_OWORD *)v67 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 24];
        *(_QWORD *)&v67[16] = *(_QWORD *)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 40];
        v68 = *(_QWORD *)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 48];
        v69 = *(_QWORD *)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 56];
        v71 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 64];
        v62 = v9[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 80];
        *(_QWORD *)v12 = v3;
        *(_QWORD *)(v12 + 8) = v4;
        *(_QWORD *)(v12 + 16) = v5;
        *(_QWORD *)(v12 + 24) = v61;
        *(_QWORD *)(v12 + 32) = v64;
        *(_QWORD *)(v12 + 40) = v60;
        *(_QWORD *)(v12 + 48) = v63;
        *(_QWORD *)(v12 + 56) = v59;
        *(_QWORD *)(v12 + 64) = v58;
        *(_QWORD *)(v12 + 72) = v57;
        *(_BYTE *)(v12 + 80) = v2;
        sub_23A82E6A0(v3, v4, v5, v61, v64, v60, v63, v59, v58, v57, v2);
        sub_23A82E6A0(v3, v4, v5, v61, v64, v60, v63, v59, v58, v57, v2);
        sub_23A8223E8(v70, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), v62);
        sub_23A82E644(v70, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), v62);
        v14 = *(void **)v12;
        v13 = *(_QWORD *)(v12 + 8);
        v16 = *(_QWORD *)(v12 + 16);
        v15 = *(_QWORD *)(v12 + 24);
        v17 = *(_QWORD *)(v12 + 32);
        v18 = *(_QWORD *)(v12 + 40);
        v20 = *(_QWORD *)(v12 + 64);
        v19 = *(_QWORD *)(v12 + 72);
        if (!*(_BYTE *)(v12 + 80))
        {
          v21 = (_QWORD *)MEMORY[0x24BEE4EA0];
          v22 = v62;
          if (v62)
            goto LABEL_29;
          if (*(float *)&v14 != *(float *)&v70)
            goto LABEL_29;
          v24.i64[0] = *(_QWORD *)(v12 + 56);
          v24.i64[1] = __PAIR64__(v19, HIDWORD(v20));
          v25.i64[0] = __PAIR64__(HIDWORD(v14), v13);
          v25.i64[1] = __PAIR64__(v16, HIDWORD(v13));
          v26.i64[0] = __PAIR64__(v18, HIDWORD(v17));
          v26.i64[1] = *(_QWORD *)(v12 + 48);
          v27.i64[0] = __PAIR64__(v15, HIDWORD(v16));
          v27.i64[1] = __PAIR64__(v17, HIDWORD(v15));
          v28.i64[0] = __PAIR64__(*(unsigned int *)v67, HIDWORD(v65));
          v28.i64[1] = *(_QWORD *)&v67[4];
          v29.i64[0] = __PAIR64__(HIDWORD(v70), v66);
          v29.i64[1] = __PAIR64__(v65, HIDWORD(v66));
          v30.i64[0] = *(_QWORD *)&v67[12];
          v30.i64[1] = v68;
          v31.i64[0] = v69;
          v31.i64[1] = *(_QWORD *)((char *)&v71 + 4);
          if ((vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v25, v29), (int16x8_t)vceqq_f32(v27, v28)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v26, v30), (int16x8_t)vceqq_f32(v24, v31))), 7uLL))) & 1) == 0|| *((float *)&v19 + 1) != *((float *)&v71 + 3))
          {
LABEL_29:
            v32 = v22;
            v33 = &v72[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
            swift_beginAccess();
            v34 = *(_QWORD *)(*(_QWORD *)v33 + 16);
            if (v34)
            {
              v35 = *(_QWORD *)v33 + 32;
              swift_bridgeObjectRetain_n();
              do
              {
                sub_23A82E960(v35, (uint64_t)v73);
                v36 = MEMORY[0x23B858660](v73);
                if (v36)
                {
                  v37 = (_QWORD *)v36;
                  sub_23A822438(v12, (uint64_t)v74);
                  v38 = *(void (**)(char *, _BYTE *))((*v21 & *v37) + 0xE0);
                  sub_23A82E6C0((uint64_t)v74, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
                  v38(v72, v74);
                  sub_23A82E6C0((uint64_t)v74, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);

                }
                sub_23A83D978((uint64_t)v73);
                v35 += 8;
                --v34;
              }
              while (v34);
              swift_bridgeObjectRelease_n();
            }
            v39 = (void *)MEMORY[0x23B858660](&v72[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineParticipantView]);
            if (v39)
            {
              v8 = v39;
              objc_msgSend(v39, sel_setHidden_, *(unsigned __int8 *)(v12 + 80) != 2);

              LOBYTE(v2) = v54;
              v4 = v52;
              v3 = v53;
              v5 = v51;
              sub_23A82E714(v53, v52, v51, v61, v64, v60, v63, v59, v58, v57, v54);
              sub_23A82E644(v70, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), v32);

              v7 = v56;
            }
            else
            {
              LOBYTE(v2) = v54;
              v4 = v52;
              v3 = v53;
              v5 = v51;
              sub_23A82E714(v53, v52, v51, v61, v64, v60, v63, v59, v58, v57, v54);
              sub_23A82E644(v70, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), v32);
              v7 = v56;

            }
            goto LABEL_6;
          }
          goto LABEL_26;
        }
        v21 = (_QWORD *)MEMORY[0x24BEE4EA0];
        if (*(_BYTE *)(v12 + 80) != 1)
        {
          v22 = v62;
          if (v62 != 2 || ((v70 ^ ((*(_QWORD *)v12 & 1) == 0)) & 1) == 0)
            goto LABEL_29;
          goto LABEL_26;
        }
        v22 = v62;
        if (v62 != 1)
          goto LABEL_29;
        if (v14)
        {
          if (!v70)
            goto LABEL_29;
          v48 = *(_QWORD *)(v12 + 40);
          v49 = *(_QWORD *)(v12 + 32);
          v46 = *(_QWORD *)(v12 + 56);
          v47 = *(_QWORD *)(v12 + 24);
          v44 = *(_QWORD *)(v12 + 48);
          v45 = *(_QWORD *)(v12 + 8);
          sub_23A83D9B8();
          sub_23A8223E8(v70, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), 1);
          sub_23A8223E8(v14, v45, v16, v47, v49, v48, v44, v46, v20, v19, 1);
          v23 = sub_23A84C300();
          v22 = 1;
          sub_23A82E644(v70, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), 1);
          sub_23A82E644(v14, v45, v16, v47, v49, v48, v44, v46, v20, v19, 1);
          if ((v23 & 1) == 0)
            goto LABEL_29;
LABEL_26:
          LOBYTE(v2) = v54;
          v4 = v52;
          v3 = v53;
          v5 = v51;
          sub_23A82E714(v53, v52, v51, v61, v64, v60, v63, v59, v58, v57, v54);
          sub_23A82E644(v70, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), v22);
          goto LABEL_27;
        }
        if (v70)
          goto LABEL_29;
        v40 = *(_QWORD *)(v12 + 8);
        v41 = *(_QWORD *)(v12 + 24);
        v2 = *(_QWORD *)(v12 + 32);
        v42 = *(_QWORD *)(v12 + 48);
        v43 = *(_QWORD *)(v12 + 56);
        sub_23A8223E8(0, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), 1);
        sub_23A8223E8(0, v40, v16, v41, v2, v18, v42, v43, v20, v19, 1);
        LOBYTE(v2) = v54;
        v4 = v52;
        v3 = v53;
        v5 = v51;
        sub_23A82E714(v53, v52, v51, v61, v64, v60, v63, v59, v58, v57, v54);
        sub_23A82E644(0, v66, v65, *(uint64_t *)v67, *(uint64_t *)&v67[8], *(uint64_t *)&v67[16], v68, v69, v71, *((uint64_t *)&v71 + 1), 1);
LABEL_27:
        v7 = v56;

LABEL_6:
        if (v7 == v55)
          goto LABEL_40;
      }
      v9 = (char *)*(id *)(v50 + 32 + 8 * v7);
      v10 = __OFADD__(v7, 1);
      v11 = v7 + 1;
      if (!v10)
        goto LABEL_12;
LABEL_38:
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      LOBYTE(v2) = v54;
      v55 = sub_23A84C3B4();
    }
LABEL_40:
    swift_bridgeObjectRelease_n();
    sub_23A82E714(v3, v4, v5, v61, v64, v60, v63, v59, v58, v57, v2);
  }
}

void sub_23A83D0C8(double a1, double a2)
{
  uint64_t v2;
  double *v3;
  double v4;
  double v5;
  double *v7;
  double v8;
  double v9;
  id v11;
  id v12;

  v3 = (double *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth);
  v4 = *(double *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth);
  v5 = *(double *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth + 8);
  *v3 = a1;
  v3[1] = a2;
  if (v4 != a1 || v5 != a2)
  {
    v7 = (double *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView)
                  + OBJC_IVAR____TtC9DropletUI16DropletGroupView_mainKeylineStrokeWidth);
    v8 = *v7;
    v9 = v7[1];
    *v7 = a1;
    v7[1] = a2;
    if (v8 != a1 || v9 != a2)
    {
      v11 = sub_23A82C740();
      sub_23A82EAD0(*v7);

      v12 = sub_23A82C740();
      sub_23A82EBAC(v7[1]);

    }
  }
}

char *sub_23A83D188(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  char *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v33[6];
  objc_super v34;

  v9 = &v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference];
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v10[32] = 1;
  v11 = &v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *((_OWORD *)v11 + 3) = 0u;
  *((_OWORD *)v11 + 4) = 0u;
  v11[80] = -1;
  v12 = OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth;
  v13 = qword_2569C25B8;
  v14 = v4;
  if (v13 != -1)
    swift_once();
  *(_OWORD *)&v14[v12] = xmmword_2569C3BE8;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions] = 0;
  BSRectWithSize();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, v15, v17, v19, v21);
  *(_QWORD *)&v14[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView] = v23;
  v24 = objc_allocWithZone((Class)type metadata accessor for DropletGroupView());
  *(_QWORD *)&v14[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView] = sub_23A82B5C0(v23, v16, v18, v20, v22, 0.0);

  v34.receiver = v14;
  v34.super_class = (Class)type metadata accessor for DropletShapeView();
  v25 = objc_msgSendSuper2(&v34, sel_initWithFrame_, a1, a2, a3, a4);
  v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v27 = (char *)v25;
  swift_retain();
  v28 = (void *)sub_23A84C210();
  v33[4] = sub_23A83D958;
  v33[5] = v26;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 1107296256;
  v33[2] = sub_23A83D568;
  v33[3] = &block_descriptor_1;
  v29 = _Block_copy(v33);
  v30 = objc_msgSend((id)objc_opt_self(), sel_assertionWithIdentifier_stateDidChangeHandler_, v28, v29);

  _Block_release(v29);
  swift_release();
  swift_release();
  v31 = *(void **)&v27[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];
  *(_QWORD *)&v27[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions] = v30;

  objc_msgSend(v27, sel_addSubview_, *(_QWORD *)&v27[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView]);
  objc_msgSend(v27, sel_addSubview_, *(_QWORD *)&v27[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]);

  return v27;
}

void sub_23A83D478(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B858660](v2);
  if (v3)
  {
    v4 = (char *)v3;
    v5 = *(void **)(v3 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions);
    if (v5)
    {
      v6 = *(void **)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
      v7 = objc_msgSend(v5, sel_isActive) ^ 1;
      v8 = objc_msgSend(v6, sel_layer);
      objc_msgSend(v8, sel_setShouldRasterize_, v7);

      v9 = sub_23A82C754();
      v10 = objc_msgSend(v9, sel_layer);

      objc_msgSend(v10, sel_setShouldRasterize_, v7);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_23A83D568(uint64_t a1)
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

id sub_23A83D5F4()
{
  char *v0;
  id result;
  objc_super v2;

  result = *(id *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    v2.receiver = v0;
    v2.super_class = (Class)type metadata accessor for DropletShapeView();
    return objc_msgSendSuper2(&v2, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_23A83D728()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  void *v4;
  objc_super v6;

  v1 = v0;
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for DropletShapeView();
  objc_msgSendSuper2(&v6, sel_layoutSubviews);
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
  v3 = sub_23A82C754();
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);

  v4 = *(void **)&v1[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView];
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
  objc_msgSend(v1, sel_bounds);
  return objc_msgSend(v2, sel_setFrame_);
}

uint64_t type metadata accessor for DropletShapeView()
{
  return objc_opt_self();
}

void sub_23A83D83C()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;

  v1 = &v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  *(_QWORD *)v1 = 0;
  v1[8] = 1;
  v2 = &v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v3 = &v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  v3[80] = -1;
  v4 = OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineWidth;
  if (qword_2569C25B8 != -1)
    swift_once();
  *(_OWORD *)&v0[v4] = xmmword_2569C3BE8;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions] = 0;

  sub_23A84C39C();
  __break(1u);
}

uint64_t sub_23A83D934()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23A83D958(uint64_t a1)
{
  uint64_t v1;

  sub_23A83D478(a1, v1);
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

uint64_t sub_23A83D978(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2C40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A83D9B8()
{
  unint64_t result;

  result = qword_2569C29B0;
  if (!qword_2569C29B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569C29B0);
  }
  return result;
}

void sub_23A83D9F4(float *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[5];

  v2 = &v1[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
  if (*(float *)&v1[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix] != *a1
    || *((float *)v2 + 1) != a1[1]
    || *((float *)v2 + 2) != a1[2]
    || *((float *)v2 + 3) != a1[3]
    || *((float *)v2 + 4) != a1[4]
    || *((float *)v2 + 5) != a1[5]
    || *((float *)v2 + 6) != a1[6]
    || *((float *)v2 + 7) != a1[7]
    || *((float *)v2 + 8) != a1[8]
    || *((float *)v2 + 9) != a1[9]
    || *((float *)v2 + 10) != a1[10]
    || *((float *)v2 + 12) != a1[12]
    || *((float *)v2 + 13) != a1[13]
    || *((float *)v2 + 14) != a1[14]
    || *((float *)v2 + 15) != a1[15]
    || *((float *)v2 + 17) != a1[17]
    || *((float *)v2 + 18) != a1[18]
    || *((float *)v2 + 19) != a1[19])
  {
    v3 = objc_msgSend(v1, sel_layer);
    v9 = *((_OWORD *)v2 + 1);
    v7 = *((_OWORD *)v2 + 3);
    v8 = *((_OWORD *)v2 + 2);
    v6 = *((_OWORD *)v2 + 4);
    v10[0] = *(_OWORD *)v2;
    v10[1] = v9;
    v10[2] = v8;
    v10[3] = v7;
    v10[4] = v6;
    v4 = objc_msgSend((id)objc_opt_self(), sel_valueWithCAColorMatrix_, v10);
    if (qword_2569C25D8 != -1)
      swift_once();
    v5 = (void *)sub_23A84C210();
    objc_msgSend(v3, sel_setValue_forKeyPath_, v4, v5);

  }
}

char *sub_23A83DC50(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  objc_class *v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[5];
  objc_super v28;

  v9 = &v4[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
  v10 = (objc_class *)type metadata accessor for AnimatableAdaptiveColorMatrixView();
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  v28.receiver = v4;
  v28.super_class = v10;
  v11 = (char *)objc_msgSendSuper2(&v28, sel_initWithFrame_, a1, a2, a3, a4);
  v12 = objc_msgSend(v11, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setAllowsInPlaceFiltering_, 1);

  v13 = *MEMORY[0x24BDE5A00];
  sub_23A84C21C();
  v14 = objc_allocWithZone(MEMORY[0x24BDE56B0]);
  v15 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_initWithType_, v15);

  v26 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 16];
  v24 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 48];
  v25 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 32];
  v23 = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 64];
  v27[0] = *(_OWORD *)&v11[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
  v27[1] = v26;
  v27[2] = v25;
  v27[3] = v24;
  v27[4] = v23;
  v17 = objc_msgSend((id)objc_opt_self(), sel_valueWithCAColorMatrix_, v27);
  objc_msgSend(v16, sel_setValue_forKey_, v17, v13);

  v18 = objc_msgSend(v11, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_23A84E0E0;
  *(_QWORD *)(v19 + 56) = sub_23A81A1DC(0, (unint64_t *)&qword_2542D8030);
  *(_QWORD *)(v19 + 32) = v16;
  v20 = v16;
  v21 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setFilters_, v21);

  return v11;
}

id sub_23A83E094()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnimatableAdaptiveColorMatrixView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AnimatableAdaptiveColorMatrixView()
{
  return objc_opt_self();
}

uint64_t sub_23A83E0E4()
{
  uint64_t result;

  sub_23A84C21C();
  sub_23A84C240();
  swift_bridgeObjectRelease();
  sub_23A84C240();
  sub_23A84C21C();
  sub_23A84C240();
  result = swift_bridgeObjectRelease();
  qword_2569C3BF8 = 0x2E737265746C6966;
  unk_2569C3C00 = 0xE800000000000000;
  return result;
}

uint64_t sub_23A83E184(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (a2 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    v3 = sub_23A84C3B4();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569C29D0);
      v4 = 4;
      do
      {
        v5 = v4 - 4;
        if ((a2 & 0xC000000000000001) != 0)
        {
          MEMORY[0x23B858090](v4 - 4, a2);
          v6 = v4 - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_13;
        }
        else
        {
          swift_retain();
          v6 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        v7 = sub_23A84C204();
        swift_release();
        if ((v7 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 1;
        }
        ++v4;
      }
      while (v6 != v3);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23A83E2BC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_23A84C3FC();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_23A84C3FC() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A83E380(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_23A84C3B4())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x23B858090](0, a2);
LABEL_5:
      v6 = v5;
      sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
      v7 = sub_23A84C300();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_23A84C300();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x23B858090](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_23A84C300();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t DRPDropletContextView.disableDropletEffectFilters.getter()
{
  char *v0;
  uint64_t v1;

  v0 = (char *)sub_23A83E688();
  v1 = *(unsigned __int8 *)(*(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]
                          + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);

  return v1;
}

void DRPDropletContextView.disableDropletEffectFilters.setter(char a1)
{
  int v2;
  char *v3;
  uint64_t v4;
  int v5;
  char *v6;

  v2 = a1 & 1;
  v3 = (char *)sub_23A83E688();
  v4 = *(_QWORD *)&v3[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
  v5 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);
  *(_BYTE *)(v4 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters) = a1;
  if (v5 != v2)
  {
    v6 = v3;
    sub_23A82D22C();
    v3 = v6;
  }

}

id sub_23A83E688()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView;
  v2 = *(void **)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DropletShapeView()), sel_initWithFrame_, v4, v5, v6, v7);
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

uint64_t DRPDropletContextView.boundaryEdges.getter()
{
  char *v0;
  id v1;
  int v2;
  unint64_t v3;
  uint64_t result;
  id v5;
  void *v6;

  v0 = (char *)sub_23A83E688();
  v1 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  v2 = v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference + 8];

  if (v2 != 1)
    return (uint64_t)v1;
  v3 = sub_23A83EAA8();
  if (!(v3 >> 62))
  {
    result = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_4;
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  result = sub_23A84C3B4();
  if (!result)
    goto LABEL_9;
LABEL_4:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x23B858090](0, v3);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(id *)(v3 + 32);
LABEL_7:
    v6 = v5;
    swift_bridgeObjectRelease();
    v1 = objc_msgSend(v6, sel_boundaryEdges);

    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

void DRPDropletContextView.boundaryEdges.setter(uint64_t a1)
{
  char *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25[8];

  v2 = (char *)sub_23A83E688();
  v3 = &v2[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  *(_QWORD *)v3 = a1;
  v3[8] = 0;
  v21 = v2;
  v4 = sub_23A82AF84();
  v5 = v4;
  if (v4 >> 62)
    goto LABEL_20;
  v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_23A84C3B4())
  {
    v7 = 0;
    v8 = v5 & 0xC000000000000001;
    v23 = v5 + 32;
    v9 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v22 = v6;
    v24 = v5 & 0xC000000000000001;
    while (1)
    {
      v10 = v8 ? (char *)MEMORY[0x23B858090](v7, v5) : (char *)*(id *)(v23 + 8 * v7);
      v11 = v10;
      if (__OFADD__(v7++, 1))
        break;
      v13 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges;
      v14 = *(_QWORD *)&v10[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges];
      *(_QWORD *)&v10[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = a1;
      if (v14 == a1)
      {

        if (v7 == v6)
          goto LABEL_18;
      }
      else
      {
        v15 = &v10[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
        swift_beginAccess();
        v16 = *(_QWORD *)(*(_QWORD *)v15 + 16);
        if (v16)
        {
          v17 = v5;
          v18 = *(_QWORD *)v15 + 32;
          swift_bridgeObjectRetain_n();
          do
          {
            sub_23A82E960(v18, (uint64_t)v25);
            v19 = (_QWORD *)MEMORY[0x23B858660](v25);
            if (v19)
            {
              v20 = v19;
              (*(void (**)(char *, _QWORD))((*v9 & *v19) + 0xC0))(v11, *(_QWORD *)&v11[v13]);

            }
            sub_23A83D978((uint64_t)v25);
            v18 += 8;
            --v16;
          }
          while (v16);

          swift_bridgeObjectRelease_n();
          v5 = v17;
          v6 = v22;
        }
        else
        {

        }
        v8 = v24;
        if (v7 == v6)
          goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease_n();

}

uint64_t sub_23A83EAA8()
{
  id v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v0 = sub_23A8410A8();
  v1 = objc_msgSend(v0, sel_subviews);

  sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
  v2 = sub_23A84C264();

  v9 = MEMORY[0x24BEE4AF8];
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    v8 = MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease();
    return v8;
  }
  swift_bridgeObjectRetain();
  result = sub_23A84C3B4();
  v3 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x23B858090](i, v2);
      else
        v6 = *(id *)(v2 + 8 * i + 32);
      v7 = v6;
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x23B857FA0]();
        if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_23A84C27C();
        sub_23A84C288();
        sub_23A84C270();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    v8 = v9;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

double DRPDropletContextView.dropletRadius.getter()
{
  char *v0;
  double v1;

  v0 = (char *)sub_23A83E688();
  v1 = *(double *)(*(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]
                 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);

  return v1;
}

void DRPDropletContextView.dropletRadius.setter(double a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _BYTE v33[216];
  _QWORD v34[28];

  v2 = (char *)sub_23A83E688();
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
  v4 = OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence;
  v5 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);
  *(double *)(v3 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence) = a1;
  if (v5 == a1)
  {

  }
  else
  {
    v28 = v2;
    sub_23A82E744(v3 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v33, &qword_2569C2C00);
    sub_23A82E744((uint64_t)v33, (uint64_t)v34, &qword_2569C2C00);
    sub_23A82E734(v34);
    v6 = sub_23A82AF84();
    v7 = v6;
    if (v6 >> 62)
      goto LABEL_22;
    v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v8; v8 = sub_23A84C3B4())
    {
      v9 = 0;
      v10 = v7 & 0xC000000000000001;
      v32 = v7 + 32;
      v11 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v29 = v4;
      v30 = v7 & 0xC000000000000001;
      v31 = v3;
      while (1)
      {
        v12 = v10 ? (char *)MEMORY[0x23B858090](v9, v7) : (char *)*(id *)(v32 + 8 * v9);
        v13 = v12;
        if (__OFADD__(v9++, 1))
          break;
        v15 = *(double *)(v3 + v4);
        v16 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence;
        v17 = *(double *)&v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence];
        *(double *)&v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_dropletParticipantRadiusOfInfluence] = v15;
        if (v15 == v17)
        {

          if (v9 == v8)
            goto LABEL_20;
        }
        else
        {
          v18 = v8;
          v19 = v7;
          v20 = &v12[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          v21 = *(_QWORD *)(*(_QWORD *)v20 + 16);
          if (v21)
          {
            v22 = *(_QWORD *)v20 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_23A82E960(v22, (uint64_t)v33);
              v23 = (_QWORD *)MEMORY[0x23B858660](v33);
              if (v23)
              {
                v24 = v23;
                (*(void (**)(double))((*v11 & *v23) + 0x68))(*(double *)&v13[v16]);

              }
              sub_23A83D978((uint64_t)v33);
              v22 += 8;
              --v21;
            }
            while (v21);

            swift_bridgeObjectRelease_n();
            v4 = v29;
          }
          else
          {

          }
          v7 = v19;
          v8 = v18;
          v10 = v30;
          v3 = v31;
          if (v9 == v8)
            goto LABEL_20;
        }
      }
      __break(1u);
LABEL_22:
      swift_bridgeObjectRetain();
    }
LABEL_20:
    swift_bridgeObjectRelease_n();
    v25 = sub_23A82C740();
    sub_23A8148E8(*(double *)(v3 + v4));

    v26 = sub_23A82C82C();
    sub_23A8148E8(*(double *)(v3 + v4));

    v27 = sub_23A82C754();
    sub_23A8148E8(*(double *)(v3 + v4));

  }
}

void *DRPDropletContextView.dropletColor.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___DRPDropletContextView_dropletColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void DRPDropletContextView.dropletColor.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR___DRPDropletContextView_dropletColor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;
  sub_23A83F1AC(v4);

}

void sub_23A83F1AC(void *a1)
{
  char *v1;
  char *v2;
  void **v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v2 = v1;
  v4 = (void **)&v2[OBJC_IVAR___DRPDropletContextView_dropletColor];
  swift_beginAccess();
  v5 = *v4;
  if (*v4)
  {
    if (a1)
    {
      sub_23A81A1DC(0, (unint64_t *)&qword_2569C29B0);
      v6 = a1;
      v7 = v5;
      v8 = sub_23A84C300();

      if ((v8 & 1) != 0)
        return;
    }
  }
  else if (!a1)
  {
    return;
  }
  v9 = sub_23A83E688();
  v10 = *v4;
  if (*v4)
  {
    v11 = *v4;
  }
  else
  {
    v11 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v10 = 0;
  }
  v12 = v10;
  v13 = objc_msgSend(v2, sel_traitCollection);
  v14 = objc_msgSend(v11, sel_resolvedColorWithTraitCollection_, v13);

  v15 = objc_msgSend(v14, sel_CGColor);
  sub_23A82E3EC(v15);

}

uint64_t DRPDropletContextView.keylineStyle.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t DRPDropletContextView.keylineStyle.setter(uint64_t a1)
{
  char *v1;
  char *v3;

  v3 = &v1[OBJC_IVAR___DRPDropletContextView_keylineStyle];
  swift_beginAccess();
  *(_QWORD *)v3 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  objc_msgSend(v1, sel_applyKeylineStyle_forContainerView_, *(_QWORD *)v3, 0);
  return swift_unknownObjectRelease();
}

uint64_t DRPDropletContextView.applyKeylineStyle(_:for:)(char *a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  id v20;
  double v21;
  double v22;
  char *v23;
  id v24;
  id v25;
  id v26;
  unsigned int v27;
  id v28;
  _BYTE *v29;
  id v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 v37;
  id v38;
  id *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  char *v50;
  void *v51;
  BOOL v52;
  double *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  BOOL v58;
  BOOL v59;
  char *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  _QWORD *v65;
  void *v66;
  uint64_t v67;
  id v68;
  double v69;
  id v70;
  double v71;
  id v72;
  double v73;
  char *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  unsigned int v79;
  id v80;
  char *v81;
  id v82;
  id v83;
  id v84;
  unsigned int v85;
  id v86;
  _BYTE *v87;
  char *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unsigned __int8 v99;
  char *v100;
  float64x2_t *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  char *v106;
  float64x2_t v107;
  float64x2_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD *v112;
  _BYTE *v113;
  char *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unsigned __int8 v125;
  id *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double *v131;
  unint64_t v132;
  uint64_t v133;
  _QWORD *v134;
  char *v135;
  void *v136;
  double *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  char *v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  _QWORD *v149;
  void *v150;
  _BYTE *v151;
  uint64_t v152;
  char *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unsigned __int8 v164;
  id *v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double *v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  _QWORD *v175;
  char *v176;
  void *v177;
  double *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  BOOL v183;
  BOOL v184;
  char *v186;
  uint64_t v187;
  uint64_t *v188;
  uint64_t v189;
  _QWORD *v190;
  void *v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  id v195;
  void *v196;
  unint64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  void *v202;
  unint64_t v203;
  void *v205;
  uint64_t v206;
  id *v207;
  uint64_t v208;
  char *v209;
  void *v210;
  uint64_t v211;
  uint64_t v212;
  unint64_t v213;
  uint64_t v214;
  uint64_t v215;
  float64x2_t v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t *v219;
  float64x2_t v220;
  void *v221;
  unint64_t v222;
  unint64_t v223;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  uint64_t v230[2];

  v7 = a1;
  if (a1)
  {
    objc_opt_self();
    v8 = swift_dynamicCastObjCClass();
    if (v8)
    {
      v9 = v8;
      swift_unknownObjectRetain_n();
      v10 = sub_23A83E688();
      objc_msgSend((id)v9, sel_innerWidth);
      v2 = v11;
      objc_msgSend((id)v9, sel_outerWidth);
      sub_23A83D0C8(v2, v12);

      v13 = (char *)sub_23A83E688();
      v14 = *(id *)&v13[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];

      v15 = sub_23A82C740();
      v16 = objc_msgSend(v15, sel_layer);
      v17 = objc_msgSend(v16, sel_softRim);

      if (v17)
      {
        v18 = objc_msgSend(v15, sel_layer);
        objc_msgSend(v18, sel_setSoftRim_, 0);

        if (!a2)
          goto LABEL_11;
      }
      else
      {

        if (!a2)
        {
LABEL_11:
          v210 = a2;
          v29 = sub_23A83E688();
          v30 = objc_msgSend((id)v9, sel_color);
          v31 = &v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
          v221 = *(void **)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
          v32 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 24];
          v211 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 16];
          v217 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 8];
          v209 = (char *)v9;
          v33 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 32];
          v34 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 40];
          v35 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 64];
          v206 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 56];
          v208 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 48];
          v36 = *(_QWORD *)&v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 72];
          v37 = v29[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 80];
          *(_QWORD *)v31 = v30;
          *((_QWORD *)v31 + 9) = 0;
          *(_OWORD *)(v31 + 56) = 0u;
          *(_OWORD *)(v31 + 40) = 0u;
          *(_OWORD *)(v31 + 24) = 0u;
          *(_OWORD *)(v31 + 8) = 0u;
          v31[80] = 1;
          v38 = v30;
          sub_23A82E714(v221, v217, v211, v32, v33, v34, v208, v206, v35, v36, v37);
          sub_23A83C7D0();

          v39 = (id *)sub_23A83E688();
          objc_msgSend(v209, sel_keylineFadeLengths);
          v2 = v40;
          v3 = v41;
          v4 = v42;
          v5 = v43;
          v44 = (double *)((char *)v39 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference);
          *v44 = v40;
          v44[1] = v41;
          v44[2] = v42;
          v44[3] = v43;
          *((_BYTE *)v44 + 32) = 0;
          v45 = sub_23A82AF84();
          v46 = v45;
          v207 = v39;
          if (v45 >> 62)
          {
            swift_bridgeObjectRetain();
            v47 = sub_23A84C3B4();
            v7 = a1;
            if (!v47)
              goto LABEL_119;
          }
          else
          {
            v47 = *(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            v7 = a1;
            if (!v47)
              goto LABEL_119;
          }
          v9 = 0;
          v48 = v46 & 0xC000000000000001;
          v218 = (uint64_t *)(v46 + 32);
          v49 = (_QWORD *)MEMORY[0x24BEE4EA0];
          v212 = v47;
          v222 = v46 & 0xC000000000000001;
          do
          {
            while (1)
            {
              if (v48)
                v50 = (char *)MEMORY[0x23B858090](v9, v46);
              else
                v50 = (char *)(id)v218[v9];
              v51 = v50;
              v52 = __OFADD__(v9++, 1);
              if (v52)
                goto LABEL_139;
              v53 = (double *)&v50[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
              v54 = *(double *)&v50[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
              v55 = *(double *)&v50[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 8];
              v56 = *(double *)&v50[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
              v57 = *(double *)&v50[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 24];
              *v53 = v2;
              v53[1] = v3;
              v53[2] = v4;
              v53[3] = v5;
              v58 = v2 == v54 && v3 == v55;
              v59 = v58 && v4 == v56;
              if (!v59 || v5 != v57)
                break;

              if (v9 == v47)
                goto LABEL_119;
            }
            v61 = &v50[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
            swift_beginAccess();
            v62 = *(_QWORD *)(*(_QWORD *)v61 + 16);
            if (v62)
            {
              v63 = (uint64_t *)v46;
              v64 = *(_QWORD *)v61 + 32;
              swift_bridgeObjectRetain_n();
              do
              {
                sub_23A82E960(v64, (uint64_t)v230);
                v65 = (_QWORD *)MEMORY[0x23B858660](v230);
                if (v65)
                {
                  v66 = v65;
                  (*(void (**)(void *, double, double, double, double))((*v49 & *v65) + 0xD0))(v51, *v53, v53[1], v53[2], v53[3]);

                }
                sub_23A83D978((uint64_t)v230);
                v64 += 8;
                --v62;
              }
              while (v62);

              swift_bridgeObjectRelease_n();
              v7 = a1;
              v46 = (unint64_t)v63;
              v47 = v212;
            }
            else
            {

              v7 = a1;
            }
            v48 = v222;
          }
          while (v9 != v47);
          goto LABEL_119;
        }
      }
LABEL_92:
      swift_unknownObjectRelease();
      goto LABEL_120;
    }
    objc_opt_self();
    v19 = swift_dynamicCastObjCClass();
    if (v19)
    {
      v9 = v19;
      v210 = a2;
      swift_unknownObjectRetain_n();
      v20 = sub_23A83E688();
      objc_msgSend((id)v9, sel_innerWidth);
      v2 = v21;
      objc_msgSend((id)v9, sel_outerWidth);
      sub_23A83D0C8(v2, v22);

      v23 = (char *)sub_23A83E688();
      v24 = *(id *)&v23[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];

      v25 = sub_23A82C740();
      v26 = objc_msgSend(v25, sel_layer);
      v27 = objc_msgSend(v26, sel_softRim);

      if (v27)
      {
        v28 = objc_msgSend(v25, sel_layer);
        objc_msgSend(v28, sel_setSoftRim_, 0);

        a2 = v210;
        if (v210)
          goto LABEL_92;
      }
      else
      {

        a2 = v210;
        if (v210)
          goto LABEL_92;
      }
      v113 = sub_23A83E688();
      objc_msgSend((id)v9, sel_adaptiveColorMatrix);
      v114 = &v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
      v115 = *(void **)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
      v116 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 8];
      v117 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 16];
      v118 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 24];
      v119 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 32];
      v120 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 40];
      v121 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 48];
      v122 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 56];
      v123 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 64];
      v124 = *(_QWORD *)&v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 72];
      v125 = v113[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 80];
      *(_OWORD *)v114 = v225;
      *((_OWORD *)v114 + 1) = v226;
      *((_OWORD *)v114 + 2) = v227;
      *((_OWORD *)v114 + 3) = v228;
      *((_OWORD *)v114 + 4) = v229;
      v114[80] = 0;
      sub_23A82E714(v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125);
      sub_23A83C7D0();

      v126 = (id *)sub_23A83E688();
      objc_msgSend((id)v9, sel_keylineFadeLengths);
      v2 = v127;
      v3 = v128;
      v4 = v129;
      v5 = v130;
      v131 = (double *)((char *)v126 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference);
      *v131 = v127;
      v131[1] = v128;
      v131[2] = v129;
      v131[3] = v130;
      *((_BYTE *)v131 + 32) = 0;
      v132 = sub_23A82AF84();
      v46 = v132;
      v207 = v126;
      v209 = (char *)v9;
      if (v132 >> 62)
        goto LABEL_156;
      v133 = *(_QWORD *)((v132 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v133)
        goto LABEL_119;
      goto LABEL_66;
    }
    objc_opt_self();
    v67 = swift_dynamicCastObjCClass();
    if (v67)
    {
      v9 = v67;
      v210 = a2;
      swift_unknownObjectRetain_n();
      v68 = sub_23A83E688();
      objc_msgSend((id)v9, sel_innerWidth);
      sub_23A83D0C8(0.0, v69);

      v70 = sub_23A83E688();
      objc_msgSend((id)v9, sel_outerWidth);
      sub_23A82AD6C(v71 / -100.0 + 0.5);

      v72 = sub_23A83E688();
      objc_msgSend((id)v9, sel_outerWidthBlurRadius);
      sub_23A82AE78(v73);

      v74 = (char *)sub_23A83E688();
      v75 = *(id *)&v74[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];

      v76 = objc_msgSend((id)v9, sel_innerWidthSoft);
      v77 = sub_23A82C740();
      v78 = objc_msgSend(v77, sel_layer);
      v79 = objc_msgSend(v78, sel_softRim);

      if ((_DWORD)v76 == v79)
      {

        a2 = v210;
        if (v210)
          goto LABEL_92;
      }
      else
      {
        v80 = objc_msgSend(v77, sel_layer);
        objc_msgSend(v80, sel_setSoftRim_, v76);

        a2 = v210;
        if (v210)
          goto LABEL_92;
      }
      v151 = sub_23A83E688();
      v152 = objc_msgSend((id)v9, sel_preferAudioReactivity);
      v153 = &v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
      v154 = *(void **)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
      v155 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 8];
      v156 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 16];
      v157 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 24];
      v158 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 32];
      v159 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 40];
      v160 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 48];
      v161 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 56];
      v162 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 64];
      v163 = *(_QWORD *)&v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 72];
      v164 = v151[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 80];
      *(_QWORD *)v153 = v152;
      *(_OWORD *)(v153 + 8) = 0u;
      *(_OWORD *)(v153 + 24) = 0u;
      *(_OWORD *)(v153 + 40) = 0u;
      *(_OWORD *)(v153 + 56) = 0u;
      *((_QWORD *)v153 + 9) = 0;
      v153[80] = 2;
      sub_23A82E714(v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164);
      sub_23A83C7D0();

      v165 = (id *)sub_23A83E688();
      objc_msgSend((id)v9, sel_keylineFadeLengths);
      v2 = v166;
      v3 = v167;
      v4 = v168;
      v5 = v169;
      v170 = (double *)((char *)v165 + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference);
      *v170 = v166;
      v170[1] = v167;
      v170[2] = v168;
      v170[3] = v169;
      *((_BYTE *)v170 + 32) = 0;
      v207 = v165;
      v171 = sub_23A82AF84();
      v46 = v171;
      v209 = (char *)v9;
      if (v171 >> 62)
      {
        swift_bridgeObjectRetain();
        v172 = sub_23A84C3B4();
        if (!v172)
          goto LABEL_119;
      }
      else
      {
        v172 = *(_QWORD *)((v171 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v172)
          goto LABEL_119;
      }
      v173 = 0;
      v174 = v46 & 0xC000000000000001;
      *(_QWORD *)&v216.f64[0] = v46 + 32;
      v103 = (uint64_t)&OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths;
      v175 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v215 = v172;
      *(_QWORD *)&v220.f64[0] = v46 & 0xC000000000000001;
      do
      {
        while (1)
        {
          if (v174)
            v176 = (char *)MEMORY[0x23B858090](v173, v46);
          else
            v176 = (char *)*(id *)(*(_QWORD *)&v216.f64[0] + 8 * v173);
          v177 = v176;
          v52 = __OFADD__(v173++, 1);
          if (v52)
          {
            __break(1u);
            goto LABEL_146;
          }
          v178 = (double *)&v176[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
          v179 = *(double *)&v176[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
          v180 = *(double *)&v176[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 8];
          v181 = *(double *)&v176[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
          v182 = *(double *)&v176[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 24];
          *v178 = v2;
          v178[1] = v3;
          v178[2] = v4;
          v178[3] = v5;
          v183 = v2 == v179 && v3 == v180;
          v184 = v183 && v4 == v181;
          if (!v184 || v5 != v182)
            break;

          if (v173 == v172)
            goto LABEL_119;
        }
        v186 = &v176[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
        swift_beginAccess();
        v187 = *(_QWORD *)(*(_QWORD *)v186 + 16);
        if (v187)
        {
          v188 = (uint64_t *)v46;
          v189 = *(_QWORD *)v186 + 32;
          swift_bridgeObjectRetain_n();
          do
          {
            sub_23A82E960(v189, (uint64_t)v230);
            v190 = (_QWORD *)MEMORY[0x23B858660](v230);
            if (v190)
            {
              v191 = v190;
              (*(void (**)(void *, double, double, double, double))((*v175 & *v190) + 0xD0))(v177, *v178, v178[1], v178[2], v178[3]);

            }
            sub_23A83D978((uint64_t)v230);
            v189 += 8;
            --v187;
          }
          while (v187);

          swift_bridgeObjectRelease_n();
          v7 = a1;
          v46 = (unint64_t)v188;
          v172 = v215;
        }
        else
        {

          v7 = a1;
        }
        v174 = *(_QWORD *)&v220.f64[0];
        v103 = (uint64_t)&OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths;
      }
      while (v173 != v172);
      goto LABEL_119;
    }
  }
  v210 = a2;
  v48 = (unint64_t)sub_23A83E688();
  if (qword_2569C25B8 != -1)
    goto LABEL_144;
  while (1)
  {
    sub_23A83D0C8(*(double *)&xmmword_2569C3BE8, *((double *)&xmmword_2569C3BE8 + 1));

    v81 = (char *)sub_23A83E688();
    v46 = (unint64_t)&OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView;
    v82 = *(id *)&v81[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];

    v83 = sub_23A82C740();
    v84 = objc_msgSend(v83, sel_layer);
    v85 = objc_msgSend(v84, sel_softRim);

    if (!v85)
    {

      a2 = v210;
      if (v210)
        goto LABEL_45;
LABEL_47:
      v87 = sub_23A83E688();
      v88 = &v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
      v89 = *(void **)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference];
      v90 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 8];
      v91 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 16];
      v92 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 24];
      v93 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 32];
      v94 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 40];
      v95 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 48];
      v96 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 56];
      v97 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 64];
      v98 = *(_QWORD *)&v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 72];
      v99 = v87[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference + 80];
      *((_OWORD *)v88 + 3) = 0u;
      *((_OWORD *)v88 + 4) = 0u;
      *((_OWORD *)v88 + 1) = 0u;
      *((_OWORD *)v88 + 2) = 0u;
      *(_OWORD *)v88 = 0u;
      v88[80] = 1;
      sub_23A82E714(v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99);
      sub_23A83C7D0();

      v100 = (char *)sub_23A83E688();
      v101 = (float64x2_t *)&v100[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference];
      v216 = *(float64x2_t *)MEMORY[0x24BEBE158];
      v220 = *(float64x2_t *)(MEMORY[0x24BEBE158] + 16);
      *v101 = *(float64x2_t *)MEMORY[0x24BEBE158];
      v101[1] = v220;
      LOBYTE(v101[2].f64[0]) = 0;
      v48 = *(_QWORD *)&v100[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
      v102 = sub_23A82AF84();
      v103 = v102;
      v205 = v100;
      if (v102 >> 62)
      {
LABEL_146:
        if (v103 < 0)
          v48 = v103;
        else
          v48 = v103 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
        v104 = sub_23A84C3B4();
        if (v104)
          goto LABEL_49;
      }
      else
      {
        v104 = *(_QWORD *)((v102 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v104)
        {
LABEL_49:
          v7 = 0;
          v213 = v103 & 0xC000000000000001;
          v207 = (id *)(v103 + 32);
          v2 = v216.f64[1];
          v3 = v220.f64[1];
          v105 = (_QWORD *)MEMORY[0x24BEE4EA0];
          v209 = (char *)v104;
          while (1)
          {
            v106 = v213 ? (char *)MEMORY[0x23B858090](v7, v103) : (char *)v207[(_QWORD)v7];
            v9 = (uint64_t)v106;
            v52 = __OFADD__(v7++, 1);
            if (v52)
              break;
            v46 = (unint64_t)&v106[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
            v107 = *(float64x2_t *)&v106[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
            v108 = *(float64x2_t *)&v106[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
            *(float64x2_t *)v46 = v216;
            *(float64x2_t *)(v46 + 16) = v220;
            if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v216, v107), (int32x4_t)vceqq_f64(v220, v108))), 0xFuLL))) & 1) != 0|| (v48 = (unint64_t)&v106[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews], swift_beginAccess(), (v109 = *(_QWORD *)(*(_QWORD *)v48 + 16)) == 0))
            {

              if (v7 == (char *)v104)
                goto LABEL_62;
            }
            else
            {
              v110 = v103;
              v111 = *(_QWORD *)v48 + 32;
              swift_bridgeObjectRetain_n();
              do
              {
                sub_23A82E960(v111, (uint64_t)v230);
                v112 = (_QWORD *)MEMORY[0x23B858660](v230);
                if (v112)
                {
                  v48 = (unint64_t)v112;
                  (*(void (**)(uint64_t, double, double, double, double))((*v105 & *v112) + 0xD0))(v9, *(double *)v46, *(double *)(v46 + 8), *(double *)(v46 + 16), *(double *)(v46 + 24));

                }
                sub_23A83D978((uint64_t)v230);
                v111 += 8;
                --v109;
              }
              while (v109);

              swift_bridgeObjectRelease_n();
              v103 = v110;
              v104 = (uint64_t)v209;
              if (v7 == v209)
                goto LABEL_62;
            }
          }
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
      }
LABEL_62:
      swift_bridgeObjectRelease_n();

      v9 = 0;
      v7 = a1;
      while (1)
      {
        v197 = sub_23A83EAA8();
        v198 = v197;
        v230[0] = MEMORY[0x24BEE4AF8];
        if (v197 >> 62)
        {
          swift_bridgeObjectRetain();
          v199 = sub_23A84C3B4();
          if (!v199)
          {
LABEL_154:
            swift_bridgeObjectRelease_n();
            v48 = MEMORY[0x24BEE4AF8];
            goto LABEL_121;
          }
        }
        else
        {
          v199 = *(_QWORD *)((v197 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v199)
            goto LABEL_154;
        }
        if (v199 >= 1)
        {
          v200 = 0;
          do
          {
            if ((v198 & 0xC000000000000001) != 0)
              v201 = (char *)MEMORY[0x23B858090](v200, v198);
            else
              v201 = (char *)*(id *)(v198 + 8 * v200 + 32);
            v202 = v201;
            ++v200;
            v203 = *(_QWORD *)&v201[OBJC_IVAR___DRPDropletContainerView_participantViews];
            swift_bridgeObjectRetain();

            sub_23A8423A4(v203, sub_23A842894);
          }
          while (v199 != v200);
          swift_bridgeObjectRelease_n();
          v48 = v230[0];
          v7 = a1;
          goto LABEL_121;
        }
        __break(1u);
LABEL_156:
        swift_bridgeObjectRetain();
        v133 = sub_23A84C3B4();
        if (v133)
          break;
LABEL_119:
        swift_bridgeObjectRelease_n();

        swift_unknownObjectRelease();
        v9 = (uint64_t)v209;
      }
LABEL_66:
      v9 = 0;
      v48 = v46 & 0xC000000000000001;
      v219 = (uint64_t *)(v46 + 32);
      v134 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v214 = v133;
      v223 = v46 & 0xC000000000000001;
      while (1)
      {
        v135 = v48 ? (char *)MEMORY[0x23B858090](v9, v46) : (char *)(id)v219[v9];
        v136 = v135;
        v52 = __OFADD__(v9++, 1);
        if (v52)
          goto LABEL_140;
        v137 = (double *)&v135[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
        v138 = *(double *)&v135[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
        v139 = *(double *)&v135[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 8];
        v140 = *(double *)&v135[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
        v141 = *(double *)&v135[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 24];
        *v137 = v2;
        v137[1] = v3;
        v137[2] = v4;
        v137[3] = v5;
        if (v2 == v138 && v3 == v139 && v4 == v140 && v5 == v141)
        {

          if (v9 == v133)
            goto LABEL_119;
        }
        else
        {
          v145 = &v135[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
          swift_beginAccess();
          v146 = *(_QWORD *)(*(_QWORD *)v145 + 16);
          if (v146)
          {
            v147 = (uint64_t *)v46;
            v148 = *(_QWORD *)v145 + 32;
            swift_bridgeObjectRetain_n();
            do
            {
              sub_23A82E960(v148, (uint64_t)v230);
              v149 = (_QWORD *)MEMORY[0x23B858660](v230);
              if (v149)
              {
                v150 = v149;
                (*(void (**)(void *, double, double, double, double))((*v134 & *v149) + 0xD0))(v136, *v137, v137[1], v137[2], v137[3]);

              }
              sub_23A83D978((uint64_t)v230);
              v148 += 8;
              --v146;
            }
            while (v146);

            swift_bridgeObjectRelease_n();
            v7 = a1;
            v46 = (unint64_t)v147;
            v133 = v214;
          }
          else
          {

            v7 = a1;
          }
          v48 = v223;
          if (v9 == v133)
            goto LABEL_119;
        }
      }
    }
    v86 = objc_msgSend(v83, sel_layer);
    objc_msgSend(v86, sel_setSoftRim_, 0);

    a2 = v210;
    if (!v210)
      goto LABEL_47;
LABEL_45:
    v9 = 0;
LABEL_120:
    type metadata accessor for DRPDropletContainerView();
    v192 = a2;
    sub_23A84C3A8();

    v48 = *(_QWORD *)&v192[OBJC_IVAR___DRPDropletContainerView_participantViews];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_121:
    if (!(v48 >> 62))
    {
      v193 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v193)
        goto LABEL_142;
      goto LABEL_123;
    }
LABEL_141:
    swift_bridgeObjectRetain();
    v193 = sub_23A84C3B4();
    if (!v193)
      goto LABEL_142;
LABEL_123:
    if (v193 >= 1)
      break;
    __break(1u);
LABEL_144:
    swift_once();
  }
  v194 = 0;
  do
  {
    if ((v48 & 0xC000000000000001) != 0)
      v195 = (id)MEMORY[0x23B858090](v194, v48);
    else
      v195 = *(id *)(v48 + 8 * v194 + 32);
    v196 = v195;
    ++v194;
    v230[0] = (uint64_t)v195;
    sub_23A8406D4(v230, v7);

  }
  while (v193 != v194);
LABEL_142:

  return swift_bridgeObjectRelease_n();
}

id sub_23A8406D4(uint64_t *a1, id a2)
{
  unint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  void (*v59)(uint64_t, _BYTE *);
  void *v60;
  void *v61;
  id result;
  double v63;
  uint64_t v64;
  double v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  void *v72;
  void *v73;
  double v74;
  uint64_t v75;
  double v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  _QWORD *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  id v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  _BYTE v106[88];
  _BYTE v107[88];
  _QWORD v108[12];
  uint64_t v109;

  v2 = (unint64_t)a2;
  v3 = *a1;
  if (a2)
  {
    objc_msgSend(a2, sel_keylineFadeLengths);
  }
  else
  {
    v4 = *MEMORY[0x24BEBE158];
    v5 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v6 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v7 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  v8 = (double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths);
  v9 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths);
  v10 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 8);
  v11 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16);
  v12 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 24);
  *v8 = v4;
  v8[1] = v5;
  v8[2] = v6;
  v8[3] = v7;
  if (v4 != v9 || v5 != v10 || v6 != v11 || v7 != v12)
  {
    v16 = (uint64_t *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    swift_beginAccess();
    v17 = *v16;
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v19 = v17 + 32;
      swift_bridgeObjectRetain();
      v20 = (_QWORD *)MEMORY[0x24BEE4EA0];
      do
      {
        v21 = (_QWORD *)MEMORY[0x23B858660](v19);
        if (v21)
        {
          v22 = v21;
          (*(void (**)(uint64_t, double, double, double, double))((*v20 & *v21) + 0xD0))(v3, *v8, v8[1], v8[2], v8[3]);

        }
        v19 += 8;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
  }
  if (v2)
  {
    objc_msgSend((id)v2, sel_keylineOutsets);
  }
  else
  {
    v23 = *MEMORY[0x24BEBE158];
    v24 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v25 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v26 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  v27 = (double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets);
  v28 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets);
  v29 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets + 8);
  v30 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets + 16);
  v31 = *(double *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets + 24);
  *v27 = v23;
  v27[1] = v24;
  v27[2] = v25;
  v27[3] = v26;
  if (v23 != v28 || v24 != v29 || v25 != v30 || v26 != v31)
  {
    v35 = (uint64_t *)(v3 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    swift_beginAccess();
    v36 = *v35;
    v37 = *(_QWORD *)(v36 + 16);
    if (v37)
    {
      v38 = v36 + 32;
      swift_bridgeObjectRetain();
      v39 = (_QWORD *)MEMORY[0x24BEE4EA0];
      do
      {
        v40 = (_QWORD *)MEMORY[0x23B858660](v38);
        if (v40)
        {
          v41 = v40;
          (*(void (**)(uint64_t, double, double, double, double))((*v39 & *v40) + 0xD8))(v3, *v27, v27[1], v27[2], v27[3]);

        }
        v38 += 8;
        --v37;
      }
      while (v37);
      swift_bridgeObjectRelease();
    }
  }
  v102 = (id)v2;
  if (!v2)
  {
    v43 = v3;
    goto LABEL_43;
  }
  objc_opt_self();
  v42 = (void *)swift_dynamicCastObjCClass();
  if (v42)
  {
    v43 = v3;
    v2 = (unint64_t)objc_msgSend(v42, sel_color);
LABEL_43:
    v104 = 0;
    v44 = 0;
    v45 = 0;
    v109 = 0;
    v105 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v103 = 1;
    goto LABEL_44;
  }
  objc_opt_self();
  v73 = (void *)swift_dynamicCastObjCClass();
  v43 = v3;
  if (v73)
  {
    objc_msgSend(v73, sel_adaptiveColorMatrix);
    v103 = 0;
    v2 = v108[0];
    v104 = v108[1];
    v44 = v108[2];
    v45 = v108[3];
    v109 = v108[4];
    v46 = v108[6];
    v105 = v108[5];
    v47 = v108[7];
    v48 = v108[8];
    v49 = v108[9];
  }
  else
  {
    objc_opt_self();
    v84 = (void *)swift_dynamicCastObjCClass();
    if (!v84)
    {
      v2 = 0;
      goto LABEL_43;
    }
    v104 = 0;
    v44 = 0;
    v45 = 0;
    v109 = 0;
    v105 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v103 = 2;
    v2 = objc_msgSend(v84, sel_preferAudioReactivity);
  }
LABEL_44:
  v93 = v43;
  v50 = v43 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType;
  sub_23A822438(v50, (uint64_t)v108);
  v100 = *(_QWORD *)(v50 + 8);
  v101 = *(void **)v50;
  v98 = *(_QWORD *)(v50 + 24);
  v99 = *(_QWORD *)(v50 + 16);
  v96 = *(_QWORD *)(v50 + 40);
  v97 = *(_QWORD *)(v50 + 32);
  v94 = *(_QWORD *)(v50 + 56);
  v95 = *(_QWORD *)(v50 + 48);
  v91 = *(_QWORD *)(v50 + 72);
  v92 = *(_QWORD *)(v50 + 64);
  v90 = *(_BYTE *)(v50 + 80);
  *(_QWORD *)v50 = v2;
  *(_QWORD *)(v50 + 8) = v104;
  *(_QWORD *)(v50 + 16) = v44;
  *(_QWORD *)(v50 + 24) = v45;
  *(_QWORD *)(v50 + 32) = v109;
  *(_QWORD *)(v50 + 40) = v105;
  *(_QWORD *)(v50 + 48) = v46;
  *(_QWORD *)(v50 + 56) = v47;
  *(_QWORD *)(v50 + 64) = v48;
  *(_QWORD *)(v50 + 72) = v49;
  *(_BYTE *)(v50 + 80) = v103;
  sub_23A82E6C0((uint64_t)v108, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
  v85 = v49;
  v86 = v48;
  v88 = (void *)v2;
  v89 = v44;
  v87 = v46;
  sub_23A8223E8((id)v2, v104, v44, v45, v109, v105, v46, v47, v48, v49, v103);
  sub_23A82E644(v101, v100, v99, v98, v97, v96, v95, v94, v92, v91, v90);
  sub_23A822438(v50, (uint64_t)v107);
  sub_23A82E6C0((uint64_t)v107, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
  v51 = sub_23A848068((uint64_t)v107, (uint64_t)v108);
  sub_23A82E6C0((uint64_t)v107, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);
  v52 = v102;
  if ((v51 & 1) == 0)
  {
    v53 = v93 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews;
    swift_beginAccess();
    v54 = *(_QWORD *)(*(_QWORD *)v53 + 16);
    if (v54)
    {
      v55 = *(_QWORD *)v53 + 32;
      swift_bridgeObjectRetain();
      v56 = (_QWORD *)MEMORY[0x24BEE4EA0];
      do
      {
        v57 = MEMORY[0x23B858660](v55);
        if (v57)
        {
          v58 = (_QWORD *)v57;
          sub_23A822438(v50, (uint64_t)v106);
          v59 = *(void (**)(uint64_t, _BYTE *))((*v56 & *v58) + 0xE0);
          sub_23A82E6C0((uint64_t)v106, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
          v59(v93, v106);
          sub_23A82E6C0((uint64_t)v106, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);

        }
        v55 += 8;
        --v54;
      }
      while (v54);
      swift_bridgeObjectRelease();
      v52 = v102;
    }
    v60 = (void *)MEMORY[0x23B858660](v93 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineParticipantView);
    if (v60)
    {
      v61 = v60;
      objc_msgSend(v60, sel_setHidden_, *(unsigned __int8 *)(v50 + 80) != 2);

    }
  }
  sub_23A82E644(v88, v104, v89, v45, v109, v105, v87, v47, v86, v85, v103);
  result = (id)sub_23A82E6C0((uint64_t)v108, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);
  if (v52)
    result = objc_msgSend(v52, sel_normalizedStartLocation);
  else
    v63 = 0.99;
  v64 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation;
  v65 = *(double *)(v93 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation);
  *(double *)(v93 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation) = v63;
  if (v63 != v65)
  {
    v66 = (uint64_t *)(v93 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    result = (id)swift_beginAccess();
    v67 = *v66;
    v68 = *(_QWORD *)(v67 + 16);
    if (v68)
    {
      v69 = v67 + 32;
      swift_bridgeObjectRetain();
      v70 = (_QWORD *)MEMORY[0x24BEE4EA0];
      do
      {
        v71 = (_QWORD *)MEMORY[0x23B858660](v69);
        if (v71)
        {
          v72 = v71;
          (*(void (**)(uint64_t, double))((*v70 & *v71) + 0xE8))(v93, *(double *)(v93 + v64));

        }
        v69 += 8;
        --v68;
      }
      while (v68);
      result = (id)swift_bridgeObjectRelease();
    }
  }
  if (v52)
    result = objc_msgSend(v52, sel_normalizedStopLocation);
  else
    v74 = 1.0;
  v75 = OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation;
  v76 = *(double *)(v93 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation);
  *(double *)(v93 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation) = v74;
  if (v74 != v76)
  {
    v77 = (uint64_t *)(v93 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
    result = (id)swift_beginAccess();
    v78 = *v77;
    v79 = *(_QWORD *)(v78 + 16);
    if (v79)
    {
      v80 = v78 + 32;
      swift_bridgeObjectRetain();
      v81 = (_QWORD *)MEMORY[0x24BEE4EA0];
      do
      {
        v82 = (_QWORD *)MEMORY[0x23B858660](v80);
        if (v82)
        {
          v83 = v82;
          (*(void (**)(uint64_t, double))((*v81 & *v82) + 0xF0))(v93, *(double *)(v93 + v75));

        }
        v80 += 8;
        --v79;
      }
      while (v79);
      return (id)swift_bridgeObjectRelease();
    }
  }
  return result;
}

void __swiftcall DRPDropletContextView.addContainer(contentView:)(DRPDropletContainerView *__return_ptr retstr, UIView_optional *contentView)
{
  UIView_optional *v3;
  _BYTE *v4;
  uint64_t v5;
  char v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  uint64_t v17;
  char v18;
  id v19;
  uint64_t v20;
  _BYTE v21[40];
  _BYTE v22[88];

  type metadata accessor for DRPDropletContainerView();
  v3 = contentView;
  v4 = sub_23A83E688();
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  v6 = v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference + 8];
  sub_23A82E744((uint64_t)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFadeLengthsPreference], (uint64_t)v21, &qword_2569C2C28);
  sub_23A82E744((uint64_t)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference], (uint64_t)v22, (uint64_t *)&unk_2569C2C30);
  sub_23A82E6C0((uint64_t)v22, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E6A0);
  v7 = sub_23A82B220(v5, v6, (uint64_t)v21, (uint64_t)v22);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  sub_23A82E6C0((uint64_t)v22, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E714);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView], sel_insertSubview_atIndex_, v13, 0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23A84E8C0;
  *(_QWORD *)(v14 + 32) = v7;
  *(_QWORD *)(v14 + 40) = v9;
  *(_QWORD *)(v14 + 48) = v11;
  v20 = v14;
  sub_23A84C270();

  v15 = sub_23A823168(contentView, v20);
  v16 = sub_23A83E688();
  v17 = *(_QWORD *)&v16[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference];
  v18 = v16[OBJC_IVAR____TtC9DropletUI16DropletShapeView_boundaryEdgesPreference + 8];

  if ((v18 & 1) == 0)
    objc_msgSend(v15, sel_setBoundaryEdges_, v17);
  v19 = sub_23A8410A8();
  objc_msgSend(v19, sel_addSubview_, v15);

}

id sub_23A8410A8()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView;
  v2 = *(void **)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, v4, v5, v6, v7);
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

Swift::Void __swiftcall DRPDropletContextView.removeContainer(_:)(DRPDropletContainerView *a1)
{
  id v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  id v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  char v39;
  uint64_t v40;
  DRPDropletContainerView *v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  unint64_t v45;

  v2 = -[DRPDropletContainerView superview](a1, sel_superview);
  v3 = sub_23A8410A8();
  v4 = v3;
  if (v2)
  {

    if (v2 != v4)
      goto LABEL_57;
    v40 = OBJC_IVAR___DRPDropletContainerView_participantViews;
    v41 = a1;
    v5 = *(unint64_t *)((char *)&a1->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_participantViews);
    v42 = v5;
    if (v5 >> 62)
    {
LABEL_58:
      swift_bridgeObjectRetain_n();
      v43 = sub_23A84C3B4();
      if (v43)
        goto LABEL_5;
    }
    else
    {
      v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      v43 = v6;
      if (v6)
      {
LABEL_5:
        v7 = 0;
        do
        {
          if ((v42 & 0xC000000000000001) != 0)
            v8 = (id)MEMORY[0x23B858090](v7, v42);
          else
            v8 = *(id *)(v42 + 32 + 8 * v7);
          v9 = v8;
          if (__OFADD__(v7++, 1))
          {
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
            goto LABEL_56;
          }
          v44 = sub_23A83E688();
          v11 = sub_23A82C740();
          v12 = objc_msgSend(v11, sel_subviews);

          sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
          v13 = sub_23A84C264();

          v14 = sub_23A82C82C();
          v15 = objc_msgSend(v14, sel_subviews);

          v16 = sub_23A84C264();
          sub_23A8423A4(v16, sub_23A8426E4);
          v17 = sub_23A82C754();
          v18 = objc_msgSend(v17, sel_subviews);

          v19 = sub_23A84C264();
          sub_23A8423A4(v19, sub_23A8426E4);
          v45 = MEMORY[0x24BEE4AF8];
          if (v13 >> 62)
          {
            swift_bridgeObjectRetain();
            v20 = sub_23A84C3B4();
            if (!v20)
            {
LABEL_27:
              swift_bridgeObjectRelease();
              v24 = MEMORY[0x24BEE4AF8];
              goto LABEL_28;
            }
          }
          else
          {
            v20 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v20)
              goto LABEL_27;
          }
          if (v20 < 1)
            goto LABEL_54;
          for (i = 0; i != v20; ++i)
          {
            if ((v13 & 0xC000000000000001) != 0)
              v22 = (id)MEMORY[0x23B858090](i, v13);
            else
              v22 = *(id *)(v13 + 8 * i + 32);
            v23 = v22;
            type metadata accessor for DropletParticipantView();
            if (swift_dynamicCastClass())
            {
              MEMORY[0x23B857FA0]();
              if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_23A84C27C();
              sub_23A84C288();
              sub_23A84C270();
            }
            else
            {

            }
          }
          swift_bridgeObjectRelease();
          v24 = v45;
LABEL_28:
          swift_bridgeObjectRelease();
          if (v24 >> 62)
          {
            swift_bridgeObjectRetain();
            v25 = sub_23A84C3B4();
            if (!v25)
              goto LABEL_6;
          }
          else
          {
            v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v25)
              goto LABEL_6;
          }
          if ((v24 & 0xC000000000000001) != 0)
            v26 = (id)MEMORY[0x23B858090](0, v24);
          else
            v26 = *(id *)(v24 + 32);
          v27 = v26;
          type metadata accessor for DropletParticipantView();
          v28 = sub_23A84C300();

          if ((v28 & 1) != 0)
          {
LABEL_33:
            swift_bridgeObjectRelease_n();

            v29 = sub_23A83E688();
            objc_msgSend(v9, sel_removeFromSuperview);

            continue;
          }
          if (v25 != 1)
          {
            if ((v24 & 0xC000000000000001) != 0)
            {
              MEMORY[0x23B858090](1, v24);
              v30 = sub_23A84C300();
              swift_unknownObjectRelease();
              if ((v30 & 1) != 0)
                goto LABEL_33;
              if (v25 != 2)
              {
                v31 = 2;
                do
                {
                  MEMORY[0x23B858090](v31, v24);
                  v32 = v31 + 1;
                  if (__OFADD__(v31, 1))
                    goto LABEL_55;
                  v33 = sub_23A84C300();
                  swift_unknownObjectRelease();
                  if ((v33 & 1) != 0)
                    goto LABEL_33;
                  ++v31;
                }
                while (v32 != v25);
              }
            }
            else
            {
              v34 = *(id *)(v24 + 40);
              v35 = sub_23A84C300();

              if ((v35 & 1) != 0)
                goto LABEL_33;
              if (v25 != 2)
              {
                v36 = 6;
                while (1)
                {
                  v37 = v36 - 3;
                  if (__OFADD__(v36 - 4, 1))
                    break;
                  v38 = *(id *)(v24 + 8 * v36);
                  v39 = sub_23A84C300();

                  if ((v39 & 1) != 0)
                    goto LABEL_33;
                  ++v36;
                  if (v37 == v25)
                    goto LABEL_6;
                }
LABEL_56:
                __break(1u);
LABEL_57:
                __break(1u);
                goto LABEL_58;
              }
            }
          }
LABEL_6:
          swift_bridgeObjectRelease_n();

          objc_msgSend(v9, sel_removeFromSuperview);
        }
        while (v7 != v43);
      }
    }
    swift_bridgeObjectRelease_n();
    *(Class *)((char *)&v41->super.super.super.isa + v40) = (Class)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    -[DRPDropletContainerView removeFromSuperview](v41, sel_removeFromSuperview);
  }
  else
  {

    __break(1u);
  }
}

char *DRPDropletContextView.acquireGeometricChangeAssertion(forReason:)()
{
  char *result;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  result = (char *)sub_23A83E688();
  v1 = *(void **)&result[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];
  if (v1)
  {
    v2 = result;
    v3 = v1;
    v4 = (void *)sub_23A84C210();
    v5 = objc_msgSend(v3, sel_acquireForReason_, v4);

    return (char *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall DRPDropletContextView.invalidate()()
{
  char *v0;
  id v1;

  v0 = (char *)sub_23A83E688();
  v1 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];

  objc_msgSend(v1, sel_invalidate);
}

void __swiftcall DRPDropletContextView.init(frame:)(DRPDropletContextView *__return_ptr retstr, __C::CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

uint64_t DRPDropletContextView.init(frame:)()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  objc_super v22;

  *(_QWORD *)(v0 + OBJC_IVAR___DRPDropletContextView_dropletColor) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___DRPDropletContextView_keylineStyle) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView) = 0;
  v22.super_class = (Class)DRPDropletContextView;
  v1 = objc_msgSendSuper2(&v22, sel_initWithFrame_);
  v2 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v2, sel_setAllowsHitTesting_, 0);

  v3 = v1;
  v4 = sub_23A83E688();
  objc_msgSend(v3, sel_addSubview_, v4);

  v5 = v3;
  v6 = sub_23A8410A8();
  objc_msgSend(v5, sel_addSubview_, v6);

  v7 = objc_msgSend(v5, sel_subviews);
  sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
  v8 = sub_23A84C264();

  if (!(v8 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    sub_23A84C21C();
    v14 = objc_allocWithZone(MEMORY[0x24BDE56B0]);
    v15 = (void *)sub_23A84C210();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v14, sel_initWithType_, v15);

    v17 = (void *)sub_23A84C294();
    objc_msgSend(v16, sel_setValue_forKey_, v17, *MEMORY[0x24BDE5B30]);

    v18 = objc_msgSend(v5, sel_layer);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_23A84E0E0;
    *(_QWORD *)(v19 + 56) = sub_23A81A1DC(0, (unint64_t *)&qword_2542D8030);
    *(_QWORD *)(v19 + 32) = v16;
    v20 = v16;
    v21 = (void *)sub_23A84C258();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_setFilters_, v21);

    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_23A84C3B4();
  v9 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x23B858090](i, v8);
      else
        v12 = *(id *)(v8 + 8 * i + 32);
      v13 = v12;
      objc_msgSend(v12, sel_setOverrideUserInterfaceStyle_, 2);

    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void __swiftcall DRPDropletContextView.init(coder:)(DRPDropletContextView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void DRPDropletContextView.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContextView_dropletColor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContextView_keylineStyle] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView] = 0;

  sub_23A84C39C();
  __break(1u);
}

id sub_23A841EB4()
{
  void *v0;
  char *v1;
  void *v2;
  id v3;
  objc_super v5;

  v1 = (char *)sub_23A83E688();
  v2 = *(void **)&v1[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];
  v3 = v2;

  if (v2)
  {
    if (objc_msgSend(v3, sel_isActive))
      objc_msgSend(v3, sel_invalidate);

  }
  v5.receiver = v0;
  v5.super_class = (Class)DRPDropletContextView;
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

void __swiftcall DRPDropletContextView.hitTest(_:with:)(UIView_optional *__return_ptr retstr, CGPoint _, UIEvent_optional with)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  char v8;
  objc_super v9;

  v9.super_class = (Class)DRPDropletContextView;
  v4 = -[UIView_optional hitTest:withEvent:](&v9, sel_hitTest_withEvent_, with.value.super.isa, _.x, _.y);
  v5 = (uint64_t)v4;
  if (v4)
  {
    if (v4 == v3
      || (v6 = objc_msgSend(v3, sel_subviews),
          sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020),
          v7 = sub_23A84C264(),
          v6,
          v8 = sub_23A83E380(v5, v7),
          swift_bridgeObjectRelease(),
          v3 = (id)v5,
          (v8 & 1) != 0))
    {

    }
  }
}

Swift::Void __swiftcall DRPDropletContextView.layoutSubviews()()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  objc_super v15;

  v15.super_class = (Class)DRPDropletContextView;
  objc_msgSendSuper2(&v15, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v0, sel_subviews);
  sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
  v10 = sub_23A84C264();

  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    return;
  }
  swift_bridgeObjectRetain();
  v11 = sub_23A84C3B4();
  if (!v11)
    goto LABEL_10;
LABEL_3:
  if (v11 >= 1)
  {
    for (i = 0; i != v11; ++i)
    {
      if ((v10 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x23B858090](i, v10);
      else
        v13 = *(id *)(v10 + 8 * i + 32);
      v14 = v13;
      objc_msgSend(v13, sel_setFrame_, v2, v4, v6, v8);

    }
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_23A8422AC(unint64_t a1)
{
  return sub_23A8423A4(a1, sub_23A8426E4);
}

uint64_t sub_23A8422B8(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)sub_23A84B514((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_23A8423A4(unint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, unint64_t))
{
  unint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23A84C3B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23A84C3B4();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_23;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if (v6 >> 62)
    goto LABEL_25;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain();
    v6 = MEMORY[0x23B85809C](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v11 = sub_23A84C3B4();
    swift_bridgeObjectRelease();
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_23A84C270();
  }
  __break(1u);
  return result;
}

char *keypath_get_selector_disableDropletEffectFilters()
{
  return sel_disableDropletEffectFilters;
}

id sub_23A84256C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_disableDropletEffectFilters);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23A84259C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDisableDropletEffectFilters_, *a1);
}

id sub_23A8425B0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_boundaryEdges);
  *a2 = result;
  return result;
}

id sub_23A8425E0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoundaryEdges_, *a1);
}

id sub_23A8425F4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_dropletRadius);
  *a2 = v4;
  return result;
}

id sub_23A842624(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletRadius_, *a1);
}

id sub_23A842638@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_dropletColor);
  *a2 = result;
  return result;
}

id sub_23A842670(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDropletColor_, *a1);
}

id sub_23A842684@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_keylineStyle);
  *a2 = result;
  return result;
}

id sub_23A8426BC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeylineStyle_, *a1);
}

uint64_t type metadata accessor for DRPDropletContextView(uint64_t a1)
{
  return sub_23A81A1DC(a1, &qword_2569C2FD0);
}

uint64_t sub_23A8426E4(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  uint64_t (*v13[4])();

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23A84C3B4();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_23A84C3B4();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_23A842A34(&qword_2569C2FE0, &qword_2569C2FD8);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2FD8);
            v10 = sub_23A8252A4(v13, i, a3);
            v12 = *v11;
            ((void (*)(uint64_t (**)(), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A842894(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23A84C3B4();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_23A84C3B4();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_23A842A34(&qword_2569C2FF0, &qword_2569C2FE8);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2FE8);
            v10 = sub_23A82524C(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        type metadata accessor for DropletParticipantView();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A842A34(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B85857C](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

id sub_23A842A74(float *a1)
{
  void *v1;

  objc_msgSend(v1, sel_setM11_, *a1);
  objc_msgSend(v1, sel_setM12_, a1[1]);
  objc_msgSend(v1, sel_setM13_, a1[2]);
  objc_msgSend(v1, sel_setM14_, a1[3]);
  objc_msgSend(v1, sel_setM15_, a1[4]);
  objc_msgSend(v1, sel_setM21_, a1[5]);
  objc_msgSend(v1, sel_setM22_, a1[6]);
  objc_msgSend(v1, sel_setM23_, a1[7]);
  objc_msgSend(v1, sel_setM24_, a1[8]);
  objc_msgSend(v1, sel_setM25_, a1[9]);
  objc_msgSend(v1, sel_setM31_, a1[10]);
  objc_msgSend(v1, sel_setM32_, a1[11]);
  objc_msgSend(v1, sel_setM33_, a1[12]);
  objc_msgSend(v1, sel_setM34_, a1[13]);
  objc_msgSend(v1, sel_setM35_, a1[14]);
  objc_msgSend(v1, sel_setM41_, a1[15]);
  objc_msgSend(v1, sel_setM42_, a1[16]);
  objc_msgSend(v1, sel_setM43_, a1[17]);
  objc_msgSend(v1, sel_setM44_, a1[18]);
  return objc_msgSend(v1, sel_setM45_, a1[19]);
}

double DRPDropletCAColorMatrixPrototypeSettings.m11.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m11;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m11.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m11);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m12.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m12;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m12.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m12);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m13.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m13;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m13.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m13);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m14.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m14;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m14.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m14);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m15.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m15;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m15.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m15);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m21.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m21;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m21.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m21);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m22.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m22;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m22.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m22);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m23.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m23;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m23.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m23);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m24.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m24;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m24.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m24);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m25.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m25;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m25.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m25);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m31.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m31;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m31.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m31);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m32.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m32;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m32.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m32);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m33.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m33;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m33.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m33);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m34.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m34;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m34.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m34);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m35.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m35;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m35.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m35);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m41.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m41;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m41.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m41);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m42.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m42;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m42.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m42);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m43.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m43;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m43.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m43);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m44.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m44;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m44.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m44);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

double DRPDropletCAColorMatrixPrototypeSettings.m45.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m45;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t DRPDropletCAColorMatrixPrototypeSettings.m45.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___DRPDropletCAColorMatrixPrototypeSettings_m45);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

float DRPDropletCAColorMatrixPrototypeSettings.caColorMatrix.getter@<S0>(uint64_t a1@<X8>)
{
  void *v1;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  double v30;
  float result;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;

  objc_msgSend(v1, "m11");
  *(float *)&v3 = v3;
  v42 = LODWORD(v3);
  objc_msgSend(v1, "m12");
  *(float *)&v4 = v4;
  v41 = LODWORD(v4);
  objc_msgSend(v1, "m13");
  *(float *)&v5 = v5;
  v40 = LODWORD(v5);
  objc_msgSend(v1, "m14");
  *(float *)&v6 = v6;
  v39 = LODWORD(v6);
  objc_msgSend(v1, "m15");
  *(float *)&v7 = v7;
  v38 = LODWORD(v7);
  objc_msgSend(v1, "m21");
  *(float *)&v8 = v8;
  v37 = LODWORD(v8);
  objc_msgSend(v1, "m22");
  *(float *)&v9 = v9;
  v36 = LODWORD(v9);
  objc_msgSend(v1, "m23");
  *(float *)&v10 = v10;
  v35 = LODWORD(v10);
  objc_msgSend(v1, "m24");
  *(float *)&v11 = v11;
  v34 = LODWORD(v11);
  objc_msgSend(v1, "m25");
  *(float *)&v12 = v12;
  v33 = LODWORD(v12);
  objc_msgSend(v1, "m31");
  *(float *)&v13 = v13;
  v32 = LODWORD(v13);
  objc_msgSend(v1, "m32");
  v15 = v14;
  objc_msgSend(v1, "m33");
  v17 = v16;
  objc_msgSend(v1, "m34");
  v19 = v18;
  objc_msgSend(v1, "m35");
  v21 = v20;
  objc_msgSend(v1, "m41");
  v23 = v22;
  objc_msgSend(v1, "m42");
  v25 = v24;
  objc_msgSend(v1, "m43");
  v27 = v26;
  objc_msgSend(v1, "m44");
  v29 = v28;
  objc_msgSend(v1, "m45");
  result = v30;
  *(_DWORD *)a1 = v42;
  *(_DWORD *)(a1 + 4) = v41;
  *(_DWORD *)(a1 + 8) = v40;
  *(_DWORD *)(a1 + 12) = v39;
  *(_DWORD *)(a1 + 16) = v38;
  *(_DWORD *)(a1 + 20) = v37;
  *(_DWORD *)(a1 + 24) = v36;
  *(_DWORD *)(a1 + 28) = v35;
  *(_DWORD *)(a1 + 32) = v34;
  *(_DWORD *)(a1 + 36) = v33;
  *(_DWORD *)(a1 + 40) = v32;
  *(float *)(a1 + 44) = v15;
  *(float *)(a1 + 48) = v17;
  *(float *)(a1 + 52) = v19;
  *(float *)(a1 + 56) = v21;
  *(float *)(a1 + 60) = v23;
  *(float *)(a1 + 64) = v25;
  *(float *)(a1 + 68) = v27;
  *(float *)(a1 + 72) = v29;
  *(float *)(a1 + 76) = result;
  return result;
}

Swift::Void __swiftcall DRPDropletCAColorMatrixPrototypeSettings.setDefaultValues()()
{
  objc_super v0;
  _OWORD v1[5];

  v0.super_class = (Class)DRPDropletCAColorMatrixPrototypeSettings;
  objc_msgSendSuper2(&v0, sel_setDefaultValues);
  memset(v1, 0, sizeof(v1));
  sub_23A842A74((float *)v1);
}

uint64_t static DRPDropletCAColorMatrixPrototypeSettings.ignoresKey(_:)(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return 0;
  if (a1 == 0x4D726F6C6F436163 && a2 == 0xED00007869727461)
    return 1;
  return sub_23A84C3FC();
}

Swift::String_optional __swiftcall DRPDropletCAColorMatrixPrototypeSettings.drillDownSummary()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  Swift::String_optional result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2B28);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23A84E8D0;
  objc_msgSend(v0, "m11");
  v3 = v2;
  v4 = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE50B0];
  v5 = sub_23A845B8C();
  *(_QWORD *)(v1 + 64) = v5;
  *(_QWORD *)(v1 + 32) = v3;
  objc_msgSend(v0, "m12");
  *(_QWORD *)(v1 + 96) = v4;
  *(_QWORD *)(v1 + 104) = v5;
  *(_QWORD *)(v1 + 72) = v6;
  objc_msgSend(v0, "m13");
  *(_QWORD *)(v1 + 136) = v4;
  *(_QWORD *)(v1 + 144) = v5;
  *(_QWORD *)(v1 + 112) = v7;
  objc_msgSend(v0, "m14");
  *(_QWORD *)(v1 + 176) = v4;
  *(_QWORD *)(v1 + 184) = v5;
  *(_QWORD *)(v1 + 152) = v8;
  objc_msgSend(v0, "m15");
  *(_QWORD *)(v1 + 216) = v4;
  *(_QWORD *)(v1 + 224) = v5;
  *(_QWORD *)(v1 + 192) = v9;
  objc_msgSend(v0, "m21");
  *(_QWORD *)(v1 + 256) = v4;
  *(_QWORD *)(v1 + 264) = v5;
  *(_QWORD *)(v1 + 232) = v10;
  objc_msgSend(v0, "m22");
  *(_QWORD *)(v1 + 296) = v4;
  *(_QWORD *)(v1 + 304) = v5;
  *(_QWORD *)(v1 + 272) = v11;
  objc_msgSend(v0, "m23");
  *(_QWORD *)(v1 + 336) = v4;
  *(_QWORD *)(v1 + 344) = v5;
  *(_QWORD *)(v1 + 312) = v12;
  objc_msgSend(v0, "m24");
  *(_QWORD *)(v1 + 376) = v4;
  *(_QWORD *)(v1 + 384) = v5;
  *(_QWORD *)(v1 + 352) = v13;
  objc_msgSend(v0, "m25");
  *(_QWORD *)(v1 + 416) = v4;
  *(_QWORD *)(v1 + 424) = v5;
  *(_QWORD *)(v1 + 392) = v14;
  objc_msgSend(v0, "m31");
  *(_QWORD *)(v1 + 456) = v4;
  *(_QWORD *)(v1 + 464) = v5;
  *(_QWORD *)(v1 + 432) = v15;
  objc_msgSend(v0, "m32");
  *(_QWORD *)(v1 + 496) = v4;
  *(_QWORD *)(v1 + 504) = v5;
  *(_QWORD *)(v1 + 472) = v16;
  objc_msgSend(v0, "m33");
  *(_QWORD *)(v1 + 536) = v4;
  *(_QWORD *)(v1 + 544) = v5;
  *(_QWORD *)(v1 + 512) = v17;
  objc_msgSend(v0, "m34");
  *(_QWORD *)(v1 + 576) = v4;
  *(_QWORD *)(v1 + 584) = v5;
  *(_QWORD *)(v1 + 552) = v18;
  objc_msgSend(v0, "m35");
  *(_QWORD *)(v1 + 616) = v4;
  *(_QWORD *)(v1 + 624) = v5;
  *(_QWORD *)(v1 + 592) = v19;
  objc_msgSend(v0, "m41");
  *(_QWORD *)(v1 + 656) = v4;
  *(_QWORD *)(v1 + 664) = v5;
  *(_QWORD *)(v1 + 632) = v20;
  objc_msgSend(v0, "m42");
  *(_QWORD *)(v1 + 696) = v4;
  *(_QWORD *)(v1 + 704) = v5;
  *(_QWORD *)(v1 + 672) = v21;
  objc_msgSend(v0, "m43");
  *(_QWORD *)(v1 + 736) = v4;
  *(_QWORD *)(v1 + 744) = v5;
  *(_QWORD *)(v1 + 712) = v22;
  objc_msgSend(v0, "m44");
  *(_QWORD *)(v1 + 776) = v4;
  *(_QWORD *)(v1 + 784) = v5;
  *(_QWORD *)(v1 + 752) = v23;
  objc_msgSend(v0, "m45");
  *(_QWORD *)(v1 + 816) = v4;
  *(_QWORD *)(v1 + 824) = v5;
  *(_QWORD *)(v1 + 792) = v24;
  v25 = sub_23A84C228();
  result.value._object = v26;
  result.value._countAndFlagsBits = v25;
  return result;
}

void _sSo40DRPDropletCAColorMatrixPrototypeSettingsC9DropletUIE24settingsControllerModuleSo8PTModuleCSgyFZ_0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
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
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  _OWORD v70[2];
  _OWORD v71[2];

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23A84E8E0;
  v1 = (void *)sub_23A84C210();
  v2 = (void *)sub_23A84C210();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v1, v2);

  if (!v4)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (!objc_msgSend(v4, sel_precision_, 3))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  sub_23A81A1DC(0, (unint64_t *)&qword_2569C2890);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 32) = v69;
  v5 = (void *)sub_23A84C210();
  v6 = (void *)sub_23A84C210();
  v7 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v5, v6);

  if (!v7)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (!objc_msgSend(v7, sel_precision_, 3))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 40) = v69;
  v8 = (void *)sub_23A84C210();
  v9 = (void *)sub_23A84C210();
  v10 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v8, v9);

  if (!v10)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (!objc_msgSend(v10, sel_precision_, 3))
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 48) = v69;
  v11 = (void *)sub_23A84C210();
  v12 = (void *)sub_23A84C210();
  v13 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v11, v12);

  if (!v13)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (!objc_msgSend(v13, sel_precision_, 3))
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 56) = v69;
  v14 = (void *)sub_23A84C210();
  v15 = (void *)sub_23A84C210();
  v16 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v14, v15);

  if (!v16)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (!objc_msgSend(v16, sel_precision_, 3))
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 64) = v69;
  v17 = (void *)sub_23A84C210();
  v18 = (void *)sub_23A84C210();
  v19 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v17, v18);

  if (!v19)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  if (!objc_msgSend(v19, sel_precision_, 3))
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 72) = v69;
  v20 = (void *)sub_23A84C210();
  v21 = (void *)sub_23A84C210();
  v22 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v20, v21);

  if (!v22)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  if (!objc_msgSend(v22, sel_precision_, 3))
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 80) = v69;
  v23 = (void *)sub_23A84C210();
  v24 = (void *)sub_23A84C210();
  v25 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v23, v24);

  if (!v25)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (!objc_msgSend(v25, sel_precision_, 3))
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 88) = v69;
  v26 = (void *)sub_23A84C210();
  v27 = (void *)sub_23A84C210();
  v28 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v26, v27);

  if (!v28)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  if (!objc_msgSend(v28, sel_precision_, 3))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 96) = v69;
  v29 = (void *)sub_23A84C210();
  v30 = (void *)sub_23A84C210();
  v31 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v29, v30);

  if (!v31)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  if (!objc_msgSend(v31, sel_precision_, 3))
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 104) = v69;
  v32 = (void *)sub_23A84C210();
  v33 = (void *)sub_23A84C210();
  v34 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v32, v33);

  if (!v34)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (!objc_msgSend(v34, sel_precision_, 3))
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 112) = v69;
  v35 = (void *)sub_23A84C210();
  v36 = (void *)sub_23A84C210();
  v37 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v35, v36);

  if (!v37)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if (!objc_msgSend(v37, sel_precision_, 3))
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 120) = v69;
  v38 = (void *)sub_23A84C210();
  v39 = (void *)sub_23A84C210();
  v40 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v38, v39);

  if (!v40)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (!objc_msgSend(v40, sel_precision_, 3))
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 128) = v69;
  v41 = (void *)sub_23A84C210();
  v42 = (void *)sub_23A84C210();
  v43 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v41, v42);

  if (!v43)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (!objc_msgSend(v43, sel_precision_, 3))
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 136) = v69;
  v44 = (void *)sub_23A84C210();
  v45 = (void *)sub_23A84C210();
  v46 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v44, v45);

  if (!v46)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  if (!objc_msgSend(v46, sel_precision_, 3))
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 144) = v69;
  v47 = (void *)sub_23A84C210();
  v48 = (void *)sub_23A84C210();
  v49 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v47, v48);

  if (!v49)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  if (!objc_msgSend(v49, sel_precision_, 3))
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 152) = v69;
  v50 = (void *)sub_23A84C210();
  v51 = (void *)sub_23A84C210();
  v52 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v50, v51);

  if (!v52)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (!objc_msgSend(v52, sel_precision_, 3))
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 160) = v69;
  v53 = (void *)sub_23A84C210();
  v54 = (void *)sub_23A84C210();
  v55 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v53, v54);

  if (!v55)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (!objc_msgSend(v55, sel_precision_, 3))
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 168) = v69;
  v56 = (void *)sub_23A84C210();
  v57 = (void *)sub_23A84C210();
  v58 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v56, v57);

  if (!v58)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  if (!objc_msgSend(v58, sel_precision_, 3))
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 176) = v69;
  v59 = (void *)sub_23A84C210();
  v60 = (void *)sub_23A84C210();
  v61 = objc_msgSend(v3, sel_rowWithTitle_valueKeyPath_, v59, v60);

  if (!v61)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  if (!objc_msgSend(v61, sel_precision_, 3))
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  sub_23A84C30C();
  swift_unknownObjectRelease();
  sub_23A81A1CC(v70, v71);
  swift_dynamicCast();

  *(_QWORD *)(v0 + 184) = v69;
  *(_QWORD *)&v71[0] = v0;
  sub_23A84C270();
  v62 = *(_QWORD *)&v71[0];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
  v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_23A84E0E0;
  v64 = (void *)objc_opt_self();
  sub_23A8260D8(v62);
  swift_bridgeObjectRelease();
  v65 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  v66 = objc_msgSend(v64, sel_sectionWithRows_, v65);

  if (v66)
  {
    *(_QWORD *)(v63 + 56) = sub_23A81A1DC(0, &qword_2569C28A0);
    *(_QWORD *)(v63 + 32) = v66;
    v67 = (void *)sub_23A84C210();
    v68 = (void *)sub_23A84C258();
    swift_bridgeObjectRelease();
    objc_msgSend(v64, sel_moduleWithTitle_contents_, v67, v68);

    return;
  }
LABEL_83:
  __break(1u);
}

unint64_t sub_23A845B8C()
{
  unint64_t result;

  result = qword_2569C3098;
  if (!qword_2569C3098)
  {
    result = MEMORY[0x23B85857C](MEMORY[0x24BEE5108], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2569C3098);
  }
  return result;
}

void *keypath_get_selector_m11()
{
  return &sel_m11;
}

id sub_23A845BDC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m11");
  *a2 = v4;
  return result;
}

id sub_23A845C0C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM11_, *a1);
}

void *keypath_get_selector_m12()
{
  return &sel_m12;
}

id sub_23A845C2C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m12");
  *a2 = v4;
  return result;
}

id sub_23A845C5C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM12_, *a1);
}

void *keypath_get_selector_m13()
{
  return &sel_m13;
}

id sub_23A845C7C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m13");
  *a2 = v4;
  return result;
}

id sub_23A845CAC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM13_, *a1);
}

void *keypath_get_selector_m14()
{
  return &sel_m14;
}

id sub_23A845CCC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m14");
  *a2 = v4;
  return result;
}

id sub_23A845CFC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM14_, *a1);
}

void *keypath_get_selector_m15()
{
  return &sel_m15;
}

id sub_23A845D1C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m15");
  *a2 = v4;
  return result;
}

id sub_23A845D4C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM15_, *a1);
}

void *keypath_get_selector_m21()
{
  return &sel_m21;
}

id sub_23A845D6C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m21");
  *a2 = v4;
  return result;
}

id sub_23A845D9C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM21_, *a1);
}

void *keypath_get_selector_m22()
{
  return &sel_m22;
}

id sub_23A845DBC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m22");
  *a2 = v4;
  return result;
}

id sub_23A845DEC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM22_, *a1);
}

void *keypath_get_selector_m23()
{
  return &sel_m23;
}

id sub_23A845E0C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m23");
  *a2 = v4;
  return result;
}

id sub_23A845E3C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM23_, *a1);
}

void *keypath_get_selector_m24()
{
  return &sel_m24;
}

id sub_23A845E5C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m24");
  *a2 = v4;
  return result;
}

id sub_23A845E8C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM24_, *a1);
}

void *keypath_get_selector_m25()
{
  return &sel_m25;
}

id sub_23A845EAC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m25");
  *a2 = v4;
  return result;
}

id sub_23A845EDC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM25_, *a1);
}

void *keypath_get_selector_m31()
{
  return &sel_m31;
}

id sub_23A845EFC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m31");
  *a2 = v4;
  return result;
}

id sub_23A845F2C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM31_, *a1);
}

void *keypath_get_selector_m32()
{
  return &sel_m32;
}

id sub_23A845F4C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m32");
  *a2 = v4;
  return result;
}

id sub_23A845F7C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM32_, *a1);
}

void *keypath_get_selector_m33()
{
  return &sel_m33;
}

id sub_23A845F9C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m33");
  *a2 = v4;
  return result;
}

id sub_23A845FCC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM33_, *a1);
}

void *keypath_get_selector_m34()
{
  return &sel_m34;
}

id sub_23A845FEC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m34");
  *a2 = v4;
  return result;
}

id sub_23A84601C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM34_, *a1);
}

void *keypath_get_selector_m35()
{
  return &sel_m35;
}

id sub_23A84603C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m35");
  *a2 = v4;
  return result;
}

id sub_23A84606C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM35_, *a1);
}

void *keypath_get_selector_m41()
{
  return &sel_m41;
}

id sub_23A84608C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m41");
  *a2 = v4;
  return result;
}

id sub_23A8460BC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM41_, *a1);
}

void *keypath_get_selector_m42()
{
  return &sel_m42;
}

id sub_23A8460DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m42");
  *a2 = v4;
  return result;
}

id sub_23A84610C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM42_, *a1);
}

void *keypath_get_selector_m43()
{
  return &sel_m43;
}

id sub_23A84612C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m43");
  *a2 = v4;
  return result;
}

id sub_23A84615C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM43_, *a1);
}

void *keypath_get_selector_m44()
{
  return &sel_m44;
}

id sub_23A84617C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m44");
  *a2 = v4;
  return result;
}

id sub_23A8461AC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM44_, *a1);
}

void *keypath_get_selector_m45()
{
  return &sel_m45;
}

id sub_23A8461CC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "m45");
  *a2 = v4;
  return result;
}

id sub_23A8461FC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setM45_, *a1);
}

uint64_t type metadata accessor for DRPDropletCAColorMatrixPrototypeSettings(uint64_t a1)
{
  return sub_23A81A1DC(a1, (unint64_t *)&unk_2569C30A0);
}

uint64_t sub_23A846224(uint64_t a1, uint64_t a2)
{
  _BYTE v4[88];
  _BYTE v5[88];

  sub_23A822438(a1, (uint64_t)v4);
  sub_23A822438(a2, (uint64_t)v5);
  return sub_23A848068((uint64_t)v4, (uint64_t)v5) & 1;
}

void sub_23A84626C()
{
  char *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;

  BSRectWithSize();
  UIRectCenteredAboutPoint();
  UIEdgeInsetsInsetRect(v1, v2, v3, v4, -*(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets], -*(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets + 8]);
  BSRectWithSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  UIRectGetCenter();
  v14 = v13;
  v16 = v15;
  objc_msgSend(v0, sel_bounds);
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  if (!CGRectEqualToRect(v23, v24))
  {
    objc_msgSend(v0, sel_setBounds_, v6, v8, v10, v12);
    v17 = sub_23A847054();
    objc_msgSend(v17, sel_setFrame_, v6, v8, v10, v12);

    v18 = sub_23A846FA4();
    objc_msgSend(v18, sel_setFrame_, v6, v8, v10, v12);

    v19 = sub_23A847104();
    objc_msgSend(v19, sel_setFrame_, v6, v8, v10, v12);

  }
  objc_msgSend(v0, sel_center);
  if (v21 != v14 || v20 != v16)
    objc_msgSend(v0, sel_setCenter_, v14, v16);
  sub_23A84758C();
}

id sub_23A84642C(uint64_t a1, char a2)
{
  void *v2;

  return objc_msgSend(v2, sel_setHidden_, a2 & 1);
}

void sub_23A846444(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = (double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths);
  v6 = *(double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths);
  v7 = *(double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 8);
  v8 = *(double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 16);
  v9 = *(double *)(v4 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 24);
  *v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  if (v6 != a1 || v7 != a2 || v8 != a3 || v9 != a4)
    sub_23A84758C();
}

id sub_23A84647C(double a1, double a2, double a3, double a4)
{
  char *v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id result;

  v5 = (double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets];
  v6 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets];
  v7 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets + 8];
  v8 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets + 16];
  v9 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets + 24];
  *v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  if (v6 != a1 || v7 != a2 || v8 != a3 || v9 != a4)
  {
    objc_msgSend(v4, sel_setNeedsLayout);
    return objc_msgSend(v4, sel_layoutIfNeeded);
  }
  return result;
}

void sub_23A8464E0(uint64_t a1, uint64_t a2)
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
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v4 = v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType;
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 16);
  v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 8);
  v6 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 24);
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 32);
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 40);
  v13 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 48);
  v14 = *(void **)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType);
  v10 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56);
  v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 64);
  v11 = *(_QWORD *)(v4 + 72);
  v12 = *(_BYTE *)(v4 + 80);
  sub_23A822438(a2, v4);
  sub_23A82E6C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
  sub_23A82E6C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
  sub_23A8223E8(v14, v16, v5, v6, v7, v8, v13, v10, v9, v11, v12);
  sub_23A82E644(v14, v16, v5, v6, v7, v8, v13, v10, v9, v11, v12);
  sub_23A8482B4();
  sub_23A82E6C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);
  sub_23A82E644(v14, v16, v5, v6, v7, v8, v13, v10, v9, v11, v12);
}

void sub_23A846638(double a1)
{
  uint64_t v1;
  double v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v2 = *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStartLocation);
  *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStartLocation) = a1;
  if (v2 != a1)
  {
    v3 = sub_23A8471B8();
    v4 = v3;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      v5 = sub_23A84C3B4();
      if (v5)
        goto LABEL_4;
    }
    else
    {
      v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_4:
        if (v5 < 1)
        {
          __break(1u);
          return;
        }
        v6 = 0;
        do
        {
          if ((v4 & 0xC000000000000001) != 0)
            v7 = (id)MEMORY[0x23B858090](v6, v4);
          else
            v7 = *(id *)(v4 + 8 * v6 + 32);
          v8 = v7;
          ++v6;
          sub_23A825840();
          sub_23A8259B0();

        }
        while (v5 != v6);
      }
    }
    swift_bridgeObjectRelease_n();
  }
}

void sub_23A84673C(double a1)
{
  uint64_t v1;
  double v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v2 = *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStopLocation);
  *(double *)(v1 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStopLocation) = a1;
  if (v2 != a1)
  {
    v3 = sub_23A8471B8();
    v4 = v3;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      v5 = sub_23A84C3B4();
      if (v5)
        goto LABEL_4;
    }
    else
    {
      v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_4:
        if (v5 < 1)
        {
          __break(1u);
          return;
        }
        v6 = 0;
        do
        {
          if ((v4 & 0xC000000000000001) != 0)
            v7 = (id)MEMORY[0x23B858090](v6, v4);
          else
            v7 = *(id *)(v4 + 8 * v6 + 32);
          v8 = v7;
          ++v6;
          sub_23A825840();
          sub_23A8259B0();

        }
        while (v5 != v6);
      }
    }
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_23A8468E4(_BYTE *a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char *v12;
  char *v13;
  __int128 v14;
  char *v15;
  __int128 v16;
  char *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  uint64_t inited;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t result;
  uint64_t i;
  id v31;
  void *v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;

  v2 = &v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *((_OWORD *)v2 + 4) = 0u;
  v2[80] = 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___intelligentView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView] = 0;
  v40 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 8];
  v41 = *(void **)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
  v3 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 16];
  v4 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 24];
  v5 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 32];
  v6 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 40];
  v7 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 48];
  v8 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 56];
  v9 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 64];
  v10 = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 72];
  v11 = a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType + 80];
  v52 = *(void **)v2;
  v51 = *((_QWORD *)v2 + 1);
  v50 = *((_QWORD *)v2 + 2);
  v49 = *((_QWORD *)v2 + 3);
  v48 = *((_QWORD *)v2 + 4);
  v47 = *((_QWORD *)v2 + 5);
  v46 = *((_QWORD *)v2 + 6);
  v45 = *((_QWORD *)v2 + 7);
  v44 = *((_QWORD *)v2 + 8);
  v43 = *((_QWORD *)v2 + 9);
  v42 = v2[80];
  *(_QWORD *)v2 = v41;
  *((_QWORD *)v2 + 1) = v40;
  *((_QWORD *)v2 + 2) = v3;
  *((_QWORD *)v2 + 3) = v4;
  *((_QWORD *)v2 + 4) = v5;
  *((_QWORD *)v2 + 5) = v6;
  *((_QWORD *)v2 + 6) = v7;
  *((_QWORD *)v2 + 7) = v8;
  *((_QWORD *)v2 + 8) = v9;
  *((_QWORD *)v2 + 9) = v10;
  v2[80] = v11;
  v12 = v1;
  sub_23A8223E8(v41, v40, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  sub_23A82E644(v52, v51, v50, v49, v48, v47, v46, v45, v44, v43, v42);
  v13 = &v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths];
  v14 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths + 16];
  *(_OWORD *)v13 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
  *((_OWORD *)v13 + 1) = v14;
  v15 = &v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineOutsets];
  v16 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets + 16];
  *(_OWORD *)v15 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets];
  *((_OWORD *)v15 + 1) = v16;
  *(_QWORD *)&v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStartLocation] = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation];
  *(_QWORD *)&v12[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantNormalizedStopLocation] = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation];

  v17 = a1;
  v18 = sub_23A8344DC(v17);
  v19 = (void *)objc_opt_self();
  v20 = v18;
  v21 = objc_msgSend(v19, sel_rootSettings);
  objc_msgSend(v21, sel_addKeyObserver_, v20);

  sub_23A847750();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A84E8C0;
  *(_QWORD *)(inited + 32) = sub_23A847054();
  *(_QWORD *)(inited + 40) = sub_23A846FA4();
  *(_QWORD *)(inited + 48) = sub_23A847104();
  sub_23A84C270();
  v23 = inited;
  v24 = sub_23A8471B8();
  if (v24 >> 62)
  {
    sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
    v25 = sub_23A84C3A8();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_23A84C408();
    sub_23A81A1DC(0, (unint64_t *)&unk_2542D8020);
    v25 = v24;
  }
  swift_bridgeObjectRelease();
  sub_23A8422AC(v25);
  v26 = v23;
  if (v23 >> 62)
  {
    v33 = v20;
    swift_bridgeObjectRetain();
    result = sub_23A84C3B4();
    v27 = result;
    if (!result)
      goto LABEL_13;
  }
  else
  {
    v27 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    v28 = v20;
    result = swift_bridgeObjectRetain();
    if (!v27)
      goto LABEL_13;
  }
  if (v27 < 1)
  {
    __break(1u);
    goto LABEL_24;
  }
  for (i = 0; i != v27; ++i)
  {
    if ((v26 & 0xC000000000000001) != 0)
      v31 = (id)MEMORY[0x23B858090](i, v26);
    else
      v31 = *(id *)(v26 + 8 * i + 32);
    v32 = v31;
    objc_msgSend(v20, sel_addSubview_, v31);

  }
LABEL_13:

  swift_bridgeObjectRelease_n();
  sub_23A8482B4();
  sub_23A84758C();
  v34 = sub_23A8471B8();
  v35 = v34;
  if (!(v34 >> 62))
  {
    v36 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v36)
      goto LABEL_15;
LABEL_22:
    swift_bridgeObjectRelease_n();

    return (uint64_t)v20;
  }
  swift_bridgeObjectRetain();
  result = sub_23A84C3B4();
  v36 = result;
  if (!result)
    goto LABEL_22;
LABEL_15:
  if (v36 >= 1)
  {
    v37 = 0;
    do
    {
      if ((v35 & 0xC000000000000001) != 0)
        v38 = (id)MEMORY[0x23B858090](v37, v35);
      else
        v38 = *(id *)(v35 + 8 * v37 + 32);
      v39 = v38;
      ++v37;
      sub_23A825840();
      sub_23A8259B0();

    }
    while (v36 != v37);
    goto LABEL_22;
  }
LABEL_24:
  __break(1u);
  return result;
}

void sub_23A846E28()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  objc_super v4[14];
  uint64_t v5;
  _BYTE v6[216];
  _OWORD v7[13];
  uint64_t v8;

  v4[0].receiver = v0;
  v4[0].super_class = (Class)type metadata accessor for DropletBackgroundView();
  -[objc_super layoutSubviews](v4, sel_layoutSubviews);
  v1 = sub_23A847054();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  v2 = sub_23A846FA4();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  v3 = sub_23A847104();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);

  sub_23A82E744((uint64_t)v0 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v6, &qword_2569C2C00);
  sub_23A82E744((uint64_t)v6, (uint64_t)v7, &qword_2569C2C00);
  if (!sub_23A82E734(v7))
  {
    v4[11] = (objc_super)v7[10];
    v4[12] = (objc_super)v7[11];
    v4[13] = (objc_super)v7[12];
    v5 = v8;
    v4[7] = (objc_super)v7[6];
    v4[8] = (objc_super)v7[7];
    v4[9] = (objc_super)v7[8];
    v4[10] = (objc_super)v7[9];
    v4[3] = (objc_super)v7[2];
    v4[4] = (objc_super)v7[3];
    v4[5] = (objc_super)v7[4];
    v4[6] = (objc_super)v7[5];
    v4[1] = (objc_super)v7[0];
    v4[2] = (objc_super)v7[1];
    sub_23A84626C();
  }
  sub_23A84758C();
}

id sub_23A846FA4()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AnimatableAdaptiveColorMatrixView()), sel_initWithFrame_, v4, v5, v6, v7);
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_23A847054()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, v4, v5, v6, v7);
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_23A847104()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___intelligentView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___intelligentView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___intelligentView];
  }
  else
  {
    v4 = v0;
    objc_msgSend(v0, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_allocWithZone((Class)type metadata accessor for AnimatableIntelligentView());
    v14 = sub_23A849258(1, v6, v8, v10, v12);
    v15 = *(void **)&v0[v1];
    *(_QWORD *)&v4[v1] = v14;
    v3 = v14;

    v2 = 0;
  }
  v16 = v2;
  return v3;
}

uint64_t sub_23A8471B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews);
  }
  else
  {
    v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8060);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_23A84E3C0;
    *(_QWORD *)(v4 + 32) = sub_23A847278();
    *(_QWORD *)(v4 + 40) = sub_23A847330();
    *(_QWORD *)(v4 + 48) = sub_23A8473EC();
    *(_QWORD *)(v4 + 56) = sub_23A8474BC();
    sub_23A84C270();
    v2 = v4;
    *(_QWORD *)(v3 + v1) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id sub_23A847278()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double Width;
  double v5;
  double Height;
  double v7;
  id v8;
  void *v9;
  id v10;
  CGRect v12;
  CGRect v13;

  v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    Width = CGRectGetWidth(v12);
    v5 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths];
    objc_msgSend(v0, sel_bounds);
    Height = CGRectGetHeight(v13);
    if (Height >= v5)
      v7 = v5;
    else
      v7 = Height;
    v8 = sub_23A82652C(1, 0.0, 0.0, Width, v7, 0.0, 1.0);
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_23A847330()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double Width;
  double Height;
  id v7;
  void *v8;
  id v9;
  CGRect v11;
  CGRect v12;

  v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView];
  }
  else
  {
    v4 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 8];
    objc_msgSend(v0, sel_bounds);
    Width = CGRectGetWidth(v11);
    if (Width < v4)
      v4 = Width;
    objc_msgSend(v0, sel_bounds);
    Height = CGRectGetHeight(v12);
    v7 = sub_23A82652C(0, 0.0, 0.0, v4, Height, 0.0, 1.0);
    v8 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id sub_23A8473EC()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double Height;
  double v6;
  double Width;
  id v8;
  void *v9;
  id v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView];
  }
  else
  {
    v4 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 16];
    objc_msgSend(v0, sel_bounds);
    Height = CGRectGetHeight(v12);
    if (Height < v4)
      v4 = Height;
    objc_msgSend(v0, sel_bounds);
    v6 = CGRectGetHeight(v13) - v4;
    objc_msgSend(v0, sel_bounds);
    Width = CGRectGetWidth(v14);
    v8 = sub_23A82652C(1, 0.0, v6, Width, v4, 1.0, 0.0);
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_23A8474BC()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double Width;
  double v6;
  double Height;
  id v8;
  void *v9;
  id v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v1 = OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView];
  }
  else
  {
    v4 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths + 24];
    objc_msgSend(v0, sel_bounds);
    Width = CGRectGetWidth(v12);
    if (Width < v4)
      v4 = Width;
    objc_msgSend(v0, sel_bounds);
    v6 = CGRectGetWidth(v13) - v4;
    objc_msgSend(v0, sel_bounds);
    Height = CGRectGetHeight(v14);
    v8 = sub_23A82652C(0, v6, 0.0, v4, Height, 1.0, 0.0);
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

void sub_23A84758C()
{
  char *v0;
  id v1;
  double Width;
  double *v3;
  double v4;
  double Height;
  double v6;
  id v7;
  double v8;
  double v9;
  CGFloat v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v1 = sub_23A847278();
  objc_msgSend(v0, sel_bounds);
  Width = CGRectGetWidth(v18);
  v3 = (double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths];
  v4 = *(double *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_participantKeylineFadeLengths];
  objc_msgSend(v0, sel_bounds);
  Height = CGRectGetHeight(v19);
  if (Height >= v4)
    v6 = v4;
  else
    v6 = Height;
  objc_msgSend(v1, sel_setFrame_, 0.0, 0.0, Width, v6);

  v7 = sub_23A8473EC();
  v8 = v3[2];
  objc_msgSend(v0, sel_bounds);
  v9 = CGRectGetHeight(v20);
  if (v9 < v8)
    v8 = v9;
  objc_msgSend(v0, sel_bounds);
  v10 = CGRectGetHeight(v21) - v8;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v7, sel_setFrame_, 0.0, v10, CGRectGetWidth(v22), v8);

  v11 = sub_23A847330();
  v12 = v3[1];
  objc_msgSend(v0, sel_bounds);
  v13 = CGRectGetWidth(v23);
  if (v13 < v12)
    v12 = v13;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v11, sel_setFrame_, 0.0, 0.0, v12, CGRectGetHeight(v24));

  v17 = sub_23A8474BC();
  v14 = v3[3];
  objc_msgSend(v0, sel_bounds);
  v15 = CGRectGetWidth(v25);
  if (v15 < v14)
    v14 = v15;
  objc_msgSend(v0, sel_bounds);
  v16 = CGRectGetWidth(v26) - v14;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v17, sel_setFrame_, v16, 0.0, v14, CGRectGetHeight(v27));

}

uint64_t sub_23A847750()
{
  void *v0;
  id v1;
  unsigned int v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  id i;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;

  v1 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  v2 = objc_msgSend(v1, sel_suppressCompositingFilterDestOut);

  if (!v2)
  {
    v15 = sub_23A84C21C();
    v17 = v16;
    v18 = sub_23A8471B8();
    v19 = v18;
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_23A84C3B4();
      v20 = result;
      if (result)
        goto LABEL_16;
    }
    else
    {
      v20 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v20)
      {
LABEL_16:
        v22 = v20 - 1;
        if (v20 < 1)
        {
          __break(1u);
          return result;
        }
        v23 = 0;
        if ((v19 & 0xC000000000000001) == 0)
          goto LABEL_19;
LABEL_18:
        for (i = (id)MEMORY[0x23B858090](v23, v19); ; i = *(id *)(v19 + 8 * v23 + 32))
        {
          v25 = i;
          v26 = objc_msgSend(i, sel_layer);
          v27 = objc_msgSend(v26, sel_compositingFilter);

          if (v27)
          {
            sub_23A84C30C();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v33, 0, sizeof(v33));
          }
          sub_23A82E744((uint64_t)v33, (uint64_t)&v34, (uint64_t *)&unk_2542D8080);
          if (!*((_QWORD *)&v35 + 1))
            break;
          if ((swift_dynamicCast() & 1) == 0)
            goto LABEL_30;
          if (v31 == v15 && v32 == v17)
          {

            swift_bridgeObjectRelease();
            if (v22 == v23)
              goto LABEL_35;
            goto LABEL_31;
          }
          v30 = sub_23A84C3FC();
          swift_bridgeObjectRelease();
          if ((v30 & 1) == 0)
            goto LABEL_30;

          if (v22 == v23)
            goto LABEL_35;
LABEL_31:
          ++v23;
          if ((v19 & 0xC000000000000001) != 0)
            goto LABEL_18;
LABEL_19:
          ;
        }
        sub_23A821CC8((uint64_t)&v34);
LABEL_30:
        v28 = objc_msgSend(v25, sel_layer);
        v29 = (void *)sub_23A84C210();
        objc_msgSend(v28, sel_setCompositingFilter_, v29);

        if (v22 == v23)
          goto LABEL_35;
        goto LABEL_31;
      }
    }
LABEL_35:
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease();
  }
  v3 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v3, sel_displayScale);

  v4 = sub_23A8471B8();
  v5 = v4;
  if (v4 >> 62)
    goto LABEL_37;
  v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_23A84C3B4())
  {
    v7 = 4;
    v8 = 0;
    if ((v5 & 0xC000000000000001) != 0)
    {
LABEL_5:
      v9 = (id)MEMORY[0x23B858090](v8, v5);
      goto LABEL_7;
    }
    while (1)
    {
      v9 = *(id *)(v5 + 8 * v7);
LABEL_7:
      v10 = v9;
      v11 = v8 + 1;
      if (__OFADD__(v8, 1))
        break;
      v12 = objc_msgSend(v9, sel_layer);
      v13 = objc_msgSend(v12, sel_compositingFilter);

      if (v13)
      {
        sub_23A84C30C();
        swift_unknownObjectRelease();
        sub_23A821CC8((uint64_t)&v34);
        v14 = objc_msgSend(v10, sel_layer);
        objc_msgSend(v14, sel_setCompositingFilter_, 0);

        if (v11 == v6)
          return swift_bridgeObjectRelease_n();
      }
      else
      {
        v34 = 0u;
        v35 = 0u;
        sub_23A821CC8((uint64_t)&v34);

        if (v11 == v6)
          return swift_bridgeObjectRelease_n();
      }
      v8 = ++v7 - 4;
      if ((v5 & 0xC000000000000001) != 0)
        goto LABEL_5;
    }
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease_n();
}

void sub_23A847B5C()
{
  uint64_t v0;

  sub_23A82E644(*(id *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 8), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 16), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 24), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 32), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 40), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 48), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 64), *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 72), *(_BYTE *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 80));

  swift_bridgeObjectRelease();
}

id sub_23A847C20()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletBackgroundView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletBackgroundView()
{
  return objc_opt_self();
}

void destroy for DropletBackgroundView.BackgroundType(uint64_t a1)
{
  sub_23A82E644(*(id *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80));
}

uint64_t initializeWithCopy for DropletBackgroundView.BackgroundType(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_BYTE *)(a2 + 80);
  sub_23A8223E8(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for DropletBackgroundView.BackgroundType(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v24;
  char v25;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_BYTE *)(a2 + 80);
  sub_23A8223E8(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = *(_BYTE *)(a1 + 80);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_BYTE *)(a1 + 80) = v25;
  sub_23A82E644(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for DropletBackgroundView.BackgroundType(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;

  v3 = *(_BYTE *)(a2 + 80);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_BYTE *)(a1 + 80);
  v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = v3;
  sub_23A82E644(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for DropletBackgroundView.BackgroundType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DropletBackgroundView.BackgroundType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A848048(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t sub_23A848050(uint64_t result, char a2)
{
  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DropletBackgroundView.BackgroundType()
{
  return &type metadata for DropletBackgroundView.BackgroundType;
}

uint64_t sub_23A848068(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  float v6;
  float v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  char v14;
  __int32 v16;
  unsigned int v17;
  int8x16_t v18;
  int32x4_t v19;
  uint64_t v20;
  float32x4_t v21;
  int32x4_t v22[2];
  uint64_t v23;
  __int32 v24;
  int8x16_t v25;
  __int32 v26;
  float v27;
  float v28;
  char v29;
  _OWORD v30[2];
  uint64_t v31;
  unsigned int v32;
  int8x16_t v33;
  __int32 v34;
  float v35;
  float v36;
  char v37;

  sub_23A822438(a1, (uint64_t)v30);
  if (v37)
  {
    if (v37 == 1)
    {
      v4 = *(_QWORD *)&v30[0];
      sub_23A822438(a2, (uint64_t)v22);
      if (v29 == 1)
      {
        if (v4)
        {
          if (v22[0].i64[0])
          {
            sub_23A81A1DC(0, (unint64_t *)&qword_2569C29B0);
            sub_23A82E6C0(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
            sub_23A82E6C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
            v5 = sub_23A84C300();
            sub_23A82E6C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);
            sub_23A82E6C0(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A82E644);
            return v5 & 1;
          }
        }
        else if (!v22[0].i64[0])
        {
          sub_23A82E6C0(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
          sub_23A82E6C0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A8223E8);
          v5 = 1;
          return v5 & 1;
        }
      }
    }
    else
    {
      v14 = v30[0];
      sub_23A822438(a2, (uint64_t)v22);
      if (v29 == 2)
      {
        v5 = ((v14 & 1) == 0) ^ v22[0].i8[0];
        return v5 & 1;
      }
    }
LABEL_14:
    v5 = 0;
    return v5 & 1;
  }
  v20 = v31;
  v21 = (float32x4_t)v30[1];
  v17 = v32;
  v18 = v33;
  v19 = (int32x4_t)v30[0];
  v6 = v35;
  v16 = v34;
  v7 = v36;
  sub_23A822438(a2, (uint64_t)v22);
  if (v29)
    goto LABEL_14;
  v5 = 0;
  v8.i64[0] = v23;
  v8.i32[2] = v24;
  v9.i64[0] = v20;
  v10.i64[0] = vrev64q_s32(v19).u64[0];
  v10.i64[1] = v19.i64[1];
  v9.i64[1] = __PAIR64__(v18.u32[0], v17);
  v11 = (float32x4_t)vextq_s8(v18, (int8x16_t)v8, 4uLL);
  v11.i32[3] = v16;
  v12.i64[0] = vrev64q_s32(v22[0]).u64[0];
  v12.i64[1] = v22[0].i64[1];
  v8.i32[3] = v25.i32[0];
  v13 = (float32x4_t)vextq_s8(v25, (int8x16_t)v8, 4uLL);
  v13.i32[3] = v26;
  if ((vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v10, v12), (int16x8_t)vceqq_f32(v21, (float32x4_t)v22[1])), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v9, v8), (int16x8_t)vceqq_f32(v11, v13))), 7uLL))) & 1) != 0&& v6 == v27)
  {
    v5 = v7 == v28;
  }
  return v5 & 1;
}

void sub_23A8482B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  int v30;
  id v31;
  _OWORD v32[6];

  v2 = *(void **)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType);
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 8);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 16);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 24);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 32);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 40);
  v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 64);
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 80))
  {
    if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 80) == 1)
    {
      v25 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 48);
      v27 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56);
      v29 = *(id *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 72);
      v8 = v2;
      v9 = sub_23A846FA4();
      objc_msgSend(v9, sel_setAlpha_, 0.0);

      v10 = sub_23A847104();
      objc_msgSend(v10, (SEL)&selRef_removeAnyAnimationCompletionBlocks, 0.0);

      v11 = sub_23A847054();
      objc_msgSend(v11, sel_setBackgroundColor_, v8);

      v12 = sub_23A847054();
      objc_msgSend(v12, (SEL)&selRef_removeAnyAnimationCompletionBlocks, 1.0);

      sub_23A82E644(v2, v1, v4, v3, v6, v5, v25, v27, v7, (uint64_t)v29, 1);
      return;
    }
    v19 = sub_23A847054();
    objc_msgSend(v19, sel_setAlpha_, 0.0);

    v20 = sub_23A846FA4();
    objc_msgSend(v20, sel_setAlpha_, 0.0);

    v21 = sub_23A847104();
    sub_23A8490D0(v2 & 1);

    v31 = sub_23A847104();
    objc_msgSend(v31, sel_setAlpha_, 1.0);
  }
  else
  {
    v22 = HIDWORD(*(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 48));
    v23 = HIDWORD(*(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56));
    v24 = HIDWORD(*(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 72));
    v26 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 48);
    v28 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 56);
    v30 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType + 72);
    v13 = sub_23A847054();
    objc_msgSend(v13, sel_setAlpha_, 0.0);

    v14 = sub_23A847104();
    objc_msgSend(v14, sel_setAlpha_, 0.0);

    v15 = (char *)sub_23A846FA4();
    v16 = &v15[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
    v17 = *(_OWORD *)&v15[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 48];
    v32[2] = *(_OWORD *)&v15[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 32];
    v32[3] = v17;
    v32[4] = *(_OWORD *)&v15[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 64];
    v18 = *(_OWORD *)&v15[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix + 16];
    v32[0] = *(_OWORD *)&v15[OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix];
    v32[1] = v18;
    *(_QWORD *)v16 = v2;
    *((_QWORD *)v16 + 1) = v1;
    *((_QWORD *)v16 + 2) = v4;
    *((_QWORD *)v16 + 3) = v3;
    *((_QWORD *)v16 + 4) = v6;
    *((_QWORD *)v16 + 5) = v5;
    *((_DWORD *)v16 + 12) = v26;
    *((_DWORD *)v16 + 13) = v22;
    *((_DWORD *)v16 + 14) = v28;
    *((_DWORD *)v16 + 15) = v23;
    *((_QWORD *)v16 + 8) = v7;
    *((_DWORD *)v16 + 18) = v30;
    *((_DWORD *)v16 + 19) = v24;
    sub_23A83D9F4((float *)v32);

    v31 = sub_23A846FA4();
    objc_msgSend(v31, sel_setAlpha_, 1.0);
  }

}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void sub_23A8485E4()
{
  char *v0;
  char *v1;

  v1 = &v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  v1[80] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___intelligentView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___gradientViews] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView] = 0;

  sub_23A84C39C();
  __break(1u);
}

void sub_23A8486C4(float *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[5];

  v2 = &v1[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix];
  if (*(float *)&v1[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix] != *a1
    || *((float *)v2 + 1) != a1[1]
    || *((float *)v2 + 2) != a1[2]
    || *((float *)v2 + 3) != a1[3]
    || *((float *)v2 + 4) != a1[4]
    || *((float *)v2 + 5) != a1[5]
    || *((float *)v2 + 6) != a1[6]
    || *((float *)v2 + 7) != a1[7]
    || *((float *)v2 + 8) != a1[8]
    || *((float *)v2 + 9) != a1[9]
    || *((float *)v2 + 10) != a1[10]
    || *((float *)v2 + 12) != a1[12]
    || *((float *)v2 + 13) != a1[13]
    || *((float *)v2 + 14) != a1[14]
    || *((float *)v2 + 15) != a1[15]
    || *((float *)v2 + 17) != a1[17]
    || *((float *)v2 + 18) != a1[18]
    || *((float *)v2 + 19) != a1[19])
  {
    v3 = objc_msgSend(v1, sel_layer);
    v9 = *((_OWORD *)v2 + 1);
    v7 = *((_OWORD *)v2 + 3);
    v8 = *((_OWORD *)v2 + 2);
    v6 = *((_OWORD *)v2 + 4);
    v10[0] = *(_OWORD *)v2;
    v10[1] = v9;
    v10[2] = v8;
    v10[3] = v7;
    v10[4] = v6;
    v4 = objc_msgSend((id)objc_opt_self(), sel_valueWithCAColorMatrix_, v10);
    if (qword_2569C25D8 != -1)
      swift_once();
    v5 = (void *)sub_23A84C210();
    objc_msgSend(v3, sel_setValue_forKeyPath_, v4, v5);

  }
}

id sub_23A8488F8(char a1, __int128 *a2, double a3, double a4, double a5, double a6)
{
  _BYTE *v6;
  _OWORD *v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  double v37;
  double v38;
  id v39;
  id v40;
  double v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _OWORD v47[4];
  uint64_t v48;
  uint64_t v49;
  objc_super v50;

  *(_QWORD *)&v6[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView] = 0;
  v13 = &v6[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix];
  v14 = (objc_class *)type metadata accessor for AnimatableLightView();
  v15 = *((_QWORD *)a2 + 8);
  v16 = *((_QWORD *)a2 + 9);
  v17 = a2[3];
  v45 = a2[2];
  v46 = *a2;
  v18 = a2[1];
  v13[2] = v45;
  v13[3] = v17;
  v13[4] = a2[4];
  v43 = a2[1];
  v44 = v17;
  *v13 = *a2;
  v13[1] = v18;
  v6[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_preferringAudioReactivity] = a1;
  v50.receiver = v6;
  v50.super_class = v14;
  v19 = objc_msgSendSuper2(&v50, sel_initWithFrame_preferringAudioReactivity_, a1 & 1, a3, a4, a5, a6);
  sub_23A84C21C();
  v20 = objc_allocWithZone(MEMORY[0x24BDE56B0]);
  v21 = v19;
  v22 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend(v20, sel_initWithType_, v22);

  v47[0] = v46;
  v47[1] = v43;
  v47[2] = v45;
  v47[3] = v44;
  v48 = v15;
  v49 = v16;
  v24 = objc_msgSend((id)objc_opt_self(), sel_valueWithCAColorMatrix_, v47);
  objc_msgSend(v23, sel_setValue_forKeyPath_, v24, *MEMORY[0x24BDE5AD8]);

  v25 = (void *)sub_23A84C294();
  objc_msgSend(v23, sel_setValue_forKeyPath_, v25, *MEMORY[0x24BDE5B08]);

  v26 = (void *)sub_23A84C294();
  objc_msgSend(v23, sel_setValue_forKeyPath_, v26, *MEMORY[0x24BDE5A98]);

  v27 = objc_msgSend(v21, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_23A84E0E0;
  *(_QWORD *)(v28 + 56) = sub_23A815020();
  *(_QWORD *)(v28 + 32) = v23;
  v29 = v23;
  v30 = (void *)sub_23A84C258();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_setFilters_, v30);

  v31 = objc_msgSend(v21, sel_layer);
  objc_msgSend(v31, sel_setCompositingFilter_, *MEMORY[0x24BDE5BE8]);

  v32 = sub_23A848E8C();
  v33 = sub_23A848F4C();
  objc_msgSend(v32, sel_addSubview_, v33);

  v34 = v21;
  v35 = sub_23A848E8C();
  objc_msgSend(v34, sel_setMaskView_, v35);

  v36 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  objc_msgSend(v36, sel_intelligentEdgeLightEDRGainAmount);
  v38 = v37;

  v39 = objc_msgSend(v34, sel_layer);
  objc_msgSend(v39, sel_setWantsExtendedDynamicRangeContent_, v38 > 1.0);

  v40 = objc_msgSend(v34, sel_layer);
  *(float *)&v41 = v38;
  objc_msgSend(v40, sel_setGain_, v41);

  return v34;
}

uint64_t sub_23A848E80(uint64_t a1)
{
  return sub_23A849820(a1, &qword_2569C3140);
}

id sub_23A848E8C()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDC78]), sel_initWithFrame_preferringAudioReactivity_, v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_preferringAudioReactivity], v4, v5, v6, v7);
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_23A848F4C()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v1 = OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView];
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, v4, v5, v6, v7);
    v9 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v9);

    v10 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v11 = v2;
  return v3;
}

id sub_23A849068()
{
  return sub_23A849A30(0, type metadata accessor for AnimatableLightView);
}

uint64_t type metadata accessor for AnimatableLightView()
{
  return objc_opt_self();
}

void sub_23A8490D0(char a1)
{
  char *v1;
  uint64_t v2;
  int v3;
  char *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  __int128 v20;

  v2 = OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity;
  v3 = v1[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity];
  v1[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity] = a1;
  if (v3 != (a1 & 1))
  {
    v4 = v1;
    v5 = sub_23A8498B0();
    objc_msgSend(v5, sel_removeFromSuperview);

    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    LOBYTE(v5) = v4[v2];
    v14 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
    v15 = objc_msgSend(v14, sel_intelligentEdgeLightKeylineStyleColorMatrix);

    objc_msgSend(v15, sel_caColorMatrix);
    v16 = objc_allocWithZone((Class)type metadata accessor for AnimatableLightView());
    v17 = sub_23A8488F8((char)v5, &v20, v7, v9, v11, v13);
    v18 = *(void **)&v4[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView];
    *(_QWORD *)&v4[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView] = v17;

    v19 = sub_23A8498B0();
    objc_msgSend(v4, sel_addSubview_, v19);

  }
}

id sub_23A849258(char a1, double a2, double a3, double a4, double a5)
{
  _BYTE *v5;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  *(_QWORD *)&v5[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView] = 0;
  v5[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity] = a1;
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for AnimatableIntelligentView();
  v10 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a2, a3, a4, a5);
  v11 = sub_23A8498B0();
  objc_msgSend(v10, sel_addSubview_, v11);

  v12 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  objc_msgSend(v12, sel_addKeyObserver_, v10);

  return v10;
}

void sub_23A84952C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v8;
  char *v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  double v15;
  id v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  if (a1)
  {
    objc_opt_self();
    v6 = swift_dynamicCastObjCClass();
    if (v6 && a3 != 0)
    {
      v8 = (void *)v6;
      if (a2 == 0xD000000000000021 && a3 == 0x800000023A84F0E0 || (sub_23A84C3FC() & 1) != 0)
      {
        v9 = a1;
        v10 = sub_23A8498B0();
        objc_msgSend(v8, sel_intelligentEdgeLightEDRGainAmount);
        v12 = v11;
        v13 = objc_msgSend(v10, sel_layer);
        objc_msgSend(v13, sel_setWantsExtendedDynamicRangeContent_, v12 > 1.0);

        v14 = objc_msgSend(v10, sel_layer);
        *(float *)&v15 = v12;
        v25 = v14;
        objc_msgSend(v14, sel_setGain_, v15);

LABEL_12:
        return;
      }
      if (a2 == 0xD00000000000002BLL && a3 == 0x800000023A84F110 || (sub_23A84C3FC() & 1) != 0)
      {
        v25 = a1;
        v9 = (char *)sub_23A8498B0();
        v16 = objc_msgSend(v8, sel_intelligentEdgeLightKeylineStyleColorMatrix);
        objc_msgSend(v16, sel_caColorMatrix);
        v23 = v27;
        v24 = v26;
        v21 = v29;
        v22 = v28;
        v20 = v30;

        v17 = &v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix];
        v18 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix
                           + 48];
        v28 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix
                           + 32];
        v29 = v18;
        v30 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix
                           + 64];
        v19 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix
                           + 16];
        v26 = *(_OWORD *)&v9[OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView_colorMatrix];
        v27 = v19;
        *(_OWORD *)v17 = v24;
        *((_OWORD *)v17 + 1) = v23;
        *((_OWORD *)v17 + 2) = v22;
        *((_OWORD *)v17 + 3) = v21;
        *((_OWORD *)v17 + 4) = v20;
        sub_23A8486C4((float *)&v26);
        goto LABEL_12;
      }
    }
  }
}

uint64_t sub_23A849814(uint64_t a1)
{
  return sub_23A849820(a1, &qword_2569C3148);
}

uint64_t sub_23A849820(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8050);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A84E230;
  *(_QWORD *)(v3 + 32) = 1852399975;
  *(_QWORD *)(v3 + 40) = 0xE400000000000000;
  if (qword_2569C25D8 != -1)
    swift_once();
  v4 = unk_2569C3C00;
  *(_QWORD *)(v3 + 48) = qword_2569C3BF8;
  *(_QWORD *)(v3 + 56) = v4;
  *a2 = v3;
  return swift_bridgeObjectRetain();
}

id sub_23A8498B0()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  __int128 v21;

  v1 = OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView];
  }
  else
  {
    v4 = v0;
    objc_msgSend(v0, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = v0[OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView_preferAudioReactivity];
    v14 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
    v15 = objc_msgSend(v14, sel_intelligentEdgeLightKeylineStyleColorMatrix);

    objc_msgSend(v15, sel_caColorMatrix);
    v16 = objc_allocWithZone((Class)type metadata accessor for AnimatableLightView());
    v17 = sub_23A8488F8(v13, &v21, v6, v8, v10, v12);
    v18 = *(void **)&v4[v1];
    *(_QWORD *)&v4[v1] = v17;
    v3 = v17;

    v2 = 0;
  }
  v19 = v2;
  return v3;
}

id sub_23A849A24(uint64_t a1)
{
  return sub_23A849A30(a1, type metadata accessor for AnimatableIntelligentView);
}

id sub_23A849A30(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for AnimatableIntelligentView()
{
  return objc_opt_self();
}

id sub_23A849AE0(void *a1, uint64_t a2, SEL *a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for DropletParticipantView();
  return objc_msgSendSuper2(&v5, *a3);
}

void sub_23A849B30(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, SEL *a7, SEL *a8)
{
  objc_class *v15;
  const char *v16;
  char *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v15 = (objc_class *)type metadata accessor for DropletParticipantView();
  v34.receiver = a1;
  v34.super_class = v15;
  v16 = *a7;
  v17 = a1;
  objc_msgSendSuper2(&v34, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v33.receiver = v17;
  v33.super_class = v15;
  objc_msgSendSuper2(&v33, *a8, a2, a3, a4, a5);
  objc_msgSend(v17, *a7);
  v36.origin.x = v26;
  v36.origin.y = v27;
  v36.size.width = v28;
  v36.size.height = v29;
  v35.origin.x = v19;
  v35.origin.y = v21;
  v35.size.width = v23;
  v35.size.height = v25;
  if (CGRectEqualToRect(v35, v36)
    || (v30 = &v17[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews],
        swift_beginAccess(),
        (v31 = *(_QWORD *)(*(_QWORD *)v30 + 16)) == 0))
  {

  }
  else
  {
    v32 = *(_QWORD *)v30 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_23A849C90(v32, v17, a7);
      v32 += 8;
      --v31;
    }
    while (v31);

    swift_bridgeObjectRelease();
  }
}

void sub_23A849C90(uint64_t a1, void *a2, SEL *a3)
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
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
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[27];
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v5 = MEMORY[0x23B858660]();
  if (v5)
  {
    v6 = (_QWORD *)v5;
    objc_msgSend(a2, *a3);
    v7 = a2;
    objc_msgSend(v7, sel_bounds);
    v9 = v8;
    v32 = v8;
    v33 = v10;
    objc_msgSend(v7, sel_center);
    v35 = v11;
    v37 = v12;
    objc_msgSend(v7, sel_transform);
    v13 = (uint64_t)v45;
    v31 = v45;
    v34 = v46;
    v41 = v47;
    v39 = v48;
    v43 = v49;
    v72 = v50;
    objc_msgSend(v7, sel_transform3D);
    v14 = v45;
    v15 = v48;
    v42 = v47;
    v29 = v48;
    v30 = v45;
    v24 = v49;
    v25 = v46;
    v16 = v51;
    v40 = v50;
    v17 = v54;
    v38 = v53;
    v27 = v54;
    v28 = v51;
    v22 = v55;
    v23 = v52;
    v18 = v57;
    v36 = v56;
    v26 = v57;
    v20 = v59;
    v21 = v58;
    v19 = v60;

    v45 = v7;
    v46 = v9;
    v47 = v33;
    v48 = v35;
    v49 = v37;
    v50 = v13;
    v51 = v34;
    v52 = v41;
    v53 = v39;
    v54 = v43;
    v55 = v72;
    v56 = v14;
    v57 = v25;
    v58 = v42;
    v59 = v15;
    v60 = v24;
    v61 = v40;
    v62 = v16;
    v63 = v23;
    v64 = v38;
    v65 = v17;
    v66 = v22;
    v67 = v36;
    v68 = v18;
    v69 = v21;
    v70 = v20;
    v71 = v19;
    (*(void (**)(id *))((*MEMORY[0x24BEE4EA0] & *v6) + 0x90))(&v45);
    v44[0] = v7;
    v44[1] = v32;
    v44[2] = v33;
    v44[3] = v35;
    v44[4] = v37;
    v44[5] = v31;
    v44[6] = v34;
    v44[7] = v41;
    v44[8] = v39;
    v44[9] = v43;
    v44[10] = v72;
    v44[11] = v30;
    v44[12] = v25;
    v44[13] = v42;
    v44[14] = v29;
    v44[15] = v24;
    v44[16] = v40;
    v44[17] = v28;
    v44[18] = v23;
    v44[19] = v38;
    v44[20] = v27;
    v44[21] = v22;
    v44[22] = v36;
    v44[23] = v26;
    v44[24] = v21;
    v44[25] = v20;
    v44[26] = v19;
    nullsub_1(v44);
    sub_23A82F90C((uint64_t)v44, (uint64_t)v6 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry);

  }
}

char *sub_23A849FC4(double a1, double a2)
{
  char *v2;
  char *v3;
  objc_class *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char *result;
  double v12;
  double v13;
  char *v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  objc_super v86;
  objc_super v87;
  _QWORD v88[28];

  v3 = v2;
  v6 = (objc_class *)type metadata accessor for DropletParticipantView();
  v87.receiver = v3;
  v87.super_class = v6;
  objc_msgSendSuper2(&v87, sel_center);
  v8 = v7;
  v10 = v9;
  v86.receiver = v3;
  v86.super_class = v6;
  objc_msgSendSuper2(&v86, sel_setCenter_, a1, a2);
  result = (char *)objc_msgSend(v3, sel_center);
  if (v8 != v13 || v10 != v12)
  {
    v15 = &v3[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
    swift_beginAccess();
    result = *(char **)v15;
    v16 = *(_QWORD *)(*(_QWORD *)v15 + 16);
    if (v16)
    {
      v17 = result + 32;
      swift_bridgeObjectRetain();
      v18 = (_QWORD *)MEMORY[0x24BEE4EA0];
      do
      {
        v19 = MEMORY[0x23B858660](v17);
        if (v19)
        {
          v20 = (_QWORD *)v19;
          objc_msgSend(v3, sel_center);
          v21 = v3;
          objc_msgSend(v21, sel_bounds);
          v23 = v22;
          v46 = v22;
          v47 = v24;
          objc_msgSend(v21, sel_center);
          v49 = v25;
          v51 = v26;
          objc_msgSend(v21, sel_transform);
          v27 = v59;
          v45 = v59;
          v48 = v60;
          v55 = v61;
          v53 = v62;
          v57 = v63;
          v58 = v64;
          objc_msgSend(v21, sel_transform3D);
          v28 = v59;
          v29 = v62;
          v56 = v61;
          v43 = v62;
          v44 = v59;
          v38 = v63;
          v39 = v60;
          v30 = v65;
          v54 = v64;
          v31 = v68;
          v52 = v67;
          v41 = v68;
          v42 = v65;
          v36 = v69;
          v37 = v66;
          v32 = v71;
          v50 = v70;
          v40 = v71;
          v33 = v74;
          v34 = v73;
          v35 = v72;

          v88[0] = v21;
          v88[1] = v23;
          v88[2] = v47;
          v88[3] = v49;
          v88[4] = v51;
          v88[5] = v27;
          v88[6] = v48;
          v88[7] = v55;
          v88[8] = v53;
          v88[9] = v57;
          v88[10] = v58;
          v88[11] = v28;
          v88[12] = v39;
          v88[13] = v56;
          v88[14] = v29;
          v88[15] = v38;
          v88[16] = v54;
          v88[17] = v30;
          v88[18] = v37;
          v88[19] = v52;
          v88[20] = v31;
          v88[21] = v36;
          v88[22] = v50;
          v88[23] = v32;
          v88[24] = v35;
          v88[25] = v34;
          v88[26] = v33;
          (*(void (**)(_QWORD *))((*v18 & *v20) + 0x90))(v88);
          v59 = v21;
          v60 = v46;
          v61 = v47;
          v62 = v49;
          v63 = v51;
          v64 = v45;
          v65 = v48;
          v66 = v55;
          v67 = v53;
          v68 = v57;
          v69 = v58;
          v70 = v44;
          v71 = v39;
          v72 = v56;
          v73 = v43;
          v74 = v38;
          v75 = v54;
          v76 = v42;
          v77 = v37;
          v78 = v52;
          v79 = v41;
          v80 = v36;
          v81 = v50;
          v82 = v40;
          v83 = v35;
          v84 = v34;
          v85 = v33;
          nullsub_1(&v59);
          sub_23A82F90C((uint64_t)&v59, (uint64_t)v20 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry);

        }
        v17 += 8;
        --v16;
      }
      while (v16);
      return (char *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_23A84A4D0(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
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
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[27];
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v3 = MEMORY[0x23B858660]();
  if (v3)
  {
    v4 = (_QWORD *)v3;
    objc_msgSend(a2, sel_transform);
    v5 = a2;
    objc_msgSend(v5, sel_bounds);
    v7 = v6;
    v30 = v6;
    v31 = v8;
    objc_msgSend(v5, sel_center);
    v33 = v9;
    v35 = v10;
    objc_msgSend(v5, sel_transform);
    v11 = (uint64_t)v43;
    v29 = v43;
    v32 = v44;
    v39 = v45;
    v37 = v46;
    v41 = v47;
    v70 = v48;
    objc_msgSend(v5, sel_transform3D);
    v12 = v43;
    v13 = v46;
    v40 = v45;
    v27 = v46;
    v28 = v43;
    v22 = v47;
    v23 = v44;
    v14 = v49;
    v38 = v48;
    v15 = v52;
    v36 = v51;
    v25 = v52;
    v26 = v49;
    v20 = v53;
    v21 = v50;
    v16 = v55;
    v34 = v54;
    v24 = v55;
    v18 = v57;
    v19 = v56;
    v17 = v58;

    v43 = v5;
    v44 = v7;
    v45 = v31;
    v46 = v33;
    v47 = v35;
    v48 = v11;
    v49 = v32;
    v50 = v39;
    v51 = v37;
    v52 = v41;
    v53 = v70;
    v54 = v12;
    v55 = v23;
    v56 = v40;
    v57 = v13;
    v58 = v22;
    v59 = v38;
    v60 = v14;
    v61 = v21;
    v62 = v36;
    v63 = v15;
    v64 = v20;
    v65 = v34;
    v66 = v16;
    v67 = v19;
    v68 = v18;
    v69 = v17;
    (*(void (**)(id *))((*MEMORY[0x24BEE4EA0] & *v4) + 0x90))(&v43);
    v42[0] = v5;
    v42[1] = v30;
    v42[2] = v31;
    v42[3] = v33;
    v42[4] = v35;
    v42[5] = v29;
    v42[6] = v32;
    v42[7] = v39;
    v42[8] = v37;
    v42[9] = v41;
    v42[10] = v70;
    v42[11] = v28;
    v42[12] = v23;
    v42[13] = v40;
    v42[14] = v27;
    v42[15] = v22;
    v42[16] = v38;
    v42[17] = v26;
    v42[18] = v21;
    v42[19] = v36;
    v42[20] = v25;
    v42[21] = v20;
    v42[22] = v34;
    v42[23] = v24;
    v42[24] = v19;
    v42[25] = v18;
    v42[26] = v17;
    nullsub_1(v42);
    sub_23A82F90C((uint64_t)v42, (uint64_t)v4 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry);

  }
}

void sub_23A84A9D4(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
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
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[27];
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v3 = MEMORY[0x23B858660]();
  if (v3)
  {
    v4 = (_QWORD *)v3;
    objc_msgSend(a2, sel_transform3D);
    v5 = a2;
    objc_msgSend(v5, sel_bounds);
    v7 = v6;
    v30 = v6;
    v31 = v8;
    objc_msgSend(v5, sel_center);
    v33 = v9;
    v35 = v10;
    objc_msgSend(v5, sel_transform);
    v11 = (uint64_t)v43;
    v29 = v43;
    v32 = v44;
    v39 = v45;
    v37 = v46;
    v41 = v47;
    v70 = v48;
    objc_msgSend(v5, sel_transform3D);
    v12 = v43;
    v13 = v46;
    v40 = v45;
    v27 = v46;
    v28 = v43;
    v22 = v47;
    v23 = v44;
    v14 = v49;
    v38 = v48;
    v15 = v52;
    v36 = v51;
    v25 = v52;
    v26 = v49;
    v20 = v53;
    v21 = v50;
    v16 = v55;
    v34 = v54;
    v24 = v55;
    v18 = v57;
    v19 = v56;
    v17 = v58;

    v43 = v5;
    v44 = v7;
    v45 = v31;
    v46 = v33;
    v47 = v35;
    v48 = v11;
    v49 = v32;
    v50 = v39;
    v51 = v37;
    v52 = v41;
    v53 = v70;
    v54 = v12;
    v55 = v23;
    v56 = v40;
    v57 = v13;
    v58 = v22;
    v59 = v38;
    v60 = v14;
    v61 = v21;
    v62 = v36;
    v63 = v15;
    v64 = v20;
    v65 = v34;
    v66 = v16;
    v67 = v19;
    v68 = v18;
    v69 = v17;
    (*(void (**)(id *))((*MEMORY[0x24BEE4EA0] & *v4) + 0x90))(&v43);
    v42[0] = v5;
    v42[1] = v30;
    v42[2] = v31;
    v42[3] = v33;
    v42[4] = v35;
    v42[5] = v29;
    v42[6] = v32;
    v42[7] = v39;
    v42[8] = v37;
    v42[9] = v41;
    v42[10] = v70;
    v42[11] = v28;
    v42[12] = v23;
    v42[13] = v40;
    v42[14] = v27;
    v42[15] = v22;
    v42[16] = v38;
    v42[17] = v26;
    v42[18] = v21;
    v42[19] = v36;
    v42[20] = v25;
    v42[21] = v20;
    v42[22] = v34;
    v42[23] = v24;
    v42[24] = v19;
    v42[25] = v18;
    v42[26] = v17;
    nullsub_1(v42);
    sub_23A82F90C((uint64_t)v42, (uint64_t)v4 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry);

  }
}

uint64_t sub_23A84B0E4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  _QWORD *v13;
  unint64_t v14;
  char v16[8];
  char v17[8];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
  swift_beginAccess();
  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = 0;
    v5 = 5;
    while (1)
    {
      sub_23A82E960(v2 + v5 * 8 - 8, (uint64_t)v17);
      v6 = (void *)MEMORY[0x23B858660](v17);

      sub_23A825594((uint64_t)v17, &qword_2569C2C40);
      if (!v6)
        break;
      ++v4;
      ++v5;
      if (v3 == v4)
      {
        result = swift_bridgeObjectRelease();
        v8 = *(_QWORD *)(*v1 + 16);
        goto LABEL_10;
      }
    }
    result = swift_bridgeObjectRelease();
    v8 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_37;
    v9 = *v1;
    v10 = *(_QWORD *)(*v1 + 16);
    if (v8 != v10)
    {
      v11 = v4 + 1;
      while (v11 < v10)
      {
        sub_23A82E960(v9 + v5 * 8, (uint64_t)v17);
        v12 = (void *)MEMORY[0x23B858660](v17);

        result = sub_23A825594((uint64_t)v17, &qword_2569C2C40);
        if (v12)
        {
          if (v11 != v4)
          {
            if ((v4 & 0x8000000000000000) != 0)
              goto LABEL_31;
            v13 = (_QWORD *)*v1;
            v14 = *(_QWORD *)(*v1 + 16);
            if (v4 >= v14)
              goto LABEL_32;
            result = sub_23A82E960((uint64_t)&v13[v4 + 4], (uint64_t)v17);
            if (v11 >= v14)
              goto LABEL_33;
            sub_23A82E960((uint64_t)&v13[v5], (uint64_t)v16);
            result = swift_isUniquelyReferenced_nonNull_native();
            *v1 = (uint64_t)v13;
            if ((result & 1) == 0)
            {
              result = (uint64_t)sub_23A84B7DC(v13);
              v13 = (_QWORD *)result;
              *v1 = result;
            }
            if (v4 >= v13[2])
              goto LABEL_34;
            result = sub_23A84BA4C((uint64_t)v16, (uint64_t)&v13[v4 + 4]);
            if (v11 >= *(_QWORD *)(*v1 + 16))
              goto LABEL_35;
            result = sub_23A84BA4C((uint64_t)v17, *v1 + v5 * 8);
          }
          if (__OFADD__(v4++, 1))
            goto LABEL_30;
        }
        v8 = v11 + 1;
        if (__OFADD__(v11, 1))
          goto LABEL_29;
        v9 = *v1;
        v10 = *(_QWORD *)(*v1 + 16);
        ++v11;
        ++v5;
        if (v8 == v10)
          goto LABEL_9;
      }
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
LABEL_9:
    v3 = v4;
LABEL_10:
    if (v8 >= v3)
      goto LABEL_11;
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
  }
  else
  {
    v8 = 0;
LABEL_11:
    sub_23A84B90C(v3, v8);
    return swift_endAccess();
  }
  return result;
}

id sub_23A84B354()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletParticipantView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletParticipantView()
{
  return objc_opt_self();
}

char *sub_23A84B414(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8050);
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23A84B514(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D8070);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_23A84B618(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3220);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 < a4 || v10 + 4 >= &a4[v8 + 4])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2C40);
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v10 != a4)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2C40);
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2C40);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_23A84B774(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23A84C3B4();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B85809CLL);
}

_QWORD *sub_23A84B7DC(_QWORD *a1)
{
  return sub_23A84B618(0, a1[2], 0, a1);
}

void sub_23A84B7F0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges] = 0;
  v1 = &v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
  v2 = *MEMORY[0x24BEBE158];
  v3 = *(_QWORD *)(MEMORY[0x24BEBE158] + 8);
  v4 = *(_QWORD *)(MEMORY[0x24BEBE158] + 16);
  v5 = *(_QWORD *)(MEMORY[0x24BEBE158] + 24);
  *(_QWORD *)v1 = *MEMORY[0x24BEBE158];
  *((_QWORD *)v1 + 1) = v3;
  *((_QWORD *)v1 + 2) = v4;
  *((_QWORD *)v1 + 3) = v5;
  v6 = &v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineFadeLengths];
  *(_QWORD *)v6 = v2;
  *((_QWORD *)v6 + 1) = v3;
  *((_QWORD *)v6 + 2) = v4;
  *((_QWORD *)v6 + 3) = v5;
  v7 = &v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineOutsets];
  *(_QWORD *)v7 = v2;
  *((_QWORD *)v7 + 1) = v3;
  *((_QWORD *)v7 + 2) = v4;
  *((_QWORD *)v7 + 3) = v5;
  v8 = &v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType];
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  v8[80] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStartLocation] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_normalizedStopLocation] = 0x3FF0000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews] = MEMORY[0x24BEE4AF8];

  sub_23A84C39C();
  __break(1u);
}

uint64_t sub_23A84B90C(uint64_t result, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_23A84B618(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2C40);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_21;
  v12 = v4[2];
  if (__OFSUB__(v12, a2))
    goto LABEL_27;
  if (v6 < a2 || &v4[v6 + 4] >= &v4[a2 + 4 + v12 - a2])
  {
    result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v6 != a2)
  {
    result = swift_arrayInitWithTakeBackToFront();
  }
  v13 = v4[2];
  v14 = __OFADD__(v13, v8);
  v15 = v13 - v7;
  if (!v14)
  {
    v4[2] = v15;
LABEL_21:
    *(_QWORD *)v2 = v4;
    return result;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23A84BA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

double *sub_23A84BA94(double *result)
{
  char *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v19;
  CGRect v20;

  v3 = result[3];
  v2 = result[4];
  switch(*(_QWORD *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge])
  {
    case 1:
      v4 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets];
      v2 = CGRectGetMinY(*(CGRect *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds])
         + v4 * -0.5;
      goto LABEL_6;
    case 2:
      v5 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 8];
      v3 = CGRectGetMinX(*(CGRect *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds])
         + v5 * -0.5;
      goto LABEL_6;
    case 4:
      v7 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 16];
      v2 = v7 * 0.5
         + CGRectGetMaxY(*(CGRect *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds]);
      goto LABEL_6;
    case 8:
      v6 = *(double *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 24];
      v3 = v6 * 0.5
         + CGRectGetMaxX(*(CGRect *)&v1[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds]);
LABEL_6:
      BSRectWithSize();
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v1, sel_bounds);
      v20.origin.x = v9;
      v20.origin.y = v11;
      v20.size.width = v13;
      v20.size.height = v15;
      if (!CGRectEqualToRect(v19, v20))
        objc_msgSend(v1, sel_setBounds_, v9, v11, v13, v15);
      result = (double *)objc_msgSend(v1, sel_center);
      if (v17 != v3 || v16 != v2)
        result = (double *)objc_msgSend(v1, sel_setCenter_, v3, v2);
      break;
    default:
      return result;
  }
  return result;
}

id sub_23A84BC8C(uint64_t a1, char a2)
{
  _BYTE *v2;
  int v3;
  _BOOL8 v4;
  id result;

  v3 = v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden];
  v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden] = a2;
  if (v3 != (a2 & 1))
  {
    v4 = (a2 & 1) != 0
      || (*(_QWORD *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge] & ~*(_QWORD *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges]) != 0;
    return objc_msgSend(v2, sel_setHidden_, v4);
  }
  return result;
}

id sub_23A84BCE8(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;
  _BOOL8 v4;
  id result;

  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges];
  *(_QWORD *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges] = a2;
  if (v3 != a2)
  {
    v4 = (v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden] & 1) != 0
      || (*(_QWORD *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge] & ~a2) != 0;
    return objc_msgSend(v2, sel_setHidden_, v4);
  }
  return result;
}

id sub_23A84BD40(double a1, double a2, double a3, double a4)
{
  char *v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id result;

  v5 = (double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets];
  v6 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets];
  v7 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 8];
  v8 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 16];
  v9 = *(double *)&v4[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets + 24];
  *v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  if (v6 != a1 || v7 != a2 || v8 != a3 || v9 != a4)
  {
    objc_msgSend(v4, sel_setNeedsLayout);
    return objc_msgSend(v4, sel_layoutIfNeeded);
  }
  return result;
}

_QWORD *sub_23A84BDA4(char *a1, uint64_t a2)
{
  char *v2;
  char *v4;
  char *v5;
  unsigned __int8 v6;
  char *v7;
  __int128 v8;
  char *v9;
  _QWORD *v10;
  _BOOL8 v11;
  _QWORD *v12;

  v4 = &v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *(_QWORD *)&v2[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge] = a2;
  v5 = v2;
  v6 = objc_msgSend(a1, sel_isHidden);
  v5[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden] = v6;
  *(_QWORD *)&v5[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges] = *(_QWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryEdges];
  v7 = &v5[OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantBoundaryOutsets];
  v8 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets + 16];
  *(_OWORD *)v7 = *(_OWORD *)&a1[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_boundaryOutsets];
  *((_OWORD *)v7 + 1) = v8;

  v9 = a1;
  v10 = sub_23A8344DC(v9);
  v11 = (*((_BYTE *)v10 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantIsHidden) & 1) != 0
     || (*(_QWORD *)((char *)v10 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_edge) & ~*(_QWORD *)((char *)v10 + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_participantRequestedBoundaryEdges)) != 0;
  v12 = v10;
  objc_msgSend(v12, sel_setHidden_, v11);

  return v12;
}

id sub_23A84C004()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DropletBoundaryView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DropletBoundaryView()
{
  return objc_opt_self();
}

uint64_t sub_23A84C054(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 7104878;
  v13 = 0;
  v14[0] = 0;
  v11 = 0;
  v12 = 0;
  v1 = a1;
  objc_msgSend(v1, sel_getRed_green_blue_alpha_, v14, &v13, &v12, &v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C2B28);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23A84E250;
  v3 = v14[0];
  v4 = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE50B0];
  v5 = sub_23A845B8C();
  *(_QWORD *)(v2 + 64) = v5;
  *(_QWORD *)(v2 + 32) = v3;
  v6 = v13;
  *(_QWORD *)(v2 + 96) = v4;
  *(_QWORD *)(v2 + 104) = v5;
  *(_QWORD *)(v2 + 72) = v6;
  v7 = v12;
  *(_QWORD *)(v2 + 136) = v4;
  *(_QWORD *)(v2 + 144) = v5;
  *(_QWORD *)(v2 + 112) = v7;
  v8 = v11;
  *(_QWORD *)(v2 + 176) = v4;
  *(_QWORD *)(v2 + 184) = v5;
  *(_QWORD *)(v2 + 152) = v8;
  v9 = sub_23A84C228();

  return v9;
}

uint64_t sub_23A84C18C()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_23A84C198()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_23A84C1A4()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_23A84C1B0()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_23A84C1BC()
{
  return MEMORY[0x24BEB36E8]();
}

uint64_t sub_23A84C1C8()
{
  return MEMORY[0x24BEB36F8]();
}

uint64_t sub_23A84C1D4()
{
  return MEMORY[0x24BEB3700]();
}

uint64_t sub_23A84C1E0()
{
  return MEMORY[0x24BEBC258]();
}

uint64_t sub_23A84C1EC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23A84C1F8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23A84C204()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A84C210()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A84C21C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A84C228()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23A84C234()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A84C240()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A84C24C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A84C258()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A84C264()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A84C270()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A84C27C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A84C288()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A84C294()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23A84C2A0()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_23A84C2AC()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23A84C2B8()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23A84C2C4()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_23A84C2D0()
{
  return MEMORY[0x24BDBD808]();
}

uint64_t sub_23A84C2DC()
{
  return MEMORY[0x24BEB3708]();
}

uint64_t sub_23A84C2E8()
{
  return MEMORY[0x24BEBCFC0]();
}

uint64_t sub_23A84C2F4()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_23A84C300()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23A84C30C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A84C318()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23A84C324()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A84C330()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A84C33C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A84C348()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23A84C354()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A84C360()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A84C36C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23A84C378()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A84C384()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A84C390()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A84C39C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A84C3A8()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_23A84C3B4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A84C3C0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A84C3CC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A84C3D8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A84C3E4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A84C3F0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23A84C3FC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A84C408()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_23A84C414()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A84C420()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23A84C42C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A84C438()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A84C444()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t CAColorMatrixMakeMultiplyColor()
{
  return MEMORY[0x24BDE53F8]();
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x24BDE5588](a, b);
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x24BDE5618]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x24BEBE648]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

