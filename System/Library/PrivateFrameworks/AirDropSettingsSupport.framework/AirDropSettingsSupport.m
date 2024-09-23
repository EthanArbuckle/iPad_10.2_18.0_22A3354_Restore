uint64_t AirDropSettingsState.discoverableMode.getter()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_235FCA0D0();
  sub_235FCB474();
  swift_release();
  return *(_QWORD *)(v0 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode);
}

uint64_t sub_235FC9F88@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_235FCA0D0();
  sub_235FCB474();
  result = swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode);
  return result;
}

_QWORD *sub_235FCA004(_QWORD *result, _QWORD *a2)
{
  if (*(_QWORD *)(*a2 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode) != *result)
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    return (_QWORD *)swift_release();
  }
  return result;
}

unint64_t sub_235FCA0D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25429D2D0;
  if (!qword_25429D2D0)
  {
    v1 = type metadata accessor for AirDropSettingsState();
    result = MEMORY[0x23B7E8658](&protocol conformance descriptor for AirDropSettingsState, v1);
    atomic_store(result, (unint64_t *)&qword_25429D2D0);
  }
  return result;
}

uint64_t type metadata accessor for AirDropSettingsState()
{
  uint64_t result;

  result = qword_25429D300;
  if (!qword_25429D300)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AirDropSettingsState.discoverableMode.setter(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode) != result)
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    return swift_release();
  }
  return result;
}

void (*AirDropSettingsState.discoverableMode.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[2] = v2;
  swift_getKeyPath();
  v4[3] = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState___observationRegistrar;
  v4[1] = v2;
  v4[4] = sub_235FCA0D0();
  sub_235FCB474();
  swift_release();
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode);
  v4[5] = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode;
  *v4 = v5;
  return sub_235FCA2CC;
}

void sub_235FCA2CC(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = (*a1)[2];
  v4 = **a1;
  v5 = *(_QWORD *)(v3 + (*a1)[5]);
  if ((a2 & 1) != 0)
  {
    if (v5 != v4)
      goto LABEL_5;
  }
  else if (v5 != v4)
  {
LABEL_5:
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    v2[1] = v3;
    sub_235FCB468();
    swift_release();
  }
  free(v2);
}

uint64_t AirDropSettingsState.isNearbySharingEnabled.getter()
{
  return sub_235FCA7B8((uint64_t)&unk_235FCB668, &OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled);
}

uint64_t sub_235FCA414@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_235FCA838(a1, &OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled, a2);
}

unsigned __int8 *sub_235FCA428(unsigned __int8 *result, _QWORD *a2)
{
  if (*result != *(unsigned __int8 *)(*a2
                                     + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    return (unsigned __int8 *)swift_release();
  }
  return result;
}

uint64_t AirDropSettingsState.isNearbySharingEnabled.setter(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled) != (result & 1))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    return swift_release();
  }
  return result;
}

void (*AirDropSettingsState.isNearbySharingEnabled.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[1] = v2;
  swift_getKeyPath();
  v4[2] = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState___observationRegistrar;
  *v4 = v2;
  v4[3] = sub_235FCA0D0();
  sub_235FCB474();
  swift_release();
  v5 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled;
  *((_BYTE *)v4 + 40) = *(_BYTE *)(v2
                                 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled);
  v4[4] = v5;
  return sub_235FCA668;
}

void sub_235FCA668(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v4 = *(_BYTE *)(*(_QWORD *)a1 + 40);
  if ((a2 & 1) != 0)
  {
    if (((v4 ^ *(_BYTE *)(v3 + *(_QWORD *)(*(_QWORD *)a1 + 32))) & 1) != 0)
      goto LABEL_5;
  }
  else if (((v4 ^ *(_BYTE *)(v3 + *(_QWORD *)(*(_QWORD *)a1 + 32))) & 1) != 0)
  {
LABEL_5:
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    *v2 = v3;
    sub_235FCB468();
    swift_release();
  }
  free(v2);
}

uint64_t AirDropSettingsState.isCellularUsageEnabled.getter()
{
  return sub_235FCA7B8((uint64_t)&unk_235FCB690, &OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled);
}

uint64_t sub_235FCA7B8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_235FCA0D0();
  sub_235FCB474();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_235FCA824@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_235FCA838(a1, &OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled, a2);
}

uint64_t sub_235FCA838@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _BYTE *a3@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = *a1;
  swift_getKeyPath();
  sub_235FCA0D0();
  sub_235FCB474();
  result = swift_release();
  *a3 = *(_BYTE *)(v5 + *a2);
  return result;
}

unsigned __int8 *sub_235FCA8B8(unsigned __int8 *result, _QWORD *a2)
{
  if (*result != *(unsigned __int8 *)(*a2
                                     + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    return (unsigned __int8 *)swift_release();
  }
  return result;
}

uint64_t AirDropSettingsState.isCellularUsageEnabled.setter(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled) != (result & 1))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    return swift_release();
  }
  return result;
}

void (*AirDropSettingsState.isCellularUsageEnabled.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[1] = v2;
  swift_getKeyPath();
  v4[2] = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState___observationRegistrar;
  *v4 = v2;
  v4[3] = sub_235FCA0D0();
  sub_235FCB474();
  swift_release();
  v5 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled;
  *((_BYTE *)v4 + 40) = *(_BYTE *)(v2
                                 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled);
  v4[4] = v5;
  return sub_235FCAAF8;
}

void sub_235FCAAF8(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v4 = *(_BYTE *)(*(_QWORD *)a1 + 40);
  if ((a2 & 1) != 0)
  {
    if (((v4 ^ *(_BYTE *)(v3 + *(_QWORD *)(*(_QWORD *)a1 + 32))) & 1) != 0)
      goto LABEL_5;
  }
  else if (((v4 ^ *(_BYTE *)(v3 + *(_QWORD *)(*(_QWORD *)a1 + 32))) & 1) != 0)
  {
LABEL_5:
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    *v2 = v3;
    sub_235FCB468();
    swift_release();
  }
  free(v2);
}

id AirDropSettingsState.isNearbySharingSupported.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController), sel_isNearbySharingSupported);
}

id AirDropSettingsState.isTimeLimitedEveryoneMode.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController), sel_isTimeLimitedEveryoneMode);
}

id sub_235FCAC84()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AirDropSettingsState()), sel_init);
  qword_25429D3A8 = (uint64_t)result;
  return result;
}

id AirDropSettingsState.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static AirDropSettingsState.shared.getter()
{
  if (qword_25429D2F0 != -1)
    swift_once();
  return (id)qword_25429D3A8;
}

id AirDropSettingsState.init()()
{
  void *v0;
  objc_class *ObjectType;
  _BYTE *v2;
  id v3;
  id v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = v0;
  sub_235FCB480();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE904E0]), sel_init);
  v4 = objc_msgSend(v3, sel_discoverableMode);
  *(_QWORD *)&v2[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode] = v4;
  v5 = objc_msgSend(v3, sel_isNearbySharingEnabled);
  v2[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled] = v5;
  v6 = objc_msgSend(v3, sel_isCellularUsageEnabled);
  v2[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled] = v6;
  *(_QWORD *)&v2[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController] = v3;
  v7 = v3;

  v10.receiver = v2;
  v10.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v10, sel_init);
  objc_msgSend(v7, sel_setDelegate_, v8);
  objc_msgSend(v7, sel_startNFCMonitoring);

  return v8;
}

id AirDropSettingsState.__deallocating_deinit()
{
  char *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController], sel_invalidate);
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_235FCAF64(void *a1)
{
  uint64_t v1;
  id v3;
  unsigned int v4;
  id result;

  v3 = objc_msgSend(a1, sel_discoverableMode);
  if (*(id *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode) != v3)
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    swift_release();
  }
  v4 = objc_msgSend(a1, sel_isNearbySharingEnabled);
  if (v4 != *(unsigned __int8 *)(v1
                                + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    swift_release();
  }
  result = objc_msgSend(a1, sel_isCellularUsageEnabled);
  if ((_DWORD)result != *(unsigned __int8 *)(v1
                                            + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FCA0D0();
    sub_235FCB468();
    return (id)swift_release();
  }
  return result;
}

void *_s22AirDropSettingsSupport0abC5StateC019discoveryControllerC9DidChangeyySo05SFAirb9DiscoveryG0CSgF_0(void *a1)
{
  if (a1)
    return sub_235FCAF64(a1);
  __break(1u);
  return a1;
}

BOOL sub_235FCB1F8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_235FCB20C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_235FCB21C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

id sub_235FCB228()
{
  return sub_235FCB3F4();
}

id sub_235FCB23C()
{
  return sub_235FCB384(&OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled, (SEL *)&selRef_isNearbySharingEnabled, (SEL *)&selRef_setNearbySharingEnabled_);
}

id sub_235FCB268()
{
  return sub_235FCB384(&OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled, (SEL *)&selRef_isCellularUsageEnabled, (SEL *)&selRef_setCellularUsageEnabled_);
}

uint64_t sub_235FCB294()
{
  return type metadata accessor for AirDropSettingsState();
}

uint64_t sub_235FCB29C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235FCB48C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for SFAirDropDiscoverableMode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25429D2E0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25429D2E0);
  }
}

id sub_235FCB384(uint64_t *a1, SEL *a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id result;

  v5 = *(_QWORD *)(v3 + 16);
  v6 = *(unsigned __int8 *)(v3 + 24);
  v7 = *a1;
  *(_BYTE *)(v5 + *a1) = v6;
  v8 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController;
  result = objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController), *a2);
  if (v6 != (_DWORD)result)
    return objc_msgSend(*(id *)(v5 + v8), *a3, *(unsigned __int8 *)(v5 + v7));
  return result;
}

id sub_235FCB3F4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(id *)(v0 + 24);
  v3 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode) = v2;
  v4 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController;
  result = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController), sel_discoverableMode);
  if (result != v2)
    return objc_msgSend(*(id *)(v1 + v4), sel_setDiscoverableMode_, *(_QWORD *)(v1 + v3));
  return result;
}

uint64_t sub_235FCB468()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_235FCB474()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_235FCB480()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_235FCB48C()
{
  return MEMORY[0x24BEE5C60]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

