id sub_100003734()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t inited;
  unint64_t v5;
  Class isa;
  id v7;
  Class v8;
  _QWORD v10[2];
  _BYTE v11[104];

  v1 = v0;
  v2 = objc_msgSend(v0, "result");
  v3 = sub_100003A98(&qword_100008168);
  inited = swift_initStackObject(v3, v11);
  *(_OWORD *)(inited + 16) = xmmword_100003E10;
  v10[0] = 0x737572616C43;
  v10[1] = 0xE600000000000000;
  AnyHashable.init<A>(_:)(v10, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 96) = &type metadata for String;
  *(_QWORD *)(inited + 72) = 0x21666F6F4DLL;
  *(_QWORD *)(inited + 80) = 0xE500000000000000;
  v5 = sub_1000038A8(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  objc_msgSend(v2, "setData:", isa);

  v7 = objc_msgSend(v1, "result");
  sub_100003AD8();
  v8 = NSNumber.init(integerLiteral:)(0).super.super.isa;
  objc_msgSend(v7, "setStatusCode:", v8);

  return objc_msgSend(v1, "setFinished:", 1);
}

unint64_t sub_1000038A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003A98(&qword_100008178);
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
    sub_100003B44(v7, (uint64_t)v16);
    result = sub_100003B14((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_100003B8C(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
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

id sub_100003A48()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClarusController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ClarusController()
{
  return objc_opt_self(ClarusController);
}

uint64_t sub_100003A98(uint64_t *a1)
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

unint64_t sub_100003AD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008170;
  if (!qword_100008170)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008170);
  }
  return result;
}

unint64_t sub_100003B14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100003B9C(a1, v4);
}

uint64_t sub_100003B44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003A98(&qword_100008180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100003B8C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100003B9C(uint64_t a1, uint64_t a2)
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
      sub_100003C60(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100003C9C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100003C60(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100003C9C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}
