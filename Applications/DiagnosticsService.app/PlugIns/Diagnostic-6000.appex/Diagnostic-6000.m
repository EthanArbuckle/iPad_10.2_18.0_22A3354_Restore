uint64_t sub_100001914(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;

  if (!result)
  {
    __break(1u);
    return result;
  }
  v2 = v1;
  v3 = result;
  if (!*(_QWORD *)(result + 16))
  {
    v35 = 0u;
    v36 = 0u;
    goto LABEL_12;
  }
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerTextKey);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerTextKey + 8);
  swift_bridgeObjectRetain(v4);
  v6 = sub_10000272C(v5, v4);
  if ((v7 & 1) == 0)
    goto LABEL_10;
  sub_100001E90(*(_QWORD *)(v3 + 56) + 32 * v6, (uint64_t)&v35);
  swift_bridgeObjectRelease(v4, v8);
  if (!*((_QWORD *)&v36 + 1))
  {
LABEL_12:
    sub_100001E10((uint64_t)&v35);
    return 0;
  }
  if ((swift_dynamicCast(&v33, &v35, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
  {
    v4 = v34;
    if (*(_QWORD *)(v3 + 16))
    {
      v9 = v33;
      v11 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageTextKey);
      v10 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageTextKey + 8);
      swift_bridgeObjectRetain(v10);
      v12 = sub_10000272C(v11, v10);
      if ((v13 & 1) != 0)
      {
        sub_100001E90(*(_QWORD *)(v3 + 56) + 32 * v12, (uint64_t)&v35);
      }
      else
      {
        v35 = 0u;
        v36 = 0u;
      }
      swift_bridgeObjectRelease(v10, v13);
      if (*((_QWORD *)&v36 + 1))
      {
        if ((swift_dynamicCast(&v33, &v35, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
          goto LABEL_29;
        v15 = v34;
        if (*(_QWORD *)(v3 + 16))
        {
          v16 = v33;
          v18 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonsTextKey);
          v17 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonsTextKey + 8);
          swift_bridgeObjectRetain(v17);
          v19 = sub_10000272C(v18, v17);
          if ((v20 & 1) != 0)
          {
            sub_100001E90(*(_QWORD *)(v3 + 56) + 32 * v19, (uint64_t)&v35);
          }
          else
          {
            v35 = 0u;
            v36 = 0u;
          }
          swift_bridgeObjectRelease(v17, v20);
          if (*((_QWORD *)&v36 + 1))
          {
            v21 = sub_100001E50((uint64_t *)&unk_1000089C0);
            if ((swift_dynamicCast(&v33, &v35, (char *)&type metadata for Any + 8, v21, 6) & 1) != 0)
            {
              v23 = v33;
              if (*(_QWORD *)(v33 + 16))
              {
                v24 = (_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerText);
                v25 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerText + 8);
                *v24 = v9;
                v24[1] = v4;
                swift_bridgeObjectRelease(v25, v22);
                v26 = (_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageText);
                v27 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageText + 8);
                *v26 = v16;
                v26[1] = v15;
                swift_bridgeObjectRelease(v27, v28);
                v29 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonStrings);
                *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonStrings) = v23;
                swift_bridgeObjectRelease(v29, v30);
                return 1;
              }
              swift_bridgeObjectRelease(v4, v22);
              swift_bridgeObjectRelease(v15, v32);
              v31 = v23;
              goto LABEL_30;
            }
            swift_bridgeObjectRelease(v15, v22);
LABEL_29:
            v31 = v4;
LABEL_30:
            swift_bridgeObjectRelease(v31, v14);
            return 0;
          }
        }
        else
        {
          v35 = 0u;
          v36 = 0u;
        }
        swift_bridgeObjectRelease(v15, v14);
      }
      goto LABEL_11;
    }
LABEL_10:
    v35 = 0u;
    v36 = 0u;
LABEL_11:
    swift_bridgeObjectRelease(v4, v7);
    goto LABEL_12;
  }
  return 0;
}

id sub_100001C40()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  objc_super v7;

  v1 = &v0[OBJC_IVAR___UserAlertPresenterInputs_headerTextKey];
  *(_QWORD *)v1 = 0x6554726564616568;
  *((_QWORD *)v1 + 1) = 0xEA00000000007478;
  v2 = &v0[OBJC_IVAR___UserAlertPresenterInputs_messageTextKey];
  *(_QWORD *)v2 = 0x546567617373656DLL;
  *((_QWORD *)v2 + 1) = 0xEB00000000747865;
  v3 = &v0[OBJC_IVAR___UserAlertPresenterInputs_buttonsTextKey];
  *(_QWORD *)v3 = 0x736E6F74747562;
  *((_QWORD *)v3 + 1) = 0xE700000000000000;
  v4 = &v0[OBJC_IVAR___UserAlertPresenterInputs_headerText];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v0[OBJC_IVAR___UserAlertPresenterInputs_messageText];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR___UserAlertPresenterInputs_buttonStrings] = 0;
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserAlertPresenterInputs();
  return objc_msgSendSuper2(&v7, "init");
}

id sub_100001D34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserAlertPresenterInputs();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for UserAlertPresenterInputs()
{
  return objc_opt_self(UserAlertPresenterInputs);
}

uint64_t sub_100001E10(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100001E50(&qword_100008A10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100001E50(uint64_t *a1)
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

uint64_t sub_100001E90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_100001ECC()
{
  id result;

  result = (id)DiagnosticLogHandleForCategory(3);
  qword_100008A20 = (uint64_t)result;
  return result;
}

id sub_100001EF4(uint64_t a1, void *a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  id v11;
  Class isa;

  if (a1)
  {
    v5 = type metadata accessor for UserAlertPresenterInputs();
    v6 = swift_dynamicCastClass(a1, v5);
    if (v6)
      swift_unknownObjectRetain(a1);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(void **)&v2[OBJC_IVAR___UserAlertPresenterController_inputs];
  *(_QWORD *)&v2[OBJC_IVAR___UserAlertPresenterController_inputs] = v6;

  if ((objc_msgSend(a2, "respondsToSelector:", "displayAlertWithHeader:message:buttonStrings:completion:") & 1) != 0)
  {
    v8 = *(_QWORD *)&v2[OBJC_IVAR___UserAlertPresenterController_responder];
    *(_QWORD *)&v2[OBJC_IVAR___UserAlertPresenterController_responder] = a2;
    swift_unknownObjectRetain(a2);
    return (id)swift_unknownObjectRelease(v8);
  }
  else
  {
    v10 = static os_log_type_t.error.getter();
    if (qword_100008830 != -1)
      swift_once(&qword_100008830, sub_100001ECC);
    os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, qword_100008A20, "Responder does not support displaying alerts", 44, 2, &_swiftEmptyArrayStorage);
    v11 = objc_msgSend(v2, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v11, "setStatusCode:", isa);

    return objc_msgSend(v2, "setFinished:", 1);
  }
}

void sub_10000205C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(id, void *);
  id v7;
  id v8;

  v6 = *(void (**)(id, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(v8, a3);
  swift_release(v5);

}

void sub_100002144()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSString v8;
  NSString v9;
  Class isa;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  uint64_t v17;

  v1 = *(void **)&v0[OBJC_IVAR___UserAlertPresenterController_responder];
  if (!v1)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((objc_msgSend(*(id *)&v0[OBJC_IVAR___UserAlertPresenterController_responder], "respondsToSelector:", "displayAlertWithHeader:message:buttonStrings:completion:") & 1) == 0)return;
  v2 = *(_QWORD *)&v0[OBJC_IVAR___UserAlertPresenterController_inputs];
  if (!v2)
    goto LABEL_10;
  v3 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerText + 8);
  if (!v3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageText + 8);
  if (!v4)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonStrings);
  if (!v5)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v6 = swift_allocObject(&unk_1000042E8, 24, 7);
  *(_QWORD *)(v6 + 16) = v0;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_unknownObjectRetain(v1);
  swift_bridgeObjectRetain(v5);
  v7 = v0;
  v8 = String._bridgeToObjectiveC()();
  v9 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v16[4] = sub_1000026D0;
  v17 = v6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10000205C;
  v16[3] = &unk_100004300;
  v11 = _Block_copy(v16);
  swift_retain(v6);
  objc_msgSend(v1, "displayAlertWithHeader:message:buttonStrings:completion:", v8, v9, isa, v11);
  _Block_release(v11);

  v12 = v17;
  swift_bridgeObjectRelease(v3, v13);
  swift_bridgeObjectRelease(v4, v14);
  swift_bridgeObjectRelease(v5, v15);
  swift_release(v6);
  swift_unknownObjectRelease(v1);
  swift_release(v12);
}

id sub_100002344(void *a1, uint64_t a2, id a3)
{
  id v6;
  Class isa;
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  Class v15;
  uint64_t v16;
  id v17;
  Class v18;
  _OWORD v19[2];
  uint64_t v20;
  __int128 v21;
  unint64_t v22;
  _QWORD v23[5];

  v6 = objc_msgSend(a3, "result");
  if (a2)
  {
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v6, "setStatusCode:", isa);

    return objc_msgSend(a3, "setFinished:", 1);
  }
  else
  {
    *(_QWORD *)&v21 = 0xD000000000000013;
    *((_QWORD *)&v21 + 1) = 0x8000000100003C00;
    AnyHashable.init<A>(_:)(v23, &v21, &type metadata for String, &protocol witness table for String);
    v9 = sub_1000026F0();
    v22 = v9;
    *(_QWORD *)&v21 = a1;
    v10 = a1;
    v11 = objc_msgSend(v6, "data");
    v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v20 = v12;
    if (v9)
    {
      sub_100002A80(&v21, v19);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v12);
      sub_100002F6C(v19, (uint64_t)v23, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease(0x8000000000000000, v14);
      sub_100002A4C((uint64_t)v23);
    }
    else
    {
      sub_100001E10((uint64_t)&v21);
      sub_100002964((uint64_t)v23, v19);
      sub_100002A4C((uint64_t)v23);
      sub_100001E10((uint64_t)v19);
      v12 = v20;
    }
    v15 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12, v16);
    objc_msgSend(v6, "setData:", v15);

    v17 = objc_msgSend(a3, "result");
    v18 = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v17, "setStatusCode:", v18);

    return objc_msgSend(a3, "setFinished:", 1);
  }
}

id sub_100002624()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserAlertPresenterController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for UserAlertPresenterController()
{
  return objc_opt_self(UserAlertPresenterController);
}

uint64_t sub_1000026AC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_1000026D0(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100002344(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_1000026D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000026E8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_1000026F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008A08;
  if (!qword_100008A08)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008A08);
  }
  return result;
}

unint64_t sub_10000272C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000027C0(a1, a2, v5);
}

unint64_t sub_100002790(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1000028A0(a1, v4);
}

unint64_t sub_1000027C0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000028A0(uint64_t a1, uint64_t a2)
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
      sub_100003300(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100002A4C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_100002964@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  uint64_t v14;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100002790(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6, v8);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    v14 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000311C();
      v10 = v14;
    }
    sub_100002A4C(*(_QWORD *)(v10 + 48) + 40 * v7);
    sub_100002A80((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v7), a2);
    sub_100002DA4(v7, v10);
    v11 = *v3;
    *v3 = v10;
    swift_bridgeObjectRelease(v11, v12);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_100002A4C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

_OWORD *sub_100002A80(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100002A90(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100001E50(&qword_100008A18);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_44;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v15 << 6);
      goto LABEL_25;
    }
    v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }
    if (v22 >= v12)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v15;
    if (!v24)
    {
      v15 = v22 + 1;
      if (v22 + 1 >= v12)
        goto LABEL_37;
      v24 = *(_QWORD *)(v37 + 8 * v15);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v12)
        {
LABEL_37:
          swift_release(v5);
          if ((a2 & 1) == 0)
            goto LABEL_44;
          goto LABEL_40;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v15 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_46;
            if (v15 >= v12)
              goto LABEL_37;
            v24 = *(_QWORD *)(v37 + 8 * v15);
            ++v25;
            if (v24)
              goto LABEL_24;
          }
        }
        v15 = v25;
      }
    }
LABEL_24:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_25:
    v26 = *(_QWORD *)(v5 + 48) + 40 * v21;
    if ((a2 & 1) != 0)
    {
      v27 = *(_OWORD *)v26;
      v28 = *(_OWORD *)(v26 + 16);
      v41 = *(_QWORD *)(v26 + 32);
      v39 = v27;
      v40 = v28;
      sub_100002A80((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v21), v38);
    }
    else
    {
      sub_100003300(v26, (uint64_t)&v39);
      sub_100001E90(*(_QWORD *)(v5 + 56) + 32 * v21, (uint64_t)v38);
    }
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v29 = -1 << *(_BYTE *)(v8 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v13 + 8 * v31);
      }
      while (v35 == -1);
      v16 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    v17 = *(_QWORD *)(v8 + 48) + 40 * v16;
    v18 = v39;
    v19 = v40;
    *(_QWORD *)(v17 + 32) = v41;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
    result = (uint64_t)sub_100002A80(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v16));
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_44;
LABEL_40:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_44:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_100002DA4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_100003300(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
        result = sub_100002A4C((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_100002F6C(_OWORD *a1, uint64_t a2, char a3)
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
  _QWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_100002790(a2);
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
      {
LABEL_8:
        v17 = (_QWORD *)(v16[7] + 32 * v10);
        sub_10000333C(v17);
        return sub_100002A80(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_10000311C();
      goto LABEL_7;
    }
    sub_100002A90(v13, a3 & 1);
    v19 = sub_100002790(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_100003300(a2, (uint64_t)v21);
      return sub_1000030A4(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

_OWORD *sub_1000030A4(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_100002A80(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_10000311C()
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
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  sub_100001E50(&qword_100008A18);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_100003300(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_100001E90(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_100002A80(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100003300(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000333C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}
