uint64_t sub_1001CBF4C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a5(0) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v5;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1001CC064(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100262370, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xC)
    return 12;
  else
    return v3;
}

uint64_t sub_1001CC0AC(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6)
{
  uint64_t v10;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  void *object;
  unint64_t v22;
  const char *v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  void *v30;
  unint64_t v31;

  v10 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x2000000000000000) == 0)
    v10 = a5 & 0xFFFFFFFFFFFFLL;
  if (v10)
  {
    _StringGuts.grow(_:)(152);
    v13._countAndFlagsBits = 0xD00000000000002BLL;
    v13._object = (void *)0x8000000100215600;
    String.append(_:)(v13);
    v14._countAndFlagsBits = a1;
    v14._object = a2;
    String.append(_:)(v14);
    v15._countAndFlagsBits = 0xD000000000000016;
    v15._object = (void *)0x8000000100215630;
    String.append(_:)(v15);
    v16._countAndFlagsBits = a3;
    v16._object = a4;
    String.append(_:)(v16);
    v17._countAndFlagsBits = 0xD000000000000019;
    v17._object = (void *)0x8000000100215570;
    String.append(_:)(v17);
    v18._countAndFlagsBits = a5;
    v18._object = (void *)a6;
    String.append(_:)(v18);
    v19._object = (void *)0x8000000100215650;
    v19._countAndFlagsBits = 0xD000000000000012;
    String.append(_:)(v19);
    v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
    object = v20._object;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(object);
    v22 = 0xD000000000000024;
    v23 = "\" ORDER BY collected_on DESC LIMIT 1";
  }
  else
  {
    _StringGuts.grow(_:)(194);
    v24._countAndFlagsBits = 0xD00000000000004BLL;
    v24._object = (void *)0x80000001002156A0;
    String.append(_:)(v24);
    v25._countAndFlagsBits = a1;
    v25._object = a2;
    String.append(_:)(v25);
    v26._countAndFlagsBits = 0xD000000000000016;
    v26._object = (void *)0x8000000100215630;
    String.append(_:)(v26);
    v27._countAndFlagsBits = a3;
    v27._object = a4;
    String.append(_:)(v27);
    v28._object = (void *)0x8000000100215650;
    v28._countAndFlagsBits = 0xD000000000000012;
    String.append(_:)(v28);
    v29._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
    v30 = v29._object;
    String.append(_:)(v29);
    swift_bridgeObjectRelease(v30);
    v22 = 0xD000000000000049;
    v23 = "\"\n    ORDER BY collected_on DESC\n   ) AS sub\n    GROUP BY attribute_name";
  }
  v31 = (unint64_t)(v23 - 32) | 0x8000000000000000;
  String.append(_:)(*(Swift::String *)&v22);
  return 0;
}

uint64_t sub_1001CC308(void *a1, void *a2)
{
  Swift::String v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  void *object;

  _StringGuts.grow(_:)(92);
  v4._countAndFlagsBits = 0xD00000000000002CLL;
  v4._object = (void *)0x8000000100215540;
  String.append(_:)(v4);
  v5 = a1;
  v6 = objc_msgSend(v5, "description");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);

  swift_bridgeObjectRelease(v9);
  v11._countAndFlagsBits = 0xD000000000000019;
  v11._object = (void *)0x8000000100215570;
  String.append(_:)(v11);
  v12 = a2;
  v13 = objc_msgSend(v12, "description");
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v16 = v15;

  v17._countAndFlagsBits = v14;
  v17._object = v16;
  String.append(_:)(v17);

  swift_bridgeObjectRelease(v16);
  v18._object = (void *)0x8000000100215590;
  v18._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v18);
  v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
  object = v19._object;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(object);
  return 0;
}

unint64_t sub_1001CC490()
{
  unint64_t result;

  result = qword_1002B77D8;
  if (!qword_1002B77D8)
  {
    result = swift_getWitnessTable(&unk_100243CA8, &type metadata for Metric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B77D8);
  }
  return result;
}

unint64_t sub_1001CC4D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B77F8;
  if (!qword_1002B77F8)
  {
    v1 = sub_1001464C4((uint64_t *)&unk_1002B5640);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_1002B77F8);
  }
  return result;
}

uint64_t sub_1001CC530()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 72));
  return swift_deallocObject(v0, 80, 7);
}

void sub_1001CC57C()
{
  uint64_t v0;

  sub_1001C5918(*(_QWORD *)(v0 + 16), (void **)(v0 + 24), *(void (**)(_QWORD, uint64_t))(v0 + 64), *(_QWORD *)(v0 + 72));
}

uint64_t sub_1001CC58C()
{
  return sub_1001CC770((void (*)(_QWORD))&_swift_release);
}

uint64_t sub_1001CC598()
{
  uint64_t v0;

  return sub_1001C5EE4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1001CC5A4()
{
  uint64_t v0;

  return sub_1001C5F78(*(_QWORD *)(v0 + 16), *(_DWORD *)(v0 + 24), *(void (**)(_QWORD, uint64_t))(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1001CC5B4()
{
  return sub_1001CC894((void (*)(_QWORD, __n128))&_swift_errorRelease);
}

uint64_t sub_1001CC5C0()
{
  uint64_t v0;

  return sub_1001C6664(*(void (**)(_QWORD, uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1001CC5DC()
{
  return sub_1001CC894((void (*)(_QWORD, __n128))&_swift_bridgeObjectRelease);
}

uint64_t sub_1001CC5F0()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1001CC624()
{
  uint64_t v0;
  void *v1;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 16) + 16))
    v1 = *(void **)(v0 + 16);
  else
    v1 = &_swiftEmptyArrayStorage;
  return (*(uint64_t (**)(void *, _QWORD))(v0 + 24))(v1, 0);
}

uint64_t sub_1001CC660()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1001CC684()
{
  uint64_t v0;

  return sub_1001C4648(*(void (**)(_QWORD, uint64_t))(v0 + 16));
}

uint64_t sub_1001CC68C()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  swift_bridgeObjectRelease(v0[8]);
  swift_release(v0[11]);
  return swift_deallocObject(v0, 96, 7);
}

uint64_t sub_1001CC6D0()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[6]);
  swift_bridgeObjectRelease(v0[8]);
  return swift_deallocObject(v0, 72, 7);
}

const char *sub_1001CC70C()
{
  uint64_t v0;

  return sub_1001C25C4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(uint64_t, uint64_t))(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
}

uint64_t sub_1001CC720()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

void sub_1001CC754()
{
  uint64_t v0;

  sub_1001C5448(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(_QWORD, uint64_t))(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_1001CC764()
{
  return sub_1001CC770((void (*)(_QWORD))&_swift_release);
}

uint64_t sub_1001CC770(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));
  swift_release(*(_QWORD *)(v1 + 32));
  return swift_deallocObject(v1, 40, 7);
}

const char *sub_1001CC7A0()
{
  uint64_t v0;

  return sub_1001C5E38(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD, uint64_t))(v0 + 24));
}

uint64_t sub_1001CC7BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 16))(1, 0);
}

uint64_t sub_1001CC7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for STransferMetrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001CC82C()
{
  uint64_t v0;

  return sub_1001C46AC(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), *(void (**)(_QWORD, uint64_t))(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1001CC840()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1001CC86C()
{
  uint64_t v0;

  return sub_1001C53C8(*(void (**)(_QWORD, uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1001CC888()
{
  return sub_1001CC894((void (*)(_QWORD, __n128))&_swift_bridgeObjectRelease);
}

uint64_t sub_1001CC894(void (*a1)(_QWORD, __n128))
{
  uint64_t v1;
  __n128 v3;

  v3 = swift_release(*(_QWORD *)(v1 + 24));
  a1(*(_QWORD *)(v1 + 32), v3);
  return swift_deallocObject(v1, 40, 7);
}

uint64_t sub_1001CC8CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), 0);
}

uint64_t getEnumTagSinglePayload for Metric.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Metric.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_1001CC9D4 + 4 * byte_1002438D1[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_1001CCA08 + 4 * byte_1002438CC[v4]))();
}

uint64_t sub_1001CCA08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CCA10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001CCA18);
  return result;
}

uint64_t sub_1001CCA24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001CCA2CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_1001CCA30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001CCA38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Metric.CodingKeys()
{
  return &type metadata for Metric.CodingKeys;
}

uint64_t sub_1001CCA58(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for SQLiteError(uint64_t a1)
{
  return sub_1001CCA80(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1001CCA80(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t _s13FTMInternal_411SQLiteErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1001CCA58(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1001CCA58(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1001CCA80(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for SQLiteError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1001CCA80(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1001CCC04(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_1001CCC1C(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteError()
{
  return &type metadata for SQLiteError;
}

uint64_t *sub_1001CCC44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v13);
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for Date(0);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain(v7);
    v12(v9, v10, v11);
    *(_DWORD *)((char *)v4 + *(int *)(a3 + 24)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

_QWORD *sub_1001CCCFC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for Date(0);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10);
  *(_DWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_1001CCD88(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  *(_DWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_1001CCE18(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_DWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_1001CCE90(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  *(_DWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1001CCF10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001CCF1C);
}

uint64_t sub_1001CCF1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_1001CCF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001CCFA4);
}

uint64_t sub_1001CCFA4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1001CD018(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_1002439D8;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = (char *)&value witness table for Builtin.Int32 + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

unint64_t sub_1001CD09C()
{
  unint64_t result;

  result = qword_1002B78F0;
  if (!qword_1002B78F0)
  {
    result = swift_getWitnessTable(&unk_100243C80, &type metadata for Metric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B78F0);
  }
  return result;
}

unint64_t sub_1001CD0E4()
{
  unint64_t result;

  result = qword_1002B78F8;
  if (!qword_1002B78F8)
  {
    result = swift_getWitnessTable(&unk_100243BB8, &type metadata for Metric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B78F8);
  }
  return result;
}

unint64_t sub_1001CD12C()
{
  unint64_t result;

  result = qword_1002B7900;
  if (!qword_1002B7900)
  {
    result = swift_getWitnessTable(&unk_100243BE0, &type metadata for Metric.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7900);
  }
  return result;
}

id sub_1001CD244()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___exportOptionsLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___exportOptionsLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___exportOptionsLabel);
  }
  else
  {
    v4 = sub_1001CD2A0();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1001CD2A0()
{
  id v0;
  NSString v1;
  NSString v2;
  id v3;
  id v4;

  v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v1 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "setText:", v1);

  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend((id)objc_opt_self(UIColor), "colorNamed:", v2);

  objc_msgSend(v0, "setTextColor:", v3);
  objc_msgSend(v0, "setTextAlignment:", 1);
  objc_msgSend(v0, "setLineBreakMode:", 0);
  objc_msgSend(v0, "setNumberOfLines:", 2);
  v4 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:weight:", 30.0, UIFontWeightMedium);
  objc_msgSend(v0, "setFont:", v4);

  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v0;
}

id sub_1001CD410()
{
  id v0;
  NSString v1;
  id v2;
  NSString v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id (*v8)@<X0>(id *@<X0>, uint64_t (**)@<X0>(uint64_t *@<X8>)@<X8>);
  uint64_t v9;

  v0 = objc_msgSend(objc_allocWithZone((Class)UIButton), "init");
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v1);

  objc_msgSend(v0, "setImage:forState:", v2, 0);
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend((id)objc_opt_self(UIColor), "colorNamed:", v3);

  objc_msgSend(v0, "setTintColor:", v4);
  v8 = sub_1001CD588;
  v9 = 0;
  v5 = sub_100146438(&qword_1002B7968);
  v6 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v8, v5);
  objc_msgSend(v0, "addTarget:action:forControlEvents:", v6, "didTapDismissWithSender:", 64, v8, v9);
  swift_unknownObjectRelease(v6);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v0;
}

id sub_1001CD588@<X0>(id *a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  v6 = *a1;
  v3 = swift_allocObject(&unk_100267188, 24, 7);
  *(_QWORD *)(v3 + 16) = v6;
  v4 = swift_allocObject(&unk_1002671B0, 32, 7);
  *(_QWORD *)(v4 + 16) = sub_10018B95C;
  *(_QWORD *)(v4 + 24) = v3;
  *a2 = sub_10018B9A4;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v4;
  return v6;
}

id sub_1001CD604()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___loadingView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___loadingView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___loadingView];
  }
  else
  {
    v4 = sub_1001CD664(v0);
    v5 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1001CD664(char *a1)
{
  id v2;
  id v3;
  id result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  Class isa;

  v2 = objc_allocWithZone((Class)type metadata accessor for LoadingView());
  v3 = sub_10017FB00(0xD00000000000001FLL, 0x8000000100211350, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  result = objc_msgSend(a1, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = result;
  objc_msgSend(result, "addSubview:", v3);

  v6 = sub_100146438((uint64_t *)&unk_1002B42B0);
  v7 = swift_allocObject(v6, 64, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100240400;
  v8 = objc_msgSend(v3, "topAnchor");
  v9 = objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC13FTMInternal_420ExportViewController_dismissButton], "safeAreaLayoutGuide");
  v10 = objc_msgSend(v9, "bottomAnchor");

  v11 = objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  *(_QWORD *)(v7 + 32) = v11;
  v12 = objc_msgSend(v3, "leadingAnchor");
  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v13 = result;
  v14 = objc_msgSend(result, "safeAreaLayoutGuide");

  v15 = objc_msgSend(v14, "leadingAnchor");
  v16 = objc_msgSend(v12, "constraintEqualToAnchor:", v15);

  *(_QWORD *)(v7 + 40) = v16;
  v17 = objc_msgSend(v3, "trailingAnchor");
  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v18 = result;
  v19 = objc_msgSend(result, "safeAreaLayoutGuide");

  v20 = objc_msgSend(v19, "trailingAnchor");
  v21 = objc_msgSend(v17, "constraintEqualToAnchor:", v20);

  *(_QWORD *)(v7 + 48) = v21;
  v22 = objc_msgSend(v3, "bottomAnchor");
  result = objc_msgSend(a1, "view");
  if (result)
  {
    v23 = result;
    v24 = (void *)objc_opt_self(NSLayoutConstraint);
    v25 = objc_msgSend(v23, "safeAreaLayoutGuide");

    v26 = objc_msgSend(v25, "bottomAnchor");
    v27 = objc_msgSend(v22, "constraintEqualToAnchor:", v26);

    *(_QWORD *)(v7 + 56) = v27;
    specialized Array._endMutation()(v28);
    sub_10014C4C4();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
    objc_msgSend(v24, "activateConstraints:", isa);

    return v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_1001CDA2C()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
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
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  Class isa;
  objc_class *v71;
  char *v72;
  uint64_t v73;
  id v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  id v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  uint64_t v86;
  id v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  uint64_t v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  Class v128;
  char *v129;
  id v130;
  id v131;
  uint64_t v132;
  char *v133;
  objc_super v134;
  objc_super v135;
  objc_super v136;
  uint64_t v137;
  objc_super v138;

  v1 = v0;
  v138.receiver = v0;
  v138.super_class = (Class)type metadata accessor for ExportViewController();
  objc_msgSendSuper2(&v138, "viewDidLoad");
  v2 = objc_msgSend(v0, "view");
  if (!v2)
  {
    __break(1u);
    goto LABEL_13;
  }
  v3 = v2;
  v4 = sub_1001CD244();
  objc_msgSend(v3, "addSubview:", v4);

  v5 = objc_msgSend(v1, "view");
  if (!v5)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = *(void **)&v1[OBJC_IVAR____TtC13FTMInternal_420ExportViewController_dismissButton];
  objc_msgSend(v5, "addSubview:", v7);

  v8 = objc_msgSend(v1, "view");
  if (!v8)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v9 = v8;
  v10 = *(void **)&v1[OBJC_IVAR____TtC13FTMInternal_420ExportViewController_containerView];
  objc_msgSend(v8, "addSubview:", v10);

  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v132 = sub_100146438((uint64_t *)&unk_1002B42B0);
  v11 = swift_allocObject(v132, 120, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100243D40;
  v12 = objc_msgSend(v7, "topAnchor");
  v13 = objc_msgSend(v1, "view");
  if (!v13)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, "safeAreaLayoutGuide");

  v16 = objc_msgSend(v15, "topAnchor");
  v17 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v16, 25.0);

  *(_QWORD *)(v11 + 32) = v17;
  v18 = objc_msgSend(v7, "rightAnchor");
  v19 = objc_msgSend(v1, "view");
  if (!v19)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20 = v19;
  v21 = objc_msgSend(v19, "safeAreaLayoutGuide");

  v22 = objc_msgSend(v21, "rightAnchor");
  v23 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v22, -10.0);

  *(_QWORD *)(v11 + 40) = v23;
  v24 = objc_msgSend(v7, "heightAnchor");
  v25 = objc_msgSend(v24, "constraintEqualToConstant:", 30.0);

  *(_QWORD *)(v11 + 48) = v25;
  v26 = objc_msgSend(v7, "widthAnchor");
  v27 = objc_msgSend(v26, "constraintEqualToConstant:", 30.0);

  *(_QWORD *)(v11 + 56) = v27;
  v28 = sub_1001CD244();
  v29 = objc_msgSend(v28, "topAnchor");

  v30 = objc_msgSend(v7, "safeAreaLayoutGuide");
  v31 = objc_msgSend(v30, "bottomAnchor");

  v32 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 10.0);
  *(_QWORD *)(v11 + 64) = v32;
  v33 = sub_1001CD244();
  v34 = objc_msgSend(v33, "rightAnchor");

  v35 = objc_msgSend(v1, "view");
  if (!v35)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v36 = v35;
  v37 = objc_msgSend(v35, "safeAreaLayoutGuide");

  v38 = objc_msgSend(v37, "rightAnchor");
  v39 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", v38, -10.0);

  *(_QWORD *)(v11 + 72) = v39;
  v40 = sub_1001CD244();
  v41 = objc_msgSend(v40, "leftAnchor");

  v42 = objc_msgSend(v1, "view");
  if (!v42)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v43 = v42;
  v44 = objc_msgSend(v42, "safeAreaLayoutGuide");

  v45 = objc_msgSend(v44, "leftAnchor");
  v46 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", v45, 10.0);

  *(_QWORD *)(v11 + 80) = v46;
  v47 = objc_msgSend(v10, "topAnchor");
  v48 = sub_1001CD244();
  v49 = objc_msgSend(v48, "bottomAnchor");

  v50 = objc_msgSend(v47, "constraintEqualToAnchor:", v49);
  *(_QWORD *)(v11 + 88) = v50;
  v51 = objc_msgSend(v10, "rightAnchor");
  v52 = objc_msgSend(v1, "view");
  if (!v52)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v53 = v52;
  v54 = objc_msgSend(v52, "safeAreaLayoutGuide");

  v55 = objc_msgSend(v54, "rightAnchor");
  v56 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", v55, -10.0);

  *(_QWORD *)(v11 + 96) = v56;
  v57 = objc_msgSend(v10, "leftAnchor");
  v58 = objc_msgSend(v1, "view");
  if (!v58)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v59 = v58;
  v60 = objc_msgSend(v58, "safeAreaLayoutGuide");

  v61 = objc_msgSend(v60, "leftAnchor");
  v62 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", v61, 10.0);

  *(_QWORD *)(v11 + 104) = v62;
  v63 = objc_msgSend(v10, "bottomAnchor");
  v64 = objc_msgSend(v1, "view");
  v131 = v10;
  if (v64)
  {
    v65 = v64;
    v130 = (id)objc_opt_self(NSLayoutConstraint);
    v66 = objc_msgSend(v65, "safeAreaLayoutGuide");

    v67 = objc_msgSend(v66, "bottomAnchor");
    v68 = objc_msgSend(v63, "constraintEqualToAnchor:constant:", v67, -10.0);

    *(_QWORD *)(v11 + 112) = v68;
    v137 = v11;
    specialized Array._endMutation()(v69);
    sub_10014C4C4();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v11);
    objc_msgSend(v130, "activateConstraints:", isa);

    v71 = (objc_class *)type metadata accessor for ExportView();
    v72 = (char *)objc_allocWithZone(v71);
    v73 = OBJC_IVAR____TtC13FTMInternal_410ExportView_label;
    v74 = objc_allocWithZone((Class)UILabel);
    v75 = v72;
    *(_QWORD *)&v72[v73] = objc_msgSend(v74, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v76 = &v75[OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate];
    *((_QWORD *)v76 + 1) = 0;
    swift_unknownObjectWeakInit(v76, 0);
    v75[OBJC_IVAR____TtC13FTMInternal_410ExportView_timeFrame] = 0;
    v77 = &v75[OBJC_IVAR____TtC13FTMInternal_410ExportView_labelText];
    *(_QWORD *)v77 = 0x796C696144;
    *((_QWORD *)v77 + 1) = 0xE500000000000000;

    v136.receiver = v75;
    v136.super_class = v71;
    v133 = (char *)objc_msgSendSuper2(&v136, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    sub_10014BF10();
    *(_QWORD *)&v133[OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate + 8] = &off_100267168;
    swift_unknownObjectWeakAssign();
    v78 = (char *)objc_allocWithZone(v71);
    v79 = OBJC_IVAR____TtC13FTMInternal_410ExportView_label;
    v80 = objc_allocWithZone((Class)UILabel);
    v81 = v78;
    *(_QWORD *)&v78[v79] = objc_msgSend(v80, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v82 = &v81[OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate];
    *((_QWORD *)v82 + 1) = 0;
    swift_unknownObjectWeakInit(v82, 0);
    v81[OBJC_IVAR____TtC13FTMInternal_410ExportView_timeFrame] = 1;
    v83 = &v81[OBJC_IVAR____TtC13FTMInternal_410ExportView_labelText];
    *(_QWORD *)v83 = 0x796C6B656557;
    *((_QWORD *)v83 + 1) = 0xE600000000000000;

    v135.receiver = v81;
    v135.super_class = v71;
    v84 = (char *)objc_msgSendSuper2(&v135, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    sub_10014BF10();
    *(_QWORD *)&v84[OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate + 8] = &off_100267168;
    swift_unknownObjectWeakAssign();
    v85 = (char *)objc_allocWithZone(v71);
    v86 = OBJC_IVAR____TtC13FTMInternal_410ExportView_label;
    v87 = objc_allocWithZone((Class)UILabel);
    v88 = v85;
    *(_QWORD *)&v85[v86] = objc_msgSend(v87, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v89 = &v88[OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate];
    *((_QWORD *)v89 + 1) = 0;
    swift_unknownObjectWeakInit(v89, 0);
    v88[OBJC_IVAR____TtC13FTMInternal_410ExportView_timeFrame] = 2;
    v90 = &v88[OBJC_IVAR____TtC13FTMInternal_410ExportView_labelText];
    *(_QWORD *)v90 = 0x796C68746E6F4DLL;
    *((_QWORD *)v90 + 1) = 0xE700000000000000;

    v134.receiver = v88;
    v134.super_class = v71;
    v91 = (char *)objc_msgSendSuper2(&v134, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    sub_10014BF10();
    v129 = v91;
    *(_QWORD *)&v91[OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate + 8] = &off_100267168;
    swift_unknownObjectWeakAssign();
    objc_msgSend(v131, "addSubview:", v133);
    objc_msgSend(v131, "addSubview:", v84);
    objc_msgSend(v131, "addSubview:", v91);
    v92 = swift_allocObject(v132, 128, 7);
    *(_OWORD *)(v92 + 16) = xmmword_100243D50;
    v93 = objc_msgSend(v133, "topAnchor");
    v94 = objc_msgSend(v131, "topAnchor");
    v95 = objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, 10.0);

    *(_QWORD *)(v92 + 32) = v95;
    v96 = objc_msgSend(v133, "rightAnchor");
    v97 = objc_msgSend(v131, "rightAnchor");
    v98 = objc_msgSend(v96, "constraintEqualToAnchor:constant:", v97, -10.0);

    *(_QWORD *)(v92 + 40) = v98;
    v99 = objc_msgSend(v133, "leftAnchor");
    v100 = objc_msgSend(v131, "leftAnchor");
    v101 = objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100, 10.0);

    *(_QWORD *)(v92 + 48) = v101;
    v102 = objc_msgSend(v133, "heightAnchor");
    v103 = objc_msgSend(v102, "constraintEqualToConstant:", 150.0);

    *(_QWORD *)(v92 + 56) = v103;
    v104 = objc_msgSend(v84, "topAnchor");
    v105 = objc_msgSend(v133, "bottomAnchor");
    v106 = objc_msgSend(v104, "constraintEqualToAnchor:constant:", v105, 10.0);

    *(_QWORD *)(v92 + 64) = v106;
    v107 = objc_msgSend(v84, "rightAnchor");
    v108 = objc_msgSend(v131, "rightAnchor");
    v109 = objc_msgSend(v107, "constraintEqualToAnchor:constant:", v108, -10.0);

    *(_QWORD *)(v92 + 72) = v109;
    v110 = objc_msgSend(v84, "leftAnchor");
    v111 = objc_msgSend(v131, "leftAnchor");
    v112 = objc_msgSend(v110, "constraintEqualToAnchor:constant:", v111, 10.0);

    *(_QWORD *)(v92 + 80) = v112;
    v113 = objc_msgSend(v84, "heightAnchor");
    v114 = objc_msgSend(v113, "constraintEqualToConstant:", 150.0);

    *(_QWORD *)(v92 + 88) = v114;
    v115 = objc_msgSend(v129, "topAnchor");
    v116 = objc_msgSend(v84, "bottomAnchor");
    v117 = objc_msgSend(v115, "constraintEqualToAnchor:constant:", v116, 10.0);

    *(_QWORD *)(v92 + 96) = v117;
    v118 = objc_msgSend(v129, "rightAnchor");
    v119 = objc_msgSend(v131, "rightAnchor");
    v120 = objc_msgSend(v118, "constraintEqualToAnchor:constant:", v119, -10.0);

    *(_QWORD *)(v92 + 104) = v120;
    v121 = objc_msgSend(v129, "leftAnchor");
    v122 = objc_msgSend(v131, "leftAnchor");
    v123 = objc_msgSend(v121, "constraintEqualToAnchor:constant:", v122, 10.0);

    *(_QWORD *)(v92 + 112) = v123;
    v124 = objc_msgSend(v129, "heightAnchor");
    v125 = objc_msgSend(v124, "constraintEqualToConstant:", 150.0);

    *(_QWORD *)(v92 + 120) = v125;
    v137 = v92;
    specialized Array._endMutation()(v126);
    v127 = v137;
    v128 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v127);
    objc_msgSend(v130, "activateConstraints:", v128);

    return;
  }
LABEL_21:
  __break(1u);
}

void sub_1001CEA90()
{
  uint64_t v0;

}

id sub_1001CEAEC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExportViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ExportViewController()
{
  return objc_opt_self(_TtC13FTMInternal_420ExportViewController);
}

void sub_1001CEBA4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  Class isa;
  id v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[3];
  char v52[8];
  uint64_t v53;
  unint64_t v54;
  _QWORD *v55;

  v6 = type metadata accessor for Metric(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_1002B39F8 != -1)
      swift_once(&qword_1002B39F8, sub_100174778);
    v11 = qword_1002BEFE8;
    v12 = static os_log_type_t.error.getter();
    v13 = sub_100146438((uint64_t *)&unk_1002B57E0);
    v14 = swift_allocObject(v13, 72, 7);
    *(_OWORD *)(v14 + 16) = xmmword_1002402A0;
    swift_getErrorValue(a2, v52, v51);
    v53 = Error.localizedDescription.getter(v51[1], v51[2]);
    v54 = v15;
    v16 = sub_100146438((uint64_t *)&unk_1002B5640);
    v17 = String.init<A>(describing:)(&v53, v16);
    v19 = v18;
    *(_QWORD *)(v14 + 56) = &type metadata for String;
    *(_QWORD *)(v14 + 64) = sub_10016B1E0();
    *(_QWORD *)(v14 + 32) = v17;
    *(_QWORD *)(v14 + 40) = v19;
    os_log(_:dso:log:type:_:)("error  ---> %{public}s)", 23, 2, &_mh_execute_header, v11, v12, v14);
    swift_bridgeObjectRelease(v14);
  }
  else
  {
    v50 = v8;
    v20 = sub_1001CD604();
    v21 = OBJC_IVAR____TtC13FTMInternal_411LoadingView_shouldHideLoadingView;
    v20[OBJC_IVAR____TtC13FTMInternal_411LoadingView_shouldHideLoadingView] = 1;
    v22 = sub_10017F82C();
    objc_msgSend(v22, "setHidden:", v20[v21]);

    v23 = sub_10017F930();
    objc_msgSend(v23, "setHidden:", v20[v21]);

    v24 = sub_10017F82C();
    objc_msgSend(v24, "stopAnimating");

    objc_msgSend(v20, "setHidden:", 1);
    if (a1)
    {
      v25 = *(_QWORD *)(a1 + 16);
      v26 = &_swiftEmptyArrayStorage;
      if (v25)
      {
        v49 = a3;
        v55 = &_swiftEmptyArrayStorage;
        sub_100195A34(0, v25, 0);
        v27 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
        v28 = *(_QWORD *)(v7 + 72);
        v29 = v50;
        do
        {
          sub_1001AC840(v27, (uint64_t)v10);
          v53 = 0;
          v54 = 0xE000000000000000;
          _print_unlocked<A, B>(_:_:)(v10, &v53, v29, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          v30 = v53;
          v31 = v54;
          sub_10017E214((uint64_t)v10);
          v26 = v55;
          if ((swift_isUniquelyReferenced_nonNull_native(v55) & 1) == 0)
          {
            sub_100195A34(0, v26[2] + 1, 1);
            v29 = v50;
            v26 = v55;
          }
          v33 = v26[2];
          v32 = v26[3];
          if (v33 >= v32 >> 1)
          {
            sub_100195A34(v32 > 1, v33 + 1, 1);
            v29 = v50;
            v26 = v55;
          }
          v26[2] = v33 + 1;
          v34 = (char *)&v26[2 * v33];
          *((_QWORD *)v34 + 4) = v30;
          *((_QWORD *)v34 + 5) = v31;
          v27 += v28;
          --v25;
        }
        while (v25);
        a3 = v49;
      }
      v53 = (uint64_t)v26;
      v35 = sub_100146438(&qword_1002B5630);
      v36 = sub_1001CF100();
      v37 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v35, v36);
      v39 = v38;
      swift_bridgeObjectRelease(v26);
      v40 = sub_100146438(&qword_1002B5660);
      v41 = swift_allocObject(v40, 64, 7);
      *(_OWORD *)(v41 + 16) = xmmword_1002402A0;
      *(_QWORD *)(v41 + 56) = &type metadata for String;
      *(_QWORD *)(v41 + 32) = v37;
      *(_QWORD *)(v41 + 40) = v39;
      v42 = objc_allocWithZone((Class)UIActivityViewController);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v41);
      v44 = objc_msgSend(v42, "initWithActivityItems:applicationActivities:", isa, 0);

      objc_msgSend(v44, "setModalPresentationStyle:", 7);
      v45 = objc_msgSend(v44, "popoverPresentationController");
      if (v45)
      {
        v46 = v45;
        v47 = objc_msgSend(a3, "view");
        objc_msgSend(v46, "setSourceView:", v47);

        objc_msgSend(v46, "setPermittedArrowDirections:", 0);
      }
      objc_msgSend(a3, "presentViewController:animated:completion:", v44, 1, 0);

    }
  }
}

void sub_1001CF00C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___exportOptionsLabel] = 0;
  v1 = OBJC_IVAR____TtC13FTMInternal_420ExportViewController_dismissButton;
  *(_QWORD *)&v0[v1] = sub_1001CD410();
  *(_QWORD *)&v0[OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___loadingView] = 0;
  v2 = OBJC_IVAR____TtC13FTMInternal_420ExportViewController_containerView;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/ExportViewController.swift", 40, 2, 61, 0);
  __break(1u);
}

uint64_t sub_1001CF0B8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001CF0DC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

unint64_t sub_1001CF100()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B5638;
  if (!qword_1002B5638)
  {
    v1 = sub_1001464C4(&qword_1002B5630);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1002B5638);
  }
  return result;
}

unint64_t sub_1001CF150()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B7970;
  if (!qword_1002B7970)
  {
    v1 = sub_1001464C4(&qword_1002B7978);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1002B7970);
  }
  return result;
}

uint64_t sub_1001CF19C(char a1)
{
  return qword_100244710[a1];
}

uint64_t sub_1001CF1B0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001CF1E4 + 4 * byte_100243D90[a1]))(0x746C7561666564, 0xE700000000000000);
}

uint64_t sub_1001CF1E4()
{
  return 1885958006;
}

uint64_t sub_1001CF1F4()
{
  return 0x6F65646976;
}

uint64_t sub_1001CF208()
{
  return 0x756F72676B636162;
}

uint64_t sub_1001CF224()
{
  return 0x6563696F76;
}

uint64_t sub_1001CF238()
{
  return 0x69736E6F70736572;
}

uint64_t sub_1001CF28C()
{
  return 0x6E6769536C6C6163;
}

uint64_t sub_1001CF2B0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1001CF2E4 + 4 * byte_100243D99[a1]))(0x746C7561666564, 0xE700000000000000);
}

uint64_t sub_1001CF2E4()
{
  return 1885958006;
}

uint64_t sub_1001CF2F4()
{
  return 0x6F65646976;
}

uint64_t sub_1001CF308()
{
  return 0x756F72676B636162;
}

uint64_t sub_1001CF324()
{
  return 0x6563696F76;
}

uint64_t sub_1001CF338()
{
  return 0x69736E6F70736572;
}

uint64_t sub_1001CF38C()
{
  return 0x6E6769536C6C6163;
}

void sub_1001CF3B0(_QWORD *a1, uint64_t a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD v20[3];
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
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

  v40 = a2;
  v3 = sub_100146438(&qword_1002B7A28);
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  __chkstk_darwin(v3);
  v37 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100146438(&qword_1002B7A30);
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  __chkstk_darwin(v5);
  v34 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100146438(&qword_1002B7A38);
  v32 = *(_QWORD *)(v7 - 8);
  v33 = v7;
  __chkstk_darwin(v7);
  v31 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100146438(&qword_1002B7A40);
  v29 = *(_QWORD *)(v9 - 8);
  v30 = v9;
  __chkstk_darwin(v9);
  v28 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100146438(&qword_1002B7A48);
  v26 = *(_QWORD *)(v11 - 8);
  v27 = v11;
  __chkstk_darwin(v11);
  v25 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_100146438(&qword_1002B7A50);
  v23 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v22 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100146438(&qword_1002B7A58);
  v20[2] = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v20[1] = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[0] = sub_100146438(&qword_1002B7A60);
  __chkstk_darwin(v20[0]);
  v15 = sub_100146438(&qword_1002B7A68);
  __chkstk_darwin(v15);
  v16 = sub_100146438(&qword_1002B7A70);
  v41 = *(_QWORD *)(v16 - 8);
  v42 = v16;
  __chkstk_darwin(v16);
  v17 = a1[3];
  v18 = a1[4];
  sub_100146508(a1, v17);
  v19 = sub_1001D09F0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for SURLSessionTrafficClass.CodingKeys, &type metadata for SURLSessionTrafficClass.CodingKeys, v19, v17, v18);
  __asm { BR              X10 }
}

uint64_t sub_1001CF6C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v4 - 89) = 0;
  v5 = sub_1001D0C54();
  v6 = *(_QWORD *)(v4 - 104);
  ((void (*)(ValueMetadata *, uint64_t, uint64_t, ValueMetadata *, unint64_t))KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:))(&type metadata for SURLSessionTrafficClass.DefaultCodingKeys, v4 - 89, v6, &type metadata for SURLSessionTrafficClass.DefaultCodingKeys, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 112) + 8))(v2, v6);
}

uint64_t sub_1001CF98C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0ABC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CF9B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0ABC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CF9DC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0B88();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFA04(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0B88();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFA2C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0A34();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFA54(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0A34();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFA7C()
{
  unsigned __int8 *v0;

  return sub_1001CF2B0(*v0);
}

uint64_t sub_1001CFA84@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1001CFE4C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1001CFAA8(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_1001CFAB4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D09F0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFADC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D09F0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFB04(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0C54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFB2C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0C54();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFB54(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0A78();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFB7C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0A78();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFBA4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0B00();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFBCC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0B00();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFBF4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0BCC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFC1C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0BCC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFC44(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0B44();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFC6C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0B44();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFC94@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_1001CFCC0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0C10();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001CFCE8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001D0C10();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001CFD10@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1001CFE2C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001CFD38@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_1001CF19C(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1001CFD60@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1001D0254(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_1001CFD88(_QWORD *a1)
{
  unsigned __int8 *v1;

  sub_1001CF3B0(a1, *v1);
}

BOOL sub_1001CFDA0(char *a1, char *a2)
{
  return sub_100166F28(*a1, *a2);
}

Swift::Int sub_1001CFDAC()
{
  char *v0;

  return sub_100167098(0, *v0);
}

void sub_1001CFDB8(uint64_t a1)
{
  char *v1;

  sub_100167068(a1, *v1);
}

Swift::Int sub_1001CFDC0(uint64_t a1)
{
  char *v1;

  return sub_100167098(a1, *v1);
}

uint64_t sub_1001CFDC8()
{
  unsigned __int8 *v0;

  return sub_1001CF1B0(*v0);
}

void sub_1001CFDD0(_QWORD *a1@<X8>)
{
  *a1 = &off_100260190;
}

unint64_t sub_1001CFDE8()
{
  unint64_t result;

  result = qword_1002B7980;
  if (!qword_1002B7980)
  {
    result = swift_getWitnessTable(&unk_100243E98, &type metadata for SURLSessionTrafficClass);
    atomic_store(result, (unint64_t *)&qword_1002B7980);
  }
  return result;
}

uint64_t sub_1001CFE2C(unint64_t a1)
{
  if (a1 > 0xB)
    return 9;
  else
    return byte_100244758[a1];
}

uint64_t sub_1001CFE4C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;

  if (a1 == 0x746C7561666564 && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x746C7561666564, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 1885958006 && a2 == 0xE400000000000000)
  {
    v7 = 0xE400000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1885958006, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6F65646976 && a2 == 0xE500000000000000)
  {
    v8 = 0xE500000000000000;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F65646976, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x756F72676B636162 && a2 == 0xEA0000000000646ELL)
  {
    v9 = 0xEA0000000000646ELL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x756F72676B636162, 0xEA0000000000646ELL, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_26;
  }
  if (a1 == 0x6563696F76 && a2 == 0xE500000000000000)
  {
    v10 = 0xE500000000000000;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6563696F76, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
    goto LABEL_32;
  }
  if (a1 == 0x69736E6F70736572 && a2 == 0xEE00617461446576)
  {
    v11 = 0xEE00617461446576;
LABEL_38:
    swift_bridgeObjectRelease(v11);
    return 5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x69736E6F70736572, 0xEE00617461446576, a1, a2, 0) & 1) != 0)
  {
    v11 = a2;
    goto LABEL_38;
  }
  if (a1 == 0x6D61657274537661 && a2 == 0xEB00000000676E69)
  {
    v12 = 0xEB00000000676E69;
LABEL_44:
    swift_bridgeObjectRelease(v12);
    return 6;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D61657274537661, 0xEB00000000676E69, a1, a2, 0) & 1) != 0)
  {
    v12 = a2;
    goto LABEL_44;
  }
  if (a1 == 0x69736E6F70736572 && a2 == 0xEC00000056416576)
  {
    v13 = 0xEC00000056416576;
LABEL_50:
    swift_bridgeObjectRelease(v13);
    return 7;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x69736E6F70736572, 0xEC00000056416576, a1, a2, 0) & 1) != 0)
  {
    v13 = a2;
    goto LABEL_50;
  }
  if (a1 == 0x6E6769536C6C6163 && a2 == 0xED0000676E696C61)
  {
    swift_bridgeObjectRelease(0xED0000676E696C61);
    return 8;
  }
  else
  {
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6769536C6C6163, 0xED0000676E696C61, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v14 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_1001D0254(_QWORD *a1)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[7];
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
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  _QWORD *v60;
  uint64_t v61;

  v2 = sub_100146438(&qword_1002B7988);
  v50 = *(_QWORD *)(v2 - 8);
  v51 = v2;
  __chkstk_darwin(v2);
  v59 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100146438(&qword_1002B7990);
  v48 = *(_QWORD *)(v4 - 8);
  v49 = v4;
  __chkstk_darwin(v4);
  v58 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100146438(&qword_1002B7998);
  v46 = *(_QWORD *)(v6 - 8);
  v47 = v6;
  __chkstk_darwin(v6);
  v57 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_100146438(&qword_1002B79A0);
  v42 = *(_QWORD *)(v45 - 8);
  __chkstk_darwin(v45);
  v55 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100146438(&qword_1002B79A8);
  v43 = *(_QWORD *)(v9 - 8);
  v44 = v9;
  __chkstk_darwin(v9);
  v56 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_100146438(&qword_1002B79B0);
  v40 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v54 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_100146438(&qword_1002B79B8);
  v38 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v53 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_100146438(&qword_1002B79C0);
  v36[6] = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  v52 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100146438(&qword_1002B79C8);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100146438(&qword_1002B79D0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1[3];
  v22 = a1[4];
  v60 = a1;
  sub_100146508(a1, v23);
  v24 = sub_1001D09F0();
  v25 = v61;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for SURLSessionTrafficClass.CodingKeys, &type metadata for SURLSessionTrafficClass.CodingKeys, v24, v23, v22);
  if (!v25)
  {
    v36[4] = v17;
    v36[2] = v15;
    v36[3] = v14;
    v61 = v19;
    v36[5] = 0;
    v26 = v21;
    v27 = KeyedDecodingContainer.allKeys.getter(v18);
    v28 = v27;
    if (*(_QWORD *)(v27 + 16) == 1)
    {
      v29 = (char *)&loc_1001D05E0 + 4 * byte_100243DAB[*(unsigned __int8 *)(v27 + 32)];
      v36[1] = *(unsigned __int8 *)(v27 + 32);
      __asm { BR              X9 }
    }
    v30 = type metadata accessor for DecodingError(0);
    swift_allocError(v30, &protocol witness table for DecodingError, 0, 0);
    v32 = v31;
    sub_100146438(&qword_1002B4938);
    *v32 = &type metadata for SURLSessionTrafficClass;
    v33 = KeyedDecodingContainer.codingPath.getter(v18);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v33, 0xD00000000000002BLL, 0x8000000100211650, 0);
    v34 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v32, enum case for DecodingError.typeMismatch(_:), v30);
    swift_willThrow(v34);
    swift_bridgeObjectRelease(v28);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v26, v18);
  }
  return sub_10014652C(v60);
}

unint64_t sub_1001D09F0()
{
  unint64_t result;

  result = qword_1002B79D8;
  if (!qword_1002B79D8)
  {
    result = swift_getWitnessTable(&unk_1002446B8, &type metadata for SURLSessionTrafficClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B79D8);
  }
  return result;
}

unint64_t sub_1001D0A34()
{
  unint64_t result;

  result = qword_1002B79E0;
  if (!qword_1002B79E0)
  {
    result = swift_getWitnessTable(&unk_100244668, &type metadata for SURLSessionTrafficClass.CallSignalingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B79E0);
  }
  return result;
}

unint64_t sub_1001D0A78()
{
  unint64_t result;

  result = qword_1002B79E8;
  if (!qword_1002B79E8)
  {
    result = swift_getWitnessTable(&unk_100244618, &type metadata for SURLSessionTrafficClass.ResponsiveAVCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B79E8);
  }
  return result;
}

unint64_t sub_1001D0ABC()
{
  unint64_t result;

  result = qword_1002B79F0;
  if (!qword_1002B79F0)
  {
    result = swift_getWitnessTable(&unk_1002445C8, &type metadata for SURLSessionTrafficClass.AvStreamingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B79F0);
  }
  return result;
}

unint64_t sub_1001D0B00()
{
  unint64_t result;

  result = qword_1002B79F8;
  if (!qword_1002B79F8)
  {
    result = swift_getWitnessTable(&unk_100244578, &type metadata for SURLSessionTrafficClass.ResponsiveDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B79F8);
  }
  return result;
}

unint64_t sub_1001D0B44()
{
  unint64_t result;

  result = qword_1002B7A00;
  if (!qword_1002B7A00)
  {
    result = swift_getWitnessTable(&unk_100244528, &type metadata for SURLSessionTrafficClass.VoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A00);
  }
  return result;
}

unint64_t sub_1001D0B88()
{
  unint64_t result;

  result = qword_1002B7A08;
  if (!qword_1002B7A08)
  {
    result = swift_getWitnessTable(&unk_1002444D8, &type metadata for SURLSessionTrafficClass.BackgroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A08);
  }
  return result;
}

unint64_t sub_1001D0BCC()
{
  unint64_t result;

  result = qword_1002B7A10;
  if (!qword_1002B7A10)
  {
    result = swift_getWitnessTable(&unk_100244488, &type metadata for SURLSessionTrafficClass.VideoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A10);
  }
  return result;
}

unint64_t sub_1001D0C10()
{
  unint64_t result;

  result = qword_1002B7A18;
  if (!qword_1002B7A18)
  {
    result = swift_getWitnessTable(&unk_100244438, &type metadata for SURLSessionTrafficClass.VoipCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A18);
  }
  return result;
}

unint64_t sub_1001D0C54()
{
  unint64_t result;

  result = qword_1002B7A20;
  if (!qword_1002B7A20)
  {
    result = swift_getWitnessTable(&unk_1002443E8, &type metadata for SURLSessionTrafficClass.DefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A20);
  }
  return result;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.CodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.CodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.DefaultCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.DefaultCodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.VoipCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.VoipCodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.VideoCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.VideoCodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.BackgroundCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.BackgroundCodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.VoiceCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.VoiceCodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.ResponsiveDataCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.ResponsiveDataCodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.AvStreamingCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.AvStreamingCodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.ResponsiveAVCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.ResponsiveAVCodingKeys;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass.CallSignalingCodingKeys()
{
  return &type metadata for SURLSessionTrafficClass.CallSignalingCodingKeys;
}

uint64_t _s13FTMInternal_423SURLSessionTrafficClassOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s13FTMInternal_423SURLSessionTrafficClassOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_1001D0E1C + 4 * byte_100243DB9[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1001D0E50 + 4 * byte_100243DB4[v4]))();
}

uint64_t sub_1001D0E50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D0E58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001D0E60);
  return result;
}

uint64_t sub_1001D0E6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001D0E74);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_1001D0E78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001D0E80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SURLSessionTrafficClass()
{
  return &type metadata for SURLSessionTrafficClass;
}

unint64_t sub_1001D0EA0()
{
  unint64_t result;

  result = qword_1002B7A78;
  if (!qword_1002B7A78)
  {
    result = swift_getWitnessTable(&unk_1002443C0, &type metadata for SURLSessionTrafficClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A78);
  }
  return result;
}

unint64_t sub_1001D0EE8()
{
  unint64_t result;

  result = qword_1002B7A80;
  if (!qword_1002B7A80)
  {
    result = swift_getWitnessTable(&unk_1002442E0, &type metadata for SURLSessionTrafficClass.DefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A80);
  }
  return result;
}

unint64_t sub_1001D0F30()
{
  unint64_t result;

  result = qword_1002B7A88;
  if (!qword_1002B7A88)
  {
    result = swift_getWitnessTable(&unk_100244308, &type metadata for SURLSessionTrafficClass.DefaultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A88);
  }
  return result;
}

unint64_t sub_1001D0F78()
{
  unint64_t result;

  result = qword_1002B7A90;
  if (!qword_1002B7A90)
  {
    result = swift_getWitnessTable(&unk_100244290, &type metadata for SURLSessionTrafficClass.VoipCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A90);
  }
  return result;
}

unint64_t sub_1001D0FC0()
{
  unint64_t result;

  result = qword_1002B7A98;
  if (!qword_1002B7A98)
  {
    result = swift_getWitnessTable(&unk_1002442B8, &type metadata for SURLSessionTrafficClass.VoipCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7A98);
  }
  return result;
}

unint64_t sub_1001D1008()
{
  unint64_t result;

  result = qword_1002B7AA0;
  if (!qword_1002B7AA0)
  {
    result = swift_getWitnessTable(&unk_100244240, &type metadata for SURLSessionTrafficClass.VideoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AA0);
  }
  return result;
}

unint64_t sub_1001D1050()
{
  unint64_t result;

  result = qword_1002B7AA8;
  if (!qword_1002B7AA8)
  {
    result = swift_getWitnessTable(&unk_100244268, &type metadata for SURLSessionTrafficClass.VideoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AA8);
  }
  return result;
}

unint64_t sub_1001D1098()
{
  unint64_t result;

  result = qword_1002B7AB0;
  if (!qword_1002B7AB0)
  {
    result = swift_getWitnessTable(&unk_1002441F0, &type metadata for SURLSessionTrafficClass.BackgroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AB0);
  }
  return result;
}

unint64_t sub_1001D10E0()
{
  unint64_t result;

  result = qword_1002B7AB8;
  if (!qword_1002B7AB8)
  {
    result = swift_getWitnessTable(&unk_100244218, &type metadata for SURLSessionTrafficClass.BackgroundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AB8);
  }
  return result;
}

unint64_t sub_1001D1128()
{
  unint64_t result;

  result = qword_1002B7AC0;
  if (!qword_1002B7AC0)
  {
    result = swift_getWitnessTable(&unk_1002441A0, &type metadata for SURLSessionTrafficClass.VoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AC0);
  }
  return result;
}

unint64_t sub_1001D1170()
{
  unint64_t result;

  result = qword_1002B7AC8;
  if (!qword_1002B7AC8)
  {
    result = swift_getWitnessTable(&unk_1002441C8, &type metadata for SURLSessionTrafficClass.VoiceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AC8);
  }
  return result;
}

unint64_t sub_1001D11B8()
{
  unint64_t result;

  result = qword_1002B7AD0;
  if (!qword_1002B7AD0)
  {
    result = swift_getWitnessTable(&unk_100244150, &type metadata for SURLSessionTrafficClass.ResponsiveDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AD0);
  }
  return result;
}

unint64_t sub_1001D1200()
{
  unint64_t result;

  result = qword_1002B7AD8;
  if (!qword_1002B7AD8)
  {
    result = swift_getWitnessTable(&unk_100244178, &type metadata for SURLSessionTrafficClass.ResponsiveDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AD8);
  }
  return result;
}

unint64_t sub_1001D1248()
{
  unint64_t result;

  result = qword_1002B7AE0;
  if (!qword_1002B7AE0)
  {
    result = swift_getWitnessTable(&unk_100244100, &type metadata for SURLSessionTrafficClass.AvStreamingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AE0);
  }
  return result;
}

unint64_t sub_1001D1290()
{
  unint64_t result;

  result = qword_1002B7AE8;
  if (!qword_1002B7AE8)
  {
    result = swift_getWitnessTable(&unk_100244128, &type metadata for SURLSessionTrafficClass.AvStreamingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AE8);
  }
  return result;
}

unint64_t sub_1001D12D8()
{
  unint64_t result;

  result = qword_1002B7AF0;
  if (!qword_1002B7AF0)
  {
    result = swift_getWitnessTable(&unk_1002440B0, &type metadata for SURLSessionTrafficClass.ResponsiveAVCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AF0);
  }
  return result;
}

unint64_t sub_1001D1320()
{
  unint64_t result;

  result = qword_1002B7AF8;
  if (!qword_1002B7AF8)
  {
    result = swift_getWitnessTable(&unk_1002440D8, &type metadata for SURLSessionTrafficClass.ResponsiveAVCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7AF8);
  }
  return result;
}

unint64_t sub_1001D1368()
{
  unint64_t result;

  result = qword_1002B7B00;
  if (!qword_1002B7B00)
  {
    result = swift_getWitnessTable(&unk_100244060, &type metadata for SURLSessionTrafficClass.CallSignalingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7B00);
  }
  return result;
}

unint64_t sub_1001D13B0()
{
  unint64_t result;

  result = qword_1002B7B08;
  if (!qword_1002B7B08)
  {
    result = swift_getWitnessTable(&unk_100244088, &type metadata for SURLSessionTrafficClass.CallSignalingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7B08);
  }
  return result;
}

unint64_t sub_1001D13F8()
{
  unint64_t result;

  result = qword_1002B7B10;
  if (!qword_1002B7B10)
  {
    result = swift_getWitnessTable(&unk_100244330, &type metadata for SURLSessionTrafficClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7B10);
  }
  return result;
}

unint64_t sub_1001D1440()
{
  unint64_t result;

  result = qword_1002B7B18;
  if (!qword_1002B7B18)
  {
    result = swift_getWitnessTable(&unk_100244358, &type metadata for SURLSessionTrafficClass.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7B18);
  }
  return result;
}

uint64_t sub_1001D1488()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v1 = (void *)objc_opt_self(NSNotificationCenter);
  v2 = objc_msgSend(v1, "defaultCenter");
  if (qword_1002B3A48 != -1)
    swift_once(&qword_1002B3A48, sub_100175234);
  objc_msgSend(v2, "removeObserver:name:object:", v0, static NSNotificationName.subsIdSelectionChange, 0);

  v3 = objc_msgSend(v1, "defaultCenter");
  if (qword_1002B3A58 != -1)
    swift_once(&qword_1002B3A58, sub_100175354);
  objc_msgSend(v3, "removeObserver:name:object:", v0, static NSNotificationName.dashboardMetricUpdate, 0);

  v4 = objc_msgSend(v1, "defaultCenter");
  if (qword_1002B3A50 != -1)
    swift_once(&qword_1002B3A50, sub_1001752C4);
  objc_msgSend(v4, "removeObserver:name:object:", v0, static NSNotificationName.numberOfSubsChanged, 0);

  v5 = objc_msgSend(v1, "defaultCenter");
  if (qword_1002B3A30 != -1)
    swift_once(&qword_1002B3A30, sub_100175074);
  objc_msgSend(v5, "removeObserver:name:object:", v0, static NSNotificationName.NewABMMetric, 0);

  v6 = objc_msgSend(v1, "defaultCenter");
  if (qword_1002B3A38 != -1)
    swift_once(&qword_1002B3A38, sub_100175108);
  objc_msgSend(v6, "removeObserver:name:object:", v0, static NSNotificationName.NewCTMetric, 0);

  v7 = objc_msgSend(v1, "defaultCenter");
  if (qword_1002B3A60 != -1)
    swift_once(&qword_1002B3A60, sub_1001753E4);
  objc_msgSend(v7, "removeObserver:name:object:", v0, static NSNotificationName.isAirPlaneModeEnabled, 0);

  sub_10014C77C(v0 + 24);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  return v0;
}

uint64_t sub_1001D1740()
{
  uint64_t v0;

  sub_1001D1488();
  return swift_deallocClassInstance(v0, 65, 7);
}

void sub_1001D1760(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD), uint64_t a4, uint64_t a5)
{
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
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void **v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t Strong;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
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
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  char *v87;
  void *v88;
  uint64_t v89;
  const void *v90;
  char *v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  unint64_t v99;
  void *v100;
  _QWORD *v101;
  uint64_t v102;
  void (*v103)(_QWORD, _QWORD);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(_QWORD, _QWORD);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  _QWORD *v145;
  void **aBlock;
  uint64_t v147;
  uint64_t (*v148)();
  void *v149;
  void (*v150)();
  _QWORD *v151;
  _QWORD *v152;
  char v153[8];
  char v154[8];
  char v155[8];

  v129 = a5;
  v128 = type metadata accessor for DispatchWorkItemFlags(0);
  v127 = *(_QWORD *)(v128 - 8);
  __chkstk_darwin(v128);
  v126 = (char *)&v117 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = type metadata accessor for DispatchQoS(0);
  v124 = *(_QWORD *)(v125 - 8);
  v10 = __chkstk_darwin(v125);
  v123 = (char *)&v117 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 && (v15 = *(_QWORD *)(a1 + 16)) != 0)
  {
    v143 = v129 + 16;
    v16 = qword_1002B3A78;
    v17 = swift_bridgeObjectRetain(a1);
    if (v16 != -1)
      v17 = swift_once(&qword_1002B3A78, sub_100183CA4);
    v21 = &qword_1002BF000;
    v22 = *(_BYTE *)(qword_1002BF068 + 26) == 1;
    v120 = a4;
    v119 = a2;
    v118 = a3;
    if (v22)
    {
      if (qword_1002B3A00 != -1)
        v17 = swift_once(&qword_1002B3A00, sub_100174798);
      v23 = qword_1002BEFF0;
      v24 = static os_log_type_t.default.getter(v17, v18, v19, v20);
      v25 = sub_100146438((uint64_t *)&unk_1002B57E0);
      v26 = swift_allocObject(v25, 72, 7);
      *(_OWORD *)(v26 + 16) = xmmword_1002402A0;
      *(_QWORD *)(v26 + 56) = &type metadata for Int;
      *(_QWORD *)(v26 + 64) = &protocol witness table for Int;
      *(_QWORD *)(v26 + 32) = v15;
      os_log(_:dso:log:type:_:)("DashboardViewModel -  loadDashboardData - dashboardList.count %{public}d", 72, 2, &_mh_execute_header, v23, v24, v26);
      swift_bridgeObjectRelease(v26);
    }
    else
    {
      if (qword_1002B3A00 != -1)
        v17 = swift_once(&qword_1002B3A00, sub_100174798);
      v29 = qword_1002BEFF0;
      v30 = static os_log_type_t.default.getter(v17, v18, v19, v20);
      os_log(_:dso:log:type:_:)("DashboardViewModel -  loadDashboardData", 39, 2, &_mh_execute_header, v29, v30, _swiftEmptyArrayStorage);
    }
    v122 = swift_allocObject(&unk_100267618, 24, 7);
    *(_QWORD *)(v122 + 16) = _swiftEmptyArrayStorage;
    v31 = v143;
    swift_beginAccess(v143, v155, 0, 0);
    swift_beginAccess(v31, v154, 0, 0);
    swift_beginAccess(v31, v153, 0, 0);
    v121 = a1;
    v32 = (void **)(a1 + 56);
    do
    {
      v33 = *(v32 - 3);
      v34 = *(v32 - 2);
      v36 = *(v32 - 1);
      v35 = *v32;
      Strong = swift_weakLoadStrong(v143);
      v144 = v35;
      if (Strong)
      {
        v38 = Strong;
        v39 = *(void **)(Strong + 48);
        v40 = v33;
        v41 = v34;
        v42 = v36;
        v43 = v35;
        v44 = v39;
        swift_release(v38);
        dispatch_group_enter(v44);

      }
      else
      {
        v45 = v33;
        v46 = v34;
        v47 = v36;
        v48 = v35;
      }
      v49 = v21[13];
      v50 = *(_DWORD *)(v49 + 148);
      v51 = *(unsigned __int8 *)(v49 + 152);
      v52 = swift_weakLoadStrong(v143);
      v53 = v52;
      if (v51 == 1)
      {
        if (v52)
        {
          v54 = *(id *)(v52 + 48);
          swift_release(v53);
          dispatch_group_leave(v54);

        }
      }
      else if (v52)
      {
        v140 = *(id *)(v52 + 16);
        swift_release(v53);
        v133 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
        v56 = v55;
        v132 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
        v142 = v57;
        v131 = static String._unconditionallyBridgeFromObjectiveC(_:)(v144);
        v59 = v58;
        v60 = swift_allocObject(&unk_100267690, 32, 7);
        v141 = v34;
        v61 = v60;
        v62 = v122;
        v63 = v129;
        *(_QWORD *)(v61 + 16) = v122;
        *(_QWORD *)(v61 + 24) = v63;
        v64 = v61;
        swift_retain(v62);
        v65 = swift_retain(v63);
        v69 = sub_1001BC480(v65, v66, v67, v68);
        v139 = v69;
        v70 = swift_allocObject(&unk_1002676B8, 32, 7);
        v130 = v70;
        *(_QWORD *)(v70 + 16) = sub_1001D570C;
        *(_QWORD *)(v70 + 24) = v64;
        v71 = v15;
        v72 = v50;
        v73 = v64;
        v135 = v64;
        v137 = *(_QWORD *)(v69 + 24);
        v74 = swift_allocObject(&unk_1002676E0, 24, 7);
        swift_weakInit(v74 + 16, v69);
        v75 = swift_allocObject(&unk_100267708, 96, 7);
        v136 = v74;
        v76 = v133;
        *(_QWORD *)(v75 + 16) = v74;
        *(_QWORD *)(v75 + 24) = v76;
        v138 = v56;
        v77 = v132;
        *(_QWORD *)(v75 + 32) = v56;
        *(_QWORD *)(v75 + 40) = v77;
        v78 = v142;
        v79 = v131;
        *(_QWORD *)(v75 + 48) = v142;
        *(_QWORD *)(v75 + 56) = v79;
        v134 = v59;
        *(_QWORD *)(v75 + 64) = v59;
        *(_DWORD *)(v75 + 72) = v72;
        v15 = v71;
        v80 = v130;
        *(_QWORD *)(v75 + 80) = sub_10014C774;
        *(_QWORD *)(v75 + 88) = v80;
        v150 = sub_10017F3A8;
        v151 = (_QWORD *)v75;
        aBlock = _NSConcreteStackBlock;
        v147 = 1107296256;
        v148 = sub_1001BE428;
        v149 = &unk_100267720;
        v133 = _Block_copy(&aBlock);
        swift_retain(v73);
        swift_retain(v74);
        swift_bridgeObjectRetain(v56);
        swift_bridgeObjectRetain(v78);
        swift_bridgeObjectRetain(v59);
        v81 = swift_retain(v80);
        v82 = v123;
        static DispatchQoS.unspecified.getter(v81);
        v152 = _swiftEmptyArrayStorage;
        v83 = sub_1001998B4((unint64_t *)&qword_1002B6530, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        v84 = sub_100146438((uint64_t *)&unk_1002B55F0);
        v85 = sub_1001924F4();
        v86 = v33;
        v87 = v126;
        v88 = v36;
        v89 = v128;
        dispatch thunk of SetAlgebra.init<A>(_:)(&v152, v84, v85, v128, v83);
        v90 = v133;
        OS_dispatch_queue.async(group:qos:flags:execute:)(0, v82, v87, v133);
        _Block_release(v90);
        v91 = v87;
        v33 = v86;
        v92 = v89;
        v36 = v88;
        (*(void (**)(char *, uint64_t))(v127 + 8))(v91, v92);
        (*(void (**)(char *, uint64_t))(v124 + 8))(v82, v125);
        v93 = v151;
        swift_bridgeObjectRelease(v142);
        swift_bridgeObjectRelease(v134);
        v34 = v141;
        swift_release(v135);
        swift_release(v139);
        v94 = v80;
        v21 = &qword_1002BF000;
        swift_release(v94);
        swift_release(v136);
        swift_release(v93);

        swift_bridgeObjectRelease(v138);
      }

      v32 += 5;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease(v121);
    v95 = v143;
    swift_beginAccess(v143, &v152, 0, 0);
    v96 = swift_weakLoadStrong(v95);
    if (v96)
    {
      v97 = v96;
      v98 = *(id *)(v96 + 48);
      swift_release(v97);
      v99 = sub_100192474();
      v100 = (void *)static OS_dispatch_queue.main.getter(v99);
      v101 = (_QWORD *)swift_allocObject(&unk_100267640, 56, 7);
      v102 = v119;
      v103 = v118;
      v101[2] = v119;
      v101[3] = v103;
      v104 = v120;
      v105 = v129;
      v101[4] = v120;
      v101[5] = v105;
      v106 = v122;
      v101[6] = v122;
      v150 = sub_1001D56B8;
      v151 = v101;
      aBlock = _NSConcreteStackBlock;
      v147 = 1107296256;
      v148 = sub_1001BE428;
      v149 = &unk_100267658;
      v107 = _Block_copy(&aBlock);
      swift_retain(v106);
      swift_retain(v105);
      swift_errorRetain(v102);
      v108 = swift_retain(v104);
      v109 = v123;
      static DispatchQoS.unspecified.getter(v108);
      v145 = _swiftEmptyArrayStorage;
      v110 = sub_1001998B4((unint64_t *)&qword_1002B6530, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v111 = sub_100146438((uint64_t *)&unk_1002B55F0);
      v112 = sub_1001924F4();
      v113 = v126;
      v114 = v128;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v145, v111, v112, v128, v110);
      OS_dispatch_group.notify(qos:flags:queue:execute:)(v109, v113, v100, v107);
      _Block_release(v107);

      (*(void (**)(char *, uint64_t))(v127 + 8))(v113, v114);
      (*(void (**)(char *, uint64_t))(v124 + 8))(v109, v125);
      v115 = v151;
      swift_release(v106);
      v116 = (uint64_t)v115;
    }
    else
    {
      v116 = v122;
    }
    swift_release(v116);
  }
  else
  {
    if (qword_1002B3A00 != -1)
      v10 = swift_once(&qword_1002B3A00, sub_100174798);
    v27 = qword_1002BEFF0;
    v28 = static os_log_type_t.default.getter(v10, v11, v12, v13);
    os_log(_:dso:log:type:_:)("DashboardViewModel -  loadDashboardData - dashboardList.isempty", 63, 2, &_mh_execute_header, v27, v28, _swiftEmptyArrayStorage);
    a3(0, a2);
  }
}

void sub_1001D2128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  uint64_t Strong;
  uint64_t v19;
  NSObject *v20;
  _BYTE v22[24];

  v7 = type metadata accessor for Metric(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = a4 + 16;
  if (a1 && *(_QWORD *)(a1 + 16))
  {
    v12 = (unint64_t *)(a3 + 16);
    v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    sub_10017417C(a1 + v13, (uint64_t)v10, type metadata accessor for Metric);
    swift_beginAccess(v12, v22, 33, 0);
    v14 = *v12;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v12);
    *v12 = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_1001C7104(0, *(_QWORD *)(v14 + 16) + 1, 1, v14);
      *v12 = v14;
    }
    v17 = *(_QWORD *)(v14 + 16);
    v16 = *(_QWORD *)(v14 + 24);
    if (v17 >= v16 >> 1)
    {
      v14 = sub_1001C7104(v16 > 1, v17 + 1, 1, v14);
      *v12 = v14;
    }
    *(_QWORD *)(v14 + 16) = v17 + 1;
    sub_1001B5618((uint64_t)v10, v14 + v13 + *(_QWORD *)(v8 + 72) * v17, type metadata accessor for Metric);
    swift_endAccess(v22);
  }
  swift_beginAccess(v11, v22, 0, 0);
  Strong = swift_weakLoadStrong(v11);
  if (Strong)
  {
    v19 = Strong;
    v20 = *(id *)(Strong + 48);
    swift_release(v19);
    dispatch_group_leave(v20);

  }
}

void sub_1001D22C0(uint64_t a1, void (*a2)(_QWORD *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Strong;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  char v18;
  _BYTE v19[24];
  _BYTE v20[24];

  v6 = a4 + 16;
  if (a1)
  {
    a2(0, a1);
    v7 = v20;
  }
  else
  {
    v8 = (uint64_t *)(a5 + 16);
    swift_beginAccess(a5 + 16, v20, 0, 0);
    if (!*(_QWORD *)(*v8 + 16))
    {
      a2(_swiftEmptyArrayStorage, 0);
      return;
    }
    v9 = sub_100146438(&qword_1002B5660);
    v10 = swift_allocObject(v9, 64, 7);
    *(_OWORD *)(v10 + 16) = xmmword_1002402A0;
    *(_QWORD *)(v10 + 56) = &type metadata for String;
    *(_QWORD *)(v10 + 32) = 0xD000000000000014;
    *(_QWORD *)(v10 + 40) = 0x8000000100215E80;
    print(_:separator:terminator:)(v10, 32, 0xE100000000000000, 10, 0xE100000000000000);
    swift_bridgeObjectRelease(v10);
    swift_beginAccess(v8, v19, 0, 0);
    v11 = *v8;
    v12 = swift_bridgeObjectRetain(v11);
    a2((_QWORD *)v12, 0);
    swift_bridgeObjectRelease(v11);
    v7 = &v18;
  }
  swift_beginAccess(v6, v7, 0, 0);
  Strong = swift_weakLoadStrong(v6);
  if (Strong)
  {
    v14 = Strong;
    v15 = swift_unknownObjectWeakLoadStrong(Strong + 24);
    v16 = *(_QWORD *)(v14 + 32);
    swift_release(v14);
    if (v15)
    {
      ObjectType = swift_getObjectType(v15);
      (*(void (**)(uint64_t, uint64_t))(v16 + 32))(ObjectType, v16);
      swift_unknownObjectRelease(v15);
    }
  }
}

uint64_t sub_1001D2444(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
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
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t *v32;
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
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  int64_t v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  int *v53;
  _QWORD *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  Swift::String v60;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  unint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  _QWORD *v91;
  char *v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  Swift::String *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  Swift::String v124;
  void *v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t *v128;
  char v129;
  void (*v130)(unint64_t, uint64_t, uint64_t, char *);
  unsigned int (*v131)(uint64_t, uint64_t, char *);
  unint64_t v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  int64_t v143;
  int v144;
  unint64_t v145;
  _QWORD *v146;
  unint64_t v147;
  uint64_t v148;
  unint64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char v170;
  char v171;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  unint64_t v182;
  unint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  char v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  uint64_t v195;
  unint64_t v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  int v200;
  char *v201;
  char *v202;
  unint64_t v203;
  Swift::String *v204;
  uint64_t v205;
  uint64_t v206;
  char *v207;
  uint64_t (*v208)(uint64_t);
  char *v209;
  uint64_t v210;
  uint64_t v211;
  int64_t v212;
  unint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  int64_t *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  __int128 v229;
  unint64_t v230;
  _QWORD *v231;
  char *v232;
  int *v233;
  char *v234;
  uint64_t v235;
  unint64_t v236;
  unint64_t v237;
  unint64_t v238;
  uint64_t v239;
  uint64_t *v240;
  char *v241;
  unint64_t *v242;
  _QWORD v243[2];
  uint64_t v244;
  unint64_t v245;
  Swift::String v246;
  _QWORD *v247;

  v2 = v1;
  v206 = a1;
  v3 = sub_100146438(&qword_1002B4168);
  __chkstk_darwin(v3);
  v5 = (char *)&v201 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100146438(&qword_1002B7D70);
  v7 = __chkstk_darwin(v6);
  v9 = (unint64_t)&v201 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v201 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (uint64_t (*)(uint64_t))((char *)&v201 - v14);
  v16 = __chkstk_darwin(v13);
  v213 = (unint64_t)&v201 - v17;
  __chkstk_darwin(v16);
  v214 = (uint64_t)&v201 - v18;
  v220 = sub_100146438(&qword_1002B7D78);
  v219 = *(_QWORD *)(v220 - 8);
  __chkstk_darwin(v220);
  v209 = (char *)&v201 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100146438(&qword_1002B7D80);
  v21 = __chkstk_darwin(v20);
  v218 = (int64_t *)((char *)&v201 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v21);
  v217 = (unint64_t)&v201 - v23;
  v24 = sub_100146438(&qword_1002B6740);
  v203 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v204 = (Swift::String *)((char *)&v201 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = type metadata accessor for Date(0);
  v237 = *(_QWORD *)(v26 - 8);
  v27 = __chkstk_darwin(v26);
  v202 = (char *)&v201 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v234 = (char *)&v201 - v29;
  v233 = (int *)type metadata accessor for Metric(0);
  v205 = *((_QWORD *)v233 - 1);
  __chkstk_darwin(v233);
  v239 = (uint64_t)&v201 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = type metadata accessor for DashboardViewModelObject(0);
  v32 = *(unint64_t **)(v31 - 8);
  v33 = __chkstk_darwin(v31);
  v216 = (uint64_t)&v201 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __chkstk_darwin(v33);
  v215 = (uint64_t)&v201 - v36;
  v37 = __chkstk_darwin(v35);
  v240 = (uint64_t *)((char *)&v201 - v38);
  v39 = __chkstk_darwin(v37);
  v44 = (unint64_t)&v201 - v43;
  if (qword_1002B3A00 != -1)
    goto LABEL_144;
  while (2)
  {
    v45 = qword_1002BEFF0;
    v46 = static os_log_type_t.default.getter(v39, v40, v41, v42);
    result = os_log(_:dso:log:type:_:)("DashboardViewModel -  updateDashboardDataSource()", 49, 2, &_mh_execute_header, v45, v46, _swiftEmptyArrayStorage);
    if ((*(_BYTE *)(v2 + 40) & 1) != 0)
      return result;
    v207 = v5;
    v236 = v9;
    v48 = v206;
    v49 = *(_QWORD *)(v206 + 16);
    v50 = _swiftEmptyArrayStorage;
    v235 = v2;
    v241 = (char *)v31;
    v242 = v32;
    v201 = v12;
    v12 = (char *)v49;
    v208 = v15;
    v212 = v26;
    v238 = v49;
    if (v49)
    {
      v247 = _swiftEmptyArrayStorage;
      sub_100195B70(0, v49, 0);
      v51 = 0;
      v211 = v48 + ((*(unsigned __int8 *)(v205 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v205 + 80));
      v210 = *(_QWORD *)(v205 + 72);
      while (1)
      {
        v232 = v51;
        v52 = v239;
        sub_10017417C(v211 + v210 * (_QWORD)v51, v239, type metadata accessor for Metric);
        v53 = v233;
        v54 = (_QWORD *)static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(v52 + v233[5]));
        v230 = v55;
        v231 = v54;
        *(_QWORD *)&v229 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(v52 + v53[12]));
        v228 = v56;
        v227 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(v52 + v53[6]));
        v226 = v57;
        v221 = *(_QWORD *)(v52 + v53[8]);
        v225 = static String._unconditionallyBridgeFromObjectiveC(_:)(v221);
        v224 = v58;
        v223 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(v52 + v53[7]));
        v222 = v59;
        v60 = String.init(_:)(*(id *)(v52 + v53[9]));
        countAndFlagsBits = v60._countAndFlagsBits;
        object = v60._object;
        if (qword_1002B39C8 != -1)
          swift_once(&qword_1002B39C8, sub_10016A90C);
        v63 = qword_1002BEFC0;
        v64 = *(_QWORD *)(qword_1002BEFC0 + 16);
        if (v64)
        {
          swift_bridgeObjectRetain(qword_1002BEFC0);
          v65 = sub_10014654C();
          v66 = (unint64_t *)(v63 + 40);
          while (1)
          {
            v68 = *(v66 - 1);
            v67 = *v66;
            v246 = v60;
            v244 = v68;
            v245 = v67;
            swift_bridgeObjectRetain(v67);
            if ((StringProtocol.contains<A>(_:)(&v244, &type metadata for String, &type metadata for String, v65, v65) & 1) != 0)
              break;
            v66 += 2;
            swift_bridgeObjectRelease(v67);
            if (!--v64)
            {
              swift_bridgeObjectRelease(v63);
              v26 = v212;
              goto LABEL_13;
            }
          }
          swift_bridgeObjectRelease(v63);
          v246 = v60;
          v244 = v68;
          v245 = v67;
          v243[0] = 0;
          v243[1] = 0xE000000000000000;
          countAndFlagsBits = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)(&v244, v243, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v65, v65, v65);
          v70 = v69;
          swift_bridgeObjectRelease(v60._object);
          swift_bridgeObjectRelease(v67);
          object = v70;
          v26 = v212;
        }
LABEL_13:
        v71 = *(_DWORD *)(v239 + v233[13]);
        (*(void (**)(char *, uint64_t, int64_t))(v237 + 16))(v234, v239 + v233[11], v26);
        v72 = static String._unconditionallyBridgeFromObjectiveC(_:)(v221);
        v74 = v73;
        v246._countAndFlagsBits = v72;
        v246._object = v73;
        v244 = 0x2D6E6F6974636573;
        v245 = 0xE800000000000000;
        v75 = sub_10014654C();
        if ((StringProtocol.contains<A>(_:)(&v244, &type metadata for String, &type metadata for String, v75, v75) & 1) == 0)
          break;
        v246._countAndFlagsBits = v72;
        v246._object = v74;
        v244 = 45;
        v245 = 0xE100000000000000;
        v76 = (_QWORD *)StringProtocol.components<A>(separatedBy:)(&v244, &type metadata for String, &type metadata for String, v75, v75);
        v77 = v76;
        if (!v76[2])
        {
          swift_bridgeObjectRelease(v74);
          v80 = v77;
          goto LABEL_18;
        }
        v79 = v76[4];
        v78 = v76[5];
        swift_bridgeObjectRetain(v78);
        swift_bridgeObjectRelease(v74);
        swift_bridgeObjectRelease(v77);
LABEL_19:
        v81 = v230;
        v82 = v229;
        v83 = v228;
        v84 = v227;
        v85 = v226;
        v86 = v225;
        v87 = v224;
        v88 = v223;
        v89 = v222;
        *(_QWORD *)v44 = v231;
        *(_QWORD *)(v44 + 8) = v81;
        *(_QWORD *)(v44 + 16) = v82;
        *(_QWORD *)(v44 + 24) = v83;
        *(_QWORD *)(v44 + 32) = v84;
        *(_QWORD *)(v44 + 40) = v85;
        *(_QWORD *)(v44 + 48) = v86;
        *(_QWORD *)(v44 + 56) = v87;
        *(_QWORD *)(v44 + 64) = v88;
        *(_QWORD *)(v44 + 72) = v89;
        *(_QWORD *)(v44 + 80) = countAndFlagsBits;
        *(_QWORD *)(v44 + 88) = object;
        *(_DWORD *)(v44 + 96) = v71;
        v90 = v241;
        (*(void (**)(unint64_t, char *, int64_t))(v237 + 32))(v44 + *((int *)v241 + 11), v234, v26);
        v91 = (_QWORD *)(v44 + *((int *)v90 + 12));
        *v91 = v79;
        v91[1] = v78;
        sub_1001B565C(v239, type metadata accessor for Metric);
        v50 = v247;
        if ((swift_isUniquelyReferenced_nonNull_native(v247) & 1) == 0)
        {
          sub_100195B70(0, v50[2] + 1, 1);
          v50 = v247;
        }
        v2 = v235;
        v32 = v242;
        v12 = (char *)v238;
        v92 = v232;
        v94 = v50[2];
        v93 = v50[3];
        if (v94 >= v93 >> 1)
        {
          sub_100195B70(v93 > 1, v94 + 1, 1);
          v50 = v247;
        }
        v51 = v92 + 1;
        v50[2] = v94 + 1;
        sub_1001B5618(v44, (uint64_t)v50+ ((*((unsigned __int8 *)v32 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v32 + 80))+ v32[9] * v94, type metadata accessor for DashboardViewModelObject);
        if (v51 == v12)
          goto LABEL_24;
      }
      v80 = v74;
LABEL_18:
      swift_bridgeObjectRelease(v80);
      v79 = 0;
      v78 = 0;
      goto LABEL_19;
    }
LABEL_24:
    v95 = type metadata accessor for DashboardViewModel();
    v97 = sub_1001998B4(&qword_1002B7D68, v96, (uint64_t (*)(uint64_t))type metadata accessor for DashboardViewModel, (uint64_t)&unk_100244860);
    v239 = v95;
    v234 = (char *)v97;
    v9 = ObservableObject<>.objectWillChange.getter(v95, v97);
    ObservableObjectPublisher.send()();
    swift_release(v9);
    v98 = *(_QWORD *)(v2 + 56);
    *(_QWORD *)(v2 + 56) = v50;
    swift_bridgeObjectRelease(v98);
    v99 = _swiftEmptyArrayStorage;
    v100 = v206;
    v101 = v204;
    if (v12)
    {
      v246._countAndFlagsBits = (uint64_t)_swiftEmptyArrayStorage;
      sub_100195B44(0, (int64_t)v12, 0);
      v99 = (_QWORD *)v246._countAndFlagsBits;
      v12 = (char *)(v100
                   + ((*(unsigned __int8 *)(v205 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v205 + 80)));
      v102 = *(_QWORD *)(v205 + 72);
      v9 = v203;
      do
      {
        sub_1001D3D9C((uint64_t)v12, v101);
        v246._countAndFlagsBits = (uint64_t)v99;
        v44 = v99[2];
        v103 = v99[3];
        if (v44 >= v103 >> 1)
        {
          sub_100195B44(v103 > 1, v44 + 1, 1);
          v9 = v203;
          v99 = (_QWORD *)v246._countAndFlagsBits;
        }
        v99[2] = v44 + 1;
        sub_10014BC64((uint64_t)v101, (uint64_t)v99+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v44, &qword_1002B6740);
        v12 += v102;
        --v238;
      }
      while (v238);
      v32 = v242;
      v104 = v99[2];
      if (v104)
        goto LABEL_30;
LABEL_32:
      v105 = &_swiftEmptyDictionarySingleton;
      goto LABEL_33;
    }
    v104 = _swiftEmptyArrayStorage[2];
    if (!v104)
      goto LABEL_32;
LABEL_30:
    v9 = sub_100146438(&qword_1002B7800);
    v105 = (void *)static _DictionaryStorage.allocate(capacity:)(v104);
LABEL_33:
    v246._countAndFlagsBits = (uint64_t)v105;
    v106 = swift_bridgeObjectRetain(v99);
    sub_1001D6080(v106, 1, &v246);
    swift_bridgeObjectRelease(v99);
    v5 = (char *)v246._countAndFlagsBits;
    v107 = *(_QWORD *)(v2 + 56);
    v31 = *(_QWORD *)(v107 + 16);
    v232 = (char *)v107;
    swift_bridgeObjectRetain(v107);
    v26 = 0;
    v15 = type metadata accessor for DashboardViewModelObject;
    v229 = xmmword_1002402A0;
    v231 = _swiftEmptyArrayStorage;
    v233 = (int *)v31;
    while (1)
    {
      if (v26 == v31)
      {
        v108 = 1;
        v26 = v31;
        v109 = v220;
        v110 = (uint64_t)v218;
      }
      else
      {
        if ((unint64_t)v26 >= *((_QWORD *)v232 + 2))
          goto LABEL_143;
        v109 = v220;
        v111 = (uint64_t)&v209[*(int *)(v220 + 48)];
        sub_10017417C((uint64_t)&v232[((*((unsigned __int8 *)v32 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v32 + 80))+ v32[9] * v26], v111, type metadata accessor for DashboardViewModelObject);
        v110 = (uint64_t)v218;
        v112 = (uint64_t)v218 + *(int *)(v109 + 48);
        *v218 = v26;
        sub_1001B5618(v111, v112, type metadata accessor for DashboardViewModelObject);
        v108 = 0;
        ++v26;
      }
      v113 = v219;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v219 + 56))(v110, v108, 1, v109);
      v9 = v217;
      sub_10014BC64(v110, v217, &qword_1002B7D80);
      if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v113 + 48))(v9, 1, v109) == 1)
        break;
      v238 = *(_QWORD *)v9;
      v114 = v9 + *(int *)(v109 + 48);
      v115 = v240;
      sub_1001B5618(v114, (uint64_t)v240, type metadata accessor for DashboardViewModelObject);
      v116 = (void *)v115[5];
      v246._countAndFlagsBits = v115[4];
      v246._object = v116;
      swift_bridgeObjectRetain(v116);
      v117 = String.init<A>(_:)(&v246, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
      v119 = v118;
      v120 = (void *)v115[9];
      v246._countAndFlagsBits = v115[8];
      v246._object = v120;
      swift_bridgeObjectRetain(v120);
      v121 = String.init<A>(_:)(&v246, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
      v123 = v122;
      v246._countAndFlagsBits = v117;
      v246._object = v119;
      swift_bridgeObjectRetain(v119);
      v124._countAndFlagsBits = v121;
      v124._object = v123;
      String.append(_:)(v124);
      swift_bridgeObjectRelease(v119);
      swift_bridgeObjectRelease(v123);
      v125 = v246._object;
      if (!*((_QWORD *)v5 + 2))
      {
        v44 = v214;
        ((void (*)(uint64_t, uint64_t, uint64_t, char *))v242[7])(v214, 1, 1, v241);
        goto LABEL_63;
      }
      v126 = v246._countAndFlagsBits;
      swift_bridgeObjectRetain(v246._object);
      v127 = sub_1001C7C98(v126, (uint64_t)v125);
      v12 = v241;
      v128 = v242;
      if ((v129 & 1) != 0)
      {
        v44 = v214;
        sub_10017417C(*((_QWORD *)v5 + 7) + v242[9] * v127, v214, type metadata accessor for DashboardViewModelObject);
        v130 = (void (*)(unint64_t, uint64_t, uint64_t, char *))v128[7];
        v130(v44, 0, 1, v12);
      }
      else
      {
        v130 = (void (*)(unint64_t, uint64_t, uint64_t, char *))v242[7];
        v44 = v214;
        v130(v214, 1, 1, v241);
      }
      swift_bridgeObjectRelease(v125);
      v131 = (unsigned int (*)(uint64_t, uint64_t, char *))v128[6];
      if (v131(v44, 1, v12) == 1)
      {
LABEL_63:
        swift_bridgeObjectRelease(v125);
        sub_10014BDE0(v44, &qword_1002B7D70);
        if ((swift_isUniquelyReferenced_nonNull_native(v231) & 1) == 0)
          v231 = sub_1001C793C(0, v231[2] + 1, 1, v231);
        v32 = v242;
        v31 = (unint64_t)v233;
        v12 = (char *)v238;
        v9 = v231[2];
        v145 = v231[3];
        v15 = type metadata accessor for DashboardViewModelObject;
        if (v9 >= v145 >> 1)
          v231 = sub_1001C793C((_QWORD *)(v145 > 1), v9 + 1, 1, v231);
        v146 = v231;
        v231[2] = v9 + 1;
        v146[v9 + 4] = v12;
        sub_1001B565C((uint64_t)v240, type metadata accessor for DashboardViewModelObject);
      }
      else
      {
        sub_10014BDE0(v44, &qword_1002B7D70);
        if (*((_QWORD *)v5 + 2))
        {
          swift_bridgeObjectRetain(v125);
          v132 = sub_1001C7C98(v126, (uint64_t)v125);
          v9 = v213;
          if ((v133 & 1) != 0)
          {
            sub_10017417C(*((_QWORD *)v5 + 7) + v242[9] * v132, v213, type metadata accessor for DashboardViewModelObject);
            v134 = v9;
            v135 = 0;
          }
          else
          {
            v134 = v213;
            v135 = 1;
          }
          v130(v134, v135, 1, v12);
          swift_bridgeObjectRelease(v125);
        }
        else
        {
          v9 = v213;
          v130(v213, 1, 1, v12);
        }
        if (v131(v9, 1, v12))
        {
          swift_bridgeObjectRelease(v125);
          sub_10014BDE0(v9, &qword_1002B7D70);
          v15 = type metadata accessor for DashboardViewModelObject;
          sub_1001B565C((uint64_t)v240, type metadata accessor for DashboardViewModelObject);
          v32 = v242;
          v31 = (unint64_t)v233;
        }
        else
        {
          v44 = *(_QWORD *)(v9 + 80);
          v12 = *(char **)(v9 + 88);
          swift_bridgeObjectRetain(v12);
          sub_10014BDE0(v9, &qword_1002B7D70);
          if (*((_QWORD *)v5 + 2))
          {
            swift_bridgeObjectRetain(v125);
            v136 = sub_1001C7C98(v126, (uint64_t)v125);
            v138 = (uint64_t)v208;
            if ((v137 & 1) != 0)
            {
              sub_10017417C(*((_QWORD *)v5 + 7) + v242[9] * v136, (uint64_t)v208, type metadata accessor for DashboardViewModelObject);
              v139 = v138;
              v140 = 0;
            }
            else
            {
              v139 = (uint64_t)v208;
              v140 = 1;
            }
            v141 = v241;
            v130(v139, v140, 1, v241);
            swift_bridgeObjectRelease(v125);
          }
          else
          {
            v138 = (uint64_t)v208;
            v141 = v241;
            v130((unint64_t)v208, 1, 1, v241);
          }
          if (v131(v138, 1, v141))
          {
            sub_10014BDE0(v138, &qword_1002B7D70);
            v9 = (unint64_t)v207;
            (*(void (**)(char *, uint64_t, uint64_t, int64_t))(v237 + 56))(v207, 1, 1, v212);
            v32 = v242;
            goto LABEL_61;
          }
          v230 = v44;
          v142 = v138 + *((int *)v141 + 11);
          v44 = v237;
          v9 = (unint64_t)v207;
          v143 = v212;
          (*(void (**)(char *, uint64_t, int64_t))(v237 + 16))(v207, v142, v212);
          sub_10014BDE0(v138, &qword_1002B7D70);
          (*(void (**)(unint64_t, _QWORD, uint64_t, int64_t))(v44 + 56))(v9, 0, 1, v143);
          v144 = (*(uint64_t (**)(unint64_t, uint64_t, int64_t))(v44 + 48))(v9, 1, v143);
          v32 = v242;
          if (v144 == 1)
          {
LABEL_61:
            swift_bridgeObjectRelease(v125);
            swift_bridgeObjectRelease(v12);
            v15 = type metadata accessor for DashboardViewModelObject;
            sub_1001B565C((uint64_t)v240, type metadata accessor for DashboardViewModelObject);
            sub_10014BDE0(v9, &qword_1002B4168);
            v2 = v235;
            v31 = (unint64_t)v233;
          }
          else
          {
            (*(void (**)(char *, unint64_t, int64_t))(v237 + 32))(v202, v9, v212);
            v147 = *(_QWORD *)(v235 + 56);
            v148 = swift_bridgeObjectRetain(v147);
            if ((swift_isUniquelyReferenced_nonNull_native(v148) & 1) != 0)
            {
              v149 = v238;
              if ((v238 & 0x8000000000000000) != 0)
                goto LABEL_146;
            }
            else
            {
              v147 = sub_100197FB0(v147);
              v149 = v238;
              if ((v238 & 0x8000000000000000) != 0)
                goto LABEL_146;
            }
            if (v149 >= *(_QWORD *)(v147 + 16))
              goto LABEL_147;
            v238 = (*((unsigned __int8 *)v242 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v242 + 80);
            v227 = v242[9];
            v228 = v227 * v149;
            v150 = v147 + v238 + v227 * v149;
            v151 = *(_QWORD *)(v150 + 88);
            *(_QWORD *)(v150 + 80) = v230;
            *(_QWORD *)(v150 + 88) = v12;
            swift_bridgeObjectRelease(v151);
            v2 = v235;
            v152 = ObservableObject<>.objectWillChange.getter(v239, v234);
            ObservableObjectPublisher.send()();
            swift_release(v152);
            v153 = *(_QWORD *)(v2 + 56);
            *(_QWORD *)(v2 + 56) = v147;
            swift_bridgeObjectRelease(v153);
            v154 = *(_QWORD *)(v2 + 56);
            v155 = swift_bridgeObjectRetain(v154);
            if ((swift_isUniquelyReferenced_nonNull_native(v155) & 1) == 0)
              v154 = sub_100197FB0(v154);
            v32 = v242;
            if (v149 >= *(_QWORD *)(v154 + 16))
              goto LABEL_148;
            (*(void (**)(unint64_t, char *, int64_t))(v237 + 24))(v154 + v238 + *((int *)v241 + 11) + v228, v202, v212);
            v156 = ObservableObject<>.objectWillChange.getter(v239, v234);
            ObservableObjectPublisher.send()();
            swift_release(v156);
            v157 = *(_QWORD *)(v2 + 56);
            *(_QWORD *)(v2 + 56) = v154;
            v158 = swift_bridgeObjectRelease(v157);
            if (qword_1002B3A78 != -1)
              v158 = swift_once(&qword_1002B3A78, sub_100183CA4);
            if (*(_BYTE *)(qword_1002BF068 + 26) == 1)
            {
              if (qword_1002B39F8 != -1)
                v158 = swift_once(&qword_1002B39F8, sub_100174778);
              v238 = qword_1002BEFE8;
              LODWORD(v230) = static os_log_type_t.default.getter(v158, v159, v160, v161);
              v162 = sub_100146438((uint64_t *)&unk_1002B57E0);
              v163 = swift_allocObject(v162, 72, 7);
              *(_OWORD *)(v163 + 16) = v229;
              v246._countAndFlagsBits = v126;
              v246._object = v125;
              swift_bridgeObjectRetain(v125);
              v164 = String.init<A>(_:)(&v246, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
              v166 = v165;
              *(_QWORD *)(v163 + 56) = &type metadata for String;
              *(_QWORD *)(v163 + 64) = sub_10016B1E0();
              *(_QWORD *)(v163 + 32) = v164;
              *(_QWORD *)(v163 + 40) = v166;
              os_log(_:dso:log:type:_:)("DashBoardViewModel - Updating value and timestamp for key : %{public}s ", 71, 2, &_mh_execute_header, v238, v230, v163);
              swift_bridgeObjectRelease(v163);
              v12 = v241;
              v32 = v242;
            }
            else
            {
              if (qword_1002B39F8 != -1)
                v158 = swift_once(&qword_1002B39F8, sub_100174778);
              v167 = qword_1002BEFE8;
              v168 = static os_log_type_t.default.getter(v158, v159, v160, v161);
              os_log(_:dso:log:type:_:)("DashBoardViewModel - Updating value and timestamp for key", 57, 2, &_mh_execute_header, v167, v168, _swiftEmptyArrayStorage);
              v12 = v241;
            }
            swift_bridgeObjectRetain(v5);
            v169 = sub_1001C7C98(v126, (uint64_t)v125);
            v171 = v170;
            swift_bridgeObjectRelease(v5);
            if ((v171 & 1) != 0)
            {
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
              v246._countAndFlagsBits = (uint64_t)v5;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_1001CAE38();
                v5 = (char *)v246._countAndFlagsBits;
              }
              swift_bridgeObjectRelease(*(_QWORD *)(*((_QWORD *)v5 + 6) + 16 * v169 + 8));
              v9 = (unint64_t)v201;
              v44 = (unint64_t)type metadata accessor for DashboardViewModelObject;
              sub_1001B5618(*((_QWORD *)v5 + 7) + v169 * v227, (uint64_t)v201, type metadata accessor for DashboardViewModelObject);
              sub_1001D5E84(v169, (uint64_t)v5);
              swift_bridgeObjectRelease(0x8000000000000000);
              v173 = 0;
            }
            else
            {
              v173 = 1;
              v9 = (unint64_t)v201;
              v44 = (unint64_t)type metadata accessor for DashboardViewModelObject;
            }
            v130(v9, v173, 1, v12);
            swift_bridgeObjectRelease(v125);
            sub_10014BDE0(v9, &qword_1002B7D70);
            (*(void (**)(char *, int64_t))(v237 + 8))(v202, v212);
            sub_1001B565C((uint64_t)v240, type metadata accessor for DashboardViewModelObject);
            v31 = (unint64_t)v233;
            v15 = type metadata accessor for DashboardViewModelObject;
          }
        }
      }
    }
    swift_bridgeObjectRelease(v232);
    v12 = (char *)v231[2];
    if (v12)
    {
      v32 = v231 + 4;
      while (1)
      {
        v175 = *v32++;
        v44 = v175;
        v31 = *(_QWORD *)(v2 + 56);
        v176 = swift_bridgeObjectRetain(v31);
        if ((swift_isUniquelyReferenced_nonNull_native(v176) & 1) == 0)
          v31 = sub_100197FB0(v31);
        v177 = *(_QWORD *)(v31 + 16);
        if (v44 >= v177)
          break;
        v15 = (uint64_t (*)(uint64_t))(v177 - 1);
        v26 = v242[9];
        v178 = v31
             + ((*((unsigned __int8 *)v242 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v242 + 80))
             + v26 * v44;
        sub_1001B565C(v178, type metadata accessor for DashboardViewModelObject);
        if ((uint64_t)((uint64_t)v15 - v44) < 0)
          goto LABEL_149;
        v179 = v178 + v26;
        if (v26 > 0 || v178 >= v179 + v26 * ((_QWORD)v15 - v44))
        {
          swift_arrayInitWithTakeFrontToBack(v178, v179);
        }
        else if (v26)
        {
          swift_arrayInitWithTakeBackToFront(v178, v179);
        }
        *(_QWORD *)(v31 + 16) = v15;
        v9 = ObservableObject<>.objectWillChange.getter(v239, v234);
        ObservableObjectPublisher.send()();
        swift_release(v9);
        v174 = *(_QWORD *)(v2 + 56);
        *(_QWORD *)(v2 + 56) = v31;
        swift_bridgeObjectRelease(v174);
        if (!--v12)
          goto LABEL_103;
      }
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      v39 = swift_once(&qword_1002B3A00, sub_100174798);
      continue;
    }
    break;
  }
LABEL_103:
  swift_bridgeObjectRelease(v231);
  v32 = (unint64_t *)(v5 + 64);
  v180 = 1 << v5[32];
  v181 = -1;
  if (v180 < 64)
    v181 = ~(-1 << v180);
  v26 = v181 & *((_QWORD *)v5 + 8);
  v240 = (uint64_t *)((unint64_t)(v180 + 63) >> 6);
  swift_bridgeObjectRetain(v5);
  v44 = 0;
  v31 = (unint64_t)type metadata accessor for DashboardViewModelObject;
  while (2)
  {
    v9 = v236;
    v12 = v241;
    if (!v26)
      goto LABEL_110;
LABEL_107:
    v182 = __clz(__rbit64(v26));
    v26 &= v26 - 1;
    v183 = v182 | (v44 << 6);
    if (*((_QWORD *)v5 + 2))
    {
LABEL_108:
      v184 = (uint64_t *)(*((_QWORD *)v5 + 6) + 16 * v183);
      v186 = *v184;
      v185 = v184[1];
      swift_bridgeObjectRetain(v185);
      v187 = sub_1001C7C98(v186, v185);
      if ((v188 & 1) != 0)
      {
        v15 = (uint64_t (*)(uint64_t))v242;
        v9 = v236;
        sub_10017417C(*((_QWORD *)v5 + 7) + v242[9] * v187, v236, type metadata accessor for DashboardViewModelObject);
        v189 = 0;
      }
      else
      {
        v189 = 1;
        v9 = v236;
        v15 = (uint64_t (*)(uint64_t))v242;
      }
      v12 = v241;
      (*((void (**)(unint64_t, uint64_t, uint64_t, char *))v15 + 7))(v9, v189, 1, v241);
      swift_bridgeObjectRelease(v185);
      if ((*((unsigned int (**)(unint64_t, uint64_t, char *))v15 + 6))(v9, 1, v12) != 1)
      {
        v193 = v215;
        sub_1001B5618(v9, v215, type metadata accessor for DashboardViewModelObject);
        sub_10017417C(v193, v216, type metadata accessor for DashboardViewModelObject);
        v194 = *(_QWORD *)(v2 + 56);
        v195 = swift_bridgeObjectRetain(v194);
        if ((swift_isUniquelyReferenced_nonNull_native(v195) & 1) == 0)
          v194 = sub_1001C7928(0, *(_QWORD *)(v194 + 16) + 1, 1, v194);
        v197 = *(_QWORD *)(v194 + 16);
        v196 = *(_QWORD *)(v194 + 24);
        if (v197 >= v196 >> 1)
          v194 = sub_1001C7928(v196 > 1, v197 + 1, 1, v194);
        *(_QWORD *)(v194 + 16) = v197 + 1;
        sub_1001B5618(v216, v194+ ((*((unsigned __int8 *)v242 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v242 + 80))+ v242[9] * v197, type metadata accessor for DashboardViewModelObject);
        v2 = v235;
        v198 = ObservableObject<>.objectWillChange.getter(v239, v234);
        ObservableObjectPublisher.send()();
        swift_release(v198);
        v199 = *(_QWORD *)(v2 + 56);
        *(_QWORD *)(v2 + 56) = v194;
        swift_bridgeObjectRelease(v199);
        sub_1001B565C(v215, type metadata accessor for DashboardViewModelObject);
        continue;
      }
      goto LABEL_132;
    }
    break;
  }
  while (2)
  {
    ((void (*)(unint64_t, uint64_t, uint64_t, char *))v242[7])(v9, 1, 1, v12);
LABEL_132:
    sub_10014BDE0(v9, &qword_1002B7D70);
    if (v26)
      goto LABEL_107;
LABEL_110:
    v190 = v44 + 1;
    if (__OFADD__(v44, 1))
      goto LABEL_142;
    if (v190 >= (uint64_t)v240)
      goto LABEL_139;
    v191 = v32[v190];
    ++v44;
    if (v191)
      goto LABEL_130;
    v44 = v190 + 1;
    if (v190 + 1 >= (uint64_t)v240)
      goto LABEL_139;
    v191 = v32[v44];
    if (v191)
      goto LABEL_130;
    v44 = v190 + 2;
    if (v190 + 2 >= (uint64_t)v240)
      goto LABEL_139;
    v191 = v32[v44];
    if (v191)
      goto LABEL_130;
    v44 = v190 + 3;
    if (v190 + 3 >= (uint64_t)v240)
      goto LABEL_139;
    v191 = v32[v44];
    if (v191)
      goto LABEL_130;
    v44 = v190 + 4;
    if (v190 + 4 >= (uint64_t)v240)
      goto LABEL_139;
    v191 = v32[v44];
    if (v191)
    {
LABEL_130:
      v26 = (v191 - 1) & v191;
      v183 = __clz(__rbit64(v191)) + (v44 << 6);
      if (*((_QWORD *)v5 + 2))
        goto LABEL_108;
      continue;
    }
    break;
  }
  v192 = v190 + 5;
  if (v192 >= (uint64_t)v240)
  {
LABEL_139:
    swift_release(v5);
    sub_1001D4B98(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 16), 0);
    return swift_bridgeObjectRelease(v5);
  }
  v191 = v32[v192];
  if (v191)
  {
    v44 = v192;
    goto LABEL_130;
  }
  while (1)
  {
    v44 = v192 + 1;
    if (__OFADD__(v192, 1))
      break;
    if ((uint64_t)v44 >= (uint64_t)v240)
      goto LABEL_139;
    v191 = v32[v44];
    ++v192;
    if (v191)
      goto LABEL_130;
  }
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  LOBYTE(v200) = 2;
  _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v200, 1046, 0);
  __break(1u);
  result = swift_unexpectedError(v5, "Swift/Dictionary.swift", 22, 1, 489);
  __break(1u);
  return result;
}

uint64_t sub_1001D3D9C@<X0>(uint64_t a1@<X0>, Swift::String *a2@<X8>)
{
  int *v4;
  id v5;
  Swift::String v6;
  id v7;
  Swift::String v8;
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
  Swift::String v21;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char *v32;
  int v33;
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
  uint64_t result;
  uint64_t *v45;
  uint64_t v46;
  Swift::String *v47;
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
  int *v58;
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  Swift::String v62;
  uint64_t v63;

  v4 = (int *)type metadata accessor for Metric(0);
  v5 = *(id *)(a1 + v4[6]);
  v6 = String.init(_:)(v5);
  v7 = *(id *)(a1 + v4[7]);
  v8 = String.init(_:)(v7);
  v62 = v6;
  swift_bridgeObjectRetain(v6._object);
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v6._object);
  swift_bridgeObjectRelease(v8._object);
  *a2 = v6;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(a1 + v4[5]));
  v56 = v10;
  v57 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(a1 + v4[12]));
  v54 = v12;
  v55 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v52 = v14;
  v53 = v13;
  v15 = *(_QWORD *)(a1 + v4[8]);
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v50 = v17;
  v51 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v48 = v19;
  v49 = v18;
  v58 = v4;
  v20 = v4[9];
  v63 = a1;
  v21 = String.init(_:)(*(id *)(a1 + v20));
  countAndFlagsBits = v21._countAndFlagsBits;
  object = v21._object;
  if (qword_1002B39C8 != -1)
    swift_once(&qword_1002B39C8, sub_10016A90C);
  v24 = qword_1002BEFC0;
  v25 = *(_QWORD *)(qword_1002BEFC0 + 16);
  if (v25)
  {
    v46 = v15;
    v47 = a2;
    swift_bridgeObjectRetain(qword_1002BEFC0);
    v26 = sub_10014654C();
    v27 = (uint64_t *)(v24 + 40);
    while (1)
    {
      v28 = *(v27 - 1);
      v29 = *v27;
      v62 = v21;
      v60 = v28;
      v61 = v29;
      swift_bridgeObjectRetain(v29);
      if ((StringProtocol.contains<A>(_:)(&v60, &type metadata for String, &type metadata for String, v26, v26) & 1) != 0)
        break;
      v27 += 2;
      swift_bridgeObjectRelease(v29);
      if (!--v25)
      {
        swift_bridgeObjectRelease(v24);
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease(v24);
    v62 = v21;
    v60 = v28;
    v61 = v29;
    v59[0] = 0;
    v59[1] = 0xE000000000000000;
    countAndFlagsBits = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)(&v60, v59, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v26, v26, v26);
    v31 = v30;
    swift_bridgeObjectRelease(v21._object);
    swift_bridgeObjectRelease(v29);
    object = v31;
LABEL_9:
    a2 = v47;
    v15 = v46;
  }
  v32 = (char *)a2 + *(int *)(sub_100146438(&qword_1002B6740) + 48);
  v33 = *(_DWORD *)(v63 + v58[13]);
  v34 = v63 + v58[11];
  v35 = type metadata accessor for DashboardViewModelObject(0);
  v36 = &v32[*(int *)(v35 + 44)];
  v37 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v36, v34, v37);
  v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v40 = v39;
  v41 = sub_100175C64(v38, v39);
  v43 = v42;
  result = swift_bridgeObjectRelease(v40);
  *(_QWORD *)v32 = v57;
  *((_QWORD *)v32 + 1) = v56;
  *((_QWORD *)v32 + 2) = v55;
  *((_QWORD *)v32 + 3) = v54;
  *((_QWORD *)v32 + 4) = v53;
  *((_QWORD *)v32 + 5) = v52;
  *((_QWORD *)v32 + 6) = v51;
  *((_QWORD *)v32 + 7) = v50;
  *((_QWORD *)v32 + 8) = v49;
  *((_QWORD *)v32 + 9) = v48;
  *((_QWORD *)v32 + 10) = countAndFlagsBits;
  *((_QWORD *)v32 + 11) = object;
  *((_DWORD *)v32 + 24) = v33;
  v45 = (uint64_t *)&v32[*(int *)(v35 + 48)];
  *v45 = v41;
  v45[1] = v43;
  return result;
}

uint64_t sub_1001D40BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if ((*(_BYTE *)(v4 + 40) & 1) == 0)
  {
    if (qword_1002B3A00 != -1)
      result = swift_once(&qword_1002B3A00, sub_100174798);
    v5 = qword_1002BEFF0;
    v6 = static os_log_type_t.default.getter(result, a2, a3, a4);
    os_log(_:dso:log:type:_:)("reload", 6, 2, &_mh_execute_header, v5, v6, _swiftEmptyArrayStorage);
    v7 = swift_allocObject(&unk_100267550, 24, 7);
    swift_weakInit(v7 + 16, v4);
    v8 = qword_1002BEFF0;
    v9 = swift_retain_n(v7, 2);
    v13 = static os_log_type_t.default.getter(v9, v10, v11, v12);
    os_log(_:dso:log:type:_:)("DashboardViewModel -  loadDashboardData() ", 42, 2, &_mh_execute_header, v8, v13, _swiftEmptyArrayStorage);
    v14 = *(char **)(v4 + 16);
    v15 = swift_allocObject(&unk_100267550, 24, 7);
    swift_weakInit(v15 + 16, v4);
    v16 = (_QWORD *)swift_allocObject(&unk_1002675C8, 40, 7);
    v16[2] = sub_1001D55F4;
    v16[3] = v7;
    v16[4] = v15;
    v17 = *(_QWORD *)&v14[OBJC_IVAR____TtC13FTMInternal_416PersistanceStore_hardwareManager];
    if ((*(_BYTE *)(v17 + 152) & 1) != 0)
    {
      v18 = qword_1002BEFF0;
      swift_retain_n(v7, 2);
      swift_retain_n(v15, 2);
      v19 = v14;
      v23 = static os_log_type_t.default.getter(v19, v20, v21, v22);
      os_log(_:dso:log:type:_:)("DashboardViewModel -  loadDashboardData - dashboardList.isempty", 63, 2, &_mh_execute_header, v18, v23, _swiftEmptyArrayStorage);
      sub_1001D44A0(0, 0, v7);
      swift_release(v7);
      v24 = v16;
    }
    else
    {
      v25 = *(_DWORD *)(v17 + 148);
      swift_retain_n(v7, 2);
      swift_retain_n(v15, 2);
      v26 = v14;
      v30 = sub_1001BC480((uint64_t)v26, v27, v28, v29);
      v31 = swift_allocObject(&unk_1002675F0, 32, 7);
      *(_QWORD *)(v31 + 16) = sub_1001D5628;
      *(_QWORD *)(v31 + 24) = v16;
      swift_retain(v16);
      sub_1001BF39C(v25, (uint64_t)sub_10014C774, v31);
      swift_release(v7);
      swift_release(v16);
      swift_release(v30);
      v24 = (_QWORD *)v31;
    }
    swift_release(v24);
    swift_release_n(v7, 3);

    return swift_release_n(v15, 2);
  }
  return result;
}

uint64_t type metadata accessor for DashboardViewModel()
{
  return objc_opt_self(_TtC13FTMInternal_418DashboardViewModel);
}

void sub_1001D44A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t Strong;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ObjectType;
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
  _QWORD v45[3];
  _BYTE v46[8];
  _QWORD v47[3];
  _BYTE v48[24];

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v13 = (char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a3 + 16;
  if (a1)
  {
    if (qword_1002B3A00 != -1)
      v8 = swift_once(&qword_1002B3A00, sub_100174798);
    v15 = qword_1002BEFF0;
    v16 = static os_log_type_t.default.getter(v8, v9, v10, v11);
    os_log(_:dso:log:type:_:)("dashboardVM - reload - updating dashboard data source", 53, 2, &_mh_execute_header, v15, v16, _swiftEmptyArrayStorage);
    swift_beginAccess(v14, v48, 0, 0);
    Strong = swift_weakLoadStrong(v14);
    if (Strong)
    {
      v18 = Strong;
      sub_1001D2444(a1);
      swift_release(v18);
    }
    Date.init()(Strong);
    v19 = sub_100174A34();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    swift_beginAccess(v14, v47, 0, 0);
    v22 = swift_weakLoadStrong(v14);
    if (!v22
      || (v23 = v22,
          v24 = swift_unknownObjectWeakLoadStrong(v22 + 24),
          v25 = *(_QWORD *)(v23 + 32),
          swift_release(v23),
          !v24))
    {
      swift_bridgeObjectRelease(v21);
      return;
    }
    ObjectType = swift_getObjectType(v24);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 16))(v19, v21, ObjectType, v25);
    swift_bridgeObjectRelease(v21);
    v27 = v24;
    goto LABEL_20;
  }
  swift_beginAccess(v14, v48, 0, 0);
  v28 = swift_weakLoadStrong(v14);
  if (v28)
  {
    v29 = v28;
    sub_1001D2444((uint64_t)_swiftEmptyArrayStorage);
    swift_release(v29);
  }
  if (qword_1002B3A00 != -1)
    v28 = swift_once(&qword_1002B3A00, sub_100174798);
  v30 = qword_1002BEFF0;
  v31 = static os_log_type_t.error.getter(v28);
  v32 = sub_100146438((uint64_t *)&unk_1002B57E0);
  v33 = swift_allocObject(v32, 72, 7);
  *(_OWORD *)(v33 + 16) = xmmword_1002402A0;
  if (a2)
  {
    swift_getErrorValue(a2, v46, v45);
    v34 = Error.localizedDescription.getter(v45[1], v45[2]);
  }
  else
  {
    v34 = 0;
    v35 = 0;
  }
  v47[0] = v34;
  v47[1] = v35;
  v36 = sub_100146438((uint64_t *)&unk_1002B5640);
  v37 = String.init<A>(describing:)(v47, v36);
  v39 = v38;
  *(_QWORD *)(v33 + 56) = &type metadata for String;
  *(_QWORD *)(v33 + 64) = sub_10016B1E0();
  *(_QWORD *)(v33 + 32) = v37;
  *(_QWORD *)(v33 + 40) = v39;
  os_log(_:dso:log:type:_:)("error  ---> %{public}s", 22, 2, &_mh_execute_header, v30, v31, v33);
  swift_bridgeObjectRelease(v33);
  swift_beginAccess(v14, v47, 0, 0);
  v40 = swift_weakLoadStrong(v14);
  if (v40)
  {
    v41 = v40;
    v42 = swift_unknownObjectWeakLoadStrong(v40 + 24);
    v43 = *(_QWORD *)(v41 + 32);
    swift_release(v41);
    if (v42)
    {
      v44 = swift_getObjectType(v42);
      (*(void (**)(uint64_t, uint64_t))(v43 + 32))(v44, v43);
      v27 = v42;
LABEL_20:
      swift_unknownObjectRelease(v27);
    }
  }
}

double sub_1001D47E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSString v8;
  NSString v9;
  NSString v10;
  NSString v11;
  int v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double result;
  _QWORD v24[4];
  int v25;

  v4 = v3;
  *(_BYTE *)(v4 + 40) = 1;
  v8 = String._bridgeToObjectiveC()();
  v9 = String._bridgeToObjectiveC()();
  v10 = String._bridgeToObjectiveC()();
  v11 = String._bridgeToObjectiveC()();
  v12 = *(_DWORD *)(a1 + 96);
  v24[0] = v8;
  v24[1] = v9;
  v24[2] = v10;
  v24[3] = v11;
  v25 = v12;
  v13 = *(void **)(v4 + 16);
  v14 = swift_allocObject(&unk_100267550, 24, 7);
  swift_weakInit(v14 + 16, v4);
  v15 = (_QWORD *)swift_allocObject(&unk_100267578, 40, 7);
  v15[2] = v14;
  v15[3] = a2;
  v15[4] = a3;
  v16 = v13;
  swift_retain(v14);
  v17 = swift_retain(a3);
  v21 = sub_1001BC480(v17, v18, v19, v20);
  v22 = swift_allocObject(&unk_1002675A0, 32, 7);
  *(_QWORD *)(v22 + 16) = sub_1001D55E8;
  *(_QWORD *)(v22 + 24) = v15;
  swift_retain(v15);
  sub_1001BF5E4((uint64_t)v24, (uint64_t)sub_100193C54, v22);

  swift_release(v14);
  swift_release(v15);
  swift_release(v21);
  *(_QWORD *)&result = swift_release(v22).n128_u64[0];
  return result;
}

void sub_1001D4960(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, __n128))
{
  uint64_t v5;
  id v6;
  uint64_t Strong;
  __n128 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __n128 v20;
  _QWORD v21[3];
  _BYTE v22[8];
  _QWORD v23[3];

  v5 = a3 + 16;
  if ((a1 & 1) != 0)
  {
    v6 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_1002B3A58 != -1)
      swift_once(&qword_1002B3A58, sub_100175354);
    objc_msgSend(v6, "postNotificationName:object:userInfo:", static NSNotificationName.dashboardMetricUpdate, 0, 0);
    swift_beginAccess(v5, v23, 0, 0);
    Strong = swift_weakLoadStrong(v5);
    if (Strong)
    {
      *(_BYTE *)(Strong + 40) = 0;
      v8 = swift_release(Strong);
    }
    a4(1, 0, v8);

  }
  else
  {
    if (qword_1002B3A00 != -1)
      a1 = swift_once(&qword_1002B3A00, sub_100174798);
    v10 = qword_1002BEFF0;
    v11 = static os_log_type_t.error.getter(a1);
    v12 = sub_100146438((uint64_t *)&unk_1002B57E0);
    v13 = swift_allocObject(v12, 72, 7);
    *(_OWORD *)(v13 + 16) = xmmword_1002402A0;
    if (a2)
    {
      swift_getErrorValue(a2, v22, v21);
      v14 = Error.localizedDescription.getter(v21[1], v21[2]);
    }
    else
    {
      v14 = 0;
      v15 = 0xE000000000000000;
    }
    v23[0] = v14;
    v23[1] = v15;
    v16 = String.init<A>(_:)(v23, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
    v18 = v17;
    *(_QWORD *)(v13 + 56) = &type metadata for String;
    *(_QWORD *)(v13 + 64) = sub_10016B1E0();
    *(_QWORD *)(v13 + 32) = v16;
    *(_QWORD *)(v13 + 40) = v18;
    os_log(_:dso:log:type:_:)("unable to delete metric from dashboard ---> %{public}s", 54, 2, &_mh_execute_header, v10, v11, v13);
    swift_bridgeObjectRelease(v13);
    swift_beginAccess(v5, v23, 0, 0);
    v19 = swift_weakLoadStrong(v5);
    if (v19)
    {
      *(_BYTE *)(v19 + 40) = 0;
      v20 = swift_release(v19);
    }
    a4(0, a2, v20);
  }
}

void sub_1001D4B98(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
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

  v3 = v2;
  if (qword_1002B3A78 != -1)
    swift_once(&qword_1002B3A78, sub_100183CA4);
  if (*(_BYTE *)(qword_1002BF068 + 145) == 1)
  {
    v6 = type metadata accessor for DashboardViewModel();
    v8 = sub_1001998B4(&qword_1002B7D68, v7, (uint64_t (*)(uint64_t))type metadata accessor for DashboardViewModel, (uint64_t)&unk_100244860);
    v9 = ObservableObject<>.objectWillChange.getter(v6, v8);
    ObservableObjectPublisher.send()();
    swift_release(v9);
    *(_BYTE *)(v3 + 64) = 2;
  }
  else if (*(uint64_t *)(qword_1002BF068 + 160) <= 0)
  {
    v17 = type metadata accessor for DashboardViewModel();
    v19 = sub_1001998B4(&qword_1002B7D68, v18, (uint64_t (*)(uint64_t))type metadata accessor for DashboardViewModel, (uint64_t)&unk_100244860);
    v20 = ObservableObject<>.objectWillChange.getter(v17, v19);
    ObservableObjectPublisher.send()();
    swift_release(v20);
    *(_BYTE *)(v3 + 64) = 3;
  }
  else
  {
    v10 = sub_100146438(&qword_1002B5660);
    v11 = swift_allocObject(v10, 64, 7);
    v12 = v11;
    *(_OWORD *)(v11 + 16) = xmmword_1002402A0;
    *(_QWORD *)(v11 + 56) = &type metadata for String;
    *(_QWORD *)(v11 + 32) = 0xD000000000000012;
    if ((a2 & 1) != 0 || a1 < 1)
    {
      *(_QWORD *)(v11 + 40) = 0x8000000100215D10;
      print(_:separator:terminator:)(v11, 32, 0xE100000000000000, 10, 0xE100000000000000);
      swift_bridgeObjectRelease(v12);
      v21 = type metadata accessor for DashboardViewModel();
      v23 = sub_1001998B4(&qword_1002B7D68, v22, (uint64_t (*)(uint64_t))type metadata accessor for DashboardViewModel, (uint64_t)&unk_100244860);
      v24 = ObservableObject<>.objectWillChange.getter(v21, v23);
      ObservableObjectPublisher.send()();
      swift_release(v24);
      *(_BYTE *)(v3 + 64) = 0;
    }
    else
    {
      *(_QWORD *)(v11 + 40) = 0x8000000100215D30;
      print(_:separator:terminator:)(v11, 32, 0xE100000000000000, 10, 0xE100000000000000);
      swift_bridgeObjectRelease(v12);
      v13 = type metadata accessor for DashboardViewModel();
      v15 = sub_1001998B4(&qword_1002B7D68, v14, (uint64_t (*)(uint64_t))type metadata accessor for DashboardViewModel, (uint64_t)&unk_100244860);
      v16 = ObservableObject<>.objectWillChange.getter(v13, v15);
      ObservableObjectPublisher.send()();
      swift_release(v16);
      *(_BYTE *)(v3 + 64) = 1;
    }
  }
}

_QWORD *sub_1001D4DF8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
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
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v20);
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v9;
    v10 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v10;
    v11 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v11;
    v12 = a2[10];
    v13 = a2[11];
    *(_DWORD *)(a1 + 96) = *((_DWORD *)a2 + 24);
    v14 = *(int *)(a3 + 44);
    v23 = (uint64_t)a2 + v14;
    v24 = a1 + v14;
    *(_QWORD *)(a1 + 80) = v12;
    *(_QWORD *)(a1 + 88) = v13;
    v15 = type metadata accessor for Date(0);
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v13);
    v22(v24, v23, v15);
    v16 = *(int *)(a3 + 48);
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain(v19);
  }
  return v4;
}

uint64_t sub_1001D4F2C(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  v4 = (char *)a1 + *(int *)(a2 + 44);
  v5 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + *(int *)(a2 + 48) + 8));
}

uint64_t sub_1001D4FB4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  v10 = *(_QWORD *)(a2 + 80);
  v11 = *(_QWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  v12 = *(int *)(a3 + 44);
  v20 = a2 + v12;
  v21 = a1 + v12;
  *(_QWORD *)(a1 + 80) = v10;
  *(_QWORD *)(a1 + 88) = v11;
  v13 = type metadata accessor for Date(0);
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v11);
  v14(v21, v20, v13);
  v15 = *(int *)(a3 + 48);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain(v18);
  return a1;
}

uint64_t sub_1001D50B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v12 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v14 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v16 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  v18 = *(int *)(a3 + 44);
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  v22 = *(int *)(a3 + 48);
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)(a2 + v22);
  *v23 = *v24;
  v25 = v24[1];
  v26 = v23[1];
  v23[1] = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease(v26);
  return a1;
}

uint64_t sub_1001D5210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  v8 = *(_OWORD *)(a2 + 64);
  v9 = *(_OWORD *)(a2 + 80);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  v10 = *(int *)(a3 + 44);
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 80) = v9;
  v13 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)(a1 + *(int *)(a3 + 48)) = *(_OWORD *)(a2 + *(int *)(a3 + 48));
  return a1;
}

uint64_t sub_1001D52A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v14;
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 88);
  v17 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v16;
  swift_bridgeObjectRelease(v17);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  v18 = *(int *)(a3 + 44);
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
  v22 = *(int *)(a3 + 48);
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  v27 = v23[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease(v27);
  return a1;
}

uint64_t sub_1001D5388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001D5394);
}

uint64_t sub_1001D5394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t sub_1001D5410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001D541C);
}

uint64_t sub_1001D541C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 44), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for DashboardViewModelObject(uint64_t a1)
{
  uint64_t result;

  result = qword_1002B7D10;
  if (!qword_1002B7D10)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DashboardViewModelObject);
  return result;
}

uint64_t sub_1001D54CC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[9];

  v4[0] = &unk_100244820;
  v4[1] = &unk_100244820;
  v4[2] = &unk_100244820;
  v4[3] = &unk_100244820;
  v4[4] = &unk_100244820;
  v4[5] = &unk_100244820;
  v4[6] = (char *)&value witness table for Builtin.Int32 + 64;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[7] = *(_QWORD *)(result - 8) + 64;
    v4[8] = &unk_100244838;
    swift_initStructMetadata(a1, 256, 9, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_1001D5560@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for DashboardViewModel();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_1001D5598()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001D55BC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_1001D55E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1001D4960(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(uint64_t, uint64_t, __n128))(v2 + 24));
}

void sub_1001D55F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1001D44A0(a1, a2, v2);
}

uint64_t sub_1001D55FC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_1001D5628(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1001D1760(a1, a2, *(void (**)(_QWORD, _QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_1001D5634()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1001D5658()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001D567C()
{
  _QWORD *v0;

  swift_errorRelease(v0[2]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

void sub_1001D56B8()
{
  uint64_t v0;

  sub_1001D22C0(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD *, uint64_t))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_1001D56C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

double sub_1001D56D8(uint64_t a1)
{
  double result;

  *(_QWORD *)&result = swift_release(*(_QWORD *)(a1 + 40)).n128_u64[0];
  return result;
}

uint64_t sub_1001D56E0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1001D570C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1001D2128(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1001D5714()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  swift_bridgeObjectRelease(v0[8]);
  swift_release(v0[11]);
  return swift_deallocObject(v0, 96, 7);
}

unint64_t sub_1001D5758(unint64_t result, uint64_t a2)
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
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

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
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = static Hasher._hash(seed:_:)(*(_QWORD *)(a2 + 40), *v10);
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_QWORD *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for STransferMetrics(0) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6;
        v20 = v19 + v16;
        if (v17 < v18 || result >= v20)
        {
          result = swift_arrayInitWithTakeFrontToBack(result, v19);
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront(result, v19);
        }
        v3 = v6;
LABEL_6:
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

unint64_t sub_1001D5914(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  unint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _QWORD v27[9];

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
        v10 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v11 = *v10;
        v12 = v10[1];
        Hasher.init(_seed:)(v27, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v27, v11, v12);
        v13 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v12);
        v14 = v13 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v14 < v8)
            goto LABEL_5;
        }
        else if (v14 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v14)
        {
LABEL_11:
          v15 = *(_QWORD *)(a2 + 48);
          v16 = (_OWORD *)(v15 + 16 * v3);
          v17 = (_OWORD *)(v15 + 16 * v6);
          if (v3 != v6 || v16 >= v17 + 1)
            *v16 = *v17;
          v18 = *(_QWORD *)(a2 + 56);
          v19 = (_OWORD *)(v18 + 32 * v3);
          v20 = (_OWORD *)(v18 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v19 >= v20 + 2))
          {
            v9 = v20[1];
            *v19 = *v20;
            v19[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1001D5AE8(unint64_t result, uint64_t a2)
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
        sub_1001ABDE8(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
        result = sub_10017F3E8((uint64_t)v28);
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

unint64_t sub_1001D5CB0(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

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
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v26, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1001D5E84(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  _QWORD v30[9];

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
      while (1)
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v30, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v30, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v13 < v8)
          goto LABEL_11;
LABEL_12:
        v14 = *(_QWORD *)(a2 + 48);
        v15 = (_OWORD *)(v14 + 16 * v3);
        v16 = (_OWORD *)(v14 + 16 * v6);
        if (v3 != v6 || v15 >= v16 + 1)
          *v15 = *v16;
        v17 = *(_QWORD *)(a2 + 56);
        v18 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for DashboardViewModelObject(0) - 8) + 72);
        v19 = v18 * v3;
        result = v17 + v18 * v3;
        v20 = v18 * v6;
        v21 = v17 + v18 * v6;
        v22 = v21 + v18;
        if (v19 < v20 || result >= v22)
        {
          result = swift_arrayInitWithTakeFrontToBack(result, v21);
        }
        else
        {
          v3 = v6;
          if (v19 == v20)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront(result, v21);
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v13 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v13)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v24 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v25 = *v24;
    v26 = (-1 << v3) - 1;
  }
  else
  {
    v24 = (uint64_t *)(v4 + 8 * (result >> 6));
    v26 = *v24;
    v25 = (-1 << result) - 1;
  }
  *v24 = v26 & v25;
  v27 = *(_QWORD *)(a2 + 16);
  v28 = __OFSUB__(v27, 1);
  v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1001D6080(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  _QWORD *v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  char v53;
  char v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  Swift::String v59;
  Swift::String v60;
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v7 = type metadata accessor for DashboardViewModelObject(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100146438(&qword_1002B6740);
  v12 = __chkstk_darwin(v11);
  v15 = (_QWORD *)((char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = *(_QWORD *)(a1 + 16);
  if (!v16)
    return swift_bridgeObjectRelease(a1);
  v61[1] = v3;
  v62 = v16;
  v63 = a1;
  v64 = v8;
  v17 = (uint64_t)v15 + *(int *)(v12 + 48);
  v61[0] = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v18 = a1 + v61[0];
  v66 = *(_QWORD *)(v13 + 72);
  swift_bridgeObjectRetain(a1);
  sub_1001D6524(v18, (uint64_t)v15);
  v19 = v15[1];
  v70 = *v15;
  v20 = v70;
  v71 = v19;
  v65 = v17;
  v67 = v10;
  sub_1001B5618(v17, (uint64_t)v10, type metadata accessor for DashboardViewModelObject);
  v21 = (_QWORD *)*a3;
  v23 = sub_1001C7C98(v20, v19);
  v24 = v21[2];
  v25 = (v22 & 1) == 0;
  v26 = v24 + v25;
  if (__OFADD__(v24, v25))
    goto LABEL_23;
  v27 = v22;
  if (v21[3] >= v26)
  {
    if ((a2 & 1) != 0)
    {
      if ((v22 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_1001CAE38();
      if ((v27 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v35 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v23 >> 6) + 64) |= 1 << v23;
    v36 = (uint64_t *)(v35[6] + 16 * v23);
    *v36 = v20;
    v36[1] = v19;
    v37 = v35[7];
    v64 = *(_QWORD *)(v64 + 72);
    sub_1001B5618((uint64_t)v67, v37 + v64 * v23, type metadata accessor for DashboardViewModelObject);
    v38 = v35[2];
    v39 = __OFADD__(v38, 1);
    v40 = v38 + 1;
    if (v39)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v35[2] = v40;
    v41 = v62 - 1;
    if (v62 == 1)
      return swift_bridgeObjectRelease_n(v63, 2);
    v42 = v63 + v66 + v61[0];
    v43 = type metadata accessor for DashboardViewModelObject;
    while (1)
    {
      sub_1001D6524(v42, (uint64_t)v15);
      v45 = v15[1];
      v70 = *v15;
      v44 = v70;
      v71 = v45;
      v46 = v43;
      sub_1001B5618(v65, (uint64_t)v67, v43);
      v47 = (_QWORD *)*a3;
      v48 = sub_1001C7C98(v44, v45);
      v50 = v47[2];
      v51 = (v49 & 1) == 0;
      v39 = __OFADD__(v50, v51);
      v52 = v50 + v51;
      if (v39)
        break;
      v53 = v49;
      if (v47[3] < v52)
      {
        sub_1001C92C0(v52, 1);
        v48 = sub_1001C7C98(v44, v45);
        if ((v53 & 1) != (v54 & 1))
          goto LABEL_25;
      }
      if ((v53 & 1) != 0)
        goto LABEL_10;
      v55 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v48 >> 6) + 64) |= 1 << v48;
      v56 = (uint64_t *)(v55[6] + 16 * v48);
      *v56 = v44;
      v56[1] = v45;
      v43 = v46;
      sub_1001B5618((uint64_t)v67, v55[7] + v64 * v48, v46);
      v57 = v55[2];
      v39 = __OFADD__(v57, 1);
      v58 = v57 + 1;
      if (v39)
        goto LABEL_24;
      v55[2] = v58;
      v42 += v66;
      if (!--v41)
        return swift_bridgeObjectRelease_n(v63, 2);
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1001C92C0(v26, a2 & 1);
  v28 = sub_1001C7C98(v20, v19);
  if ((v27 & 1) == (v29 & 1))
  {
    v23 = v28;
    if ((v27 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v31 = swift_allocError(&type metadata for _MergeError, &protocol witness table for _MergeError, 0, 0);
    swift_willThrow(v31);
    v72 = v31;
    swift_errorRetain(v31);
    v32 = sub_100146438(&qword_1002B7D88);
    if ((swift_dynamicCast(v32, &v72, v32, &type metadata for _MergeError, 0) & 1) == 0)
    {
      v33 = v63;
      swift_bridgeObjectRelease(v63);
      sub_1001B565C((uint64_t)v67, type metadata accessor for DashboardViewModelObject);
      v34 = v71;
      swift_bridgeObjectRelease(v33);
      swift_bridgeObjectRelease(v34);
      return swift_errorRelease(v72);
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
LABEL_26:
  v68 = 0;
  v69 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v59._object = (void *)0x8000000100216010;
  v59._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v59);
  _print_unlocked<A, B>(_:_:)(&v70, &v68, &type metadata for String, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v60._countAndFlagsBits = 39;
  v60._object = (void *)0xE100000000000000;
  String.append(_:)(v60);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v68, v69, "Swift/NativeDictionary.swift", 28, 2, 783, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001D6524(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100146438(&qword_1002B6740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for FTMCellMonitorHardwareRowCellView(uint64_t *a1, uint64_t *a2)
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

double destroy for FTMCellMonitorHardwareRowCellView(_QWORD *a1)
{
  double result;

  *(_QWORD *)&result = swift_release(*a1).n128_u64[0];
  return result;
}

uint64_t *assignWithCopy for FTMCellMonitorHardwareRowCellView(uint64_t *a1, uint64_t *a2)
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

uint64_t *assignWithTake for FTMCellMonitorHardwareRowCellView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for FTMCellMonitorHardwareRowCellView(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FTMCellMonitorHardwareRowCellView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for FTMCellMonitorHardwareRowCellView()
{
  return &type metadata for FTMCellMonitorHardwareRowCellView;
}

uint64_t sub_1001D66F8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1002488AC, 1);
}

uint64_t sub_1001D6708(uint64_t *a1, uint64_t (*a2)(_QWORD *))
{
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v4 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v4 = sub_100198914(v4);
    *a1 = v4;
  }
  v6 = *(_QWORD *)(v4 + 16);
  v9[0] = v4 + 32;
  v9[1] = v6;
  v7 = a2(v9);
  return specialized ContiguousArray._endMutation()(v7);
}

uint64_t sub_1001D6784@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  Swift::String v4;
  Swift::String v5;
  void *object;
  Swift::String v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t v12;
  void *v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t v16;
  void *v17;
  Swift::String v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;

  v3 = *(_QWORD **)a1;
  v20 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v21 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  swift_bridgeObjectRetain(v21);
  v4._countAndFlagsBits = 126;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object);
  v7._countAndFlagsBits = 126;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  if (*((_BYTE *)v3 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_isVisible))
    v8 = 1702195828;
  else
    v8 = 0x65736C6166;
  if (*((_BYTE *)v3 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_isVisible))
    v9 = 0xE400000000000000;
  else
    v9 = 0xE500000000000000;
  v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease(v9);
  v11._countAndFlagsBits = 126;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  v12 = v3[6];
  v13 = (void *)v3[7];
  swift_bridgeObjectRetain(v13);
  v14._countAndFlagsBits = v12;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v13);
  v15._countAndFlagsBits = 126;
  v15._object = (void *)0xE100000000000000;
  String.append(_:)(v15);
  v16 = v3[14];
  v17 = (void *)v3[15];
  swift_bridgeObjectRetain(v17);
  v18._countAndFlagsBits = v16;
  v18._object = v17;
  String.append(_:)(v18);
  result = swift_bridgeObjectRelease(v17);
  *a2 = v20;
  a2[1] = v21;
  return result;
}

uint64_t sub_1001D68EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;

  v37 = a1;
  v38 = sub_100146438(&qword_1002B7D90);
  __chkstk_darwin(v38);
  v2 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100146438(&qword_1002B7D98);
  __chkstk_darwin(v3);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100146438(&qword_1002B3FF8);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100146438(&qword_1002B3FD8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v37 - v14;
  sub_1001D83EC();
  v17 = v16;
  if (*(_QWORD *)(v16 + 16))
  {
    *(_QWORD *)v2 = static HorizontalAlignment.center.getter(v16);
    *((_QWORD *)v2 + 1) = 0;
    v2[16] = 1;
    v18 = sub_100146438(&qword_1002B7DA0);
    sub_1001D6BEC(v17, &v2[*(int *)(v18 + 44)]);
    swift_bridgeObjectRelease(v17);
    v19 = &qword_1002B7D90;
    sub_10014BD9C((uint64_t)v2, (uint64_t)v5, &qword_1002B7D90);
    swift_storeEnumTagMultiPayload(v5, v3, 1);
    v20 = sub_100152F10();
    v21 = sub_10014BEC0(&qword_1002B7DA8, &qword_1002B7D90, (uint64_t)&protocol conformance descriptor for VStack<A>);
    _ConditionalContent<>.init(storage:)(v5, v10, v38, v20, v21);
    v22 = (uint64_t)v2;
  }
  else
  {
    v23 = swift_bridgeObjectRelease(v16);
    v24 = ProgressView<>.init<>()(v23);
    v25 = static Edge.Set.vertical.getter(v24);
    v26 = EdgeInsets.init(_all:)(150.0);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
    v33 = &v13[*(int *)(v10 + 36)];
    *v33 = v25;
    *((double *)v33 + 1) = v26;
    *((_QWORD *)v33 + 2) = v28;
    *((_QWORD *)v33 + 3) = v30;
    *((_QWORD *)v33 + 4) = v32;
    v33[40] = 0;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v19 = &qword_1002B3FD8;
    sub_10014BC64((uint64_t)v13, (uint64_t)v15, &qword_1002B3FD8);
    sub_10014BD9C((uint64_t)v15, (uint64_t)v5, &qword_1002B3FD8);
    swift_storeEnumTagMultiPayload(v5, v3, 0);
    v34 = sub_100152F10();
    v35 = sub_10014BEC0(&qword_1002B7DA8, &qword_1002B7D90, (uint64_t)&protocol conformance descriptor for VStack<A>);
    _ConditionalContent<>.init(storage:)(v5, v10, v38, v34, v35);
    v22 = (uint64_t)v15;
  }
  return sub_10014BDE0(v22, v19);
}

uint64_t sub_1001D6BEC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
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
  char *v42;
  uint64_t v43;
  char v44;
  double v45;
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
  void (*v56)(char *, char *, uint64_t);
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  _OWORD v77[9];
  _OWORD v78[2];
  _OWORD v79[11];
  char v80;
  _OWORD v81[9];
  _OWORD v82[2];
  _OWORD v83[11];
  char v84;
  _QWORD v85[2];
  _BYTE v86[177];
  _QWORD v87[2];
  _BYTE v88[177];
  _QWORD v89[2];
  char v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[2];
  char v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _OWORD v115[25];
  _OWORD v116[25];
  _QWORD v117[52];

  v71 = a2;
  v3 = type metadata accessor for Divider(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v69 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_100146438(&qword_1002B7DB0);
  v6 = __chkstk_darwin(v68);
  v74 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v72 = (uint64_t)&v64 - v8;
  v9 = sub_100146438(&qword_1002B7DB8);
  v10 = *(_QWORD *)(v9 - 8);
  v75 = v9;
  v76 = v10;
  v11 = __chkstk_darwin(v9);
  v73 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v64 - v13;
  v117[0] = a1;
  v15 = swift_allocObject(&unk_1002677F8, 24, 7);
  *(_QWORD *)(v15 + 16) = a1;
  swift_bridgeObjectRetain_n(a1, 2);
  v16 = sub_100146438(&qword_1002B7DC0);
  v17 = type metadata accessor for UUID(0);
  v18 = sub_100146438(&qword_1002B7DC8);
  v19 = sub_10014BEC0(&qword_1002B7DD0, &qword_1002B7DC0, (uint64_t)&protocol conformance descriptor for [A]);
  v20 = sub_10014BEC0(&qword_1002B7DD8, &qword_1002B7DC8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v21 = sub_1001D96E8();
  v70 = v14;
  v22 = ForEach<>.init(_:content:)(v117, sub_1001D96E0, v15, v16, v17, v18, v19, v20, v21);
  if (qword_1002B3A78 != -1)
    v22 = swift_once(&qword_1002B3A78, sub_100183CA4);
  v30 = qword_1002BF068;
  if (*(_BYTE *)(qword_1002BF068 + 24) == 1)
  {
    v66 = v3;
    v67 = v4;
    v65 = static VerticalAlignment.center.getter(v22, v23, v24, v25, v26, v27, v28, v29);
    v31 = sub_1001D7DB8(v30, (uint64_t)v77);
    *(_OWORD *)((char *)&v79[7] + 7) = v77[7];
    *(_OWORD *)((char *)&v79[8] + 7) = v77[8];
    *(_OWORD *)((char *)&v79[9] + 7) = v78[0];
    v79[10] = *(_OWORD *)((char *)v78 + 9);
    *(_OWORD *)((char *)&v79[3] + 7) = v77[3];
    *(_OWORD *)((char *)&v79[4] + 7) = v77[4];
    *(_OWORD *)((char *)&v79[5] + 7) = v77[5];
    *(_OWORD *)((char *)&v79[6] + 7) = v77[6];
    *(_OWORD *)((char *)v79 + 7) = v77[0];
    *(_OWORD *)((char *)&v79[1] + 7) = v77[1];
    v80 = 1;
    *(_OWORD *)((char *)&v79[2] + 7) = v77[2];
    v39 = static VerticalAlignment.center.getter(v31, v32, v33, v34, v35, v36, v37, v38);
    sub_1001D8100(v30, (uint64_t)v81);
    v84 = 1;
    *(_OWORD *)((char *)&v83[7] + 7) = v81[7];
    *(_OWORD *)((char *)&v83[8] + 7) = v81[8];
    *(_OWORD *)((char *)&v83[9] + 7) = v82[0];
    v83[10] = *(_OWORD *)((char *)v82 + 9);
    *(_OWORD *)((char *)&v83[3] + 7) = v81[3];
    *(_OWORD *)((char *)&v83[4] + 7) = v81[4];
    *(_OWORD *)((char *)&v83[5] + 7) = v81[5];
    *(_OWORD *)((char *)&v83[6] + 7) = v81[6];
    v3 = v66;
    v4 = v67;
    *(_OWORD *)((char *)v83 + 7) = v81[0];
    *(_OWORD *)((char *)&v83[1] + 7) = v81[1];
    *(_OWORD *)((char *)&v83[2] + 7) = v81[2];
    v40 = v65;
    v85[0] = v65;
    v85[1] = 0;
    v86[0] = 1;
    *(_OWORD *)&v86[113] = v79[7];
    *(_OWORD *)&v86[129] = v79[8];
    *(_OWORD *)&v86[145] = v79[9];
    *(_OWORD *)&v86[161] = v79[10];
    *(_OWORD *)&v86[49] = v79[3];
    *(_OWORD *)&v86[65] = v79[4];
    *(_OWORD *)&v86[81] = v79[5];
    *(_OWORD *)&v86[97] = v79[6];
    *(_OWORD *)&v86[1] = v79[0];
    *(_OWORD *)&v86[17] = v79[1];
    *(_OWORD *)&v86[33] = v79[2];
    v87[0] = v39;
    v87[1] = 0;
    v88[0] = 1;
    *(_OWORD *)&v88[113] = v83[7];
    *(_OWORD *)&v88[129] = v83[8];
    *(_OWORD *)&v88[145] = v83[9];
    *(_OWORD *)&v88[161] = *(_OWORD *)((char *)v82 + 9);
    *(_OWORD *)&v88[49] = v83[3];
    *(_OWORD *)&v88[65] = v83[4];
    *(_OWORD *)&v88[81] = v83[5];
    *(_OWORD *)&v88[97] = v83[6];
    *(_OWORD *)&v88[1] = v83[0];
    *(_OWORD *)&v88[17] = v83[1];
    *(_OWORD *)&v88[33] = v83[2];
    v115[10] = *(_OWORD *)&v86[144];
    v115[11] = *(_OWORD *)&v86[160];
    v115[6] = *(_OWORD *)&v86[80];
    v115[7] = *(_OWORD *)&v86[96];
    v115[8] = *(_OWORD *)&v86[112];
    v115[9] = *(_OWORD *)&v86[128];
    v115[2] = *(_OWORD *)&v86[16];
    v115[3] = *(_OWORD *)&v86[32];
    v115[4] = *(_OWORD *)&v86[48];
    v115[5] = *(_OWORD *)&v86[64];
    v115[0] = (unint64_t)v65;
    v115[1] = *(_OWORD *)v86;
    *(_OWORD *)((char *)&v115[22] + 8) = *(_OWORD *)&v88[144];
    *(_OWORD *)((char *)&v115[23] + 8) = *(_OWORD *)&v88[160];
    *(_OWORD *)((char *)&v115[18] + 8) = *(_OWORD *)&v88[80];
    *(_OWORD *)((char *)&v115[19] + 8) = *(_OWORD *)&v88[96];
    *(_OWORD *)((char *)&v115[20] + 8) = *(_OWORD *)&v88[112];
    *(_OWORD *)((char *)&v115[21] + 8) = *(_OWORD *)&v88[128];
    *(_OWORD *)((char *)&v115[16] + 8) = *(_OWORD *)&v88[48];
    *(_OWORD *)((char *)&v115[17] + 8) = *(_OWORD *)&v88[64];
    *(_OWORD *)((char *)&v115[13] + 8) = *(_OWORD *)v88;
    *(_OWORD *)((char *)&v115[14] + 8) = *(_OWORD *)&v88[16];
    *(_OWORD *)((char *)&v115[15] + 8) = *(_OWORD *)&v88[32];
    *(_OWORD *)((char *)&v115[12] + 8) = (unint64_t)v39;
    v98 = v83[7];
    v99 = v83[8];
    v100 = v83[9];
    v101 = *(_OWORD *)((char *)v82 + 9);
    v94 = v83[3];
    v95 = v83[4];
    v96 = v83[5];
    v97 = v83[6];
    v91 = v83[0];
    v92 = v83[1];
    LOBYTE(v115[12]) = HIBYTE(v79[10]);
    BYTE8(v115[24]) = BYTE8(v82[1]);
    v89[0] = v39;
    v89[1] = 0;
    v90 = 1;
    v93 = v83[2];
    sub_100153004((uint64_t)v85);
    sub_100153004((uint64_t)v87);
    sub_100152EA0((uint64_t)v89);
    v111 = v79[7];
    v112 = v79[8];
    v113 = v79[9];
    v114 = v79[10];
    v107 = v79[3];
    v108 = v79[4];
    v109 = v79[5];
    v110 = v79[6];
    v104 = v79[0];
    v105 = v79[1];
    v102[0] = v40;
    v102[1] = 0;
    v103 = 1;
    v106 = v79[2];
    sub_100152EA0((uint64_t)v102);
    memcpy(v116, v115, 0x189uLL);
    nullsub_1(v116);
  }
  else
  {
    sub_1001D9730(v116);
  }
  v41 = sub_10014BC64((uint64_t)v116, (uint64_t)v117, &qword_1002B7DE8);
  v42 = v69;
  v43 = Divider.init()(v41);
  v44 = static Edge.Set.horizontal.getter(v43);
  v45 = EdgeInsets.init(_all:)(15.0);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = (uint64_t)v74;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v74, v42, v3);
  v53 = v52 + *(int *)(v68 + 36);
  *(_BYTE *)v53 = v44;
  *(double *)(v53 + 8) = v45;
  *(_QWORD *)(v53 + 16) = v47;
  *(_QWORD *)(v53 + 24) = v49;
  *(_QWORD *)(v53 + 32) = v51;
  *(_BYTE *)(v53 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v42, v3);
  v54 = v72;
  sub_10014BC64(v52, v72, &qword_1002B7DB0);
  v55 = v75;
  v56 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
  v57 = v73;
  v58 = v70;
  v56(v73, v70, v75);
  sub_10014BC64((uint64_t)v117, (uint64_t)v102, &qword_1002B7DE8);
  sub_10014BD9C(v54, v52, &qword_1002B7DB0);
  v59 = v71;
  v56(v71, v57, v55);
  v60 = sub_100146438(&qword_1002B7DF0);
  v61 = (uint64_t)&v59[*(int *)(v60 + 48)];
  sub_10014BC64((uint64_t)v102, (uint64_t)v115, &qword_1002B7DE8);
  sub_10014BC64((uint64_t)v115, v61, &qword_1002B7DE8);
  sub_10014BD9C(v52, (uint64_t)&v59[*(int *)(v60 + 64)], &qword_1002B7DB0);
  sub_1001D9848((uint64_t)v115, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1001D9770);
  sub_10014BDE0(v54, &qword_1002B7DB0);
  v62 = *(void (**)(char *, uint64_t))(v76 + 8);
  v62(v58, v55);
  sub_10014BDE0(v52, &qword_1002B7DB0);
  sub_10014BC64((uint64_t)v102, (uint64_t)v116, &qword_1002B7DE8);
  sub_1001D9848((uint64_t)v116, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1001D98EC);
  return ((uint64_t (*)(char *, uint64_t))v62)(v57, v55);
}

uint64_t sub_1001D73E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  void (*v30)(_BYTE *, uint64_t);
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
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v52[4];
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  _OWORD v60[9];
  _OWORD v61[2];
  _BYTE v62[177];
  char v63;
  __int128 v64;
  _BYTE v65[178];
  _QWORD v66[2];
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  char v79;

  v58 = a3;
  v5 = type metadata accessor for Divider(0);
  v55 = *(_QWORD *)(v5 - 8);
  v56 = v5;
  __chkstk_darwin(v5);
  v7 = &v52[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_100146438(&qword_1002B7DB0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v52[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_100146438(&qword_1002B7DF8);
  v13 = __chkstk_darwin(v12);
  v59 = &v52[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  v16 = &v52[-v15];
  v17 = type metadata accessor for FTMCellMonitorHardwareDetailModel(0);
  v18 = *(_QWORD *)(a2 + 16);
  v57 = a1;
  if (v18
    && *(_QWORD *)(a1 + *(int *)(v17 + 20)) == *(_QWORD *)(a2
                                                         + ((*(unsigned __int8 *)(*(_QWORD *)(v17 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v17 - 8) + 80))
                                                         + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * (v18 - 1)
                                                         + *(int *)(v17 + 20)))
  {
    v19 = Divider.init()(v17);
    v53 = static Edge.Set.horizontal.getter(v19);
    v20 = EdgeInsets.init(_all:)(15.0);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v54 = a2;
    v27 = v55;
    v28 = v56;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v55 + 16))(v11, v7, v56);
    v29 = (double *)&v11[*(int *)(v8 + 36)];
    *(_BYTE *)v29 = v53;
    v29[1] = v20;
    *((_QWORD *)v29 + 2) = v22;
    *((_QWORD *)v29 + 3) = v24;
    *((_QWORD *)v29 + 4) = v26;
    *((_BYTE *)v29 + 40) = 0;
    v30 = *(void (**)(_BYTE *, uint64_t))(v27 + 8);
    a2 = v54;
    v30(v7, v28);
    sub_10014BC64((uint64_t)v11, (uint64_t)v16, &qword_1002B7DB0);
    v31 = 0;
  }
  else
  {
    v31 = 1;
  }
  v32 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v16, v31, 1, v8);
  v40 = static VerticalAlignment.center.getter(v32, v33, v34, v35, v36, v37, v38, v39);
  sub_1001D7890(v57, a2, (uint64_t)v60);
  *(_OWORD *)&v62[119] = v60[7];
  *(_OWORD *)&v62[135] = v60[8];
  *(_OWORD *)&v62[151] = v61[0];
  *(_OWORD *)&v62[161] = *(_OWORD *)((char *)v61 + 10);
  *(_OWORD *)&v62[55] = v60[3];
  *(_OWORD *)&v62[71] = v60[4];
  *(_OWORD *)&v62[87] = v60[5];
  *(_OWORD *)&v62[103] = v60[6];
  *(_OWORD *)&v62[7] = v60[0];
  *(_OWORD *)&v62[23] = v60[1];
  v63 = 1;
  *(_OWORD *)&v62[39] = v60[2];
  v41 = v59;
  sub_10014BD9C((uint64_t)v16, (uint64_t)v59, &qword_1002B7DF8);
  v42 = v58;
  sub_10014BD9C((uint64_t)v41, v58, &qword_1002B7DF8);
  v43 = *(int *)(sub_100146438(&qword_1002B7E00) + 48);
  *(_OWORD *)&v65[129] = *(_OWORD *)&v62[128];
  *(_OWORD *)&v65[145] = *(_OWORD *)&v62[144];
  *(_OWORD *)&v65[161] = *(_OWORD *)&v62[160];
  *(_OWORD *)&v65[65] = *(_OWORD *)&v62[64];
  *(_OWORD *)&v65[81] = *(_OWORD *)&v62[80];
  *(_OWORD *)&v65[97] = *(_OWORD *)&v62[96];
  *(_OWORD *)&v65[113] = *(_OWORD *)&v62[112];
  *(_OWORD *)&v65[17] = *(_OWORD *)&v62[16];
  *(_OWORD *)&v65[33] = *(_OWORD *)&v62[32];
  v44 = v42 + v43;
  v64 = (unint64_t)v40;
  v65[0] = 1;
  v65[177] = v62[176];
  *(_OWORD *)&v65[49] = *(_OWORD *)&v62[48];
  *(_OWORD *)&v65[1] = *(_OWORD *)v62;
  v45 = *(_OWORD *)&v65[160];
  *(_OWORD *)(v44 + 160) = *(_OWORD *)&v65[144];
  *(_OWORD *)(v44 + 176) = v45;
  *(_WORD *)(v44 + 192) = *(_WORD *)&v65[176];
  v46 = *(_OWORD *)&v65[96];
  *(_OWORD *)(v44 + 96) = *(_OWORD *)&v65[80];
  *(_OWORD *)(v44 + 112) = v46;
  v47 = *(_OWORD *)&v65[128];
  *(_OWORD *)(v44 + 128) = *(_OWORD *)&v65[112];
  *(_OWORD *)(v44 + 144) = v47;
  v48 = *(_OWORD *)&v65[32];
  *(_OWORD *)(v44 + 32) = *(_OWORD *)&v65[16];
  *(_OWORD *)(v44 + 48) = v48;
  v49 = *(_OWORD *)&v65[64];
  *(_OWORD *)(v44 + 64) = *(_OWORD *)&v65[48];
  *(_OWORD *)(v44 + 80) = v49;
  v50 = *(_OWORD *)v65;
  *(_OWORD *)v44 = v64;
  *(_OWORD *)(v44 + 16) = v50;
  sub_1001D99C4((uint64_t)&v64);
  sub_10014BDE0((uint64_t)v16, &qword_1002B7DF8);
  v76 = *(_OWORD *)&v62[128];
  v77 = *(_OWORD *)&v62[144];
  v78 = *(_OWORD *)&v62[160];
  v72 = *(_OWORD *)&v62[64];
  v73 = *(_OWORD *)&v62[80];
  v74 = *(_OWORD *)&v62[96];
  v75 = *(_OWORD *)&v62[112];
  v68 = *(_OWORD *)v62;
  v69 = *(_OWORD *)&v62[16];
  v70 = *(_OWORD *)&v62[32];
  v66[0] = v40;
  v66[1] = 0;
  v67 = 1;
  v79 = v62[176];
  v71 = *(_OWORD *)&v62[48];
  sub_1001D9ABC((uint64_t)v66);
  return sub_10014BDE0((uint64_t)v41, &qword_1002B7DF8);
}

uint64_t sub_1001D7890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
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
  double v72;
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
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v94;
  uint64_t v95;
  char v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  char v124;

  v6 = (int *)type metadata accessor for FTMCellMonitorHardwareDetailModel(0);
  v7 = (uint64_t *)(a1 + v6[6]);
  v8 = v7[1];
  v112 = *v7;
  v113 = v8;
  v9 = sub_10014654C();
  swift_bridgeObjectRetain(v8);
  v10 = Text.init<A>(_:)(&v112, &type metadata for String, v9);
  v12 = v11;
  v14 = v13;
  v16 = v15 & 1;
  v17 = static Color.blue.getter(v10, v11);
  v18 = Text.foregroundColor(_:)(v17, v10, v12, v16, v14);
  v98 = v19;
  v99 = v18;
  v97 = v20;
  v100 = v21;
  swift_release(v17);
  sub_10014BE2C(v10, v12, v16);
  v22 = swift_bridgeObjectRelease(v14);
  v96 = static Edge.Set.leading.getter(v22);
  v23 = EdgeInsets.init(_all:)(10.0);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = *(_QWORD *)(a2 + 16);
  if (v30
    && *(_QWORD *)(a1 + v6[5]) == *(_QWORD *)(a2
                                            + ((*(unsigned __int8 *)(*((_QWORD *)v6 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v6 - 1) + 80))
                                            + *(_QWORD *)(*((_QWORD *)v6 - 1) + 72) * (v30 - 1)
                                            + v6[5]))
  {
    v31 = (uint64_t *)(a1 + v6[7]);
    v32 = v31[1];
    v112 = *v31;
    v113 = v32;
    swift_bridgeObjectRetain(v32);
    v33 = Text.init<A>(_:)(&v112, &type metadata for String, v9);
    v35 = v34;
    v37 = v36;
    v39 = v38 & 1;
    v40 = static Color.gray.getter(v33, v34);
    v41 = Text.foregroundColor(_:)(v40, v33, v35, v39, v37);
    v43 = v42;
    v45 = v44;
    v47 = v46;
    swift_release(v40);
    v48 = v45 & 1;
    sub_10014BE2C(v33, v35, v39);
    v49 = swift_bridgeObjectRelease(v37);
    LOBYTE(v33) = static Edge.Set.trailing.getter(v49);
    v50 = EdgeInsets.init(_all:)(10.0);
    v52 = v51;
    v54 = v53;
    v56 = v55;
    sub_10014BE1C(v41, v43, v45 & 1);
    swift_bridgeObjectRetain(v47);
    sub_10014BE1C(v41, v43, v45 & 1);
    swift_bridgeObjectRetain(v47);
    sub_10014BE2C(v41, v43, v45 & 1);
    swift_bridgeObjectRelease(v47);
    v101 = xmmword_100242C50;
    v102 = v41;
    v103 = v43;
    v104 = v45 & 1;
    v105 = v47;
    v106 = v33;
    v107 = v50;
    v108 = v52;
    v109 = v54;
    v110 = v56;
    v111 = 0;
  }
  else
  {
    v57 = (uint64_t *)(a1 + v6[7]);
    v58 = v57[1];
    v112 = *v57;
    v113 = v58;
    swift_bridgeObjectRetain(v58);
    v59 = Text.init<A>(_:)(&v112, &type metadata for String, v9);
    v61 = v60;
    v63 = v62;
    v65 = v64 & 1;
    v66 = static Color.gray.getter(v59, v60);
    v41 = Text.foregroundColor(_:)(v66, v59, v61, v65, v63);
    v43 = v67;
    v69 = v68;
    v47 = v70;
    swift_release(v66);
    v48 = v69 & 1;
    sub_10014BE2C(v59, v61, v65);
    v71 = swift_bridgeObjectRelease(v63);
    LOBYTE(v59) = static Edge.Set.trailing.getter(v71);
    v72 = EdgeInsets.init(_all:)(10.0);
    v74 = v73;
    v76 = v75;
    v78 = v77;
    sub_10014BE1C(v41, v43, v69 & 1);
    swift_bridgeObjectRetain(v47);
    sub_10014BE1C(v41, v43, v69 & 1);
    swift_bridgeObjectRetain(v47);
    sub_10014BE2C(v41, v43, v69 & 1);
    swift_bridgeObjectRelease(v47);
    v101 = xmmword_100242C50;
    v102 = v41;
    v103 = v43;
    v104 = v69 & 1;
    v105 = v47;
    v106 = v59;
    v107 = v72;
    v108 = v74;
    v109 = v76;
    v110 = v78;
    v111 = 256;
  }
  v79 = sub_100146438(&qword_1002B7E08);
  v80 = sub_10014BEC0(&qword_1002B7E10, &qword_1002B7E08, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  _ConditionalContent<>.init(storage:)(&v101, v79, v79, v80, v80);
  sub_10014BE2C(v41, v43, v48);
  swift_bridgeObjectRelease(v47);
  v82 = v112;
  v81 = v113;
  v84 = v114;
  v83 = v115;
  v86 = v116;
  v85 = v117;
  v88 = v118;
  v87 = v119;
  v89 = v120;
  v90 = v121;
  v91 = v122;
  v92 = v123;
  LOBYTE(v79) = v124;
  v94 = v115;
  v95 = v113;
  LOBYTE(v112) = v97 & 1;
  LOBYTE(v101) = 0;
  *(_QWORD *)a3 = v99;
  *(_QWORD *)(a3 + 8) = v98;
  *(_BYTE *)(a3 + 16) = v97 & 1;
  *(_QWORD *)(a3 + 24) = v100;
  *(_BYTE *)(a3 + 32) = v96;
  *(double *)(a3 + 40) = v23;
  *(_QWORD *)(a3 + 48) = v25;
  *(_QWORD *)(a3 + 56) = v27;
  *(_QWORD *)(a3 + 64) = v29;
  *(_BYTE *)(a3 + 72) = 0;
  *(_QWORD *)(a3 + 80) = v82;
  *(_QWORD *)(a3 + 88) = v81;
  *(_QWORD *)(a3 + 96) = v84;
  *(_QWORD *)(a3 + 104) = v83;
  *(_QWORD *)(a3 + 112) = v86;
  *(_QWORD *)(a3 + 120) = v85;
  *(_QWORD *)(a3 + 128) = v88;
  *(_QWORD *)(a3 + 136) = v87;
  *(_QWORD *)(a3 + 144) = v89;
  *(_QWORD *)(a3 + 152) = v90;
  *(_QWORD *)(a3 + 160) = v91;
  *(_BYTE *)(a3 + 168) = v92;
  *(_BYTE *)(a3 + 169) = v79;
  sub_10014BE1C(v99, v98, v97 & 1);
  swift_bridgeObjectRetain(v100);
  sub_1001D9A8C(v82, v95, v84, v94, v86, v85);
  sub_1001D9B84(v82, v95, v84, v94, v86, v85);
  sub_10014BE2C(v99, v98, v97 & 1);
  return swift_bridgeObjectRelease(v100);
}

uint64_t sub_1001D7DB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[7];
  _BYTE v61[7];
  _BYTE v62[7];
  _BYTE v63[7];
  _QWORD v64[2];
  uint64_t v65;
  unint64_t v66;

  v4 = LocalizedStringKey.init(stringLiteral:)(0x2072656972726143, 0xEF3A656C646E7542);
  v5 = Text.init(_:tableName:bundle:comment:)(v4);
  v7 = v6;
  v9 = v8;
  v11 = v10 & 1;
  v12 = static Color.blue.getter(v5, v6);
  v13 = Text.foregroundColor(_:)(v12, v5, v7, v11, v9);
  v57 = v14;
  v58 = v13;
  v16 = v15;
  v59 = v17;
  swift_release(v12);
  sub_10014BE2C(v5, v7, v11);
  v18 = swift_bridgeObjectRelease(v9);
  v56 = static Edge.Set.leading.getter(v18);
  v19 = EdgeInsets.init(_all:)(10.0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = *(_QWORD *)(a1 + 112);
  v65 = *(_QWORD *)(a1 + 104);
  v66 = v26;
  v64[0] = 46;
  v64[1] = 0xE100000000000000;
  v27 = sub_10014654C();
  v28 = StringProtocol.components<A>(separatedBy:)(v64, &type metadata for String, &type metadata for String, v27, v27);
  v29 = v28;
  v30 = *(_QWORD *)(v28 + 16);
  if (v30)
  {
    v31 = v28 + 16 * v30;
    v32 = *(_QWORD *)(v31 + 16);
    v33 = *(_QWORD *)(v31 + 24);
    swift_bridgeObjectRetain(v33);
  }
  else
  {
    v32 = 0;
    v33 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease(v29);
  v34 = v16 & 1;
  v65 = v32;
  v66 = v33;
  v35 = Text.init<A>(_:)(&v65, &type metadata for String, v27);
  v37 = v36;
  v39 = v38;
  v41 = v40 & 1;
  v42 = static Color.gray.getter(v35, v36);
  v43 = Text.foregroundColor(_:)(v42, v35, v37, v41, v39);
  v45 = v44;
  v47 = v46;
  v55 = v48;
  swift_release(v42);
  sub_10014BE2C(v35, v37, v41);
  v49 = swift_bridgeObjectRelease(v39);
  LOBYTE(v37) = static Edge.Set.trailing.getter(v49);
  v50 = EdgeInsets.init(_all:)(10.0);
  *(_DWORD *)(a2 + 17) = v65;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v65 + 3);
  *(_DWORD *)(a2 + 33) = v64[0];
  *(_DWORD *)(a2 + 36) = *(_DWORD *)((char *)v64 + 3);
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v63[3];
  *(_DWORD *)(a2 + 73) = *(_DWORD *)v63;
  *(_DWORD *)(a2 + 92) = *(_DWORD *)&v62[3];
  *(_DWORD *)(a2 + 89) = *(_DWORD *)v62;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v61[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v61;
  *(_DWORD *)(a2 + 132) = *(_DWORD *)&v60[3];
  *(_DWORD *)(a2 + 129) = *(_DWORD *)v60;
  *(_QWORD *)a2 = v58;
  *(_QWORD *)(a2 + 8) = v57;
  *(_BYTE *)(a2 + 16) = v34;
  *(_QWORD *)(a2 + 24) = v59;
  *(_BYTE *)(a2 + 32) = v56;
  *(double *)(a2 + 40) = v19;
  *(_QWORD *)(a2 + 48) = v21;
  *(_QWORD *)(a2 + 56) = v23;
  *(_QWORD *)(a2 + 64) = v25;
  *(_BYTE *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_BYTE *)(a2 + 88) = 1;
  *(_QWORD *)(a2 + 96) = v43;
  *(_QWORD *)(a2 + 104) = v45;
  *(_BYTE *)(a2 + 112) = v47 & 1;
  *(_QWORD *)(a2 + 120) = v55;
  *(_BYTE *)(a2 + 128) = v37;
  *(double *)(a2 + 136) = v50;
  *(_QWORD *)(a2 + 144) = v51;
  *(_QWORD *)(a2 + 152) = v52;
  *(_QWORD *)(a2 + 160) = v53;
  *(_BYTE *)(a2 + 168) = 0;
  sub_10014BE1C(v58, v57, v34);
  swift_bridgeObjectRetain(v59);
  sub_10014BE1C(v43, v45, v47 & 1);
  swift_bridgeObjectRetain(v55);
  sub_10014BE2C(v43, v45, v47 & 1);
  swift_bridgeObjectRelease(v55);
  sub_10014BE2C(v58, v57, v34);
  return swift_bridgeObjectRelease(v59);
}

uint64_t sub_1001D8100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  int v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  char v58;
  _BYTE v59[7];
  _BYTE v60[7];
  char v61;
  _BYTE v62[7];
  char v63;
  _BYTE v64[7];
  char v65;
  _BYTE v66[7];
  char v67;

  v4 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000017, 0x8000000100216030);
  v5 = Text.init(_:tableName:bundle:comment:)(v4);
  v7 = v6;
  v9 = v8;
  v11 = v10 & 1;
  v12 = static Color.blue.getter(v5, v6);
  v13 = Text.foregroundColor(_:)(v12, v5, v7, v11, v9);
  v54 = v14;
  v55 = v13;
  v16 = v15;
  v56 = v17;
  swift_release(v12);
  v52 = v16 & 1;
  sub_10014BE2C(v5, v7, v11);
  v18 = swift_bridgeObjectRelease(v9);
  v53 = static Edge.Set.leading.getter(v18);
  v19 = EdgeInsets.init(_all:)(10.0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = *(_QWORD *)(a1 + 96);
  v57[0] = *(_QWORD *)(a1 + 88);
  v57[1] = v26;
  v27 = sub_10014654C();
  swift_bridgeObjectRetain(v26);
  v28 = Text.init<A>(_:)(v57, &type metadata for String, v27);
  v30 = v29;
  v32 = v31;
  v34 = v33 & 1;
  v35 = static Color.gray.getter(v28, v29);
  v36 = Text.foregroundColor(_:)(v35, v28, v30, v34, v32);
  v38 = v37;
  LOBYTE(v12) = v39;
  v41 = v40;
  swift_release(v35);
  sub_10014BE2C(v28, v30, v34);
  v42 = swift_bridgeObjectRelease(v32);
  LOBYTE(v30) = static Edge.Set.trailing.getter(v42);
  v43 = EdgeInsets.init(_all:)(10.0);
  v67 = v52;
  v65 = 0;
  v63 = 1;
  v61 = v12 & 1;
  v58 = 0;
  *(_DWORD *)(a2 + 17) = v57[0];
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)v57 + 3);
  *(_DWORD *)(a2 + 33) = *(_DWORD *)v66;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)&v66[3];
  v44 = *(_DWORD *)v64;
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v64[3];
  *(_DWORD *)(a2 + 73) = v44;
  LOBYTE(v44) = v63;
  v45 = *(_DWORD *)v62;
  *(_DWORD *)(a2 + 92) = *(_DWORD *)&v62[3];
  *(_DWORD *)(a2 + 89) = v45;
  v46 = *(_DWORD *)v60;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v60[3];
  *(_DWORD *)(a2 + 113) = v46;
  v47 = *(_DWORD *)v59;
  *(_DWORD *)(a2 + 132) = *(_DWORD *)&v59[3];
  *(_DWORD *)(a2 + 129) = v47;
  LOBYTE(v47) = v58;
  *(_QWORD *)a2 = v55;
  *(_QWORD *)(a2 + 8) = v54;
  *(_BYTE *)(a2 + 16) = v52;
  *(_QWORD *)(a2 + 24) = v56;
  *(_BYTE *)(a2 + 32) = v53;
  *(double *)(a2 + 40) = v19;
  *(_QWORD *)(a2 + 48) = v21;
  *(_QWORD *)(a2 + 56) = v23;
  *(_QWORD *)(a2 + 64) = v25;
  *(_BYTE *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_BYTE *)(a2 + 88) = v44;
  *(_QWORD *)(a2 + 96) = v36;
  *(_QWORD *)(a2 + 104) = v38;
  *(_BYTE *)(a2 + 112) = v12 & 1;
  *(_QWORD *)(a2 + 120) = v41;
  *(_BYTE *)(a2 + 128) = v30;
  *(double *)(a2 + 136) = v43;
  *(_QWORD *)(a2 + 144) = v48;
  *(_QWORD *)(a2 + 152) = v49;
  *(_QWORD *)(a2 + 160) = v50;
  *(_BYTE *)(a2 + 168) = v47;
  sub_10014BE1C(v55, v54, v52);
  swift_bridgeObjectRetain(v56);
  sub_10014BE1C(v36, v38, v12 & 1);
  swift_bridgeObjectRetain(v41);
  sub_10014BE2C(v36, v38, v12 & 1);
  swift_bridgeObjectRelease(v41);
  sub_10014BE2C(v55, v54, v52);
  return swift_bridgeObjectRelease(v56);
}

void sub_1001D83EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  int v24;
  Swift::String v25;
  void *object;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  unint64_t v80;
  _QWORD *v81;
  unint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  unint64_t v95;
  _QWORD *v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  BOOL v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  _QWORD *v113;
  unint64_t v114;
  uint64_t i;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  BOOL v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  _QWORD *v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t j;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  BOOL v132;
  _QWORD *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  Swift::String v139;
  _QWORD *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD *v146;
  unint64_t *v147;
  _QWORD *v148;
  unint64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  int64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  _QWORD *v163;
  uint64_t v164;
  _QWORD *v165;
  unint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  _QWORD *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD *v179;
  uint64_t v180;
  unint64_t v181;
  uint64_t v182;
  _QWORD *v183;
  _QWORD *v184;
  int v185[6];
  unint64_t v186;
  _QWORD *v187;
  char v188[24];
  unint64_t v189;

  v176 = type metadata accessor for FTMCellMonitorHardwareDetailModel(0);
  v177 = *(_QWORD *)(v176 - 8);
  v0 = __chkstk_darwin(v176);
  v172 = (uint64_t)&v169 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __chkstk_darwin(v0);
  v180 = (uint64_t)&v169 - v3;
  __chkstk_darwin(v2);
  v5 = (char *)&v169 - v4;
  v189 = (unint64_t)_swiftEmptyArrayStorage;
  if (qword_1002B3A78 != -1)
    goto LABEL_30;
  while (1)
  {
    v6 = qword_1002BF068;
    swift_beginAccess(qword_1002BF068 + 80, v188, 0, 0);
    v7 = *(_QWORD *)(v6 + 80);
    v8 = *(_QWORD *)(v7 + 16);
    v9 = (unint64_t)_swiftEmptyArrayStorage;
    if (!v8)
    {
      v11 = _swiftEmptyArrayStorage;
      goto LABEL_11;
    }
    if ((*(_BYTE *)(v6 + 152) & 1) != 0)
    {
      LODWORD(v10) = 0;
      goto LABEL_7;
    }
    v10 = *(int *)(v6 + 148);
    if ((uint64_t)v8 <= v10)
      break;
LABEL_7:
    v10 = (int)v10;
    if ((int)v10 < v8)
      goto LABEL_8;
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    swift_once(&qword_1002B3A78, sub_100183CA4);
  }
  v10 = v8 - 1;
  if (v8 - 1 >= v8)
    goto LABEL_28;
LABEL_8:
  v12 = v7 + 88 * v10;
  v14 = *(_QWORD *)(v12 + 32);
  v13 = *(_QWORD *)(v12 + 40);
  v15 = swift_bridgeObjectRetain(v13);
  UUID.init()(v15);
  v16 = v176;
  v17 = &v5[*(int *)(v176 + 32)];
  *(_QWORD *)&v5[*(int *)(v176 + 20)] = 1;
  v18 = &v5[*(int *)(v16 + 24)];
  *(_QWORD *)v18 = 0x3A72656972726143;
  *((_QWORD *)v18 + 1) = 0xE800000000000000;
  v19 = &v5[*(int *)(v16 + 28)];
  *(_QWORD *)v19 = v14;
  *((_QWORD *)v19 + 1) = v13;
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v11 = (_QWORD *)sub_1001C7A48(0, 1, 1, (unint64_t)_swiftEmptyArrayStorage);
  v21 = v11[2];
  v20 = v11[3];
  if (v21 >= v20 >> 1)
    v11 = (_QWORD *)sub_1001C7A48(v20 > 1, v21 + 1, 1, (unint64_t)v11);
  v11[2] = v21 + 1;
  sub_1001D9BB4((uint64_t)v5, (uint64_t)v11+ ((*(unsigned __int8 *)(v177 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v177 + 80))+ *(_QWORD *)(v177 + 72) * v21);
LABEL_11:
  if (qword_1002B3A80 != -1)
    swift_once(&qword_1002B3A80, sub_100184F00);
  objc_msgSend(*(id *)(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_lock), "lock");
  v22 = *(_BYTE *)(qword_1002BF068 + 152);
  v170 = v11;
  if ((v22 & 1) != 0)
  {
    v23 = 0;
LABEL_161:
    objc_msgSend(*(id *)(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_lock), "unlock");
    v70 = v189;
    v186 = (unint64_t)_swiftEmptyArrayStorage;
    v9 = v189 >> 62;
    if (v189 >> 62)
      goto LABEL_203;
    v112 = *(_QWORD *)((v189 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v189);
    goto LABEL_163;
  }
  v24 = *(_DWORD *)(qword_1002BF068 + 148);
  v186 = 2119450962;
  v187 = (_QWORD *)0xE400000000000000;
  v185[0] = v24;
  v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
  object = v25._object;
  String.append(_:)(v25);
  swift_bridgeObjectRelease(object);
  v181 = v186;
  v179 = v187;
  v27 = (uint64_t *)(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray);
  swift_beginAccess(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray, v185, 0, 0);
  v28 = *v27;
  if ((unint64_t)*v27 >> 62)
  {
    if (v28 < 0)
      v38 = *v27;
    else
      v38 = v28 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v28);
    v29 = _CocoaArrayWrapper.endIndex.getter(v38);
    if (v29)
      goto LABEL_17;
    goto LABEL_35;
  }
  v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(*v27);
  if (!v29)
  {
LABEL_35:
    swift_bridgeObjectRelease(v28);
    v178 = 0;
    goto LABEL_36;
  }
LABEL_17:
  v183 = _swiftEmptyArrayStorage;
  sub_100195A34(0, v29 & ~(v29 >> 63), 0);
  if (v29 < 0)
  {
    __break(1u);
LABEL_255:
    __break(1u);
LABEL_256:
    swift_release(v186);
    __break(1u);
    return;
  }
  v30 = 0;
  v31 = v183;
  v5 = (char *)(v28 & 0xC000000000000001);
  do
  {
    if (v29 == v30)
      goto LABEL_29;
    if (v5)
    {
      v32 = specialized _ArrayBuffer._getElementSlowPath(_:)(v30, v28);
    }
    else
    {
      v32 = *(_QWORD *)(v28 + 8 * v30 + 32);
      swift_retain(v32);
    }
    v184 = (_QWORD *)v32;
    sub_1001D6784((uint64_t)&v184, &v186);
    swift_release(v32);
    v33 = v186;
    v34 = v187;
    v183 = v31;
    v36 = v31[2];
    v35 = v31[3];
    v9 = v36 + 1;
    if (v36 >= v35 >> 1)
    {
      sub_100195A34(v35 > 1, v36 + 1, 1);
      v31 = v183;
    }
    ++v30;
    v31[2] = v9;
    v37 = &v31[2 * v36];
    v37[4] = v33;
    v37[5] = v34;
  }
  while (v29 != v30);
  v178 = 0;
  swift_bridgeObjectRelease(v28);
  swift_release(v31);
LABEL_36:
  v39 = (uint64_t *)(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray);
  swift_beginAccess(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray, &v183, 0, 0);
  v40 = *v39;
  v186 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)v40 >> 62)
    goto LABEL_56;
  v41 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v40);
  v42 = v179;
  if (v41)
  {
LABEL_38:
    v43 = 0;
    while (1)
    {
      if ((v40 & 0xC000000000000001) != 0)
      {
        v44 = specialized _ArrayBuffer._getElementSlowPath(_:)(v43, v40);
        v45 = v43 + 1;
        if (__OFADD__(v43, 1))
        {
LABEL_53:
          __break(1u);
LABEL_54:
          v50 = v186;
          goto LABEL_61;
        }
      }
      else
      {
        if (v43 >= *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_56:
          if (v40 < 0)
            v51 = v40;
          else
            v51 = v40 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v40);
          v41 = _CocoaArrayWrapper.endIndex.getter(v51);
          v42 = v179;
          if (!v41)
            break;
          goto LABEL_38;
        }
        v44 = *(_QWORD *)(v40 + 8 * v43 + 32);
        swift_retain(v44);
        v45 = v43 + 1;
        if (__OFADD__(v43, 1))
          goto LABEL_53;
      }
      v46 = *(_QWORD *)(v44 + 16);
      v47 = *(_QWORD **)(v44 + 24);
      v48 = v46 == v181 && v47 == v42;
      if ((v48 || (_stringCompareWithSmolCheck(_:_:expecting:)(v46, v47, v181, v42, 0) & 1) != 0)
        && *(_BYTE *)(v44 + OBJC_IVAR____TtC13FTMInternal_418FTMAllMetricsModel_isVisible) == 1)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v9 = *(_QWORD *)(v186 + 16);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
        v49 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v44);
        specialized ContiguousArray._endMutation()(v49);
        v42 = v179;
      }
      else
      {
        swift_release(v44);
      }
      ++v43;
      if (v45 == v41)
        goto LABEL_54;
    }
  }
  v50 = (uint64_t)_swiftEmptyArrayStorage;
LABEL_61:
  swift_bridgeObjectRelease(v40);
  swift_bridgeObjectRelease(v42);
  LODWORD(v52) = v50 < 0 || (v50 & 0x4000000000000000) != 0;
  if ((v52 & 1) != 0)
    goto LABEL_82;
  v23 = v178;
  if (*(_QWORD *)(v50 + 16))
  {
    while (1)
    {
      v53 = sub_100146438(&qword_1002B5660);
      v54 = (_QWORD *)swift_allocObject(v53, 96, 7);
      *((_OWORD *)v54 + 1) = xmmword_100242010;
      v54[7] = &type metadata for String;
      v54[4] = 0xD000000000000017;
      v54[5] = 0x8000000100216050;
      v181 = v50;
      if ((_DWORD)v52)
      {
        v55 = swift_bridgeObjectRetain(v50);
        v56 = _CocoaArrayWrapper.endIndex.getter(v55);
        swift_release(v50);
      }
      else
      {
        v56 = *(_QWORD *)(v50 + 16);
      }
      v57 = _swiftEmptyArrayStorage;
      if (!v56)
        break;
      v179 = v54;
      v184 = _swiftEmptyArrayStorage;
      v52 = (uint64_t)&v184;
      sub_100195A34(0, v56 & ~(v56 >> 63), 0);
      if (v56 < 0)
        goto LABEL_255;
      v50 = 0;
      v57 = v184;
      v58 = v181 & 0xC000000000000001;
      while (v56 != v50)
      {
        if (v58)
        {
          v52 = specialized _ArrayBuffer._getElementSlowPath(_:)(v50, v181);
        }
        else
        {
          v52 = *(_QWORD *)(v181 + 8 * v50 + 32);
          swift_retain(v52);
        }
        v182 = v52;
        sub_1001D6784((uint64_t)&v182, &v186);
        swift_release(v52);
        v59 = v186;
        v60 = v187;
        v184 = v57;
        v62 = v57[2];
        v61 = v57[3];
        v9 = v62 + 1;
        if (v62 >= v61 >> 1)
        {
          v52 = (uint64_t)&v184;
          sub_100195A34(v61 > 1, v62 + 1, 1);
          v57 = v184;
        }
        ++v50;
        v57[2] = v9;
        v63 = &v57[2 * v62];
        v63[4] = v59;
        v63[5] = v60;
        if (v56 == v50)
        {
          v54 = v179;
          goto LABEL_80;
        }
      }
      __break(1u);
LABEL_82:
      v65 = swift_bridgeObjectRetain(v50);
      v66 = _CocoaArrayWrapper.endIndex.getter(v65);
      swift_release(v50);
      v23 = v178;
      if (!v66)
        goto LABEL_83;
    }
LABEL_80:
    v54[11] = sub_100146438(&qword_1002B5630);
    v54[8] = v57;
    print(_:separator:terminator:)(v54, 32, 0xE100000000000000, 10, 0xE100000000000000);
    swift_bridgeObjectRelease(v54);
    v64 = v181;
  }
  else
  {
LABEL_83:
    swift_release(v50);
    v64 = (uint64_t)_swiftEmptyArrayStorage;
  }
  v174 = (unint64_t)v64 >> 62;
  if ((unint64_t)v64 >> 62)
  {
    if (v64 < 0)
      v168 = v64;
    else
      v168 = v64 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(v64, 2);
    v67 = _CocoaArrayWrapper.endIndex.getter(v168);
    swift_bridgeObjectRelease(v64);
  }
  else
  {
    v67 = *(_QWORD *)((v64 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v64);
  }
  v68 = _swiftEmptyArrayStorage;
  if (!v67)
  {
LABEL_160:
    v111 = v68;
    swift_bridgeObjectRelease_n(v64, 2);
    swift_bridgeObjectRelease(v111);
    goto LABEL_161;
  }
  v69 = 0;
  v70 = v64 & 0xC000000000000001;
  v71 = v64 & 0xFFFFFFFFFFFFFF8;
  v173 = v64 + 32;
  v178 = v64 & 0xFFFFFFFFFFFFFF8;
  if (v64 < 0)
    v71 = v64;
  v171 = v71;
  v181 = v64;
  v175 = v67;
  while (2)
  {
    v179 = v68;
    if (v70)
    {
      v72 = specialized _ArrayBuffer._getElementSlowPath(_:)(v69, v64);
    }
    else
    {
      if (v69 >= *(_QWORD *)(v178 + 16))
        goto LABEL_201;
      v72 = *(_QWORD *)(v173 + 8 * v69);
      swift_retain(v72);
    }
    if (__OFADD__(v69++, 1))
      goto LABEL_200;
    v74 = *(_QWORD *)(v72 + 48);
    v75 = *(_QWORD *)(v72 + 56);
    v76 = v179[2];
    if (v76)
    {
      v77 = v179[4];
      v78 = v179[5];
      v79 = v77 == v74 && v78 == v75;
      if (v79
        || (_stringCompareWithSmolCheck(_:_:expecting:)(v77, v78, *(_QWORD *)(v72 + 48), *(_QWORD *)(v72 + 56), 0) & 1) != 0)
      {
LABEL_101:
        v80 = v72;
        goto LABEL_156;
      }
      if (v76 != 1)
      {
        v102 = v179[6];
        v103 = v179[7];
        if (v102 == v74 && v103 == v75
          || (_stringCompareWithSmolCheck(_:_:expecting:)(v102, v103, v74, v75, 0) & 1) != 0)
        {
          goto LABEL_101;
        }
        if (v76 != 2)
        {
          v9 = (unint64_t)(v179 + 9);
          v104 = 2;
          while (1)
          {
            v105 = v104 + 1;
            if (__OFADD__(v104, 1))
            {
LABEL_245:
              __break(1u);
              goto LABEL_246;
            }
            v106 = *(_QWORD *)(v9 - 8);
            v107 = *(_QWORD *)v9;
            v108 = v106 == v74 && v107 == v75;
            if (v108 || (_stringCompareWithSmolCheck(_:_:expecting:)(v106, v107, v74, v75, 0) & 1) != 0)
              break;
            v9 += 16;
            ++v104;
            if (v105 == v76)
              goto LABEL_103;
          }
          swift_release(v72);
          v64 = v181;
LABEL_157:
          v68 = v179;
          if (v69 == v175)
            goto LABEL_160;
          continue;
        }
      }
    }
    break;
  }
LABEL_103:
  swift_bridgeObjectRetain(v75);
  if ((swift_isUniquelyReferenced_nonNull_native(v179) & 1) != 0)
  {
    v64 = v181;
    v81 = v179;
  }
  else
  {
    v81 = sub_1001C7118(0, v76 + 1, 1, v179);
    v64 = v181;
  }
  v9 = v81[2];
  v82 = v81[3];
  if (v9 >= v82 >> 1)
    v81 = sub_1001C7118((_QWORD *)(v82 > 1), v9 + 1, 1, v81);
  v81[2] = v9 + 1;
  v179 = v81;
  v83 = &v81[2 * v9];
  v83[4] = v74;
  v83[5] = v75;
  v186 = (unint64_t)_swiftEmptyArrayStorage;
  if (!v174)
  {
    v84 = *(_QWORD *)(v178 + 16);
    swift_bridgeObjectRetain(v64);
    swift_retain(v72);
    if (v84)
      goto LABEL_111;
LABEL_126:
    v95 = v186;
    swift_bridgeObjectRelease(v64);
    swift_release(v72);
    swift_bridgeObjectRetain(v95);
    if ((v95 & 0x8000000000000000) != 0 || (v96 = (_QWORD *)v95, (v95 & 0x4000000000000000) != 0))
    {
      v96 = sub_1001956CC(v95);
      swift_release(v95);
    }
    v186 = (unint64_t)v96;
    sub_1001D6708((uint64_t *)&v186, (uint64_t (*)(_QWORD *))sub_10017028C);
    if (v23)
      goto LABEL_256;
    swift_release(v95);
    v97 = v186;
    if ((v186 & 0x8000000000000000) != 0 || (v186 & 0x4000000000000000) != 0)
    {
      v109 = swift_bridgeObjectRetain(v186);
      v110 = _CocoaArrayWrapper.endIndex.getter(v109);
      swift_release(v97);
      if (!v110)
        goto LABEL_155;
LABEL_132:
      if ((v97 & 0xC000000000000001) != 0)
      {
        v98 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v97);
      }
      else
      {
        if (!*(_QWORD *)(v97 + 16))
          goto LABEL_202;
        v98 = *(_QWORD *)(v97 + 32);
        swift_retain(v98);
      }
      swift_release(v97);
      v99 = swift_retain(v98);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v99);
      v9 = *(_QWORD *)((v189 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v100 = *(_QWORD *)((v189 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v9 >= v100 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v100 > 1, v9 + 1, 1);
      v101 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v98);
      specialized Array._endMutation()(v101);
      swift_release(v72);
      v80 = v98;
    }
    else
    {
      if (*(_QWORD *)(v186 + 16))
        goto LABEL_132;
LABEL_155:
      swift_release(v72);
      v80 = v97;
    }
LABEL_156:
    swift_release(v80);
    goto LABEL_157;
  }
  swift_bridgeObjectRetain(v64);
  swift_retain(v72);
  v84 = _CocoaArrayWrapper.endIndex.getter(v171);
  if (!v84)
    goto LABEL_126;
LABEL_111:
  v85 = 0;
  while (2)
  {
    if (v70)
    {
      v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v85, v64);
      v89 = v85 + 1;
      if (__OFADD__(v85, 1))
        break;
      goto LABEL_120;
    }
    if (v85 >= *(_QWORD *)(v178 + 16))
      goto LABEL_199;
    v9 = *(_QWORD *)(v64 + 8 * v85 + 32);
    swift_retain(v9);
    v89 = v85 + 1;
    if (!__OFADD__(v85, 1))
    {
LABEL_120:
      v90 = *(_QWORD *)(v9 + 48);
      v91 = *(_QWORD *)(v9 + 56);
      v92 = *(_QWORD *)(v72 + 48);
      v93 = *(_QWORD *)(v72 + 56);
      v94 = v90 == v92 && v91 == v93;
      if (v94 || (_stringCompareWithSmolCheck(_:_:expecting:)(v90, v91, v92, v93, 0) & 1) != 0)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v86 = *(_QWORD *)(v186 + 16);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v86);
        v87 = v86;
        v64 = v181;
        v88 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v87, v9);
        specialized ContiguousArray._endMutation()(v88);
      }
      else
      {
        swift_release(v9);
      }
      ++v85;
      if (v89 == v84)
        goto LABEL_126;
      continue;
    }
    break;
  }
  __break(1u);
LABEL_199:
  __break(1u);
LABEL_200:
  __break(1u);
LABEL_201:
  __break(1u);
LABEL_202:
  __break(1u);
LABEL_203:
  if (v70 < 0)
    v134 = v70;
  else
    v134 = v70 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v70);
  v112 = _CocoaArrayWrapper.endIndex.getter(v134);
LABEL_163:
  v113 = (_QWORD *)0xEC0000004E4D4C50;
  v114 = 0x206B726F7774654ELL;
  if (v112)
  {
    if (v112 >= 1)
    {
      v181 = v9;
      for (i = 0; i != v112; ++i)
      {
        if ((v70 & 0xC000000000000001) != 0)
        {
          v116 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v70);
        }
        else
        {
          v116 = *(_QWORD *)(v70 + 8 * i + 32);
          swift_retain(v116);
        }
        v117 = *(_QWORD *)(v116 + 48);
        v118 = *(_QWORD *)(v116 + 56);
        v119 = v117 == 0x206B726F7774654ELL && v118 == 0xEC0000004E4D4C50;
        if (v119
          || (_stringCompareWithSmolCheck(_:_:expecting:)(v117, v118, 0x206B726F7774654ELL, 0xEC0000004E4D4C50, 0) & 1) != 0)
        {
          swift_release(v116);
        }
        else
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          v120 = *(_QWORD *)(v186 + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v120);
          v121 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v120, v116);
          specialized ContiguousArray._endMutation()(v121);
        }
      }
      swift_bridgeObjectRelease(v70);
      v122 = v186;
      v9 = v181;
      goto LABEL_179;
    }
LABEL_246:
    __break(1u);
LABEL_247:
    __break(1u);
LABEL_248:
    __break(1u);
LABEL_249:
    v9 = sub_1001C7A48(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
LABEL_239:
    v167 = *(_QWORD *)(v9 + 16);
    v166 = *(_QWORD *)(v9 + 24);
    if (v167 >= v166 >> 1)
      v9 = sub_1001C7A48(v166 > 1, v167 + 1, 1, v9);
    *(_QWORD *)(v9 + 16) = v167 + 1;
    sub_1001D9BB4(v172, v9+ ((*(unsigned __int8 *)(v177 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v177 + 80))+ *(_QWORD *)(v177 + 72) * v167);
    return;
  }
  swift_bridgeObjectRelease(v70);
  v122 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_179:
  swift_bridgeObjectRetain(v122);
  if ((v122 & 0x8000000000000000) != 0)
    goto LABEL_227;
  v123 = (_QWORD *)v122;
  if ((v122 & 0x4000000000000000) != 0)
    goto LABEL_227;
  while (2)
  {
    v186 = (unint64_t)v123;
    sub_1001D6708((uint64_t *)&v186, sub_10016F8DC);
    if (v23)
      goto LABEL_256;
    swift_release(v122);
    v124 = v186;
    v186 = (unint64_t)_swiftEmptyArrayStorage;
    if (v9)
    {
      if (v70 < 0)
        v135 = v70;
      else
        v135 = v70 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v70);
      v125 = _CocoaArrayWrapper.endIndex.getter(v135);
      if (!v125)
        goto LABEL_211;
LABEL_184:
      if (v125 < 1)
        goto LABEL_247;
      for (j = 0; j != v125; ++j)
      {
        if ((v70 & 0xC000000000000001) != 0)
        {
          v129 = specialized _ArrayBuffer._getElementSlowPath(_:)(j, v70);
        }
        else
        {
          v129 = *(_QWORD *)(v70 + 8 * j + 32);
          swift_retain(v129);
        }
        v130 = *(_QWORD *)(v129 + 48);
        v131 = *(_QWORD **)(v129 + 56);
        v132 = v130 == v114 && v131 == v113;
        if (v132
          || (_stringCompareWithSmolCheck(_:_:expecting:)(v130, v131, 0x206B726F7774654ELL, 0xEC0000004E4D4C50, 0) & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          v127 = *(_QWORD *)(v186 + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v127);
          v128 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v127, v129);
          specialized ContiguousArray._endMutation()(v128);
        }
        else
        {
          swift_release(v129);
        }
      }
      swift_bridgeObjectRelease(v70);
      v133 = (_QWORD *)v186;
    }
    else
    {
      v125 = *(_QWORD *)((v70 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v70);
      if (v125)
        goto LABEL_184;
LABEL_211:
      swift_bridgeObjectRelease(v70);
      v133 = _swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease(v70);
    v186 = v124;
    sub_1001DAE28((uint64_t)v133);
    v136 = v186;
    v189 = v186;
    v9 = (unint64_t)v170;
    if (!(v186 >> 62))
    {
      v23 = *(_QWORD *)((v186 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v23)
        break;
      goto LABEL_214;
    }
    if ((v186 & 0x8000000000000000) != 0)
      v152 = v186;
    else
      v152 = v186 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v186);
    v23 = _CocoaArrayWrapper.endIndex.getter(v152);
    swift_bridgeObjectRelease(v136);
    if (v23)
    {
LABEL_214:
      if (v23 < 1)
        goto LABEL_248;
      v137 = 0;
      v181 = v136 & 0xC000000000000001;
      v179 = (_QWORD *)v136;
      while (1)
      {
        v70 = v9;
        if (v181)
        {
          v113 = (_QWORD *)specialized _ArrayBuffer._getElementSlowPath(_:)(v137, v136);
        }
        else
        {
          v113 = *(_QWORD **)(v136 + 8 * v137 + 32);
          swift_retain(v113);
        }
        v138 = (_QWORD *)v113[7];
        v186 = v113[6];
        v187 = v138;
        swift_bridgeObjectRetain(v138);
        v139._countAndFlagsBits = 58;
        v139._object = (void *)0xE100000000000000;
        String.append(_:)(v139);
        v114 = v186;
        v140 = v187;
        v142 = v113[12];
        v141 = v113[13];
        v143 = swift_bridgeObjectRetain(v141);
        v144 = v180;
        UUID.init()(v143);
        v145 = v176;
        v146 = (_QWORD *)(v144 + *(int *)(v176 + 32));
        *(_QWORD *)(v144 + *(int *)(v176 + 20)) = v137 + 2;
        v147 = (unint64_t *)(v144 + *(int *)(v145 + 24));
        *v147 = v114;
        v147[1] = (unint64_t)v140;
        v148 = (_QWORD *)(v144 + *(int *)(v145 + 28));
        *v148 = v142;
        v148[1] = v141;
        *v146 = 0;
        v146[1] = 0;
        v9 = v70;
        if ((swift_isUniquelyReferenced_nonNull_native(v70) & 1) == 0)
          v9 = sub_1001C7A48(0, *(_QWORD *)(v70 + 16) + 1, 1, v70);
        v150 = *(_QWORD *)(v9 + 16);
        v149 = *(_QWORD *)(v9 + 24);
        v122 = v150 + 1;
        if (v150 >= v149 >> 1)
          v9 = sub_1001C7A48(v149 > 1, v150 + 1, 1, v9);
        *(_QWORD *)(v9 + 16) = v122;
        sub_1001D9BB4(v180, v9+ ((*(unsigned __int8 *)(v177 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v177 + 80))+ *(_QWORD *)(v177 + 72) * v150);
        swift_release(v113);
        if (v137 == 0x7FFFFFFFFFFFFFFDLL)
          break;
        ++v137;
        v136 = (uint64_t)v179;
        if (v23 == v137)
        {
          v151 = v137 + 2;
          goto LABEL_233;
        }
      }
      __break(1u);
LABEL_227:
      v123 = sub_1001956CC(v122);
      swift_release(v122);
      continue;
    }
    break;
  }
  v151 = 2;
LABEL_233:
  swift_bridgeObjectRelease(v136);
  v153 = qword_1002BF068;
  swift_beginAccess(qword_1002BF068 + 80, &v186, 0, 0);
  v154 = *(_QWORD *)(v153 + 80);
  v155 = *(_QWORD *)(v154 + 16);
  if (v155)
  {
    if ((*(_BYTE *)(v153 + 152) & 1) != 0)
    {
      LODWORD(v156) = 0;
      goto LABEL_237;
    }
    v156 = *(int *)(v153 + 148);
    if ((uint64_t)v155 <= v156)
    {
      v156 = v155 - 1;
      if (v155 - 1 < v155)
        goto LABEL_238;
    }
    else
    {
LABEL_237:
      v156 = (int)v156;
      if ((int)v156 < v155)
      {
LABEL_238:
        v157 = v154 + 88 * v156;
        v159 = *(_QWORD *)(v157 + 80);
        v158 = *(_QWORD *)(v157 + 88);
        v160 = swift_bridgeObjectRetain(v158);
        v161 = v172;
        UUID.init()(v160);
        v162 = v176;
        v163 = (_QWORD *)(v161 + *(int *)(v176 + 32));
        *(_QWORD *)(v161 + *(int *)(v176 + 20)) = v151;
        v164 = v161 + *(int *)(v162 + 24);
        strcpy((char *)v164, "Phone Number:");
        *(_WORD *)(v164 + 14) = -4864;
        v165 = (_QWORD *)(v161 + *(int *)(v162 + 28));
        *v165 = v159;
        v165[1] = v158;
        *v163 = 0;
        v163[1] = 0;
        if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
          goto LABEL_249;
        goto LABEL_239;
      }
    }
    __break(1u);
    goto LABEL_245;
  }
}

uint64_t sub_1001D96BC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001D96E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1001D73E4(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_1001D96E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B7DE0;
  if (!qword_1002B7DE0)
  {
    v1 = type metadata accessor for FTMCellMonitorHardwareDetailModel(255);
    result = swift_getWitnessTable(&unk_100240578, v1);
    atomic_store(result, (unint64_t *)&qword_1002B7DE0);
  }
  return result;
}

double sub_1001D9730(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[22] = 0u;
  a1[23] = 0u;
  a1[20] = 0u;
  a1[21] = 0u;
  a1[18] = 0u;
  a1[19] = 0u;
  a1[16] = 0u;
  a1[17] = 0u;
  a1[14] = 0u;
  a1[15] = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 377) = 0u;
  return result;
}

uint64_t sub_1001D9770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44)
{
  uint64_t result;

  if (a7)
  {
    sub_10014BE1C(a4, a5, a6 & 1);
    swift_bridgeObjectRetain(a7);
    sub_10014BE1C(a16, a17, a18 & 1);
    swift_bridgeObjectRetain(a19);
    sub_10014BE1C(a29, a30, a31 & 1);
    swift_bridgeObjectRetain(a32);
    sub_10014BE1C(a41, a42, a43 & 1);
    return swift_bridgeObjectRetain(a44);
  }
  return result;
}

uint64_t sub_1001D9848(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;

  v13 = *(_BYTE *)(a1 + 392);
  v11 = *(_OWORD *)(a1 + 352);
  v12 = *(_OWORD *)(a1 + 368);
  v9 = *(_OWORD *)(a1 + 320);
  v10 = *(_OWORD *)(a1 + 336);
  v7 = *(_OWORD *)(a1 + 288);
  v8 = *(_OWORD *)(a1 + 304);
  v5 = *(_OWORD *)(a1 + 256);
  v6 = *(_OWORD *)(a1 + 272);
  v4 = *(_OWORD *)(a1 + 224);
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
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
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
    v12,
    *((_QWORD *)&v12 + 1),
    *(_QWORD *)(a1 + 384),
    v13);
  return a1;
}

uint64_t sub_1001D98EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44)
{
  uint64_t result;

  if (a7)
  {
    sub_10014BE2C(a4, a5, a6 & 1);
    swift_bridgeObjectRelease(a7);
    sub_10014BE2C(a16, a17, a18 & 1);
    swift_bridgeObjectRelease(a19);
    sub_10014BE2C(a29, a30, a31 & 1);
    swift_bridgeObjectRelease(a32);
    sub_10014BE2C(a41, a42, a43 & 1);
    return swift_bridgeObjectRelease(a44);
  }
  return result;
}

uint64_t sub_1001D99C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 104);
  v3 = *(_QWORD *)(a1 + 128);
  v7 = *(_QWORD *)(a1 + 120);
  v4 = *(_QWORD *)(a1 + 136);
  v5 = *(_QWORD *)(a1 + 144);
  sub_10014BE1C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain(v2);
  sub_1001D9A8C(v9, v8, v7, v3, v4, v5);
  return a1;
}

uint64_t sub_1001D9A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  sub_10014BE1C(a3, a4, a5 & 1);
  return swift_bridgeObjectRetain(a6);
}

uint64_t sub_1001D9ABC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 104);
  v3 = *(_QWORD *)(a1 + 128);
  v7 = *(_QWORD *)(a1 + 120);
  v4 = *(_QWORD *)(a1 + 136);
  v5 = *(_QWORD *)(a1 + 144);
  sub_10014BE2C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease(v2);
  sub_1001D9B84(v9, v8, v7, v3, v4, v5);
  return a1;
}

uint64_t sub_1001D9B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  sub_10014BE2C(a3, a4, a5 & 1);
  return swift_bridgeObjectRelease(a6);
}

uint64_t sub_1001D9BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FTMCellMonitorHardwareDetailModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1001D9BFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B7E18;
  if (!qword_1002B7E18)
  {
    v1 = sub_1001464C4(&qword_1002B7E20);
    sub_100152F10();
    sub_10014BEC0(&qword_1002B7DA8, &qword_1002B7D90, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1002B7E18);
  }
  return result;
}

uint64_t sub_1001D9C84(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  v17 = a4;
  v8 = sub_100146438(&qword_1002B7E40);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_100146508(a1, v12);
  v14 = sub_1001DA28C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for Genre.CodingKeys, &type metadata for Genre.CodingKeys, v14, v12, v13);
  v19 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v19, v8);
  if (!v4)
  {
    v18 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(a3, v17, &v18, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

BOOL sub_1001D9DAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1001D9DC4()
{
  _BYTE *v0;

  if (*v0)
    return 1701667182;
  else
    return 25705;
}

uint64_t sub_1001D9DEC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1001DA070(a1, a2);
  *a3 = result;
  return result;
}

void sub_1001D9E10(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1001D9E1C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001DA28C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001D9E44(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001DA28C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001D9E6C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*a1 != *a2)
    return 0;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a2[1];
  v7 = a2[2];
  if (v4 == v6 && v5 == v7)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v6, v7, 0);
}

Swift::Int sub_1001D9EB4()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;
  Swift::UInt64 v2;
  Swift::UInt64 v3;
  _QWORD v5[9];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  Hasher.init(_seed:)(v5, 0);
  Hasher._combine(_:)(v1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_1001D9F24(uint64_t a1)
{
  Swift::UInt64 *v1;
  Swift::UInt64 v3;
  Swift::UInt64 v4;

  v3 = v1[1];
  v4 = v1[2];
  Hasher._combine(_:)(*v1);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_1001D9F74(uint64_t a1)
{
  Swift::UInt64 *v1;
  Swift::UInt64 v2;
  Swift::UInt64 v3;
  Swift::UInt64 v4;
  _QWORD v6[9];

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  Hasher.init(_seed:)(v6, a1);
  Hasher._combine(_:)(v2);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_1001D9FE0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_1001DA138(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1001DA00C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_1001D9C84(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_1001DA02C()
{
  unint64_t result;

  result = qword_1002B7E28;
  if (!qword_1002B7E28)
  {
    result = swift_getWitnessTable(&unk_1002449B0, &type metadata for Genre);
    atomic_store(result, (unint64_t *)&qword_1002B7E28);
  }
  return result;
}

uint64_t sub_1001DA070(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    v5 = 0xE200000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(25705, 0xE200000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease(0xE400000000000000);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(1701667182, 0xE400000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1001DA138(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  char v12;
  char v13;

  v3 = sub_100146438(&qword_1002B7E30);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_100146508(a1, v7);
  v9 = sub_1001DA28C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for Genre.CodingKeys, &type metadata for Genre.CodingKeys, v9, v7, v8);
  if (!v1)
  {
    v13 = 0;
    v7 = KeyedDecodingContainer.decode(_:forKey:)(&v13, v3);
    v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v12, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_10014652C(a1);
  return v7;
}

unint64_t sub_1001DA28C()
{
  unint64_t result;

  result = qword_1002B7E38;
  if (!qword_1002B7E38)
  {
    result = swift_getWitnessTable(&unk_100244ADC, &type metadata for Genre.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7E38);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Genre.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001DA31C + 4 * byte_100244919[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1001DA350 + 4 * byte_100244914[v4]))();
}

uint64_t sub_1001DA350(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001DA358(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001DA360);
  return result;
}

uint64_t sub_1001DA36C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001DA374);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1001DA378(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001DA380(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Genre.CodingKeys()
{
  return &type metadata for Genre.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for Genre(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for Genre(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

_QWORD *assignWithCopy for Genre(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  v3 = a2[2];
  v4 = a1[2];
  a1[2] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for Genre(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for Genre(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Genre(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Genre()
{
  return &type metadata for Genre;
}

void *sub_1001DA4F0()
{
  return &protocol witness table for UInt64;
}

unint64_t sub_1001DA500()
{
  unint64_t result;

  result = qword_1002B7E48;
  if (!qword_1002B7E48)
  {
    result = swift_getWitnessTable(&unk_100244AB4, &type metadata for Genre.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7E48);
  }
  return result;
}

unint64_t sub_1001DA548()
{
  unint64_t result;

  result = qword_1002B7E50;
  if (!qword_1002B7E50)
  {
    result = swift_getWitnessTable(&unk_100244A24, &type metadata for Genre.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7E50);
  }
  return result;
}

unint64_t sub_1001DA590()
{
  unint64_t result;

  result = qword_1002B7E58;
  if (!qword_1002B7E58)
  {
    result = swift_getWitnessTable(&unk_100244A4C, &type metadata for Genre.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B7E58);
  }
  return result;
}

uint64_t sub_1001DA5D8(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;
  char v26;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_1001C7104(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = type metadata accessor for Metric(0);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy(v15);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v26 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v26, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001DA74C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;
  char v16;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = (_QWORD *)*v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1001C7224(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[11 * v8 + 4];
  if (a1 + 32 < v9 + 88 * v2 && v9 < a1 + 32 + 88 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy(v9);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v16 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v16, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001DA8A4(uint64_t a1)
{
  return sub_1001DAE34(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_1001E09F8);
}

void sub_1001DA8B0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  int64_t v30;
  _QWORD *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  _OWORD *v38;
  __int128 v39;
  __int128 v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  _OWORD v47[3];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54[2];
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = (_QWORD *)*v2;
  v5 = *(_QWORD *)(*v2 + 16);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = a1;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v2);
  *v2 = v4;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_1001C77F0(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    *v2 = v4;
    v9 = v4[3] >> 1;
  }
  v11 = v4[2];
  v12 = v9 - v11;
  v13 = sub_1001983D8(v54, &v4[6 * v11 + 4], v9 - v11, v7);
  if ((uint64_t)v13 < v3)
    goto LABEL_15;
  if (v13)
  {
    v14 = v4[2];
    v15 = __OFADD__(v14, v13);
    v16 = (char *)v13 + v14;
    if (v15)
    {
      __break(1u);
LABEL_20:
      v23 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
      }
      else
      {
        v19 = v55;
        v24 = (unint64_t)(v55 + 64) >> 6;
        v3 = v7;
        if (v23 >= v24)
          goto LABEL_41;
        v25 = *(_QWORD *)(v45 + 8 * v23);
        if (v25)
        {
LABEL_23:
          v17 = (v25 - 1) & v25;
          v18 = __clz(__rbit64(v25)) + (v23 << 6);
          v7 = v23;
          goto LABEL_18;
        }
        v26 = v7 + 2;
        v3 = v7 + 1;
        if (v7 + 2 >= v24)
          goto LABEL_41;
        v1 = v55;
        v25 = *(_QWORD *)(v45 + 8 * v26);
        if (v25)
        {
LABEL_26:
          v23 = v26;
LABEL_27:
          v19 = v55;
          goto LABEL_23;
        }
        v3 = v7 + 2;
        if (v7 + 3 >= v24)
          goto LABEL_41;
        v25 = *(_QWORD *)(v45 + 8 * (v7 + 3));
        if (v25)
        {
          v23 = v7 + 3;
          goto LABEL_27;
        }
        v26 = v7 + 4;
        v3 = v7 + 3;
        v19 = v55;
        if (v7 + 4 >= v24)
          goto LABEL_41;
        v25 = *(_QWORD *)(v45 + 8 * v26);
        if (v25)
          goto LABEL_26;
        v23 = v7 + 5;
        v3 = v7 + 4;
        v19 = v55;
        if (v7 + 5 >= v24)
        {
LABEL_41:
          v17 = 0;
          v52 = 0u;
          v53 = 0u;
          v51 = 0u;
          goto LABEL_42;
        }
        v25 = *(_QWORD *)(v45 + 8 * v23);
        if (v25)
          goto LABEL_23;
        v3 = v24 - 1;
        v27 = v7 + 6;
        while (v24 != v27)
        {
          v25 = *(_QWORD *)(v45 + 8 * v27++);
          if (v25)
          {
            v23 = v27 - 1;
            goto LABEL_27;
          }
        }
      }
      v19 = v1;
      goto LABEL_41;
    }
    v4[2] = v16;
  }
  if (v13 != (_QWORD *)v12)
  {
    sub_100199AE8(v54[0]);
    return;
  }
LABEL_16:
  v12 = v4[2];
  v4 = (_QWORD *)v54[0];
  v45 = v54[1];
  v7 = v56;
  if (!v57)
    goto LABEL_20;
  v17 = (v57 - 1) & v57;
  v18 = __clz(__rbit64(v57)) | (v56 << 6);
  v19 = v55;
LABEL_18:
  v20 = (uint64_t *)(v4[6] + 16 * v18);
  v22 = *v20;
  v21 = v20[1];
  sub_10017E2BC(v4[7] + 32 * v18, (uint64_t)&v52);
  *(_QWORD *)&v51 = v22;
  *((_QWORD *)&v51 + 1) = v21;
  swift_bridgeObjectRetain(v21);
  v3 = v7;
LABEL_42:
  sub_1001E15A8((uint64_t)&v51, (uint64_t)&v48);
  if (!*((_QWORD *)&v48 + 1))
  {
LABEL_80:
    sub_10014BDE0((uint64_t)&v51, &qword_1002B5690);
    sub_100199AE8((uint64_t)v4);
    sub_10014BDE0((uint64_t)&v48, &qword_1002B5690);
    return;
  }
  v46 = (unint64_t)(v19 + 64) >> 6;
  while (1)
  {
    sub_10014BDE0((uint64_t)&v48, &qword_1002B5690);
    v28 = (_QWORD *)*v2;
    v29 = *(_QWORD *)(*v2 + 24);
    v30 = v29 >> 1;
    if ((uint64_t)(v29 >> 1) < v12 + 1)
    {
      v28 = sub_1001C77F0((_QWORD *)(v29 > 1), v12 + 1, 1, (_QWORD *)*v2);
      *v2 = v28;
      v30 = v28[3] >> 1;
    }
    sub_1001E15A8((uint64_t)&v51, (uint64_t)v47);
    if (*((_QWORD *)&v47[0] + 1))
      break;
    v37 = v3;
LABEL_79:
    sub_10014BDE0((uint64_t)v47, &qword_1002B5690);
    v3 = v37;
    v30 = v12;
LABEL_45:
    *(_QWORD *)(*v2 + 16) = v30;
    sub_1001E15A8((uint64_t)&v51, (uint64_t)&v48);
    if (!*((_QWORD *)&v48 + 1))
      goto LABEL_80;
  }
  v31 = v28 + 4;
  if (v12 > v30)
    v30 = v12;
  while (1)
  {
    v48 = v47[0];
    v49 = v47[1];
    v50 = v47[2];
    if (v12 == v30)
    {
      sub_10014BDE0((uint64_t)&v48, (uint64_t *)&unk_1002B56A0);
      v12 = v30;
      goto LABEL_45;
    }
    sub_10014BDE0((uint64_t)&v51, &qword_1002B5690);
    v38 = &v31[6 * v12];
    v40 = v49;
    v39 = v50;
    *v38 = v48;
    v38[1] = v40;
    v38[2] = v39;
    if (!v17)
      break;
    v32 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    v33 = v32 | (v3 << 6);
LABEL_53:
    v34 = (uint64_t *)(v4[6] + 16 * v33);
    v35 = *v34;
    v36 = v34[1];
    sub_10017E2BC(v4[7] + 32 * v33, (uint64_t)&v52);
    *(_QWORD *)&v51 = v35;
    *((_QWORD *)&v51 + 1) = v36;
    swift_bridgeObjectRetain(v36);
    v37 = v3;
LABEL_54:
    ++v12;
    sub_1001E15A8((uint64_t)&v51, (uint64_t)v47);
    if (!*((_QWORD *)&v47[0] + 1))
      goto LABEL_79;
  }
  v41 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v41 >= v46)
    {
      v37 = v3;
LABEL_62:
      v17 = 0;
      v52 = 0u;
      v53 = 0u;
      v3 = v37;
      v51 = 0u;
      goto LABEL_54;
    }
    v42 = *(_QWORD *)(v45 + 8 * v41);
    if (v42)
      goto LABEL_60;
    v43 = v3 + 2;
    v37 = v3 + 1;
    if (v3 + 2 >= v46)
      goto LABEL_62;
    v42 = *(_QWORD *)(v45 + 8 * v43);
    if (!v42)
    {
      v37 = v3 + 2;
      if (v3 + 3 >= v46)
        goto LABEL_62;
      v42 = *(_QWORD *)(v45 + 8 * (v3 + 3));
      if (v42)
      {
        v41 = v3 + 3;
        goto LABEL_60;
      }
      v43 = v3 + 4;
      v37 = v3 + 3;
      if (v3 + 4 >= v46)
        goto LABEL_62;
      v42 = *(_QWORD *)(v45 + 8 * v43);
      if (!v42)
      {
        v41 = v3 + 5;
        v37 = v3 + 4;
        if (v3 + 5 >= v46)
          goto LABEL_62;
        v42 = *(_QWORD *)(v45 + 8 * v41);
        if (!v42)
        {
          v44 = v3 + 6;
          while (v46 != v44)
          {
            v42 = *(_QWORD *)(v45 + 8 * v44++);
            if (v42)
            {
              v41 = v44 - 1;
              goto LABEL_60;
            }
          }
          v37 = v46 - 1;
          goto LABEL_62;
        }
        goto LABEL_60;
      }
    }
    v41 = v43;
LABEL_60:
    v17 = (v42 - 1) & v42;
    v33 = __clz(__rbit64(v42)) + (v41 << 6);
    v3 = v41;
    goto LABEL_53;
  }
  __break(1u);
}

uint64_t sub_1001DAE28(uint64_t a1)
{
  return sub_1001DAE34(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_1001E07EC);
}

uint64_t sub_1001DAE34(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, uint64_t))
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v5 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v6 < 0)
    v19 = *v2;
  else
    v19 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v2);
  v7 = _CocoaArrayWrapper.endIndex.getter(v19);
  swift_bridgeObjectRelease(v6);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_29;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if ((unint64_t)v6 >> 62)
    goto LABEL_31;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain(v6);
    v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v7, v11, 1, v6);
    swift_bridgeObjectRelease(*v2);
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v6 < 0)
      v20 = v6;
    else
      v20 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v6);
    v11 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v6);
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
    v17 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_1001DAFF0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1001E0C14(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

void sub_1001DB1A8()
{
  qword_1002BF158 = 0x402C000000000000;
}

void sub_1001DB1B8()
{
  qword_1002BF160 = 0x4034000000000000;
}

id sub_1001DB1C8()
{
  uint64_t v0;
  id v1;
  id v2;

  v0 = type metadata accessor for CellularLoggingViewController();
  v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0)), "init");
  v2 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v1);

  return v2;
}

uint64_t sub_1001DB230(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

uint64_t sub_1001DB268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1001E1610();
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1001DB2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1001E1610();
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1001DB308(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001E1610();
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

void *sub_1001DB32C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData, a1, 33, 0);
  return &j__swift_endAccess;
}

id sub_1001DB374()
{
  return sub_1001DB7D4(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___tableView, (uint64_t (*)(uint64_t))sub_1001DB388);
}

id sub_1001DB388(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  void *v5;
  NSString v6;
  void *v7;
  id v8;
  id v9;
  id result;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double Width;
  id v27;
  CGRect v28;

  v2 = objc_msgSend(objc_allocWithZone((Class)UITableView), "initWithFrame:style:", 0, 0.0, 0.0, 0.0, 0.0);
  v3 = type metadata accessor for FavoritesTableCellV2();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v3);
  v5 = off_1002B4BF8;
  swift_bridgeObjectRetain(off_1002B4BF8);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  objc_msgSend(v2, "registerClass:forCellReuseIdentifier:", ObjCClassFromMetadata, v6);

  objc_msgSend(v2, "setSeparatorStyle:", 0);
  v7 = (void *)objc_opt_self(UIColor);
  v8 = v2;
  v9 = objc_msgSend(v7, "systemBackgroundColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v8, "setDataSource:", a1);
  objc_msgSend(v8, "setDelegate:", a1);
  objc_msgSend(v8, "setAlwaysBounceVertical:", 1);
  result = objc_msgSend(a1, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v11 = result;
  objc_msgSend(result, "frame");
  v13 = v12;

  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v14 = result;
  objc_msgSend(result, "frame");
  v16 = v15;

  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v17 = result;
  objc_msgSend(result, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v28.origin.x = v19;
  v28.origin.y = v21;
  v28.size.width = v23;
  v28.size.height = v25;
  Width = CGRectGetWidth(v28);
  if (qword_1002B3AC8 != -1)
    swift_once(&qword_1002B3AC8, sub_1001DB1A8);
  v27 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", v13, v16, Width, *(double *)&qword_1002BF158);
  objc_msgSend(v8, "setTableHeaderView:", v27);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v8;
}

id sub_1001DB63C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "lightGrayColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_1001DB700()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView);
  }
  else
  {
    v4 = v0;
    v5 = objc_allocWithZone((Class)type metadata accessor for LoadingView());
    v6 = sub_10017FB00(0xD000000000000020, 0x80000001002163C0, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setHidden:", 0);
    v7 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

id sub_1001DB7C0()
{
  return sub_1001DB7D4(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton, (uint64_t (*)(uint64_t))sub_1001DB830);
}

id sub_1001DB7D4(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2(v2);
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_1001DB830(uint64_t a1)
{
  id v2;
  NSString v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(objc_allocWithZone((Class)UIButton), "init");
  objc_msgSend(v2, "setClipsToBounds:", 1);
  v3 = String._bridgeToObjectiveC()();
  v4 = (void *)objc_opt_self(UIColor);
  v5 = objc_msgSend(v4, "colorNamed:", v3);

  objc_msgSend(v2, "setTitleColor:forState:", v5, 0);
  v6 = objc_msgSend(v4, "grayColor");
  v7 = sub_1001E10A8(0xD000000000000013, 0x80000001002130B0, 0x746C7561666544, (void *)0xE700000000000000, (uint64_t)v6);

  objc_msgSend(v2, "setAttributedTitle:forState:", v7, 0);
  v8 = objc_msgSend(v2, "titleLabel");
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:", 18.0);
    objc_msgSend(v9, "setFont:", v10);

  }
  objc_msgSend(v2, "addTarget:action:forControlEvents:", a1, "didTapConfig", 1);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  return v2;
}

id sub_1001DB9FC()
{
  return sub_1001DBA1C(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___startButton, 0x7472617453, &selRef_didTapStart);
}

id sub_1001DBA1C(uint64_t *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *a1;
  v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    v6 = *(id *)(v3 + *a1);
  }
  else
  {
    v7 = sub_1001DBA98(v3, a2, a3);
    v8 = *(void **)(v3 + v4);
    *(_QWORD *)(v3 + v4) = v7;
    v6 = v7;

    v5 = 0;
  }
  v9 = v5;
  return v6;
}

id sub_1001DBA78()
{
  return sub_1001DBA1C(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___resetButton, 0x7465736552, &selRef_didTapReset);
}

id sub_1001DBA98(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  NSString v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSString v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSString v17;
  id v18;
  id v19;

  v5 = objc_msgSend(objc_allocWithZone((Class)UIButton), "init");
  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  v7 = objc_msgSend(v5, "titleLabel");
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_opt_self(UIFont);
    if (qword_1002B3AD0 != -1)
      swift_once(&qword_1002B3AD0, sub_1001DB1B8);
    v10 = objc_msgSend(v9, "systemFontOfSize:weight:", *(double *)&qword_1002BF160, UIFontWeightRegular);
    objc_msgSend(v8, "setFont:", v10);

  }
  v11 = String._bridgeToObjectiveC()();
  v12 = (void *)objc_opt_self(UIColor);
  v13 = objc_msgSend(v12, "colorNamed:", v11);

  objc_msgSend(v5, "setTitleColor:forState:", v13, 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", a1, *a3, 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = objc_msgSend(v5, "layer");
  objc_msgSend(v14, "setCornerRadius:", 12.0);

  v15 = objc_msgSend(v5, "layer");
  objc_msgSend(v15, "setBorderWidth:", 1.0);

  objc_msgSend(v5, "setClipsToBounds:", 1);
  v16 = objc_msgSend(v5, "layer");
  v17 = String._bridgeToObjectiveC()();
  v18 = objc_msgSend(v12, "colorNamed:", v17);

  if (v18)
  {
    v19 = objc_msgSend(v18, "CGColor");

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v16, "setBorderColor:", v19);

  return v5;
}

id sub_1001DBD70()
{
  return sub_1001DB7D4(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___stopButton, (uint64_t (*)(uint64_t))sub_1001DBD84);
}

id sub_1001DBD84(uint64_t a1)
{
  id v2;
  NSString v3;
  NSString v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSString v14;
  id v15;
  id v16;

  v2 = objc_msgSend(objc_allocWithZone((Class)UIButton), "init");
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setTitle:forState:", v3, 0);

  v4 = String._bridgeToObjectiveC()();
  v5 = (void *)objc_opt_self(UIColor);
  v6 = objc_msgSend(v5, "colorNamed:", v4);

  objc_msgSend(v2, "setTitleColor:forState:", v6, 0);
  v7 = objc_msgSend(v2, "titleLabel");
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_opt_self(UIFont);
    if (qword_1002B3AD0 != -1)
      swift_once(&qword_1002B3AD0, sub_1001DB1B8);
    v10 = objc_msgSend(v9, "systemFontOfSize:weight:", *(double *)&qword_1002BF160, UIFontWeightRegular);
    objc_msgSend(v8, "setFont:", v10);

  }
  objc_msgSend(v2, "addTarget:action:forControlEvents:", a1, "didTapStop", 1);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = objc_msgSend(v2, "layer");
  objc_msgSend(v11, "setCornerRadius:", 12.0);

  v12 = objc_msgSend(v2, "layer");
  objc_msgSend(v12, "setBorderWidth:", 1.0);

  objc_msgSend(v2, "setClipsToBounds:", 1);
  v13 = objc_msgSend(v2, "layer");
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v5, "colorNamed:", v14);

  if (v15)
  {
    v16 = objc_msgSend(v15, "CGColor");

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v13, "setBorderColor:", v16);

  return v2;
}

id sub_1001DC054()
{
  return sub_1001DC074(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider, &selRef_didChangedChunkFileSliderValue_, 1024.0, 32.0);
}

id sub_1001DC074(uint64_t *a1, _QWORD *a2, float a3, float a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *a1;
  v6 = *(void **)(v4 + *a1);
  if (v6)
  {
    v7 = *(id *)(v4 + *a1);
  }
  else
  {
    v8 = sub_1001DC174(v4, a2, a3, a4);
    v9 = *(void **)(v4 + v5);
    *(_QWORD *)(v4 + v5) = v8;
    v7 = v8;

    v6 = 0;
  }
  v10 = v6;
  return v7;
}

id sub_1001DC0D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel);
  }
  else
  {
    v4 = sub_1001E11DC(0xD000000000000010, 0x8000000100216510, 0x624D20323320, (void *)0xE600000000000000);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1001DC154()
{
  return sub_1001DC074(&OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider, &selRef_didChangedMaxLogsSlider_, 8192.0, 256.0);
}

id sub_1001DC174(uint64_t a1, _QWORD *a2, float a3, float a4)
{
  id v8;
  NSString v9;
  void *v10;
  id v11;
  NSString v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;

  v8 = objc_msgSend(objc_allocWithZone((Class)UISlider), "init");
  v9 = String._bridgeToObjectiveC()();
  v10 = (void *)objc_opt_self(UIColor);
  v11 = objc_msgSend(v10, "colorNamed:", v9);

  objc_msgSend(v8, "setMinimumTrackTintColor:", v11);
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v10, "colorNamed:", v12);

  objc_msgSend(v8, "setMaximumTrackTintColor:", v13);
  v14 = objc_msgSend(v10, "whiteColor");
  objc_msgSend(v8, "setThumbTintColor:", v14);

  *(float *)&v15 = a3;
  objc_msgSend(v8, "setMaximumValue:", v15);
  *(float *)&v16 = a4;
  objc_msgSend(v8, "setMinimumValue:", v16);
  *(float *)&v17 = a4;
  objc_msgSend(v8, "setValue:animated:", 1, v17);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", a1, *a2, 4096);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v8;
}

id sub_1001DC330()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel);
  }
  else
  {
    v4 = sub_1001E11DC(0x20676F6C2078614DLL, 0xED00003A656C6966, 0x6C69662036353220, (void *)0xEA00000000007365);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_1001DC3C4()
{
  char *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  v1 = objc_msgSendSuper2(&v12, "viewDidLoad");
  if (qword_1002B39E0 != -1)
    v1 = (id)swift_once(&qword_1002B39E0, sub_100174664);
  v5 = qword_1002BEFD0;
  v6 = static os_log_type_t.default.getter(v1, v2, v3, v4);
  os_log(_:dso:log:type:_:)("CellularLoggingViewController - viewDidLoad", 43, 2, &_mh_execute_header, v5, v6, _swiftEmptyArrayStorage);
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "setTitle:", v7);

  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CellularLoggingService()), "init");
  v9 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService;
  v10 = *(void **)&v0[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService];
  *(_QWORD *)&v0[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService] = v8;

  v11 = *(_QWORD *)&v0[v9];
  if (v11)
  {
    *(_QWORD *)(v11 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate + 8) = &off_100267A38;
    swift_unknownObjectWeakAssign();
  }
  sub_1001DDED0();
}

uint64_t sub_1001DC524()
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  char isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
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
  _QWORD aBlock[5];
  uint64_t v56;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v54 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v52 = *(_QWORD *)(v5 - 8);
  v53 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = type metadata accessor for DispatchTime(0);
  v8 = *(_QWORD *)(v51 - 8);
  v9 = __chkstk_darwin(v51);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v47 - v12;
  v15 = sub_1001DB32C((uint64_t)aBlock);
  v16 = *v14;
  if (!*v14)
  {
    ((void (*)(_QWORD *, _QWORD))v15)(aBlock, 0);
    goto LABEL_12;
  }
  v17 = v14;
  v49 = v8;
  if ((unint64_t)v16 >> 62
    || (isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(v16),
        v16 = *v17,
        (isUniquelyReferenced_nonNull_bridgeObject & 1) == 0))
  {
    if ((unint64_t)v16 >> 62)
    {
      if (v16 < 0)
        v45 = v16;
      else
        v45 = v16 & 0xFFFFFFFFFFFFFF8;
      v48 = v45;
      swift_bridgeObjectRetain(v16);
      v20 = _CocoaArrayWrapper.endIndex.getter(v45);
      result = _CocoaArrayWrapper.endIndex.getter(v48);
      if (result < 0)
        goto LABEL_27;
      v48 = _CocoaArrayWrapper.endIndex.getter(v48);
      swift_bridgeObjectRelease(v16);
      if (v20 < 0 || v48 < v20)
      {
        __break(1u);
        goto LABEL_22;
      }
    }
    else
    {
      v20 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1;
    }
    v21 = sub_100196AE4(0, v20);
    v22 = *v17;
    *v17 = (uint64_t)v21;
    swift_bridgeObjectRelease(v22);
    goto LABEL_10;
  }
  if ((unint64_t)v16 >> 62)
  {
LABEL_22:
    if (v16 < 0)
      v46 = v16;
    else
      v46 = v16 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v16);
    v19 = _CocoaArrayWrapper.endIndex.getter(v46);
    result = swift_bridgeObjectRelease(v16);
    if ((v19 & 0x8000000000000000) == 0)
      goto LABEL_6;
    __break(1u);
LABEL_27:
    __break(1u);
    return result;
  }
  v19 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_6:
  sub_100199AF0(0, v19);
LABEL_10:
  ((void (*)(_QWORD *, _QWORD))v15)(aBlock, 0);
  v8 = v49;
LABEL_12:
  v50 = v2;
  v23 = sub_1001DB374();
  objc_msgSend(v23, "reloadData");

  v24 = sub_1001DB9FC();
  sub_10016ADB4();

  if (qword_1002B39E0 != -1)
    v25 = swift_once(&qword_1002B39E0, sub_100174664);
  v29 = qword_1002BEFD0;
  v30 = static os_log_type_t.default.getter(v25, v26, v27, v28);
  os_log(_:dso:log:type:_:)("CellularLoggingViewController - didTapStart", 43, 2, &_mh_execute_header, v29, v30, _swiftEmptyArrayStorage);
  v31 = sub_1001548C8(0, (unint64_t *)&qword_1002B55E0, OS_dispatch_queue_ptr);
  v32 = (void *)static OS_dispatch_queue.main.getter(v31);
  static DispatchTime.now()();
  + infix(_:_:)(v11, 0.3);
  v33 = *(void (**)(char *, uint64_t))(v8 + 8);
  v34 = v11;
  v35 = v51;
  v33(v34, v51);
  v36 = swift_allocObject(&unk_100267A78, 24, 7);
  swift_unknownObjectWeakInit(v36 + 16, v1);
  aBlock[4] = sub_1001E15A0;
  v56 = v36;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001BE428;
  aBlock[3] = &unk_100267AE0;
  v37 = _Block_copy(aBlock);
  swift_release(v56);
  static DispatchQoS.unspecified.getter(v38);
  aBlock[0] = _swiftEmptyArrayStorage;
  v39 = sub_10017CF34();
  v40 = sub_100146438((uint64_t *)&unk_1002B55F0);
  v41 = sub_10014BEC0((unint64_t *)&qword_1002B6540, (uint64_t *)&unk_1002B55F0, (uint64_t)&protocol conformance descriptor for [A]);
  v42 = v40;
  v43 = v50;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v42, v41, v50, v39);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v13, v7, v4, v37);
  _Block_release(v37);

  (*(void (**)(char *, uint64_t))(v54 + 8))(v4, v43);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v7, v53);
  return ((uint64_t (*)(char *, uint64_t))v33)(v13, v35);
}

uint64_t sub_1001DC978(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  id v5;
  float v6;
  float v7;
  id v8;
  float v9;
  float v10;
  _BYTE v11[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v1);
  if (result)
  {
    v3 = (void *)result;
    v4 = *(_QWORD *)(result + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_currentLogConfiguration + 8);
    swift_bridgeObjectRetain(v4);
    v5 = sub_1001DC054();
    objc_msgSend(v5, "value");
    v7 = v6;

    v8 = sub_1001DC154();
    objc_msgSend(v8, "value");
    v10 = v9;

    sub_1001DDCF4(v7, v10);
    return swift_bridgeObjectRelease(v4);
  }
  return result;
}

uint64_t sub_1001DCA78()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[5];
  uint64_t v38;

  v1 = v0;
  v33 = type metadata accessor for DispatchWorkItemFlags(0);
  v36 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchTime(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v33 - v12;
  v14 = sub_1001DBD70();
  sub_10016ADB4();

  if (qword_1002B39E0 != -1)
    v15 = swift_once(&qword_1002B39E0, sub_100174664);
  v19 = qword_1002BEFD0;
  v20 = static os_log_type_t.default.getter(v15, v16, v17, v18);
  os_log(_:dso:log:type:_:)("CellularLoggingViewController - didTapStop", 42, 2, &_mh_execute_header, v19, v20, _swiftEmptyArrayStorage);
  v21 = sub_1001548C8(0, (unint64_t *)&qword_1002B55E0, OS_dispatch_queue_ptr);
  v22 = (void *)static OS_dispatch_queue.main.getter(v21);
  static DispatchTime.now()();
  + infix(_:_:)(v11, 0.3);
  v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v11, v7);
  v24 = swift_allocObject(&unk_100267A78, 24, 7);
  swift_unknownObjectWeakInit(v24 + 16, v1);
  aBlock[4] = sub_1001E1598;
  v38 = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001BE428;
  aBlock[3] = &unk_100267AB8;
  v25 = _Block_copy(aBlock);
  swift_release(v38);
  static DispatchQoS.unspecified.getter(v26);
  aBlock[0] = _swiftEmptyArrayStorage;
  v27 = sub_10017CF34();
  v28 = sub_100146438((uint64_t *)&unk_1002B55F0);
  v29 = sub_10014BEC0((unint64_t *)&qword_1002B6540, (uint64_t *)&unk_1002B55F0, (uint64_t)&protocol conformance descriptor for [A]);
  v30 = v28;
  v31 = v33;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v30, v29, v33, v27);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v13, v6, v3, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v3, v31);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v35);
  return ((uint64_t (*)(char *, uint64_t))v23)(v13, v7);
}

void sub_1001DCD74(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  char *v4;
  void *v5;
  char *v6;
  id v7;
  id v8;
  char v9[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = *(char **)(Strong + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService);
    if (v4)
    {
      v5 = *(void **)&v4[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging];
      v6 = v4;
      v7 = v5;
      v8 = objc_msgSend(v7, "stop");

      v3 = v8;
    }

  }
}

uint64_t sub_1001DCE54()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[5];
  uint64_t v38;

  v1 = v0;
  v33 = type metadata accessor for DispatchWorkItemFlags(0);
  v36 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchTime(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v33 - v12;
  v14 = sub_1001DBA78();
  sub_10016ADB4();

  if (qword_1002B39E0 != -1)
    v15 = swift_once(&qword_1002B39E0, sub_100174664);
  v19 = qword_1002BEFD0;
  v20 = static os_log_type_t.default.getter(v15, v16, v17, v18);
  os_log(_:dso:log:type:_:)("CellularLoggingViewController - didTapReset", 43, 2, &_mh_execute_header, v19, v20, _swiftEmptyArrayStorage);
  v21 = sub_1001548C8(0, (unint64_t *)&qword_1002B55E0, OS_dispatch_queue_ptr);
  v22 = (void *)static OS_dispatch_queue.main.getter(v21);
  static DispatchTime.now()();
  + infix(_:_:)(v11, 0.3);
  v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v11, v7);
  v24 = swift_allocObject(&unk_100267A78, 24, 7);
  swift_unknownObjectWeakInit(v24 + 16, v1);
  aBlock[4] = sub_1001E1578;
  v38 = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001BE428;
  aBlock[3] = &unk_100267A90;
  v25 = _Block_copy(aBlock);
  swift_release(v38);
  static DispatchQoS.unspecified.getter(v26);
  aBlock[0] = _swiftEmptyArrayStorage;
  v27 = sub_10017CF34();
  v28 = sub_100146438((uint64_t *)&unk_1002B55F0);
  v29 = sub_10014BEC0((unint64_t *)&qword_1002B6540, (uint64_t *)&unk_1002B55F0, (uint64_t)&protocol conformance descriptor for [A]);
  v30 = v28;
  v31 = v33;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v30, v29, v33, v27);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v13, v6, v3, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v3, v31);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v35);
  return ((uint64_t (*)(char *, uint64_t))v23)(v13, v7);
}

void sub_1001DD150(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  char *v4;
  void *v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = *(char **)(Strong + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService);
    if (v4)
    {
      v5 = *(void **)&v4[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging];
      v6 = v4;
      v7 = v5;
      v8 = objc_msgSend(v7, "reset");

      sub_1001DDA90(v9, v10, v11, v12);
      v3 = v6;
    }

  }
}

void sub_1001DD234()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService);
  if (v1)
  {
    v2 = qword_1002B39E0;
    v3 = v1;
    v7 = v3;
    if (v2 != -1)
      v3 = (char *)swift_once(&qword_1002B39E0, sub_100174664);
    v8 = qword_1002BEFD0;
    v9 = static os_log_type_t.default.getter(v3, v4, v5, v6);
    os_log(_:dso:log:type:_:)("CellularLoggingViewController - didTapConfig", 44, 2, &_mh_execute_header, v8, v9, _swiftEmptyArrayStorage);
    v10 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging], "getConfigurationList");

  }
}

void sub_1001DD340(void *a1)
{
  id v1;
  float v2;
  float v3;
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  id v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;

  v1 = a1;
  objc_msgSend(a1, "value");
  v3 = v2;
  v4 = sub_1001DC054();
  objc_msgSend(v4, "minimumValue");
  v6 = v5;

  if (v3 != v6)
    goto LABEL_6;
  v1 = sub_1001DC054();
  objc_msgSend(v1, "minimumValue");
  v8 = v7;

  if ((~LODWORD(v8) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v8 <= -9.2234e18)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v8 < 9.2234e18)
  {
LABEL_14:
    v19 = sub_1001DC0D0();
    v20 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v22 = v21;
    v26 = v20;
    v27 = v21;
    swift_bridgeObjectRetain(v21);
    v23._countAndFlagsBits = 6441760;
    v23._object = (void *)0xE300000000000000;
    String.append(_:)(v23);
    swift_bridgeObjectRelease(v22);
    v24 = objc_msgSend((id)objc_opt_self(UIColor), "grayColor");
    v25 = sub_1001E10A8(0xD000000000000011, 0x8000000100216430, v26, v27, (uint64_t)v24);
    swift_bridgeObjectRelease(v27);

    objc_msgSend(v19, "setAttributedText:", v25);
    return;
  }
  __break(1u);
LABEL_6:
  objc_msgSend(v1, "value");
  v10 = v9;
  v11 = sub_1001DC054();
  objc_msgSend(v11, "maximumValue");
  v13 = v12;

  if (v10 != v13)
    goto LABEL_11;
  v1 = sub_1001DC054();
  objc_msgSend(v1, "maximumValue");
  v15 = v14;

  if ((~LODWORD(v15) & 0x7F800000) == 0)
    goto LABEL_17;
  if (v15 <= -9.2234e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v15 < 9.2234e18)
    goto LABEL_14;
  __break(1u);
LABEL_11:
  objc_msgSend(v1, "value");
  v17 = roundf(v16 * 0.03125) * 32.0;
  *(float *)&v18 = v17;
  objc_msgSend(v1, "setValue:", v18);
  if ((~LODWORD(v17) & 0x7F800000) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v17 <= -9.2234e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v17 < 9.2234e18)
    goto LABEL_14;
LABEL_21:
  __break(1u);
}

void sub_1001DD620(void *a1)
{
  id v1;
  float v2;
  float v3;
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  id v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;

  v1 = a1;
  objc_msgSend(a1, "value");
  v3 = v2;
  v4 = sub_1001DC054();
  objc_msgSend(v4, "minimumValue");
  v6 = v5;

  if (v3 != v6)
    goto LABEL_6;
  v1 = sub_1001DC054();
  objc_msgSend(v1, "minimumValue");
  v8 = v7;

  if ((~LODWORD(v8) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v8 <= -9.2234e18)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v8 < 9.2234e18)
  {
LABEL_14:
    v19 = sub_1001DC330();
    v20 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v22 = v21;
    v26 = v20;
    v27 = v21;
    swift_bridgeObjectRetain(v21);
    v23._countAndFlagsBits = 0x73656C696620;
    v23._object = (void *)0xE600000000000000;
    String.append(_:)(v23);
    swift_bridgeObjectRelease(v22);
    v24 = objc_msgSend((id)objc_opt_self(UIColor), "grayColor");
    v25 = sub_1001E10A8(0x20676F6C2078614DLL, 0xEE00203A656C6966, v26, v27, (uint64_t)v24);
    swift_bridgeObjectRelease(v27);

    objc_msgSend(v19, "setAttributedText:", v25);
    return;
  }
  __break(1u);
LABEL_6:
  objc_msgSend(v1, "value");
  v10 = v9;
  v11 = sub_1001DC054();
  objc_msgSend(v11, "maximumValue");
  v13 = v12;

  if (v10 != v13)
    goto LABEL_11;
  v1 = sub_1001DC054();
  objc_msgSend(v1, "maximumValue");
  v15 = v14;

  if ((~LODWORD(v15) & 0x7F800000) == 0)
    goto LABEL_17;
  if (v15 <= -9.2234e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v15 < 9.2234e18)
    goto LABEL_14;
  __break(1u);
LABEL_11:
  objc_msgSend(v1, "value");
  v17 = roundf(v16);
  *(float *)&v18 = v17;
  objc_msgSend(v1, "setValue:", v18);
  if ((~LODWORD(v17) & 0x7F800000) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v17 <= -9.2234e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v17 < 9.2234e18)
    goto LABEL_14;
LABEL_21:
  __break(1u);
}

void sub_1001DD8FC(uint64_t a1)
{
  void *v1;
  objc_class *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v3 = (objc_class *)type metadata accessor for MultiChoiceSelectionModal();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal____lazy_storage___tableView] = 0;
  v5 = &v4[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_dismissButton;
  swift_bridgeObjectRetain(a1);
  v7 = v4;
  *(_QWORD *)&v4[v6] = sub_10018A970();
  *(_QWORD *)&v7[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_tableViewData] = a1;

  v15.receiver = v7;
  v15.super_class = v3;
  v8 = (char *)objc_msgSendSuper2(&v15, "initWithNibName:bundle:", 0, 0);
  v12 = v8;
  if (qword_1002B39E0 != -1)
    v8 = (char *)swift_once(&qword_1002B39E0, sub_100174664);
  v13 = qword_1002BEFD0;
  v14 = static os_log_type_t.default.getter(v8, v9, v10, v11);
  os_log(_:dso:log:type:_:)("CellularLoggingViewController - showConfigOption", 48, 2, &_mh_execute_header, v13, v14, _swiftEmptyArrayStorage);
  objc_msgSend(v12, "setTransitioningDelegate:", v1);
  *(_QWORD *)&v12[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_delegate + 8] = &off_100267A28;
  swift_unknownObjectWeakAssign();
  objc_msgSend(v12, "setModalPresentationStyle:", 4);
  objc_msgSend(v1, "presentViewController:animated:completion:", v12, 1, 0);

}

void sub_1001DDA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  char isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSString v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[32];

  if (qword_1002B39E0 != -1)
    a1 = swift_once(&qword_1002B39E0, sub_100174664);
  v4 = qword_1002BEFD0;
  v5 = static os_log_type_t.default.getter(a1, a2, a3, a4);
  os_log(_:dso:log:type:_:)("CellularLoggingViewController - cleanupUIAfterReset", 51, 2, &_mh_execute_header, v4, v5, _swiftEmptyArrayStorage);
  v7 = sub_1001DB32C((uint64_t)v25);
  v8 = *v6;
  if (!*v6)
    goto LABEL_12;
  v9 = v6;
  if (!((unint64_t)v8 >> 62))
  {
    isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v6);
    v8 = *v9;
    if ((isUniquelyReferenced_nonNull_bridgeObject & 1) != 0)
    {
      if (!((unint64_t)v8 >> 62))
      {
        v11 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_8:
        sub_100199AF0(0, v11);
LABEL_12:
        ((void (*)(_BYTE *, _QWORD))v7)(v25, 0);
        v15 = sub_1001DB374();
        objc_msgSend(v15, "reloadData");

        v16 = sub_1001DB700();
        objc_msgSend(v16, "setHidden:", 0);

        v17 = sub_1001DB700();
        v18 = sub_10017F930();

        v19 = String._bridgeToObjectiveC()();
        objc_msgSend(v18, "setText:", v19);

        v20 = sub_1001DB700();
        v21 = sub_10017F82C();

        objc_msgSend(v21, "stopAnimating");
        return;
      }
      goto LABEL_20;
    }
  }
  if (!((unint64_t)v8 >> 62))
  {
    v12 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1;
    goto LABEL_11;
  }
  if (v8 < 0)
    v22 = v8;
  else
    v22 = v8 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v8);
  v12 = _CocoaArrayWrapper.endIndex.getter(v22);
  if (_CocoaArrayWrapper.endIndex.getter(v22) < 0)
    goto LABEL_25;
  v23 = _CocoaArrayWrapper.endIndex.getter(v22);
  swift_bridgeObjectRelease(v8);
  if ((v12 & 0x8000000000000000) == 0 && v23 >= v12)
  {
LABEL_11:
    v13 = sub_100196AE4(0, v12);
    v14 = *v9;
    *v9 = (uint64_t)v13;
    swift_bridgeObjectRelease(v14);
    goto LABEL_12;
  }
  __break(1u);
LABEL_20:
  if (v8 < 0)
    v24 = v8;
  else
    v24 = v8 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v8);
  v11 = _CocoaArrayWrapper.endIndex.getter(v24);
  swift_bridgeObjectRelease(v8);
  if ((v11 & 0x8000000000000000) == 0)
    goto LABEL_8;
  __break(1u);
LABEL_25:
  __break(1u);
}

void sub_1001DDCF4(float a1, float a2)
{
  uint64_t v2;
  char *v3;
  void *v4;
  id v7;
  char *v8;
  id v9;
  NSString v10;
  id v11;
  double v12;
  id v13;
  id v14;
  double v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;

  v3 = *(char **)(v2 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService);
  if (v3)
  {
    v4 = *(void **)&v3[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging];
    if (v4)
    {
      v7 = objc_allocWithZone((Class)CellularLoggingConfiguration);
      v8 = v3;
      v24 = v4;
      v9 = objc_msgSend(v7, "init");
      v10 = String._bridgeToObjectiveC()();
      objc_msgSend(v9, "setActiveConfig:", v10);

      v11 = objc_allocWithZone((Class)NSNumber);
      *(float *)&v12 = a1;
      v13 = objc_msgSend(v11, "initWithFloat:", v12);
      objc_msgSend(v9, "setChunkFileSize:", v13);

      v14 = objc_allocWithZone((Class)NSNumber);
      *(float *)&v15 = a2;
      v16 = objc_msgSend(v14, "initWithFloat:", v15);
      objc_msgSend(v9, "setMaxNumberOfLogs:", v16);

      if (qword_1002B39F0 != -1)
        v17 = swift_once(&qword_1002B39F0, sub_100174754);
      v21 = qword_1002BEFE0;
      v22 = static os_log_type_t.default.getter(v17, v18, v19, v20);
      os_log(_:dso:log:type:_:)("CellularLoggingService - initializeLogger", 41, 2, &_mh_execute_header, v21, v22, _swiftEmptyArrayStorage);
      v23 = objc_msgSend(v24, "start:", v9);

    }
  }
}

void sub_1001DDED0()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
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
  uint64_t v33;
  Class isa;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  uint64_t v137;
  Class v138;
  uint64_t v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  void *v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  void *v161;
  id v162;
  id v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  Class v167;
  uint64_t v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  void *v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  void *v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  void *v190;
  id v191;
  id v192;
  id v193;
  uint64_t v194;
  id v195;
  Class v196;

  v1 = v0;
  v2 = objc_msgSend(v0, "view");
  if (!v2)
  {
    __break(1u);
    goto LABEL_15;
  }
  v3 = v2;
  v4 = sub_1001DB374();
  objc_msgSend(v3, "addSubview:", v4);

  v5 = objc_msgSend(v1, "view");
  if (!v5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v6 = v5;
  v7 = sub_1001DB700();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = objc_msgSend(v1, "view");
  if (!v8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v9 = v8;
  v10 = *(void **)&v1[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView];
  objc_msgSend(v8, "addSubview:", v10);

  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = sub_1001DB63C();
  objc_msgSend(v10, "addSubview:", v11);

  v12 = sub_1001DB7C0();
  objc_msgSend(v10, "addSubview:", v12);

  v13 = sub_1001DC054();
  objc_msgSend(v10, "addSubview:", v13);

  v14 = sub_1001DC154();
  objc_msgSend(v10, "addSubview:", v14);

  v15 = sub_1001DC0D0();
  objc_msgSend(v10, "addSubview:", v15);

  v16 = sub_1001DC330();
  objc_msgSend(v10, "addSubview:", v16);

  v17 = *(void **)&v1[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_stackView];
  objc_msgSend(v10, "addSubview:", v17);
  v18 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
  objc_msgSend(v10, "setBackgroundColor:", v18);

  objc_msgSend(v17, "setAxis:", 0);
  objc_msgSend(v17, "setAlignment:", 3);
  objc_msgSend(v17, "setSpacing:", 10.0);
  objc_msgSend(v17, "setDistribution:", 1);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)objc_opt_self(NSLayoutConstraint);
  v195 = (id)sub_100146438((uint64_t *)&unk_1002B42B0);
  v20 = swift_allocObject(v195, 56, 7);
  *(_OWORD *)(v20 + 16) = xmmword_1002418A0;
  v21 = objc_msgSend(v17, "leftAnchor");
  v22 = objc_msgSend(v10, "safeAreaLayoutGuide");
  v23 = objc_msgSend(v22, "leftAnchor");

  v24 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 5.0);
  *(_QWORD *)(v20 + 32) = v24;
  v25 = objc_msgSend(v17, "rightAnchor");
  v26 = objc_msgSend(v10, "safeAreaLayoutGuide");
  v27 = objc_msgSend(v26, "rightAnchor");

  v28 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, -5.0);
  *(_QWORD *)(v20 + 40) = v28;
  v29 = objc_msgSend(v17, "bottomAnchor");
  v30 = objc_msgSend(v10, "safeAreaLayoutGuide");
  v31 = objc_msgSend(v30, "bottomAnchor");

  v32 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -5.0);
  *(_QWORD *)(v20 + 48) = v32;
  specialized Array._endMutation()(v33);
  sub_1001548C8(0, (unint64_t *)&qword_1002B57F0, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v20);
  objc_msgSend(v19, "activateConstraints:", isa);

  v35 = sub_1001DB9FC();
  objc_msgSend(v17, "addArrangedSubview:", v35);

  v36 = sub_1001DBD70();
  objc_msgSend(v17, "addArrangedSubview:", v36);

  v37 = sub_1001DBA78();
  objc_msgSend(v17, "addArrangedSubview:", v37);

  v38 = swift_allocObject(v195, 192, 7);
  *(_OWORD *)(v38 + 16) = xmmword_100244B30;
  v39 = objc_msgSend(v10, "leftAnchor");
  v40 = objc_msgSend(v1, "view");
  if (!v40)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v41 = v40;
  v42 = objc_msgSend(v40, "safeAreaLayoutGuide");

  v43 = objc_msgSend(v42, "leftAnchor");
  v44 = objc_msgSend(v39, "constraintEqualToAnchor:", v43);

  *(_QWORD *)(v38 + 32) = v44;
  v45 = objc_msgSend(v10, "rightAnchor");
  v46 = objc_msgSend(v1, "view");
  if (!v46)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v47 = v46;
  v48 = objc_msgSend(v46, "safeAreaLayoutGuide");

  v49 = objc_msgSend(v48, "rightAnchor");
  v50 = objc_msgSend(v45, "constraintEqualToAnchor:", v49);

  *(_QWORD *)(v38 + 40) = v50;
  v51 = objc_msgSend(v10, "topAnchor");
  v52 = objc_msgSend(v1, "view");
  if (!v52)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v53 = v52;
  v54 = objc_msgSend(v52, "safeAreaLayoutGuide");

  v55 = objc_msgSend(v54, "topAnchor");
  v56 = objc_msgSend(v51, "constraintEqualToAnchor:", v55);

  *(_QWORD *)(v38 + 48) = v56;
  v57 = objc_msgSend(v10, "heightAnchor");
  v58 = objc_msgSend(v57, "constraintEqualToConstant:", 200.0);

  *(_QWORD *)(v38 + 56) = v58;
  v59 = sub_1001DB7C0();
  v60 = objc_msgSend(v59, "topAnchor");

  v61 = objc_msgSend(v10, "safeAreaLayoutGuide");
  v62 = objc_msgSend(v61, "topAnchor");

  v63 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", v62, 5.0);
  *(_QWORD *)(v38 + 64) = v63;
  v64 = sub_1001DB7C0();
  v65 = objc_msgSend(v64, "leftAnchor");

  v66 = sub_1001DB63C();
  v67 = objc_msgSend(v66, "leftAnchor");

  v68 = objc_msgSend(v65, "constraintEqualToAnchor:", v67);
  *(_QWORD *)(v38 + 72) = v68;
  v69 = sub_1001DC0D0();
  v70 = objc_msgSend(v69, "leftAnchor");

  v71 = sub_1001DB63C();
  v72 = objc_msgSend(v71, "leftAnchor");

  v73 = objc_msgSend(v70, "constraintEqualToAnchor:", v72);
  *(_QWORD *)(v38 + 80) = v73;
  v74 = sub_1001DC0D0();
  v75 = objc_msgSend(v74, "topAnchor");

  v76 = sub_1001DB7C0();
  v77 = objc_msgSend(v76, "safeAreaLayoutGuide");

  v78 = objc_msgSend(v77, "bottomAnchor");
  v79 = objc_msgSend(v75, "constraintEqualToAnchor:", v78);

  *(_QWORD *)(v38 + 88) = v79;
  v80 = sub_1001DC054();
  v81 = objc_msgSend(v80, "leftAnchor");

  v82 = sub_1001DB63C();
  v83 = objc_msgSend(v82, "leftAnchor");

  v84 = objc_msgSend(v81, "constraintEqualToAnchor:", v83);
  *(_QWORD *)(v38 + 96) = v84;
  v85 = sub_1001DC054();
  v86 = objc_msgSend(v85, "topAnchor");

  v87 = sub_1001DC0D0();
  v88 = objc_msgSend(v87, "safeAreaLayoutGuide");

  v89 = objc_msgSend(v88, "bottomAnchor");
  v90 = objc_msgSend(v86, "constraintEqualToAnchor:", v89);

  *(_QWORD *)(v38 + 104) = v90;
  v91 = sub_1001DC054();
  v92 = objc_msgSend(v91, "widthAnchor");

  v93 = objc_msgSend(v10, "widthAnchor");
  v94 = objc_msgSend(v92, "constraintEqualToAnchor:constant:", v93, -40.0);

  *(_QWORD *)(v38 + 112) = v94;
  v95 = sub_1001DC330();
  v96 = objc_msgSend(v95, "leftAnchor");

  v97 = sub_1001DB63C();
  v98 = objc_msgSend(v97, "leftAnchor");

  v99 = objc_msgSend(v96, "constraintEqualToAnchor:", v98);
  *(_QWORD *)(v38 + 120) = v99;
  v100 = sub_1001DC330();
  v101 = objc_msgSend(v100, "topAnchor");

  v102 = sub_1001DC054();
  v103 = objc_msgSend(v102, "safeAreaLayoutGuide");

  v104 = objc_msgSend(v103, "bottomAnchor");
  v105 = objc_msgSend(v101, "constraintEqualToAnchor:", v104);

  *(_QWORD *)(v38 + 128) = v105;
  v106 = sub_1001DC154();
  v107 = objc_msgSend(v106, "leftAnchor");

  v108 = sub_1001DB63C();
  v109 = objc_msgSend(v108, "leftAnchor");

  v110 = objc_msgSend(v107, "constraintEqualToAnchor:", v109);
  *(_QWORD *)(v38 + 136) = v110;
  v111 = sub_1001DC154();
  v112 = objc_msgSend(v111, "topAnchor");

  v113 = sub_1001DC330();
  v114 = objc_msgSend(v113, "safeAreaLayoutGuide");

  v115 = objc_msgSend(v114, "bottomAnchor");
  v116 = objc_msgSend(v112, "constraintEqualToAnchor:", v115);

  *(_QWORD *)(v38 + 144) = v116;
  v117 = sub_1001DC154();
  v118 = objc_msgSend(v117, "widthAnchor");

  v119 = objc_msgSend(v10, "widthAnchor");
  v120 = objc_msgSend(v118, "constraintEqualToAnchor:constant:", v119, -40.0);

  *(_QWORD *)(v38 + 152) = v120;
  v121 = sub_1001DB63C();
  v122 = objc_msgSend(v121, "centerXAnchor");

  v123 = objc_msgSend(v10, "centerXAnchor");
  v124 = objc_msgSend(v122, "constraintEqualToAnchor:", v123);

  *(_QWORD *)(v38 + 160) = v124;
  v125 = sub_1001DB63C();
  v126 = objc_msgSend(v125, "bottomAnchor");

  v127 = objc_msgSend(v17, "safeAreaLayoutGuide");
  v128 = objc_msgSend(v127, "topAnchor");

  v129 = objc_msgSend(v126, "constraintEqualToAnchor:constant:", v128, -5.0);
  *(_QWORD *)(v38 + 168) = v129;
  v130 = sub_1001DB63C();
  v131 = objc_msgSend(v130, "heightAnchor");

  v132 = objc_msgSend(v131, "constraintEqualToConstant:", 1.0);
  *(_QWORD *)(v38 + 176) = v132;
  v133 = sub_1001DB63C();
  v134 = objc_msgSend(v133, "widthAnchor");

  v135 = objc_msgSend(v10, "widthAnchor");
  v136 = objc_msgSend(v134, "constraintEqualToAnchor:constant:", v135, -40.0);

  *(_QWORD *)(v38 + 184) = v136;
  specialized Array._endMutation()(v137);
  v138 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v38);
  objc_msgSend(v19, "activateConstraints:", v138);

  v139 = swift_allocObject(v195, 64, 7);
  *(_OWORD *)(v139 + 16) = xmmword_100240400;
  v140 = sub_1001DB374();
  v141 = objc_msgSend(v140, "topAnchor");

  v142 = objc_msgSend(v10, "bottomAnchor");
  v143 = objc_msgSend(v141, "constraintEqualToAnchor:", v142);

  *(_QWORD *)(v139 + 32) = v143;
  v144 = sub_1001DB374();
  v145 = objc_msgSend(v144, "leadingAnchor");

  v146 = objc_msgSend(v1, "view");
  if (!v146)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v147 = v146;
  v148 = objc_msgSend(v146, "safeAreaLayoutGuide");

  v149 = objc_msgSend(v148, "leadingAnchor");
  v150 = objc_msgSend(v145, "constraintEqualToAnchor:", v149);

  *(_QWORD *)(v139 + 40) = v150;
  v151 = sub_1001DB374();
  v152 = objc_msgSend(v151, "trailingAnchor");

  v153 = objc_msgSend(v1, "view");
  if (!v153)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v154 = v153;
  v155 = objc_msgSend(v153, "safeAreaLayoutGuide");

  v156 = objc_msgSend(v155, "trailingAnchor");
  v157 = objc_msgSend(v152, "constraintEqualToAnchor:", v156);

  *(_QWORD *)(v139 + 48) = v157;
  v158 = sub_1001DB374();
  v159 = objc_msgSend(v158, "bottomAnchor");

  v160 = objc_msgSend(v1, "view");
  if (!v160)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v161 = v160;
  v162 = objc_msgSend(v160, "safeAreaLayoutGuide");

  v163 = objc_msgSend(v162, "bottomAnchor");
  v164 = objc_msgSend(v159, "constraintEqualToAnchor:", v163);

  *(_QWORD *)(v139 + 56) = v164;
  specialized Array._endMutation()(v165);
  v166 = v139;
  v167 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v166);
  objc_msgSend(v19, "activateConstraints:", v167);

  v168 = swift_allocObject(v195, 64, 7);
  *(_OWORD *)(v168 + 16) = xmmword_100240400;
  v169 = sub_1001DB700();
  v170 = objc_msgSend(v169, "topAnchor");

  v171 = objc_msgSend(v10, "bottomAnchor");
  v172 = objc_msgSend(v170, "constraintEqualToAnchor:", v171);

  *(_QWORD *)(v168 + 32) = v172;
  v173 = sub_1001DB700();
  v174 = objc_msgSend(v173, "leadingAnchor");

  v175 = objc_msgSend(v1, "view");
  if (!v175)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v176 = v175;
  v177 = objc_msgSend(v175, "safeAreaLayoutGuide");

  v178 = objc_msgSend(v177, "leadingAnchor");
  v179 = objc_msgSend(v174, "constraintEqualToAnchor:", v178);

  *(_QWORD *)(v168 + 40) = v179;
  v180 = sub_1001DB700();
  v181 = objc_msgSend(v180, "trailingAnchor");

  v182 = objc_msgSend(v1, "view");
  if (!v182)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v183 = v182;
  v184 = objc_msgSend(v182, "safeAreaLayoutGuide");

  v185 = objc_msgSend(v184, "trailingAnchor");
  v186 = objc_msgSend(v181, "constraintEqualToAnchor:", v185);

  *(_QWORD *)(v168 + 48) = v186;
  v187 = sub_1001DB700();
  v188 = objc_msgSend(v187, "bottomAnchor");

  v189 = objc_msgSend(v1, "view");
  if (v189)
  {
    v190 = v189;
    v191 = objc_msgSend(v189, "safeAreaLayoutGuide");

    v192 = objc_msgSend(v191, "bottomAnchor");
    v193 = objc_msgSend(v188, "constraintEqualToAnchor:", v192);

    *(_QWORD *)(v168 + 56) = v193;
    specialized Array._endMutation()(v194);
    v196 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v168);
    objc_msgSend(v19, "activateConstraints:", v196);

    return;
  }
LABEL_25:
  __break(1u);
}

id sub_1001DF3E0(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString v14;
  id v15;
  objc_super v17;

  v6 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition;
  v7 = objc_allocWithZone((Class)type metadata accessor for CircularTransition());
  v8 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v7, "init");
  v9 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_stackView;
  *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone((Class)UIStackView), "init");
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations] = _swiftEmptyArrayStorage;
  v10 = &v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_currentLogConfiguration];
  *(_QWORD *)v10 = 0x746C7561666544;
  *((_QWORD *)v10 + 1) = 0xE700000000000000;
  v11 = &v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_loadingViewContext];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0xE000000000000000;
  v12 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs;
  sub_1001548C8(0, &qword_1002B5680, NSNumber_ptr);
  *(NSNumber *)&v8[v12] = NSNumber.init(integerLiteral:)(0);
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___tableView] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___startButton] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___resetButton] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___stopButton] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel] = 0;
  v13 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView;
  *(_QWORD *)&v8[v13] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  if (a2)
  {
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v14 = 0;
  }
  v17.receiver = v8;
  v17.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  v15 = objc_msgSendSuper2(&v17, "initWithNibName:bundle:", v14, a3);

  return v15;
}

id sub_1001DF664(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v3 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition;
  v4 = objc_allocWithZone((Class)type metadata accessor for CircularTransition());
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "init");
  v6 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_stackView;
  *(_QWORD *)&v5[v6] = objc_msgSend(objc_allocWithZone((Class)UIStackView), "init");
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations] = _swiftEmptyArrayStorage;
  v7 = &v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_currentLogConfiguration];
  *(_QWORD *)v7 = 0x746C7561666544;
  *((_QWORD *)v7 + 1) = 0xE700000000000000;
  v8 = &v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_loadingViewContext];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0xE000000000000000;
  v9 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs;
  sub_1001548C8(0, &qword_1002B5680, NSNumber_ptr);
  *(NSNumber *)&v5[v9] = NSNumber.init(integerLiteral:)(0);
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___tableView] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___startButton] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___resetButton] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___stopButton] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel] = 0;
  v10 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView;
  *(_QWORD *)&v5[v10] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  v11 = objc_msgSendSuper2(&v13, "initWithCoder:", a1);

  return v11;
}

void sub_1001DF874()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData));
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations));
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_currentLogConfiguration
                                      + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_loadingViewContext
                                      + 8));

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView));

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton));

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel));

}

id sub_1001DF9C8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CellularLoggingViewController()
{
  return objc_opt_self(_TtC13FTMInternal_429CellularLoggingViewController);
}

void sub_1001DFB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[32];
  _BYTE v20[24];

  v5 = v4;
  v6 = a1;
  if (qword_1002B39F0 != -1)
    a1 = swift_once(&qword_1002B39F0, sub_100174754);
  v7 = qword_1002BEFE0;
  v8 = static os_log_type_t.default.getter(a1, a2, a3, a4);
  os_log(_:dso:log:type:_:)("CellularLoggingViewController - didReceiveLogs", 46, 2, &_mh_execute_header, v7, v8, _swiftEmptyArrayStorage);
  v9 = (uint64_t *)(v5 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData);
  swift_beginAccess(v5 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData, v20, 1, 0);
  v10 = *v9;
  if (*v9)
  {
    if ((unint64_t)v10 >> 62)
    {
      if (v10 >= 0)
        v18 = v10 & 0xFFFFFFFFFFFFFF8;
      else
        v18 = *v9;
      swift_bridgeObjectRetain(v10);
      _CocoaArrayWrapper.endIndex.getter(v18);
      swift_bridgeObjectRelease(v10);
    }
    sub_1001DFD34(v6);
    v11 = sub_1001DB32C((uint64_t)v19);
    if (*v12)
    {
      v13 = swift_bridgeObjectRetain(v6);
      sub_1001DAFF0(v13);
    }
    ((void (*)(_BYTE *, _QWORD))v11)(v19, 0);
  }
  else
  {
    *v9 = v6;
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRelease(0);
  }
  v14 = sub_1001DB700();
  if ((unint64_t)v6 >> 62)
  {
    if (v6 < 0)
      v17 = v6;
    else
      v17 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v6);
    v15 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v15 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  objc_msgSend(v14, "setHidden:", v15 > 0);

  v16 = sub_1001DB374();
  objc_msgSend(v16, "reloadData");

}

void sub_1001DFD34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  char isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[32];
  _BYTE v39[24];

  v2 = v1;
  v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData);
  swift_beginAccess(v4, v39, 0, 0);
  v5 = *v4;
  if (*v4)
  {
    if (!((unint64_t)v5 >> 62))
    {
      v6 = v5 & 0xFFFFFFFFFFFFF8;
LABEL_6:
      v7 = *(_QWORD *)(v6 + 16);
      goto LABEL_7;
    }
    if (v5 >= 0)
      v30 = v5 & 0xFFFFFFFFFFFFFF8;
    else
      v30 = *v4;
    swift_bridgeObjectRetain(*v4);
    v7 = _CocoaArrayWrapper.endIndex.getter(v30);
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    if (!((unint64_t)a1 >> 62))
    {
      v6 = a1 & 0xFFFFFFFFFFFFF8;
      goto LABEL_6;
    }
    if (a1 < 0)
      v31 = a1;
    else
      v31 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = _CocoaArrayWrapper.endIndex.getter(v31);
    swift_bridgeObjectRelease(a1);
  }
LABEL_7:
  v8 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs), "integerValue");
  if (v7 < (uint64_t)v8)
    return;
  v12 = *v4;
  if (*v4)
  {
    if ((unint64_t)v12 >> 62)
    {
      if (v12 >= 0)
        v32 = v12 & 0xFFFFFFFFFFFFFF8;
      else
        v32 = *v4;
      swift_bridgeObjectRetain(v12);
      v13 = (uint64_t *)_CocoaArrayWrapper.endIndex.getter(v32);
      v8 = (id)swift_bridgeObjectRelease(v12);
    }
    else
    {
      v13 = *(uint64_t **)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (qword_1002B39F0 != -1)
      v8 = (id)swift_once(&qword_1002B39F0, sub_100174754);
    v14 = (void *)qword_1002BEFE0;
    v15 = static os_log_type_t.default.getter(v8, v9, v10, v11);
    v16 = sub_100146438((uint64_t *)&unk_1002B57E0);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_1002402A0;
    if ((unint64_t)a1 >> 62)
    {
      if (a1 < 0)
        v33 = a1;
      else
        v33 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v34 = _CocoaArrayWrapper.endIndex.getter(v33);
      swift_bridgeObjectRelease(a1);
      v19 = (char *)v13 + v34;
      if (!__OFADD__(v13, v34))
        goto LABEL_15;
    }
    else
    {
      v18 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = (char *)v13 + v18;
      if (!__OFADD__(v13, v18))
      {
LABEL_15:
        *(_QWORD *)(v17 + 56) = &type metadata for Int;
        *(_QWORD *)(v17 + 64) = &protocol witness table for Int;
        *(_QWORD *)(v17 + 32) = v19;
        os_log(_:dso:log:type:_:)("CellularLoggingViewController - checkIfReachedMax - maxReached: %{public}d", 74, 2, &_mh_execute_header, v14, v15, v17);
        swift_bridgeObjectRelease(v17);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_47;
  }
LABEL_16:
  v14 = sub_1001DB32C((uint64_t)v38);
  v15 = *v20;
  if (*v20)
  {
    v13 = v20;
    if (!((unint64_t)v15 >> 62))
    {
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v20);
      v15 = *v13;
      if ((isUniquelyReferenced_nonNull_bridgeObject & 1) != 0)
      {
        if (!((unint64_t)v15 >> 62))
        {
          v22 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_21:
          sub_100199AF0(0, v22);
          goto LABEL_25;
        }
        goto LABEL_54;
      }
    }
    if (!((unint64_t)v15 >> 62))
    {
      v23 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1;
      goto LABEL_24;
    }
LABEL_47:
    if (v15 < 0)
      v35 = v15;
    else
      v35 = v15 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v15);
    v23 = _CocoaArrayWrapper.endIndex.getter(v35);
    if (_CocoaArrayWrapper.endIndex.getter(v35) < 0)
      goto LABEL_59;
    v36 = _CocoaArrayWrapper.endIndex.getter(v35);
    swift_bridgeObjectRelease(v15);
    if (v23 < 0 || v36 < v23)
    {
      __break(1u);
LABEL_54:
      if (v15 < 0)
        v37 = v15;
      else
        v37 = v15 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v15);
      v22 = _CocoaArrayWrapper.endIndex.getter(v37);
      swift_bridgeObjectRelease(v15);
      if ((v22 & 0x8000000000000000) == 0)
        goto LABEL_21;
      __break(1u);
LABEL_59:
      __break(1u);
      return;
    }
LABEL_24:
    v24 = sub_100196AE4(0, v23);
    v25 = *v13;
    *v13 = (uint64_t)v24;
    swift_bridgeObjectRelease(v25);
  }
LABEL_25:
  ((void (*)(_BYTE *, _QWORD))v14)(v38, 0);
  v26 = sub_1001DB32C((uint64_t)v38);
  if (*v27)
  {
    v28 = swift_bridgeObjectRetain(a1);
    sub_1001DAFF0(v28);
  }
  ((void (*)(_BYTE *, _QWORD))v26)(v38, 0);
  v29 = sub_1001DB374();
  objc_msgSend(v29, "reloadData");

}

unint64_t sub_1001E0278(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  NSString v8;
  Class isa;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t result;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  NSString v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  NSString v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSString v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _BYTE v47[24];

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = off_1002B4BF8;
  swift_bridgeObjectRetain(off_1002B4BF8);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v10 = objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, isa);

  v11 = type metadata accessor for FavoritesTableCellV2();
  v12 = swift_dynamicCastClass(v10, v11);
  if (v12)
  {
    v13 = v12;
    v14 = (_QWORD *)(v1 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData);
    swift_beginAccess(v1 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData, v47, 0, 0);
    v15 = *v14;
    if (!*v14)
      return v13;
    v16 = swift_bridgeObjectRetain(*v14);
    result = IndexPath.row.getter(v16);
    v44 = v3;
    if ((v15 & 0xC000000000000001) != 0)
    {
      v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(result, v15);
      goto LABEL_7;
    }
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v18 = *(id *)(v15 + 8 * result + 32);
LABEL_7:
      v19 = v18;
      swift_bridgeObjectRelease(v15);
      v20 = sub_100162828();
      v21 = objc_msgSend(v19, "fileName");
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      v45 = 0x6D616E20656C6946;
      v46 = 0xEB00000000203A65;
      v25._countAndFlagsBits = v22;
      v25._object = v24;
      String.append(_:)(v25);
      swift_bridgeObjectRelease(v24);
      String.init<A>(_:)(&v45, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
      v27 = v26;
      v28 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v27);
      objc_msgSend(v20, "setText:", v28);

      v29 = sub_100162840();
      v30 = objc_msgSend(v19, "fileSize");
      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      v33 = v32;

      v45 = 0x7A695320656C6946;
      v46 = 0xEB00000000203A65;
      v34._countAndFlagsBits = v31;
      v34._object = v33;
      String.append(_:)(v34);
      swift_bridgeObjectRelease(v33);
      String.init<A>(_:)(&v45, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
      v36 = v35;
      v37 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v36);
      objc_msgSend(v29, "setText:", v37);

      v38 = sub_100162858();
      v39 = objc_msgSend(v19, "timestamp");
      static Date._unconditionallyBridgeFromObjectiveC(_:)(v39);

      sub_10016AAB8(2);
      v41 = v40;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v44);
      v42 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v41);
      objc_msgSend(v38, "setText:", v42);

      v43 = sub_1001628D8();
      objc_msgSend(v43, "setHidden:", 1);

      return v13;
    }
    __break(1u);
  }
  else
  {

    return (unint64_t)objc_msgSend(objc_allocWithZone((Class)UITableViewCell), "init");
  }
  return result;
}

uint64_t sub_1001E07EC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t *v18[4];

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10014BEC0(&qword_1002B7FB8, &qword_1002B7FB0, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100146438(&qword_1002B7FB0);
          v13 = sub_1001E0E30(v18, i, a3);
          v15 = *v14;
          swift_retain(*v14);
          ((void (*)(uint64_t **, _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for FTMAllMetricsModel(0);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001E09F8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10014BEC0((unint64_t *)&unk_1002B7FD0, &qword_1002B7FC8, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100146438(&qword_1002B7FC8);
          v13 = sub_1001E0E88(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1001548C8(0, &qword_1002B7FC0, NSURLSessionTask_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001E0C14(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10014BEC0(&qword_1002B7F98, &qword_1002B7F88, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100146438(&qword_1002B7F88);
          v13 = sub_1001E0EDC(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1001548C8(0, (unint64_t *)&qword_1002B7F90, CellularLoggingFileInformation_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_1001E0E30(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_1001E0F5C(v6, a2, a3);
  return sub_1001E0E84;
}

void (*sub_1001E0E88(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1001E0FC8(v6, a2, a3);
  return sub_1001E0E84;
}

void (*sub_1001E0EDC(void (**a1)(id *), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1001E103C(v6, a2, a3);
  return sub_1001E0E84;
}

void sub_1001E0F30(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t *sub_1001E0F5C(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain(*(_QWORD *)(a3 + 8 * a2 + 32));
LABEL_5:
    *v3 = v4;
    return (uint64_t *)destroy for FTMCellMonitorHardwareRowCellView;
  }
  __break(1u);
  return result;
}

void (*sub_1001E0FC8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
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
    return sub_1001E1034;
  }
  __break(1u);
  return result;
}

void sub_1001E1034(id *a1)
{

}

void (*sub_1001E103C(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
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
    return sub_1001E1664;
  }
  __break(1u);
  return result;
}

id sub_1001E10A8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  Swift::String v8;
  id v9;
  NSString v10;
  id v11;
  id v12;
  NSString v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  swift_bridgeObjectRetain(a2);
  v8._countAndFlagsBits = a3;
  v8._object = a4;
  String.append(_:)(v8);
  v9 = objc_allocWithZone((Class)NSMutableAttributedString);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v11 = objc_msgSend(v9, "initWithString:", v10, a1);

  v12 = objc_msgSend(v11, "mutableString");
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v12, "rangeOfString:options:", v13, 1);
  v16 = v15;

  if (v14 != (id)NSNotFound.getter())
    objc_msgSend(v11, "addAttribute:value:range:", NSForegroundColorAttributeName, a5, v14, v16);
  return v11;
}

id sub_1001E11DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;
  NSString v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v8 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v9 = String._bridgeToObjectiveC()();
  v10 = (void *)objc_opt_self(UIColor);
  v11 = objc_msgSend(v10, "colorNamed:", v9);

  objc_msgSend(v8, "setTextColor:", v11);
  v12 = objc_msgSend(v10, "grayColor");
  v13 = sub_1001E10A8(a1, a2, a3, a4, (uint64_t)v12);

  objc_msgSend(v8, "setAttributedText:", v13);
  objc_msgSend(v8, "setTextAlignment:", 2);
  v14 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:", 18.0);
  objc_msgSend(v8, "setFont:", v14);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v8;
}

id sub_1001E1358()
{
  char *v0;
  uint64_t v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  id result;
  void *v9;
  id v10;
  void *v11;

  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition];
  *(_BYTE *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_transitionMode) = 0;
  v2 = sub_1001DB9FC();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = (double *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_startingPoint);
  *v7 = v4;
  v7[1] = v6;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circle), "setCenter:", v4, v6);
  result = objc_msgSend(v0, "view");
  if (result)
  {
    v9 = result;
    v10 = objc_msgSend(result, "backgroundColor");

    if (v10)
    {
      v11 = *(void **)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor) = v10;

    }
    return (id)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1001E1454()
{
  char *v0;
  uint64_t v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  id result;
  void *v9;
  id v10;
  void *v11;

  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition];
  *(_BYTE *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_transitionMode) = 1;
  v2 = sub_1001DB9FC();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = (double *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_startingPoint);
  *v7 = v4;
  v7[1] = v6;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circle), "setCenter:", v4, v6);
  result = objc_msgSend(v0, "view");
  if (result)
  {
    v9 = result;
    v10 = objc_msgSend(result, "backgroundColor");

    if (v10)
    {
      v11 = *(void **)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC13FTMInternal_418CircularTransition_circleColor) = v10;

    }
    return (id)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1001E1554()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1001E1578()
{
  uint64_t v0;

  sub_1001DD150(v0);
}

uint64_t sub_1001E1580(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

double sub_1001E1590(uint64_t a1)
{
  double result;

  *(_QWORD *)&result = swift_release(*(_QWORD *)(a1 + 40)).n128_u64[0];
  return result;
}

void sub_1001E1598()
{
  uint64_t v0;

  sub_1001DCD74(v0);
}

uint64_t sub_1001E15A0()
{
  uint64_t v0;

  return sub_1001DC978(v0);
}

uint64_t sub_1001E15A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100146438(&qword_1002B5690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for CellularLoggingReprestable()
{
  return &type metadata for CellularLoggingReprestable;
}

void *sub_1001E1604()
{
  return &protocol witness table for Never;
}

unint64_t sub_1001E1610()
{
  unint64_t result;

  result = qword_1002B7FA8;
  if (!qword_1002B7FA8)
  {
    result = swift_getWitnessTable(&unk_100244BAC, &type metadata for CellularLoggingReprestable);
    atomic_store(result, (unint64_t *)&qword_1002B7FA8);
  }
  return result;
}

char *sub_1001E1668()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  char *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging] = 0;
  v1 = &v0[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate];
  *((_QWORD *)v1 + 1) = 0;
  swift_unknownObjectWeakInit(v1, 0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_timer] = 0;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for CellularLoggingService();
  v2 = objc_msgSendSuper2(&v10, "init");
  v3 = objc_allocWithZone((Class)CellularLogging);
  v4 = (char *)v2;
  v5 = objc_msgSend(v3, "init");
  v6 = OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging;
  v7 = *(void **)&v4[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging];
  *(_QWORD *)&v4[OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging] = v5;

  v8 = *(void **)&v4[v6];
  if (v8)
    objc_msgSend(v8, "setDelegate:", v4);
  sub_1001E175C();

  return v4;
}

void sub_1001E175C()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v2 = swift_allocObject(&unk_100267BE0, 24, 7);
  *(_QWORD *)(v2 + 16) = v0;
  v7[4] = sub_1001E26FC;
  v8 = v2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1001BC218;
  v7[3] = &unk_100267BF8;
  v3 = _Block_copy(v7);
  v4 = v8;
  v5 = v0;
  v6 = objc_msgSend(v1, "addObserverForName:object:queue:usingBlock:", UIApplicationWillTerminateNotification, 0, 0, v3, swift_release(v4).n128_f64[0]);
  _Block_release(v3);
  swift_unknownObjectRelease(v6);

}

void sub_1001E1868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (qword_1002B39F0 != -1)
    a1 = swift_once(&qword_1002B39F0, sub_100174754);
  v5 = qword_1002BEFE0;
  v6 = static os_log_type_t.default.getter(a1, a2, a3, a4);
  os_log(_:dso:log:type:_:)("CellularLoggingService - appwillTerminateNotification", 53, 2, &_mh_execute_header, v5, v6, _swiftEmptyArrayStorage);
  v10 = *(void **)(a2 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_cellularLogging);
  if (v10)
  {

  }
  else
  {
    v11 = static os_log_type_t.default.getter(0, v7, v8, v9);
    os_log(_:dso:log:type:_:)("cellularlogging is not available", 32, 2, &_mh_execute_header, v5, v11, _swiftEmptyArrayStorage);
  }
}

id sub_1001E1940()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  objc_super v6;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  static String._unconditionallyBridgeFromObjectiveC(_:)(UIApplicationWillTerminateNotification);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v1, "removeObserver:", v4);

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for CellularLoggingService();
  return objc_msgSendSuper2(&v6, "dealloc");
}

uint64_t type metadata accessor for CellularLoggingService()
{
  return objc_opt_self(_TtC13FTMInternal_422CellularLoggingService);
}

_QWORD *sub_1001E1B04(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t Strong;
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
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString v25;
  NSString v26;
  id v27;
  NSString v28;
  id v29;
  _QWORD v30[3];
  _BYTE v31[8];
  _QWORD v32[3];
  _BYTE v33[8];

  v3 = v2;
  if (result && (result = sub_1001E1DF0((uint64_t)result)) != 0)
  {
    v5 = (uint64_t)result;
    Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
    if (Strong)
    {
      v10 = Strong;
      sub_1001DFB78(v5, v7, v8, v9);
      swift_bridgeObjectRelease(v5);
      return (_QWORD *)swift_unknownObjectRelease(v10);
    }
    else
    {
      return (_QWORD *)swift_bridgeObjectRelease(v5);
    }
  }
  else if (a2)
  {
    v11 = swift_errorRetain(a2);
    if (qword_1002B39F0 != -1)
      v11 = swift_once(&qword_1002B39F0, sub_100174754);
    v12 = qword_1002BEFE0;
    v13 = static os_log_type_t.error.getter(v11);
    v14 = sub_100146438((uint64_t *)&unk_1002B57E0);
    v15 = swift_allocObject(v14, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_1002402A0;
    swift_getErrorValue(a2, v33, v32);
    v16 = Error.localizedDescription.getter(v32[1], v32[2]);
    v18 = v17;
    *(_QWORD *)(v15 + 56) = &type metadata for String;
    *(_QWORD *)(v15 + 64) = sub_10016B1E0();
    *(_QWORD *)(v15 + 32) = v16;
    *(_QWORD *)(v15 + 40) = v18;
    os_log(_:dso:log:type:_:)("CellularLoggingService - didCollectLogs: %{public}@ ", 52, 2, &_mh_execute_header, v12, v13, v15);
    swift_bridgeObjectRelease(v15);
    v19 = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
    if (v19)
    {
      v20 = (void *)v19;
      swift_getErrorValue(a2, v31, v30);
      v21 = v30[1];
      v22 = v30[2];
      swift_errorRetain(a2);
      swift_errorRetain(a2);
      Error.localizedDescription.getter(v21, v22);
      v24 = v23;
      v25 = String._bridgeToObjectiveC()();
      v26 = String._bridgeToObjectiveC()();
      v27 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v25, v26, 1);

      v28 = String._bridgeToObjectiveC()();
      v29 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v28, 0, 0);

      objc_msgSend(v27, "addAction:", v29);
      objc_msgSend(v20, "presentViewController:animated:completion:", v27, 1, 0);
      swift_bridgeObjectRelease(v24);

      swift_errorRelease(a2);
      swift_unknownObjectRelease(v20);
      swift_errorRelease(a2);
    }
    return (_QWORD *)swift_errorRelease(a2);
  }
  return result;
}

_QWORD *sub_1001E1DF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  _BYTE v10[32];
  _QWORD *v11;

  v11 = _swiftEmptyArrayStorage;
  v2 = *(_QWORD *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)(v2);
  if (!v2)
    return v11;
  for (i = a1 + 32; ; i += 32)
  {
    sub_10017E2BC(i, (uint64_t)v10);
    v4 = sub_1001E269C();
    if (!swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, v4, 6))
      break;
    v5 = v9;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    v6 = v11[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v6);
    v7 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v5);
    specialized ContiguousArray._endMutation()(v7);
    if (!--v2)
      return v11;
  }
  v9 = 0;
  swift_release(v11);

  return 0;
}

_QWORD *sub_1001E1EE8(uint64_t a1)
{
  int64_t v2;
  _QWORD *v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[32];
  _QWORD *v14;

  v2 = *(_QWORD *)(a1 + 16);
  v14 = _swiftEmptyArrayStorage;
  sub_100195A34(0, v2, 0);
  v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_10017E2BC(i, (uint64_t)v13);
      if (!swift_dynamicCast(&v11, v13, (char *)&type metadata for Any + 8, &type metadata for String, 6))break;
      v5 = v11;
      v6 = v12;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_100195A34(0, v3[2] + 1, 1);
        v3 = v14;
      }
      v8 = v3[2];
      v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_100195A34(v7 > 1, v8 + 1, 1);
        v3 = v14;
      }
      v3[2] = v8 + 1;
      v9 = &v3[2 * v8];
      v9[4] = v5;
      v9[5] = v6;
      if (!--v2)
        return v3;
    }
    v11 = 0;
    v12 = 0;
    swift_release(v3);
    swift_bridgeObjectRelease(v12);
    return 0;
  }
  return v3;
}

void sub_1001E20A0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString v29;
  NSString v30;
  id v31;
  NSString v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  _QWORD v37[3];
  _BYTE v38[8];
  _QWORD v39[3];
  _BYTE v40[8];

  v5 = v4;
  switch(a1)
  {
    case 0:
      Strong = swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
      if (!Strong)
        return;
      v8 = Strong;
      if (qword_1002B39F0 != -1)
        Strong = swift_once(&qword_1002B39F0, sub_100174754);
      v11 = qword_1002BEFE0;
      v12 = static os_log_type_t.error.getter(Strong);
      os_log(_:dso:log:type:_:)("didStop", 7, 2, &_mh_execute_header, v11, v12, _swiftEmptyArrayStorage);
      goto LABEL_12;
    case 2:
      if (a2)
      {
        v15 = swift_errorRetain(a2);
        if (qword_1002B39F0 != -1)
          v15 = swift_once(&qword_1002B39F0, sub_100174754);
        v16 = qword_1002BEFE0;
        v17 = static os_log_type_t.error.getter(v15);
        v18 = sub_100146438((uint64_t *)&unk_1002B57E0);
        v19 = swift_allocObject(v18, 72, 7);
        *(_OWORD *)(v19 + 16) = xmmword_1002402A0;
        swift_getErrorValue(a2, v38, v37);
        v20 = Error.localizedDescription.getter(v37[1], v37[2]);
        v22 = v21;
        *(_QWORD *)(v19 + 56) = &type metadata for String;
        *(_QWORD *)(v19 + 64) = sub_10016B1E0();
        *(_QWORD *)(v19 + 32) = v20;
        *(_QWORD *)(v19 + 40) = v22;
        os_log(_:dso:log:type:_:)("CellularLoggingService - didStateChanged %{public}@", 51, 2, &_mh_execute_header, v16, v17, v19);
        swift_bridgeObjectRelease(v19);
        swift_errorRelease(a2);
        v23 = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
        if (v23)
        {
          v24 = (void *)v23;
          swift_getErrorValue(a2, v40, v39);
          v25 = v39[1];
          v26 = v39[2];
          swift_errorRetain(a2);
          Error.localizedDescription.getter(v25, v26);
          v28 = v27;
          v29 = String._bridgeToObjectiveC()();
          v30 = String._bridgeToObjectiveC()();
          v31 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v29, v30, 1);

          v32 = String._bridgeToObjectiveC()();
          v33 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v32, 0, 0);

          objc_msgSend(v31, "addAction:", v33);
          objc_msgSend(v24, "presentViewController:animated:completion:", v31, 1, 0);
          swift_bridgeObjectRelease(v28);

          swift_errorRelease(a2);
          swift_unknownObjectRelease(v24);
        }
      }
      else
      {
        v13 = swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
        if (v13)
          goto LABEL_13;
      }
      break;
    case 1:
      v7 = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
      if (!v7)
        return;
      v8 = v7;
      if (a3)
      {
        v9 = objc_msgSend(a3, "maxNumberOfLogs");
        if (v9)
        {
          v36 = *(id *)(v8 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs);
          *(_QWORD *)(v8 + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs) = v9;
          swift_unknownObjectRelease(v8);

          return;
        }
      }
LABEL_12:
      v13 = v8;
LABEL_13:
      swift_unknownObjectRelease(v13);
      return;
    default:
      if (qword_1002B39F0 != -1)
        a1 = swift_once(&qword_1002B39F0, sub_100174754);
      v34 = qword_1002BEFE0;
      v35 = static os_log_type_t.default.getter(a1, a2, a3, a4);
      os_log(_:dso:log:type:_:)("didStateChanged - state: unexpected", 35, 2, &_mh_execute_header, v34, v35, _swiftEmptyArrayStorage);
      break;
  }
}

_QWORD *sub_1001E2534(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  if (result)
  {
    result = sub_1001E1EE8((uint64_t)result);
    if (result)
    {
      v5 = result;
      if (qword_1002B39F0 != -1)
        result = (_QWORD *)swift_once(&qword_1002B39F0, sub_100174754);
      v6 = qword_1002BEFE0;
      v7 = static os_log_type_t.default.getter(result, v2, v3, v4);
      os_log(_:dso:log:type:_:)("configurationListAvailable", 26, 2, &_mh_execute_header, v6, v7, _swiftEmptyArrayStorage);
      Strong = swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC13FTMInternal_422CellularLoggingService_delegate);
      if (Strong)
      {
        v9 = Strong;
        v10 = OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations;
        v11 = *(_QWORD *)(Strong + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations);
        *(_QWORD *)(Strong + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations) = v5;
        swift_bridgeObjectRetain(v5);
        swift_bridgeObjectRelease(v11);
        v12 = *(_QWORD **)(v9 + v10);
        v13 = swift_bridgeObjectRetain(v12);
        sub_1001DD8FC(v13);
        swift_bridgeObjectRelease(v5);
        swift_unknownObjectRelease(v9);
        v14 = v12;
      }
      else
      {
        v14 = v5;
      }
      return (_QWORD *)swift_bridgeObjectRelease(v14);
    }
  }
  return result;
}

unint64_t sub_1001E269C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B7F90;
  if (!qword_1002B7F90)
  {
    v1 = objc_opt_self(CellularLoggingFileInformation);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1002B7F90);
  }
  return result;
}

uint64_t sub_1001E26D8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1001E26FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_1001E1868(a1, *(_QWORD *)(v4 + 16), a3, a4);
}

uint64_t sub_1001E2704(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

double sub_1001E2714(uint64_t a1)
{
  double result;

  *(_QWORD *)&result = swift_release(*(_QWORD *)(a1 + 40)).n128_u64[0];
  return result;
}

double sub_1001E271C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  double result;
  _QWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int16 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int16 v38;

  KeyPath = swift_getKeyPath(&unk_100244D40);
  v4 = swift_getKeyPath(&unk_100244D68);
  static Published.subscript.getter(&v33, v1, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v5 = v34;
  LOBYTE(v4) = BYTE10(v34);
  swift_bridgeObjectRelease(v35);
  swift_bridgeObjectRelease(v5);
  sub_1001E311C(v4);
  v6 = swift_getKeyPath(&unk_100244D40);
  v7 = swift_getKeyPath(&unk_100244D68);
  static Published.subscript.getter(&v27, v1, v6, v7);
  swift_release(v6);
  swift_release(v7);
  v35 = v29;
  v36 = v30;
  v37 = v31;
  v38 = v32;
  v33 = v27;
  v34 = v28;
  v8 = *(void **)(v1 + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService);
  v9 = objc_allocWithZone((Class)NSOperationQueue);
  v10 = v8;
  v11 = objc_msgSend(v9, "init");
  objc_msgSend(v11, "setQualityOfService:", 25);
  v12 = (objc_class *)type metadata accessor for SURLSessionRunningViewModel(0);
  v13 = objc_allocWithZone(v12);
  v14 = sub_1001A0F4C(0, 0, (uint64_t)&v33, v11, v10);

  v15 = swift_getKeyPath(&unk_100244D88);
  v16 = (uint64_t *)(a1 + *(int *)(type metadata accessor for SURLSessionRunningView(0) + 28));
  *v16 = v15;
  v17 = sub_100146438(&qword_1002B3F00);
  swift_storeEnumTagMultiPayload(v16, v17, 0);
  v18 = sub_1001E3FE0();
  *(_QWORD *)a1 = ObservedObject.init(wrappedValue:)(v14, v12, v18);
  *(_QWORD *)(a1 + 8) = v19;
  LOBYTE(v26[0]) = 0;
  State.init(wrappedValue:)(&v27, v26, &type metadata for Bool, v20);
  v21 = *((_QWORD *)&v27 + 1);
  *(_BYTE *)(a1 + 16) = v27;
  *(_QWORD *)(a1 + 24) = v21;
  v26[0] = 0;
  v26[1] = 0;
  v22 = sub_100146438((uint64_t *)&unk_1002B5640);
  State.init(wrappedValue:)(&v27, v26, v22, v23);
  v24 = v28;
  result = *(double *)&v27;
  *(_OWORD *)(a1 + 32) = v27;
  *(_QWORD *)(a1 + 48) = v24;
  return result;
}

uint64_t sub_1001E2958@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t result;
  char v16;
  char v17;
  _QWORD v18[3];
  __int16 v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  char v29;

  KeyPath = swift_getKeyPath(&unk_100244D40);
  v4 = swift_getKeyPath(&unk_100244D68);
  static Published.subscript.getter(v18, v1, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v5 = v18[1];
  v6 = v18[2];
  v7 = v19;
  v8 = v20;
  v9 = v21;
  v10 = v22;
  v11 = v23;
  v12 = v24;
  v13 = v25;
  v14 = v26;
  result = v27;
  v16 = v28;
  v17 = v29;
  *(_BYTE *)a1 = v18[0];
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 26) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  *(_BYTE *)(a1 + 48) = v11;
  *(_BYTE *)(a1 + 49) = v12;
  *(_QWORD *)(a1 + 56) = v13;
  *(_BYTE *)(a1 + 64) = v14;
  *(_QWORD *)(a1 + 72) = result;
  *(_BYTE *)(a1 + 80) = v16;
  *(_BYTE *)(a1 + 81) = v17;
  return result;
}

uint64_t sub_1001E2A30@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t result;
  char v17;
  char v18;
  _QWORD v19[3];
  __int16 v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  char v30;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100244D40);
  v5 = swift_getKeyPath(&unk_100244D68);
  static Published.subscript.getter(v19, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  v6 = v19[1];
  v7 = v19[2];
  v8 = v20;
  v9 = v21;
  v10 = v22;
  v11 = v23;
  v12 = v24;
  v13 = v25;
  v14 = v26;
  v15 = v27;
  result = v28;
  v17 = v29;
  v18 = v30;
  *(_BYTE *)a2 = v19[0];
  *(_QWORD *)(a2 + 8) = v6;
  *(_QWORD *)(a2 + 16) = v7;
  *(_WORD *)(a2 + 24) = v8;
  *(_BYTE *)(a2 + 26) = v9;
  *(_QWORD *)(a2 + 32) = v10;
  *(_QWORD *)(a2 + 40) = v11;
  *(_BYTE *)(a2 + 48) = v12;
  *(_BYTE *)(a2 + 49) = v13;
  *(_QWORD *)(a2 + 56) = v14;
  *(_BYTE *)(a2 + 64) = v15;
  *(_QWORD *)(a2 + 72) = result;
  *(_BYTE *)(a2 + 80) = v17;
  *(_BYTE *)(a2 + 81) = v18;
  return result;
}

uint64_t sub_1001E2B0C(char *a1, void **a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t KeyPath;
  _BYTE v20[8];
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  char v33;

  v2 = *a1;
  v4 = *((_QWORD *)a1 + 1);
  v3 = *((_QWORD *)a1 + 2);
  v5 = *((_WORD *)a1 + 12);
  v6 = a1[26];
  v7 = *((_QWORD *)a1 + 4);
  v8 = *((_QWORD *)a1 + 5);
  v9 = a1[48];
  v10 = a1[49];
  v11 = *((_QWORD *)a1 + 7);
  v12 = a1[64];
  v16 = *((_QWORD *)a1 + 9);
  v14 = a1[81];
  v15 = a1[80];
  v18 = *a2;
  KeyPath = swift_getKeyPath(&unk_100244D40);
  v17 = swift_getKeyPath(&unk_100244D68);
  v20[0] = v2;
  v21 = v4;
  v22 = v3;
  v23 = v5;
  v24 = v6;
  v25 = v7;
  v26 = v8;
  v27 = v9;
  v28 = v10;
  v29 = v11;
  v30 = v12;
  v31 = v16;
  v32 = v15;
  v33 = v14;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v7);
  return static Published.subscript.setter(v20, v18, KeyPath, v17);
}

uint64_t sub_1001E2C24()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  uint64_t v10;
  uint64_t v11;
  char v12;
  unsigned __int8 v13;

  KeyPath = swift_getKeyPath(&unk_100244D40);
  v2 = swift_getKeyPath(&unk_100244D68);
  static Published.subscript.getter(v9, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  v3 = v10;
  LOBYTE(v2) = v12;
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v3);
  if ((v2 & 1) != 0)
    return 1;
  v5 = swift_getKeyPath(&unk_100244D40);
  v6 = swift_getKeyPath(&unk_100244D68);
  static Published.subscript.getter(v9, v0, v5, v6);
  swift_release(v5);
  swift_release(v6);
  v7 = v10;
  v4 = v13;
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v7);
  return v4;
}

void sub_1001E2D14()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_1002B3AA0 != -1)
    swift_once(&qword_1002B3AA0, sub_100190478);
  v1 = type metadata accessor for Logger(0);
  sub_10018DBC8(v1, (uint64_t)qword_1002BF0A8);
  v2 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = swift_slowAlloc(32, -1);
    v22 = v5;
    *(_DWORD *)v4 = 136315138;
    v21 = sub_10018FCE8(0x7261657070416E6FLL, 0xEA00000000002928, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s getting traffic descriptors", v4, 0xCu);
    swift_arrayDestroy(v5, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);
  }

  v6 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService), "getTrafficDescriptors");
  if (!v6)
  {
    v11 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v19 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v11, v19))
    {
LABEL_11:

      return;
    }
    v13 = swift_slowAlloc(12, -1);
    v20 = swift_slowAlloc(32, -1);
    v22 = v20;
    *(_DWORD *)v13 = 136315138;
    v21 = sub_10018FCE8(0x7261657070416E6FLL, 0xEA00000000002928, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 4, v13 + 12);
    _os_log_impl((void *)&_mh_execute_header, v11, v19, "%s: no descriptors available", (uint8_t *)v13, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    v18 = v20;
LABEL_10:
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v13, -1, -1);
    goto LABEL_11;
  }
  v7 = v6;
  v8 = sub_1001548C8(0, &qword_1002B8138, &off_10025DCE0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  v10 = swift_bridgeObjectRetain(v9);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(22, -1);
    v14 = swift_slowAlloc(64, -1);
    v22 = v14;
    *(_DWORD *)v13 = 136315394;
    v21 = sub_10018FCE8(0x7261657070416E6FLL, 0xEA00000000002928, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 4, v13 + 12);
    *(_WORD *)(v13 + 12) = 2080;
    v15 = Array.description.getter(v9, v8);
    v17 = v16;
    v21 = sub_10018FCE8(v15, v16, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 14, v13 + 22);
    swift_bridgeObjectRelease_n(v9, 2);
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy(v14, 2, (char *)&type metadata for Any + 8);
    v18 = v14;
    goto LABEL_10;
  }

  swift_bridgeObjectRelease_n(v9, 2);
}

void sub_1001E311C(signed __int8 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSNumber v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD v38[3];
  _BYTE v39[8];
  uint64_t v40;
  _QWORD v41[3];
  _BYTE v42[8];
  uint64_t v43;
  uint64_t v44;

  v2 = v1;
  if (qword_1002B3AA0 != -1)
    swift_once(&qword_1002B3AA0, sub_100190478);
  v4 = type metadata accessor for Logger(0);
  sub_10018DBC8(v4, (uint64_t)qword_1002BF0A8);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v43 = v8;
    *(_DWORD *)v7 = 136315138;
    v40 = sub_10018FCE8(0xD00000000000001ALL, 0x80000001002167A0, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, v41, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s invoked", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }

  if (a1 != 24)
  {
    if (qword_1002B3A98 != -1)
      swift_once(&qword_1002B3A98, sub_100190468);
    sub_10018DBC8(v4, (uint64_t)qword_1002BF090);
    v21 = Logger.logObject.getter();
    v22 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v23 = 134217984;
      v43 = qword_100244E70[a1];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v23 + 4, v23 + 12);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "settings application category to %ld", v23, 0xCu);
      swift_slowDealloc(v23, -1, -1);
    }

    sub_1001548C8(0, &qword_1002B5680, NSNumber_ptr);
    v24.super.super.isa = NSNumber.init(integerLiteral:)(qword_100244E70[a1]).super.super.isa;
    v25 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService), "setApplicationCategory:", v24.super.super.isa);
    if (!v25)
    {

      return;
    }
    v26 = v25;
    v27 = Logger.logObject.getter();
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc(22, -1);
      v30 = swift_slowAlloc(64, -1);
      v43 = v30;
      *(_DWORD *)v29 = 136315394;
      v31 = sub_1001A3EE0(a1);
      v33 = v32;
      v40 = sub_10018FCE8(v31, v32, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, v41, v29 + 4, v29 + 12);
      swift_bridgeObjectRelease(v33);
      *(_WORD *)(v29 + 12) = 2080;
      swift_getErrorValue(v26, v39, v38);
      v34 = Error.localizedDescription.getter(v38[1], v38[2]);
      v36 = v35;
      v40 = sub_10018FCE8(v34, v35, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, v41, v29 + 14, v29 + 22);

      swift_bridgeObjectRelease(v36);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "unable to set category %s due to %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

    }
    else
    {

    }
    goto LABEL_23;
  }
  if (qword_1002B3A98 != -1)
    swift_once(&qword_1002B3A98, sub_100190468);
  sub_10018DBC8(v4, (uint64_t)qword_1002BF090);
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "settings application category to nil", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  v12 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService), "setApplicationCategory:", 0);
  if (v12)
  {
    v13 = v12;
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(12, -1);
      v17 = swift_slowAlloc(32, -1);
      v43 = v17;
      *(_DWORD *)v16 = 136315138;
      swift_getErrorValue(v13, v42, v41);
      v18 = Error.localizedDescription.getter(v41[1], v41[2]);
      v20 = v19;
      v40 = sub_10018FCE8(v18, v19, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, v41, v16 + 4, v16 + 12);

      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "unable to set category (nil) due to %s", v16, 0xCu);
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);

    }
    else
    {

    }
LABEL_23:
    v37 = sub_1001E3F7C();
    swift_allocError(&type metadata for SPSlicingError, v37, 0, 0);
    swift_willThrow();
  }
}

char *sub_1001E37BC(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  __int128 v4;
  __int128 v5;
  char *v6;
  id v7;
  char *v8;
  objc_super v10;
  _OWORD v11[5];
  __int16 v12;
  _BYTE v13[24];

  ObjectType = (objc_class *)swift_getObjectType(v1);
  swift_beginAccess(&v1[OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel__model], v13, 33, 0);
  v4 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v4;
  v11[4] = *(_OWORD *)(a1 + 64);
  v12 = *(_WORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  v6 = v1;
  Published.init(initialValue:)(v11, &type metadata for SURLSessionModel);
  swift_endAccess(v13);
  v7 = objc_msgSend(objc_allocWithZone((Class)SPCoreTelephonyAdapter), "init");
  *(_QWORD *)&v6[OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService] = v7;

  v10.receiver = v6;
  v10.super_class = ObjectType;
  v8 = (char *)objc_msgSendSuper2(&v10, "init");
  objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService], "setDelegate:", v8);
  return v8;
}

uint64_t sub_1001E3930()
{
  return type metadata accessor for SURLSessionViewModel(0);
}

uint64_t type metadata accessor for SURLSessionViewModel(uint64_t a1)
{
  uint64_t result;

  result = qword_1002B80B8;
  if (!qword_1002B80B8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SURLSessionViewModel);
  return result;
}

void sub_1001E3974(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  sub_1001E39EC();
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
  }
}

void sub_1001E39EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1002B80C8)
  {
    v0 = type metadata accessor for Published(0, &type metadata for SURLSessionModel);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1002B80C8);
  }
}

uint64_t sub_1001E3B30()
{
  return EnvironmentValues.dismiss.getter();
}

void sub_1001E3B50(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;

  if (qword_1002B3A98 != -1)
    swift_once(&qword_1002B3A98, sub_100190468);
  v8 = type metadata accessor for Logger(0);
  sub_10018DBC8(v8, (uint64_t)qword_1002BF090);
  swift_bridgeObjectRetain_n(a1, 2);
  v9 = swift_bridgeObjectRetain_n(a3, 2);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(28, -1);
    v13 = swift_slowAlloc(64, -1);
    v21 = v13;
    *(_DWORD *)v12 = 136315650;
    v14 = sub_1001548C8(0, &qword_1002B8138, &off_10025DCE0);
    v15 = swift_bridgeObjectRetain(a1);
    v16 = Array.description.getter(v15, v14);
    v19 = a4;
    v18 = v17;
    swift_bridgeObjectRelease(a1);
    v20 = sub_10018FCE8(v16, v18, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v18);
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain(a3);
    v20 = sub_10018FCE8(a2, a3, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v12 + 14, v12 + 22);
    swift_bridgeObjectRelease_n(a3, 3);
    *(_WORD *)(v12 + 22) = 1024;
    LODWORD(v20) = v19 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, (char *)&v20 + 4, v12 + 24, v12 + 28);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "slicing descriptors were updated: %s appInfo=%s status=%{BOOL}d", (uint8_t *)v12, 0x1Cu);
    swift_arrayDestroy(v13, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    swift_bridgeObjectRelease_n(a1, 2);
  }
}

void sub_1001E3DC4(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;

  if (qword_1002B3A98 != -1)
    swift_once(&qword_1002B3A98, sub_100190468);
  v2 = type metadata accessor for Logger(0);
  sub_10018DBC8(v2, (uint64_t)qword_1002BF090);
  v9 = a1;
  v3 = Logger.logObject.getter(v9);
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v10 = v9;
    v7 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4, v5 + 12);
    *v6 = v9;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "slicing running app state changed: %@", v5, 0xCu);
    v8 = sub_100146438((uint64_t *)&unk_1002B6990);
    swift_arrayDestroy(v6, 1, v8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
}

unint64_t sub_1001E3F7C()
{
  unint64_t result;

  result = qword_1002B8148;
  if (!qword_1002B8148)
  {
    result = swift_getWitnessTable(&unk_100244E2C, &type metadata for SPSlicingError);
    atomic_store(result, (unint64_t *)&qword_1002B8148);
  }
  return result;
}

uint64_t sub_1001E3FC0()
{
  return EnvironmentValues.dismiss.getter();
}

unint64_t sub_1001E3FE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B8150;
  if (!qword_1002B8150)
  {
    v1 = type metadata accessor for SURLSessionRunningViewModel(255);
    result = swift_getWitnessTable(&unk_100242D00, v1);
    atomic_store(result, (unint64_t *)&qword_1002B8150);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SPSlicingError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1001E4068 + 4 * byte_100244CD0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1001E4088 + 4 * byte_100244CD5[v4]))();
}

_BYTE *sub_1001E4068(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1001E4088(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1001E4090(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1001E4098(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1001E40A0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1001E40A8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SPSlicingError()
{
  return &type metadata for SPSlicingError;
}

unint64_t sub_1001E40C8()
{
  unint64_t result;

  result = qword_1002B8160;
  if (!qword_1002B8160)
  {
    result = swift_getWitnessTable(&unk_100244E04, &type metadata for SPSlicingError);
    atomic_store(result, (unint64_t *)&qword_1002B8160);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC13FTMInternal_4P33_367F6D6C6738F3712C8E30AA2E13751E19ResourceBundleClass);
}

void sub_1001E412C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = 138412802;
  v4 = CFSTR("NRSlicing");
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to read carrier bundle key %@ from context %@ with error: %@", (uint8_t *)&v3, 0x20u);
}

void sub_1001E41C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100020560((void *)&_mh_execute_header, a1, a3, "Unable to determine current subscription context", a5, a6, a7, a8, 0);
  sub_100020580();
}

void sub_1001E41F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100020570((void *)&_mh_execute_header, a1, a3, "Expected %@ key to be dictionary type", a5, a6, a7, a8, 2u);
}

void sub_1001E4264(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100020570((void *)&_mh_execute_header, a1, a3, "Expected %@ key to be dictionary type", a5, a6, a7, a8, 2u);
}

void sub_1001E42D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100020560((void *)&_mh_execute_header, a1, a3, "Unable to obtain current data subscription context", a5, a6, a7, a8, 0);
  sub_100020580();
}

void sub_1001E4308(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error setting the category %@. %@", (uint8_t *)&v3, 0x16u);
}

void sub_1001E438C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error getting slice traffic descriptors %@", (uint8_t *)&v2, 0xCu);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend__coreTelephonyAppInfoContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyAppInfoContainer:");
}

id objc_msgSend__coreTelephonyAppInfoList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyAppInfoList:");
}

id objc_msgSend__coreTelephonyApplicationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyApplicationInfo:");
}

id objc_msgSend__coreTelephonyContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyContainer:");
}

id objc_msgSend__coreTelephonyDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyDescriptor:");
}

id objc_msgSend__coreTelephonyDescritorList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyDescritorList:");
}

id objc_msgSend__coreTelephonyInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyInterface:");
}

id objc_msgSend__coreTelephonyInterfaceList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreTelephonyInterfaceList:");
}

id objc_msgSend__getCarrierBundleKeyForDataContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCarrierBundleKeyForDataContext:");
}

id objc_msgSend__getCarrierBundleKeyValue_forContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCarrierBundleKeyValue:forContext:");
}

id objc_msgSend__handleSubscriptionAndBundleChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSubscriptionAndBundleChange:");
}

id objc_msgSend__loadSlicingConfigForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSlicingConfigForContext:");
}

id objc_msgSend__loadSubscriptionInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSubscriptionInfo");
}

id objc_msgSend__loadSubscriptionInfoForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSubscriptionInfoForContext:");
}

id objc_msgSend_acTxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acTxBinsAtIndex:");
}

id objc_msgSend_acTxBinsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acTxBinsCount");
}

id objc_msgSend_adTxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adTxBinsAtIndex:");
}

id objc_msgSend_adTxBinsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adTxBinsCount");
}

id objc_msgSend_addAcTxBins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAcTxBins:");
}

id objc_msgSend_addAdTxBins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAdTxBins:");
}

id objc_msgSend_addBandInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBandInfo:");
}

id objc_msgSend_addBearerContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBearerContexts:");
}

id objc_msgSend_addBoundDurationSecs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBoundDurationSecs:");
}

id objc_msgSend_addCapEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCapEvent:");
}

id objc_msgSend_addCapHist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCapHist:");
}

id objc_msgSend_addCarrierInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCarrierInfo:");
}

id objc_msgSend_addCauseCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCauseCount:");
}

id objc_msgSend_addCauseCountAp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCauseCountAp:");
}

id objc_msgSend_addCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCell:");
}

id objc_msgSend_addConnReqRel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConnReqRel:");
}

id objc_msgSend_addCountOfInvalidationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCountOfInvalidationReason:");
}

id objc_msgSend_addCsTxPwr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCsTxPwr:");
}

id objc_msgSend_addCtolReselCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCtolReselCount:");
}

id objc_msgSend_addDelayCnt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelayCnt:");
}

id objc_msgSend_addDrb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDrb:");
}

id objc_msgSend_addDrbConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDrbConfig:");
}

id objc_msgSend_addEf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEf:");
}

id objc_msgSend_addEhplmnList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEhplmnList:");
}

id objc_msgSend_addEndStatusCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndStatusCount:");
}

id objc_msgSend_addEndStatusCountAp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndStatusCountAp:");
}

id objc_msgSend_addEndStatusCountConnectedCdma_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndStatusCountConnectedCdma:");
}

id objc_msgSend_addEndStatusCountConnectedGw_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndStatusCountConnectedGw:");
}

id objc_msgSend_addEndStatusCountNotConnectedCdma_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndStatusCountNotConnectedCdma:");
}

id objc_msgSend_addEndStatusCountNotConnectedGw_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEndStatusCountNotConnectedGw:");
}

id objc_msgSend_addEplmnList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEplmnList:");
}

id objc_msgSend_addEstablishCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEstablishCause:");
}

id objc_msgSend_addEutraPrioInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEutraPrioInfo:");
}

id objc_msgSend_addFailureCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFailureCount:");
}

id objc_msgSend_addFailureCountAp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFailureCountAp:");
}

id objc_msgSend_addFetchStateDurationSecs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFetchStateDurationSecs:");
}

id objc_msgSend_addFromLteHoCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFromLteHoCount:");
}

id objc_msgSend_addFromLteRedirCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFromLteRedirCount:");
}

id objc_msgSend_addFromLteReselCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFromLteReselCount:");
}

id objc_msgSend_addGeraNcell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGeraNcell:");
}

id objc_msgSend_addGsmNcellMeas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGsmNcellMeas:");
}

id objc_msgSend_addGsmPrioInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGsmPrioInfo:");
}

id objc_msgSend_addHcStat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHcStat:");
}

id objc_msgSend_addHdrRx0IdleCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHdrRx0IdleCount:");
}

id objc_msgSend_addHdrRx0TrafficCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHdrRx0TrafficCount:");
}

id objc_msgSend_addHdrRx1TrafficCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHdrRx1TrafficCount:");
}

id objc_msgSend_addHdrTxTrafficCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHdrTxTrafficCount:");
}

id objc_msgSend_addHistPerBand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHistPerBand:");
}

id objc_msgSend_addHomeSidNidList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHomeSidNidList:");
}

id objc_msgSend_addInstValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInstValues:");
}

id objc_msgSend_addIntraFreqPci_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntraFreqPci:");
}

id objc_msgSend_addLteChanInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLteChanInfo:");
}

id objc_msgSend_addLteMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLteMetrics:");
}

id objc_msgSend_addLteNcellMeas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLteNcellMeas:");
}

id objc_msgSend_addMeasGsmResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMeasGsmResult:");
}

id objc_msgSend_addMeasLteResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMeasLteResult:");
}

id objc_msgSend_addMeasNbrEutra_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMeasNbrEutra:");
}

id objc_msgSend_addMeasNbrGeran_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMeasNbrGeran:");
}

id objc_msgSend_addMeasNbrUtra_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMeasNbrUtra:");
}

id objc_msgSend_addMeasUtraResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMeasUtraResult:");
}

id objc_msgSend_addMultiBandInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMultiBandInfo:");
}

id objc_msgSend_addNbrEutra_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNbrEutra:");
}

id objc_msgSend_addNewBeamInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNewBeamInfo:");
}

id objc_msgSend_addNumRxLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNumRxLevel:");
}

id objc_msgSend_addNumTxLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNumTxLevel:");
}

id objc_msgSend_addNwUeCapStat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNwUeCapStat:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addOldBeamInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOldBeamInfo:");
}

id objc_msgSend_addOosStateCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOosStateCount:");
}

id objc_msgSend_addOosStateDurationMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOosStateDurationMs:");
}

id objc_msgSend_addOosToOosCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOosToOosCount:");
}

id objc_msgSend_addPci_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPci:");
}

id objc_msgSend_addPerBand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPerBand:");
}

id objc_msgSend_addPerDrbConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPerDrbConfig:");
}

id objc_msgSend_addPucchCounter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPucchCounter:");
}

id objc_msgSend_addPuschCounter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPuschCounter:");
}

id objc_msgSend_addRbData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRbData:");
}

id objc_msgSend_addRecoverCountStateBreak_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRecoverCountStateBreak:");
}

id objc_msgSend_addRecoverHist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRecoverHist:");
}

id objc_msgSend_addRedirArfcn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRedirArfcn:");
}

id objc_msgSend_addRegProvFlaiList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRegProvFlaiList:");
}

id objc_msgSend_addRegProvFtaiList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRegProvFtaiList:");
}

id objc_msgSend_addReleaseCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReleaseCause:");
}

id objc_msgSend_addReleaseCauseCountConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReleaseCauseCountConnected:");
}

id objc_msgSend_addReleaseCauseCountConnectedGsm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReleaseCauseCountConnectedGsm:");
}

id objc_msgSend_addReleaseCauseCountConnectedWcdma_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReleaseCauseCountConnectedWcdma:");
}

id objc_msgSend_addReleaseCauseCountNotConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReleaseCauseCountNotConnected:");
}

id objc_msgSend_addReleaseCauseCountNotConnectedGsm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReleaseCauseCountNotConnectedGsm:");
}

id objc_msgSend_addReleaseCauseCountNotConnectedWcdma_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReleaseCauseCountNotConnectedWcdma:");
}

id objc_msgSend_addRfMeasInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRfMeasInfo:");
}

id objc_msgSend_addRlfCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRlfCause:");
}

id objc_msgSend_addRlfCauseSensor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRlfCauseSensor:");
}

id objc_msgSend_addRoamingFlaiList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRoamingFlaiList:");
}

id objc_msgSend_addRoamingFtaiList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRoamingFtaiList:");
}

id objc_msgSend_addRrcConnReestReq_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcConnReestReq:");
}

id objc_msgSend_addRrcConnReject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcConnReject:");
}

id objc_msgSend_addRrcConnRel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcConnRel:");
}

id objc_msgSend_addRrcConnReqCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcConnReqCause:");
}

id objc_msgSend_addRrcConnRlf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcConnRlf:");
}

id objc_msgSend_addRrcConnSetupReq_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcConnSetupReq:");
}

id objc_msgSend_addRrcResumeReq_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRrcResumeReq:");
}

id objc_msgSend_addRsrp0_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRsrp0:");
}

id objc_msgSend_addRsrp1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRsrp1:");
}

id objc_msgSend_addRsrp2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRsrp2:");
}

id objc_msgSend_addRsrp3_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRsrp3:");
}

id objc_msgSend_addRsrq0_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRsrq0:");
}

id objc_msgSend_addRsrq1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRsrq1:");
}

id objc_msgSend_addRsrq2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRsrq2:");
}

id objc_msgSend_addRsrq3_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRsrq3:");
}

id objc_msgSend_addRx0IdleCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRx0IdleCount:");
}

id objc_msgSend_addRx0TrafficCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRx0TrafficCount:");
}

id objc_msgSend_addRx1TrafficCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRx1TrafficCount:");
}

id objc_msgSend_addRxBeamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRxBeamId:");
}

id objc_msgSend_addRxBins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRxBins:");
}

id objc_msgSend_addRxBinsIdle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRxBinsIdle:");
}

id objc_msgSend_addRxHist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRxHist:");
}

id objc_msgSend_addRxInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRxInfo:");
}

id objc_msgSend_addRxPowerHist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRxPowerHist:");
}

id objc_msgSend_addSccList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSccList:");
}

id objc_msgSend_addSecRxBins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSecRxBins:");
}

id objc_msgSend_addSecRxBinsIdle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSecRxBinsIdle:");
}

id objc_msgSend_addSecTxBins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSecTxBins:");
}

id objc_msgSend_addServingCellBeamInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServingCellBeamInfo:");
}

id objc_msgSend_addSfScheduledByState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSfScheduledByState:");
}

id objc_msgSend_addSfScheduledByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSfScheduledByType:");
}

id objc_msgSend_addSib_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSib:");
}

id objc_msgSend_addSinr0_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSinr0:");
}

id objc_msgSend_addSinr1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSinr1:");
}

id objc_msgSend_addSinr2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSinr2:");
}

id objc_msgSend_addSinr3_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSinr3:");
}

id objc_msgSend_addSizeTbTotalByState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSizeTbTotalByState:");
}

id objc_msgSend_addSizeTbTotalByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSizeTbTotalByType:");
}

id objc_msgSend_addSrb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSrb:");
}

id objc_msgSend_addSrvStat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSrvStat:");
}

id objc_msgSend_addStateHist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStateHist:");
}

id objc_msgSend_addTaiList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTaiList:");
}

id objc_msgSend_addTxBins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTxBins:");
}

id objc_msgSend_addTxHist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTxHist:");
}

id objc_msgSend_addTxPowerHist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTxPowerHist:");
}

id objc_msgSend_addTxPowerInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTxPowerInfo:");
}

id objc_msgSend_addTxTrafficCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTxTrafficCount:");
}

id objc_msgSend_addUlSfScheduledByState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUlSfScheduledByState:");
}

id objc_msgSend_addUlSfScheduledByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUlSfScheduledByType:");
}

id objc_msgSend_addUlSizeTbTotalByState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUlSizeTbTotalByState:");
}

id objc_msgSend_addUlSizeTbTotalByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUlSizeTbTotalByType:");
}

id objc_msgSend_addUmtsChanInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUmtsChanInfo:");
}

id objc_msgSend_addUmtsNcellMeas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUmtsNcellMeas:");
}

id objc_msgSend_addUtraNcell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUtraNcell:");
}

id objc_msgSend_addUtraPrioInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUtraPrioInfo:");
}

id objc_msgSend_addWtolRedirCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addWtolRedirCount:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "address");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_appCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appCategory");
}

id objc_msgSend_appsInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appsInfo");
}

id objc_msgSend_bandInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bandInfoAtIndex:");
}

id objc_msgSend_bandInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bandInfosCount");
}

id objc_msgSend_bearerContextsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bearerContextsAtIndex:");
}

id objc_msgSend_bearerContextsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bearerContextsCount");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bootstrap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootstrap");
}

id objc_msgSend_boundDurationSecsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundDurationSecsAtIndex:");
}

id objc_msgSend_boundDurationSecsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundDurationSecsCount");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleId");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_capEventAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capEventAtIndex:");
}

id objc_msgSend_capEventsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capEventsCount");
}

id objc_msgSend_capHistAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capHistAtIndex:");
}

id objc_msgSend_capHistsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capHistsCount");
}

id objc_msgSend_carrierBundleDidUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carrierBundleDidUpdate");
}

id objc_msgSend_carrierBundleType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carrierBundleType");
}

id objc_msgSend_carrierInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carrierInfoAtIndex:");
}

id objc_msgSend_carrierInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carrierInfosCount");
}

id objc_msgSend_causeCountApAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "causeCountApAtIndex:");
}

id objc_msgSend_causeCountApsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "causeCountApsCount");
}

id objc_msgSend_causeCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "causeCountAtIndex:");
}

id objc_msgSend_causeCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "causeCountsCount");
}

id objc_msgSend_cellAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellAtIndex:");
}

id objc_msgSend_cellsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellsCount");
}

id objc_msgSend_clearAcTxBins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAcTxBins");
}

id objc_msgSend_clearAdTxBins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAdTxBins");
}

id objc_msgSend_clearBandInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearBandInfos");
}

id objc_msgSend_clearBearerContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearBearerContexts");
}

id objc_msgSend_clearBoundDurationSecs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearBoundDurationSecs");
}

id objc_msgSend_clearCapEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCapEvents");
}

id objc_msgSend_clearCapHists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCapHists");
}

id objc_msgSend_clearCarrierInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCarrierInfos");
}

id objc_msgSend_clearCauseCountAps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCauseCountAps");
}

id objc_msgSend_clearCauseCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCauseCounts");
}

id objc_msgSend_clearCells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCells");
}

id objc_msgSend_clearConnReqRels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearConnReqRels");
}

id objc_msgSend_clearCountOfInvalidationReasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCountOfInvalidationReasons");
}

id objc_msgSend_clearCsTxPwrs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCsTxPwrs");
}

id objc_msgSend_clearCtolReselCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCtolReselCounts");
}

id objc_msgSend_clearDelayCnts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDelayCnts");
}

id objc_msgSend_clearDrbConfigs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDrbConfigs");
}

id objc_msgSend_clearDrbs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDrbs");
}

id objc_msgSend_clearEfs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEfs");
}

id objc_msgSend_clearEhplmnLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEhplmnLists");
}

id objc_msgSend_clearEndStatusCountAps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEndStatusCountAps");
}

id objc_msgSend_clearEndStatusCountConnectedCdmas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEndStatusCountConnectedCdmas");
}

id objc_msgSend_clearEndStatusCountConnectedGws(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEndStatusCountConnectedGws");
}

id objc_msgSend_clearEndStatusCountNotConnectedCdmas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEndStatusCountNotConnectedCdmas");
}

id objc_msgSend_clearEndStatusCountNotConnectedGws(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEndStatusCountNotConnectedGws");
}

id objc_msgSend_clearEndStatusCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEndStatusCounts");
}

id objc_msgSend_clearEplmnLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEplmnLists");
}

id objc_msgSend_clearEstablishCauses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEstablishCauses");
}

id objc_msgSend_clearEutraPrioInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEutraPrioInfos");
}

id objc_msgSend_clearFailureCountAps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFailureCountAps");
}

id objc_msgSend_clearFailureCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFailureCounts");
}

id objc_msgSend_clearFetchStateDurationSecs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFetchStateDurationSecs");
}

id objc_msgSend_clearFromLteHoCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFromLteHoCounts");
}

id objc_msgSend_clearFromLteRedirCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFromLteRedirCounts");
}

id objc_msgSend_clearFromLteReselCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFromLteReselCounts");
}

id objc_msgSend_clearGeraNcells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearGeraNcells");
}

id objc_msgSend_clearGsmNcellMeas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearGsmNcellMeas");
}

id objc_msgSend_clearGsmPrioInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearGsmPrioInfos");
}

id objc_msgSend_clearHcStats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHcStats");
}

id objc_msgSend_clearHdrRx0IdleCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHdrRx0IdleCounts");
}

id objc_msgSend_clearHdrRx0TrafficCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHdrRx0TrafficCounts");
}

id objc_msgSend_clearHdrRx1TrafficCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHdrRx1TrafficCounts");
}

id objc_msgSend_clearHdrTxTrafficCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHdrTxTrafficCounts");
}

id objc_msgSend_clearHistPerBands(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHistPerBands");
}

id objc_msgSend_clearHomeSidNidLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHomeSidNidLists");
}

id objc_msgSend_clearInstValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearInstValues");
}

id objc_msgSend_clearIntraFreqPcis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearIntraFreqPcis");
}

id objc_msgSend_clearLteChanInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLteChanInfos");
}

id objc_msgSend_clearLteMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLteMetrics");
}

id objc_msgSend_clearLteNcellMeas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLteNcellMeas");
}

id objc_msgSend_clearMeasGsmResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMeasGsmResults");
}

id objc_msgSend_clearMeasLteResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMeasLteResults");
}

id objc_msgSend_clearMeasNbrEutras(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMeasNbrEutras");
}

id objc_msgSend_clearMeasNbrGerans(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMeasNbrGerans");
}

id objc_msgSend_clearMeasNbrUtras(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMeasNbrUtras");
}

id objc_msgSend_clearMeasUtraResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMeasUtraResults");
}

id objc_msgSend_clearMultiBandInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMultiBandInfos");
}

id objc_msgSend_clearNbrEutras(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNbrEutras");
}

id objc_msgSend_clearNewBeamInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNewBeamInfos");
}

id objc_msgSend_clearNumRxLevels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNumRxLevels");
}

id objc_msgSend_clearNumTxLevels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNumTxLevels");
}

id objc_msgSend_clearNwUeCapStats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNwUeCapStats");
}

id objc_msgSend_clearOldBeamInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearOldBeamInfos");
}

id objc_msgSend_clearOosStateCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearOosStateCounts");
}

id objc_msgSend_clearOosStateDurationMs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearOosStateDurationMs");
}

id objc_msgSend_clearOosToOosCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearOosToOosCounts");
}

id objc_msgSend_clearPcis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPcis");
}

id objc_msgSend_clearPerBands(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPerBands");
}

id objc_msgSend_clearPerDrbConfigs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPerDrbConfigs");
}

id objc_msgSend_clearPucchCounters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPucchCounters");
}

id objc_msgSend_clearPuschCounters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPuschCounters");
}

id objc_msgSend_clearRbDatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRbDatas");
}

id objc_msgSend_clearRecoverCountStateBreaks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRecoverCountStateBreaks");
}

id objc_msgSend_clearRecoverHists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRecoverHists");
}

id objc_msgSend_clearRedirArfcns(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRedirArfcns");
}

id objc_msgSend_clearRegProvFlaiLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRegProvFlaiLists");
}

id objc_msgSend_clearRegProvFtaiLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRegProvFtaiLists");
}

id objc_msgSend_clearReleaseCauseCountConnectedGsms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearReleaseCauseCountConnectedGsms");
}

id objc_msgSend_clearReleaseCauseCountConnectedWcdmas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearReleaseCauseCountConnectedWcdmas");
}

id objc_msgSend_clearReleaseCauseCountConnecteds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearReleaseCauseCountConnecteds");
}

id objc_msgSend_clearReleaseCauseCountNotConnectedGsms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearReleaseCauseCountNotConnectedGsms");
}

id objc_msgSend_clearReleaseCauseCountNotConnectedWcdmas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearReleaseCauseCountNotConnectedWcdmas");
}

id objc_msgSend_clearReleaseCauseCountNotConnecteds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearReleaseCauseCountNotConnecteds");
}

id objc_msgSend_clearReleaseCauses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearReleaseCauses");
}

id objc_msgSend_clearRfMeasInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRfMeasInfos");
}

id objc_msgSend_clearRlfCauseSensors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRlfCauseSensors");
}

id objc_msgSend_clearRlfCauses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRlfCauses");
}

id objc_msgSend_clearRoamingFlaiLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRoamingFlaiLists");
}

id objc_msgSend_clearRoamingFtaiLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRoamingFtaiLists");
}

id objc_msgSend_clearRrcConnReestReqs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRrcConnReestReqs");
}

id objc_msgSend_clearRrcConnRejects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRrcConnRejects");
}

id objc_msgSend_clearRrcConnRels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRrcConnRels");
}

id objc_msgSend_clearRrcConnReqCauses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRrcConnReqCauses");
}

id objc_msgSend_clearRrcConnRlfs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRrcConnRlfs");
}

id objc_msgSend_clearRrcConnSetupReqs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRrcConnSetupReqs");
}

id objc_msgSend_clearRrcResumeReqs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRrcResumeReqs");
}

id objc_msgSend_clearRsrp0s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRsrp0s");
}

id objc_msgSend_clearRsrp1s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRsrp1s");
}

id objc_msgSend_clearRsrp2s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRsrp2s");
}

id objc_msgSend_clearRsrp3s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRsrp3s");
}

id objc_msgSend_clearRsrq0s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRsrq0s");
}

id objc_msgSend_clearRsrq1s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRsrq1s");
}

id objc_msgSend_clearRsrq2s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRsrq2s");
}

id objc_msgSend_clearRsrq3s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRsrq3s");
}

id objc_msgSend_clearRx0IdleCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRx0IdleCounts");
}

id objc_msgSend_clearRx0TrafficCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRx0TrafficCounts");
}

id objc_msgSend_clearRx1TrafficCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRx1TrafficCounts");
}

id objc_msgSend_clearRxBeamIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRxBeamIds");
}

id objc_msgSend_clearRxBins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRxBins");
}

id objc_msgSend_clearRxBinsIdles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRxBinsIdles");
}

id objc_msgSend_clearRxHists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRxHists");
}

id objc_msgSend_clearRxInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRxInfos");
}

id objc_msgSend_clearRxPowerHists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRxPowerHists");
}

id objc_msgSend_clearSccLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSccLists");
}

id objc_msgSend_clearSecRxBins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSecRxBins");
}

id objc_msgSend_clearSecRxBinsIdles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSecRxBinsIdles");
}

id objc_msgSend_clearSecTxBins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSecTxBins");
}

id objc_msgSend_clearServingCellBeamInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearServingCellBeamInfos");
}

id objc_msgSend_clearSfScheduledByStates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSfScheduledByStates");
}

id objc_msgSend_clearSfScheduledByTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSfScheduledByTypes");
}

id objc_msgSend_clearSibs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSibs");
}

id objc_msgSend_clearSinr0s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSinr0s");
}

id objc_msgSend_clearSinr1s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSinr1s");
}

id objc_msgSend_clearSinr2s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSinr2s");
}

id objc_msgSend_clearSinr3s(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSinr3s");
}

id objc_msgSend_clearSizeTbTotalByStates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSizeTbTotalByStates");
}

id objc_msgSend_clearSizeTbTotalByTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSizeTbTotalByTypes");
}

id objc_msgSend_clearSrbs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSrbs");
}

id objc_msgSend_clearSrvStats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSrvStats");
}

id objc_msgSend_clearStateHists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStateHists");
}

id objc_msgSend_clearTaiLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTaiLists");
}

id objc_msgSend_clearTxBins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTxBins");
}

id objc_msgSend_clearTxHists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTxHists");
}

id objc_msgSend_clearTxPowerHists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTxPowerHists");
}

id objc_msgSend_clearTxPowerInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTxPowerInfos");
}

id objc_msgSend_clearTxTrafficCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTxTrafficCounts");
}

id objc_msgSend_clearUlSfScheduledByStates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUlSfScheduledByStates");
}

id objc_msgSend_clearUlSfScheduledByTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUlSfScheduledByTypes");
}

id objc_msgSend_clearUlSizeTbTotalByStates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUlSizeTbTotalByStates");
}

id objc_msgSend_clearUlSizeTbTotalByTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUlSizeTbTotalByTypes");
}

id objc_msgSend_clearUmtsChanInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUmtsChanInfos");
}

id objc_msgSend_clearUmtsNcellMeas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUmtsNcellMeas");
}

id objc_msgSend_clearUtraNcells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUtraNcells");
}

id objc_msgSend_clearUtraPrioInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUtraPrioInfos");
}

id objc_msgSend_clearWtolRedirCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearWtolRedirCounts");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "client");
}

id objc_msgSend_connReqRelAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connReqRelAtIndex:");
}

id objc_msgSend_connReqRelsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connReqRelsCount");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyBundleIdentifier_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyBundleIdentifier:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCarrierBundleValue:key:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleVersion_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCarrierBundleVersion:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfInvalidationReasonAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfInvalidationReasonAtIndex:");
}

id objc_msgSend_countOfInvalidationReasonsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfInvalidationReasonsCount");
}

id objc_msgSend_csTxPwrAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csTxPwrAtIndex:");
}

id objc_msgSend_csTxPwrsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csTxPwrsCount");
}

id objc_msgSend_ctolReselCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ctolReselCountAtIndex:");
}

id objc_msgSend_ctolReselCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ctolReselCountsCount");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_delayCntAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayCntAtIndex:");
}

id objc_msgSend_delayCntsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayCntsCount");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dnn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dnn");
}

id objc_msgSend_drbAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drbAtIndex:");
}

id objc_msgSend_drbConfigAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drbConfigAtIndex:");
}

id objc_msgSend_drbConfigsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drbConfigsCount");
}

id objc_msgSend_drbsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drbsCount");
}

id objc_msgSend_efAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "efAtIndex:");
}

id objc_msgSend_efsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "efsCount");
}

id objc_msgSend_ehplmnListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ehplmnListAtIndex:");
}

id objc_msgSend_ehplmnListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ehplmnListsCount");
}

id objc_msgSend_endStatusCountApAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountApAtIndex:");
}

id objc_msgSend_endStatusCountApsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountApsCount");
}

id objc_msgSend_endStatusCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountAtIndex:");
}

id objc_msgSend_endStatusCountConnectedCdmaAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountConnectedCdmaAtIndex:");
}

id objc_msgSend_endStatusCountConnectedCdmasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountConnectedCdmasCount");
}

id objc_msgSend_endStatusCountConnectedGwAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountConnectedGwAtIndex:");
}

id objc_msgSend_endStatusCountConnectedGwsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountConnectedGwsCount");
}

id objc_msgSend_endStatusCountNotConnectedCdmaAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountNotConnectedCdmaAtIndex:");
}

id objc_msgSend_endStatusCountNotConnectedCdmasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountNotConnectedCdmasCount");
}

id objc_msgSend_endStatusCountNotConnectedGwAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountNotConnectedGwAtIndex:");
}

id objc_msgSend_endStatusCountNotConnectedGwsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountNotConnectedGwsCount");
}

id objc_msgSend_endStatusCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endStatusCountsCount");
}

id objc_msgSend_eplmnListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eplmnListAtIndex:");
}

id objc_msgSend_eplmnListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eplmnListsCount");
}

id objc_msgSend_establishCauseAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "establishCauseAtIndex:");
}

id objc_msgSend_establishCausesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "establishCausesCount");
}

id objc_msgSend_eutraPrioInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eutraPrioInfoAtIndex:");
}

id objc_msgSend_eutraPrioInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eutraPrioInfosCount");
}

id objc_msgSend_eventsDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventsDidUpdate:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_failureCountApAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failureCountApAtIndex:");
}

id objc_msgSend_failureCountApsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failureCountApsCount");
}

id objc_msgSend_failureCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failureCountAtIndex:");
}

id objc_msgSend_failureCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failureCountsCount");
}

id objc_msgSend_fetchStateDurationSecsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStateDurationSecsAtIndex:");
}

id objc_msgSend_fetchStateDurationSecsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStateDurationSecsCount");
}

id objc_msgSend_foreground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreground");
}

id objc_msgSend_fromLteHoCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromLteHoCountAtIndex:");
}

id objc_msgSend_fromLteHoCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromLteHoCountsCount");
}

id objc_msgSend_fromLteRedirCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromLteRedirCountAtIndex:");
}

id objc_msgSend_fromLteRedirCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromLteRedirCountsCount");
}

id objc_msgSend_fromLteReselCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromLteReselCountAtIndex:");
}

id objc_msgSend_fromLteReselCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromLteReselCountsCount");
}

id objc_msgSend_geraNcellAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "geraNcellAtIndex:");
}

id objc_msgSend_geraNcellsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "geraNcellsCount");
}

id objc_msgSend_getConnectionState_connectionType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getConnectionState:connectionType:error:");
}

id objc_msgSend_getCurrentDataSubscriptionContextSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentDataSubscriptionContextSync:");
}

id objc_msgSend_getDualSimCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDualSimCapability:");
}

id objc_msgSend_getNRSlicingCBConfigCurrentDataContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNRSlicingCBConfigCurrentDataContext");
}

id objc_msgSend_getSliceTrafficDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSliceTrafficDescriptors:");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_get_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "get_queue");
}

id objc_msgSend_gsmNcellMeasAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gsmNcellMeasAtIndex:");
}

id objc_msgSend_gsmNcellMeasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gsmNcellMeasCount");
}

id objc_msgSend_gsmPrioInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gsmPrioInfoAtIndex:");
}

id objc_msgSend_gsmPrioInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gsmPrioInfosCount");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_hcStatAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hcStatAtIndex:");
}

id objc_msgSend_hcStatsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hcStatsCount");
}

id objc_msgSend_hdrRx0IdleCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hdrRx0IdleCountAtIndex:");
}

id objc_msgSend_hdrRx0IdleCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hdrRx0IdleCountsCount");
}

id objc_msgSend_hdrRx0TrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hdrRx0TrafficCountAtIndex:");
}

id objc_msgSend_hdrRx0TrafficCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hdrRx0TrafficCountsCount");
}

id objc_msgSend_hdrRx1TrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hdrRx1TrafficCountAtIndex:");
}

id objc_msgSend_hdrRx1TrafficCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hdrRx1TrafficCountsCount");
}

id objc_msgSend_hdrTxTrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hdrTxTrafficCountAtIndex:");
}

id objc_msgSend_hdrTxTrafficCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hdrTxTrafficCountsCount");
}

id objc_msgSend_histPerBandAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "histPerBandAtIndex:");
}

id objc_msgSend_histPerBandsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "histPerBandsCount");
}

id objc_msgSend_homeSidNidListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeSidNidListAtIndex:");
}

id objc_msgSend_homeSidNidListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeSidNidListsCount");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_instValuesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instValuesAtIndex:");
}

id objc_msgSend_instValuesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instValuesCount");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interface");
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceName");
}

id objc_msgSend_interfaces(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaces");
}

id objc_msgSend_intraFreqPciAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intraFreqPciAtIndex:");
}

id objc_msgSend_intraFreqPcisCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intraFreqPcisCount");
}

id objc_msgSend_ipProtocol(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ipProtocol");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isValidMetricIdTag_forClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidMetricIdTag:forClass:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lteChanInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lteChanInfoAtIndex:");
}

id objc_msgSend_lteChanInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lteChanInfosCount");
}

id objc_msgSend_lteMetricsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lteMetricsAtIndex:");
}

id objc_msgSend_lteMetricsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lteMetricsCount");
}

id objc_msgSend_lteNcellMeasAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lteNcellMeasAtIndex:");
}

id objc_msgSend_lteNcellMeasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lteNcellMeasCount");
}

id objc_msgSend_measGsmResultAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measGsmResultAtIndex:");
}

id objc_msgSend_measGsmResultsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measGsmResultsCount");
}

id objc_msgSend_measLteResultAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measLteResultAtIndex:");
}

id objc_msgSend_measLteResultsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measLteResultsCount");
}

id objc_msgSend_measNbrEutraAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measNbrEutraAtIndex:");
}

id objc_msgSend_measNbrEutrasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measNbrEutrasCount");
}

id objc_msgSend_measNbrGeranAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measNbrGeranAtIndex:");
}

id objc_msgSend_measNbrGeransCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measNbrGeransCount");
}

id objc_msgSend_measNbrUtraAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measNbrUtraAtIndex:");
}

id objc_msgSend_measNbrUtrasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measNbrUtrasCount");
}

id objc_msgSend_measUtraResultAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measUtraResultAtIndex:");
}

id objc_msgSend_measUtraResultsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measUtraResultsCount");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_metricsDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsDidUpdate:");
}

id objc_msgSend_multiBandInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiBandInfoAtIndex:");
}

id objc_msgSend_multiBandInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiBandInfosCount");
}

id objc_msgSend_nbrEutraAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nbrEutraAtIndex:");
}

id objc_msgSend_nbrEutrasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nbrEutrasCount");
}

id objc_msgSend_newBeamInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBeamInfoAtIndex:");
}

id objc_msgSend_newBeamInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBeamInfosCount");
}

id objc_msgSend_numRxLevelAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numRxLevelAtIndex:");
}

id objc_msgSend_numRxLevelsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numRxLevelsCount");
}

id objc_msgSend_numTxLevelAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numTxLevelAtIndex:");
}

id objc_msgSend_numTxLevelsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numTxLevelsCount");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_nwUeCapStatAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nwUeCapStatAtIndex:");
}

id objc_msgSend_nwUeCapStatsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nwUeCapStatsCount");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldBeamInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldBeamInfoAtIndex:");
}

id objc_msgSend_oldBeamInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldBeamInfosCount");
}

id objc_msgSend_oosStateCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oosStateCountAtIndex:");
}

id objc_msgSend_oosStateCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oosStateCountsCount");
}

id objc_msgSend_oosStateDurationMsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oosStateDurationMsAtIndex:");
}

id objc_msgSend_oosStateDurationMsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oosStateDurationMsCount");
}

id objc_msgSend_oosToOosCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oosToOosCountAtIndex:");
}

id objc_msgSend_oosToOosCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oosToOosCountsCount");
}

id objc_msgSend_pciAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pciAtIndex:");
}

id objc_msgSend_pcisCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pcisCount");
}

id objc_msgSend_perBandAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "perBandAtIndex:");
}

id objc_msgSend_perBandsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "perBandsCount");
}

id objc_msgSend_perDrbConfigAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "perDrbConfigAtIndex:");
}

id objc_msgSend_perDrbConfigsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "perDrbConfigsCount");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "port");
}

id objc_msgSend_portRangeLow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "portRangeLow");
}

id objc_msgSend_portRangeUpper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "portRangeUpper");
}

id objc_msgSend_pucchCounterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pucchCounterAtIndex:");
}

id objc_msgSend_pucchCountersCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pucchCountersCount");
}

id objc_msgSend_puschCounterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "puschCounterAtIndex:");
}

id objc_msgSend_puschCountersCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "puschCountersCount");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise");
}

id objc_msgSend_rbDataAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rbDataAtIndex:");
}

id objc_msgSend_rbDatasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rbDatasCount");
}

id objc_msgSend_recoverCountStateBreakAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoverCountStateBreakAtIndex:");
}

id objc_msgSend_recoverCountStateBreaksCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoverCountStateBreaksCount");
}

id objc_msgSend_recoverHistAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoverHistAtIndex:");
}

id objc_msgSend_recoverHistsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoverHistsCount");
}

id objc_msgSend_redirArfcnAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redirArfcnAtIndex:");
}

id objc_msgSend_redirArfcnsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redirArfcnsCount");
}

id objc_msgSend_regProvFlaiListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regProvFlaiListAtIndex:");
}

id objc_msgSend_regProvFlaiListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regProvFlaiListsCount");
}

id objc_msgSend_regProvFtaiListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regProvFtaiListAtIndex:");
}

id objc_msgSend_regProvFtaiListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regProvFtaiListsCount");
}

id objc_msgSend_releaseCauseAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseAtIndex:");
}

id objc_msgSend_releaseCauseCountConnectedAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountConnectedAtIndex:");
}

id objc_msgSend_releaseCauseCountConnectedGsmAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountConnectedGsmAtIndex:");
}

id objc_msgSend_releaseCauseCountConnectedGsmsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountConnectedGsmsCount");
}

id objc_msgSend_releaseCauseCountConnectedWcdmaAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountConnectedWcdmaAtIndex:");
}

id objc_msgSend_releaseCauseCountConnectedWcdmasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountConnectedWcdmasCount");
}

id objc_msgSend_releaseCauseCountConnectedsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountConnectedsCount");
}

id objc_msgSend_releaseCauseCountNotConnectedAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountNotConnectedAtIndex:");
}

id objc_msgSend_releaseCauseCountNotConnectedGsmAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountNotConnectedGsmAtIndex:");
}

id objc_msgSend_releaseCauseCountNotConnectedGsmsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountNotConnectedGsmsCount");
}

id objc_msgSend_releaseCauseCountNotConnectedWcdmaAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountNotConnectedWcdmaAtIndex:");
}

id objc_msgSend_releaseCauseCountNotConnectedWcdmasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountNotConnectedWcdmasCount");
}

id objc_msgSend_releaseCauseCountNotConnectedsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCauseCountNotConnectedsCount");
}

id objc_msgSend_releaseCausesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseCausesCount");
}

id objc_msgSend_rfMeasInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rfMeasInfoAtIndex:");
}

id objc_msgSend_rfMeasInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rfMeasInfosCount");
}

id objc_msgSend_rlfCauseAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rlfCauseAtIndex:");
}

id objc_msgSend_rlfCauseSensorAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rlfCauseSensorAtIndex:");
}

id objc_msgSend_rlfCauseSensorsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rlfCauseSensorsCount");
}

id objc_msgSend_rlfCausesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rlfCausesCount");
}

id objc_msgSend_roamingFlaiListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roamingFlaiListAtIndex:");
}

id objc_msgSend_roamingFlaiListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roamingFlaiListsCount");
}

id objc_msgSend_roamingFtaiListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roamingFtaiListAtIndex:");
}

id objc_msgSend_roamingFtaiListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roamingFtaiListsCount");
}

id objc_msgSend_rrcConnReestReqAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnReestReqAtIndex:");
}

id objc_msgSend_rrcConnReestReqsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnReestReqsCount");
}

id objc_msgSend_rrcConnRejectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnRejectAtIndex:");
}

id objc_msgSend_rrcConnRejectsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnRejectsCount");
}

id objc_msgSend_rrcConnRelAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnRelAtIndex:");
}

id objc_msgSend_rrcConnRelsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnRelsCount");
}

id objc_msgSend_rrcConnReqCauseAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnReqCauseAtIndex:");
}

id objc_msgSend_rrcConnReqCausesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnReqCausesCount");
}

id objc_msgSend_rrcConnRlfAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnRlfAtIndex:");
}

id objc_msgSend_rrcConnRlfsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnRlfsCount");
}

id objc_msgSend_rrcConnSetupReqAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnSetupReqAtIndex:");
}

id objc_msgSend_rrcConnSetupReqsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcConnSetupReqsCount");
}

id objc_msgSend_rrcResumeReqAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcResumeReqAtIndex:");
}

id objc_msgSend_rrcResumeReqsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rrcResumeReqsCount");
}

id objc_msgSend_rsrp0AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrp0AtIndex:");
}

id objc_msgSend_rsrp0sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrp0sCount");
}

id objc_msgSend_rsrp1AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrp1AtIndex:");
}

id objc_msgSend_rsrp1sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrp1sCount");
}

id objc_msgSend_rsrp2AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrp2AtIndex:");
}

id objc_msgSend_rsrp2sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrp2sCount");
}

id objc_msgSend_rsrp3AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrp3AtIndex:");
}

id objc_msgSend_rsrp3sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrp3sCount");
}

id objc_msgSend_rsrq0AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrq0AtIndex:");
}

id objc_msgSend_rsrq0sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrq0sCount");
}

id objc_msgSend_rsrq1AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrq1AtIndex:");
}

id objc_msgSend_rsrq1sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrq1sCount");
}

id objc_msgSend_rsrq2AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrq2AtIndex:");
}

id objc_msgSend_rsrq2sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrq2sCount");
}

id objc_msgSend_rsrq3AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrq3AtIndex:");
}

id objc_msgSend_rsrq3sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsrq3sCount");
}

id objc_msgSend_rx0IdleCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rx0IdleCountAtIndex:");
}

id objc_msgSend_rx0IdleCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rx0IdleCountsCount");
}

id objc_msgSend_rx0TrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rx0TrafficCountAtIndex:");
}

id objc_msgSend_rx0TrafficCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rx0TrafficCountsCount");
}

id objc_msgSend_rx1TrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rx1TrafficCountAtIndex:");
}

id objc_msgSend_rx1TrafficCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rx1TrafficCountsCount");
}

id objc_msgSend_rxBeamIdAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxBeamIdAtIndex:");
}

id objc_msgSend_rxBeamIdsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxBeamIdsCount");
}

id objc_msgSend_rxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxBinsAtIndex:");
}

id objc_msgSend_rxBinsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxBinsCount");
}

id objc_msgSend_rxBinsIdleAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxBinsIdleAtIndex:");
}

id objc_msgSend_rxBinsIdlesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxBinsIdlesCount");
}

id objc_msgSend_rxHistAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxHistAtIndex:");
}

id objc_msgSend_rxHistsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxHistsCount");
}

id objc_msgSend_rxInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxInfoAtIndex:");
}

id objc_msgSend_rxInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxInfosCount");
}

id objc_msgSend_rxPowerHistAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxPowerHistAtIndex:");
}

id objc_msgSend_rxPowerHistsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rxPowerHistsCount");
}

id objc_msgSend_sccListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sccListAtIndex:");
}

id objc_msgSend_sccListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sccListsCount");
}

id objc_msgSend_secRxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secRxBinsAtIndex:");
}

id objc_msgSend_secRxBinsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secRxBinsCount");
}

id objc_msgSend_secRxBinsIdleAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secRxBinsIdleAtIndex:");
}

id objc_msgSend_secRxBinsIdlesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secRxBinsIdlesCount");
}

id objc_msgSend_secTxBinsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secTxBinsAtIndex:");
}

id objc_msgSend_secTxBinsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secTxBinsCount");
}

id objc_msgSend_servingCellBeamInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "servingCellBeamInfoAtIndex:");
}

id objc_msgSend_servingCellBeamInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "servingCellBeamInfosCount");
}

id objc_msgSend_setActivatedMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivatedMetric:");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setApn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApn:");
}

id objc_msgSend_setAppCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppCategory:");
}

id objc_msgSend_setApplicationCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationCategory:");
}

id objc_msgSend_setAppsInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppsInfo:");
}

id objc_msgSend_setAttemptedPlmn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttemptedPlmn:");
}

id objc_msgSend_setAvgValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvgValues:");
}

id objc_msgSend_setBdStat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBdStat:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setCallId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallId:");
}

id objc_msgSend_setConfiguredMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguredMetric:");
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContent:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDnn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDnn:");
}

id objc_msgSend_setDrbConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDrbConfig:");
}

id objc_msgSend_setEncodedPlmn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEncodedPlmn:");
}

id objc_msgSend_setForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForeground:");
}

id objc_msgSend_setGeraReselInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeraReselInfo:");
}

id objc_msgSend_setGuti_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuti:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setHplmn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHplmn:");
}

id objc_msgSend_setImei_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImei:");
}

id objc_msgSend_setImsi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImsi:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterfaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaces:");
}

id objc_msgSend_setIpProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIpProtocol:");
}

id objc_msgSend_setLai_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLai:");
}

id objc_msgSend_setLastAudioQualityCnt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastAudioQualityCnt:");
}

id objc_msgSend_setLteBandCombo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLteBandCombo:");
}

id objc_msgSend_setMib_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMib:");
}

id objc_msgSend_setMibContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMibContent:");
}

id objc_msgSend_setMrdcLteBandCombo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMrdcLteBandCombo:");
}

id objc_msgSend_setMrdcNrBandCombo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMrdcNrBandCombo:");
}

id objc_msgSend_setNr5gBandCombo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNr5gBandCombo:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOldState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOldState:");
}

id objc_msgSend_setPdpAddr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPdpAddr:");
}

id objc_msgSend_setPlmn2nd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlmn2nd:");
}

id objc_msgSend_setPlmn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlmn:");
}

id objc_msgSend_setPlmnO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlmnO:");
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPort:");
}

id objc_msgSend_setPortRangeLow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPortRangeLow:");
}

id objc_msgSend_setPortRangeUpper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPortRangeUpper:");
}

id objc_msgSend_setPrimaryDnsAddr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryDnsAddr:");
}

id objc_msgSend_setRachConnInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRachConnInfo:");
}

id objc_msgSend_setRai_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRai:");
}

id objc_msgSend_setRecordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordType:");
}

id objc_msgSend_setSecondaryDnsAddr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryDnsAddr:");
}

id objc_msgSend_setSectorId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectorId:");
}

id objc_msgSend_setSimHplmn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSimHplmn:");
}

id objc_msgSend_setSimPlmn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSimPlmn:");
}

id objc_msgSend_setThenewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThenewState:");
}

id objc_msgSend_setTotalMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalMetric:");
}

id objc_msgSend_setTrafficClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrafficClass:");
}

id objc_msgSend_setTrafficDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrafficDescriptors:");
}

id objc_msgSend_setTransId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransId:");
}

id objc_msgSend_setUtraReselInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUtraReselInfo:");
}

id objc_msgSend_setVolteCallId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolteCallId:");
}

id objc_msgSend_setWtolHoCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWtolHoCount:");
}

id objc_msgSend_setWtolReselCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWtolReselCount:");
}

id objc_msgSend_sfScheduledByStateAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sfScheduledByStateAtIndex:");
}

id objc_msgSend_sfScheduledByStatesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sfScheduledByStatesCount");
}

id objc_msgSend_sfScheduledByTypeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sfScheduledByTypeAtIndex:");
}

id objc_msgSend_sfScheduledByTypesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sfScheduledByTypesCount");
}

id objc_msgSend_sibAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sibAtIndex:");
}

id objc_msgSend_sibsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sibsCount");
}

id objc_msgSend_sinr0AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinr0AtIndex:");
}

id objc_msgSend_sinr0sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinr0sCount");
}

id objc_msgSend_sinr1AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinr1AtIndex:");
}

id objc_msgSend_sinr1sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinr1sCount");
}

id objc_msgSend_sinr2AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinr2AtIndex:");
}

id objc_msgSend_sinr2sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinr2sCount");
}

id objc_msgSend_sinr3AtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinr3AtIndex:");
}

id objc_msgSend_sinr3sCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinr3sCount");
}

id objc_msgSend_sizeTbTotalByStateAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeTbTotalByStateAtIndex:");
}

id objc_msgSend_sizeTbTotalByStatesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeTbTotalByStatesCount");
}

id objc_msgSend_sizeTbTotalByTypeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeTbTotalByTypeAtIndex:");
}

id objc_msgSend_sizeTbTotalByTypesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeTbTotalByTypesCount");
}

id objc_msgSend_slicingConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slicingConfiguration");
}

id objc_msgSend_slicingDescriptorsDidUpdate_withDescriptors_appInfo_andStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slicingDescriptorsDidUpdate:withDescriptors:appInfo:andStatus:");
}

id objc_msgSend_slicingRunningAppStateChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slicingRunningAppStateChanged:");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slotID");
}

id objc_msgSend_srbAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "srbAtIndex:");
}

id objc_msgSend_srbsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "srbsCount");
}

id objc_msgSend_srvStatAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "srvStatAtIndex:");
}

id objc_msgSend_srvStatsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "srvStatsCount");
}

id objc_msgSend_stateHistAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateHistAtIndex:");
}

id objc_msgSend_stateHistsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateHistsCount");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscriptionsValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsValid");
}

id objc_msgSend_taiListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taiListAtIndex:");
}

id objc_msgSend_taiListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taiListsCount");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_trafficClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trafficClass");
}

id objc_msgSend_trafficDescriptors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trafficDescriptors");
}

id objc_msgSend_txBinsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txBinsAtIndex:");
}

id objc_msgSend_txBinsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txBinsCount");
}

id objc_msgSend_txHistAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txHistAtIndex:");
}

id objc_msgSend_txHistsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txHistsCount");
}

id objc_msgSend_txPowerHistAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txPowerHistAtIndex:");
}

id objc_msgSend_txPowerHistsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txPowerHistsCount");
}

id objc_msgSend_txPowerInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txPowerInfoAtIndex:");
}

id objc_msgSend_txPowerInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txPowerInfosCount");
}

id objc_msgSend_txTrafficCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txTrafficCountAtIndex:");
}

id objc_msgSend_txTrafficCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "txTrafficCountsCount");
}

id objc_msgSend_ulSfScheduledByStateAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSfScheduledByStateAtIndex:");
}

id objc_msgSend_ulSfScheduledByStatesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSfScheduledByStatesCount");
}

id objc_msgSend_ulSfScheduledByTypeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSfScheduledByTypeAtIndex:");
}

id objc_msgSend_ulSfScheduledByTypesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSfScheduledByTypesCount");
}

id objc_msgSend_ulSizeTbTotalByStateAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSizeTbTotalByStateAtIndex:");
}

id objc_msgSend_ulSizeTbTotalByStatesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSizeTbTotalByStatesCount");
}

id objc_msgSend_ulSizeTbTotalByTypeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSizeTbTotalByTypeAtIndex:");
}

id objc_msgSend_ulSizeTbTotalByTypesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ulSizeTbTotalByTypesCount");
}

id objc_msgSend_umtsChanInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "umtsChanInfoAtIndex:");
}

id objc_msgSend_umtsChanInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "umtsChanInfosCount");
}

id objc_msgSend_umtsNcellMeasAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "umtsNcellMeasAtIndex:");
}

id objc_msgSend_umtsNcellMeasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "umtsNcellMeasCount");
}

id objc_msgSend_updateDelegate_status_trafficDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDelegate:status:trafficDescriptors:");
}

id objc_msgSend_utraNcellAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utraNcellAtIndex:");
}

id objc_msgSend_utraNcellsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utraNcellsCount");
}

id objc_msgSend_utraPrioInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utraPrioInfoAtIndex:");
}

id objc_msgSend_utraPrioInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utraPrioInfosCount");
}

id objc_msgSend_validSubscriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validSubscriptions");
}

id objc_msgSend_wtolRedirCountAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wtolRedirCountAtIndex:");
}

id objc_msgSend_wtolRedirCountsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wtolRedirCountsCount");
}
