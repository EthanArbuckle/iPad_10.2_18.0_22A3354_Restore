id sub_10000238C()
{
  id v0;
  id v1;
  id v2;
  Class isa;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  _QWORD v23[3];
  _BYTE v24[16];
  id v25;

  v0 = objc_msgSend((id)objc_opt_self(CNUIContactsEnvironment), "currentEnvironment");
  v1 = objc_msgSend(v0, "contactStore");

  v2 = objc_allocWithZone((Class)CNContactFetchRequest);
  sub_100005070(&qword_100026448);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v4 = objc_msgSend(v2, "initWithKeysToFetch:", isa);

  objc_msgSend(v4, "setUnifyResults:", 1);
  v25 = 0;
  v5 = objc_msgSend(v1, "contactCountForFetchRequest:error:", v4, &v25);
  v6 = v25;
  if (v5)
  {
    v7 = v5;
    v8 = v25;
    v9 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v10 = v25;
    v11 = _convertNSErrorToError(_:)(v6);

    swift_willThrow();
    if (qword_100026310 != -1)
      swift_once(&qword_100026310, sub_100002EE0);
    v12 = type metadata accessor for Logger(0);
    sub_100005110(v12, (uint64_t)qword_100026318);
    swift_errorRetain(v11);
    v13 = swift_errorRetain(v11);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(12, -1);
      v17 = (void *)swift_slowAlloc(32, -1);
      v25 = v17;
      *(_DWORD *)v16 = 136315138;
      swift_getErrorValue(v11, v24, v23);
      v18 = Error.localizedDescription.getter(v23[1], v23[2]);
      v20 = v19;
      v22 = sub_100015810(v18, v19, (uint64_t *)&v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, v23, v16 + 4, v16 + 12);
      swift_bridgeObjectRelease(v20);
      swift_errorRelease(v11);
      swift_errorRelease(v11);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Fetched contacts: failed with %s", v16, 0xCu);
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);

      swift_errorRelease(v11);
    }
    else
    {

      swift_errorRelease(v11);
      swift_errorRelease(v11);
      swift_errorRelease(v11);

    }
    return 0;
  }
  return v9;
}

uint64_t sub_1000026B8()
{
  return swift_task_switch(sub_100002718, 0, 0);
}

uint64_t sub_100002718()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = objc_msgSend((id)objc_opt_self(CNUIContactsEnvironment), "currentEnvironment");
  v0[13] = objc_msgSend(v1, "contactStore");

  v2 = sub_100005070(&qword_1000263E0);
  v3 = swift_allocObject(v2, 48, 7);
  v0[14] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_100017020;
  *(_QWORD *)(v3 + 32) = objc_msgSend((id)objc_opt_self(CNContactFormatter), "descriptorForRequiredKeysForStyle:", 0);
  v0[15] = objc_opt_self(CNAvatarView);
  v4 = type metadata accessor for MainActor(0);
  v0[16] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  return swift_task_switch(sub_100002858, v5, v6);
}

uint64_t sub_100002858()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[15];
  swift_release(v0[16]);
  v0[17] = objc_msgSend(v1, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
  return swift_task_switch(sub_1000028E0, 0, 0);
}

uint64_t sub_1000028E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  id v4;
  Class isa;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = (void *)v1[13];
  v2 = v1[14];
  *(_QWORD *)(v2 + 40) = v1[17];
  v26 = v2;
  specialized Array._endMutation()(a1);
  v4 = objc_allocWithZone((Class)CNContactFetchRequest);
  sub_100005070(&qword_100026448);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v26);
  v6 = objc_msgSend(v4, "initWithKeysToFetch:", isa);

  objc_msgSend(v6, "setUnifyResults:", 1);
  v1[12] = 0;
  v1[11] = (uint64_t)&_swiftEmptyArrayStorage;
  v7 = v1 + 11;
  v8 = swift_allocObject(&unk_100020ED8, 32, 7);
  *(_QWORD *)(v8 + 16) = v1 + 11;
  *(_QWORD *)(v8 + 24) = v1 + 12;
  v9 = swift_allocObject(&unk_100020F00, 32, 7);
  v1[2] = (uint64_t)_NSConcreteStackBlock;
  *(_QWORD *)(v9 + 16) = sub_1000050C0;
  *(_QWORD *)(v9 + 24) = v8;
  v1[6] = (uint64_t)sub_1000050D8;
  v1[7] = v9;
  v1[3] = 1107296256;
  v1[4] = (uint64_t)sub_100002D60;
  v1[5] = (uint64_t)&unk_100020F18;
  v10 = _Block_copy(v1 + 2);
  v11 = v1[7];
  swift_retain(v9);
  swift_release(v11);
  v1[2] = 0;
  v12 = objc_msgSend(v3, "enumerateContactsWithFetchRequest:error:usingBlock:", v6, v1 + 2, v10);
  _Block_release(v10);
  v13 = (id)v1[2];
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation(v9, "", 116, 44, 59, 1);
  swift_release(v9);
  if ((v10 & 1) != 0)
  {
    __break(1u);
LABEL_11:
    swift_once(&qword_100026310, sub_100002EE0);
    goto LABEL_4;
  }
  if (!v12)
  {
    v24 = (void *)v1[13];
    _convertNSErrorToError(_:)(v13);

    swift_willThrow();
    swift_bridgeObjectRelease(v1[11]);
    swift_release(v8);
    return ((uint64_t (*)(void))v1[1])();
  }
  v13 = v1 + 8;
  if (qword_100026310 != -1)
    goto LABEL_11;
LABEL_4:
  v14 = type metadata accessor for Logger(0);
  v15 = sub_100005110(v14, (uint64_t)qword_100026318);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v18 = 134217984;
    swift_beginAccess(v1 + 11, v1 + 2, 0, 0);
    v19 = *v7;
    if ((unint64_t)*v7 >> 62)
    {
      if (v19 < 0)
        v25 = *v7;
      else
        v25 = v19 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*v7);
      v20 = _CocoaArrayWrapper.endIndex.getter(v25);
      swift_bridgeObjectRelease(v19);
    }
    else
    {
      v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v1[8] = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v13, v1 + 9, v18 + 4, v18 + 12);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Fetched %ld contacts", v18, 0xCu);
    swift_slowDealloc(v18, -1, -1);
  }
  v21 = (void *)v1[13];

  swift_beginAccess(v1 + 11, v13, 0, 0);
  v22 = v1[11];
  swift_release(v8);
  return ((uint64_t (*)(uint64_t))v1[1])(v22);
}

uint64_t sub_100002CC0(void *a1, _BYTE *a2, _QWORD *a3, uint64_t *a4)
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v7 = a1;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v9 = *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v8 = *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v9 >= v8 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
  v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7);
  result = specialized Array._endMutation()(v10);
  v12 = *a4 + 1;
  if (__OFADD__(*a4, 1))
  {
    __break(1u);
  }
  else
  {
    *a4 = v12;
    if (v12 == 63)
      *a2 = 1;
  }
  return result;
}

void sub_100002D60(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

BOOL sub_100002DA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100002DB8()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002DFC()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100002E24(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100002E64()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100005128(v0, qword_1000262F8);
  sub_100005110(v0, (uint64_t)qword_1000262F8);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x8000000100017D50, 0xD000000000000018, 0x8000000100017090);
}

uint64_t sub_100002EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100005128(v0, qword_100026318);
  v1 = sub_100005110(v0, (uint64_t)qword_100026318);
  if (qword_1000262F0 != -1)
    swift_once(&qword_1000262F0, sub_100002E64);
  v2 = sub_100005110(v0, (uint64_t)qword_1000262F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100002F70()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ContactAvatarView.Coordinator()
{
  return objc_opt_self(_TtCV23LimitedAccessPromptViewP33_121ED01E588226E6DDED924376CF473F17ContactAvatarView11Coordinator);
}

id sub_100002FB4(uint64_t a1)
{
  void **v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v3 = *v1;
  v4 = sub_100005070(&qword_1000265C8);
  UIViewRepresentableContext.coordinator.getter(&v9, v4);
  v5 = v9;
  v6 = *(id *)(v9 + 16);
  swift_release(v5);
  v7 = objc_msgSend(v6, "view");

  sub_100005480(a1, v3);
  return v7;
}

void sub_100003044(uint64_t a1, uint64_t a2)
{
  void **v2;

  sub_100005480(a2, *v2);
}

void sub_100003058(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = type metadata accessor for ContactAvatarView.Coordinator();
  v3 = swift_allocObject(v2, 24, 7);
  v4 = objc_msgSend((id)objc_opt_self(CNAvatarViewControllerSettings), "defaultSettings");
  v5 = objc_msgSend(objc_allocWithZone((Class)CNAvatarViewController), "initWithSettings:", v4);

  *(_QWORD *)(v3 + 16) = v5;
  *a1 = v3;
}

uint64_t sub_1000030E8(uint64_t a1, char a2)
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)(a1, a2 & 1);
}

uint64_t sub_100003128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000690C();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100003178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000690C();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000031C8()
{
  return static View._viewListCount(inputs:)();
}

void sub_1000031E0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000690C();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

void sub_100003204(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
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
  _QWORD *v20;
  char v21;
  char v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  unsigned __int8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;

  if ((a2 & 1) != 0)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v32 = 0.0;
    v33 = 0;
    v15 = 1;
  }
  else
  {
    v16 = static Alignment.center.getter(a1);
    _FrameLayout.init(width:height:alignment:)(&v34, *(_QWORD *)&a4, 0, *(_QWORD *)&a4, 0, v16, v17);
    v10 = v34;
    v11 = v35;
    v12 = v36;
    v13 = v37;
    v14 = v38;
    v33 = v39;
    v32 = a4 * 0.1;
    v15 = (uint64_t)a1;
  }
  v18 = static Alignment.center.getter(a1);
  v20 = _FrameLayout.init(width:height:alignment:)(&v40, *(_QWORD *)&a4, 0, *(_QWORD *)&a4, 0, v18, v19);
  v21 = v41;
  v30 = v42;
  v31 = v40;
  v22 = v43;
  v29 = v44;
  v28 = v45;
  v27 = static Edge.Set.all.getter(v20);
  v23 = EdgeInsets.init(_all:)(a5);
  *(_QWORD *)a3 = v15;
  *(_QWORD *)(a3 + 8) = v10;
  *(_QWORD *)(a3 + 16) = v11;
  *(_QWORD *)(a3 + 24) = v12;
  *(_QWORD *)(a3 + 32) = v13;
  *(_QWORD *)(a3 + 40) = v14;
  *(_QWORD *)(a3 + 48) = v33;
  *(double *)(a3 + 56) = v32;
  *(_QWORD *)(a3 + 64) = 0;
  *(_QWORD *)(a3 + 72) = 0;
  *(double *)(a3 + 80) = v32;
  *(_QWORD *)(a3 + 88) = a1;
  *(_QWORD *)(a3 + 96) = v31;
  *(_BYTE *)(a3 + 104) = v21;
  *(_QWORD *)(a3 + 112) = v30;
  *(_BYTE *)(a3 + 120) = v22;
  *(_QWORD *)(a3 + 128) = v29;
  *(_QWORD *)(a3 + 136) = v28;
  *(_BYTE *)(a3 + 144) = v27;
  *(double *)(a3 + 152) = v23;
  *(_QWORD *)(a3 + 160) = v24;
  *(_QWORD *)(a3 + 168) = v25;
  *(_QWORD *)(a3 + 176) = v26;
  *(_BYTE *)(a3 + 184) = 0;
  sub_100006670((id)v15);
  sub_100006680((id)v15);
}

double sub_1000033FC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v4;
  double v5;
  double v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double result;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  char v26;
  char v27;
  _OWORD v28[10];
  _OWORD v29[2];

  v4 = *(void **)v2;
  v5 = *(double *)(v2 + 8);
  v6 = *(double *)(v2 + 16);
  v7 = *(_BYTE *)(v2 + 24);
  v8 = static Alignment.center.getter(a1);
  v10 = v9;
  sub_100003204(v4, v7, (uint64_t)v28, v5, v6);
  v11 = static Alignment.leading.getter();
  _FrameLayout.init(width:height:alignment:)(&v21, 0, 1, 0, 1, v11, v12);
  v13 = v21;
  v14 = v23;
  v27 = v22;
  v26 = v24;
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v10;
  v15 = v28[9];
  *(_OWORD *)(a2 + 144) = v28[8];
  *(_OWORD *)(a2 + 160) = v15;
  *(_OWORD *)(a2 + 176) = v29[0];
  *(_OWORD *)(a2 + 185) = *(_OWORD *)((char *)v29 + 9);
  v16 = v28[5];
  *(_OWORD *)(a2 + 80) = v28[4];
  *(_OWORD *)(a2 + 96) = v16;
  v17 = v28[7];
  *(_OWORD *)(a2 + 112) = v28[6];
  *(_OWORD *)(a2 + 128) = v17;
  v18 = v28[1];
  *(_OWORD *)(a2 + 16) = v28[0];
  *(_OWORD *)(a2 + 32) = v18;
  v19 = v28[3];
  *(_OWORD *)(a2 + 48) = v28[2];
  *(_OWORD *)(a2 + 64) = v19;
  *(_QWORD *)(a2 + 208) = v13;
  *(_BYTE *)(a2 + 216) = v27;
  *(_QWORD *)(a2 + 224) = v14;
  *(_BYTE *)(a2 + 232) = v26;
  result = *(double *)&v25;
  *(_OWORD *)(a2 + 240) = v25;
  return result;
}

uint64_t sub_100003500(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;

  if (a2 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
  }
  else
  {
    if (a2)
    {
      v4 = type metadata accessor for GridItem(0);
      v5 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(a2, v4);
      *((_QWORD *)v5 + 2) = a2;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v8(&v5[v7], a1, v4);
      v9 = a2 - 1;
      if (a2 != 1)
      {
        v10 = *(_QWORD *)(v6 + 72);
        v11 = &v5[v10 + v7];
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      v5 = (char *)&_swiftEmptyArrayStorage;
    }
    v12 = type metadata accessor for GridItem(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_100003630@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;

  v3 = type metadata accessor for PinnedScrollableViews(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for GridItem.Size(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char **)((char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = type metadata accessor for GridItem(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005070(&qword_100026530);
  result = __chkstk_darwin(v13);
  v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)(v1 + 24);
  v19 = *(_QWORD *)(v1 + 32);
  if ((unsigned __int128)(v18 * (__int128)v19) >> 64 != (v18 * v19) >> 63)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  v21 = *(_QWORD *)(v1 + 48);
  v20 = *(double *)(v1 + 56);
  if ((*(_BYTE *)(v1 + 64) & 1) != 0 && __OFSUB__(v18 * v19, 1))
    goto LABEL_11;
  v41 = v15;
  v42 = result;
  v40 = v17;
  v22 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v39 = a1;
  v23 = v22;
  v24 = objc_msgSend(v22, "userInterfaceIdiom");
  v38 = v5;
  v25 = v3;
  v26 = v24;

  *v9 = v21;
  v9[1] = 0x7FF0000000000000;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for GridItem.Size.adaptive(_:), v6);
  GridItem.init(_:spacing:alignment:)(v9, 0, 1, 0, 0, 1);
  v27 = sub_100003500((uint64_t)v12, v19);
  v28 = v27;
  v29 = v20 * 15.0;
  if (v20 * 15.0 <= 20.0)
    v29 = 20.0;
  if (v26 == (id)1)
    v30 = 0x4024000000000000;
  else
    v30 = *(_QWORD *)&v29;
  v31 = __chkstk_darwin(v27);
  v32 = static HorizontalAlignment.center.getter(v31);
  v43 = 0;
  v33 = sub_100006090(&qword_100026538, (uint64_t (*)(uint64_t))&type metadata accessor for PinnedScrollableViews, (uint64_t)&protocol conformance descriptor for PinnedScrollableViews);
  v34 = v38;
  dispatch thunk of OptionSet.init(rawValue:)(&v43, v25, v33);
  v35 = sub_100005070(&qword_100026540);
  v36 = sub_100005DEC();
  v37 = v40;
  LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)(v28, v32, v30, 0, v34, sub_100005DE4, &v38 - 4, v35, v36);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v41 + 32))(v39, v37, v42);
}

uint64_t sub_10000391C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
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
  void (*v57)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(void);
  uint64_t v66;
  char *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  sub_100005070(&qword_100026540);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005070(&qword_100026488);
  ((void (*)(void))__chkstk_darwin)();
  v9 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100005070(&qword_100026560);
  v99 = *(_QWORD *)(v10 - 8);
  v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  v13 = (char *)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v100 = (char *)&v84 - v14;
  v15 = *(_QWORD *)a1;
  if (*(_QWORD *)a1 >> 62)
  {
    if (v15 < 0)
      v81 = *(_QWORD *)a1;
    else
      v81 = v15 & 0xFFFFFFFFFFFFFF8;
    sub_100006000((_QWORD *)a1);
    v82 = _CocoaArrayWrapper.endIndex.getter(v81);
    sub_100006028((_QWORD *)a1);
    if (v82)
      goto LABEL_3;
LABEL_12:
    v83 = sub_100005070(&qword_100026558);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 56))(a3, 1, 1, v83);
  }
  if (!*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_12;
LABEL_3:
  v97 = v13;
  v95 = v10;
  sub_100006000((_QWORD *)a1);
  v16 = sub_100005E68(a2, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  sub_100006028((_QWORD *)a1);
  v101 = v16;
  v102 = v18;
  v103 = v20;
  v104 = v22;
  KeyPath = swift_getKeyPath(&unk_1000172D8);
  v24 = swift_allocObject(&unk_1000210F8, 81, 7);
  v25 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 64) = v25;
  *(_BYTE *)(v24 + 80) = *(_BYTE *)(a1 + 64);
  v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v24 + 32) = v26;
  sub_100006000((_QWORD *)a1);
  v27 = sub_100005070(&qword_100026568);
  v28 = sub_100006878(&qword_100026570, &qword_100026568, (uint64_t)&protocol conformance descriptor for ArraySlice<A>);
  v29 = sub_100006090(&qword_100026578, (uint64_t (*)(uint64_t))sub_1000060D0, (uint64_t)&protocol conformance descriptor for NSObject);
  v30 = sub_10000610C();
  ForEach<>.init(_:id:content:)(&v101, KeyPath, sub_100006074, v24, v27, &type metadata for AvatarView, v28, v29, v30);
  v31 = *(_BYTE *)(a1 + 64);
  v96 = a3;
  v98 = v7;
  if ((v31 & 1) == 0)
  {
    v93 = 0;
    v94 = 0;
    v32 = 0;
    v91 = 0;
    v92 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v89 = 0;
    v90 = 0;
    v88 = 0;
LABEL_7:
    v65 = *(void (**)(void))(v99 + 16);
    v66 = v95;
    ((void (*)(char *, char *, uint64_t))v65)(v97, v100, v95);
    v67 = v98;
    v65();
    v68 = (uint64_t *)&v67[*(int *)(sub_100005070(&qword_100026590) + 48)];
    v70 = v93;
    v69 = v94;
    *v68 = v94;
    v68[1] = v70;
    v71 = v32;
    v86 = v35;
    v87 = v32;
    v72 = v92;
    v68[2] = v32;
    v68[3] = v72;
    v68[4] = v33;
    v68[5] = v34;
    v68[6] = 0;
    v68[7] = v35;
    v73 = v33;
    v85 = v33;
    v74 = v91;
    v75 = v34;
    v77 = v89;
    v76 = v90;
    v68[8] = v91;
    v68[9] = v76;
    v68[10] = v74;
    v68[11] = v77;
    v68[12] = v88;
    sub_100006150(v69, v70, v71, v72, v73, v75, 0, v35, v74, v76, v74, v77);
    v78 = *(void (**)(char *, uint64_t))(v99 + 8);
    v78(v100, v66);
    sub_1000061D0(v69, v70, v87, v72, v85, v75, 0, v86, v74, v76, v74, v77);
    v78(v97, v66);
    v79 = sub_100005070(&qword_100026558);
    v80 = (uint64_t)v98;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 56))(v98, 0, 1, v79);
    return sub_100006240(v80, v96, &qword_100026540);
  }
  v36 = *(_QWORD *)(a1 + 40);
  result = v36 - a2;
  if (!__OFSUB__(v36, a2))
  {
    v101 = sub_100006284(result);
    v102 = v38;
    v39 = sub_100005818();
    v40 = Text.init<A>(_:)(&v101, &type metadata for String, v39);
    v42 = v41;
    v44 = v43;
    v46 = v45 & 1;
    v47 = static Color.gray.getter();
    v48 = Text.foregroundColor(_:)(v47, v40, v42, v46, v44);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    swift_release(v47);
    v55 = v52 & 1;
    sub_10000585C(v40, v42, v46);
    swift_bridgeObjectRelease(v44);
    v56 = type metadata accessor for Font.Design(0);
    v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56);
    v91 = 1;
    v57(v9, 1, 1, v56);
    v58 = static Font.system(size:weight:design:)(0, 1, v9, 18.0);
    sub_10000594C((uint64_t)v9, &qword_100026488);
    v59 = v54;
    v60 = Text.font(_:)(v58, v48, v50, v55, v54);
    v93 = v61;
    v94 = v60;
    LOBYTE(v44) = v62;
    v92 = v63;
    swift_release(v58);
    v32 = v44 & 1;
    sub_10000585C(v48, v50, v55);
    swift_bridgeObjectRelease(v59);
    v33 = swift_getKeyPath(&unk_1000172F0);
    v35 = swift_getKeyPath(&unk_100017120);
    v90 = swift_getKeyPath(&unk_100017180);
    v64 = swift_getKeyPath(&unk_1000171B0);
    v88 = 0x3FDCCCCCCCCCCCCDLL;
    v89 = v64;
    v34 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_100003ED4@<X0>(uint64_t a1@<X8>)
{
  return sub_100003630(a1);
}

_QWORD *sub_100003F14@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W3>, _QWORD *a5@<X8>)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  char v52;

  v47 = a2;
  v9 = a4 & 1;
  v10 = sub_100005070(&qword_100026450);
  __chkstk_darwin(v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_100005070(&qword_100026458);
  v13 = __chkstk_darwin(v48);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v45 - v16;
  v18 = sub_100005070(&qword_100026460);
  v19 = __chkstk_darwin(v18);
  v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 0x100) != 0)
  {
    v22 = 5;
    if (a1 != 3)
    {
      v46 = a5;
      v23 = 256;
      goto LABEL_10;
    }
LABEL_8:
    sub_100005588(a3, v22, (uint64_t)&v49);
    v24 = v50;
    v25 = v52;
    v26 = v47;
    *(_QWORD *)v21 = v47;
    *((_QWORD *)v21 + 1) = a3;
    v21[16] = 0;
    *(_OWORD *)(v21 + 24) = v49;
    *((_QWORD *)v21 + 5) = v24;
    *((_OWORD *)v21 + 3) = v51;
    v21[64] = v25;
    swift_storeEnumTagMultiPayload(v21, v18, 0);
    v27 = sub_100005324();
    v28 = sub_100005368();
    swift_bridgeObjectRetain(v26);
    return _ConditionalContent<>.init(storage:)(a5, v21, &type metadata for CNContactGroupArrangedAvatars, v48, v27, v28);
  }
  if (v9)
    v22 = 6;
  else
    v22 = 7;
  if (a1 == 3)
    goto LABEL_8;
  v46 = a5;
  v23 = 0;
LABEL_10:
  *(_QWORD *)v12 = static HorizontalAlignment.center.getter(v19);
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 1;
  v30 = sub_100005070(&qword_100026468);
  v31 = sub_100004234(a1, v47, a3, v23 | (unsigned __int16)v9, v22, &v12[*(int *)(v30 + 44)]);
  v32 = static Edge.Set.bottom.getter(v31);
  v33 = -10.0;
  if (!v9)
    v33 = 20.0;
  if (a1 != 2)
    v33 = 5.0;
  v34 = EdgeInsets.init(_all:)(v33);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  sub_100005908((uint64_t)v12, (uint64_t)v15, &qword_100026450);
  v41 = v48;
  v42 = &v15[*(int *)(v48 + 36)];
  *v42 = v32;
  *((double *)v42 + 1) = v34;
  *((_QWORD *)v42 + 2) = v36;
  *((_QWORD *)v42 + 3) = v38;
  *((_QWORD *)v42 + 4) = v40;
  v42[40] = 0;
  sub_10000594C((uint64_t)v12, &qword_100026450);
  sub_100006240((uint64_t)v15, (uint64_t)v17, &qword_100026458);
  sub_100005908((uint64_t)v17, (uint64_t)v21, &qword_100026458);
  swift_storeEnumTagMultiPayload(v21, v18, 1);
  v43 = sub_100005324();
  v44 = sub_100005368();
  _ConditionalContent<>.init(storage:)(v46, v21, &type metadata for CNContactGroupArrangedAvatars, v41, v43, v44);
  return (_QWORD *)sub_10000594C((uint64_t)v17, &qword_100026458);
}

uint64_t sub_100004234@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  Swift::String v58;
  Swift::String v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t KeyPath;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _OWORD *v162;
  uint64_t v163;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  void (*v168)(char *, char *, uint64_t);
  unint64_t v169;
  void (*v170)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char *v185;
  char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  _OWORD *v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _OWORD v202[2];
  _OWORD v203[6];
  _OWORD v204[2];
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  _OWORD v211[2];
  _QWORD v212[5];
  char v213;
  uint64_t v214;
  char v215;
  uint64_t v216;
  char v217;
  __int128 v218;
  _OWORD v219[6];
  _OWORD v220[3];

  LODWORD(v184) = a1;
  v195 = a6;
  v10 = sub_100005070(&qword_100026488);
  __chkstk_darwin(v10);
  v192 = (char *)&v165 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Locale(0);
  __chkstk_darwin(v12);
  v186 = (char *)&v165 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v185 = (char *)&v165 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v165 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v191 = sub_100005070(&qword_100026490);
  v177 = *(_QWORD *)(v191 - 8);
  v19 = __chkstk_darwin(v191);
  v181 = (char *)&v165 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v176 = (char *)&v165 - v21;
  v190 = sub_100005070(&qword_100026498);
  v22 = __chkstk_darwin(v190);
  v180 = (char *)&v165 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v174 = (char *)&v165 - v24;
  v189 = sub_100005070(&qword_1000264A0);
  v25 = __chkstk_darwin(v189);
  v178 = (uint64_t)&v165 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v173 = (uint64_t)&v165 - v27;
  v188 = sub_100005070(&qword_1000264A8);
  v28 = __chkstk_darwin(v188);
  v183 = (uint64_t)&v165 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __chkstk_darwin(v28);
  v182 = (uint64_t)&v165 - v31;
  __chkstk_darwin(v30);
  v175 = (uint64_t)&v165 - v32;
  v172 = sub_100005070(&qword_1000264B0);
  v33 = __chkstk_darwin(v172);
  v179 = (uint64_t)&v165 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __chkstk_darwin(v33);
  v171 = (uint64_t)&v165 - v36;
  __chkstk_darwin(v35);
  v187 = (uint64_t)&v165 - v37;
  v38 = sub_100005070(&qword_1000264B8);
  v39 = __chkstk_darwin(v38);
  v194 = (uint64_t)&v165 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v39);
  v193 = (uint64_t)&v165 - v41;
  sub_100005588(a3, a5, (uint64_t)v212);
  v42 = v212[0];
  v43 = v212[1];
  v44 = v212[2];
  v45 = v212[3];
  v46 = v212[4];
  v47 = v213;
  if ((a4 & 0x100) != 0)
  {
    if ((unint64_t)a2 >> 62)
    {
      if (a2 < 0)
        v51 = a2;
      else
        v51 = a2 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a2);
      v52 = _CocoaArrayWrapper.endIndex.getter(v51);
      swift_bridgeObjectRelease(a2);
      if (v52)
        goto LABEL_4;
    }
    else if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      v48 = swift_bridgeObjectRetain(a2);
      v49 = static Alignment.center.getter(v48);
      _FrameLayout.init(width:height:alignment:)(&v214, 0x4075E00000000000, 0, 0, 1, v49, v50);
      *(_QWORD *)&v205 = a2;
      *((_QWORD *)&v205 + 1) = a3;
      LOBYTE(v206) = 0;
      *((_QWORD *)&v206 + 1) = v42;
      *(_QWORD *)&v207 = v43;
      *((_QWORD *)&v207 + 1) = v44;
      *(_QWORD *)&v208 = v45;
      *((_QWORD *)&v208 + 1) = v46;
      LOBYTE(v209) = v47;
      *((_QWORD *)&v209 + 1) = v214;
      LOBYTE(v210) = v215;
      *((_QWORD *)&v210 + 1) = v216;
      LOBYTE(v211[0]) = v217;
      *(_OWORD *)((char *)v211 + 8) = v218;
      sub_100005988((uint64_t)&v205);
      goto LABEL_10;
    }
  }
  v53 = swift_bridgeObjectRetain(a2);
  v54 = static Alignment.center.getter(v53);
  ((void (*)(_QWORD *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))_FrameLayout.init(width:height:alignment:))(&v214, 0, 1, (double)a5 * 45.0, 0, v54, v55);
  *(_QWORD *)&v205 = a2;
  *((_QWORD *)&v205 + 1) = a3;
  LOBYTE(v206) = 0;
  *((_QWORD *)&v206 + 1) = v42;
  *(_QWORD *)&v207 = v43;
  *((_QWORD *)&v207 + 1) = v44;
  *(_QWORD *)&v208 = v45;
  *((_QWORD *)&v208 + 1) = v46;
  LOBYTE(v209) = v47;
  *((_QWORD *)&v209 + 1) = v214;
  LOBYTE(v210) = v215;
  *((_QWORD *)&v210 + 1) = v216;
  LOBYTE(v211[0]) = v217;
  *(_OWORD *)((char *)v211 + 8) = v218;
  sub_100005734((uint64_t)&v205);
LABEL_10:
  sub_100006240((uint64_t)&v205, (uint64_t)v203, &qword_1000264C0);
  v56 = sub_100005070(&qword_1000264C8);
  v57 = sub_100005740();
  _ConditionalContent<>.init(storage:)(v219, v203, v56, v56, v57, v57);
  if (v184 == 1)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(26, 1);
    v58._countAndFlagsBits = 0xD00000000000001ALL;
    v58._object = (void *)0x8000000100017D70;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v58);
    *(_QWORD *)&v205 = a3;
    String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)(&v205, 1684827173, 0xE400000000000000, &type metadata for Int, &protocol witness table for Int);
    v59._countAndFlagsBits = 0;
    v59._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v59);
    v60 = v185;
    v61 = String.LocalizationValue.init(stringInterpolation:)(v18);
    v62 = v186;
    static Locale.current.getter(v61);
    *(_QWORD *)&v205 = String.init(localized:table:bundle:locale:comment:)(v60, 0, 0, 0, v62, 0, 0, 256);
    *((_QWORD *)&v205 + 1) = v63;
    v169 = sub_100005818();
    v64 = Text.init<A>(_:)(&v205, &type metadata for String, v169);
    v66 = v65;
    v68 = v67;
    v70 = v69 & 1;
    v184 = type metadata accessor for Font.Design(0);
    v170 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v184 - 8) + 56);
    v71 = (uint64_t)v192;
    v170(v192, 1, 1, v184);
    v72 = static Font.system(size:weight:design:)(0, 1, v71, 16.0);
    sub_10000594C(v71, &qword_100026488);
    v73 = Text.font(_:)(v72, v64, v66, v70, v68);
    v75 = v74;
    v77 = v76;
    v79 = v78;
    swift_release(v72);
    v80 = v77 & 1;
    sub_10000585C(v64, v66, v70);
    v81 = swift_bridgeObjectRelease(v68);
    v82 = static Font.Weight.semibold.getter(v81);
    v83 = Text.fontWeight(_:)(*(_QWORD *)&v82, 0, v73, v75, v80, v79);
    v85 = v84;
    v87 = v86;
    LOBYTE(v68) = v88 & 1;
    sub_10000585C(v73, v75, v80);
    swift_bridgeObjectRelease(v79);
    KeyPath = swift_getKeyPath(&unk_100017120);
    *(_QWORD *)&v205 = v83;
    *((_QWORD *)&v205 + 1) = v85;
    LOBYTE(v206) = v68;
    *((_QWORD *)&v206 + 1) = v87;
    *(_QWORD *)&v207 = KeyPath;
    BYTE8(v207) = 1;
    v90 = sub_100005070(&qword_1000264F0);
    v167 = v90;
    v166 = sub_100005874();
    v91 = v176;
    View.lineLimit(_:reservesSpace:)(1, 1, v90, v166);
    sub_10000585C(v83, v85, v68);
    swift_release(KeyPath);
    v92 = swift_bridgeObjectRelease(v87);
    v93 = static Font.callout.getter(v92);
    v94 = swift_getKeyPath(&unk_100017150);
    v95 = v177;
    v168 = *(void (**)(char *, char *, uint64_t))(v177 + 16);
    v96 = (uint64_t)v174;
    v97 = v191;
    v168(v174, v91, v191);
    v98 = (uint64_t *)(v96 + *(int *)(v190 + 36));
    *v98 = v94;
    v98[1] = v93;
    v177 = *(_QWORD *)(v95 + 8);
    ((void (*)(char *, uint64_t))v177)(v91, v97);
    v99 = swift_getKeyPath(&unk_100017180);
    v100 = v173;
    sub_100005908(v96, v173, &qword_100026498);
    v101 = v100 + *(int *)(v189 + 36);
    *(_QWORD *)v101 = v99;
    *(_BYTE *)(v101 + 8) = 1;
    sub_10000594C(v96, &qword_100026498);
    v102 = swift_getKeyPath(&unk_1000171B0);
    v103 = v175;
    sub_100005908(v100, v175, &qword_1000264A0);
    v104 = (uint64_t *)(v103 + *(int *)(v188 + 36));
    *v104 = v102;
    v104[1] = 0x3FDCCCCCCCCCCCCDLL;
    v105 = sub_10000594C(v100, &qword_1000264A0);
    LOBYTE(v102) = static Edge.Set.top.getter(v105);
    v106 = EdgeInsets.init(_all:)(10.0);
    v108 = v107;
    v110 = v109;
    v112 = v111;
    v113 = v171;
    sub_100005908(v103, v171, &qword_1000264A8);
    v114 = v113 + *(int *)(v172 + 36);
    *(_BYTE *)v114 = v102;
    *(double *)(v114 + 8) = v106;
    *(_QWORD *)(v114 + 16) = v108;
    *(_QWORD *)(v114 + 24) = v110;
    *(_QWORD *)(v114 + 32) = v112;
    *(_BYTE *)(v114 + 40) = 0;
    sub_10000594C(v103, &qword_1000264A8);
    sub_100006240(v113, v187, &qword_1000264B0);
    v115 = v185;
    v116 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x8000000100017D90);
    v117 = v186;
    static Locale.current.getter(v116);
    *(_QWORD *)&v205 = String.init(localized:table:bundle:locale:comment:)(v115, 0, 0, 0, v117, 0, 0, 256);
    *((_QWORD *)&v205 + 1) = v118;
    v119 = Text.init<A>(_:)(&v205, &type metadata for String, v169);
    v121 = v120;
    v123 = v122;
    v125 = v124 & 1;
    v126 = static Color.gray.getter();
    v127 = Text.foregroundColor(_:)(v126, v119, v121, v125, v123);
    v129 = v128;
    LOBYTE(v113) = v130;
    v132 = v131;
    swift_release(v126);
    LOBYTE(v113) = v113 & 1;
    sub_10000585C(v119, v121, v125);
    swift_bridgeObjectRelease(v123);
    v133 = swift_getKeyPath(&unk_100017120);
    *(_QWORD *)&v205 = v127;
    *((_QWORD *)&v205 + 1) = v129;
    LOBYTE(v206) = v113;
    *((_QWORD *)&v206 + 1) = v132;
    *(_QWORD *)&v207 = v133;
    BYTE8(v207) = 1;
    v134 = v181;
    View.lineLimit(_:reservesSpace:)(2, 1, v167, v166);
    sub_10000585C(v127, v129, v113);
    swift_release(v133);
    swift_bridgeObjectRelease(v132);
    v135 = (uint64_t)v192;
    v170(v192, 1, 1, v184);
    v136 = static Font.system(size:weight:design:)(0, 1, v135, 13.0);
    sub_10000594C(v135, &qword_100026488);
    v137 = swift_getKeyPath(&unk_100017150);
    v138 = (uint64_t)v180;
    v139 = v191;
    v168(v180, v134, v191);
    v140 = (uint64_t *)(v138 + *(int *)(v190 + 36));
    *v140 = v137;
    v140[1] = v136;
    ((void (*)(char *, uint64_t))v177)(v134, v139);
    v141 = swift_getKeyPath(&unk_100017180);
    v142 = v178;
    sub_100005908(v138, v178, &qword_100026498);
    v143 = v142 + *(int *)(v189 + 36);
    *(_QWORD *)v143 = v141;
    *(_BYTE *)(v143 + 8) = 1;
    sub_10000594C(v138, &qword_100026498);
    v144 = swift_getKeyPath(&unk_1000171B0);
    v145 = v183;
    sub_100005908(v142, v183, &qword_1000264A0);
    v146 = (uint64_t *)(v145 + *(int *)(v188 + 36));
    *v146 = v144;
    v146[1] = 0x3FDCCCCCCCCCCCCDLL;
    sub_10000594C(v142, &qword_1000264A0);
    v147 = v182;
    sub_100006240(v145, v182, &qword_1000264A8);
    v148 = v187;
    v149 = v179;
    sub_100005908(v187, v179, &qword_1000264B0);
    sub_100005908(v147, v145, &qword_1000264A8);
    v150 = v194;
    sub_100005908(v149, v194, &qword_1000264B0);
    v151 = sub_100005070(&qword_100026510);
    sub_100005908(v145, v150 + *(int *)(v151 + 48), &qword_1000264A8);
    sub_10000594C(v147, &qword_1000264A8);
    sub_10000594C(v148, &qword_1000264B0);
    sub_10000594C(v145, &qword_1000264A8);
    sub_10000594C(v149, &qword_1000264B0);
    v152 = sub_100005070(&qword_1000264D8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v152 - 8) + 56))(v150, 0, 1, v152);
    v153 = v193;
    sub_100006240(v150, v193, &qword_1000264B8);
  }
  else
  {
    v154 = sub_100005070(&qword_1000264D8);
    v153 = v193;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v154 - 8) + 56))(v193, 1, 1, v154);
    v150 = v194;
  }
  v200 = v219[4];
  v201 = v219[5];
  v202[0] = v220[0];
  *(_OWORD *)((char *)v202 + 9) = *(_OWORD *)((char *)v220 + 9);
  v196 = v219[0];
  v197 = v219[1];
  v198 = v219[2];
  v199 = v219[3];
  sub_100005908(v153, v150, &qword_1000264B8);
  v155 = v200;
  v156 = v201;
  v203[4] = v200;
  v203[5] = v201;
  v157 = v202[0];
  v204[0] = v202[0];
  *(_OWORD *)((char *)v204 + 9) = *(_OWORD *)((char *)v202 + 9);
  v158 = v196;
  v159 = v197;
  v203[0] = v196;
  v203[1] = v197;
  v160 = v198;
  v161 = v199;
  v203[2] = v198;
  v203[3] = v199;
  v162 = v195;
  *(_OWORD *)((char *)v195 + 105) = *(_OWORD *)((char *)v202 + 9);
  v162[5] = v156;
  v162[6] = v157;
  v162[3] = v161;
  v162[4] = v155;
  v162[1] = v159;
  v162[2] = v160;
  *v162 = v158;
  v163 = sub_100005070(&qword_1000264E0);
  sub_100005908(v150, (uint64_t)v162 + *(int *)(v163 + 48), &qword_1000264B8);
  sub_1000057B0((uint64_t)v203, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))j__swift_bridgeObjectRetain);
  sub_10000594C(v153, &qword_1000264B8);
  sub_10000594C(v150, &qword_1000264B8);
  v209 = v200;
  v210 = v201;
  v211[0] = v202[0];
  *(_OWORD *)((char *)v211 + 9) = *(_OWORD *)((char *)v202 + 9);
  v205 = v196;
  v206 = v197;
  v207 = v198;
  v208 = v199;
  return sub_1000057B0((uint64_t)&v205, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))j__swift_bridgeObjectRelease);
}

_QWORD *sub_10000504C@<X0>(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  __int16 v2;

  if (v1[25])
    v2 = 256;
  else
    v2 = 0;
  return sub_100003F14(*v1, *((_QWORD *)v1 + 1), *((_QWORD *)v1 + 2), v2 | v1[24], a1);
}

uint64_t sub_100005070(uint64_t *a1)
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

uint64_t sub_1000050B0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000050C0(void *a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_100002CC0(a1, a2, *(_QWORD **)(v2 + 16), *(uint64_t **)(v2 + 24));
}

uint64_t sub_1000050C8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000050D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000050F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005108(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100005110(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100005128(uint64_t a1, uint64_t *a2)
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

uint64_t destroy for CNContactGroupVisualizer(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

uint64_t initializeWithCopy for CNContactGroupVisualizer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CNContactGroupVisualizer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  return a1;
}

__n128 initializeWithTake for CNContactGroupVisualizer(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CNContactGroupVisualizer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for CNContactGroupVisualizer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 26))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNContactGroupVisualizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 26) = 1;
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
    *(_BYTE *)(result + 26) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CNContactGroupVisualizer()
{
  return &type metadata for CNContactGroupVisualizer;
}

uint64_t sub_100005314(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000188F0, 1);
}

unint64_t sub_100005324()
{
  unint64_t result;

  result = qword_100026470;
  if (!qword_100026470)
  {
    result = swift_getWitnessTable(&unk_10001727C, &type metadata for CNContactGroupArrangedAvatars);
    atomic_store(result, (unint64_t *)&qword_100026470);
  }
  return result;
}

unint64_t sub_100005368()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026478;
  if (!qword_100026478)
  {
    v1 = sub_1000053EC(&qword_100026458);
    sub_100006878(&qword_100026480, &qword_100026450, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026478);
  }
  return result;
}

uint64_t sub_1000053EC(uint64_t *a1)
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

uint64_t sub_100005430@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100005458(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

void sub_100005480(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  Class isa;
  uint64_t v11;

  v3 = sub_100005070(&qword_1000265C8);
  UIViewRepresentableContext.coordinator.getter(&v11, v3);
  v4 = v11;
  v5 = *(id *)(v11 + 16);
  swift_release(v4);
  v6 = sub_100005070(&qword_1000263E0);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100017030;
  if (a2)
    v8 = a2;
  else
    v8 = objc_msgSend((id)objc_opt_self(CNContact), "emptyContact");
  *(_QWORD *)(v7 + 32) = v8;
  specialized Array._endMutation()(v8);
  sub_1000060D0();
  v9 = a2;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v5, "setContacts:", isa);

}

uint64_t sub_100005588@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v3 = 9 * a2;
  if ((unsigned __int128)(a2 * (__int128)9) >> 64 != (9 * a2) >> 63)
  {
    __break(1u);
    return result;
  }
  if ((unint64_t)(result - 1) < 6)
  {
    v4 = 8 * (result - 1);
    a2 = *(_QWORD *)((char *)&unk_100017488 + v4);
    v5 = *(_QWORD *)((char *)&unk_1000174B8 + v4);
    goto LABEL_32;
  }
  if ((unint64_t)(result - 10) > 0xFFFFFFFFFFFFFFFCLL)
  {
LABEL_17:
    a2 = 3;
    v5 = 3;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 13) > 0xFFFFFFFFFFFFFFFCLL)
  {
    v5 = 4;
    a2 = 3;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 17) > 0xFFFFFFFFFFFFFFFBLL)
  {
    a2 = 4;
    v5 = 4;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 21) > 0xFFFFFFFFFFFFFFFBLL)
  {
    v5 = 5;
    a2 = 4;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 26) > 0xFFFFFFFFFFFFFFFALL)
  {
    a2 = 5;
    v5 = 5;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 31) > 0xFFFFFFFFFFFFFFFALL)
  {
    v5 = 6;
    a2 = 5;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 37) > 0xFFFFFFFFFFFFFFF9)
  {
    a2 = 6;
    v5 = 6;
    goto LABEL_32;
  }
  if ((unint64_t)(result - 43) > 0xFFFFFFFFFFFFFFF9)
  {
    v5 = 7;
    a2 = 6;
    goto LABEL_32;
  }
  if (a2 > 6)
  {
    v6 = 9;
    v7 = 8;
    if ((unint64_t)result > 0x38)
      v7 = 9;
    if (result >= 50)
      v6 = v7;
    a2 = 7;
    if ((unint64_t)(result - 50) <= 0xFFFFFFFFFFFFFFF8)
      v5 = v6;
    else
      v5 = 7;
    goto LABEL_32;
  }
  v5 = 8;
  if ((unint64_t)(result - 49) < 0xFFFFFFFFFFFFFFFALL)
    v5 = 9;
  if (!a2)
  {
    __break(1u);
    goto LABEL_17;
  }
LABEL_32:
  v8 = v3 < result;
  v9 = 0xE0u / v5;
  if (v9 >= 224 / a2)
    v9 = 224 / a2;
  if (v9 <= 28)
    v9 = 28;
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = v5;
  *(_QWORD *)(a3 + 16) = result;
  *(double *)(a3 + 24) = (double)v9;
  *(double *)(a3 + 32) = (double)v9 * 0.01;
  *(_BYTE *)(a3 + 40) = v8;
  return result;
}

uint64_t sub_100005734(uint64_t result)
{
  *(_BYTE *)(result + 120) = 1;
  return result;
}

unint64_t sub_100005740()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000264D0;
  if (!qword_1000264D0)
  {
    v1 = sub_1000053EC(&qword_1000264C8);
    sub_100005324();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000264D0);
  }
  return result;
}

uint64_t sub_1000057B0(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 120);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v4);
  return a1;
}

unint64_t sub_100005818()
{
  unint64_t result;

  result = qword_1000264E8;
  if (!qword_1000264E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000264E8);
  }
  return result;
}

uint64_t sub_10000585C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_100005874()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000264F8;
  if (!qword_1000264F8)
  {
    v1 = sub_1000053EC(&qword_1000264F0);
    sub_100006878(&qword_100026500, &qword_100026508, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000264F8);
  }
  return result;
}

uint64_t sub_100005908(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005070(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000594C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005070(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100005988(uint64_t result)
{
  *(_BYTE *)(result + 120) = 0;
  return result;
}

uint64_t destroy for CNContactGroupArrangedAvatars(_QWORD *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t initializeWithCopy for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 49) = *(_OWORD *)(a2 + 49);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for CNContactGroupArrangedAvatars(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  *((_BYTE *)a1 + 64) = *((_BYTE *)a2 + 64);
  return a1;
}

__n128 initializeWithTake for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
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

uint64_t *assignWithTake for CNContactGroupArrangedAvatars(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  a1[5] = a2[5];
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  *((_BYTE *)a1 + 64) = *((_BYTE *)a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for CNContactGroupArrangedAvatars(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNContactGroupArrangedAvatars(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CNContactGroupArrangedAvatars()
{
  return &type metadata for CNContactGroupArrangedAvatars;
}

_BYTE *initializeBufferWithCopyOfBuffer for GroupVisualizerType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GroupVisualizerType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GroupVisualizerType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100005C88 + 4 * byte_100017045[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100005CBC + 4 * byte_100017040[v4]))();
}

uint64_t sub_100005CBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005CC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100005CCCLL);
  return result;
}

uint64_t sub_100005CD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100005CE0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100005CE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005CEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005CF8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100005D04(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GroupVisualizerType()
{
  return &type metadata for GroupVisualizerType;
}

unint64_t sub_100005D20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026518;
  if (!qword_100026518)
  {
    v1 = sub_1000053EC(&qword_100026520);
    sub_100005324();
    sub_100005368();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026518);
  }
  return result;
}

unint64_t sub_100005D90()
{
  unint64_t result;

  result = qword_100026528;
  if (!qword_100026528)
  {
    result = swift_getWitnessTable(&unk_100017254, &type metadata for GroupVisualizerType);
    atomic_store(result, (unint64_t *)&qword_100026528);
  }
  return result;
}

uint64_t sub_100005DD4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100018960, 1);
}

uint64_t sub_100005DE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000391C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_100005DEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026548;
  if (!qword_100026548)
  {
    v1 = sub_1000053EC(&qword_100026540);
    sub_100006878(&qword_100026550, &qword_100026558, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100026548);
  }
  return result;
}

uint64_t sub_100005E68(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  Swift::Int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = result;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  if (v2 < 0)
    v15 = v2;
  else
    v15 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v2);
  v5 = _CocoaArrayWrapper.endIndex.getter(v15);
  result = swift_bridgeObjectRelease(v2);
LABEL_4:
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  if (v5 < 0)
    v6 = v3;
  if (v3)
    v7 = v6;
  else
    v7 = 0;
  if (v4)
  {
    if (v2 < 0)
      v9 = v2;
    else
      v9 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v10 = _CocoaArrayWrapper.endIndex.getter(v9);
    result = swift_bridgeObjectRelease(v2);
    if (v10 < 0)
      goto LABEL_37;
    swift_bridgeObjectRetain(v2);
    v8 = _CocoaArrayWrapper.endIndex.getter(v9);
    result = swift_bridgeObjectRelease(v2);
  }
  else
  {
    v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
LABEL_37:
    __break(1u);
    return result;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_1000060D0();
    v11 = 0;
    do
    {
      v12 = v11 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v11);
      v11 = v12;
    }
    while (v7 != v12);
  }
  if (v4)
  {
    if (v2 < 0)
      v14 = v2;
    else
      v14 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v13 = _CocoaArrayWrapper.subscript.getter(0, v7, v14);
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v13 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
  }
  return v13;
}

_QWORD *sub_100006000(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_100006028(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

uint64_t sub_100006050()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 81, 7);
}

id sub_100006074@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;
  char v4;

  v3 = *a1;
  v4 = *(_BYTE *)(v2 + 32);
  *(_QWORD *)a2 = v3;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 64);
  *(_BYTE *)(a2 + 24) = v4;
  return v3;
}

uint64_t sub_100006090(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_1000060D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026580;
  if (!qword_100026580)
  {
    v1 = objc_opt_self(CNContact);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100026580);
  }
  return result;
}

unint64_t sub_10000610C()
{
  unint64_t result;

  result = qword_100026588;
  if (!qword_100026588)
  {
    result = swift_getWitnessTable(&unk_100017350, &type metadata for AvatarView);
    atomic_store(result, (unint64_t *)&qword_100026588);
  }
  return result;
}

uint64_t sub_100006150(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a4)
  {
    sub_1000061C0(result, a2, a3 & 1);
    swift_bridgeObjectRetain(a4);
    swift_retain(a5);
    swift_retain(a8);
    swift_retain(a10);
    return swift_retain(a12);
  }
  return result;
}

uint64_t sub_1000061C0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_1000061D0(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a4)
  {
    sub_10000585C(result, a2, a3 & 1);
    swift_release(a12);
    swift_release(a10);
    swift_release(a8);
    swift_release(a5);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_100006240(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005070(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006284(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  uint64_t v12;

  v2 = objc_msgSend(objc_allocWithZone((Class)NSNumberFormatter), "init");
  objc_msgSend(v2, "setNumberStyle:", 1);
  v3 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", a1);
  v4 = objc_msgSend(v2, "stringFromNumber:", v3);

  if (!v4)
  {
    v5 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v7 = v9;
    if (a1 <= 999)
      goto LABEL_3;
LABEL_5:
    v8 = 2603;
    goto LABEL_6;
  }
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v7 = v6;

  if (a1 > 999)
    goto LABEL_5;
LABEL_3:
  v8 = 43;
LABEL_6:
  v12 = v8;
  v10._countAndFlagsBits = v5;
  v10._object = v7;
  String.append(_:)(v10);

  swift_bridgeObjectRelease(v7);
  return v12;
}

uint64_t initializeBufferWithCopyOfBuffer for AvatarView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t initializeWithCopy for AvatarView(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for AvatarView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for AvatarView(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AvatarView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarView()
{
  return &type metadata for AvatarView;
}

__n128 initializeWithCopy for AvatarArrangementConfiguration(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AvatarArrangementConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarArrangementConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarArrangementConfiguration()
{
  return &type metadata for AvatarArrangementConfiguration;
}

uint64_t sub_100006634()
{
  return sub_100006878(&qword_100026598, &qword_100026530, (uint64_t)&protocol conformance descriptor for LazyVGrid<A>);
}

uint64_t sub_100006660(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100018988, 1);
}

id sub_100006670(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

void sub_100006680(id a1)
{
  if (a1 != (id)1)

}

void **initializeBufferWithCopyOfBuffer for ContactAvatarView(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for ContactAvatarView(id *a1)
{

}

void **assignWithCopy for ContactAvatarView(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *initializeWithTake for ContactAvatarView(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for ContactAvatarView(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ContactAvatarView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactAvatarView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactAvatarView()
{
  return &type metadata for ContactAvatarView;
}

unint64_t sub_1000067F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000265A0;
  if (!qword_1000265A0)
  {
    v1 = sub_1000053EC(&qword_1000265A8);
    sub_100006878(&qword_1000265B0, &qword_1000265B8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000265A0);
  }
  return result;
}

uint64_t sub_100006878(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000053EC(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1000068B8()
{
  return &protocol witness table for Never;
}

unint64_t sub_1000068C8()
{
  unint64_t result;

  result = qword_1000265C0;
  if (!qword_1000265C0)
  {
    result = swift_getWitnessTable(&unk_1000173A0, &type metadata for ContactAvatarView);
    atomic_store(result, (unint64_t *)&qword_1000265C0);
  }
  return result;
}

unint64_t sub_10000690C()
{
  unint64_t result;

  result = qword_1000265D0;
  if (!qword_1000265D0)
  {
    result = swift_getWitnessTable(&unk_1000173F0, &type metadata for ContactAvatarView);
    atomic_store(result, (unint64_t *)&qword_1000265D0);
  }
  return result;
}

uint64_t sub_100006960()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100017678);
  v2 = swift_getKeyPath(&unk_1000176A0);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_1000069D0()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100017630);
  v2 = swift_getKeyPath(&unk_100017658);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100006A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[14] = a4;
  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v4[15] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[16] = v6;
  v4[17] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v4[18] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[19] = v8;
  v4[20] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100006AC8, 0, 0);
}

uint64_t sub_100006AC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;

  if (qword_100026330 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_100005110(v1, (uint64_t)qword_100027D10);
  *(_QWORD *)(v0 + 168) = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter(v3);
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Loading Onboarding avatars", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = (_QWORD *)swift_task_alloc(dword_1000263DC);
  *(_QWORD *)(v0 + 176) = v6;
  *v6 = v0;
  v6[1] = sub_100006BC4;
  return sub_1000026B8();
}

uint64_t sub_100006BC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 176);
  *(_QWORD *)(*v2 + 184) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100006E2C;
  }
  else
  {
    *(_QWORD *)(v4 + 192) = a1;
    v6 = sub_100006C38;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100006C38()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = v0[24];
  v2 = v0[20];
  v3 = v0[17];
  v17 = v0[19];
  v18 = v0[18];
  v4 = v0[15];
  v16 = v0[16];
  v5 = v0[14];
  sub_100010918();
  v15 = (void *)static OS_dispatch_queue.main.getter();
  v6 = swift_allocObject(&unk_100021638, 24, 7);
  swift_weakInit(v6 + 16, v5);
  v7 = swift_allocObject(&unk_100021660, 32, 7);
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v1;
  v0[6] = sub_1000109A4;
  v0[7] = v7;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_100007140;
  v0[5] = &unk_100021678;
  v8 = _Block_copy(v0 + 2);
  v9 = swift_retain(v6);
  static DispatchQoS.unspecified.getter(v9);
  v0[13] = &_swiftEmptyArrayStorage;
  v10 = sub_100011678(&qword_100026A88, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v11 = sub_100005070(&qword_100026A90);
  v12 = sub_100006878(&qword_100026A98, &qword_100026A90, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 13, v11, v12, v4, v10);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v2, v3, v8);
  _Block_release(v8);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v18);
  swift_release(v0[7]);
  swift_release(v6);
  v13 = v0[17];
  swift_task_dealloc(v0[20]);
  swift_task_dealloc(v13);
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_100006E2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 184);
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter(v3);
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 184);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v14 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue(v5, v0 + 88, v0 + 64);
    v8 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
    v10 = v9;
    *(_QWORD *)(v0 + 96) = sub_100015810(v8, v9, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v10);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Loading Onboarding Visualization failed: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    swift_errorRelease(v5);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 184);
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    swift_errorRelease(v11);

  }
  v12 = *(_QWORD *)(v0 + 136);
  swift_task_dealloc(*(_QWORD *)(v0 + 160));
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _BYTE v14[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v14, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    KeyPath = swift_getKeyPath(&unk_100017678);
    v7 = swift_getKeyPath(&unk_1000176A0);
    v13 = a2;
    swift_bridgeObjectRetain(a2);
    swift_retain(v5);
    static Published.subscript.setter(&v13, v5, KeyPath, v7);
    if (qword_100026330 != -1)
      swift_once(&qword_100026330, sub_100016010);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_100005110(v8, (uint64_t)qword_100027D10);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter(v10);
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Finished loading Onboarding avatars", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    return swift_release(v5);
  }
  return result;
}

uint64_t sub_100007140(uint64_t a1)
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

uint64_t sub_10000716C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_10000594C(a1, &qword_100026A58);
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
  v17 = swift_allocObject(&unk_100021610, 32, 7);
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
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100026A78, v17);
}

uint64_t sub_1000072B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC23LimitedAccessPromptView22ContactStoreVisualizer__allContacts;
  v2 = sub_100005070(&qword_1000269B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC23LimitedAccessPromptView22ContactStoreVisualizer__allContactsCount;
  v4 = sub_100005070(&qword_1000269C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100007338()
{
  return type metadata accessor for ContactStoreVisualizer(0);
}

uint64_t type metadata accessor for ContactStoreVisualizer(uint64_t a1)
{
  uint64_t result;

  result = qword_100026798;
  if (!qword_100026798)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContactStoreVisualizer);
  return result;
}

void sub_10000737C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[2];

  sub_100007404(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000745C();
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      swift_updateClassMetadata2(a1, 256, 2, v6, a1 + 80);
    }
  }
}

void sub_100007404(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000267A8)
  {
    v2 = sub_1000053EC((uint64_t *)&unk_100027030);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000267A8);
  }
}

void sub_10000745C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1000267B0)
  {
    v0 = type metadata accessor for Published(0, &type metadata for Int);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1000267B0);
  }
}

uint64_t sub_1000074B0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for ContactStoreVisualizer(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000074EC()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  sub_10000758C(v0[4], v0[5]);
  sub_10000758C(v0[6], v0[7]);
  sub_10000758C(v0[8], v0[9]);
  return swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for ContactsLimitedAccessPromptViewObservable()
{
  return objc_opt_self(_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewObservable);
}

void *sub_100007548()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100007554@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000758C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

BOOL sub_10000759C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1000075B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  ValueMetadata *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t OpaqueTypeConformance2;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (**v33)();
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  ValueMetadata *v40;
  unint64_t v41;
  unsigned __int8 v42;

  v2 = v1;
  v38 = a1;
  v35 = sub_100005070(&qword_100026A18);
  __chkstk_darwin(v35);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005070(&qword_100026A20);
  v36 = *(_QWORD *)(v5 - 8);
  v37 = v5;
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v4 = static HorizontalAlignment.center.getter(v6);
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v9 = sub_100005070(&qword_100026A28);
  sub_1000078B8(v1, &v4[*(int *)(v9 + 44)]);
  v39 = *(_OWORD *)(v1 + 48);
  v10 = sub_100005070(&qword_100026A30);
  State.projectedValue.getter(&v40, v10);
  v11 = v40;
  v12 = v41;
  v13 = v42;
  v14 = swift_allocObject(&unk_100021570, 129, 7);
  v15 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v14 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v14 + 96) = v15;
  *(_OWORD *)(v14 + 112) = *(_OWORD *)(v2 + 96);
  *(_BYTE *)(v14 + 128) = *(_BYTE *)(v2 + 112);
  v16 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v14 + 32) = v16;
  v17 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v14 + 64) = v17;
  v18 = swift_allocObject(&unk_100021598, 129, 7);
  v19 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v18 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v18 + 96) = v19;
  *(_OWORD *)(v18 + 112) = *(_OWORD *)(v2 + 96);
  *(_BYTE *)(v18 + 128) = *(_BYTE *)(v2 + 112);
  v20 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v18 + 32) = v20;
  v21 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v18 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v18 + 64) = v21;
  sub_1000106C8((_QWORD *)v2);
  sub_1000106C8((_QWORD *)v2);
  v22 = sub_100005070(&qword_100026A38);
  v23 = sub_100006878(&qword_100026A40, &qword_100026A18, (uint64_t)&protocol conformance descriptor for VStack<A>);
  v24 = sub_100010754();
  v40 = &type metadata for LimitedAccessContactPickerView;
  v41 = v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v40, &opaque type descriptor for <<opaque return type of View.presentationDetents(_:)>>, 1);
  View.sheet<A>(isPresented:onDismiss:content:)(v11, v12, v13, sub_100010674, v14, sub_1000106C0, v18, v35, v22, v23, OpaqueTypeConformance2);
  swift_release(v12);
  swift_release(v14);
  swift_release(v18);
  swift_release(v11);
  sub_10000594C((uint64_t)v4, &qword_100026A18);
  v26 = swift_allocObject(&unk_1000215C0, 129, 7);
  v27 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v26 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v26 + 96) = v27;
  *(_OWORD *)(v26 + 112) = *(_OWORD *)(v2 + 96);
  *(_BYTE *)(v26 + 128) = *(_BYTE *)(v2 + 112);
  v28 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v26 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v26 + 32) = v28;
  v29 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v26 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v26 + 64) = v29;
  v31 = v36;
  v30 = v37;
  v32 = v38;
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v38, v8, v37);
  v33 = (uint64_t (**)())(v32 + *(int *)(sub_100005070(&qword_100026A50) + 36));
  *v33 = sub_10001079C;
  v33[1] = (uint64_t (*)())v26;
  v33[2] = 0;
  v33[3] = 0;
  sub_1000106C8((_QWORD *)v2);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v8, v30);
}

uint64_t sub_1000078B8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t OpaqueTypeConformance2;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
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
  _OWORD *v42;
  uint64_t v43;
  __int128 v44;
  int v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v56 = a2;
  v57 = sub_100005070(&qword_100026AD0);
  v53 = *(_QWORD *)(v57 - 8);
  __chkstk_darwin(v57);
  v52 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_100005070(&qword_100026AD8);
  __chkstk_darwin(v54);
  v55 = (uint64_t)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005070(&qword_100026AE0);
  __chkstk_darwin(v5);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Material(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100005070(&qword_100026AE8);
  __chkstk_darwin(v12);
  v14 = (uint64_t *)((char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v58 = sub_100005070(&qword_100026AF0);
  __chkstk_darwin(v58);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = *(_OWORD *)(a1 + 32);
  v17 = sub_100005070(&qword_100026AC8);
  v18 = State.wrappedValue.getter(&v59, v17);
  if ((v59 & 1) != 0)
  {
    __chkstk_darwin(v18);
    *(&v52 - 2) = (char *)a1;
    v19 = sub_100005070(&qword_100026AF8);
    v20 = sub_1000053EC(&qword_100026B00);
    v21 = sub_1000053EC(&qword_100026B08);
    v22 = sub_100006878(&qword_100026B10, &qword_100026B00, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v23 = sub_100006878(&qword_100026B18, &qword_100026B08, (uint64_t)&protocol conformance descriptor for TupleToolbarContent<A>);
    *(_QWORD *)&v60 = v20;
    *((_QWORD *)&v60 + 1) = v21;
    *(_QWORD *)&v61 = v22;
    *((_QWORD *)&v61 + 1) = v23;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v60, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
    v25 = (uint64_t)v52;
    NavigationStack.init<>(root:)(sub_1000109DC, &v52 - 4, v19, OpaqueTypeConformance2);
    v26 = v53;
    v27 = v55;
    v28 = v57;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v55, v25, v57);
    swift_storeEnumTagMultiPayload(v27, v54, 1);
    v29 = sub_1000109E4();
    v30 = sub_100006878(&qword_100026B48, &qword_100026AD0, (uint64_t)&protocol conformance descriptor for NavigationStack<A, B>);
    _ConditionalContent<>.init(storage:)(v56, v27, v58, v28, v29, v30);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v25, v28);
  }
  else
  {
    *(_QWORD *)v16 = static HorizontalAlignment.center.getter(v18);
    *((_QWORD *)v16 + 1) = 0;
    v16[16] = 1;
    v32 = sub_100005070(&qword_100026B50);
    v33 = sub_100007DD8(a1, &v16[*(int *)(v32 + 44)]);
    v34 = static HorizontalAlignment.center.getter(v33);
    v52 = &v16[*(int *)(v58 + 36)];
    v53 = v34;
    v35 = static Color.clear.getter(v34);
    v36 = static Material.thin.getter(v35);
    v37 = static Edge.Set.all.getter(v36);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
    v7[*(int *)(v5 + 36)] = v37;
    sub_100005908((uint64_t)v7, (uint64_t)v14 + *(int *)(v12 + 36), &qword_100026AE0);
    *v14 = v35;
    swift_retain(v35);
    sub_10000594C((uint64_t)v7, &qword_100026AE0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v38 = swift_release(v35);
    v39 = static Alignment.center.getter(v38);
    _FrameLayout.init(width:height:alignment:)(&v60, 0, 1, 0, 0, v39, v40);
    v41 = (uint64_t)v52;
    sub_100005908((uint64_t)v14, (uint64_t)v52, &qword_100026AE8);
    v42 = (_OWORD *)(v41 + *(int *)(sub_100005070(&qword_100026B58) + 36));
    v43 = v41;
    v44 = v61;
    *v42 = v60;
    v42[1] = v44;
    v42[2] = v62;
    sub_10000594C((uint64_t)v14, &qword_100026AE8);
    v45 = VerticalEdge.rawValue.getter(0);
    v46 = Edge.init(rawValue:)((2 * v45));
    v47 = static SafeAreaRegions.container.getter();
    v48 = v43 + *(int *)(sub_100005070(&qword_100026B40) + 36);
    *(_QWORD *)v48 = v47;
    *(_QWORD *)(v48 + 8) = 0;
    *(_BYTE *)(v48 + 16) = 0;
    *(_BYTE *)(v48 + 17) = v46;
    *(_QWORD *)(v48 + 24) = v53;
    v49 = v55;
    sub_100005908((uint64_t)v16, v55, &qword_100026AF0);
    swift_storeEnumTagMultiPayload(v49, v54, 0);
    v50 = sub_1000109E4();
    v51 = sub_100006878(&qword_100026B48, &qword_100026AD0, (uint64_t)&protocol conformance descriptor for NavigationStack<A, B>);
    _ConditionalContent<>.init(storage:)(v56, v49, v58, v57, v50, v51);
    return sub_10000594C((uint64_t)v16, &qword_100026AF0);
  }
}

uint64_t sub_100007DD8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  id v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  uint64_t v45;
  double v46;
  char v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char v61[16];
  uint64_t v62;
  CGRect v63;
  CGRect v64;

  v60 = a2;
  v3 = sub_100005070(&qword_100026B60);
  __chkstk_darwin(v3);
  v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_100005070(&qword_100026B68);
  v6 = __chkstk_darwin(v58);
  v59 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v57 - v9;
  __chkstk_darwin(v8);
  v12 = (char *)&v57 - v11;
  v13 = sub_100005070(&qword_100026B70);
  v57 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v57 - v18;
  v20 = static Axis.Set.vertical.getter(v17);
  v62 = a1;
  v21 = sub_100005070(&qword_100026B78);
  v22 = sub_100006878(&qword_100026B80, &qword_100026B78, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v23 = ScrollView.init(_:showsIndicators:content:)(v20, 1, sub_100010A80, v61, v21, v22);
  *(_QWORD *)v5 = static HorizontalAlignment.center.getter(v23);
  *((_QWORD *)v5 + 1) = 0x4014000000000000;
  v5[16] = 0;
  v24 = sub_100005070(&qword_100026B88);
  sub_10000A160(a1, (uint64_t)&v5[*(int *)(v24 + 44)]);
  v25 = (void *)objc_opt_self(UIScreen);
  v26 = objc_msgSend(v25, "mainScreen");
  objc_msgSend(v26, "bounds");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v63.origin.x = v28;
  v63.origin.y = v30;
  v63.size.width = v32;
  v63.size.height = v34;
  if (CGRectGetHeight(v63) > 750.0)
    v35 = 10.0;
  else
    v35 = 0.0;
  v36 = objc_msgSend(v25, "mainScreen");
  objc_msgSend(v36, "bounds");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;

  v64.origin.x = v38;
  v64.origin.y = v40;
  v64.size.width = v42;
  v64.size.height = v44;
  if (CGRectGetHeight(v64) > 750.0)
    v46 = 10.0;
  else
    v46 = 0.0;
  v47 = static Edge.Set.all.getter(v45);
  sub_100005908((uint64_t)v5, (uint64_t)v10, &qword_100026B60);
  v48 = &v10[*(int *)(v58 + 36)];
  *v48 = v47;
  *((double *)v48 + 1) = v35;
  *((_QWORD *)v48 + 2) = 0x4039000000000000;
  *((double *)v48 + 3) = v46;
  *((_QWORD *)v48 + 4) = 0x4039000000000000;
  v48[40] = 0;
  sub_10000594C((uint64_t)v5, &qword_100026B60);
  sub_100006240((uint64_t)v10, (uint64_t)v12, &qword_100026B68);
  v49 = v57;
  v50 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  v50(v16, v19, v13);
  v51 = v59;
  sub_100005908((uint64_t)v12, v59, &qword_100026B68);
  v52 = v60;
  v50(v60, v16, v13);
  v53 = sub_100005070(&qword_100026B90);
  v54 = &v52[*(int *)(v53 + 48)];
  *(_QWORD *)v54 = 0;
  v54[8] = 1;
  sub_100005908(v51, (uint64_t)&v52[*(int *)(v53 + 64)], &qword_100026B68);
  sub_10000594C((uint64_t)v12, &qword_100026B68);
  v55 = *(void (**)(char *, uint64_t))(v49 + 8);
  v55(v19, v13);
  sub_10000594C(v51, &qword_100026B68);
  return ((uint64_t (*)(char *, uint64_t))v55)(v16, v13);
}

uint64_t sub_1000081B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  char *v18;
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
  id v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  BOOL v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  uint64_t KeyPath;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  BOOL v81;
  id v82;
  id v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  void *v108;
  id v109;
  double v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  id v118;
  double v119;
  CGFloat v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  double v127;
  void *v128;
  char v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t result;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  _BYTE v153[608];
  char v154;
  _OWORD v155[42];
  __int128 v156;
  _OWORD v157[38];
  char v158;
  double v159;
  uint64_t v160;
  double v161;
  uint64_t v162;
  char v163;
  _BYTE v164[600];
  char v165;
  uint64_t v166;
  uint64_t v167;
  BOOL v168;
  BOOL v169;
  char v170;
  __int128 v171;
  __int128 v172;
  char v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;

  v152 = a2;
  v147 = sub_100005070(&qword_100026C00);
  __chkstk_darwin(v147);
  v148 = (uint64_t)&v140 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = sub_100005070(&qword_100026AE0);
  __chkstk_darwin(v142);
  v5 = (char *)&v140 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Material(0);
  v144 = *(_QWORD *)(v6 - 8);
  v145 = v6;
  __chkstk_darwin(v6);
  v143 = (char *)&v140 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = sub_100005070(&qword_100026C08);
  v8 = __chkstk_darwin(v146);
  v10 = (_OWORD *)((char *)&v140 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v140 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (_OWORD *)((char *)&v140 - v15);
  __chkstk_darwin(v14);
  v18 = (char *)&v140 - v17;
  v19 = sub_100005070(&qword_100026C10);
  v20 = __chkstk_darwin(v19);
  v151 = (uint64_t)&v140 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v149 = a1;
  v150 = (uint64_t *)((char *)&v140 - v22);
  if ((*(_BYTE *)(a1 + 112) & 1) != 0)
  {
    v65 = *(_QWORD *)(a1 + 16);
    if (v65)
    {
      KeyPath = swift_getKeyPath(&unk_100017678);
      v67 = swift_getKeyPath(&unk_1000176A0);
      v68 = swift_retain(v65);
      static Published.subscript.getter(&v156, v68, KeyPath, v67);
      swift_release(v65);
      swift_release(KeyPath);
      swift_release(v67);
      v141 = v156;
      v69 = swift_getKeyPath(&unk_100017630);
      v70 = swift_getKeyPath(&unk_100017658);
      v71 = swift_retain(v65);
      static Published.subscript.getter(&v156, v71, v69, v70);
      swift_release(v65);
      swift_release(v69);
      swift_release(v70);
      v140 = v156;
      v72 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
      objc_msgSend(v72, "bounds");
      v74 = v73;
      v76 = v75;
      v78 = v77;
      v80 = v79;

      v175.origin.x = v74;
      v175.origin.y = v76;
      v175.size.width = v78;
      v175.size.height = v80;
      v81 = CGRectGetHeight(v175) <= 750.0;
      v82 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
      v83 = objc_msgSend(v82, "userInterfaceIdiom");

      LOBYTE(v82) = static Edge.Set.top.getter(v84);
      v85 = EdgeInsets.init(_all:)(20.0);
      v165 = 1;
      v86 = v141;
      v166 = v141;
      v167 = v140;
      v168 = v81;
      v169 = v83 == (id)1;
      v170 = (char)v82;
      *(double *)&v171 = v85;
      *((_QWORD *)&v171 + 1) = v87;
      *(_QWORD *)&v172 = v88;
      *((_QWORD *)&v172 + 1) = v89;
      v173 = 0;
      v91 = static Alignment.center.getter(v90);
      sub_100008D40(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v156, 0.0, 1, 0.0, 1, v91, v92);
      v93 = swift_bridgeObjectRelease(v86);
      v155[8] = v157[7];
      v155[9] = v157[8];
      v155[10] = v157[9];
      v155[11] = v157[10];
      v155[4] = v157[3];
      v155[5] = v157[4];
      v155[6] = v157[5];
      v155[7] = v157[6];
      v155[0] = v156;
      v155[1] = v157[0];
      v155[2] = v157[1];
      v155[3] = v157[2];
      v94 = v143;
      v95 = static Material.thin.getter(v93);
      LOBYTE(v82) = static Edge.Set.all.getter(v95);
      v97 = v144;
      v96 = v145;
      (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v5, v94, v145);
      v5[*(int *)(v142 + 36)] = (char)v82;
      v98 = v146;
      sub_100005908((uint64_t)v5, (uint64_t)v16 + *(int *)(v146 + 36), &qword_100026AE0);
      v99 = v155[9];
      v16[8] = v155[8];
      v16[9] = v99;
      v100 = v155[11];
      v16[10] = v155[10];
      v16[11] = v100;
      v101 = v155[5];
      v16[4] = v155[4];
      v16[5] = v101;
      v102 = v155[7];
      v16[6] = v155[6];
      v16[7] = v102;
      v103 = v155[1];
      *v16 = v155[0];
      v16[1] = v103;
      v104 = v155[3];
      v16[2] = v155[2];
      v16[3] = v104;
      sub_1000112E8((uint64_t)v155);
      sub_10000594C((uint64_t)v5, &qword_100026AE0);
      (*(void (**)(char *, uint64_t))(v97 + 8))(v94, v96);
      sub_100010C54((uint64_t)v155);
      sub_100006240((uint64_t)v16, (uint64_t)v18, &qword_100026C08);
      v105 = v148;
      sub_100005908((uint64_t)v18, v148, &qword_100026C08);
      swift_storeEnumTagMultiPayload(v105, v147, 0);
      v106 = sub_100010C7C();
      v62 = v150;
      _ConditionalContent<>.init(storage:)(v150, v105, v98, v98, v106, v106);
      v63 = sub_10000594C((uint64_t)v18, &qword_100026C08);
      v64 = 0.0;
      goto LABEL_6;
    }
LABEL_12:
    v137 = *(_QWORD *)(v149 + 24);
    v138 = type metadata accessor for ContactStoreVisualizer(0);
    v139 = sub_100011678(&qword_1000269C8, 255, type metadata accessor for ContactStoreVisualizer, (uint64_t)&unk_1000175F4);
    result = EnvironmentObject.error()(0, v137, v138, v139);
    __break(1u);
    return result;
  }
  v23 = *(_QWORD *)(a1 + 16);
  if (!v23)
    goto LABEL_12;
  v24 = swift_getKeyPath(&unk_100017678);
  v25 = swift_getKeyPath(&unk_1000176A0);
  v26 = swift_retain(v23);
  static Published.subscript.getter(&v156, v26, v24, v25);
  swift_release(v23);
  swift_release(v24);
  swift_release(v25);
  v27 = v156;
  v28 = swift_getKeyPath(&unk_100017630);
  v29 = swift_getKeyPath(&unk_100017658);
  v30 = swift_retain(v23);
  static Published.subscript.getter(&v156, v30, v28, v29);
  swift_release(v23);
  swift_release(v28);
  swift_release(v29);
  v31 = v156;
  v32 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v32, "bounds");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v174.origin.x = v34;
  v174.origin.y = v36;
  v174.size.width = v38;
  v174.size.height = v40;
  v41 = CGRectGetHeight(v174) <= 750.0;
  v42 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v43 = objc_msgSend(v42, "userInterfaceIdiom");

  v45 = static Edge.Set.all.getter(v44);
  v165 = 1;
  v166 = v27;
  v167 = v31;
  v168 = v41;
  v169 = v43 == (id)1;
  v170 = v45;
  v171 = xmmword_1000174F0;
  v172 = xmmword_100017500;
  v173 = 0;
  v46 = static Alignment.center.getter(v45);
  sub_100008D40(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v156, 0.0, 1, INFINITY, 0, v46, v47);
  v48 = swift_bridgeObjectRelease(v27);
  v155[8] = v157[7];
  v155[9] = v157[8];
  v155[10] = v157[9];
  v155[11] = v157[10];
  v155[4] = v157[3];
  v155[5] = v157[4];
  v155[6] = v157[5];
  v155[7] = v157[6];
  v155[0] = v156;
  v155[1] = v157[0];
  v155[2] = v157[1];
  v155[3] = v157[2];
  v49 = v143;
  v50 = static Material.thin.getter(v48);
  LOBYTE(v42) = static Edge.Set.all.getter(v50);
  v52 = v144;
  v51 = v145;
  (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v5, v49, v145);
  v5[*(int *)(v142 + 36)] = (char)v42;
  v53 = v146;
  sub_100005908((uint64_t)v5, (uint64_t)v10 + *(int *)(v146 + 36), &qword_100026AE0);
  v54 = v155[9];
  v10[8] = v155[8];
  v10[9] = v54;
  v55 = v155[11];
  v10[10] = v155[10];
  v10[11] = v55;
  v56 = v155[5];
  v10[4] = v155[4];
  v10[5] = v56;
  v57 = v155[7];
  v10[6] = v155[6];
  v10[7] = v57;
  v58 = v155[1];
  *v10 = v155[0];
  v10[1] = v58;
  v59 = v155[3];
  v10[2] = v155[2];
  v10[3] = v59;
  sub_1000112E8((uint64_t)v155);
  sub_10000594C((uint64_t)v5, &qword_100026AE0);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v51);
  sub_100010C54((uint64_t)v155);
  sub_100006240((uint64_t)v10, (uint64_t)v13, &qword_100026C08);
  v60 = v148;
  sub_100005908((uint64_t)v13, v148, &qword_100026C08);
  swift_storeEnumTagMultiPayload(v60, v147, 1);
  v61 = sub_100010C7C();
  v62 = v150;
  _ConditionalContent<>.init(storage:)(v150, v60, v53, v53, v61, v61);
  v63 = sub_10000594C((uint64_t)v13, &qword_100026C08);
  v64 = 10.0;
LABEL_6:
  v107 = static HorizontalAlignment.center.getter(v63);
  sub_1000090CC(v149, v164);
  v108 = (void *)objc_opt_self(UIScreen);
  v109 = objc_msgSend(v108, "mainScreen");
  objc_msgSend(v109, "bounds");
  v111 = v110;
  v113 = v112;
  v115 = v114;
  v117 = v116;

  v176.origin.x = v111;
  v176.origin.y = v113;
  v176.size.width = v115;
  v176.size.height = v117;
  if (CGRectGetHeight(v176) <= 750.0)
    v64 = 0.0;
  v118 = objc_msgSend(v108, "mainScreen");
  objc_msgSend(v118, "bounds");
  v120 = v119;
  v122 = v121;
  v124 = v123;
  v126 = v125;

  v177.origin.x = v120;
  v177.origin.y = v122;
  v177.size.width = v124;
  v177.size.height = v126;
  if (CGRectGetHeight(v177) > 750.0)
    v127 = 10.0;
  else
    v127 = 0.0;
  v153[600] = 1;
  v128 = memcpy(&v153[7], v164, 0x251uLL);
  v129 = static Edge.Set.all.getter(v128);
  v154 = 0;
  v130 = v151;
  sub_100005908((uint64_t)v62, v151, &qword_100026C10);
  v131 = v154;
  v132 = v152;
  sub_100005908(v130, v152, &qword_100026C10);
  v133 = sub_100005070(&qword_100026C50);
  v134 = v132 + *(int *)(v133 + 48);
  *(_QWORD *)v134 = 0;
  *(_BYTE *)(v134 + 8) = 1;
  v135 = (void *)(v132 + *(int *)(v133 + 64));
  v155[0] = (unint64_t)v107;
  LOBYTE(v155[1]) = 1;
  memcpy((char *)&v155[1] + 1, v153, 0x258uLL);
  LOBYTE(v155[39]) = v129;
  *((double *)&v155[39] + 1) = v64;
  *(_QWORD *)&v155[40] = 0x4039000000000000;
  *((double *)&v155[40] + 1) = v127;
  *(_QWORD *)&v155[41] = 0x4039000000000000;
  BYTE8(v155[41]) = v131;
  memcpy(v135, v155, 0x299uLL);
  sub_100010DF0((uint64_t)v155);
  sub_10000594C((uint64_t)v62, &qword_100026C10);
  v156 = (unint64_t)v107;
  LOBYTE(v157[0]) = 1;
  memcpy((char *)v157 + 1, v153, 0x258uLL);
  v158 = v129;
  v159 = v64;
  v160 = 0x4039000000000000;
  v161 = v127;
  v162 = 0x4039000000000000;
  v163 = v131;
  sub_100010F4C((uint64_t)&v156);
  return sub_10000594C(v130, &qword_100026C10);
}

uint64_t sub_100008D40@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  _OWORD *v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _OWORD v45[7];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v43 = a5;
    v44 = a7;
    v42 = a3;
    v41 = a1;
    v40 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v17 = a15;
    v20 = v40;
    v19 = a10;
    a1 = v41;
    a3 = v42;
    v18 = a12;
    a5 = v43;
    a7 = v44;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v45, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = v15[3];
  a9[2] = v15[2];
  a9[3] = v34;
  *(_OWORD *)((char *)a9 + 57) = *(_OWORD *)((char *)v15 + 57);
  v35 = v15[1];
  *a9 = *v15;
  a9[1] = v35;
  v36 = v45[5];
  a9[9] = v45[4];
  a9[10] = v36;
  a9[11] = v45[6];
  v37 = v45[1];
  a9[5] = v45[0];
  a9[6] = v37;
  v38 = v45[3];
  a9[7] = v45[2];
  a9[8] = v38;
  return sub_1000112E8((uint64_t)v15);
}

uint64_t sub_100008EEC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  double v34;
  double v36;
  double v37;
  double v38;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unsigned int v46;
  unsigned int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _OWORD v52[7];

  v20 = a19;
  v21 = a18;
  v22 = a17;
  v24 = a14;
  v23 = a15;
  v25 = a12;
  v26 = a10;
  v27 = a2 & 1;
  v28 = a1;
  if ((_DWORD)v27)
    v28 = -INFINITY;
  v29 = a4 & 1;
  v30 = a3;
  if ((_DWORD)v29)
    v30 = v28;
  v31 = a6 & 1;
  v32 = a8 & 1;
  v33 = a13 & 1;
  v34 = a5;
  if ((a6 & 1) != 0)
    v34 = v30;
  if (v28 > v30 || v30 > v34)
    goto LABEL_22;
  v36 = a7;
  if ((a8 & 1) != 0)
    v36 = -INFINITY;
  v37 = a10;
  if ((a11 & 1) != 0)
    v37 = v36;
  v38 = a12;
  if ((a13 & 1) != 0)
    v38 = v37;
  if (v36 > v37 || v37 > v38)
  {
LABEL_22:
    v50 = a7;
    v51 = a5;
    v48 = a1;
    v49 = a3;
    v47 = v27;
    v46 = v29;
    v40 = static os_log_type_t.fault.getter();
    v41 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v41, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v33 = a13 & 1;
    v29 = v46;
    v24 = a14;
    v23 = a15;
    v27 = v47;
    v26 = a10;
    v25 = a12;
    a1 = v48;
    a3 = v49;
    a7 = v50;
    a5 = v51;
    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v52, *(_QWORD *)&a1, v27, *(_QWORD *)&a3, v29, *(_QWORD *)&a5, v31, *(_QWORD *)&a7, v32, *(_QWORD *)&v26, a11 & 1, *(_QWORD *)&v25, v33, v24, v23);
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  v42 = v52[5];
  *(_OWORD *)(a9 + 96) = v52[4];
  *(_OWORD *)(a9 + 112) = v42;
  *(_OWORD *)(a9 + 128) = v52[6];
  v43 = v52[1];
  *(_OWORD *)(a9 + 32) = v52[0];
  *(_OWORD *)(a9 + 48) = v43;
  v44 = v52[3];
  *(_OWORD *)(a9 + 64) = v52[2];
  *(_OWORD *)(a9 + 80) = v44;
  sub_1000061C0(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain(v20);
}

uint64_t sub_1000090CC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD, _QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  Swift::String v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  Swift::String v47;
  Swift::String v48;
  _BYTE *v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v97;
  char v98;
  _BYTE *v99;
  uint64_t v100;
  double v101;
  _BYTE *v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  id v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  double v113;
  CGFloat v114;
  double v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unsigned __int8 v123;
  char v124;
  uint64_t v125;
  void (*v126)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v127;
  _BYTE *v128;
  double v129;
  uint64_t v130;
  _BYTE *v131;
  uint64_t v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  _BYTE v139[4];
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  int v145;
  int v146;
  uint64_t v147;
  int v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  _BYTE *v152;
  void *v153;
  _BYTE *v154;
  void (*v155)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v156;
  double v157;
  __int128 v158;
  unint64_t v159;
  uint64_t v160;
  double v161;
  __int128 v162;
  uint64_t v163;
  uint64_t v164;
  int v165;
  int v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  int v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  double v177;
  uint64_t v178;
  _BYTE *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  double v184;
  int v185;
  int v186;
  int v187;
  int v188;
  uint64_t v189;
  int v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t KeyPath;
  uint64_t v194;
  uint64_t v195;
  _BYTE v196[7];
  _BYTE v197[7];
  _BYTE v198[7];
  _BYTE v199[7];
  _BYTE v200[7];
  _BYTE v201[7];
  _BYTE v202[7];
  _DWORD v203[2];
  _DWORD v204[2];
  _DWORD v205[2];
  _DWORD v206[2];
  _DWORD v207[2];
  _DWORD v208[2];
  _DWORD v209[2];
  _DWORD v210[2];
  _DWORD v211[2];
  _DWORD v212[2];
  _DWORD v213[2];
  _DWORD v214[2];
  _DWORD v215[2];
  _DWORD v216[2];
  unsigned __int8 v217;
  char v218;
  unsigned __int8 v219;
  char v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  unsigned __int8 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  unsigned __int8 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  char v259;
  _BYTE v260[593];
  _QWORD v261[2];
  char v262;
  _BYTE v263[7];
  _BYTE *v264;
  char v265;
  _BYTE v266[7];
  double v267;
  _BYTE *v268;
  uint64_t v269;
  uint64_t v270;
  char v271;
  _BYTE v272[7];
  char v273;
  _BYTE v274[7];
  double v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  char v279;
  _BYTE v280[7];
  uint64_t v281;
  char v282;
  _BYTE v283[7];
  unint64_t v284;
  char v285;
  _BYTE v286[7];
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  char v291;
  _QWORD v292[2];
  char v293;
  _BYTE v294[7];
  uint64_t v295;
  char v296;
  _BYTE v297[7];
  double v298;
  __int128 v299;
  uint64_t v300;
  char v301;
  _BYTE v302[7];
  char v303;
  _BYTE v304[7];
  double v305;
  __int128 v306;
  uint64_t v307;
  char v308;
  _BYTE v309[7];
  uint64_t v310;
  char v311;
  _BYTE v312[7];
  uint64_t v313;
  char v314;
  _BYTE v315[7];
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  char v320;
  _QWORD v321[2];
  char v322;
  _BYTE v323[7];
  uint64_t v324;
  char v325;
  _BYTE v326[7];
  double v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  char v331;
  _BYTE v332[7];
  char v333;
  _BYTE v334[7];
  double v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  char v339;
  _BYTE v340[7];
  uint64_t v341;
  char v342;
  _BYTE v343[7];
  uint64_t v344;
  char v345;
  _BYTE v346[7];
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  char v351;
  unsigned __int8 v352;
  unsigned __int8 v353;
  unsigned __int8 v354;
  unsigned __int8 v355;
  _BYTE v356[7];
  _BYTE v357[7];
  _BYTE v358[7];
  _BYTE v359[7];
  _BYTE v360[7];
  _BYTE v361[7];
  _DWORD v362[5];
  unsigned __int8 v363;
  _BYTE v364[7];
  _BYTE v365[7];
  unsigned __int8 v366;
  _BYTE v367[7];
  _BYTE v368[7];
  unsigned __int8 v369;
  _BYTE v370[7];
  _BYTE v371[7];
  _BYTE v372[7];
  unsigned __int8 v373;
  _DWORD v374[2];
  _DWORD v375[2];
  _DWORD v376[2];
  _DWORD v377[2];
  _DWORD v378[2];
  _DWORD v379[2];
  _DWORD v380[6];
  CGRect v381;
  CGRect v382;

  v180 = a1;
  v153 = a2;
  v2 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v2);
  v179 = &v139[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_100005070(&qword_100026488);
  __chkstk_darwin(v4);
  v6 = &v139[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v139[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v152 = v9;
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v139[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v154 = v12;
  v13 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x8000000100017FC0);
  static Locale.current.getter(v13);
  *(_QWORD *)v260 = String.init(localized:table:bundle:locale:comment:)(v12, 0, 0, 0, v9, 0, 0, 256);
  *(_QWORD *)&v260[8] = v14;
  v159 = sub_100005818();
  v15 = Text.init<A>(_:)(v260, &type metadata for String, v159);
  v17 = v16;
  v19 = v18;
  v21 = v20 & 1;
  v22 = static Font.Weight.bold.getter();
  v23 = enum case for Font.Design.default(_:);
  v24 = type metadata accessor for Font.Design(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(void (**)(_QWORD, _QWORD))(v25 + 104);
  v27 = v23;
  v28 = v24;
  v156 = v24;
  v26(v6, v27);
  v155 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v25 + 56);
  v155(v6, 0, 1, v28);
  v29 = static Font.system(size:weight:design:)(*(_QWORD *)&v22, 0, v6, 34.0);
  sub_10000594C((uint64_t)v6, &qword_100026488);
  v189 = Text.font(_:)(v29, v15, v17, v21, v19);
  v194 = v31;
  v195 = v30;
  LOBYTE(v22) = v32;
  swift_release(v29);
  sub_10000585C(v15, v17, v21);
  v33 = swift_bridgeObjectRelease(v19);
  v188 = static Edge.Set.horizontal.getter(v33);
  v34 = EdgeInsets.init(_all:)(20.0);
  v183 = v35;
  v184 = v34;
  v181 = v37;
  v182 = v36;
  v187 = static Edge.Set.vertical.getter();
  v38 = EdgeInsets.init(_all:)(1.0);
  v176 = v39;
  v177 = v38;
  v174 = v41;
  v175 = v40;
  v369 = LOBYTE(v22) & 1;
  v366 = 0;
  v363 = 0;
  KeyPath = swift_getKeyPath(&unk_100017850);
  v186 = v369;
  v380[0] = *(_DWORD *)v368;
  *(_DWORD *)((char *)v380 + 3) = *(_DWORD *)&v368[3];
  v379[0] = *(_DWORD *)v367;
  *(_DWORD *)((char *)v379 + 3) = *(_DWORD *)&v367[3];
  v185 = v366;
  v378[0] = *(_DWORD *)v365;
  *(_DWORD *)((char *)v378 + 3) = *(_DWORD *)&v365[3];
  *(_DWORD *)((char *)v377 + 3) = *(_DWORD *)&v364[3];
  v377[0] = *(_DWORD *)v364;
  v190 = v363;
  v164 = swift_getKeyPath(&unk_100017880);
  v376[0] = *(_DWORD *)v370;
  *(_DWORD *)((char *)v376 + 3) = *(_DWORD *)&v370[3];
  v192 = swift_getKeyPath(&unk_1000178B0);
  v375[0] = *(_DWORD *)v371;
  *(_DWORD *)((char *)v375 + 3) = *(_DWORD *)&v371[3];
  v191 = swift_getKeyPath(&unk_1000178E0);
  v374[0] = *(_DWORD *)v372;
  *(_DWORD *)((char *)v374 + 3) = *(_DWORD *)&v372[3];
  v373 = 0;
  v42 = v179;
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1);
  v43._countAndFlagsBits = 0xD000000000000018;
  v43._object = (void *)0x8000000100017FE0;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v43);
  v44 = *(_QWORD *)(v180 + 8);
  v45 = *(_QWORD *)(v44 + 16);
  v46 = *(void **)(v44 + 24);
  swift_bridgeObjectRetain(v46);
  v47._countAndFlagsBits = v45;
  v47._object = v46;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v47);
  swift_bridgeObjectRelease(v46);
  v48._countAndFlagsBits = 0;
  v48._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v48);
  v49 = v154;
  v50 = String.LocalizationValue.init(stringInterpolation:)(v42);
  v51 = v152;
  static Locale.current.getter(v50);
  *(_QWORD *)v260 = String.init(localized:table:bundle:locale:comment:)(v49, 0, 0, 0, v51, 0, 0, 256);
  *(_QWORD *)&v260[8] = v52;
  v53 = Text.init<A>(_:)(v260, &type metadata for String, v159);
  v55 = v54;
  v57 = v56;
  v59 = v58 & 1;
  v155(v6, 1, 1, v156);
  v60 = static Font.system(size:weight:design:)(0, 1, v6, 17.0);
  sub_10000594C((uint64_t)v6, &qword_100026488);
  v61 = Text.font(_:)(v60, v53, v55, v59, v57);
  v178 = v62;
  v179 = (_BYTE *)v61;
  v64 = v63;
  v180 = v65;
  swift_release(v60);
  sub_10000585C(v53, v55, v59);
  v66 = swift_bridgeObjectRelease(v57);
  v172 = static Edge.Set.horizontal.getter(v66);
  v161 = EdgeInsets.init(_all:)(5.0);
  *(_QWORD *)&v162 = v67;
  *((_QWORD *)&v162 + 1) = v68;
  v163 = v69;
  v173 = static Edge.Set.vertical.getter();
  v70 = (void *)objc_opt_self(UIScreen);
  v71 = objc_msgSend(v70, "mainScreen");
  objc_msgSend(v71, "bounds");
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v79 = v78;

  v381.origin.x = v73;
  v381.origin.y = v75;
  v381.size.width = v77;
  v381.size.height = v79;
  if (CGRectGetHeight(v381) > 750.0)
    v80 = 10.0;
  else
    v80 = 1.0;
  v157 = EdgeInsets.init(_all:)(v80);
  *(_QWORD *)&v158 = v81;
  *((_QWORD *)&v158 + 1) = v82;
  v160 = v83;
  v354 = v64 & 1;
  v353 = 0;
  v352 = 0;
  v171 = swift_getKeyPath(&unk_100017850);
  v165 = v354;
  v166 = v353;
  v167 = v352;
  v169 = swift_getKeyPath(&unk_100017880);
  v170 = swift_getKeyPath(&unk_1000178B0);
  v168 = swift_getKeyPath(&unk_1000178E0);
  v355 = 0;
  v84 = v154;
  v85 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100018000);
  static Locale.current.getter(v85);
  *(_QWORD *)v260 = String.init(localized:table:bundle:locale:comment:)(v84, 0, 0, 0, v51, 0, 0, 256);
  *(_QWORD *)&v260[8] = v86;
  v87 = Text.init<A>(_:)(v260, &type metadata for String, v159);
  v89 = v88;
  v91 = v90;
  v93 = v92 & 1;
  v155(v6, 1, 1, v156);
  v94 = static Font.system(size:weight:design:)(0, 1, v6, 17.0);
  sub_10000594C((uint64_t)v6, &qword_100026488);
  v95 = Text.font(_:)(v94, v87, v89, v93, v91);
  v155 = v96;
  v156 = v95;
  v98 = v97;
  v154 = v99;
  swift_release(v94);
  sub_10000585C(v87, v89, v93);
  v100 = swift_bridgeObjectRelease(v91);
  v149 = static Edge.Set.horizontal.getter(v100);
  v101 = EdgeInsets.init(_all:)(5.0);
  v151 = v103;
  v152 = v102;
  v150 = v104;
  v105 = static Edge.Set.vertical.getter();
  v106 = objc_msgSend(v70, "mainScreen");
  objc_msgSend(v106, "bounds");
  v108 = v107;
  v110 = v109;
  v112 = v111;
  v114 = v113;

  v382.origin.x = v108;
  v382.origin.y = v110;
  v382.size.width = v112;
  v382.size.height = v114;
  if (CGRectGetHeight(v382) > 750.0)
    v115 = 10.0;
  else
    v115 = 1.0;
  v116 = EdgeInsets.init(_all:)(v115);
  v118 = v117;
  v120 = v119;
  v147 = v121;
  v219 = v98 & 1;
  v218 = 0;
  v217 = 0;
  v122 = swift_getKeyPath(&unk_100017850);
  v141 = v122;
  v123 = v219;
  v140 = v219;
  v124 = v218;
  v148 = v217;
  v159 = swift_getKeyPath(&unk_100017880);
  v125 = swift_getKeyPath(&unk_1000178B0);
  v142 = v125;
  v143 = swift_getKeyPath(&unk_1000178E0);
  v220 = 0;
  v216[0] = v380[0];
  *(_DWORD *)((char *)v216 + 3) = *(_DWORD *)((char *)v380 + 3);
  v215[0] = v379[0];
  *(_DWORD *)((char *)v215 + 3) = *(_DWORD *)((char *)v379 + 3);
  v214[0] = v378[0];
  *(_DWORD *)((char *)v214 + 3) = *(_DWORD *)((char *)v378 + 3);
  *(_DWORD *)((char *)v213 + 3) = *(_DWORD *)((char *)v377 + 3);
  v213[0] = v377[0];
  *(_DWORD *)((char *)v212 + 3) = *(_DWORD *)((char *)v376 + 3);
  v212[0] = v376[0];
  *(_DWORD *)((char *)v211 + 3) = *(_DWORD *)((char *)v375 + 3);
  v211[0] = v375[0];
  *(_DWORD *)((char *)v210 + 3) = *(_DWORD *)((char *)v374 + 3);
  v210[0] = v374[0];
  v146 = v373;
  v209[0] = v362[0];
  *(_DWORD *)((char *)v209 + 3) = *(_DWORD *)((char *)v362 + 3);
  v208[0] = *(_DWORD *)v361;
  *(_DWORD *)((char *)v208 + 3) = *(_DWORD *)&v361[3];
  v207[0] = *(_DWORD *)v360;
  *(_DWORD *)((char *)v207 + 3) = *(_DWORD *)&v360[3];
  *(_DWORD *)((char *)v206 + 3) = *(_DWORD *)&v359[3];
  v206[0] = *(_DWORD *)v359;
  *(_DWORD *)((char *)v205 + 3) = *(_DWORD *)&v358[3];
  v205[0] = *(_DWORD *)v358;
  *(_DWORD *)((char *)v204 + 3) = *(_DWORD *)&v357[3];
  v204[0] = *(_DWORD *)v357;
  *(_DWORD *)((char *)v203 + 3) = *(_DWORD *)&v356[3];
  v203[0] = *(_DWORD *)v356;
  DWORD1(v222) = *(_DWORD *)((char *)v380 + 3);
  *(_DWORD *)((char *)&v222 + 1) = v380[0];
  DWORD1(v223) = *(_DWORD *)((char *)v379 + 3);
  *(_DWORD *)((char *)&v223 + 1) = v379[0];
  HIDWORD(v225) = *(_DWORD *)((char *)v378 + 3);
  *(_DWORD *)((char *)&v225 + 9) = v378[0];
  DWORD1(v226) = *(_DWORD *)((char *)v377 + 3);
  *(_DWORD *)((char *)&v226 + 1) = v377[0];
  HIDWORD(v228) = *(_DWORD *)((char *)v376 + 3);
  *(_DWORD *)((char *)&v228 + 9) = v376[0];
  HIDWORD(v229) = *(_DWORD *)((char *)v375 + 3);
  *(_DWORD *)((char *)&v229 + 9) = v375[0];
  HIDWORD(v230) = *(_DWORD *)((char *)v374 + 3);
  *(_DWORD *)((char *)&v230 + 9) = v374[0];
  DWORD1(v235) = *(_DWORD *)((char *)v362 + 3);
  *(_DWORD *)((char *)&v235 + 1) = v362[0];
  DWORD1(v236) = *(_DWORD *)&v361[3];
  *(_DWORD *)((char *)&v236 + 1) = *(_DWORD *)v361;
  HIDWORD(v238) = *(_DWORD *)&v360[3];
  v145 = v355;
  *((_QWORD *)&v221 + 1) = v195;
  *((_QWORD *)&v222 + 1) = v194;
  *((double *)&v223 + 1) = v184;
  *(_QWORD *)&v224 = v183;
  *((_QWORD *)&v224 + 1) = v182;
  *(_QWORD *)&v225 = v181;
  *((double *)&v226 + 1) = v177;
  *(_QWORD *)&v227 = v176;
  *((_QWORD *)&v227 + 1) = v175;
  *(_QWORD *)&v228 = v174;
  *(_QWORD *)&v229 = KeyPath;
  *(_QWORD *)&v230 = v164;
  *(_DWORD *)((char *)&v238 + 9) = *(_DWORD *)v360;
  DWORD1(v239) = *(_DWORD *)&v359[3];
  *(_DWORD *)((char *)&v239 + 1) = *(_DWORD *)v359;
  HIDWORD(v241) = *(_DWORD *)&v358[3];
  *(_QWORD *)&v231 = v192;
  *((_QWORD *)&v231 + 1) = 0x3FE0000000000000;
  *(_DWORD *)((char *)&v241 + 9) = *(_DWORD *)v358;
  HIDWORD(v242) = *(_DWORD *)&v357[3];
  *(_DWORD *)((char *)&v242 + 9) = *(_DWORD *)v357;
  HIDWORD(v243) = *(_DWORD *)&v356[3];
  *(_QWORD *)&v232 = v191;
  *((_QWORD *)&v232 + 1) = 2;
  v233 = v373;
  *(_QWORD *)&v234 = v179;
  *((_QWORD *)&v234 + 1) = v178;
  LOBYTE(v235) = v165;
  *((_QWORD *)&v235 + 1) = v180;
  LOBYTE(v236) = v172;
  *((double *)&v236 + 1) = v161;
  v237 = v162;
  *(_QWORD *)&v238 = v163;
  BYTE8(v238) = v166;
  LOBYTE(v239) = v173;
  *((double *)&v239 + 1) = v157;
  v240 = v158;
  *(_QWORD *)&v241 = v160;
  BYTE8(v241) = v167;
  *(_QWORD *)&v242 = v171;
  BYTE8(v242) = 1;
  *(_QWORD *)&v243 = v169;
  BYTE8(v243) = 1;
  *(_DWORD *)((char *)&v243 + 9) = *(_DWORD *)v356;
  *(_QWORD *)&v244 = v170;
  *((_QWORD *)&v244 + 1) = 0x3FE0000000000000;
  v260[192] = v373;
  *(_QWORD *)&v245 = v168;
  *((_QWORD *)&v245 + 1) = 4;
  v246 = v355;
  *(_OWORD *)&v260[360] = v244;
  *(_OWORD *)&v260[376] = v245;
  *(_OWORD *)&v260[296] = v158;
  *(_OWORD *)&v260[312] = v241;
  *(_OWORD *)&v260[328] = v242;
  *(_OWORD *)&v260[344] = v243;
  *(_OWORD *)&v260[264] = v238;
  *(_OWORD *)&v260[280] = v239;
  v260[392] = v355;
  v144 = 0;
  v126 = v155;
  v127 = v156;
  *(_QWORD *)&v247 = v156;
  *((_QWORD *)&v247 + 1) = v155;
  v128 = v154;
  *((_QWORD *)&v248 + 1) = v154;
  v129 = v101;
  v130 = v151;
  v131 = v152;
  *((double *)&v249 + 1) = v101;
  *(_QWORD *)&v250 = v152;
  v132 = v150;
  *((_QWORD *)&v250 + 1) = v150;
  *(_QWORD *)&v251 = v151;
  v133 = v116;
  *((double *)&v252 + 1) = v116;
  *(_QWORD *)&v253 = v118;
  v134 = v118;
  v135 = v120;
  *((_QWORD *)&v253 + 1) = v120;
  v136 = v147;
  *(_QWORD *)&v254 = v147;
  *(_QWORD *)&v255 = v122;
  *(_QWORD *)&v256 = v159;
  *(_QWORD *)&v257 = v125;
  *((_QWORD *)&v257 + 1) = 0x3FE0000000000000;
  *(_QWORD *)&v258 = v143;
  *((_QWORD *)&v258 + 1) = 4;
  v259 = 0;
  v260[592] = 0;
  LOBYTE(v248) = v123;
  LOBYTE(v125) = v148;
  v137 = v149;
  LOBYTE(v249) = v149;
  BYTE8(v251) = v124;
  LOBYTE(v252) = v105;
  BYTE8(v254) = v148;
  BYTE8(v255) = 1;
  BYTE8(v256) = 1;
  *(_QWORD *)&v221 = v189;
  LOBYTE(v222) = v186;
  LOBYTE(v223) = v188;
  BYTE8(v225) = v185;
  LOBYTE(v226) = v187;
  BYTE8(v228) = v190;
  BYTE8(v229) = 1;
  BYTE8(v230) = 1;
  *(_OWORD *)&v260[160] = v231;
  *(_OWORD *)&v260[176] = v232;
  *(_OWORD *)&v260[96] = v227;
  *(_OWORD *)&v260[112] = v228;
  *(_OWORD *)&v260[128] = v229;
  *(_OWORD *)&v260[144] = v230;
  *(_OWORD *)&v260[32] = v223;
  *(_OWORD *)&v260[48] = v224;
  *(_OWORD *)&v260[64] = v225;
  *(_OWORD *)&v260[80] = v226;
  *(_OWORD *)v260 = v221;
  *(_OWORD *)&v260[16] = v222;
  *(_OWORD *)&v260[216] = v235;
  *(_OWORD *)&v260[232] = v236;
  *(_OWORD *)&v260[248] = v162;
  *(_OWORD *)&v260[200] = v234;
  *(_OWORD *)&v260[560] = v257;
  *(_OWORD *)&v260[576] = v258;
  *(_OWORD *)&v260[496] = v253;
  *(_OWORD *)&v260[512] = v254;
  *(_OWORD *)&v260[528] = v255;
  *(_OWORD *)&v260[544] = v256;
  *(_OWORD *)&v260[432] = v249;
  *(_OWORD *)&v260[448] = v250;
  *(_OWORD *)&v260[464] = v251;
  *(_OWORD *)&v260[480] = v252;
  *(_OWORD *)&v260[400] = v247;
  *(_OWORD *)&v260[416] = v248;
  memcpy(v153, v260, 0x251uLL);
  v261[0] = v127;
  v261[1] = v126;
  v262 = v140;
  *(_DWORD *)v263 = *(_DWORD *)v202;
  *(_DWORD *)&v263[3] = *(_DWORD *)&v202[3];
  v264 = v128;
  v265 = v137;
  *(_DWORD *)v266 = *(_DWORD *)v201;
  *(_DWORD *)&v266[3] = *(_DWORD *)&v201[3];
  v267 = v129;
  v268 = v131;
  v269 = v132;
  v270 = v130;
  v271 = v124;
  *(_DWORD *)&v272[3] = *(_DWORD *)&v200[3];
  *(_DWORD *)v272 = *(_DWORD *)v200;
  v273 = v105;
  *(_DWORD *)&v274[3] = *(_DWORD *)&v199[3];
  *(_DWORD *)v274 = *(_DWORD *)v199;
  v275 = v133;
  v276 = v134;
  v277 = v135;
  v278 = v136;
  v279 = v125;
  *(_DWORD *)v280 = *(_DWORD *)v198;
  *(_DWORD *)&v280[3] = *(_DWORD *)&v198[3];
  v281 = v141;
  v282 = 1;
  *(_DWORD *)v283 = *(_DWORD *)v197;
  *(_DWORD *)&v283[3] = *(_DWORD *)&v197[3];
  v284 = v159;
  v285 = 1;
  *(_DWORD *)v286 = *(_DWORD *)v196;
  *(_DWORD *)&v286[3] = *(_DWORD *)&v196[3];
  v287 = v142;
  v288 = 0x3FE0000000000000;
  v289 = v143;
  v290 = 4;
  v291 = v144;
  sub_1000111F0((uint64_t)&v221);
  sub_1000111F0((uint64_t)&v234);
  sub_1000111F0((uint64_t)&v247);
  sub_10001126C((uint64_t)v261);
  v292[0] = v179;
  v292[1] = v178;
  v293 = v165;
  *(_DWORD *)v294 = v209[0];
  *(_DWORD *)&v294[3] = *(_DWORD *)((char *)v209 + 3);
  v295 = v180;
  v296 = v172;
  *(_DWORD *)v297 = v208[0];
  *(_DWORD *)&v297[3] = *(_DWORD *)((char *)v208 + 3);
  v298 = v161;
  v299 = v162;
  v300 = v163;
  v301 = v166;
  *(_DWORD *)&v302[3] = *(_DWORD *)((char *)v207 + 3);
  *(_DWORD *)v302 = v207[0];
  v303 = v173;
  *(_DWORD *)&v304[3] = *(_DWORD *)((char *)v206 + 3);
  *(_DWORD *)v304 = v206[0];
  v305 = v157;
  v306 = v158;
  v307 = v160;
  v308 = v167;
  *(_DWORD *)&v309[3] = *(_DWORD *)((char *)v205 + 3);
  *(_DWORD *)v309 = v205[0];
  v310 = v171;
  v311 = 1;
  *(_DWORD *)v312 = v204[0];
  *(_DWORD *)&v312[3] = *(_DWORD *)((char *)v204 + 3);
  v313 = v169;
  v314 = 1;
  *(_DWORD *)v315 = v203[0];
  *(_DWORD *)&v315[3] = *(_DWORD *)((char *)v203 + 3);
  v316 = v170;
  v317 = 0x3FE0000000000000;
  v318 = v168;
  v319 = 4;
  v320 = v145;
  sub_10001126C((uint64_t)v292);
  v321[0] = v189;
  v321[1] = v195;
  v322 = v186;
  *(_DWORD *)v323 = v216[0];
  *(_DWORD *)&v323[3] = *(_DWORD *)((char *)v216 + 3);
  v324 = v194;
  v325 = v188;
  *(_DWORD *)v326 = v215[0];
  *(_DWORD *)&v326[3] = *(_DWORD *)((char *)v215 + 3);
  v327 = v184;
  v328 = v183;
  v329 = v182;
  v330 = v181;
  v331 = v185;
  *(_DWORD *)&v332[3] = *(_DWORD *)((char *)v214 + 3);
  *(_DWORD *)v332 = v214[0];
  v333 = v187;
  *(_DWORD *)&v334[3] = *(_DWORD *)((char *)v213 + 3);
  *(_DWORD *)v334 = v213[0];
  v335 = v177;
  v336 = v176;
  v337 = v175;
  v338 = v174;
  v339 = v190;
  *(_DWORD *)&v340[3] = *(_DWORD *)((char *)v212 + 3);
  *(_DWORD *)v340 = v212[0];
  v341 = KeyPath;
  v342 = 1;
  *(_DWORD *)v343 = v211[0];
  *(_DWORD *)&v343[3] = *(_DWORD *)((char *)v211 + 3);
  v344 = v164;
  v345 = 1;
  *(_DWORD *)v346 = v210[0];
  *(_DWORD *)&v346[3] = *(_DWORD *)((char *)v210 + 3);
  v347 = v192;
  v348 = 0x3FE0000000000000;
  v349 = v191;
  v350 = 2;
  v351 = v146;
  return sub_10001126C((uint64_t)v321);
}

uint64_t sub_10000A160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
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
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  __int128 v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v95;
  char *v96;
  __int128 v97;
  void (*v98)(char *, uint64_t, uint64_t);
  uint64_t v99;
  unsigned int v100;
  char *v101;
  void (*v102)(char *, char *, uint64_t);
  uint64_t v103;
  id v104;
  char *v105;
  void (*v106)(char *, uint64_t);
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t (*v111)(char *, uint64_t);
  void (*v112)(char *, char *, uint64_t);
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
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
  uint64_t v127;
  uint64_t v128;
  _OWORD v129[3];
  _OWORD v130[3];

  v119 = a2;
  v127 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v127);
  v110 = (char *)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for BorderedProminentButtonStyle(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v122 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = sub_100005070(&qword_100026B98);
  v7 = *(_QWORD *)(v123 - 8);
  __chkstk_darwin(v123);
  v9 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = sub_100005070(&qword_100026BA0);
  __chkstk_darwin(v121);
  v11 = (char *)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = sub_100005070(&qword_100026BA8);
  v109 = *(_QWORD *)(v124 - 8);
  __chkstk_darwin(v124);
  v120 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_100005070(&qword_100026BB0);
  __chkstk_darwin(v126);
  v101 = (char *)&v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = sub_100005070(&qword_100026BB8);
  v14 = __chkstk_darwin(v125);
  v118 = (char *)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v105 = (char *)&v95 - v16;
  v117 = sub_100005070(&qword_100026BC0);
  v17 = __chkstk_darwin(v117);
  v113 = (uint64_t)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v116 = (uint64_t)&v95 - v19;
  v20 = swift_allocObject(&unk_100021700, 129, 7);
  v21 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v20 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v20 + 96) = v21;
  *(_OWORD *)(v20 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v20 + 128) = *(_BYTE *)(a1 + 112);
  v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v20 + 32) = v22;
  v23 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v20 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v20 + 64) = v23;
  sub_1000106C8((_QWORD *)a1);
  v24 = sub_100005070(&qword_100026BC8);
  v115 = v24;
  v114 = sub_100010A90();
  v25 = Button.init(action:label:)(sub_100010A8C, v20, sub_10000AB5C, 0, v24, v114);
  v26 = static Alignment.center.getter(v25);
  _FrameLayout.init(width:height:alignment:)(v129, 0, 1, 0x4049000000000000, 0, v26, v27);
  v112 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v96 = v9;
  v28 = v123;
  v112(v11, v9, v123);
  v29 = v121;
  v30 = &v11[*(int *)(v121 + 36)];
  v31 = v129[1];
  *(_OWORD *)v30 = v129[0];
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v129[2];
  v111 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  v32 = v111(v9, v28);
  v33 = v122;
  BorderedProminentButtonStyle.init()(v32);
  v34 = sub_100010AF4();
  v108 = v34;
  v107 = sub_100011678(&qword_100026BE8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
  v35 = v120;
  v103 = v4;
  View.buttonStyle<A>(_:)(v33, v29, v4, v34, v107);
  v106 = *(void (**)(char *, uint64_t))(v5 + 8);
  v106(v33, v4);
  v36 = v11;
  sub_10000594C((uint64_t)v11, &qword_100026BA0);
  v104 = (id)objc_opt_self(UIColor);
  v37 = Color.init(_:)(objc_msgSend(v104, "tertiarySystemFillColor"));
  KeyPath = swift_getKeyPath(&unk_100017820);
  *(_QWORD *)&v130[0] = v37;
  swift_retain(v37);
  v39 = AnyShapeStyle.init<A>(_:)(v130, &type metadata for Color, &protocol witness table for Color);
  v40 = v109;
  v102 = *(void (**)(char *, char *, uint64_t))(v109 + 16);
  v41 = (uint64_t)v101;
  v42 = v35;
  v43 = v35;
  v44 = v124;
  v102(v101, v43, v124);
  swift_release(v37);
  v45 = (uint64_t *)(v41 + *(int *)(v126 + 36));
  *v45 = KeyPath;
  v45[1] = v39;
  v109 = *(_QWORD *)(v40 + 8);
  ((void (*)(char *, uint64_t))v109)(v42, v44);
  v46 = v110;
  v47 = &v110[*(int *)(v127 + 20)];
  v48 = enum case for RoundedCornerStyle.continuous(_:);
  v100 = enum case for RoundedCornerStyle.continuous(_:);
  v99 = type metadata accessor for RoundedCornerStyle(0);
  v98 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 104);
  v98(v47, v48, v99);
  __asm { FMOV            V0.2D, #14.0 }
  v97 = _Q0;
  *(_OWORD *)v46 = _Q0;
  v54 = (uint64_t)v105;
  v55 = (uint64_t)&v105[*(int *)(v125 + 36)];
  sub_100010BC8((uint64_t)v46, v55);
  v95 = sub_100005070(&qword_100026BF0);
  *(_WORD *)(v55 + *(int *)(v95 + 36)) = 256;
  sub_100005908(v41, v54, &qword_100026BB0);
  sub_100010C0C((uint64_t)v46);
  v56 = sub_10000594C(v41, &qword_100026BB0);
  LOBYTE(v55) = static Edge.Set.bottom.getter(v56);
  v57 = EdgeInsets.init(_all:)(11.0);
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v64 = v113;
  sub_100005908(v54, v113, &qword_100026BB8);
  v65 = v64 + *(int *)(v117 + 36);
  *(_BYTE *)v65 = v55;
  *(double *)(v65 + 8) = v57;
  *(_QWORD *)(v65 + 16) = v59;
  *(_QWORD *)(v65 + 24) = v61;
  *(_QWORD *)(v65 + 32) = v63;
  *(_BYTE *)(v65 + 40) = 0;
  sub_10000594C(v54, &qword_100026BB8);
  v66 = v116;
  sub_100006240(v64, v116, &qword_100026BC0);
  v67 = swift_allocObject(&unk_100021728, 129, 7);
  v68 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v67 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v67 + 96) = v68;
  *(_OWORD *)(v67 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v67 + 128) = *(_BYTE *)(a1 + 112);
  v69 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v67 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v67 + 32) = v69;
  v70 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v67 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v67 + 64) = v70;
  sub_1000106C8((_QWORD *)a1);
  v71 = v96;
  v72 = Button.init(action:label:)(sub_100010C4C, v67, sub_10000ABC0, 0, v115, v114);
  v73 = static Alignment.center.getter(v72);
  _FrameLayout.init(width:height:alignment:)(v130, 0, 1, 0x4049000000000000, 0, v73, v74);
  v75 = (uint64_t)v36;
  v76 = v123;
  v112(v36, v71, v123);
  v77 = v121;
  v78 = &v36[*(int *)(v121 + 36)];
  v79 = v130[1];
  *(_OWORD *)v78 = v130[0];
  *((_OWORD *)v78 + 1) = v79;
  *((_OWORD *)v78 + 2) = v130[2];
  v80 = v111(v71, v76);
  v81 = v122;
  BorderedProminentButtonStyle.init()(v80);
  v82 = v120;
  v83 = v77;
  v84 = v103;
  View.buttonStyle<A>(_:)(v81, v83, v103, v108, v107);
  v106(v81, v84);
  sub_10000594C(v75, &qword_100026BA0);
  v85 = Color.init(_:)(objc_msgSend(v104, "tertiarySystemFillColor"));
  v86 = swift_getKeyPath(&unk_100017820);
  v128 = v85;
  swift_retain(v85);
  v87 = AnyShapeStyle.init<A>(_:)(&v128, &type metadata for Color, &protocol witness table for Color);
  v88 = v124;
  v102((char *)v41, v82, v124);
  swift_release(v85);
  v89 = (uint64_t *)(v41 + *(int *)(v126 + 36));
  *v89 = v86;
  v89[1] = v87;
  ((void (*)(char *, uint64_t))v109)(v82, v88);
  v98(&v46[*(int *)(v127 + 20)], v100, v99);
  *(_OWORD *)v46 = v97;
  v90 = (uint64_t)v118;
  v91 = (uint64_t)&v118[*(int *)(v125 + 36)];
  sub_100010BC8((uint64_t)v46, v91);
  *(_WORD *)(v91 + *(int *)(v95 + 36)) = 256;
  sub_100005908(v41, v90, &qword_100026BB0);
  sub_100010C0C((uint64_t)v46);
  sub_10000594C(v41, &qword_100026BB0);
  sub_100006240(v90, v54, &qword_100026BB8);
  sub_100005908(v66, v64, &qword_100026BC0);
  sub_100005908(v54, v90, &qword_100026BB8);
  v92 = v119;
  sub_100005908(v64, v119, &qword_100026BC0);
  v93 = sub_100005070(&qword_100026BF8);
  sub_100005908(v90, v92 + *(int *)(v93 + 48), &qword_100026BB8);
  sub_10000594C(v54, &qword_100026BB8);
  sub_10000594C(v66, &qword_100026BC0);
  sub_10000594C(v90, &qword_100026BB8);
  return sub_10000594C(v64, &qword_100026BC0);
}

double sub_10000AB5C@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_10000ABDC(0xD000000000000022, 0x8000000100017F90, a1).n128_u64[0];
  return result;
}

uint64_t sub_10000AB78(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(void (**)(uint64_t))(v1 + 48);
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 56);
    v4 = swift_retain(v3);
    v2(v4);
    return sub_10000758C((uint64_t)v2, v3);
  }
  return result;
}

double sub_10000ABC0@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_10000ABDC(0xD000000000000024, 0x8000000100017F30, a1).n128_u64[0];
  return result;
}

__n128 sub_10000ABDC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __n128 result;
  _BYTE v54[24];
  _OWORD v55[9];

  v6 = sub_100005070(&qword_100026488);
  __chkstk_darwin(v6);
  v8 = &v54[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = type metadata accessor for Locale(0);
  __chkstk_darwin(v9);
  v11 = &v54[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v12);
  v14 = &v54[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = String.LocalizationValue.init(stringLiteral:)(a1, a2);
  static Locale.current.getter(v15);
  *(_QWORD *)&v55[0] = String.init(localized:table:bundle:locale:comment:)(v14, 0, 0, 0, v11, 0, 0, 256);
  *((_QWORD *)&v55[0] + 1) = v16;
  v17 = sub_100005818();
  v18 = Text.init<A>(_:)(v55, &type metadata for String, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23 & 1;
  v25 = type metadata accessor for Font.Design(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v8, 1, 1, v25);
  v26 = static Font.system(size:weight:design:)(0, 1, v8, 18.0);
  v27 = sub_10000594C((uint64_t)v8, &qword_100026488);
  v28 = static Font.Weight.semibold.getter(v27);
  v29 = Font.weight(_:)(v26, v28);
  swift_release(v26);
  v30 = Text.font(_:)(v29, v18, v20, v24, v22);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  swift_release(v29);
  LOBYTE(v29) = v34 & 1;
  sub_10000585C(v18, v20, v24);
  v37 = swift_bridgeObjectRelease(v22);
  v38 = static Color.blue.getter(v37);
  *(_QWORD *)&v55[0] = v38;
  v39 = Text.foregroundStyle<A>(_:)(v55, v30, v32, v34 & 1, v36, &type metadata for Color, &protocol witness table for Color);
  v41 = v40;
  v43 = v42;
  v45 = v44 & 1;
  sub_10000585C(v30, v32, v29);
  swift_release(v38);
  v46 = swift_bridgeObjectRelease(v36);
  v47 = static Alignment.center.getter(v46);
  sub_100008EEC(0.0, 1, 0.0, 1, INFINITY, 0, 50.0, 0, (uint64_t)v55, 0.0, 1, 0.0, 1, v47, v48, v39, v41, v45, v43);
  sub_10000585C(v39, v41, v45);
  swift_bridgeObjectRelease(v43);
  v49 = v55[7];
  v50 = v55[8];
  *(_OWORD *)(a3 + 96) = v55[6];
  *(_OWORD *)(a3 + 112) = v49;
  *(_OWORD *)(a3 + 128) = v50;
  v51 = v55[3];
  *(_OWORD *)(a3 + 32) = v55[2];
  *(_OWORD *)(a3 + 48) = v51;
  v52 = v55[5];
  *(_OWORD *)(a3 + 64) = v55[4];
  *(_OWORD *)(a3 + 80) = v52;
  result = (__n128)v55[1];
  *(_OWORD *)a3 = v55[0];
  *(__n128 *)(a3 + 16) = result;
  return result;
}

uint64_t sub_10000AEEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;

  v2 = sub_100005070(&qword_100026B00);
  v3 = __chkstk_darwin(v2);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)v5 = static HorizontalAlignment.center.getter(v3);
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 0;
  v6 = sub_100005070(&qword_100026C58);
  sub_10000B014(a1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  v12 = a1;
  v7 = sub_100005070(&qword_100026B08);
  v8 = sub_100006878(&qword_100026B10, &qword_100026B00, (uint64_t)&protocol conformance descriptor for VStack<A>);
  v9 = sub_100006878(&qword_100026B18, &qword_100026B08, (uint64_t)&protocol conformance descriptor for TupleToolbarContent<A>);
  View.toolbar<A>(content:)(sub_100011310, v11, v2, v7, v8, v9);
  return sub_10000594C((uint64_t)v5, &qword_100026B00);
}

uint64_t sub_10000B014@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  Swift::String v51;
  uint64_t v52;
  uint64_t v53;
  Swift::String v54;
  char *v55;
  uint64_t v56;
  char *v57;
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
  id v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  uint64_t v77;
  double v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, char *, uint64_t);
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int *v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t);
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  __int128 v116;
  uint64_t v117;
  _OWORD v118[3];
  __int128 v119;
  CGRect v120;

  v100 = a1;
  v113 = a2;
  v2 = sub_100005070(&qword_100026D00);
  __chkstk_darwin(v2);
  v107 = (uint64_t *)((char *)&v97 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v105 = sub_100005070(&qword_100026D08);
  v4 = __chkstk_darwin(v105);
  v112 = (uint64_t)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v106 = (uint64_t)&v97 - v7;
  __chkstk_darwin(v6);
  v109 = (uint64_t)&v97 - v8;
  v111 = sub_100005070(&qword_100026D10);
  v108 = *(_QWORD *)(v111 - 8);
  v9 = __chkstk_darwin(v111);
  v110 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v114 = (char *)&v97 - v11;
  v12 = type metadata accessor for Locale(0);
  __chkstk_darwin(v12);
  v103 = (char *)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v102 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v16);
  v101 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = sub_100005070(&qword_100026AE0);
  __chkstk_darwin(v99);
  v19 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for Material(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v23 = (char *)&v97 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_100005070(&qword_100026AE8);
  __chkstk_darwin(v24);
  v26 = (uint64_t *)((char *)&v97 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v98 = sub_100005070(&qword_100026D18);
  __chkstk_darwin(v98);
  v28 = (char *)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = (char *)sub_100005070(&qword_100026D20);
  v29 = __chkstk_darwin(v104);
  v31 = (char *)&v97 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v29);
  v115 = (uint64_t)&v97 - v33;
  v34 = static Color.clear.getter(v32);
  v35 = static Material.thin.getter(v34);
  v36 = static Edge.Set.all.getter(v35);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v19, v23, v20);
  v19[*(int *)(v99 + 36)] = v36;
  sub_100005908((uint64_t)v19, (uint64_t)v26 + *(int *)(v24 + 36), &qword_100026AE0);
  *v26 = v34;
  swift_retain(v34);
  sub_10000594C((uint64_t)v19, &qword_100026AE0);
  v37 = v23;
  v38 = v100;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v37, v20);
  v39 = swift_release(v34);
  LOBYTE(v34) = static Edge.Set.top.getter(v39);
  v40 = static SafeAreaRegions.all.getter();
  sub_100005908((uint64_t)v26, (uint64_t)v28, &qword_100026AE8);
  v41 = &v28[*(int *)(v98 + 36)];
  *(_QWORD *)v41 = v40;
  v41[8] = v34;
  v42 = sub_10000594C((uint64_t)v26, &qword_100026AE8);
  v43 = static Alignment.center.getter(v42);
  _FrameLayout.init(width:height:alignment:)(v118, 0, 1, 0, 0, v43, v44);
  sub_100005908((uint64_t)v28, (uint64_t)v31, &qword_100026D18);
  v45 = &v31[*((int *)v104 + 9)];
  v46 = v118[1];
  *(_OWORD *)v45 = v118[0];
  *((_OWORD *)v45 + 1) = v46;
  *((_OWORD *)v45 + 2) = v118[2];
  sub_10000594C((uint64_t)v28, &qword_100026D18);
  v104 = v31;
  sub_100006240((uint64_t)v31, v115, &qword_100026D20);
  v119 = *(_OWORD *)(v38 + 80);
  v116 = *(_OWORD *)(v38 + 80);
  v47 = sub_100005070(&qword_100026AA0);
  State.wrappedValue.getter(&v117, v47);
  v48 = v117;
  if ((unint64_t)v117 >> 62)
  {
    if (v117 < 0)
      v95 = v117;
    else
      v95 = v117 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v117);
    v49 = _CocoaArrayWrapper.endIndex.getter(v95);
    swift_bridgeObjectRelease(v48);
  }
  else
  {
    v49 = *(_QWORD *)((v117 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v48);
  v50 = v101;
  if (v49 < 1)
  {
    v55 = v102;
    v56 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x8000000100018060);
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(30, 1);
    v51._countAndFlagsBits = 0xD00000000000001ELL;
    v51._object = (void *)0x8000000100018080;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v51);
    v116 = v119;
    State.wrappedValue.getter(&v117, v47);
    v52 = v117;
    if ((unint64_t)v117 >> 62)
    {
      if (v117 < 0)
        v96 = v117;
      else
        v96 = v117 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v117);
      v53 = _CocoaArrayWrapper.endIndex.getter(v96);
      swift_bridgeObjectRelease(v52);
    }
    else
    {
      v53 = *(_QWORD *)((v117 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v52);
    *(_QWORD *)&v116 = v53;
    String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)(&v116, 1684827173, 0xE400000000000000, &type metadata for Int, &protocol witness table for Int);
    v54._countAndFlagsBits = 0;
    v54._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v54);
    v55 = v102;
    v56 = String.LocalizationValue.init(stringInterpolation:)(v50);
  }
  v57 = v103;
  static Locale.current.getter(v56);
  v58 = String.init(localized:table:bundle:locale:comment:)(v55, 0, 0, 0, v57, 0, 0, 256);
  v60 = v59;
  v61 = static Axis.Set.vertical.getter(v58);
  __chkstk_darwin(v61);
  *(&v97 - 4) = v38;
  *(&v97 - 3) = v58;
  *(&v97 - 2) = v60;
  *((_BYTE *)&v97 - 8) = v49 > 0;
  v62 = sub_100005070(&qword_100026D28);
  v63 = sub_100006878(&qword_100026D30, &qword_100026D28, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  ScrollView.init(_:showsIndicators:content:)(v61, 1, sub_100011584, &v97 - 6, v62, v63);
  v64 = swift_bridgeObjectRelease(v60);
  v65 = static HorizontalAlignment.center.getter(v64);
  v66 = (uint64_t)v107;
  *v107 = v65;
  *(_QWORD *)(v66 + 8) = 0x4014000000000000;
  *(_BYTE *)(v66 + 16) = 0;
  v67 = sub_100005070(&qword_100026D38);
  sub_10000CF94(v38, v49 > 0, v66 + *(int *)(v67 + 44));
  v68 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v68, "bounds");
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;

  v120.origin.x = v70;
  v120.origin.y = v72;
  v120.size.width = v74;
  v120.size.height = v76;
  if (CGRectGetHeight(v120) > 750.0)
    v78 = 10.0;
  else
    v78 = 0.0;
  v79 = static Edge.Set.all.getter(v77);
  v80 = v106;
  sub_100005908(v66, v106, &qword_100026D00);
  v81 = v80 + *(int *)(v105 + 36);
  *(_BYTE *)v81 = v79;
  *(double *)(v81 + 8) = v78;
  *(_OWORD *)(v81 + 16) = xmmword_100017510;
  *(_QWORD *)(v81 + 32) = 0x4039000000000000;
  *(_BYTE *)(v81 + 40) = 0;
  sub_10000594C(v66, &qword_100026D00);
  v82 = v109;
  sub_100006240(v80, v109, &qword_100026D08);
  v83 = (uint64_t)v104;
  sub_100005908(v115, (uint64_t)v104, &qword_100026D20);
  v84 = v108;
  v85 = *(void (**)(char *, char *, uint64_t))(v108 + 16);
  v86 = v110;
  v87 = v114;
  v88 = v111;
  v85(v110, v114, v111);
  v89 = v112;
  sub_100005908(v82, v112, &qword_100026D08);
  v90 = v113;
  sub_100005908(v83, v113, &qword_100026D20);
  v91 = (int *)sub_100005070(&qword_100026D40);
  v85((char *)(v90 + v91[12]), v86, v88);
  v92 = v90 + v91[16];
  *(_QWORD *)v92 = 0;
  *(_BYTE *)(v92 + 8) = 1;
  sub_100005908(v89, v90 + v91[20], &qword_100026D08);
  sub_10000594C(v82, &qword_100026D08);
  v93 = *(void (**)(char *, uint64_t))(v84 + 8);
  v93(v87, v88);
  sub_10000594C(v115, &qword_100026D20);
  sub_10000594C(v89, &qword_100026D08);
  v93(v86, v88);
  return sub_10000594C(v83, &qword_100026D20);
}

uint64_t sub_10000B9D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  __int128 *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double Height;
  id v42;
  id v43;
  id v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  uint64_t v53;
  BOOL v54;
  BOOL v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  BOOL v90;
  id v91;
  id v92;
  uint64_t v93;
  double v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  double v118;
  CGFloat v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  double v126;
  void *v127;
  char v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  uint64_t v151;
  __int128 v152;
  _BYTE v153[408];
  char v154;
  _OWORD v155[30];
  __int128 v156;
  _BYTE v157[401];
  char v158;
  double v159;
  uint64_t v160;
  __int128 v161;
  char v162;
  _BYTE v163[400];
  char v164;
  uint64_t v165;
  uint64_t v166;
  BOOL v167;
  BOOL v168;
  char v169;
  __int128 v170;
  double v171;
  uint64_t v172;
  char v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;

  v146 = a4;
  v149 = a3;
  v147 = a2;
  *(_QWORD *)&v152 = a5;
  v144 = sub_100005070(&qword_100026C00);
  __chkstk_darwin(v144);
  v145 = (uint64_t)&v138 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = sub_100005070(&qword_100026AE0);
  __chkstk_darwin(v140);
  v8 = (char *)&v138 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Material(0);
  v141 = *(_QWORD *)(v9 - 8);
  v142 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v138 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v143 = sub_100005070(&qword_100026C08);
  v12 = __chkstk_darwin(v143);
  v14 = (_OWORD *)((char *)&v138 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v138 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (_OWORD *)((char *)&v138 - v19);
  __chkstk_darwin(v18);
  v22 = (char *)&v138 - v21;
  v23 = sub_100005070(&qword_100026C10);
  v24 = __chkstk_darwin(v23);
  v151 = (uint64_t)&v138 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v150 = (uint64_t *)((char *)&v138 - v26);
  v27 = *(_BYTE *)(a1 + 112);
  v148 = a1;
  v28 = (__int128 *)(a1 + 80);
  if ((v27 & 1) != 0)
  {
    v156 = *v28;
    v77 = sub_100005070(&qword_100026AA0);
    State.wrappedValue.getter(v155, v77);
    v78 = *(_QWORD *)&v155[0];
    v156 = *v28;
    State.wrappedValue.getter(v155, v77);
    v79 = *(_QWORD *)&v155[0];
    if (*(_QWORD *)&v155[0] >> 62)
    {
      if (*(uint64_t *)&v155[0] < 0)
        v137 = *(_QWORD *)&v155[0];
      else
        v137 = *(_QWORD *)&v155[0] & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)&v155[0]);
      v80 = _CocoaArrayWrapper.endIndex.getter(v137);
      swift_bridgeObjectRelease(v79);
    }
    else
    {
      v80 = *(_QWORD *)((*(_QWORD *)&v155[0] & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v79);
    v81 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v81, "bounds");
    v83 = v82;
    v85 = v84;
    v87 = v86;
    v89 = v88;

    v176.origin.x = v83;
    v176.origin.y = v85;
    v176.size.width = v87;
    v176.size.height = v89;
    v90 = CGRectGetHeight(v176) <= 750.0;
    v91 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v92 = objc_msgSend(v91, "userInterfaceIdiom");

    LOBYTE(v91) = static Edge.Set.top.getter(v93);
    v94 = EdgeInsets.init(_all:)(20.0);
    v164 = 2;
    v165 = v78;
    v166 = v80;
    v167 = v90;
    v168 = v92 == (id)1;
    v169 = (char)v91;
    *(double *)&v170 = v94;
    *((_QWORD *)&v170 + 1) = v95;
    v171 = v96;
    v172 = v97;
    v173 = 0;
    v99 = static Alignment.center.getter(v98);
    sub_100008D40(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v156, 0.0, 1, INFINITY, 0, v99, v100);
    v101 = swift_bridgeObjectRelease(v78);
    v155[8] = *(_OWORD *)&v157[112];
    v155[9] = *(_OWORD *)&v157[128];
    v155[10] = *(_OWORD *)&v157[144];
    v155[11] = *(_OWORD *)&v157[160];
    v155[4] = *(_OWORD *)&v157[48];
    v155[5] = *(_OWORD *)&v157[64];
    v155[6] = *(_OWORD *)&v157[80];
    v155[7] = *(_OWORD *)&v157[96];
    v155[0] = v156;
    v155[1] = *(_OWORD *)v157;
    v155[2] = *(_OWORD *)&v157[16];
    v155[3] = *(_OWORD *)&v157[32];
    v102 = static Material.thin.getter(v101);
    v103 = static Edge.Set.all.getter(v102);
    v105 = v141;
    v104 = v142;
    (*(void (**)(char *, char *, uint64_t))(v141 + 16))(v8, v11, v142);
    v8[*(int *)(v140 + 36)] = v103;
    v106 = v143;
    sub_100005908((uint64_t)v8, (uint64_t)v20 + *(int *)(v143 + 36), &qword_100026AE0);
    v107 = v155[9];
    v20[8] = v155[8];
    v20[9] = v107;
    v108 = v155[11];
    v20[10] = v155[10];
    v20[11] = v108;
    v109 = v155[5];
    v20[4] = v155[4];
    v20[5] = v109;
    v110 = v155[7];
    v20[6] = v155[6];
    v20[7] = v110;
    v111 = v155[1];
    *v20 = v155[0];
    v20[1] = v111;
    v112 = v155[3];
    v20[2] = v155[2];
    v20[3] = v112;
    sub_1000112E8((uint64_t)v155);
    sub_10000594C((uint64_t)v8, &qword_100026AE0);
    (*(void (**)(char *, uint64_t))(v105 + 8))(v11, v104);
    sub_100010C54((uint64_t)v155);
    sub_100006240((uint64_t)v20, (uint64_t)v22, &qword_100026C08);
    v113 = v145;
    sub_100005908((uint64_t)v22, v145, &qword_100026C08);
    swift_storeEnumTagMultiPayload(v113, v144, 0);
    v114 = sub_100010C7C();
    v75 = v150;
    _ConditionalContent<>.init(storage:)(v150, v113, v106, v106, v114, v114);
    v76 = (uint64_t)v22;
  }
  else
  {
    v156 = *v28;
    v29 = sub_100005070(&qword_100026AA0);
    State.wrappedValue.getter(v155, v29);
    v138 = *(_QWORD *)&v155[0];
    v156 = *v28;
    State.wrappedValue.getter(v155, v29);
    v30 = *(_QWORD *)&v155[0];
    if (*(_QWORD *)&v155[0] >> 62)
    {
      if (*(uint64_t *)&v155[0] < 0)
        v136 = *(_QWORD *)&v155[0];
      else
        v136 = *(_QWORD *)&v155[0] & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)&v155[0]);
      v139 = _CocoaArrayWrapper.endIndex.getter(v136);
      swift_bridgeObjectRelease(v30);
    }
    else
    {
      v139 = *(_QWORD *)((*(_QWORD *)&v155[0] & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v30);
    v31 = (void *)objc_opt_self(UIScreen);
    v32 = objc_msgSend(v31, "mainScreen");
    objc_msgSend(v32, "bounds");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

    v174.origin.x = v34;
    v174.origin.y = v36;
    v174.size.width = v38;
    v174.size.height = v40;
    Height = CGRectGetHeight(v174);
    v42 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    v43 = objc_msgSend(v42, "userInterfaceIdiom");

    v44 = objc_msgSend(v31, "mainScreen");
    objc_msgSend(v44, "bounds");
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;

    v175.origin.x = v46;
    v175.origin.y = v48;
    v175.size.width = v50;
    v175.size.height = v52;
    v54 = Height <= 750.0;
    v55 = v43 == (id)1;
    if (CGRectGetHeight(v175) > 750.0)
      v56 = 5.0;
    else
      v56 = 25.0;
    v57 = static Edge.Set.all.getter(v53);
    v164 = 2;
    v58 = v138;
    v165 = v138;
    v166 = v139;
    v167 = v54;
    v168 = v55;
    v169 = v57;
    v170 = xmmword_1000174F0;
    v171 = v56;
    v172 = 0x4039000000000000;
    v173 = 0;
    v59 = static Alignment.center.getter(v57);
    sub_100008D40(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v156, 0.0, 1, INFINITY, 0, v59, v60);
    v61 = swift_bridgeObjectRelease(v58);
    v155[8] = *(_OWORD *)&v157[112];
    v155[9] = *(_OWORD *)&v157[128];
    v155[10] = *(_OWORD *)&v157[144];
    v155[11] = *(_OWORD *)&v157[160];
    v155[4] = *(_OWORD *)&v157[48];
    v155[5] = *(_OWORD *)&v157[64];
    v155[6] = *(_OWORD *)&v157[80];
    v155[7] = *(_OWORD *)&v157[96];
    v155[0] = v156;
    v155[1] = *(_OWORD *)v157;
    v155[2] = *(_OWORD *)&v157[16];
    v155[3] = *(_OWORD *)&v157[32];
    v62 = static Material.thin.getter(v61);
    v63 = static Edge.Set.all.getter(v62);
    v65 = v141;
    v64 = v142;
    (*(void (**)(char *, char *, uint64_t))(v141 + 16))(v8, v11, v142);
    v8[*(int *)(v140 + 36)] = v63;
    v66 = v143;
    sub_100005908((uint64_t)v8, (uint64_t)v14 + *(int *)(v143 + 36), &qword_100026AE0);
    v67 = v155[9];
    v14[8] = v155[8];
    v14[9] = v67;
    v68 = v155[11];
    v14[10] = v155[10];
    v14[11] = v68;
    v69 = v155[5];
    v14[4] = v155[4];
    v14[5] = v69;
    v70 = v155[7];
    v14[6] = v155[6];
    v14[7] = v70;
    v71 = v155[1];
    *v14 = v155[0];
    v14[1] = v71;
    v72 = v155[3];
    v14[2] = v155[2];
    v14[3] = v72;
    sub_1000112E8((uint64_t)v155);
    sub_10000594C((uint64_t)v8, &qword_100026AE0);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v11, v64);
    sub_100010C54((uint64_t)v155);
    sub_100006240((uint64_t)v14, (uint64_t)v17, &qword_100026C08);
    v73 = v145;
    sub_100005908((uint64_t)v17, v145, &qword_100026C08);
    swift_storeEnumTagMultiPayload(v73, v144, 1);
    v74 = sub_100010C7C();
    v75 = v150;
    _ConditionalContent<>.init(storage:)(v150, v73, v66, v66, v74, v74);
    v76 = (uint64_t)v17;
  }
  v115 = sub_10000594C(v76, &qword_100026C08);
  v116 = static HorizontalAlignment.center.getter(v115);
  sub_10000C478(v147, v149, v148, v146 & 1, v163);
  v117 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v117, "bounds");
  v119 = v118;
  v121 = v120;
  v123 = v122;
  v125 = v124;

  v177.origin.x = v119;
  v177.origin.y = v121;
  v177.size.width = v123;
  v177.size.height = v125;
  if (CGRectGetHeight(v177) > 750.0)
    v126 = 10.0;
  else
    v126 = 0.0;
  v153[400] = 1;
  v127 = memcpy(&v153[7], v163, 0x189uLL);
  v128 = static Edge.Set.all.getter(v127);
  v154 = 0;
  v129 = v151;
  sub_100005908((uint64_t)v75, v151, &qword_100026C10);
  v130 = v154;
  v131 = v152;
  sub_100005908(v129, v152, &qword_100026C10);
  v132 = sub_100005070(&qword_100026D68);
  v133 = v131 + *(int *)(v132 + 48);
  *(_QWORD *)v133 = 0;
  *(_BYTE *)(v133 + 8) = 1;
  v134 = (void *)(v131 + *(int *)(v132 + 64));
  v155[0] = (unint64_t)v116;
  LOBYTE(v155[1]) = 1;
  memcpy((char *)&v155[1] + 1, v153, 0x190uLL);
  BYTE8(v155[26]) = v128;
  *(double *)&v155[27] = v126;
  *((_QWORD *)&v155[27] + 1) = 0x4039000000000000;
  v152 = xmmword_100017520;
  v155[28] = xmmword_100017520;
  LOBYTE(v155[29]) = v130;
  memcpy(v134, v155, 0x1D1uLL);
  sub_1000116B8((uint64_t)v155);
  sub_10000594C((uint64_t)v75, &qword_100026C10);
  v156 = (unint64_t)v116;
  v157[0] = 1;
  memcpy(&v157[1], v153, 0x190uLL);
  v158 = v128;
  v159 = v126;
  v160 = 0x4039000000000000;
  v161 = v152;
  v162 = v130;
  sub_1000117A8((uint64_t)&v156);
  return sub_10000594C(v129, &qword_100026C10);
}

uint64_t sub_10000C478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, void *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  BOOL v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  Swift::String v60;
  Swift::String v61;
  char *v62;
  uint64_t v63;
  char *v64;
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
  char *v76;
  char v77;
  char v78;
  unint64_t v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  id v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  double v98;
  double v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  double v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  double v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  unint64_t v131;
  char *v132;
  char *v133;
  int v134;
  int v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t KeyPath;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  double v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  _DWORD v153[2];
  _DWORD v154[2];
  _DWORD v155[2];
  _DWORD v156[2];
  _DWORD v157[2];
  _DWORD v158[2];
  _DWORD v159[2];
  unsigned __int8 v160;
  char v161;
  char v162;
  char v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  unsigned __int8 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  char v189;
  _OWORD v190[25];
  _QWORD v191[2];
  char v192;
  unint64_t v193;
  char v194;
  double v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  char v199;
  char v200;
  double v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  char v205;
  uint64_t v206;
  char v207;
  uint64_t v208;
  char v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  char v214;
  _QWORD v215[2];
  char v216;
  _BYTE v217[7];
  uint64_t v218;
  char v219;
  _BYTE v220[7];
  double v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  char v225;
  _BYTE v226[7];
  char v227;
  _BYTE v228[7];
  double v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  char v233;
  _BYTE v234[7];
  uint64_t v235;
  char v236;
  _BYTE v237[7];
  uint64_t v238;
  char v239;
  _BYTE v240[7];
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  char v245;
  unsigned __int8 v246;
  unsigned __int8 v247;
  unsigned __int8 v248;
  unsigned __int8 v249;
  _BYTE v250[7];
  _BYTE v251[7];
  _BYTE v252[7];
  _BYTE v253[7];
  _BYTE v254[7];
  _BYTE v255[7];
  _DWORD v256[7];
  CGRect v257;
  CGRect v258;

  LODWORD(v123) = a4;
  v128 = a3;
  v130 = a5;
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v133 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v132 = (char *)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v11);
  v127 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005070(&qword_100026488);
  __chkstk_darwin(v13);
  v15 = (char *)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v190[0] = a1;
  *((_QWORD *)&v190[0] + 1) = a2;
  v16 = sub_100005818();
  swift_bridgeObjectRetain(a2);
  v131 = v16;
  v17 = Text.init<A>(_:)(v190, &type metadata for String, v16);
  v19 = v18;
  v150 = v20;
  v22 = v21 & 1;
  v23 = static Font.Weight.bold.getter();
  v24 = enum case for Font.Design.default(_:);
  v25 = type metadata accessor for Font.Design(0);
  v26 = *(_QWORD *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 104))(v15, v24, v25);
  v125 = *(double *)(v26 + 56);
  v126 = v25;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))&v125)(v15, 0, 1, v25);
  v27 = static Font.system(size:weight:design:)(*(_QWORD *)&v23, 0, v15, 34.0);
  v28 = v15;
  sub_10000594C((uint64_t)v15, &qword_100026488);
  v29 = v150;
  v129 = Text.font(_:)(v27, v17, v19, v22, v150);
  v151 = v30;
  v152 = v31;
  v33 = v32;
  swift_release(v27);
  sub_10000585C(v17, v19, v22);
  v34 = swift_bridgeObjectRelease(v29);
  LODWORD(v150) = static Edge.Set.horizontal.getter(v34);
  v35 = EdgeInsets.init(_all:)(20.0);
  v148 = v36;
  v149 = v35;
  v146 = v38;
  v147 = v37;
  v145 = static Edge.Set.vertical.getter();
  v124 = (id)objc_opt_self(UIScreen);
  v39 = objc_msgSend(v124, "mainScreen");
  objc_msgSend(v39, "bounds");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;

  v257.origin.x = v41;
  v257.origin.y = v43;
  v257.size.width = v45;
  v257.size.height = v47;
  v48 = CGRectGetHeight(v257) > 750.0;
  v49 = 3.0;
  if (!v48)
    v49 = 1.0;
  v50 = EdgeInsets.init(_all:)(v49);
  v143 = v51;
  v144 = v50;
  v141 = v53;
  v142 = v52;
  v248 = v33 & 1;
  v247 = 0;
  v246 = 0;
  KeyPath = swift_getKeyPath(&unk_100017850);
  v134 = v248;
  v135 = v247;
  v137 = v246;
  v139 = swift_getKeyPath(&unk_100017880);
  v138 = swift_getKeyPath(&unk_1000178B0);
  v136 = swift_getKeyPath(&unk_1000178E0);
  v249 = 0;
  v54 = v127;
  if ((v123 & 1) != 0)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(36, 1);
    v55 = 0xD000000000000024;
    v56 = 0x8000000100018130;
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1);
    v56 = 0x8000000100018100;
    v55 = 0xD000000000000020;
  }
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v55);
  v57 = *(_QWORD *)(v128 + 8);
  v58 = *(_QWORD *)(v57 + 16);
  v59 = *(void **)(v57 + 24);
  swift_bridgeObjectRetain(v59);
  v60._countAndFlagsBits = v58;
  v60._object = v59;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v60);
  swift_bridgeObjectRelease(v59);
  v61._countAndFlagsBits = 0;
  v61._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v61);
  v62 = v132;
  v63 = String.LocalizationValue.init(stringInterpolation:)(v54);
  v64 = v133;
  static Locale.current.getter(v63);
  *(_QWORD *)&v190[0] = String.init(localized:table:bundle:locale:comment:)(v62, 0, 0, 0, v64, 0, 0, 256);
  *((_QWORD *)&v190[0] + 1) = v65;
  v66 = Text.init<A>(_:)(v190, &type metadata for String, v131);
  v68 = v67;
  v70 = v69;
  v72 = v71 & 1;
  v73 = (uint64_t)v28;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))&v125)(v28, 1, 1, v126);
  v74 = static Font.system(size:weight:design:)(0, 1, v28, 17.0);
  sub_10000594C(v73, &qword_100026488);
  v75 = Text.font(_:)(v74, v66, v68, v72, v70);
  v132 = v76;
  v133 = (char *)v75;
  v78 = v77;
  v131 = v79;
  swift_release(v74);
  sub_10000585C(v66, v68, v72);
  v80 = swift_bridgeObjectRelease(v70);
  LODWORD(v128) = static Edge.Set.horizontal.getter(v80);
  v81 = EdgeInsets.init(_all:)(5.0);
  v83 = v82;
  v85 = v84;
  v87 = v86;
  v88 = static Edge.Set.vertical.getter();
  v89 = objc_msgSend(v124, "mainScreen");
  objc_msgSend(v89, "bounds");
  v91 = v90;
  v93 = v92;
  v95 = v94;
  v97 = v96;

  v258.origin.x = v91;
  v258.origin.y = v93;
  v258.size.width = v95;
  v258.size.height = v97;
  v48 = CGRectGetHeight(v258) > 750.0;
  v98 = 10.0;
  if (!v48)
    v98 = 1.0;
  v99 = EdgeInsets.init(_all:)(v98);
  v124 = v100;
  v125 = v99;
  v122 = v102;
  v123 = v101;
  v162 = v78 & 1;
  v161 = 0;
  v160 = 0;
  v103 = swift_getKeyPath(&unk_100017850);
  v121 = v103;
  v104 = v162;
  v105 = v161;
  LODWORD(v126) = v160;
  v106 = swift_getKeyPath(&unk_100017880);
  v119 = v106;
  v107 = swift_getKeyPath(&unk_1000178B0);
  v120 = v107;
  v118 = swift_getKeyPath(&unk_1000178E0);
  v163 = 0;
  v159[0] = v256[0];
  *(_DWORD *)((char *)v159 + 3) = *(_DWORD *)((char *)v256 + 3);
  v158[0] = *(_DWORD *)v255;
  *(_DWORD *)((char *)v158 + 3) = *(_DWORD *)&v255[3];
  v157[0] = *(_DWORD *)v254;
  *(_DWORD *)((char *)v157 + 3) = *(_DWORD *)&v254[3];
  *(_DWORD *)((char *)v156 + 3) = *(_DWORD *)&v253[3];
  v156[0] = *(_DWORD *)v253;
  *(_DWORD *)((char *)v155 + 3) = *(_DWORD *)&v252[3];
  v155[0] = *(_DWORD *)v252;
  *(_DWORD *)((char *)v154 + 3) = *(_DWORD *)&v251[3];
  v154[0] = *(_DWORD *)v251;
  *(_DWORD *)((char *)v153 + 3) = *(_DWORD *)&v250[3];
  v153[0] = *(_DWORD *)v250;
  DWORD1(v165) = *(_DWORD *)((char *)v256 + 3);
  *(_DWORD *)((char *)&v165 + 1) = v256[0];
  DWORD1(v166) = *(_DWORD *)&v255[3];
  *(_DWORD *)((char *)&v166 + 1) = *(_DWORD *)v255;
  HIDWORD(v168) = *(_DWORD *)&v254[3];
  LODWORD(v127) = v249;
  *((_QWORD *)&v164 + 1) = v151;
  LOBYTE(v165) = v134;
  *((_QWORD *)&v165 + 1) = v152;
  LOBYTE(v166) = v150;
  *((double *)&v166 + 1) = v149;
  *(_QWORD *)&v167 = v148;
  *((_QWORD *)&v167 + 1) = v147;
  *(_QWORD *)&v168 = v146;
  BYTE8(v168) = v135;
  *(_DWORD *)((char *)&v168 + 9) = *(_DWORD *)v254;
  LOBYTE(v169) = v145;
  DWORD1(v169) = *(_DWORD *)&v253[3];
  *(_DWORD *)((char *)&v169 + 1) = *(_DWORD *)v253;
  *((double *)&v169 + 1) = v144;
  *(_QWORD *)&v170 = v143;
  *((_QWORD *)&v170 + 1) = v142;
  *(_QWORD *)&v171 = v141;
  BYTE8(v171) = v137;
  HIDWORD(v171) = *(_DWORD *)&v252[3];
  *(_DWORD *)((char *)&v171 + 9) = *(_DWORD *)v252;
  *(_QWORD *)&v172 = KeyPath;
  BYTE8(v172) = 1;
  HIDWORD(v172) = *(_DWORD *)&v251[3];
  *(_DWORD *)((char *)&v172 + 9) = *(_DWORD *)v251;
  *(_QWORD *)&v173 = v139;
  BYTE8(v173) = 1;
  HIDWORD(v173) = *(_DWORD *)&v250[3];
  *(_DWORD *)((char *)&v173 + 9) = *(_DWORD *)v250;
  *(_QWORD *)&v174 = v138;
  *((_QWORD *)&v174 + 1) = 0x3FE0000000000000;
  *(_QWORD *)&v175 = v136;
  *((_QWORD *)&v175 + 1) = 2;
  v176 = v249;
  *(_QWORD *)&v177 = v133;
  *((_QWORD *)&v177 + 1) = v132;
  *((_QWORD *)&v178 + 1) = v131;
  v108 = v81;
  *((double *)&v179 + 1) = v81;
  *(_QWORD *)&v180 = v83;
  v109 = v83;
  v110 = v85;
  *((_QWORD *)&v180 + 1) = v85;
  *(_QWORD *)&v181 = v87;
  v111 = v87;
  v112 = v124;
  v113 = v125;
  *((double *)&v182 + 1) = v125;
  *(_QWORD *)&v183 = v124;
  v114 = v122;
  v115 = v123;
  *((_QWORD *)&v183 + 1) = v123;
  *(_QWORD *)&v184 = v122;
  *(_QWORD *)&v185 = v103;
  *(_QWORD *)&v186 = v106;
  *(_QWORD *)&v187 = v107;
  *((_QWORD *)&v187 + 1) = 0x3FE0000000000000;
  LOBYTE(v190[12]) = v249;
  *(_QWORD *)&v188 = v118;
  *((_QWORD *)&v188 + 1) = 4;
  LOBYTE(v178) = v104;
  LOBYTE(v107) = v128;
  LOBYTE(v179) = v128;
  BYTE8(v181) = v105;
  LOBYTE(v182) = v88;
  LOBYTE(v106) = v126;
  BYTE8(v184) = v126;
  BYTE8(v185) = 1;
  BYTE8(v186) = 1;
  v189 = 0;
  *(_OWORD *)((char *)&v190[22] + 8) = v187;
  *(_OWORD *)((char *)&v190[23] + 8) = v188;
  *(_OWORD *)((char *)&v190[18] + 8) = v183;
  *(_OWORD *)((char *)&v190[19] + 8) = v184;
  *(_OWORD *)((char *)&v190[20] + 8) = v185;
  *(_OWORD *)((char *)&v190[21] + 8) = v186;
  *(_OWORD *)((char *)&v190[16] + 8) = v181;
  *(_OWORD *)((char *)&v190[17] + 8) = v182;
  BYTE8(v190[24]) = 0;
  v116 = v129;
  *(_QWORD *)&v164 = v129;
  v190[10] = v174;
  v190[11] = v175;
  v190[6] = v170;
  v190[7] = v171;
  v190[8] = v172;
  v190[9] = v173;
  v190[2] = v166;
  v190[3] = v167;
  v190[4] = v168;
  v190[5] = v169;
  v190[0] = v164;
  v190[1] = v165;
  *(_OWORD *)((char *)&v190[13] + 8) = v178;
  *(_OWORD *)((char *)&v190[14] + 8) = v179;
  *(_OWORD *)((char *)&v190[15] + 8) = v180;
  *(_OWORD *)((char *)&v190[12] + 8) = v177;
  memcpy(v130, v190, 0x189uLL);
  v191[0] = v133;
  v191[1] = v132;
  v192 = v104;
  v193 = v131;
  v194 = v107;
  v195 = v108;
  v196 = v109;
  v197 = v110;
  v198 = v111;
  v199 = v105;
  v200 = v88;
  v201 = v113;
  v202 = v112;
  v203 = v115;
  v204 = v114;
  v205 = v106;
  v206 = v121;
  v207 = 1;
  v208 = v119;
  v209 = 1;
  v210 = v120;
  v211 = 0x3FE0000000000000;
  v212 = v118;
  v213 = 4;
  v214 = 0;
  sub_1000111F0((uint64_t)&v164);
  sub_1000111F0((uint64_t)&v177);
  sub_10001126C((uint64_t)v191);
  v215[0] = v116;
  v215[1] = v151;
  v216 = v134;
  *(_DWORD *)v217 = v159[0];
  *(_DWORD *)&v217[3] = *(_DWORD *)((char *)v159 + 3);
  v218 = v152;
  v219 = v150;
  *(_DWORD *)v220 = v158[0];
  *(_DWORD *)&v220[3] = *(_DWORD *)((char *)v158 + 3);
  v221 = v149;
  v222 = v148;
  v223 = v147;
  v224 = v146;
  v225 = v135;
  *(_DWORD *)&v226[3] = *(_DWORD *)((char *)v157 + 3);
  *(_DWORD *)v226 = v157[0];
  v227 = v145;
  *(_DWORD *)&v228[3] = *(_DWORD *)((char *)v156 + 3);
  *(_DWORD *)v228 = v156[0];
  v229 = v144;
  v230 = v143;
  v231 = v142;
  v232 = v141;
  v233 = v137;
  *(_DWORD *)&v234[3] = *(_DWORD *)((char *)v155 + 3);
  *(_DWORD *)v234 = v155[0];
  v235 = KeyPath;
  v236 = 1;
  *(_DWORD *)v237 = v154[0];
  *(_DWORD *)&v237[3] = *(_DWORD *)((char *)v154 + 3);
  v238 = v139;
  v239 = 1;
  *(_DWORD *)v240 = v153[0];
  *(_DWORD *)&v240[3] = *(_DWORD *)((char *)v153 + 3);
  v241 = v138;
  v242 = 0x3FE0000000000000;
  v243 = v136;
  v244 = 2;
  v245 = (char)v127;
  return sub_10001126C((uint64_t)v215);
}

uint64_t sub_10000CF94@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  __int128 v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void (*v71)(char *, char *, uint64_t);
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t (*v83)(char *, uint64_t);
  void (*v84)(char *, char *, uint64_t);
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  _BYTE v104[32];
  _BYTE v105[24];
  uint64_t v106;
  _OWORD v107[3];
  _OWORD v108[3];

  v103 = a2;
  v100 = a3;
  v97 = type metadata accessor for DefaultButtonStyle(0);
  v99 = *(_QWORD *)(v97 - 8);
  __chkstk_darwin(v97);
  v94 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = sub_100005070(&qword_100026D48);
  v96 = *(_QWORD *)(v98 - 8);
  v5 = __chkstk_darwin(v98);
  v93 = (char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v95 = (char *)&v80 - v7;
  v92 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v92);
  v9 = (_OWORD *)((char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v89 = type metadata accessor for BorderedProminentButtonStyle(0);
  v91 = *(_QWORD *)(v89 - 8);
  __chkstk_darwin(v89);
  v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_100005070(&qword_100026B98);
  v12 = *(_QWORD *)(v102 - 8);
  __chkstk_darwin(v102);
  v14 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_100005070(&qword_100026BA0);
  __chkstk_darwin(v101);
  v16 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_100005070(&qword_100026BA8);
  v88 = *(_QWORD *)(v90 - 8);
  __chkstk_darwin(v90);
  v18 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_100005070(&qword_100026D50);
  v19 = __chkstk_darwin(v82);
  v21 = (char *)&v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v87 = (uint64_t)&v80 - v22;
  v23 = swift_allocObject(&unk_100021840, 129, 7);
  v24 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v23 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v23 + 96) = v24;
  *(_OWORD *)(v23 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v23 + 128) = *(_BYTE *)(a1 + 112);
  v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 32) = v25;
  v26 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 64) = v26;
  v105[16] = v103;
  v106 = a1;
  sub_1000106C8((_QWORD *)a1);
  v27 = sub_100005070(&qword_100026BC8);
  v86 = v27;
  v85 = sub_100010A90();
  v28 = Button.init(action:label:)(sub_1000115F4, v23, sub_1000115FC, v105, v27, v85);
  v29 = static Alignment.center.getter(v28);
  _FrameLayout.init(width:height:alignment:)(v107, 0, 1, 0x4049000000000000, 0, v29, v30);
  v84 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v31 = v102;
  v84(v16, v14, v102);
  v32 = v101;
  v33 = &v16[*(int *)(v101 + 36)];
  v34 = v107[1];
  *(_OWORD *)v33 = v107[0];
  *((_OWORD *)v33 + 1) = v34;
  *((_OWORD *)v33 + 2) = v107[2];
  v83 = *(uint64_t (**)(char *, uint64_t))(v12 + 8);
  v35 = v83(v14, v31);
  BorderedProminentButtonStyle.init()(v35);
  v36 = sub_100010AF4();
  v81 = v36;
  v37 = sub_100011678(&qword_100026BE8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
  v38 = v89;
  View.buttonStyle<A>(_:)(v11, v32, v89, v36, v37);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v11, v38);
  sub_10000594C((uint64_t)v16, &qword_100026BA0);
  v39 = (char *)v9 + *(int *)(v92 + 20);
  v40 = enum case for RoundedCornerStyle.continuous(_:);
  v41 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v39, v40, v41);
  __asm { FMOV            V0.2D, #14.0 }
  *v9 = _Q0;
  v47 = (uint64_t)&v21[*(int *)(v82 + 36)];
  sub_100010BC8((uint64_t)v9, v47);
  *(_WORD *)(v47 + *(int *)(sub_100005070(&qword_100026BF0) + 36)) = 256;
  v48 = v88;
  v49 = v90;
  (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v21, v18, v90);
  sub_100010C0C((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v49);
  v50 = v87;
  sub_100006240((uint64_t)v21, v87, &qword_100026D50);
  v51 = swift_allocObject(&unk_100021868, 137, 7);
  v52 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v51 + 88) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v51 + 104) = v52;
  *(_OWORD *)(v51 + 120) = *(_OWORD *)(a1 + 96);
  v53 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v51 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v51 + 40) = v53;
  v54 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v51 + 56) = *(_OWORD *)(a1 + 32);
  v55 = v103;
  *(_BYTE *)(v51 + 16) = v103;
  *(_BYTE *)(v51 + 136) = *(_BYTE *)(a1 + 112);
  *(_OWORD *)(v51 + 72) = v54;
  v104[16] = v55;
  sub_1000106C8((_QWORD *)a1);
  v56 = Button.init(action:label:)(sub_100011664, v51, sub_100011670, v104, v86, v85);
  v57 = static Alignment.center.getter(v56);
  _FrameLayout.init(width:height:alignment:)(v108, 0, 1, 0x4049000000000000, 0, v57, v58);
  v59 = v102;
  v84(v16, v14, v102);
  v60 = v101;
  v61 = &v16[*(int *)(v101 + 36)];
  v62 = v108[1];
  *(_OWORD *)v61 = v108[0];
  *((_OWORD *)v61 + 1) = v62;
  *((_OWORD *)v61 + 2) = v108[2];
  v63 = v83(v14, v59);
  v64 = v94;
  DefaultButtonStyle.init()(v63);
  v65 = sub_100011678(&qword_100026D58, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DefaultButtonStyle, (uint64_t)&protocol conformance descriptor for DefaultButtonStyle);
  v66 = v93;
  v67 = v97;
  View.buttonStyle<A>(_:)(v64, v60, v97, v81, v65);
  (*(void (**)(char *, uint64_t))(v99 + 8))(v64, v67);
  sub_10000594C((uint64_t)v16, &qword_100026BA0);
  v68 = v96;
  v69 = v95;
  v70 = v98;
  (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v95, v66, v98);
  sub_100005908(v50, (uint64_t)v21, &qword_100026D50);
  v71 = *(void (**)(char *, char *, uint64_t))(v68 + 16);
  v72 = v68;
  v73 = v66;
  v74 = v66;
  v75 = v70;
  v71(v73, v69, v70);
  v76 = v100;
  sub_100005908((uint64_t)v21, v100, &qword_100026D50);
  v77 = sub_100005070(&qword_100026D60);
  v71((char *)(v76 + *(int *)(v77 + 48)), v74, v75);
  v78 = *(void (**)(char *, uint64_t))(v72 + 8);
  v78(v69, v75);
  sub_10000594C(v50, &qword_100026D50);
  v78(v74, v75);
  return sub_10000594C((uint64_t)v21, &qword_100026D50);
}

uint64_t sub_10000D734(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(void (**)(uint64_t))(v1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 40);
    swift_retain(v3);
    v4 = sub_100005070(&qword_100026AA0);
    State.wrappedValue.getter(&v6, v4);
    v5 = v6;
    v2(v6);
    sub_10000758C((uint64_t)v2, v3);
    return swift_bridgeObjectRelease(v5);
  }
  return result;
}

__n128 sub_10000D7B8@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __n128 result;
  uint64_t v50;
  uint64_t v52[3];
  _OWORD v53[11];

  v6 = sub_100005070(&qword_100026488);
  __chkstk_darwin(v6);
  v8 = (char *)&v52[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Locale(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v52[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v52[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    v53[0] = *(_OWORD *)(a2 + 80);
    v15 = sub_100005070(&qword_100026AA0);
    State.wrappedValue.getter(v52, v15);
    v16 = v52[0];
    if ((unint64_t)v52[0] >> 62)
    {
      if (v52[0] < 0)
        v50 = v52[0];
      else
        v50 = v52[0] & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v52[0]);
      v17 = _CocoaArrayWrapper.endIndex.getter(v50);
      swift_bridgeObjectRelease(v16);
    }
    else
    {
      v17 = *(_QWORD *)((v52[0] & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v16);
    if (v17 == 1)
    {
      v18 = 0xD000000000000027;
      v19 = 0x80000001000180D0;
    }
    else
    {
      v19 = 0x80000001000180A0;
      v18 = 0xD000000000000025;
    }
  }
  else
  {
    v18 = 0x45554E49544E4F43;
    v19 = 0xEF4E4F545455425FLL;
  }
  v20 = String.LocalizationValue.init(stringLiteral:)(v18, v19);
  static Locale.current.getter(v20);
  *(_QWORD *)&v53[0] = String.init(localized:table:bundle:locale:comment:)(v14, 0, 0, 0, v11, 0, 0, 256);
  *((_QWORD *)&v53[0] + 1) = v21;
  v22 = sub_100005818();
  v23 = Text.init<A>(_:)(v53, &type metadata for String, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28 & 1;
  v30 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v8, 1, 1, v30);
  v31 = static Font.system(size:weight:design:)(0, 1, v8, 18.0);
  v32 = sub_10000594C((uint64_t)v8, &qword_100026488);
  v33 = static Font.Weight.semibold.getter(v32);
  v34 = Font.weight(_:)(v31, v33);
  swift_release(v31);
  v35 = Text.font(_:)(v34, v23, v25, v29, v27);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  swift_release(v34);
  sub_10000585C(v23, v25, v29);
  v42 = swift_bridgeObjectRelease(v27);
  v43 = static Alignment.center.getter(v42);
  sub_100008EEC(0.0, 1, 0.0, 1, INFINITY, 0, 50.0, 0, (uint64_t)v53, 0.0, 1, 0.0, 1, v43, v44, v35, v37, v39 & 1, v41);
  sub_10000585C(v35, v37, v39 & 1);
  swift_bridgeObjectRelease(v41);
  v45 = v53[7];
  v46 = v53[8];
  *(_OWORD *)(a3 + 96) = v53[6];
  *(_OWORD *)(a3 + 112) = v45;
  *(_OWORD *)(a3 + 128) = v46;
  v47 = v53[3];
  *(_OWORD *)(a3 + 32) = v53[2];
  *(_OWORD *)(a3 + 48) = v47;
  v48 = v53[5];
  *(_OWORD *)(a3 + 64) = v53[4];
  *(_OWORD *)(a3 + 80) = v48;
  result = (__n128)v53[1];
  *(_OWORD *)a3 = v53[0];
  *(__n128 *)(a3 + 16) = result;
  return result;
}

uint64_t sub_10000DB30(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(void *);
  uint64_t v4;
  uint64_t v5;
  char v6;
  __int128 v7;

  if ((result & 1) != 0)
  {
    v2 = *(_QWORD *)(a2 + 8);
    v3 = *(void (**)(void *))(v2 + 32);
    if (v3)
    {
      v4 = *(_QWORD *)(v2 + 40);
      swift_retain(v4);
      v3(&_swiftEmptyArrayStorage);
      return sub_10000758C((uint64_t)v3, v4);
    }
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 48);
    v6 = 1;
    v5 = sub_100005070(&qword_100026A30);
    return State.wrappedValue.setter(&v6, v5);
  }
  return result;
}

__n128 sub_10000DBBC@<Q0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __n128 result;
  _BYTE v44[32];
  _OWORD v45[10];

  v4 = sub_100005070(&qword_100026488);
  __chkstk_darwin(v4);
  v6 = &v44[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v44[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((a1 & 1) != 0)
    v13 = 0x5F574F4E5F544F4ELL;
  else
    v13 = 0x5F4B4341425F4F47;
  v14 = String.LocalizationValue.init(stringLiteral:)(v13, 0xEE004E4F54545542);
  static Locale.current.getter(v14);
  *(_QWORD *)&v45[0] = String.init(localized:table:bundle:locale:comment:)(v12, 0, 0, 0, v9, 0, 0, 256);
  *((_QWORD *)&v45[0] + 1) = v15;
  v16 = sub_100005818();
  v17 = Text.init<A>(_:)(v45, &type metadata for String, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  v24 = type metadata accessor for Font.Design(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v6, 1, 1, v24);
  v25 = static Font.system(size:weight:design:)(0, 1, v6, 18.0);
  v26 = sub_10000594C((uint64_t)v6, &qword_100026488);
  v27 = static Font.Weight.semibold.getter(v26);
  v28 = Font.weight(_:)(v25, v27);
  swift_release(v25);
  v29 = Text.font(_:)(v28, v17, v19, v23, v21);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  swift_release(v28);
  sub_10000585C(v17, v19, v23);
  v36 = swift_bridgeObjectRelease(v21);
  v37 = static Alignment.center.getter(v36);
  sub_100008EEC(0.0, 1, 0.0, 1, INFINITY, 0, 50.0, 0, (uint64_t)v45, 0.0, 1, 0.0, 1, v37, v38, v29, v31, v33 & 1, v35);
  sub_10000585C(v29, v31, v33 & 1);
  swift_bridgeObjectRelease(v35);
  v39 = v45[7];
  v40 = v45[8];
  *(_OWORD *)(a2 + 96) = v45[6];
  *(_OWORD *)(a2 + 112) = v39;
  *(_OWORD *)(a2 + 128) = v40;
  v41 = v45[3];
  *(_OWORD *)(a2 + 32) = v45[2];
  *(_OWORD *)(a2 + 48) = v41;
  v42 = v45[5];
  *(_OWORD *)(a2 + 64) = v45[4];
  *(_OWORD *)(a2 + 80) = v42;
  result = (__n128)v45[1];
  *(_OWORD *)a2 = v45[0];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_10000DE8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t OpaqueTypeConformance2;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36[16];
  uint64_t v37;
  char v38[16];
  uint64_t v39;
  ValueMetadata *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;

  v35 = a2;
  v34 = sub_100005070(&qword_100026C60);
  __chkstk_darwin(v34);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005070(&qword_100026C68);
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ToolbarItemPlacement(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100005070(&qword_100026C70);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static ToolbarItemPlacement.navigationBarLeading.getter(v13);
  v39 = a1;
  v16 = sub_100005070(&qword_100026C78);
  v17 = sub_100006878(&qword_100026C80, &qword_100026C78, (uint64_t)&protocol conformance descriptor for Button<A>);
  v18 = ToolbarItem<>.init(placement:content:)(v10, sub_100011318, v38, v16, v17);
  static ToolbarItemPlacement.navigationBarTrailing.getter(v18);
  v37 = a1;
  v19 = sub_100005070(&qword_100026C88);
  v20 = sub_1000053EC(&qword_100026C90);
  v21 = sub_1000053EC(&qword_100026C98);
  v22 = sub_100011328();
  v23 = sub_1000113C4();
  v40 = &type metadata for LimitedAccessSelectedContactsView;
  v41 = v23;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v40, &opaque type descriptor for <<opaque return type of View.presentationDetents(_:)>>, 1);
  v40 = (ValueMetadata *)v20;
  v41 = v21;
  v42 = v22;
  v43 = OpaqueTypeConformance2;
  v25 = swift_getOpaqueTypeConformance2(&v40, &opaque type descriptor for <<opaque return type of View.sheet<A>(isPresented:onDismiss:content:)>>, 1);
  ToolbarItem<>.init(placement:content:)(v10, sub_100011320, v36, v19, v25);
  v26 = v34;
  v27 = &v4[*(int *)(v34 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v4, v15, v11);
  v28 = v32;
  v29 = v27;
  v30 = v33;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v7, v33);
  TupleToolbarContent.init(_:)(v4, v26);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
}

uint64_t sub_10000E124(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v2 = swift_allocObject(&unk_100021818, 129, 7);
  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 96) = v3;
  *(_OWORD *)(v2 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v2 + 128) = *(_BYTE *)(a1 + 112);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  sub_1000106C8((_QWORD *)a1);
  v6 = sub_100005070(&qword_100026CD8);
  v7 = sub_100006878(&qword_100026CE0, &qword_100026CD8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  return Button.init(action:label:)(sub_100010A8C, v2, sub_10000E1E4, 0, v6, v7);
}

uint64_t sub_10000E1E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = static VerticalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v2 = sub_100005070(&qword_100026CE8);
  return sub_10000E228((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_10000E228@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  void (*v28)(char *, uint64_t);
  _QWORD v31[3];

  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v31[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v31[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100005070(&qword_100026CF0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v31[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v31[-1] - v13;
  v15 = Image.init(systemName:)(0xD000000000000010, 0x8000000100018040);
  v31[0] = v15;
  v16 = static Font.Weight.bold.getter();
  View.fontWeight(_:)(*(_QWORD *)&v16, 0, &type metadata for Image, &protocol witness table for Image);
  swift_release(v15);
  v17 = String.LocalizationValue.init(stringLiteral:)(1801675074, 0xE400000000000000);
  static Locale.current.getter(v17);
  v31[0] = String.init(localized:table:bundle:locale:comment:)(v7, 0, 0, 0, v4, 0, 0, 256);
  v31[1] = v18;
  v19 = sub_100005818();
  v20 = Text.init<A>(_:)(v31, &type metadata for String, v19);
  v22 = v21;
  v24 = v23;
  LOBYTE(v15) = v25 & 1;
  v26 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v26(v12, v14, v8);
  v26(a1, v12, v8);
  v27 = &a1[*(int *)(sub_100005070(&qword_100026CF8) + 48)];
  *(_QWORD *)v27 = v20;
  *((_QWORD *)v27 + 1) = v22;
  v27[16] = v15;
  *((_QWORD *)v27 + 3) = v24;
  sub_1000061C0(v20, v22, v15);
  v28 = *(void (**)(char *, uint64_t))(v9 + 8);
  swift_bridgeObjectRetain(v24);
  v28(v14, v8);
  sub_10000585C(v20, v22, v15);
  swift_bridgeObjectRelease(v24);
  return ((uint64_t (*)(char *, uint64_t))v28)(v12, v8);
}

uint64_t sub_10000E47C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t OpaqueTypeConformance2;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  unsigned __int8 v41;

  v2 = sub_100005070(&qword_100026CB0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005070(&qword_100026C90);
  __chkstk_darwin(v6);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject(&unk_100021750, 129, 7);
  v10 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v9 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v9 + 96) = v10;
  *(_OWORD *)(v9 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v9 + 128) = *(_BYTE *)(a1 + 112);
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v9 + 32) = v11;
  v12 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v9 + 64) = v12;
  sub_1000106C8((_QWORD *)a1);
  v13 = sub_100005070(&qword_100026CC8);
  v14 = sub_100006878(&qword_100026CD0, &qword_100026CC8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  Button.init(action:label:)(sub_10001140C, v9, sub_10000E818, 0, v13, v14);
  v40 = *(_OWORD *)(a1 + 80);
  v15 = sub_100005070(&qword_100026AA0);
  State.wrappedValue.getter(&v39, v15);
  v16 = v39;
  if ((unint64_t)v39 >> 62)
  {
    if ((uint64_t)v39 < 0)
      v38 = v39;
    else
      v38 = v39 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v39);
    v17 = _CocoaArrayWrapper.endIndex.getter(v38);
    swift_bridgeObjectRelease(v16);
  }
  else
  {
    v17 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v16);
  v18 = v17 == 0;
  KeyPath = swift_getKeyPath(&unk_100017910);
  v20 = swift_allocObject(&unk_100021778, 17, 7);
  *(_BYTE *)(v20 + 16) = v18;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
  v21 = (uint64_t *)&v8[*(int *)(v6 + 36)];
  *v21 = KeyPath;
  v21[1] = (uint64_t)sub_1000114B8;
  v21[2] = v20;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v39 = *(_OWORD *)(a1 + 64);
  v22 = sub_100005070(&qword_100026A30);
  State.projectedValue.getter(&v40, v22);
  v23 = v40;
  v24 = v41;
  v25 = swift_allocObject(&unk_1000217A0, 129, 7);
  v26 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v25 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v25 + 96) = v26;
  *(_OWORD *)(v25 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v25 + 128) = *(_BYTE *)(a1 + 112);
  v27 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v25 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v25 + 32) = v27;
  v28 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v25 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v25 + 64) = v28;
  v29 = swift_allocObject(&unk_1000217C8, 129, 7);
  v30 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v29 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v29 + 96) = v30;
  *(_OWORD *)(v29 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v29 + 128) = *(_BYTE *)(a1 + 112);
  v31 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v29 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v29 + 32) = v31;
  v32 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v29 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v29 + 64) = v32;
  sub_1000106C8((_QWORD *)a1);
  sub_1000106C8((_QWORD *)a1);
  v33 = sub_100005070(&qword_100026C98);
  v34 = sub_100011328();
  v35 = sub_1000113C4();
  *(_QWORD *)&v40 = &type metadata for LimitedAccessSelectedContactsView;
  *((_QWORD *)&v40 + 1) = v35;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v40, &opaque type descriptor for <<opaque return type of View.presentationDetents(_:)>>, 1);
  View.sheet<A>(isPresented:onDismiss:content:)(v23, *((_QWORD *)&v23 + 1), v24, sub_1000114D4, v25, sub_100011520, v29, v6, v33, v34, OpaqueTypeConformance2);
  swift_release(*((_QWORD *)&v23 + 1));
  swift_release(v25);
  swift_release(v29);
  swift_release(v23);
  return sub_10000594C((uint64_t)v8, &qword_100026C90);
}

uint64_t sub_10000E818@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD v18[3];

  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v18[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.LocalizationValue(0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v18[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static VerticalAlignment.center.getter(v6);
  v10 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x8000000100018020);
  static Locale.current.getter(v10);
  v18[0] = String.init(localized:table:bundle:locale:comment:)(v8, 0, 0, 0, v4, 0, 0, 256);
  v18[1] = v11;
  v12 = sub_100005818();
  result = Text.init<A>(_:)(v18, &type metadata for String, v12);
  *(_QWORD *)a1 = v9;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = result;
  *(_QWORD *)(a1 + 32) = v14;
  *(_BYTE *)(a1 + 40) = v15 & 1;
  *(_QWORD *)(a1 + 48) = v16;
  return result;
}

uint64_t sub_10000E938(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v20;

  v2 = sub_100005070(&qword_100026AA0);
  State.wrappedValue.getter(&v20, v2);
  v3 = v20;
  v4 = swift_allocObject(&unk_1000217F0, 129, 7);
  v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v4 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v4 + 96) = v5;
  *(_OWORD *)(v4 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v4 + 128) = *(_BYTE *)(a1 + 112);
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v4 + 32) = v6;
  v7 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v4 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v4 + 64) = v7;
  v8 = sub_100005070(&qword_100026AA8);
  v9 = type metadata accessor for PresentationDetent(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = *(unsigned __int8 *)(v10 + 80);
  v13 = (v12 + 32) & ~v12;
  v14 = swift_allocObject(v8, v13 + 2 * v11, v12 | 7);
  *(_OWORD *)(v14 + 16) = xmmword_100017530;
  v15 = sub_1000106C8((_QWORD *)a1);
  v16 = static PresentationDetent.large.getter(v15);
  static PresentationDetent.large.getter(v16);
  v17 = sub_10000FB40(v14);
  swift_setDeallocating(v14);
  swift_arrayDestroy(v14 + v13, 2, v9);
  swift_deallocClassInstance(v14, 32, 7);
  v18 = sub_1000113C4();
  View.presentationDetents(_:)(v17, &type metadata for LimitedAccessSelectedContactsView, v18);
  swift_release(v4);
  swift_bridgeObjectRelease(v3);
  return swift_bridgeObjectRelease(v17);
}

uint64_t sub_10000EAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (qword_100026330 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v4 = type metadata accessor for Logger(0);
  sub_100005110(v4, (uint64_t)qword_100027D10);
  v5 = swift_bridgeObjectRetain_n(a1, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v8 = 134217984;
    if ((unint64_t)a1 >> 62)
    {
      if (a1 < 0)
        v12 = a1;
      else
        v12 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v9 = _CocoaArrayWrapper.endIndex.getter(v12);
      swift_bridgeObjectRelease(a1);
    }
    else
    {
      v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(a1);
    *(_QWORD *)&v14 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, (char *)&v14 + 8, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "LimitedAccess show selected view chose: %ld contacts", v8, 0xCu);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
  }
  v14 = *(_OWORD *)(a2 + 80);
  v13 = a1;
  swift_bridgeObjectRetain(a1);
  v10 = sub_100005070(&qword_100026AA0);
  return State.wrappedValue.setter(&v13, v10);
}

uint64_t sub_10000EC68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v25;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 24);
  swift_bridgeObjectRetain(v2);
  v3 = sub_100005070(&qword_100026AA0);
  State.wrappedValue.getter(&v25, v3);
  v4 = v25;
  v5 = swift_allocObject(&unk_1000216B0, 129, 7);
  v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v5 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v5 + 96) = v6;
  *(_OWORD *)(v5 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v5 + 128) = *(_BYTE *)(a1 + 112);
  v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v5 + 32) = v7;
  v8 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v5 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v5 + 64) = v8;
  v9 = swift_allocObject(&unk_1000216D8, 129, 7);
  v10 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v9 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v9 + 96) = v10;
  *(_OWORD *)(v9 + 112) = *(_OWORD *)(a1 + 96);
  *(_BYTE *)(v9 + 128) = *(_BYTE *)(a1 + 112);
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v9 + 32) = v11;
  v12 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v9 + 64) = v12;
  v13 = sub_100005070(&qword_100026AA8);
  v14 = type metadata accessor for PresentationDetent(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 72);
  v17 = *(unsigned __int8 *)(v15 + 80);
  v18 = (v17 + 32) & ~v17;
  v19 = swift_allocObject(v13, v18 + 2 * v16, v17 | 7);
  *(_OWORD *)(v19 + 16) = xmmword_100017530;
  sub_1000106C8((_QWORD *)a1);
  v20 = sub_1000106C8((_QWORD *)a1);
  v21 = static PresentationDetent.large.getter(v20);
  static PresentationDetent.large.getter(v21);
  v22 = sub_10000FB40(v19);
  swift_setDeallocating(v19);
  swift_arrayDestroy(v19 + v18, 2, v14);
  swift_deallocClassInstance(v19, 32, 7);
  v23 = sub_100010754();
  View.presentationDetents(_:)(v22, &type metadata for LimitedAccessContactPickerView, v23);
  swift_release(v9);
  swift_release(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v2);
  return swift_bridgeObjectRelease(v22);
}

uint64_t sub_10000EE74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  unint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  if (qword_100026330 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v4 = type metadata accessor for Logger(0);
  sub_100005110(v4, (uint64_t)qword_100027D10);
  v5 = swift_bridgeObjectRetain_n(a1, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  v8 = (unint64_t)a1 >> 62;
  if (os_log_type_enabled(v6, v7))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v9 = 134217984;
    if (v8)
    {
      if (a1 < 0)
        v19 = a1;
      else
        v19 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v10 = _CocoaArrayWrapper.endIndex.getter(v19);
      swift_bridgeObjectRelease(a1);
    }
    else
    {
      v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(a1);
    *(_QWORD *)&v21 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, (char *)&v21 + 8, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "LimitedAccess picker chose: %ld contacts", v9, 0xCu);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
  }
  v21 = *(_OWORD *)(a2 + 80);
  v20 = a1;
  swift_bridgeObjectRetain(a1);
  v11 = sub_100005070(&qword_100026AA0);
  result = State.wrappedValue.setter(&v20, v11);
  if (v8)
  {
    if (a1 < 0)
      v14 = a1;
    else
      v14 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v15 = _CocoaArrayWrapper.endIndex.getter(v14);
    result = swift_bridgeObjectRelease(a1);
    if (v15 >= 1)
      goto LABEL_10;
  }
  else if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
  {
LABEL_10:
    v21 = *(_OWORD *)(a2 + 32);
    LOBYTE(v20) = 1;
    v13 = sub_100005070(&qword_100026AC8);
    return State.wrappedValue.setter(&v20, v13);
  }
  v16 = *(_QWORD *)(a2 + 8);
  v17 = *(void (**)(void *))(v16 + 32);
  if (v17)
  {
    v18 = *(_QWORD *)(v16 + 40);
    swift_retain(v18);
    v17(&_swiftEmptyArrayStorage);
    return sub_10000758C((uint64_t)v17, v18);
  }
  return result;
}

uint64_t sub_10000F0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  __int128 v13;

  if (qword_100026330 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100005110(v4, (uint64_t)qword_100027D10);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "LimitedAccess picker chose to go back to start", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v13 = *(_OWORD *)(a2 + 80);
  v12 = a1;
  swift_bridgeObjectRetain(a1);
  v9 = sub_100005070(&qword_100026AA0);
  State.wrappedValue.setter(&v12, v9);
  v13 = *(_OWORD *)(a2 + 32);
  LOBYTE(v12) = 0;
  v10 = sub_100005070(&qword_100026AC8);
  return State.wrappedValue.setter(&v12, v10);
}

uint64_t sub_10000F200(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v2 = sub_100005070(&qword_100026A58);
  __chkstk_darwin(v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    swift_retain(*(_QWORD *)(a1 + 16));
    v6 = sub_10000238C();
    KeyPath = swift_getKeyPath(&unk_100017630);
    v8 = swift_getKeyPath(&unk_100017658);
    v17 = v6;
    swift_retain(v5);
    static Published.subscript.setter(&v17, v5, KeyPath, v8);
    v9 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
    v10 = (_QWORD *)swift_allocObject(&unk_1000215E8, 40, 7);
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v5;
    swift_retain(v5);
    v11 = sub_10000716C((uint64_t)v4, (uint64_t)&unk_100026A68, (uint64_t)v10);
    swift_release(v5);
    return swift_release(v11);
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 24);
    v14 = type metadata accessor for ContactStoreVisualizer(0);
    v15 = sub_100011678(&qword_1000269C8, 255, type metadata accessor for ContactStoreVisualizer, (uint64_t)&unk_1000175F4);
    result = EnvironmentObject.error()(0, v13, v14, v15);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000F380@<X0>(uint64_t a1@<X8>)
{
  return sub_1000075B4(a1);
}

__n128 sub_10000F3D0@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  __n128 result;
  __int128 v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  __n128 v23;
  char v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  __n128 v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  _BYTE v40[7];
  _BYTE v41[7];
  _BYTE v42[7];
  _DWORD v43[3];

  v4 = type metadata accessor for ContactStoreVisualizer(0);
  v5 = sub_100011678(&qword_1000269C8, 255, type metadata accessor for ContactStoreVisualizer, (uint64_t)&unk_1000175F4);
  swift_retain(a1);
  v6 = EnvironmentObject.init()(v4, v5);
  sub_10000FDB0(a1, v6, v7, 0, 0, 0, (uint64_t)&_swiftEmptyArrayStorage, 0, (uint64_t)&v27);
  v17 = v27;
  v9 = v28;
  v8 = v29;
  v10 = v30;
  v11 = v31;
  v20 = v33;
  v18 = v32;
  v19 = v34;
  v23 = v35;
  v22 = v36;
  v21 = v37;
  v25 = v38;
  v24 = v39;
  v12 = swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v26 = &_swiftEmptyArrayStorage;
  v13 = sub_100005070((uint64_t *)&unk_100027030);
  Published.init(initialValue:)(&v26, v13);
  v26 = 0;
  Published.init(initialValue:)(&v26, &type metadata for Int);
  v14 = static ObservableObject.environmentStore.getter(v4, v5);
  *(_OWORD *)a2 = v17;
  *(_QWORD *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v8;
  *(_BYTE *)(a2 + 32) = v10;
  *(_DWORD *)(a2 + 33) = (_DWORD)v26;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)((char *)&v26 + 3);
  *(_QWORD *)(a2 + 40) = v11;
  *(_BYTE *)(a2 + 48) = v18;
  *(_DWORD *)(a2 + 49) = v43[0];
  *(_DWORD *)(a2 + 52) = *(_DWORD *)((char *)v43 + 3);
  *(_QWORD *)(a2 + 56) = v20;
  *(_BYTE *)(a2 + 64) = v19;
  v15 = *(_DWORD *)v42;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v42[3];
  *(_DWORD *)(a2 + 65) = v15;
  result = v23;
  *(__n128 *)(a2 + 72) = v23;
  *(_QWORD *)(a2 + 88) = v22;
  *(_BYTE *)(a2 + 96) = v21;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v41[3];
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v41;
  *(_QWORD *)(a2 + 104) = v25;
  *(_BYTE *)(a2 + 112) = v24;
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v40;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v40[3];
  *(_QWORD *)(a2 + 120) = v14;
  *(_QWORD *)(a2 + 128) = v12;
  return result;
}

double sub_10000F600@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_10000F3D0(*(_QWORD *)(v1 + 8), a1).n128_u64[0];
  return result;
}

uint64_t sub_10000F608@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100017678);
  v5 = swift_getKeyPath(&unk_1000176A0);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10000F684(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100017678);
  v5 = swift_getKeyPath(&unk_1000176A0);
  v7 = v2;
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10000F6FC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100017630);
  v5 = swift_getKeyPath(&unk_100017658);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10000F77C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100017630);
  v5 = swift_getKeyPath(&unk_100017658);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

_QWORD *initializeBufferWithCopyOfBuffer for LimitedAccessPromptViewPerPlatform(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for LimitedAccessPromptViewPerPlatform(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for LimitedAccessPromptViewPerPlatform(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

__n128 initializeWithTake for LimitedAccessPromptViewPerPlatform(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for LimitedAccessPromptViewPerPlatform(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for LimitedAccessPromptViewPerPlatform(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LimitedAccessPromptViewPerPlatform(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LimitedAccessPromptViewPerPlatform()
{
  return &type metadata for LimitedAccessPromptViewPerPlatform;
}

uint64_t sub_10000F93C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100018B60, 1);
}

uint64_t sub_10000F94C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000F9B0;
  return v6(a1);
}

uint64_t sub_10000F9B0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000F9FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000FA2C(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10000FA58@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000FA80(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10000FAA4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.allowsTightening.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000FAD0(unsigned __int8 *a1)
{
  return EnvironmentValues.allowsTightening.setter(*a1);
}

void sub_10000FAF4(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_10000FB1C(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

void *sub_10000FB40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void *result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;

  v2 = type metadata accessor for PresentationDetent(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v30 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_100005070(&qword_100026AB0);
    v10 = static _SetStorage.allocate(capacity:)(v9);
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v31 = v9;
    v32 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v35 = v10 + 56;
    while (1)
    {
      v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      v14 = *(_QWORD *)(v10 + 40);
      v15 = sub_100011678(&qword_100026AB8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for PresentationDetent, (uint64_t)&protocol conformance descriptor for PresentationDetent);
      v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      v17 = ~(-1 << *(_BYTE *)(v10 + 32));
      v18 = v16 & v17;
      v19 = (v16 & (unint64_t)v17) >> 6;
      v20 = *(_QWORD *)(v35 + 8 * v19);
      v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(_QWORD *)(v10 + 48) + v18 * v13, v2);
          v22 = sub_100011678(&qword_100026AC0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for PresentationDetent, (uint64_t)&protocol conformance descriptor for PresentationDetent);
          v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          v24 = v3;
          v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            v3 = v24;
            v9 = v31;
            goto LABEL_4;
          }
          v18 = (v18 + 1) & v17;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)(v35 + 8 * (v18 >> 6));
          v21 = 1 << v18;
          v3 = v24;
        }
        while ((v20 & (1 << v18)) != 0);
        v9 = v31;
      }
      *(_QWORD *)(v35 + 8 * v19) = v21 | v20;
      result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v18 * v13, v8, v2);
      v27 = *(_QWORD *)(v10 + 16);
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        break;
      *(_QWORD *)(v10 + 16) = v29;
LABEL_4:
      v11 = v33 + 1;
      if (v33 + 1 == v9)
        return (void *)v10;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
  return result;
}

void sub_10000FDB0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  id v29;
  id v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v15 = a4 & 1;
  v16 = type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  v18 = sub_100011678(&qword_1000269D0, v17, (uint64_t (*)(uint64_t))type metadata accessor for ContactsLimitedAccessPromptViewObservable, (uint64_t)"Ţ");
  v19 = ObservedObject.init(wrappedValue:)(a1, v16, v18);
  v34 = v20;
  v35 = v19;
  LOBYTE(v38) = v15;
  State.init(wrappedValue:)(&v39, &v38, &type metadata for OnboardingState);
  v33 = v39;
  v32 = v40;
  LOBYTE(v38) = a5;
  State.init(wrappedValue:)(&v39, &v38, &type metadata for Bool);
  v31 = v39;
  v21 = v40;
  LOBYTE(v38) = a6;
  State.init(wrappedValue:)(&v39, &v38, &type metadata for Bool);
  v22 = v39;
  v23 = v40;
  v38 = a7;
  v24 = sub_100005070((uint64_t *)&unk_100027030);
  State.init(wrappedValue:)(&v39, &v38, v24);
  v25 = v39;
  v26 = v40;
  LOBYTE(v38) = a8;
  State.init(wrappedValue:)(&v39, &v38, &type metadata for Bool);
  v27 = v39;
  v28 = v40;
  v29 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v30 = objc_msgSend(v29, "userInterfaceIdiom");

  *(_QWORD *)a9 = v35;
  *(_QWORD *)(a9 + 8) = v34;
  *(_QWORD *)(a9 + 16) = a2;
  *(_QWORD *)(a9 + 24) = a3;
  *(_BYTE *)(a9 + 32) = v33;
  *(_QWORD *)(a9 + 40) = v32;
  *(_BYTE *)(a9 + 48) = v31;
  *(_QWORD *)(a9 + 56) = v21;
  *(_BYTE *)(a9 + 64) = v22;
  *(_QWORD *)(a9 + 72) = v23;
  *(_QWORD *)(a9 + 80) = v25;
  *(_QWORD *)(a9 + 88) = v26;
  *(_BYTE *)(a9 + 96) = v27;
  *(_QWORD *)(a9 + 104) = v28;
  *(_BYTE *)(a9 + 112) = v30 == (id)1;
}

uint64_t getEnumTagSinglePayload for OnboardingState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OnboardingState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001005C + 4 * byte_100017545[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100010090 + 4 * byte_100017540[v4]))();
}

uint64_t sub_100010090(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010098(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000100A0);
  return result;
}

uint64_t sub_1000100AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000100B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1000100B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000100C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1000100CC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OnboardingState()
{
  return &type metadata for OnboardingState;
}

uint64_t destroy for PromptContentView(_QWORD *a1)
{
  swift_release(a1[1]);
  swift_release(a1[2]);
  swift_release(a1[5]);
  swift_release(a1[7]);
  swift_release(a1[9]);
  swift_bridgeObjectRelease(a1[10]);
  swift_release(a1[11]);
  return swift_release(a1[13]);
}

uint64_t initializeWithCopy for PromptContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v5 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v7;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 72);
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v8;
  *(_QWORD *)(a1 + 80) = v9;
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 88) = v10;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v11 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v11;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  swift_retain(v3);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  swift_retain(v11);
  return a1;
}

uint64_t assignWithCopy for PromptContentView(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain(v7);
  swift_release(v6);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v9;
  swift_retain(v9);
  swift_release(v8);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v11;
  swift_retain(v11);
  swift_release(v10);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a1 + 88);
  v17 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 88) = v17;
  swift_retain(v17);
  swift_release(v16);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v18 = *(_QWORD *)(a1 + 104);
  v19 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v19;
  swift_retain(v19);
  swift_release(v18);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  return a1;
}

__n128 initializeWithTake for PromptContentView(uint64_t a1, __int128 *a2)
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
  v7 = a2[6];
  *(_BYTE *)(a1 + 112) = *((_BYTE *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for PromptContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release(*(_QWORD *)(a1 + 8));
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release(v4);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v5);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release(v6);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_release(*(_QWORD *)(a1 + 72));
  v7 = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release(v8);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v9 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release(v9);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for PromptContentView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 113))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PromptContentView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 112) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 113) = 1;
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
    *(_BYTE *)(result + 113) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PromptContentView()
{
  return &type metadata for PromptContentView;
}

unint64_t sub_1000104EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000269D8;
  if (!qword_1000269D8)
  {
    v1 = sub_1000053EC(&qword_1000269E0);
    sub_100010550();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000269D8);
  }
  return result;
}

unint64_t sub_100010550()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000269E8;
  if (!qword_1000269E8)
  {
    v1 = sub_1000053EC(&qword_1000269F0);
    sub_1000105D4();
    sub_100006878(&qword_100026A00, &qword_100026A08, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000269E8);
  }
  return result;
}

unint64_t sub_1000105D4()
{
  unint64_t result;

  result = qword_1000269F8;
  if (!qword_1000269F8)
  {
    result = swift_getWitnessTable(&unk_100017764, &type metadata for PromptContentView);
    atomic_store(result, (unint64_t *)&qword_1000269F8);
  }
  return result;
}

uint64_t sub_100010618(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100018B88, 1);
}

unint64_t sub_10001062C()
{
  unint64_t result;

  result = qword_100026A10;
  if (!qword_100026A10)
  {
    result = swift_getWitnessTable(&unk_1000177F4, &type metadata for OnboardingState);
    atomic_store(result, (unint64_t *)&qword_100026A10);
  }
  return result;
}

uint64_t sub_100010674()
{
  uint64_t v0;
  uint64_t v1;
  char v3;
  __int128 v4;

  v4 = *(_OWORD *)(v0 + 64);
  v3 = 0;
  v1 = sub_100005070(&qword_100026A30);
  return State.wrappedValue.setter(&v3, v1);
}

uint64_t sub_1000106C0()
{
  uint64_t v0;

  return sub_10000EC68(v0 + 16);
}

_QWORD *sub_1000106C8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[5];
  v5 = a1[7];
  v6 = a1[9];
  v7 = a1[10];
  v8 = a1[11];
  swift_retain(a1[13]);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_bridgeObjectRetain(v7);
  swift_retain(v8);
  return a1;
}

unint64_t sub_100010754()
{
  unint64_t result;

  result = qword_100026A48;
  if (!qword_100026A48)
  {
    result = swift_getWitnessTable(&unk_100017BC0, &type metadata for LimitedAccessContactPickerView);
    atomic_store(result, (unint64_t *)&qword_100026A48);
  }
  return result;
}

uint64_t sub_10001079C()
{
  uint64_t v0;

  return sub_10000F200(v0 + 16);
}

uint64_t sub_1000107A4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000107D0(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100026A64);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001083C;
  return sub_100006A40(a1, v4, v5, v6);
}

uint64_t sub_10001083C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100010884()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000108A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100026A74);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001083C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100026A70 + dword_100026A70))(a1, v4);
}

unint64_t sub_100010918()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026A80;
  if (!qword_100026A80)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100026A80);
  }
  return result;
}

uint64_t sub_100010954()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010978()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000109A4()
{
  uint64_t v0;

  return sub_100006FF0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000109AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000109BC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000109C8(uint64_t a1)
{
  uint64_t v1;

  return sub_10000EE74(a1, v1 + 16);
}

uint64_t sub_1000109D4(uint64_t a1)
{
  uint64_t v1;

  return sub_10000F0C4(a1, v1 + 16);
}

uint64_t sub_1000109DC()
{
  uint64_t v0;

  return sub_10000AEEC(*(_QWORD *)(v0 + 16));
}

unint64_t sub_1000109E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026B20;
  if (!qword_100026B20)
  {
    v1 = sub_1000053EC(&qword_100026AF0);
    sub_100006878(&qword_100026B28, &qword_100026B30, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_100006878(&qword_100026B38, &qword_100026B40, (uint64_t)&protocol conformance descriptor for _InsetViewModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026B20);
  }
  return result;
}

uint64_t sub_100010A80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000081B4(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_100010A90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026BD0;
  if (!qword_100026BD0)
  {
    v1 = sub_1000053EC(&qword_100026BC8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026BD0);
  }
  return result;
}

unint64_t sub_100010AF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026BD8;
  if (!qword_100026BD8)
  {
    v1 = sub_1000053EC(&qword_100026BA0);
    sub_100006878(&qword_100026BE0, &qword_100026B98, (uint64_t)&protocol conformance descriptor for Button<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026BD8);
  }
  return result;
}

uint64_t sub_100010B78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100010BA0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tint.setter(v1);
}

uint64_t sub_100010BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010C0C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010C4C()
{
  uint64_t v0;

  return sub_10000AB78(v0 + 16);
}

uint64_t sub_100010C54(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return a1;
}

unint64_t sub_100010C7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026C18;
  if (!qword_100026C18)
  {
    v1 = sub_1000053EC(&qword_100026C08);
    sub_100010D20(&qword_100026C20, &qword_100026C28, (void (*)(void))sub_100010D88);
    sub_100006878(&qword_100026C48, &qword_100026AE0, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026C18);
  }
  return result;
}

uint64_t sub_100010D20(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000053EC(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100010D88()
{
  return sub_100010D20(&qword_100026C30, &qword_100026C38, (void (*)(void))sub_100010DAC);
}

unint64_t sub_100010DAC()
{
  unint64_t result;

  result = qword_100026C40;
  if (!qword_100026C40)
  {
    result = swift_getWitnessTable("ݡ", &type metadata for CNContactGroupVisualizer);
    atomic_store(result, (unint64_t *)&qword_100026C40);
  }
  return result;
}

uint64_t sub_100010DF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 152);
  v4 = *(_QWORD *)(a1 + 168);
  v5 = *(_QWORD *)(a1 + 184);
  v6 = *(_QWORD *)(a1 + 200);
  v7 = *(_QWORD *)(a1 + 224);
  v8 = *(_QWORD *)(a1 + 232);
  v9 = *(_BYTE *)(a1 + 240);
  v10 = *(_QWORD *)(a1 + 248);
  v12 = *(_QWORD *)(a1 + 352);
  v13 = *(_QWORD *)(a1 + 368);
  v14 = *(_QWORD *)(a1 + 384);
  v15 = *(_QWORD *)(a1 + 400);
  v17 = *(_QWORD *)(a1 + 432);
  v18 = *(_QWORD *)(a1 + 424);
  v16 = *(_BYTE *)(a1 + 440);
  v19 = *(_QWORD *)(a1 + 448);
  v20 = *(_QWORD *)(a1 + 552);
  v21 = *(_QWORD *)(a1 + 568);
  v22 = *(_QWORD *)(a1 + 584);
  v23 = *(_QWORD *)(a1 + 600);
  sub_1000061C0(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  sub_1000061C0(v7, v8, v9);
  swift_bridgeObjectRetain(v10);
  swift_retain(v12);
  swift_retain(v13);
  swift_retain(v14);
  swift_retain(v15);
  sub_1000061C0(v18, v17, v16);
  swift_bridgeObjectRetain(v19);
  swift_retain(v20);
  swift_retain(v21);
  swift_retain(v22);
  swift_retain(v23);
  return a1;
}

uint64_t sub_100010F4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 152);
  v4 = *(_QWORD *)(a1 + 168);
  v5 = *(_QWORD *)(a1 + 184);
  v6 = *(_QWORD *)(a1 + 200);
  v7 = *(_QWORD *)(a1 + 224);
  v8 = *(_QWORD *)(a1 + 232);
  v9 = *(_BYTE *)(a1 + 240);
  v13 = *(_QWORD *)(a1 + 368);
  v14 = *(_QWORD *)(a1 + 352);
  v12 = *(_QWORD *)(a1 + 384);
  v10 = *(_QWORD *)(a1 + 400);
  v18 = *(_QWORD *)(a1 + 424);
  v19 = *(_QWORD *)(a1 + 248);
  v17 = *(_QWORD *)(a1 + 432);
  v16 = *(_BYTE *)(a1 + 440);
  v22 = *(_QWORD *)(a1 + 552);
  v23 = *(_QWORD *)(a1 + 448);
  v20 = *(_QWORD *)(a1 + 584);
  v21 = *(_QWORD *)(a1 + 568);
  v15 = *(_QWORD *)(a1 + 600);
  sub_10000585C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  sub_10000585C(v7, v8, v9);
  swift_release(v10);
  swift_release(v12);
  swift_release(v13);
  swift_release(v14);
  swift_bridgeObjectRelease(v19);
  sub_10000585C(v18, v17, v16);
  swift_release(v15);
  swift_release(v20);
  swift_release(v21);
  swift_release(v22);
  swift_bridgeObjectRelease(v23);
  return a1;
}

uint64_t sub_1000110AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000110D4(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_1000110F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.allowsTightening.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100011124(unsigned __int8 *a1)
{
  return EnvironmentValues.allowsTightening.setter(*a1);
}

void sub_100011148(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100011170(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

uint64_t sub_100011194@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000111C4(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_1000111F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 128);
  v4 = *(_QWORD *)(a1 + 144);
  v5 = *(_QWORD *)(a1 + 160);
  v6 = *(_QWORD *)(a1 + 176);
  sub_1000061C0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  return a1;
}

uint64_t sub_10001126C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 128);
  v4 = *(_QWORD *)(a1 + 144);
  v5 = *(_QWORD *)(a1 + 160);
  v6 = *(_QWORD *)(a1 + 176);
  sub_10000585C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_1000112E8(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_100011310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000DE8C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_100011318()
{
  uint64_t v0;

  return sub_10000E124(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100011320()
{
  uint64_t v0;

  return sub_10000E47C(*(_QWORD *)(v0 + 16));
}

unint64_t sub_100011328()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026CA0;
  if (!qword_100026CA0)
  {
    v1 = sub_1000053EC(&qword_100026C90);
    sub_100006878(&qword_100026CA8, &qword_100026CB0, (uint64_t)&protocol conformance descriptor for Button<A>);
    sub_100006878(&qword_100026CB8, &qword_100026CC0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026CA0);
  }
  return result;
}

unint64_t sub_1000113C4()
{
  unint64_t result;

  result = qword_1000271E0;
  if (!qword_1000271E0)
  {
    result = swift_getWitnessTable(&unk_100017B70, &type metadata for LimitedAccessSelectedContactsView);
    atomic_store(result, (unint64_t *)&qword_1000271E0);
  }
  return result;
}

uint64_t sub_10001140C()
{
  uint64_t v0;
  uint64_t v1;
  char v3;
  __int128 v4;

  v4 = *(_OWORD *)(v0 + 80);
  v3 = 1;
  v1 = sub_100005070(&qword_100026A30);
  return State.wrappedValue.setter(&v3, v1);
}

uint64_t sub_100011458@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100011484(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_1000114A8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_1000114B8(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_1000114D4()
{
  uint64_t v0;
  uint64_t v1;
  char v3;
  __int128 v4;

  v4 = *(_OWORD *)(v0 + 80);
  v3 = 0;
  v1 = sub_100005070(&qword_100026A30);
  return State.wrappedValue.setter(&v3, v1);
}

uint64_t sub_100011520()
{
  uint64_t v0;

  return sub_10000E938(v0 + 16);
}

uint64_t sub_10001152C(uint64_t a1)
{
  uint64_t v1;

  return sub_10000EAC4(a1, v1 + 16);
}

uint64_t sub_100011538()
{
  uint64_t v0;
  uint64_t v1;
  char v3;
  __int128 v4;

  v4 = *(_OWORD *)(v0 + 64);
  v3 = 1;
  v1 = sub_100005070(&qword_100026A30);
  return State.wrappedValue.setter(&v3, v1);
}

uint64_t sub_100011584@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000B9D4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(unsigned __int8 *)(v1 + 40), a1);
}

uint64_t sub_100011598()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[7]);
  swift_release(v0[9]);
  swift_release(v0[11]);
  swift_bridgeObjectRelease(v0[12]);
  swift_release(v0[13]);
  swift_release(v0[15]);
  return swift_deallocObject(v0, 129, 7);
}

uint64_t sub_1000115F4()
{
  uint64_t v0;

  return sub_10000D734(v0 + 16);
}

double sub_1000115FC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_10000D7B8(*(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), a1).n128_u64[0];
  return result;
}

uint64_t sub_100011608()
{
  _QWORD *v0;

  swift_release(v0[4]);
  swift_release(v0[5]);
  swift_release(v0[8]);
  swift_release(v0[10]);
  swift_release(v0[12]);
  swift_bridgeObjectRelease(v0[13]);
  swift_release(v0[14]);
  swift_release(v0[16]);
  return swift_deallocObject(v0, 137, 7);
}

uint64_t sub_100011664()
{
  uint64_t v0;

  return sub_10000DB30(*(unsigned __int8 *)(v0 + 16), v0 + 24);
}

double sub_100011670@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_10000DBBC(*(_BYTE *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_100011678(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000116B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 152);
  v4 = *(_QWORD *)(a1 + 168);
  v5 = *(_QWORD *)(a1 + 184);
  v6 = *(_QWORD *)(a1 + 200);
  v7 = *(_QWORD *)(a1 + 224);
  v8 = *(_QWORD *)(a1 + 232);
  v9 = *(_BYTE *)(a1 + 240);
  v10 = *(_QWORD *)(a1 + 248);
  v12 = *(_QWORD *)(a1 + 352);
  v13 = *(_QWORD *)(a1 + 368);
  v14 = *(_QWORD *)(a1 + 384);
  v15 = *(_QWORD *)(a1 + 400);
  sub_1000061C0(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  sub_1000061C0(v7, v8, v9);
  swift_bridgeObjectRetain(v10);
  swift_retain(v12);
  swift_retain(v13);
  swift_retain(v14);
  swift_retain(v15);
  return a1;
}

uint64_t sub_1000117A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 152);
  v4 = *(_QWORD *)(a1 + 168);
  v5 = *(_QWORD *)(a1 + 184);
  v6 = *(_QWORD *)(a1 + 200);
  v7 = *(_QWORD *)(a1 + 224);
  v8 = *(_QWORD *)(a1 + 232);
  v9 = *(_BYTE *)(a1 + 240);
  v14 = *(_QWORD *)(a1 + 352);
  v15 = *(_QWORD *)(a1 + 248);
  v12 = *(_QWORD *)(a1 + 384);
  v13 = *(_QWORD *)(a1 + 368);
  v10 = *(_QWORD *)(a1 + 400);
  sub_10000585C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  sub_10000585C(v7, v8, v9);
  swift_release(v10);
  swift_release(v12);
  swift_release(v13);
  swift_release(v14);
  swift_bridgeObjectRelease(v15);
  return a1;
}

unint64_t sub_10001189C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t OpaqueTypeConformance2;
  ValueMetadata *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = qword_100026D70;
  if (!qword_100026D70)
  {
    v1 = sub_1000053EC(&qword_100026A50);
    v2 = sub_1000053EC(&qword_100026A18);
    v3 = sub_1000053EC(&qword_100026A38);
    v4 = sub_100006878(&qword_100026A40, &qword_100026A18, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v6 = &type metadata for LimitedAccessContactPickerView;
    v7 = sub_100010754();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v6, &opaque type descriptor for <<opaque return type of View.presentationDetents(_:)>>, 1);
    v6 = (ValueMetadata *)v2;
    v7 = v3;
    v8 = v4;
    v9 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v6, &opaque type descriptor for <<opaque return type of View.sheet<A>(isPresented:onDismiss:content:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100026D70);
  }
  return result;
}

uint64_t sub_100011990(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  v4 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain(a2);
  v5 = sub_100013304(a1, a2, 0);
  v6 = objc_msgSend(v5, "localizedName");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);

  return v7;
}

void sub_100011CE4()
{
  char *v0;
  char *v1;
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
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  _QWORD v63[4];

  v1 = v0;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer];
  v3 = type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  v4 = sub_100006090(&qword_1000269D0, (uint64_t (*)(uint64_t))type metadata accessor for ContactsLimitedAccessPromptViewObservable, (uint64_t)"Ţ");
  v5 = swift_retain(v2);
  v6 = ObservedObject.init(wrappedValue:)(v5, v3, v4);
  v8 = v7;
  v9 = type metadata accessor for ContactStoreVisualizer(0);
  v10 = swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  v63[0] = &_swiftEmptyArrayStorage;
  v11 = sub_100005070((uint64_t *)&unk_100027030);
  Published.init(initialValue:)(v63, v11);
  v63[0] = 0;
  Published.init(initialValue:)(v63, &type metadata for Int);
  v12 = sub_100006090(&qword_1000269C8, type metadata accessor for ContactStoreVisualizer, (uint64_t)&unk_1000175F4);
  v13 = static ObservableObject.environmentStore.getter(v9, v12);
  v63[0] = v6;
  v63[1] = v8;
  v63[2] = v13;
  v63[3] = v10;
  v14 = objc_allocWithZone((Class)sub_100005070((uint64_t *)&unk_100027040));
  v15 = UIHostingController.init(rootView:)(v63);
  v16 = OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView;
  v17 = *(void **)&v1[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView] = v15;

  v18 = *(void **)&v1[v16];
  if (v18)
  {
    v19 = (void *)objc_opt_self(UIDevice);
    v20 = v18;
    v21 = objc_msgSend(v19, "currentDevice");
    v22 = objc_msgSend(v21, "userInterfaceIdiom");

    if (v22)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v1, "addChildViewController:", v20);
    v23 = objc_msgSend(v1, "view");
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend(v20, "view");
      if (v25)
      {
        v26 = v25;
        objc_msgSend(v24, "addSubview:", v25);

        v27 = objc_msgSend(v20, "view");
        if (v27)
        {
          v28 = v27;
          objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

          v29 = objc_msgSend(v20, "view");
          if (v29)
          {
            v30 = v29;
            v31 = objc_msgSend(v29, "topAnchor");

            v32 = objc_msgSend(v1, "view");
            if (v32)
            {
              v33 = v32;
              v34 = objc_msgSend(v32, "topAnchor");

              v35 = objc_msgSend(v31, "constraintEqualToAnchor:", v34);
              objc_msgSend(v35, "setActive:", 1);

              v36 = objc_msgSend(v20, "view");
              if (v36)
              {
                v37 = v36;
                v38 = objc_msgSend(v36, "bottomAnchor");

                v39 = objc_msgSend(v1, "view");
                if (v39)
                {
                  v40 = v39;
                  v41 = objc_msgSend(v39, "bottomAnchor");

                  v42 = objc_msgSend(v38, "constraintEqualToAnchor:", v41);
                  objc_msgSend(v42, "setActive:", 1);

                  v43 = objc_msgSend(v20, "view");
                  if (v43)
                  {
                    v44 = v43;
                    v45 = objc_msgSend(v43, "rightAnchor");

                    v46 = objc_msgSend(v1, "view");
                    if (v46)
                    {
                      v47 = v46;
                      v48 = objc_msgSend(v46, "rightAnchor");

                      v49 = objc_msgSend(v45, "constraintEqualToAnchor:", v48);
                      objc_msgSend(v49, "setActive:", 1);

                      v50 = objc_msgSend(v20, "view");
                      if (v50)
                      {
                        v51 = v50;
                        v52 = objc_msgSend(v50, "leftAnchor");

                        v53 = objc_msgSend(v1, "view");
                        if (v53)
                        {
                          v54 = v53;
                          v55 = objc_msgSend(v53, "leftAnchor");

                          v56 = objc_msgSend(v52, "constraintEqualToAnchor:", v55);
                          objc_msgSend(v56, "setActive:", 1);

                          v20 = v56;
                          goto LABEL_15;
                        }
LABEL_34:
                        __break(1u);
                        return;
                      }
LABEL_33:
                      __break(1u);
                      goto LABEL_34;
                    }
LABEL_32:
                    __break(1u);
                    goto LABEL_33;
                  }
LABEL_31:
                  __break(1u);
                  goto LABEL_32;
                }
LABEL_30:
                __break(1u);
                goto LABEL_31;
              }
LABEL_29:
              __break(1u);
              goto LABEL_30;
            }
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
LABEL_16:
  v57 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v58 = objc_msgSend(v57, "userInterfaceIdiom");

  v59 = *(void **)&v1[v16];
  if (v58 == (id)1)
  {
    if (v59)
    {
      objc_msgSend(v59, "setModalInPresentation:", 1);
      v60 = *(void **)&v1[v16];
      if (v60)
      {
        v61 = objc_msgSend(v60, "sheetPresentationController");
        if (v61)
        {
          v62 = v61;
          objc_msgSend(v61, "setPrefersEdgeAttachedInCompactHeight:", 1);
          objc_msgSend(v62, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);

        }
      }
    }
  }
  else if (v59)
  {
    objc_msgSend(v59, "didMoveToParentViewController:", v1);
  }
}

uint64_t sub_100012308()
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
  sub_1000142AC((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    v3 = sub_100005070((uint64_t *)&unk_100027020);
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, v3, 6))
      return v5;
    else
      return 0;
  }
  else
  {
    sub_1000142F4((uint64_t)v7);
    return 0;
  }
}

id sub_100012590(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSString v10;
  id v11;
  objc_super v13;

  v6 = type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  v7 = swift_allocObject(v6, 80, 7);
  v8 = OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer;
  *(_QWORD *)(v7 + 16) = 7368769;
  *(_QWORD *)(v7 + 24) = 0xE300000000000000;
  *(_OWORD *)(v7 + 32) = 0u;
  *(_OWORD *)(v7 + 48) = 0u;
  *(_OWORD *)(v7 + 64) = 0u;
  *(_QWORD *)&v3[v8] = v7;
  v9 = &v3[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView] = 0;
  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for ContactsLimitedAccessPromptViewController();
  v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_1000126CC(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  objc_super v9;

  v3 = type metadata accessor for ContactsLimitedAccessPromptViewObservable();
  v4 = swift_allocObject(v3, 80, 7);
  v5 = OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer;
  *(_QWORD *)(v4 + 16) = 7368769;
  *(_QWORD *)(v4 + 24) = 0xE300000000000000;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_QWORD *)&v1[v5] = v4;
  v6 = &v1[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView] = 0;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for ContactsLimitedAccessPromptViewController();
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_100012794()
{
  return sub_100012BD0(type metadata accessor for ContactsLimitedAccessPromptViewController);
}

uint64_t type metadata accessor for ContactsLimitedAccessPromptViewController()
{
  return objc_opt_self(_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController);
}

id sub_100012850(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *inited;
  id v18;
  id v19;
  _BYTE v21[40];
  _BYTE v22[24];
  _BYTE v23[24];

  v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v23, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  v7 = (void *)Strong;
  if (Strong)
  {
    v8 = *(void **)(Strong + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
    v9 = v8;

    if (v8)
    {
      v8 = *(void **)&v9[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
      v7 = *(void **)&v9[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                       + 8];
      swift_bridgeObjectRetain(v7);

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  sub_1000140B4(3, (uint64_t)v8, (uint64_t)v7);
  swift_bridgeObjectRelease(v7);
  swift_beginAccess(v5, v22, 0, 0);
  v10 = swift_unknownObjectWeakLoadStrong(v5);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = *(void **)(v10 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
    v13 = v12;

    if (v12)
    {
      v15 = *(_QWORD *)&v13[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
      v14 = *(_QWORD *)&v13[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                          + 8];
      swift_bridgeObjectRetain(v14);

      if (v14)
      {
        v16 = type metadata accessor for ContactsAccessUpdater();
        inited = (_QWORD *)swift_initStackObject(v16, v21);
        v18 = objc_msgSend((id)objc_opt_self(CNUIContactsEnvironment), "currentEnvironment");
        v19 = objc_msgSend(v18, "contactStore");

        inited[2] = v19;
        inited[3] = v15;
        inited[4] = v14;
        sub_100012C88();
        sub_100012F68(a1);
        swift_bridgeObjectRelease(v14);

      }
    }
  }
  return objc_msgSend(a3, "deactivate");
}

id sub_1000129F4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  void *v8;
  char *v9;
  _BYTE v11[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  v7 = (void *)Strong;
  if (Strong)
  {
    v8 = *(void **)(Strong + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
    v9 = v8;

    if (v8)
    {
      v8 = *(void **)&v9[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID];
      v7 = *(void **)&v9[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                       + 8];
      swift_bridgeObjectRetain(v7);

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  sub_1000140B4(a3, (uint64_t)v8, (uint64_t)v7);
  swift_bridgeObjectRelease(v7);
  return objc_msgSend(a2, "deactivate");
}

id sub_100012BC4()
{
  return sub_100012BD0(type metadata accessor for ContactsLimitedAccessPromptSceneDelegate);
}

id sub_100012BD0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for ContactsLimitedAccessPromptSceneDelegate()
{
  return objc_opt_self(_TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate);
}

uint64_t sub_100012C58()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for TCCAccessUpdater()
{
  return objc_opt_self(_TtC23LimitedAccessPromptView16TCCAccessUpdater);
}

uint64_t sub_100012C88()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  NSString v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  NSString v17;
  NSString v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = (void *)v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v2, "fetchLimitedAccessContactIdentifiersForBundle:", v5);

  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for String);
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
    return swift_bridgeObjectRelease(v7);
  if (qword_100026330 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v9 = type metadata accessor for Logger(0);
  sub_100005110(v9, (uint64_t)qword_100027D10);
  swift_bridgeObjectRetain(v7);
  v10 = swift_retain(v1);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(22, -1);
    v20 = swift_slowAlloc(32, -1);
    v21 = v8;
    v22 = v20;
    *(_DWORD *)v13 = 134218242;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v7);
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain(v4);
    v21 = sub_100015810(v3, v4, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 14, v13 + 22);
    swift_release(v1);
    swift_bridgeObjectRelease(v4);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Unexpected %ld limited access entries found for %s. Purging them.", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    v14 = *(_QWORD *)(v7 + 16);
    if (v14)
      goto LABEL_6;
    return swift_bridgeObjectRelease(v7);
  }

  swift_release(v1);
  swift_bridgeObjectRelease(v7);
  v14 = *(_QWORD *)(v7 + 16);
  if (!v14)
    return swift_bridgeObjectRelease(v7);
LABEL_6:
  swift_bridgeObjectRetain(v7);
  v15 = (_QWORD *)(v7 + 40);
  do
  {
    v16 = *v15;
    swift_bridgeObjectRetain(*v15);
    v17 = String._bridgeToObjectiveC()();
    v18 = String._bridgeToObjectiveC()();
    objc_msgSend(v2, "removeLimitedAccessForBundle:contactIdentifier:", v17, v18);
    swift_bridgeObjectRelease(v16);

    v15 += 2;
    --v14;
  }
  while (v14);
  return swift_bridgeObjectRelease_n(v7, 2);
}

uint64_t sub_100012F68(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  NSString v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = v1;
  if (qword_100026330 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v6 = type metadata accessor for Logger(0);
  sub_100005110(v6, (uint64_t)qword_100027D10);
  swift_bridgeObjectRetain_n(a1, 2);
  v7 = swift_retain_n(v1, 2);
  v8 = Logger.logObject.getter(v7);
  LOBYTE(v9) = static os_log_type_t.default.getter(v8);
  v10 = (unint64_t)a1 >> 62;
  v26 = a1;
  if (!os_log_type_enabled(v8, (os_log_type_t)v9))
  {

    swift_release_n(v4, 2);
    swift_bridgeObjectRelease_n(a1, 2);
    goto LABEL_8;
  }
  v2 = swift_slowAlloc(22, -1);
  v3 = swift_slowAlloc(32, -1);
  v28 = v3;
  *(_DWORD *)v2 = 134218242;
  if (v10)
    goto LABEL_22;
  v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease(a1);
    v27 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v2 + 4, v2 + 12);
    swift_bridgeObjectRelease(a1);
    *(_WORD *)(v2 + 12) = 2080;
    v12 = v4[3];
    v13 = v4[4];
    swift_bridgeObjectRetain(v13);
    v27 = sub_100015810(v12, v13, &v28);
    a1 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v2 + 14, v2 + 22);
    swift_release_n(v4, 2);
    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v8, (os_log_type_t)v9, "Adding %ld contacts to limited access for %s", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy(v3, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v3, -1, -1);
    swift_slowDealloc(v2, -1, -1);

LABEL_8:
    if (v10)
    {
      if (a1 < 0)
        v8 = a1;
      else
        v8 = (a1 & 0xFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain(a1);
      v9 = _CocoaArrayWrapper.endIndex.getter(v8);
      if (!v9)
        return swift_bridgeObjectRelease(a1);
    }
    else
    {
      v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(a1);
      if (!v9)
        return swift_bridgeObjectRelease(a1);
    }
    if (v9 >= 1)
      break;
    __break(1u);
LABEL_22:
    if (a1 < 0)
      v24 = a1;
    else
      v24 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v11 = _CocoaArrayWrapper.endIndex.getter(v24);
    swift_bridgeObjectRelease(a1);
  }
  v14 = 0;
  v25 = (id)v4[2];
  v15 = a1 & 0xC000000000000001;
  do
  {
    if (v15)
      v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, a1);
    else
      v16 = *(id *)(a1 + 8 * v14 + 32);
    v17 = v16;
    ++v14;
    v18 = String._bridgeToObjectiveC()();
    v19 = objc_msgSend(v17, "identifier");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v21 = v20;

    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
    objc_msgSend(v25, "addLimitedAccessForBundle:contactIdentifier:", v18, v22);

    a1 = v26;
  }
  while (v9 != v14);
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_1000132B8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ContactsAccessUpdater()
{
  return objc_opt_self(_TtC23LimitedAccessPromptView21ContactsAccessUpdater);
}

id sub_100013304(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v6, a3 & 1, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

unint64_t sub_1000133DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10001340C(a1, v4);
}

unint64_t sub_10001340C(uint64_t a1, uint64_t a2)
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
      sub_100014450(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000143E0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_1000134D0(void *result)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  Class *v11;
  Class isa;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  unint64_t v20;
  char v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[2];
  Class v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;

  if (result)
  {
    v2 = v1;
    v3 = objc_msgSend(result, "userInfo");
    if (v3)
    {
      v4 = v3;
      v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      if (qword_100026330 != -1)
        swift_once(&qword_100026330, sub_100016010);
      v6 = type metadata accessor for Logger(0);
      sub_100005110(v6, (uint64_t)qword_100027D10);
      v7 = swift_bridgeObjectRetain(v5);
      v8 = Logger.logObject.getter(v7);
      v9 = static os_log_type_t.default.getter(v8);
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc(12, -1);
        v11 = (Class *)swift_slowAlloc(8, -1);
        *(_DWORD *)v10 = 138412290;
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        v28 = isa;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v10 + 4, v10 + 12);
        *v11 = isa;
        swift_bridgeObjectRelease(v5);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "ContactsLimitedAccessPromptViewController activated with userInfo: %@", v10, 0xCu);
        v13 = sub_100005070(&qword_100026FB0);
        swift_arrayDestroy(v11, 1, v13);
        swift_slowDealloc(v11, -1, -1);
        swift_slowDealloc(v10, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease(v5);
      }
      *(_QWORD *)&v30 = 0xD00000000000001FLL;
      *((_QWORD *)&v30 + 1) = 0x8000000100018370;
      AnyHashable.init<A>(_:)(&v28, &v30, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v5 + 16) && (v20 = sub_1000133DC((uint64_t)&v28), (v21 & 1) != 0))
      {
        sub_100014414(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)&v30);
      }
      else
      {
        v30 = 0u;
        v31 = 0u;
      }
      swift_bridgeObjectRelease(v5);
      sub_1000143E0((uint64_t)&v28);
      if (*((_QWORD *)&v31 + 1))
      {
        v22 = swift_dynamicCast(v27, &v30, (char *)&type metadata for Any + 8, &type metadata for String, 6);
        v23 = v27[0];
        v24 = v27[1];
        if (!v22)
        {
          v23 = 0;
          v24 = 0;
        }
      }
      else
      {
        sub_1000142F4((uint64_t)&v30);
        v23 = 0;
        v24 = 0;
      }
      v25 = (_QWORD *)(v2
                     + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID);
      v26 = *(_QWORD *)(v2
                      + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                      + 8);
      *v25 = v23;
      v25[1] = v24;
      return (void *)swift_bridgeObjectRelease(v26);
    }
    else
    {
      if (qword_100026330 != -1)
        swift_once(&qword_100026330, sub_100016010);
      v14 = type metadata accessor for Logger(0);
      v15 = sub_100005110(v14, (uint64_t)qword_100027D10);
      v16 = Logger.logObject.getter(v15);
      v17 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "ContactsLimitedAccessPromptViewController unexpectedly got nil from user info", v18, 2u);
        swift_slowDealloc(v18, -1, -1);
      }

      result = (void *)sub_100012308();
      if (result)
      {
        v19 = result;
        objc_msgSend(result, "dismiss");
        return (void *)swift_unknownObjectRelease(v19);
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100013884(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
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
  id v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  double v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  id v79;
  char *v80;
  void *v81;
  char *v82;
  id v83;
  id v84;
  uint64_t v85;
  id v86;
  uint64_t v87;

  v2 = v1;
  if (qword_100026330 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100005110(v4, (uint64_t)qword_100027D10);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter(v6);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "ContactsLimitedAccessPromptSceneDelegate: scene will connect", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v9 = objc_opt_self(SBSUIRemoteAlertScene);
  v10 = (void *)swift_dynamicCastObjCClassUnconditional(a1, v9, 0, 0, 0);
  v11 = objc_allocWithZone((Class)UIWindow);
  v12 = a1;
  v13 = objc_msgSend(v11, "initWithWindowScene:", v10);
  v14 = OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window;
  v15 = *(void **)(v1 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window) = v13;

  v84 = (id)objc_opt_self(UIDevice);
  v16 = objc_msgSend(v84, "currentDevice");
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  v85 = v14;
  if (!v17)
  {
    v49 = *(void **)(v1 + v14);
    if (v49)
    {
      v50 = objc_msgSend(v49, "layer");
      v51 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
      v52 = objc_msgSend(v51, "CGColor");

      objc_msgSend(v50, "setBackgroundColor:", v52);
      v53 = *(void **)(v1 + v14);
      if (v53)
      {
        v54 = objc_msgSend(v53, "layer");
        v55 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
        v56 = objc_msgSend(v55, "CGColor");

        objc_msgSend(v54, "setShadowColor:", v56);
        v57 = *(void **)(v1 + v14);
        if (v57)
        {
          v58 = objc_msgSend(v57, "layer");
          LODWORD(v59) = 1.0;
          objc_msgSend(v58, "setShadowOpacity:", v59);

          v60 = *(void **)(v1 + v14);
          if (v60)
          {
            v61 = objc_msgSend(v60, "layer");
            objc_msgSend(v61, "setShadowOffset:", 0.0, 0.0);

            v62 = *(void **)(v1 + v14);
            if (v62)
            {
              v63 = objc_msgSend(v62, "layer");
              objc_msgSend(v63, "setShadowRadius:", 5.0);

            }
          }
        }
      }
    }
  }
  v18 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ContactsLimitedAccessPromptViewController()), "initWithNibName:bundle:", 0, 0);
  v19 = OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc;
  v20 = *(void **)(v1 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc) = v18;

  v21 = *(_QWORD *)(v1 + v19);
  if (v21)
  {
    v22 = *(_QWORD *)(v21 + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
    v23 = swift_allocObject(&unk_100021950, 24, 7);
    swift_unknownObjectWeakInit(v23 + 16, v1);
    v24 = swift_allocObject(&unk_100021978, 32, 7);
    *(_QWORD *)(v24 + 16) = v23;
    *(_QWORD *)(v24 + 24) = v10;
    v25 = *(_QWORD *)(v22 + 32);
    v26 = *(_QWORD *)(v22 + 40);
    *(_QWORD *)(v22 + 32) = sub_100014040;
    *(_QWORD *)(v22 + 40) = v24;
    v27 = v12;
    sub_10000758C(v25, v26);
    v28 = *(_QWORD *)(v1 + v19);
    if (v28)
    {
      v29 = *(_QWORD *)(v28
                      + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
      v30 = swift_allocObject(&unk_100021950, 24, 7);
      swift_unknownObjectWeakInit(v30 + 16, v1);
      v31 = swift_allocObject(&unk_1000219A0, 32, 7);
      *(_QWORD *)(v31 + 16) = v30;
      *(_QWORD *)(v31 + 24) = v10;
      v32 = *(_QWORD *)(v29 + 64);
      v33 = *(_QWORD *)(v29 + 72);
      *(_QWORD *)(v29 + 64) = sub_10001404C;
      *(_QWORD *)(v29 + 72) = v31;
      v34 = v27;
      sub_10000758C(v32, v33);
      v35 = *(_QWORD *)(v1 + v19);
      if (v35)
      {
        v36 = *(_QWORD *)(v35
                        + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
        v37 = swift_allocObject(&unk_100021950, 24, 7);
        swift_unknownObjectWeakInit(v37 + 16, v1);
        v38 = swift_allocObject(&unk_1000219C8, 32, 7);
        *(_QWORD *)(v38 + 16) = v37;
        *(_QWORD *)(v38 + 24) = v10;
        v39 = *(_QWORD *)(v36 + 48);
        v40 = *(_QWORD *)(v36 + 56);
        *(_QWORD *)(v36 + 48) = sub_100014098;
        *(_QWORD *)(v36 + 56) = v38;
        v41 = v34;
        sub_10000758C(v39, v40);
      }
    }
  }
  v42 = v12;
  v43 = Logger.logObject.getter(v42);
  v44 = static os_log_type_t.default.getter(v43);
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc(12, -1);
    v46 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v45 = 138412290;
    v47 = objc_msgSend(v10, "activationContext");
    v48 = v47;
    if (v47)
      v86 = v47;
    else
      v86 = 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v45 + 4, v45 + 12);
    *v46 = v48;

    _os_log_impl((void *)&_mh_execute_header, v43, v44, "ContactsLimitedAccessPromptSceneDelegate will activate with context %@", v45, 0xCu);
    v64 = sub_100005070(&qword_100026FB0);
    swift_arrayDestroy(v46, 1, v64);
    swift_slowDealloc(v46, -1, -1);
    swift_slowDealloc(v45, -1, -1);

  }
  else
  {

  }
  v65 = *(void **)(v2 + v19);
  v66 = v85;
  if (v65)
  {
    v67 = v65;
    v68 = objc_msgSend(v10, "activationContext");
    objc_msgSend(v67, "prepareForActivationWithContext:completion:", v68, 0);

    v69 = *(_QWORD *)(v2 + v19);
    if (v69)
    {
      v70 = *(_QWORD *)(v69
                      + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                      + 8);
      if (v70)
      {
        v71 = *(_QWORD *)(v69
                        + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID);
        v72 = *(_QWORD *)(v69
                        + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_observer);
        swift_bridgeObjectRetain(*(_QWORD *)(v69
                                           + OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_requestorBundleID
                                           + 8));
        swift_retain(v72);
        v73 = sub_100011990(v71, v70);
        v75 = v74;
        swift_bridgeObjectRelease(v70);
        v76 = *(_QWORD *)(v72 + 24);
        *(_QWORD *)(v72 + 16) = v73;
        *(_QWORD *)(v72 + 24) = v75;
        v66 = v85;
        swift_release(v72);
        swift_bridgeObjectRelease(v76);
      }
    }
  }
  v77 = *(void **)(v2 + v66);
  if (v77)
  {
    objc_msgSend(v77, "setRootViewController:", *(_QWORD *)(v2 + v19));
    v77 = *(void **)(v2 + v66);
  }
  objc_msgSend(v77, "makeKeyAndVisible");
  objc_msgSend(v10, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v10, "setAllowsMenuButtonDismissal:", 1);
  v78 = objc_msgSend(v84, "currentDevice");
  v79 = objc_msgSend(v78, "userInterfaceIdiom");

  if (v79 == (id)1)
  {
    v80 = *(char **)(v2 + v19);
    if (v80)
    {
      v81 = *(void **)&v80[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView];
      if (v81)
      {
        v82 = v80;
        v83 = v81;
        objc_msgSend(v82, "presentViewController:animated:completion:", v83, 1, 0);

      }
    }
  }

}

uint64_t sub_100014018()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

id sub_100014040(uint64_t a1)
{
  uint64_t v1;

  return sub_100012850(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

id sub_10001404C()
{
  uint64_t v0;

  return sub_1000129F4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), 0);
}

uint64_t sub_10001406C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

id sub_100014098()
{
  uint64_t v0;

  return sub_1000129F4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), 2);
}

void sub_1000140B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;

  v6 = tcc_server_create(0);
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (!kTCCServiceAddressBook)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = v6;
  v8 = kTCCServiceAddressBook;
  v9 = (id)tcc_service_singleton_for_CF_name();

  if (!v9)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10 = tcc_message_options_create();
  if (!v10)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v11 = (void *)v10;
  tcc_message_options_set_reply_handler_policy(v10, 1);
  tcc_message_options_set_request_prompt_policy(v11, 2);
  tcc_message_options_set_nokill_policy(v11, 1);
  if (!a3)
  {
    if (qword_100026330 != -1)
      swift_once(&qword_100026330, sub_100016010);
    v14 = type metadata accessor for Logger(0);
    v15 = sub_100005110(v14, (uint64_t)qword_100027D10);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "updateAddressBookAccess: don't know the requestor's bundle ID, so we can't set anything", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
      swift_unknownObjectRelease(v11);

    }
    else
    {

      swift_unknownObjectRelease(v7);
      v7 = (uint64_t)v9;
      v9 = v11;
    }
    goto LABEL_13;
  }
  v12 = String.utf8CString.getter(a2, a3);
  v13 = tcc_identity_create(0, v12 + 32);
  swift_release(v12);
  if (v13)
  {
    tcc_server_message_set_authorization_value(v7, v11, v13, v9, 0, a1, 0);
    swift_unknownObjectRelease(v7);
    swift_unknownObjectRelease(v9);
    v7 = (uint64_t)v11;
    v9 = (id)v13;
LABEL_13:
    swift_unknownObjectRelease(v7);
    swift_unknownObjectRelease(v9);
    return;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_1000142AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005070(&qword_100026FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000142F4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005070(&qword_100026FB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014334()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014360()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
}

uint64_t sub_100014388(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100014398(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000143A0(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_1000143B0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000143D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1000143E0(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100014414(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100014450(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

id sub_1000144D8()
{
  return sub_100012BD0(type metadata accessor for LimitedAccessContactPickerView.ControllerCoordinator);
}

uint64_t type metadata accessor for LimitedAccessContactPickerView.ControllerCoordinator()
{
  return objc_opt_self(_TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator);
}

uint64_t sub_100014544(uint64_t a1)
{
  uint64_t *v1;

  return sub_100014F14(a1, *v1, v1[1], v1[2]);
}

id sub_100014558@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  char *v10;
  id result;
  objc_super v12;

  v4 = v1[3];
  v3 = v1[4];
  v6 = v1[5];
  v5 = v1[6];
  v7 = (objc_class *)type metadata accessor for LimitedAccessContactPickerView.ControllerCoordinator();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR____TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator_completion];
  *(_QWORD *)v9 = v4;
  *((_QWORD *)v9 + 1) = v3;
  v10 = &v8[OBJC_IVAR____TtCV23LimitedAccessPromptView30LimitedAccessContactPickerView21ControllerCoordinator_goBackBlock];
  *(_QWORD *)v10 = v6;
  *((_QWORD *)v10 + 1) = v5;
  v12.receiver = v8;
  v12.super_class = v7;
  swift_retain(v3);
  swift_retain(v5);
  result = objc_msgSendSuper2(&v12, "init");
  *a1 = result;
  return result;
}

uint64_t sub_1000145EC(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

uint64_t sub_100014624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100014D08();
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100014674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100014D08();
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000146C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100014D08();
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

uint64_t sub_1000146F4(char *a1, uint64_t a2, void *a3, uint64_t a4, _QWORD *a5)
{
  unint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  id v12;
  char *v13;

  v9 = sub_1000060D0();
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = *(void (**)(uint64_t))&a1[*a5];
  v12 = a3;
  v13 = a1;
  v11(v10);

  return swift_bridgeObjectRelease(v10);
}

id sub_100014774()
{
  return sub_100012BD0(type metadata accessor for LimitedAccessSelectedContactsView.ControllerCoordinator);
}

uint64_t type metadata accessor for LimitedAccessSelectedContactsView.ControllerCoordinator()
{
  return objc_opt_self(_TtCV23LimitedAccessPromptView33LimitedAccessSelectedContactsView21ControllerCoordinator);
}

uint64_t destroy for LimitedAccessContactPickerView(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[2]);
  swift_release(a1[4]);
  return swift_release(a1[6]);
}

uint64_t initializeWithCopy for LimitedAccessContactPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 48);
  v6 = *(_OWORD *)(a2 + 16);
  v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  swift_retain(v4);
  return a1;
}

_QWORD *assignWithCopy for LimitedAccessContactPickerView(_QWORD *a1, _QWORD *a2)
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

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a2[4];
  v9 = a1[4];
  a1[3] = a2[3];
  a1[4] = v8;
  swift_retain(v8);
  swift_release(v9);
  v11 = a2[5];
  v10 = a2[6];
  v12 = a1[6];
  a1[5] = v11;
  a1[6] = v10;
  swift_retain(v10);
  swift_release(v12);
  return a1;
}

__n128 initializeWithTake for LimitedAccessContactPickerView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for LimitedAccessContactPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  v5 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v5);
  v6 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LimitedAccessContactPickerView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LimitedAccessContactPickerView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LimitedAccessContactPickerView()
{
  return &type metadata for LimitedAccessContactPickerView;
}

uint64_t destroy for LimitedAccessSelectedContactsView(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return swift_release(a1[2]);
}

uint64_t _s23LimitedAccessPromptView33LimitedAccessSelectedContactsViewVwCP_0(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *((_QWORD *)a2 + 2);
  v4 = *a2;
  *(_OWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v4);
  swift_retain(v3);
  return a1;
}

uint64_t *assignWithCopy for LimitedAccessSelectedContactsView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v7 = a2[1];
  v6 = a2[2];
  v8 = a1[2];
  a1[1] = v7;
  a1[2] = v6;
  swift_retain(v6);
  swift_release(v8);
  return a1;
}

__n128 initializeWithTake for LimitedAccessSelectedContactsView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for LimitedAccessSelectedContactsView(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*a1);
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v5 = a1[2];
  a1[2] = v4;
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for LimitedAccessSelectedContactsView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LimitedAccessSelectedContactsView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LimitedAccessSelectedContactsView()
{
  return &type metadata for LimitedAccessSelectedContactsView;
}

uint64_t sub_100014BC8(uint64_t a1)
{
  uint64_t *v1;

  return sub_100015158(a1, *v1);
}

id sub_100014BD0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  id result;
  objc_super v9;

  v4 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  v5 = (objc_class *)type metadata accessor for LimitedAccessSelectedContactsView.ControllerCoordinator();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtCV23LimitedAccessPromptView33LimitedAccessSelectedContactsView21ControllerCoordinator_completion];
  *(_QWORD *)v7 = v4;
  *((_QWORD *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain(v3);
  result = objc_msgSendSuper2(&v9, "init");
  *a1 = result;
  return result;
}

uint64_t sub_100014C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100014D4C();
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100014C94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100014D4C();
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100014CE4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100014D4C();
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_100014D08()
{
  unint64_t result;

  result = qword_1000271F0;
  if (!qword_1000271F0)
  {
    result = swift_getWitnessTable(&unk_100017AF8, &type metadata for LimitedAccessContactPickerView);
    atomic_store(result, (unint64_t *)&qword_1000271F0);
  }
  return result;
}

unint64_t sub_100014D4C()
{
  unint64_t result;

  result = qword_1000271F8;
  if (!qword_1000271F8)
  {
    result = swift_getWitnessTable(&unk_100017A80, &type metadata for LimitedAccessSelectedContactsView);
    atomic_store(result, (unint64_t *)&qword_1000271F8);
  }
  return result;
}

uint64_t sub_100014D90(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100014DAC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100014DAC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005070(&qword_100027208);
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

uint64_t sub_100014F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *v20;
  uint64_t v21;
  id v22;
  NSString v23;
  Class isa;
  id v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;

  v5 = a3;
  if (!((unint64_t)a4 >> 62))
  {
    v8 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRetain(a4);
    if (v8)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease(a4);
    v11 = (unint64_t *)&_swiftEmptyArrayStorage;
LABEL_17:
    v22 = objc_allocWithZone((Class)CNLimitedAccessContactPickerViewController);
    v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v11);
    v25 = objc_msgSend(v22, "initForOnboarding:selectedContacts:", v23, isa);

    v26 = sub_100005070(&qword_100027200);
    UIViewControllerRepresentableContext.coordinator.getter(&v31, v26);
    v27 = v31;
    objc_msgSend(v25, "setDelegate:", v31);

    return (uint64_t)v25;
  }
  if (a4 < 0)
    v21 = a4;
  else
    v21 = a4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a4);
  v8 = _CocoaArrayWrapper.endIndex.getter(v21);
  if (!v8)
    goto LABEL_16;
LABEL_3:
  v31 = (unint64_t *)&_swiftEmptyArrayStorage;
  result = sub_100014D90(0, v8 & ~(v8 >> 63), 0);
  if ((v8 & 0x8000000000000000) == 0)
  {
    v28 = a2;
    v29 = v5;
    v30 = a1;
    v10 = 0;
    v11 = v31;
    do
    {
      if ((a4 & 0xC000000000000001) != 0)
        v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a4);
      else
        v12 = *(id *)(a4 + 8 * v10 + 32);
      v13 = v12;
      v14 = objc_msgSend(v12, "identifier", v28, v29, v30);
      v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
      v17 = v16;

      v31 = v11;
      v19 = v11[2];
      v18 = v11[3];
      if (v19 >= v18 >> 1)
      {
        sub_100014D90(v18 > 1, v19 + 1, 1);
        v11 = v31;
      }
      ++v10;
      v11[2] = v19 + 1;
      v20 = &v11[2 * v19];
      v20[4] = v15;
      v20[5] = v17;
    }
    while (v8 != v10);
    swift_bridgeObjectRelease(a4);
    v5 = v29;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_100015158(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  id v18;
  Class isa;
  id v20;
  uint64_t v21;
  unint64_t *v22;
  uint64_t v23;
  unint64_t *v24;

  if (!((unint64_t)a2 >> 62))
  {
    v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a2);
    if (v4)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease(a2);
    v7 = (unint64_t *)&_swiftEmptyArrayStorage;
LABEL_17:
    v18 = objc_allocWithZone((Class)CNLimitedAccessContactPickerViewController);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
    v20 = objc_msgSend(v18, "initForShowSelected:", isa);

    v21 = sub_100005070((uint64_t *)&unk_100027210);
    UIViewControllerRepresentableContext.coordinator.getter(&v24, v21);
    v22 = v24;
    objc_msgSend(v20, "setDelegate:", v24);

    return (uint64_t)v20;
  }
  if (a2 < 0)
    v17 = a2;
  else
    v17 = a2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a2);
  v4 = _CocoaArrayWrapper.endIndex.getter(v17);
  if (!v4)
    goto LABEL_16;
LABEL_3:
  v24 = (unint64_t *)&_swiftEmptyArrayStorage;
  result = sub_100014D90(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v23 = a1;
    v6 = 0;
    v7 = v24;
    do
    {
      if ((a2 & 0xC000000000000001) != 0)
        v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a2);
      else
        v8 = *(id *)(a2 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, "identifier", v23);
      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      v13 = v12;

      v24 = v7;
      v15 = v7[2];
      v14 = v7[3];
      if (v15 >= v14 >> 1)
      {
        sub_100014D90(v14 > 1, v15 + 1, 1);
        v7 = v24;
      }
      ++v6;
      v7[2] = v15 + 1;
      v16 = &v7[2 * v15];
      v16[4] = v11;
      v16[5] = v13;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease(a2);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

id sub_1000154EC()
{
  return sub_100012BD0(type metadata accessor for LimitedAccessPromptSceneDelegate);
}

id sub_100015504(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, "init");
}

id sub_100015610()
{
  return sub_100012BD0(type metadata accessor for AppDelegate);
}

uint64_t sub_10001561C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v6;

  v0 = sub_100005070(&qword_1000272D8);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, nullsub_1, 0, &type metadata for EmptyView, &protocol witness table for EmptyView);
  v4 = sub_1000157C4();
  static SceneBuilder.buildBlock<A>(_:)(v3, v0, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100015720();
  static App.main()();
  return 0;
}

unint64_t sub_100015720()
{
  unint64_t result;

  result = qword_100027220;
  if (!qword_100027220)
  {
    result = swift_getWitnessTable(&unk_100017C60, &type metadata for LimitedAccessPromptView);
    atomic_store(result, (unint64_t *)&qword_100027220);
  }
  return result;
}

uint64_t type metadata accessor for LimitedAccessPromptSceneDelegate()
{
  return objc_opt_self(_TtC23LimitedAccessPromptView32LimitedAccessPromptSceneDelegate);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC23LimitedAccessPromptView11AppDelegate);
}

ValueMetadata *type metadata accessor for LimitedAccessPromptView()
{
  return &type metadata for LimitedAccessPromptView;
}

uint64_t sub_1000157B4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100018EC4, 1);
}

unint64_t sub_1000157C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000272E0;
  if (!qword_1000272E0)
  {
    v1 = sub_1000053EC(&qword_1000272D8);
    result = swift_getWitnessTable(&protocol conformance descriptor for WindowGroup<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000272E0);
  }
  return result;
}

uint64_t sub_100015810(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000158E0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100014414((uint64_t)v12, *a3);
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
      sub_100014414((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100015FEC(v12);
  return v7;
}

uint64_t sub_1000158E0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100015A98(a5, a6);
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

uint64_t sub_100015A98(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100015B2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100015D04(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100015D04(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100015B2C(uint64_t a1, unint64_t a2)
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
      v5 = sub_100015CA0(v4, 0);
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

_QWORD *sub_100015CA0(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005070(&qword_1000272E8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100015D04(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005070(&qword_1000272E8);
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

void sub_100015E50(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_100026330 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v4 = type metadata accessor for Logger(0);
  sub_100005110(v4, (uint64_t)qword_100027D10);
  v5 = swift_bridgeObjectRetain_n(a2, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter(v6);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v11 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    v10 = sub_100015810(a1, a2, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "LimitedAccessPromptSceneDelegate will continue activity with type: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
}

uint64_t sub_100015FEC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100016010()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100005128(v0, qword_100027D10);
  sub_100005110(v0, (uint64_t)qword_100027D10);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x8000000100017D50, 0xD000000000000015, 0x8000000100018790);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC23LimitedAccessPromptViewP33_34A4086236746274325F77466A94698519ResourceBundleClass);
}
