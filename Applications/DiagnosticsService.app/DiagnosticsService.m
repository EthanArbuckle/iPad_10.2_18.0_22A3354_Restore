uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0, 0);
  objc_autoreleasePoolPop(v4);
  return v5;
}

unint64_t sub_1000020C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002D54(&qword_100008928);
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
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v10 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_100002CB0(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (_QWORD *)(v4[7] + 16 * result);
    *v14 = v10;
    v14[1] = v9;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
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

uint64_t sub_1000021F4(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int64_t v48;
  int64_t v49;
  unint64_t v50;
  unint64_t v51;
  int64_t v52;
  unint64_t v53;
  int64_t v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  __n128 v62;
  uint64_t v63;
  __n128 v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  double v75;
  __int128 v76;
  __int128 v77;

  v2 = v1;
  v4 = OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration;
  *(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration] = 0x4008000000000000;
  v6 = *(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey];
  v5 = *(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey + 8];
  if (!*(_QWORD *)(a1 + 16))
  {
    v76 = 0u;
    v77 = 0u;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain(*(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey + 8]);
  v7 = sub_100002CB0(v6, v5);
  if ((v8 & 1) == 0)
  {
    v76 = 0u;
    v77 = 0u;
    swift_bridgeObjectRelease(v5);
    goto LABEL_11;
  }
  sub_100003264(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)&v76);
  swift_bridgeObjectRelease(v5);
  if (!*((_QWORD *)&v77 + 1))
  {
LABEL_11:
    v9 = sub_100002D14((uint64_t)&v76);
    goto LABEL_12;
  }
  v9 = swift_dynamicCast(&v75, &v76, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
  if ((v9 & 1) == 0 || (v10.n128_f64[0] = v75, v75 < 1.0) || v75 > 10.0)
  {
LABEL_12:
    v11 = static os_log_type_t.error.getter(v9, v10);
    v12 = sub_100002D54(&qword_1000088F0);
    v13 = swift_allocObject(v12, 72, 7);
    *(_OWORD *)(v13 + 16) = xmmword_100003520;
    *(_QWORD *)(v13 + 56) = &type metadata for String;
    *(_QWORD *)(v13 + 64) = sub_100002D94();
    *(_QWORD *)(v13 + 32) = v6;
    *(_QWORD *)(v13 + 40) = v5;
    sub_100002DD8();
    v14 = swift_bridgeObjectRetain(v5);
    v15 = (void *)static OS_os_log.default.getter(v14);
    os_log(_:dso:log:type:_:)("Input parameter validation: Default value is used for %@ ", 57, 2, &_mh_execute_header, v15, v11, v13);
    swift_bridgeObjectRelease(v13);

    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_8;
    goto LABEL_13;
  }
  *(double *)&v1[v4] = v75;
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_8:
    v76 = 0u;
    v77 = 0u;
LABEL_20:
    sub_100002D14((uint64_t)&v76);
    goto LABEL_21;
  }
LABEL_13:
  v16 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey];
  v17 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey + 8];
  swift_bridgeObjectRetain(v17);
  v18 = sub_100002CB0(v16, v17);
  if ((v19 & 1) != 0)
  {
    sub_100003264(*(_QWORD *)(a1 + 56) + 32 * v18, (uint64_t)&v76);
  }
  else
  {
    v76 = 0u;
    v77 = 0u;
  }
  swift_bridgeObjectRelease(v17);
  if (!*((_QWORD *)&v77 + 1))
    goto LABEL_20;
  v20 = sub_100002D54(&qword_100008918);
  if ((swift_dynamicCast(&v75, &v76, (char *)&type metadata for Any + 8, v20, 6) & 1) != 0)
  {
    v21 = *(_QWORD *)&v75;
    if (*(_QWORD *)(*(_QWORD *)&v75 + 16))
      goto LABEL_22;
    swift_bridgeObjectRelease(*(_QWORD *)&v75);
  }
LABEL_21:
  v21 = sub_1000020C8((uint64_t)_swiftEmptyArrayStorage);
LABEL_22:
  v22 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringProperties];
  *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringProperties] = v21;
  swift_bridgeObjectRelease(v22);
  v24 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey];
  v23 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey + 8];
  if (!*(_QWORD *)(a1 + 16))
  {
    v76 = 0u;
    v77 = 0u;
LABEL_33:
    v28 = sub_100002D14((uint64_t)&v76);
    goto LABEL_34;
  }
  swift_bridgeObjectRetain(*(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey + 8]);
  v25 = sub_100002CB0(v24, v23);
  if ((v26 & 1) != 0)
  {
    sub_100003264(*(_QWORD *)(a1 + 56) + 32 * v25, (uint64_t)&v76);
  }
  else
  {
    v76 = 0u;
    v77 = 0u;
  }
  swift_bridgeObjectRelease(v23);
  if (!*((_QWORD *)&v77 + 1))
    goto LABEL_33;
  v27 = sub_100002D54(&qword_100008908);
  v28 = swift_dynamicCast(&v75, &v76, (char *)&type metadata for Any + 8, v27, 6);
  if ((v28 & 1) == 0)
  {
LABEL_34:
    v32 = static os_log_type_t.fault.getter(v28);
LABEL_35:
    v33 = v32;
    v34 = sub_100002D54(&qword_1000088F0);
    v35 = swift_allocObject(v34, 72, 7);
    *(_OWORD *)(v35 + 16) = xmmword_100003520;
    *(_QWORD *)(v35 + 56) = &type metadata for String;
    *(_QWORD *)(v35 + 64) = sub_100002D94();
    *(_QWORD *)(v35 + 32) = v24;
    *(_QWORD *)(v35 + 40) = v23;
    sub_100002DD8();
    v36 = swift_bridgeObjectRetain(v23);
    v37 = (void *)static OS_os_log.default.getter(v36);
    os_log(_:dso:log:type:_:)("Input parameter validation: required value %@ is missing, abort text", 68, 2, &_mh_execute_header, v37, v33, v35);
    swift_bridgeObjectRelease(v35);

    return 0;
  }
  v29 = v75;
  if (!*(_QWORD *)(*(_QWORD *)&v75 + 16))
  {
    v28 = swift_bridgeObjectRelease(*(_QWORD *)&v75);
    goto LABEL_34;
  }
  v24 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey];
  v23 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey + 8];
  if (!*(_QWORD *)(a1 + 16))
  {
    v76 = 0u;
    v77 = 0u;
LABEL_73:
    swift_bridgeObjectRelease(*(_QWORD *)&v29);
    v61 = sub_100002D14((uint64_t)&v76);
    v32 = static os_log_type_t.error.getter(v61, v62);
    goto LABEL_35;
  }
  swift_bridgeObjectRetain(*(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey + 8]);
  v30 = sub_100002CB0(v24, v23);
  if ((v31 & 1) != 0)
  {
    sub_100003264(*(_QWORD *)(a1 + 56) + 32 * v30, (uint64_t)&v76);
  }
  else
  {
    v76 = 0u;
    v77 = 0u;
  }
  swift_bridgeObjectRelease(v23);
  if (!*((_QWORD *)&v77 + 1))
    goto LABEL_73;
  v39 = sub_100002D54(&qword_100008910);
  if ((swift_dynamicCast(&v75, &v76, (char *)&type metadata for Any + 8, v39, 6) & 1) == 0)
  {
LABEL_75:
    v63 = swift_bridgeObjectRelease(*(_QWORD *)&v29);
    v32 = static os_log_type_t.error.getter(v63, v64);
    goto LABEL_35;
  }
  v40 = v75;
  if (!*(_QWORD *)(*(_QWORD *)&v75 + 16))
  {
    swift_bridgeObjectRelease(*(_QWORD *)&v75);
    goto LABEL_75;
  }
  v72 = *(_QWORD *)(*(_QWORD *)&v29 + 16);
  if (!v72)
  {
    swift_bridgeObjectRelease(*(_QWORD *)&v75);
    swift_bridgeObjectRelease(*(_QWORD *)&v29);
    v43 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_78;
  }
  v41 = 0;
  v42 = *(_QWORD *)&v75 + 64;
  v71 = *(_QWORD *)&v29 + 32;
  v43 = (char *)_swiftEmptyArrayStorage;
  v70 = v29;
  while (2)
  {
    if (v41 >= *(_QWORD *)(*(_QWORD *)&v29 + 16))
    {
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
    v44 = *(_QWORD *)(v71 + 8 * v41);
    v73 = v41 + 1;
    v45 = 1 << *(_BYTE *)(*(_QWORD *)&v40 + 32);
    if (v45 < 64)
      v46 = ~(-1 << v45);
    else
      v46 = -1;
    v47 = v46 & *(_QWORD *)(*(_QWORD *)&v40 + 64);
    v48 = (unint64_t)(v45 + 63) >> 6;
    swift_bridgeObjectRetain(*(_QWORD *)&v40);
    v49 = 0;
    if (v47)
    {
LABEL_50:
      v50 = __clz(__rbit64(v47));
      v47 &= v47 - 1;
      v51 = v50 | (v49 << 6);
      goto LABEL_51;
    }
    while (1)
    {
      v52 = v49 + 1;
      if (__OFADD__(v49, 1))
      {
        __break(1u);
LABEL_81:
        __break(1u);
        goto LABEL_82;
      }
      if (v52 >= v48)
        goto LABEL_44;
      v53 = *(_QWORD *)(v42 + 8 * v52);
      ++v49;
      if (!v53)
      {
        v49 = v52 + 1;
        if (v52 + 1 >= v48)
          goto LABEL_44;
        v53 = *(_QWORD *)(v42 + 8 * v49);
        if (!v53)
        {
          v49 = v52 + 2;
          if (v52 + 2 >= v48)
            goto LABEL_44;
          v53 = *(_QWORD *)(v42 + 8 * v49);
          if (!v53)
            break;
        }
      }
LABEL_66:
      v47 = (v53 - 1) & v53;
      v51 = __clz(__rbit64(v53)) + (v49 << 6);
LABEL_51:
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v40 + 56) + 8 * v51) == v44)
      {
        v55 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)&v40 + 48) + 16 * v51);
        v56 = v55[1];
        v74 = *v55;
        swift_bridgeObjectRetain(v56);
        if ((swift_isUniquelyReferenced_nonNull_native(v43) & 1) == 0)
          v43 = sub_100002EF4(0, *((_QWORD *)v43 + 2) + 1, 1, v43);
        v58 = *((_QWORD *)v43 + 2);
        v57 = *((_QWORD *)v43 + 3);
        v59 = v43;
        if (v58 >= v57 >> 1)
          v59 = sub_100002EF4((char *)(v57 > 1), v58 + 1, 1, v43);
        *((_QWORD *)v59 + 2) = v58 + 1;
        v43 = v59;
        v60 = &v59[16 * v58];
        *((_QWORD *)v60 + 4) = v74;
        *((_QWORD *)v60 + 5) = v56;
        if (v47)
          goto LABEL_50;
      }
      else if (v47)
      {
        goto LABEL_50;
      }
    }
    v54 = v52 + 3;
    if (v54 < v48)
    {
      v53 = *(_QWORD *)(v42 + 8 * v54);
      if (!v53)
      {
        while (1)
        {
          v49 = v54 + 1;
          if (__OFADD__(v54, 1))
            goto LABEL_81;
          if (v49 >= v48)
            goto LABEL_44;
          v53 = *(_QWORD *)(v42 + 8 * v49);
          ++v54;
          if (v53)
            goto LABEL_66;
        }
      }
      v49 = v54;
      goto LABEL_66;
    }
LABEL_44:
    swift_release(*(_QWORD *)&v40);
    v41 = v73;
    v29 = v70;
    if (v73 != v72)
      continue;
    break;
  }
  swift_bridgeObjectRelease(*(_QWORD *)&v40);
  swift_bridgeObjectRelease(*(_QWORD *)&v70);
LABEL_78:
  if (qword_100008800 != -1)
LABEL_83:
    swift_once(&qword_100008800, sub_1000032A4);
  v65 = qword_100008A78;
  v66 = v2;
  v67 = swift_bridgeObjectRetain(v43);
  v68 = sub_100003110(v67, (uint64_t)v66);
  swift_bridgeObjectRelease_n(v43, 2);

  v69 = *(_QWORD *)(v65 + 32);
  *(_QWORD *)(v65 + 32) = v68;
  swift_bridgeObjectRelease(v69);
  return 1;
}

uint64_t sub_1000029BC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = *(_QWORD *)(a1 + *a4);
  *(_QWORD *)(a1 + *a4) = v6;
  swift_bridgeObjectRelease(v7);
  return 1;
}

id sub_100002A1C()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  objc_super v8;

  *(_QWORD *)&v0[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___MicrophoneTestInputs_stringProperties] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___MicrophoneTestInputs_microphoneSequence] = _swiftEmptyArrayStorage;
  v1 = &v0[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey];
  *(_QWORD *)v1 = 0xD000000000000016;
  *((_QWORD *)v1 + 1) = 0x8000000100003770;
  v2 = &v0[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey];
  *(_QWORD *)v2 = 0xD000000000000010;
  *((_QWORD *)v2 + 1) = 0x8000000100003790;
  v3 = &v0[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey];
  *(_QWORD *)v3 = 0x65636E6575716573;
  *((_QWORD *)v3 + 1) = 0xE800000000000000;
  v4 = &v0[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey];
  *(_QWORD *)v4 = 0x6D6F437475706E69;
  *((_QWORD *)v4 + 1) = 0xEF73746E656E6F70;
  v5 = OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping;
  v6 = v0;
  *(_QWORD *)&v0[v5] = sub_1000020C8((uint64_t)&off_100004178);
  *(_QWORD *)&v6[OBJC_IVAR___MicrophoneTestInputs_predicates] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v6[OBJC_IVAR___MicrophoneTestInputs_parameters] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v6[OBJC_IVAR___MicrophoneTestInputs_specifications] = &_swiftEmptyDictionarySingleton;

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for MicrophoneTestInputs();
  return objc_msgSendSuper2(&v8, "init");
}

id sub_100002B98()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestInputs();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MicrophoneTestInputs()
{
  return objc_opt_self(MicrophoneTestInputs);
}

unint64_t sub_100002CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100002E14(a1, a2, v5);
}

uint64_t sub_100002D14(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002D54(&qword_1000088E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100002D54(uint64_t *a1)
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

unint64_t sub_100002D94()
{
  unint64_t result;

  result = qword_1000088F8;
  if (!qword_1000088F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000088F8);
  }
  return result;
}

unint64_t sub_100002DD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008900;
  if (!qword_100008900)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008900);
  }
  return result;
}

unint64_t sub_100002E14(uint64_t a1, uint64_t a2, uint64_t a3)
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

char *sub_100002EF4(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002D54(&qword_100008920);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_100002FF4(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100003010(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_100003010(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002D54(&qword_100008920);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_release(a4);
  return v11;
}

_QWORD *sub_100003110(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100002FF4(0, v2, 0);
    v5 = *(_QWORD *)(a2 + OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping);
    v6 = (uint64_t *)(a1 + 40);
    do
    {
      v7 = *v6;
      if (*(_QWORD *)(v5 + 16))
      {
        v8 = *(v6 - 1);
        swift_bridgeObjectRetain_n(*v6, 2);
        v9 = sub_100002CB0(v8, v7);
        if ((v10 & 1) != 0)
        {
          v11 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v9);
          v12 = *v11;
          v13 = v11[1];
          swift_bridgeObjectRetain(v13);
        }
        else
        {
          v12 = 0;
          v13 = 0xE000000000000000;
        }
      }
      else
      {
        v14 = swift_bridgeObjectRetain(*v6);
        v12 = 0;
        v13 = 0xE000000000000000;
        swift_bridgeObjectRetain(v14);
      }
      swift_bridgeObjectRelease_n(v7, 2);
      v16 = _swiftEmptyArrayStorage[2];
      v15 = _swiftEmptyArrayStorage[3];
      if (v16 >= v15 >> 1)
        sub_100002FF4((char *)(v15 > 1), v16 + 1, 1);
      _swiftEmptyArrayStorage[2] = v16 + 1;
      v17 = (char *)&_swiftEmptyArrayStorage[2 * v16];
      *((_QWORD *)v17 + 4) = v12;
      *((_QWORD *)v17 + 5) = v13;
      v6 += 2;
      --v2;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100003264(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_1000032A4()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for MicrophoneTestSharedData();
  result = (_QWORD *)swift_allocObject(v0, 40, 7);
  result[2] = 0x4008000000000000;
  result[3] = 100;
  result[4] = _swiftEmptyArrayStorage;
  qword_100008A78 = (uint64_t)result;
  return result;
}

uint64_t sub_1000032E4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for MicrophoneTestSharedData()
{
  return objc_opt_self(_TtC18DiagnosticsService24MicrophoneTestSharedData);
}
