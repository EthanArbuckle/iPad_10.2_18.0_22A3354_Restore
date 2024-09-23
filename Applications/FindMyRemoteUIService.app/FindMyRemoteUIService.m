int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;

  v3 = static CommandLine.argc.getter(*(_QWORD *)&argc, argv, envp);
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v3, v4, 0, 0);
  return 0;
}

uint64_t sub_100002A30(uint64_t a1, uint64_t a2)
{
  return sub_100002B78(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100002A3C(uint64_t a1, id *a2)
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

uint64_t sub_100002AB0(uint64_t a1, id *a2)
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

uint64_t sub_100002B2C@<X0>(_QWORD *a1@<X8>)
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

uint64_t sub_100002B6C(uint64_t a1, uint64_t a2)
{
  return sub_100002B78(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100002B78(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100002BB4(uint64_t a1)
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

Swift::Int sub_100002BF4(uint64_t a1)
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

void sub_100002C64(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_100002C6C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100002C80(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_100002CB0(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_100002CC4(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_100002CD8(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_100002D60@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100002D6C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100002DB0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100002DD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100002F04((unint64_t *)&qword_1000156D0, (uint64_t)&unk_10000D510);
  v3 = sub_100002F04(&qword_1000156D8, (uint64_t)&unk_10000D464);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for Key()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1000156B0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100010728);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000156B0);
  }
}

uint64_t sub_100002E98()
{
  return sub_100002F04(&qword_1000156B8, (uint64_t)&unk_10000D428);
}

uint64_t sub_100002EBC()
{
  return sub_100002F04(&qword_1000156C0, (uint64_t)&unk_10000D3FC);
}

uint64_t sub_100002EE0()
{
  return sub_100002F04(&qword_1000156C8, (uint64_t)&unk_10000D498);
}

uint64_t sub_100002F04(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_100002F44()
{
  return MKBGetDeviceLockState(0) == 0;
}

uint64_t sub_100002F64()
{
  return swift_task_switch(sub_100002F78, 0, 0);
}

uint64_t sub_100002F78()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100002FF4;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 1702259052, 0xE400000000000000, sub_100003058, 0, &type metadata for Bool);
}

uint64_t sub_100002FF4()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 16));
  return swift_task_switch(sub_100003048, 0, 0);
}

uint64_t sub_100003048()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 24));
}

void sub_100003058(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD aBlock[5];
  uint64_t v10;

  v2 = sub_1000033EC(&qword_100015700);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = *(unsigned __int8 *)(v3 + 80);
  v6 = (v5 + 16) & ~v5;
  v7 = swift_allocObject(&unk_100010800, v6 + v4, v5 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v7 + v6, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_100003490;
  v10 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003170;
  aBlock[3] = &unk_100010818;
  v8 = _Block_copy(aBlock);
  swift_release(v10);
  SBSRequestPasscodeUnlockUI(v8);
  _Block_release(v8);
}

uint64_t sub_100003170(uint64_t a1, int a2)
{
  uint64_t v2;
  void (*v3)(_BOOL8);
  _BOOL8 v4;

  v3 = *(void (**)(_BOOL8))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2 != 0;
  swift_retain(v2);
  v3(v4);
  return swift_release(v2);
}

uint64_t sub_1000031B0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000031C8, 0, 0);
}

uint64_t sub_1000031C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[2];
  v2 = swift_task_alloc(32);
  v0[3] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v0[4] = v3;
  *v3 = v0;
  v3[1] = sub_100003254;
  return withCheckedContinuation<A>(isolation:function:_:)(v3, 0, 0, 1702259052, 0xE400000000000000, sub_1000033E4, v2, (char *)&type metadata for () + 8);
}

uint64_t sub_100003254()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 32));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_1000032B0, 0, 0);
}

uint64_t sub_1000032B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000032BC()
{
  id v0;
  NSURL *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  unint64_t v8;
  Class isa;
  uint64_t v10;
  uint64_t v12;

  v0 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (v0)
  {
    v2 = v0;
    URL._bridgeToObjectiveC()(v1);
    v4 = v3;
    v5 = sub_1000033EC(&qword_1000156F0);
    inited = swift_initStackObject(v5, &v12);
    *(_OWORD *)(inited + 16) = xmmword_10000D560;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
    *(_QWORD *)(inited + 40) = v7;
    *(_QWORD *)(inited + 72) = &type metadata for Bool;
    *(_BYTE *)(inited + 48) = 1;
    v8 = sub_10000AFB8(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v4, isa);

  }
  v10 = sub_1000033EC(&qword_1000156E8);
  return CheckedContinuation.resume(returning:)(v10, v10);
}

uint64_t sub_1000033E4()
{
  return sub_1000032BC();
}

uint64_t sub_1000033EC(uint64_t *a1)
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

uint64_t sub_10000342C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000033EC(&qword_100015700);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100003490(char a1)
{
  uint64_t v2;
  char v4;

  sub_1000033EC(&qword_100015700);
  v4 = a1;
  v2 = sub_1000033EC(&qword_100015700);
  return CheckedContinuation.resume(returning:)(&v4, v2);
}

uint64_t sub_1000034F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003508(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100003510()
{
  return 1;
}

void sub_10000351C()
{
  Hasher._combine(_:)(0);
}

void sub_100003544()
{
  char *v0;
  void *v1;
  NSString v2;
  id v3;
  id v4;

  v1 = *(void **)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView];
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "setContentMode:", 2);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v2);

  objc_msgSend(v1, "setImage:", v3);
  v4 = objc_msgSend(v0, "contentView");
  objc_msgSend(v4, "addSubview:", v1);

}

void sub_10000362C()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  Class isa;

  v1 = v0;
  v2 = objc_msgSend(v0, "contentView");
  v3 = objc_msgSend(v2, "mainContentGuide");

  v4 = (void *)objc_opt_self(NSLayoutConstraint);
  v5 = sub_1000033EC(&qword_100015790);
  v6 = swift_allocObject(v5, 80, 7);
  *(_OWORD *)(v6 + 16) = xmmword_10000D570;
  v7 = *(void **)&v1[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView];
  v8 = objc_msgSend(v7, "topAnchor");
  v9 = objc_msgSend(v3, "topAnchor");
  v10 = objc_msgSend(v8, "constraintEqualToAnchor:", v9);

  *(_QWORD *)(v6 + 32) = v10;
  v11 = objc_msgSend(v7, "bottomAnchor");
  v12 = objc_msgSend(v3, "bottomAnchor");
  v13 = objc_msgSend(v11, "constraintEqualToAnchor:", v12);

  *(_QWORD *)(v6 + 40) = v13;
  v14 = objc_msgSend(v7, "leadingAnchor");
  v15 = objc_msgSend(v3, "leadingAnchor");
  v16 = objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15);

  *(_QWORD *)(v6 + 48) = v16;
  v17 = objc_msgSend(v7, "trailingAnchor");
  v18 = objc_msgSend(v3, "trailingAnchor");
  v19 = objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v18);

  *(_QWORD *)(v6 + 56) = v19;
  v20 = objc_msgSend(v7, "centerYAnchor");
  v21 = objc_msgSend(v3, "centerYAnchor");
  v22 = objc_msgSend(v20, "constraintEqualToAnchor:", v21);

  *(_QWORD *)(v6 + 64) = v22;
  v23 = objc_msgSend(v7, "centerXAnchor");
  v24 = objc_msgSend(v3, "centerXAnchor");
  v25 = objc_msgSend(v23, "constraintEqualToAnchor:", v24);

  *(_QWORD *)(v6 + 72) = v25;
  specialized Array._endMutation()();
  sub_100004BEC(0, &qword_100015798, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v4, "activateConstraints:", isa);

}

void sub_10000397C()
{
  char *v0;
  void *v1;
  id v2;
  Swift::String v3;
  Swift::String v4;
  void *object;
  NSString v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t inited;
  void *v22;
  NSString *v23;
  id v24;
  unint64_t v25;
  id v26;
  NSString v27;
  Class isa;
  id v29;
  _BYTE v30[72];
  Swift::String v31;
  Swift::String v32;

  v1 = (void *)objc_opt_self(NSBundle);
  v2 = objc_msgSend(v1, "mainBundle");
  v3._countAndFlagsBits = 0xD00000000000001DLL;
  v31._object = (void *)0xE000000000000000;
  v3._object = (void *)0x800000010000CA60;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  v31._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v31)._object;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v0, "setTitle:", v6);

  v7 = sub_100003CA4(*(_QWORD *)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo], *(_QWORD *)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo + 8], *(_QWORD *)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo + 16], *(_QWORD *)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo + 24]);
  if (v8)
  {
    v9 = v7;
    v10 = v8;
    v11 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0)
      v11 = v7 & 0xFFFFFFFFFFFFLL;
    if (v11)
    {
      v12 = objc_msgSend(v1, "mainBundle");
      v32._object = (void *)0xE000000000000000;
      v13._object = (void *)0x800000010000CA80;
      v13._countAndFlagsBits = 0xD000000000000016;
      v14._countAndFlagsBits = 0;
      v14._object = (void *)0xE000000000000000;
      v32._countAndFlagsBits = 0;
      v15 = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v32);

      v16 = sub_1000033EC(&qword_100015770);
      v17 = swift_allocObject(v16, 72, 7);
      *(_OWORD *)(v17 + 16) = xmmword_10000D560;
      *(_QWORD *)(v17 + 56) = &type metadata for String;
      *(_QWORD *)(v17 + 64) = sub_100004B60();
      *(_QWORD *)(v17 + 32) = v9;
      *(_QWORD *)(v17 + 40) = v10;
      static String.localizedStringWithFormat(_:_:)(v15._countAndFlagsBits, v15._object, v17);
      v19 = v18;
      swift_bridgeObjectRelease(v17);
      swift_bridgeObjectRelease(v15._object);
      v20 = sub_1000033EC(&qword_100015780);
      inited = swift_initStackObject(v20, v30);
      *(_OWORD *)(inited + 16) = xmmword_10000D560;
      *(_QWORD *)(inited + 32) = NSForegroundColorAttributeName;
      v22 = (void *)objc_opt_self(UIColor);
      v23 = NSForegroundColorAttributeName;
      v24 = objc_msgSend(v22, "secondaryLabelColor");
      *(_QWORD *)(inited + 64) = sub_100004BEC(0, &qword_100015788, UIColor_ptr);
      *(_QWORD *)(inited + 40) = v24;
      v25 = sub_10000B0EC(inited);
      v26 = objc_allocWithZone((Class)NSAttributedString);
      v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v19);
      type metadata accessor for Key();
      sub_100004BA4();
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v25);
      v29 = objc_msgSend(v26, "initWithString:attributes:", v27, isa);

      objc_msgSend(v0, "setAttributedSubtitle:", v29);
    }
    else
    {
      swift_bridgeObjectRelease(v8);
    }
  }
}

uint64_t sub_100003CA4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
  {
    v4 = a4;
    v5 = a3;
    v6 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0)
      v6 = a3 & 0xFFFFFFFFFFFFLL;
    if (v6)
      goto LABEL_9;
  }
  if (!a2)
    return 0;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  v4 = a2;
  v5 = a1;
  if (!v7)
    return 0;
LABEL_9:
  swift_bridgeObjectRetain(v4);
  return v5;
}

id sub_100003D48()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FMLostDeviceCardViewController()
{
  return objc_opt_self(_TtC21FindMyRemoteUIService30FMLostDeviceCardViewController);
}

ValueMetadata *type metadata accessor for FMLostDeviceCardViewController.AssetMetrics()
{
  return &type metadata for FMLostDeviceCardViewController.AssetMetrics;
}

uint64_t initializeBufferWithCopyOfBuffer for FMLostDeviceCardViewController.LostModeContactInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for FMLostDeviceCardViewController.LostModeContactInfo(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for FMLostDeviceCardViewController.LostModeContactInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for FMLostDeviceCardViewController.LostModeContactInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for FMLostDeviceCardViewController.LostModeContactInfo(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for FMLostDeviceCardViewController.LostModeContactInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMLostDeviceCardViewController.LostModeContactInfo(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FMLostDeviceCardViewController.LostModeContactInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMLostDeviceCardViewController.LostModeContactInfo()
{
  return &type metadata for FMLostDeviceCardViewController.LostModeContactInfo;
}

Swift::Int sub_100004014()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_100004054(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100004090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100004D30(v0, qword_100015708);
  v1 = sub_100004CDC(v0, (uint64_t)qword_100015708);
  if (qword_100015608 != -1)
    swift_once(&qword_100015608, sub_10000455C);
  v2 = sub_100004CDC(v0, (uint64_t)qword_100015720);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100004120@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
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
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v47 = a1;
  v50 = a5;
  v8 = type metadata accessor for URLComponents(0);
  v48 = *(_QWORD *)(v8 - 8);
  v49 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000033EC(&qword_1000157A0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v47 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v47 - v18;
  v20 = type metadata accessor for URLQueryItem(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
    goto LABEL_12;
  v24 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v24 = a3 & 0xFFFFFFFFFFFFLL;
  if (v24)
  {
    URLComponents.init(string:)(0x706F2F2F3A736D73);
    URLQueryItem.init(name:value:)(0x73736572646461, 0xE700000000000000, a3, a4);
    v26 = v48;
    v25 = v49;
    v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48);
    if (!v27(v19, 1, v49))
    {
      v28 = sub_1000033EC(&qword_1000157A8);
      v29 = *(unsigned __int8 *)(v21 + 80);
      v30 = (v29 + 32) & ~v29;
      v31 = swift_allocObject(v28, v30 + *(_QWORD *)(v21 + 72), v29 | 7);
      *(_OWORD *)(v31 + 16) = xmmword_10000D560;
      (*(void (**)(uint64_t, char *, uint64_t))(v21 + 16))(v31 + v30, v23, v20);
      URLComponents.queryItems.setter(v31);
    }
    if (v27(v19, 1, v25))
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
      v32 = type metadata accessor for URL(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v50, 1, 1, v32);
    }
    else
    {
      v46 = (*(uint64_t (**)(char *, char *, uint64_t))(v26 + 16))(v10, v19, v25);
      URLComponents.url.getter(v46);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v25);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    }
    return sub_100004CA0((uint64_t)v19, &qword_1000157A0);
  }
  else
  {
    if (!a2)
      goto LABEL_15;
LABEL_12:
    v33 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0)
      v33 = v47 & 0xFFFFFFFFFFFFLL;
    if (v33)
    {
      v34 = sub_1000033EC(&qword_100015770);
      v35 = swift_allocObject(v34, 72, 7);
      *(_OWORD *)(v35 + 16) = xmmword_10000D560;
      *(_QWORD *)(v35 + 56) = &type metadata for String;
      *(_QWORD *)(v35 + 64) = sub_100004B60();
      *(_QWORD *)(v35 + 32) = v47;
      *(_QWORD *)(v35 + 40) = a2;
      swift_bridgeObjectRetain(a2);
      v36 = String.init(format:_:)(0x253A6F746C69616DLL, 0xE900000000000040, v35);
      v38 = v37;
      URLComponents.init(string:)(v36);
      swift_bridgeObjectRelease(v38);
      sub_100004C24((uint64_t)v17, (uint64_t)v14);
      v40 = v48;
      v39 = v49;
      v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48))(v14, 1, v49);
      v42 = v50;
      if (v41 == 1)
      {
        sub_100004CA0((uint64_t)v17, &qword_1000157A0);
        sub_100004CA0((uint64_t)v14, &qword_1000157A0);
        v43 = type metadata accessor for URL(0);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v42, 1, 1, v43);
      }
      else
      {
        ((void (*)(void))URLComponents.url.getter)();
        sub_100004CA0((uint64_t)v17, &qword_1000157A0);
        return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v14, v39);
      }
    }
    else
    {
LABEL_15:
      v45 = type metadata accessor for URL(0);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v50, 1, 1, v45);
    }
  }
}

uint64_t sub_100004540(uint64_t *a1, uint64_t *a2)
{
  return sub_100004AB0(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_10000455C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004D30(v0, qword_100015720);
  sub_100004CDC(v0, (uint64_t)qword_100015720);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x800000010000D570, 0xD000000000000013, 0x800000010000CAA0);
}

uint64_t sub_1000045DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v37 - v7;
  v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(SPRemoteUILostModeDeviceTypeKey);
  v39 = v9;
  AnyHashable.init<A>(_:)(v40, &v38, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v10 = sub_10000BBF0((uint64_t)v40), (v11 & 1) != 0))
  {
    sub_100004CF4(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v41);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  sub_100004C6C((uint64_t)v40);
  if (!*((_QWORD *)&v42 + 1))
  {
    swift_bridgeObjectRelease(a1);
    sub_100004CA0((uint64_t)&v41, &qword_1000157B0);
LABEL_19:
    if (qword_100015600 != -1)
      swift_once(&qword_100015600, sub_100004090);
    v24 = sub_100004CDC(v2, (uint64_t)qword_100015708);
    v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v24, v2);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "No lost mode device type key, this is an invalid payload", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    return 0;
  }
  if ((swift_dynamicCast(&v38, &v41, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
    swift_bridgeObjectRelease(a1);
    goto LABEL_19;
  }
  v13 = v38;
  v12 = v39;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(SPRemoteUILostModeDeviceTypePencil);
  if (v14 == v13 && v15 == v12)
  {
    swift_bridgeObjectRelease_n(v12, 2);
  }
  else
  {
    v17 = v15;
    v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, v13, v12, 0);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v17);
    if ((v18 & 1) == 0)
    {
      swift_bridgeObjectRelease(a1);
      if (qword_100015600 != -1)
        swift_once(&qword_100015600, sub_100004090);
      v19 = sub_100004CDC(v2, (uint64_t)qword_100015708);
      v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v19, v2);
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Device type did not match", v23, 2u);
        swift_slowDealloc(v23, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return 0;
    }
  }
  *(_QWORD *)&v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(SPRemoteUILostModeOwnerEmailKey);
  *((_QWORD *)&v41 + 1) = v31;
  AnyHashable.init<A>(_:)(v40, &v41, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v32 = sub_10000BBF0((uint64_t)v40), (v33 & 1) != 0))
  {
    sub_100004CF4(*(_QWORD *)(a1 + 56) + 32 * v32, (uint64_t)&v41);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  sub_100004C6C((uint64_t)v40);
  if (*((_QWORD *)&v42 + 1))
  {
    if (swift_dynamicCast(&v38, &v41, (char *)&type metadata for Any + 8, &type metadata for String, 6))
      v29 = v38;
    else
      v29 = 0;
  }
  else
  {
    sub_100004CA0((uint64_t)&v41, &qword_1000157B0);
    v29 = 0;
  }
  v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(SPRemoteUILostModeOwnerPhoneKey);
  v39 = v34;
  AnyHashable.init<A>(_:)(v40, &v38, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v35 = sub_10000BBF0((uint64_t)v40), (v36 & 1) != 0))
  {
    sub_100004CF4(*(_QWORD *)(a1 + 56) + 32 * v35, (uint64_t)&v41);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  swift_bridgeObjectRelease(a1);
  sub_100004C6C((uint64_t)v40);
  if (*((_QWORD *)&v42 + 1))
    swift_dynamicCast(&v38, &v41, (char *)&type metadata for Any + 8, &type metadata for String, 6);
  else
    sub_100004CA0((uint64_t)&v41, &qword_1000157B0);
  return v29;
}

uint64_t sub_100004AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v12;
  uint64_t result;

  if (!a2)
  {
    if (a6)
      return 0;
    goto LABEL_8;
  }
  if (!a6)
    return 0;
  if (a1 == a5 && a2 == a6
    || (v12 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a5, a6, 0), result = 0, (v12 & 1) != 0))
  {
LABEL_8:
    if (a4)
    {
      if (a8 && (a3 == a7 && a4 == a8 || (_stringCompareWithSmolCheck(_:_:expecting:)(a3, a4, a7, a8, 0) & 1) != 0))
        return 1;
    }
    else if (!a8)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_100004B60()
{
  unint64_t result;

  result = qword_100015778;
  if (!qword_100015778)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100015778);
  }
  return result;
}

unint64_t sub_100004BA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000156D0;
  if (!qword_1000156D0)
  {
    type metadata accessor for Key();
    result = swift_getWitnessTable(&unk_10000D510, v1);
    atomic_store(result, (unint64_t *)&qword_1000156D0);
  }
  return result;
}

uint64_t sub_100004BEC(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100004C24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033EC(&qword_1000157A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004C6C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100004CA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000033EC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100004CDC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100004CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100004D30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_100004D80()
{
  return 0;
}

ValueMetadata *type metadata accessor for FMLostDeviceCardViewController.AssetMetrics.DeviceType()
{
  return &type metadata for FMLostDeviceCardViewController.AssetMetrics.DeviceType;
}

uint64_t _s21FindMyRemoteUIService30FMLostDeviceCardViewControllerC19LostModeContactInfoV10DeviceTypeOwet_0(unsigned int *a1, int a2)
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

uint64_t _s21FindMyRemoteUIService30FMLostDeviceCardViewControllerC19LostModeContactInfoV10DeviceTypeOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100004E2C + 4 * byte_10000D580[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100004E4C + 4 * byte_10000D585[v4]))();
}

_BYTE *sub_100004E2C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100004E4C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100004E54(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100004E5C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100004E64(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100004E6C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FMLostDeviceCardViewController.LostModeContactInfo.DeviceType()
{
  return &type metadata for FMLostDeviceCardViewController.LostModeContactInfo.DeviceType;
}

unint64_t sub_100004E8C()
{
  unint64_t result;

  result = qword_1000157B8;
  if (!qword_1000157B8)
  {
    result = swift_getWitnessTable(&unk_10000D628, &type metadata for FMLostDeviceCardViewController.LostModeContactInfo.DeviceType);
    atomic_store(result, (unint64_t *)&qword_1000157B8);
  }
  return result;
}

unint64_t sub_100004ED4()
{
  unint64_t result;

  result = qword_1000157C0;
  if (!qword_1000157C0)
  {
    result = swift_getWitnessTable(&unk_10000D6D0, &type metadata for FMLostDeviceCardViewController.AssetMetrics.DeviceType);
    atomic_store(result, (unint64_t *)&qword_1000157C0);
  }
  return result;
}

uint64_t _s12DependenciesVwxx(_QWORD *a1)
{
  swift_release(a1[1]);
  swift_release(a1[3]);
  return swift_release(a1[5]);
}

uint64_t _s12DependenciesVwcp(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 40) = v4;
  swift_retain(v3);
  swift_retain(v6);
  swift_retain(v4);
  return a1;
}

_QWORD *_s12DependenciesVwca(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_retain(v6);
  swift_release(v7);
  v9 = a2[4];
  v8 = a2[5];
  v10 = a1[5];
  a1[4] = v9;
  a1[5] = v8;
  swift_retain(v8);
  swift_release(v10);
  return a1;
}

__n128 _s12DependenciesVwtk(uint64_t a1, uint64_t a2)
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

uint64_t _s12DependenciesVwta(uint64_t a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  v5 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release(v5);
  v6 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];
  swift_release(v6);
  return a1;
}

uint64_t _s12DependenciesVwet(uint64_t *a1, int a2)
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

uint64_t _s12DependenciesVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *_s12DependenciesVMa()
{
  return &_s12DependenciesVN;
}

uint64_t sub_100005134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100004D30(v0, qword_1000157C8);
  v1 = sub_100004CDC(v0, (uint64_t)qword_1000157C8);
  if (qword_100015618 != -1)
    swift_once(&qword_100015618, sub_100007C70);
  v2 = sub_100004CDC(v0, (uint64_t)qword_1000157E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1000051C4()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char v15;

  sub_100007C58(v0, (uint64_t)&v12);
  v1 = v12;
  if (!v15)
  {
    v6 = v13;
    v2 = v14;
    _StringGuts.grow(_:)(18);
    v10 = 0;
    v11 = 0xE000000000000000;
    v4 = 0x800000010000CBC0;
    v3 = 0xD000000000000010;
    goto LABEL_5;
  }
  if (v15 == 1)
  {
    v6 = v13;
    v2 = v14;
    _StringGuts.grow(_:)(20);
    v10 = 0;
    v11 = 0xE000000000000000;
    v3 = 0xD000000000000012;
    v4 = 0x800000010000CBA0;
LABEL_5:
    String.append(_:)(*(Swift::String *)&v3);
    v7 = v1;
    v8 = v6;
    v9 = v2;
    _print_unlocked<A, B>(_:_:)(&v7, &v10, &type metadata for FMLostDeviceCardViewController.LostModeContactInfo, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    return v10;
  }
  if (v14 | *((_QWORD *)&v13 + 1) | (unint64_t)v13 | v12)
    return 0x64656873696E6966;
  else
    return 0x7472617453746F6ELL;
}

uint64_t sub_100005328(__int128 *a1, __int128 *a2)
{
  __int128 v4[2];
  __int128 v5[2];

  sub_100007C58(a1, (uint64_t)v4);
  sub_100007C58(a2, (uint64_t)v5);
  return sub_100007E80(v4, v5) & 1;
}

uint64_t sub_100005370()
{
  __int128 *v0;
  _BYTE v2[40];

  sub_100007C58(v0, (uint64_t)v2);
  return sub_1000051C4();
}

void sub_100005444(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[2];
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = a1;
  swift_retain(a1);
  swift_release(v4);
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    goto LABEL_14;
  v27[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(SPRemoteUILostModeInfoKey);
  v27[1] = v6;
  AnyHashable.init<A>(_:)(v28, v27, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v5 + 16) && (v7 = sub_10000BBF0((uint64_t)v28), (v8 & 1) != 0))
  {
    sub_100004CF4(*(_QWORD *)(v5 + 56) + 32 * v7, (uint64_t)&v29);
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  sub_100004C6C((uint64_t)v28);
  if (!*((_QWORD *)&v30 + 1))
  {
    sub_100004CA0((uint64_t)&v29, &qword_1000157B0);
    goto LABEL_14;
  }
  v9 = sub_1000033EC(&qword_1000158A8);
  if ((swift_dynamicCast(v27, &v29, (char *)&type metadata for Any + 8, v9, 6) & 1) == 0)
  {
LABEL_14:
    if (qword_100015610 != -1)
      swift_once(&qword_100015610, sub_100005134);
    v20 = type metadata accessor for Logger(0);
    v21 = sub_100004CDC(v20, (uint64_t)qword_1000157C8);
    v16 = Logger.logObject.getter(v21);
    v17 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v16, v17))
      goto LABEL_19;
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    v19 = "We neither have user info or a valid value for SPRemoteUILostModeInfoKey.  Bailing";
    goto LABEL_18;
  }
  v10 = sub_1000045DC(v27[0]);
  if (v11 == 1)
  {
    if (qword_100015610 != -1)
      swift_once(&qword_100015610, sub_100005134);
    v14 = type metadata accessor for Logger(0);
    v15 = sub_100004CDC(v14, (uint64_t)qword_1000157C8);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v16, v17))
      goto LABEL_19;
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    v19 = "Lost mode dict is malformed and can't create lost mode info.  Bailing";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v16, v17, v19, v18, 2u);
    swift_slowDealloc(v18, -1, -1);
LABEL_19:

    return;
  }
  v22 = (uint64_t *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo);
  v23 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo);
  v24 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 8);
  v25 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 16);
  v26 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 24);
  *v22 = v10;
  v22[1] = v11;
  v22[2] = v12;
  v22[3] = v13;
  sub_100008058(v23, v24, v25, v26);
}

uint64_t sub_1000056C4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  char v18;
  uint64_t result;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 8);
  if (v2 == 1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000021, 0x800000010000CC30, "FindMyRemoteUIService/FMLostModeAlertContentViewController.swift", 64, 2, 71, 0);
    __break(1u);
  }
  else
  {
    v3 = v0;
    v4 = *v1;
    v6 = v1[2];
    v5 = v1[3];
    v7 = qword_100015610;
    swift_bridgeObjectRetain(v2);
    swift_bridgeObjectRetain(v5);
    if (v7 != -1)
      swift_once(&qword_100015610, sub_100005134);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_100004CDC(v8, (uint64_t)qword_1000157C8);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Checking if device is unlocked", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    v13 = (*(uint64_t (**)(void))(v3
                               + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies))();
    v14 = v13;
    v15 = Logger.logObject.getter(v13);
    v16 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v17 = 67109120;
      LODWORD(v20) = v14 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, (char *)&v20 + 4, v17 + 4, v17 + 8);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "isUnlocked = %{BOOL}d", v17, 8u);
      swift_slowDealloc(v17, -1, -1);
    }

    if ((v14 & 1) != 0)
    {
      *(_QWORD *)&v20 = v4;
      v18 = 1;
    }
    else
    {
      v18 = 0;
      *(_QWORD *)&v20 = v4;
    }
    *((_QWORD *)&v20 + 1) = v2;
    v21 = v6;
    v22 = v5;
    v23 = v18;
    sub_100005928(&v20);
    swift_bridgeObjectRelease(v2);
    return swift_bridgeObjectRelease(v5);
  }
  return result;
}

void sub_100005928(__int128 *a1)
{
  char *v1;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_class *v38;
  char *v39;
  uint64_t *v40;
  id v41;
  char *v42;
  id v43;
  id v44;
  id v45;
  Swift::String v46;
  Swift::String v47;
  void *object;
  _QWORD *v49;
  char *v50;
  NSString v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void **v65;
  char *v66;
  objc_super v67;
  void **aBlock;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79[5];
  __int128 v80[3];
  Swift::String v81;

  ObjectType = swift_getObjectType(v1);
  v4 = (uint64_t)&v1[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state];
  sub_100007C58((__int128 *)&v1[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state], (uint64_t)v80);
  if ((sub_100007E80(v80, a1) & 1) != 0)
  {
    if (qword_100015610 != -1)
      swift_once(&qword_100015610, sub_100005134);
    v5 = type metadata accessor for Logger(0);
    sub_100004CDC(v5, (uint64_t)qword_1000157C8);
    v6 = v1;
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      v10 = swift_slowAlloc(32, -1);
      v79[0] = v10;
      *(_DWORD *)v9 = 136315138;
      sub_100007C58((__int128 *)v4, (uint64_t)&aBlock);
      sub_10000808C((uint64_t)&aBlock, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000079D4);
      v11 = sub_1000051C4();
      v13 = v12;
      sub_10000808C((uint64_t)&aBlock, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007A20);
      v74 = sub_10000A08C(v11, v13, v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease(v13);

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Got a duplicate state %s so bailing", v9, 0xCu);
      swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);
    }
    else
    {

    }
LABEL_16:

    return;
  }
  if (qword_100015610 != -1)
    swift_once(&qword_100015610, sub_100005134);
  v14 = type metadata accessor for Logger(0);
  sub_100004CDC(v14, (uint64_t)qword_1000157C8);
  v15 = v1;
  sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000079D4);
  v16 = v15;
  v17 = sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000079D4);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.info.getter();
  v66 = v16;
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc(22, -1);
    v65 = (void **)swift_slowAlloc(64, -1);
    aBlock = v65;
    *(_DWORD *)v20 = 136315394;
    sub_100007C58((__int128 *)v4, (uint64_t)v79);
    sub_10000808C((uint64_t)v79, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000079D4);
    v21 = sub_1000051C4();
    v23 = v22;
    sub_10000808C((uint64_t)v79, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007A20);
    v74 = sub_10000A08C(v21, v23, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease(v23);

    *(_WORD *)(v20 + 12) = 2080;
    sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000079D4);
    v24 = sub_1000051C4();
    v26 = v25;
    sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007A20);
    v74 = sub_10000A08C(v24, v26, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v20 + 14, v20 + 22);
    swift_bridgeObjectRelease(v26);
    sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007A20);
    sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007A20);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Updating state from %s to state %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy(v65, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v65, -1, -1);
    swift_slowDealloc(v20, -1, -1);
  }
  else
  {

    sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007A20);
    sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007A20);
  }

  v27 = *(_QWORD *)v4;
  v28 = *(_QWORD *)(v4 + 8);
  v29 = *(_QWORD *)(v4 + 16);
  v30 = *(_QWORD *)(v4 + 24);
  v31 = *(_BYTE *)(v4 + 32);
  sub_100007C58(a1, v4);
  sub_10000808C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000079D4);
  sub_100007A20(v27, v28, v29, v30, v31);
  sub_100007C58(a1, (uint64_t)&v74);
  v32 = v74;
  if (v78)
  {
    if (v78 == 1)
    {
      v7 = sub_1000068F4(v74, v75, v76, v77);
      v33 = OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController;
      v34 = *(void **)&v16[OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController];
      if (!v34)
      {
        v61 = objc_msgSend(v16, "presentProxCardFlowWithDelegate:initialViewController:", v16, v7);
        v62 = *(void **)&v16[v33];
        *(_QWORD *)&v16[v33] = v61;

        return;
      }
      objc_msgSend(v34, "pushViewController:animated:", v7, 1);
      goto LABEL_16;
    }
    if (v75 | v74 | v76 | v77)
    {
      v57 = *(void **)&v16[OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController];
      if (v57)
      {
        v72 = sub_10000AEEC;
        v73 = 0;
        aBlock = _NSConcreteStackBlock;
        v69 = 1107296256;
        v70 = sub_100007CEC;
        v71 = &unk_100010B68;
        v58 = _Block_copy(&aBlock);
        v59 = v73;
        v60 = v57;
        swift_release(v59);
        objc_msgSend(v60, "dismissViewControllerAnimated:completion:", 1, v58);
        _Block_release(v58);

      }
    }
  }
  else
  {
    v35 = v75;
    v36 = v76;
    v37 = v77;
    v38 = (objc_class *)type metadata accessor for FMLostDeviceCardViewController();
    v39 = (char *)objc_allocWithZone(v38);
    v40 = (uint64_t *)&v39[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo];
    *v40 = v32;
    v40[1] = v35;
    v40[2] = v36;
    v40[3] = v37;
    v41 = objc_allocWithZone((Class)UIImageView);
    swift_bridgeObjectRetain(v37);
    v42 = v39;
    swift_bridgeObjectRetain(v35);
    v43 = objc_msgSend(v41, "init");
    *(_QWORD *)&v42[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView] = v43;

    v67.receiver = v42;
    v67.super_class = v38;
    v44 = objc_msgSendSuper2(&v67, "initWithContentView:", 0);
    sub_100003544();
    sub_10000362C();
    sub_10000397C();
    objc_msgSend(v44, "setDismissalType:", 3);
    v45 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v81._object = (void *)0xE000000000000000;
    v46._object = (void *)0x800000010000CC60;
    v46._countAndFlagsBits = 0xD000000000000017;
    v47._countAndFlagsBits = 0;
    v47._object = (void *)0xE000000000000000;
    v81._countAndFlagsBits = 0;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v46, (Swift::String_optional)0, (NSBundle)v45, v47, v81)._object;

    v49 = (_QWORD *)swift_allocObject(&unk_100010BA0, 64, 7);
    v49[2] = v66;
    v49[3] = v32;
    v49[4] = v35;
    v49[5] = v36;
    v49[6] = v37;
    v49[7] = ObjectType;
    v50 = v66;
    swift_bridgeObjectRetain(v35);
    swift_bridgeObjectRetain(v37);
    v51 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    v72 = sub_100008110;
    v73 = v49;
    aBlock = _NSConcreteStackBlock;
    v69 = 1107296256;
    v70 = sub_10000B218;
    v71 = &unk_100010BB8;
    v52 = _Block_copy(&aBlock);
    v53 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v51, 0, v52);

    _Block_release(v52);
    swift_release(v73);
    v54 = objc_msgSend(v44, "addAction:", v53);

    v55 = OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController;
    v56 = *(void **)&v50[OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController];
    if (v56)
    {
      objc_msgSend(v56, "pushViewController:animated:", v44, 1);

    }
    else
    {
      v63 = objc_msgSend(v50, "presentProxCardFlowWithDelegate:initialViewController:", v50, v44);
      v64 = *(void **)&v50[v55];
      *(_QWORD *)&v50[v55] = v63;

    }
  }
}

uint64_t sub_1000061A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[8] = a4;
  v5[9] = v4;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  v6 = sub_1000033EC(&qword_100015898);
  v5[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v5[11] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[12] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[13] = swift_task_alloc(v9);
  v5[14] = swift_task_alloc(v9);
  v10 = type metadata accessor for MainActor(0);
  v5[15] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  v5[16] = v11;
  v5[17] = v12;
  return swift_task_switch(sub_100006270, v11, v12);
}

uint64_t sub_100006270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  int *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(_QWORD);
  uint64_t v35;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  sub_100004120(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = *(_QWORD *)(v0 + 80);
    swift_release(*(_QWORD *)(v0 + 120));
    sub_100004CA0(v4, &qword_100015898);
    if (qword_100015610 != -1)
      swift_once(&qword_100015610, sub_100005134);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_100004CDC(v5, (uint64_t)qword_1000157C8);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "No punch out URL to execute", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    v10 = *(_QWORD *)(v0 + 104);
    v11 = *(_QWORD *)(v0 + 80);
    swift_task_dealloc(*(_QWORD *)(v0 + 112));
    swift_task_dealloc(v10);
    swift_task_dealloc(v11);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 32))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
    if (qword_100015610 != -1)
      swift_once(&qword_100015610, sub_100005134);
    v14 = *(_QWORD *)(v0 + 104);
    v13 = *(_QWORD *)(v0 + 112);
    v15 = *(_QWORD *)(v0 + 88);
    v16 = *(_QWORD *)(v0 + 96);
    v17 = type metadata accessor for Logger(0);
    *(_QWORD *)(v0 + 144) = sub_100004CDC(v17, (uint64_t)qword_1000157C8);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v13, v15);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.default.getter();
    v21 = os_log_type_enabled(v19, v20);
    v22 = *(_QWORD *)(v0 + 104);
    v23 = *(_QWORD *)(v0 + 88);
    if (v21)
    {
      v32 = *(_QWORD *)(v0 + 96);
      v24 = swift_slowAlloc(22, -1);
      v33 = swift_slowAlloc(32, -1);
      v35 = v33;
      *(_DWORD *)v24 = 141558275;
      *(_QWORD *)(v0 + 24) = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v24 + 4, v24 + 12);
      *(_WORD *)(v24 + 12) = 2081;
      v25 = sub_100008480();
      v26 = dispatch thunk of CustomStringConvertible.description.getter(v23, v25);
      v28 = v27;
      *(_QWORD *)(v0 + 32) = sub_10000A08C(v26, v27, &v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v24 + 14, v24 + 22);
      swift_bridgeObjectRelease(v28);
      v29 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v29(v22, v23);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Opening URL %{private,mask.hash}s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }
    else
    {
      v29 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 96) + 8);
      v29(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
    }

    *(_QWORD *)(v0 + 152) = v29;
    v30 = *(int **)(*(_QWORD *)(v0 + 72)
                  + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies
                  + 32);
    v34 = (uint64_t (*)(_QWORD))((char *)v30 + *v30);
    v31 = (_QWORD *)swift_task_alloc(v30[1]);
    *(_QWORD *)(v0 + 160) = v31;
    *v31 = v0;
    v31[1] = sub_100006610;
    return v34(*(_QWORD *)(v0 + 112));
  }
}

uint64_t sub_100006610()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 160);
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_100006744;
  else
    v4 = sub_100006670;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 136));
}

uint64_t sub_100006670()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = swift_release(*(_QWORD *)(v0 + 120));
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Successfully opened URL", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  (*(void (**)(_QWORD, _QWORD))(v0 + 152))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 168);
  swift_release(*(_QWORD *)(v0 + 120));
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 168);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 16) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Punch out failed with error %@", v6, 0xCu);
    v9 = sub_1000033EC(&qword_100015860);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {
    v5 = *(_QWORD *)(v0 + 168);

    swift_errorRelease(v5);
    swift_errorRelease(v5);
  }
  swift_errorRelease(v5);
  (*(void (**)(_QWORD, _QWORD))(v0 + 152))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
  v10 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1000068F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  objc_class *v10;
  char *v11;
  char *v12;
  id v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  Swift::String v18;
  Swift::String v19;
  void *object;
  uint64_t v21;
  _QWORD *v22;
  NSString v23;
  void *v24;
  id v25;
  id v26;
  _QWORD aBlock[5];
  _QWORD *v29;
  objc_super v30;
  Swift::String v31;

  v5 = v4;
  v10 = (objc_class *)type metadata accessor for FMLostDeviceCardViewController();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  *((_QWORD *)v12 + 2) = a3;
  *((_QWORD *)v12 + 3) = a4;
  v13 = objc_allocWithZone((Class)UIImageView);
  swift_bridgeObjectRetain(a4);
  v14 = v11;
  swift_bridgeObjectRetain(a2);
  v15 = objc_msgSend(v13, "init");
  *(_QWORD *)&v14[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView] = v15;

  v30.receiver = v14;
  v30.super_class = v10;
  v16 = objc_msgSendSuper2(&v30, "initWithContentView:", 0);
  sub_100003544();
  sub_10000362C();
  sub_10000397C();
  objc_msgSend(v16, "setDismissalType:", 3);
  v17 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v31._object = (void *)0xE000000000000000;
  v18._object = (void *)0x800000010000CCA0;
  v18._countAndFlagsBits = 0xD00000000000001ELL;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v31._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v31)._object;

  v21 = swift_allocObject(&unk_100010C40, 24, 7);
  swift_unknownObjectWeakInit(v21 + 16, v5);
  v22 = (_QWORD *)swift_allocObject(&unk_100010C68, 56, 7);
  v22[2] = v21;
  v22[3] = a1;
  v22[4] = a2;
  v22[5] = a3;
  v22[6] = a4;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  swift_retain(v21);
  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  aBlock[4] = sub_100008330;
  v29 = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B218;
  aBlock[3] = &unk_100010C80;
  v24 = _Block_copy(aBlock);
  v25 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v23, 0, v24);

  _Block_release(v24);
  swift_release(v29);
  swift_release(v21);
  v26 = objc_msgSend(v16, "addAction:", v25);

  return v16;
}

uint64_t sub_100006BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100008058(*(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo), *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 8), *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 16), *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 24));
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies + 8);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies + 24);
  swift_release(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies
                          + 40));
  swift_release(v2);
  swift_release(v1);
  return sub_100007A20(*(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 8), *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 16), *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 24), *(_BYTE *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 32));
}

uint64_t type metadata accessor for FMLostModeAlertContentViewController()
{
  return objc_opt_self(_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController);
}

uint64_t sub_100006CEC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;

  v13 = sub_1000033EC(&qword_100015838);
  __chkstk_darwin(v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  type metadata accessor for MainActor(0);
  swift_bridgeObjectRetain(a6);
  v17 = a2;
  v18 = swift_bridgeObjectRetain(a4);
  v19 = static MainActor.shared.getter(v18);
  v20 = (_QWORD *)swift_allocObject(&unk_100010BF0, 80, 7);
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = v17;
  v20[5] = a3;
  v20[6] = a4;
  v20[7] = a5;
  v20[8] = a6;
  v20[9] = a7;
  v21 = sub_100007458((uint64_t)v15, (uint64_t)&unk_100015848, (uint64_t)v20);
  return swift_release(v21);
}

uint64_t sub_100006E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8[16] = a7;
  v8[17] = a8;
  v8[14] = a5;
  v8[15] = a6;
  v8[13] = a4;
  v9 = type metadata accessor for MainActor(0);
  v8[18] = v9;
  v8[19] = static MainActor.shared.getter(v9);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v8[20] = v10;
  v8[21] = v11;
  return swift_task_switch(sub_100006E8C, v10, v11);
}

uint64_t sub_100006E8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  uint64_t (*v10)(void);

  if (qword_100015610 != -1)
    swift_once(&qword_100015610, sub_100005134);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_100004CDC(v1, (uint64_t)qword_1000157C8);
  v0[22] = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Attempting to unlock device", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }
  v6 = v0[13];

  v7 = *(int **)(v6 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies + 16);
  v10 = (uint64_t (*)(void))((char *)v7 + *v7);
  v8 = (_QWORD *)swift_task_alloc(v7[1]);
  v0[23] = v8;
  *v8 = v0;
  v8[1] = sub_100006FA8;
  return v10();
}

uint64_t sub_100006FA8(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 184);
  *(_BYTE *)(v3 + 49) = a1;
  *(_QWORD *)(v3 + 192) = v1;
  swift_task_dealloc(v4);
  if (v1)
    v5 = sub_1000072CC;
  else
    v5 = sub_100007014;
  return swift_task_switch(v5, *(_QWORD *)(v3 + 160), *(_QWORD *)(v3 + 168));
}

uint64_t sub_100007014(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  int v4;
  uint8_t *v5;
  uint64_t (*v6)(uint64_t);

  v2 = Logger.logObject.getter(a1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(unsigned __int8 *)(v1 + 49);
    v5 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 67109120;
    *(_DWORD *)(v1 + 52) = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 52, v1 + 56, v5 + 4, v5 + 8);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Passcode isUnlocked = %{BOOL}d", v5, 8u);
    swift_slowDealloc(v5, -1, -1);
  }

  if (*(_BYTE *)(v1 + 49) == 1)
    v6 = sub_100007108;
  else
    v6 = sub_100007204;
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100007108(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 144);
  *(_QWORD *)(v1 + 200) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_100007168, v3, v4);
}

uint64_t sub_100007168()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  v4 = *(_OWORD *)(v0 + 112);
  swift_release(*(_QWORD *)(v0 + 200));
  *(_OWORD *)(v0 + 56) = v4;
  *(_QWORD *)(v0 + 72) = v2;
  *(_QWORD *)(v0 + 80) = v1;
  *(_BYTE *)(v0 + 88) = 1;
  sub_100005928((__int128 *)(v0 + 56));
  return swift_task_switch(sub_1000071D4, *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
}

uint64_t sub_1000071D4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 152));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007204(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 144);
  *(_QWORD *)(v1 + 208) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_100007264, v3, v4);
}

uint64_t sub_100007264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  v4 = *(_OWORD *)(v0 + 112);
  swift_release(*(_QWORD *)(v0 + 208));
  *(_OWORD *)(v0 + 16) = v4;
  *(_QWORD *)(v0 + 32) = v2;
  *(_QWORD *)(v0 + 40) = v1;
  *(_BYTE *)(v0 + 48) = 0;
  sub_100005928((__int128 *)(v0 + 16));
  return swift_task_switch(sub_1000084E0, *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
}

uint64_t sub_1000072CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 192);
  swift_release(*(_QWORD *)(v0 + 152));
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 192);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 96) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to request for unlock with error %@", v6, 0xCu);
    v9 = sub_1000033EC(&qword_100015860);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    swift_errorRelease(v5);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 192);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    swift_errorRelease(v10);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100004CA0(a1, &qword_100015838);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_100010C18, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100015858, v16);
}

uint64_t sub_1000075A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100004CA0(a1, &qword_100015838);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_100010CE0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = sub_1000033EC(&qword_100015888);
  if (v14 | v12)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v12;
    v20[3] = v14;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, v17, &unk_100015880, v16);
}

uint64_t sub_1000076F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v20;

  v11 = sub_1000033EC(&qword_100015838);
  __chkstk_darwin(v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  type metadata accessor for MainActor(0);
  swift_bridgeObjectRetain(a6);
  swift_retain(a2);
  v15 = swift_bridgeObjectRetain(a4);
  v16 = static MainActor.shared.getter(v15);
  v17 = (_QWORD *)swift_allocObject(&unk_100010CB8, 72, 7);
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = a2;
  v17[5] = a3;
  v17[6] = a4;
  v17[7] = a5;
  v17[8] = a6;
  v18 = sub_1000075A4((uint64_t)v13, (uint64_t)&unk_100015870, (uint64_t)v17);
  return swift_release(v18);
}

uint64_t sub_10000780C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[5] = a1;
  v8[6] = a4;
  v9 = type metadata accessor for MainActor(0);
  v8[11] = static MainActor.shared.getter(v9);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v8[12] = v10;
  v8[13] = v11;
  return swift_task_switch(sub_100007880, v10, v11);
}

uint64_t sub_100007880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 48) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  *(_QWORD *)(v0 + 112) = Strong;
  if (Strong)
  {
    v3 = (_QWORD *)swift_task_alloc(dword_100015894);
    *(_QWORD *)(v0 + 120) = v3;
    *v3 = v0;
    v3[1] = sub_100007930;
    return sub_1000061A0(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 88));
    **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 112) == 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100007930()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 112);
  swift_task_dealloc(*(_QWORD *)(*v0 + 120));

  return swift_task_switch(sub_100007980, *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

uint64_t sub_100007980()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 88));
  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 112) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000079D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 <= 1u)
  {
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for FMLostModeAlertContentViewController.State(uint64_t a1)
{
  return sub_100007A20(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_100007A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 <= 1u)
  {
    swift_bridgeObjectRelease(a2);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t initializeWithCopy for FMLostModeAlertContentViewController.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1000079D4(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for FMLostModeAlertContentViewController.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1000079D4(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_100007A20(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for FMLostModeAlertContentViewController.State(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FMLostModeAlertContentViewController.State(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned __int8 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_100007A20(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMLostModeAlertContentViewController.State(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FMLostModeAlertContentViewController.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_100007C14(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_100007C2C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FMLostModeAlertContentViewController.State()
{
  return &type metadata for FMLostModeAlertContentViewController.State;
}

uint64_t sub_100007C58(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100007C70()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004D30(v0, qword_1000157E0);
  sub_100004CDC(v0, (uint64_t)qword_1000157E0);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x800000010000D730, 0xD000000000000022, 0x800000010000CCC0);
}

uint64_t sub_100007CEC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100007D18(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100007D7C;
  return v6(a1);
}

uint64_t sub_100007D7C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100007DC8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_100007E30;
  return v5(v2 + 32);
}

uint64_t sub_100007E30()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 24));
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_100007E80(__int128 *a1, __int128 *a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int8x16_t v10;
  int8x16_t v12;
  int8x16_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  sub_100007C58(a1, (uint64_t)&v15);
  v3 = v15;
  if (!v19)
  {
    v9 = v16;
    v4 = v17;
    v6 = v18;
    sub_100007C58(a2, (uint64_t)&v12);
    if (v14)
      return 0;
    v7 = v13.i64[1];
    v8 = v13.i64[0];
    if (v9)
    {
      if (!v12.i64[1]
        || __PAIR128__(v9, v3) != *(_OWORD *)&v12
        && (_stringCompareWithSmolCheck(_:_:expecting:)(v3, v9, v12.i64[0], v12.i64[1], 0) & 1) == 0)
      {
        return 0;
      }
    }
    else if (v12.i64[1])
    {
      return 0;
    }
    if (v6)
      return v7 && (v4 == v8 && v6 == v7 || (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v8, v7, 0) & 1) != 0);
    return !v7;
  }
  if (v19 == 1)
  {
    v5 = v16;
    v4 = v17;
    v6 = v18;
    sub_100007C58(a2, (uint64_t)&v12);
    if (v14 != 1)
      return 0;
    v7 = v13.i64[1];
    v8 = v13.i64[0];
    if (v5)
    {
      if (!v12.i64[1]
        || __PAIR128__(v5, v3) != *(_OWORD *)&v12
        && (_stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v12.i64[0], v12.i64[1], 0) & 1) == 0)
      {
        return 0;
      }
    }
    else if (v12.i64[1])
    {
      return 0;
    }
    if (v6)
      return v7 && (v4 == v8 && v6 == v7 || (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v8, v7, 0) & 1) != 0);
    return !v7;
  }
  if (v16 | v15 | v17 | v18)
  {
    sub_100007C58(a2, (uint64_t)&v12);
    if (v14 != 2 || v12.i64[0] != 1 || v13.i64[0] | v13.i64[1] | v12.i64[1])
      return 0;
  }
  else
  {
    sub_100007C58(a2, (uint64_t)&v12);
    if (v14 != 2)
      return 0;
    v10 = vorrq_s8(v12, v13);
    if (vorr_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)))
      return 0;
  }
  return 1;
}

uint64_t sub_100008058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease(a2);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_10000808C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

uint64_t sub_1000080C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000080D4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000080DC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100008110(uint64_t a1)
{
  uint64_t v1;

  return sub_100006CEC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_100008120()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10000815C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_100015844);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1000081FC;
  return sub_100006E10(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000081FC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100008244()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008268(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100015854);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000084C8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100015850 + dword_100015850))(a1, v4);
}

uint64_t sub_1000082D8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000082FC()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100008330(uint64_t a1)
{
  uint64_t *v1;

  return sub_1000076F8(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_100008340()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  swift_bridgeObjectRelease(v0[8]);
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10000837C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_10001586C);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1000084C8;
  return sub_10000780C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100008410(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10001587C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000081FC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100015878 + dword_100015878))(a1, v4);
}

unint64_t sub_100008480()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000158A0;
  if (!qword_1000158A0)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_1000158A0);
  }
  return result;
}

uint64_t sub_1000084E4()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = objc_msgSend(v0, "_remoteViewControllerProxy");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100009F74((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    v3 = sub_1000033EC(&qword_1000159E0);
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, v3, 6))
      return v5;
    else
      return 0;
  }
  else
  {
    sub_100009FBC((uint64_t)v7);
    return 0;
  }
}

uint64_t sub_10000859C(uint64_t a1)
{
  return sub_1000095D4(a1, qword_1000158B0, &qword_100015630, (uint64_t)qword_1000163F8, (uint64_t)sub_100009DE4);
}

void sub_1000085C0(void *a1, void (*a2)(void))
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  objc_class *v23;
  char *v24;
  char *v25;
  char *v26;
  BOOL (**v27)();
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  void *v36;
  id v37;
  char *v38;
  void *v39;
  id v40;
  objc_super v41;
  id v42;
  _OWORD v43[2];
  _QWORD v44[4];

  v3 = v2;
  if (qword_100015620 != -1)
    swift_once(&qword_100015620, sub_10000859C);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100004CDC(v6, (uint64_t)qword_1000158B0);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "configure(with context:, completion:) being called", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = objc_msgSend(v3, "_remoteViewControllerProxy");
  if (v11)
  {
    v12 = v11;
    _bridgeAnyObjectToAny(_:)(v43);
    swift_unknownObjectRelease(v12);
  }
  else
  {
    memset(v43, 0, sizeof(v43));
  }
  sub_100009F74((uint64_t)v43, (uint64_t)v44);
  if (v44[3])
  {
    v13 = sub_1000033EC(&qword_1000159E0);
    v14 = swift_dynamicCast(&v42, v44, (char *)&type metadata for Any + 8, v13, 6);
    if ((v14 & 1) != 0)
    {
      v15 = v42;
      objc_msgSend(v42, "setAllowsAlertStacking:", 1);
      if (a1)
      {
        v16 = a1;
        v17 = sub_1000084E4();
        v18 = type metadata accessor for FMRemoteUIAlertServiceConfigurationContext();
        swift_allocObject(v18, 48, 7);
        v19 = v3;
        v20 = sub_10000966C(v16, v3, v17);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)&v19[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context];
          *(_QWORD *)&v19[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context] = v20;
          swift_retain(v20);
          swift_release(v22);
          if ((v21[2] & 1) != 0)
          {
            v23 = (objc_class *)type metadata accessor for FMLostModeAlertContentViewController();
            v24 = (char *)objc_allocWithZone(v23);
            v25 = &v24[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo];
            *(_OWORD *)v25 = xmmword_10000D710;
            *((_QWORD *)v25 + 2) = 0;
            *((_QWORD *)v25 + 3) = 0;
            v26 = &v24[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state];
            *(_OWORD *)v26 = 0u;
            *((_OWORD *)v26 + 1) = 0u;
            v26[32] = 2;
            v27 = (BOOL (**)())&v24[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies];
            *v27 = sub_100002F44;
            v27[1] = 0;
            v27[2] = (BOOL (*)())&unk_1000156F8;
            v27[3] = 0;
            v27[4] = (BOOL (*)())&unk_1000156E0;
            v27[5] = 0;
            v41.receiver = v24;
            v41.super_class = v23;
            v28 = objc_msgSendSuper2(&v41, "initWithNibName:bundle:", 0, 0);
          }
          else
          {
            v35 = type metadata accessor for FMRemoteUIHawkeyeUpsellContentViewController();
            v28 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v35)), "init");
          }
          v36 = v28;
          swift_getObjectType(v28);
          v44[0] = v36;
          v37 = v36;
          sub_10000AB28();

          v38 = &v19[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
          v39 = *(void **)&v19[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
          *(_QWORD *)v38 = v37;
          *((_QWORD *)v38 + 1) = &off_100010E68;
          v40 = v37;

          sub_100008A18();
          if (a2)
            a2();
          swift_unknownObjectRelease(v15);
          swift_release(v21);

          return;
        }
        v32 = Logger.logObject.getter(0);
        v33 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v34 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "Unable to create a context", v34, 2u);
          swift_slowDealloc(v34, -1, -1);
        }

        if (a2)
        {
          a2();
          swift_unknownObjectRelease(v15);
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
  }
  else
  {
    v14 = sub_100009FBC((uint64_t)v44);
  }
  v29 = Logger.logObject.getter(v14);
  v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "No remote view controller proxy", v31, 2u);
    swift_slowDealloc(v31, -1, -1);
  }

}

void sub_100008A18()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  if (objc_msgSend(v0, "isViewLoaded"))
  {
    v1 = *(void **)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
    if (v1)
    {
      v2 = v1;
      v3 = objc_msgSend(v0, "childViewControllers");
      v4 = sub_100009EF8();
      v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

      v22 = v2;
      LOBYTE(v2) = sub_100008E68((uint64_t)v22, v5);
      swift_bridgeObjectRelease(v5);

      if ((v2 & 1) != 0)
      {
LABEL_9:

        return;
      }
      v6 = objc_msgSend(v0, "view");
      if (v6)
      {
        v7 = v6;
        v8 = objc_msgSend(v22, "view");
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v7, "addSubview:", v8);

          v10 = objc_msgSend(v22, "view");
          if (v10)
          {
            v11 = v10;
            v12 = objc_msgSend(v0, "view");
            if (v12)
            {
              v13 = v12;
              objc_msgSend(v12, "bounds");
              v15 = v14;
              v17 = v16;
              v19 = v18;
              v21 = v20;

              objc_msgSend(v11, "setFrame:", v15, v17, v19, v21);
              objc_msgSend(v0, "addChildViewController:", v22);
              objc_msgSend(v22, "didMoveToParentViewController:", v0);
              goto LABEL_9;
            }
            goto LABEL_14;
          }
LABEL_13:
          __break(1u);
LABEL_14:
          __break(1u);
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_13;
    }
  }
}

uint64_t sub_100008E68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;

  if ((unint64_t)a2 >> 62)
    goto LABEL_20;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a2);
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    v5 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v6 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
LABEL_5:
      v7 = v6;
      sub_100009EF8();
      v8 = static NSObject.== infix(_:_:)(v7, a1);

      if ((v8 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease(a2);
        return 1;
      }
      if (v4 == 1)
        goto LABEL_18;
      if (v5)
        break;
      v5 = 5;
      while (1)
      {
        v15 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
          break;
        v16 = *(id *)(a2 + 8 * v5);
        v17 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v17 & 1) != 0)
          goto LABEL_6;
        ++v5;
        if (v15 == v4)
          goto LABEL_18;
      }
      __break(1u);
    }
    v10 = 1;
    while (1)
    {
      v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a2);
      v12 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
      v13 = v11;
      v14 = static NSObject.== infix(_:_:)(v11, a1);
      swift_unknownObjectRelease(v13);
      if ((v14 & 1) != 0)
        goto LABEL_6;
      ++v10;
      if (v12 == v4)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    if (a2 < 0)
      v18 = a2;
    else
      v18 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
  }
LABEL_18:
  swift_bridgeObjectRelease(a2);
  return 0;
}

void sub_100008FDC()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = v0;
  v14.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v14, "viewDidLayoutSubviews");
  v1 = *(void **)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
  if (v1)
  {
    v2 = objc_msgSend(v1, "view");
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v0, "view");
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v4, "bounds");
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;

        objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t type metadata accessor for FMRemoteUIAlertServiceViewController()
{
  return objc_opt_self(_TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController);
}

uint64_t sub_1000092A0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65646F4D74736F6CLL;
  else
    return 0x556579656B776168;
}

uint64_t sub_1000092E4(char *a1, char *a2)
{
  return sub_1000092F0(*a1, *a2);
}

uint64_t sub_1000092F0(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x65646F4D74736F6CLL;
  else
    v3 = 0x556579656B776168;
  if (v2)
    v4 = 0xED00006C6C657370;
  else
    v4 = 0xE800000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x65646F4D74736F6CLL;
  else
    v5 = 0x556579656B776168;
  if ((a2 & 1) != 0)
    v6 = 0xE800000000000000;
  else
    v6 = 0xED00006C6C657370;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_10000939C()
{
  char *v0;

  return sub_1000093A4(*v0);
}

Swift::Int sub_1000093A4(char a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  if ((a1 & 1) != 0)
    v2 = 0x65646F4D74736F6CLL;
  else
    v2 = 0x556579656B776168;
  if ((a1 & 1) != 0)
    v3 = 0xE800000000000000;
  else
    v3 = 0xED00006C6C657370;
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100009430(uint64_t a1)
{
  char *v1;

  return sub_100009438(a1, *v1);
}

uint64_t sub_100009438(uint64_t a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;

  v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0)
    v3 = 0x65646F4D74736F6CLL;
  else
    v3 = 0x556579656B776168;
  if (v2)
    v4 = 0xED00006C6C657370;
  else
    v4 = 0xE800000000000000;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_10000949C(uint64_t a1)
{
  char *v1;

  return sub_1000094A4(a1, *v1);
}

Swift::Int sub_1000094A4(uint64_t a1, char a2)
{
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  if ((a2 & 1) != 0)
    v3 = 0x65646F4D74736F6CLL;
  else
    v3 = 0x556579656B776168;
  if ((a2 & 1) != 0)
    v4 = 0xE800000000000000;
  else
    v4 = 0xED00006C6C657370;
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10000952C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;
  char v7;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000105F8, v3);
  result = swift_bridgeObjectRelease(v4);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

uint64_t sub_100009588@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1000092A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000095B0(uint64_t a1)
{
  return sub_1000095D4(a1, qword_1000158C8, &qword_100015638, (uint64_t)qword_100016410, (uint64_t)sub_100009E08);
}

uint64_t sub_1000095D4(uint64_t a1, uint64_t *a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = type metadata accessor for Logger(0);
  sub_100004D30(v9, a2);
  v10 = sub_100004CDC(v9, (uint64_t)a2);
  if (*a3 != -1)
    swift_once(a3, a5);
  v11 = sub_100004CDC(v9, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v10, v11, v9);
}

_QWORD *sub_10000966C(void *a1, void *a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint8_t *v28;
  char v30;
  char v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  NSObject *log;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[2];
  uint64_t v46[5];
  __int128 v47;
  __int128 v48;

  v4 = v3;
  v8 = (uint64_t)(v3 + 5);
  v9 = *v3;
  v10 = v3 + 4;
  swift_unknownObjectWeakInit(v3 + 4, 0);
  swift_unknownObjectWeakInit(v3 + 5, 0);
  v11 = objc_msgSend(a1, "userInfo");
  if (!v11)
  {
    v47 = 0u;
    v48 = 0u;
LABEL_12:
    sub_100009FBC((uint64_t)&v47);
    goto LABEL_13;
  }
  v12 = v11;
  v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v45[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(SPRemoteUIAlertTypeKey);
  v45[1] = v14;
  AnyHashable.init<A>(_:)(v46, v45, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v13 + 16) && (v15 = sub_10000BBF0((uint64_t)v46), (v16 & 1) != 0))
  {
    sub_100004CF4(*(_QWORD *)(v13 + 56) + 32 * v15, (uint64_t)&v47);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
  }
  sub_100004C6C((uint64_t)v46);
  swift_bridgeObjectRelease(v13);
  if (!*((_QWORD *)&v48 + 1))
    goto LABEL_12;
  if ((swift_dynamicCast(v46, &v47, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_13:
    if (qword_100015628 != -1)
      swift_once(&qword_100015628, sub_1000095B0);
    v22 = type metadata accessor for Logger(0);
    v23 = sub_100004CDC(v22, (uint64_t)qword_1000158C8);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = v9;
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "No alert type as string specified", v27, 2u);
      v28 = v27;
      v9 = v26;
      swift_slowDealloc(v28, -1, -1);
    }

    swift_unknownObjectRelease(a3);
    goto LABEL_18;
  }
  v44 = a2;
  v17 = v46[0];
  v18 = v46[1];
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(SPRemoteUIAlertTypeValueLostMode);
  v21 = v20;
  if (v19 != v17 || v20 != v18)
  {
    v43 = v9;
    v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v20, v17, v18, 0);
    swift_bridgeObjectRelease(v21);
    if ((v30 & 1) != 0)
      goto LABEL_21;
    if (v17 == 0x2D6579656B776168 && v18 == 0xEE006C6C65737075
      || (v42 = v17,
          (_stringCompareWithSmolCheck(_:_:expecting:)(0x2D6579656B776168, 0xEE006C6C65737075, v17, v18, 0) & 1) != 0))
    {
      swift_bridgeObjectRelease(v18);
      v31 = 0;
      goto LABEL_26;
    }
    if (qword_100015628 != -1)
      swift_once(&qword_100015628, sub_1000095B0);
    v35 = type metadata accessor for Logger(0);
    sub_100004CDC(v35, (uint64_t)qword_1000158C8);
    v36 = swift_bridgeObjectRetain(v18);
    v37 = Logger.logObject.getter(v36);
    v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      log = v37;
      v39 = (uint8_t *)swift_slowAlloc(12, -1);
      v40 = swift_slowAlloc(32, -1);
      v46[0] = v40;
      *(_DWORD *)v39 = 136315138;
      swift_bridgeObjectRetain(v18);
      *(_QWORD *)&v47 = sub_10000A08C(v42, v18, v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, (char *)&v47 + 8, v39 + 4, v39 + 12);
      swift_bridgeObjectRelease_n(v18, 3);
      _os_log_impl((void *)&_mh_execute_header, log, v38, "Alert type is not supported %s", v39, 0xCu);
      swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1, -1);
      swift_slowDealloc(v39, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v18, 2);
    }
    swift_unknownObjectRelease(a3);

    v9 = v43;
LABEL_18:
    swift_unknownObjectWeakDestroy(v10);
    sub_100009ED4(v8);
    swift_deallocPartialClassInstance(v4, v9, 48, 7);
    return 0;
  }
  swift_bridgeObjectRelease(v18);
LABEL_21:
  swift_bridgeObjectRelease(v18);
  v31 = 1;
LABEL_26:
  *((_BYTE *)v4 + 16) = v31;
  v32 = objc_msgSend(a1, "userInfo");
  if (v32)
  {
    v33 = v32;
    v34 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v32, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  }
  else
  {

    v34 = 0;
  }
  v4[3] = v34;
  swift_unknownObjectWeakAssign(v10, v44);

  swift_unknownObjectWeakAssign(v8, a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

uint64_t sub_100009BCC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_unknownObjectWeakDestroy(v0 + 32);
  sub_100009ED4(v0 + 40);
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for FMRemoteUIAlertServiceConfigurationContext()
{
  return objc_opt_self(_TtC21FindMyRemoteUIService42FMRemoteUIAlertServiceConfigurationContext);
}

_BYTE *initializeBufferWithCopyOfBuffer for FMRemoteUIAlertServiceConfigurationContext.ServiceType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMRemoteUIAlertServiceConfigurationContext.ServiceType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FMRemoteUIAlertServiceConfigurationContext.ServiceType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100009D08 + 4 * byte_10000D7F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100009D3C + 4 * byte_10000D7F0[v4]))();
}

uint64_t sub_100009D3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009D44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100009D4CLL);
  return result;
}

uint64_t sub_100009D58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100009D60);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100009D64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009D6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009D78(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100009D80(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FMRemoteUIAlertServiceConfigurationContext.ServiceType()
{
  return &type metadata for FMRemoteUIAlertServiceConfigurationContext.ServiceType;
}

unint64_t sub_100009DA0()
{
  unint64_t result;

  result = qword_1000159D0;
  if (!qword_1000159D0)
  {
    result = swift_getWitnessTable(&unk_10000D95C, &type metadata for FMRemoteUIAlertServiceConfigurationContext.ServiceType);
    atomic_store(result, (unint64_t *)&qword_1000159D0);
  }
  return result;
}

uint64_t sub_100009DE4(uint64_t a1)
{
  return sub_100009E2C(a1, qword_1000163F8, 0xD000000000000024, 0x800000010000D830);
}

uint64_t sub_100009E08(uint64_t a1)
{
  return sub_100009E2C(a1, qword_100016410, 0xD00000000000002ALL, 0x800000010000D880);
}

uint64_t sub_100009E2C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_100004D30(v7, a2);
  sub_100004CDC(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x800000010000D7E0, a3, a4);
}

uint64_t sub_100009EA0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100009ED4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

unint64_t sub_100009EF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000159D8;
  if (!qword_1000159D8)
  {
    v1 = objc_opt_self(UIViewController);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000159D8);
  }
  return result;
}

uint64_t sub_100009F34(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100009F44()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009F68()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100009F74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033EC(&qword_1000157B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009FBC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000033EC(&qword_1000157B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009FFC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000A01C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_10000A08C(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_10000A08C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000A15C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100004CF4((uint64_t)v12, *a3);
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
      sub_100004CF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000A6DC(v12);
  return v7;
}

uint64_t sub_10000A15C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000A314(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A314(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000A3A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000A580(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000A580(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000A3A8(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000A51C(v4, 0);
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

_QWORD *sub_10000A51C(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000033EC(&qword_1000159E8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000A580(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000033EC(&qword_1000159E8);
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

_BYTE **sub_10000A6CC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_10000A6DC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000A708(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = a1;
  swift_retain(a1);
  return swift_release(v2);
}

uint64_t sub_10000A738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100004D30(v0, qword_1000159F0);
  v1 = sub_100004CDC(v0, (uint64_t)qword_1000159F0);
  if (qword_100015648 != -1)
    swift_once(&qword_100015648, sub_10000AE60);
  v2 = sub_100004CDC(v0, (uint64_t)qword_100016428);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_10000A7C8()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000039, 0x800000010000D190, "FindMyRemoteUIService/FMPRXFlowContentViewController.swift", 58, 2, 32, 0);
  __break(1u);
}

uint64_t sub_10000A820(char a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  objc_super v10;

  v2 = v1;
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for FMRemoteUIPRXFlowContentViewController();
  objc_msgSendSuper2(&v10, "viewDidAppear:", a1 & 1);
  if (qword_100015640 != -1)
    swift_once(&qword_100015640, sub_10000A738);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100004CDC(v4, (uint64_t)qword_1000159F0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "View did appear, calling presentFlow()", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  return (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x98))();
}

id sub_10000AAA0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMRemoteUIPRXFlowContentViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FMRemoteUIPRXFlowContentViewController()
{
  return objc_opt_self(_TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController);
}

uint64_t sub_10000AB28()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((swift_isaMask & **v0) + 0x90))();
}

void sub_10000AB60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *Strong;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  NSObject *oslog;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context);
  if (v1)
  {
    v2 = qword_100015640;
    swift_retain(v1);
    if (v2 != -1)
      swift_once(&qword_100015640, sub_10000A738);
    v3 = type metadata accessor for Logger(0);
    v4 = sub_100004CDC(v3, (uint64_t)qword_1000159F0);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Prox card flow dismissed. Requesting host to deactivate.", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    Strong = (void *)swift_unknownObjectWeakLoadStrong(v1 + 40);
    if (Strong)
    {
      v9 = Strong;
      objc_msgSend(Strong, "deactivate");
      swift_release(v1);
      swift_unknownObjectRelease(v9);
    }
    else
    {
      swift_release(v1);
    }
  }
  else
  {
    if (qword_100015640 != -1)
      swift_once(&qword_100015640, sub_10000A738);
    v10 = type metadata accessor for Logger(0);
    v11 = sub_100004CDC(v10, (uint64_t)qword_1000159F0);
    oslog = Logger.logObject.getter(v11);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Trying to dismiss PRX flow with a nil context. This is not possible.", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

  }
}

uint64_t sub_10000AE60()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004D30(v0, qword_100016428);
  sub_100004CDC(v0, (uint64_t)qword_100016428);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x800000010000D970, 0xD000000000000026, 0x800000010000D990);
}

uint64_t sub_10000AEDC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

void sub_10000AEEC()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (qword_100015640 != -1)
    swift_once(&qword_100015640, sub_10000A738);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100004CDC(v0, (uint64_t)qword_1000159F0);
  oslog = Logger.logObject.getter(v1);
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Successfully dismissed PRX flow", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

}

unint64_t sub_10000AFB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000033EC(&qword_100015B30);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000C170(v7, (uint64_t)&v16, &qword_100015B38);
    v8 = v16;
    v9 = v17;
    result = sub_10000BB0C(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10000C124(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
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

unint64_t sub_10000B0EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000033EC(&qword_100015B40);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000C170(v7, (uint64_t)&v14, &qword_100015B48);
    v8 = v14;
    result = sub_10000BB70(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_10000C124(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
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

void sub_10000B218(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

void sub_10000B268()
{
  uint64_t v0;
  uint64_t ObjectType;
  id v2;
  void *v3;
  id v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  NSString v9;
  id v10;
  Swift::String v11;
  Swift::String v12;
  void *v13;
  NSString v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  Class isa;
  id v21;
  Swift::String v22;
  Swift::String v23;
  void *v24;
  id v25;
  Swift::String v26;
  Swift::String v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSString v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSString v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  char *v46;
  void **aBlock;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  void (*v51)(uint64_t);
  uint64_t v52;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;

  ObjectType = swift_getObjectType(v0);
  v2 = objc_msgSend(objc_allocWithZone((Class)PRXIconContentViewController), "init");
  objc_msgSend(v2, "setDismissalType:", 3);
  v3 = (void *)objc_opt_self(NSBundle);
  v4 = v2;
  v5 = objc_msgSend(v3, "mainBundle");
  v6._countAndFlagsBits = 0xD000000000000026;
  v53._object = (void *)0xE000000000000000;
  v6._object = (void *)0x800000010000D240;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v53._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v53)._object;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v4, "setTitle:", v9);

  v10 = objc_msgSend(v3, "mainBundle");
  v54._object = (void *)0xE000000000000000;
  v11._object = (void *)0x800000010000D270;
  v11._countAndFlagsBits = 0xD000000000000029;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  v54._countAndFlagsBits = 0;
  v13 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v10, v12, v54)._object;

  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  objc_msgSend(v4, "setBodyText:", v14);

  v15 = sub_10000BF38();
  if (v15)
  {
    v16 = v15;
    v17 = sub_1000033EC(&qword_100015790);
    v18 = swift_allocObject(v17, 40, 7);
    *(_OWORD *)(v18 + 16) = xmmword_10000D9F0;
    *(_QWORD *)(v18 + 32) = v16;
    aBlock = (void **)v18;
    specialized Array._endMutation()();
    sub_10000C0E8();
    v19 = v16;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(aBlock);
    objc_msgSend(v4, "setImages:", isa);

  }
  v21 = objc_msgSend(v3, "mainBundle");
  v55._object = (void *)0xE000000000000000;
  v22._object = (void *)0x800000010000D2A0;
  v22._countAndFlagsBits = 0xD000000000000029;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  v55._countAndFlagsBits = 0;
  v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v21, v23, v55)._object;

  v25 = objc_msgSend(v3, "mainBundle");
  v26._countAndFlagsBits = 0xD000000000000027;
  v56._object = (void *)0xE000000000000000;
  v26._object = (void *)0x800000010000D2D0;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  v56._countAndFlagsBits = 0;
  v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v26, (Swift::String_optional)0, (NSBundle)v25, v27, v56)._object;

  v29 = swift_allocObject(&unk_100010E90, 24, 7);
  swift_unknownObjectWeakInit(v29 + 16, v4);
  v30 = swift_allocObject(&unk_100010EB8, 32, 7);
  *(_QWORD *)(v30 + 16) = v29;
  *(_QWORD *)(v30 + 24) = ObjectType;
  swift_retain(v29);
  v31 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  v51 = sub_10000C0C0;
  v52 = v30;
  aBlock = _NSConcreteStackBlock;
  v48 = 1107296256;
  v49 = sub_10000B218;
  v50 = &unk_100010ED0;
  v32 = _Block_copy(&aBlock);
  v33 = (void *)objc_opt_self(PRXAction);
  v34 = objc_msgSend(v33, "actionWithTitle:style:handler:", v31, 0, v32);

  _Block_release(v32);
  v35 = v52;
  swift_release(v29);
  swift_release(v35);
  v36 = swift_allocObject(&unk_100010E90, 24, 7);
  swift_unknownObjectWeakInit(v36 + 16, v4);
  swift_retain(v36);
  v37 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v28);
  v51 = sub_10000C0E0;
  v52 = v36;
  aBlock = _NSConcreteStackBlock;
  v48 = 1107296256;
  v49 = sub_10000B218;
  v50 = &unk_100010EF8;
  v38 = _Block_copy(&aBlock);
  v39 = objc_msgSend(v33, "actionWithTitle:style:handler:", v37, 1, v38);

  _Block_release(v38);
  v40 = v52;
  swift_release(v36);
  swift_release(v40);

  v41 = OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController;
  v42 = *(void **)&v46[OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController];
  if (v42)
  {
    objc_msgSend(v42, "pushViewController:animated:", v4, 1);

  }
  else
  {
    v43 = v4;
    v44 = objc_msgSend(v46, "presentProxCardFlowWithDelegate:initialViewController:", v46, v43);
    v45 = *(void **)&v46[v41];
    *(_QWORD *)&v46[v41] = v44;

    v39 = v45;
  }

}

void sub_10000B7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSURL *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  Class isa;
  uint64_t v15;
  void *Strong;
  void *v17;
  _BYTE v19[24];

  v3 = sub_1000033EC(&qword_100015898);
  __chkstk_darwin(v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (v6)
  {
    v7 = v6;
    URL.init(string:)(0xD000000000000011, 0x800000010000D300);
    v8 = type metadata accessor for URL(0);
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) == 1)
    {
      __break(1u);
      return;
    }
    URL._bridgeToObjectiveC()(v10);
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
    v13 = sub_10000AFB8((uint64_t)&_swiftEmptyArrayStorage);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v13);
    objc_msgSend(v7, "openSensitiveURL:withOptions:", v12, isa);

  }
  v15 = a2 + 16;
  swift_beginAccess(v15, v19, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v15);
  if (Strong)
  {
    v17 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void sub_10000B978(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  void *v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

id sub_10000BAB8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMRemoteUIHawkeyeUpsellContentViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FMRemoteUIHawkeyeUpsellContentViewController()
{
  return objc_opt_self(_TtC21FindMyRemoteUIService44FMRemoteUIHawkeyeUpsellContentViewController);
}

unint64_t sub_10000BB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000BC20(a1, a2, v5);
}

unint64_t sub_10000BB70(uint64_t a1)
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
  return sub_10000BD00(a1, v7);
}

unint64_t sub_10000BBF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000BE74(a1, v4);
}

unint64_t sub_10000BC20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000BD00(uint64_t a1, uint64_t a2)
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

unint64_t sub_10000BE74(uint64_t a1, uint64_t a2)
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
      sub_10000C134(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100004C6C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_10000BF38()
{
  id v0;
  NSString v1;
  id v2;
  id v3;
  id v4;
  id result;
  void *v6;
  double v7;
  id v8;

  v0 = objc_allocWithZone((Class)ISIcon);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithBundleIdentifier:", v1);

  v3 = objc_msgSend((id)objc_opt_self(ISImageDescriptor), "imageDescriptorNamed:", kISImageDescriptorHomeScreen);
  v4 = objc_msgSend(v2, "imageForImageDescriptor:", v3);
  result = objc_msgSend(v4, "CGImage");
  if (result)
  {
    v6 = result;
    objc_msgSend(v4, "scale");
    v8 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCGImage:scale:orientation:", v6, 0, v7);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000C078()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C09C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000C0C0(uint64_t a1)
{
  uint64_t v1;

  sub_10000B7DC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000C0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C0D8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000C0E0(uint64_t a1)
{
  uint64_t v1;

  sub_10000B978(a1, v1);
}

unint64_t sub_10000C0E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100015B28;
  if (!qword_100015B28)
  {
    v1 = objc_opt_self(UIImage);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100015B28);
  }
  return result;
}

_OWORD *sub_10000C124(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000C134(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000C170(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000033EC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C1BC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC21FindMyRemoteUIServiceP33_4CEAFACF78ADFC7DDC276A609987D6D319ResourceBundleClass);
}
