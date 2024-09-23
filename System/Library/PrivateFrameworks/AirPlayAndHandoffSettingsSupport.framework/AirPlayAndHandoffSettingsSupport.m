void AirPlayAndHandoffSettingsState.automaticallyAirPlayMode.getter(char *a1@<X8>)
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  sub_235FCE480(a1);
}

void sub_235FCE260(_BYTE *a1@<X8>)
{
  char v2;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  type metadata accessor for AirPlayAndHandoffSettingsState();
  sub_235FCE480(&v2);
  *a1 = v2;
}

uint64_t sub_235FCE2FC()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

uint64_t type metadata accessor for AirPlayAndHandoffSettingsState()
{
  uint64_t result;

  result = qword_25639B110;
  if (!qword_25639B110)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AirPlayAndHandoffSettingsState.automaticallyAirPlayMode.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

void sub_235FCE480(char *a1@<X8>)
{
  __CFString *v2;
  __CFString *v3;
  int AppBooleanValue;
  BOOL v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  char v10;
  Boolean v11;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  v2 = (__CFString *)sub_235FD88C0();
  v3 = (__CFString *)sub_235FD88C0();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v2, v3, &keyExistsAndHasValidFormat);

  if (AppBooleanValue)
    v5 = 1;
  else
    v5 = keyExistsAndHasValidFormat == 0;
  v6 = v5;
  v11 = 0;
  v7 = (__CFString *)sub_235FD88C0();
  v8 = (__CFString *)sub_235FD88C0();
  v9 = CFPreferencesGetAppBooleanValue(v7, v8, &v11);

  if (v9)
  {
    if ((v6 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    if (v6)
    {
      if (v11)
      {
        v10 = 1;
        goto LABEL_15;
      }
LABEL_9:
      v10 = 2;
LABEL_15:
      *a1 = v10;
      return;
    }
    if (v11)
    {
      v10 = 0;
      goto LABEL_15;
    }
  }
  sub_235FD8A58();
  __break(1u);
}

void sub_235FCE620()
{
  __CFString *v0;
  void *v1;
  __CFString *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;

  v0 = (__CFString *)sub_235FD88C0();
  v1 = (void *)sub_235FD8938();
  v2 = (__CFString *)sub_235FD88C0();
  CFPreferencesSetAppValue(v0, v1, v2);

  v3 = (__CFString *)sub_235FD88C0();
  v4 = (void *)sub_235FD8938();
  v5 = (__CFString *)sub_235FD88C0();
  CFPreferencesSetAppValue(v3, v4, v5);

}

void sub_235FCE72C()
{
  sub_235FCE620();
}

void (*AirPlayAndHandoffSettingsState.automaticallyAirPlayMode.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  void *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 1) = v1;
  swift_getKeyPath();
  *((_QWORD *)v3 + 2) = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *(_QWORD *)v3 = v1;
  *((_QWORD *)v3 + 3) = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  sub_235FCE480((char *)v3 + 32);
  return sub_235FCE7FC;
}

void sub_235FCE7FC(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_getKeyPath();
  *v1 = v1[1];
  sub_235FD8788();
  swift_release();
  free(v1);
}

uint64_t AirPlayAndHandoffSettingsState.transferToHomePodEnabled.getter()
{
  return sub_235FD2044((uint64_t)"P#< ", &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled);
}

uint64_t sub_235FCE8C0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_235FD20DC(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled, a2);
}

unsigned __int8 *sub_235FCE8D4(unsigned __int8 *result, _QWORD *a2)
{
  if (*result != *(unsigned __int8 *)(*a2
                                     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
    sub_235FD8788();
    return (unsigned __int8 *)swift_release();
  }
  return result;
}

uint64_t AirPlayAndHandoffSettingsState.transferToHomePodEnabled.setter(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(v1
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled) != (result & 1))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
    sub_235FD8788();
    return swift_release();
  }
  return result;
}

void sub_235FCEAA4(uint64_t a1, char a2)
{
  void *v3;
  void *v4;

  *(_BYTE *)(a1
           + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled) = a2;
  if ((sub_235FD70A8() & 1) != (a2 & 1))
  {
    if (qword_25639AFF0 != -1)
      swift_once();
    v3 = (void *)qword_25639AFF8;
    if (qword_25639AFF8)
    {
      v4 = (void *)sub_235FD88C0();
      objc_msgSend(v3, sel_setBool_forKey_, a2 & 1, v4);

    }
  }
}

void sub_235FCEB60()
{
  uint64_t v0;

  sub_235FCEAA4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void (*AirPlayAndHandoffSettingsState.transferToHomePodEnabled.modify(_QWORD *a1))(uint64_t a1, char a2)
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
  v4[2] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v4 = v2;
  v4[3] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v5 = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled;
  *((_BYTE *)v4 + 40) = *(_BYTE *)(v2
                                 + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled);
  v4[4] = v5;
  return sub_235FCEC34;
}

void sub_235FCEC34(uint64_t a1, char a2)
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
    sub_235FD8788();
    swift_release();
  }
  free(v2);
}

uint64_t AirPlayAndHandoffSettingsState.isTogglingHandoff.getter()
{
  return sub_235FD2044((uint64_t)"0#< ", &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingHandoff);
}

uint64_t sub_235FCED84@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_235FD20DC(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingHandoff, a2);
}

uint64_t sub_235FCED98()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

id AirPlayAndHandoffSettingsState.handoffEnabled.getter()
{
  id result;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, sel_isActivityContinuationAllowed);

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_235FCEF04(unsigned __int8 *a1@<X8>)
{
  id v2;
  void *v3;
  unsigned __int8 v4;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_isActivityContinuationAllowed);

    *a1 = v4;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235FCEFCC(char *a1)
{
  return AirPlayAndHandoffSettingsState.handoffEnabled.setter(*a1);
}

uint64_t AirPlayAndHandoffSettingsState.handoffEnabled.setter(char a1)
{
  id v1;
  unsigned int v2;

  if ((a1 & 1) != 0
    || (swift_getKeyPath(),
        sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState), sub_235FD8794(), swift_release(), v1 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences), v2 = objc_msgSend(v1, sel_enabled), v1, !v2))
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
    sub_235FD8788();
  }
  else
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FD8788();
    swift_release();
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FD8788();
  }
  return swift_release();
}

id AirPlayAndHandoffSettingsState.linkKeyboardAndMouseEnabled.getter()
{
  id v0;
  id v1;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v1 = objc_msgSend(v0, sel_enabled);

  return v1;
}

uint64_t AirPlayAndHandoffSettingsState.showTurnOffHandoffAlert.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

void sub_235FCF390(char a1)
{
  id v2;
  void *v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_setBoolValue_forSetting_, a1 & 1, *MEMORY[0x24BE63778]);

  }
  else
  {
    __break(1u);
  }
}

uint64_t (*AirPlayAndHandoffSettingsState.handoffEnabled.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*result)(uint64_t);
  uint64_t (*v4)(uint64_t);
  unsigned __int8 v5;

  *(_QWORD *)(a1 + 8) = v1;
  swift_getKeyPath();
  *(_QWORD *)a1 = v1;
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  result = (uint64_t (*)(uint64_t))objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (result)
  {
    v4 = result;
    v5 = objc_msgSend(result, sel_isActivityContinuationAllowed);

    *(_BYTE *)(a1 + 16) = v5;
    return sub_235FCF4D8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_235FCF4D8(uint64_t a1)
{
  return AirPlayAndHandoffSettingsState.handoffEnabled.setter(*(_BYTE *)(a1 + 16));
}

Swift::Void __swiftcall AirPlayAndHandoffSettingsState.userDidTapDontAllowHandoff()()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  swift_release();
  swift_getKeyPath();
  sub_235FD8788();
  swift_release();
}

void sub_235FCF5EC()
{
  id v0;
  void *v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (v0)
  {
    v1 = v0;
    objc_msgSend(v0, sel_setBoolValue_forSetting_, 0, *MEMORY[0x24BE63778]);

  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall AirPlayAndHandoffSettingsState.userDidCancelForTurnOffHandoff()()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.showTurnOffHandoffAlert.getter()
{
  return sub_235FD2984((uint64_t)&unk_235FD9058, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showTurnOffHandoffAlert);
}

uint64_t sub_235FCF710@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_235FD2A34(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showTurnOffHandoffAlert, a2);
}

uint64_t sub_235FCF724()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

void (*AirPlayAndHandoffSettingsState.showTurnOffHandoffAlert.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_235FD87AC();
  swift_release();
  swift_beginAccess();
  return sub_235FCF8C8;
}

void sub_235FCF8C8(_QWORD **a1)
{
  sub_235FD2D3C(a1);
}

uint64_t AirPlayAndHandoffSettingsState.onenessDevices.getter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_235FCF97C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v4 = (_QWORD *)(v3 + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__onenessDevices);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235FCFA2C()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  swift_bridgeObjectRetain();
  sub_235FD8788();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.onenessDevices.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235FCFB90(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)(a1 + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__onenessDevices);
  swift_beginAccess();
  *v3 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*AirPlayAndHandoffSettingsState.onenessDevices.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_235FD87AC();
  swift_release();
  swift_beginAccess();
  return sub_235FCFCF8;
}

void sub_235FCFCF8(_QWORD **a1)
{
  sub_235FD2D3C(a1);
}

uint64_t sub_235FCFD04()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  return swift_retain();
}

uint64_t sub_235FCFD94@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *a2 = *(_QWORD *)(v3
                  + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager);
  return swift_retain();
}

uint64_t sub_235FCFE2C()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  swift_retain();
  sub_235FD8788();
  swift_release();
  return swift_release();
}

void sub_235FCFEE4(unsigned __int8 *a1@<X8>)
{
  id v2;
  unsigned __int8 v3;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v3 = objc_msgSend(v2, sel_enabled);

  *a1 = v3;
}

uint64_t sub_235FCFFA4()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

void sub_235FD0048()
{
  uint64_t v0;

  sub_235FCF390(*(_BYTE *)(v0 + 16));
}

void sub_235FD0060()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16)
           + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingHandoff) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_235FD0078()
{
  return sub_235FD81C0(&OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showTurnOffHandoffAlert);
}

uint64_t sub_235FD0094()
{
  uint64_t v0;

  return sub_235FCFB90(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t AirPlayAndHandoffSettingsState.linkKeyboardAndMouseEnabled.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

void sub_235FD0150(char a1)
{
  id v2;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  objc_msgSend(v2, sel_setEnabled_, a1 & 1);

}

void sub_235FD01B4()
{
  uint64_t v0;

  sub_235FD0150(*(_BYTE *)(v0 + 16));
}

void (*AirPlayAndHandoffSettingsState.linkKeyboardAndMouseEnabled.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  _QWORD *v3;
  id v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v3 = v1;
  v3[3] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  LOBYTE(a1) = objc_msgSend(v4, sel_enabled);

  *((_BYTE *)v3 + 32) = (_BYTE)a1;
  return sub_235FD02AC;
}

void sub_235FD02AC(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_getKeyPath();
  *v1 = v1[1];
  sub_235FD8788();
  swift_release();
  free(v1);
}

uint64_t AirPlayAndHandoffSettingsState.continuityCameraEnabled.getter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  return FigContinuityCaptureGetUserPreferenceDisabled() ^ 1;
}

uint64_t sub_235FD03E4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  result = FigContinuityCaptureGetUserPreferenceDisabled();
  *a1 = result ^ 1;
  return result;
}

uint64_t sub_235FD0474()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.continuityCameraEnabled.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

uint64_t sub_235FD05BC()
{
  return FigContinuityCaptureSetUserPreferenceDisabled();
}

void (*AirPlayAndHandoffSettingsState.continuityCameraEnabled.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v3 = v1;
  v3[3] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *((_BYTE *)v3 + 32) = FigContinuityCaptureGetUserPreferenceDisabled() ^ 1;
  return sub_235FD069C;
}

void sub_235FD069C(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_getKeyPath();
  *v1 = v1[1];
  sub_235FD8788();
  swift_release();
  free(v1);
}

id sub_235FD074C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture));
}

id sub_235FD07D8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v4 = *(void **)(v3
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture);
  *a2 = v4;
  return v4;
}

void sub_235FD086C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  v2 = v1;
  sub_235FD8788();
  swift_release();

}

uint64_t AirPlayAndHandoffSettingsState.isContinuityCameraSupported.getter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  return AVGestaltGetBoolAnswer();
}

id AirPlayAndHandoffSettingsState.airPlayReceiverEnabled.getter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  return objc_msgSend((id)objc_opt_self(), sel_listeningForAlternateBonjourBrowsing);
}

id sub_235FD0A48@<X0>(_BYTE *a1@<X8>)
{
  id result;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  result = objc_msgSend((id)objc_opt_self(), sel_listeningForAlternateBonjourBrowsing);
  *a1 = (_BYTE)result;
  return result;
}

uint64_t sub_235FD0AE8()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.airPlayReceiverEnabled.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

id sub_235FD0C30()
{
  return sub_235FD8144();
}

void (*AirPlayAndHandoffSettingsState.airPlayReceiverEnabled.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v3 = v1;
  v3[3] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *((_BYTE *)v3 + 32) = objc_msgSend((id)objc_opt_self(), sel_listeningForAlternateBonjourBrowsing);
  return sub_235FD0D04;
}

void sub_235FD0D04(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_getKeyPath();
  *v1 = v1[1];
  sub_235FD8788();
  swift_release();
  free(v1);
}

id AirPlayAndHandoffSettingsState.accessMode.getter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  return objc_msgSend((id)objc_opt_self(), sel_getAdvertisingAccessMode);
}

id sub_235FD0E4C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  result = objc_msgSend((id)objc_opt_self(), sel_getAdvertisingAccessMode);
  *a1 = result;
  return result;
}

uint64_t sub_235FD0EEC()
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B050);
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.accessMode.setter()
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B050);
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

void sub_235FD104C(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned int v3;
  char v4;
  id v5;
  id v6;
  void *v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8[0] = 0;
  v3 = objc_msgSend((id)objc_opt_self(), sel_setAdvertisingAccessMode_withError_, a1, v8);
  v4 = v3;
  if (v3)
  {
    v5 = v8[0];
  }
  else
  {
    v6 = v8[0];
    v7 = (void *)sub_235FD85E4();

    swift_willThrow();
  }
  *a2 = v4 ^ 1;
}

void sub_235FD111C(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_235FD104C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E8EE8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void (*AirPlayAndHandoffSettingsState.accessMode.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[2] = v1;
  swift_getKeyPath();
  v3[3] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  v3[1] = v1;
  v3[4] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *v3 = objc_msgSend((id)objc_opt_self(), sel_getAdvertisingAccessMode);
  return sub_235FD1240;
}

void sub_235FD1240(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_getKeyPath();
  v1[1] = v1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B050);
  sub_235FD8788();
  swift_release();
  free(v1);
}

uint64_t AirPlayAndHandoffSettingsState.airPlayPassword.getter()
{
  uint64_t result;
  uint64_t v1;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  result = sub_235FD7260();
  if (!v1)
    return 0;
  return result;
}

uint64_t sub_235FD13A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  result = sub_235FD7260();
  if (v3)
    v4 = result;
  else
    v4 = 0;
  v5 = 0xE000000000000000;
  if (v3)
    v5 = v3;
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t sub_235FD143C()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  swift_bridgeObjectRetain();
  sub_235FD8788();
  swift_release();
  swift_bridgeObjectRelease();
  return notify_post("com.apple.airplay.prefsChanged");
}

uint64_t AirPlayAndHandoffSettingsState.airPlayPassword.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  swift_release();
  swift_bridgeObjectRelease();
  return notify_post("com.apple.airplay.prefsChanged");
}

void sub_235FD15BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void (*v11)(char *, uint64_t);
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v5 = sub_235FD88FC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v9 = a1 & 0xFFFFFFFFFFFFLL;
  if (v9)
  {
    v10 = (void *)sub_235FD88C0();
    v14 = a1;
    v15 = a2;
    sub_235FD88F0();
    sub_235FD8100();
    sub_235FD89E0();
    v16 = v2;
    v11 = *(void (**)(char *, uint64_t))(v6 + 8);
    v11(v8, v5);
    v14 = a1;
    v15 = a2;
    sub_235FD88F0();
    sub_235FD89C8();
    v11(v8, v5);
    APSSettingsSetCString();

    swift_bridgeObjectRelease();
    v12 = (void *)sub_235FD88C0();
    APSSettingsSetValue();

    v13 = (void *)sub_235FD88C0();
    APSSettingsSetValue();

  }
}

void (*AirPlayAndHandoffSettingsState.airPlayPassword.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  v3[2] = v1;
  v3[5] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v4 = sub_235FD7260();
  if (v5)
    v6 = v4;
  else
    v6 = 0;
  v7 = 0xE000000000000000;
  if (v5)
    v7 = v5;
  *v3 = v6;
  v3[1] = v7;
  return sub_235FD183C;
}

void sub_235FD183C(_QWORD **a1, char a2)
{
  _QWORD *v3;

  v3 = *a1;
  swift_getKeyPath();
  v3[2] = v3[3];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_235FD8788();
    swift_bridgeObjectRelease();
    swift_release();
    notify_post("com.apple.airplay.prefsChanged");
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_235FD8788();
    swift_bridgeObjectRelease();
    swift_release();
    notify_post("com.apple.airplay.prefsChanged");
  }
  free(v3);
}

uint64_t AirPlayAndHandoffSettingsState.secureFieldPassword.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__secureFieldPassword);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_235FD1A18@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v4 = (_QWORD *)(v3
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__secureFieldPassword);
  swift_beginAccess();
  v5 = v4[1];
  *a2 = *v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235FD1AC8()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  swift_bridgeObjectRetain();
  sub_235FD8788();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t AirPlayAndHandoffSettingsState.secureFieldPassword.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235FD1C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = (_QWORD *)(a1
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__secureFieldPassword);
  swift_beginAccess();
  *v5 = a2;
  v5[1] = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*AirPlayAndHandoffSettingsState.secureFieldPassword.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_235FD87AC();
  swift_release();
  swift_beginAccess();
  return sub_235FD1DA4;
}

void sub_235FD1DA4(_QWORD **a1)
{
  sub_235FD2D3C(a1);
}

uint64_t AirPlayAndHandoffSettingsState.showPasswordAlert.getter()
{
  return sub_235FD2984((uint64_t)&unk_235FD9198, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showPasswordAlert);
}

uint64_t sub_235FD1DC4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_235FD2A34(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showPasswordAlert, a2);
}

uint64_t sub_235FD1DD8()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.showPasswordAlert.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

void (*AirPlayAndHandoffSettingsState.showPasswordAlert.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_235FD87AC();
  swift_release();
  swift_beginAccess();
  return sub_235FD2024;
}

void sub_235FD2024(_QWORD **a1)
{
  sub_235FD2D3C(a1);
}

uint64_t AirPlayAndHandoffSettingsState.isTogglingRequirePassword.getter()
{
  return sub_235FD2044((uint64_t)&unk_235FD91C0, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingRequirePassword);
}

uint64_t sub_235FD2044(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_235FD20C8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_235FD20DC(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingRequirePassword, a2);
}

uint64_t sub_235FD20DC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _BYTE *a3@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = *a1;
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  result = swift_release();
  *a3 = *(_BYTE *)(v5 + *a2);
  return result;
}

uint64_t sub_235FD2174()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

BOOL AirPlayAndHandoffSettingsState.requirePassword.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v0 = sub_235FD7260();
  if (!v1)
    return 0;
  v2 = v0;
  v3 = v1;
  swift_bridgeObjectRelease();
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = v2 & 0xFFFFFFFFFFFFLL;
  return v4 != 0;
}

BOOL sub_235FD22D4@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = AirPlayAndHandoffSettingsState.requirePassword.getter();
  *a1 = result;
  return result;
}

uint64_t sub_235FD2300(char *a1)
{
  return AirPlayAndHandoffSettingsState.requirePassword.setter(*a1);
}

uint64_t AirPlayAndHandoffSettingsState.requirePassword.setter(char a1)
{
  if ((a1 & 1) != 0)
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
    sub_235FD8788();
    swift_release();
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
  }
  else
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  }
  sub_235FD8788();
  swift_release();
  return notify_post("com.apple.airplay.prefsChanged");
}

void sub_235FD2508()
{
  void *v0;
  void *v1;
  void *v2;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  swift_release();
  v0 = (void *)sub_235FD88C0();
  APSSettingsRemoveValue();

  v1 = (void *)sub_235FD88C0();
  APSSettingsSetValue();

  v2 = (void *)sub_235FD88C0();
  APSSettingsSetValue();

}

uint64_t (*AirPlayAndHandoffSettingsState.requirePassword.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = AirPlayAndHandoffSettingsState.requirePassword.getter();
  return sub_235FD267C;
}

uint64_t sub_235FD267C(uint64_t a1)
{
  return AirPlayAndHandoffSettingsState.requirePassword.setter(*(_BYTE *)(a1 + 8));
}

Swift::Void __swiftcall AirPlayAndHandoffSettingsState.userDidTapCancelRequirePassword()()
{
  if (!AirPlayAndHandoffSettingsState.requirePassword.getter())
  {
    swift_getKeyPath();
    MEMORY[0x24BDAC7A8]();
    sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
    sub_235FD8788();
    swift_release();
  }
  swift_getKeyPath();
  MEMORY[0x24BDAC7A8]();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  swift_release();
}

Swift::Void __swiftcall AirPlayAndHandoffSettingsState.userDidOKRequirePassword()()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  swift_release();
  swift_getKeyPath();
  sub_235FD8794();
  swift_release();
  swift_beginAccess();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_235FD8788();
  swift_release();
  swift_bridgeObjectRelease();
  notify_post("com.apple.airplay.prefsChanged");
}

uint64_t AirPlayAndHandoffSettingsState.isContinuityRestricted.getter()
{
  return sub_235FD2984((uint64_t)"p!< ", &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isContinuityRestricted);
}

uint64_t sub_235FD2984(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  unsigned __int8 *v4;

  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v4 = (unsigned __int8 *)(v2 + *a2);
  swift_beginAccess();
  return *v4;
}

uint64_t sub_235FD2A20@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_235FD2A34(a1, &OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isContinuityRestricted, a2);
}

uint64_t sub_235FD2A34@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _BYTE *a3@<X8>)
{
  uint64_t v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v6 = (_BYTE *)(v5 + *a2);
  result = swift_beginAccess();
  *a3 = *v6;
  return result;
}

uint64_t sub_235FD2AE4()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.isContinuityRestricted.setter()
{
  swift_getKeyPath();
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8788();
  return swift_release();
}

void (*AirPlayAndHandoffSettingsState.isContinuityRestricted.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_235FD87AC();
  swift_release();
  swift_beginAccess();
  return sub_235FD2D30;
}

void sub_235FD2D30(_QWORD **a1)
{
  sub_235FD2D3C(a1);
}

void sub_235FD2D3C(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_endAccess();
  *v1 = v1[3];
  swift_getKeyPath();
  sub_235FD87A0();
  swift_release();
  free(v1);
}

id sub_235FD2DA4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AirPlayAndHandoffSettingsState()), sel_init);
  qword_25639AFE8 = (uint64_t)result;
  return result;
}

id AirPlayAndHandoffSettingsState.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static AirPlayAndHandoffSettingsState.shared.getter()
{
  if (qword_25639AFE0 != -1)
    swift_once();
  return (id)qword_25639AFE8;
}

void sub_235FD2E34()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_235FD88C0();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_25639AFF8 = (uint64_t)v2;
}

uint64_t static AirPlayAndHandoffSettingsState.sharingUserDefaults.getter()
{
  uint64_t v0;
  id v1;

  if (qword_25639AFF0 != -1)
    swift_once();
  v0 = qword_25639AFF8;
  v1 = (id)qword_25639AFF8;
  return v0;
}

id AirPlayAndHandoffSettingsState.init()()
{
  _BYTE *v0;
  objc_class *ObjectType;
  uint64_t v2;
  char *v3;
  _BYTE *v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  id result;
  void *v13;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  objc_super v29;

  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B078);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingHandoff] = 0;
  v0[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showTurnOffHandoffAlert] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__onenessDevices] = MEMORY[0x24BEE4AF8];
  sub_235FD8848();
  v4 = v0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager] = sub_235FD883C();
  v5 = (void *)*MEMORY[0x24BDB1C60];
  *(_QWORD *)&v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture] = *MEMORY[0x24BDB1C60];
  v6 = v5;
  v7 = sub_235FD7260();
  if (v8)
    v9 = v7;
  else
    v9 = 0;
  v10 = 0xE000000000000000;
  if (v8)
    v10 = v8;
  v11 = (uint64_t *)&v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__secureFieldPassword];
  *v11 = v9;
  v11[1] = v10;
  v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showPasswordAlert] = 0;
  v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingRequirePassword] = 0;
  result = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (result)
  {
    v13 = result;
    v14 = objc_msgSend(result, sel_isBoolSettingLockedDownByRestrictions_, *MEMORY[0x24BE63778]);

    v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isContinuityRestricted] = v14;
    sub_235FD87B8();
    v4[OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled] = sub_235FD70A8() & 1;

    v29.receiver = v4;
    v29.super_class = ObjectType;
    v15 = objc_msgSendSuper2(&v29, sel_init);
    v16 = sub_235FD8968();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v3, 1, 1, v16);
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = v15;
    v18 = v15;
    sub_235FD406C((uint64_t)v3, (uint64_t)&unk_25639B090, (uint64_t)v17);
    swift_release();
    v19 = (void *)objc_opt_self();
    v20 = objc_msgSend(v19, sel_defaultCenter);
    v21 = v18;
    v22 = (void *)sub_235FD88C0();
    objc_msgSend(v20, sel_addObserver_selector_name_object_, v21, sel_transferToHomePodEnabledDidChange, v22, 0);

    v23 = objc_msgSend(v19, sel_defaultCenter);
    v24 = v21;
    v25 = (void *)sub_235FD88C0();
    objc_msgSend(v23, sel_addObserver_selector_name_object_, v24, sel_profileNotification_, v25, 0);

    v26 = objc_msgSend(v19, sel_defaultCenter);
    v27 = v24;
    v28 = (void *)sub_235FD88C0();
    objc_msgSend(v26, sel_addObserver_selector_name_object_, v27, sel_profileNotification_, v28, 0);

    return v27;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_235FD327C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_235FD82EC;
  return sub_235FD32C4();
}

uint64_t sub_235FD32C4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[9] = v0;
  v2 = sub_235FD87E8();
  v1[10] = v2;
  v1[11] = *(_QWORD *)(v2 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = __swift_instantiateConcreteTypeFromMangledName(&qword_25639B1C8);
  v1[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B1D0);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v3 = sub_235FD8800();
  v1[18] = v3;
  v1[19] = *(_QWORD *)(v3 - 8);
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639B1D8);
  v1[23] = v4;
  v1[24] = *(_QWORD *)(v4 - 8);
  v1[25] = swift_task_alloc();
  v5 = sub_235FD8824();
  v1[26] = v5;
  v1[27] = *(_QWORD *)(v5 - 8);
  v1[28] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639B1E0);
  v1[29] = v6;
  v1[30] = *(_QWORD *)(v6 - 8);
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_235FD3460()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[9];
  swift_getKeyPath();
  v0[33] = OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState___observationRegistrar;
  v0[2] = v1;
  v0[34] = sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v0[35] = *(_QWORD *)(v1
                     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B1E8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_235FD8F40;
  swift_retain();
  sub_235FD8818();
  sub_235FD880C();
  v0[3] = v2;
  sub_235FD766C(&qword_25639B1F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE84368], MEMORY[0x24BE84378]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B1F8);
  sub_235FD8040(&qword_25639B200, &qword_25639B1F8, MEMORY[0x24BEE12C8]);
  sub_235FD89F8();
  sub_235FD8848();
  sub_235FD766C(&qword_25639B208, (uint64_t (*)(uint64_t))MEMORY[0x24BE84398], MEMORY[0x24BE843A8]);
  sub_235FD8944();
  return swift_task_switch();
}

uint64_t sub_235FD3630()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[27];
  v1 = v0[28];
  v3 = v0[26];
  sub_235FD8830();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_235FD369C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_25639B008 != -1)
    swift_once();
  v1 = sub_235FD886C();
  *(_QWORD *)(v0 + 288) = __swift_project_value_buffer(v1, (uint64_t)qword_25639BC10);
  v2 = sub_235FD8854();
  v3 = sub_235FD898C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_235FCC000, v2, v3, "Fetching for devices", v4, 2u);
    MEMORY[0x23B7E8F54](v4, -1, -1);
  }
  v6 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 256);
  v7 = *(_QWORD *)(v0 + 232);
  v8 = *(_QWORD *)(v0 + 240);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
  *(_QWORD *)(v0 + 296) = swift_getOpaqueTypeConformance2();
  sub_235FD8974();
  *(_DWORD *)(v0 + 320) = *MEMORY[0x24BE842D0];
  swift_getAssociatedConformanceWitness();
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v9;
  *v9 = v0;
  v9[1] = sub_235FD3850;
  return sub_235FD8950();
}

uint64_t sub_235FD3850()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 312) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_235FD38B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(uint64_t, unint64_t, uint64_t);
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t, uint64_t, uint64_t);
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
  char v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(unint64_t, uint64_t, uint64_t);
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v1 = *(_QWORD *)(v0 + 32);
  if (!v1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 232));
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
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v2 = MEMORY[0x24BEE4AF8];
  v47 = (uint64_t *)(v0 + 56);
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(v1 + 16);
  if (!v3)
  {
LABEL_22:
    v44 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    v45 = swift_task_alloc();
    *(_QWORD *)(v45 + 16) = v44;
    *(_QWORD *)(v45 + 24) = v2;
    *(_QWORD *)(v0 + 64) = v44;
    sub_235FD8788();
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_getAssociatedConformanceWitness();
    v46 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 304) = v46;
    *v46 = v0;
    v46[1] = sub_235FD3850;
    sub_235FD8950();
    return;
  }
  v4 = 0;
  v52 = *(_QWORD *)(v1 + 16);
  v53 = v1;
  while (v4 < *(_QWORD *)(v1 + 16))
  {
    v9 = *(_QWORD *)(v0 + 168);
    v8 = *(_QWORD *)(v0 + 176);
    v11 = *(_QWORD *)(v0 + 144);
    v10 = *(_QWORD *)(v0 + 152);
    v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v55 = *(_QWORD *)(v10 + 72);
    v13 = *(void (**)(uint64_t, unint64_t, uint64_t))(v10 + 16);
    v13(v8, v1 + v12 + v55 * v4, v11);
    v14 = sub_235FD87DC();
    v13(v9, v8, v11);
    if ((v14 & 1) == 0)
      goto LABEL_6;
    v54 = v12;
    v15 = *(unsigned int *)(v0 + 320);
    v17 = *(_QWORD *)(v0 + 128);
    v16 = *(_QWORD *)(v0 + 136);
    v18 = *(_QWORD *)(v0 + 104);
    v19 = *(_QWORD *)(v0 + 112);
    v20 = *(_QWORD *)(v0 + 80);
    v21 = *(_QWORD *)(v0 + 88);
    sub_235FD87D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 104))(v17, v15, v20);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v21 + 56))(v17, 0, 1, v20);
    v22 = v19 + *(int *)(v18 + 48);
    sub_235FD8080(v16, v19, &qword_25639B1D0);
    sub_235FD8080(v17, v22, &qword_25639B1D0);
    v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48);
    if (v23(v19, 1, v20) == 1)
    {
      v1 = v53;
      if (v23(v22, 1, *(_QWORD *)(v0 + 80)) == 1)
      {
        v24 = *(_QWORD *)(v0 + 168);
        v25 = *(_QWORD *)(v0 + 144);
        v26 = *(_QWORD *)(v0 + 152);
        v28 = *(_QWORD *)(v0 + 128);
        v27 = *(_QWORD *)(v0 + 136);
        sub_235FD80C4(*(_QWORD *)(v0 + 112), &qword_25639B1D0);
        sub_235FD80C4(v28, &qword_25639B1D0);
        sub_235FD80C4(v27, &qword_25639B1D0);
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
        v3 = v52;
LABEL_16:
        v38 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 152) + 32);
        v38(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 144));
        v39 = *(_QWORD *)(v0 + 56);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_235FD6DB8(0, *(_QWORD *)(v39 + 16) + 1, 1);
          v39 = *v47;
        }
        v41 = *(_QWORD *)(v39 + 16);
        v40 = *(_QWORD *)(v39 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_235FD6DB8(v40 > 1, v41 + 1, 1);
          v39 = *v47;
        }
        v42 = *(_QWORD *)(v0 + 160);
        v43 = *(_QWORD *)(v0 + 144);
        *(_QWORD *)(v39 + 16) = v41 + 1;
        v38(v39 + v54 + v41 * v55, v42, v43);
        *(_QWORD *)(v0 + 56) = v39;
        goto LABEL_8;
      }
      goto LABEL_5;
    }
    v29 = *(_QWORD *)(v0 + 80);
    sub_235FD8080(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), &qword_25639B1D0);
    if (v23(v22, 1, v29) == 1)
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 80));
      v1 = v53;
LABEL_5:
      v5 = *(_QWORD *)(v0 + 128);
      v6 = *(_QWORD *)(v0 + 136);
      sub_235FD80C4(*(_QWORD *)(v0 + 112), &qword_25639B1C8);
      sub_235FD80C4(v5, &qword_25639B1D0);
      sub_235FD80C4(v6, &qword_25639B1D0);
      v3 = v52;
LABEL_6:
      v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 152) + 8);
      v7(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 144));
      goto LABEL_7;
    }
    v50 = *(_QWORD *)(v0 + 144);
    v51 = *(_QWORD *)(v0 + 168);
    v30 = *(_QWORD *)(v0 + 128);
    v48 = *(_QWORD *)(v0 + 136);
    v49 = *(_QWORD *)(v0 + 152);
    v31 = *(_QWORD *)(v0 + 112);
    v32 = *(_QWORD *)(v0 + 120);
    v34 = *(_QWORD *)(v0 + 88);
    v33 = *(_QWORD *)(v0 + 96);
    v35 = *(_QWORD *)(v0 + 80);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v33, v22, v35);
    sub_235FD766C(&qword_25639B210, (uint64_t (*)(uint64_t))MEMORY[0x24BE842D8], MEMORY[0x24BE842E8]);
    v36 = sub_235FD88B4();
    v37 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v37(v32, v35);
    v37(v33, v35);
    sub_235FD80C4(v31, &qword_25639B1D0);
    sub_235FD80C4(v30, &qword_25639B1D0);
    sub_235FD80C4(v48, &qword_25639B1D0);
    v7 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v7(v51, v50);
    v3 = v52;
    v1 = v53;
    if ((v36 & 1) != 0)
      goto LABEL_16;
LABEL_7:
    v7(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 144));
LABEL_8:
    if (v3 == ++v4)
    {
      v2 = *v47;
      goto LABEL_22;
    }
  }
  __break(1u);
}

uint64_t sub_235FD3E44()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
  v1 = *(void **)(v0 + 40);
  v2 = v1;
  v3 = v1;
  v4 = sub_235FD8854();
  v5 = sub_235FD8980();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = v1;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 48) = v9;
    sub_235FD89B0();
    *v7 = v9;

    _os_log_impl(&dword_235FCC000, v4, v5, "Could not fetch devices %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25639B0A0);
    swift_arrayDestroy();
    MEMORY[0x23B7E8F54](v7, -1, -1);
    MEMORY[0x23B7E8F54](v6, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 232));
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235FD406C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_235FD8968();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_235FD895C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_235FD80C4(a1, &qword_25639B078);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235FD8944();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_235FD41D8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  char v5;
  void *v6;
  unsigned int v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;

  if (qword_25639AFF0 != -1)
    swift_once();
  v1 = (void *)qword_25639AFF8;
  if (qword_25639AFF8)
  {
    v2 = (void *)sub_235FD88C0();
    v3 = objc_msgSend(v1, sel_objectForKey_, v2);

    if (v3)
    {
      sub_235FD89EC();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v12, 0, 32);
    }
    sub_235FD7F00((uint64_t)v12, (uint64_t)&v13);
    if (*((_QWORD *)&v14 + 1))
    {
      sub_235FD80C4((uint64_t)&v13, &qword_25639B180);
      v4 = (void *)qword_25639AFF8;
      if (!qword_25639AFF8)
        goto LABEL_16;
      v5 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  sub_235FD80C4((uint64_t)&v13, &qword_25639B180);
  v4 = (void *)qword_25639AFF8;
  if (!qword_25639AFF8)
    goto LABEL_16;
  v5 = 0;
LABEL_13:
  v6 = (void *)sub_235FD88C0();
  v7 = objc_msgSend(v4, sel_BOOLForKey_, v6);

  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)(v0
                   + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled) & 1) != 0)
      return;
    goto LABEL_17;
  }
  if (v7 != *(unsigned __int8 *)(v0
                                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState_effectiveTransferToHomePodEnabled))
  {
LABEL_17:
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath, v9, v10, v11);
    *(_QWORD *)&v13 = v0;
    sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
    sub_235FD8788();
    swift_release();
  }
}

uint64_t sub_235FD4440(uint64_t a1)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v2 = sub_235FD8884();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3, v4, v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235FD889C();
  v28 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235FD85C0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14, v17, v18, v19);
  sub_235FD7E1C(0, &qword_25639B160);
  v20 = (void *)sub_235FD8998();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v14);
  v21 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v22 + v21, (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  v23 = v27;
  *(_QWORD *)(v22 + ((v16 + v21 + 7) & 0xFFFFFFFFFFFFFFF8)) = v27;
  aBlock[4] = sub_235FD7DC4;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235FD4940;
  aBlock[3] = &block_descriptor;
  v24 = _Block_copy(aBlock);
  v25 = v23;
  swift_release();
  sub_235FD8890();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_235FD766C(&qword_25639B168, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B170);
  sub_235FD8040(&qword_25639B178, &qword_25639B170, MEMORY[0x24BEE12C8]);
  sub_235FD89F8();
  MEMORY[0x23B7E8ABC](0, v13, v7, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v13, v29);
}

void sub_235FD46D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[6];
  id v17;
  __int128 v18;
  __int128 v19;

  v3 = sub_235FD85B4();
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)&v18 = sub_235FD88E4();
    *((_QWORD *)&v18 + 1) = v5;
    sub_235FD8A1C();
    if (*(_QWORD *)(v4 + 16) && (v6 = sub_235FD6FB4((uint64_t)v16), (v7 & 1) != 0))
    {
      sub_235FD7E88(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)&v18);
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_235FD7E54((uint64_t)v16);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_235FD8080((uint64_t)&v18, (uint64_t)v16, &qword_25639B180);
  if (v16[3])
  {
    sub_235FD7E1C(0, &qword_25639B188);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v8 = v17;
      v9 = objc_msgSend(v17, sel_intValue);
      if (v9 == getpid())
      {
        sub_235FD80C4((uint64_t)&v18, &qword_25639B180);

        return;
      }
      v10 = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
      if (!v10)
      {
        __break(1u);
        return;
      }
      v11 = v10;
      objc_msgSend(v10, sel_isBoolSettingLockedDownByRestrictions_, *MEMORY[0x24BE63778]);

      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath, v13, v14, v15);
      v16[0] = a2;
      sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
      sub_235FD8788();
      swift_release();

    }
  }
  else
  {
    sub_235FD80C4((uint64_t)v16, &qword_25639B180);
  }
  sub_235FD80C4((uint64_t)&v18, &qword_25639B180);
}

uint64_t sub_235FD4940(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t AirPlayAndHandoffSettingsState.unpair(device:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = v1;
  v3 = sub_235FD8734();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_235FD4A68()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(_QWORD);

  if (qword_25639B008 != -1)
    swift_once();
  v1 = sub_235FD886C();
  v0[9] = __swift_project_value_buffer(v1, (uint64_t)qword_25639BC10);
  v2 = sub_235FD8854();
  v3 = sub_235FD898C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_235FCC000, v2, v3, "Trying to unpair device", v4, 2u);
    MEMORY[0x23B7E8F54](v4, -1, -1);
  }
  v5 = v0[5];

  swift_getKeyPath();
  v0[2] = v5;
  sub_235FD766C(&qword_25639B020, (uint64_t (*)(uint64_t))type metadata accessor for AirPlayAndHandoffSettingsState, (uint64_t)&protocol conformance descriptor for AirPlayAndHandoffSettingsState);
  sub_235FD8794();
  swift_release();
  v0[10] = *(_QWORD *)(v5
                     + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager);
  swift_retain();
  sub_235FD87F4();
  v8 = (uint64_t (*)(_QWORD))((int)*MEMORY[0x24BE84340] + MEMORY[0x24BE84340]);
  v6 = (_QWORD *)swift_task_alloc();
  v0[11] = v6;
  *v6 = v0;
  v6[1] = sub_235FD4C14;
  return v8(v0[8]);
}

uint64_t sub_235FD4C14()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*v1 + 56);
  v2 = *(_QWORD *)(*v1 + 64);
  v4 = *(_QWORD *)(*v1 + 48);
  v5 = *v1;
  *(_QWORD *)(v5 + 96) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_235FD4CC0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v1 = *(void **)(v0 + 96);
  v2 = v1;
  v3 = v1;
  v4 = sub_235FD8854();
  v5 = sub_235FD8980();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 96);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v10;
    sub_235FD89B0();
    *v8 = v10;

    _os_log_impl(&dword_235FCC000, v4, v5, "Error while trying to unpair device %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25639B0A0);
    swift_arrayDestroy();
    MEMORY[0x23B7E8F54](v8, -1, -1);
    MEMORY[0x23B7E8F54](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 96);

  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AirPlayAndHandoffSettingsState.durationOf(start:end:)(uint64_t a1, uint64_t a2)
{
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  _QWORD v36[2];
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = sub_235FD8728();
  v5 = *(_QWORD *)(v4 - 8);
  v9 = MEMORY[0x24BDAC7A8](v4, v6, v7, v8);
  v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v12, v13, v14);
  v16 = (char *)v36 - v15;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14F8]), sel_init);
  objc_msgSend(v17, sel_setAllowedUnits_, 112);
  objc_msgSend(v17, sel_setUnitsStyle_, 3);
  v18 = (void *)sub_235FD8704();
  v19 = (void *)sub_235FD8704();
  v20 = objc_msgSend(v17, sel_stringFromDate_toDate_, v18, v19);

  if (v20)
  {
    v21 = sub_235FD88E4();

  }
  else
  {
    if (qword_25639B008 != -1)
      swift_once();
    v22 = sub_235FD886C();
    __swift_project_value_buffer(v22, (uint64_t)qword_25639BC10);
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v23(v16, a1, v4);
    v23(v11, a2, v4);
    v24 = sub_235FD8854();
    v25 = sub_235FD8980();
    v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      v27 = swift_slowAlloc();
      v38 = swift_slowAlloc();
      v40 = v38;
      *(_DWORD *)v27 = 136315394;
      v36[1] = v27 + 4;
      sub_235FD766C(&qword_25639B0A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v37 = v26;
      v28 = sub_235FD8A7C();
      v39 = sub_235FD6778(v28, v29, &v40);
      sub_235FD89B0();
      swift_bridgeObjectRelease();
      v30 = *(void (**)(char *, uint64_t))(v5 + 8);
      v30(v16, v4);
      *(_WORD *)(v27 + 12) = 2080;
      v31 = sub_235FD8A7C();
      v39 = sub_235FD6778(v31, v32, &v40);
      sub_235FD89B0();
      swift_bridgeObjectRelease();
      v30(v11, v4);
      _os_log_impl(&dword_235FCC000, v24, (os_log_type_t)v37, "Dates are invalid. Start: %s End: %s", (uint8_t *)v27, 0x16u);
      v33 = v38;
      swift_arrayDestroy();
      MEMORY[0x23B7E8F54](v33, -1, -1);
      MEMORY[0x23B7E8F54](v27, -1, -1);
    }
    else
    {
      v34 = *(void (**)(char *, uint64_t))(v5 + 8);
      v34(v16, v4);
      v34(v11, v4);
    }

    return 0;
  }
  return v21;
}

uint64_t AirPlayAndHandoffSettingsState.formatStartDate(start:)(uint64_t a1)
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
  uint64_t v38;
  uint64_t v39;
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
  uint64_t v62;
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
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  void (*v105)(unint64_t, uint64_t, uint64_t);
  char *v106;
  uint64_t v107;
  char v108;
  char v109;
  uint64_t result;
  BOOL v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  void (*v115)(char *, uint64_t);
  char *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  char *v120;
  char *v121;
  void (*v122)(char *, uint64_t);
  uint64_t v123;
  char *v124;
  char *v125;
  char *v126;
  uint64_t v127;
  void (*v128)(char *, uint64_t);
  uint64_t v129;
  char *v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  uint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  char *v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  char *v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;

  v146 = sub_235FD8674();
  v145 = *(_QWORD *)(v146 - 8);
  MEMORY[0x24BDAC7A8](v146, v2, v3, v4);
  v144 = (char *)&v142 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v168 = sub_235FD86A4();
  v167 = *(_QWORD *)(v168 - 8);
  MEMORY[0x24BDAC7A8](v168, v6, v7, v8);
  v166 = (char *)&v142 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v161 = sub_235FD8650();
  v159 = *(_QWORD *)(v161 - 8);
  MEMORY[0x24BDAC7A8](v161, v10, v11, v12);
  v158 = (char *)&v142 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v163 = sub_235FD865C();
  v162 = *(_QWORD *)(v163 - 8);
  MEMORY[0x24BDAC7A8](v163, v14, v15, v16);
  v160 = (char *)&v142 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v155 = sub_235FD862C();
  v154 = *(_QWORD *)(v155 - 8);
  MEMORY[0x24BDAC7A8](v155, v18, v19, v20);
  v153 = (char *)&v142 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = sub_235FD868C();
  v150 = *(_QWORD *)(v151 - 8);
  MEMORY[0x24BDAC7A8](v151, v22, v23, v24);
  v149 = (char *)&v142 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = sub_235FD86BC();
  v147 = *(_QWORD *)(v165 - 8);
  v29 = MEMORY[0x24BDAC7A8](v165, v26, v27, v28);
  v143 = (char *)&v142 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v29, v31, v32, v33);
  v148 = (char *)&v142 - v35;
  v39 = MEMORY[0x24BDAC7A8](v34, v36, v37, v38);
  v152 = (char *)&v142 - v40;
  v44 = MEMORY[0x24BDAC7A8](v39, v41, v42, v43);
  v156 = (char *)&v142 - v45;
  v49 = MEMORY[0x24BDAC7A8](v44, v46, v47, v48);
  v157 = (char *)&v142 - v50;
  MEMORY[0x24BDAC7A8](v49, v51, v52, v53);
  v164 = (char *)&v142 - v54;
  v55 = sub_235FD8764();
  v56 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55, v57, v58, v59);
  v178 = (char *)&v142 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  v177 = sub_235FD86D4();
  v175 = *(_QWORD *)(v177 - 8);
  MEMORY[0x24BDAC7A8](v177, v61, v62, v63);
  v173 = (char *)&v142 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  v172 = sub_235FD86EC();
  v170 = *(_QWORD *)(v172 - 8);
  MEMORY[0x24BDAC7A8](v172, v65, v66, v67);
  v169 = (char *)&v142 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  v176 = sub_235FD86F8();
  v174 = *(_QWORD *)(v176 - 8);
  MEMORY[0x24BDAC7A8](v176, v69, v70, v71);
  v171 = (char *)&v142 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_235FD85D8();
  v187 = *(_QWORD *)(v73 - 8);
  v188 = v73;
  MEMORY[0x24BDAC7A8](v73, v74, v75, v76);
  v78 = (char *)&v142 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
  v184 = sub_235FD8728();
  v180 = *(_QWORD *)(v184 - 8);
  v82 = MEMORY[0x24BDAC7A8](v184, v79, v80, v81);
  v84 = (char *)&v142 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = MEMORY[0x24BDAC7A8](v82, v85, v86, v87);
  v90 = (char *)&v142 - v89;
  MEMORY[0x24BDAC7A8](v88, v91, v92, v93);
  v95 = (char *)&v142 - v94;
  v96 = sub_235FD877C();
  v182 = *(_QWORD *)(v96 - 8);
  v183 = v96;
  MEMORY[0x24BDAC7A8](v96, v97, v98, v99);
  v101 = (char *)&v142 - ((v100 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235FD8758();
  sub_235FD8710();
  v185 = v95;
  sub_235FD8740();
  v186 = a1;
  sub_235FD8740();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B0B0);
  v102 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_235FD8F50;
  v104 = v103 + v102;
  v105 = *(void (**)(unint64_t, uint64_t, uint64_t))(v56 + 104);
  v105(v104, *MEMORY[0x24BDCF220], v55);
  sub_235FD76AC(v103);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v181 = v90;
  v179 = v84;
  v106 = v101;
  sub_235FD874C();
  swift_bridgeObjectRelease();
  v107 = sub_235FD85CC();
  v109 = v108;
  result = (*(uint64_t (**)(char *, uint64_t))(v187 + 8))(v78, v188);
  if ((v109 & 1) != 0)
    goto LABEL_12;
  if (v107 < 0)
  {
    v111 = __OFSUB__(0, v107);
    v107 = -v107;
    if (v111)
    {
      __break(1u);
LABEL_12:
      __break(1u);
      return result;
    }
  }
  if (v107 <= 1)
  {
    v124 = v169;
    sub_235FD86E0();
    v125 = v173;
    sub_235FD86C8();
    v126 = v171;
    sub_235FD8578();
    (*(void (**)(char *, uint64_t))(v175 + 8))(v125, v177);
    (*(void (**)(char *, uint64_t))(v170 + 8))(v124, v172);
    sub_235FD766C(&qword_25639B0B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE530], MEMORY[0x24BDCE528]);
    v127 = v176;
    sub_235FD871C();
    (*(void (**)(char *, uint64_t))(v174 + 8))(v126, v127);
    v128 = *(void (**)(char *, uint64_t))(v180 + 8);
    v129 = v184;
    v128(v179, v184);
    v128(v181, v129);
    v130 = v185;
  }
  else
  {
    v112 = *MEMORY[0x24BDCF240];
    v113 = v178;
    v105((unint64_t)v178, v112, v55);
    v114 = sub_235FD8770();
    v115 = *(void (**)(char *, uint64_t))(v56 + 8);
    v115(v113, v55);
    v105((unint64_t)v113, v112, v55);
    v116 = v185;
    v117 = sub_235FD8770();
    v118 = ((uint64_t (*)(char *, uint64_t))v115)(v113, v55);
    if (v114 == v117)
    {
      v119 = v148;
      MEMORY[0x23B7E869C](v118);
      v120 = v149;
      sub_235FD8680();
      v121 = v152;
      sub_235FD8614();
      (*(void (**)(char *, uint64_t))(v150 + 8))(v120, v151);
      v122 = *(void (**)(char *, uint64_t))(v147 + 8);
      v123 = v165;
      v122(v119, v165);
    }
    else
    {
      v131 = v143;
      MEMORY[0x23B7E869C](v118);
      v132 = v144;
      sub_235FD8668();
      v133 = v148;
      sub_235FD8608();
      (*(void (**)(char *, uint64_t))(v145 + 8))(v132, v146);
      v122 = *(void (**)(char *, uint64_t))(v147 + 8);
      v123 = v165;
      v122(v131, v165);
      v134 = v149;
      sub_235FD8680();
      v121 = v152;
      sub_235FD8614();
      (*(void (**)(char *, uint64_t))(v150 + 8))(v134, v151);
      v122(v133, v123);
    }
    v135 = v153;
    sub_235FD8620();
    v136 = v156;
    sub_235FD85F0();
    (*(void (**)(char *, uint64_t))(v154 + 8))(v135, v155);
    v122(v121, v123);
    v137 = v158;
    sub_235FD8644();
    v138 = v160;
    sub_235FD8638();
    (*(void (**)(char *, uint64_t))(v159 + 8))(v137, v161);
    v139 = v157;
    sub_235FD85FC();
    (*(void (**)(char *, uint64_t))(v162 + 8))(v138, v163);
    v122(v136, v123);
    v140 = v166;
    sub_235FD8698();
    v141 = v164;
    sub_235FD86B0();
    (*(void (**)(char *, uint64_t))(v167 + 8))(v140, v168);
    v122(v139, v123);
    sub_235FD766C(&qword_25639B0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0], MEMORY[0x24BDCE290]);
    sub_235FD871C();
    v122(v141, v123);
    v128 = *(void (**)(char *, uint64_t))(v180 + 8);
    v129 = v184;
    v128(v179, v184);
    v128(v181, v129);
    v130 = v116;
  }
  v128(v130, v129);
  (*(void (**)(char *, uint64_t))(v182 + 8))(v106, v183);
  return v189;
}

id AirPlayAndHandoffSettingsState.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void AirPlayMode.id.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

BOOL static AirPlayMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AirPlayMode.hash(into:)()
{
  return sub_235FD8AA0();
}

void *static AirPlayMode.allCases.getter()
{
  return &unk_25075B390;
}

uint64_t AirPlayMode.hashValue.getter()
{
  sub_235FD8A94();
  sub_235FD8AA0();
  return sub_235FD8AAC();
}

BOOL sub_235FD5D30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235FD5D44()
{
  sub_235FD8A94();
  sub_235FD8AA0();
  return sub_235FD8AAC();
}

uint64_t sub_235FD5D88()
{
  return sub_235FD8AA0();
}

uint64_t sub_235FD5DB0()
{
  sub_235FD8A94();
  sub_235FD8AA0();
  return sub_235FD8AAC();
}

void sub_235FD5DF0(_QWORD *a1@<X8>)
{
  *a1 = &unk_25075B3B8;
}

void sub_235FD5E00(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_235FD5E0C(uint64_t a1, uint64_t a2)
{
  return sub_235FD62F0(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_235FD5E1C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_235FD88CC();
  *a2 = 0;
  return result;
}

uint64_t sub_235FD5EAC(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_235FD88D8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_235FD5F48@<X0>(uint64_t *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  sub_235FD88E4();
  v2 = (void *)sub_235FD88C0();
  swift_bridgeObjectRelease();
  sub_235FD88E4();
  v3 = sub_235FD88C0();

  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_235FD5FA8(uint64_t a1, uint64_t a2)
{
  return sub_235FD6458(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_235FD5FB4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_235FD88CC();
  *a2 = 0;
  return result;
}

uint64_t sub_235FD6028(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_235FD88D8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_235FD60A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_235FD88E4();
  v2 = sub_235FD88C0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_235FD60E4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  sub_235FD88E4();
  v0 = (void *)sub_235FD88C0();
  swift_bridgeObjectRelease();
  sub_235FD88E4();
  v1 = (void *)sub_235FD88C0();
  swift_bridgeObjectRelease();
  v2 = sub_235FD88E4();
  v4 = v3;
  if (v2 == sub_235FD88E4() && v4 == v5)
    v6 = 1;
  else
    v6 = sub_235FD8A88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6 & 1;
}

uint64_t sub_235FD61B4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  sub_235FD88E4();
  v4 = sub_235FD88C0();

  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_235FD6200@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_235FD88E4();
  v2 = sub_235FD88C0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_235FD6244()
{
  sub_235FD766C(&qword_25639B148, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltBoolQuestion, (uint64_t)&unk_235FD9524);
  sub_235FD766C(&qword_25639B150, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltBoolQuestion, (uint64_t)&unk_235FD94CC);
  sub_235FD766C(&qword_25639B158, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltQuestion, (uint64_t)&unk_235FD96C8);
  return sub_235FD8A70();
}

uint64_t sub_235FD62E4(uint64_t a1, uint64_t a2)
{
  return sub_235FD62F0(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_235FD62F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  sub_235FD88E4();
  v4 = (void *)sub_235FD88C0();
  swift_bridgeObjectRelease();
  v5 = sub_235FD88E4();
  v6 = a3(v5);

  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_235FD6354()
{
  void *v0;

  sub_235FD88E4();
  v0 = (void *)sub_235FD88C0();
  swift_bridgeObjectRelease();
  sub_235FD88E4();
  sub_235FD8914();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235FD63BC()
{
  void *v0;
  uint64_t v1;

  sub_235FD88E4();
  v0 = (void *)sub_235FD88C0();
  swift_bridgeObjectRelease();
  sub_235FD88E4();
  sub_235FD8A94();
  sub_235FD8914();
  v1 = sub_235FD8AAC();

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_235FD644C(uint64_t a1, uint64_t a2)
{
  return sub_235FD6458(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_235FD6458(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_235FD88E4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_235FD6494()
{
  sub_235FD88E4();
  sub_235FD8914();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235FD64D4()
{
  uint64_t v0;

  sub_235FD88E4();
  sub_235FD8A94();
  sub_235FD8914();
  v0 = sub_235FD8AAC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_235FD6544@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_235FD88C0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_235FD6588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_235FD88E4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_235FD65B0()
{
  sub_235FD766C(&qword_25639B158, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltQuestion, (uint64_t)&unk_235FD96C8);
  sub_235FD766C(&qword_25639B248, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltQuestion, (uint64_t)&unk_235FD9628);
  return sub_235FD8A70();
}

uint64_t sub_235FD6634()
{
  return sub_235FD60E4();
}

uint64_t sub_235FD6640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_235FD88E4();
  v2 = v1;
  if (v0 == sub_235FD88E4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_235FD8A88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_235FD66C8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_235FD672C;
  return v6(a1);
}

uint64_t sub_235FD672C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_235FD6778(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235FD6848(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235FD7E88((uint64_t)v12, *a3);
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
      sub_235FD7E88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_235FD6848(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235FD89BC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235FD6A00(a5, a6);
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
  v8 = sub_235FD8A40();
  if (!v8)
  {
    sub_235FD8A4C();
    __break(1u);
LABEL_17:
    result = sub_235FD8A64();
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

uint64_t sub_235FD6A00(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235FD6A94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235FD6C6C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235FD6C6C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235FD6A94(uint64_t a1, unint64_t a2)
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
      v3 = sub_235FD6C08(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235FD8A34();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235FD8A4C();
      __break(1u);
LABEL_10:
      v2 = sub_235FD8920();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235FD8A64();
    __break(1u);
LABEL_14:
    result = sub_235FD8A4C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235FD6C08(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B1A8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235FD6C6C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25639B1A8);
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
  result = sub_235FD8A64();
  __break(1u);
  return result;
}

uint64_t sub_235FD6DB8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_235FD6DD4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_235FD6DD4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25639B218);
  v10 = *(_QWORD *)(sub_235FD8800() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_235FD8800() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_235FD8A64();
  __break(1u);
  return result;
}

unint64_t sub_235FD6FB4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235FD8A04();
  return sub_235FD6FE4(a1, v2);
}

unint64_t sub_235FD6FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_235FD7EC4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7E8B28](v9, a1);
      sub_235FD7E54((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_235FD70A8()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;

  if (qword_25639AFF0 != -1)
    swift_once();
  v0 = (void *)qword_25639AFF8;
  if (qword_25639AFF8)
  {
    v1 = (void *)sub_235FD88C0();
    v2 = objc_msgSend(v0, sel_objectForKey_, v1);

    if (v2)
    {
      sub_235FD89EC();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v8, 0, sizeof(v8));
    }
    sub_235FD7F00((uint64_t)v8, (uint64_t)&v9);
    if (*((_QWORD *)&v10 + 1))
    {
      sub_235FD80C4((uint64_t)&v9, &qword_25639B180);
      v3 = (void *)qword_25639AFF8;
      v4 = 1;
      if (!qword_25639AFF8)
        return v4;
      goto LABEL_13;
    }
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  sub_235FD80C4((uint64_t)&v9, &qword_25639B180);
  v3 = (void *)qword_25639AFF8;
  if (!qword_25639AFF8)
    return 1;
  LOBYTE(v4) = 0;
LABEL_13:
  v5 = (void *)sub_235FD88C0();
  v6 = objc_msgSend(v3, sel_BOOLForKey_, v5);

  if ((v4 & 1) == 0)
    return 1;
  return (uint64_t)v6;
}

uint64_t sub_235FD7218(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
      return sub_235FD8908();
    v4 = 0;
    v5 = v1 - 1;
    v6 = v2 + 33;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v6 + v4++))
        return sub_235FD8908();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_235FD7260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD v20[2];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v0 = sub_235FD859C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235FD892C();
  *(_QWORD *)(v4 + 16) = 64;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  v21 = sub_235FD8878();
  v5 = (void *)sub_235FD88C0();
  APSSettingsGetCString();

  v6 = v21;
  if (v6 != sub_235FD8878())
  {
    if (qword_25639B010 != -1)
      swift_once();
    v15 = sub_235FD886C();
    __swift_project_value_buffer(v15, (uint64_t)qword_25639BC28);
    v16 = sub_235FD8854();
    v17 = sub_235FD8980();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_235FCC000, v16, v17, "Could not get AirPlay Receiver password", v18, 2u);
      MEMORY[0x23B7E8F54](v18, -1, -1);
    }
    swift_bridgeObjectRelease();

    return 0;
  }
  v7 = swift_bridgeObjectRetain();
  v8 = sub_235FD7218(v7);
  v10 = v9;
  swift_bridgeObjectRelease();
  v20[0] = v8;
  v20[1] = v10;
  swift_bridgeObjectRetain();
  sub_235FD8590();
  sub_235FD8100();
  v11 = sub_235FD89D4();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0)
    v14 = v11 & 0xFFFFFFFFFFFFLL;
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

void sub_235FD74DC()
{
  uint64_t v0;

  sub_235FD15BC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235FD74F4()
{
  uint64_t *v0;

  return sub_235FD1C38(v0[2], v0[3], v0[4]);
}

uint64_t sub_235FD7510()
{
  return sub_235FD81C0(&OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__showPasswordAlert);
}

void sub_235FD752C()
{
  sub_235FD2508();
}

void sub_235FD7544()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16)
           + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isTogglingRequirePassword) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_235FD755C()
{
  return sub_235FD81C0(&OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__isContinuityRestricted);
}

uint64_t sub_235FD7578()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_235FD75A4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_235FD760C;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_235FD82EC;
  return sub_235FD32C4();
}

uint64_t sub_235FD760C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_235FD766C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7E8F00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235FD76AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t result;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;

  v2 = sub_235FD8764();
  v3 = *(_QWORD *)(v2 - 8);
  v7 = MEMORY[0x24BDAC7A8](v2, v4, v5, v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10, v11, v12);
  v14 = (char *)&v33 - v13;
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25639B190);
    v16 = sub_235FD8A28();
    v17 = 0;
    v18 = *(unsigned __int8 *)(v3 + 80);
    v34 = v15;
    v35 = a1 + ((v18 + 32) & ~v18);
    v19 = *(_QWORD *)(v3 + 72);
    v37 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v38 = v16 + 56;
    while (1)
    {
      v36 = v17;
      v37(v14, v35 + v19 * v17, v2);
      sub_235FD766C(&qword_25639B198, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v20 = sub_235FD88A8();
      v21 = ~(-1 << *(_BYTE *)(v16 + 32));
      v22 = v20 & v21;
      v23 = (v20 & (unint64_t)v21) >> 6;
      v24 = *(_QWORD *)(v38 + 8 * v23);
      v25 = 1 << (v20 & v21);
      if ((v25 & v24) != 0)
      {
        do
        {
          v37(v9, *(_QWORD *)(v16 + 48) + v22 * v19, v2);
          sub_235FD766C(&qword_25639B1A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v26 = sub_235FD88B4();
          v27 = v3;
          v28 = *(void (**)(char *, uint64_t))(v3 + 8);
          v28(v9, v2);
          if ((v26 & 1) != 0)
          {
            v28(v14, v2);
            v3 = v27;
            v15 = v34;
            goto LABEL_4;
          }
          v22 = (v22 + 1) & v21;
          v23 = v22 >> 6;
          v24 = *(_QWORD *)(v38 + 8 * (v22 >> 6));
          v25 = 1 << v22;
          v3 = v27;
        }
        while ((v24 & (1 << v22)) != 0);
        v15 = v34;
      }
      *(_QWORD *)(v38 + 8 * v23) = v25 | v24;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v16 + 48) + v22 * v19, v14, v2);
      v30 = *(_QWORD *)(v16 + 16);
      v31 = __OFADD__(v30, 1);
      v32 = v30 + 1;
      if (v31)
        break;
      *(_QWORD *)(v16 + 16) = v32;
LABEL_4:
      v17 = v36 + 1;
      if (v36 + 1 == v15)
        return v16;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

unint64_t sub_235FD7918()
{
  unint64_t result;

  result = qword_25639B0C8;
  if (!qword_25639B0C8)
  {
    result = MEMORY[0x23B7E8F00](&protocol conformance descriptor for AirPlayMode, &type metadata for AirPlayMode);
    atomic_store(result, (unint64_t *)&qword_25639B0C8);
  }
  return result;
}

uint64_t sub_235FD795C()
{
  return sub_235FD8040(&qword_25639B0D0, &qword_25639B0D8, MEMORY[0x24BEE12E0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E8EF4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_235FD79D0()
{
  unint64_t result;

  result = qword_25639B0E0;
  if (!qword_25639B0E0)
  {
    result = MEMORY[0x23B7E8F00](&protocol conformance descriptor for AirPlayMode, &type metadata for AirPlayMode);
    atomic_store(result, (unint64_t *)&qword_25639B0E0);
  }
  return result;
}

uint64_t sub_235FD7A14()
{
  return type metadata accessor for AirPlayAndHandoffSettingsState();
}

uint64_t sub_235FD7A1C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235FD87C4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AirPlayMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AirPlayMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235FD7BB8 + 4 * byte_235FD8F85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_235FD7BEC + 4 * byte_235FD8F80[v4]))();
}

uint64_t sub_235FD7BEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235FD7BF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235FD7BFCLL);
  return result;
}

uint64_t sub_235FD7C08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235FD7C10);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_235FD7C14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235FD7C1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235FD7C28(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235FD7C34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AirPlayMode()
{
  return &type metadata for AirPlayMode;
}

void type metadata accessor for APRKAdvertisingAccessMode(uint64_t a1)
{
  sub_235FD7D0C(a1, &qword_25639B120);
}

void type metadata accessor for AVGestaltBoolQuestion(uint64_t a1)
{
  sub_235FD7D0C(a1, &qword_25639B128);
}

uint64_t sub_235FD7C74()
{
  return sub_235FD766C(&qword_25639B130, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltBoolQuestion, (uint64_t)&unk_235FD9494);
}

uint64_t sub_235FD7CA0()
{
  return sub_235FD766C(&qword_25639B138, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltBoolQuestion, (uint64_t)&unk_235FD946C);
}

uint64_t sub_235FD7CCC()
{
  return sub_235FD766C(&qword_25639B140, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltBoolQuestion, (uint64_t)&unk_235FD94FC);
}

void type metadata accessor for AVGestaltQuestion(uint64_t a1)
{
  sub_235FD7D0C(a1, &qword_25639B228);
}

void sub_235FD7D0C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235FD7D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_235FD85C0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void sub_235FD7DC4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(sub_235FD85C0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_235FD46D4(v0 + v2, *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
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

uint64_t sub_235FD7E1C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235FD7E54(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_235FD7E88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235FD7EC4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_235FD7F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25639B180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t sub_235FD7F6C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16)
            + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__companionDeviceManager) = *(_QWORD *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_235FD7FAC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235FD7FD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_235FD760C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25639B1B0 + dword_25639B1B0))(a1, v4);
}

uint64_t sub_235FD8040(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7E8F00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235FD8080(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235FD80C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_235FD8100()
{
  unint64_t result;

  result = qword_25639B220;
  if (!qword_25639B220)
  {
    result = MEMORY[0x23B7E8F00](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25639B220);
  }
  return result;
}

id sub_235FD8144()
{
  uint64_t v0;

  return objc_msgSend((id)objc_opt_self(), sel_setListeningForAlternateBonjourBrowsing_, *(unsigned __int8 *)(v0 + 16));
}

void sub_235FD8184()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1
                + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC32AirPlayAndHandoffSettingsSupport30AirPlayAndHandoffSettingsState__AVGQDeviceSupportsContinuityCapture) = v2;
  v4 = v2;

}

uint64_t sub_235FD81C0(_QWORD *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *(_BYTE *)(v1 + 24);
  v3 = (_BYTE *)(*(_QWORD *)(v1 + 16) + *a1);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_235FD8218()
{
  return sub_235FD766C(&qword_25639B230, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltQuestion, (uint64_t)&unk_235FD95F0);
}

uint64_t sub_235FD8244()
{
  return sub_235FD766C(&qword_25639B238, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltQuestion, (uint64_t)&unk_235FD95C8);
}

uint64_t sub_235FD8270()
{
  return sub_235FD766C(&qword_25639B240, (uint64_t (*)(uint64_t))type metadata accessor for AVGestaltQuestion, (uint64_t)&unk_235FD9658);
}

void sub_235FD829C()
{
  sub_235FCE72C();
}

void sub_235FD82B0()
{
  sub_235FD01B4();
}

void sub_235FD82C4(_BYTE *a1@<X8>)
{
  sub_235FD111C(a1);
}

uint64_t sub_235FD82D8()
{
  return sub_235FD05BC();
}

void sub_235FD82F0()
{
  sub_235FCEB60();
}

void sub_235FD8304()
{
  sub_235FD74DC();
}

uint64_t sub_235FD8318()
{
  return sub_235FD0094();
}

void sub_235FD832C()
{
  sub_235FD0060();
}

void sub_235FD8340()
{
  sub_235FD7544();
}

uint64_t sub_235FD8354()
{
  return sub_235FD74F4();
}

uint64_t sub_235FD8368()
{
  return swift_deallocClassInstance();
}

id sub_235FD8378()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for FindAirPlayAndHandoffSettingsSupportClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_25639B250 = (uint64_t)result;
  return result;
}

id static NSBundle.airPlayAndHandoffSettingsSupport.getter()
{
  if (qword_25639B000 != -1)
    swift_once();
  return (id)qword_25639B250;
}

uint64_t type metadata accessor for FindAirPlayAndHandoffSettingsSupportClass()
{
  return objc_opt_self();
}

uint64_t sub_235FD842C()
{
  uint64_t v0;

  v0 = sub_235FD886C();
  __swift_allocate_value_buffer(v0, qword_25639BC10);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639BC10);
  swift_bridgeObjectRetain();
  return sub_235FD8860();
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

uint64_t sub_235FD84F0()
{
  uint64_t v0;

  v0 = sub_235FD886C();
  __swift_allocate_value_buffer(v0, qword_25639BC28);
  __swift_project_value_buffer(v0, (uint64_t)qword_25639BC28);
  swift_bridgeObjectRetain();
  return sub_235FD8860();
}

uint64_t sub_235FD8578()
{
  return MEMORY[0x24BDCB138]();
}

uint64_t sub_235FD8584()
{
  return MEMORY[0x24BDCB148]();
}

uint64_t sub_235FD8590()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_235FD859C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_235FD85A8()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_235FD85B4()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_235FD85C0()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_235FD85CC()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_235FD85D8()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_235FD85E4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_235FD85F0()
{
  return MEMORY[0x24BDCE010]();
}

uint64_t sub_235FD85FC()
{
  return MEMORY[0x24BDCE028]();
}

uint64_t sub_235FD8608()
{
  return MEMORY[0x24BDCE038]();
}

uint64_t sub_235FD8614()
{
  return MEMORY[0x24BDCE040]();
}

uint64_t sub_235FD8620()
{
  return MEMORY[0x24BDCE060]();
}

uint64_t sub_235FD862C()
{
  return MEMORY[0x24BDCE078]();
}

uint64_t sub_235FD8638()
{
  return MEMORY[0x24BDCE0A0]();
}

uint64_t sub_235FD8644()
{
  return MEMORY[0x24BDCE0B8]();
}

uint64_t sub_235FD8650()
{
  return MEMORY[0x24BDCE0D0]();
}

uint64_t sub_235FD865C()
{
  return MEMORY[0x24BDCE0E0]();
}

uint64_t sub_235FD8668()
{
  return MEMORY[0x24BDCE110]();
}

uint64_t sub_235FD8674()
{
  return MEMORY[0x24BDCE130]();
}

uint64_t sub_235FD8680()
{
  return MEMORY[0x24BDCE148]();
}

uint64_t sub_235FD868C()
{
  return MEMORY[0x24BDCE160]();
}

uint64_t sub_235FD8698()
{
  return MEMORY[0x24BDCE168]();
}

uint64_t sub_235FD86A4()
{
  return MEMORY[0x24BDCE178]();
}

uint64_t sub_235FD86B0()
{
  return MEMORY[0x24BDCE230]();
}

uint64_t sub_235FD86BC()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_235FD86C8()
{
  return MEMORY[0x24BDCE4C8]();
}

uint64_t sub_235FD86D4()
{
  return MEMORY[0x24BDCE4E0]();
}

uint64_t sub_235FD86E0()
{
  return MEMORY[0x24BDCE4F8]();
}

uint64_t sub_235FD86EC()
{
  return MEMORY[0x24BDCE500]();
}

uint64_t sub_235FD86F8()
{
  return MEMORY[0x24BDCE530]();
}

uint64_t sub_235FD8704()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_235FD8710()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_235FD871C()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_235FD8728()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_235FD8734()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_235FD8740()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_235FD874C()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_235FD8758()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_235FD8764()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_235FD8770()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_235FD877C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_235FD8788()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_235FD8794()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_235FD87A0()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_235FD87AC()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_235FD87B8()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_235FD87C4()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_235FD87D0()
{
  return MEMORY[0x24BE84278]();
}

uint64_t sub_235FD87DC()
{
  return MEMORY[0x24BE84280]();
}

uint64_t sub_235FD87E8()
{
  return MEMORY[0x24BE842D8]();
}

uint64_t sub_235FD87F4()
{
  return MEMORY[0x24BE84310]();
}

uint64_t sub_235FD8800()
{
  return MEMORY[0x24BE84330]();
}

uint64_t sub_235FD880C()
{
  return MEMORY[0x24BE84358]();
}

uint64_t sub_235FD8818()
{
  return MEMORY[0x24BE84360]();
}

uint64_t sub_235FD8824()
{
  return MEMORY[0x24BE84368]();
}

uint64_t sub_235FD8830()
{
  return MEMORY[0x24BE84388]();
}

uint64_t sub_235FD883C()
{
  return MEMORY[0x24BE84390]();
}

uint64_t sub_235FD8848()
{
  return MEMORY[0x24BE84398]();
}

uint64_t sub_235FD8854()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235FD8860()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235FD886C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235FD8878()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t sub_235FD8884()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_235FD8890()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_235FD889C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_235FD88A8()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_235FD88B4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235FD88C0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235FD88CC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_235FD88D8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_235FD88E4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235FD88F0()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_235FD88FC()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_235FD8908()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_235FD8914()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235FD8920()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235FD892C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_235FD8938()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_235FD8944()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_235FD8950()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_235FD895C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_235FD8968()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_235FD8974()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_235FD8980()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235FD898C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235FD8998()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_235FD89A4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_235FD89B0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235FD89BC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235FD89C8()
{
  return MEMORY[0x24BDD04F8]();
}

uint64_t sub_235FD89D4()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_235FD89E0()
{
  return MEMORY[0x24BDD0618]();
}

uint64_t sub_235FD89EC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_235FD89F8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_235FD8A04()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_235FD8A10()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_235FD8A1C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_235FD8A28()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_235FD8A34()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235FD8A40()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235FD8A4C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235FD8A58()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_235FD8A64()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235FD8A70()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_235FD8A7C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_235FD8A88()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235FD8A94()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235FD8AA0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235FD8AAC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t APSSettingsGetCString()
{
  return MEMORY[0x24BE03638]();
}

uint64_t APSSettingsRemoveValue()
{
  return MEMORY[0x24BE03670]();
}

uint64_t APSSettingsSetCString()
{
  return MEMORY[0x24BE03678]();
}

uint64_t APSSettingsSetValue()
{
  return MEMORY[0x24BE03688]();
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x24BDB1C68]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

uint64_t FigContinuityCaptureGetUserPreferenceDisabled()
{
  return MEMORY[0x24BE103C8]();
}

uint64_t FigContinuityCaptureSetUserPreferenceDisabled()
{
  return MEMORY[0x24BE103D0]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

