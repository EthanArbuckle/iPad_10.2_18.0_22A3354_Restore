void sub_100004B38(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.people", "IMCoreInterface");
  v2 = (void *)qword_100022B80;
  qword_100022B80 = (uint64_t)v1;

}

void sub_100004C84(id a1, NSArray *a2)
{
  NSArray *v2;
  id v3;
  NSArray *v4;

  v2 = a2;
  v4 = v2;
  if (v2 || (v3 = objc_msgSend(0, "count"), v2 = 0, v3))
  {
    IMSPIMarkSPIMessagesAsRead(v2);
    v2 = v4;
  }

}

void sub_100004E2C(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v4 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_queue_create("com.apple.people.checkWithWait", v5);

  v15 = *(_QWORD *)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v14 = *(_QWORD *)(a1 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004FA0;
  v10[3] = &unk_10001CC70;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = v3;
  v9 = v3;
  IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS(v7, v8, 0, 1, 50, 25, v6, v10);

}

void sub_100004FA0(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[IMCoreInterface logHandle](IMCoreInterface, "logHandle"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "count");
    v6 = a1[4];
    v7 = a1[5];
    v9[0] = 67109634;
    v9[1] = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "checkWithWait returned %d items for %@ on %@", (uint8_t *)v9, 0x1Cu);
  }

  if (v3)
    v8 = v3;
  else
    v8 = &__NSArray0__struct;
  (*(void (**)(_QWORD, void *, _QWORD))(a1[6] + 16))(a1[6], v8, 0);

}

id sub_100005414(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD *, _QWORD *);
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMCoreInterface checkWithWait:service:](IMCoreInterface, "checkWithWait:service:", *(_QWORD *)(a1 + 32), IMSPIiMessageService));
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "then"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000054E0;
  v11[3] = &unk_10001CCC0;
  v12 = v3;
  v6 = (uint64_t (*)(_QWORD *, _QWORD *))v5[2];
  v7 = v3;
  v8 = v6(v5, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

id sub_1000054E0(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", a2);
}

id sub_1000054EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD *, _QWORD *);
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMCoreInterface checkWithWait:service:](IMCoreInterface, "checkWithWait:service:", *(_QWORD *)(a1 + 32), IMSPISMSService));
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "then"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000055B8;
  v11[3] = &unk_10001CCC0;
  v12 = v3;
  v6 = (uint64_t (*)(_QWORD *, _QWORD *))v5[2];
  v7 = v3;
  v8 = v6(v5, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

id sub_1000055B8(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", a2);
}

id sub_1000055C4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD *, _QWORD *);
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMCoreInterface checkWithWait:service:](IMCoreInterface, "checkWithWait:service:", *(_QWORD *)(a1 + 32), CFSTR("RCS")));
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "then"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000568C;
  v11[3] = &unk_10001CCC0;
  v12 = v3;
  v6 = (uint64_t (*)(_QWORD *, _QWORD *))v5[2];
  v7 = v3;
  v8 = v6(v5, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

id sub_10000568C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", a2);
}

id sub_100005698(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD *, _QWORD *);
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMCoreInterface checkWithWait:service:](IMCoreInterface, "checkWithWait:service:", *(_QWORD *)(a1 + 32), CFSTR("SatelliteSMS")));
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "then"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005760;
  v11[3] = &unk_10001CCC0;
  v12 = v3;
  v6 = (uint64_t (*)(_QWORD *, _QWORD *))v5[2];
  v7 = v3;
  v8 = v6(v5, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

id sub_100005760(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", a2);
}

id sub_10000576C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD *, _QWORD *);
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMCoreInterface checkWithWait:service:](IMCoreInterface, "checkWithWait:service:", *(_QWORD *)(a1 + 32), CFSTR("iMessageLite")));
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "then"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005834;
  v11[3] = &unk_10001CCC0;
  v12 = v3;
  v6 = (uint64_t (*)(_QWORD *, _QWORD *))v5[2];
  v7 = v3;
  v8 = v6(v5, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

id sub_100005834(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", a2);
}

id sub_100005840(id a1, NSArray *a2)
{
  NSArray *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = a2;
  if (-[NSArray count](v2, "count"))
  {
    v3 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("date"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v2));
    v10 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    objc_msgSend(v4, "sortUsingDescriptors:", v5);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005988;
    v8[3] = &unk_10001CD28;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v9 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

void sub_100005988(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  MinMessageItem *v4;
  void *v5;
  MinMessageItem *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [MinMessageItem alloc];
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "body"));

  v6 = -[MinMessageItem initWith:andText:](v4, "initWith:andText:", v7, v5);
  objc_msgSend(v2, "addObject:", v6);

}

uint64_t sub_100005A20(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!a2)
    a2 = &__NSArray0__struct;
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, a2);
}

uint64_t sub_100005A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  sub_100006298(&qword_100022068);
  __chkstk_darwin();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)(0x2F3A796D646E6966, 0xEF646E656972662FLL);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v14 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    v15 = QuickAction.handle.getter(v14);
    if (v16)
    {
      v17 = v16;
      URL.appendPathComponent(_:)(*(Swift::String *)&v15);
      swift_bridgeObjectRelease(v17);
    }
    v19 = v4[5];
    v18 = v4[6];
    sub_1000062D8(v4 + 2, v19);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 8))(v12, a3, a4, v19, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return result;
}

uint64_t sub_100005BA8()
{
  uint64_t v0;

  sub_1000062FC((_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for LocationActionHandler()
{
  return objc_opt_self(_TtC17PeopleViewService21LocationActionHandler);
}

uint64_t sub_100005BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100005A3C(a1, a2, a3, a4);
}

uint64_t sub_100005C10(uint64_t a1, uint64_t a2)
{
  return sub_100005CEC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005C30(uint64_t a1, uint64_t a2)
{
  return sub_100005CEC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005C3C(uint64_t a1)
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

Swift::Int sub_100005C7C(uint64_t a1)
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

uint64_t sub_100005CEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100005D28(uint64_t a1, id *a2)
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

uint64_t sub_100005D9C(uint64_t a1, id *a2)
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

uint64_t sub_100005E18@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_100005E5C(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100005EE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000063B4(&qword_1000220B0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100016F78);
  v3 = sub_1000063B4(&qword_1000220B8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100016ECC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005F6C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100005FB0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005FD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000063B4((unint64_t *)&qword_1000220C0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100016FBC);
  v3 = sub_1000063B4(&qword_1000220C8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100016DB8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000605C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_BYTE *, uint64_t);
  uint64_t v18;
  void (*v19)(_BYTE *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[12];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = type metadata accessor for QuickAction(0);
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = &v23[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for QuickActionType(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __chkstk_darwin(v8);
  v13 = &v23[-v12];
  QuickAction.type.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v10, enum case for QuickActionType.location(_:), v6);
  v14 = sub_1000063B4((unint64_t *)&qword_100022060, (uint64_t (*)(uint64_t))&type metadata accessor for QuickActionType, (uint64_t)&protocol conformance descriptor for QuickActionType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v27, v6, v14);
  dispatch thunk of RawRepresentable.rawValue.getter(&v25, v6, v14);
  v15 = v28;
  v16 = v26;
  if (v27 == v25 && v28 == v26)
  {
    swift_bridgeObjectRelease_n(v28, 2);
    v17 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v17(v10, v6);
    v17(v13, v6);
    v18 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  }
  else
  {
    v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v28, v25, v26, 0);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v16);
    v19 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v19(v10, v6);
    v19(v13, v6);
    v18 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    if ((v24 & 1) == 0)
    {
      (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
      return 0;
    }
  }
  QuickAction.handle.getter(v18);
  v21 = v20;
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  if (v21)
  {
    swift_bridgeObjectRelease(v21);
    return 1;
  }
  return 0;
}

uint64_t sub_100006298(uint64_t *a1)
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

_QWORD *sub_1000062D8(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000062FC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_100006344(a1, &qword_100022070, (uint64_t)&unk_10001CEF0);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100006344(a1, &qword_100022078, (uint64_t)&unk_10001CF18);
}

void sub_100006344(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100006388()
{
  return sub_1000063B4(&qword_100022080, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100016D7C);
}

uint64_t sub_1000063B4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000063F4()
{
  return sub_1000063B4(&qword_100022088, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100016D50);
}

uint64_t sub_100006420()
{
  return sub_1000063B4(&qword_100022090, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100016E90);
}

uint64_t sub_10000644C()
{
  return sub_1000063B4(&qword_100022098, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100016E64);
}

uint64_t sub_100006478()
{
  return sub_1000063B4(&qword_1000220A0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100016F00);
}

uint64_t sub_1000064A4()
{
  return sub_1000063B4(&qword_1000220A8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100016DEC);
}

void sub_1000064D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  Class isa;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  NSURL v21;
  void *v22;
  uint64_t (*v23)(char);
  uint64_t v24;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL._bridgeToObjectiveC()(&v21);
  v11 = v10;
  v12 = sub_100013600((uint64_t)&_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_1000063B4(&qword_1000220B0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_100016F78);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v14 = *(unsigned __int8 *)(v7 + 80);
  v15 = (v14 + 16) & ~v14;
  v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject(&unk_10001D010, v16 + 16, v14 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v9, v6);
  v18 = (_QWORD *)(v17 + v16);
  *v18 = a2;
  v18[1] = a3;
  v23 = sub_100006880;
  v24 = v17;
  v21._baseURL = (NSURL *)_NSConcreteStackBlock;
  v21._clients = (void *)1107296256;
  v21._reserved = sub_1000067AC;
  v22 = &unk_10001D028;
  v19 = _Block_copy(&v21._baseURL);
  v20 = v24;
  swift_retain(a3);
  swift_release(v20);
  -[NSString openURL:options:completionHandler:](v21._urlString, "openURL:options:completionHandler:", v11, isa, v19);
  _Block_release(v19);

}

uint64_t sub_1000066B0(char a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  if ((a1 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    v11 = type metadata accessor for FailedToOpenURLError(0);
    v12 = sub_1000063B4(&qword_1000220D0, type metadata accessor for FailedToOpenURLError, (uint64_t)&unk_10001707C);
    v10 = swift_allocError(v11, v12, 0, 0);
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v13, v9, v6);
  }
  a3(v10);
  return swift_errorRelease(v10);
}

uint64_t sub_1000067AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

void sub_1000067E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000064D8(a1, a2, a3);
}

uint64_t sub_100006808()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_100006880(char a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_1000066B0(a1, v1 + v4, *(void (**)(uint64_t))(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1000068D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000068E4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000068F0(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  void (*v26)(uint64_t);
  uint64_t v27;

  v26 = a2;
  v27 = a3;
  v8 = type metadata accessor for URLComponents(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006298(&qword_100022068);
  __chkstk_darwin(v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for URL(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  URLComponents.url.getter(v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_100006AC0((uint64_t)v14);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
    v20 = type metadata accessor for InvalidURLComponentsError(0);
    v21 = sub_100006B14();
    v22 = swift_allocError(v20, v21, 0, 0);
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v23, v11, v8);
    v26(v22);
    return swift_errorRelease(v22);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v14, v15);
    (*(void (**)(char *, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(a5 + 8))(v19, v26, v27, a4, a5);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  }
}

uint64_t sub_100006AC0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006298(&qword_100022068);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for InvalidURLComponentsError(uint64_t a1)
{
  return sub_100006BE8(a1, qword_1000221C8, (uint64_t)&nominal type descriptor for InvalidURLComponentsError);
}

unint64_t sub_100006B14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000220D8;
  if (!qword_1000220D8)
  {
    v1 = type metadata accessor for InvalidURLComponentsError(255);
    result = swift_getWitnessTable(&unk_1000170BC, v1);
    atomic_store(result, (unint64_t *)&qword_1000220D8);
  }
  return result;
}

uint64_t sub_100006B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006C34(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URL);
}

uint64_t sub_100006B68(uint64_t a1, uint64_t a2)
{
  return sub_100006C7C(a1, a2, (uint64_t (*)(_QWORD))&type metadata accessor for URL);
}

uint64_t sub_100006B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006CBC(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URL);
}

uint64_t sub_100006B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006D0C(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URL);
}

uint64_t sub_100006B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006D5C(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URL);
}

uint64_t sub_100006B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006DAC(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URL);
}

uint64_t sub_100006BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006BB0);
}

uint64_t sub_100006BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006E08(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URL);
}

uint64_t sub_100006BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006BC8);
}

uint64_t sub_100006BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100006E5C(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for URL);
}

uint64_t type metadata accessor for FailedToOpenURLError(uint64_t a1)
{
  return sub_100006BE8(a1, qword_100022138, (uint64_t)&nominal type descriptor for FailedToOpenURLError);
}

uint64_t sub_100006BE8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100006C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006EA8(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
}

uint64_t sub_100006C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006C34(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URLComponents);
}

uint64_t sub_100006C34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v6 - 8))(a1, a2, v6);
}

uint64_t sub_100006C70(uint64_t a1, uint64_t a2)
{
  return sub_100006C7C(a1, a2, (uint64_t (*)(_QWORD))&type metadata accessor for URLComponents);
}

uint64_t sub_100006C7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v4;

  v4 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

uint64_t sub_100006CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006CBC(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URLComponents);
}

uint64_t sub_100006CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  return a1;
}

uint64_t sub_100006D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006D0C(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URLComponents);
}

uint64_t sub_100006D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  return a1;
}

uint64_t sub_100006D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006D5C(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URLComponents);
}

uint64_t sub_100006D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  return a1;
}

uint64_t sub_100006DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006DAC(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URLComponents);
}

uint64_t sub_100006DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  return a1;
}

uint64_t sub_100006DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006DFC);
}

uint64_t sub_100006DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006E08(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for URLComponents);
}

uint64_t sub_100006E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
}

uint64_t sub_100006E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006E50);
}

uint64_t sub_100006E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100006E5C(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for URLComponents);
}

uint64_t sub_100006E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v7;

  v7 = a5(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, a2, a2, v7);
}

uint64_t sub_100006E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006EA8(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for URLComponents);
}

uint64_t sub_100006EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  unint64_t v6;
  uint64_t v7;

  result = a4(319);
  if (v6 <= 0x3F)
  {
    v7 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v7, a1 + 16);
    return 0;
  }
  return result;
}

void sub_100006F20(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  id v8;
  NSString v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;

  v8 = a3;
  if (a3)
  {
    swift_bridgeObjectRetain(a3);
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    v8 = objc_msgSend((id)objc_opt_self(LSApplicationProxy), "applicationProxyForIdentifier:", v10);

  }
  v11 = swift_allocObject(&unk_10001D0C8, 32, 7);
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  v14[4] = sub_100007770;
  v15 = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10000704C;
  v14[3] = &unk_10001D0E0;
  v12 = _Block_copy(v14);
  v13 = v15;
  swift_retain(a5);
  swift_release(v13);
  objc_msgSend(v5, "openUserActivity:withApplicationProxy:completionHandler:", a1, v8, v12);
  _Block_release(v12);

}

void sub_10000704C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  id v7;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_1000070AC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  sub_100006F20(a1, a2, a3, a4, a5);
}

uint64_t sub_1000070CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSString v16;
  id v17;
  id v18;
  uint64_t ObjectType;
  objc_class *ObjCClassFromMetadata;
  NSString *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSString v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(id, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t);
  void *v47;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v11 = type metadata accessor for Logger(0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = v5;
  v60 = a4;
  v57 = v15;
  v58 = v12;
  if (a3)
  {
    swift_bridgeObjectRetain(a3);
    v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
    v17 = objc_msgSend((id)objc_opt_self(LSApplicationProxy), "applicationProxyForIdentifier:", v16);

  }
  else
  {
    v17 = 0;
  }
  v18 = objc_msgSend(objc_allocWithZone((Class)INInteraction), "initWithIntent:response:", a1, 0);
  ObjectType = swift_getObjectType(a1);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(ObjectType);
  v21 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  v23 = v22;

  v24 = objc_allocWithZone((Class)NSUserActivity);
  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  v26 = objc_msgSend(v24, "initWithActivityType:", v25);

  v55 = v26;
  v56 = v18;
  static PeopleLogger.common.getter(objc_msgSend(v26, "_setInteraction:donate:", v18, 0));
  v54 = v17;
  v27 = v17;
  v28 = a1;
  v29 = v27;
  v30 = v28;
  v31 = v14;
  v32 = Logger.logObject.getter(v30);
  v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v50 = v31;
    v51 = a5;
    v52 = a2;
    v53 = a3;
    v34 = swift_slowAlloc(22, -1);
    v35 = (_QWORD *)swift_slowAlloc(8, -1);
    v49 = swift_slowAlloc(32, -1);
    v61 = (uint64_t)v30;
    v62 = v49;
    *(_DWORD *)v34 = 138412546;
    v36 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v34 + 4, v34 + 12);
    *v35 = v30;

    *(_WORD *)(v34 + 12) = 2080;
    if (v54)
    {
      v37 = objc_msgSend(v29, "description");
      v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
      v40 = v39;

    }
    else
    {
      v40 = 0xE100000000000000;
      v38 = 45;
    }
    a3 = v53;
    v61 = sub_100014E0C(v38, v40, &v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v34 + 14, v34 + 22);

    swift_bridgeObjectRelease(v40);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Launching intent: %@ with application proxy: %s", (uint8_t *)v34, 0x16u);
    v41 = sub_100006298(&qword_1000222A8);
    swift_arrayDestroy(v35, 1, v41);
    swift_slowDealloc(v35, -1, -1);
    v42 = v49;
    swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1, -1);
    swift_slowDealloc(v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v57 + 8))(v50, v58);
    a5 = v51;
    a2 = v52;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v57 + 8))(v31, v58);
  }
  v43 = v59[5];
  v44 = v59[6];
  sub_1000062D8(v59 + 2, v43);
  v45 = swift_allocObject(&unk_10001D0A0, 32, 7);
  *(_QWORD *)(v45 + 16) = v60;
  *(_QWORD *)(v45 + 24) = a5;
  v46 = *(void (**)(id, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v44 + 8);
  swift_retain(a5);
  v47 = v55;
  v46(v55, a2, a3, sub_100007768, v45, v43, v44);

  return swift_release(v45);
}

uint64_t sub_10000750C(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD);
  uint64_t v26;
  _QWORD v27[3];
  _BYTE v28[8];
  uint64_t v29;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v10 = swift_errorRetain(a1);
    static PeopleLogger.viewService.getter(v10);
    swift_errorRetain(a1);
    v11 = swift_errorRetain(a1);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc(12, -1);
      v25 = a2;
      v15 = (uint8_t *)v14;
      v16 = swift_slowAlloc(32, -1);
      v29 = v16;
      v24 = a3;
      *(_DWORD *)v15 = 136315138;
      v23 = v15 + 4;
      swift_getErrorValue(a1, v28, v27);
      v17 = Error.localizedDescription.getter(v27[1], v27[2]);
      v19 = v18;
      v26 = sub_100014E0C(v17, v18, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, v27, v23, v15 + 12);
      swift_bridgeObjectRelease(v19);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to launch activity: %s", v15, 0xCu);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      v20 = v15;
      a2 = v25;
      swift_slowDealloc(v20, -1, -1);

      swift_errorRelease(a1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return a2(a1);
}

uint64_t type metadata accessor for IntentLauncher()
{
  return objc_opt_self(_TtC17PeopleViewService14IntentLauncher);
}

uint64_t sub_100007744()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007768(uint64_t a1)
{
  uint64_t v1;

  return sub_10000750C(a1, *(uint64_t (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100007770(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 16))(a2);
}

uint64_t sub_100007794(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000077A4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000077B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD v19[5];

  v3 = type metadata accessor for ContactFormatter.Style(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v19[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000062D8((_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 48));
  v7 = QuickAction.contactIdentifier.getter();
  v9 = v8;
  v10 = (void *)dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)(v7);
  swift_bridgeObjectRelease(v9);
  if (v10)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for ContactFormatter.Style.shortName(_:), v3);
    v11 = v10;
    v12 = String.localized.getter(0x656D614E206F4ELL, 0xE700000000000000);
    v14 = v13;
    v19[3] = type metadata accessor for ContactFormatter(0);
    v19[4] = &protocol witness table for ContactFormatter;
    sub_100008A60(v19);
    ContactFormatter.init(style:fallback:)(v6, v12, v14);
    Person.init(from:statuses:contactFormatter:)(v11, &_swiftEmptyArrayStorage, v19);

    v15 = type metadata accessor for Person(0);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a1, 0, 1, v15);
  }
  else
  {
    v17 = type metadata accessor for Person(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a1, 1, 1, v17);
  }
}

uint64_t sub_100007968(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
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
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  void (*v31)(char *, uint64_t);
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t DynamicType;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v105;
  int v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t);
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  void (*v117)(char *, uint64_t);
  void (*v118)(char *, uint64_t, uint64_t);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  __int128 v130;
  uint64_t v131;
  uint64_t v132;

  v119 = type metadata accessor for QuickAction(0);
  v121 = *(_QWORD *)(v119 - 8);
  v2 = __chkstk_darwin(v119);
  v113 = (char *)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v2);
  v110 = (char *)&v105 - v5;
  v6 = __chkstk_darwin(v4);
  v114 = (char *)&v105 - v7;
  v109 = v8;
  __chkstk_darwin(v6);
  v10 = (char *)&v105 - v9;
  v120 = type metadata accessor for Logger(0);
  v111 = *(_QWORD *)(v120 - 8);
  v11 = __chkstk_darwin(v120);
  v115 = (char *)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v116 = (char *)&v105 - v14;
  __chkstk_darwin(v13);
  v16 = (char *)&v105 - v15;
  v17 = sub_100006298(&qword_100022378);
  v18 = __chkstk_darwin(v17);
  v108 = (uint64_t)&v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v105 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v105 - v23;
  v25 = type metadata accessor for QuickActionType(0);
  v26 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v28 = (char *)&v105 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PeopleAnalytics(0);
  v29 = static PeopleAnalytics.shared.getter();
  QuickAction.type.getter(v29);
  dispatch thunk of PeopleAnalytics.sendWidgetPerformQuickAction(_:)(v28);
  swift_release(v29);
  v30 = *(void (**)(char *, uint64_t))(v26 + 8);
  v31 = v117;
  v32 = v28;
  v33 = v16;
  v34 = v10;
  v35 = v119;
  v36 = v25;
  v37 = v121;
  v30(v32, v36);
  v38 = sub_1000077B0((uint64_t)v24);
  static PeopleLogger.viewService.getter(v38);
  v118 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
  v118(v34, a1, v35);
  v39 = sub_10000889C((uint64_t)v24, (uint64_t)v22);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v40, (os_log_type_t)v41))
  {
    v106 = v41;
    v107 = v33;
    v42 = swift_slowAlloc(22, -1);
    v105 = swift_slowAlloc(64, -1);
    *(_QWORD *)&v130 = v105;
    *(_DWORD *)v42 = 136315394;
    v43 = sub_100008964();
    v44 = dispatch thunk of CustomStringConvertible.description.getter(v35, v43);
    v46 = v45;
    *(_QWORD *)&v127 = sub_100014E0C(v44, v45, (uint64_t *)&v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, (char *)&v127 + 8, v42 + 4, v42 + 12);
    swift_bridgeObjectRelease(v46);
    v47 = *(void (**)(char *, uint64_t))(v121 + 8);
    v47(v34, v35);
    *(_WORD *)(v42 + 12) = 2080;
    v48 = v108;
    sub_10000889C((uint64_t)v22, v108);
    v49 = type metadata accessor for Person(0);
    v50 = *(_QWORD *)(v49 - 8);
    v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49);
    v112 = v47;
    v52 = (uint64_t)v22;
    if (v51 == 1)
    {
      sub_100008928(v48, &qword_100022378);
      v53 = 0xE100000000000000;
      v54 = 45;
    }
    else
    {
      v56 = v48;
      v54 = Person.description.getter();
      v53 = v57;
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v56, v49);
    }
    v31 = v117;
    v58 = v111;
    *(_QWORD *)&v127 = sub_100014E0C(v54, v53, (uint64_t *)&v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, (char *)&v127 + 8, v42 + 14, v42 + 22);
    swift_bridgeObjectRelease(v53);
    sub_100008928(v52, &qword_100022378);
    _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v106, "Attempting to handle action: %s, for person: %s", (uint8_t *)v42, 0x16u);
    v59 = v105;
    swift_arrayDestroy(v105, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v59, -1, -1);
    swift_slowDealloc(v42, -1, -1);

    v55 = *(void (**)(char *, uint64_t))(v58 + 8);
    v55(v107, v120);
  }
  else
  {
    v112 = *(void (**)(char *, uint64_t))(v37 + 8);
    v112(v34, v35);
    sub_100008928((uint64_t)v22, &qword_100022378);

    v55 = *(void (**)(char *, uint64_t))(v111 + 8);
    v55(v33, v120);
  }
  v60 = *((_QWORD *)v31 + 2);
  v61 = *(_QWORD *)(v60 + 16);
  if (v61)
  {
    v62 = v60 + 32;
    swift_bridgeObjectRetain(*((_QWORD *)v31 + 2));
    v63 = v119;
    while (1)
    {
      sub_1000088E4(v62, (uint64_t)&v130);
      v64 = v131;
      v65 = v132;
      sub_1000062D8(&v130, v131);
      if (((*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(v65 + 8))(a1, v24, v64, v65) & 1) != 0)
        break;
      sub_1000062FC(&v130);
      v62 += 40;
      if (!--v61)
        goto LABEL_13;
    }
    sub_1000089AC(&v130, (uint64_t)&v127);
  }
  else
  {
    swift_bridgeObjectRetain(*((_QWORD *)v31 + 2));
    v63 = v119;
LABEL_13:
    v129 = 0;
    v127 = 0u;
    v128 = 0u;
  }
  swift_bridgeObjectRelease(v60);
  v66 = v116;
  v67 = v114;
  v68 = v115;
  v69 = v113;
  if (*((_QWORD *)&v128 + 1))
  {
    v70 = sub_1000089AC(&v127, (uint64_t)&v130);
    static PeopleLogger.viewService.getter(v70);
    sub_1000088E4((uint64_t)&v130, (uint64_t)&v124);
    v71 = ((uint64_t (*)(char *, uint64_t, uint64_t))v118)(v67, a1, v63);
    v72 = Logger.logObject.getter(v71);
    v73 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = swift_slowAlloc(22, -1);
      v115 = (char *)swift_slowAlloc(64, -1);
      v123 = v115;
      *(_DWORD *)v74 = 136315394;
      v75 = v126;
      v76 = sub_1000062D8(&v124, v126);
      DynamicType = swift_getDynamicType(v76, v75, 1);
      v78 = _typeName(_:qualified:)(DynamicType, 0);
      v80 = v79;
      v122 = sub_100014E0C(v78, v79, (uint64_t *)&v123);
      v117 = v55;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, &v123, v74 + 4, v74 + 12);
      swift_bridgeObjectRelease(v80);
      sub_1000062FC(&v124);
      *(_WORD *)(v74 + 12) = 2080;
      v81 = sub_100008964();
      v82 = dispatch thunk of CustomStringConvertible.description.getter(v63, v81);
      v84 = v83;
      v122 = sub_100014E0C(v82, v83, (uint64_t *)&v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, &v123, v74 + 14, v74 + 22);
      swift_bridgeObjectRelease(v84);
      v112(v67, v63);
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Got handler: %s for action: %s", (uint8_t *)v74, 0x16u);
      v85 = v115;
      swift_arrayDestroy(v115, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v85, -1, -1);
      swift_slowDealloc(v74, -1, -1);

      v117(v116, v120);
    }
    else
    {
      sub_1000062FC(&v124);
      v112(v67, v63);

      v55(v66, v120);
    }
    v97 = v131;
    v98 = v132;
    sub_1000062D8(&v130, v131);
    v99 = v110;
    v118(v110, a1, v63);
    v100 = v121;
    v101 = *(unsigned __int8 *)(v121 + 80);
    v102 = (v101 + 16) & ~v101;
    v103 = swift_allocObject(&unk_10001D118, v102 + v109, v101 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v100 + 32))(v103 + v102, v99, v63);
    (*(void (**)(uint64_t, char *, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v98 + 16))(a1, v24, sub_100008A24, v103, v97, v98);
    swift_release(v103);
    sub_100008928((uint64_t)v24, &qword_100022378);
    return sub_1000062FC(&v130);
  }
  else
  {
    v86 = sub_100008928((uint64_t)&v127, &qword_100022380);
    static PeopleLogger.viewService.getter(v86);
    v87 = ((uint64_t (*)(char *, uint64_t, uint64_t))v118)(v69, a1, v63);
    v88 = Logger.logObject.getter(v87);
    v89 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc(12, -1);
      v91 = swift_slowAlloc(32, -1);
      v117 = v55;
      v92 = v91;
      *(_QWORD *)&v130 = v91;
      *(_DWORD *)v90 = 136315138;
      v93 = sub_100008964();
      v94 = dispatch thunk of CustomStringConvertible.description.getter(v63, v93);
      v96 = v95;
      v124 = sub_100014E0C(v94, v95, (uint64_t *)&v130);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v124, &v125, v90 + 4, v90 + 12);
      swift_bridgeObjectRelease(v96);
      v112(v69, v63);
      _os_log_impl((void *)&_mh_execute_header, v88, v89, "No available handler for action: %s", v90, 0xCu);
      swift_arrayDestroy(v92, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v92, -1, -1);
      swift_slowDealloc(v90, -1, -1);

      v117(v115, v120);
    }
    else
    {
      v112(v69, v63);

      v55(v68, v120);
    }
    return sub_100008928((uint64_t)v24, &qword_100022378);
  }
}

uint64_t sub_1000083E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE v28[4];
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[3];
  _BYTE v34[8];
  uint64_t v35;
  uint64_t v36;

  v4 = type metadata accessor for QuickAction(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = __chkstk_darwin(v8);
  v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    v13 = swift_errorRetain(a1);
    static PeopleLogger.viewService.getter(v13);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    swift_errorRetain(a1);
    v14 = swift_errorRetain(a1);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    v17 = v16;
    if (os_log_type_enabled(v15, v16))
    {
      v18 = swift_slowAlloc(22, -1);
      v32 = v9;
      v19 = v18;
      v31 = swift_slowAlloc(64, -1);
      v36 = v31;
      *(_DWORD *)v19 = 136315394;
      v20 = sub_100008964();
      v29 = v17;
      v21 = dispatch thunk of CustomStringConvertible.description.getter(v4, v20);
      v23 = v22;
      v35 = sub_100014E0C(v21, v22, &v36);
      v30 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease(v23);
      (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
      *(_WORD *)(v19 + 12) = 2080;
      swift_getErrorValue(a1, v34, v33);
      v24 = Error.localizedDescription.getter(v33[1], v33[2]);
      v26 = v25;
      v35 = sub_100014E0C(v24, v25, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v19 + 14, v19 + 22);
      swift_bridgeObjectRelease(v26);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v15, (os_log_type_t)v29, "Failed to handle action: %s with error: %s", (uint8_t *)v19, 0x16u);
      v27 = v31;
      swift_arrayDestroy(v31, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v19, -1, -1);

      swift_errorRelease(a1);
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v32 + 8))(v12, v30);
    }
    else
    {
      swift_errorRelease(a1);
      (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

      return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v12, v8);
    }
  }
  return result;
}

uint64_t sub_1000086AC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  sub_1000062FC((_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for ActionLauncher()
{
  return objc_opt_self(_TtC17PeopleViewService14ActionLauncher);
}

id sub_1000086F8()
{
  uint64_t v0;
  uint64_t v1;
  id result;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  unint64_t v15;
  _UNKNOWN **v16;

  v0 = sub_100006298(&qword_100022368);
  v1 = swift_allocObject(v0, 112, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100017180;
  result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (result)
  {
    v3 = result;
    v15 = sub_100008860();
    v16 = &off_10001D080;
    *(_QWORD *)&v14 = v3;
    v4 = type metadata accessor for IntentLauncher();
    v5 = swift_allocObject(v4, 56, 7);
    sub_1000089AC(&v14, v5 + 16);
    v6 = objc_msgSend(objc_allocWithZone((Class)CNLaunchServices), "init");
    v7 = type metadata accessor for MessageActionHandler();
    v8 = swift_allocObject(v7, 32, 7);
    *(_QWORD *)(v8 + 16) = v5;
    *(_QWORD *)(v8 + 24) = v6;
    *(_QWORD *)(v1 + 56) = v7;
    *(_QWORD *)(v1 + 64) = &off_10001D300;
    *(_QWORD *)(v1 + 32) = v8;
    v9 = sub_10000BD68();
    *(_QWORD *)(v1 + 96) = type metadata accessor for CallActionHandler();
    *(_QWORD *)(v1 + 104) = &off_10001D168;
    *(_QWORD *)(v1 + 72) = v9;
    v10 = type metadata accessor for ContactFetcher(0);
    v11 = ContactFetcher.__allocating_init()();
    v15 = v10;
    v16 = (_UNKNOWN **)&protocol witness table for ContactFetcher;
    *(_QWORD *)&v14 = v11;
    v12 = type metadata accessor for ActionLauncher();
    v13 = swift_allocObject(v12, 64, 7);
    *(_QWORD *)(v13 + 16) = v1;
    sub_1000089AC(&v14, v13 + 24);
    return (id)v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100008860()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022370;
  if (!qword_100022370)
  {
    v1 = objc_opt_self(LSApplicationWorkspace);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100022370);
  }
  return result;
}

uint64_t sub_10000889C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006298(&qword_100022378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000088E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008928(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006298(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100008964()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022388;
  if (!qword_100022388)
  {
    v1 = type metadata accessor for QuickAction(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for QuickAction, v1);
    atomic_store(result, (unint64_t *)&qword_100022388);
  }
  return result;
}

uint64_t sub_1000089AC(__int128 *a1, uint64_t a2)
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

uint64_t sub_1000089C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for QuickAction(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100008A24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QuickAction(0) - 8) + 80);
  return sub_1000083E0(a1, v1 + ((v3 + 16) & ~v3));
}

_QWORD *sub_100008A60(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t *sub_100008A9C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    v7 = type metadata accessor for QuickAction(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for Person(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = sub_100006298(&qword_100022378);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t sub_100008BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = type metadata accessor for QuickAction(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for Person(0);
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t sub_100008C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for QuickAction(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Person(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_100006298(&qword_100022378);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_100008D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for QuickAction(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for Person(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = sub_100006298(&qword_100022378);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_100008E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for QuickAction(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Person(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_100006298(&qword_100022378);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_100008F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for QuickAction(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for Person(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = sub_100006298(&qword_100022378);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_10000903C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009048);
}

uint64_t sub_100009048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for QuickAction(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_100006298(&qword_100022378);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_1000090C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000090CC);
}

uint64_t sub_1000090CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for QuickAction(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_100006298(&qword_100022378);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for NoAvailableContactHandle(uint64_t a1)
{
  uint64_t result;

  result = qword_1000223E8;
  if (!qword_1000223E8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for NoAvailableContactHandle);
  return result;
}

void sub_100009188(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[2];

  v2 = type metadata accessor for QuickAction(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000920C(319);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v6, a1 + 16);
    }
  }
}

void sub_10000920C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000223F8)
  {
    v2 = type metadata accessor for Person(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000223F8);
  }
}

id sub_100009408()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
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

  v3 = type metadata accessor for AppDelegate();
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

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC17PeopleViewService11AppDelegate);
}

uint64_t sub_1000094E0()
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
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static PeopleLogger.viewService.getter(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    v11 = sub_100014E0C(0xD00000000000002DLL, 0x80000001000199D0, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8 + 4, v8 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return 1;
}

unint64_t sub_10000966C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000220C0;
  if (!qword_1000220C0)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable(&unk_100016FBC, v1);
    atomic_store(result, (unint64_t *)&qword_1000220C0);
  }
  return result;
}

void sub_1000096B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v8;
  id v9;
  id v10;
  id v11;
  NSString v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *object;
  uint64_t v18;
  id v19;
  NSString v20;
  id v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  uint64_t v25;

  v8 = objc_msgSend(objc_allocWithZone((Class)TUCallProviderManager), "init");
  v9 = objc_msgSend(v8, "telephonyProvider");

  v10 = objc_msgSend(objc_allocWithZone((Class)TUDialRequest), "initWithProvider:", v9);
  v11 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain(a2);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v13 = objc_msgSend(v11, "initWithStringValue:", v12);

  v14 = objc_msgSend(v13, "stringValue");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v16 = v15;

  object = String.trimToNil()().value._object;
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(object);
  if (object)
    v18 = 2;
  else
    v18 = 3;
  v19 = objc_allocWithZone((Class)TUHandle);
  swift_bridgeObjectRetain(a2);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v21 = objc_msgSend(v19, "initWithType:value:", v18, v20);

  objc_msgSend(v10, "setHandle:", v21);
  objc_msgSend(v10, "setVideo:", 0);
  v24[4] = a3;
  v25 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 1107296256;
  v24[2] = sub_1000098FC;
  v24[3] = &unk_10001D1C0;
  v22 = _Block_copy(v24);
  v23 = v25;
  swift_retain(a4);
  swift_release(v23);
  objc_msgSend(v4, "launchAppForDialRequest:completion:", v10, v22);
  _Block_release(v22);

}

void sub_1000098FC(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

void sub_100009950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000096B4(a1, a2, a3, a4);
}

uint64_t sub_100009970(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v3 = v1[11];
  v4 = v1[12];
  sub_1000062D8(v1 + 8, v3);
  v5 = dispatch thunk of IntentHandlingApplicationRegistry.applications(forIntentClass:)(a1, v3, v4);
  v6 = v5;
  v7 = *(_QWORD *)(v5 + 16);
  if (v7)
  {
    v23 = &_swiftEmptyArrayStorage;
    sub_10000BBE4(0, v7, 0);
    v8 = v6 + 32;
    v9 = &_swiftEmptyArrayStorage;
    do
    {
      sub_1000088E4(v8, (uint64_t)v20);
      v10 = v21;
      v11 = v22;
      sub_1000062D8(v20, v21);
      v12 = dispatch thunk of ApplicationRecord.bundleIdentifier.getter(v10, v11);
      v14 = v13;
      sub_1000062FC(v20);
      if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
      {
        sub_10000BBE4(0, v9[2] + 1, 1);
        v9 = v23;
      }
      v16 = v9[2];
      v15 = v9[3];
      if (v16 >= v15 >> 1)
      {
        sub_10000BBE4(v15 > 1, v16 + 1, 1);
        v9 = v23;
      }
      v9[2] = v16 + 1;
      v17 = (char *)&v9[2 * v16];
      *((_QWORD *)v17 + 4) = v12;
      *((_QWORD *)v17 + 5) = v14;
      v8 += 40;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    swift_bridgeObjectRelease(v5);
    v9 = &_swiftEmptyArrayStorage;
  }
  v18 = sub_10000C3AC((uint64_t)v9);
  swift_bridgeObjectRelease(v9);
  return v18;
}

id sub_100009AF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  Class isa;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  id v17;
  id v18;
  Class v19;
  id v20;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v8 = sub_100006298(&qword_100022980);
  v9 = swift_allocObject(v8, 40, 7);
  *(_OWORD *)(v9 + 16) = xmmword_100017240;
  *(_QWORD *)(v9 + 32) = a1;
  v23 = v9;
  specialized Array._endMutation()();
  v10 = objc_allocWithZone((Class)INStartCallIntent);
  sub_10000C374(0, (unint64_t *)&qword_100022620, INPerson_ptr);
  v22 = a1;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  v12 = objc_msgSend(v10, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, 1, isa, a2);

  if (a4)
  {
    v13 = sub_10000C374(0, &qword_100022628, INStartCallIntent_ptr);
    v14 = sub_100009970(v13);
    v15 = sub_100009CE0(a3, a4, v14);
    swift_bridgeObjectRelease(v14);
    if ((v15 & 1) == 0)
    {
      if (a2 == 2)
      {
        v16 = swift_allocObject(v8, 40, 7);
        *(_OWORD *)(v16 + 16) = xmmword_100017240;
        *(_QWORD *)(v16 + 32) = v22;
        v24 = v16;
        specialized Array._endMutation()();
        v17 = objc_allocWithZone((Class)INStartVideoCallIntent);
        v18 = v22;
        v19 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v24);
        v20 = objc_msgSend(v17, "initWithContacts:", v19);

        return v20;
      }
      else
      {

        return 0;
      }
    }
  }
  return v12;
}

uint64_t sub_100009CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v20[9];

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20, *(_QWORD *)(a3 + 40));
    String.hash(into:)(v20, a1, a2);
    v6 = Hasher._finalize()();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = v11[1];
      v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0) & 1) != 0)
        return 1;
      v15 = ~v7;
      v16 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
      {
        while (1)
        {
          v17 = (_QWORD *)(v10 + 16 * v16);
          v18 = v17[1];
          v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
            break;
          result = 0;
          v16 = (v16 + 1) & v15;
          if (((*(_QWORD *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_100009E14(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t), void (*a3)(_QWORD), uint64_t a4)
{
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
  char *v32;
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
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  NSString v60;
  id v61;
  uint64_t v62;
  id v63;
  NSString v64;
  id v65;
  _QWORD *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, char *, uint64_t);
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char *v82;
  _QWORD *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, _QWORD, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  id v97;
  NSString v98;
  id v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int (*v111)(uint64_t, uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  id v127;
  NSObject *v128;
  os_log_type_t v129;
  uint64_t v130;
  _QWORD *v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  char *v140;
  unint64_t v141;
  NSObject *v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  uint64_t v146;
  _BOOL4 v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  NSObject *v161;
  uint64_t v162;
  unsigned int (*v163)(uint64_t, uint64_t, uint64_t);
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  Swift::String v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  void (*v173)(void *);
  void *v174;
  uint64_t v175;
  void (*v176)(_QWORD);
  uint64_t v177;
  void *v178;
  Swift::String v179;
  unint64_t v180;
  void *v181;
  char *v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  char *v197;
  char *v198;
  char *v199;
  uint64_t v200;
  NSObject *v201;
  _QWORD *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  char *v207;
  char *v208;
  unsigned int (*v209)(uint64_t, uint64_t, uint64_t);
  uint64_t v210;
  void (*v211)(_QWORD);
  _QWORD *v212;
  uint64_t v213;
  unint64_t v214;
  uint64_t v215;
  unint64_t v216;

  v211 = a3;
  v209 = a2;
  v210 = a4;
  v5 = type metadata accessor for Logger(0);
  v204 = *(_QWORD *)(v5 - 8);
  v205 = v5;
  v6 = __chkstk_darwin(v5);
  v201 = ((char *)&v188 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  v207 = (char *)&v188 - v8;
  v9 = sub_100006298(&qword_100022600);
  __chkstk_darwin(v9);
  v208 = (char *)&v188 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v194 = type metadata accessor for HandleType(0);
  v193 = *(_QWORD *)(v194 - 8);
  __chkstk_darwin(v194);
  v192 = (char *)&v188 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006298(&qword_100022378);
  v13 = __chkstk_darwin(v12);
  v190 = (uint64_t)&v188 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v189 = (uint64_t)&v188 - v16;
  v17 = __chkstk_darwin(v15);
  v200 = (uint64_t)&v188 - v18;
  v19 = __chkstk_darwin(v17);
  v196 = (uint64_t)&v188 - v20;
  v21 = __chkstk_darwin(v19);
  v206 = (uint64_t)&v188 - v22;
  v23 = __chkstk_darwin(v21);
  v191 = (uint64_t)&v188 - v24;
  v25 = __chkstk_darwin(v23);
  v203 = (uint64_t)&v188 - v26;
  __chkstk_darwin(v25);
  v202 = (uint64_t *)((char *)&v188 - v27);
  v28 = type metadata accessor for QuickActionType(0);
  v29 = *(_QWORD *)(v28 - 8);
  v30 = __chkstk_darwin(v28);
  v32 = (char *)&v188 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v34 = (char *)&v188 - v33;
  v35 = sub_100006298(&qword_100022930);
  __chkstk_darwin(v35);
  v199 = (char *)&v188 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_100006298(&qword_100022068);
  __chkstk_darwin(v37);
  v39 = (char *)&v188 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for URL(0);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(_QWORD *)(v41 + 64);
  v43 = __chkstk_darwin(v40);
  v197 = (char *)&v188 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __chkstk_darwin(v43);
  v198 = (char *)&v188 - v45;
  v46 = a1;
  v47 = QuickAction.useStandardProtocol.getter(v44);
  if ((v47 & 1) != 0)
  {
    v195 = a1;
    QuickAction.standardProtocolURL.getter();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40) != 1)
    {
      v74 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
      v75 = v198;
      v74(v198, v39, v40);
      v76 = type metadata accessor for TaskPriority(0);
      v77 = (uint64_t)v199;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))(v199, 1, 1, v76);
      v78 = v197;
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v197, v75, v40);
      v79 = *(unsigned __int8 *)(v41 + 80);
      v80 = (v79 + 40) & ~v79;
      v81 = (v42 + v80 + 7) & 0xFFFFFFFFFFFFFFF8;
      v82 = (char *)swift_allocObject(&unk_10001D190, v81 + 16, v79 | 7);
      *((_QWORD *)v82 + 2) = 0;
      *((_QWORD *)v82 + 3) = 0;
      v83 = v212;
      *((_QWORD *)v82 + 4) = v212;
      v74(&v82[v80], v78, v40);
      v84 = &v82[v81];
      v85 = v210;
      *(_QWORD *)v84 = v211;
      *((_QWORD *)v84 + 1) = v85;
      swift_retain(v83);
      swift_retain(v85);
      v86 = sub_100013C6C(v77, (uint64_t)&unk_100022610, (uint64_t)v82);
      swift_release(v86);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v75, v40);
      return;
    }
    v47 = sub_100008928((uint64_t)v39, &qword_100022068);
    v46 = v195;
  }
  QuickAction.type.getter(v47);
  (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v32, enum case for QuickActionType.videoCall(_:), v28);
  v48 = sub_10000C1AC();
  dispatch thunk of RawRepresentable.rawValue.getter(&v215, v28, v48);
  dispatch thunk of RawRepresentable.rawValue.getter(&v213, v28, v48);
  v49 = v216;
  v50 = v214;
  v51 = v34;
  if (v215 == v213 && v216 == v214)
  {
    v52 = 1;
    v50 = v216;
  }
  else
  {
    v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v215, v216, v213, v214, 0);
  }
  v53 = (uint64_t)v209;
  swift_bridgeObjectRelease(v49);
  swift_bridgeObjectRelease(v50);
  v54 = *(void (**)(char *, uint64_t))(v29 + 8);
  v54(v32, v28);
  v55 = ((uint64_t (*)(char *, uint64_t))v54)(v51, v28);
  if ((v52 & 1) != 0)
    v56 = 2;
  else
    v56 = 1;
  QuickAction.handle.getter(v55);
  if (v57)
  {
    v58 = v57;
    v59 = objc_allocWithZone((Class)CNPhoneNumber);
    v60 = String._bridgeToObjectiveC()();
    v61 = objc_msgSend(v59, "initWithStringValue:", v60);

    if (v61)
      v62 = 2;
    else
      v62 = 1;
    v63 = objc_allocWithZone((Class)INPersonHandle);
    v64 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v58);
    v65 = objc_msgSend(v63, "initWithValue:type:", v64, v62);
    v66 = v212;
    v67 = v208;
    goto LABEL_33;
  }
  v68 = (uint64_t)v202;
  sub_10000889C(v53, (uint64_t)v202);
  v69 = type metadata accessor for Person(0);
  v70 = *(_QWORD *)(v69 - 8);
  v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
  if (v71(v68, 1, v69) == 1)
  {
    v72 = sub_100008928(v68, &qword_100022378);
    v66 = v212;
    v73 = v203;
    goto LABEL_24;
  }
  v87 = v193;
  v88 = *(void (**)(char *, _QWORD, uint64_t))(v193 + 104);
  v209 = v71;
  v89 = v70;
  v90 = v53;
  v91 = v56;
  v92 = v192;
  v93 = v194;
  v88(v192, enum case for HandleType.phoneNumber(_:), v194);
  v199 = (char *)Person.preferredHandle(ofType:)(v92);
  v95 = v94;
  v96 = v92;
  v56 = v91;
  v53 = v90;
  v70 = v89;
  v71 = v209;
  (*(void (**)(char *, uint64_t))(v87 + 8))(v96, v93);
  v72 = (*(uint64_t (**)(uint64_t, uint64_t))(v70 + 8))(v68, v69);
  v66 = v212;
  v73 = v203;
  if (!v95)
  {
LABEL_24:
    QuickAction.handle.getter(v72);
    v103 = v102;
    sub_10000889C(v53, v73);
    if (v103)
    {
      sub_100008928(v73, &qword_100022378);
      v104 = objc_allocWithZone((Class)INPersonHandle);
      v67 = v208;
    }
    else
    {
      v105 = v191;
      sub_10000889C(v73, v191);
      if (v71(v105, 1, v69) == 1)
      {
        sub_100008928(v73, &qword_100022378);
        sub_100008928(v105, &qword_100022378);
        v104 = objc_allocWithZone((Class)INPersonHandle);
        v64 = 0;
        v67 = v208;
        goto LABEL_32;
      }
      v209 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v56;
      v106 = v193;
      v107 = v192;
      v108 = v194;
      (*(void (**)(char *, _QWORD, uint64_t))(v193 + 104))(v192, enum case for HandleType.email(_:), v194);
      Person.preferredHandle(ofType:)(v107);
      v103 = v109;
      (*(void (**)(char *, uint64_t))(v106 + 8))(v107, v108);
      sub_100008928(v203, &qword_100022378);
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v191, v69);
      v104 = objc_allocWithZone((Class)INPersonHandle);
      v67 = v208;
      if (!v103)
      {
        v64 = 0;
        v56 = (uint64_t)v209;
        goto LABEL_32;
      }
      v56 = (uint64_t)v209;
    }
    v64 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v103);
LABEL_32:
    v65 = objc_msgSend(v104, "initWithValue:type:", v64, 1);
    goto LABEL_33;
  }
  v97 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain(v95);
  v98 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v95);
  v99 = objc_msgSend(v97, "initWithStringValue:", v98);

  if (v99)
    v100 = 2;
  else
    v100 = 1;
  v101 = objc_allocWithZone((Class)INPersonHandle);
  v64 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v95);
  v65 = objc_msgSend(v101, "initWithValue:type:", v64, v100);
  v67 = v208;
LABEL_33:

  v110 = type metadata accessor for PersonNameComponents(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v110 - 8) + 56))(v67, 1, 1, v110);
  v111 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v65;
  v112 = QuickAction.contactIdentifier.getter();
  v114 = v113;
  v115 = QuickAction.customIdentifier.getter();
  v117 = v116;
  v118 = objc_allocWithZone((Class)INPerson);
  v119 = (char *)sub_100014968(v111, (uint64_t)v67, 0, 0, 0, v112, v114, v115, v117);
  v120 = ((uint64_t (*)(void))QuickAction.bundleID.getter)();
  v122 = v121;
  v123 = sub_100009AF0(v119, v56, v120, v121);
  v124 = swift_bridgeObjectRelease(v122);
  if (v123)
  {
    v208 = v119;
    v209 = v111;
    v125 = v207;
    static PeopleLogger.common.getter(v124);
    v126 = v206;
    sub_10000889C(v53, v206);
    v127 = v123;
    v128 = Logger.logObject.getter(v127);
    v129 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v128, v129))
    {
      v201 = v128;
      v195 = v46;
      v130 = swift_slowAlloc(22, -1);
      v131 = (_QWORD *)swift_slowAlloc(8, -1);
      v203 = swift_slowAlloc(32, -1);
      v215 = v203;
      *(_DWORD *)v130 = 138412546;
      v213 = (uint64_t)v127;
      v132 = v127;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v213, &v214, v130 + 4, v130 + 12);
      v202 = v131;
      *v131 = v123;

      *(_WORD *)(v130 + 12) = 2080;
      v133 = v196;
      sub_10000889C(v126, v196);
      v134 = type metadata accessor for Person(0);
      v135 = *(_QWORD *)(v134 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v135 + 48))(v133, 1, v134) == 1)
      {
        sub_100008928(v133, &qword_100022378);
        v136 = 0xE100000000000000;
        v137 = 45;
      }
      else
      {
        v137 = Person.description.getter();
        v136 = v158;
        (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v133, v134);
      }
      v160 = (uint64_t)v202;
      v159 = v203;
      v161 = v201;
      v213 = sub_100014E0C(v137, v136, &v215);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v213, &v214, v130 + 14, v130 + 22);
      swift_bridgeObjectRelease(v136);
      sub_100008928(v206, &qword_100022378);
      _os_log_impl((void *)&_mh_execute_header, v161, v129, "handling call intent: %@ for person: %s", (uint8_t *)v130, 0x16u);
      v162 = sub_100006298(&qword_1000222A8);
      swift_arrayDestroy(v160, 1, v162);
      swift_slowDealloc(v160, -1, -1);
      swift_arrayDestroy(v159, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v159, -1, -1);
      swift_slowDealloc(v130, -1, -1);

      v155 = (*(uint64_t (**)(char *, uint64_t))(v204 + 8))(v207, v205);
      v156 = v210;
      v157 = (uint64_t)v211;
    }
    else
    {

      sub_100008928(v126, &qword_100022378);
      v155 = (*(uint64_t (**)(char *, uint64_t))(v204 + 8))(v125, v205);
      v156 = v210;
      v157 = (uint64_t)v211;
    }
    v163 = v209;
    v164 = QuickAction.bundleID.getter(v155);
    v166 = v165;
    sub_1000070CC(v127, v164, v165, v157, v156);

    swift_bridgeObjectRelease(v166);
  }
  else
  {
    v138 = QuickAction.handle.getter(v124);
    if (v139)
    {
      v140 = (char *)v138;
      v141 = v139;
      v142 = v201;
      static PeopleLogger.common.getter(v138);
      v143 = v200;
      sub_10000889C(v53, v200);
      v144 = swift_bridgeObjectRetain_n(v141, 2);
      v145 = Logger.logObject.getter(v144);
      LODWORD(v146) = static os_log_type_t.default.getter();
      v147 = os_log_type_enabled(v145, (os_log_type_t)v146);
      v208 = v140;
      if (v147)
      {
        v209 = v111;
        v148 = swift_slowAlloc(22, -1);
        v149 = swift_slowAlloc(64, -1);
        v215 = v149;
        *(_DWORD *)v148 = 136315394;
        swift_bridgeObjectRetain(v141);
        v213 = sub_100014E0C((uint64_t)v140, v141, &v215);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v213, &v214, v148 + 4, v148 + 12);
        swift_bridgeObjectRelease_n(v141, 3);
        *(_WORD *)(v148 + 12) = 2080;
        v150 = v189;
        sub_10000889C(v143, v189);
        v151 = type metadata accessor for Person(0);
        v152 = *(_QWORD *)(v151 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v152 + 48))(v150, 1, v151) == 1)
        {
          sub_100008928(v150, &qword_100022378);
          v153 = 0xE100000000000000;
          v154 = 45;
        }
        else
        {
          LODWORD(v207) = v146;
          v146 = v149;
          v182 = v119;
          v183 = v150;
          v154 = Person.description.getter();
          v153 = v184;
          v185 = v183;
          v119 = v182;
          v149 = v146;
          LOBYTE(v146) = (_BYTE)v207;
          (*(void (**)(uint64_t, uint64_t))(v152 + 8))(v185, v151);
        }
        v177 = v210;
        v213 = sub_100014E0C(v154, v153, &v215);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v213, &v214, v148 + 14, v148 + 22);
        swift_bridgeObjectRelease(v153);
        sub_100008928(v200, &qword_100022378);
        _os_log_impl((void *)&_mh_execute_header, v145, (os_log_type_t)v146, "handling telephony voice call for handle: %s, person: %s", (uint8_t *)v148, 0x16u);
        swift_arrayDestroy(v149, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v149, -1, -1);
        swift_slowDealloc(v148, -1, -1);

        (*(void (**)(NSObject *, uint64_t))(v204 + 8))(v201, v205);
        v176 = v211;
        v66 = v212;
        v111 = v209;
      }
      else
      {
        swift_bridgeObjectRelease_n(v141, 2);
        sub_100008928(v143, &qword_100022378);

        (*(void (**)(NSObject *, uint64_t))(v204 + 8))(v142, v205);
        v177 = v210;
        v176 = v211;
      }
      v186 = v66[5];
      v187 = v66[6];
      sub_1000062D8(v66 + 2, v186);
      (*(void (**)(char *, unint64_t, void (*)(_QWORD), uint64_t, uint64_t, uint64_t))(v187 + 8))(v208, v141, v176, v177, v186, v187);

      swift_bridgeObjectRelease(v141);
    }
    else
    {
      v167 = v119;
      v215 = 0;
      v216 = 0xE000000000000000;
      _StringGuts.grow(_:)(56);
      v168._object = (void *)0x8000000100019A70;
      v168._countAndFlagsBits = 0xD000000000000036;
      String.append(_:)(v168);
      v169 = v190;
      sub_10000889C(v53, v190);
      v170 = type metadata accessor for Person(0);
      v171 = *(_QWORD *)(v170 - 8);
      v172 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v171 + 48))(v169, 1, v170);
      v173 = (void (*)(void *))v211;
      if (v172 == 1)
      {
        sub_100008928(v169, &qword_100022378);
        v174 = (void *)0xE100000000000000;
        v175 = 45;
      }
      else
      {
        v175 = Person.description.getter();
        v174 = v178;
        (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v169, v170);
      }
      v179._countAndFlagsBits = v175;
      v179._object = v174;
      String.append(_:)(v179);
      swift_bridgeObjectRelease(v174);
      v180 = v216;
      v181 = (void *)static PeopleErrors.createError(_:code:)(v215, v216, 500);
      swift_bridgeObjectRelease(v180);
      v173(v181);

    }
  }
}

uint64_t sub_10000AECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[29] = a6;
  v7[30] = a7;
  v7[27] = a4;
  v7[28] = a5;
  return swift_task_switch(sub_10000AEE8, 0, 0);
}

uint64_t sub_10000AEE8()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  NSURL *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v14;

  v1 = v0;
  v2 = v0 + 2;
  v3 = v1[27];
  v4 = sub_100006298(&qword_100022618);
  inited = swift_initStackObject(v4, v1 + 10);
  *(_OWORD *)(inited + 16) = xmmword_100017250;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
  *(_QWORD *)(inited + 40) = v6;
  *(_QWORD *)(inited + 72) = &type metadata for Bool;
  *(_BYTE *)(inited + 48) = 1;
  v7 = sub_10001372C(inited);
  v8 = *(void **)(v3 + 104);
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  v1[31] = v10;
  v12 = sub_100013874(v7);
  swift_bridgeObjectRelease(v7);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1[32] = isa;
  swift_bridgeObjectRelease(v12);
  v1[7] = v1 + 25;
  v1[2] = v1;
  v1[3] = sub_10000B04C;
  v14 = swift_continuation_init(v2, 0);
  v1[20] = _NSConcreteStackBlock;
  v1 += 20;
  v1[1] = 0x40000000;
  v1[2] = sub_100013C38;
  v1[3] = &unk_10001D1A8;
  v1[4] = v14;
  objc_msgSend(v8, "openSensitiveURLInBackground:withOptions:completionHandler:", v11, isa, v1);
  return swift_continuation_await(v2);
}

uint64_t sub_10000B04C()
{
  return swift_task_switch(sub_10000B098, 0, 0);
}

uint64_t sub_10000B098()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void (*v3)(_QWORD);

  v2 = *(void **)(v0 + 248);
  v1 = *(void **)(v0 + 256);
  v3 = *(void (**)(_QWORD))(v0 + 232);
  swift_errorRelease(*(_QWORD *)(v0 + 208));

  v3(0);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B0E8()
{
  uint64_t v0;

  sub_1000062FC((_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 56));
  sub_1000062FC((_QWORD *)(v0 + 64));

  return swift_deallocClassInstance(v0, 112, 7);
}

uint64_t type metadata accessor for CallActionHandler()
{
  return objc_opt_self(_TtC17PeopleViewService17CallActionHandler);
}

void sub_10000B148(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t), void (*a3)(_QWORD), uint64_t a4)
{
  sub_100009E14(a1, a2, a3, a4);
}

uint64_t sub_10000B168(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_10000B5F0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_10000B314(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100006298(&qword_100022630);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_10000B5F0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_10000B314(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_10000B788();
      goto LABEL_22;
    }
    sub_10000B938(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

void *sub_10000B788()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100006298(&qword_100022630);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10000B938(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100006298(&qword_100022630);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000BBE4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10000BC00(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10000BC00(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = sub_100006298(&qword_100022638);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

id sub_10000BD68()
{
  id v0;
  void *v1;
  id result;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;

  v0 = objc_msgSend((id)objc_opt_self(TUCallCenter), "sharedInstance");
  v1 = (void *)objc_opt_self(LSApplicationWorkspace);
  result = objc_msgSend(v1, "defaultWorkspace");
  if (result)
  {
    v3 = result;
    v4 = sub_10000C374(0, (unint64_t *)&qword_100022370, LSApplicationWorkspace_ptr);
    v15 = v4;
    v16 = &off_10001D080;
    *(_QWORD *)&v14 = v3;
    v5 = type metadata accessor for IntentLauncher();
    v6 = swift_allocObject(v5, 56, 7);
    sub_1000089AC(&v14, v6 + 16);
    result = objc_msgSend(v1, "defaultWorkspace");
    if (result)
    {
      v7 = result;
      v8 = objc_msgSend(objc_allocWithZone((Class)CNLaunchServices), "init");
      v15 = sub_10000C374(0, &qword_1000225F8, TUCallCenter_ptr);
      v16 = &off_10001D158;
      *(_QWORD *)&v14 = v0;
      v12 = v4;
      v13 = &protocol witness table for LSApplicationWorkspace;
      *(_QWORD *)&v11 = v7;
      v9 = type metadata accessor for CallActionHandler();
      v10 = swift_allocObject(v9, 112, 7);
      sub_1000089AC(&v14, v10 + 16);
      *(_QWORD *)(v10 + 56) = v6;
      sub_1000089AC(&v11, v10 + 64);
      *(_QWORD *)(v10 + 104) = v8;
      return (id)v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000BEE8(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, _QWORD, uint64_t);
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = type metadata accessor for QuickAction(0);
  v34 = *(_QWORD *)(v2 - 8);
  v35 = v2;
  __chkstk_darwin(v2);
  v36 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for QuickActionType(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v33 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v32 = (char *)&v31 - v9;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v31 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v31 - v14;
  v16 = a1;
  QuickAction.type.getter(v13);
  v17 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v17(v12, enum case for QuickActionType.videoCall(_:), v4);
  v18 = sub_10000C1AC();
  dispatch thunk of RawRepresentable.rawValue.getter(&v39, v4, v18);
  dispatch thunk of RawRepresentable.rawValue.getter(&v37, v4, v18);
  v19 = v40;
  v20 = v38;
  if (v39 == v37 && v40 == v38)
  {
    v21 = 1;
    v20 = v40;
  }
  else
  {
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v39, v40, v37, v38, 0);
  }
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v20);
  v22 = *(void (**)(char *, uint64_t))(v5 + 8);
  v22(v12, v4);
  v22(v15, v4);
  v24 = v34;
  v23 = v35;
  v25 = v36;
  v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v36, v16, v35);
  if ((v21 & 1) != 0)
  {
    v27 = 1;
  }
  else
  {
    QuickAction.type.getter(v26);
    v17(v33, enum case for QuickActionType.voiceCall(_:), v4);
    dispatch thunk of RawRepresentable.rawValue.getter(&v39, v4, v18);
    dispatch thunk of RawRepresentable.rawValue.getter(&v37, v4, v18);
    v28 = v40;
    v29 = v38;
    if (v39 == v37 && v40 == v38)
    {
      v27 = 1;
      v29 = v40;
    }
    else
    {
      v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v39, v40, v37, v38, 0);
    }
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease(v29);
    v22(v33, v4);
    v22(v32, v4);
    v25 = v36;
  }
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v23);
  return v27 & 1;
}

unint64_t sub_10000C1AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022060;
  if (!qword_100022060)
  {
    v1 = type metadata accessor for QuickActionType(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for QuickActionType, v1);
    atomic_store(result, (unint64_t *)&qword_100022060);
  }
  return result;
}

uint64_t sub_10000C1F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10000C290()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v2 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(v0 + 32);
  v6 = v0 + v3;
  v7 = swift_task_alloc(dword_10002260C);
  v8 = *(_OWORD *)(v0 + v4);
  *(_QWORD *)(v1 + 16) = v7;
  *(_QWORD *)v7 = v1;
  *(_QWORD *)(v7 + 8) = sub_10000C32C;
  *(_OWORD *)(v7 + 232) = v8;
  *(_QWORD *)(v7 + 216) = v5;
  *(_QWORD *)(v7 + 224) = v6;
  return swift_task_switch(sub_10000AEE8, 0, 0);
}

uint64_t sub_10000C32C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000C374(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000C3AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_10000B168(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000C444(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C454(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000C45C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, _QWORD, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
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
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  void (*v65)(uint64_t);
  uint64_t v66;

  v65 = a3;
  v66 = a4;
  v60 = type metadata accessor for QuickAction(0);
  v58 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v59 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URLComponents(0);
  v62 = *(_QWORD *)(v7 - 8);
  v63 = v7;
  __chkstk_darwin(v7);
  v61 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for HandleType(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006298(&qword_100022378);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v53 - v18;
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v53 - v21;
  v23 = a1;
  v24 = a2;
  v25 = QuickAction.handle.getter(v20);
  v27 = v26;
  sub_10000889C(v24, (uint64_t)v22);
  if (v27)
  {
    v28 = sub_10000C998((uint64_t)v22);
    v29 = v65;
LABEL_3:
    v30 = v61;
    URLComponents.init()(v28);
    URLComponents.scheme.setter(0x6F746C69616DLL, 0xE600000000000000);
    URLComponents.path.setter(v25, v27);
    v31 = v64[5];
    v32 = v64[6];
    sub_1000062D8(v64 + 2, v31);
    (*(void (**)(char *, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v32 + 16))(v30, v29, v66, v31, v32);
    return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v30, v63);
  }
  v34 = v12;
  v54 = v9;
  v56 = v16;
  v57 = v23;
  sub_10000889C((uint64_t)v22, (uint64_t)v19);
  v35 = type metadata accessor for Person(0);
  v36 = *(_QWORD *)(v35 - 8);
  v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48))(v19, 1, v35);
  v55 = v24;
  if (v37 == 1)
  {
    sub_10000C998((uint64_t)v22);
    sub_10000C998((uint64_t)v19);
    v29 = v65;
    v38 = v60;
  }
  else
  {
    v39 = v10;
    v40 = *(void (**)(char *, _QWORD, uint64_t))(v10 + 104);
    v41 = v34;
    v42 = v54;
    v40(v34, enum case for HandleType.email(_:), v54);
    v25 = Person.preferredHandle(ofType:)(v34);
    v27 = v43;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v42);
    sub_10000C998((uint64_t)v22);
    v28 = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v19, v35);
    v29 = v65;
    v38 = v60;
    if (v27)
      goto LABEL_3;
  }
  v44 = v58;
  v45 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v59, v57, v38);
  v46 = (uint64_t)v56;
  sub_10000889C(v55, (uint64_t)v56);
  v47 = type metadata accessor for NoAvailableContactHandle(0);
  v48 = sub_1000063B4((unint64_t *)&unk_1000226F0, type metadata accessor for NoAvailableContactHandle, (uint64_t)"U_");
  v49 = swift_allocError(v47, v48, 0, 0);
  v50 = v38;
  v52 = v51;
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v51, v45, v50);
  sub_10000C9D8(v46, v52 + *(int *)(v47 + 20));
  v29(v49);
  return swift_errorRelease(v49);
}

uint64_t type metadata accessor for MailActionHandler()
{
  return objc_opt_self(_TtC17PeopleViewService17MailActionHandler);
}

uint64_t sub_10000C810(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  return sub_10000C45C(a1, a2, a3, a4);
}

uint64_t sub_10000C830()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void (*v12)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v0 = type metadata accessor for QuickActionType(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v2);
  v7 = (char *)&v14 - v6;
  QuickAction.type.getter(v5);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, enum case for QuickActionType.mail(_:), v0);
  v8 = sub_1000063B4((unint64_t *)&qword_100022060, (uint64_t (*)(uint64_t))&type metadata accessor for QuickActionType, (uint64_t)&protocol conformance descriptor for QuickActionType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v16, v0, v8);
  dispatch thunk of RawRepresentable.rawValue.getter(&v14, v0, v8);
  v9 = v17;
  v10 = v15;
  if (v16 == v14 && v17 == v15)
  {
    v11 = 1;
    v10 = v17;
  }
  else
  {
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v14, v15, 0);
  }
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);
  v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v4, v0);
  v12(v7, v0);
  return v11 & 1;
}

uint64_t sub_10000C998(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006298(&qword_100022378);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006298(&qword_100022378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000CC20(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v40 - v8;
  v10 = *(void **)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController);
  v11 = objc_msgSend(v10, "childViewControllers");
  v12 = sub_10000C374(0, &qword_100022818, UIViewController_ptr);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0)
      v28 = v13;
    else
      v28 = v13 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v13);
    v14 = _CocoaArrayWrapper.endIndex.getter(v28);
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v15 = swift_bridgeObjectRelease(v13);
  if (v14 != 1)
    goto LABEL_22;
  v16 = objc_msgSend(v10, "childViewControllers");
  v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v12);

  if (!((unint64_t)v17 >> 62))
  {
    if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
LABEL_21:
    v15 = swift_bridgeObjectRelease(v17);
    goto LABEL_22;
  }
  if (v17 < 0)
    v29 = v17;
  else
    v29 = v17 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v17);
  v30 = _CocoaArrayWrapper.endIndex.getter(v29);
  swift_bridgeObjectRelease(v17);
  if (!v30)
    goto LABEL_21;
LABEL_6:
  if ((v17 & 0xC000000000000001) != 0)
  {
    v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v17);
  }
  else
  {
    if (!*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_32;
    }
    v18 = *(id *)(v17 + 32);
  }
  v19 = v18;
  swift_bridgeObjectRelease(v17);
  v20 = a1;
  v21 = v19;
  v22 = static NSObject.== infix(_:_:)();

  if ((v22 & 1) == 0)
  {
LABEL_22:
    v31 = static PeopleLogger.viewService.getter(v15);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v41 = v3;
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      v35 = swift_slowAlloc(32, -1);
      v43 = v35;
      *(_DWORD *)v34 = 136315138;
      v42 = sub_100014E0C(0xD000000000000019, 0x8000000100019C60, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v34 + 4, v34 + 12);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s setting new controller into root view", v34, 0xCu);
      swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v41);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    v36 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v37 = objc_msgSend(v36, "userInterfaceIdiom");

    if (v37 != (id)1)
      goto LABEL_28;
    v38 = objc_msgSend(a1, "view");
    if (v38)
    {
      v39 = v38;
      objc_msgSend(v38, "_setOverrideVibrancyTrait:", 1);

LABEL_28:
      sub_10000FD7C();
      sub_10000F7E4(a1);
      return;
    }
LABEL_32:
    __break(1u);
    return;
  }
  v23 = static PeopleLogger.viewService.getter(v15);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(12, -1);
    v27 = swift_slowAlloc(32, -1);
    v43 = v27;
    *(_DWORD *)v26 = 136315138;
    v42 = sub_100014E0C(0xD000000000000019, 0x8000000100019C60, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v26 + 4, v26 + 12);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "%s spotlight controller already in place", v26, 0xCu);
    swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

void sub_10000D108(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
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
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  _QWORD v67[2];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  _BYTE v75[7];
  uint64_t v76;
  uint64_t v77;
  char v78;
  _BYTE v79[7];
  uint64_t v80;
  uint64_t v81;
  char v82;
  _BYTE v83[7];
  uint64_t v84;
  uint64_t v85;
  char v86;
  _BYTE v87[7];
  uint64_t v88;
  char v89;
  _BYTE v90[7];
  uint64_t v91;
  char v92;
  _BYTE v93[7];
  _BYTE v94[7];
  _BYTE v95[7];
  char v96;
  _BYTE v97[7];
  char v98;
  char v99;

  v3 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PeopleAnalytics.WidgetLocation(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PeopleAnalytics(0);
  v14 = static PeopleAnalytics.shared.getter();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for PeopleAnalytics.WidgetLocation.homeScreen(_:), v10);
  dispatch thunk of PeopleAnalytics.sendEntityCardLaunched(validContactIdentifier:displayPriorities:location:)(0, &_swiftEmptyArrayStorage, v13);
  swift_release(v14);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  static PeopleLogger.viewService.getter(v15);
  v16 = swift_bridgeObjectRetain_n(a2, 2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.debug.getter();
  v19 = os_log_type_enabled(v17, v18);
  v70 = a1;
  if (v19)
  {
    v20 = swift_slowAlloc(22, -1);
    v21 = swift_slowAlloc(64, -1);
    v69 = v7;
    v22 = v21;
    v72 = v21;
    *(_DWORD *)v20 = 136315394;
    v71 = sub_100014E0C(0xD000000000000020, 0x8000000100019C30, &v72);
    v68 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v20 + 4, v20 + 12);
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain(a2);
    v71 = sub_100014E0C(a1, a2, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v20 + 14, v20 + 22);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s showing '%s' in view", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy(v22, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    v23 = (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v9, v68);
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    v23 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v67[1] = v3;
  v24 = *(char **)(v3 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
  if (v24)
  {
    v25 = &v24[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier];
    v26 = *(_QWORD *)&v24[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8];
    *(_QWORD *)v25 = 0;
    *((_QWORD *)v25 + 1) = 0;
    v27 = v24;
    swift_bridgeObjectRelease(v26);
    v28 = *(_QWORD *)&v27[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities];
    *(_QWORD *)&v27[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities] = &_swiftEmptyArrayStorage;

    v23 = swift_bridgeObjectRelease(v28);
  }
  v68 = static HorizontalAlignment.center.getter(v23);
  v69 = static VerticalAlignment.center.getter();
  v72 = v70;
  v73 = a2;
  v29 = sub_10000DA3C();
  swift_bridgeObjectRetain(a2);
  v30 = Text.init<A>(_:)(&v72, &type metadata for String, v29);
  v32 = v31;
  v34 = v33;
  v36 = v35 & 1;
  v37 = static Font.headline.getter();
  v38 = Text.font(_:)(v37, v30, v32, v36, v34);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  swift_release(v37);
  v45 = v42 & 1;
  sub_10000DA80(v30, v32, v36);
  swift_bridgeObjectRelease(v34);
  v46 = (void *)objc_opt_self(UIColor);
  v47 = Color.init(uiColor:)(objc_msgSend(v46, "labelColor"));
  v48 = Text.foregroundColor(_:)(v47, v38, v40, v45, v44);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  swift_release(v47);
  sub_10000DA80(v38, v40, v45);
  v55 = swift_bridgeObjectRelease(v44);
  v56 = static Color.clear.getter(v55);
  v57 = static Edge.Set.all.getter();
  LOBYTE(v45) = v57;
  v58 = static Color.clear.getter(v57);
  v59 = static Edge.Set.all.getter();
  LOBYTE(v38) = v59;
  v60 = static Color.clear.getter(v59);
  v61 = static Edge.Set.all.getter();
  v99 = 1;
  v98 = 1;
  v96 = v52 & 1;
  v72 = v68;
  v73 = 0;
  v74 = 1;
  *(_DWORD *)v75 = v71;
  *(_DWORD *)&v75[3] = *(_DWORD *)((char *)&v71 + 3);
  v76 = v69;
  v77 = 0;
  v78 = 1;
  *(_DWORD *)v79 = *(_DWORD *)v97;
  *(_DWORD *)&v79[3] = *(_DWORD *)&v97[3];
  v80 = v48;
  v81 = v50;
  v82 = v52 & 1;
  *(_DWORD *)&v83[3] = *(_DWORD *)&v95[3];
  *(_DWORD *)v83 = *(_DWORD *)v95;
  v84 = v54;
  v85 = v56;
  v86 = v45;
  *(_DWORD *)v87 = *(_DWORD *)v94;
  *(_DWORD *)&v87[3] = *(_DWORD *)&v94[3];
  v88 = v58;
  v89 = v38;
  *(_DWORD *)&v90[3] = *(_DWORD *)&v93[3];
  *(_DWORD *)v90 = *(_DWORD *)v93;
  v91 = v60;
  v92 = v61;
  v62 = objc_allocWithZone((Class)sub_100006298(&qword_100022810));
  v63 = (void *)UIHostingController.init(rootView:)(&v72);
  v64 = objc_msgSend(v63, "view");
  if (v64)
  {
    v65 = v64;
    v66 = objc_msgSend(v46, "clearColor");
    objc_msgSend(v65, "setBackgroundColor:", v66);

    sub_10000CC20(v63);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000D6DC(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = type metadata accessor for MetricTemplateView(0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((static MetricTemplate.metricsEnabled.getter(v4) & 1) != 0 && a1 == 3)
  {
    MetricTemplateView.init(dragRefresh:)(0);
    v7 = objc_allocWithZone((Class)sub_100006298(&qword_100022800));
    v8 = (void *)UIHostingController.init(rootView:)(v6);
    sub_10000F7E4(v8);

  }
  else
  {
    v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
    if (v9)
    {
      if (*(_QWORD *)(v9 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8))
        __asm { BR              X11 }
    }
  }
}

void sub_10000D80C(void *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  *(_QWORD *)(v1 - 40) = a1;
  v2 = String.localized.getter(0xD000000000000012, 0x8000000100019C10);
  v4 = v3;
  sub_10000D108(v2, v3);
  swift_bridgeObjectRelease(v4);
  JUMPOUT(0x10000D86CLL);
}

id sub_10000D9A4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC17PeopleViewService13SceneDelegate);
}

unint64_t sub_10000DA3C()
{
  unint64_t result;

  result = qword_100022808;
  if (!qword_100022808)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100022808);
  }
  return result;
}

uint64_t sub_10000DA80(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_10000DA90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022828;
  if (!qword_100022828)
  {
    v1 = sub_10000C374(255, &qword_100022820, UIOpenURLContext_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100022828);
  }
  return result;
}

void sub_10000DAE8(uint64_t a1)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  int64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  id v73;
  NSObject *v74;
  os_log_type_t v75;
  _BOOL4 v76;
  char *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  void (*v86)(char *, uint64_t);
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char v106;
  char *v107;
  uint64_t v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  char *v112;
  id v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  id v140;
  char *v141;
  uint64_t v142;
  int64_t v143;
  uint64_t v144;
  char *v145;
  unint64_t v146;
  __int128 v147;
  unsigned int v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  char *v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170[5];

  v166 = a1;
  v2 = sub_100006298(&qword_100022830);
  __chkstk_darwin(v2);
  v4 = (char *)&v131 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for QuickAction(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v134 = (char *)&v131 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v152 = type metadata accessor for PeopleURL.Scheme(0);
  v151 = *(_QWORD *)(v152 - 8);
  __chkstk_darwin(v152);
  v150 = (char *)&v131 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006298(&qword_100022838);
  __chkstk_darwin(v9);
  v156 = (char *)&v131 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v158 = type metadata accessor for URLComponents(0);
  v11 = *(_QWORD *)(v158 - 8);
  __chkstk_darwin(v158);
  v149 = (char *)&v131 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = type metadata accessor for Logger(0);
  v157 = *(_QWORD *)(v162 - 8);
  v13 = __chkstk_darwin(v162);
  v15 = (char *)&v131 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v154 = (char *)&v131 - v17;
  __chkstk_darwin(v16);
  v19 = (char *)&v131 - v18;
  v161 = type metadata accessor for URL(0);
  v20 = __chkstk_darwin(v161);
  v138 = (char *)&v131 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v20);
  v159 = (char *)&v131 - v23;
  v24 = __chkstk_darwin(v22);
  v167 = (char *)&v131 - v26;
  v139 = v1;
  v133 = OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView;
  v140 = *(id *)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
  if (v140)
  {
    v155 = v19;
    v160 = v25;
    if ((v166 & 0xC000000000000001) != 0)
    {
      v27 = v166;
      if (v166 < 0)
        v28 = v166;
      else
        v28 = v166 & 0xFFFFFFFFFFFFFF8;
      v29 = v140;
      swift_bridgeObjectRetain(v27);
      v30 = __CocoaSet.makeIterator()(v28);
      v31 = sub_10000C374(0, &qword_100022820, UIOpenURLContext_ptr);
      v32 = sub_10000DA90();
      v33 = Set.Iterator.init(_cocoa:)(v170, v30, v31, v32);
      v166 = v170[0];
      v35 = v170[2];
      v144 = v170[1];
      v36 = v170[3];
      v37 = v170[4];
    }
    else
    {
      v43 = v166;
      v44 = -1 << *(_BYTE *)(v166 + 32);
      v45 = *(_QWORD *)(v166 + 56);
      v144 = v166 + 56;
      v35 = ~v44;
      v46 = -v44;
      if (v46 < 64)
        v47 = ~(-1 << v46);
      else
        v47 = -1;
      v37 = v47 & v45;
      v48 = v140;
      v33 = (_QWORD *)swift_bridgeObjectRetain(v43);
      v36 = 0;
    }
    v49 = v161;
    v135 = v6;
    v136 = v5;
    v137 = v4;
    v142 = v166 & 0x7FFFFFFFFFFFFFFFLL;
    v132 = v35;
    v143 = (unint64_t)(v35 + 64) >> 6;
    v148 = enum case for PeopleURL.Scheme.people(_:);
    *(_QWORD *)&v34 = 136315650;
    v147 = v34;
    v146 = 0x8000000100019C80;
    v145 = (char *)&type metadata for Any + 8;
    v131 = 0x8000000100019C10;
    v141 = (char *)&type metadata for Swift.AnyObject + 8;
    v153 = v11;
    v50 = v159;
    while (1)
    {
      v51 = v37;
      if (v166 < 0)
      {
        v56 = __CocoaSet.Iterator.next()(v33);
        if (!v56)
          goto LABEL_55;
        v57 = v56;
        v52 = v49;
        v168 = v56;
        v58 = sub_10000C374(0, &qword_100022820, UIOpenURLContext_ptr);
        swift_unknownObjectRetain(v57, v59);
        v60 = v58;
        v50 = v159;
        swift_dynamicCast(&v169, &v168, v141, v60, 7);
        v61 = v169;
        swift_unknownObjectRelease(v57);
        v55 = v36;
        v53 = v51;
        if (!v61)
          goto LABEL_55;
      }
      else
      {
        if (v37)
        {
          v52 = v49;
          v53 = (v51 - 1) & v51;
          v54 = __clz(__rbit64(v51)) | (v36 << 6);
          v55 = v36;
        }
        else
        {
          v62 = v36 + 1;
          if (__OFADD__(v36, 1))
          {
            __break(1u);
            return;
          }
          if (v62 >= v143)
            goto LABEL_55;
          v52 = v49;
          v63 = *(_QWORD *)(v144 + 8 * v62);
          v55 = v36 + 1;
          if (!v63)
          {
            v55 = v36 + 2;
            if (v36 + 2 >= v143)
              goto LABEL_55;
            v63 = *(_QWORD *)(v144 + 8 * v55);
            if (!v63)
            {
              v55 = v36 + 3;
              if (v36 + 3 >= v143)
                goto LABEL_55;
              v63 = *(_QWORD *)(v144 + 8 * v55);
              if (!v63)
              {
                v55 = v36 + 4;
                if (v36 + 4 >= v143)
                  goto LABEL_55;
                v63 = *(_QWORD *)(v144 + 8 * v55);
                if (!v63)
                {
                  v64 = v36 + 5;
                  while (v143 != v64)
                  {
                    v63 = *(_QWORD *)(v144 + 8 * v64++);
                    if (v63)
                    {
                      v55 = v64 - 1;
                      goto LABEL_36;
                    }
                  }
LABEL_55:
                  sub_10000E7FC(v166);

                  return;
                }
              }
            }
          }
LABEL_36:
          v53 = (v63 - 1) & v63;
          v54 = __clz(__rbit64(v63)) + (v55 << 6);
        }
        v61 = *(id *)(*(_QWORD *)(v166 + 48) + 8 * v54);
        if (!v61)
          goto LABEL_55;
      }
      v65 = v11;
      v164 = v53;
      v165 = v55;
      v66 = objc_msgSend(v61, "URL", v131, v132);
      v67 = v167;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v68 = v155;
      static PeopleLogger.viewService.getter(v69);
      v70 = v160;
      v71 = v67;
      v72 = v52;
      (*(void (**)(char *, char *, uint64_t))(v160 + 16))(v50, v71, v52);
      v73 = v61;
      v74 = Logger.logObject.getter(v73);
      v75 = static os_log_type_t.default.getter();
      v76 = os_log_type_enabled(v74, v75);
      v163 = v73;
      if (v76)
      {
        v77 = v50;
        v78 = swift_slowAlloc(32, -1);
        v79 = (_QWORD *)swift_slowAlloc(8, -1);
        v80 = swift_slowAlloc(64, -1);
        v169 = (void *)v80;
        *(_DWORD *)v78 = v147;
        *(_QWORD *)(v78 + 4) = sub_100014E0C(0xD000000000000019, v146, (uint64_t *)&v169);
        *(_WORD *)(v78 + 12) = 2112;
        *(_QWORD *)(v78 + 14) = v73;
        *v79 = v61;
        *(_WORD *)(v78 + 22) = 2080;
        v81 = sub_10000E804();
        v82 = v161;
        v83 = dispatch thunk of CustomStringConvertible.description.getter(v161, v81);
        v85 = v84;
        *(_QWORD *)(v78 + 24) = sub_100014E0C(v83, v84, (uint64_t *)&v169);
        swift_bridgeObjectRelease(v85);
        v86 = *(void (**)(char *, uint64_t))(v160 + 8);
        v86(v77, v82);
        _os_log_impl((void *)&_mh_execute_header, v74, v75, "%s url centext: %@ url: %s", (uint8_t *)v78, 0x20u);
        v87 = sub_100006298(&qword_1000222A8);
        swift_arrayDestroy(v79, 1, v87);
        v88 = v79;
        v89 = v158;
        swift_slowDealloc(v88, -1, -1);
        swift_arrayDestroy(v80, 2, v145);
        v90 = v80;
        v91 = v162;
        v11 = v153;
        v92 = v157;
        swift_slowDealloc(v90, -1, -1);
        swift_slowDealloc(v78, -1, -1);

        v93 = *(void (**)(char *, uint64_t))(v92 + 8);
        v93(v68, v91);
        v94 = (uint64_t)v156;
      }
      else
      {

        v86 = *(void (**)(char *, uint64_t))(v70 + 8);
        v86(v50, v72);

        v93 = *(void (**)(char *, uint64_t))(v157 + 8);
        v93(v68, v162);
        v94 = (uint64_t)v156;
        v11 = v65;
        v89 = v158;
      }
      URLComponents.init(url:resolvingAgainstBaseURL:)(v167, 0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v94, 1, v89) == 1)
        break;
      v96 = (uint64_t)v149;
      v97 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 32))(v149, v94, v89);
      v98 = URLComponents.scheme.getter(v97);
      v100 = v99;
      v101 = v11;
      v102 = v89;
      v103 = v151;
      v104 = v150;
      v105 = v152;
      (*(void (**)(char *, _QWORD, uint64_t))(v151 + 104))(v150, v148, v152);
      LOBYTE(v98) = static PeopleURL.Scheme.== infix(_:_:)(v98, v100, v104);
      swift_bridgeObjectRelease(v100);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v104, v105);
      if ((v98 & 1) == 0)
      {
        v95 = (*(uint64_t (**)(uint64_t, uint64_t))(v101 + 8))(v96, v102);
        v11 = v101;
        goto LABEL_47;
      }
      if ((sub_100013318() & 1) != 0)
      {
        v106 = sub_10001077C(v96);
        sub_10000D6DC(v106);

        v11 = v153;
        (*(void (**)(uint64_t, uint64_t))(v153 + 8))(v96, v158);
        v49 = v161;
        v50 = v159;
        v37 = v164;
        v36 = v165;
      }
      else
      {
        v112 = (char *)v163;
        v113 = objc_msgSend(v163, "URL");
        v114 = v138;
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        v115 = (uint64_t)v137;
        QuickAction.init(from:)(v114);
        v116 = v135;
        v117 = v136;
        v118 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v135 + 48))(v115, 1, v136);
        v119 = v153;
        v49 = v161;
        v37 = v164;
        if (v118 == 1)
        {
          sub_100008928(v115, &qword_100022830);
          v120 = sub_10001077C(v96);
          v121 = v139;
          sub_10000D6DC(v120);
          static MetricTemplate.metricsEnabled.getter(v122);
          v123 = *(char **)(v121 + v133);
          v36 = v165;
          if (v123 && *(_QWORD *)&v123[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8])
          {
            v124 = v123;
            v125 = String.localized.getter(0xD000000000000012, v131);
            v127 = v126;
            sub_10000D108(v125, v126);

            swift_bridgeObjectRelease(v127);
            v112 = v124;
          }
          v128 = v158;
          v50 = v159;

          v11 = v119;
          (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v96, v128);
        }
        else
        {
          v129 = (uint64_t)v134;
          (*(void (**)(char *, uint64_t, uint64_t))(v116 + 32))(v134, v115, v117);
          v130 = sub_1000086F8();
          sub_100007968(v129);

          swift_release(v130);
          (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v129, v117);
          (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v96, v158);
          v50 = v159;
          v36 = v165;
          v11 = v119;
        }
      }
LABEL_16:
      v33 = (_QWORD *)((uint64_t (*)(char *, uint64_t))v86)(v167, v49);
    }
    v95 = sub_100008928(v94, &qword_100022838);
LABEL_47:
    v107 = v154;
    v37 = v164;
    v108 = static PeopleLogger.viewService.getter(v95);
    v109 = Logger.logObject.getter(v108);
    v110 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v109, v110))
    {
      v111 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v111 = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, v110, "Url does not represent people/can't be parsed", v111, 2u);
      swift_slowDealloc(v111, -1, -1);
    }

    v93(v107, v162);
    v49 = v161;
    v50 = v159;
    v36 = v165;
    goto LABEL_16;
  }
  v38 = static PeopleLogger.viewService.getter(v24);
  v39 = Logger.logObject.getter(v38);
  v40 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc(12, -1);
    v42 = swift_slowAlloc(32, -1);
    v170[0] = v42;
    *(_DWORD *)v41 = 136315138;
    v169 = (void *)sub_100014E0C(0xD000000000000019, 0x8000000100019C80, v170);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v41 + 4, v41 + 12);
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "%s impossible error, no peopleView", v41, 0xCu);
    swift_arrayDestroy(v42, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1, -1);
    swift_slowDealloc(v41, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v157 + 8))(v15, v162);
}

uint64_t sub_10000E7FC(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10000E804()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022840;
  if (!qword_100022840)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100022840);
  }
  return result;
}

void sub_10000E84C(void (*a1)(char *, uint64_t), void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void (*v29)(char *, uint64_t);
  id v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  char *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;

  v3 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v69 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v67 - v11;
  v13 = static PeopleLogger.viewService.getter(v10);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  v16 = os_log_type_enabled(v14, v15);
  v70 = a2;
  if (v16)
  {
    v17 = swift_slowAlloc(12, -1);
    v68 = a1;
    v18 = (uint8_t *)v17;
    v19 = v3;
    v20 = v6;
    v21 = swift_slowAlloc(32, -1);
    v72 = v21;
    *(_DWORD *)v18 = 136315138;
    v71 = sub_100014E0C(0xD00000000000001FLL, 0x8000000100019D20, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v18 + 4, v18 + 12);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s", v18, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    v22 = v21;
    v6 = v20;
    v3 = v19;
    swift_slowDealloc(v22, -1, -1);
    v23 = v18;
    a1 = v68;
    swift_slowDealloc(v23, -1, -1);
  }

  v24 = *(void (**)(char *, uint64_t))(v7 + 8);
  v24(v12, v6);
  v25 = objc_opt_self(UIWindowScene);
  v26 = swift_dynamicCastObjCClass(a1, v25);
  if (v26)
  {
    v27 = v26;
    v68 = v24;
    v28 = (void *)objc_opt_self(UIApplication);
    v29 = a1;
    v30 = objc_msgSend(v28, "sharedApplication");
    objc_msgSend(v30, "_setBackgroundStyle:", 1);

    v31 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v31, "bounds");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    v40 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithFrame:", v33, v35, v37, v39);
    v41 = *(void **)(v3 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window) = v40;
    v42 = v40;

    objc_msgSend(v42, "setOpaque:", 0);
    v43 = (void *)objc_opt_self(UIColor);
    v44 = v42;
    v45 = objc_msgSend(v43, "clearColor");
    objc_msgSend(v44, "setBackgroundColor:", v45);

    objc_msgSend(v44, "setWindowScene:", v27);
    objc_msgSend(v44, "setRootViewController:", *(_QWORD *)(v3 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController));
    objc_msgSend(v44, "makeKeyAndVisible");
    v46 = objc_allocWithZone((Class)type metadata accessor for PeopleViewHandler());
    v47 = v44;
    v48 = sub_100010050(v47);
    v49 = *(void **)(v3 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView) = v48;

    v50 = v70;
    v51 = objc_msgSend(v70, "URLContexts");
    v52 = sub_10000C374(0, &qword_100022820, UIOpenURLContext_ptr);
    v53 = sub_10000DA90();
    v54 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v51, v52, v53);

    v67 = v6;
    if ((v54 & 0xC000000000000001) != 0)
    {
      if (v54 < 0)
        v55 = v54;
      else
        v55 = v54 & 0xFFFFFFFFFFFFFF8;
      v56 = __CocoaSet.count.getter(v55);
    }
    else
    {
      v56 = *(_QWORD *)(v54 + 16);
    }
    v57 = swift_bridgeObjectRelease(v54);
    if (v56)
    {
      v58 = objc_msgSend(v50, "URLContexts");
      v59 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v58, v52, v53);

      sub_10000DAE8(v59);
      swift_bridgeObjectRelease(v59);
    }
    else
    {
      v60 = v69;
      v61 = static PeopleLogger.viewService.getter(v57);
      v62 = Logger.logObject.getter(v61);
      v63 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v62, v63))
      {
        v64 = (uint8_t *)swift_slowAlloc(12, -1);
        v65 = swift_slowAlloc(32, -1);
        v72 = v65;
        *(_DWORD *)v64 = 136315138;
        v71 = sub_100014E0C(0xD00000000000001FLL, 0x8000000100019D20, &v72);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v64 + 4, v64 + 12);
        _os_log_impl((void *)&_mh_execute_header, v62, v63, "%s missing URL data", v64, 0xCu);
        swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v65, -1, -1);
        swift_slowDealloc(v64, -1, -1);

        v66 = v69;
      }
      else
      {

        v66 = v60;
      }
      v68(v66, v67);
      sub_10000D6DC(1);

    }
  }
}

id sub_10000EFAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = static PeopleLogger.viewService.getter(v4);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v16 = v11;
    *(_DWORD *)v10 = 136315138;
    v15 = sub_100014E0C(0xD00000000000001BLL, 0x8000000100019CE0, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v10 + 4, v10 + 12);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v12 = *(void **)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
  if (v12)
  {
    v13 = v12;
    sub_100010158(0, 0xE000000000000000, &_swiftEmptyArrayStorage);

  }
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController), "dismissViewControllerAnimated:completion:", 0, 0);
  return sub_10000FD7C();
}

void sub_10000F318(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.viewService.getter(v4);
  v7 = a1;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(22, -1);
    v21 = v3;
    v11 = v10;
    v20 = swift_slowAlloc(64, -1);
    v23 = v20;
    *(_DWORD *)v11 = 136315394;
    v22 = sub_100014E0C(0xD000000000000012, 0x8000000100019CA0, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v11 + 4, v11 + 12);
    *(_WORD *)(v11 + 12) = 2080;
    v18 = v11 + 14;
    v12 = objc_msgSend(v7, "activityType");
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    v19 = v2;
    v14 = v13;
    v16 = v15;

    v22 = sub_100014E0C(v14, v16, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v18, v11 + 22);

    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s activity: %s ", (uint8_t *)v11, 0x16u);
    v17 = v20;
    swift_arrayDestroy(v20, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v19);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  sub_10000D6DC(1);
}

id sub_10000F564()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(UIBlurEffect), "effectWithStyle:", 8);
    v5 = objc_msgSend(objc_allocWithZone((Class)UIVisualEffectView), "initWithEffect:", v4);

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

void sub_10000F6B4()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v1 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  if (v2 == (id)1)
    v3 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  else
    v3 = sub_10000F564();
  v4 = v3;
  objc_msgSend(v0, "setView:", v3);

  v5 = objc_msgSend(v0, "view");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "layer");

    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000F7E4(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  Class isa;
  uint64_t v49;
  uint8_t *v50;
  uint8_t *v51;
  id v52;
  uint64_t v53;
  id v54;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, "view");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v2, "addChildViewController:", a1);
    v10 = objc_msgSend(v2, "view");
    if (v10)
    {
      v11 = v10;
      v12 = objc_opt_self(UIVisualEffectView);
      v13 = (void *)swift_dynamicCastObjCClass(v11, v12);
      if (v13)
      {
        v14 = v13;
        v15 = objc_msgSend(v13, "contentView");
        objc_msgSend(v15, "insertSubview:atIndex:", v9, 0);

        v52 = objc_msgSend(v14, "contentView");
LABEL_12:
        objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v30 = (void *)objc_opt_self(NSLayoutConstraint);
        v31 = sub_100006298(&qword_100022980);
        v32 = swift_allocObject(v31, 64, 7);
        *(_OWORD *)(v32 + 16) = xmmword_100017370;
        v33 = objc_msgSend(v9, "topAnchor");
        v34 = objc_msgSend(v52, "topAnchor");
        v35 = objc_msgSend(v33, "constraintEqualToAnchor:", v34);

        *(_QWORD *)(v32 + 32) = v35;
        v36 = objc_msgSend(v9, "bottomAnchor");
        v37 = objc_msgSend(v52, "bottomAnchor");
        v38 = objc_msgSend(v36, "constraintEqualToAnchor:", v37);

        *(_QWORD *)(v32 + 40) = v38;
        v39 = objc_msgSend(v9, "leadingAnchor");
        v40 = objc_msgSend(v52, "safeAreaLayoutGuide");
        v41 = objc_msgSend(v40, "leadingAnchor");

        v42 = objc_msgSend(v39, "constraintEqualToAnchor:", v41);
        *(_QWORD *)(v32 + 48) = v42;
        v43 = objc_msgSend(v9, "trailingAnchor");
        v44 = objc_msgSend(v52, "safeAreaLayoutGuide");
        v45 = objc_msgSend(v44, "trailingAnchor");

        v46 = objc_msgSend(v43, "constraintEqualToAnchor:", v45);
        *(_QWORD *)(v32 + 56) = v46;
        v54 = (id)v32;
        specialized Array._endMutation()();
        v47 = v54;
        sub_10000C374(0, &qword_100022878, NSLayoutConstraint_ptr);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v47);
        objc_msgSend(v30, "activateConstraints:", isa);

        objc_msgSend(a1, "didMoveToParentViewController:", v2);
        return;
      }

    }
    v28 = objc_msgSend(v2, "view");
    if (v28)
    {
      v29 = v28;
      objc_msgSend(v28, "insertSubview:atIndex:", v9, 0);

      v52 = objc_msgSend(v2, "view");
      if (v52)
        goto LABEL_12;
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    static PeopleLogger.viewService.getter(0);
    v16 = a1;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v52 = (id)swift_slowAlloc(32, -1);
      v54 = v52;
      v51 = v19;
      *(_DWORD *)v19 = 136315138;
      v50 = v19 + 4;
      v20 = v16;
      v21 = objc_msgSend(v20, "description");
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      v53 = sub_100014E0C(v22, v24, (uint64_t *)&v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v50, v19 + 12);

      swift_bridgeObjectRelease(v24);
      v25 = v18;
      v26 = v51;
      _os_log_impl((void *)&_mh_execute_header, v17, v25, "Tried to embed nil view for: %s", v51, 0xCu);
      v27 = v52;
      swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

id sub_10000FD7C()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  id result;
  void *v10;
  uint64_t v11;

  v1 = objc_msgSend(v0, "childViewControllers");
  v2 = sub_10000C374(0, &qword_100022818, UIViewController_ptr);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (!((unint64_t)v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v3);
    if (v4)
      goto LABEL_3;
    return (id)swift_bridgeObjectRelease_n(v3, 2);
  }
LABEL_12:
  if (v3 < 0)
    v11 = v3;
  else
    v11 = v3 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v3);
  v4 = _CocoaArrayWrapper.endIndex.getter(v11);
  if (!v4)
    return (id)swift_bridgeObjectRelease_n(v3, 2);
LABEL_3:
  for (i = 4; ; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0)
      v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, v3);
    else
      v6 = *(id *)(v3 + 8 * i);
    v7 = v6;
    v8 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_12;
    }
    objc_msgSend(v6, "willMoveToParentViewController:", 0);
    result = objc_msgSend(v7, "view");
    if (!result)
      break;
    v10 = result;
    objc_msgSend(result, "removeFromSuperview");

    objc_msgSend(v7, "removeFromParentViewController");
    if (v8 == v4)
      return (id)swift_bridgeObjectRelease_n(v3, 2);
  }
  __break(1u);
  return result;
}

id sub_10000FFF0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootContainerViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RootContainerViewController()
{
  return objc_opt_self(_TtC17PeopleViewService27RootContainerViewController);
}

char *sub_100010050(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  char *v8;
  void *v9;
  char *v10;
  id v11;
  objc_super v13;

  v3 = &v1[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities] = &_swiftEmptyArrayStorage;
  v4 = OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactFetcher;
  type metadata accessor for ContactFetcher(0);
  v5 = v1;
  *(_QWORD *)&v1[v4] = ContactFetcher.__allocating_init()();
  v6 = OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController;
  *(_QWORD *)&v5[v6] = objc_msgSend(objc_allocWithZone((Class)SPUIContactViewController), "init");
  *(_QWORD *)&v5[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_hostWindow] = a1;
  v7 = a1;

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for PeopleViewHandler();
  v8 = (char *)objc_msgSendSuper2(&v13, "init");
  v9 = *(void **)&v8[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController];
  v10 = v8;
  v11 = v9;
  objc_msgSend(v11, "setDelegate:", v10);

  return v10;
}

void sub_100010158(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  NSString v34;
  Class isa;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v7 = type metadata accessor for Logger(0);
  v39 = *(_QWORD *)(v7 - 8);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v36 - v11;
  v13 = *(void **)(v3 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController);
  v14 = objc_msgSend(v13, "contactIdentifier");
  if (!v14)
  {
LABEL_7:
    v22 = static PeopleLogger.viewService.getter(v14);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v37 = v7;
      v25 = swift_slowAlloc(12, -1);
      v38 = a3;
      v26 = (uint8_t *)v25;
      v27 = swift_slowAlloc(32, -1);
      v41 = v27;
      *(_DWORD *)v26 = 136315138;
      v40 = sub_100014E0C(0xD000000000000029, 0x8000000100019FC0, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v26 + 4, v26 + 12);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s -- updating spotlight contact", v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v37);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v7);
    }
    v34 = String._bridgeToObjectiveC()();
    isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v13, "updateWithContactIdentifier:preferredBundleIdentifiers:", v34, isa);

    return;
  }
  v15 = v14;
  v38 = v13;
  v16 = a3;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v19 = v18;

  if (v17 == a1 && v19 == a2)
  {
    v14 = (id)swift_bridgeObjectRelease(a2);
  }
  else
  {
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v19, a1, a2, 0);
    v14 = (id)swift_bridgeObjectRelease(v19);
    a3 = v16;
    v13 = v38;
    if ((v21 & 1) == 0)
      goto LABEL_7;
  }
  v28 = v7;
  v29 = static PeopleLogger.viewService.getter(v14);
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc(12, -1);
    v33 = swift_slowAlloc(32, -1);
    v41 = v33;
    *(_DWORD *)v32 = 136315138;
    v40 = sub_100014E0C(0xD000000000000029, 0x8000000100019FC0, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v32 + 4, v32 + 12);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s -- not updating spotlight", v32, 0xCu);
    swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1, -1);
    swift_slowDealloc(v32, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v28);
}

uint64_t sub_100010524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8);
  if (!v6)
    return 1;
  v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier);
  swift_bridgeObjectRetain(v6);
  v8 = (void *)dispatch thunk of ContactFetcher.contact(for:includeImages:)(v7, v6, 0);
  v9 = swift_bridgeObjectRelease(v6);
  if (v8)
  {
    v10 = objc_msgSend(v8, "identifier");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

    v14 = *(void **)(v1 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities);
    swift_bridgeObjectRetain(v14);
    sub_100010158(v11, v13, v14);

    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v14);
    return 0;
  }
  else
  {
    v16 = static PeopleLogger.viewService.getter(v9);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, (os_log_type_t)v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = swift_slowAlloc(32, -1);
      v22 = v20;
      *(_DWORD *)v19 = 136315138;
      v21 = sub_100014E0C(0xD000000000000019, 0x8000000100019FA0, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v19 + 4, v19 + 12);
      _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v18, "%s contact not set/confirmed", v19, 0xCu);
      swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 2;
  }
}

uint64_t sub_10001077C(uint64_t a1)
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
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, _QWORD, uint64_t);
  uint64_t (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int (*v60)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  char *v64;
  uint64_t v65;
  char v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  char *v74;
  void (*v75)(char *, _QWORD, uint64_t);
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t (*v80)(char *, uint64_t);
  uint64_t v81;
  uint64_t v82;
  char *v83;
  void *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  char *v90;
  char v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  os_log_type_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t (*v105)(char *, uint64_t);
  unsigned int v106;
  uint64_t v107;
  void (*v108)(char *, _QWORD, uint64_t);
  uint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132[2];

  v2 = type metadata accessor for Logger(0);
  v125 = *(_QWORD *)(v2 - 8);
  v126 = v2;
  v3 = __chkstk_darwin(v2);
  v127 = (char *)&v105 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v114 = (char *)&v105 - v5;
  v6 = type metadata accessor for PeopleURL.ArrayParameter(0);
  v112 = *(_QWORD *)(v6 - 8);
  v113 = v6;
  __chkstk_darwin(v6);
  v110 = (char *)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = type metadata accessor for PeopleURL.Parameter(0);
  v116 = *(_QWORD *)(v119 - 8);
  v8 = __chkstk_darwin(v119);
  v111 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v115 = (char *)&v105 - v10;
  v128 = type metadata accessor for PeopleURL.PathAction(0);
  v130 = *(_QWORD *)(v128 - 8);
  __chkstk_darwin(v128);
  v118 = (char *)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = sub_100006298(&qword_1000229B8);
  v12 = __chkstk_darwin(v129);
  v121 = (uint64_t)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v123 = (uint64_t)&v105 - v14;
  v15 = sub_100006298(&qword_1000229C0);
  v16 = __chkstk_darwin(v15);
  v117 = (uint64_t)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v124 = (uint64_t)&v105 - v19;
  v20 = __chkstk_darwin(v18);
  v120 = (char *)&v105 - v21;
  v22 = __chkstk_darwin(v20);
  v122 = (char *)&v105 - v23;
  v24 = __chkstk_darwin(v22);
  v26 = (char *)&v105 - v25;
  __chkstk_darwin(v24);
  v28 = (char *)&v105 - v27;
  v29 = type metadata accessor for PeopleURL.Scheme(0);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = __chkstk_darwin(v29);
  v33 = (char *)&v105 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = URLComponents.scheme.getter(v31);
  v36 = v35;
  v37 = enum case for PeopleURL.Scheme.people(_:);
  v38 = *(void (**)(char *, _QWORD, uint64_t))(v30 + 104);
  v38(v33, enum case for PeopleURL.Scheme.people(_:), v29);
  LOBYTE(v34) = static PeopleURL.Scheme.== infix(_:_:)(v34, v36, v33);
  swift_bridgeObjectRelease(v36);
  v39 = *(uint64_t (**)(char *, uint64_t))(v30 + 8);
  v40 = v29;
  v41 = v39(v33, v29);
  if ((v34 & 1) != 0)
  {
    v107 = v29;
    v42 = (uint64_t)v122;
    v106 = v37;
    v108 = v38;
    v109 = a1;
    URLComponents.peopleAction.getter(v41);
    v43 = v130;
    v44 = v128;
    (*(void (**)(char *, _QWORD, uint64_t))(v130 + 104))(v26, enum case for PeopleURL.PathAction.showGatheredMetrics(_:), v128);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v26, 0, 1, v44);
    v45 = v123;
    v46 = v123 + *(int *)(v129 + 48);
    sub_1000132D0((uint64_t)v28, v123);
    sub_1000132D0((uint64_t)v26, v46);
    v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
    if (v47(v45, 1, v44) == 1)
    {
      sub_100008928((uint64_t)v26, &qword_1000229C0);
      sub_100008928((uint64_t)v28, &qword_1000229C0);
      if (v47(v46, 1, v44) == 1)
      {
        sub_100008928(v45, &qword_1000229C0);
        return 3;
      }
      goto LABEL_7;
    }
    sub_1000132D0(v45, v42);
    if (v47(v46, 1, v44) == 1)
    {
      sub_100008928((uint64_t)v26, &qword_1000229C0);
      sub_100008928((uint64_t)v28, &qword_1000229C0);
      (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v42, v44);
LABEL_7:
      v41 = sub_100008928(v45, &qword_1000229B8);
      v38 = v108;
      v37 = v106;
      v40 = v107;
      goto LABEL_8;
    }
    v62 = v130;
    v63 = *(void (**)(char *, uint64_t, uint64_t))(v130 + 32);
    v105 = v39;
    v64 = v118;
    v63(v118, v46, v44);
    v65 = sub_1000063B4(&qword_1000229C8, (uint64_t (*)(uint64_t))&type metadata accessor for PeopleURL.PathAction, (uint64_t)&protocol conformance descriptor for PeopleURL.PathAction);
    v66 = dispatch thunk of static Equatable.== infix(_:_:)(v42, v64, v44, v65);
    v67 = *(void (**)(char *, uint64_t))(v62 + 8);
    v67(v64, v44);
    sub_100008928((uint64_t)v26, &qword_1000229C0);
    sub_100008928((uint64_t)v28, &qword_1000229C0);
    v67((char *)v42, v44);
    v39 = v105;
    v41 = sub_100008928(v45, &qword_1000229C0);
    v38 = v108;
    v37 = v106;
    v40 = v107;
    if ((v66 & 1) != 0)
      return 3;
  }
LABEL_8:
  v49 = URLComponents.scheme.getter(v41);
  v51 = v50;
  v38(v33, v37, v40);
  LOBYTE(v49) = static PeopleURL.Scheme.== infix(_:_:)(v49, v51, v33);
  swift_bridgeObjectRelease(v51);
  v52 = v39(v33, v40);
  v53 = v127;
  if ((v49 & 1) == 0)
    goto LABEL_23;
  v54 = (uint64_t)v120;
  URLComponents.peopleAction.getter(v52);
  v55 = v130;
  v56 = v124;
  v57 = v128;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v130 + 104))(v124, enum case for PeopleURL.PathAction.showSearchResult(_:), v128);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v55 + 56))(v56, 0, 1, v57);
  v58 = v121;
  v59 = v121 + *(int *)(v129 + 48);
  sub_1000132D0(v54, v121);
  sub_1000132D0(v56, v59);
  v60 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48);
  if (v60(v58, 1, v57) == 1)
  {
    sub_100008928(v56, &qword_1000229C0);
    sub_100008928(v54, &qword_1000229C0);
    if (v60(v59, 1, v57) == 1)
    {
      sub_100008928(v58, &qword_1000229C0);
      goto LABEL_18;
    }
LABEL_14:
    v52 = sub_100008928(v58, &qword_1000229B8);
    goto LABEL_23;
  }
  v61 = v117;
  sub_1000132D0(v58, v117);
  if (v60(v59, 1, v57) == 1)
  {
    sub_100008928(v56, &qword_1000229C0);
    sub_100008928(v54, &qword_1000229C0);
    (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v61, v57);
    goto LABEL_14;
  }
  v68 = v130;
  v69 = v118;
  (*(void (**)(char *, uint64_t, uint64_t))(v130 + 32))(v118, v59, v57);
  v70 = sub_1000063B4(&qword_1000229C8, (uint64_t (*)(uint64_t))&type metadata accessor for PeopleURL.PathAction, (uint64_t)&protocol conformance descriptor for PeopleURL.PathAction);
  v71 = dispatch thunk of static Equatable.== infix(_:_:)(v61, v69, v57, v70);
  v72 = *(void (**)(char *, uint64_t))(v68 + 8);
  v72(v69, v57);
  sub_100008928(v124, &qword_1000229C0);
  sub_100008928(v54, &qword_1000229C0);
  v72((char *)v61, v57);
  v52 = sub_100008928(v58, &qword_1000229C0);
  if ((v71 & 1) == 0)
    goto LABEL_23;
LABEL_18:
  v74 = v115;
  v73 = v116;
  v75 = *(void (**)(char *, _QWORD, uint64_t))(v116 + 104);
  v76 = v119;
  v75(v115, enum case for PeopleURL.Parameter.contactIdentifier(_:), v119);
  v77 = URLComponents.subscript.getter(v74);
  v79 = v78;
  v80 = *(uint64_t (**)(char *, uint64_t))(v73 + 8);
  v52 = v80(v74, v76);
  if (!v79)
  {
LABEL_23:
    v92 = static PeopleLogger.viewService.getter(v52);
    v93 = Logger.logObject.getter(v92);
    v94 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (uint8_t *)swift_slowAlloc(12, -1);
      v96 = swift_slowAlloc(32, -1);
      v132[0] = v96;
      *(_DWORD *)v95 = 136315138;
      v131 = sub_100014E0C(0xD000000000000010, 0x8000000100019F80, v132);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, v132, v95 + 4, v95 + 12);
      _os_log_impl((void *)&_mh_execute_header, v93, v94, "%s contact not set", v95, 0xCu);
      v48 = 1;
      swift_arrayDestroy(v96, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v96, -1, -1);
      swift_slowDealloc(v95, -1, -1);

      (*(void (**)(char *, uint64_t))(v125 + 8))(v53, v126);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v125 + 8))(v53, v126);
      return 1;
    }
    return v48;
  }
  v130 = v77;
  v82 = v112;
  v81 = v113;
  v83 = v110;
  (*(void (**)(char *, _QWORD, uint64_t))(v112 + 104))(v110, enum case for PeopleURL.ArrayParameter.priorities(_:), v113);
  v84 = (void *)URLComponents.subscript.getter(v83);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v81);
  v85 = v111;
  v86 = v119;
  v75(v111, enum case for PeopleURL.Parameter.lockScreen(_:), v119);
  v87 = URLComponents.subscript.getter(v85);
  v89 = v88;
  v80(v85, v86);
  if (!v89)
  {
    v87 = 0x65736C6166;
    v89 = 0xE500000000000000;
    goto LABEL_27;
  }
  if (v87 != 1702195828)
  {
LABEL_27:
    v90 = v114;
    goto LABEL_28;
  }
  v90 = v114;
  if (v89 != 0xE400000000000000)
  {
LABEL_28:
    v91 = _stringCompareWithSmolCheck(_:_:expecting:)(v87, v89, 1702195828, 0xE400000000000000, 0);
    goto LABEL_29;
  }
  v91 = 1;
LABEL_29:
  v97 = swift_bridgeObjectRelease(v89);
  static PeopleLogger.viewService.getter(v97);
  v98 = swift_bridgeObjectRetain_n(v79, 2);
  v99 = Logger.logObject.getter(v98);
  v100 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v99, v100))
  {
    v101 = swift_slowAlloc(28, -1);
    v102 = swift_slowAlloc(64, -1);
    v132[0] = v102;
    *(_DWORD *)v101 = 136315650;
    v131 = sub_100014E0C(0xD000000000000010, 0x8000000100019F80, v132);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, v132, v101 + 4, v101 + 12);
    *(_WORD *)(v101 + 12) = 2080;
    swift_bridgeObjectRetain(v79);
    v103 = v130;
    v131 = sub_100014E0C(v130, v79, v132);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, v132, v101 + 14, v101 + 22);
    swift_bridgeObjectRelease_n(v79, 3);
    *(_WORD *)(v101 + 22) = 1024;
    LODWORD(v131) = v91 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, (char *)&v131 + 4, v101 + 24, v101 + 28);
    _os_log_impl((void *)&_mh_execute_header, v99, v100, "%s, contactIdentifier: %s, lockScreen: %{BOOL}d", (uint8_t *)v101, 0x1Cu);
    swift_arrayDestroy(v102, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v102, -1, -1);
    swift_slowDealloc(v101, -1, -1);

    (*(void (**)(char *, uint64_t))(v125 + 8))(v114, v126);
  }
  else
  {

    swift_bridgeObjectRelease_n(v79, 2);
    (*(void (**)(char *, uint64_t))(v125 + 8))(v90, v126);
    v103 = v130;
  }
  v48 = sub_1000113F0(v103, v79, v84, v91 & 1);
  swift_bridgeObjectRelease(v79);
  swift_bridgeObjectRelease(v84);
  return v48;
}

uint64_t sub_1000113F0(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int *v43;
  _BYTE v44[12];
  int v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;

  v5 = v4;
  v10 = type metadata accessor for PeopleAnalytics.WidgetLocation(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = &v44[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for Logger(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = &v44[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!a2)
    return 1;
  v50 = v16;
  v51 = a4;
  swift_bridgeObjectRetain(a2);
  v19 = dispatch thunk of ContactFetcher.contact(for:includeImages:)(a1, a2, 0);
  if (v19)
  {
    v48 = v11;
    v49 = v10;
    v20 = (uint64_t *)(v5 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier);
    v21 = *(_QWORD *)(v5 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8);
    *v20 = a1;
    v20[1] = a2;
    v22 = (void *)v19;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRelease(v21);
    v23 = *(_QWORD *)(v5 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities);
    *(_QWORD *)(v5 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities) = a3;
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRelease(v23);
    v47 = v22;
    v24 = objc_msgSend(v22, "identifier");
    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v27 = v26;

    sub_100010158(v25, v27, a3);
    v28 = swift_bridgeObjectRelease(v27);
    static PeopleLogger.viewService.getter(v28);
    swift_bridgeObjectRetain_n(a3, 2);
    v29 = swift_bridgeObjectRetain(a2);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.default.getter();
    v32 = v31;
    if (os_log_type_enabled(v30, v31))
    {
      v33 = swift_slowAlloc(32, -1);
      v46 = swift_slowAlloc(96, -1);
      v53 = v46;
      *(_DWORD *)v33 = 136315650;
      v45 = v32;
      v52 = sub_100014E0C(0xD000000000000035, 0x8000000100019F40, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 4, v33 + 12);
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain(a2);
      v52 = sub_100014E0C(a1, a2, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 14, v33 + 22);
      swift_bridgeObjectRelease_n(a2, 3);
      *(_WORD *)(v33 + 22) = 2080;
      v34 = swift_bridgeObjectRetain(a3);
      v35 = Array.description.getter(v34, &type metadata for String);
      v37 = v36;
      swift_bridgeObjectRelease(a3);
      v52 = sub_100014E0C(v35, v37, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 24, v33 + 32);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease(v37);
      _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v45, "%s, contactIdentifier: %s, displayPriorities: %s", (uint8_t *)v33, 0x20u);
      v38 = v46;
      swift_arrayDestroy(v46, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v33, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease_n(a2, 2);
    }
    (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v18, v50);
    v41 = v48;
    v40 = v49;
    type metadata accessor for PeopleAnalytics(0);
    v42 = static PeopleAnalytics.shared.getter();
    v43 = (unsigned int *)&enum case for PeopleAnalytics.WidgetLocation.lockScreen(_:);
    if ((v51 & 1) == 0)
      v43 = (unsigned int *)&enum case for PeopleAnalytics.WidgetLocation.homeScreen(_:);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v41 + 104))(v13, *v43, v40);
    dispatch thunk of PeopleAnalytics.sendEntityCardLaunched(validContactIdentifier:displayPriorities:location:)(1, a3, v13);

    swift_release(v42);
    (*(void (**)(_BYTE *, uint64_t))(v41 + 8))(v13, v40);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease(a2);
    return 2;
  }
}

uint64_t sub_100011810(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t aBlock[5];
  uint64_t v42;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v38 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  __chkstk_darwin(v8);
  v37 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static PeopleLogger.viewService.getter(v12);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(22, -1);
    v36 = v7;
    v19 = v18;
    v20 = swift_slowAlloc(32, -1);
    v35 = v2;
    v21 = v20;
    aBlock[0] = v20;
    *(_DWORD *)v19 = 136315394;
    v34 = v11;
    v40 = (void *)sub_100014E0C(0xD000000000000018, 0x8000000100019ED0, aBlock);
    v33 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, aBlock, v19 + 4, v19 + 12);
    *(_WORD *)(v19 + 12) = 2048;
    v40 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, aBlock, v19 + 14, v19 + 22);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s, reason: %lu", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    v22 = v21;
    v2 = v35;
    swift_slowDealloc(v22, -1, -1);
    v23 = v19;
    v7 = v36;
    swift_slowDealloc(v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v33);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  sub_10000C374(0, &qword_100022998, OS_dispatch_queue_ptr);
  v24 = (void *)static OS_dispatch_queue.main.getter();
  v25 = swift_allocObject(&unk_10001D298, 24, 7);
  *(_QWORD *)(v25 + 16) = v2;
  aBlock[4] = (uint64_t)sub_100013220;
  v42 = v25;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100011D10;
  aBlock[3] = (uint64_t)&unk_10001D2B0;
  v26 = _Block_copy(aBlock);
  v27 = v2;
  v28 = v37;
  static DispatchQoS.unspecified.getter(v27);
  v40 = &_swiftEmptyArrayStorage;
  v29 = sub_1000063B4(&qword_1000229A0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v30 = sub_100006298(&qword_1000229A8);
  v31 = sub_100013240();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v40, v30, v31, v4, v29);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v28, v7, v26);
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v28, v39);
  return swift_release(v42);
}

uint64_t sub_100011BAC(uint64_t a1)
{
  uint64_t result;
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;

  result = (uint64_t)objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_hostWindow), "_scene");
  if (result)
  {
    v2 = (void *)result;
    v4[4] = sub_100011C8C;
    v5 = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 1107296256;
    v4[2] = sub_100011CD4;
    v4[3] = &unk_10001D2D8;
    v3 = _Block_copy(v4);
    swift_release(v5);
    objc_msgSend(v2, "updateClientSettingsWithTransitionBlock:", v3);

    _Block_release(v3);
    result = swift_isEscapingClosureAtFileLocation(0, "", 86, 140, 57, 1);
    if ((result & 1) == 0)
      return result;
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_100011C8C()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone((Class)PPLPeopleEntitySceneTransitionContext), "init");
  objc_msgSend(v0, "setShouldDismiss:", 1);
  return v0;
}

id sub_100011CD4(uint64_t a1, void *a2)
{
  uint64_t (*v2)(void);
  id v3;
  void *v4;

  v2 = *(uint64_t (**)(void))(a1 + 32);
  v3 = a2;
  v4 = (void *)v2();

  return v4;
}

uint64_t sub_100011D10(uint64_t a1)
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

void sub_100011D7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006298(&qword_100022930);
  __chkstk_darwin(v5);
  v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8);
  if (!v8)
    return;
  v61 = v4;
  v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier);
  v10 = type metadata accessor for TaskPriority(0);
  v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  v62 = v10;
  v12 = v11;
  ((void (*)(char *, uint64_t, uint64_t))v11)(v7, 1, 1);
  type metadata accessor for MainActor(0);
  v13 = swift_bridgeObjectRetain_n(v8, 2);
  v14 = static MainActor.shared.getter(v13);
  v15 = (_QWORD *)swift_allocObject(&unk_10001D220, 48, 7);
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v9;
  v15[5] = v8;
  v16 = sub_100013C6C((uint64_t)v7, (uint64_t)&unk_100022940, (uint64_t)v15);
  swift_release(v16);
  v60 = v9;
  v17 = (void *)dispatch thunk of ContactFetcher.contact(for:includeImages:)(v9, v8, 0);
  if (!v17)
  {
    swift_bridgeObjectRelease(v8);
    return;
  }
  v18 = v17;
  v58 = v2;
  v19 = objc_msgSend(v17, "emailAddresses");
  v20 = sub_100006298(&qword_100022948);
  v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, v20);

  v59 = v1;
  if ((unint64_t)v21 >> 62)
  {
    if (v21 < 0)
      v35 = v21;
    else
      v35 = v21 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v21);
    v22 = _CocoaArrayWrapper.endIndex.getter(v35);
    swift_bridgeObjectRelease(v21);
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v23 = v12;
  v24 = v62;
  if (!v22)
  {
    swift_bridgeObjectRelease(v21);
LABEL_13:
    sub_10000C374(0, &qword_100022950, NSString_ptr);
    v21 = NSString.init(stringLiteral:)("", 0, 2);
    goto LABEL_14;
  }
  if ((v21 & 0xC000000000000001) != 0)
  {
    v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v21);
  }
  else
  {
    if (!*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_42;
    }
    v25 = *(id *)(v21 + 32);
  }
  v26 = v25;
  swift_bridgeObjectRelease(v21);
  v21 = (uint64_t)objc_msgSend(v26, "value");

  if (!v21)
    goto LABEL_13;
LABEL_14:
  v27 = objc_msgSend(v18, "phoneNumbers");
  v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v27, v20);

  if (!((unint64_t)v20 >> 62))
  {
    v28 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v28)
      goto LABEL_16;
LABEL_28:
    swift_bridgeObjectRelease(v20);
    v34 = 0xE000000000000000;
    goto LABEL_29;
  }
  if (v20 < 0)
    v36 = v20;
  else
    v36 = v20 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v20);
  v28 = _CocoaArrayWrapper.endIndex.getter(v36);
  swift_bridgeObjectRelease(v20);
  if (!v28)
    goto LABEL_28;
LABEL_16:
  if ((v20 & 0xC000000000000001) == 0)
  {
    if (!*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v29 = *(id *)(v20 + 32);
    goto LABEL_19;
  }
LABEL_42:
  v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v20);
LABEL_19:
  v30 = v29;
  swift_bridgeObjectRelease(v20);
  v31 = objc_msgSend(v30, "value");

  v32 = objc_msgSend(v31, "stringValue");
  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
  v34 = v33;

LABEL_29:
  v23(v7, 1, 1, v24);
  v37 = (id)v21;
  v38 = static MainActor.shared.getter(v37);
  v39 = (_QWORD *)swift_allocObject(&unk_10001D248, 56, 7);
  v39[2] = v38;
  v39[3] = &protocol witness table for MainActor;
  v39[4] = v37;
  v39[5] = v28;
  v39[6] = v34;
  v40 = sub_100013C6C((uint64_t)v7, (uint64_t)&unk_100022960, (uint64_t)v39);
  v41 = swift_release(v40);
  v42 = CNContact.callHistoryHandles.getter(v41);
  v43 = v42;
  if ((unint64_t)v42 >> 62)
  {
    if (v42 < 0)
      v48 = v42;
    else
      v48 = v42 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v42);
    v49 = _CocoaArrayWrapper.endIndex.getter(v48);
    swift_bridgeObjectRelease(v43);
    if (v49)
      goto LABEL_31;
  }
  else if (*(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_31:
    swift_bridgeObjectRelease(v8);
    v44 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v23)(v7, 1, 1, v24);
    v45 = static MainActor.shared.getter(v44);
    v46 = (_QWORD *)swift_allocObject(&unk_10001D270, 40, 7);
    v46[2] = v45;
    v46[3] = &protocol witness table for MainActor;
    v46[4] = v43;
    v47 = sub_100013C6C((uint64_t)v7, (uint64_t)&unk_100022970, (uint64_t)v46);

    swift_release(v47);
    return;
  }
  v50 = swift_bridgeObjectRelease(v43);
  v51 = v61;
  static PeopleLogger.viewService.getter(v50);
  v52 = swift_bridgeObjectRetain(v8);
  v53 = Logger.logObject.getter(v52);
  v54 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc(12, -1);
    v56 = swift_slowAlloc(32, -1);
    v64 = v56;
    *(_DWORD *)v55 = 136315138;
    swift_bridgeObjectRetain(v8);
    v63 = sub_100014E0C(v60, v8, &v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v55 + 4, v55 + 12);
    swift_bridgeObjectRelease_n(v8, 3);
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "No call handles for %s", v55, 0xCu);
    swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v56, -1, -1);
    swift_slowDealloc(v55, -1, -1);

    (*(void (**)(char *, uint64_t))(v58 + 8))(v61, v59);
  }
  else
  {

    swift_bridgeObjectRelease_n(v8, 2);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v51, v59);
  }
}

uint64_t sub_1000123CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5[3] = a4;
  v5[4] = a5;
  v6 = type metadata accessor for Logger(0);
  v5[5] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[6] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[7] = swift_task_alloc(v8);
  v5[8] = swift_task_alloc(v8);
  v9 = type metadata accessor for Date(0);
  v5[9] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v5[10] = v10;
  v5[11] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MainActor(0);
  v5[12] = static MainActor.shared.getter(v11);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v5[13] = v12;
  v5[14] = v13;
  return swift_task_switch(sub_100012498, v12, v13);
}

uint64_t sub_100012498()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for LaunchRecorderWriter(0);
  v0[15] = static LaunchRecorderWriter.sharedInstance.getter();
  v2 = sub_1000063B4(&qword_100022990, (uint64_t (*)(uint64_t))&type metadata accessor for LaunchRecorderWriter, (uint64_t)&protocol conformance descriptor for LaunchRecorderWriter);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v1, v2);
  v0[16] = v3;
  v0[17] = v4;
  return swift_task_switch(sub_100012524, v3, v4);
}

uint64_t sub_100012524()
{
  uint64_t v0;

  dispatch thunk of LaunchRecorderWriter.reload()();
  return swift_task_switch(sub_10001255C, *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
}

uint64_t sub_10001255C()
{
  uint64_t v0;

  Date.init()();
  return swift_task_switch(sub_100012594, *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
}

uint64_t sub_100012594()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  *(_BYTE *)(v0 + 152) = dispatch thunk of LaunchRecorderWriter.add(contactId:time:)(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), v1) & 1;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch(sub_1000125FC, *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
}

uint64_t sub_1000125FC()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_BYTE *)(v0 + 152) == 1)
    return swift_task_switch(sub_100012790, *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  swift_release(*(_QWORD *)(v0 + 96));
  v2 = static PeopleErrors.createError(_:code:)(0xD000000000000015, 0x8000000100019E90, 500);
  v3 = swift_willThrow();
  v4 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 56);
  v8 = *(void **)(v0 + 32);
  v7 = *(_QWORD *)(v0 + 40);
  v9 = *(_QWORD *)(v0 + 24);
  static PeopleLogger.viewService.getter(v3);
  swift_errorRetain(v2);
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease(0xE000000000000000);
  v10._countAndFlagsBits = v9;
  v10._object = v8;
  String.append(_:)(v10);
  v11._countAndFlagsBits = 4203808;
  v11._object = (void *)0xE300000000000000;
  String.append(_:)(v11);
  Logger.ifError(_:message:)(v2, 0xD00000000000001CLL, 0x8000000100019EB0);
  swift_release(v4);
  swift_bridgeObjectRelease(0x8000000100019EB0);
  swift_errorRelease(v2);
  swift_errorRelease(v2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  v12 = *(_QWORD *)(v0 + 56);
  v13 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v13);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012790()
{
  _QWORD *v0;

  dispatch thunk of LaunchRecorderWriter.save()();
  v0[18] = 0;
  return swift_task_switch(sub_1000127E8, v0[13], v0[14]);
}

uint64_t sub_1000127E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
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

  v1 = *(_QWORD *)(v0 + 32);
  v2 = swift_release(*(_QWORD *)(v0 + 96));
  static PeopleLogger.viewService.getter(v2);
  v3 = swift_bridgeObjectRetain_n(v1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v17 = *(_QWORD *)(v0 + 120);
    v18 = *(_QWORD *)(v0 + 48);
    v6 = *(_QWORD *)(v0 + 32);
    v19 = *(_QWORD *)(v0 + 40);
    v20 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 24);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v21 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain(v6);
    *(_QWORD *)(v0 + 16) = sub_100014E0C(v7, v6, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(v6, 3);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Recorded launch %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
    swift_release(v17);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 120);
    v11 = *(_QWORD *)(v0 + 64);
    v12 = *(_QWORD *)(v0 + 40);
    v13 = *(_QWORD *)(v0 + 48);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 32), 2);
    swift_release(v10);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  v14 = *(_QWORD *)(v0 + 56);
  v15 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v15);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000129D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;

  v1 = swift_release(*(_QWORD *)(v0 + 96));
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  v7 = *(void **)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v8 = *(_QWORD *)(v0 + 24);
  static PeopleLogger.viewService.getter(v1);
  swift_errorRetain(v2);
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease(0xE000000000000000);
  v9._countAndFlagsBits = v8;
  v9._object = v7;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 4203808;
  v10._object = (void *)0xE300000000000000;
  String.append(_:)(v10);
  Logger.ifError(_:message:)(v2, 0xD00000000000001CLL, 0x8000000100019EB0);
  swift_release(v3);
  swift_bridgeObjectRelease(0x8000000100019EB0);
  swift_errorRelease(v2);
  swift_errorRelease(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v11 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v12);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v7 = type metadata accessor for MainActor(0);
  v6[5] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  return swift_task_switch(sub_100012B78, v8, v9);
}

uint64_t sub_100012B78()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString v3;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 40));
  v2 = (void *)objc_opt_self(IMCoreInterface);
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "clearUnreadFor:andPhone:", v1, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[3] = a4;
  v5 = type metadata accessor for Logger(0);
  v4[4] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[5] = v6;
  v4[6] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0);
  v4[7] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  return swift_task_switch(sub_100012C84, v8, v9);
}

uint64_t sub_100012C84()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  id v3;
  Class isa;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  Class v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v21;

  swift_release(*(_QWORD *)(v0 + 56));
  v1 = objc_msgSend(objc_allocWithZone((Class)CHManager), "init");
  v2 = (void *)objc_opt_self(CHRecentCall);
  v3 = objc_msgSend(v2, "predicateForCallsWithStatus:", kCHCallStatusMissed);
  sub_10000C374(0, &qword_100022978, CHHandle_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v5 = objc_msgSend(v2, "predicateForCallsWithAnyRemoteParticipantHandles:", isa);

  v6 = sub_100006298(&qword_100022980);
  v7 = swift_allocObject(v6, 48, 7);
  *(_OWORD *)(v7 + 16) = xmmword_1000173B0;
  *(_QWORD *)(v7 + 32) = v3;
  *(_QWORD *)(v7 + 40) = v5;
  v21 = v7;
  specialized Array._endMutation()();
  sub_10000C374(0, &qword_100022988, NSPredicate_ptr);
  v8 = v3;
  v9 = v5;
  v10 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  v11 = objc_msgSend((id)objc_opt_self(NSCompoundPredicate), "andPredicateWithSubpredicates:", v10);

  v12 = -[NSObject setRead:forCallsWithPredicate:](v1, "setRead:forCallsWithPredicate:", 1, v11);
  v13 = static PeopleLogger.viewService.getter(v12);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v16 = 134217984;
    *(_QWORD *)(v0 + 16) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v16 + 4, v16 + 12);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "chmanager setRead result %ld", v16, 0xCu);
    swift_slowDealloc(v16, -1, -1);
    v17 = v1;
    v18 = v14;
    v1 = v11;
  }
  else
  {
    v17 = v8;
    v18 = v9;
    v9 = v11;
    v8 = v14;
  }

  v19 = *(_QWORD *)(v0 + 48);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(v19, *(_QWORD *)(v0 + 32));
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100012F50()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeopleViewHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PeopleViewHandler()
{
  return objc_opt_self(_TtC17PeopleViewService17PeopleViewHandler);
}

uint64_t sub_10001300C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100013038(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10002293C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1000135F4;
  return sub_1000123CC(a1, v4, v5, v7, v6);
}

uint64_t sub_1000130B0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000130E4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_10002295C);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_10000C32C;
  return sub_100012B08(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100013164()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100013190(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10002296C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1000135F4;
  return sub_100012BF0(a1, v4, v5, v6);
}

uint64_t sub_1000131FC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100013220()
{
  uint64_t v0;

  return sub_100011BAC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100013228(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100013238(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100013240()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000229B0;
  if (!qword_1000229B0)
  {
    v1 = sub_10001328C(&qword_1000229A8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000229B0);
  }
  return result;
}

uint64_t sub_10001328C(uint64_t *a1)
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

uint64_t sub_1000132D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006298(&qword_1000229C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  int v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;

  v0 = type metadata accessor for PeopleURL.PathAction(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006298(&qword_1000229B8);
  __chkstk_darwin(v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006298(&qword_1000229C0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v25 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v25 - v15;
  URLComponents.peopleAction.getter(v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v13, enum case for PeopleURL.PathAction.showSearchResult(_:), v0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v13, 0, 1, v0);
  v17 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_1000132D0((uint64_t)v16, (uint64_t)v6);
  sub_1000132D0((uint64_t)v13, v17);
  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v18((uint64_t)v6, 1, v0) == 1)
  {
    sub_100008928((uint64_t)v13, &qword_1000229C0);
    sub_100008928((uint64_t)v16, &qword_1000229C0);
    v19 = v18(v17, 1, v0);
    if (v19 == 1)
      v20 = &qword_1000229C0;
    else
      v20 = &qword_1000229B8;
    if (v19 == 1)
      v21 = -1;
    else
      v21 = 0;
  }
  else
  {
    sub_1000132D0((uint64_t)v6, (uint64_t)v10);
    if (v18(v17, 1, v0) == 1)
    {
      sub_100008928((uint64_t)v13, &qword_1000229C0);
      sub_100008928((uint64_t)v16, &qword_1000229C0);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
      v21 = 0;
      v20 = &qword_1000229B8;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v17, v0);
      v22 = sub_1000063B4(&qword_1000229C8, (uint64_t (*)(uint64_t))&type metadata accessor for PeopleURL.PathAction, (uint64_t)&protocol conformance descriptor for PeopleURL.PathAction);
      v21 = dispatch thunk of static Equatable.== infix(_:_:)(v10, v3, v0, v22);
      v23 = *(void (**)(char *, uint64_t))(v1 + 8);
      v23(v3, v0);
      v20 = &qword_1000229C0;
      sub_100008928((uint64_t)v13, &qword_1000229C0);
      sub_100008928((uint64_t)v16, &qword_1000229C0);
      v23(v10, v0);
    }
  }
  sub_100008928((uint64_t)v6, v20);
  return v21 & 1;
}

unint64_t sub_100013600(uint64_t a1)
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
  sub_100006298(&qword_100022AD0);
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
    sub_100015B48(v7, (uint64_t)&v14, &qword_100022AD8);
    v8 = v14;
    result = sub_10001544C(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_100015B38(&v15, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_10001372C(uint64_t a1)
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
  uint64_t v18;
  __int128 v19;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v16 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v16);
    return (unint64_t)v4;
  }
  sub_100006298(&qword_100022AB8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
    goto LABEL_9;
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100015B48(v7, (uint64_t)&v17, &qword_100022AC0);
    v8 = v17;
    v9 = v18;
    result = sub_1000154CC(v17, v18, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_1000156AC);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100015B38(&v19, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_12;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      v16 = a1;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100013874(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100006298(&qword_100022AB0);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v28)
        goto LABEL_37;
      v15 = *(_QWORD *)(v29 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v28)
          goto LABEL_37;
        v15 = *(_QWORD *)(v29 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v28)
            goto LABEL_37;
          v15 = *(_QWORD *)(v29 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = *v18;
    v19 = v18[1];
    sub_100015AFC(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(_QWORD *)&v40 = v20;
    *((_QWORD *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v20;
    *((_QWORD *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_100015B38(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_100015B38(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_100015B38(v37, v38);
    sub_100015B38(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(_QWORD *)(v11 + 32) = v32;
    result = (uint64_t)sub_100015B38(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_10000E7FC(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v29 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100013C38(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
  *(_BYTE *)v4 = a2;
  *(_QWORD *)(v4 + 8) = a3;
  v5 = a3;
  return swift_continuation_resume(v3);
}

uint64_t sub_100013C6C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100008928(a1, &qword_100022930);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_10001D350, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100022AA8, v17);
}

void sub_100013DB8(uint64_t a1, uint64_t a2, void (*a3)(void *), uint64_t a4)
{
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  NSString v47;
  id v48;
  uint64_t v49;
  id v50;
  NSString v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  Class isa;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int (*v77)(_QWORD, _QWORD, _QWORD);
  uint64_t v78;
  uint64_t v79;
  void (*v80)(char *, char *, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  void (**v87)(void *);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, _QWORD, uint64_t);
  uint64_t v93;
  char *v94;
  uint64_t v95;
  void (*v96)(char *, uint64_t);
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  os_log_type_t v102;
  uint64_t v103;
  uint8_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  void (*v113)(void *);
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  unsigned int (*v123)(_QWORD, _QWORD, _QWORD);
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  void (*v141)(void *);
  uint64_t v142;
  uint64_t v143;
  uint64_t v144[2];

  v141 = a3;
  v142 = a4;
  v139 = a2;
  v5 = type metadata accessor for CocoaError.Code(0);
  __chkstk_darwin(v5);
  v132 = (char *)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CocoaError(0);
  v133 = *(_QWORD *)(v7 - 8);
  v134 = v7;
  __chkstk_darwin(v7);
  v131 = (char *)&v122 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v130 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v137 = (char *)&v122 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100006298(&qword_100022600);
  __chkstk_darwin(v11);
  v138 = (char *)&v122 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for HandleType(0);
  v128 = *(_QWORD *)(v13 - 8);
  v129 = v13;
  __chkstk_darwin(v13);
  v127 = (char *)&v122 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100006298(&qword_100022378);
  v16 = __chkstk_darwin(v15);
  v126 = (uint64_t)&v122 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v136 = (uint64_t)&v122 - v19;
  v20 = __chkstk_darwin(v18);
  v135 = (uint64_t)&v122 - v21;
  __chkstk_darwin(v20);
  v23 = (char *)&v122 - v22;
  v24 = sub_100006298(&qword_100022930);
  __chkstk_darwin(v24);
  v26 = (char *)&v122 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100006298(&qword_100022068);
  __chkstk_darwin(v27);
  v29 = (char *)&v122 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for URL(0);
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(_QWORD *)(v31 + 64);
  v33 = __chkstk_darwin(v30);
  v34 = (char *)&v122 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __chkstk_darwin(v33);
  v37 = (char *)&v122 - v36;
  v38 = QuickAction.useStandardProtocol.getter(v35);
  if ((v38 & 1) != 0)
  {
    v125 = v9;
    QuickAction.standardProtocolURL.getter();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) != 1)
    {
      v80 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
      v80(v37, v29, v30);
      v81 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v81 - 8) + 56))(v26, 1, 1, v81);
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v34, v37, v30);
      v82 = *(unsigned __int8 *)(v31 + 80);
      v83 = (v82 + 40) & ~v82;
      v84 = (v32 + v83 + 7) & 0xFFFFFFFFFFFFFFF8;
      v85 = (char *)swift_allocObject(&unk_10001D328, v84 + 16, v82 | 7);
      *((_QWORD *)v85 + 2) = 0;
      *((_QWORD *)v85 + 3) = 0;
      v86 = v140;
      *((_QWORD *)v85 + 4) = v140;
      v80(&v85[v83], v34, v30);
      v87 = (void (**)(void *))&v85[v84];
      v88 = v142;
      *v87 = v141;
      v87[1] = (void (*)(void *))v88;
      swift_retain(v86);
      swift_retain(v88);
      v89 = sub_100013C6C((uint64_t)v26, (uint64_t)&unk_100022A98, (uint64_t)v85);
      swift_release(v89);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v37, v30);
      return;
    }
    v38 = sub_100008928((uint64_t)v29, &qword_100022068);
    v9 = v125;
  }
  v39 = v9;
  QuickAction.handle.getter(v38);
  v41 = v40;
  v42 = v139;
  sub_100015B48(v139, (uint64_t)v23, &qword_100022378);
  if (v41)
  {
    sub_100008928((uint64_t)v23, &qword_100022378);
    v44 = (uint64_t)v141;
    v43 = v142;
LABEL_6:
    v45 = (uint64_t)v138;
    v46 = objc_allocWithZone((Class)CNPhoneNumber);
    swift_bridgeObjectRetain(v41);
    v47 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v41);
    v48 = objc_msgSend(v46, "initWithStringValue:", v47);

    if (v48)
      v49 = 2;
    else
      v49 = 1;
    v50 = objc_allocWithZone((Class)INPersonHandle);
    v51 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v41);
    v52 = objc_msgSend(v50, "initWithValue:type:", v51, v49);

    v53 = type metadata accessor for PersonNameComponents(0);
    v54 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v45, 1, 1, v53);
    v55 = QuickAction.contactIdentifier.getter(v54);
    v57 = v56;
    v58 = QuickAction.customIdentifier.getter();
    v60 = v59;
    v61 = objc_allocWithZone((Class)INPerson);
    v62 = sub_100014968(v52, v45, 0, 0, 0, v55, v57, v58, v60);
    v63 = sub_100006298(&qword_100022980);
    v64 = swift_allocObject(v63, 40, 7);
    *(_OWORD *)(v64 + 16) = xmmword_100017240;
    *(_QWORD *)(v64 + 32) = v62;
    v144[0] = v64;
    specialized Array._endMutation()();
    v65 = v144[0];
    v66 = objc_allocWithZone((Class)INSendMessageIntent);
    sub_1000158F4();
    v67 = v62;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v65);
    v69 = objc_msgSend(v66, "initWithRecipients:outgoingMessageType:content:speakableGroupName:conversationIdentifier:serviceName:sender:attachments:", isa, 1, 0, 0, 0, 0, 0, 0);

    v71 = QuickAction.bundleID.getter(v70);
    v73 = v72;
    sub_1000070CC(v69, v71, v72, v44, v43);

    swift_bridgeObjectRelease(v73);
    return;
  }
  v125 = a1;
  v74 = v135;
  sub_100015B48((uint64_t)v23, v135, &qword_100022378);
  v75 = type metadata accessor for Person(0);
  v76 = *(_QWORD *)(v75 - 8);
  v77 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v76 + 48);
  if (v77(v74, 1, v75) == 1)
  {
    sub_100008928((uint64_t)v23, &qword_100022378);
    v78 = sub_100008928(v74, &qword_100022378);
    v79 = v39;
  }
  else
  {
    v123 = v77;
    v91 = v128;
    v90 = v129;
    v92 = *(void (**)(char *, _QWORD, uint64_t))(v128 + 104);
    v124 = v75;
    v93 = v76;
    v94 = v127;
    v92(v127, enum case for HandleType.phoneNumber(_:), v129);
    Person.preferredHandle(ofType:)(v94);
    v41 = v95;
    v96 = *(void (**)(char *, uint64_t))(v91 + 8);
    v77 = v123;
    v97 = v94;
    v76 = v93;
    v75 = v124;
    v96(v97, v90);
    sub_100008928((uint64_t)v23, &qword_100022378);
    v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v76 + 8))(v74, v75);
    v79 = v39;
    if (v41)
    {
      v44 = (uint64_t)v141;
      v43 = v142;
      goto LABEL_6;
    }
  }
  v98 = v137;
  static PeopleLogger.common.getter(v78);
  v99 = v136;
  v100 = sub_100015B48(v42, v136, &qword_100022378);
  v101 = Logger.logObject.getter(v100);
  v102 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v101, v102))
  {
    v103 = v99;
    v104 = (uint8_t *)swift_slowAlloc(12, -1);
    v105 = swift_slowAlloc(32, -1);
    v144[0] = v105;
    *(_DWORD *)v104 = 136315138;
    v106 = v103;
    v107 = v126;
    sub_100015B48(v106, v126, &qword_100022378);
    if (v77(v107, 1, v75) == 1)
    {
      sub_100008928(v107, &qword_100022378);
      v108 = 0;
      v109 = 0xE000000000000000;
    }
    else
    {
      v111 = v107;
      v108 = Person.description.getter();
      v109 = v112;
      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v111, v75);
    }
    v143 = sub_100014E0C(v108, v109, v144);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v143, v144, v104 + 4, v104 + 12);
    swift_bridgeObjectRelease(v109);
    sub_100008928(v136, &qword_100022378);
    _os_log_impl((void *)&_mh_execute_header, v101, v102, "Could not find handle for person %s", v104, 0xCu);
    swift_arrayDestroy(v105, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v105, -1, -1);
    swift_slowDealloc(v104, -1, -1);

    v110 = (*(uint64_t (**)(char *, uint64_t))(v130 + 8))(v137, v79);
  }
  else
  {
    sub_100008928(v99, &qword_100022378);

    v110 = (*(uint64_t (**)(char *, uint64_t))(v130 + 8))(v98, v79);
  }
  v113 = v141;
  v115 = v133;
  v114 = v134;
  v117 = v131;
  v116 = v132;
  static CocoaError.Code.coderInvalidValue.getter(v110);
  v118 = sub_100014B80((uint64_t)&_swiftEmptyArrayStorage);
  v119 = sub_1000063B4(&qword_100022A88, (uint64_t (*)(uint64_t))&type metadata accessor for CocoaError, (uint64_t)&protocol conformance descriptor for CocoaError);
  v120 = _BridgedStoredNSError.init(_:userInfo:)(v116, v118, v114, v119);
  v121 = (void *)CocoaError._nsError.getter(v120);
  (*(void (**)(char *, uint64_t))(v115 + 8))(v117, v114);
  v113(v121);

}

uint64_t sub_100014778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[29] = a6;
  v7[30] = a7;
  v7[27] = a4;
  v7[28] = a5;
  return swift_task_switch(sub_100014794, 0, 0);
}

uint64_t sub_100014794()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  NSURL *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v14;

  v1 = v0;
  v2 = v0 + 2;
  v3 = v1[27];
  v4 = sub_100006298(&qword_100022618);
  inited = swift_initStackObject(v4, v1 + 10);
  *(_OWORD *)(inited + 16) = xmmword_100017250;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
  *(_QWORD *)(inited + 40) = v6;
  *(_QWORD *)(inited + 72) = &type metadata for Bool;
  *(_BYTE *)(inited + 48) = 1;
  v7 = sub_10001372C(inited);
  v8 = *(void **)(v3 + 24);
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  v1[31] = v10;
  v12 = sub_100013874(v7);
  swift_bridgeObjectRelease(v7);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v1[32] = isa;
  swift_bridgeObjectRelease(v12);
  v1[7] = v1 + 25;
  v1[2] = v1;
  v1[3] = sub_10000B04C;
  v14 = swift_continuation_init(v2, 0);
  v1[20] = _NSConcreteStackBlock;
  v1 += 20;
  v1[1] = 0x40000000;
  v1[2] = sub_100013C38;
  v1[3] = &unk_10001D368;
  v1[4] = v14;
  objc_msgSend(v8, "openSensitiveURLInBackground:withOptions:completionHandler:", v11, isa, v1);
  return swift_continuation_await(v2);
}

uint64_t sub_1000148F8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for MessageActionHandler()
{
  return objc_opt_self(_TtC17PeopleViewService20MessageActionHandler);
}

void sub_100014948(uint64_t a1, uint64_t a2, void (*a3)(void *), uint64_t a4)
{
  sub_100013DB8(a1, a2, a3, a4);
}

id sub_100014968(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  Class isa;
  NSString v17;
  uint64_t v18;
  NSString v19;
  NSString v20;
  id v21;
  id v23;

  v14 = type metadata accessor for PersonNameComponents(0);
  v15 = *(_QWORD *)(v14 - 8);
  isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a2, 1, v14) != 1)
  {
    isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a2, v14);
  }
  if (a4)
  {
    v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a4);
    v18 = a9;
    if (a7)
      goto LABEL_5;
LABEL_8:
    v19 = 0;
    if (v18)
      goto LABEL_6;
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v17 = 0;
  v18 = a9;
  if (!a7)
    goto LABEL_8;
LABEL_5:
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a7);
  if (!v18)
    goto LABEL_9;
LABEL_6:
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
LABEL_10:
  v21 = objc_msgSend(v23, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", a1, isa, v17, a5, v19, v20);

  return v21;
}

uint64_t sub_100014AD0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100014B34;
  return v6(a1);
}

uint64_t sub_100014B34()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_100014B80(uint64_t a1)
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
  uint64_t v18;
  __int128 v19;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v16 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v16);
    return (unint64_t)v4;
  }
  sub_100006298(&qword_100022AB8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
    goto LABEL_9;
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100015B48(v7, (uint64_t)&v17, &qword_100022AC0);
    v8 = v17;
    v9 = v18;
    result = sub_1000154CC(v17, v18, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100014CC8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100015B38(&v19, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_12;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      v16 = a1;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100014CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v17;
  uint64_t v18;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    v11 = v10[1];
    if ((*v10 != a1 || v11 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      i = (i + 1) & v13;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v14 = (_QWORD *)(v9 + 16 * i);
        v15 = v14[1];
        if ((*v14 != a1 || v15 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0)
        {
          for (i = (i + 1) & v13; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v13)
          {
            v17 = (_QWORD *)(v9 + 16 * i);
            v18 = v17[1];
            if (*v17 == a1 && v18 == a2)
              break;
            if ((_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_100014E0C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100014EDC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100015AFC((uint64_t)v12, *a3);
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
      sub_100015AFC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000062FC(v12);
  return v7;
}

uint64_t sub_100014EDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100015094(a5, a6);
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

uint64_t sub_100015094(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100015128(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100015300(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100015300(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100015128(uint64_t a1, unint64_t a2)
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
      v5 = sub_10001529C(v4, 0);
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

_QWORD *sub_10001529C(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006298(&qword_100022AC8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100015300(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006298(&qword_100022AC8);
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

unint64_t sub_10001544C(uint64_t a1)
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
  return sub_100015538(a1, v7);
}

uint64_t sub_1000154CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  uint64_t v3;
  Swift::Int v6;
  _QWORD v9[9];

  Hasher.init(_seed:)(v9, *(_QWORD *)(v3 + 40));
  String.hash(into:)(v9, a1, a2);
  v6 = Hasher._finalize()();
  return a3(a1, a2, v6);
}

unint64_t sub_100015538(uint64_t a1, uint64_t a2)
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

unint64_t sub_1000156AC(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_10001578C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void (*v12)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v0 = type metadata accessor for QuickActionType(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v2);
  v7 = (char *)&v14 - v6;
  QuickAction.type.getter(v5);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, enum case for QuickActionType.message(_:), v0);
  v8 = sub_1000063B4((unint64_t *)&qword_100022060, (uint64_t (*)(uint64_t))&type metadata accessor for QuickActionType, (uint64_t)&protocol conformance descriptor for QuickActionType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v16, v0, v8);
  dispatch thunk of RawRepresentable.rawValue.getter(&v14, v0, v8);
  v9 = v17;
  v10 = v15;
  if (v16 == v14 && v17 == v15)
  {
    v11 = 1;
    v10 = v17;
  }
  else
  {
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v14, v15, 0);
  }
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);
  v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v4, v0);
  v12(v7, v0);
  return v11 & 1;
}

unint64_t sub_1000158F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022620;
  if (!qword_100022620)
  {
    v1 = objc_opt_self(INPerson);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100022620);
  }
  return result;
}

uint64_t sub_100015930()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_1000159CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v2 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(v0 + 32);
  v6 = v0 + v3;
  v7 = swift_task_alloc(dword_100022A94);
  v8 = *(_OWORD *)(v0 + v4);
  *(_QWORD *)(v1 + 16) = v7;
  *(_QWORD *)v7 = v1;
  *(_QWORD *)(v7 + 8) = sub_10000C32C;
  *(_OWORD *)(v7 + 232) = v8;
  *(_QWORD *)(v7 + 216) = v5;
  *(_QWORD *)(v7 + 224) = v6;
  return swift_task_switch(sub_100014794, 0, 0);
}

uint64_t sub_100015A68()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100015A8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100022AA4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000C32C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100022AA0 + dword_100022AA0))(a1, v4);
}

uint64_t sub_100015AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100015B38(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100015B48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006298(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100015B8C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC17PeopleViewServiceP33_DF2348F960F22D90AEA124AEE9213FAD19ResourceBundleClass);
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "body");
}

id objc_msgSend_checkAndClear_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAndClear:service:");
}

id objc_msgSend_checkWithWait_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkWithWait:service:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_initWith_andText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWith:andText:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logHandle");
}

id objc_msgSend_onComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onComplete:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_then(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "then");
}
