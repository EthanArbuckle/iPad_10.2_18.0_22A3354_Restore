id sub_100003D3C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeAppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *ObjCClassFromMetadata;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for ChargeAppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for ChargeAppDelegate()
{
  return objc_opt_self(_TtC6Charge17ChargeAppDelegate);
}

uint64_t variable initialization expression of ConfigurationIntentResponse.code()
{
  return 0;
}

uint64_t initializeBufferWithCopyOfBuffer for ChargeBarChart(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 initializeWithTake for ChargeView(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003E5C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100003E7C(uint64_t result, int a2, int a3)
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
  sub_10000445C(a1, &qword_100026920, (uint64_t)&unk_100020F08);
}

__n128 initializeWithTake for ChargeChart(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003EC8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100003EE8(uint64_t result, int a2, int a3)
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
  sub_10000445C(a1, &qword_100026928, (uint64_t)&unk_100020F90);
}

uint64_t sub_100003F24(uint64_t a1, uint64_t a2)
{
  return sub_100004080(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003F44(uint64_t a1, uint64_t a2)
{
  return sub_100004080(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003F50(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100003FC4(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100004040@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_100004080(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_1000040BC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000040FC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10000416C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004198(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_10000445C(a1, &qword_100026938, (uint64_t)&unk_100020FB8);
}

uint64_t sub_100004238(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000042E8(&qword_100026930, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100019DF4);
  v3 = sub_1000042E8(&qword_100026958, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100019D48);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000042BC()
{
  return sub_1000042E8(&qword_100026940, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100019D0C);
}

uint64_t sub_1000042E8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004328()
{
  return sub_1000042E8(&qword_100026948, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100019CE0);
}

uint64_t sub_100004354()
{
  return sub_1000042E8(&qword_100026950, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100019D7C);
}

uint64_t sub_100004380@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000043C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000042E8(&qword_100026980, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100019F80);
  v3 = sub_1000042E8(&qword_100026988, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100019ED4);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_10000445C(a1, &qword_100026960, (uint64_t)&unk_100020FE0);
}

void sub_10000445C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_1000044A0()
{
  return sub_1000042E8(&qword_100026968, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100019E98);
}

uint64_t sub_1000044CC()
{
  return sub_1000042E8(&qword_100026970, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100019E6C);
}

uint64_t sub_1000044F8()
{
  return sub_1000042E8(&qword_100026978, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100019F08);
}

_QWORD *initializeBufferWithCopyOfBuffer for ChargeChart(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for ChargeChart(uint64_t a1)
{

}

_QWORD *assignWithCopy for ChargeChart(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

_QWORD *assignWithTake for ChargeChart(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeChart(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ChargeChart(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ChargeChart()
{
  return &type metadata for ChargeChart;
}

uint64_t sub_100004660(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001AEB8, 1);
}

_QWORD *sub_100004670@<X0>(char *a1@<X1>, uint64_t a2@<X8>)
{
  char *v4;
  void *v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
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
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char v41;
  _QWORD *result;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  char v63[24];

  v4 = &a1[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess(&a1[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable], v63, 0, 0);
  v5 = (void *)*((_QWORD *)v4 + 1);
  v6 = a1;
  v7 = v5;
  v8 = (void *)dispatch thunk of CAFCarObservable.highVoltageBattery.getter();

  if (!v8)
    goto LABEL_8;
  v9 = objc_msgSend(v8, "batteryLevel");

  if (!v9)
  {
LABEL_9:
    v46 = type metadata accessor for LayoutConfiguration(0);
    v47 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    v54 = EnvironmentObject.init()(v46, v47);
    v55 = v48;
    v56 = 0u;
    v57 = 0u;
    v58 = 1;
    v49 = sub_100004A60();
    v50 = sub_100004AA4();
    result = _ConditionalContent<>.init(storage:)(&v59, &v54, &type metadata for ChargeBarChart, &type metadata for NotChargingView, v49, v50);
    v45 = v59;
    v43 = v60;
    v44 = v61;
    v41 = v62;
    goto LABEL_10;
  }
  v10 = (void *)*((_QWORD *)v4 + 1);
  v6 = v6;
  v11 = v10;
  v12 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (!v12)
  {

LABEL_8:
    goto LABEL_9;
  }
  v13 = objc_msgSend(v12, "chargingTime");

  if (!v13)
  {
    v6 = (char *)v9;
    goto LABEL_8;
  }
  v14 = sub_100007D84(0, &qword_100026A08, CAFBatteryLevel_ptr);
  v15 = sub_100004AE8(&qword_100026A10, &qword_100026A08, CAFBatteryLevel_ptr, (uint64_t)&protocol conformance descriptor for CAFBatteryLevel);
  v16 = CAFObserved<>.observable.getter(v14, v15);
  v17 = sub_100007D84(0, &qword_100026A18, CAFChargingTime_ptr);
  v18 = sub_100004AE8(&qword_100026A20, &qword_100026A18, CAFChargingTime_ptr, (uint64_t)&protocol conformance descriptor for CAFChargingTime);
  v19 = CAFObserved<>.observable.getter(v17, v18);
  v20 = type metadata accessor for LayoutConfiguration(0);
  v21 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
  v22 = EnvironmentObject.init()(v20, v21);
  v24 = v23;
  v25 = type metadata accessor for CAFBatteryLevelObservable(0);
  v26 = sub_1000042E8(&qword_100026A28, (uint64_t (*)(uint64_t))&type metadata accessor for CAFBatteryLevelObservable, (uint64_t)&protocol conformance descriptor for CAFBatteryLevelObservable);
  v27 = ObservedObject.init(wrappedValue:)(v16, v25, v26);
  v29 = v28;
  v30 = type metadata accessor for CAFChargingTimeObservable(0);
  v31 = sub_1000042E8(&qword_100026A30, (uint64_t (*)(uint64_t))&type metadata accessor for CAFChargingTimeObservable, (uint64_t)&protocol conformance descriptor for CAFChargingTimeObservable);
  v32 = ObservedObject.init(wrappedValue:)(v19, v30, v31);
  v34 = v33;
  v54 = v27;
  v55 = v29;
  *(_QWORD *)&v56 = v32;
  *((_QWORD *)&v56 + 1) = v33;
  *(_QWORD *)&v57 = v22;
  *((_QWORD *)&v57 + 1) = v24;
  v58 = 0;
  v35 = sub_100004A60();
  v36 = sub_100004AA4();
  v37 = v29;
  v38 = v34;
  swift_retain_n(v22, 2);
  v39 = v37;
  v40 = v38;
  _ConditionalContent<>.init(storage:)(&v59, &v54, &type metadata for ChargeBarChart, &type metadata for NotChargingView, v35, v36);
  swift_release(v22);

  v52 = v60;
  v53 = v59;
  v51 = v61;
  v41 = v62;
  result = (_QWORD *)swift_release(v22);
  v44 = v51;
  v43 = v52;
  v45 = v53;
LABEL_10:
  *(_OWORD *)a2 = v45;
  *(_OWORD *)(a2 + 16) = v43;
  *(_OWORD *)(a2 + 32) = v44;
  *(_BYTE *)(a2 + 48) = v41;
  return result;
}

uint64_t sub_100004A40()
{
  return static View._viewListCount(inputs:)();
}

_QWORD *sub_100004A58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100004670(*(char **)(v1 + 8), a1);
}

unint64_t sub_100004A60()
{
  unint64_t result;

  result = qword_1000269F8;
  if (!qword_1000269F8)
  {
    result = swift_getWitnessTable("Qq", &type metadata for ChargeBarChart);
    atomic_store(result, (unint64_t *)&qword_1000269F8);
  }
  return result;
}

unint64_t sub_100004AA4()
{
  unint64_t result;

  result = qword_100026A00;
  if (!qword_100026A00)
  {
    result = swift_getWitnessTable("1o", &type metadata for NotChargingView);
    atomic_store(result, (unint64_t *)&qword_100026A00);
  }
  return result;
}

uint64_t sub_100004AE8(unint64_t *a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_100007D84(255, a2, a3);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for ChargeBarChart(uint64_t a1)
{

  return swift_release(*(_QWORD *)(a1 + 32));
}

_QWORD *initializeWithCopy for ChargeBarChart(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v6 = a2[4];
  v5 = a2[5];
  a1[4] = v6;
  a1[5] = v5;
  v7 = v3;
  v8 = v4;
  swift_retain(v6);
  return a1;
}

_QWORD *assignWithCopy for ChargeBarChart(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  a1[2] = a2[2];
  v7 = (void *)a2[3];
  v8 = (void *)a1[3];
  a1[3] = v7;
  v9 = v7;

  v10 = a1[4];
  v11 = a2[4];
  a1[4] = v11;
  swift_retain(v11);
  swift_release(v10);
  a1[5] = a2[5];
  return a1;
}

__n128 initializeWithTake for ChargeBarChart(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ChargeBarChart(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v6);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeBarChart(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeBarChart(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeBarChart()
{
  return &type metadata for ChargeBarChart;
}

unint64_t sub_100004D44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026A38;
  if (!qword_100026A38)
  {
    v1 = sub_100004DB0(&qword_100026A40);
    sub_100004A60();
    sub_100004AA4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026A38);
  }
  return result;
}

uint64_t sub_100004DB0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004DF4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001AEE0, 1);
}

uint64_t sub_100004E04@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t OpaqueTypeConformance2;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _UNKNOWN **v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  uint64_t v67;
  double v68;
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
  unsigned __int8 v79;
  unsigned __int8 v80;
  unsigned __int8 v81;
  char v82;
  char v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  _OWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t result;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  int v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  _QWORD v126[3];
  char v127;
  char v128;
  char v129;
  unsigned __int8 v130;
  unsigned __int8 v131;
  unsigned __int8 v132;
  unsigned __int8 v133;
  unsigned __int8 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  _UNKNOWN **v151;
  double v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char v156;
  uint64_t v157;
  char v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  char v162;
  uint64_t v163;
  char v164;
  uint64_t v165;
  char v166;
  uint64_t v167;
  char v168;
  uint64_t v169;
  uint64_t v170;
  __int128 v171;
  uint64_t v172;
  unsigned __int8 v173;
  uint64_t v174;
  unsigned __int8 v175;
  uint64_t v176;
  unsigned __int8 v177;
  uint64_t v178;
  char v179;
  uint64_t v180;
  char v181;
  uint64_t v182;
  char v183;
  uint64_t v184;
  uint64_t v185;

  v120 = a1;
  v117 = a2;
  v3 = sub_100007984(&qword_100026A50);
  __chkstk_darwin(v3);
  v5 = (char *)&v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100007984(&qword_100026A58);
  v116 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = sub_100007984(&qword_100026A60);
  v121 = *(_QWORD *)(v119 - 8);
  __chkstk_darwin(v119);
  v10 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007984(&qword_100026A68);
  v122 = *(_QWORD *)(v11 - 8);
  v123 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_100007984(&qword_100026A70);
  __chkstk_darwin(v118);
  v15 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v124 = (uint64_t)&v106 - v17;
  v126[2] = a1;
  v18 = sub_100007984(&qword_100026A78);
  v19 = sub_1000079CC();
  Chart.init(content:)(sub_1000079C4, v126, v18, v19);
  v171 = xmmword_100019FD0;
  v20 = type metadata accessor for ScaleType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v5, 1, 1, v20);
  v21 = sub_100007984(&qword_100026A98);
  v22 = sub_10000812C(&qword_100026AA0, &qword_100026A58, (uint64_t)&protocol conformance descriptor for Chart<A>);
  v23 = sub_100007B14();
  View.chartYScale<A>(domain:type:)(&v171, v5, v6, v21, v22, v23);
  sub_100007CE4((uint64_t)v5, &qword_100026A50);
  (*(void (**)(char *, uint64_t))(v116 + 8))(v8, v6);
  v24 = sub_100007984(&qword_100026AB0);
  v147 = v6;
  v148 = v21;
  v149 = v22;
  v150 = v23;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v147, &opaque type descriptor for <<opaque return type of View.chartYScale<A>(domain:type:)>>, 1);
  v26 = sub_10000812C(&qword_100026AB8, &qword_100026AB0, (uint64_t)&protocol conformance descriptor for AxisMarks<A>);
  v27 = v119;
  View.chartYAxis<A>(content:)(sub_100006F30, 0, v119, v24, OpaqueTypeConformance2, v26);
  v28 = (*(uint64_t (**)(char *, uint64_t))(v121 + 8))(v10, v27);
  LOBYTE(v8) = static Edge.Set.all.getter(v28);
  v29 = EdgeInsets.init(_all:)(30.0);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v122;
  v36 = v123;
  (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v15, v13, v123);
  v38 = &v15[*(int *)(v118 + 36)];
  *v38 = (char)v8;
  *((double *)v38 + 1) = v29;
  *((_QWORD *)v38 + 2) = v31;
  *((_QWORD *)v38 + 3) = v33;
  *((_QWORD *)v38 + 4) = v35;
  v38[40] = 0;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v36);
  v125 = v15;
  v39 = v124;
  sub_100007B70((uint64_t)v15, v124);
  v40 = v120;
  v41 = (void *)sub_100005600();
  v42 = objc_msgSend(v41, "string");

  v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
  v45 = v44;

  v147 = v43;
  v148 = v45;
  v46 = sub_100007BB8();
  v47 = Text.init<A>(_:)(&v147, &type metadata for String, v46);
  v51 = v40;
  v52 = *(_QWORD *)(v40 + 32);
  if (v52)
  {
    v53 = v47;
    v54 = v48;
    v55 = v49;
    v56 = v50;
    if (*(_BYTE *)(v52 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(v52 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v52);
        v57 = sub_1000082C8();
        v58 = type metadata accessor for ClusterMetrics();
        v59 = v58;
        v60 = &off_1000215D8;
      }
      else
      {
        swift_retain(v52);
        v57 = sub_1000082E4();
        v58 = type metadata accessor for WidgetMetrics();
        v59 = v58;
        v60 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v52);
      v57 = sub_1000082AC();
      v58 = type metadata accessor for ConsoleMetrics();
      v59 = v58;
      v60 = &off_100021638;
    }
    v150 = v58;
    v151 = v60;
    swift_release(v52);
    v147 = v57;
    v61 = v55 & 1;
    sub_100007BFC(&v147, v59);
    v62 = ((uint64_t (__cdecl *)())v60[3])();
    v116 = Text.font(_:)(v62, v53, v54, v61, v56);
    v120 = v64;
    v121 = v63;
    v66 = v65;
    sub_100007C20(v53, v54, v61);
    swift_release(v62);
    swift_bridgeObjectRelease(v56);
    v67 = sub_100007C30(&v147);
    LODWORD(v119) = static Edge.Set.all.getter(v67);
    v68 = EdgeInsets.init(_all:)(30.0);
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v76 = static Alignment.center.getter(v75);
    _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(&v172, 0x4069000000000000, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, v76, v77);
    v118 = v172;
    v111 = v176;
    v112 = v174;
    v110 = v178;
    v108 = v182;
    v109 = v180;
    v122 = v185;
    v123 = v184;
    v134 = v66 & 1;
    v133 = 0;
    v132 = v173;
    v131 = v175;
    v130 = v177;
    v129 = v179;
    v128 = v181;
    v127 = v183;
    v78 = (uint64_t)v125;
    sub_100007C50(v39, (uint64_t)v125);
    LOBYTE(v62) = v134;
    v79 = v133;
    v106 = v134;
    v107 = v133;
    v80 = v132;
    LOBYTE(v61) = v131;
    v113 = v132;
    v114 = v131;
    v81 = v130;
    v115 = v130;
    v82 = v129;
    v83 = v128;
    v84 = v127;
    v85 = v78;
    v86 = v117;
    sub_100007C50(v85, v117);
    v87 = (_OWORD *)(v86 + *(int *)(sub_100007984(&qword_100026AC8) + 48));
    v88 = v116;
    *(_QWORD *)&v135 = v116;
    *((_QWORD *)&v135 + 1) = v121;
    LOBYTE(v136) = v62;
    *((_QWORD *)&v136 + 1) = v120;
    LOBYTE(v137) = v119;
    *((double *)&v137 + 1) = v68;
    *(_QWORD *)&v138 = v70;
    *((_QWORD *)&v138 + 1) = v72;
    *(_QWORD *)&v139 = v74;
    BYTE8(v139) = v79;
    *(_QWORD *)&v140 = v118;
    BYTE8(v140) = v80;
    v90 = v111;
    v89 = v112;
    *(_QWORD *)&v141 = v112;
    BYTE8(v141) = v61;
    *(_QWORD *)&v142 = v111;
    BYTE8(v142) = v81;
    v91 = v109;
    v92 = v110;
    *(_QWORD *)&v143 = v110;
    BYTE8(v143) = v82;
    *(_QWORD *)&v144 = v109;
    BYTE8(v144) = v83;
    v93 = v108;
    *(_QWORD *)&v145 = v108;
    BYTE8(v145) = v84;
    *(_QWORD *)&v146 = v123;
    *((_QWORD *)&v146 + 1) = v122;
    v94 = v140;
    v95 = v142;
    v96 = v143;
    v87[6] = v141;
    v87[7] = v95;
    v97 = v138;
    v87[4] = v139;
    v87[5] = v94;
    v98 = v135;
    v99 = v136;
    v87[2] = v137;
    v87[3] = v97;
    *v87 = v98;
    v87[1] = v99;
    v100 = v144;
    v101 = v146;
    v87[10] = v145;
    v87[11] = v101;
    v87[8] = v96;
    v87[9] = v100;
    sub_100007C98((uint64_t)&v135);
    sub_100007CE4(v124, &qword_100026A70);
    v147 = v88;
    v148 = v121;
    LOBYTE(v149) = v106;
    v150 = v120;
    LOBYTE(v151) = v119;
    v152 = v68;
    v153 = v70;
    v154 = v72;
    v155 = v74;
    v156 = v107;
    v157 = v118;
    v158 = v113;
    v159 = v89;
    v160 = v114;
    v161 = v90;
    v162 = v115;
    v163 = v92;
    v164 = v82;
    v165 = v91;
    v166 = v83;
    v167 = v93;
    v168 = v84;
    v169 = v123;
    v170 = v122;
    sub_100007D20((uint64_t)&v147);
    return sub_100007CE4((uint64_t)v125, &qword_100026A70);
  }
  else
  {
    v103 = *(_QWORD *)(v51 + 40);
    v104 = type metadata accessor for LayoutConfiguration(0);
    v105 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v103, v104, v105);
    __break(1u);
  }
  return result;
}

uint64_t sub_100005600()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t inited;
  NSAttributedStringKey v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  NSString *v21;
  NSString *v22;
  void *v23;
  id v24;
  id v25;
  Swift::String v26;
  Swift::String_optional v27;
  Swift::String v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD *v32;
  id v33;
  NSString v34;
  uint64_t v35;
  uint64_t v36;
  Class isa;
  id v38;
  id v39;
  NSString v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  id v49;
  NSString v50;
  Class v51;
  id v52;
  id v53;
  NSString v54;
  id v55;
  id v56;
  Swift::String v57;
  Swift::String_optional v58;
  Swift::String v59;
  Swift::String v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD *v63;
  NSString v64;
  Class v65;
  NSString *v66;
  id v67;
  NSString v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  _OWORD *v80;
  id v81;
  NSString v82;
  Class v83;
  id v84;
  uint64_t result;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSString *v89;
  uint64_t v90;
  id v91;
  __int128 *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  uint64_t v103;
  _UNKNOWN **v104;
  char v105[48];
  __int128 v106;
  Swift::String v107;
  Swift::String v108;

  v1 = v0;
  v2 = sub_100007984(&qword_100026AD0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_100007984(&qword_100026AD8);
  v6 = *(_QWORD *)(v101 - 8);
  __chkstk_darwin();
  v8 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(objc_allocWithZone((Class)NSMutableAttributedString), "init");
  v10 = sub_100007984(&qword_100026AE0);
  inited = swift_initStackObject(v10, v105);
  *(_OWORD *)(inited + 16) = xmmword_100019FE0;
  v12 = NSFontAttributeName;
  *(_QWORD *)(inited + 32) = NSFontAttributeName;
  v13 = *((_QWORD *)v0 + 4);
  if (v13)
  {
    v14 = inited;
    v15 = *(unsigned __int8 *)(v13 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    v97 = v6;
    v95 = v2;
    v94 = v3;
    v93 = v5;
    if (v15)
    {
      if (v15 == 1)
      {
        v16 = NSFontAttributeName;
        swift_retain(v13);
        v17 = sub_1000082C8();
        v18 = type metadata accessor for ClusterMetrics();
        v19 = v18;
        v20 = &off_1000215D8;
      }
      else
      {
        v22 = NSFontAttributeName;
        swift_retain(v13);
        v17 = sub_1000082E4();
        v18 = type metadata accessor for WidgetMetrics();
        v19 = v18;
        v20 = &off_100021578;
      }
    }
    else
    {
      v21 = NSFontAttributeName;
      swift_retain(v13);
      v17 = sub_1000082AC();
      v18 = type metadata accessor for ConsoleMetrics();
      v19 = v18;
      v20 = &off_100021638;
    }
    v103 = v18;
    v104 = v20;
    swift_release(v13);
    *(_QWORD *)&v102 = v17;
    sub_100007BFC(&v102, v19);
    *(_QWORD *)(v14 + 40) = ((uint64_t (__cdecl *)())v20[3])();
    sub_100007C30(&v102);
    v23 = (void *)sub_100007480(v14);
    v92 = (__int128 *)v1;
    v102 = *((_OWORD *)v1 + 1);
    v24 = *((id *)&v102 + 1);
    dispatch thunk of CAFChargingTimeObservable.remainingTime.getter();
    sub_100007D5C((uint64_t)&v102);
    v98 = (id)objc_opt_self(NSBundle);
    v25 = objc_msgSend(v98, "mainBundle");
    v107._object = (void *)0xE000000000000000;
    v26._countAndFlagsBits = 0x4D45525F454D4954;
    v26._object = (void *)0xEE00474E494E4941;
    v27.value._countAndFlagsBits = 0x656772616843;
    v27.value._object = (void *)0xE600000000000000;
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    v107._countAndFlagsBits = 0;
    v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v26, v27, (NSBundle)v25, v28, v107);

    String.init(format:_:)(v29._countAndFlagsBits, v29._object, &_swiftEmptyArrayStorage);
    v31 = v30;
    swift_bridgeObjectRelease(v29._object);
    v32 = sub_100007588((uint64_t)v23);
    v33 = objc_allocWithZone((Class)NSAttributedString);
    v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v31);
    type metadata accessor for Key(0);
    v36 = v35;
    v99 = sub_1000042E8(&qword_100026980, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100019F80);
    v100 = v36;
    v1 = (char *)&type metadata for Any + 8;
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v32);
    v38 = objc_msgSend(v33, "initWithString:attributes:", v34, isa);

    objc_msgSend(v9, "appendAttributedString:", v38);
    v12 = (NSAttributedStringKey)&_s10CAFCombine11CAFObservedPAASo18CAFObservableCacheRz10ObservableAC_8ObservedQZRszrlE10observableAeCQzvg_ptr;
    v39 = objc_allocWithZone((Class)NSAttributedString);
    v40 = String._bridgeToObjectiveC()();
    v41 = objc_msgSend(v39, "initWithString:", v40);

    objc_msgSend(v9, "appendAttributedString:", v41);
    v42 = objc_msgSend(objc_allocWithZone((Class)NSDateComponentsFormatter), "init");
    objc_msgSend(v42, "setUnitsStyle:", 1);
    v96 = v8;
    Measurement.value.getter(v101);
    v91 = v42;
    v43 = objc_msgSend(v42, "stringFromTimeInterval:");
    if (v43)
    {
      v44 = v43;
      v45 = v9;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
      v47 = v46;

      v48 = sub_100007588((uint64_t)v23);
      v49 = objc_allocWithZone((Class)NSAttributedString);
      v50 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v47);
      v51 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v48);
      v52 = objc_msgSend(v49, "initWithString:attributes:", v50, v51);

      objc_msgSend(v9, "appendAttributedString:", v52);
      v53 = objc_allocWithZone((Class)NSAttributedString);
      v54 = String._bridgeToObjectiveC()();
      v55 = objc_msgSend(v53, "initWithString:", v54);

      objc_msgSend(v9, "appendAttributedString:", v55);
      v56 = objc_msgSend(v98, "mainBundle");
      v108._object = (void *)0xE000000000000000;
      v57._countAndFlagsBits = 0x5F59524554544142;
      v57._object = (void *)0xED00004C4556454CLL;
      v58.value._countAndFlagsBits = 0x656772616843;
      v58.value._object = (void *)0xE600000000000000;
      v59._countAndFlagsBits = 0;
      v59._object = (void *)0xE000000000000000;
      v108._countAndFlagsBits = 0;
      v60 = NSLocalizedString(_:tableName:bundle:value:comment:)(v57, v58, (NSBundle)v56, v59, v108);

      String.init(format:_:)(v60._countAndFlagsBits, v60._object, &_swiftEmptyArrayStorage);
      v62 = v61;
      swift_bridgeObjectRelease(v60._object);
      v98 = v23;
      v63 = sub_100007588((uint64_t)v23);
      v12 = (NSAttributedStringKey)objc_allocWithZone((Class)NSAttributedString);
      v64 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v62);
      v65 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v63);
      v66 = -[NSString initWithString:attributes:](v12, "initWithString:attributes:", v64, v65);

      objc_msgSend(v9, "appendAttributedString:", v66);
      v67 = objc_allocWithZone((Class)NSAttributedString);
      v68 = String._bridgeToObjectiveC()();
      v69 = objc_msgSend(v67, "initWithString:", v68);

      objc_msgSend(v9, "appendAttributedString:", v69);
      v70 = objc_msgSend(objc_allocWithZone((Class)NSMeasurementFormatter), "init");
      v71 = objc_msgSend(v70, "numberFormatter");
      if (v71)
      {
        v72 = v71;
        v106 = *v92;
        v73 = (void *)*((_QWORD *)&v106 + 1);
        objc_msgSend(v71, "setMaximumFractionDigits:", 1);

        objc_msgSend(v70, "setUnitOptions:", 1);
        v74 = v73;
        v75 = v93;
        dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
        sub_100007D5C((uint64_t)&v106);
        v76 = sub_100007D84(0, &qword_100026AE8, CAFUnitPercent_ptr);
        NSMeasurementFormatter.string<A>(from:)(v75, v76);
        v78 = v77;

        (*(void (**)(char *, uint64_t))(v94 + 8))(v75, v95);
        v79 = v98;
        v80 = sub_100007588((uint64_t)v98);
        swift_bridgeObjectRelease(v79);
        v81 = objc_allocWithZone((Class)NSAttributedString);
        v82 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v78);
        v83 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v80);
        v84 = objc_msgSend(v81, "initWithString:attributes:", v82, v83);

        objc_msgSend(v45, "appendAttributedString:", v84);
        (*(void (**)(char *, uint64_t))(v97 + 8))(v96, v101);
        return (uint64_t)v45;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  v86 = *((_QWORD *)v1 + 5);
  v87 = type metadata accessor for LayoutConfiguration(0);
  v88 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
  v89 = v12;
  result = EnvironmentObject.error()(0, v86, v87, v88);
  __break(1u);
  return result;
}

uint64_t sub_100005EC4@<X0>(void (*a1)(char *, char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  __n128 v2;
  uint64_t v3;
  __n128 v4;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  Swift::String v40;
  Swift::String_optional v41;
  Swift::String v42;
  Swift::String v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  double v48;
  void (*v49)(char *, uint64_t);
  unint64_t v50;
  id v51;
  double v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  id v69;
  double v70;
  id v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  double v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t OpaqueTypeConformance2;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  void (*v95)(char *, char *, uint64_t);
  char *v96;
  uint64_t v97;
  void (*v98)(char *, char *, uint64_t);
  char *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t);
  void (*v105)(char *, uint64_t);
  _QWORD v107[2];
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  char *v136;
  void (*v137)(char *, char *, uint64_t);
  uint64_t (*v138)(char *, uint64_t);
  char *v139;
  _QWORD *v140;
  double v141;
  void *v142;
  void *v143;
  void *v144;
  double v145;
  uint64_t v146;
  __int128 v147;
  Swift::String v148;

  v137 = a1;
  v133 = a2;
  v132 = sub_100007984(&qword_100026B30);
  v2 = __chkstk_darwin(v132);
  v131 = (char *)&v108 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = type metadata accessor for AnnotationPosition(0, v2);
  v127 = *(_QWORD *)(v129 - 8);
  v4 = __chkstk_darwin(v129);
  v126 = (char *)&v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = type metadata accessor for RuleMark(0, v4);
  v109 = *(_QWORD *)(v110 - 8);
  __chkstk_darwin(v110);
  v117 = (char *)&v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_100007984(&qword_100026A90);
  v112 = *(_QWORD *)(v120 - 8);
  __chkstk_darwin(v120);
  v111 = (char *)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = sub_100007984(&qword_100026A88);
  v122 = *(_QWORD *)(v123 - 8);
  __chkstk_darwin(v123);
  v121 = (char *)&v108 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = sub_100007984(&qword_100026B38);
  v125 = *(_QWORD *)(v130 - 8);
  __chkstk_darwin(v130);
  v128 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v119 = (char *)&v108 - v11;
  __chkstk_darwin(v12);
  v124 = (char *)&v108 - v13;
  v14 = sub_100007984(&qword_100026AD0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v134 = (char *)&v108 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v136 = (char *)&v108 - v18;
  __chkstk_darwin(v19);
  v21 = (char *)&v108 - v20;
  __chkstk_darwin(v22);
  v24 = (char *)&v108 - v23;
  v25 = sub_100007984(&qword_100026B40);
  __chkstk_darwin(v25);
  v116 = (char *)&v108 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __chkstk_darwin(v27);
  v30 = (char *)&v108 - v29;
  v115 = (_QWORD *)type metadata accessor for BarMark(0, v28);
  v114 = *(v115 - 1);
  __chkstk_darwin(v115);
  v32 = (char *)&v108 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = sub_100007984(&qword_100026B48);
  v140 = *(_QWORD **)(v135 - 8);
  __chkstk_darwin(v135);
  v118 = (char *)&v108 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  v36 = (char *)&v108 - v35;
  __chkstk_darwin(v37);
  v139 = (char *)&v108 - v38;
  v39 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v148._object = (void *)0xE000000000000000;
  v40._countAndFlagsBits = 0x5F59524554544142;
  v40._object = (void *)0xED00004C4556454CLL;
  v41.value._countAndFlagsBits = 0x656772616843;
  v41.value._object = (void *)0xE600000000000000;
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  v148._countAndFlagsBits = 0;
  v43 = NSLocalizedString(_:tableName:bundle:value:comment:)(v40, v41, (NSBundle)v39, v42, v148);

  *(double *)&v44 = COERCE_DOUBLE(String.init(format:_:)(v43._countAndFlagsBits, v43._object, &_swiftEmptyArrayStorage));
  v46 = v45;
  swift_bridgeObjectRelease(v43._object);
  v145 = *(double *)&v44;
  v146 = v46;
  v147 = *(_OWORD *)v137;
  v47 = *((id *)&v147 + 1);
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100007D5C((uint64_t)&v147);
  v48 = Measurement.value.getter(v14);
  v49 = *(void (**)(char *, uint64_t))(v15 + 8);
  v49(v24, v14);
  v141 = v48;
  v50 = sub_100007BB8();
  static PlottableValue.value<A>(_:_:)(&v145, &v141, &type metadata for Double, &type metadata for String, &protocol witness table for Double, v50);
  swift_bridgeObjectRelease(v146);
  BarMark.init<A>(xStart:xEnd:y:height:stacking:)(0, 1, 0, 1, v30, 0, 3, 0, &type metadata for Double, &protocol witness table for Double);
  v51 = v47;
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100007D5C((uint64_t)&v147);
  v52 = Measurement.value.getter(v14);
  v53 = v21;
  v54 = v14;
  v138 = (uint64_t (*)(char *, uint64_t))v49;
  v55 = ((uint64_t (*)(char *, uint64_t))v49)(v53, v14);
  if (v52 < 0.0 || v52 >= 25.0)
  {
    if (v52 < 25.0 || v52 >= 75.0)
      *(double *)&v56 = COERCE_DOUBLE(static Color.green.getter(v55));
    else
      *(double *)&v56 = COERCE_DOUBLE(static Color.yellow.getter(v55));
  }
  else
  {
    *(double *)&v56 = COERCE_DOUBLE(static Color.red.getter(v55));
  }
  v57 = v56;
  v145 = *(double *)&v56;
  v58 = v115;
  ChartContent.foregroundStyle<A>(_:)(&v145, v115, &type metadata for Color, &protocol witness table for BarMark, &protocol witness table for Color);
  swift_release(v57);
  (*(void (**)(char *, _QWORD *))(v114 + 8))(v32, v58);
  v115 = (_QWORD *)v140[4];
  ((void (*)(char *, char *, uint64_t))v115)(v139, v36, v135);
  v59 = v51;
  dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
  sub_100007D5C((uint64_t)&v147);
  v60 = LocalizedStringKey.init(stringLiteral:)(0x4C5F454752414843, 0xEC00000054494D49);
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v145 = Measurement.value.getter(v54);
  v67 = v116;
  static PlottableValue.value(_:_:)(v60, v62, v64 & 1, v66, &v145, &type metadata for Double, &protocol witness table for Double);
  swift_bridgeObjectRelease(v66);
  swift_bridgeObjectRelease(v62);
  v68 = v117;
  RuleMark.init<A>(xStart:xEnd:y:)(0, 1, 0, 1, v67, &type metadata for Double, &protocol witness table for Double);
  v69 = v59;
  dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
  sub_100007D5C((uint64_t)&v147);
  v70 = Measurement.value.getter(v54) + 10.0;
  v71 = v69;
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100007D5C((uint64_t)&v147);
  v72 = Measurement.value.getter(v54);
  v73 = v138(v24, v54);
  if (v72 >= v70)
  {
    v75 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    v74 = Color.init(_:)(v75);
  }
  else
  {
    v74 = static Color.primary.getter(v73);
  }
  v76 = *(double *)&v74;
  v77 = v112;
  v78 = v111;
  v79 = v110;
  v80 = v109;
  v113 = v54;
  v138(v134, v54);
  v145 = v76;
  ChartContent.foregroundStyle<A>(_:)(&v145, v79, &type metadata for Color, &protocol witness table for RuleMark, &protocol witness table for Color);
  swift_release(*(_QWORD *)&v76);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v68, v79);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(&v145, 0, 0, &off_100020D48, 2.0, 10.0, 0.0);
  v141 = *(double *)&v79;
  v142 = &type metadata for Color;
  v143 = &protocol witness table for RuleMark;
  v144 = &protocol witness table for Color;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v141, &opaque type descriptor for <<opaque return type of ChartContent.foregroundStyle<A>(_:)>>, 1);
  v82 = v121;
  v83 = v120;
  ChartContent.lineStyle(_:)(&v145, v120, OpaqueTypeConformance2);
  sub_10000808C((uint64_t)&v145);
  v84 = (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v78, v83);
  v85 = v126;
  v86 = static AnnotationPosition.top.getter(v84);
  v87 = static Alignment.center.getter(v86);
  v89 = v88;
  __chkstk_darwin(v87);
  v141 = *(double *)&v83;
  v142 = (void *)OpaqueTypeConformance2;
  v148._object = &protocol witness table for Text;
  v107[0] = &type metadata for Text;
  v107[1] = swift_getOpaqueTypeConformance2(&v141, &opaque type descriptor for <<opaque return type of ChartContent.lineStyle(_:)>>, 1);
  v90 = v119;
  v91 = v123;
  ((void (*)(char *, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t (*)@<X0>(uint64_t@<X8>), _QWORD *, uint64_t))ChartContent.annotation<A>(position:alignment:spacing:content:))(v85, v87, v89, 0, 1, sub_1000080B4, v107, v123);
  (*(void (**)(char *, uint64_t))(v127 + 8))(v85, v129);
  (*(void (**)(char *, uint64_t))(v122 + 8))(v82, v91);
  v92 = v125;
  v137 = *(void (**)(char *, char *, uint64_t))(v125 + 32);
  v93 = v124;
  v94 = v130;
  v137(v124, v90, v130);
  v95 = (void (*)(char *, char *, uint64_t))v140[2];
  v96 = v118;
  v97 = v135;
  v95(v118, v139, v135);
  v98 = *(void (**)(char *, char *, uint64_t))(v92 + 16);
  v99 = v128;
  v98(v128, v93, v94);
  v100 = v131;
  v95(v131, v96, v97);
  v101 = v132;
  v102 = &v100[*(int *)(v132 + 48)];
  v98(v102, v99, v94);
  v103 = v133;
  ((void (*)(uint64_t, char *, uint64_t))v115)(v133, v100, v97);
  v137((char *)(v103 + *(int *)(v101 + 48)), v102, v94);
  v104 = *(void (**)(char *, uint64_t))(v92 + 8);
  v104(v93, v94);
  v138(v136, v113);
  v105 = (void (*)(char *, uint64_t))v140[1];
  v105(v139, v97);
  v104(v99, v94);
  return ((uint64_t (*)(char *, uint64_t))v105)(v96, v97);
}

uint64_t sub_100006A00@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  Swift::String v20;
  Swift::String_optional v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _UNKNOWN **v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char *v52;
  uint64_t v53;
  double v54;
  id v55;
  double v56;
  char *v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t result;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  char *v79;
  uint64_t v80;
  _QWORD v81[5];
  __int128 v82;
  Swift::String v83;

  v80 = a2;
  v3 = sub_100007984(&qword_100026AD0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v79 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v76 - v7;
  v9 = sub_100007984(&qword_100026B50);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100019FE0;
  v11 = objc_msgSend(objc_allocWithZone((Class)NSMeasurementFormatter), "init");
  v12 = objc_msgSend(v11, "numberFormatter");
  if (!v12)
  {
    __break(1u);
    goto LABEL_13;
  }
  v13 = v12;
  v82 = *a1;
  v14 = (void *)*((_QWORD *)&v82 + 1);
  objc_msgSend(v12, "setMaximumFractionDigits:", 1);

  objc_msgSend(v11, "setUnitOptions:", 1);
  v76 = v14;
  dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
  sub_100007D5C((uint64_t)&v82);
  v15 = sub_100007D84(0, &qword_100026AE8, CAFUnitPercent_ptr);
  v16 = NSMeasurementFormatter.string<A>(from:)(v8, v15);
  v18 = v17;

  v77 = *(void (**)(char *, uint64_t))(v4 + 8);
  v78 = v3;
  v77(v8, v3);
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  *(_QWORD *)(v10 + 64) = sub_1000080BC();
  *(_QWORD *)(v10 + 32) = v16;
  *(_QWORD *)(v10 + 40) = v18;
  v19 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v83._object = (void *)0x80000001000179B0;
  v20._countAndFlagsBits = 0x4C5F454752414843;
  v20._object = (void *)0xEF40255F54494D49;
  v21.value._countAndFlagsBits = 0x656772616843;
  v21.value._object = (void *)0xE600000000000000;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v83._countAndFlagsBits = 0xD000000000000046;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v20, v21, (NSBundle)v19, v22, v83);

  swift_bridgeObjectRetain(v10);
  v24 = String.init(format:_:)(v23._countAndFlagsBits, v23._object, v10);
  v26 = v25;
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v23._object);
  v81[0] = v24;
  v81[1] = v26;
  v27 = sub_100007BB8();
  v28 = Text.init<A>(_:)(v81, &type metadata for String, v27);
  v32 = *((_QWORD *)a1 + 4);
  if (!v32)
  {
LABEL_13:
    v73 = *((_QWORD *)a1 + 5);
    v74 = type metadata accessor for LayoutConfiguration(0);
    v75 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v73, v74, v75);
    __break(1u);
    return result;
  }
  v33 = v28;
  v34 = v29;
  v35 = v30;
  v36 = v31;
  if (*(_BYTE *)(v32 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
  {
    v37 = *((_QWORD *)a1 + 4);
    if (*(_BYTE *)(v32 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
    {
      swift_retain(v37);
      v38 = sub_1000082C8();
      v39 = type metadata accessor for ClusterMetrics();
      v40 = v39;
      v41 = &off_1000215D8;
    }
    else
    {
      swift_retain(v37);
      v38 = sub_1000082E4();
      v39 = type metadata accessor for WidgetMetrics();
      v40 = v39;
      v41 = &off_100021578;
    }
  }
  else
  {
    swift_retain(*((_QWORD *)a1 + 4));
    v38 = sub_1000082AC();
    v39 = type metadata accessor for ConsoleMetrics();
    v40 = v39;
    v41 = &off_100021638;
  }
  v81[3] = v39;
  v81[4] = v41;
  swift_release(v32);
  v81[0] = v38;
  sub_100007BFC(v81, v40);
  v42 = ((uint64_t (__cdecl *)())v41[4])();
  v43 = v35 & 1;
  v44 = Text.font(_:)(v42, v33, v34, v35 & 1, v36);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  sub_100007C20(v33, v34, v43);
  swift_release(v42);
  swift_bridgeObjectRelease(v36);
  sub_100007C30(v81);
  v51 = v76;
  v52 = v79;
  dispatch thunk of CAFBatteryLevelObservable.batteryTargetChargeLevel.getter();
  sub_100007D5C((uint64_t)&v82);
  v53 = v78;
  v54 = Measurement.value.getter(v78) + 10.0;
  v55 = v51;
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100007D5C((uint64_t)&v82);
  v56 = Measurement.value.getter(v53);
  v57 = v8;
  v58 = v77;
  v59 = ((uint64_t (*)(char *, uint64_t))v77)(v57, v53);
  if (v56 >= v54)
  {
    v61 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    v60 = Color.init(_:)(v61);
  }
  else
  {
    v60 = static Color.primary.getter(v59);
  }
  v62 = v60;
  v63 = v80;
  v64 = v48 & 1;
  v58(v52, v53);
  v81[0] = v62;
  v65 = Text.foregroundStyle<A>(_:)(v81, v44, v46, v48 & 1, v50, &type metadata for Color, &protocol witness table for Color);
  v67 = v66;
  v69 = v68;
  v71 = v70;
  sub_100007C20(v44, v46, v64);
  swift_release(v62);
  result = swift_bridgeObjectRelease(v50);
  *(_QWORD *)v63 = v65;
  *(_QWORD *)(v63 + 8) = v67;
  *(_BYTE *)(v63 + 16) = v69 & 1;
  *(_QWORD *)(v63 + 24) = v71;
  return result;
}

uint64_t sub_100006F30()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;

  v0 = type metadata accessor for AxisMarkPosition(0);
  v1 = __chkstk_darwin(v0);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AxisMarkPreset(0, v1);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AxisMarkValues(0, v5);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static AxisMarkValues.automatic.getter(v9);
  v13 = static AxisMarkPreset.automatic.getter(v12);
  static AxisMarkPosition.automatic.getter(v13);
  v14 = sub_100007984(&qword_100026B00);
  v15 = sub_100007FC8();
  return AxisMarks.init(preset:position:values:content:)(v7, v3, v11, sub_100007050, 0, v14, v15);
}

uint64_t sub_100007050@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  void (*v38)(char *, uint64_t);
  void (*v39)(char *, uint64_t);
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  _OWORD v53[2];
  uint64_t v54;
  _OWORD v55[2];
  uint64_t v56;

  v50 = a1;
  v49 = sub_100007984(&qword_100026B20);
  ((void (*)(void))__chkstk_darwin)();
  v48 = (char *)&v41 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AxisValueLabelOrientation(0);
  ((void (*)(void))__chkstk_darwin)();
  v44 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AxisValueLabelCollisionResolution(0);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100007984(&qword_100026B18);
  v46 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v45 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v51 = (char *)&v41 - v8;
  v9 = type metadata accessor for AxisGridLine(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100007984(&qword_100026B28);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v13);
  v43 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v15);
  v19 = (char *)&v41 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v41 - v20;
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v53, 0, 0, &_swiftEmptyArrayStorage, 3.0, 10.0, 0.0);
  v55[0] = v53[0];
  v55[1] = v53[1];
  v56 = v54;
  AxisGridLine.init(centered:stroke:)(1, v55);
  v22 = Color.init(_:bundle:)(0x61684372656E6E49, 0xEF726F6C6F437472, 0);
  v52 = v22;
  AxisMark.foregroundStyle<A>(_:)(&v52, v9, &type metadata for Color, &protocol witness table for AxisGridLine, &protocol witness table for Color);
  swift_release(v22);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v42 = v14;
  v23 = *(uint64_t (**)(char *, char *, uint64_t))(v14 + 32);
  v41 = v21;
  v24 = v23(v21, v19, v13);
  v25 = static AxisValueLabelCollisionResolution.automatic.getter(v24);
  v26 = v44;
  static AxisValueLabelOrientation.automatic.getter(v25);
  v27 = v51;
  AxisValueLabel.init<>(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)(2, 0, 0, 1, 0, 0, 1, v4, 2, v26, 0, 1, 0, 1);
  v28 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v29 = v43;
  v28(v43, v21, v13);
  v31 = v45;
  v30 = v46;
  v32 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v33 = v47;
  v32(v45, v27, v47);
  v34 = v48;
  v28(v48, v29, v13);
  sub_10000812C(&qword_100026B10, &qword_100026B18, (uint64_t)&protocol conformance descriptor for AxisValueLabel<A>);
  v35 = v49;
  v36 = &v34[*(int *)(v49 + 48)];
  v32(v36, v31, v33);
  v37 = v50;
  v23(v50, v34, v13);
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(&v37[*(int *)(v35 + 48)], v36, v33);
  v38 = *(void (**)(char *, uint64_t))(v30 + 8);
  v38(v51, v33);
  v39 = *(void (**)(char *, uint64_t))(v42 + 8);
  v39(v41, v13);
  v38(v31, v33);
  return ((uint64_t (*)(char *, uint64_t))v39)(v29, v13);
}

unint64_t sub_100007480(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007984(&qword_100026AF8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = (id)*(v6 - 1);
    swift_retain(v7);
    result = sub_100007DD4((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v4[6] + v11) = v8;
    *(_QWORD *)(v4[7] + v11) = v7;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4[2] = v14;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

_OWORD *sub_100007588(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  _OWORD *result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _OWORD v35[4];
  _OWORD v36[2];
  _OWORD v37[3];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100007984(&qword_100026AF0);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v32 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = (_OWORD *)swift_retain(v3);
  v33 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v33 << 6);
      goto LABEL_28;
    }
    v12 = v33 + 1;
    if (__OFADD__(v33, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v12 >= v31)
      goto LABEL_37;
    v13 = *(_QWORD *)(v32 + 8 * v12);
    v14 = v33 + 1;
    if (!v13)
    {
      v14 = v33 + 2;
      if (v33 + 2 >= v31)
        goto LABEL_37;
      v13 = *(_QWORD *)(v32 + 8 * v14);
      if (!v13)
      {
        v14 = v33 + 3;
        if (v33 + 3 >= v31)
          goto LABEL_37;
        v13 = *(_QWORD *)(v32 + 8 * v14);
        if (!v13)
        {
          v14 = v33 + 4;
          if (v33 + 4 >= v31)
            goto LABEL_37;
          v13 = *(_QWORD *)(v32 + 8 * v14);
          if (!v13)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v14 << 6);
    v33 = v14;
LABEL_28:
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    *(_QWORD *)&v37[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v11);
    *(_QWORD *)&v36[0] = v16;
    v17 = *(id *)&v37[0];
    swift_retain(v16);
    swift_dynamicCast((char *)v37 + 8, v36, &type metadata for Font, (char *)&type metadata for Any + 8, 7);
    v18 = *(_QWORD *)&v37[0];
    sub_100007DBC((_OWORD *)((char *)v37 + 8), v35);
    sub_100007DBC(v35, v37);
    sub_100007DBC(v37, v36);
    v19 = v3[5];
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v22 = v21;
    Hasher.init(_seed:)(&v34, v19);
    String.hash(into:)(&v34, v20, v22);
    v23 = Hasher._finalize()();
    result = (_OWORD *)swift_bridgeObjectRelease(v22);
    v24 = -1 << *((_BYTE *)v3 + 32);
    v25 = v23 & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)&v7[8 * (v25 >> 6)]) != 0)
    {
      v9 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)&v7[8 * (v25 >> 6)])) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)&v7[8 * v26];
      }
      while (v30 == -1);
      v9 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)&v7[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    *(_QWORD *)(v3[6] + 8 * v9) = v18;
    result = sub_100007DBC(v36, (_OWORD *)(v3[7] + 32 * v9));
    ++v3[2];
  }
  v15 = v33 + 5;
  if (v33 + 5 >= v31)
  {
LABEL_37:
    swift_release(v3);
    sub_100007DCC(a1);
    return v3;
  }
  v13 = *(_QWORD *)(v32 + 8 * v15);
  if (v13)
  {
    v14 = v33 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v31)
      goto LABEL_37;
    v13 = *(_QWORD *)(v32 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100007924@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  _OWORD *v7;
  __int128 v9;
  uint64_t v10;
  _OWORD v12[3];

  v9 = v7[1];
  v12[0] = *v7;
  v12[1] = v9;
  v12[2] = v7[2];
  *(_QWORD *)a7 = static VerticalAlignment.center.getter(a1, a2, a3, a4, a5, a6);
  *(_QWORD *)(a7 + 8) = 0;
  *(_BYTE *)(a7 + 16) = 1;
  v10 = sub_100007984(&qword_100026A48);
  return sub_100004E04((unint64_t)v12, a7 + *(int *)(v10 + 44));
}

uint64_t sub_100007984(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000079C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100005EC4(*(void (**)(char *, char *, uint64_t))(v1 + 16), a1);
}

unint64_t sub_1000079CC()
{
  unint64_t result;
  uint64_t v1;
  __n128 v2;
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t OpaqueTypeConformance2;
  uint64_t v13;

  result = qword_100026A80;
  if (!qword_100026A80)
  {
    v1 = sub_100004DB0(&qword_100026A78);
    v8 = type metadata accessor for BarMark(255, v2);
    v9 = &type metadata for Color;
    v10 = &protocol witness table for BarMark;
    v11 = &protocol witness table for Color;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of ChartContent.foregroundStyle<A>(_:)>>, 1);
    v3 = sub_100004DB0(&qword_100026A88);
    v4 = sub_100004DB0(&qword_100026A90);
    v8 = type metadata accessor for RuleMark(255, v5);
    v9 = &type metadata for Color;
    v10 = &protocol witness table for RuleMark;
    v11 = &protocol witness table for Color;
    v6 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of ChartContent.foregroundStyle<A>(_:)>>, 1);
    v8 = v4;
    v9 = (void *)v6;
    v7 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of ChartContent.lineStyle(_:)>>, 1);
    v8 = v3;
    v9 = &type metadata for Text;
    v10 = (void *)v7;
    v11 = &protocol witness table for Text;
    v13 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of ChartContent.annotation<A>(position:alignment:spacing:content:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <each A> BuilderTuple<Pack{repeat A}>, v1);
    atomic_store(result, (unint64_t *)&qword_100026A80);
  }
  return result;
}

unint64_t sub_100007B14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026AA8;
  if (!qword_100026AA8)
  {
    v1 = sub_100004DB0(&qword_100026A98);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ClosedRange<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100026AA8);
  }
  return result;
}

uint64_t sub_100007B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007984(&qword_100026A70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100007BB8()
{
  unint64_t result;

  result = qword_100026AC0;
  if (!qword_100026AC0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100026AC0);
  }
  return result;
}

_QWORD *sub_100007BFC(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100007C20(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100007C30(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100007C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007984(&qword_100026A70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007C98(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_100007CD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  return a1;
}

uint64_t sub_100007CD4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100007CE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100007984(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007D20(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_100007C20(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_100007D5C(uint64_t a1)
{

  return a1;
}

uint64_t sub_100007D84(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

_OWORD *sub_100007DBC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100007DCC(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

unint64_t sub_100007DD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_100007E54(a1, v7);
}

unint64_t sub_100007E54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_100007FC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  void *v3;
  void *v4;
  void *v5;

  result = qword_100026B08;
  if (!qword_100026B08)
  {
    v1 = sub_100004DB0(&qword_100026B00);
    OpaqueTypeConformance2 = type metadata accessor for AxisGridLine(255);
    v3 = &type metadata for Color;
    v4 = &protocol witness table for AxisGridLine;
    v5 = &protocol witness table for Color;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&OpaqueTypeConformance2, &opaque type descriptor for <<opaque return type of AxisMark.foregroundStyle<A>(_:)>>, 1);
    v3 = (void *)sub_10000812C(&qword_100026B10, &qword_100026B18, (uint64_t)&protocol conformance descriptor for AxisValueLabel<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <each A> BuilderTuple<Pack{repeat A}>, v1);
    atomic_store(result, (unint64_t *)&qword_100026B08);
  }
  return result;
}

uint64_t sub_10000808C(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  return a1;
}

uint64_t sub_1000080B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100006A00(*(__int128 **)(v1 + 16), a1);
}

unint64_t sub_1000080BC()
{
  unint64_t result;

  result = qword_100026B58;
  if (!qword_100026B58)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100026B58);
  }
  return result;
}

uint64_t sub_100008100()
{
  return sub_10000812C(&qword_100026B60, &qword_100026B68, (uint64_t)&protocol conformance descriptor for HStack<A>);
}

uint64_t sub_10000812C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004DB0(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

double sub_10000817C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  double v4;

  KeyPath = swift_getKeyPath(&unk_10001A1D8);
  v2 = swift_getKeyPath(&unk_10001A200);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

BOOL sub_1000081EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100008200()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100008244()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000826C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000082AC()
{
  return sub_100008300(&OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___consoleMetrics, type metadata accessor for ConsoleMetrics, sub_1000105D0);
}

uint64_t sub_1000082C8()
{
  return sub_100008300(&OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___clusterMetrics, type metadata accessor for ClusterMetrics, sub_100010B80);
}

uint64_t sub_1000082E4()
{
  return sub_100008300(&OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___widgetMetrics, type metadata accessor for WidgetMetrics, sub_1000111B4);
}

uint64_t sub_100008300(uint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *a1;
  v5 = *(_QWORD *)(v3 + *a1);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v8 = v3;
    v9 = a2();
    swift_allocObject(v9, 120, 7);
    v6 = a3();
    v10 = *(_QWORD *)(v8 + v4);
    *(_QWORD *)(v8 + v4) = v6;
    swift_retain(v6);
    swift_release(v10);
    v5 = 0;
  }
  swift_retain(v5);
  return v6;
}

uint64_t sub_100008378()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC6Charge19LayoutConfiguration__size;
  v2 = sub_100007984(&qword_100026CF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___consoleMetrics));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___clusterMetrics));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___widgetMetrics));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_1000083FC()
{
  return type metadata accessor for LayoutConfiguration(0);
}

uint64_t type metadata accessor for LayoutConfiguration(uint64_t a1)
{
  uint64_t result;

  result = qword_100026BB8;
  if (!qword_100026BB8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LayoutConfiguration);
  return result;
}

void sub_100008440(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  sub_1000084C4(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_10001A0E8;
    v4[2] = &unk_10001A100;
    v4[3] = &unk_10001A100;
    v4[4] = &unk_10001A100;
    swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
  }
}

void sub_1000084C4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100026BC8)
  {
    type metadata accessor for CGSize(255);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100026BC8);
  }
}

_BYTE *initializeBufferWithCopyOfBuffer for ChargePresentationMode(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ChargePresentationMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ChargePresentationMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100008600 + 4 * byte_10001A0B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100008634 + 4 * byte_10001A0B0[v4]))();
}

uint64_t sub_100008634(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000863C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100008644);
  return result;
}

uint64_t sub_100008650(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100008658);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10000865C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008664(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ChargePresentationMode()
{
  return &type metadata for ChargePresentationMode;
}

unint64_t sub_100008688()
{
  unint64_t result;

  result = qword_100026CE8;
  if (!qword_100026CE8)
  {
    result = swift_getWitnessTable(&unk_10001A178, &type metadata for ChargePresentationMode);
    atomic_store(result, (unint64_t *)&qword_100026CE8);
  }
  return result;
}

void *sub_1000086CC()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1000086D8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for LayoutConfiguration(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

double sub_100008714@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  __int128 v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_10001A1D8);
  v5 = swift_getKeyPath(&unk_10001A200);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = *(double *)&v7;
  *a2 = v7;
  return result;
}

uint64_t sub_100008794(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_10001A1D8);
  v6 = swift_getKeyPath(&unk_10001A200);
  v8[0] = v2;
  v8[1] = v3;
  swift_retain(v4);
  return static Published.subscript.setter(v8, v4, KeyPath, v6);
}

uint64_t getEnumTagSinglePayload for ChargeTemplateType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ChargeTemplateType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000088EC + 4 * byte_10001A0BF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100008920 + 4 * byte_10001A0BA[v4]))();
}

uint64_t sub_100008920(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008928(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100008930);
  return result;
}

uint64_t sub_10000893C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100008944);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100008948(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008950(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000895C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100008964(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ChargeTemplateType()
{
  return &type metadata for ChargeTemplateType;
}

unint64_t sub_100008980()
{
  unint64_t result;

  result = qword_100026CF8;
  if (!qword_100026CF8)
  {
    result = swift_getWitnessTable(&unk_10001A274, &type metadata for ChargeTemplateType);
    atomic_store(result, (unint64_t *)&qword_100026CF8);
  }
  return result;
}

void sub_100008A54(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  id v13;

  v3 = objc_opt_self(UIWindowScene);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = a1;
    v7 = objc_msgSend(v5, "_FBSScene");
    v8 = objc_msgSend(v7, "settings");

    v9 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
    v10 = swift_dynamicCastObjCClass(v8, v9);

    v11 = &OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_consoleWindowManager;
    if (v10)
      v11 = &OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_clusterWindowManager;
    v12 = *v11;
    v13 = *(id *)(v1 + v12);
    *(_QWORD *)(v1 + v12) = 0;

  }
}

id sub_100008BEC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ChargeSceneDelegate()
{
  return objc_opt_self(_TtC6Charge19ChargeSceneDelegate);
}

void sub_100008C74(void *a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  os_log_type_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  char *v31;
  uint64_t v32;
  id v33;

  v3 = v2;
  v6 = objc_msgSend(a2, "role");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v8 = v7;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  CAFSignpostEmit_Scene(v9);

  v10 = objc_opt_self(UIWindowScene);
  v11 = swift_dynamicCastObjCClass(a1, v10);
  if (!v11)
    goto LABEL_8;
  v12 = (void *)v11;
  v13 = a1;
  v14 = objc_msgSend(a2, "role");
  v15 = _UIWindowSceneSessionRoleCarPlay;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v18 = v17;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  if (v16 == v19 && v18 == v20)
  {

    swift_bridgeObjectRelease_n(v18, 2);
  }
  else
  {
    v22 = v20;
    v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, v19, v20, 0);

    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v22);
    if ((v23 & 1) == 0)
    {

LABEL_8:
      v24 = static os_log_type_t.info.getter();
      sub_100009618(v24, 0xD000000000000024, 0x8000000100017B70, 0xD00000000000001FLL, 0x8000000100017BA0, 22);
      return;
    }
  }
  v25 = objc_msgSend(v12, "_FBSScene");
  v26 = objc_msgSend(v25, "settings");

  v27 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
  v28 = swift_dynamicCastObjCClass(v26, v27);

  v29 = objc_allocWithZone((Class)type metadata accessor for ChargeWindowManager());
  v30 = v13;
  if (v28)
  {
    v31 = sub_1000103D4(v12, 1);
    v32 = OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_clusterWindowManager;
  }
  else
  {
    v31 = sub_1000103D4(v12, 0);
    v32 = OBJC_IVAR____TtC6Charge19ChargeSceneDelegate_consoleWindowManager;
  }
  v33 = *(id *)(v3 + v32);
  *(_QWORD *)(v3 + v32) = v31;

}

uint64_t sub_100008EC8()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v1 = objc_msgSend(v0, "bundleIdentifier");

  if (v1)
  {
    v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    v4 = v3;

  }
  else
  {
    v2 = 0;
    v4 = 0xE000000000000000;
  }
  sub_100009848();
  result = OS_os_log.init(subsystem:category:)(v2, v4, 0x656772616843, 0xE600000000000000);
  qword_100028CD8 = result;
  return result;
}

void sub_100008F80()
{
  qword_100028CE0 = 0x6C69662E746C6F62;
  *(_QWORD *)algn_100028CE8 = 0xE90000000000006CLL;
}

void sub_100008FA8()
{
  qword_100028CF0 = 0x616C732E746C6F62;
  *(_QWORD *)algn_100028CF8 = 0xEF6C6C69662E6873;
}

uint64_t sub_100008FD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000090A8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100009808((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100009808((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100007C30(v12);
  return v7;
}

uint64_t sub_1000090A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100009260(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100009260(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000092F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000094CC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000094CC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000092F4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100009468(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100009468(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100007984(&qword_100026E00);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000094CC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100007984(&qword_100026E00);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100009618(os_log_type_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  NSObject *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_100026870 != -1)
    swift_once(&qword_100026870, sub_100008EC8);
  v12 = qword_100028CD8;
  result = os_log_type_enabled((os_log_t)qword_100028CD8, a1);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n(a5, 2);
    swift_bridgeObjectRetain_n(a3, 2);
    v14 = swift_slowAlloc(32, -1);
    v15 = swift_slowAlloc(64, -1);
    v17 = v15;
    *(_DWORD *)v14 = 136315650;
    swift_bridgeObjectRetain(a5);
    v16 = sub_100008FD8(a4, a5, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease_n(a5, 3);
    *(_WORD *)(v14 + 12) = 2048;
    v16 = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v14 + 14, v14 + 22);
    *(_WORD *)(v14 + 22) = 2080;
    swift_bridgeObjectRetain(a3);
    v16 = sub_100008FD8(a2, a3, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v14 + 24, v14 + 32);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v12, a1, "%s: %ld  %s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    return swift_slowDealloc(v14, -1, -1);
  }
  return result;
}

uint64_t sub_100009808(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100009848()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026E08;
  if (!qword_100026E08)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100026E08);
  }
  return result;
}

ValueMetadata *type metadata accessor for AlignTopLeft()
{
  return &type metadata for AlignTopLeft;
}

uint64_t sub_100009894(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001B098, 1);
}

uint64_t sub_1000098A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v25 = a2;
  v3 = sub_100007984(&qword_100026E18);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v9 = (char *)&v24 - v8;
  v10 = sub_100007984(&qword_100026E20);
  __chkstk_darwin(v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v24 - v15;
  *(_QWORD *)v16 = static HorizontalAlignment.leading.getter(v14);
  *((_QWORD *)v16 + 1) = 0;
  v16[16] = 1;
  v17 = &v16[*(int *)(sub_100007984(&qword_100026E28) + 44)];
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v18(v9, a1, v3);
  v18(v6, (uint64_t)v9, v3);
  v18(v17, (uint64_t)v6, v3);
  v19 = &v17[*(int *)(sub_100007984(&qword_100026E30) + 48)];
  *(_QWORD *)v19 = 0;
  v19[8] = 1;
  v20 = *(void (**)(char *, uint64_t))(v4 + 8);
  v20(v9, v3);
  v20(v6, v3);
  sub_100009ADC((uint64_t)v16, (uint64_t)v12);
  v21 = v25;
  sub_100009ADC((uint64_t)v12, v25);
  v22 = v21 + *(int *)(sub_100007984(&qword_100026E38) + 48);
  *(_QWORD *)v22 = 0;
  *(_BYTE *)(v22 + 8) = 1;
  sub_100009B24((uint64_t)v16);
  return sub_100009B24((uint64_t)v12);
}

uint64_t sub_100009A78()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_100009A90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9;

  *(_QWORD *)a7 = static VerticalAlignment.center.getter(a1, a2, a3, a4, a5, a6);
  *(_QWORD *)(a7 + 8) = 0;
  *(_BYTE *)(a7 + 16) = 1;
  v9 = sub_100007984(&qword_100026E10);
  return sub_1000098A4(a1, a7 + *(int *)(v9 + 44));
}

uint64_t sub_100009ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007984(&qword_100026E20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009B24(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007984(&qword_100026E20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100009B68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026E40;
  if (!qword_100026E40)
  {
    v1 = sub_100004DB0(&qword_100026E48);
    result = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100026E40);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ChargeGaugeView(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ChargeGaugeView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for ChargeGaugeView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ChargeGaugeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeGaugeView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeGaugeView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeGaugeView()
{
  return &type metadata for ChargeGaugeView;
}

uint64_t sub_100009D20(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001B0F8, 1);
}

double sub_100009D30@<D0>(char *a1@<X1>, unsigned __int8 a2@<W2>, uint64_t a3@<X8>)
{
  char *v6;
  void *v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  double result;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  char v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int16 v68;
  _OWORD v69[4];
  char v70;
  char v71;
  char v72[32];

  v6 = &a1[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess(&a1[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable], v72, 0, 0);
  v7 = (void *)*((_QWORD *)v6 + 1);
  v8 = a1;
  v9 = v7;
  v10 = (void *)dispatch thunk of CAFCarObservable.highVoltageBattery.getter();

  if (!v10)
    goto LABEL_8;
  v11 = objc_msgSend(v10, "batteryLevel");

  if (!v11)
  {
LABEL_9:
    v50 = type metadata accessor for LayoutConfiguration(0);
    v51 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    v63 = EnvironmentObject.init()(v50, v51);
    v64 = v52;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 256;
    v53 = sub_10000A168();
    v54 = sub_100004AA4();
    _ConditionalContent<>.init(storage:)(v69, &v63, &type metadata for CircularCapacityGauge, &type metadata for NotChargingView, v53, v54);
    goto LABEL_10;
  }
  v12 = (void *)*((_QWORD *)v6 + 1);
  v8 = v8;
  v13 = v12;
  v14 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (!v14)
  {

LABEL_8:
    goto LABEL_9;
  }
  v15 = objc_msgSend(v14, "chargingTime");

  if (!v15)
  {
    v8 = (char *)v11;
    goto LABEL_8;
  }
  v16 = sub_100007D84(0, &qword_100026A08, CAFBatteryLevel_ptr);
  v17 = sub_100004AE8(&qword_100026A10, &qword_100026A08, CAFBatteryLevel_ptr, (uint64_t)&protocol conformance descriptor for CAFBatteryLevel);
  v18 = CAFObserved<>.observable.getter(v16, v17);
  v19 = sub_100007D84(0, &qword_100026A18, CAFChargingTime_ptr);
  v20 = sub_100004AE8(&qword_100026A20, &qword_100026A18, CAFChargingTime_ptr, (uint64_t)&protocol conformance descriptor for CAFChargingTime);
  v21 = CAFObserved<>.observable.getter(v19, v20);
  v22 = type metadata accessor for LayoutConfiguration(0);
  v23 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
  v24 = v8;
  v25 = EnvironmentObject.init()(v22, v23);
  v61 = v26;
  v27 = type metadata accessor for CAFBatteryLevelObservable(0);
  v28 = sub_1000042E8(&qword_100026A28, (uint64_t (*)(uint64_t))&type metadata accessor for CAFBatteryLevelObservable, (uint64_t)&protocol conformance descriptor for CAFBatteryLevelObservable);
  v29 = ObservedObject.init(wrappedValue:)(v18, v27, v28);
  v31 = v30;
  v62 = v15;
  v32 = type metadata accessor for CAFChargingTimeObservable(0);
  v33 = sub_1000042E8(&qword_100026A30, (uint64_t (*)(uint64_t))&type metadata accessor for CAFChargingTimeObservable, (uint64_t)&protocol conformance descriptor for CAFChargingTimeObservable);
  v34 = ObservedObject.init(wrappedValue:)(v21, v32, v33);
  v36 = v35;
  v37 = type metadata accessor for ChargeModel(0);
  v38 = sub_1000042E8(&qword_100026E58, type metadata accessor for ChargeModel, (uint64_t)&unk_10001ABA0);
  v39 = ObservedObject.init(wrappedValue:)(v24, v37, v38);
  v41 = v40;
  v63 = v29;
  v64 = v31;
  *(_QWORD *)&v65 = v34;
  *((_QWORD *)&v65 + 1) = v36;
  *(_QWORD *)&v66 = v39;
  *((_QWORD *)&v66 + 1) = v40;
  *(_QWORD *)&v67 = v25;
  *((_QWORD *)&v67 + 1) = v61;
  v68 = a2;
  v42 = sub_10000A168();
  v43 = sub_100004AA4();
  v44 = v31;
  v45 = v36;
  v46 = v41;
  swift_retain_n(v25, 2);
  v47 = v44;
  v48 = v45;
  v49 = v46;
  _ConditionalContent<>.init(storage:)(v69, &v63, &type metadata for CircularCapacityGauge, &type metadata for NotChargingView, v42, v43);
  swift_release_n(v25, 2);

LABEL_10:
  result = *(double *)v69;
  v56 = v69[1];
  v57 = v69[2];
  v58 = v69[3];
  v59 = v70;
  v60 = v71;
  *(_OWORD *)a3 = v69[0];
  *(_OWORD *)(a3 + 16) = v56;
  *(_OWORD *)(a3 + 32) = v57;
  *(_OWORD *)(a3 + 48) = v58;
  *(_BYTE *)(a3 + 64) = v59;
  *(_BYTE *)(a3 + 65) = v60;
  return result;
}

double sub_10000A15C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100009D30(*(char **)(v1 + 8), *(_BYTE *)(v1 + 16), a1);
}

unint64_t sub_10000A168()
{
  unint64_t result;

  result = qword_100026E50;
  if (!qword_100026E50)
  {
    result = swift_getWitnessTable(")q", &type metadata for CircularCapacityGauge);
    atomic_store(result, (unint64_t *)&qword_100026E50);
  }
  return result;
}

uint64_t destroy for CircularCapacityGauge(uint64_t a1)
{

  return swift_release(*(_QWORD *)(a1 + 48));
}

uint64_t initializeWithCopy for CircularCapacityGauge(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v7 = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  swift_retain(v7);
  return a1;
}

uint64_t assignWithCopy for CircularCapacityGauge(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v7 = *(void **)(a2 + 24);
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v10 = *(void **)(a2 + 40);
  v11 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  v12 = v10;

  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v14;
  swift_retain(v14);
  swift_release(v13);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for CircularCapacityGauge(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for CircularCapacityGauge(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release(v8);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for CircularCapacityGauge(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CircularCapacityGauge(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CircularCapacityGauge()
{
  return &type metadata for CircularCapacityGauge;
}

uint64_t sub_10000A434()
{
  return sub_10000FAAC(&qword_100026E60, &qword_100026E68, (void (*)(void))sub_10000A168, (void (*)(void))sub_100004AA4);
}

uint64_t sub_10000A468(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001B120, 1);
}

void sub_10000A478(uint64_t a1@<X8>)
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
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;

  v37 = a1;
  v2 = sub_100007984(&qword_100026E70);
  __chkstk_darwin(v2);
  v19 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100007984(&qword_100026E78);
  __chkstk_darwin(v18);
  v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_100007984(&qword_100026E80);
  __chkstk_darwin(v26);
  v20 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v22 = (char *)&v17 - v7;
  v24 = sub_100007984(&qword_100026E88);
  __chkstk_darwin(v24);
  v25 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100007984(&qword_100026E90);
  __chkstk_darwin(v9);
  v23 = sub_100007984(&qword_100026E98);
  __chkstk_darwin(v23);
  __chkstk_darwin(v10);
  v31 = sub_100007984(&qword_100026EA0);
  __chkstk_darwin(v31);
  v27 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_100007984(&qword_100026EA8);
  __chkstk_darwin(v28);
  v30 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_100007984(&qword_100026EB0);
  __chkstk_darwin(v36);
  v32 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_100007984(&qword_100026EB8);
  __chkstk_darwin(v29);
  v14 = sub_100007984(&qword_100026EC0);
  __chkstk_darwin(v14);
  v33 = sub_100007984(&qword_100026EC8);
  __chkstk_darwin(v33);
  v35 = (char *)&v17 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100007984(&qword_100026ED0);
  __chkstk_darwin(v16);
  v34 = sub_100007984(&qword_100026ED8);
  __chkstk_darwin(v34);
  __asm { BR              X10 }
}

uint64_t sub_10000A868()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  ((void (*)(uint64_t, uint64_t, _QWORD))swift_storeEnumTagMultiPayload)(v3, v1, 0);
  v5 = sub_10000812C(&qword_100026F30, &qword_100026EC0, (uint64_t)&protocol conformance descriptor for VStack<A>);
  _ConditionalContent<>.init(storage:)(v0, v3, &type metadata for EmptyView, v2, &protocol witness table for EmptyView, v5);
  v6 = *(_QWORD *)(v4 - 144);
  sub_10000F34C((uint64_t)v0, v6, &qword_100026ED8);
  ((void (*)(uint64_t, _QWORD, _QWORD))swift_storeEnumTagMultiPayload)(v6, *(_QWORD *)(v4 - 160), 0);
  v7 = sub_10000ED48();
  v8 = sub_10000EDCC();
  _ConditionalContent<>.init(storage:)(*(_QWORD **)(v4 - 128), v6, *(_QWORD *)(v4 - 152), *(_QWORD *)(v4 - 136), v7, v8);
  return sub_100007CE4((uint64_t)v0, &qword_100026ED8);
}

uint64_t sub_10000AF6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _UNKNOWN **v23;

  v1 = *(_QWORD *)(v0 + 48);
  if (v1)
  {
    KeyPath = swift_getKeyPath(&unk_10001A428);
    v3 = swift_getKeyPath(&unk_10001A450);
    v4 = swift_retain(v1);
    static Published.subscript.getter(&v21, v4, KeyPath, v3);
    swift_release(v1);
    swift_release(KeyPath);
    swift_release(v3);
    v5 = swift_getKeyPath(&unk_10001A428);
    v6 = swift_getKeyPath(&unk_10001A450);
    v7 = swift_retain(v1);
    static Published.subscript.getter(&v21, v7, v5, v6);
    swift_release(v1);
    swift_release(v5);
    swift_release(v6);
    v8 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      swift_retain(v1);
      if (v8 == 1)
      {
        v9 = sub_1000082C8();
        v10 = type metadata accessor for ClusterMetrics();
        v11 = v10;
        v12 = &off_1000215D8;
      }
      else
      {
        v9 = sub_1000082E4();
        v10 = type metadata accessor for WidgetMetrics();
        v11 = v10;
        v12 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v1);
      v9 = sub_1000082AC();
      v10 = type metadata accessor for ConsoleMetrics();
      v11 = v10;
      v12 = &off_100021638;
    }
    v22 = v10;
    v23 = v12;
    swift_release(v1);
    v21 = v9;
    sub_100007BFC(&v21, v11);
    ((void (__cdecl *)())v12[9])();
    sub_100007C30(&v21);
    if (v8)
    {
      swift_retain(v1);
      if (v8 == 1)
      {
        v13 = sub_1000082C8();
        v14 = type metadata accessor for ClusterMetrics();
        v15 = v14;
        v16 = &off_1000215D8;
      }
      else
      {
        v13 = sub_1000082E4();
        v14 = type metadata accessor for WidgetMetrics();
        v15 = v14;
        v16 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v1);
      v13 = sub_1000082AC();
      v14 = type metadata accessor for ConsoleMetrics();
      v15 = v14;
      v16 = &off_100021638;
    }
    v22 = v14;
    v23 = v16;
    swift_release(v1);
    v21 = v13;
    sub_100007BFC(&v21, v15);
    ((void (__cdecl *)())v16[9])();
    return sub_100007C30(&v21);
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 56);
    v19 = type metadata accessor for LayoutConfiguration(0);
    v20 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v18, v19, v20);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000B248@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  Swift::String v11;
  Swift::String_optional v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _UNKNOWN **v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  unint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  void (*v72)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(_BYTE *, uint64_t);
  uint64_t result;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE v86[12];
  int v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  _BYTE *v97;
  uint64_t v98;
  _BYTE *v99;
  uint64_t v100;
  char v101;
  char v102;
  _BYTE v103[136];
  _BYTE v104[136];
  _QWORD v105[2];
  char v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  __int128 v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  char v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  uint64_t v121;
  char v122;
  __int128 v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  _QWORD v127[6];
  Swift::String v128;

  v88 = a2;
  v3 = type metadata accessor for AccessoryCircularCapacityGaugeStyle(0);
  v94 = *(_QWORD *)(v3 - 8);
  v95 = v3;
  __chkstk_darwin(v3);
  v93 = &v86[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v92 = sub_100007984(&qword_100026F50);
  __chkstk_darwin(v92);
  v6 = &v86[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v98 = sub_100007984(&qword_100026F58);
  v100 = *(_QWORD *)(v98 - 8);
  __chkstk_darwin(v98);
  v97 = &v86[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  v99 = &v86[-v9];
  v10 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v128._object = (void *)0xE000000000000000;
  v11._countAndFlagsBits = 0x474E494752414843;
  v11._object = (void *)0xE800000000000000;
  v12.value._countAndFlagsBits = 0x656772616843;
  v12.value._object = (void *)0xE600000000000000;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v128._countAndFlagsBits = 0;
  v14 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, v12, (NSBundle)v10, v13, v128);

  v15 = String.init(format:_:)(v14._countAndFlagsBits, v14._object, &_swiftEmptyArrayStorage);
  v17 = v16;
  swift_bridgeObjectRelease(v14._object);
  v120 = v15;
  v121 = v17;
  v18 = sub_100007BB8();
  v19 = Text.init<A>(_:)(&v120, &type metadata for String, v18);
  v23 = *(_QWORD *)(a1 + 48);
  if (v23)
  {
    v24 = v19;
    v25 = v20;
    v26 = v21;
    v27 = v22;
    v28 = *(unsigned __int8 *)(v23 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    *(_QWORD *)&v96 = a1;
    if (v28)
    {
      if (v28 == 1)
      {
        swift_retain(v23);
        v29 = sub_1000082C8();
        v30 = type metadata accessor for ClusterMetrics();
        v31 = v30;
        v32 = &off_1000215D8;
      }
      else
      {
        swift_retain(v23);
        v29 = sub_1000082E4();
        v30 = type metadata accessor for WidgetMetrics();
        v31 = v30;
        v32 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v23);
      v29 = sub_1000082AC();
      v30 = type metadata accessor for ConsoleMetrics();
      v31 = v30;
      v32 = &off_100021638;
    }
    v127[3] = v30;
    v127[4] = v32;
    swift_release(v23);
    v127[0] = v29;
    sub_100007BFC(v127, v31);
    v33 = ((uint64_t (__cdecl *)())v32[5])();
    v34 = v26 & 1;
    v35 = Text.font(_:)(v33, v24, v25, v26 & 1, v27);
    v89 = v36;
    v90 = v35;
    v38 = v37;
    v91 = v39;
    sub_100007C20(v24, v25, v34);
    swift_release(v33);
    swift_bridgeObjectRelease(v27);
    v40 = sub_100007C30(v127);
    v87 = static Edge.Set.top.getter(v40);
    v41 = EdgeInsets.init(_all:)(4.0);
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v48 = v96;
    v49 = sub_10000B878((uint64_t)v6);
    v50 = v93;
    AccessoryCircularCapacityGaugeStyle.init()(v49);
    v51 = sub_10000EE70();
    v52 = sub_1000042E8(&qword_100026FB8, (uint64_t (*)(uint64_t))&type metadata accessor for AccessoryCircularCapacityGaugeStyle, (uint64_t)&protocol conformance descriptor for AccessoryCircularCapacityGaugeStyle);
    v53 = v97;
    v54 = v95;
    View.gaugeStyle<A>(_:)(v50, v92, v95, v51, v52);
    (*(void (**)(_BYTE *, uint64_t))(v94 + 8))(v50, v54);
    sub_100007CE4((uint64_t)v6, &qword_100026F50);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v100 + 32))(v99, v53, v98);
    v55 = sub_10000BF50();
    if (v56)
    {
      v57 = v55;
      v58 = v56;
      v59 = static HorizontalAlignment.center.getter();
      sub_10000D020(v57, v58, v48, (uint64_t)&v120);
      v60 = swift_bridgeObjectRelease(v58);
      v61 = v120;
      v62 = v121;
      v63 = v122;
      v96 = v123;
      v64 = v124;
      v65 = v125;
      v66 = v126;
      LOBYTE(v58) = static Edge.Set.bottom.getter(v60);
      v67 = EdgeInsets.init(_all:)(4.0);
      v104[0] = 1;
      v103[0] = v63;
      v102 = v65;
      v101 = 0;
      v105[0] = v59;
      v105[1] = 0;
      v106 = 1;
      v107 = v61;
      v108 = v62;
      v109 = v63;
      v110 = v96;
      v111 = v64;
      v112 = v65;
      v113 = v66;
      v114 = v58;
      v115 = v67;
      v116 = v68;
      v117 = v69;
      v118 = v70;
      v119 = 0;
      ConfigurationIntentResponseCode.rawValue.getter(v105);
    }
    else
    {
      sub_10000F048((uint64_t)v105);
    }
    sub_10000F828((uint64_t)v105, (uint64_t)&v120, &qword_100026FC0);
    v71 = v38 & 1;
    v72 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v100 + 16);
    v74 = v97;
    v73 = v98;
    v72(v97, v99, v98);
    sub_10000F828((uint64_t)&v120, (uint64_t)v103, &qword_100026FC0);
    v76 = v89;
    v75 = v90;
    v77 = v88;
    *v88 = v90;
    v77[1] = v76;
    *((_BYTE *)v77 + 16) = v71;
    v78 = v91;
    v77[3] = v91;
    *((_BYTE *)v77 + 32) = v87;
    *((double *)v77 + 5) = v41;
    v77[6] = v43;
    v77[7] = v45;
    v77[8] = v47;
    *((_BYTE *)v77 + 72) = 0;
    v79 = sub_100007984(&qword_100026FC8);
    v72((_BYTE *)v77 + *(int *)(v79 + 48), v74, v73);
    v80 = (uint64_t)v77 + *(int *)(v79 + 64);
    sub_10000F828((uint64_t)v103, (uint64_t)v104, &qword_100026FC0);
    sub_10000F828((uint64_t)v104, v80, &qword_100026FC0);
    sub_100007CD4(v75, v76, v71);
    swift_bridgeObjectRetain(v78);
    sub_10000F0D4((uint64_t)v104, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10000F064);
    v81 = *(void (**)(_BYTE *, uint64_t))(v100 + 8);
    v81(v99, v73);
    sub_10000F828((uint64_t)v103, (uint64_t)v105, &qword_100026FC0);
    sub_10000F0D4((uint64_t)v105, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10000F138);
    v81(v74, v73);
    sub_100007C20(v75, v76, v71);
    return swift_bridgeObjectRelease(v78);
  }
  else
  {
    v83 = *(_QWORD *)(a1 + 56);
    v84 = type metadata accessor for LayoutConfiguration(0);
    v85 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v83, v84, v85);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000B878@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  _OWORD *v2;
  uint64_t v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  double v19;
  void (*v20)(char *, uint64_t);
  _OWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _UNKNOWN **v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _UNKNOWN **v58;
  uint64_t v59;
  double v60;
  double v61;
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
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 *v80;
  __int128 v81;
  uint64_t result;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94[16];
  _OWORD *v95;
  double v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;

  v2 = v1;
  v93 = a1;
  v3 = sub_100007984(&qword_100026AD0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007984(&qword_100026FA0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007984(&qword_100026F90);
  __chkstk_darwin(v11);
  v13 = (char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = sub_100007984(&qword_100026F80);
  __chkstk_darwin(v86);
  v87 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_100007984(&qword_100026F68);
  __chkstk_darwin(v89);
  v88 = (uint64_t)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100007984(&qword_100026FD0);
  v91 = *(_QWORD *)(v16 - 8);
  v92 = v16;
  __chkstk_darwin(v16);
  v90 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = *v1;
  v18 = *((id *)&v100 + 1);
  dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
  sub_100007D5C((uint64_t)&v100);
  v19 = Measurement.value.getter(v3);
  v20 = *(void (**)(char *, uint64_t))(v4 + 8);
  v21 = v1;
  v20(v6, v3);
  v96 = v19;
  v97 = xmmword_10001A520;
  v95 = v1;
  v22 = sub_100007984(&qword_100026FD8);
  v23 = sub_10000F1B0();
  v24 = sub_10000F2B8();
  Gauge.init<A>(value:in:label:)(&v96, &v97, sub_10000F1A8, v94, v22, &type metadata for Double, v23, v24);
  v25 = sub_100007984(&qword_100027020);
  v26 = swift_allocObject(v25, 40, 7);
  *(_OWORD *)(v26 + 16) = xmmword_100019FE0;
  *(_QWORD *)(v26 + 32) = static Color.green.getter(v26);
  *(_QWORD *)&v97 = v26;
  specialized Array._endMutation()();
  v27 = Gradient.init(colors:)(v97);
  KeyPath = swift_getKeyPath(&unk_10001A3F8);
  *(_QWORD *)&v97 = v27;
  swift_bridgeObjectRetain(v27);
  v29 = AnyShapeStyle.init<A>(_:)(&v97, &type metadata for Gradient, &protocol witness table for Gradient);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  swift_bridgeObjectRelease(v27);
  v30 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  *v30 = KeyPath;
  v30[1] = v29;
  v31 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v32 = static Edge.Set.top.getter(v31);
  v33 = *((_QWORD *)v21 + 6);
  if (v33)
  {
    v34 = v32;
    v35 = (uint64_t)v87;
    v36 = *((_QWORD *)v2 + 6);
    if (*(_BYTE *)(v33 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(v33 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v36);
        v37 = sub_1000082C8();
        v38 = type metadata accessor for ClusterMetrics();
        v39 = v38;
        v40 = &off_1000215D8;
      }
      else
      {
        swift_retain(v36);
        v37 = sub_1000082E4();
        v38 = type metadata accessor for WidgetMetrics();
        v39 = v38;
        v40 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v36);
      v37 = sub_1000082AC();
      v38 = type metadata accessor for ConsoleMetrics();
      v39 = v38;
      v40 = &off_100021638;
    }
    *((_QWORD *)&v98 + 1) = v38;
    *(_QWORD *)&v99 = v40;
    swift_release(v33);
    *(_QWORD *)&v97 = v37;
    sub_100007BFC(&v97, v39);
    v41 = ((double (__cdecl *)())v40[10])();
    v42 = EdgeInsets.init(_all:)(v41);
    v44 = v43;
    v46 = v45;
    v48 = v47;
    sub_10000F34C((uint64_t)v13, v35, &qword_100026F90);
    v49 = v35 + *(int *)(v86 + 36);
    *(_BYTE *)v49 = v34;
    *(double *)(v49 + 8) = v42;
    *(_QWORD *)(v49 + 16) = v44;
    *(_QWORD *)(v49 + 24) = v46;
    *(_QWORD *)(v49 + 32) = v48;
    *(_BYTE *)(v49 + 40) = 0;
    sub_100007CE4((uint64_t)v13, &qword_100026F90);
    v50 = sub_100007C30(&v97);
    v51 = static Edge.Set.bottom.getter(v50);
    if (*(_BYTE *)(v33 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      v53 = v92;
      v52 = v93;
      v54 = v91;
      if (*(_BYTE *)(v33 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v33);
        v55 = sub_1000082C8();
        v56 = type metadata accessor for ClusterMetrics();
        v57 = v56;
        v58 = &off_1000215D8;
      }
      else
      {
        swift_retain(v33);
        v55 = sub_1000082E4();
        v56 = type metadata accessor for WidgetMetrics();
        v57 = v56;
        v58 = &off_100021578;
      }
      *((_QWORD *)&v98 + 1) = v56;
      *(_QWORD *)&v99 = v58;
      swift_release(v33);
      *(_QWORD *)&v97 = v55;
    }
    else
    {
      swift_retain(v33);
      v59 = sub_1000082AC();
      v57 = type metadata accessor for ConsoleMetrics();
      v58 = &off_100021638;
      *((_QWORD *)&v98 + 1) = v57;
      *(_QWORD *)&v99 = &off_100021638;
      swift_release(v33);
      *(_QWORD *)&v97 = v59;
      v53 = v92;
      v52 = v93;
      v54 = v91;
    }
    sub_100007BFC(&v97, v57);
    ((void (__cdecl *)())v58[10])();
    v61 = EdgeInsets.init(_all:)(v60);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v68 = v88;
    sub_10000F34C(v35, v88, &qword_100026F80);
    v69 = v89;
    v70 = v68 + *(int *)(v89 + 36);
    *(_BYTE *)v70 = v51;
    *(double *)(v70 + 8) = v61;
    *(_QWORD *)(v70 + 16) = v63;
    *(_QWORD *)(v70 + 24) = v65;
    *(_QWORD *)(v70 + 32) = v67;
    *(_BYTE *)(v70 + 40) = 0;
    sub_100007CE4(v35, &qword_100026F80);
    sub_100007C30(&v97);
    v71 = sub_10000EF24(&qword_100026F70, &qword_100026F68, (void (*)(void))sub_10000EF90);
    v72 = v90;
    View.allowsGaugeResizing(_:)(1, v69, v71);
    sub_100007CE4(v68, &qword_100026F68);
    sub_10000AF6C();
    v74 = v73;
    v75 = sub_10000AF6C();
    v77 = v76;
    v78 = static Alignment.center.getter(v75);
    _FrameLayout.init(width:height:alignment:)(&v97, v74, 0, v77, 0, v78, v79);
    (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v52, v72, v53);
    v80 = (__int128 *)(v52 + *(int *)(sub_100007984(&qword_100026F50) + 36));
    v81 = v98;
    *v80 = v97;
    v80[1] = v81;
    v80[2] = v99;
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v72, v53);
  }
  else
  {
    v83 = *((_QWORD *)v2 + 7);
    v84 = type metadata accessor for LayoutConfiguration(0);
    v85 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v83, v84, v85);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000BF50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  uint64_t v14;
  id v15;
  id v16;
  double v17;
  id v18;
  void *v19;
  _QWORD v21[2];
  __int128 v22;

  v1 = sub_100007984(&qword_100026AD8);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_OWORD *)(v0 + 16);
  v5 = *((id *)&v22 + 1);
  v6 = (void *)CAFChargingTimeObservable.observed.getter();
  sub_100007D5C((uint64_t)&v22);
  v7 = objc_msgSend(v6, "remainingTimeInvalid");

  if ((v7 & 1) != 0)
  {
    v21[0] = 2108717;
    v21[1] = 0xE300000000000000;
    v8 = objc_msgSend((id)objc_opt_self(NSUnitDuration), "minutes");
    v9 = objc_msgSend(v8, "symbol");

    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    v13._countAndFlagsBits = v10;
    v13._object = v12;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(v12);
    return v21[0];
  }
  else
  {
    v15 = objc_msgSend(objc_allocWithZone((Class)NSDateComponentsFormatter), "init");
    objc_msgSend(v15, "setUnitsStyle:", 1);
    objc_msgSend(v15, "setAllowedUnits:", 96);
    objc_msgSend(v15, "setZeroFormattingBehavior:", 1);
    v16 = v5;
    dispatch thunk of CAFChargingTimeObservable.remainingTime.getter();
    sub_100007D5C((uint64_t)&v22);
    v17 = Measurement.value.getter(v1);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v18 = objc_msgSend(v15, "stringFromTimeInterval:", v17);
    if (v18)
    {
      v19 = v18;
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);

    }
    else
    {

      return 0;
    }
  }
  return v14;
}

uint64_t sub_10000C164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  Swift::String v15;
  Swift::String_optional v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v19;
  double v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _UNKNOWN **v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t KeyPath;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  void (*v93)(char *, char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(char *, uint64_t);
  uint64_t result;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  int v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  __int128 *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char v118;
  char v119;
  _BYTE v120[376];
  _BYTE v121[376];
  _QWORD v122[2];
  char v123;
  _BYTE v124[319];
  double v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  double v131;
  _QWORD v132[6];
  Swift::String v133;

  v110 = a2;
  v3 = type metadata accessor for AccessoryCircularCapacityGaugeStyle(0);
  v4 = *(_QWORD *)(v3 - 8);
  v108 = v3;
  v109 = v4;
  __chkstk_darwin(v3);
  v104 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_100007984(&qword_100026F50);
  __chkstk_darwin(v107);
  v7 = (char *)&v104 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100007984(&qword_100026F58);
  v9 = *(_QWORD *)(v8 - 8);
  v115 = v8;
  v116 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v117 = (char *)&v104 - v13;
  v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v133._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0x474E494752414843;
  v15._object = (void *)0xE800000000000000;
  v16.value._countAndFlagsBits = 0x656772616843;
  v16.value._object = (void *)0xE600000000000000;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v133._countAndFlagsBits = 0;
  v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, v16, (NSBundle)v14, v17, v133);

  v19 = String.init(format:_:)(v18._countAndFlagsBits, v18._object, &_swiftEmptyArrayStorage);
  v21 = v20;
  swift_bridgeObjectRelease(v18._object);
  v130 = v19;
  v131 = v21;
  v22 = sub_100007BB8();
  v23 = Text.init<A>(_:)(&v130, &type metadata for String, v22);
  v114 = (__int128 *)a1;
  v27 = *(_QWORD *)(a1 + 48);
  if (v27)
  {
    v28 = v23;
    v29 = v24;
    v30 = v26;
    v31 = *(unsigned __int8 *)(v27 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    v113 = v11;
    v32 = v25;
    if (v31)
    {
      if (v31 == 1)
      {
        swift_retain(v27);
        v33 = sub_1000082C8();
        v34 = type metadata accessor for ClusterMetrics();
        v35 = v34;
        v36 = &off_1000215D8;
      }
      else
      {
        swift_retain(v27);
        v33 = sub_1000082E4();
        v34 = type metadata accessor for WidgetMetrics();
        v35 = v34;
        v36 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v27);
      v33 = sub_1000082AC();
      v34 = type metadata accessor for ConsoleMetrics();
      v35 = v34;
      v36 = &off_100021638;
    }
    v132[3] = v34;
    v132[4] = v36;
    swift_release(v27);
    v132[0] = v33;
    sub_100007BFC(v132, v35);
    v37 = ((uint64_t (__cdecl *)())v36[5])();
    v111 = Text.font(_:)(v37, v28, v29, v32 & 1, v30);
    v112 = v38;
    v40 = v39;
    v106 = v41;
    sub_100007C20(v28, v29, v32 & 1);
    swift_release(v37);
    swift_bridgeObjectRelease(v30);
    v42 = sub_100007C30(v132);
    v105 = static Edge.Set.top.getter(v42);
    v43 = EdgeInsets.init(_all:)(4.0);
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v50 = sub_10000B878((uint64_t)v7);
    v51 = v104;
    AccessoryCircularCapacityGaugeStyle.init()(v50);
    v52 = sub_10000EE70();
    v53 = sub_1000042E8(&qword_100026FB8, (uint64_t (*)(uint64_t))&type metadata accessor for AccessoryCircularCapacityGaugeStyle, (uint64_t)&protocol conformance descriptor for AccessoryCircularCapacityGaugeStyle);
    v54 = v113;
    v55 = v108;
    View.gaugeStyle<A>(_:)(v51, v107, v108, v52, v53);
    (*(void (**)(char *, uint64_t))(v109 + 8))(v51, v55);
    sub_100007CE4((uint64_t)v7, &qword_100026F50);
    v56 = v116;
    v57 = v115;
    (*(void (**)(char *, char *, uint64_t))(v116 + 32))(v117, v54, v115);
    v58 = sub_10000BF50();
    if (v59)
    {
      v60 = v58;
      v61 = v59;
      v62 = sub_10000C878();
      if (v63)
      {
        v64 = v63;
        v65 = v110;
        v108 = (uint64_t)v62;
        KeyPath = swift_getKeyPath(&unk_10001A428);
        v67 = v54;
        v68 = v40;
        v69 = swift_getKeyPath(&unk_10001A450);
        v70 = swift_retain(v27);
        static Published.subscript.getter(&v130, v70, KeyPath, v69);
        swift_release(v27);
        swift_release(KeyPath);
        v71 = v69;
        v40 = v68;
        v54 = v67;
        v72 = swift_release(v71);
        v109 = v49;
        v73 = v47;
        v74 = v45;
        v75 = v43;
        v76 = v131 * 0.5 * 0.3;
        v82 = static VerticalAlignment.center.getter(v72, v77, v78, v79, v80, v81);
        sub_10000D574(v108, v64, v114, v60, v61, v120);
        swift_bridgeObjectRelease(v64);
        swift_bridgeObjectRelease(v61);
        v118 = 0;
        v83 = memcpy(&v121[7], v120, 0x130uLL);
        LOBYTE(v64) = static Edge.Set.bottom.getter(v83);
        v84 = EdgeInsets.init(_all:)(4.0);
        v86 = v85;
        v88 = v87;
        v90 = v89;
        v119 = 0;
        v122[0] = v82;
        v57 = v115;
        v91 = v116;
        *(double *)&v122[1] = v76;
        v43 = v75;
        v45 = v74;
        v47 = v73;
        v49 = v109;
        v123 = 0;
        memcpy(v124, v121, 0x137uLL);
        v124[311] = v64;
        v125 = v84;
        v126 = v86;
        v127 = v88;
        v128 = v90;
        v129 = 0;
        ConfigurationIntentResponseCode.rawValue.getter(v122);
LABEL_12:
        sub_10000F828((uint64_t)v122, (uint64_t)&v130, &qword_100027028);
        v92 = v106 & 1;
        v93 = *(void (**)(char *, char *, uint64_t))(v91 + 16);
        v93(v54, v117, v57);
        sub_10000F828((uint64_t)&v130, (uint64_t)v120, &qword_100027028);
        v94 = v111;
        *(_QWORD *)v65 = v111;
        *(_QWORD *)(v65 + 8) = v40;
        *(_BYTE *)(v65 + 16) = v92;
        v95 = v40;
        v96 = v112;
        *(_QWORD *)(v65 + 24) = v112;
        *(_BYTE *)(v65 + 32) = v105;
        *(double *)(v65 + 40) = v43;
        *(_QWORD *)(v65 + 48) = v45;
        *(_QWORD *)(v65 + 56) = v47;
        *(_QWORD *)(v65 + 64) = v49;
        *(_BYTE *)(v65 + 72) = 0;
        v97 = sub_100007984(&qword_100027030);
        v93((char *)(v65 + *(int *)(v97 + 48)), v54, v57);
        v98 = v65 + *(int *)(v97 + 64);
        sub_10000F828((uint64_t)v120, (uint64_t)v121, &qword_100027028);
        sub_10000F828((uint64_t)v121, v98, &qword_100027028);
        sub_100007CD4(v94, v95, v92);
        swift_bridgeObjectRetain(v96);
        sub_10000F51C((uint64_t)v121, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10000F3E4);
        v99 = *(void (**)(char *, uint64_t))(v116 + 8);
        v99(v117, v57);
        sub_10000F828((uint64_t)v120, (uint64_t)v122, &qword_100027028);
        sub_10000F51C((uint64_t)v122, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10000F5B8);
        v99(v54, v57);
        sub_100007C20(v94, v95, v92);
        return swift_bridgeObjectRelease(v96);
      }
      swift_bridgeObjectRelease(v61);
    }
    v91 = v56;
    v65 = v110;
    sub_10000F3A8((uint64_t)v122);
    goto LABEL_12;
  }
  v101 = *((_QWORD *)v114 + 7);
  v102 = type metadata accessor for LayoutConfiguration(0);
  v103 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
  result = EnvironmentObject.error()(0, v101, v102, v103);
  __break(1u);
  return result;
}

id sub_10000C878()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  uint64_t v14;
  id v15;
  id result;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];
  __int128 v21;

  v1 = sub_100007984(&qword_100026AD0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *v0;
  v5 = *((id *)&v21 + 1);
  v6 = (void *)CAFBatteryLevelObservable.observed.getter();
  sub_100007D5C((uint64_t)&v21);
  v7 = objc_msgSend(v6, "batteryLevelInvalid");

  if ((v7 & 1) != 0)
  {
    v20[0] = 2108717;
    v20[1] = 0xE300000000000000;
    v8 = objc_msgSend((id)objc_opt_self(CAFUnitPercent), "percent");
    v9 = objc_msgSend(v8, "symbol");

    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    v13._countAndFlagsBits = v10;
    v13._object = v12;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(v12);
    return (id)v20[0];
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)NSMeasurementFormatter), "init");
  result = objc_msgSend(v15, "numberFormatter");
  if (result)
  {
    v17 = result;
    objc_msgSend(result, "setMaximumFractionDigits:", 2);

    objc_msgSend(v15, "setUnitOptions:", 1);
    v18 = v5;
    dispatch thunk of CAFBatteryLevelObservable.batteryLevel.getter();
    sub_100007D5C((uint64_t)&v21);
    v19 = sub_100007D84(0, &qword_100026AE8, CAFUnitPercent_ptr);
    v14 = NSMeasurementFormatter.string<A>(from:)(v4, v19);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (id)v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000CA70@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  unint64_t v27;
  __n128 v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  _BYTE v59[168];
  _BYTE v60[168];
  _QWORD v61[2];
  char v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  __int128 v66;
  uint64_t v67;
  char v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  char v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  _QWORD v78[2];
  char v79;
  __int128 v80;
  uint64_t v81;
  char v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;

  v54 = a2;
  v3 = type metadata accessor for AccessoryCircularCapacityGaugeStyle(0);
  v56 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_100007984(&qword_100026F50);
  __chkstk_darwin(v55);
  v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100007984(&qword_100026F58);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v50 - v13;
  v15 = sub_10000B878((uint64_t)v7);
  AccessoryCircularCapacityGaugeStyle.init()(v15);
  v16 = sub_10000EE70();
  v17 = sub_1000042E8(&qword_100026FB8, (uint64_t (*)(uint64_t))&type metadata accessor for AccessoryCircularCapacityGaugeStyle, (uint64_t)&protocol conformance descriptor for AccessoryCircularCapacityGaugeStyle);
  View.gaugeStyle<A>(_:)(v5, v55, v3, v16, v17);
  v18 = v5;
  v19 = v9;
  v20 = v8;
  v21 = a1;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v18, v3);
  sub_100007CE4((uint64_t)v7, &qword_100026F50);
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v14, v11, v8);
  v22 = sub_10000BF50();
  if (!v23)
    goto LABEL_5;
  v24 = v22;
  v25 = v23;
  v26 = sub_10000C878();
  if (!v27)
  {
    swift_bridgeObjectRelease(v25);
LABEL_5:
    sub_10000F808((uint64_t)v61);
    goto LABEL_6;
  }
  v29 = (uint64_t)v26;
  v30 = v27;
  v53 = static HorizontalAlignment.leading.getter(v28);
  sub_10000E3EC(v24, v25, v21, v29, v30, (uint64_t)v78);
  swift_bridgeObjectRelease(v30);
  v31 = swift_bridgeObjectRelease(v25);
  v55 = (uint64_t)v14;
  v56 = v19;
  v32 = v78[0];
  v33 = v78[1];
  v34 = v79;
  v35 = v81;
  v36 = v82;
  v51 = v83;
  v52 = v80;
  v50 = v84;
  v37 = v85;
  v38 = static Edge.Set.bottom.getter(v31);
  v39 = EdgeInsets.init(_all:)(12.0);
  v60[0] = 0;
  v59[0] = v34;
  v58 = v36;
  v57 = 0;
  v61[0] = v53;
  v61[1] = 0x3FF0000000000000;
  v62 = 0;
  v63 = v32;
  v64 = v33;
  v65 = v34;
  v66 = v52;
  v67 = v35;
  v68 = v36;
  v14 = (char *)v55;
  v19 = v56;
  v69 = v51;
  v70 = v50;
  v71 = v37;
  v72 = v38;
  v73 = v39;
  v74 = v40;
  v75 = v41;
  v76 = v42;
  v77 = 0;
  ConfigurationIntentResponseCode.rawValue.getter(v61);
LABEL_6:
  sub_10000F828((uint64_t)v61, (uint64_t)v78, &qword_100027038);
  v43 = v54;
  v44 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  v44(v11, v14, v20);
  sub_10000F828((uint64_t)v78, (uint64_t)v59, &qword_100027038);
  v44(v43, v11, v20);
  v45 = sub_100007984(&qword_100027040);
  v46 = &v43[*(int *)(v45 + 48)];
  *(_QWORD *)v46 = 0;
  v46[8] = 1;
  v47 = (uint64_t)&v43[*(int *)(v45 + 64)];
  sub_10000F828((uint64_t)v59, (uint64_t)v60, &qword_100027038);
  sub_10000F828((uint64_t)v60, v47, &qword_100027038);
  sub_10000F938((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10000F86C);
  v48 = *(void (**)(char *, uint64_t))(v19 + 8);
  v48(v14, v20);
  sub_10000F828((uint64_t)v59, (uint64_t)v61, &qword_100027038);
  sub_10000F938((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10000F9A4);
  return ((uint64_t (*)(char *, uint64_t))v48)(v11, v20);
}

uint64_t sub_10000CE38@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  _UNKNOWN **v13;
  double v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];

  if (qword_100026878 != -1)
    swift_once(&qword_100026878, sub_100008F80);
  v4 = qword_100028CE0;
  v5 = *(_QWORD *)algn_100028CE8;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100028CE8);
  v6 = Image.init(systemName:)(v4, v5);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v8 = v6;
    if (*(_BYTE *)(v7 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      v9 = *(_QWORD *)(a1 + 48);
      if (*(_BYTE *)(v7 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v9);
        v10 = sub_1000082C8();
        v11 = type metadata accessor for ClusterMetrics();
        v12 = v11;
        v13 = &off_1000215D8;
      }
      else
      {
        swift_retain(v9);
        v10 = sub_1000082E4();
        v11 = type metadata accessor for WidgetMetrics();
        v12 = v11;
        v13 = &off_100021578;
      }
    }
    else
    {
      swift_retain(*(_QWORD *)(a1 + 48));
      v10 = sub_1000082AC();
      v11 = type metadata accessor for ConsoleMetrics();
      v12 = v11;
      v13 = &off_100021638;
    }
    v23[3] = v11;
    v23[4] = v13;
    swift_release(v7);
    v23[0] = v10;
    sub_100007BFC(v23, v12);
    sub_10000AF6C();
    v15 = ((uint64_t (*)(double))v13[11])(v14 * 0.4);
    KeyPath = swift_getKeyPath(&unk_10001A470);
    v17 = sub_100007C30(v23);
    v18 = static Color.green.getter(v17);
    result = swift_getKeyPath(&unk_10001A4A0);
    *a2 = v8;
    a2[1] = KeyPath;
    a2[2] = v15;
    a2[3] = result;
    a2[4] = v18;
  }
  else
  {
    v20 = *(_QWORD *)(a1 + 56);
    v21 = type metadata accessor for LayoutConfiguration(0);
    v22 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v20, v21, v22);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000D020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  Swift::String v41;
  Swift::String_optional v42;
  Swift::String v43;
  Swift::String v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _UNKNOWN **v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t result;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _UNKNOWN **v92;
  __int128 v93;
  Swift::String v94;

  v89 = a1;
  v90 = a2;
  v7 = sub_100007BB8();
  swift_bridgeObjectRetain(a2);
  v8 = Text.init<A>(_:)(&v89, &type metadata for String, v7);
  v12 = *(_QWORD *)(a3 + 48);
  if (v12)
  {
    v13 = v8;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v86 = a3;
    v88 = a4;
    v85 = v7;
    if (*(_BYTE *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v12);
        v17 = sub_1000082C8();
        v18 = type metadata accessor for ClusterMetrics();
        v19 = v18;
        v20 = &off_1000215D8;
      }
      else
      {
        swift_retain(v12);
        v17 = sub_1000082E4();
        v18 = type metadata accessor for WidgetMetrics();
        v19 = v18;
        v20 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v12);
      v17 = sub_1000082AC();
      v18 = type metadata accessor for ConsoleMetrics();
      v19 = v18;
      v20 = &off_100021638;
    }
    v91 = v18;
    v92 = v20;
    swift_release(v12);
    v89 = v17;
    sub_100007BFC(&v89, v19);
    v21 = ((uint64_t (__cdecl *)())v20[6])();
    v22 = v15 & 1;
    v23 = Text.font(_:)(v21, v13, v14, v15 & 1, v16);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    sub_100007C20(v13, v14, v22);
    swift_release(v21);
    swift_bridgeObjectRelease(v16);
    sub_100007C30(&v89);
    v93 = *(_OWORD *)(v86 + 16);
    v30 = *((id *)&v93 + 1);
    v31 = (void *)CAFChargingTimeObservable.observed.getter();
    sub_100007D5C((uint64_t)&v93);
    LODWORD(v21) = objc_msgSend(v31, "remainingTimeInvalid");

    if ((_DWORD)v21)
      v33 = ((uint64_t (*)(void))static Color.secondary.getter)();
    else
      v33 = static Color.primary.getter(v32);
    v34 = v33;
    v35 = Text.foregroundColor(_:)(v33, v23, v25, v27 & 1, v29);
    v83 = v36;
    v82 = v37;
    v39 = v38;
    swift_release(v34);
    sub_100007C20(v23, v25, v27 & 1);
    swift_bridgeObjectRelease(v29);
    v40 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v94._object = (void *)0xE000000000000000;
    v41._countAndFlagsBits = 0x4D45525F454D4954;
    v41._object = (void *)0xEE00474E494E4941;
    v42.value._countAndFlagsBits = 0x656772616843;
    v42.value._object = (void *)0xE600000000000000;
    v43._countAndFlagsBits = 0;
    v43._object = (void *)0xE000000000000000;
    v94._countAndFlagsBits = 0;
    v44 = NSLocalizedString(_:tableName:bundle:value:comment:)(v41, v42, (NSBundle)v40, v43, v94);

    v45 = String.init(format:_:)(v44._countAndFlagsBits, v44._object, &_swiftEmptyArrayStorage);
    v47 = v46;
    swift_bridgeObjectRelease(v44._object);
    v89 = v45;
    v90 = v47;
    v48 = Text.init<A>(_:)(&v89, &type metadata for String, v85);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v55 = *(unsigned __int8 *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    v87 = v39;
    v84 = v35;
    if (v55 == 2)
    {
      swift_retain(v12);
      v56 = sub_1000082E4();
      v57 = type metadata accessor for WidgetMetrics();
      v58 = v57;
      v59 = &off_100021578;
    }
    else if (v55 == 1)
    {
      swift_retain(v12);
      v56 = sub_1000082C8();
      v57 = type metadata accessor for ClusterMetrics();
      v58 = v57;
      v59 = &off_1000215D8;
    }
    else
    {
      swift_retain(v12);
      v56 = sub_1000082AC();
      v57 = type metadata accessor for ConsoleMetrics();
      v58 = v57;
      v59 = &off_100021638;
    }
    v91 = v57;
    v92 = v59;
    swift_release(v12);
    v89 = v56;
    v60 = v52 & 1;
    sub_100007BFC(&v89, v58);
    v61 = ((uint64_t (__cdecl *)())v59[7])();
    v62 = Text.font(_:)(v61, v48, v50, v52 & 1, v54);
    v64 = v63;
    v66 = v65;
    v68 = v67 & 1;
    sub_100007C20(v48, v50, v60);
    swift_release(v61);
    swift_bridgeObjectRelease(v54);
    v69 = sub_100007C30(&v89);
    v70 = static Color.secondary.getter(v69);
    v71 = Text.foregroundColor(_:)(v70, v62, v64, v68, v66);
    v73 = v72;
    v75 = v74;
    v77 = v76;
    swift_release(v70);
    sub_100007C20(v62, v64, v68);
    swift_bridgeObjectRelease(v66);
    LOBYTE(v89) = v82 & 1;
    *(_QWORD *)v88 = v84;
    *(_QWORD *)(v88 + 8) = v83;
    *(_BYTE *)(v88 + 16) = v82 & 1;
    *(_QWORD *)(v88 + 24) = v87;
    *(_QWORD *)(v88 + 32) = v71;
    *(_QWORD *)(v88 + 40) = v73;
    *(_BYTE *)(v88 + 48) = v75 & 1;
    *(_QWORD *)(v88 + 56) = v77;
    sub_100007CD4(v84, v83, v82 & 1);
    swift_bridgeObjectRetain(v87);
    sub_100007CD4(v71, v73, v75 & 1);
    swift_bridgeObjectRetain(v77);
    sub_100007C20(v71, v73, v75 & 1);
    swift_bridgeObjectRelease(v77);
    sub_100007C20(v84, v83, v89);
    return swift_bridgeObjectRelease(v87);
  }
  else
  {
    v79 = *(_QWORD *)(a3 + 56);
    v80 = type metadata accessor for LayoutConfiguration(0);
    v81 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v79, v80, v81);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000D574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  _OWORD v16[8];
  _BYTE v17[135];
  char v18;
  _OWORD v19[7];
  __int128 v20;
  _BYTE v21[135];
  char v22;
  __int128 v23;
  _BYTE v24[136];
  _QWORD v25[2];
  _BYTE v26[136];
  _OWORD __src[19];
  _QWORD v28[2];
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[23];
  _QWORD v38[2];
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[23];

  v14 = ((uint64_t (*)(void))static HorizontalAlignment.center.getter)();
  v11 = sub_10000D844(a1, a2, a3, (uint64_t)v16);
  *(_OWORD *)&v17[71] = v16[4];
  *(_OWORD *)&v17[87] = v16[5];
  *(_OWORD *)&v17[103] = v16[6];
  *(_OWORD *)&v17[119] = v16[7];
  *(_OWORD *)&v17[7] = v16[0];
  *(_OWORD *)&v17[23] = v16[1];
  *(_OWORD *)&v17[39] = v16[2];
  v18 = 1;
  *(_OWORD *)&v17[55] = v16[3];
  v12 = static HorizontalAlignment.center.getter(v11);
  sub_10000DE10(a4, a5, (uint64_t)a3, (uint64_t)v19);
  *(_OWORD *)&v21[71] = v19[4];
  *(_OWORD *)&v21[87] = v19[5];
  *(_OWORD *)&v21[103] = v19[6];
  *(_OWORD *)&v21[119] = v20;
  *(_OWORD *)&v21[7] = v19[0];
  *(_OWORD *)&v21[23] = v19[1];
  *(_OWORD *)&v21[39] = v19[2];
  *(_OWORD *)&v21[55] = v19[3];
  *(_OWORD *)&v24[81] = *(_OWORD *)&v17[80];
  *(_OWORD *)&v24[97] = *(_OWORD *)&v17[96];
  *(_OWORD *)&v24[113] = *(_OWORD *)&v17[112];
  *(_OWORD *)&v24[17] = *(_OWORD *)&v17[16];
  *(_OWORD *)&v24[33] = *(_OWORD *)&v17[32];
  *(_OWORD *)&v24[49] = *(_OWORD *)&v17[48];
  *(_OWORD *)&v24[65] = *(_OWORD *)&v17[64];
  *(_OWORD *)&v24[1] = *(_OWORD *)v17;
  *(_OWORD *)&v26[81] = *(_OWORD *)&v21[80];
  *(_OWORD *)&v26[97] = *(_OWORD *)&v21[96];
  *(_OWORD *)&v26[113] = *(_OWORD *)&v21[112];
  *(_OWORD *)&v26[17] = *(_OWORD *)&v21[16];
  *(_OWORD *)&v26[33] = *(_OWORD *)&v21[32];
  v23 = (unint64_t)v14;
  v24[0] = 1;
  v25[0] = v12;
  v25[1] = 0;
  v26[0] = 1;
  *(_OWORD *)&v26[49] = *(_OWORD *)&v21[48];
  *(_OWORD *)&v26[65] = *(_OWORD *)&v21[64];
  *(_OWORD *)&v26[1] = *(_OWORD *)v21;
  __src[6] = *(_OWORD *)&v24[80];
  __src[7] = *(_OWORD *)&v24[96];
  __src[8] = *(_OWORD *)&v24[112];
  __src[2] = *(_OWORD *)&v24[16];
  __src[3] = *(_OWORD *)&v24[32];
  __src[4] = *(_OWORD *)&v24[48];
  __src[5] = *(_OWORD *)&v24[64];
  __src[0] = (unint64_t)v14;
  __src[1] = *(_OWORD *)v24;
  *(_OWORD *)((char *)&__src[16] + 8) = *(_OWORD *)&v26[96];
  *(_OWORD *)((char *)&__src[17] + 8) = *(_OWORD *)&v26[112];
  *(_OWORD *)((char *)&__src[15] + 8) = *(_OWORD *)&v26[80];
  *(_OWORD *)((char *)&__src[11] + 8) = *(_OWORD *)&v26[16];
  *(_OWORD *)((char *)&__src[12] + 8) = *(_OWORD *)&v26[32];
  *(_OWORD *)((char *)&__src[13] + 8) = *(_OWORD *)&v26[48];
  *(_OWORD *)((char *)&__src[14] + 8) = *(_OWORD *)&v26[64];
  *(_OWORD *)((char *)&__src[9] + 8) = (unint64_t)v12;
  v22 = 1;
  *(_QWORD *)&v24[128] = *(_QWORD *)&v17[127];
  *(_QWORD *)&v26[128] = *((_QWORD *)&v20 + 1);
  *(_QWORD *)&__src[9] = *(_QWORD *)&v17[127];
  *((_QWORD *)&__src[18] + 1) = *((_QWORD *)&v20 + 1);
  *(_OWORD *)((char *)&__src[10] + 8) = *(_OWORD *)v26;
  memcpy(a6, __src, 0x130uLL);
  v35 = *(_OWORD *)&v21[80];
  v36 = *(_OWORD *)&v21[96];
  *(_OWORD *)v37 = *(_OWORD *)&v21[112];
  v31 = *(_OWORD *)&v21[16];
  v32 = *(_OWORD *)&v21[32];
  v33 = *(_OWORD *)&v21[48];
  v34 = *(_OWORD *)&v21[64];
  v28[0] = v12;
  v28[1] = 0;
  v29 = 1;
  *(_QWORD *)&v37[15] = *(_QWORD *)&v21[127];
  v30 = *(_OWORD *)v21;
  sub_10000F6F0((uint64_t)&v23);
  sub_10000F6F0((uint64_t)v25);
  sub_10000F77C((uint64_t)v28);
  v45 = *(_OWORD *)&v17[80];
  v46 = *(_OWORD *)&v17[96];
  *(_OWORD *)v47 = *(_OWORD *)&v17[112];
  v41 = *(_OWORD *)&v17[16];
  v42 = *(_OWORD *)&v17[32];
  v43 = *(_OWORD *)&v17[48];
  v44 = *(_OWORD *)&v17[64];
  v38[0] = v14;
  v38[1] = 0;
  v39 = 1;
  *(_QWORD *)&v47[15] = *(_QWORD *)&v17[127];
  v40 = *(_OWORD *)v17;
  return sub_10000F77C((uint64_t)v38);
}

uint64_t sub_10000D844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  Swift::String v44;
  Swift::String_optional v45;
  Swift::String v46;
  Swift::String v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _UNKNOWN **v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t result;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  uint64_t KeyPath;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v93[7];
  _BYTE v94[7];
  _BYTE v95[7];
  _BYTE v96[7];
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _UNKNOWN **v100;
  __int128 v101;
  Swift::String v102;

  v97 = a1;
  v98 = a2;
  v7 = sub_100007BB8();
  swift_bridgeObjectRetain(a2);
  v8 = Text.init<A>(_:)(&v97, &type metadata for String, v7);
  v12 = *((_QWORD *)a3 + 6);
  if (v12)
  {
    v13 = v8;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v86 = v7;
    if (*(_BYTE *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v12);
        v17 = sub_1000082C8();
        v18 = type metadata accessor for ClusterMetrics();
        v19 = v18;
        v20 = &off_1000215D8;
      }
      else
      {
        swift_retain(v12);
        v17 = sub_1000082E4();
        v18 = type metadata accessor for WidgetMetrics();
        v19 = v18;
        v20 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v12);
      v17 = sub_1000082AC();
      v18 = type metadata accessor for ConsoleMetrics();
      v19 = v18;
      v20 = &off_100021638;
    }
    v99 = v18;
    v100 = v20;
    swift_release(v12);
    v97 = v17;
    sub_100007BFC(&v97, v19);
    v21 = ((uint64_t (__cdecl *)())v20[6])();
    v22 = v15 & 1;
    v23 = Text.font(_:)(v21, v13, v14, v22, v16);
    v90 = v24;
    v85 = v25;
    v27 = v26;
    sub_100007C20(v13, v14, v22);
    swift_release(v21);
    swift_bridgeObjectRelease(v16);
    v28 = sub_100007C30(&v97);
    v29 = static Edge.Set.bottom.getter(v28);
    v30 = EdgeInsets.init(_all:)(4.0);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v101 = *a3;
    v37 = *((id *)&v101 + 1);
    v38 = (void *)CAFBatteryLevelObservable.observed.getter();
    sub_100007D5C((uint64_t)&v101);
    v39 = objc_msgSend(v38, "batteryLevelInvalid");

    if (v39)
      v41 = static Color.secondary.getter(v40);
    else
      v41 = static Color.primary.getter(v40);
    v42 = v41;
    KeyPath = swift_getKeyPath(&unk_10001A4A0);
    v43 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v102._object = (void *)0xE000000000000000;
    v44._countAndFlagsBits = 0x454752414843;
    v44._object = (void *)0xE600000000000000;
    v45.value._countAndFlagsBits = 0x656772616843;
    v45.value._object = (void *)0xE600000000000000;
    v46._countAndFlagsBits = 0;
    v46._object = (void *)0xE000000000000000;
    v102._countAndFlagsBits = 0;
    v47 = NSLocalizedString(_:tableName:bundle:value:comment:)(v44, v45, (NSBundle)v43, v46, v102);

    v48 = String.init(format:_:)(v47._countAndFlagsBits, v47._object, &_swiftEmptyArrayStorage);
    v50 = v49;
    swift_bridgeObjectRelease(v47._object);
    v97 = v48;
    v98 = v50;
    v51 = Text.init<A>(_:)(&v97, &type metadata for String, v86);
    v53 = v52;
    v55 = v54;
    v56 = *(unsigned __int8 *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    v91 = v23;
    v92 = v27;
    v89 = v42;
    v88 = v29;
    v58 = v57;
    if (v56 == 2)
    {
      swift_retain(v12);
      v59 = sub_1000082E4();
      v60 = type metadata accessor for WidgetMetrics();
      v61 = v60;
      v62 = &off_100021578;
    }
    else if (v56 == 1)
    {
      swift_retain(v12);
      v59 = sub_1000082C8();
      v60 = type metadata accessor for ClusterMetrics();
      v61 = v60;
      v62 = &off_1000215D8;
    }
    else
    {
      swift_retain(v12);
      v59 = sub_1000082AC();
      v60 = type metadata accessor for ConsoleMetrics();
      v61 = v60;
      v62 = &off_100021638;
    }
    v99 = v60;
    v100 = v62;
    swift_release(v12);
    v97 = v59;
    v63 = v55 & 1;
    sub_100007BFC(&v97, v61);
    v64 = ((uint64_t (__cdecl *)())v62[7])();
    v65 = v58;
    v66 = Text.font(_:)(v64, v51, v53, v63, v58);
    v68 = v67;
    v70 = v69;
    v72 = v71 & 1;
    sub_100007C20(v51, v53, v63);
    swift_release(v64);
    swift_bridgeObjectRelease(v65);
    v73 = sub_100007C30(&v97);
    v74 = static Color.secondary.getter(v73);
    v75 = Text.foregroundColor(_:)(v74, v66, v68, v72, v70);
    v77 = v76;
    LOBYTE(v65) = v78;
    v80 = v79;
    swift_release(v74);
    sub_100007C20(v66, v68, v72);
    swift_bridgeObjectRelease(v70);
    *(_DWORD *)(a4 + 17) = *(_DWORD *)v96;
    *(_DWORD *)(a4 + 20) = *(_DWORD *)&v96[3];
    *(_DWORD *)(a4 + 33) = *(_DWORD *)v95;
    *(_DWORD *)(a4 + 36) = *(_DWORD *)&v95[3];
    *(_DWORD *)(a4 + 73) = *(_DWORD *)v94;
    *(_DWORD *)(a4 + 76) = *(_DWORD *)&v94[3];
    *(_DWORD *)(a4 + 116) = *(_DWORD *)&v93[3];
    *(_DWORD *)(a4 + 113) = *(_DWORD *)v93;
    *(_QWORD *)a4 = v91;
    *(_QWORD *)(a4 + 8) = v90;
    *(_BYTE *)(a4 + 16) = v85 & 1;
    *(_QWORD *)(a4 + 24) = v92;
    *(_BYTE *)(a4 + 32) = v88;
    *(double *)(a4 + 40) = v30;
    *(_QWORD *)(a4 + 48) = v32;
    *(_QWORD *)(a4 + 56) = v34;
    *(_QWORD *)(a4 + 64) = v36;
    *(_BYTE *)(a4 + 72) = 0;
    *(_QWORD *)(a4 + 80) = KeyPath;
    *(_QWORD *)(a4 + 88) = v89;
    *(_QWORD *)(a4 + 96) = v75;
    *(_QWORD *)(a4 + 104) = v77;
    *(_BYTE *)(a4 + 112) = v65 & 1;
    *(_QWORD *)(a4 + 120) = v80;
    sub_100007CD4(v91, v90, v85 & 1);
    swift_bridgeObjectRetain(v92);
    swift_retain(KeyPath);
    swift_retain(v89);
    sub_100007CD4(v75, v77, v65 & 1);
    swift_bridgeObjectRetain(v80);
    sub_100007C20(v75, v77, v65 & 1);
    swift_bridgeObjectRelease(v80);
    sub_100007C20(v91, v90, v85 & 1);
    swift_release(v89);
    swift_release(KeyPath);
    return swift_bridgeObjectRelease(v92);
  }
  else
  {
    v82 = *((_QWORD *)a3 + 7);
    v83 = type metadata accessor for LayoutConfiguration(0);
    v84 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v82, v83, v84);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000DE10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  Swift::String v44;
  Swift::String_optional v45;
  Swift::String v46;
  Swift::String v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _UNKNOWN **v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t result;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  uint64_t KeyPath;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v93[7];
  _BYTE v94[7];
  _BYTE v95[7];
  _BYTE v96[7];
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _UNKNOWN **v100;
  __int128 v101;
  Swift::String v102;

  v97 = a1;
  v98 = a2;
  v7 = sub_100007BB8();
  swift_bridgeObjectRetain(a2);
  v8 = Text.init<A>(_:)(&v97, &type metadata for String, v7);
  v12 = *(_QWORD *)(a3 + 48);
  if (v12)
  {
    v13 = v8;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v86 = v7;
    if (*(_BYTE *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v12);
        v17 = sub_1000082C8();
        v18 = type metadata accessor for ClusterMetrics();
        v19 = v18;
        v20 = &off_1000215D8;
      }
      else
      {
        swift_retain(v12);
        v17 = sub_1000082E4();
        v18 = type metadata accessor for WidgetMetrics();
        v19 = v18;
        v20 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v12);
      v17 = sub_1000082AC();
      v18 = type metadata accessor for ConsoleMetrics();
      v19 = v18;
      v20 = &off_100021638;
    }
    v99 = v18;
    v100 = v20;
    swift_release(v12);
    v97 = v17;
    sub_100007BFC(&v97, v19);
    v21 = ((uint64_t (__cdecl *)())v20[6])();
    v22 = v15 & 1;
    v23 = Text.font(_:)(v21, v13, v14, v22, v16);
    v90 = v24;
    v85 = v25;
    v27 = v26;
    sub_100007C20(v13, v14, v22);
    swift_release(v21);
    swift_bridgeObjectRelease(v16);
    v28 = sub_100007C30(&v97);
    v29 = static Edge.Set.bottom.getter(v28);
    v30 = EdgeInsets.init(_all:)(4.0);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v101 = *(_OWORD *)(a3 + 16);
    v37 = *((id *)&v101 + 1);
    v38 = (void *)CAFChargingTimeObservable.observed.getter();
    sub_100007D5C((uint64_t)&v101);
    v39 = objc_msgSend(v38, "remainingTimeInvalid");

    if (v39)
      v41 = static Color.secondary.getter(v40);
    else
      v41 = static Color.primary.getter(v40);
    v42 = v41;
    KeyPath = swift_getKeyPath(&unk_10001A4A0);
    v43 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v102._object = (void *)0xE000000000000000;
    v44._countAndFlagsBits = 0x4D45525F454D4954;
    v44._object = (void *)0xEE00474E494E4941;
    v45.value._countAndFlagsBits = 0x656772616843;
    v45.value._object = (void *)0xE600000000000000;
    v46._countAndFlagsBits = 0;
    v46._object = (void *)0xE000000000000000;
    v102._countAndFlagsBits = 0;
    v47 = NSLocalizedString(_:tableName:bundle:value:comment:)(v44, v45, (NSBundle)v43, v46, v102);

    v48 = String.init(format:_:)(v47._countAndFlagsBits, v47._object, &_swiftEmptyArrayStorage);
    v50 = v49;
    swift_bridgeObjectRelease(v47._object);
    v97 = v48;
    v98 = v50;
    v51 = Text.init<A>(_:)(&v97, &type metadata for String, v86);
    v53 = v52;
    v55 = v54;
    v56 = *(unsigned __int8 *)(v12 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    v91 = v23;
    v92 = v27;
    v89 = v42;
    v88 = v29;
    v58 = v57;
    if (v56 == 2)
    {
      swift_retain(v12);
      v59 = sub_1000082E4();
      v60 = type metadata accessor for WidgetMetrics();
      v61 = v60;
      v62 = &off_100021578;
    }
    else if (v56 == 1)
    {
      swift_retain(v12);
      v59 = sub_1000082C8();
      v60 = type metadata accessor for ClusterMetrics();
      v61 = v60;
      v62 = &off_1000215D8;
    }
    else
    {
      swift_retain(v12);
      v59 = sub_1000082AC();
      v60 = type metadata accessor for ConsoleMetrics();
      v61 = v60;
      v62 = &off_100021638;
    }
    v99 = v60;
    v100 = v62;
    swift_release(v12);
    v97 = v59;
    v63 = v55 & 1;
    sub_100007BFC(&v97, v61);
    v64 = ((uint64_t (__cdecl *)())v62[7])();
    v65 = v58;
    v66 = Text.font(_:)(v64, v51, v53, v63, v58);
    v68 = v67;
    v70 = v69;
    v72 = v71 & 1;
    sub_100007C20(v51, v53, v63);
    swift_release(v64);
    swift_bridgeObjectRelease(v65);
    v73 = sub_100007C30(&v97);
    v74 = static Color.secondary.getter(v73);
    v75 = Text.foregroundColor(_:)(v74, v66, v68, v72, v70);
    v77 = v76;
    LOBYTE(v65) = v78;
    v80 = v79;
    swift_release(v74);
    sub_100007C20(v66, v68, v72);
    swift_bridgeObjectRelease(v70);
    *(_DWORD *)(a4 + 17) = *(_DWORD *)v96;
    *(_DWORD *)(a4 + 20) = *(_DWORD *)&v96[3];
    *(_DWORD *)(a4 + 33) = *(_DWORD *)v95;
    *(_DWORD *)(a4 + 36) = *(_DWORD *)&v95[3];
    *(_DWORD *)(a4 + 73) = *(_DWORD *)v94;
    *(_DWORD *)(a4 + 76) = *(_DWORD *)&v94[3];
    *(_DWORD *)(a4 + 116) = *(_DWORD *)&v93[3];
    *(_DWORD *)(a4 + 113) = *(_DWORD *)v93;
    *(_QWORD *)a4 = v91;
    *(_QWORD *)(a4 + 8) = v90;
    *(_BYTE *)(a4 + 16) = v85 & 1;
    *(_QWORD *)(a4 + 24) = v92;
    *(_BYTE *)(a4 + 32) = v88;
    *(double *)(a4 + 40) = v30;
    *(_QWORD *)(a4 + 48) = v32;
    *(_QWORD *)(a4 + 56) = v34;
    *(_QWORD *)(a4 + 64) = v36;
    *(_BYTE *)(a4 + 72) = 0;
    *(_QWORD *)(a4 + 80) = KeyPath;
    *(_QWORD *)(a4 + 88) = v89;
    *(_QWORD *)(a4 + 96) = v75;
    *(_QWORD *)(a4 + 104) = v77;
    *(_BYTE *)(a4 + 112) = v65 & 1;
    *(_QWORD *)(a4 + 120) = v80;
    sub_100007CD4(v91, v90, v85 & 1);
    swift_bridgeObjectRetain(v92);
    swift_retain(KeyPath);
    swift_retain(v89);
    sub_100007CD4(v75, v77, v65 & 1);
    swift_bridgeObjectRetain(v80);
    sub_100007C20(v75, v77, v65 & 1);
    swift_bridgeObjectRelease(v80);
    sub_100007C20(v91, v90, v85 & 1);
    swift_release(v89);
    swift_release(KeyPath);
    return swift_bridgeObjectRelease(v92);
  }
  else
  {
    v82 = *(_QWORD *)(a3 + 56);
    v83 = type metadata accessor for LayoutConfiguration(0);
    v84 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v82, v83, v84);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000E3EC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _UNKNOWN **v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _UNKNOWN **v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t v71;
  void *v72;
  uint64_t KeyPath;
  uint64_t v74;
  id v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _UNKNOWN **v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  char v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t result;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  int v122;
  uint64_t v123;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  __int128 *v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  _UNKNOWN **v140;
  __int128 v141;
  __int128 v142;

  v137 = a1;
  v138 = a2;
  v10 = sub_100007BB8();
  swift_bridgeObjectRetain(a2);
  v134 = v10;
  v11 = Text.init<A>(_:)(&v137, &type metadata for String, v10);
  v15 = *(_QWORD *)(a3 + 48);
  if (v15)
  {
    v16 = v11;
    v17 = v12;
    v18 = v13;
    v19 = v14;
    v133 = a6;
    v126 = a5;
    v128 = (__int128 *)a3;
    if (*(_BYTE *)(v15 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(v15 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v15);
        v20 = sub_1000082C8();
        v21 = type metadata accessor for ClusterMetrics();
        v22 = v21;
        v23 = &off_1000215D8;
      }
      else
      {
        swift_retain(v15);
        v20 = sub_1000082E4();
        v21 = type metadata accessor for WidgetMetrics();
        v22 = v21;
        v23 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v15);
      v20 = sub_1000082AC();
      v21 = type metadata accessor for ConsoleMetrics();
      v22 = v21;
      v23 = &off_100021638;
    }
    v139 = v21;
    v140 = v23;
    swift_release(v15);
    v137 = v20;
    sub_100007BFC(&v137, v22);
    v24 = ((uint64_t (__cdecl *)())v23[6])();
    v25 = v18 & 1;
    v26 = Text.font(_:)(v24, v16, v17, v18 & 1, v19);
    v28 = v27;
    v30 = v29;
    v32 = v31 & 1;
    sub_100007C20(v16, v17, v25);
    swift_release(v24);
    swift_bridgeObjectRelease(v19);
    v33 = sub_100007C30(&v137);
    v34 = static Color.secondary.getter(v33);
    v35 = Text.foregroundColor(_:)(v34, v26, v28, v32, v30);
    v136 = v36;
    v130 = v37;
    v132 = v38;
    swift_release(v34);
    sub_100007C20(v26, v28, v32);
    swift_bridgeObjectRelease(v30);
    v137 = a4;
    v138 = v126;
    swift_bridgeObjectRetain(v126);
    v39 = Text.init<A>(_:)(&v137, &type metadata for String, v134);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v131 = v35;
    v122 = *(unsigned __int8 *)(v15 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    if (*(_BYTE *)(v15 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(v15 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(v15);
        v46 = sub_1000082C8();
        v47 = type metadata accessor for ClusterMetrics();
        v48 = v47;
        v49 = &off_1000215D8;
      }
      else
      {
        swift_retain(v15);
        v46 = sub_1000082E4();
        v47 = type metadata accessor for WidgetMetrics();
        v48 = v47;
        v49 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v15);
      v46 = sub_1000082AC();
      v47 = type metadata accessor for ConsoleMetrics();
      v48 = v47;
      v49 = &off_100021638;
    }
    v139 = v47;
    v140 = v49;
    swift_release(v15);
    v137 = v46;
    sub_100007BFC(&v137, v48);
    v50 = ((uint64_t (__cdecl *)())v49[8])();
    v51 = v43 & 1;
    v52 = Text.font(_:)(v50, v39, v41, v43 & 1, v45);
    v54 = v53;
    v56 = v55;
    v58 = v57;
    sub_100007C20(v39, v41, v51);
    swift_release(v50);
    swift_bridgeObjectRelease(v45);
    sub_100007C30(&v137);
    v142 = *v128;
    v59 = *((id *)&v142 + 1);
    v60 = (void *)CAFBatteryLevelObservable.observed.getter();
    sub_100007D5C((uint64_t)&v142);
    v61 = objc_msgSend(v60, "batteryLevelInvalid");

    if (v61)
      v63 = static Color.secondary.getter(v62);
    else
      v63 = static Color.primary.getter(v62);
    v64 = v63;
    v65 = v56 & 1;
    v66 = Text.foregroundColor(_:)(v63, v52, v54, v56 & 1, v58);
    v68 = v67;
    v70 = v69;
    v127 = v71;
    swift_release(v64);
    sub_100007C20(v52, v54, v65);
    swift_bridgeObjectRelease(v58);
    v141 = v128[2];
    v72 = (void *)*((_QWORD *)&v141 + 1);
    KeyPath = swift_getKeyPath(&unk_10001A4D0);
    v74 = swift_getKeyPath(&unk_10001A4F8);
    v75 = v72;
    static Published.subscript.getter(&v137, v75, KeyPath, v74);
    swift_release(KeyPath);
    swift_release(v74);
    sub_100007D5C((uint64_t)&v141);
    v77 = v137;
    v76 = v138;
    swift_bridgeObjectRelease(v138);
    v78 = HIBYTE(v76) & 0xF;
    if ((v76 & 0x2000000000000000) == 0)
      v78 = v77 & 0xFFFFFFFFFFFFLL;
    v125 = v68;
    if (v78)
    {
      v121 = v66;
      v79 = swift_getKeyPath(&unk_10001A4D0);
      v80 = swift_getKeyPath(&unk_10001A4F8);
      static Published.subscript.getter(&v137, v75, v79, v80);
      swift_release(v79);
      swift_release(v80);
      sub_100007D5C((uint64_t)&v141);
      v81 = Text.init<A>(_:)(&v137, &type metadata for String, v134);
      v83 = v82;
      v85 = v84;
      v87 = v86;
      v120 = v70;
      if (v122)
      {
        swift_retain(v15);
        if (v122 == 1)
        {
          v88 = sub_1000082C8();
          v89 = type metadata accessor for ClusterMetrics();
          v90 = v89;
          v91 = &off_1000215D8;
        }
        else
        {
          v88 = sub_1000082E4();
          v89 = type metadata accessor for WidgetMetrics();
          v90 = v89;
          v91 = &off_100021578;
        }
      }
      else
      {
        swift_retain(v15);
        v88 = sub_1000082AC();
        v89 = type metadata accessor for ConsoleMetrics();
        v90 = v89;
        v91 = &off_100021638;
      }
      v139 = v89;
      v140 = v91;
      swift_release(v15);
      v137 = v88;
      sub_100007BFC(&v137, v90);
      v98 = ((uint64_t (__cdecl *)())v91[7])();
      v99 = v85 & 1;
      v100 = Text.font(_:)(v98, v81, v83, v85 & 1, v87);
      v101 = v87;
      v103 = v102;
      v105 = v104;
      v107 = v106 & 1;
      sub_100007C20(v81, v83, v99);
      swift_release(v98);
      swift_bridgeObjectRelease(v101);
      v108 = sub_100007C30(&v137);
      v109 = static Color.secondary.getter(v108);
      v135 = Text.foregroundColor(_:)(v109, v100, v103, v107, v105);
      v129 = v110;
      v112 = v111;
      v123 = v113;
      swift_release(v109);
      v92 = v112 & 1;
      sub_100007C20(v100, v103, v107);
      swift_bridgeObjectRelease(v105);
      v94 = v132;
      v93 = v133;
      v95 = v136;
      v97 = v127;
      v96 = v121;
      v70 = v120;
    }
    else
    {
      v135 = 0;
      v129 = 0;
      v92 = 0;
      v123 = 0;
      v94 = v132;
      v93 = v133;
      v95 = v136;
      v96 = v66;
      v97 = v127;
    }
    LOBYTE(v137) = v130 & 1;
    *(_QWORD *)v93 = v131;
    *(_QWORD *)(v93 + 8) = v95;
    *(_BYTE *)(v93 + 16) = v130 & 1;
    *(_QWORD *)(v93 + 24) = v94;
    *(_QWORD *)(v93 + 32) = v96;
    *(_QWORD *)(v93 + 40) = v125;
    *(_BYTE *)(v93 + 48) = v70 & 1;
    *(_QWORD *)(v93 + 56) = v97;
    *(_QWORD *)(v93 + 64) = v135;
    *(_QWORD *)(v93 + 72) = v129;
    *(_QWORD *)(v93 + 80) = v92;
    *(_QWORD *)(v93 + 88) = v123;
    v114 = v92;
    v115 = v94;
    sub_100007CD4(v131, v95, v130 & 1);
    swift_bridgeObjectRetain(v115);
    sub_100007CD4(v96, v125, v70 & 1);
    swift_bridgeObjectRetain(v97);
    sub_10000F908(v135, v129, v114, v123);
    sub_10000FA40(v135, v129, v114, v123);
    sub_100007C20(v96, v125, v70 & 1);
    swift_bridgeObjectRelease(v97);
    sub_100007C20(v131, v136, v137);
    return swift_bridgeObjectRelease(v115);
  }
  else
  {
    v117 = *(_QWORD *)(a3 + 56);
    v118 = type metadata accessor for LayoutConfiguration(0);
    v119 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    result = EnvironmentObject.error()(0, v117, v118, v119);
    __break(1u);
  }
  return result;
}

void sub_10000EB84(uint64_t a1@<X8>)
{
  sub_10000A478(a1);
}

unint64_t sub_10000EBC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026EE8;
  if (!qword_100026EE8)
  {
    v1 = sub_100004DB0(&qword_100026E98);
    sub_10000812C(&qword_100026EF0, &qword_100026E90, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026EE8);
  }
  return result;
}

uint64_t sub_10000EC48()
{
  return sub_10000EF24(&qword_100026EF8, &qword_100026E80, (void (*)(void))sub_10000EC64);
}

uint64_t sub_10000EC64()
{
  return sub_10000EF24(&qword_100026F00, &qword_100026E78, (void (*)(void))sub_10000EC80);
}

unint64_t sub_10000EC80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026F08;
  if (!qword_100026F08)
  {
    v1 = sub_100004DB0(&qword_100026E70);
    sub_10000812C(&qword_100026EF0, &qword_100026E90, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_10000ED04();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026F08);
  }
  return result;
}

unint64_t sub_10000ED04()
{
  unint64_t result;

  result = qword_100026F10;
  if (!qword_100026F10)
  {
    result = swift_getWitnessTable(&unk_10001A2D0, &type metadata for AlignTopLeft);
    atomic_store(result, (unint64_t *)&qword_100026F10);
  }
  return result;
}

unint64_t sub_10000ED48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026F28;
  if (!qword_100026F28)
  {
    v1 = sub_100004DB0(&qword_100026ED8);
    sub_10000812C(&qword_100026F30, &qword_100026EC0, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026F28);
  }
  return result;
}

unint64_t sub_10000EDCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026F38;
  if (!qword_100026F38)
  {
    v1 = sub_100004DB0(&qword_100026EB0);
    sub_10000812C(&qword_100026F18, &qword_100026EB8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_10000FAAC(&qword_100026F20, &qword_100026EA0, (void (*)(void))sub_10000EBC4, (void (*)(void))sub_10000EC48);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026F38);
  }
  return result;
}

unint64_t sub_10000EE70()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100026F60;
  if (!qword_100026F60)
  {
    v1 = sub_100004DB0(&qword_100026F50);
    v2[0] = sub_100004DB0(&qword_100026F68);
    v2[1] = sub_10000EF24(&qword_100026F70, &qword_100026F68, (void (*)(void))sub_10000EF90);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.allowsGaugeResizing(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026F60);
  }
  return result;
}

uint64_t sub_10000EF24(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004DB0(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000EF90()
{
  return sub_10000EF24(&qword_100026F78, &qword_100026F80, (void (*)(void))sub_10000EFAC);
}

unint64_t sub_10000EFAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026F88;
  if (!qword_100026F88)
  {
    v1 = sub_100004DB0(&qword_100026F90);
    sub_10000812C(&qword_100026F98, &qword_100026FA0, (uint64_t)&protocol conformance descriptor for Gauge<A, B, C, D>);
    sub_10000812C(&qword_100026FA8, &qword_100026FB0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026F88);
  }
  return result;
}

double sub_10000F048(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 128) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_10000F064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11)
{
  uint64_t result;

  if (a7)
  {
    sub_100007CD4(a4, a5, a6 & 1);
    swift_bridgeObjectRetain(a7);
    sub_100007CD4(a8, a9, a10 & 1);
    return swift_bridgeObjectRetain(a11);
  }
  return result;
}

uint64_t sub_10000F0D4(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 128);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), v4);
  return a1;
}

uint64_t sub_10000F138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11)
{
  uint64_t result;

  if (a7)
  {
    sub_100007C20(a4, a5, a6 & 1);
    swift_bridgeObjectRelease(a7);
    sub_100007C20(a8, a9, a10 & 1);
    return swift_bridgeObjectRelease(a11);
  }
  return result;
}

uint64_t sub_10000F1A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_10000CE38(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_10000F1B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026FE0;
  if (!qword_100026FE0)
  {
    v1 = sub_100004DB0(&qword_100026FD8);
    sub_10000F234();
    sub_10000812C(&qword_100027008, &qword_100027010, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026FE0);
  }
  return result;
}

unint64_t sub_10000F234()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026FE8;
  if (!qword_100026FE8)
  {
    v1 = sub_100004DB0(&qword_100026FF0);
    sub_10000812C(&qword_100026FF8, &qword_100027000, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026FE8);
  }
  return result;
}

unint64_t sub_10000F2B8()
{
  unint64_t result;

  result = qword_100027018;
  if (!qword_100027018)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Double, &type metadata for Double);
    atomic_store(result, (unint64_t *)&qword_100027018);
  }
  return result;
}

uint64_t sub_10000F2FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000F324(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tint.setter(v1);
}

uint64_t sub_10000F34C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100007984(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double sub_10000F3A8(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 368) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
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

uint64_t sub_10000F3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41)
{
  uint64_t result;

  if (a10)
  {
    sub_100007CD4(a7, a8, a9 & 1);
    swift_retain(a18);
    swift_bridgeObjectRetain(a10);
    swift_retain(a17);
    sub_100007CD4(a19, a20, a21 & 1);
    swift_bridgeObjectRetain(a22);
    sub_100007CD4(a26, a27, a28 & 1);
    swift_retain(a37);
    swift_bridgeObjectRetain(a29);
    swift_retain(a36);
    sub_100007CD4(a38, a39, a40 & 1);
    return swift_bridgeObjectRetain(a41);
  }
  return result;
}

uint64_t sub_10000F51C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;

  v12 = *(_BYTE *)(a1 + 368);
  v10 = *(_OWORD *)(a1 + 320);
  v11 = *(_OWORD *)(a1 + 336);
  v8 = *(_OWORD *)(a1 + 288);
  v9 = *(_OWORD *)(a1 + 304);
  v6 = *(_OWORD *)(a1 + 256);
  v7 = *(_OWORD *)(a1 + 272);
  v4 = *(_OWORD *)(a1 + 224);
  v5 = *(_OWORD *)(a1 + 240);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v4,
    *((_QWORD *)&v4 + 1),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    v8,
    *((_QWORD *)&v8 + 1),
    v9,
    *((_QWORD *)&v9 + 1),
    v10,
    *((_QWORD *)&v10 + 1),
    v11,
    *((_QWORD *)&v11 + 1),
    *(_QWORD *)(a1 + 352),
    *(_QWORD *)(a1 + 360),
    v12);
  return a1;
}

uint64_t sub_10000F5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41)
{
  uint64_t result;

  if (a10)
  {
    sub_100007C20(a7, a8, a9 & 1);
    swift_release(a17);
    swift_bridgeObjectRelease(a10);
    swift_release(a18);
    sub_100007C20(a19, a20, a21 & 1);
    swift_bridgeObjectRelease(a22);
    sub_100007C20(a26, a27, a28 & 1);
    swift_release(a36);
    swift_bridgeObjectRelease(a29);
    swift_release(a37);
    sub_100007C20(a38, a39, a40 & 1);
    return swift_bridgeObjectRelease(a41);
  }
  return result;
}

uint64_t sub_10000F6F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(_QWORD *)(a1 + 120);
  v6 = *(_QWORD *)(a1 + 128);
  v7 = *(_BYTE *)(a1 + 136);
  v8 = *(_QWORD *)(a1 + 144);
  sub_100007CD4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_retain(v4);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  sub_100007CD4(v5, v6, v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t sub_10000F77C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(_QWORD *)(a1 + 120);
  v6 = *(_QWORD *)(a1 + 128);
  v7 = *(_BYTE *)(a1 + 136);
  v8 = *(_QWORD *)(a1 + 144);
  sub_100007C20(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v4);
  sub_100007C20(v5, v6, v7);
  swift_bridgeObjectRelease(v8);
  return a1;
}

double sub_10000F808(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 160) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_10000F828(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100007984(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000F86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15)
{
  uint64_t result;

  if (a7)
  {
    sub_100007CD4(a4, a5, a6 & 1);
    swift_bridgeObjectRetain(a7);
    sub_100007CD4(a8, a9, a10 & 1);
    swift_bridgeObjectRetain(a11);
    return sub_10000F908(a12, a13, a14, a15);
  }
  return result;
}

uint64_t sub_10000F908(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100007CD4(result, a2, a3 & 1);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

uint64_t sub_10000F938(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 160);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    v4);
  return a1;
}

uint64_t sub_10000F9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15)
{
  uint64_t result;

  if (a7)
  {
    sub_100007C20(a4, a5, a6 & 1);
    swift_bridgeObjectRelease(a7);
    sub_100007C20(a8, a9, a10 & 1);
    swift_bridgeObjectRelease(a11);
    return sub_10000FA40(a12, a13, a14, a15);
  }
  return result;
}

uint64_t sub_10000FA40(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100007C20(result, a2, a3 & 1);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_10000FA78()
{
  return sub_10000FAAC(&qword_100027048, &qword_100027050, (void (*)(void))sub_10000ED48, (void (*)(void))sub_10000EDCC);
}

uint64_t sub_10000FAAC(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_100004DB0(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000FB20()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_10001A590);
  v2 = swift_getKeyPath(&unk_10001A5B8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

id sub_10000FB90()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)CAFCarManager), "init");
  qword_100027058 = (uint64_t)result;
  return result;
}

uint64_t sub_10000FBC0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (qword_100026888 != -1)
    swift_once(&qword_100026888, sub_10000FB90);
  v0 = (void *)qword_100027058;
  v1 = sub_100007D84(0, &qword_1000271A8, CAFCarManager_ptr);
  v2 = sub_100004AE8(&qword_1000271B0, &qword_1000271A8, CAFCarManager_ptr, (uint64_t)&protocol conformance descriptor for CAFCarManager);
  v3 = v0;
  v4 = (void *)CAFObserved<>.observable.getter(v1, v2);

  v5 = type metadata accessor for ChargeCAFManager(0);
  v6 = swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  result = sub_10000FC98(v4);
  qword_100028D00 = v6;
  return result;
}

uint64_t sub_10000FC98(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
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
  uint64_t v15;
  os_log_type_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v23[3];

  v2 = v1;
  v4 = sub_100007984(&qword_1000271B8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v23[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100007984(&qword_1000271C0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v23[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v2 + OBJC_IVAR____TtC6Charge16ChargeCAFManager__model;
  v23[0] = 0;
  v13 = sub_100007984((uint64_t *)&unk_1000270B8);
  Published.init(initialValue:)(v23, v13);
  v14 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v15 = v2 + OBJC_IVAR____TtC6Charge16ChargeCAFManager_cancellables;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC6Charge16ChargeCAFManager_cancellables) = &_swiftEmptySetSingleton;
  v16 = static os_log_type_t.debug.getter(v14);
  sub_100009618(v16, 0xD000000000000020, 0x8000000100017E50, 0xD000000000000011, 0x8000000100017E80, 23);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC6Charge16ChargeCAFManager_carManager) = a1;
  v17 = a1;
  dispatch thunk of CAFCarManagerObservable.$currentCar.getter();
  v18 = swift_allocObject(&unk_100021540, 24, 7);
  swift_weakInit(v18 + 16, v2);
  v19 = sub_100010380();
  v20 = Publisher<>.sink(receiveValue:)(sub_100010378, v18, v4, v19);
  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess(v15, v23, 33, 0);
  AnyCancellable.store(in:)(v15);
  swift_endAccess(v23);
  swift_release(v20);

  return v2;
}

uint64_t sub_10000FEA4(void **a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  void *object;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t KeyPath;
  uint64_t v17;
  _QWORD v18[3];
  id v19;

  v2 = *a1;
  v3 = a2 + 16;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease(0xE000000000000000);
  v18[0] = 0xD000000000000014;
  v18[1] = 0x8000000100017EA0;
  v19 = v2;
  v2;
  v4 = sub_100007984(&qword_1000271D0);
  v5._countAndFlagsBits = String.init<A>(describing:)(&v19, v4);
  object = v5._object;
  String.append(_:)(v5);
  v7 = swift_bridgeObjectRelease(object);
  v8 = static os_log_type_t.debug.getter(v7);
  sub_100009618(v8, 0xD000000000000014, 0x8000000100017EA0, 0xD000000000000011, 0x8000000100017E80, 28);
  swift_bridgeObjectRelease(0x8000000100017EA0);
  swift_beginAccess(v3, v18, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v10 = result;
    if (v2)
    {
      v11 = sub_100007D84(0, &qword_1000271D8, CAFCar_ptr);
      v12 = sub_100004AE8(&qword_1000271E0, &qword_1000271D8, CAFCar_ptr, (uint64_t)&protocol conformance descriptor for CAFCar);
      v13 = (void *)CAFObserved<>.observable.getter(v11, v12);
      v14 = objc_allocWithZone((Class)type metadata accessor for ChargeModel(0));
      v15 = sub_100014C28(v13);
    }
    else
    {
      v15 = 0;
    }
    KeyPath = swift_getKeyPath(&unk_10001A590);
    v17 = swift_getKeyPath(&unk_10001A5B8);
    v19 = v15;
    return static Published.subscript.setter(&v19, v10, KeyPath, v17);
  }
  return result;
}

uint64_t sub_10001005C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = static os_log_type_t.debug.getter();
  sub_100009618(v1, 0xD000000000000025, 0x8000000100017EC0, 0x74696E696564, 0xE600000000000000, 35);
  v2 = v0 + OBJC_IVAR____TtC6Charge16ChargeCAFManager__model;
  v3 = sub_100007984(&qword_1000271C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC6Charge16ChargeCAFManager_cancellables));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100010104()
{
  return type metadata accessor for ChargeCAFManager(0);
}

uint64_t type metadata accessor for ChargeCAFManager(uint64_t a1)
{
  uint64_t result;

  result = qword_1000270A0;
  if (!qword_1000270A0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ChargeCAFManager);
  return result;
}

void sub_100010148(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_1000101D0(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
  }
}

void sub_1000101D0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000270B0)
  {
    v2 = sub_100004DB0((uint64_t *)&unk_1000270B8);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000270B0);
  }
}

uint64_t sub_100010228@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for ChargeCAFManager(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100010264@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_10001A590);
  v5 = swift_getKeyPath(&unk_10001A5B8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_1000102E0(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_10001A590);
  v5 = swift_getKeyPath(&unk_10001A5B8);
  v8 = v2;
  v6 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_100010354()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010378(void **a1)
{
  uint64_t v1;

  return sub_10000FEA4(a1, v1);
}

unint64_t sub_100010380()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000271C8;
  if (!qword_1000271C8)
  {
    v1 = sub_100004DB0(&qword_1000271B8);
    result = swift_getWitnessTable(&protocol conformance descriptor for Published<A>.Publisher, v1);
    atomic_store(result, (unint64_t *)&qword_1000271C8);
  }
  return result;
}

char *sub_1000103D4(void *a1, char a2)
{
  void *v2;
  id v5;
  char *v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  void *v11;
  objc_class *v12;
  _BYTE *v13;
  char *v14;
  id v15;
  id v16;
  objc_super v18;
  objc_super v19;

  v5 = objc_allocWithZone((Class)UIWindow);
  v6 = v2;
  v7 = objc_msgSend(v5, "initWithWindowScene:", a1);
  v8 = OBJC_IVAR____TtC6Charge19ChargeWindowManager_window;
  *(_QWORD *)&v6[OBJC_IVAR____TtC6Charge19ChargeWindowManager_window] = v7;
  objc_msgSend(v7, "setAutoresizesSubviews:", 1);
  objc_msgSend(*(id *)&v6[v8], "setHidden:", 0);
  v9 = *(id *)&v6[v8];
  objc_msgSend(v9, "makeKeyAndVisible");

  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for ChargeWindowManager();
  v10 = (char *)objc_msgSendSuper2(&v19, "init");
  v11 = *(void **)&v10[OBJC_IVAR____TtC6Charge19ChargeWindowManager_window];
  v12 = (objc_class *)type metadata accessor for ChargeViewController();
  v13 = objc_allocWithZone(v12);
  v13[OBJC_IVAR____TtC6Charge20ChargeViewController_presentationMode] = a2;
  v18.receiver = v13;
  v18.super_class = v12;
  v14 = v10;
  v15 = v11;
  v16 = objc_msgSendSuper2(&v18, "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v15, "setRootViewController:", v16, v18.receiver, v18.super_class);

  return v14;
}

id sub_100010550()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeWindowManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ChargeWindowManager()
{
  return objc_opt_self(_TtC6Charge19ChargeWindowManager);
}

uint64_t type metadata accessor for ConsoleMetrics()
{
  return objc_opt_self(_TtC6Charge14ConsoleMetrics);
}

uint64_t sub_1000105D0()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
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
  id v16;
  id v17;
  id v18;
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
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v1 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v2 = (void *)objc_opt_self(UIFontDescriptor);
  v3 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v4 = (void *)objc_opt_self(UIFont);
  v5 = objc_msgSend(v4, "systemFontOfSize:weight:", 34.0, UIFontWeightMedium);
  v6 = objc_msgSend(v1, "scaledFontForFont:", v5);

  *(_QWORD *)(v0 + 16) = Font.init(_:)(v6);
  v7 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v8 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v9 = objc_msgSend(v4, "systemFontOfSize:weight:", 64.0, UIFontWeightMedium);
  v10 = objc_msgSend(v7, "scaledFontForFont:", v9);

  *(_QWORD *)(v0 + 24) = Font.init(_:)(v10);
  v11 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v12 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v13 = objc_msgSend(v4, "systemFontOfSize:weight:", 22.0, UIFontWeightMedium);
  v14 = objc_msgSend(v11, "scaledFontForFont:", v13);

  *(_QWORD *)(v0 + 32) = Font.init(_:)(v14);
  v15 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v16 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v17 = objc_msgSend(v4, "systemFontOfSize:weight:", 18.0, UIFontWeightMedium);
  v18 = objc_msgSend(v15, "scaledFontForFont:", v17);

  v19 = Font.init(_:)(v18);
  v20 = Font.monospaced()();
  swift_release(v19);
  *(_QWORD *)(v0 + 40) = v20;
  v21 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleTitle1);
  v22 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle1);
  v23 = objc_msgSend(v4, "systemFontOfSize:weight:", 20.0, UIFontWeightMedium);
  v24 = objc_msgSend(v21, "scaledFontForFont:", v23);

  *(_QWORD *)(v0 + 48) = Font.init(_:)(v24);
  v25 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleTitle2);
  v26 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle2);
  v27 = objc_msgSend(v4, "systemFontOfSize:weight:", 24.0, UIFontWeightMedium);
  v28 = objc_msgSend(v25, "scaledFontForFont:", v27);

  *(_QWORD *)(v0 + 56) = Font.init(_:)(v28);
  v29 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleFootnote);
  v30 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote);
  v31 = objc_msgSend(v4, "systemFontOfSize:weight:", 14.0, UIFontWeightMedium);
  v32 = objc_msgSend(v29, "scaledFontForFont:", v31);

  *(_QWORD *)(v0 + 64) = Font.init(_:)(v32);
  v33 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v34 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v35 = objc_msgSend(v4, "systemFontOfSize:weight:", 55.0, UIFontWeightMedium);
  v36 = objc_msgSend(v33, "scaledFontForFont:", v35);

  *(_QWORD *)(v0 + 72) = Font.init(_:)(v36);
  *(_OWORD *)(v0 + 80) = xmmword_10001A600;
  *(_OWORD *)(v0 + 96) = xmmword_10001A610;
  *(_QWORD *)(v0 + 112) = 0;
  return v0;
}

double sub_100010B50()
{
  return 0.55;
}

uint64_t type metadata accessor for ClusterMetrics()
{
  return objc_opt_self(_TtC6Charge14ClusterMetrics);
}

uint64_t sub_100010B80()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
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
  id v16;
  id v17;
  id v18;
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
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v1 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v2 = (void *)objc_opt_self(UIFontDescriptor);
  v3 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v4 = (void *)objc_opt_self(UIFont);
  v5 = objc_msgSend(v4, "systemFontOfSize:weight:", 74.0, UIFontWeightMedium);
  v6 = objc_msgSend(v1, "scaledFontForFont:", v5);

  *(_QWORD *)(v0 + 16) = Font.init(_:)(v6);
  v7 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v8 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v9 = objc_msgSend(v4, "systemFontOfSize:weight:", 118.0, UIFontWeightMedium);
  v10 = objc_msgSend(v7, "scaledFontForFont:", v9);

  *(_QWORD *)(v0 + 24) = Font.init(_:)(v10);
  v11 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v12 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v13 = objc_msgSend(v4, "systemFontOfSize:weight:", 28.0, UIFontWeightMedium);
  v14 = objc_msgSend(v11, "scaledFontForFont:", v13);

  *(_QWORD *)(v0 + 32) = Font.init(_:)(v14);
  v15 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v16 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v17 = objc_msgSend(v4, "systemFontOfSize:weight:", 22.0, UIFontWeightMedium);
  v18 = objc_msgSend(v15, "scaledFontForFont:", v17);

  v19 = Font.init(_:)(v18);
  v20 = Font.monospaced()();
  swift_release(v19);
  *(_QWORD *)(v0 + 40) = v20;
  v21 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleTitle1);
  v22 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle1);
  v23 = objc_msgSend(v4, "systemFontOfSize:weight:", 36.0, UIFontWeightMedium);
  v24 = objc_msgSend(v21, "scaledFontForFont:", v23);

  *(_QWORD *)(v0 + 48) = Font.init(_:)(v24);
  v25 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleTitle2);
  v26 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle2);
  v27 = objc_msgSend(v4, "systemFontOfSize:weight:", 40.0, UIFontWeightMedium);
  v28 = objc_msgSend(v25, "scaledFontForFont:", v27);

  *(_QWORD *)(v0 + 56) = Font.init(_:)(v28);
  v29 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleFootnote);
  v30 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote);
  v31 = objc_msgSend(v4, "systemFontOfSize:weight:", 30.0, UIFontWeightMedium);
  v32 = objc_msgSend(v29, "scaledFontForFont:", v31);

  *(_QWORD *)(v0 + 64) = Font.init(_:)(v32);
  v33 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v34 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v35 = objc_msgSend(v4, "systemFontOfSize:weight:", 140.0, UIFontWeightMedium);
  v36 = objc_msgSend(v33, "scaledFontForFont:", v35);

  *(_QWORD *)(v0 + 72) = Font.init(_:)(v36);
  __asm { FMOV            V1.2D, #16.0 }
  *(_OWORD *)(v0 + 80) = xmmword_10001A620;
  *(_OWORD *)(v0 + 96) = _Q1;
  *(_QWORD *)(v0 + 112) = 0x4030000000000000;
  return v0;
}

double sub_100011114()
{
  return 0.52;
}

_QWORD *sub_100011120()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  swift_release(v0[6]);
  swift_release(v0[7]);
  swift_release(v0[8]);
  swift_release(v0[9]);
  return v0;
}

uint64_t sub_100011174()
{
  uint64_t v0;

  sub_100011120();
  return swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for WidgetMetrics()
{
  return objc_opt_self(_TtC6Charge13WidgetMetrics);
}

uint64_t sub_1000111B4()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
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
  id v16;
  id v17;
  id v18;
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
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v1 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v2 = (void *)objc_opt_self(UIFontDescriptor);
  v3 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v4 = (void *)objc_opt_self(UIFont);
  v5 = objc_msgSend(v4, "systemFontOfSize:weight:", 34.0, UIFontWeightMedium);
  v6 = objc_msgSend(v1, "scaledFontForFont:", v5);

  *(_QWORD *)(v0 + 16) = Font.init(_:)(v6);
  v7 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v8 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v9 = objc_msgSend(v4, "systemFontOfSize:weight:", 34.0, UIFontWeightMedium);
  v10 = objc_msgSend(v7, "scaledFontForFont:", v9);

  *(_QWORD *)(v0 + 24) = Font.init(_:)(v10);
  v11 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v12 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v13 = objc_msgSend(v4, "systemFontOfSize:weight:", 18.0, UIFontWeightMedium);
  v14 = objc_msgSend(v11, "scaledFontForFont:", v13);

  *(_QWORD *)(v0 + 32) = Font.init(_:)(v14);
  v15 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v16 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v17 = objc_msgSend(v4, "systemFontOfSize:weight:", 24.0, UIFontWeightMedium);
  v18 = objc_msgSend(v15, "scaledFontForFont:", v17);

  v19 = Font.init(_:)(v18);
  v20 = Font.monospaced()();
  swift_release(v19);
  *(_QWORD *)(v0 + 40) = v20;
  v21 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleTitle1);
  v22 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle1);
  v23 = objc_msgSend(v4, "systemFontOfSize:weight:", 34.0, UIFontWeightMedium);
  v24 = objc_msgSend(v21, "scaledFontForFont:", v23);

  *(_QWORD *)(v0 + 48) = Font.init(_:)(v24);
  v25 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleTitle2);
  v26 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle2);
  v27 = objc_msgSend(v4, "systemFontOfSize:weight:", 40.0, UIFontWeightMedium);
  v28 = objc_msgSend(v25, "scaledFontForFont:", v27);

  *(_QWORD *)(v0 + 56) = Font.init(_:)(v28);
  v29 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleFootnote);
  v30 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote);
  v31 = objc_msgSend(v4, "systemFontOfSize:weight:", 24.0, UIFontWeightMedium);
  v32 = objc_msgSend(v29, "scaledFontForFont:", v31);

  *(_QWORD *)(v0 + 64) = Font.init(_:)(v32);
  v33 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v34 = objc_msgSend(v2, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v35 = objc_msgSend(v4, "systemFontOfSize:weight:", 45.0, UIFontWeightMedium);
  v36 = objc_msgSend(v33, "scaledFontForFont:", v35);

  *(_QWORD *)(v0 + 72) = Font.init(_:)(v36);
  *(_OWORD *)(v0 + 80) = xmmword_10001A630;
  *(_OWORD *)(v0 + 96) = xmmword_10001A640;
  *(_QWORD *)(v0 + 112) = 0;
  return v0;
}

uint64_t sub_10001173C()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 16));
}

uint64_t sub_100011748()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 24));
}

uint64_t sub_100011754()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 32));
}

uint64_t sub_100011760()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 40));
}

uint64_t sub_10001176C()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 48));
}

uint64_t sub_100011778()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 56));
}

uint64_t sub_100011784()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 64));
}

uint64_t sub_100011790()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 72));
}

double sub_10001179C()
{
  return 0.5;
}

double sub_1000117A4()
{
  uint64_t v0;

  return *(double *)(*(_QWORD *)v0 + 88);
}

uint64_t sub_1000117B4(double a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleCallout);
  v3 = objc_msgSend((id)objc_opt_self(UIFontDescriptor), "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
  v4 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:weight:", a1, UIFontWeightMedium);
  v5 = objc_msgSend(v2, "scaledFontForFont:", v4);

  return Font.init(_:)(v5);
}

void destroy for ChargeView(uint64_t a1)
{
  swift_release(*(_QWORD *)a1);

}

uint64_t initializeWithCopy for ChargeView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
  v4 = (void *)a2[3];
  *(_QWORD *)(a1 + 24) = v4;
  swift_retain(v3);
  v5 = v4;
  return a1;
}

uint64_t *assignWithCopy for ChargeView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  a1[2] = a2[2];
  v6 = (void *)a2[3];
  v7 = (void *)a1[3];
  a1[3] = (uint64_t)v6;
  v8 = v6;

  return a1;
}

uint64_t *assignWithTake for ChargeView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  v5 = (void *)a1[3];
  a1[3] = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeView()
{
  return &type metadata for ChargeView;
}

uint64_t sub_100011A78(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001B534, 1);
}

_QWORD *sub_100011A88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t KeyPath;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *result;
  __int16 v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int16 v30;
  char v31;
  __int128 v32;
  __int16 v33;
  char v34;

  KeyPath = swift_getKeyPath(&unk_10001A830);
  v9 = swift_getKeyPath(&unk_10001A858);
  v10 = a3;
  static Published.subscript.getter(&v32, v10, KeyPath, v9);

  swift_release(KeyPath);
  swift_release(v9);
  if (v32 != 1)
  {
    v18 = type metadata accessor for LayoutConfiguration(0);
    v19 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    *(_QWORD *)&v29 = EnvironmentObject.init()(v18, v19);
    *((_QWORD *)&v29 + 1) = v20;
    v30 = 0;
    v31 = 1;
LABEL_11:
    v21 = sub_100007984(&qword_100027680);
    v22 = sub_100011CD0();
    v23 = sub_100004AA4();
    result = _ConditionalContent<>.init(storage:)(&v32, &v29, v21, &type metadata for NotChargingView, v22, v23);
    v25 = v33;
    v26 = v34;
    *(_OWORD *)a4 = v32;
    *(_WORD *)(a4 + 16) = v25;
    *(_BYTE *)(a4 + 18) = v26;
    return result;
  }
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) >= 2u)
      v11 = 1;
    else
      v11 = 2;
    v12 = type metadata accessor for ChargeModel(0);
    v13 = sub_1000042E8(&qword_100026E58, type metadata accessor for ChargeModel, (uint64_t)&unk_10001ABA0);
    *(_QWORD *)&v29 = ObservedObject.init(wrappedValue:)(v10, v12, v13);
    *((_QWORD *)&v29 + 1) = v14;
    LOBYTE(v30) = v11;
    HIBYTE(v30) = 1;
    v15 = sub_100011CF4();
    v16 = sub_100011D38();
    _ConditionalContent<>.init(storage:)(&v32, &v29, &type metadata for ChargeChart, &type metadata for ChargeGaugeView, v15, v16);
    if (HIBYTE(v33))
      v17 = 256;
    else
      v17 = 0;
    v29 = v32;
    v30 = v17 | v33;
    v31 = 0;
    goto LABEL_11;
  }
  v27 = type metadata accessor for LayoutConfiguration(0);
  v28 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
  result = (_QWORD *)EnvironmentObject.error()(0, a2, v27, v28);
  __break(1u);
  return result;
}

_QWORD *sub_100011CBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100011A88(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(void **)(v1 + 24), a1);
}

uint64_t sub_100011CD0()
{
  return sub_10000FAAC(&qword_100027688, &qword_100027680, (void (*)(void))sub_100011CF4, (void (*)(void))sub_100011D38);
}

unint64_t sub_100011CF4()
{
  unint64_t result;

  result = qword_100027690;
  if (!qword_100027690)
  {
    result = swift_getWitnessTable(&unk_10001A000, &type metadata for ChargeChart);
    atomic_store(result, (unint64_t *)&qword_100027690);
  }
  return result;
}

unint64_t sub_100011D38()
{
  unint64_t result;

  result = qword_100027698;
  if (!qword_100027698)
  {
    result = swift_getWitnessTable(&unk_10001A33C, &type metadata for ChargeGaugeView);
    atomic_store(result, (unint64_t *)&qword_100027698);
  }
  return result;
}

uint64_t sub_100011D7C()
{
  return sub_10000FAAC(&qword_1000276A0, &qword_1000276A8, (void (*)(void))sub_100011CD0, (void (*)(void))sub_100004AA4);
}

void sub_100011E08()
{
  void *v0;
  void *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  uint64_t (*v52)();
  Class isa;
  uint64_t (*v54)();
  uint64_t v55;
  char v56;
  uint64_t v57;
  objc_super v58;

  v1 = v0;
  v58.receiver = v0;
  v58.super_class = (Class)type metadata accessor for ChargeViewController();
  objc_msgSendSuper2(&v58, "viewDidLoad");
  v2 = *((_BYTE *)v0 + OBJC_IVAR____TtC6Charge20ChargeViewController_presentationMode);
  v3 = type metadata accessor for LayoutConfiguration(0);
  v4 = swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  type metadata accessor for CGSize(0);
  v54 = 0;
  v55 = 0;
  Published.init(initialValue:)(&v54, v5);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___consoleMetrics) = 0;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___clusterMetrics) = 0;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6Charge19LayoutConfiguration____lazy_storage___widgetMetrics) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) = v2;
  v54 = sub_100012498;
  v55 = 0;
  v56 = 0;
  v57 = v4;
  v6 = objc_allocWithZone((Class)sub_100007984(&qword_1000276E0));
  v7 = (void *)UIHostingController.init(rootView:)(&v54);
  objc_msgSend(v0, "addChildViewController:", v7);
  v8 = objc_msgSend(v7, "view");
  if (!v8)
  {
    __break(1u);
    goto LABEL_15;
  }
  v9 = v8;
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = objc_msgSend(v7, "view");
  if (!v10)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v11 = v10;
  v12 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v11, "setBackgroundColor:", v12);

  v13 = objc_msgSend(v1, "view");
  if (!v13)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v14 = v13;
  v15 = objc_msgSend(v7, "view");
  if (!v15)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v16 = v15;
  objc_msgSend(v14, "addSubview:", v15);

  objc_msgSend(v7, "didMoveToParentViewController:", v1);
  v17 = sub_100007984(&qword_1000276E8);
  v18 = swift_allocObject(v17, 64, 7);
  *(_OWORD *)(v18 + 16) = xmmword_10001A880;
  v19 = objc_msgSend(v7, "view");
  if (!v19)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v20 = v19;
  v21 = objc_msgSend(v19, "topAnchor");

  v22 = objc_msgSend(v1, "view");
  if (!v22)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, "safeAreaLayoutGuide");

  v25 = objc_msgSend(v24, "topAnchor");
  v26 = objc_msgSend(v21, "constraintEqualToAnchor:", v25);

  *(_QWORD *)(v18 + 32) = v26;
  v27 = objc_msgSend(v7, "view");
  if (!v27)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v28 = v27;
  v29 = objc_msgSend(v27, "bottomAnchor");

  v30 = objc_msgSend(v1, "view");
  if (!v30)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v31 = v30;
  v32 = objc_msgSend(v30, "safeAreaLayoutGuide");

  v33 = objc_msgSend(v32, "bottomAnchor");
  v34 = objc_msgSend(v29, "constraintEqualToAnchor:", v33);

  *(_QWORD *)(v18 + 40) = v34;
  v35 = objc_msgSend(v7, "view");
  if (!v35)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v36 = v35;
  v37 = objc_msgSend(v35, "leadingAnchor");

  v38 = objc_msgSend(v1, "view");
  if (!v38)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v39 = v38;
  v40 = objc_msgSend(v38, "safeAreaLayoutGuide");

  v41 = objc_msgSend(v40, "leadingAnchor");
  v42 = objc_msgSend(v37, "constraintEqualToAnchor:", v41);

  *(_QWORD *)(v18 + 48) = v42;
  v43 = objc_msgSend(v7, "view");
  if (!v43)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v44 = v43;
  v45 = objc_msgSend(v43, "trailingAnchor");

  v46 = objc_msgSend(v1, "view");
  if (v46)
  {
    v47 = v46;
    v48 = (void *)objc_opt_self(NSLayoutConstraint);
    v49 = objc_msgSend(v47, "safeAreaLayoutGuide");

    v50 = objc_msgSend(v49, "trailingAnchor");
    v51 = objc_msgSend(v45, "constraintEqualToAnchor:", v50);

    *(_QWORD *)(v18 + 56) = v51;
    v54 = (uint64_t (*)())v18;
    specialized Array._endMutation()();
    v52 = v54;
    sub_10001245C();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v52);
    objc_msgSend(v48, "activateConstraints:", isa);

    CAFSignpostEmit_Rendered();
    return;
  }
LABEL_25:
  __break(1u);
}

id sub_10001240C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ChargeViewController()
{
  return objc_opt_self(_TtC6Charge20ChargeViewController);
}

unint64_t sub_10001245C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000276F0;
  if (!qword_1000276F0)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000276F0);
  }
  return result;
}

uint64_t sub_100012498()
{
  if (qword_100026890 != -1)
    swift_once(&qword_100026890, sub_10000FBC0);
  return swift_retain(qword_100028D00);
}

uint64_t sub_1000124D8(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t destroy for ChargeContentView(uint64_t *a1)
{
  sub_100012510(*a1, a1[1]);
  return swift_release(a1[3]);
}

uint64_t sub_100012510(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t initializeWithCopy for ChargeContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_1000124D8(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  swift_retain(v7);
  return a1;
}

uint64_t assignWithCopy for ChargeContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_1000124D8(*(_QWORD *)a2, v5);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_100012510(v7, v8);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v9;
  swift_retain(v9);
  swift_release(v10);
  return a1;
}

uint64_t assignWithTake for ChargeContentView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_100012510(v5, v6);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release(v7);
  return a1;
}

ValueMetadata *type metadata accessor for ChargeContentView()
{
  return &type metadata for ChargeContentView;
}

uint64_t sub_100012654(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001B5B4, 1);
}

uint64_t sub_100012664@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  Swift::String v32;
  Swift::String_optional v33;
  Swift::String v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v60;
  uint64_t v61;
  uint64_t v62;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  Swift::String v88;

  v7 = a3 & 1;
  v8 = type metadata accessor for ChargeCAFManager(0);
  v9 = sub_1000042E8(&qword_1000276F8, type metadata accessor for ChargeCAFManager, (uint64_t)&unk_10001A554);
  v65 = a1;
  v66 = a2;
  v64 = v7;
  v10 = StateObject.wrappedValue.getter(a1, a2, v7, v8, v9);
  KeyPath = swift_getKeyPath(&unk_10001A918);
  v12 = swift_getKeyPath(&unk_10001A940);
  static Published.subscript.getter(&v78, v10, KeyPath, v12);
  swift_release(v10);
  swift_release(KeyPath);
  swift_release(v12);
  v13 = v78;
  if (v78)
  {
    v14 = type metadata accessor for LayoutConfiguration(0);
    v15 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    v16 = v13;
    v17 = EnvironmentObject.init()(v14, v15);
    v19 = v18;
    v20 = type metadata accessor for ChargeModel(0);
    v21 = sub_1000042E8(&qword_100026E58, type metadata accessor for ChargeModel, (uint64_t)&unk_10001ABA0);
    v22 = ObservedObject.init(wrappedValue:)(v16, v20, v21);
    v24 = v23;
    v25 = static ObservableObject.environmentStore.getter(v14, v15);
    v68 = v17;
    v69 = v19;
    v70 = v22;
    v71 = v24;
    v72 = v25;
    v73 = a4;
    v75 = 0;
    v76 = 0;
    v74 = 0;
    v77 = 0;
    swift_retain(v17);
    v26 = v24;
    swift_retain(v25);
    swift_retain_n(a4, 2);
    v27 = sub_100007984(&qword_100027700);
    v28 = sub_100007984(&qword_100027708);
    v29 = sub_100012E18(&qword_100027710, &qword_100027700, (void (*)(void))sub_100012DD4);
    v30 = sub_100012E18(&qword_100027730, &qword_100027708, (void (*)(void))sub_100012E9C);
    _ConditionalContent<>.init(storage:)(&v78, &v68, v27, v28, v29, v30);
    swift_release(a4);
    swift_release(v25);

    swift_release(v17);
  }
  else
  {
    v31 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v88._object = (void *)0xE000000000000000;
    v32._countAndFlagsBits = 0x494C414954494E49;
    v32._object = (void *)0xEC000000474E495ALL;
    v33.value._countAndFlagsBits = 0x656772616843;
    v33.value._object = (void *)0xE600000000000000;
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    v88._countAndFlagsBits = 0;
    v35 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, v33, (NSBundle)v31, v34, v88);

    v36 = String.init(format:_:)(v35._countAndFlagsBits, v35._object, &_swiftEmptyArrayStorage);
    v38 = v37;
    swift_bridgeObjectRelease(v35._object);
    v39 = type metadata accessor for LayoutConfiguration(0);
    v40 = sub_1000042E8((unint64_t *)&qword_1000269F0, type metadata accessor for LayoutConfiguration, (uint64_t)&unk_10001A1A0);
    v41 = EnvironmentObject.init()(v39, v40);
    v43 = v42;
    LOBYTE(v68) = 1;
    State.init(wrappedValue:)(&v78, &v68, &type metadata for Bool);
    v44 = v78;
    v45 = (void *)v79;
    v46 = static ObservableObject.environmentStore.getter(v39, v40);
    v68 = v41;
    v69 = v43;
    v70 = v44;
    v71 = v45;
    v72 = v36;
    v73 = v38;
    v74 = 0x4049000000000000;
    v75 = v46;
    v76 = a4;
    v77 = 1;
    swift_retain(a4);
    v47 = sub_100007984(&qword_100027700);
    v48 = sub_100007984(&qword_100027708);
    v49 = sub_100012E18(&qword_100027710, &qword_100027700, (void (*)(void))sub_100012DD4);
    v50 = sub_100012E18(&qword_100027730, &qword_100027708, (void (*)(void))sub_100012E9C);
    _ConditionalContent<>.init(storage:)(&v78, &v68, v47, v48, v49, v50);
  }
  v51 = v78;
  v52 = v79;
  v54 = v80;
  v53 = v81;
  v56 = v82;
  v55 = v83;
  v57 = v85;
  v61 = v86;
  v62 = v84;
  v60 = v87;
  v58 = swift_allocObject(&unk_1000217E8, 48, 7);
  *(_QWORD *)(v58 + 16) = v65;
  *(_QWORD *)(v58 + 24) = v66;
  *(_BYTE *)(v58 + 32) = v64 != 0;
  *(_QWORD *)(v58 + 40) = a4;
  *(_QWORD *)a5 = v51;
  *(_QWORD *)(a5 + 8) = v52;
  *(_QWORD *)(a5 + 16) = v54;
  *(_QWORD *)(a5 + 24) = v53;
  *(_QWORD *)(a5 + 32) = v56;
  *(_QWORD *)(a5 + 40) = v55;
  *(_QWORD *)(a5 + 48) = v62;
  *(_QWORD *)(a5 + 56) = v57;
  *(_QWORD *)(a5 + 64) = v61;
  *(_BYTE *)(a5 + 72) = v60;
  *(_QWORD *)(a5 + 80) = sub_100012F10;
  *(_QWORD *)(a5 + 88) = v58;
  sub_100012F28((uint64_t)v51, v52, v54, v53, v56, v55, v62, v57, v61, v60);
  swift_retain(v58);
  sub_1000124D8(v65, v66);
  swift_retain(a4);
  swift_release(v58);
  return sub_100012FAC(v51, v52, v54, v53, v56, v55, v62, v57, v61, v60);
}

uint64_t sub_100012B80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v23 = a5;
  v22 = a4;
  v10 = type metadata accessor for GeometryProxy(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = static Color.clear.getter(v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a1, v10);
  v15 = *(unsigned __int8 *)(v11 + 80);
  v16 = (v15 + 48) & ~v15;
  v17 = swift_allocObject(&unk_100021810, v16 + v12, v15 | 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  *(_BYTE *)(v17 + 32) = v22 & 1;
  v18 = v23;
  *(_QWORD *)(v17 + 40) = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v17 + v16, v14, v10);
  *a6 = v21;
  a6[1] = (uint64_t)sub_1000130B0;
  a6[3] = 0;
  a6[4] = 0;
  a6[2] = v17;
  sub_1000124D8(a2, a3);
  return swift_retain(v18);
}

uint64_t sub_100012CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  _QWORD v11[2];

  v5 = GeometryProxy.size.getter();
  v7 = v6;
  KeyPath = swift_getKeyPath(&unk_10001A960);
  v9 = swift_getKeyPath(&unk_10001A988);
  *(double *)v11 = v5;
  v11[1] = v7;
  swift_retain(a4);
  return static Published.subscript.setter(v11, a4, KeyPath, v9);
}

__n128 sub_100012D34@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __n128 result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[4];
  uint64_t v19;
  char v20;
  __n128 v21;

  v4 = *(_QWORD *)v2;
  v5 = *(_QWORD *)(v2 + 8);
  v6 = *(_BYTE *)(v2 + 16);
  v7 = *(_QWORD *)(v2 + 24);
  v8 = static Alignment.center.getter(a1);
  v10 = v9;
  sub_100012664(v4, v5, v6, v7, (uint64_t)v18);
  v11 = v19;
  v12 = v20;
  result = v21;
  v14 = v18[0];
  v15 = v18[1];
  v16 = v18[2];
  v17 = v18[3];
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v10;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v15;
  *(_OWORD *)(a2 + 48) = v16;
  *(_OWORD *)(a2 + 64) = v17;
  *(_QWORD *)(a2 + 80) = v11;
  *(_BYTE *)(a2 + 88) = v12;
  *(__n128 *)(a2 + 96) = result;
  return result;
}

unint64_t sub_100012DD4()
{
  unint64_t result;

  result = qword_100027718;
  if (!qword_100027718)
  {
    result = swift_getWitnessTable("=o", &type metadata for ChargeView);
    atomic_store(result, (unint64_t *)&qword_100027718);
  }
  return result;
}

uint64_t sub_100012E18(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004DB0(a2);
    a3();
    sub_10000812C(&qword_100027720, &qword_100027728, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100012E9C()
{
  unint64_t result;

  result = qword_100027738;
  if (!qword_100027738)
  {
    result = swift_getWitnessTable("Eo", &type metadata for ChargeSpinnerView);
    atomic_store(result, (unint64_t *)&qword_100027738);
  }
  return result;
}

uint64_t sub_100012EE0()
{
  uint64_t *v0;

  sub_100012510(v0[2], v0[3]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100012F10@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_100012B80(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t sub_100012F28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v14;
  id v15;

  if ((a10 & 1) != 0)
  {
    swift_retain(a9);
    swift_retain(a1);
    swift_retain(a4);
    swift_bridgeObjectRetain(a6);
    v14 = a8;
  }
  else
  {
    v14 = a5;
    swift_retain(a6);
    swift_retain(a1);
    v15 = a4;
  }
  return swift_retain(v14);
}

uint64_t sub_100012FAC(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;

  v10 = a6;
  if ((a10 & 1) != 0)
  {
    swift_bridgeObjectRelease(a6);
    swift_release(a8);
    swift_release(a1);
    a1 = a4;
    v10 = a9;
  }
  else
  {

    swift_release(a5);
  }
  swift_release(a1);
  return swift_release(v10);
}

uint64_t sub_100013030()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  sub_100012510(v0[2], v0[3]);
  swift_release(v0[5]);
  (*(void (**)(char *, uint64_t))(v2 + 8))((char *)v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000130B0()
{
  uint64_t v0;

  type metadata accessor for GeometryProxy(0);
  return sub_100012CB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1000130F8()
{
  return sub_10000812C(&qword_100027740, &qword_100027748, (uint64_t)&protocol conformance descriptor for ZStack<A>);
}

uint64_t *initializeBufferWithCopyOfBuffer for NotChargingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for NotChargingView(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t *assignWithCopy for NotChargingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  return a1;
}

uint64_t *assignWithTake for NotChargingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for NotChargingView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NotChargingView(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotChargingView()
{
  return &type metadata for NotChargingView;
}

uint64_t sub_10001329C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001B5F8, 1);
}

uint64_t sub_1000132AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  id v15;
  Swift::String v16;
  Swift::String_optional v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _UNKNOWN **v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t result;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[3];
  uint64_t v60;
  _UNKNOWN **v61;
  Swift::String v62;

  if (qword_100026880 != -1)
    swift_once(&qword_100026880, sub_100008FA8);
  v6 = qword_100028CF0;
  v7 = *(_QWORD *)algn_100028CF8;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100028CF8);
  v8 = Image.init(systemName:)(v6, v7);
  v9 = static Color.secondary.getter(v8);
  KeyPath = swift_getKeyPath(&unk_10001AA10);
  if (a1)
  {
    v57 = v9;
    v58 = v8;
    v56 = KeyPath;
    if (*(_BYTE *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(a1);
        v11 = sub_1000082C8();
        v12 = type metadata accessor for ClusterMetrics();
        v13 = v12;
        v14 = &off_1000215D8;
      }
      else
      {
        swift_retain(a1);
        v11 = sub_1000082E4();
        v12 = type metadata accessor for WidgetMetrics();
        v13 = v12;
        v14 = &off_100021578;
      }
    }
    else
    {
      swift_retain(a1);
      v11 = sub_1000082AC();
      v12 = type metadata accessor for ConsoleMetrics();
      v13 = v12;
      v14 = &off_100021638;
    }
    v60 = v12;
    v61 = v14;
    swift_release(a1);
    v59[0] = v11;
    sub_100007BFC(v59, v13);
    v55 = ((uint64_t (__cdecl *)())v14[2])();
    v54 = swift_getKeyPath(&unk_10001AA40);
    sub_100007C30(v59);
    v15 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v62._object = (void *)0xE000000000000000;
    v16._countAndFlagsBits = 0x524148435F544F4ELL;
    v16._object = (void *)0xEC000000474E4947;
    v17.value._countAndFlagsBits = 0x656772616843;
    v17.value._object = (void *)0xE600000000000000;
    v18._countAndFlagsBits = 0;
    v18._object = (void *)0xE000000000000000;
    v62._countAndFlagsBits = 0;
    v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, v17, (NSBundle)v15, v18, v62);

    v20 = String.init(format:_:)(v19._countAndFlagsBits, v19._object, &_swiftEmptyArrayStorage);
    v22 = v21;
    swift_bridgeObjectRelease(v19._object);
    v59[0] = v20;
    v59[1] = v22;
    v23 = sub_100007BB8();
    v24 = Text.init<A>(_:)(v59, &type metadata for String, v23);
    v26 = v25;
    v28 = v27;
    v30 = v29 & 1;
    v31 = static Color.secondary.getter(v24);
    v32 = Text.foregroundColor(_:)(v31, v24, v26, v30, v28);
    v34 = v33;
    v53 = v35;
    v37 = v36;
    swift_release(v31);
    sub_100007C20(v24, v26, v30);
    swift_bridgeObjectRelease(v28);
    if (*(_BYTE *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode))
    {
      if (*(_BYTE *)(a1 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 1)
      {
        swift_retain(a1);
        v38 = sub_1000082C8();
        v39 = type metadata accessor for ClusterMetrics();
        v40 = v39;
        v41 = &off_1000215D8;
      }
      else
      {
        swift_retain(a1);
        v38 = sub_1000082E4();
        v39 = type metadata accessor for WidgetMetrics();
        v40 = v39;
        v41 = &off_100021578;
      }
    }
    else
    {
      swift_retain(a1);
      v38 = sub_1000082AC();
      v39 = type metadata accessor for ConsoleMetrics();
      v40 = v39;
      v41 = &off_100021638;
    }
    v60 = v39;
    v61 = v41;
    swift_release(a1);
    v59[0] = v38;
    sub_100007BFC(v59, v40);
    v42 = ((uint64_t (__cdecl *)())v41[1])();
    v43 = Text.font(_:)(v42, v32, v34, v53 & 1, v37);
    v45 = v44;
    v47 = v46;
    v49 = v48 & 1;
    sub_100007C20(v32, v34, v53 & 1);
    swift_release(v42);
    swift_bridgeObjectRelease(v37);
    sub_100007C30(v59);
    *(_QWORD *)a3 = v58;
    *(_QWORD *)(a3 + 8) = v56;
    *(_QWORD *)(a3 + 16) = v57;
    *(_QWORD *)(a3 + 24) = v54;
    *(_QWORD *)(a3 + 32) = v55;
    *(_QWORD *)(a3 + 40) = v43;
    *(_QWORD *)(a3 + 48) = v45;
    *(_BYTE *)(a3 + 56) = v49;
    *(_QWORD *)(a3 + 64) = v47;
    swift_retain(v58);
    swift_retain(v56);
    swift_retain(v57);
    swift_retain(v54);
    swift_retain(v55);
    sub_100007CD4(v43, v45, v49);
    swift_bridgeObjectRetain(v47);
    sub_100007C20(v43, v45, v49);
    swift_release(v55);
    swift_release(v54);
    swift_release(v57);
    swift_release(v56);
    swift_release(v58);
    return swift_bridgeObjectRelease(v47);
  }
  else
  {
    v51 = type metadata accessor for LayoutConfiguration(0);
    v52 = sub_1000137D0();
    result = EnvironmentObject.error()(0, a2, v51, v52);
    __break(1u);
  }
  return result;
}

__n128 sub_100013744@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  __n128 result;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v5 = *v2;
  v4 = v2[1];
  v6 = static HorizontalAlignment.center.getter(a1);
  sub_1000132AC(v5, v4, (uint64_t)&v14);
  v7 = v15;
  v8 = v16;
  v9 = v18;
  v10 = v19;
  v11 = v20;
  result = v17;
  v13 = v14;
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_OWORD *)(a2 + 24) = v13;
  *(_QWORD *)(a2 + 40) = v7;
  *(_QWORD *)(a2 + 48) = v8;
  *(__n128 *)(a2 + 56) = result;
  *(_QWORD *)(a2 + 72) = v9;
  *(_BYTE *)(a2 + 80) = v10;
  *(_QWORD *)(a2 + 88) = v11;
  return result;
}

unint64_t sub_1000137D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000269F0;
  if (!qword_1000269F0)
  {
    v1 = type metadata accessor for LayoutConfiguration(255);
    result = swift_getWitnessTable(&unk_10001A1A0, v1);
    atomic_store(result, (unint64_t *)&qword_1000269F0);
  }
  return result;
}

unint64_t sub_100013824()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100027750;
  if (!qword_100027750)
  {
    v1 = sub_100004DB0(&qword_100027758);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100027750);
  }
  return result;
}

uint64_t destroy for ChargeSpinnerView(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[3]);
  return swift_bridgeObjectRelease(a1[5]);
}

uint64_t initializeWithCopy for ChargeSpinnerView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  v6 = a2[3];
  v5 = a2[4];
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v5;
  v8 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain(v3);
  swift_retain(v6);
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t *assignWithCopy for ChargeSpinnerView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  v6 = a1[3];
  v7 = a2[3];
  a1[3] = v7;
  swift_retain(v7);
  swift_release(v6);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  return a1;
}

__n128 initializeWithTake for ChargeSpinnerView(uint64_t a1, uint64_t a2)
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

uint64_t *assignWithTake for ChargeSpinnerView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  v5 = a1[3];
  a1[3] = a2[3];
  swift_release(v5);
  v6 = a2[5];
  v7 = a1[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease(v7);
  a1[6] = a2[6];
  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeSpinnerView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeSpinnerView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeSpinnerView()
{
  return &type metadata for ChargeSpinnerView;
}

uint64_t sub_100013AC0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001B63C, 1);
}

uint64_t sub_100013AD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _UNKNOWN **v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t KeyPath;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[328];
  _QWORD v59[41];
  char v60;
  char v61;
  _BYTE v62[336];
  _QWORD v63[41];
  _QWORD v64[6];

  v4 = sub_100007984(&qword_100027760);
  __chkstk_darwin(v4);
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[5];
  v59[0] = a1[4];
  v59[1] = v7;
  v8 = sub_100007BB8();
  swift_bridgeObjectRetain(v7);
  v9 = Text.init<A>(_:)(v59, &type metadata for String, v8);
  v13 = *a1;
  if (*a1)
  {
    v14 = v9;
    v15 = v10;
    v16 = v12;
    v17 = *(unsigned __int8 *)(v13 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode);
    v54 = v6;
    LODWORD(v57) = v11;
    if (v17)
    {
      if (v17 == 1)
      {
        swift_retain(v13);
        v18 = sub_1000082C8();
        v19 = type metadata accessor for ClusterMetrics();
        v20 = v19;
        v21 = &off_1000215D8;
      }
      else
      {
        swift_retain(v13);
        v18 = sub_1000082E4();
        v19 = type metadata accessor for WidgetMetrics();
        v20 = v19;
        v21 = &off_100021578;
      }
    }
    else
    {
      swift_retain(v13);
      v18 = sub_1000082AC();
      v19 = type metadata accessor for ConsoleMetrics();
      v20 = v19;
      v21 = &off_100021638;
    }
    v64[3] = v19;
    v64[4] = v21;
    swift_release(v13);
    v64[0] = v18;
    sub_100007BFC(v64, v20);
    v22 = ((uint64_t (__cdecl *)())v21[1])();
    v23 = v57 & 1;
    v56 = Text.font(_:)(v22, v14, v15, v57 & 1, v16);
    v57 = v24;
    v26 = v25;
    v55 = v27;
    sub_100007C20(v14, v15, v23);
    swift_release(v22);
    swift_bridgeObjectRelease(v16);
    v28 = sub_100007C30(v64);
    v29 = static Edge.Set.top.getter(v28);
    v30 = v29;
    if (*(_BYTE *)(v13 + OBJC_IVAR____TtC6Charge19LayoutConfiguration_presentationMode) == 2)
    {
      v31 = Image.init(systemName:)(0xD00000000000001BLL, 0x8000000100018140);
      v32 = type metadata accessor for Font.Design(0);
      v33 = (uint64_t)v54;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v54, 1, 1, v32);
      v34 = static Font.system(size:weight:design:)(0, 1, v33, 64.0);
      sub_1000147BC(v33);
      KeyPath = swift_getKeyPath(&unk_10001AAF8);
      v36 = static Edge.Set.all.getter(KeyPath);
      v59[0] = v31;
      v59[1] = KeyPath;
      v59[2] = v34;
      LOBYTE(v59[3]) = v36;
      memset(&v59[4], 0, 32);
      LOBYTE(v59[8]) = 1;
      sub_10001489C((uint64_t)v59);
    }
    else
    {
      v37 = static HorizontalAlignment.center.getter(v29);
      v38 = static Alignment.center.getter(v37);
      v40 = v39;
      sub_100013F34((uint64_t)a1, (uint64_t)&v59[5]);
      v58[0] = 1;
      v59[0] = v37;
      v59[1] = 0;
      LOBYTE(v59[2]) = 1;
      v59[3] = v38;
      v59[4] = v40;
      sub_100014504((uint64_t)v59);
    }
    sub_10000F828((uint64_t)v59, (uint64_t)v62, &qword_100027768);
    v41 = sub_100007984(&qword_100027770);
    v42 = sub_100007984(&qword_100027778);
    v43 = sub_100014510();
    v44 = sub_10000812C(&qword_100027788, &qword_100027778, (uint64_t)&protocol conformance descriptor for VStack<A>);
    _ConditionalContent<>.init(storage:)(v63, v62, v41, v42, v43, v44);
    v45 = v55 & 1;
    memcpy(v62, v63, 0x141uLL);
    memcpy(v58, v63, 0x141uLL);
    v61 = v55 & 1;
    v60 = 1;
    memcpy((char *)v59 + 7, v63, 0x141uLL);
    v46 = v55 & 1;
    v48 = v56;
    v47 = v57;
    *(_QWORD *)a2 = v56;
    *(_QWORD *)(a2 + 8) = v26;
    *(_BYTE *)(a2 + 16) = v46;
    *(_QWORD *)(a2 + 24) = v47;
    *(_BYTE *)(a2 + 32) = v30;
    *(_OWORD *)(a2 + 40) = 0u;
    *(_OWORD *)(a2 + 56) = 0u;
    *(_BYTE *)(a2 + 72) = 1;
    memcpy((void *)(a2 + 73), v59, 0x148uLL);
    sub_100007CD4(v48, v26, v45);
    swift_bridgeObjectRetain(v47);
    sub_100014654((uint64_t)v58, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10001457C);
    sub_100014654((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1000146E8);
    sub_100007C20(v48, v26, v45);
    return swift_bridgeObjectRelease(v47);
  }
  else
  {
    v50 = a1[1];
    v51 = type metadata accessor for LayoutConfiguration(0);
    v52 = sub_1000137D0();
    result = EnvironmentObject.error()(0, v50, v51, v52);
    __break(1u);
  }
  return result;
}

uint64_t sub_100013F34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, _QWORD, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  char v33;
  char v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t KeyPath;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  char v82;
  char v83;
  __int128 v84;
  uint64_t v85;
  unsigned int v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  uint64_t v101;
  uint64_t (*v102)();
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD v106[5];
  uint64_t v107;
  unsigned __int8 v108;
  uint64_t v109;
  unsigned __int8 v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unsigned int v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t v124;

  v4 = type metadata accessor for Color.RGBColorSpace(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v106, 0, 0, &_swiftEmptyArrayStorage, 5.0, 10.0, 0.0);
  v68 = v106[2];
  v67 = v106[3];
  v66 = v106[4];
  v8 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v65 = a2 + 104;
  v9 = v106[0];
  v10 = v106[1];
  v8(v7, enum case for Color.RGBColorSpace.sRGB(_:), v4);
  v64 = Color.init(_:red:green:blue:opacity:)(v7, 0.8, 0.8, 0.8, 1.0);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = static Alignment.center.getter(v64);
  _FrameLayout.init(width:height:alignment:)(&v107, v11, 0, v11, 0, v12, v13);
  v62 = v109;
  v63 = v107;
  v58 = v110;
  v59 = v108;
  v60 = v112;
  v61 = v111;
  v14 = StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(&v113, 0, 0, &_swiftEmptyArrayStorage, 5.0, 10.0, 0.0);
  v15 = v113;
  v56 = v115;
  v57 = v114;
  v16 = v116;
  v55 = v117;
  v17 = v118;
  v54 = static Color.blue.getter(v14);
  KeyPath = swift_getKeyPath(&unk_10001AB28);
  v18 = static Alignment.center.getter(KeyPath);
  _FrameLayout.init(width:height:alignment:)(&v119, v11, 0, v11, 0, v18, v19);
  v20 = v119;
  v21 = v120;
  v22 = v121;
  v23 = v122;
  v24 = v123;
  v25 = v124;
  v84 = *(_OWORD *)(a1 + 16);
  sub_100007984(&qword_100027790);
  v26 = State.wrappedValue.getter(&v71);
  if ((_BYTE)v71)
    v27 = -6.28318531;
  else
    v27 = 0.0;
  v28 = static UnitPoint.center.getter(v26);
  v30 = v29;
  v70 = v21;
  v69 = v23;
  v31 = swift_allocObject(&unk_1000219D0, 72, 7);
  v32 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v31 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v31 + 32) = v32;
  *(_OWORD *)(v31 + 48) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v31 + 64) = *(_QWORD *)(a1 + 48);
  v33 = v70;
  v34 = v69;
  v71 = xmmword_10001AA80;
  *(_QWORD *)&v72 = v15;
  v36 = v56;
  v35 = v57;
  *((_QWORD *)&v72 + 1) = __PAIR64__(v56, v57);
  *(_QWORD *)&v73 = v16;
  v37 = v54;
  v38 = v55;
  *((_QWORD *)&v73 + 1) = v55;
  *(_QWORD *)&v74 = v17;
  v39 = KeyPath;
  *((_QWORD *)&v74 + 1) = KeyPath;
  *(_QWORD *)&v75 = v54;
  *((_QWORD *)&v75 + 1) = v20;
  LOBYTE(v76) = v70;
  *((_QWORD *)&v76 + 1) = v22;
  LOBYTE(v77) = v69;
  *((_QWORD *)&v77 + 1) = v24;
  *(_QWORD *)&v78 = v25;
  *((double *)&v78 + 1) = v27;
  *(double *)&v79 = v28;
  *((_QWORD *)&v79 + 1) = v30;
  *(_QWORD *)&v80 = sub_100014978;
  *((_QWORD *)&v80 + 1) = v31;
  v81 = 0uLL;
  v83 = v59;
  v82 = v58;
  v40 = v75;
  v41 = v76;
  v42 = v78;
  *(_OWORD *)(a2 + 200) = v77;
  *(_OWORD *)(a2 + 184) = v41;
  *(_OWORD *)(a2 + 168) = v40;
  v43 = v73;
  *(_OWORD *)(a2 + 152) = v74;
  v44 = v80;
  *(_OWORD *)(v65 + 160) = v81;
  v45 = v79;
  *(_OWORD *)(a2 + 248) = v44;
  *(_OWORD *)(a2 + 232) = v45;
  *(_OWORD *)(a2 + 216) = v42;
  v46 = v71;
  v47 = v72;
  *(_OWORD *)(a2 + 136) = v43;
  *(_OWORD *)(a2 + 120) = v47;
  *(_OWORD *)(a2 + 104) = v46;
  v48 = v83;
  v49 = v82;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v68;
  v50 = v67;
  *(_QWORD *)(a2 + 24) = v67;
  *(_QWORD *)(a2 + 32) = v66;
  v51 = v64;
  *(_QWORD *)(a2 + 40) = v64;
  *(_WORD *)(a2 + 48) = 256;
  *(_QWORD *)(a2 + 56) = v63;
  *(_BYTE *)(a2 + 64) = v48;
  *(_QWORD *)(a2 + 72) = v62;
  *(_BYTE *)(a2 + 80) = v49;
  *(_QWORD *)(a2 + 88) = v61;
  *(_QWORD *)(a2 + 96) = v60;
  v84 = xmmword_10001AA80;
  v85 = v15;
  v86 = v35;
  v87 = v36;
  v88 = v16;
  v89 = v38;
  v90 = v17;
  v91 = v39;
  v92 = v37;
  v93 = v20;
  v94 = v33;
  v95 = v22;
  v96 = v34;
  v97 = v24;
  v98 = v25;
  v99 = v27;
  v100 = v28;
  v101 = v30;
  v102 = sub_100014978;
  v103 = v31;
  v104 = 0;
  v105 = 0;
  swift_bridgeObjectRetain(v50);
  swift_retain(v51);
  sub_100014980(&v71);
  sub_1000149F4((uint64_t *)a1);
  sub_100014A3C(&v84);
  swift_release(v51);
  return swift_bridgeObjectRelease(v50);
}

uint64_t sub_100014348(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];

  v2 = static Animation.linear(duration:)(2.0);
  v3 = Animation.repeatForever(autoreverses:)(0, v2);
  swift_release(v2);
  v5[2] = a1;
  withAnimation<A>(_:_:)(v3, sub_100014AB4, v5, (char *)&type metadata for () + 8);
  return swift_release(v3);
}

uint64_t sub_1000143C8(uint64_t a1)
{
  uint64_t v1;
  BOOL v3;
  __int128 v4;
  char v5;
  __int128 v6;
  uint64_t v7;

  v6 = *(_OWORD *)(a1 + 16);
  sub_10000F828((uint64_t)&v6 + 8, (uint64_t)&v7, &qword_100027798);
  sub_100014ACC(&v7);
  v1 = sub_100007984(&qword_100027790);
  State.wrappedValue.getter(&v5);
  v4 = v6;
  v3 = (v5 & 1) == 0;
  State.wrappedValue.setter(&v3, v1);
  return sub_100014AF4((uint64_t)&v6);
}

void *sub_100014474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v4;
  uint64_t v5;
  _OWORD v7[3];
  uint64_t v8;
  _BYTE __src[408];
  _BYTE v10[408];

  v4 = *(_OWORD *)(v2 + 16);
  v7[0] = *(_OWORD *)v2;
  v7[1] = v4;
  v7[2] = *(_OWORD *)(v2 + 32);
  v8 = *(_QWORD *)(v2 + 48);
  v5 = static HorizontalAlignment.center.getter(a1);
  sub_100013AD0((uint64_t *)v7, (uint64_t)__src);
  memcpy(&v10[7], __src, 0x191uLL);
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  return memcpy((void *)(a2 + 17), v10, 0x198uLL);
}

uint64_t sub_100014504(uint64_t result)
{
  *(_BYTE *)(result + 320) = 1;
  return result;
}

unint64_t sub_100014510()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100027780;
  if (!qword_100027780)
  {
    v1 = sub_100004DB0(&qword_100027770);
    sub_10000F234();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100027780);
  }
  return result;
}

uint64_t sub_10001457C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  if ((a41 & 1) != 0)
  {
    swift_retain(a27);
    swift_bridgeObjectRetain(a9);
    swift_retain(a11);
    swift_bridgeObjectRetain(a24);
    swift_retain(a26);
    sub_100014644(a37, a38);
    return sub_100014644(a39, a40);
  }
  else
  {
    swift_retain(a3);
    swift_retain(a1);
    return swift_retain(a2);
  }
}

uint64_t sub_100014644(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100014654(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  char v9;

  v9 = *(_BYTE *)(a1 + 320);
  v7 = *(_OWORD *)(a1 + 272);
  v8 = *(_OWORD *)(a1 + 288);
  v5 = *(_OWORD *)(a1 + 240);
  v6 = *(_OWORD *)(a1 + 256);
  v4 = *(_OWORD *)(a1 + 208);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    v4,
    *((_QWORD *)&v4 + 1),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    v8,
    *((_QWORD *)&v8 + 1),
    *(_QWORD *)(a1 + 304),
    *(_QWORD *)(a1 + 312),
    v9);
  return a1;
}

uint64_t sub_1000146E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  if ((a41 & 1) != 0)
  {
    swift_bridgeObjectRelease(a9);
    swift_release(a11);
    swift_bridgeObjectRelease(a24);
    swift_release(a26);
    swift_release(a27);
    sub_1000147AC(a37, a38);
    return sub_1000147AC(a39, a40);
  }
  else
  {
    swift_release(a1);
    swift_release(a2);
    return swift_release(a3);
  }
}

uint64_t sub_1000147AC(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_1000147BC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007984(&qword_100027760);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000147FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100014824@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001484C(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100014874(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10001489C(uint64_t result)
{
  *(_BYTE *)(result + 320) = 0;
  return result;
}

uint64_t sub_1000148A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000148CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000148F4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_10001491C(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100014944()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[5]);
  swift_bridgeObjectRelease(v0[7]);
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100014978()
{
  uint64_t v0;

  return sub_100014348(v0 + 16);
}

_QWORD *sub_100014980(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[5];
  v3 = a1[7];
  v4 = a1[18];
  v5 = a1[19];
  v6 = a1[20];
  v7 = a1[21];
  swift_retain(a1[8]);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  sub_100014644(v4, v5);
  sub_100014644(v6, v7);
  return a1;
}

uint64_t *sub_1000149F4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[5];
  swift_retain(a1[3]);
  swift_bridgeObjectRetain(v3);
  swift_retain(v2);
  return a1;
}

_QWORD *sub_100014A3C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[5];
  v3 = a1[8];
  v4 = a1[18];
  v5 = a1[19];
  v6 = a1[20];
  v7 = a1[21];
  swift_release(a1[7]);
  swift_bridgeObjectRelease(v2);
  swift_release(v3);
  sub_1000147AC(v4, v5);
  sub_1000147AC(v6, v7);
  return a1;
}

uint64_t sub_100014AB4()
{
  uint64_t v0;

  return sub_1000143C8(*(_QWORD *)(v0 + 16));
}

_QWORD *sub_100014ACC(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_100014AF4(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_100014B1C()
{
  return sub_10000812C(&qword_1000277A0, &qword_1000277A8, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_100014B48()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_10001AC20);
  v2 = swift_getKeyPath(&unk_10001AC48);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100014BB8()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_10001ABD8);
  v2 = swift_getKeyPath(&unk_10001AC00);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

id sub_100014C28(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  os_log_type_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  objc_super v28;
  _QWORD v29[3];

  v3 = sub_100007984(&qword_100027B10);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007984(&qword_100027B08);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = &v1[OBJC_IVAR____TtC6Charge11ChargeModel__isCharging];
  LOBYTE(v29[0]) = 0;
  v12 = v1;
  Published.init(initialValue:)(v29, &type metadata for Bool);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  v13 = &v12[OBJC_IVAR____TtC6Charge11ChargeModel__supplementaryStatusText];
  v29[0] = 0;
  v29[1] = 0xE000000000000000;
  Published.init(initialValue:)(v29, &type metadata for String);
  v14 = (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))(v13, v6, v3);
  v12[OBJC_IVAR____TtC6Charge11ChargeModel_hasEmittedFinalizedSignpost] = 0;
  v15 = static os_log_type_t.info.getter(v14);
  sub_100009618(v15, 0xD00000000000001BLL, 0x8000000100018410, 0xD000000000000014, 0x8000000100018430, 19);
  v16 = &v12[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess(&v12[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable], v29, 33, 0);
  v17 = type metadata accessor for CAFCarObservable(0);
  v18 = sub_1000163D0();
  v19 = a1;
  *(_QWORD *)v16 = ObservedObject.init(wrappedValue:)(v19, v17, v18);
  *((_QWORD *)v16 + 1) = v20;
  swift_endAccess(v29);

  v21 = (objc_class *)type metadata accessor for ChargeModel(0);
  v28.receiver = v12;
  v28.super_class = v21;
  v22 = objc_msgSendSuper2(&v28, "init");
  v23 = (void *)CAFCarObservable.observed.getter();
  objc_msgSend(v23, "registerObserver:", v22);

  v24 = (void *)CAFCarObservable.observed.getter();
  v25 = objc_msgSend(v24, "dimensionManager");

  objc_msgSend(v25, "registerObserver:", v22);
  sub_100014F7C();

  return v22;
}

void sub_100014F7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  os_log_type_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  os_log_type_t v12;
  os_log_type_t v13;
  _BYTE v14[24];

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC6Charge11ChargeModel__carObservable;
  swift_beginAccess(v0 + OBJC_IVAR____TtC6Charge11ChargeModel__carObservable, v14, 0, 0);
  v3 = *(id *)(v2 + 8);
  v4 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (v4)
  {
    v5 = static os_log_type_t.debug.getter();
    sub_100009618(v5, 0xD000000000000023, 0x80000001000182F0, 0xD000000000000011, 0x80000001000182D0, 70);
    v6 = objc_msgSend(v4, "chargingStatus");
    objc_msgSend(v6, "registerObserver:", v1);

    v7 = objc_msgSend(v4, "chargingTime");
    objc_msgSend(v7, "registerObserver:", v1);

    v8 = objc_msgSend(v4, "chargingRate");
    objc_msgSend(v8, "registerObserver:", v1);

  }
  v9 = *(id *)(v2 + 8);
  v10 = (void *)dispatch thunk of CAFCarObservable.tripComputer.getter();

  if (v10 && (v11 = objc_msgSend(v10, "remainingRange"), v10, v11))
  {
    v12 = static os_log_type_t.debug.getter();
    sub_100009618(v12, 0xD00000000000002ALL, 0x80000001000182A0, 0xD000000000000011, 0x80000001000182D0, 79);
    objc_msgSend(v11, "registerObserver:", v1);

  }
  else if (!v4)
  {
    return;
  }
  v13 = static os_log_type_t.debug.getter();
  sub_100009618(v13, 0x5D4547524148435BLL, 0xE800000000000000, 0x2928657461647075, 0xE800000000000000, 91);
  sub_1000155AC();
  sub_100015734();
}

uint64_t sub_100015388(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5, unint64_t *a6, _QWORD *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v20;

  v12 = sub_100007984(a5);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100007D84(0, a6, a7);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v16);
  v17 = a3;
  v18 = a1;
  sub_100015734();

  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_1000155AC()
{
  char *v0;
  void *v1;
  id *v2;
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  uint64_t KeyPath;
  uint64_t v8;
  BOOL v9;
  char v10[24];

  v1 = v0;
  v2 = (id *)&v0[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess(v2, v10, 0, 0);
  v3 = v2[1];
  v4 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (v4)
  {
    v5 = objc_msgSend(v4, "chargingStatus");

    if (v5)
    {
      v6 = sub_1000156D4((_BOOL8)objc_msgSend(v5, "chargingState"), (uint64_t)&off_100020D70)
        && sub_1000156D4((_BOOL8)objc_msgSend(v5, "cableState"), (uint64_t)&off_100020D98);
      KeyPath = swift_getKeyPath(&unk_10001AC20);
      v8 = swift_getKeyPath(&unk_10001AC48);
      v9 = v6;
      static Published.subscript.setter(&v9, v1, KeyPath, v8);

    }
  }
  sub_100015CD0();
}

BOOL sub_1000156D4(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

void sub_100015734()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  Swift::String v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  Swift::String v53;
  uint64_t v54;
  unint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t KeyPath;
  uint64_t v66;
  id v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72[24];
  uint64_t v73;
  unint64_t v74;

  v1 = v0;
  v2 = sub_100007984(&qword_100027AC0);
  v69 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v68 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007984(&qword_100027AC8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v10 = (char *)&v67 - v9;
  v73 = 0;
  v74 = 0xE000000000000000;
  v11 = (id *)&v0[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable];
  swift_beginAccess(&v0[OBJC_IVAR____TtC6Charge11ChargeModel__carObservable], v72, 0, 0);
  v12 = v11[1];
  v13 = (void *)dispatch thunk of CAFCarObservable.charging.getter();

  if (v13)
  {
    v14 = objc_msgSend(v13, "chargingRate");

    if (v14)
    {
      if (objc_msgSend(v14, "powerInvalid"))
      {
        v70 = 2108717;
        v71 = 0xE300000000000000;
        v15 = v11[1];
        v16 = (void *)CAFCarObservable.observed.getter();

        v17 = (void *)CAFCar.dimesionObservable.getter();
        v18 = (void *)dispatch thunk of CAFDimensionObservable.vehicleChargePowerUnit.getter();

        v19 = objc_msgSend(v18, "symbol");
        v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
        v22 = v21;

        v23._countAndFlagsBits = v20;
        v23._object = v22;
        String.append(_:)(v23);
        swift_bridgeObjectRelease(v22);
        v24 = v70;
        v25 = v71;
      }
      else
      {
        v26 = objc_msgSend(v14, "power");
        v27 = sub_100007D84(0, &qword_100027AD8, NSUnitPower_ptr);
        static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v26, v27);

        v28 = v11[1];
        v29 = v2;
        v30 = v1;
        v31 = (void *)CAFCarObservable.observed.getter();

        v32 = CAFCar.dimesionObservable.getter();
        v67 = v14;
        v33 = (void *)v32;

        v1 = v30;
        v2 = v29;
        Measurement<>.vehicleChargePowerUnit(using:)(v33);

        v34 = *(void (**)(char *, uint64_t))(v5 + 8);
        v34(v7, v4);
        v35 = Measurement<>.formattedString(maximumFractionDigits:)(2, v4);
        v25 = v36;
        v34(v10, v4);
        v24 = v35;
        v14 = v67;
      }
      v37 = v25;
      String.append(_:)(*(Swift::String *)&v24);
      swift_bridgeObjectRelease(v25);

    }
  }
  v38 = v11[1];
  v39 = (void *)dispatch thunk of CAFCarObservable.tripComputer.getter();

  if (v39)
  {
    v40 = objc_msgSend(v39, "remainingRange");

    if (v40)
    {
      v41 = v73 & 0xFFFFFFFFFFFFLL;
      if ((v74 & 0x2000000000000000) != 0)
        v41 = HIBYTE(v74) & 0xF;
      if (v41)
      {
        v42._countAndFlagsBits = 0x20A280E220;
        v42._object = (void *)0xA500000000000000;
        String.append(_:)(v42);
      }
      v43 = v11[1];
      v44 = (void *)CAFCarObservable.observed.getter();

      v45 = objc_msgSend(v44, "dimensionManager");
      v46 = objc_msgSend(v45, "measurementSystem");

      if (v46)
      {
        if (objc_msgSend(v40, "distanceMilesInvalid"))
        {
          v70 = 2108717;
          v71 = 0xE300000000000000;
          v47 = objc_msgSend((id)objc_opt_self(NSUnitLength), "miles");
          v48 = objc_msgSend(v47, "symbol");
LABEL_18:
          v49 = v48;

          v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
          v52 = v51;

          v53._countAndFlagsBits = v50;
          v53._object = v52;
          String.append(_:)(v53);
          swift_bridgeObjectRelease(v52);
          v54 = v70;
          v55 = v71;
LABEL_22:
          v62 = v55;
          String.append(_:)(*(Swift::String *)&v54);
          swift_bridgeObjectRelease(v55);

          goto LABEL_23;
        }
        v56 = objc_msgSend(v40, "distanceMiles");
      }
      else
      {
        if (objc_msgSend(v40, "distanceKMInvalid"))
        {
          v70 = 2108717;
          v71 = 0xE300000000000000;
          v47 = objc_msgSend((id)objc_opt_self(NSUnitLength), "kilometers");
          v48 = objc_msgSend(v47, "symbol");
          goto LABEL_18;
        }
        v56 = objc_msgSend(v40, "distanceKM");
      }
      v57 = v56;
      v58 = sub_100007D84(0, &qword_100027AD0, NSUnitLength_ptr);
      v59 = v68;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v57, v58);

      v60 = Measurement<>.formattedString(maximumFractionDigits:)(2, v2);
      v55 = v61;
      (*(void (**)(char *, uint64_t))(v69 + 8))(v59, v2);
      v54 = v60;
      goto LABEL_22;
    }
  }
LABEL_23:
  v63 = v73;
  v64 = v74;
  KeyPath = swift_getKeyPath(&unk_10001ABD8);
  v66 = swift_getKeyPath(&unk_10001AC00);
  v70 = v63;
  v71 = v64;
  static Published.subscript.setter(&v70, v1, KeyPath, v66);
  sub_100015CD0();
}

void sub_100015CD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  os_log_type_t v12;
  os_log_type_t v13;
  _BYTE v14[24];

  v1 = OBJC_IVAR____TtC6Charge11ChargeModel_hasEmittedFinalizedSignpost;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC6Charge11ChargeModel_hasEmittedFinalizedSignpost) & 1) != 0)
    return;
  v2 = v0;
  v3 = v0 + OBJC_IVAR____TtC6Charge11ChargeModel__carObservable;
  swift_beginAccess(v0 + OBJC_IVAR____TtC6Charge11ChargeModel__carObservable, v14, 0, 0);
  v4 = *(id *)(v3 + 8);
  v5 = (void *)CAFCarObservable.observed.getter();

  v6 = objc_msgSend(v5, "charging");
  if (!v6)
  {
LABEL_8:
    v12 = static os_log_type_t.info.getter();
    sub_100009618(v12, 0xD000000000000020, 0x8000000100018220, 0xD000000000000017, 0x8000000100018250, 207);
    return;
  }
  if (!objc_msgSend(v6, "receivedAllValues"))
  {

    goto LABEL_8;
  }
  v7 = *(id *)(v3 + 8);
  v8 = (void *)CAFCarObservable.observed.getter();

  v9 = objc_msgSend(v8, "highVoltageBattery");
  if (v9)
  {
    if (objc_msgSend(v9, "receivedAllValues"))
    {
      v10 = *(id *)(v3 + 8);
      v11 = (void *)CAFCarObservable.observed.getter();

      CAFSignpostEmit_Finalized(v11);
      *(_BYTE *)(v2 + v1) = 1;
      return;
    }

  }
  v13 = static os_log_type_t.info.getter();
  sub_100009618(v13, 0xD00000000000002ALL, 0x8000000100018270, 0xD000000000000017, 0x8000000100018250, 212);

}

id sub_100015ECC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChargeModel(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100015F84()
{
  return type metadata accessor for ChargeModel(0);
}

uint64_t type metadata accessor for ChargeModel(uint64_t a1)
{
  uint64_t result;

  result = qword_100027AA0;
  if (!qword_100027AA0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ChargeModel);
  return result;
}

void sub_100015FC8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[4];

  v6[0] = &unk_10001AB70;
  sub_100016084(319, &qword_100027AB0, (uint64_t)&type metadata for Bool);
  if (v3 <= 0x3F)
  {
    v6[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_100016084(319, &qword_100027AB8, (uint64_t)&type metadata for String);
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      v6[3] = &unk_10001AB88;
      swift_updateClassMetadata2(a1, 256, 4, v6, a1 + 80);
    }
  }
}

void sub_100016084(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = type metadata accessor for Published(0, a3);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1000160C8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for ChargeModel(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100016104@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_10001AC20);
  v5 = swift_getKeyPath(&unk_10001AC48);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100016180(char *a1, void **a2)
{
  char v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_10001AC20);
  v5 = swift_getKeyPath(&unk_10001AC48);
  v7 = v2;
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_1000161EC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_10001ABD8);
  v5 = swift_getKeyPath(&unk_10001AC00);
  static Published.subscript.getter(v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  v7 = v8[1];
  *a2 = v8[0];
  a2[1] = v7;
  return result;
}

uint64_t sub_100016268(uint64_t *a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_10001ABD8);
  v6 = swift_getKeyPath(&unk_10001AC00);
  v8[0] = v3;
  v8[1] = v2;
  swift_bridgeObjectRetain(v2);
  return static Published.subscript.setter(v8, v4, KeyPath, v6);
}

uint64_t sub_1000162F4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007984(&qword_100027AE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100016334(uint64_t a1)
{
  os_log_type_t v1;
  os_log_type_t v2;

  if ((a1 & 1) != 0)
  {
    v1 = static os_log_type_t.debug.getter(a1);
    sub_100009618(v1, 0xD00000000000001FLL, 0x80000001000183A0, 0xD000000000000022, 0x8000000100018370, 60);
    sub_100014F7C();
  }
  else
  {
    v2 = static os_log_type_t.info.getter(a1);
    sub_100009618(v2, 0xD000000000000020, 0x8000000100018340, 0xD000000000000022, 0x8000000100018370, 56);
  }
}

unint64_t sub_1000163D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100027B18;
  if (!qword_100027B18)
  {
    v1 = type metadata accessor for CAFCarObservable(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for CAFCarObservable, v1);
    atomic_store(result, (unint64_t *)&qword_100027B18);
  }
  return result;
}

id ConfigurationIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id ConfigurationIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for ConfigurationIntent()
{
  return objc_opt_self(ConfigurationIntent);
}

id ConfigurationIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id ConfigurationIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ConfigurationIntent.__deallocating_deinit()
{
  return sub_100016A78(type metadata accessor for ConfigurationIntent);
}

unint64_t ConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_100016AA8(a1);
}

BOOL sub_1000165BC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000165D0()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100016614()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001663C(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_10001667C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_100016AA8(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1000166AC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t ConfigurationIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___ConfigurationIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___ConfigurationIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *ConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___ConfigurationIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

char *ConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___ConfigurationIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id ConfigurationIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id ConfigurationIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_100016A78(type metadata accessor for ConfigurationIntentResponse);
}

id sub_100016A78(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_100016AA8(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for ConfigurationIntentResponse()
{
  return objc_opt_self(ConfigurationIntentResponse);
}

unint64_t sub_100016ADC()
{
  unint64_t result;

  result = qword_100027B88;
  if (!qword_100027B88)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ConfigurationIntentResponseCode, &type metadata for ConfigurationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_100027B88);
  }
  return result;
}

uint64_t sub_100016B20@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___ConfigurationIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_100016B70(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___ConfigurationIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationIntentResponseCode()
{
  return &type metadata for ConfigurationIntentResponseCode;
}

uint64_t sub_100016BD4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC6ChargeP33_DB98377976505DF73305BBD3DF7A4F1819ResourceBundleClass);
}
