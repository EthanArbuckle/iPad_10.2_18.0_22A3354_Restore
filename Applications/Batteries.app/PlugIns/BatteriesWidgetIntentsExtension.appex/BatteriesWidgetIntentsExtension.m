uint64_t sub_1000022BC()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100006ACC(v0, qword_10000C6F8);
  sub_100006A74(v0, (uint64_t)qword_10000C6F8);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x8000000100007270, 0x6E6F6D6D6F63, 0xE600000000000000);
}

id sub_10000236C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(_TtC31BatteriesWidgetIntentsExtension13IntentHandler);
}

unint64_t sub_10000247C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006A8C(&qword_10000C660);
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
  v6 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v7 = *((_QWORD *)v6 - 2);
    v8 = *((_QWORD *)v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    result = sub_100002CC8(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_BYTE *)(v4[7] + result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v6 += 24;
    v4[2] = v15;
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

uint64_t sub_10000258C(uint64_t *a1)
{
  uint64_t v2;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*a1);
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v2 < 0 || (v2 & 0x4000000000000000) != 0)
  {
    v2 = sub_100005110(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v7[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v7[1] = v4;
  sub_100002E20(v7);
  return specialized Array._endMutation()(v5);
}

uint64_t sub_100002610(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_100005474(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100003604(v6);
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100002688(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100002758(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006C3C((uint64_t)v12, *a3);
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
      sub_100006C3C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006C1C(v12);
  return v7;
}

uint64_t sub_100002758(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100002910(a5, a6);
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

uint64_t sub_100002910(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000029A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100002B7C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100002B7C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000029A4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100002B18(v4, 0);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100002B18(uint64_t a1, uint64_t a2)
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
    return _swiftEmptyArrayStorage;
  v4 = sub_100006A8C(&qword_10000C680);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100002B7C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006A8C(&qword_10000C680);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
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

unint64_t sub_100002CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100004E88(a1, a2, v5);
}

_QWORD *sub_100002D2C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return _swiftEmptyArrayStorage;
  while (1)
  {
    if (v2 <= 0)
    {
      v4 = _swiftEmptyArrayStorage;
    }
    else
    {
      v3 = sub_100006A8C(&qword_10000C668);
      v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
      v5 = j__malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 25;
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v1);
    v7 = sub_10000526C((unint64_t)(v4 + 4), v2, v1);
    v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    if (v1 < 0)
      v9 = v1;
    else
      v9 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (!v2)
      return _swiftEmptyArrayStorage;
  }
  return v4;
}

void sub_100002E20(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int v4;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  Swift::Int v11;
  uint64_t v12;
  __objc2_prot_list *v13;
  unint64_t v14;
  Swift::Int v15;
  char *v16;
  void *v17;
  id v18;
  id v19;
  unsigned int v20;
  int v21;
  Swift::Int v22;
  Swift::Int v23;
  void *v24;
  id v25;
  id v26;
  unsigned int v27;
  BOOL v28;
  uint64_t *v29;
  Swift::Int v30;
  Swift::Int v31;
  uint64_t *v32;
  uint64_t v33;
  Swift::Int v34;
  uint64_t v35;
  Swift::Int v36;
  void *v37;
  Swift::Int v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  unsigned __int8 v43;
  void *v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t *v108;
  uint64_t v109;
  Swift::Int v110;
  Swift::Int v111;
  Swift::Int v112;
  void **v113;
  uint64_t v114;
  uint64_t v115;

  v3 = a1[1];
  v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_148;
    if (v3)
      sub_100003F88(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_156;
  v6 = v4;
  v108 = a1;
  if (v3 < 2)
  {
    v10 = (char *)_swiftEmptyArrayStorage;
    v115 = (uint64_t)_swiftEmptyArrayStorage;
    v113 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v14 = _swiftEmptyArrayStorage[2];
LABEL_110:
      if (v14 >= 2)
      {
        v97 = *v108;
        do
        {
          v98 = v14 - 2;
          if (v14 < 2)
            goto LABEL_143;
          if (!v97)
            goto LABEL_155;
          v90 = (uint64_t)v10;
          v99 = *(_QWORD *)&v10[16 * v98 + 32];
          v100 = *(_QWORD *)&v10[16 * v14 + 24];
          sub_100004224((id *)(v97 + 8 * v99), (id *)(v97 + 8 * *(_QWORD *)&v10[16 * v14 + 16]), v97 + 8 * v100, v113);
          if (v1)
            goto LABEL_123;
          if (v100 < v99)
            goto LABEL_144;
          if ((swift_isUniquelyReferenced_nonNull_native(v90) & 1) != 0)
            v101 = (char *)v90;
          else
            v101 = sub_100004B6C(v90);
          if (v98 >= *((_QWORD *)v101 + 2))
            goto LABEL_145;
          v102 = &v101[16 * v98 + 32];
          *(_QWORD *)v102 = v99;
          *((_QWORD *)v102 + 1) = v100;
          v103 = *((_QWORD *)v101 + 2);
          if (v14 > v103)
            goto LABEL_146;
          v104 = v101;
          memmove(&v101[16 * v14 + 16], &v101[16 * v14 + 32], 16 * (v103 - v14));
          v10 = v104;
          *((_QWORD *)v104 + 2) = v103 - 1;
          v14 = v103 - 1;
        }
        while (v103 > 2);
      }
      v105 = (uint64_t)v10;
LABEL_125:
      v106 = swift_bridgeObjectRelease(v105);
      *(_QWORD *)((v115 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v106);
      swift_bridgeObjectRelease(v115);
      return;
    }
  }
  else
  {
    v7 = v5 >> 1;
    v8 = sub_100006B0C(0, &qword_10000C638, BCBatteryDevice_ptr);
    v9 = static Array._allocateBufferUninitialized(minimumCapacity:)(v7, v8);
    *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v113 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    v115 = v9;
  }
  v110 = v6;
  v11 = 0;
  v12 = *a1;
  v109 = *a1 - 8;
  v10 = (char *)_swiftEmptyArrayStorage;
  v13 = &IntentHandler;
  v112 = v3;
  v114 = *a1;
  while (1)
  {
    v15 = v11++;
    if (v11 >= v3)
      goto LABEL_42;
    v16 = v10;
    v17 = *(void **)(v12 + 8 * v15);
    v18 = *(id *)(v12 + 8 * v11);
    v19 = v17;
    if (!objc_msgSend(v18, (SEL)v13[149].count))
      break;
    v20 = objc_msgSend(v19, (SEL)v13[149].count);

    v21 = v20 ^ 1;
    v13 = &IntentHandler;
    v22 = v15 + 2;
    v12 = v114;
    if (v15 + 2 < v112)
      goto LABEL_23;
LABEL_30:
    v10 = v16;
    v11 = v22;
    if (v21)
      goto LABEL_31;
LABEL_42:
    v34 = v112;
    if (v11 < v112)
    {
      if (__OFSUB__(v11, v15))
        goto LABEL_147;
      if (v11 - v15 < v110)
      {
        if (__OFADD__(v15, v110))
          goto LABEL_149;
        if (v15 + v110 < v112)
          v34 = v15 + v110;
        if (v34 < v15)
        {
LABEL_150:
          __break(1u);
          goto LABEL_151;
        }
        if (v11 != v34)
        {
          v111 = v15;
          v107 = v10;
          v35 = v109 + 8 * v11;
          do
          {
            v36 = v34;
            v37 = *(void **)(v12 + 8 * v11);
            v38 = v111;
            v39 = v35;
            while (1)
            {
              v40 = *(void **)v39;
              v41 = v37;
              v42 = v40;
              if (!objc_msgSend(v41, (SEL)v13[149].count))
              {

                v12 = v114;
                goto LABEL_52;
              }
              v43 = objc_msgSend(v42, (SEL)v13[149].count);

              if ((v43 & 1) != 0)
                break;
              v12 = v114;
              if (!v114)
                goto LABEL_152;
              v44 = *(void **)v39;
              v37 = *(void **)(v39 + 8);
              *(_QWORD *)v39 = v37;
              *(_QWORD *)(v39 + 8) = v44;
              v39 -= 8;
              ++v38;
              v13 = &IntentHandler;
              if (v11 == v38)
                goto LABEL_52;
            }
            v12 = v114;
            v13 = &IntentHandler;
LABEL_52:
            ++v11;
            v35 += 8;
            v34 = v36;
          }
          while (v11 != v36);
          v11 = v36;
          v10 = v107;
          v15 = v111;
        }
      }
    }
    if (v11 < v15)
      goto LABEL_142;
    v45 = v10;
    if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) != 0)
      v10 = v45;
    else
      v10 = sub_1000049CC(0, *((_QWORD *)v45 + 2) + 1, 1, v45);
    v47 = *((_QWORD *)v10 + 2);
    v46 = *((_QWORD *)v10 + 3);
    v14 = v47 + 1;
    v12 = v114;
    if (v47 >= v46 >> 1)
    {
      v96 = sub_1000049CC((char *)(v46 > 1), v47 + 1, 1, v10);
      v12 = v114;
      v10 = v96;
    }
    *((_QWORD *)v10 + 2) = v14;
    v48 = v10 + 32;
    v49 = &v10[16 * v47 + 32];
    *(_QWORD *)v49 = v15;
    *((_QWORD *)v49 + 1) = v11;
    if (v47)
    {
      while (1)
      {
        v50 = v14 - 1;
        if (v14 >= 4)
        {
          v55 = &v48[16 * v14];
          v56 = *((_QWORD *)v55 - 8);
          v57 = *((_QWORD *)v55 - 7);
          v61 = __OFSUB__(v57, v56);
          v58 = v57 - v56;
          if (v61)
            goto LABEL_131;
          v60 = *((_QWORD *)v55 - 6);
          v59 = *((_QWORD *)v55 - 5);
          v61 = __OFSUB__(v59, v60);
          v53 = v59 - v60;
          v54 = v61;
          if (v61)
            goto LABEL_132;
          v62 = v14 - 2;
          v63 = &v48[16 * v14 - 32];
          v65 = *(_QWORD *)v63;
          v64 = *((_QWORD *)v63 + 1);
          v61 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          if (v61)
            goto LABEL_134;
          v61 = __OFADD__(v53, v66);
          v67 = v53 + v66;
          if (v61)
            goto LABEL_137;
          if (v67 >= v58)
          {
            v85 = &v48[16 * v50];
            v87 = *(_QWORD *)v85;
            v86 = *((_QWORD *)v85 + 1);
            v61 = __OFSUB__(v86, v87);
            v88 = v86 - v87;
            if (v61)
              goto LABEL_141;
            v78 = v53 < v88;
            goto LABEL_98;
          }
        }
        else
        {
          if (v14 != 3)
          {
            v79 = *((_QWORD *)v10 + 4);
            v80 = *((_QWORD *)v10 + 5);
            v61 = __OFSUB__(v80, v79);
            v72 = v80 - v79;
            v73 = v61;
            goto LABEL_92;
          }
          v52 = *((_QWORD *)v10 + 4);
          v51 = *((_QWORD *)v10 + 5);
          v61 = __OFSUB__(v51, v52);
          v53 = v51 - v52;
          v54 = v61;
        }
        if ((v54 & 1) != 0)
          goto LABEL_133;
        v62 = v14 - 2;
        v68 = &v48[16 * v14 - 32];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v71 = __OFSUB__(v69, v70);
        v72 = v69 - v70;
        v73 = v71;
        if (v71)
          goto LABEL_136;
        v74 = &v48[16 * v50];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        v61 = __OFSUB__(v75, v76);
        v77 = v75 - v76;
        if (v61)
          goto LABEL_139;
        if (__OFADD__(v72, v77))
          goto LABEL_140;
        if (v72 + v77 >= v53)
        {
          v78 = v53 < v77;
LABEL_98:
          if (v78)
            v50 = v62;
          goto LABEL_100;
        }
LABEL_92:
        if ((v73 & 1) != 0)
          goto LABEL_135;
        v81 = &v48[16 * v50];
        v83 = *(_QWORD *)v81;
        v82 = *((_QWORD *)v81 + 1);
        v61 = __OFSUB__(v82, v83);
        v84 = v82 - v83;
        if (v61)
          goto LABEL_138;
        if (v84 < v72)
          goto LABEL_14;
LABEL_100:
        v89 = v50 - 1;
        if (v50 - 1 >= v14)
        {
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
          goto LABEL_150;
        }
        if (!v12)
          goto LABEL_153;
        v90 = (uint64_t)v10;
        v91 = &v48[16 * v89];
        v92 = *(_QWORD *)v91;
        v93 = &v48[16 * v50];
        v94 = *((_QWORD *)v93 + 1);
        sub_100004224((id *)(v12 + 8 * *(_QWORD *)v91), (id *)(v12 + 8 * *(_QWORD *)v93), v12 + 8 * v94, v113);
        if (v1)
        {
LABEL_123:
          v105 = v90;
          goto LABEL_125;
        }
        if (v94 < v92)
          goto LABEL_128;
        if (v50 > *(_QWORD *)(v90 + 16))
          goto LABEL_129;
        *(_QWORD *)v91 = v92;
        *(_QWORD *)&v48[16 * v89 + 8] = v94;
        v95 = *(_QWORD *)(v90 + 16);
        if (v50 >= v95)
          goto LABEL_130;
        v14 = v95 - 1;
        memmove(&v48[16 * v50], v93 + 16, 16 * (v95 - 1 - v50));
        v10 = (char *)v90;
        *(_QWORD *)(v90 + 16) = v95 - 1;
        v12 = v114;
        if (v95 <= 2)
          goto LABEL_14;
      }
    }
    v14 = 1;
LABEL_14:
    v3 = v112;
    v13 = &IntentHandler;
    if (v11 >= v112)
      goto LABEL_110;
  }

  v22 = v15 + 2;
  if (v15 + 2 >= v112)
  {
    v11 = v15 + 2;
    v10 = v16;
    v12 = v114;
    goto LABEL_42;
  }
  v21 = 0;
  v12 = v114;
LABEL_23:
  while (2)
  {
    v24 = *(void **)(v12 + 8 * v11);
    v25 = *(id *)(v12 + 8 * v22);
    v26 = v24;
    if (!objc_msgSend(v25, (SEL)v13[149].count))
    {

      if ((v21 & 1) != 0)
      {
        v10 = v16;
        v12 = v114;
        if (v22 < v15)
          goto LABEL_151;
LABEL_34:
        if (v15 < v22)
        {
          v29 = (uint64_t *)(v109 + 8 * v22);
          v30 = v22;
          v31 = v15;
          v32 = (uint64_t *)(v12 + 8 * v15);
          do
          {
            if (v31 != --v30)
            {
              if (!v12)
                goto LABEL_154;
              v33 = *v32;
              *v32 = *v29;
              *v29 = v33;
            }
            ++v31;
            --v29;
            ++v32;
          }
          while (v31 < v30);
        }
        v11 = v22;
        goto LABEL_42;
      }
      goto LABEL_22;
    }
    v27 = objc_msgSend(v26, (SEL)v13[149].count);

    v28 = v21 == v27;
    v13 = &IntentHandler;
    if (!v28)
    {
LABEL_22:
      v23 = v22 + 1;
      v11 = v22;
      v22 = v23;
      v12 = v114;
      if (v23 >= v112)
      {
        v22 = v23;
        goto LABEL_30;
      }
      continue;
    }
    break;
  }
  v10 = v16;
  v12 = v114;
  v11 = v22;
  if (!v21)
    goto LABEL_42;
LABEL_31:
  if (v22 >= v15)
    goto LABEL_34;
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

void sub_100003604(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  Swift::Int v3;
  Swift::Int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  Swift::Int v11;
  uint64_t v12;
  Swift::Int v13;
  unint64_t v14;
  Swift::Int v15;
  Swift::Int v16;
  Swift::Int v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  Swift::Int v35;
  Swift::Int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  Swift::Int v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t *v53;
  Swift::Int v54;
  Swift::Int v55;
  uint64_t *v56;
  uint64_t v57;
  Swift::Int v58;
  uint64_t v59;
  __objc2_prot_list *v60;
  Swift::Int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  char *v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  char v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  Swift::Int v138;
  Swift::Int v139;
  char *v140;
  Swift::Int v141;
  uint64_t v142;
  Swift::Int v143;
  uint64_t v144;
  void **v145;
  uint64_t v146;
  Swift::Int v147;
  Swift::Int v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;

  v2 = a1;
  v3 = a1[1];
  v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_147;
    if (v3)
      sub_100004078(0, v3, 1, v2);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_155;
  v138 = v4;
  v143 = v3;
  v136 = v2;
  if (v3 < 2)
  {
    v10 = (char *)_swiftEmptyArrayStorage;
    v153 = (uint64_t)_swiftEmptyArrayStorage;
    v145 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v14 = _swiftEmptyArrayStorage[2];
LABEL_113:
      if (v14 >= 2)
      {
        v129 = *v136;
        do
        {
          v130 = v14 - 2;
          if (v14 < 2)
            goto LABEL_142;
          if (!v129)
            goto LABEL_154;
          v131 = *(_QWORD *)&v10[16 * v130 + 32];
          v132 = *(_QWORD *)&v10[16 * v14 + 24];
          sub_100004558((void **)(v129 + 8 * v131), (id *)(v129 + 8 * *(_QWORD *)&v10[16 * v14 + 16]), v129 + 8 * v132, v145);
          if (v1)
            break;
          if (v132 < v131)
            goto LABEL_143;
          if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0)
            v10 = sub_100004B6C((uint64_t)v10);
          if (v130 >= *((_QWORD *)v10 + 2))
            goto LABEL_144;
          v133 = &v10[16 * v130 + 32];
          *(_QWORD *)v133 = v131;
          *((_QWORD *)v133 + 1) = v132;
          v134 = *((_QWORD *)v10 + 2);
          if (v14 > v134)
            goto LABEL_145;
          memmove(&v10[16 * v14 + 16], &v10[16 * v14 + 32], 16 * (v134 - v14));
          *((_QWORD *)v10 + 2) = v134 - 1;
          v14 = v134 - 1;
        }
        while (v134 > 2);
      }
LABEL_124:
      v135 = swift_bridgeObjectRelease(v10);
      *(_QWORD *)((v153 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v135);
      swift_bridgeObjectRelease(v153);
      return;
    }
  }
  else
  {
    v6 = v2;
    v7 = v5 >> 1;
    v8 = sub_100006B0C(0, &qword_10000C638, BCBatteryDevice_ptr);
    v9 = static Array._allocateBufferUninitialized(minimumCapacity:)(v7, v8);
    *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v2 = v6;
    v145 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    v153 = v9;
  }
  v11 = 0;
  v12 = *v2;
  v137 = *v2 - 8;
  v10 = (char *)_swiftEmptyArrayStorage;
  v13 = v3;
  v146 = *v2;
LABEL_15:
  v15 = v11;
  v16 = v11 + 1;
  v140 = v10;
  if (v11 + 1 < v13)
  {
    v17 = v11 + 1;
    v18 = *(void **)(v12 + 8 * v11);
    v19 = *(id *)(v12 + 8 * v16);
    v20 = v18;
    v21 = objc_msgSend(v19, "name");
    v141 = v15;
    if (!v21)
    {

      v35 = v15 + 2;
      if (v15 + 2 < v143)
        goto LABEL_21;
      goto LABEL_42;
    }
    v22 = v21;
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    v26 = objc_msgSend(v20, "name");
    if (v26)
    {
      v27 = v26;
      v28 = v23;
      v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v31 = v30;

      v151 = v28;
      v152 = v25;
      v149 = v29;
      v150 = v31;
      v32 = sub_100006B44();
      v33 = StringProtocol.localizedStandardCompare<A>(_:)(&v149, &type metadata for String, &type metadata for String, v32, v32);

      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v31);
      v34 = v33 == -1;
      v10 = v140;
      v35 = v15 + 2;
      v12 = v146;
      if (v15 + 2 < v143)
        goto LABEL_22;
LABEL_32:
      v16 = v35;
      v15 = v141;
      if (v34)
      {
LABEL_33:
        if (v35 < v15)
          goto LABEL_150;
        if (v15 < v35)
        {
          v53 = (uint64_t *)(v137 + 8 * v35);
          v54 = v35;
          v55 = v15;
          v56 = (uint64_t *)(v12 + 8 * v15);
          do
          {
            if (v55 != --v54)
            {
              if (!v12)
                goto LABEL_153;
              v57 = *v56;
              *v56 = *v53;
              *v53 = v57;
            }
            ++v55;
            --v53;
            ++v56;
          }
          while (v55 < v54);
        }
        v16 = v35;
      }
      goto LABEL_43;
    }

    swift_bridgeObjectRelease(v25);
    v35 = v15 + 2;
    if (v15 + 2 >= v143)
    {
LABEL_42:
      v16 = v35;
      v10 = v140;
      v12 = v146;
      goto LABEL_43;
    }
LABEL_21:
    v34 = 0;
    v12 = v146;
LABEL_22:
    v36 = v17;
    while (1)
    {
      v44 = *(void **)(v12 + 8 * v36);
      v45 = *(id *)(v12 + 8 * v35);
      v46 = v44;
      v47 = objc_msgSend(v45, "name");
      if (!v47)
        break;
      v48 = v47;
      v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v51 = v50;

      v52 = objc_msgSend(v46, "name");
      if (!v52)
      {

        swift_bridgeObjectRelease(v51);
        goto LABEL_29;
      }
      v37 = v52;
      v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v40 = v39;

      v151 = v49;
      v152 = v51;
      v149 = v38;
      v150 = v40;
      v41 = sub_100006B44();
      v42 = StringProtocol.localizedStandardCompare<A>(_:)(&v149, &type metadata for String, &type metadata for String, v41, v41);

      swift_bridgeObjectRelease(v51);
      swift_bridgeObjectRelease(v40);
      v10 = v140;
      v12 = v146;
      if (((v34 ^ (v42 != -1)) & 1) == 0)
        goto LABEL_32;
LABEL_24:
      v43 = v35 + 1;
      v36 = v35;
      v35 = v43;
      if (v43 >= v143)
      {
        v35 = v43;
        goto LABEL_32;
      }
    }

LABEL_29:
    v10 = v140;
    v12 = v146;
    if (v34)
    {
      v15 = v141;
      goto LABEL_33;
    }
    goto LABEL_24;
  }
LABEL_43:
  if (v16 >= v143)
    goto LABEL_65;
  if (__OFSUB__(v16, v15))
    goto LABEL_146;
  if (v16 - v15 >= v138)
    goto LABEL_65;
  if (__OFADD__(v15, v138))
    goto LABEL_148;
  v58 = v143;
  if (v15 + v138 < v143)
    v58 = v15 + v138;
  if (v58 >= v15)
  {
    if (v16 == v58)
      goto LABEL_65;
    v142 = v15;
    v59 = v137 + 8 * v16;
    v60 = &IntentHandler;
    v139 = v58;
LABEL_55:
    v62 = *(void **)(v12 + 8 * v16);
    v63 = v142;
    v144 = v59;
    v147 = v16;
    while (1)
    {
      v64 = *(void **)v59;
      v65 = v62;
      v66 = v64;
      v67 = objc_msgSend(v65, (SEL)v60[132].count);
      if (!v67)
        break;
      v68 = v67;
      v69 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v71 = v70;

      v72 = objc_msgSend(v66, (SEL)v60[132].count);
      if (!v72)
      {

        swift_bridgeObjectRelease(v71);
        goto LABEL_53;
      }
      v73 = v72;
      v74 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v76 = v75;

      v151 = v69;
      v152 = v71;
      v149 = v74;
      v150 = v76;
      v77 = sub_100006B44();
      v78 = StringProtocol.localizedStandardCompare<A>(_:)(&v149, &type metadata for String, &type metadata for String, v77, v77);

      swift_bridgeObjectRelease(v71);
      swift_bridgeObjectRelease(v76);
      if (v78 != -1)
      {
        v12 = v146;
        v61 = v147;
        v60 = &IntentHandler;
LABEL_54:
        v16 = v61 + 1;
        v59 = v144 + 8;
        if (v16 != v139)
          goto LABEL_55;
        v16 = v139;
        v10 = v140;
        v15 = v142;
LABEL_65:
        if (v16 < v15)
          goto LABEL_141;
        if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0)
          v10 = sub_1000049CC(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
        v81 = *((_QWORD *)v10 + 2);
        v80 = *((_QWORD *)v10 + 3);
        v14 = v81 + 1;
        v148 = v16;
        if (v81 >= v80 >> 1)
          v10 = sub_1000049CC((char *)(v80 > 1), v81 + 1, 1, v10);
        *((_QWORD *)v10 + 2) = v14;
        v82 = v10 + 32;
        v83 = &v10[16 * v81 + 32];
        *(_QWORD *)v83 = v15;
        *((_QWORD *)v83 + 1) = v148;
        if (v81)
        {
          while (2)
          {
            v84 = v14 - 1;
            if (v14 >= 4)
            {
              v89 = &v82[16 * v14];
              v90 = *((_QWORD *)v89 - 8);
              v91 = *((_QWORD *)v89 - 7);
              v95 = __OFSUB__(v91, v90);
              v92 = v91 - v90;
              if (v95)
                goto LABEL_130;
              v94 = *((_QWORD *)v89 - 6);
              v93 = *((_QWORD *)v89 - 5);
              v95 = __OFSUB__(v93, v94);
              v87 = v93 - v94;
              v88 = v95;
              if (v95)
                goto LABEL_131;
              v96 = v14 - 2;
              v97 = &v82[16 * v14 - 32];
              v99 = *(_QWORD *)v97;
              v98 = *((_QWORD *)v97 + 1);
              v95 = __OFSUB__(v98, v99);
              v100 = v98 - v99;
              if (v95)
                goto LABEL_133;
              v95 = __OFADD__(v87, v100);
              v101 = v87 + v100;
              if (v95)
                goto LABEL_136;
              if (v101 >= v92)
              {
                v119 = &v82[16 * v84];
                v121 = *(_QWORD *)v119;
                v120 = *((_QWORD *)v119 + 1);
                v95 = __OFSUB__(v120, v121);
                v122 = v120 - v121;
                if (v95)
                  goto LABEL_140;
                v112 = v87 < v122;
              }
              else
              {
LABEL_84:
                if ((v88 & 1) != 0)
                  goto LABEL_132;
                v96 = v14 - 2;
                v102 = &v82[16 * v14 - 32];
                v104 = *(_QWORD *)v102;
                v103 = *((_QWORD *)v102 + 1);
                v105 = __OFSUB__(v103, v104);
                v106 = v103 - v104;
                v107 = v105;
                if (v105)
                  goto LABEL_135;
                v108 = &v82[16 * v84];
                v110 = *(_QWORD *)v108;
                v109 = *((_QWORD *)v108 + 1);
                v95 = __OFSUB__(v109, v110);
                v111 = v109 - v110;
                if (v95)
                  goto LABEL_138;
                if (__OFADD__(v106, v111))
                  goto LABEL_139;
                if (v106 + v111 < v87)
                  goto LABEL_96;
                v112 = v87 < v111;
              }
              if (v112)
                v84 = v96;
            }
            else
            {
              if (v14 == 3)
              {
                v86 = *((_QWORD *)v10 + 4);
                v85 = *((_QWORD *)v10 + 5);
                v95 = __OFSUB__(v85, v86);
                v87 = v85 - v86;
                v88 = v95;
                goto LABEL_84;
              }
              v113 = *((_QWORD *)v10 + 4);
              v114 = *((_QWORD *)v10 + 5);
              v95 = __OFSUB__(v114, v113);
              v106 = v114 - v113;
              v107 = v95;
LABEL_96:
              if ((v107 & 1) != 0)
                goto LABEL_134;
              v115 = &v82[16 * v84];
              v117 = *(_QWORD *)v115;
              v116 = *((_QWORD *)v115 + 1);
              v95 = __OFSUB__(v116, v117);
              v118 = v116 - v117;
              if (v95)
                goto LABEL_137;
              if (v118 < v106)
                goto LABEL_14;
            }
            v123 = v84 - 1;
            if (v84 - 1 >= v14)
            {
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
LABEL_147:
              __break(1u);
LABEL_148:
              __break(1u);
              goto LABEL_149;
            }
            if (!v12)
              goto LABEL_152;
            v124 = &v82[16 * v123];
            v125 = *(_QWORD *)v124;
            v126 = &v82[16 * v84];
            v127 = *((_QWORD *)v126 + 1);
            sub_100004558((void **)(v12 + 8 * *(_QWORD *)v124), (id *)(v12 + 8 * *(_QWORD *)v126), v12 + 8 * v127, v145);
            if (v1)
              goto LABEL_124;
            if (v127 < v125)
              goto LABEL_127;
            if (v84 > *((_QWORD *)v10 + 2))
              goto LABEL_128;
            *(_QWORD *)v124 = v125;
            *(_QWORD *)&v82[16 * v123 + 8] = v127;
            v128 = *((_QWORD *)v10 + 2);
            if (v84 >= v128)
              goto LABEL_129;
            v14 = v128 - 1;
            memmove(&v82[16 * v84], v126 + 16, 16 * (v128 - 1 - v84));
            *((_QWORD *)v10 + 2) = v128 - 1;
            if (v128 <= 2)
              goto LABEL_14;
            continue;
          }
        }
        v14 = 1;
LABEL_14:
        v13 = v143;
        v11 = v148;
        if (v148 >= v143)
          goto LABEL_113;
        goto LABEL_15;
      }
      v12 = v146;
      v61 = v147;
      if (!v146)
        goto LABEL_151;
      v79 = *(void **)v59;
      v62 = *(void **)(v59 + 8);
      *(_QWORD *)v59 = v62;
      *(_QWORD *)(v59 + 8) = v79;
      v59 -= 8;
      ++v63;
      v60 = &IntentHandler;
      if (v147 == v63)
        goto LABEL_54;
    }

LABEL_53:
    v12 = v146;
    v61 = v147;
    goto LABEL_54;
  }
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

void sub_100003F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  void *v14;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
LABEL_6:
    v7 = *(void **)(v5 + 8 * v4);
    v8 = a1;
    v9 = v6;
    while (1)
    {
      v10 = *(void **)v9;
      v11 = v7;
      v12 = v10;
      if (!objc_msgSend(v11, "isInternal"))
      {

LABEL_5:
        ++v4;
        v6 += 8;
        if (v4 == a2)
          return;
        goto LABEL_6;
      }
      v13 = objc_msgSend(v12, "isInternal");

      if ((v13 & 1) != 0)
        goto LABEL_5;
      if (!v5)
        break;
      v14 = *(void **)v9;
      v7 = *(void **)(v9 + 8);
      *(_QWORD *)v9 = v7;
      *(_QWORD *)(v9 + 8) = v14;
      v9 -= 8;
      if (v4 == ++v8)
        goto LABEL_5;
    }
    __break(1u);
  }
}

void sub_100004078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  __objc2_prot_list *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  __objc2_prot_list *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;

  if (a3 != a2)
  {
    v4 = a3;
    v31 = *a4;
    v5 = *a4 + 8 * a3 - 8;
    v6 = &IntentHandler;
LABEL_6:
    v7 = *(void **)(v31 + 8 * v4);
    v8 = a1;
    v30 = v5;
    v32 = v4;
    while (1)
    {
      v9 = *(void **)v5;
      v10 = v7;
      v11 = v9;
      v12 = objc_msgSend(v10, (SEL)v6[132].count);
      if (!v12)
        break;
      v13 = v12;
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v16 = v15;

      v17 = objc_msgSend(v11, (SEL)v6[132].count);
      if (!v17)
      {

        swift_bridgeObjectRelease(v16);
LABEL_5:
        ++v4;
        v5 = v30 + 8;
        if (v4 == a2)
          return;
        goto LABEL_6;
      }
      v18 = v17;
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v34 = v11;
      v20 = v6;
      v21 = v19;
      v23 = v22;

      v33[2] = v14;
      v33[3] = v16;
      v33[0] = v21;
      v33[1] = v23;
      v6 = v20;
      v24 = sub_100006B44();
      v25 = StringProtocol.localizedStandardCompare<A>(_:)(v33, &type metadata for String, &type metadata for String, v24, v24);

      swift_bridgeObjectRelease(v16);
      v26 = v23;
      v4 = v32;
      swift_bridgeObjectRelease(v26);
      if (v25 != -1)
        goto LABEL_5;
      if (!v31)
      {
        __break(1u);
        return;
      }
      v27 = *(void **)v5;
      v7 = *(void **)(v5 + 8);
      *(_QWORD *)v5 = v7;
      *(_QWORD *)(v5 + 8) = v27;
      v5 -= 8;
      if (v32 == ++v8)
        goto LABEL_5;
    }

    goto LABEL_5;
  }
}

uint64_t sub_100004224(id *__src, id *a2, unint64_t a3, void **a4)
{
  id *v5;
  id *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  __objc2_prot_list *v14;
  void **v15;
  void **v16;
  void *v17;
  id v18;
  id v19;
  unsigned __int8 v20;
  id *v21;
  void **v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  void *v27;
  id v28;
  id v29;
  unsigned __int8 v30;
  uint64_t result;
  id *v32;
  char *v34;
  void **v35;
  id *v36;

  v36 = __src;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v8 = (char *)a2 - (char *)__src;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 3;
  v35 = a4;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7)
      goto LABEL_52;
    if (a4 != a2 || &a2[v12] <= a4)
      memmove(a4, a2, 8 * v12);
    v23 = &a4[v12];
    v34 = (char *)v23;
    v36 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_51:
      sub_100004AC4((void **)&v36, (const void **)&v35, &v34);
      return 1;
    }
    v24 = (id *)(a3 - 8);
    v25 = v5;
    v32 = v6;
    while (1)
    {
      v26 = v24 + 1;
      v27 = *--v25;
      v28 = *(v23 - 1);
      v29 = v27;
      if (objc_msgSend(v28, "isInternal"))
      {
        v30 = objc_msgSend(v29, "isInternal");

        if ((v30 & 1) == 0)
        {
          if (v26 != v5 || v24 >= v5)
            *v24 = *v25;
          v36 = v25;
          if (v25 <= v32)
            goto LABEL_51;
          goto LABEL_48;
        }
      }
      else
      {

      }
      v34 = (char *)(v23 - 1);
      if (v26 < v23 || v24 >= v23 || v26 != v23)
        *v24 = *(v23 - 1);
      v25 = v5;
      --v23;
      if (v5 <= v32)
        goto LABEL_51;
LABEL_48:
      --v24;
      v5 = v25;
      if (v23 <= a4)
        goto LABEL_51;
    }
  }
  if (v7 >= -7)
  {
    if (a4 != __src || &__src[v9] <= a4)
      memmove(a4, __src, 8 * v9);
    v13 = &a4[v9];
    v34 = (char *)v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      v14 = &IntentHandler;
      v15 = a4;
      while (1)
      {
        v16 = v6;
        v17 = *v15;
        v18 = *v5;
        v19 = v17;
        if (!objc_msgSend(v18, (SEL)v14[149].count))
          break;
        v20 = objc_msgSend(v19, (SEL)v14[149].count);

        if ((v20 & 1) != 0)
          goto LABEL_20;
        v21 = v5 + 1;
        v22 = v16;
        if (v16 >= v5 && v16 < v21)
        {
          v14 = &IntentHandler;
          if (v16 != v5)
            *v16 = *v5;
          goto LABEL_24;
        }
        *v16 = *v5;
LABEL_23:
        v14 = &IntentHandler;
LABEL_24:
        v6 = v22 + 1;
        if (v15 < v13)
        {
          v5 = v21;
          if ((unint64_t)v21 < a3)
            continue;
        }
        v36 = v6;
        goto LABEL_51;
      }

LABEL_20:
      v22 = v16;
      if (v16 != v15)
        *v16 = *v15;
      v35 = ++v15;
      v21 = v5;
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_52:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_100004558(void **__src, id *a2, unint64_t a3, void **__dst)
{
  void **v4;
  id *v5;
  void **v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __objc2_prot_list *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __objc2_prot_list *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void **v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  BOOL v33;
  id *v34;
  void **v35;
  void **v36;
  id *v37;
  void **v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void **v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t result;
  void **v55;
  uint64_t v56;
  void **v57;
  uint64_t v59;
  void **v60;
  void **v61;
  id *v62;
  id *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void **v68;
  void **v69;
  id *v70;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v8 = (char *)a2 - (char *)__src;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 3;
  v70 = __src;
  v69 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7)
      goto LABEL_53;
    if (__dst != a2 || &a2[v12] <= __dst)
      memmove(__dst, a2, 8 * v12);
    v35 = &v4[v12];
    v68 = v35;
    v70 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_52:
      sub_100004AC4((void **)&v70, (const void **)&v69, &v68);
      return 1;
    }
    v36 = (void **)(a3 - 8);
    v37 = v5;
    v57 = v6;
    while (1)
    {
      v61 = v36 + 1;
      v63 = v5;
      v38 = v35 - 1;
      v39 = *--v37;
      v40 = *(v35 - 1);
      v41 = v39;
      v42 = objc_msgSend(v40, "name");
      if (!v42)
        break;
      v43 = v42;
      v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v59 = v44;

      v45 = objc_msgSend(v41, "name");
      if (!v45)
      {

        swift_bridgeObjectRelease(v59);
LABEL_45:
        v68 = v38;
        v37 = v63;
        if (v61 < v35 || v36 >= v35 || v61 != v35)
          *v36 = *v38;
        v35 = v38;
        goto LABEL_50;
      }
      v46 = v45;
      v47 = v4;
      v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v55 = v35;
      v50 = v49;

      v66 = v56;
      v67 = v59;
      v64 = v48;
      v65 = v50;
      v4 = v47;
      v51 = sub_100006B44();
      v52 = StringProtocol.localizedStandardCompare<A>(_:)(&v64, &type metadata for String, &type metadata for String, v51, v51);

      swift_bridgeObjectRelease(v59);
      v53 = v50;
      v35 = v55;
      swift_bridgeObjectRelease(v53);
      if (v52 != -1)
        goto LABEL_45;
      if (v61 != v63 || v36 >= v63)
        *v36 = *v37;
      v70 = v37;
LABEL_50:
      if (v37 > v57)
      {
        --v36;
        v5 = v37;
        if (v35 > v4)
          continue;
      }
      goto LABEL_52;
    }

    goto LABEL_45;
  }
  if (v7 >= -7)
  {
    v13 = a3;
    if (__dst != __src || &__src[v9] <= __dst)
      memmove(__dst, __src, 8 * v9);
    v60 = &v4[v9];
    v68 = v60;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      v14 = &IntentHandler;
      while (1)
      {
        v62 = v5;
        v15 = *v4;
        v16 = *v5;
        v17 = v15;
        v18 = objc_msgSend(v16, (SEL)v14[132].count);
        if (v18)
        {
          v19 = v18;
          v20 = v14;
          v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v23 = v22;

          v24 = objc_msgSend(v17, (SEL)v20[132].count);
          if (v24)
          {
            v25 = v24;
            v26 = v6;
            v27 = v4;
            v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v30 = v29;

            v66 = v21;
            v67 = v23;
            v64 = v28;
            v65 = v30;
            v4 = v27;
            v6 = v26;
            v13 = a3;
            v31 = sub_100006B44();
            v32 = StringProtocol.localizedStandardCompare<A>(_:)(&v64, &type metadata for String, &type metadata for String, v31, v31);

            swift_bridgeObjectRelease(v23);
            swift_bridgeObjectRelease(v30);
            v33 = v32 == -1;
            v14 = &IntentHandler;
            if (v33)
            {
              v34 = v62 + 1;
              if (v6 < v62 || v6 >= v34 || v6 != v62)
                *v6 = *v62;
              goto LABEL_26;
            }
          }
          else
          {

            swift_bridgeObjectRelease(v23);
            v14 = &IntentHandler;
          }
        }
        else
        {

        }
        if (v6 != v4)
          *v6 = *v4;
        v69 = ++v4;
        v34 = v62;
LABEL_26:
        ++v6;
        if (v4 < v60)
        {
          v5 = v34;
          if ((unint64_t)v34 < v13)
            continue;
        }
        v70 = v6;
        goto LABEL_52;
      }
    }
    goto LABEL_52;
  }
LABEL_53:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_1000049CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
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
    v10 = sub_100006A8C(&qword_10000C688);
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
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_100004AC4(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_100004B6C(uint64_t a1)
{
  return sub_1000049CC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

Swift::Int sub_100004B80(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100006A8C(&qword_10000C660);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = v3;
  v36 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v36)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v36)
        goto LABEL_36;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_36:
          swift_release(v5);
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v36)
              goto LABEL_36;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v21);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain(v30[1]);
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v39, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_100004E88(uint64_t a1, uint64_t a2, uint64_t a3)
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

void *sub_100004F68()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100006A8C(&qword_10000C660);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain(v17);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100005110(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

void (*sub_100005178(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1000051F8(v6, a2, a3);
  return sub_1000051CC;
}

void sub_1000051CC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1000051F8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_100005264;
  }
  __break(1u);
  return result;
}

void sub_100005264(id *a1)
{

}

uint64_t sub_10000526C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void (*v15)(_QWORD *);
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t result;
  void (*v20[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v18);
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
      v12 = a3;
    else
      v12 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100006B8C();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100006A8C(&qword_10000C670);
          v15 = sub_100005178(v20, i, a3);
          v17 = *v16;
          ((void (*)(void (**)(id *), _QWORD))v15)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v17;
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
  v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    v11 = sub_100006B0C(0, &qword_10000C638, BCBatteryDevice_ptr);
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100005474(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_100005488()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t result;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74[4];
  uint64_t v75;
  unint64_t v76;

  v70 = sub_10000247C((uint64_t)_swiftEmptyArrayStorage);
  v0 = objc_msgSend(objc_allocWithZone((Class)BCBatteryDeviceController), "init");
  v1 = objc_msgSend(v0, "connectedDevices");

  if (!v1)
    goto LABEL_73;
  v67 = sub_100006B0C(0, &qword_10000C638, BCBatteryDevice_ptr);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1);

  v74[0] = (uint64_t)_swiftEmptyArrayStorage;
  if (!((unint64_t)v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_4;
LABEL_21:
    swift_bridgeObjectRelease(v2);
    v10 = (uint64_t)_swiftEmptyArrayStorage;
    v76 = (unint64_t)_swiftEmptyArrayStorage;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
      goto LABEL_60;
    goto LABEL_22;
  }
  if (v2 < 0)
    v11 = v2;
  else
    v11 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v2);
  v3 = _CocoaArrayWrapper.endIndex.getter(v11);
  swift_bridgeObjectRelease(v2);
  if (!v3)
    goto LABEL_21;
LABEL_4:
  if (v3 < 1)
  {
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    result = swift_release(v74[0]);
    __break(1u);
    return result;
  }
  for (i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
      v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v2);
    else
      v7 = *(id *)(v2 + 8 * i + 32);
    v8 = v7;
    if ((objc_msgSend(v7, "isInternal") & 1) != 0)
      goto LABEL_7;
    v9 = objc_msgSend(v8, "accessoryIdentifier");
    if (v9)
    {

LABEL_7:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v5 = *(_QWORD *)(v74[0] + 16);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v5);
      v6 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v5, v8);
      specialized ContiguousArray._endMutation()(v6);
      continue;
    }

  }
  swift_bridgeObjectRelease(v2);
  v10 = v74[0];
  v76 = (unint64_t)_swiftEmptyArrayStorage;
  if (v74[0] < 0)
  {
LABEL_60:
    while (2)
    {
      v47 = swift_retain(v10);
      v48 = swift_bridgeObjectRetain(v47);
      v12 = _CocoaArrayWrapper.endIndex.getter(v48);
      swift_release(v10);
      if (!v12)
        goto LABEL_61;
LABEL_24:
      v13 = v10 & 0xC000000000000001;
      v14 = 4;
      v68 = v10 & 0xC000000000000001;
      v69 = v10;
LABEL_30:
      if (v13)
        v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, v10);
      else
        v19 = *(id *)(v10 + 8 * v14);
      v15 = v19;
      v20 = v14 - 3;
      if (__OFADD__(v14 - 4, 1))
      {
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
        continue;
      }
      break;
    }
    if ((BCBatteryDevice.isLeftHeadPhone.getter() & 1) != 0 || (BCBatteryDevice.isRightHeadPhone.getter() & 1) != 0)
    {
      v21 = objc_msgSend(v15, "accessoryIdentifier");
      if (v21)
      {
        v22 = v21;
        v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v25 = v24;

        if (*(_QWORD *)(v70 + 16))
        {
          swift_bridgeObjectRetain(v25);
          sub_100002CC8(v23, v25);
          if ((v26 & 1) != 0)
          {

            swift_bridgeObjectRelease_n(v25, 2);
            goto LABEL_29;
          }
          swift_bridgeObjectRelease(v25);
        }
        v27 = v12;
        v28 = objc_msgSend(v15, "synthesizedRepresentativeDevice");
        if (!v28)
          goto LABEL_72;
        v29 = v28;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v31 = *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v30 = *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v31 >= v30 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
        v32 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
        specialized Array._endMutation()(v32);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v70);
        v74[0] = v70;
        v35 = sub_100002CC8(v23, v25);
        v36 = *(_QWORD *)(v70 + 16);
        v37 = (v34 & 1) == 0;
        v38 = v36 + v37;
        if (__OFADD__(v36, v37))
          goto LABEL_58;
        v10 = v34;
        if (*(_QWORD *)(v70 + 24) >= v38)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_100004F68();
        }
        else
        {
          sub_100004B80(v38, isUniquelyReferenced_nonNull_native);
          v39 = sub_100002CC8(v23, v25);
          if ((v10 & 1) != (v40 & 1))
            goto LABEL_74;
          v35 = v39;
        }
        v41 = (_QWORD *)v74[0];
        v70 = v74[0];
        if ((v10 & 1) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(v74[0] + 56) + v35) = 1;
        }
        else
        {
          *(_QWORD *)(v74[0] + 8 * (v35 >> 6) + 64) |= 1 << v35;
          v42 = (uint64_t *)(v41[6] + 16 * v35);
          *v42 = v23;
          v42[1] = v25;
          *(_BYTE *)(v41[7] + v35) = 1;
          v43 = v41[2];
          v44 = __OFADD__(v43, 1);
          v45 = v43 + 1;
          if (v44)
            goto LABEL_59;
          v41[2] = v45;
          swift_bridgeObjectRetain(v25);
        }

        swift_bridgeObjectRelease(v25);
        swift_bridgeObjectRelease(0x8000000000000000);
        v12 = v27;
        v13 = v68;
        v10 = v69;
LABEL_29:
        ++v14;
        if (v20 == v12)
        {
          swift_release(v10);
          v46 = v76;
          if ((v76 & 0x8000000000000000) == 0)
            goto LABEL_62;
          goto LABEL_70;
        }
        goto LABEL_30;
      }
    }
    else
    {
      v15 = v15;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v17 = *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v16 = *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v17 >= v16 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
      v18 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v15);
      specialized Array._endMutation()(v18);
    }

    goto LABEL_29;
  }
LABEL_22:
  if ((v10 & 0x4000000000000000) != 0)
    goto LABEL_60;
  v12 = *(_QWORD *)(v10 + 16);
  swift_retain(v10);
  if (v12)
    goto LABEL_24;
LABEL_61:
  swift_release(v10);
  v46 = (unint64_t)_swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
    goto LABEL_70;
LABEL_62:
  if ((v46 & 0x4000000000000000) != 0)
  {
LABEL_70:
    swift_bridgeObjectRetain_n(v46, 2);
    v49 = (uint64_t)sub_100002D2C(v46);
    swift_bridgeObjectRelease(v46);
  }
  else
  {
    v49 = v46 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(v46, 2);
  }
  v74[0] = v49;
  sub_100002610(v74);
  swift_bridgeObjectRelease(v46);
  v75 = v74[0];
  sub_10000258C(&v75);
  swift_bridgeObjectRelease(v46);
  if (qword_10000C6F0 != -1)
    swift_once(&qword_10000C6F0, sub_1000022BC);
  v50 = type metadata accessor for Logger(0);
  sub_100006A74(v50, (uint64_t)qword_10000C6F8);
  v51 = swift_retain(v10);
  v52 = Logger.logObject.getter(v51);
  v53 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = swift_slowAlloc(22, -1);
    v55 = swift_slowAlloc(64, -1);
    v74[0] = v55;
    *(_DWORD *)v54 = 136315394;
    v56 = swift_retain(v10);
    v57 = Array.description.getter(v56, v67);
    v59 = v58;
    swift_release(v10);
    v72 = sub_100002688(v57, v59, v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v54 + 4, v54 + 12);
    swift_release_n(v10, 2);
    swift_bridgeObjectRelease(v59);
    *(_WORD *)(v54 + 12) = 2080;
    swift_beginAccess(&v75, &v72, 0, 0);
    v60 = v75;
    v61 = swift_bridgeObjectRetain(v75);
    v62 = Array.description.getter(v61, v67);
    v64 = v63;
    swift_bridgeObjectRelease(v60);
    v71 = sub_100002688(v62, v64, v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v54 + 14, v54 + 22);
    swift_bridgeObjectRelease(v64);
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "IntentHandler|connectedDevices: %s, preprocessedConnectedDevices: %s", (uint8_t *)v54, 0x16u);
    swift_arrayDestroy(v55, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v55, -1, -1);
    swift_slowDealloc(v54, -1, -1);

  }
  else
  {

    swift_release_n(v10, 2);
  }
  swift_beginAccess(&v75, v74, 0, 0);
  v65 = v75;
  swift_bridgeObjectRelease(v70);
  return v65;
}

void sub_100005C14(id isa, uint64_t a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSString v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSString v36;
  id v37;
  NSString v38;
  id v39;
  Class v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  Class v47;
  id v48;
  Class v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;

  v51 = a2;
  if (qword_10000C6F0 != -1)
    goto LABEL_35;
  while (1)
  {
    v3 = type metadata accessor for Logger(0);
    sub_100006A74(v3, (uint64_t)qword_10000C6F8);
    v4 = isa;
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(12, -1);
      v8 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v7 = 138412290;
      isa = objc_msgSend(v4, "automatic");
      if (!isa)
      {
        sub_100006B0C(0, &qword_10000C640, NSNumber_ptr);
        isa = NSNumber.init(integerLiteral:)(2).super.super.isa;
      }
      v55 = (uint64_t)isa;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v7 + 4, v7 + 12);
      *v8 = isa;

      _os_log_impl((void *)&_mh_execute_header, v5, v6, "IntentHandler|provideDeviceOptionsCollection|IsAutomatic : %@", v7, 0xCu);
      v9 = sub_100006A8C(&qword_10000C648);
      swift_arrayDestroy(v8, 1, v9);
      swift_slowDealloc(v8, -1, -1);
      swift_slowDealloc(v7, -1, -1);

    }
    else
    {

    }
    v10 = sub_100005488();
    v11 = v10;
    if ((unint64_t)v10 >> 62)
      break;
    v12 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v12)
      goto LABEL_40;
LABEL_9:
    specialized ContiguousArray.reserveCapacity(_:)(v12);
    if (v12 < 0)
    {
      __break(1u);
      return;
    }
    v13 = 0;
    v52 = v11 & 0xC000000000000001;
    v53 = v11;
    while (v12 != v13)
    {
      if (v52)
        v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v11);
      else
        v24 = *(id *)(v11 + 8 * v13 + 32);
      v27 = v24;
      v28 = objc_msgSend(v24, "name", v51);
      if (v28)
      {
        v29 = v28;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        v31 = v30;

      }
      else
      {
        v31 = 0;
      }
      v32 = objc_msgSend(v27, "identifier");
      if (v32)
      {
        v33 = v32;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        v35 = v34;

        if (!v31)
          v31 = 0xEE00656369766544;
        if (v35)
        {
          v36 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v35);
        }
        else
        {
          v36 = 0;
        }
      }
      else
      {
        v36 = 0;
        if (!v31)
          v31 = 0xEE00656369766544;
      }
      v37 = objc_allocWithZone((Class)IntentDevice);
      v38 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v31);
      v39 = objc_msgSend(v37, "initWithIdentifier:displayString:", v36, v38);

      sub_100006B0C(0, &qword_10000C640, NSNumber_ptr);
      v40 = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
      objc_msgSend(v39, "setIsSynthesized:", v40);

      v41 = objc_msgSend(v27, "identifier");
      if (v41)
      {
        v42 = v41;
        v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v45 = v44;

        v55 = v43;
        v56 = v45;
        v54[0] = 0x69736568746E7973;
        v54[1] = 0xEB0000000064657ALL;
        v46 = sub_100006B44();
        LOBYTE(v42) = StringProtocol.contains<A>(_:)(v54, &type metadata for String, &type metadata for String, v46, v46);
        swift_bridgeObjectRelease(v45);
        if ((v42 & 1) != 0)
        {
          v47 = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
          objc_msgSend(v39, "setIsSynthesized:", v47);

        }
      }
      v14 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", objc_msgSend(v27, "isLowBattery"));
      objc_msgSend(v39, "setIsLowBattery:", v14);

      v15 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", objc_msgSend(v27, "isLowPowerModeActive"));
      objc_msgSend(v39, "setIsLowPowerModeActive:", v15);

      v16 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", objc_msgSend(v27, "percentCharge"));
      objc_msgSend(v39, "setPercentCharge:", v16);

      LOBYTE(v55) = 0;
      v17 = objc_msgSend(v27, "batteryWidgetGlyphName:", &v55);
      if (!v17)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        v26 = v25;
        v17 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v26);
      }
      ++v13;
      objc_msgSend(v39, "setSystemImageName:", v17);

      v18 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", v55);
      objc_msgSend(v39, "setIsCustomImage:", v18);

      v19 = objc_msgSend(v27, "accessoryIdentifier");
      objc_msgSend(v39, "setAccessoryIdentifier:", v19);

      v20 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", objc_msgSend(v27, "isInternal"));
      objc_msgSend(v39, "setIsInternal:", v20);

      v21 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", objc_msgSend(v27, "parts"));
      objc_msgSend(v39, "setParts:", v21);

      v22 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", objc_msgSend(v27, "isCharging"));
      objc_msgSend(v39, "setIsCharging:", v22);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      isa = (id)_swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(isa);
      v23 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(isa, v39);
      specialized ContiguousArray._endMutation()(v23);
      v11 = v53;
      if (v12 == v13)
      {
        swift_bridgeObjectRelease(v53);
        goto LABEL_41;
      }
    }
    __break(1u);
LABEL_35:
    swift_once(&qword_10000C6F0, sub_1000022BC);
  }
  if (v10 < 0)
    isa = (id)v10;
  else
    isa = (id)(v10 & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain(v10);
  v12 = _CocoaArrayWrapper.endIndex.getter(isa);
  swift_bridgeObjectRelease(v11);
  if (v12)
    goto LABEL_9;
LABEL_40:
  swift_bridgeObjectRelease(v11);
LABEL_41:
  v48 = objc_allocWithZone((Class)INObjectCollection);
  sub_100006B0C(0, &qword_10000C650, IntentDevice_ptr);
  v49 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v50 = objc_msgSend(v48, "initWithItems:", v49);

  (*(void (**)(uint64_t, id, _QWORD))(v51 + 16))(v51, v50, 0);
}

id sub_1000063EC(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  Class *v7;
  Class isa;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSString v24;
  id v25;
  NSString v26;
  id v27;
  Class v28;
  id v29;
  id v30;
  id v31;
  NSString v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  Class v43;
  uint64_t v44;

  if (qword_10000C6F0 != -1)
    swift_once(&qword_10000C6F0, sub_1000022BC);
  v2 = type metadata accessor for Logger(0);
  sub_100006A74(v2, (uint64_t)qword_10000C6F8);
  v3 = a1;
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (Class *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    isa = (Class)objc_msgSend(v3, "automatic");
    if (!isa)
    {
      sub_100006B0C(0, &qword_10000C640, NSNumber_ptr);
      isa = NSNumber.init(integerLiteral:)(2).super.super.isa;
    }
    v43 = isa;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v6 + 4, v6 + 12);
    *v7 = isa;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "IntentHandler|DefaultDevice|IsAutomatic : %@", v6, 0xCu);
    v9 = sub_100006A8C(&qword_10000C648);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
  v10 = objc_msgSend(objc_allocWithZone((Class)BCBatteryDeviceController), "init");
  v11 = objc_msgSend(v10, "connectedDevices");

  if (!v11)
LABEL_37:
    __break(1u);
  sub_100006B0C(0, &qword_10000C638, BCBatteryDevice_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11);

  if (!((unint64_t)v12 >> 62))
  {
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_11;
LABEL_33:
    swift_bridgeObjectRelease(v12);
    return 0;
  }
  if (v12 < 0)
    v40 = v12;
  else
    v40 = v12 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v12);
  v41 = _CocoaArrayWrapper.endIndex.getter(v40);
  swift_bridgeObjectRelease(v12);
  if (!v41)
    goto LABEL_33;
LABEL_11:
  if ((v12 & 0xC000000000000001) != 0)
  {
    v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v12);
    goto LABEL_14;
  }
  if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_37;
  }
  v13 = *(id *)(v12 + 32);
LABEL_14:
  v14 = v13;
  swift_bridgeObjectRelease(v12);
  v15 = objc_msgSend(v14, "name");
  if (v15)
  {
    v16 = v15;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v18 = v17;

  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(v14, "identifier");
  if (v19)
  {
    v20 = v19;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v22 = v21;

  }
  else
  {
    v22 = 0;
  }
  if (v18)
    v23 = v18;
  else
    v23 = 0xEE00656369766544;
  if (v22)
  {
    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v22);
  }
  else
  {
    v24 = 0;
  }
  v25 = objc_allocWithZone((Class)IntentDevice);
  v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  v27 = objc_msgSend(v25, "initWithIdentifier:displayString:", v24, v26);

  sub_100006B0C(0, &qword_10000C640, NSNumber_ptr);
  v28 = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
  objc_msgSend(v27, "setIsSynthesized:", v28);

  v29 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", objc_msgSend(v14, "isLowBattery"));
  objc_msgSend(v27, "setIsLowBattery:", v29);

  v30 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", objc_msgSend(v14, "isLowPowerModeActive"));
  objc_msgSend(v27, "setIsLowPowerModeActive:", v30);

  v31 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", objc_msgSend(v14, "percentCharge"));
  objc_msgSend(v27, "setPercentCharge:", v31);

  LOBYTE(v43) = 0;
  v32 = objc_msgSend(v14, "batteryWidgetGlyphName:", &v43);
  if (!v32)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v34 = v33;
    v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v34);
  }
  objc_msgSend(v27, "setSystemImageName:", v32);

  v35 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", v43);
  objc_msgSend(v27, "setIsCustomImage:", v35);

  v36 = objc_msgSend(v14, "accessoryIdentifier");
  objc_msgSend(v27, "setAccessoryIdentifier:", v36);

  v37 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", objc_msgSend(v14, "isInternal"));
  objc_msgSend(v27, "setIsInternal:", v37);

  v38 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", objc_msgSend(v14, "parts"));
  objc_msgSend(v27, "setParts:", v38);

  v39 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", objc_msgSend(v14, "isCharging"));
  objc_msgSend(v27, "setIsCharging:", v39);

  return v27;
}

uint64_t sub_100006A74(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100006A8C(uint64_t *a1)
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

uint64_t *sub_100006ACC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100006B0C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_100006B44()
{
  unint64_t result;

  result = qword_10000C658;
  if (!qword_10000C658)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C658);
  }
  return result;
}

unint64_t sub_100006B8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C678;
  if (!qword_10000C678)
  {
    v1 = sub_100006BD8(&qword_10000C670);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C678);
  }
  return result;
}

uint64_t sub_100006BD8(uint64_t *a1)
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

uint64_t sub_100006C1C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}
