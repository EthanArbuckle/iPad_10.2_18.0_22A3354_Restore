__n128 sub_100003B68(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1000040D8(a1, &qword_100058778, (uint64_t)&unk_100051728);
}

uint64_t sub_100003B8C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100003BAC(uint64_t result, int a2, int a3)
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
  sub_1000040D8(a1, &qword_100058780, (uint64_t)&unk_1000517A8);
}

void type metadata accessor for GKProfilePrivacyVisibility(uint64_t a1)
{
  sub_1000040D8(a1, &qword_100058788, (uint64_t)&unk_1000517D0);
}

uint64_t sub_100003BFC@<X0>(uint64_t a1@<X8>)
{
  id v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  Swift::String v30;
  Swift::String v31;

  v2 = (id)GKGameCenterUIFrameworkBundle();
  v31._object = (void *)0xE000000000000000;
  v3._object = (void *)0x8000000100041500;
  v3._countAndFlagsBits = 0xD000000000000027;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  v31._countAndFlagsBits = 0;
  v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v31);

  v30 = v5;
  v6 = sub_1000042C0();
  v7 = Text.init<A>(_:)(&v30, &type metadata for String, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12 & 1;
  v14 = static Font.subheadline.getter();
  v15 = Text.font(_:)(v14, v7, v9, v13, v11);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  swift_release(v14);
  sub_100004304(v7, v9, v13);
  v22 = swift_bridgeObjectRelease(v11);
  LODWORD(v30._countAndFlagsBits) = static HierarchicalShapeStyle.secondary.getter(v22);
  v23 = Text.foregroundStyle<A>(_:)(&v30, v15, v17, v19 & 1, v21, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
  v25 = v24;
  LOBYTE(v11) = v26;
  v28 = v27;
  sub_100004304(v15, v17, v19 & 1);
  result = swift_bridgeObjectRelease(v21);
  *(_QWORD *)a1 = v23;
  *(_QWORD *)(a1 + 8) = v25;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v28;
  *(_WORD *)(a1 + 32) = 256;
  return result;
}

uint64_t sub_100003D8C()
{
  return static View._viewListCount(inputs:)();
}

_DWORD *sub_100003DA8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_100003DB8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_100003DC4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100003DD4(uint64_t a1, uint64_t a2)
{
  return sub_100003F1C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003DE0(uint64_t a1, id *a2)
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

uint64_t sub_100003E54(uint64_t a1, id *a2)
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

uint64_t sub_100003ED0@<X0>(_QWORD *a1@<X8>)
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

uint64_t sub_100003F10(uint64_t a1, uint64_t a2)
{
  return sub_100003F1C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003F1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100003F58(uint64_t a1)
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

Swift::Int sub_100003F98(uint64_t a1)
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

BOOL sub_100004008(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000401C(_QWORD *a1, uint64_t *a2)
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

void sub_1000040A4(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_1000040D8(a1, &qword_1000587F0, (uint64_t)&unk_1000517F0);
}

void type metadata accessor for MSMessagesAppPresentationStyle(uint64_t a1)
{
  sub_1000040D8(a1, &qword_1000587F8, (uint64_t)&unk_100051818);
}

void sub_1000040D8(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_10000411C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100004160@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004188(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10000423C(&qword_100058818, (uint64_t)&unk_100043BD8);
  v3 = sub_10000423C(&qword_100058820, (uint64_t)&unk_100043B2C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000041F4()
{
  return sub_10000423C(&qword_100058800, (uint64_t)&unk_100043AF0);
}

uint64_t sub_100004218()
{
  return sub_10000423C(&qword_100058808, (uint64_t)&unk_100043AC4);
}

uint64_t sub_10000423C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000427C()
{
  return sub_10000423C(&qword_100058810, (uint64_t)&unk_100043B60);
}

ValueMetadata *type metadata accessor for FriendInviteExpirationText()
{
  return &type metadata for FriendInviteExpirationText;
}

uint64_t sub_1000042B0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100045594, 1);
}

unint64_t sub_1000042C0()
{
  unint64_t result;

  result = qword_100058828;
  if (!qword_100058828)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100058828);
  }
  return result;
}

uint64_t sub_100004304(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_100004318()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100058830;
  if (!qword_100058830)
  {
    v1 = sub_10000437C(&qword_100058838);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100058830);
  }
  return result;
}

uint64_t sub_10000437C(uint64_t *a1)
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

_BYTE *initializeBufferWithCopyOfBuffer for FriendInviteActionStatusText(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FriendInviteActionStatusText(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteActionStatusText(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000044C8 + 4 * byte_100043CB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000044FC + 4 * byte_100043CB0[v4]))();
}

uint64_t sub_1000044FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004504(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000450CLL);
  return result;
}

uint64_t sub_100004518(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100004520);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100004524(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000452C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteActionStatusText()
{
  return &type metadata for FriendInviteActionStatusText;
}

uint64_t sub_100004548(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000455D8, 1);
}

uint64_t sub_100004558@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  Swift::String v16;
  uint64_t v17;
  Swift::String v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t (*v39)(char *, uint64_t);
  uint64_t v40;
  __n128 v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  __n128 v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  int v63;
  char v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  int v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  _OWORD *v77;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  unint64_t v93;
  int v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  char v113;
  char v114;
  Swift::String v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  Swift::String v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
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
  Swift::String v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  _OWORD v161[15];
  uint64_t v162;
  uint64_t v163;
  char v164;
  uint64_t v165;
  char v166;
  double v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char v171;
  char v172;
  double v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char v177;

  v111 = a2;
  v108 = sub_100005170(&qword_1000589C0);
  __chkstk_darwin();
  v110 = (uint64_t)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = type metadata accessor for RoundedCornerStyle(0);
  v104 = *(_QWORD *)(v106 - 8);
  __chkstk_darwin();
  v103 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin();
  v109 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for GKFeatureFlags(0);
  v99 = *(_QWORD *)(v6 - 8);
  v100 = v6;
  __chkstk_darwin();
  v8 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_100005170(&qword_1000589C8);
  __chkstk_darwin();
  v10 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_100005170(&qword_1000589D0);
  v11 = __chkstk_darwin();
  v105 = (uint64_t)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (id)GKGameCenterUIFrameworkBundle(v11);
  if ((a1 & 1) != 0)
  {
    v93 = 0xE000000000000000;
    v14 = 0x8000000100041560;
    v15 = 0xD00000000000001ELL;
  }
  else
  {
    v15 = 0xD000000000000022;
    v93 = 0xE000000000000000;
    v14 = 0x8000000100041530;
  }
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v17 = 0;
  v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v15, (Swift::String_optional)0, (NSBundle)v13, v16, *(Swift::String *)(&v93 - 1));

  v145 = v18;
  v19 = sub_1000042C0();
  v20 = Text.init<A>(_:)(&v145, &type metadata for String, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25 & 1;
  v27 = static Font.subheadline.getter();
  v28 = Font.bold()();
  swift_release(v27);
  v29 = Text.font(_:)(v28, v20, v22, v26, v24);
  v96 = v30;
  v97 = v29;
  LOBYTE(v27) = v31;
  v98 = v32;
  swift_release(v28);
  v95 = v27 & 1;
  sub_100004304(v20, v22, v26);
  v33 = swift_bridgeObjectRelease(v24);
  v94 = static Edge.Set.vertical.getter(v33);
  v34 = enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:);
  v36 = v99;
  v35 = v100;
  v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v99 + 104);
  v38 = v37(v8, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v100);
  LOBYTE(v24) = GKFeatureFlags.isEnabled.getter(v38);
  v39 = *(uint64_t (**)(char *, uint64_t))(v36 + 8);
  v40 = v39(v8, v35);
  v41.n128_u64[0] = 6.0;
  if ((v24 & 1) != 0)
    v41.n128_f64[0] = 8.0;
  v42 = EdgeInsets.init(_all:)(v40, v41);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  LODWORD(v99) = static Edge.Set.horizontal.getter();
  v49 = v37(v8, v34, v35);
  v50 = GKFeatureFlags.isEnabled.getter(v49);
  v51 = v39(v8, v35);
  v52.n128_u64[0] = 0x4044000000000000;
  if ((v50 & 1) == 0)
    v52.n128_f64[0] = 0.0;
  v53 = EdgeInsets.init(_all:)(v51, v52);
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v60 = v37(v8, v34, v35);
  v61 = GKFeatureFlags.isEnabled.getter(v60);
  v62 = v39(v8, v35);
  v63 = v61 & 1;
  v64 = v95;
  v114 = v95;
  if (v63)
    v65 = 0.0;
  else
    v65 = INFINITY;
  v113 = 0;
  v112 = 0;
  v67 = v96;
  v66 = v97;
  v162 = v97;
  v163 = v96;
  v164 = v95;
  v68 = v98;
  v165 = v98;
  v166 = v94;
  v167 = v42;
  v168 = v44;
  v169 = v46;
  v170 = v48;
  v171 = 0;
  v172 = v99;
  v173 = v53;
  v174 = v55;
  v175 = v57;
  v176 = v59;
  v177 = 0;
  v69 = static Alignment.center.getter(v62);
  sub_100004C2C(0.0, 1, 0.0, 1, v65, v63, 0.0, 1, v161, 0.0, 1, 0.0, 1, v69, v70);
  sub_100004304(v66, v67, v64);
  v71 = swift_bridgeObjectRelease(v68);
  v126 = v161[11];
  v127 = v161[12];
  v128 = v161[13];
  v129 = v161[14];
  v122 = v161[7];
  v123 = v161[8];
  v124 = v161[9];
  v125 = v161[10];
  v119 = v161[4];
  v120 = v161[5];
  v121 = v161[6];
  v115 = (Swift::String)v161[0];
  v116 = v161[1];
  v117 = v161[2];
  v118 = v161[3];
  v72 = static Edge.Set.all.getter(v71);
  v142 = v127;
  v143 = v128;
  v144 = v129;
  v138 = v123;
  v139 = v124;
  v140 = v125;
  v141 = v126;
  v134 = v119;
  v135 = v120;
  v136 = v121;
  v137 = v122;
  v130 = v115;
  v131 = v116;
  v132 = v117;
  v133 = v118;
  v73 = static HierarchicalShapeStyle.quaternary.getter();
  v157 = v142;
  v158 = v143;
  v159 = v144;
  v153 = v138;
  v154 = v139;
  v155 = v140;
  v156 = v141;
  v149 = v134;
  v150 = v135;
  v151 = v136;
  v152 = v137;
  v145 = v130;
  v146 = v131;
  v147 = v132;
  v148 = v133;
  LOBYTE(v160) = v72;
  HIDWORD(v160) = v73;
  v75 = v103;
  v74 = v104;
  v76 = v106;
  (*(void (**)(char *, _QWORD, uint64_t))(v104 + 104))(v103, enum case for RoundedCornerStyle.continuous(_:), v106);
  v77 = v109;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(&v109[*(int *)(v102 + 20)], v75, v76);
  __asm { FMOV            V0.2D, #9.0 }
  *v77 = _Q0;
  (*(void (**)(char *, uint64_t))(v74 + 8))(v75, v76);
  v83 = v110;
  sub_1000051B0((uint64_t)v77, v110);
  *(_WORD *)(v83 + *(int *)(v108 + 36)) = 256;
  sub_1000053A8(v83, (uint64_t)&v10[*(int *)(v101 + 36)], &qword_1000589C0);
  v84 = v158;
  *((_OWORD *)v10 + 12) = v157;
  *((_OWORD *)v10 + 13) = v84;
  *((_OWORD *)v10 + 14) = v159;
  *((_QWORD *)v10 + 30) = v160;
  v85 = v154;
  *((_OWORD *)v10 + 8) = v153;
  *((_OWORD *)v10 + 9) = v85;
  v86 = v156;
  *((_OWORD *)v10 + 10) = v155;
  *((_OWORD *)v10 + 11) = v86;
  v87 = v150;
  *((_OWORD *)v10 + 4) = v149;
  *((_OWORD *)v10 + 5) = v87;
  v88 = v152;
  *((_OWORD *)v10 + 6) = v151;
  *((_OWORD *)v10 + 7) = v88;
  v89 = v146;
  *(Swift::String *)v10 = v145;
  *((_OWORD *)v10 + 1) = v89;
  v90 = v148;
  *((_OWORD *)v10 + 2) = v147;
  *((_OWORD *)v10 + 3) = v90;
  sub_100005300((uint64_t)&v145);
  sub_10000527C(v83, &qword_1000589C0);
  sub_100005204((uint64_t)v77);
  sub_100005240((uint64_t)&v115);
  v91 = v105;
  sub_1000053A8((uint64_t)v10, v105, &qword_1000589C8);
  *(_WORD *)(v91 + *(int *)(v107 + 36)) = 256;
  sub_10000527C((uint64_t)v10, &qword_1000589C8);
  return sub_1000052B8(v91, v111);
}

uint64_t sub_100004C2C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
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
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unsigned int v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _OWORD v48[7];

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
    v46 = a5;
    v47 = a7;
    v45 = a3;
    v44 = a1;
    v43 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, _swiftEmptyArrayStorage);

    v17 = a15;
    v20 = v43;
    v19 = a10;
    a1 = v44;
    a3 = v45;
    v18 = a12;
    a5 = v46;
    a7 = v47;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v48, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = v15[5];
  a9[4] = v15[4];
  a9[5] = v34;
  a9[6] = v15[6];
  *(_OWORD *)((char *)a9 + 105) = *(_OWORD *)((char *)v15 + 105);
  v35 = v15[1];
  *a9 = *v15;
  a9[1] = v35;
  v36 = v15[3];
  a9[2] = v15[2];
  a9[3] = v36;
  v37 = v48[1];
  a9[8] = v48[0];
  a9[9] = v37;
  v38 = v48[2];
  v39 = v48[3];
  v40 = v48[6];
  v41 = v48[4];
  a9[13] = v48[5];
  a9[14] = v40;
  a9[11] = v39;
  a9[12] = v41;
  a9[10] = v38;
  return sub_100005300((uint64_t)v15);
}

__n128 sub_100004DEC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, _swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_1000053A8(v16, a9, &qword_1000589D8);
  v35 = a9 + *(int *)(sub_100005170(&qword_1000589E0) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

uint64_t sub_100004FA8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
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
  __int128 v39;
  __int128 v40;
  unsigned int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _OWORD v47[7];

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
    v45 = a5;
    v46 = a7;
    v44 = a3;
    v43 = a1;
    v42 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, _swiftEmptyArrayStorage);

    v17 = a15;
    v20 = v42;
    v19 = a10;
    a1 = v43;
    a3 = v44;
    v18 = a12;
    a5 = v45;
    a7 = v46;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v47, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = *(_OWORD *)(v15 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v15 + 64);
  *(_OWORD *)(a9 + 80) = v34;
  *(_QWORD *)(a9 + 96) = *(_QWORD *)(v15 + 96);
  v35 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v15;
  *(_OWORD *)(a9 + 16) = v35;
  v36 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v15 + 32);
  *(_OWORD *)(a9 + 48) = v36;
  v37 = v47[1];
  *(_OWORD *)(a9 + 104) = v47[0];
  *(_OWORD *)(a9 + 120) = v37;
  v38 = v47[3];
  *(_OWORD *)(a9 + 136) = v47[2];
  v39 = v47[4];
  v40 = v47[5];
  *(_OWORD *)(a9 + 200) = v47[6];
  *(_OWORD *)(a9 + 184) = v40;
  *(_OWORD *)(a9 + 168) = v39;
  *(_OWORD *)(a9 + 152) = v38;
  return sub_10000533C(v15);
}

uint64_t sub_100005168@<X0>(uint64_t a1@<X8>)
{
  char *v1;

  return sub_100004558(*v1, a1);
}

uint64_t sub_100005170(uint64_t *a1)
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

uint64_t sub_1000051B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000051F4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100005204(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005240(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_100004304(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_10000527C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005170(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000052B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005170(&qword_1000589D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005300(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_1000051F4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  return a1;
}

uint64_t sub_10000533C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_QWORD *)(a1 + 96);
  sub_1000051F4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain(v4);
  swift_retain(v5);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return a1;
}

uint64_t sub_1000053A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005170(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000053EC()
{
  return sub_1000055CC(&qword_1000589E8, &qword_1000589D0, (void (*)(void))sub_100005420);
}

unint64_t sub_100005420()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000589F0;
  if (!qword_1000589F0)
  {
    v1 = sub_10000437C(&qword_1000589C8);
    sub_1000054A4();
    sub_1000056BC(&qword_100058A68, &qword_1000589C0, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000589F0);
  }
  return result;
}

unint64_t sub_1000054A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000589F8;
  if (!qword_1000589F8)
  {
    v1 = sub_10000437C(&qword_100058A00);
    sub_100005528();
    sub_1000056BC(&qword_100058A58, &qword_100058A60, (uint64_t)&protocol conformance descriptor for _EnvironmentBackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000589F8);
  }
  return result;
}

unint64_t sub_100005528()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100058A08;
  if (!qword_100058A08)
  {
    v1 = sub_10000437C(&qword_100058A10);
    sub_1000055CC(&qword_100058A18, &qword_100058A20, (void (*)(void))sub_100005634);
    sub_1000056BC(&qword_100058A48, &qword_100058A50, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100058A08);
  }
  return result;
}

uint64_t sub_1000055CC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000437C(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005634()
{
  return sub_1000055CC(&qword_100058A28, &qword_100058A30, (void (*)(void))sub_100005658);
}

unint64_t sub_100005658()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100058A38;
  if (!qword_100058A38)
  {
    v1 = sub_10000437C(&qword_100058A40);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100058A38);
  }
  return result;
}

uint64_t sub_1000056BC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000437C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000056FC(void *a1, uint64_t a2, char *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer];
  *(_QWORD *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer] = a1;
  v5 = a1;

  v6 = objc_msgSend(a3, "collectionView");
  objc_msgSend(v6, "reloadData");

}

uint64_t sub_100005860(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  void *v4;
  NSString v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  Class isa;
  id v15;
  uint64_t result;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  void *object;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v8 = String._bridgeToObjectiveC()();
  v9 = a4(0);
  v23 = v9;
  v10 = sub_100005170(&qword_100058AA8);
  String.init<A>(describing:)(&v23, v10);
  v12 = v11;
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v15 = objc_msgSend(v4, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v13, isa);

  result = swift_dynamicCastClass(v15, v9);
  if (!result)
  {

    v23 = 0;
    v24 = 0xE000000000000000;
    _StringGuts.grow(_:)(68);
    v17._countAndFlagsBits = 0xD00000000000002ELL;
    v17._object = (void *)0x8000000100041730;
    String.append(_:)(v17);
    v18._countAndFlagsBits = a1;
    v18._object = a2;
    String.append(_:)(v18);
    v19._object = (void *)0x8000000100041760;
    v19._countAndFlagsBits = 0xD000000000000012;
    String.append(_:)(v19);
    v22 = v9;
    v20._countAndFlagsBits = String.init<A>(describing:)(&v22, v10);
    object = v20._object;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(object);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v23, v24, "GameCenterMessageExtension/GKSwiftUtils.swift", 45, 2, 112, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_100005AFC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  Class isa;
  id v7;
  uint64_t result;
  Swift::String v9;
  void *object;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v1 = type metadata accessor for SenderCell();
  v12 = v1;
  v2 = sub_100005170(&qword_100058AA8);
  String.init<A>(describing:)(&v12, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v7 = objc_msgSend(v0, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v5, isa);

  result = swift_dynamicCastClass(v7, v1);
  if (!result)
  {

    v12 = 0;
    v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(42);
    swift_bridgeObjectRelease(v13);
    v12 = 0xD000000000000028;
    v13 = 0x80000001000416A0;
    v11 = v1;
    v9._countAndFlagsBits = String.init<A>(describing:)(&v11, v2);
    object = v9._object;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(object);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v12, v13, "GameCenterMessageExtension/GKSwiftUtils.swift", 45, 2, 104, 0);
    __break(1u);
  }
  return result;
}

id sub_100006008()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageActionsViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MessageActionsViewController()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension28MessageActionsViewController);
}

uint64_t sub_100006090(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v7;
  void *v8;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v15;
  char v16;
  Swift::String v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *Strong;
  uint64_t v22;
  unint64_t v24;
  unint64_t v25;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(UICollectionElementKindSectionHeader);
  if (v7 == a2 && v8 == a3)
    goto LABEL_12;
  v10 = v8;
  v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a2, a3, 0);
  swift_bridgeObjectRelease(v10);
  if ((v11 & 1) != 0)
    return sub_100005860(a2, a3, (uint64_t)a4, (uint64_t (*)(_QWORD))type metadata accessor for HeaderView);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(UICollectionElementKindSectionFooter);
  if (v12 == a2 && v13 == a3)
  {
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v15 = v13;
    v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v13, a2, a3, 0);
    swift_bridgeObjectRelease(v15);
    if ((v16 & 1) == 0)
    {
      _StringGuts.grow(_:)(22);
      swift_bridgeObjectRelease(0xE000000000000000);
      v24 = 0xD000000000000014;
      v25 = 0x8000000100041710;
      a4 = &v24;
      v17._countAndFlagsBits = a2;
      v17._object = a3;
      String.append(_:)(v17);
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v24, v25, "GameCenterMessageExtension/MessageActionsViewController.swift", 61, 2, 76, 0);
      __break(1u);
LABEL_12:
      swift_bridgeObjectRelease(a3);
      return sub_100005860(a2, a3, (uint64_t)a4, (uint64_t (*)(_QWORD))type metadata accessor for HeaderView);
    }
  }
  v19 = (char *)sub_100005860(a2, a3, (uint64_t)a4, (uint64_t (*)(_QWORD))type metadata accessor for LoadingStatusView);
  v18 = v19;
  if (byte_100058770 == 2)
  {
    objc_msgSend(v19, "setAlpha:", 0.0);
    objc_msgSend(v18, "setHidden:", 1);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&v18[OBJC_IVAR____TtC26GameCenterMessageExtension17LoadingStatusView_activityIndicator], v20);
    objc_msgSend(Strong, "stopAnimating");
  }
  else
  {
    objc_msgSend(v19, "setAlpha:", 1.0);
    objc_msgSend(v18, "setHidden:", 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&v18[OBJC_IVAR____TtC26GameCenterMessageExtension17LoadingStatusView_activityIndicator], v22);
    objc_msgSend(Strong, "startAnimating");
  }

  return (uint64_t)v18;
}

char *sub_1000062CC()
{
  char *v0;
  id v1;
  id v2;
  uint64_t v3;
  char *result;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v0 = (char *)sub_100005AFC();
  objc_msgSend(v0, "setClipsToBounds:", 1);
  v1 = objc_msgSend(v0, "layer");
  objc_msgSend(v1, "setCornerRadius:", 15.0);

  v2 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
  result = (char *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_titleLabel], v3);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = result;
  v6 = objc_msgSend(v2, "displayNameWithOptions:", 0);
  objc_msgSend(v5, "setText:", v6);

  result = (char *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterPhoto], v7);
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v8 = result;
  result = (char *)objc_msgSend((id)objc_opt_self(GKUITheme), "sharedTheme");
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v9 = result;
  v10 = objc_msgSend(result, "eventIconImage");

  objc_msgSend(v8, "setImage:", v10);
  result = (char *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_playerAvatarView], v11);
  if (result)
  {
    v12 = result;
    objc_msgSend(result, "setPlayer:", v2);

    return v0;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100006484()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1000064A8(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000056FC(a1, a2, *(char **)(v2 + 16));
}

UIFontTextStyle sub_1000064B0()
{
  qword_10005C210 = (uint64_t)UIFontTextStyleBody;
  return UIFontTextStyleBody;
}

UIFontTextStyle sub_1000064C8()
{
  qword_10005C218 = (uint64_t)UIFontTextStyleFootnote;
  return UIFontTextStyleFootnote;
}

uint64_t sub_100006B18(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100006B54 + 4 * byte_100043DD0[a1]))(0xD000000000000014, 0x8000000100041430);
}

uint64_t sub_100006B54()
{
  return 0x7265646E6573;
}

uint64_t sub_100006B68()
{
  uint64_t v0;

  return v0 + 9;
}

uint64_t sub_100006C00(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100006C3C + 4 * byte_100043DD9[a1]))(0xD000000000000014, 0x8000000100041430);
}

uint64_t sub_100006C3C()
{
  return 0x7265646E6573;
}

uint64_t sub_100006C50()
{
  uint64_t v0;

  return v0 + 9;
}

void sub_100006CE8(char a1)
{
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRelease(0xE000000000000000);
  __asm { BR              X10 }
}

uint64_t sub_100006D6C()
{
  Swift::String v0;
  uint64_t v2;

  v0._countAndFlagsBits = 0x7265646E6573;
  v0._object = (void *)0xE600000000000000;
  String.append(_:)(v0);
  swift_bridgeObjectRelease(0xE600000000000000);
  return v2;
}

void sub_100006E40(char *a1)
{
  sub_100006E4C(*a1);
}

void sub_100006E4C(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_100006E98(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100006F64 + 4 * byte_100043DF4[a2]))(0x7265646E6573);
}

uint64_t sub_100006F64(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x7265646E6573 && v1 == 0xE600000000000000)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x7265646E6573, 0xE600000000000000, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE600000000000000);
  return v2 & 1;
}

Swift::Int sub_100007060()
{
  char *v0;
  char v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  sub_1000070AC((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void sub_1000070A4(uint64_t a1)
{
  char *v1;

  sub_1000070AC(a1, *v1);
}

void sub_1000070AC(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1000070F4(uint64_t a1)
{
  String.hash(into:)(a1, 0x7265646E6573, 0xE600000000000000);
  return swift_bridgeObjectRelease(0xE600000000000000);
}

Swift::Int sub_1000071B4(uint64_t a1)
{
  char *v1;
  char v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  sub_1000070AC((uint64_t)v4, v2);
  return Hasher._finalize()();
}

unint64_t sub_1000071F4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10000FEF0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100007220@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100006C00(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100007248()
{
  unsigned __int8 *v0;

  return sub_100006B18(*v0);
}

void sub_100007250()
{
  char *v0;

  sub_100006CE8(*v0);
}

BOOL sub_100007258(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100007270()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000072B4()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000072DC(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

id sub_10000731C()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v1, "removeObserver:", v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for FriendRequestCardViewController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

id sub_10000763C()
{
  void *v0;
  uint64_t v1;
  void (*v2)(char *, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *v17;
  NSObject **v18;
  uint8_t *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint8_t *v22;
  uint64_t v23;
  id result;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  char **v62;
  id v63;
  uint64_t v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  os_log_type_t v72;
  int v73;
  uint64_t v74;
  NSObject **v75;
  NSObject *v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  NSObject *v84;
  NSObject **v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  NSObject *v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  os_log_type_t v98;
  uint64_t v99;
  NSObject **v100;
  uint64_t v101;
  NSObject *v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  NSObject **v110;
  NSObject *v111;
  uint8_t *v112;
  NSObject **v113;
  void (*v114)(char *, uint64_t);
  uint64_t v115;
  char *v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;

  v1 = type metadata accessor for Logger(0);
  v2 = *(void (**)(char *, uint64_t))(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v116 = (char *)&v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v109 - v6;
  v8 = __chkstk_darwin(v5);
  v113 = (NSObject **)((char *)&v109 - v9);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v109 - v11;
  static GKLog.friending.getter(v10);
  v13 = v0;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v114 = v2;
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    v110 = (NSObject **)swift_slowAlloc(8, -1);
    v112 = v16;
    *(_DWORD *)v16 = 138412290;
    v118 = v13;
    v17 = v13;
    v2 = v114;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119);
    v18 = v110;
    *v110 = v13;

    v19 = v112;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ updatePlayerUI", v112, 0xCu);
    v20 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v18, 1, v20);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {

    v14 = v13;
  }

  v21 = (void (*)(char *, uint64_t))*((_QWORD *)v2 + 1);
  v21(v12, v1);
  v22 = (uint8_t *)objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gameCenterPhoto, v23);
  if (!result)
  {
    __break(1u);
    goto LABEL_44;
  }
  v25 = result;
  result = objc_msgSend((id)objc_opt_self(GKUITheme), "sharedTheme");
  if (!result)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v26 = result;
  v27 = objc_msgSend(result, "eventIconImage");

  objc_msgSend(v25, "setImage:", v27);
  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarAndButtonStackView, v28);
  if (!result)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v29 = result;
  objc_msgSend(result, "setHidden:", 1);

  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_dividerView, v30);
  if (!result)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v31 = result;
  objc_msgSend(result, "setHidden:", 1);

  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gameCenterLabel, v32);
  if (!result)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v33 = result;
  objc_msgSend(result, "setHidden:", 1);

  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_edgeCaseStateLabel, v34);
  if (!result)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v35 = result;
  objc_msgSend(result, "setHidden:", 1);

  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverActionStatus, v36);
  if (!result)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  v37 = result;
  objc_msgSend(result, "setHidden:", 1);

  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteStatusInfoLabel, v38);
  if (!result)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v39 = result;
  v115 = v1;
  objc_msgSend(result, "setTextAlignment:", 4);

  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_viewFriendsLabel, v40);
  if (!result)
  {
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  v41 = result;
  objc_msgSend(result, "setTextAlignment:", 4);

  v42 = -[NSObject traitCollection](v13, "traitCollection");
  v43 = objc_msgSend(v42, "preferredContentSizeCategory");

  LODWORD(v42) = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v43);
  v44 = (char *)v13 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_buttonsStackView;
  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_buttonsStackView, v45);
  v46 = result;
  if ((_DWORD)v42)
  {
    if (!result)
    {
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    objc_msgSend(result, "setAxis:", 1);

    result = (id)swift_unknownObjectWeakLoadStrong(v44, v47);
    if (!result)
    {
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    v49 = result;
    result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton, v48);
    if (!result)
    {
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    v50 = result;
    objc_msgSend(v49, "insertArrangedSubview:atIndex:", result, 1);
  }
  else
  {
    if (!result)
    {
LABEL_57:
      __break(1u);
      goto LABEL_58;
    }
    objc_msgSend(result, "setAxis:", 0);

    result = (id)swift_unknownObjectWeakLoadStrong(v44, v51);
    if (!result)
    {
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    v49 = result;
    result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton, v52);
    if (!result)
    {
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
    v50 = result;
    objc_msgSend(v49, "insertArrangedSubview:atIndex:", result, 0);
  }

  v53 = (char *)v13 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_buttonsStackView;
  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_buttonsStackView, v54);
  if (!result)
    goto LABEL_52;
  v55 = result;
  objc_msgSend(result, "setNeedsLayout");

  result = (id)swift_unknownObjectWeakLoadStrong(v53, v56);
  if (!result)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  v57 = result;
  objc_msgSend(result, "layoutIfNeeded");

  v58 = -[NSObject traitCollection](v13, "traitCollection");
  v59 = objc_msgSend(v58, "userInterfaceStyle");

  result = (id)swift_unknownObjectWeakLoadStrong((char *)v13+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_mainContainer, v60);
  v61 = result;
  if (v59 != (id)2)
  {
    if (result)
    {
      v62 = &selRef_systemGray6Color;
      goto LABEL_29;
    }
LABEL_61:
    __break(1u);
    return result;
  }
  if (!result)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v62 = &selRef_tertiarySystemGroupedBackgroundColor;
LABEL_29:
  v63 = objc_msgSend((id)objc_opt_self(UIColor), *v62);
  objc_msgSend(v61, "setBackgroundColor:", v63);

  v65 = *(NSObject **)((char *)&v13->isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
  v114 = v21;
  v111 = v13;
  v112 = v22;
  if (v65)
  {
    v66 = v65;
    static GKLog.friending.getter(v66);
    v67 = v13;
    v68 = v66;
    v69 = v67;
    v70 = v68;
    v71 = Logger.logObject.getter(v70);
    v72 = static os_log_type_t.info.getter();
    v73 = v72;
    if (os_log_type_enabled(v71, v72))
    {
      v74 = swift_slowAlloc(22, -1);
      v75 = (NSObject **)swift_slowAlloc(16, -1);
      *(_DWORD *)v74 = 138412546;
      LODWORD(v110) = v73;
      v118 = v69;
      v76 = v69;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119);
      *v75 = v69;

      *(_WORD *)(v74 + 12) = 2112;
      v118 = v70;
      v77 = v70;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119);
      v75[1] = v65;

      _os_log_impl((void *)&_mh_execute_header, v71, (os_log_type_t)v110, "%@ Updating friend card UI , player model is non nil: %@", (uint8_t *)v74, 0x16u);
      v78 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v75, 2, v78);
      swift_slowDealloc(v75, -1, -1);
      v79 = v74;
      v21 = v114;
      swift_slowDealloc(v79, -1, -1);
    }
    else
    {

      v71 = v69;
    }
    v87 = v115;

    v21((char *)v113, v87);
    v88 = swift_allocObject(&unk_100051C80, 32, 7);
    *(_QWORD *)(v88 + 16) = v69;
    *(_QWORD *)(v88 + 24) = v70;
    v89 = v69;
    v90 = v70;
    sub_1000135F8((uint64_t)sub_1000105D8, v88);

    v91 = swift_release(v88);
    v92 = v111;
  }
  else
  {
    static GKLog.general.getter(v64);
    v80 = v13;
    v81 = Logger.logObject.getter(v80);
    v82 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v81, v82))
    {
      v83 = (uint8_t *)swift_slowAlloc(12, -1);
      v113 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v83 = 138412290;
      v118 = v80;
      v84 = v80;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &v119);
      v85 = v113;
      *v113 = v80;

      _os_log_impl((void *)&_mh_execute_header, v81, v82, "%@ expected a playerModel", v83, 0xCu);
      v86 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v85, 1, v86);
      swift_slowDealloc(v85, -1, -1);
      swift_slowDealloc(v83, -1, -1);
    }
    else
    {

      v81 = v80;
    }
    v87 = v115;

    v93 = ((uint64_t (*)(char *, uint64_t))v21)(v7, v87);
    *((_BYTE *)&v80->isa + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = 7;
    sub_10000C490(v93, v94);
    v91 = sub_100038A3C();
    v92 = v111;
    if (v91)
    {
      v95 = (void *)v91;
      sub_10002972C();

    }
  }
  static GKLog.friending.getter(v91);
  v96 = v92;
  v97 = Logger.logObject.getter(v96);
  v98 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v97, v98))
  {
    v99 = swift_slowAlloc(22, -1);
    v100 = (NSObject **)swift_slowAlloc(8, -1);
    v101 = swift_slowAlloc(32, -1);
    v117 = (uint64_t)v96;
    v118 = v101;
    *(_DWORD *)v99 = 138412546;
    v102 = v96;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118);
    *v100 = v96;

    *(_WORD *)(v99 + 12) = 2080;
    sub_100006CE8(*((_BYTE *)&v102->isa
                  + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState));
    v104 = v103;
    v117 = sub_10003EE08(v105, v103, (uint64_t *)&v118);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118);

    swift_bridgeObjectRelease(v104);
    _os_log_impl((void *)&_mh_execute_header, v97, v98, "%@ inviteCardState is set to : %s", (uint8_t *)v99, 0x16u);
    v106 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v100, 1, v106);
    swift_slowDealloc(v100, -1, -1);
    swift_arrayDestroy(v101, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v101, -1, -1);
    swift_slowDealloc(v99, -1, -1);

    v108 = v115;
    v107 = v116;
  }
  else
  {

    v107 = v116;
    v108 = v87;
  }
  return (id)((uint64_t (*)(char *, uint64_t))v114)(v107, v108);
}

void sub_1000081AC(void *a1, uint64_t a2, _BYTE *a3, void *a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  id v16;
  _BYTE *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject **v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void *Strong;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  unsigned int v46;
  id v47;
  unsigned int v48;
  char *v49;
  uint64_t v50;
  id v51;
  NSObject *aBlock;
  uint64_t v53;

  v7 = (_QWORD *)type metadata accessor for Logger(0);
  v8 = *(v7 - 1);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v12 = (void *)objc_opt_self(GKPlayer);
    v13 = a1;
    v14 = objc_msgSend(v12, "unknownPlayer");
    sub_1000105F0(0, (unint64_t *)&qword_100058CE8, GKPlayer_ptr);
    v15 = static NSObject.== infix(_:_:)(v13, v14);

    if ((v15 & 1) == 0)
    {
      v33 = objc_msgSend(v13, "internal");
      v34 = objc_msgSend(v33, "friendsVisibility");

      *(_DWORD *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_profileVisibility] = v34;
      v35 = *(void **)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender];
      *(_QWORD *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender] = a1;
      v51 = v13;

      sub_10000C2EC(v36, v37);
      v38 = &a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerAvatarView];
      Strong = (void *)swift_unknownObjectWeakLoadStrong(&a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerAvatarView], v39);
      if (Strong)
      {
        v41 = Strong;
        objc_msgSend(Strong, "setDelegate:", a3);

        v43 = (void *)swift_unknownObjectWeakLoadStrong(v38, v42);
        if (v43)
        {
          v44 = v43;
          objc_msgSend(v43, "setPlayer:", v51);

          v45 = objc_msgSend(v51, "internal");
          v46 = objc_msgSend(v45, "friendsVisibility");

          a3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_isSenderProfilePublic] = v46 == 0;
          v47 = objc_msgSend(v51, "internal");
          v48 = objc_msgSend(v47, "friendsVisibility");

          if (!v48)
            sub_10000EDC4(v51);
          __asm { BR              X10 }
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      JUMPOUT(0x100008B0CLL);
    }

  }
  static GKLog.friending.getter(v9);
  v16 = a4;
  v17 = a3;
  v18 = v16;
  v19 = v17;
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc(22, -1);
    v49 = v11;
    v23 = v22;
    v24 = (NSObject **)swift_slowAlloc(16, -1);
    *(_DWORD *)v23 = 138412546;
    v50 = v8;
    v51 = v7;
    aBlock = v19;
    v25 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v53);
    *v24 = v19;

    *(_WORD *)(v23 + 12) = 2112;
    aBlock = v18;
    v26 = v18;
    v7 = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v53);
    v24[1] = v18;

    v8 = v50;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Could not find a valid player using playerModel: %@", (uint8_t *)v23, 0x16u);
    v27 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v24, 2, v27);
    swift_slowDealloc(v24, -1, -1);
    v28 = v23;
    v11 = v49;
    swift_slowDealloc(v28, -1, -1);
  }
  else
  {

    v20 = v19;
  }

  v29 = (*(uint64_t (**)(char *, _QWORD *))(v8 + 8))(v11, v7);
  *((_BYTE *)&v19->isa + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = 7;
  sub_10000C490(v29, v30);
  v31 = sub_100038A3C();
  if (v31)
  {
    v32 = (void *)v31;
    sub_10002972C();

  }
}

void sub_100008B38(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Strong;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  id v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = swift_bridgeObjectRetain(a1);
  v8 = (uint64_t)sub_100010070(v7, (uint64_t)v6);
  swift_bridgeObjectRelease(a1);

  if ((unint64_t)v8 >> 62)
  {
    if (v8 < 0)
      v14 = v8;
    else
      v14 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v8);
    v15 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(v8);
    if (v15 >= 1)
      goto LABEL_3;
  }
  else if (*(uint64_t *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
  {
LABEL_3:
    Strong = swift_unknownObjectWeakLoadStrong(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView, v9);
    if (Strong)
    {
      v23 = (id)Strong;
      if ((unint64_t)v8 >> 62)
      {
        if (v8 < 0)
          v12 = v8;
        else
          v12 = v8 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v8);
        v11 = (id)_CocoaArrayWrapper.endIndex.getter(v12);
        swift_bridgeObjectRelease(v8);
        if (!v11)
          goto LABEL_15;
      }
      else
      {
        v11 = *(id *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v11)
          goto LABEL_15;
      }
      if ((v8 & 0xC000000000000001) != 0)
      {
        v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v8);
        goto LABEL_14;
      }
      if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v13 = *(id *)(v8 + 32);
LABEL_14:
        v11 = v13;
LABEL_15:
        swift_bridgeObjectRelease(v8);
LABEL_23:
        objc_msgSend(v23, "setPlayer:", v11, v23);
LABEL_24:

        return;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_30;
  }
  swift_bridgeObjectRelease(v8);
  v16 = *(void **)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer];
  v18 = swift_unknownObjectWeakLoadStrong(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView, v17);
  v23 = (id)v18;
  if (v16)
  {
    if (v18)
    {
      v11 = v16;
      goto LABEL_23;
    }
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v18)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(GKUnknownPlayerID);
    v20 = v19;
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
    v22 = objc_msgSend((id)objc_opt_self(GKPlayer), "playerFromPlayerID:", v21);

    objc_msgSend(v23, "setPlayer:", v22);
    v11 = v23;
    v24 = v22;
    goto LABEL_24;
  }
LABEL_31:
  __break(1u);
}

void sub_100008D54(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v6 = a3;
  v7 = swift_bridgeObjectRetain(a1);
  v8 = (uint64_t)sub_1000102B4(v7, v6);
  swift_bridgeObjectRelease(a1);

  if ((unint64_t)v8 >> 62)
  {
    if (v8 < 0)
      v13 = v8;
    else
      v13 = v8 & 0xFFFFFFFFFFFFFF8;
    v9 = _CocoaArrayWrapper.endIndex.getter(v13);
  }
  else
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v10 = swift_bridgeObjectRelease(v8);
  if (v9 <= 0)
    v12 = 3;
  else
    v12 = 4;
  *(_BYTE *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = v12;
  sub_10000C490(v10, v11);
}

uint64_t sub_100008E54()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v14;

  v1 = (void *)0xEA00000000006C61;
  v2 = 0x7564697669646E69;
  v3 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer);
  v4 = (void *)sub_100038A3C();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "activeConversation");

    if (v6)
    {
      v7 = objc_msgSend(v6, "recipientAddresses");
      v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for String);

      v9 = *(_QWORD *)(v8 + 16);
      swift_bridgeObjectRelease(v8);

      if (v9 > 1)
      {
        v2 = 0x70756F7267;
        v1 = (void *)0xE500000000000000;
      }
    }
  }
  v10 = 0x7265646E6573;
  if (v3)
    v10 = 0x6E65697069636572;
  v14 = v10;
  v11._countAndFlagsBits = 95;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  v12._countAndFlagsBits = v2;
  v12._object = v1;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v1);
  return v14;
}

void sub_100008F94()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  objc_class *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  NSObject **v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  NSString v17;
  char *v18;
  uint64_t v19;
  void *Strong;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  char *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  id v59;
  char *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  char *v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  char *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  NSString v102;
  NSString v103;
  NSString v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  objc_super v109;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (objc_class *)type metadata accessor for FriendRequestCardViewController();
  v109.receiver = v0;
  v109.super_class = v5;
  v6 = objc_msgSendSuper2(&v109, "viewDidLoad");
  static GKLog.friending.getter(v6);
  v7 = v0;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v107 = v1;
    v10 = swift_slowAlloc(12, -1);
    v106 = v2;
    v11 = (uint8_t *)v10;
    v12 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v11 = 138412290;
    v108 = v7;
    v13 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v108, &v109);
    *v12 = v7;

    v1 = v107;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ viewDidLoad", v11, 0xCu);
    v14 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v12, 1, v14);
    swift_slowDealloc(v12, -1, -1);
    v15 = v11;
    v2 = v106;
    swift_slowDealloc(v15, -1, -1);
  }
  else
  {

    v8 = v7;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v16 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v17 = String._bridgeToObjectiveC()();
  objc_msgSend(v16, "addObserver:selector:name:object:", v7, "updateCard:", v17, 0);

  v18 = (char *)v7 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_acceptButton;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)v7+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_acceptButton, v19);
  if (!Strong)
  {
    __break(1u);
    goto LABEL_42;
  }
  v21 = Strong;
  v22 = objc_msgSend(Strong, "layer");

  objc_msgSend(v22, "setCornerRadius:", 9.0);
  v24 = (void *)swift_unknownObjectWeakLoadStrong(v18, v23);
  if (!v24)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v25 = v24;
  v26 = objc_msgSend(v24, "layer");

  objc_msgSend(v26, "setMasksToBounds:", 1);
  v28 = (void *)swift_unknownObjectWeakLoadStrong(v18, v27);
  if (!v28)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v29 = v28;
  v30 = objc_msgSend(v28, "titleLabel");

  if (v30)
  {
    v32 = objc_msgSend((id)objc_opt_self(UIFont), "_preferredFontForTextStyle:variant:", UIFontTextStyleSubheadline, 1024);
    objc_msgSend(v30, "setFont:", v32);

  }
  v33 = (void *)swift_unknownObjectWeakLoadStrong(v18, v31);
  if (!v33)
    goto LABEL_44;
  v34 = v33;
  v35 = objc_msgSend(v33, "titleLabel");

  objc_msgSend(v35, "setAdjustsFontSizeToFitWidth:", 1);
  v37 = (void *)swift_unknownObjectWeakLoadStrong(v18, v36);
  if (!v37)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v38 = v37;
  v39 = objc_msgSend(v37, "titleLabel");

  if (v39)
  {
    objc_msgSend(v39, "setMinimumScaleFactor:", 0.5);

  }
  v41 = (char *)v7 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverActionStatus;
  v42 = (void *)swift_unknownObjectWeakLoadStrong((char *)v7+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverActionStatus, v40);
  if (!v42)
    goto LABEL_46;
  v43 = v42;
  v44 = objc_msgSend(v42, "layer");

  objc_msgSend(v44, "setCornerRadius:", 9.0);
  v46 = (void *)swift_unknownObjectWeakLoadStrong(v41, v45);
  if (!v46)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v47 = v46;
  v48 = objc_msgSend(v46, "layer");

  objc_msgSend(v48, "setMasksToBounds:", 1);
  v50 = (void *)swift_unknownObjectWeakLoadStrong(v41, v49);
  if (!v50)
  {
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v51 = v50;
  v52 = objc_msgSend(v50, "titleLabel");

  if (v52)
  {
    v54 = objc_msgSend((id)objc_opt_self(UIFont), "_preferredFontForTextStyle:variant:", UIFontTextStyleSubheadline, 1024);
    objc_msgSend(v52, "setFont:", v54);

  }
  v55 = (void *)swift_unknownObjectWeakLoadStrong(v41, v53);
  if (!v55)
    goto LABEL_49;
  v56 = v55;
  v57 = objc_msgSend(v55, "titleLabel");

  if (v57)
  {
    v59 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
    objc_msgSend(v57, "setTextColor:", v59);

  }
  v60 = (char *)v7 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton;
  v61 = (void *)swift_unknownObjectWeakLoadStrong((char *)v7+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton, v58);
  if (!v61)
    goto LABEL_50;
  v62 = v61;
  v63 = objc_msgSend(v61, "layer");

  objc_msgSend(v63, "setCornerRadius:", 9.0);
  v65 = (void *)swift_unknownObjectWeakLoadStrong(v60, v64);
  if (!v65)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v66 = v65;
  v67 = objc_msgSend(v65, "layer");

  objc_msgSend(v67, "setMasksToBounds:", 1);
  v69 = (void *)swift_unknownObjectWeakLoadStrong(v60, v68);
  if (!v69)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  v70 = v69;
  v71 = objc_msgSend(v69, "titleLabel");

  if (v71)
  {
    v73 = objc_msgSend((id)objc_opt_self(UIFont), "_preferredFontForTextStyle:variant:", UIFontTextStyleSubheadline, 1024);
    objc_msgSend(v71, "setFont:", v73);

  }
  v74 = (void *)swift_unknownObjectWeakLoadStrong(v60, v72);
  if (!v74)
    goto LABEL_53;
  v75 = v74;
  v76 = objc_msgSend(v74, "titleLabel");

  objc_msgSend(v76, "setAdjustsFontSizeToFitWidth:", 1);
  v78 = (void *)swift_unknownObjectWeakLoadStrong(v60, v77);
  if (!v78)
  {
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  v79 = v78;
  v80 = objc_msgSend(v78, "titleLabel");

  if (v80)
  {
    objc_msgSend(v80, "setMinimumScaleFactor:", 0.5);

  }
  v82 = (char *)v7 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerAvatarView;
  v83 = (void *)swift_unknownObjectWeakLoadStrong((char *)v7+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerAvatarView, v81);
  if (!v83)
    goto LABEL_55;
  v84 = v83;
  objc_msgSend(v83, "setUserInteractionEnabled:", 1);

  v85 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v7, "avatarPressed:");
  v87 = (void *)swift_unknownObjectWeakLoadStrong(v82, v86);
  if (!v87)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v88 = v87;
  objc_msgSend(v87, "addGestureRecognizer:", v85);

  v89 = (char *)v7 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView;
  v91 = (void *)swift_unknownObjectWeakLoadStrong((char *)v7+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView, v90);
  if (!v91)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  v92 = v91;
  objc_msgSend(v91, "setUserInteractionEnabled:", 1);

  v93 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v7, "friendAvatarPressed:");
  v95 = (void *)swift_unknownObjectWeakLoadStrong(v89, v94);
  if (!v95)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v96 = v95;
  objc_msgSend(v95, "addGestureRecognizer:", v93);

  v97 = *(uint64_t *)((char *)&v7->isa
                   + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
  if (!v97)
  {
LABEL_59:
    __break(1u);
    return;
  }
  if (*(_QWORD *)(v97 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8))
    sub_10000763C();
  else
    sub_100009950();
  if (*((_BYTE *)&v7->isa
       + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer) == 1)
  {
    v98 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
    objc_msgSend(v98, "reportEvent:type:", GKReporterDomainImprovedFriendingUIInteractions, GKFriendInviteViewedByReceiver);

  }
  v99 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
  sub_100008E54();
  v101 = v100;
  v102 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v101);
  v103 = String._bridgeToObjectiveC()();
  v104 = String._bridgeToObjectiveC()();
  objc_msgSend(v99, "recordPageWithID:pageContext:pageType:", v102, v103, v104);

}

void sub_100009950()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject **v14;
  uint64_t v15;
  uint8_t *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char **v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  unsigned __int8 *v28;
  NSObject *v29;
  NSObject **v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  uint64_t v34;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel];
  if (v5)
  {
    v6 = v5;
    static GKLog.friending.getter(v6);
    v7 = v0;
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v31 = v1;
      v10 = swift_slowAlloc(12, -1);
      v32 = v6;
      v11 = (uint8_t *)v10;
      v30 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v11 = 138412290;
      v33 = v7;
      v12 = v2;
      v13 = v7;
      v1 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
      v14 = v30;
      *v30 = v7;

      v2 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ creating friend request", v11, 0xCu);
      v15 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v14, 1, v15);
      swift_slowDealloc(v14, -1, -1);
      v16 = v11;
      v6 = v32;
      swift_slowDealloc(v16, -1, -1);
    }
    else
    {

      v8 = v7;
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v17 = objc_msgSend(objc_allocWithZone((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    v18 = -[NSObject traitCollection](v7, "traitCollection");
    v19 = objc_msgSend(v18, "userInterfaceStyle");

    v20 = (void *)objc_opt_self(UIColor);
    v21 = &selRef_tertiarySystemGroupedBackgroundColor;
    if (v19 != (id)2)
      v21 = &selRef_systemGray6Color;
    v22 = objc_msgSend(v20, *v21);
    objc_msgSend(v17, "setBackgroundColor:", v22);

    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "startAnimating");
    v23 = -[NSObject view](v7, "view");
    if (v23)
    {
      v24 = v23;
      objc_msgSend(v23, "addSubview:", v17);

      v25 = (void *)objc_opt_self(NSLayoutConstraint);
      v26 = v17;
      v27 = -[NSObject view](v7, "view");
      objc_msgSend(v25, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v26, v27);

      v28 = (unsigned __int8 *)v6;
      v29 = v7;
      sub_10001A534(v28, v26, v28, v29);

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100009CAC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t *v25;
  os_log_type_t v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  NSObject **v47;
  NSObject *v48;
  os_log_type_t v49;
  NSObject *v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  uint64_t v53;
  _QWORD v54[2];
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;

  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  v58 = v8;
  v9 = __chkstk_darwin(v7);
  v11 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)v54 - v12;
  v14 = sub_100005170(&qword_100058CE0);
  __chkstk_darwin(v14);
  v16 = (char *)v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URL(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = objc_msgSend(a2, "removeFromSuperview");
  if (a1)
  {
LABEL_4:
    static GKLog.friending.getter(v21);
    v22 = a4;
    swift_errorRetain(a1);
    v23 = v22;
    v24 = swift_errorRetain(a1);
    v25 = (uint8_t *)Logger.logObject.getter(v24);
    v26 = static os_log_type_t.info.getter();
    if (os_log_type_enabled((os_log_t)v25, v26))
    {
      v27 = swift_slowAlloc(22, -1);
      v28 = (_QWORD *)swift_slowAlloc(8, -1);
      v56 = swift_slowAlloc(32, -1);
      v59 = (uint64_t)v23;
      v60 = v56;
      *(_DWORD *)v27 = 138412546;
      v55 = v25;
      v29 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
      *v28 = v23;

      *(_WORD *)(v27 + 12) = 2080;
      v59 = a1;
      v30 = sub_100005170((uint64_t *)&unk_1000591C0);
      v31 = Optional.nonNilDescription.getter(v30);
      v33 = v32;
      v59 = sub_10003EE08(v31, v32, (uint64_t *)&v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
      swift_bridgeObjectRelease(v33);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      v34 = (uint8_t *)v55;
      _os_log_impl((void *)&_mh_execute_header, v55, v26, "%@ failed to create friend request with %s", (uint8_t *)v27, 0x16u);
      v35 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v28, 1, v35);
      swift_slowDealloc(v28, -1, -1);
      v36 = v56;
      swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v27, -1, -1);

    }
    else
    {

      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
    v37 = (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v11, v57);
    *((_BYTE *)v23 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState) = 7;
    sub_10000C490(v37, v38);
    v39 = sub_100038A3C();
    if (v39)
    {
      v40 = (void *)v39;
      sub_10002972C();

    }
    return;
  }
  v56 = (uint64_t)v20;
  sub_100013B20(1, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    v21 = (id)sub_10001055C((uint64_t)v16);
    goto LABEL_4;
  }
  v41 = v56;
  v42 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v56, v16, v17);
  static GKLog.friending.getter(v42);
  v43 = a4;
  v44 = Logger.logObject.getter(v43);
  v45 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc(12, -1);
    v47 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v46 = 138412290;
    v54[1] = v46 + 4;
    v55 = v46;
    v60 = v43;
    v48 = v43;
    v41 = v56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61);
    *v47 = v43;

    v49 = v45;
    v50 = v55;
    _os_log_impl((void *)&_mh_execute_header, v44, v49, "%@ friend request created", (uint8_t *)v55, 0xCu);
    v51 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v47, 1, v51);
    swift_slowDealloc(v47, -1, -1);
    swift_slowDealloc(v50, -1, -1);
  }
  else
  {

    v44 = v43;
  }

  (*(void (**)(char *, uint64_t))(v58 + 8))(v13, v57);
  v52 = *(void (**)(uint64_t))((char *)&v43->isa
                                       + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl);
  if (v52)
  {
    v53 = *(uint64_t *)((char *)&v43[1].isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl);
    swift_retain(v53);
    v52(v41);
    sub_10001059C((uint64_t)v52, v53);
  }
  sub_10000763C();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v41, v17);
}

void sub_10000A1C0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  id v11;
  id v12;
  NSString v13;
  NSString v14;
  NSString v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  NSString v19;
  uint64_t v20;
  id v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  uint64_t v25;
  id v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  id v34;
  Swift::String v35;
  Swift::String v36;
  void *object;
  NSString v38;
  uint64_t v39;
  id v40;
  Swift::String v41;
  Swift::String v42;
  void *v43;
  NSString v44;
  uint64_t v45;
  id v46;
  Swift::String v47;
  Swift::String v48;
  void *v49;
  NSString v50;
  void *v51;
  id v52;
  NSString v53;
  NSString v54;
  NSString v55;
  uint64_t v56;
  uint64_t v57;
  NSString v58;
  NSString v59;
  void *Strong;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  char *v77;
  id v78;
  uint64_t v79;
  id v80;
  _QWORD aBlock[6];
  Swift::String v82;
  Swift::String v83;
  Swift::String v84;
  Swift::String v85;
  Swift::String v86;

  v1 = (char *)type metadata accessor for Logger(0);
  v2 = *((_QWORD *)v1 - 1);
  __chkstk_darwin(v1);
  v4 = (char *)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)sub_100038A3C();
  if (v5)
  {
    v80 = v5;
    v6 = objc_msgSend((id)objc_opt_self(GKReachability), "_gkIsOnline");
    if ((v6 & 1) != 0)
    {
      v7 = objc_msgSend((id)objc_opt_self(GKPreferences), "shared");
      if (v7)
      {
        v8 = v7;
        v9 = objc_msgSend(v7, "isAddingFriendsRestricted");

        if ((v9 & 1) != 0)
        {
          v11 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
          objc_msgSend(v11, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestRestrictedError);

          v12 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
          v13 = String._bridgeToObjectiveC()();
          v14 = String._bridgeToObjectiveC()();
          v15 = String._bridgeToObjectiveC()();
          sub_100008E54();
          v17 = v16;
          v18 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v17);
          v19 = String._bridgeToObjectiveC()();
          objc_msgSend(v12, "recordClickWithAction:targetId:targetType:pageId:pageType:", v13, v14, v15, v18, v19);

          v21 = (id)GKGameCenterUIFrameworkBundle(v20);
          v82._object = (void *)0xE000000000000000;
          v22._countAndFlagsBits = 0x525F444E45495246;
          v22._object = (void *)0xEE00545345555145;
          v23._countAndFlagsBits = 0;
          v23._object = (void *)0xE000000000000000;
          v82._countAndFlagsBits = 0;
          v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v21, v23, v82);

          v26 = (id)GKGameCenterUIFrameworkBundle(v25);
          v27._countAndFlagsBits = 0xD000000000000027;
          v83._object = (void *)0xE000000000000000;
          v27._object = (void *)0x8000000100042330;
          v28._countAndFlagsBits = 0;
          v28._object = (void *)0xE000000000000000;
          v83._countAndFlagsBits = 0;
          v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v83);

          sub_10002FAE0(v24._countAndFlagsBits, (uint64_t)v24._object, v29._countAndFlagsBits, (uint64_t)v29._object);
          swift_bridgeObjectRelease(v24._object);
          swift_bridgeObjectRelease(v29._object);

          return;
        }
        v1 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_acceptButton];
        Strong = (void *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_acceptButton], v10);
        if (!Strong)
          goto LABEL_23;
        v61 = Strong;
        objc_msgSend(Strong, "setEnabled:", 0);

        v63 = swift_unknownObjectWeakLoadStrong(v1, v62);
        if (!v63)
        {
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRelease(v1);
          __break(1u);
          return;
        }
        v64 = (void *)v63;
        v65 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray2Color");
        objc_msgSend(v64, "setBackgroundColor:", v65);

        v66 = objc_msgSend(v80, "activeConversation");
        v67 = v66;
        if (v66)
        {
          v68 = objc_msgSend(v66, "recipientAddresses");
          v69 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v68, &type metadata for String);

          v1 = *(char **)(v69 + 16);
          swift_bridgeObjectRelease(v69);
          if (v1)
          {
            v1 = (char *)objc_msgSend(v67, "recipientAddresses");
            v70 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for String);

            if (v70[2])
            {
              v71 = v70[4];
              v1 = (char *)v70[5];
              swift_bridgeObjectRetain(v1);
              swift_bridgeObjectRelease(v70);
              v72 = objc_msgSend(v67, "recipientAddresses");
              v73 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v72, &type metadata for String);

              v67 = *(void **)(v73 + 16);
              swift_bridgeObjectRelease(v73);
              LODWORD(v67) = (unint64_t)v67 > 1;
              goto LABEL_19;
            }
            __break(1u);
            goto LABEL_22;
          }

          v71 = 0;
          LODWORD(v67) = 0;
        }
        else
        {
          v71 = 0;
          v1 = 0;
        }
LABEL_19:
        v74 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel];
        if (v74)
        {
          v75 = swift_allocObject(&unk_100051BB8, 32, 7);
          *(_QWORD *)(v75 + 16) = v0;
          *(_QWORD *)(v75 + 24) = v80;
          v76 = v74;
          v77 = v0;
          v78 = v80;
          sub_100013E2C(v71, (uint64_t)v1, (int)v67, sub_10000FFD4, v75);

          swift_release(v75);
          swift_bridgeObjectRelease(v1);
          return;
        }
        goto LABEL_25;
      }
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    v34 = (id)GKGameCenterUIFrameworkBundle(v6);
    v35._countAndFlagsBits = 0xD000000000000016;
    v84._object = (void *)0xE000000000000000;
    v35._object = (void *)0x80000001000422F0;
    v36._countAndFlagsBits = 0;
    v36._object = (void *)0xE000000000000000;
    v84._countAndFlagsBits = 0;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v35, (Swift::String_optional)0, (NSBundle)v34, v36, v84)._object;

    v38 = String._bridgeToObjectiveC()();
    v39 = swift_bridgeObjectRelease(object);
    v40 = (id)GKGameCenterUIFrameworkBundle(v39);
    v41._countAndFlagsBits = 0xD000000000000018;
    v85._object = (void *)0xE000000000000000;
    v41._object = (void *)0x80000001000420F0;
    v42._countAndFlagsBits = 0;
    v42._object = (void *)0xE000000000000000;
    v85._countAndFlagsBits = 0;
    v43 = NSLocalizedString(_:tableName:bundle:value:comment:)(v41, (Swift::String_optional)0, (NSBundle)v40, v42, v85)._object;

    v44 = String._bridgeToObjectiveC()();
    v45 = swift_bridgeObjectRelease(v43);
    v46 = (id)GKGameCenterUIFrameworkBundle(v45);
    v86._object = (void *)0xE000000000000000;
    v47._countAndFlagsBits = 0x4F545455425F4B4FLL;
    v47._object = (void *)0xE90000000000004ELL;
    v48._countAndFlagsBits = 0;
    v48._object = (void *)0xE000000000000000;
    v86._countAndFlagsBits = 0;
    v49 = NSLocalizedString(_:tableName:bundle:value:comment:)(v47, (Swift::String_optional)0, (NSBundle)v46, v48, v86)._object;

    v50 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v49);
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100013AF4;
    aBlock[3] = &unk_100051B80;
    v51 = _Block_copy(aBlock);
    objc_msgSend(v80, "_presentAlertWithTitle:message:buttonTitle:completion:", v38, v44, v50, v51);
    _Block_release(v51);

    v52 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
    v53 = String._bridgeToObjectiveC()();
    v54 = String._bridgeToObjectiveC()();
    v55 = String._bridgeToObjectiveC()();
    sub_100008E54();
    v57 = v56;
    v58 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v57);
    v59 = String._bridgeToObjectiveC()();
    objc_msgSend(v52, "recordClickWithAction:targetId:targetType:pageId:pageType:", v53, v54, v55, v58, v59);

  }
  else
  {
    v30 = static GKLog.general.getter(0);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "acceptButtonPressed - expected a messagesViewController", v33, 2u);
      swift_slowDealloc(v33, -1, -1);
    }

    (*(void (**)(char *, char *))(v2 + 8))(v4, v1);
  }
}

void sub_10000AA3C(uint64_t a1, char *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *Strong;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  NSString v26;
  NSString v27;
  NSString v28;
  uint64_t v29;
  uint64_t v30;
  NSString v31;
  NSString v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  void **v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  NSString v46;
  NSString v47;
  NSString v48;
  uint64_t v49;
  uint64_t v50;
  NSString v51;
  NSString v52;
  uint64_t v53;
  void **v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  void ***v58;
  void **v59;
  uint64_t v60;
  id v61;
  Swift::String v62;
  Swift::String v63;
  Swift::String v64;
  uint64_t v65;
  id v66;
  Swift::String v67;
  Swift::String v68;
  Swift::String v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void **v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void **aBlock;
  _QWORD v82[4];
  uint64_t v83;
  Swift::String v84;
  Swift::String v85;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v13 = (char *)&v77 - v12;
  if (a1)
  {
    v14 = &a2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_acceptButton];
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&a2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_acceptButton], v11);
    if (Strong)
    {
      v16 = Strong;
      objc_msgSend(Strong, "setEnabled:", 1);

      v18 = swift_unknownObjectWeakLoadStrong(v14, v17);
      if (v18)
      {
        v20 = (void *)v18;
        v21 = (void *)swift_unknownObjectWeakLoadStrong(v14, v19);
        if (v21)
        {
          v22 = v21;
          v23 = objc_msgSend(v21, "tintColor");

          objc_msgSend(v20, "setBackgroundColor:", v23);
          v24 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
          objc_msgSend(v24, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestExpiredError);

          v25 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
          v26 = String._bridgeToObjectiveC()();
          v27 = String._bridgeToObjectiveC()();
          v28 = String._bridgeToObjectiveC()();
          sub_100008E54();
          v30 = v29;
          v31 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v30);
          v32 = String._bridgeToObjectiveC()();
          objc_msgSend(v25, "recordClickWithAction:targetId:targetType:pageId:pageType:", v26, v27, v28, v31, v32);

          static GKLog.general.getter(v33);
          swift_errorRetain(a1);
          v34 = swift_errorRetain(a1);
          v35 = Logger.logObject.getter(v34);
          v36 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v35, v36))
          {
            v37 = (uint8_t *)swift_slowAlloc(12, -1);
            v38 = (void **)swift_slowAlloc(32, -1);
            v80 = a1;
            aBlock = v38;
            *(_DWORD *)v37 = 136315138;
            swift_errorRetain(a1);
            v39 = sub_100005170((uint64_t *)&unk_1000591C0);
            v78 = v7;
            v40 = String.init<A>(describing:)(&v80, v39);
            v79 = v6;
            v42 = v41;
            v80 = sub_10003EE08(v40, v41, (uint64_t *)&aBlock);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &aBlock);
            swift_bridgeObjectRelease(v42);
            swift_errorRelease(a1);
            swift_errorRelease(a1);
            _os_log_impl((void *)&_mh_execute_header, v35, v36, "acceptButtonPressed - acceptFriendRequest error: %s", v37, 0xCu);
            swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v38, -1, -1);
            swift_slowDealloc(v37, -1, -1);

            v43 = (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v10, v79);
          }
          else
          {
            swift_errorRelease(a1);
            swift_errorRelease(a1);

            v43 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
          }
          v61 = (id)GKGameCenterUIFrameworkBundle(v43);
          v84._object = (void *)0xE000000000000000;
          v62._countAndFlagsBits = 0x525F444E45495246;
          v62._object = (void *)0xEE00545345555145;
          v63._countAndFlagsBits = 0;
          v63._object = (void *)0xE000000000000000;
          v84._countAndFlagsBits = 0;
          v64 = NSLocalizedString(_:tableName:bundle:value:comment:)(v62, (Swift::String_optional)0, (NSBundle)v61, v63, v84);

          v66 = (id)GKGameCenterUIFrameworkBundle(v65);
          v67._countAndFlagsBits = 0xD000000000000024;
          v85._object = (void *)0xE000000000000000;
          v67._object = (void *)0x8000000100042140;
          v68._countAndFlagsBits = 0;
          v68._object = (void *)0xE000000000000000;
          v85._countAndFlagsBits = 0;
          v69 = NSLocalizedString(_:tableName:bundle:value:comment:)(v67, (Swift::String_optional)0, (NSBundle)v66, v68, v85);

          sub_10002FAE0(v64._countAndFlagsBits, (uint64_t)v64._object, v69._countAndFlagsBits, (uint64_t)v69._object);
          swift_bridgeObjectRelease(v64._object);
          swift_bridgeObjectRelease(v69._object);
          return;
        }
LABEL_16:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  v77 = a3;
  v78 = v7;
  v79 = v6;
  v44 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  objc_msgSend(v44, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestAccepted);

  v45 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
  v46 = String._bridgeToObjectiveC()();
  v47 = String._bridgeToObjectiveC()();
  v48 = String._bridgeToObjectiveC()();
  sub_100008E54();
  v50 = v49;
  v51 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v50);
  v52 = String._bridgeToObjectiveC()();
  objc_msgSend(v45, "recordClickWithAction:targetId:targetType:pageId:pageType:", v46, v47, v48, v51, v52);

  static GKLog.friending.getter(v53);
  v54 = a2;
  v55 = Logger.logObject.getter(v54);
  v56 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc(12, -1);
    v58 = (void ***)swift_slowAlloc(8, -1);
    *(_DWORD *)v57 = 138412290;
    aBlock = v54;
    v59 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v82);
    *v58 = v54;

    _os_log_impl((void *)&_mh_execute_header, v55, v56, "%@ acceptButtonPressed - acceptFriendRequest succeed", v57, 0xCu);
    v60 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v58, 1, v60);
    swift_slowDealloc(v58, -1, -1);
    swift_slowDealloc(v57, -1, -1);
  }
  else
  {

    v55 = v54;
  }

  (*(void (**)(char *, uint64_t))(v78 + 8))(v13, v79);
  v70 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
  v71 = swift_allocObject(&unk_100051BE0, 32, 7);
  v72 = v77;
  *(_QWORD *)(v71 + 16) = v77;
  *(_QWORD *)(v71 + 24) = v54;
  v82[3] = sub_10000FFDC;
  v83 = v71;
  aBlock = _NSConcreteStackBlock;
  v82[0] = 1107296256;
  v82[1] = sub_100039310;
  v82[2] = &unk_100051BF8;
  v73 = _Block_copy(&aBlock);
  v74 = v83;
  v75 = v54;
  v76 = v72;
  swift_release(v74);
  objc_msgSend(v70, "loadFriendsAsPlayersWithCompletionHandler:", v73);
  _Block_release(v73);

}

void sub_10000B1F0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD aBlock[5];
  uint64_t v30;

  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(a3, "activeConversation");
  if (v14)
  {
    v28 = v14;
    v15 = objc_msgSend(v14, "recipientAddresses");
    v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, &type metadata for String);

    v17 = *(_QWORD *)(v16 + 16);
    swift_bridgeObjectRelease(v16);
    if (v17 == 1)
    {
      sub_1000298EC();

      return;
    }

  }
  sub_1000105F0(0, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr);
  v18 = (void *)static OS_dispatch_queue.main.getter();
  v19 = swift_allocObject(&unk_100051C30, 24, 7);
  *(_QWORD *)(v19 + 16) = a4;
  aBlock[4] = sub_100010DE0;
  v30 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013AF4;
  aBlock[3] = &unk_100051C48;
  v20 = _Block_copy(aBlock);
  v21 = v30;
  v22 = a4;
  v23 = swift_release(v21);
  static DispatchQoS.unspecified.getter(v23);
  aBlock[0] = _swiftEmptyArrayStorage;
  v24 = sub_10000FFE4((unint64_t *)&unk_100059E10, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v25 = sub_100005170((uint64_t *)&unk_100058CD0);
  v26 = sub_100010024();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v6, v24);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v9, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_10000B4A8()
{
  char *v0;
  id v1;
  uint64_t v2;
  char *v3;
  void *Strong;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  Swift::String v18;
  Swift::String v19;
  void *object;
  NSString v21;
  uint64_t v22;
  id v23;
  Swift::String v24;
  Swift::String v25;
  void *v26;
  NSString v27;
  uint64_t v28;
  id v29;
  Swift::String v30;
  Swift::String v31;
  void *v32;
  NSString v33;
  void *v34;
  id v35;
  NSString v36;
  NSString v37;
  NSString v38;
  uint64_t v39;
  uint64_t v40;
  NSString v41;
  NSString v42;
  void *v43;
  uint64_t v44;
  id v45;
  char *v46;
  _QWORD aBlock[6];
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;

  if ((objc_msgSend((id)objc_opt_self(GKReachability), "_gkIsOnline") & 1) != 0)
  {
    v3 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton];
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton], v2);
    if (!Strong)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    v1 = Strong;
    objc_msgSend(Strong, "setEnabled:", 0);

    v6 = swift_unknownObjectWeakLoadStrong(v3, v5);
    if (!v6)
    {
LABEL_19:
      __break(1u);
LABEL_20:
      swift_bridgeObjectRelease(v1);
      __break(1u);
      return;
    }
    v7 = (void *)v6;
    v8 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray2Color");
    objc_msgSend(v7, "setBackgroundColor:", v8);

    v9 = (void *)sub_100038A3C();
    v1 = v9;
    if (v9)
    {
      v10 = objc_msgSend(v9, "activeConversation");

      if (!v10)
      {
        v14 = 0;
        v1 = 0;
        goto LABEL_15;
      }
      v11 = objc_msgSend(v10, "recipientAddresses");
      v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for String);

      v1 = *(id *)(v12 + 16);
      swift_bridgeObjectRelease(v12);
      if (v1)
      {
        v1 = objc_msgSend(v10, "recipientAddresses");
        v13 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for String);

        if (v13[2])
        {
          v14 = v13[4];
          v1 = (id)v13[5];
          swift_bridgeObjectRetain(v1);

          swift_bridgeObjectRelease(v13);
          goto LABEL_15;
        }
        __break(1u);
        goto LABEL_18;
      }

    }
    v14 = 0;
LABEL_15:
    v43 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel];
    if (v43)
    {
      v44 = swift_allocObject(&unk_100051B68, 24, 7);
      *(_QWORD *)(v44 + 16) = v0;
      v45 = v43;
      v46 = v0;
      sub_100014404(v14, (uint64_t)v1, (void (*)(_QWORD))sub_10000FFCC, v44);

      swift_release(v44);
      swift_bridgeObjectRelease(v1);
      return;
    }
    goto LABEL_20;
  }
  v15 = sub_100038A3C();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (id)GKGameCenterUIFrameworkBundle(v15);
    v18._countAndFlagsBits = 0xD000000000000016;
    v48._object = (void *)0xE000000000000000;
    v18._object = (void *)0x80000001000422F0;
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    v48._countAndFlagsBits = 0;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v48)._object;

    v21 = String._bridgeToObjectiveC()();
    v22 = swift_bridgeObjectRelease(object);
    v23 = (id)GKGameCenterUIFrameworkBundle(v22);
    v24._countAndFlagsBits = 0xD000000000000018;
    v49._object = (void *)0xE000000000000000;
    v24._object = (void *)0x80000001000420F0;
    v25._countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    v49._countAndFlagsBits = 0;
    v26 = NSLocalizedString(_:tableName:bundle:value:comment:)(v24, (Swift::String_optional)0, (NSBundle)v23, v25, v49)._object;

    v27 = String._bridgeToObjectiveC()();
    v28 = swift_bridgeObjectRelease(v26);
    v29 = (id)GKGameCenterUIFrameworkBundle(v28);
    v50._object = (void *)0xE000000000000000;
    v30._countAndFlagsBits = 0x4F545455425F4B4FLL;
    v30._object = (void *)0xE90000000000004ELL;
    v31._countAndFlagsBits = 0;
    v31._object = (void *)0xE000000000000000;
    v50._countAndFlagsBits = 0;
    v32 = NSLocalizedString(_:tableName:bundle:value:comment:)(v30, (Swift::String_optional)0, (NSBundle)v29, v31, v50)._object;

    v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v32);
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100013AF4;
    aBlock[3] = &unk_100051B30;
    v34 = _Block_copy(aBlock);
    objc_msgSend(v16, "_presentAlertWithTitle:message:buttonTitle:completion:", v21, v27, v33, v34);
    _Block_release(v34);

    v35 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
    v36 = String._bridgeToObjectiveC()();
    v37 = String._bridgeToObjectiveC()();
    v38 = String._bridgeToObjectiveC()();
    sub_100008E54();
    v40 = v39;
    v41 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v40);
    v42 = String._bridgeToObjectiveC()();
    objc_msgSend(v35, "recordClickWithAction:targetId:targetType:pageId:pageType:", v36, v37, v38, v41, v42);

  }
}

void *sub_10000B998(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *result;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSString v21;
  NSString v22;
  NSString v23;
  uint64_t v24;
  uint64_t v25;
  NSString v26;
  NSString v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  char **v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  NSString v46;
  NSString v47;
  NSString v48;
  uint64_t v49;
  uint64_t v50;
  NSString v51;
  NSString v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  NSObject **v58;
  NSObject *v59;
  uint64_t v60;
  id v61;
  Swift::String v62;
  Swift::String v63;
  Swift::String v64;
  uint64_t v65;
  id v66;
  Swift::String v67;
  Swift::String v68;
  Swift::String v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  Swift::String v77;
  Swift::String v78;

  v72 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v72 - 8);
  v5 = __chkstk_darwin(v72);
  v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v10 = (char *)&v70 - v9;
  v73 = v4;
  if (a1)
  {
    v11 = &a2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton];
    result = (void *)swift_unknownObjectWeakLoadStrong(&a2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton], v8);
    if (result)
    {
      v13 = result;
      objc_msgSend(result, "setEnabled:", 1);

      result = (void *)swift_unknownObjectWeakLoadStrong(v11, v14);
      if (result)
      {
        v16 = result;
        result = (void *)swift_unknownObjectWeakLoadStrong(v11, v15);
        if (result)
        {
          v17 = result;
          v18 = objc_msgSend(result, "tintColor");

          objc_msgSend(v16, "setBackgroundColor:", v18);
          v19 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
          objc_msgSend(v19, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestExpiredError);

          v20 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
          v21 = String._bridgeToObjectiveC()();
          v22 = String._bridgeToObjectiveC()();
          v23 = String._bridgeToObjectiveC()();
          sub_100008E54();
          v25 = v24;
          v26 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v25);
          v27 = String._bridgeToObjectiveC()();
          objc_msgSend(v20, "recordClickWithAction:targetId:targetType:pageId:pageType:", v21, v22, v23, v26, v27);

          static GKLog.general.getter(v28);
          v29 = a2;
          swift_errorRetain(a1);
          v30 = v29;
          v31 = swift_errorRetain(a1);
          v32 = Logger.logObject.getter(v31);
          v33 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v32, v33))
          {
            v34 = swift_slowAlloc(22, -1);
            v35 = (char **)swift_slowAlloc(8, -1);
            v70 = swift_slowAlloc(32, -1);
            v74 = (uint64_t)v30;
            v75 = v70;
            *(_DWORD *)v34 = 138412546;
            v71 = v7;
            v36 = v30;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75);
            *v35 = v30;

            *(_WORD *)(v34 + 12) = 2080;
            v74 = a1;
            swift_errorRetain(a1);
            v37 = sub_100005170((uint64_t *)&unk_1000591C0);
            v38 = String.init<A>(describing:)(&v74, v37);
            v40 = v39;
            v74 = sub_10003EE08(v38, v39, (uint64_t *)&v75);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75);
            swift_bridgeObjectRelease(v40);
            swift_errorRelease(a1);
            swift_errorRelease(a1);
            _os_log_impl((void *)&_mh_execute_header, v32, v33, "%@ ignoreButtonPressed - ignoreFriendRequest error: %s", (uint8_t *)v34, 0x16u);
            v41 = sub_100005170((uint64_t *)&unk_100058CB0);
            swift_arrayDestroy(v35, 1, v41);
            swift_slowDealloc(v35, -1, -1);
            v42 = v70;
            swift_arrayDestroy(v70, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v42, -1, -1);
            swift_slowDealloc(v34, -1, -1);

            v43 = (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v71, v72);
          }
          else
          {

            swift_errorRelease(a1);
            swift_errorRelease(a1);

            v43 = (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v7, v72);
          }
          v61 = (id)GKGameCenterUIFrameworkBundle(v43);
          v77._object = (void *)0xE000000000000000;
          v62._countAndFlagsBits = 0x525F444E45495246;
          v62._object = (void *)0xEE00545345555145;
          v63._countAndFlagsBits = 0;
          v63._object = (void *)0xE000000000000000;
          v77._countAndFlagsBits = 0;
          v64 = NSLocalizedString(_:tableName:bundle:value:comment:)(v62, (Swift::String_optional)0, (NSBundle)v61, v63, v77);

          v66 = (id)GKGameCenterUIFrameworkBundle(v65);
          v67._countAndFlagsBits = 0xD000000000000024;
          v78._object = (void *)0xE000000000000000;
          v67._object = (void *)0x8000000100042140;
          v68._countAndFlagsBits = 0;
          v68._object = (void *)0xE000000000000000;
          v78._countAndFlagsBits = 0;
          v69 = NSLocalizedString(_:tableName:bundle:value:comment:)(v67, (Swift::String_optional)0, (NSBundle)v66, v68, v78);

          sub_10002FAE0(v64._countAndFlagsBits, (uint64_t)v64._object, v69._countAndFlagsBits, (uint64_t)v69._object);
          swift_bridgeObjectRelease(v64._object);
          return (void *)swift_bridgeObjectRelease(v69._object);
        }
LABEL_16:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  v44 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  objc_msgSend(v44, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestAccepted);

  v45 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
  v46 = String._bridgeToObjectiveC()();
  v47 = String._bridgeToObjectiveC()();
  v48 = String._bridgeToObjectiveC()();
  sub_100008E54();
  v50 = v49;
  v51 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v50);
  v52 = String._bridgeToObjectiveC()();
  objc_msgSend(v45, "recordClickWithAction:targetId:targetType:pageId:pageType:", v46, v47, v48, v51, v52);

  static GKLog.friending.getter(v53);
  v54 = a2;
  v55 = Logger.logObject.getter(v54);
  v56 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc(12, -1);
    v58 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v57 = 138412290;
    v75 = v54;
    v59 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76);
    *v58 = v54;

    _os_log_impl((void *)&_mh_execute_header, v55, v56, "%@ ignoreButtonPressed - ignoreFriendRequest succeed", v57, 0xCu);
    v60 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v58, 1, v60);
    swift_slowDealloc(v58, -1, -1);
    swift_slowDealloc(v57, -1, -1);
  }
  else
  {

    v55 = v54;
  }

  return (void *)(*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v10, v72);
}

void sub_10000C2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName, a2);
  if (!Strong)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v4 = (void *)Strong;
  v5 = (void *)objc_opt_self(UIFont);
  if (qword_100058730 != -1)
    swift_once(&qword_100058730, sub_1000064B0);
  v6 = objc_msgSend(v5, "_gkPreferredFontForTextStyle:symbolicTraits:", qword_10005C210, 2);
  objc_msgSend(v4, "setFont:", v6);

  v8 = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_viewFriendsLabel, v7);
  if (!v8)
    goto LABEL_10;
  v9 = (void *)v8;
  if (qword_100058738 != -1)
    swift_once(&qword_100058738, sub_1000064C8);
  v10 = objc_msgSend(v5, "_gkPreferredFontForTextStyle:symbolicTraits:", qword_10005C218, 2);
  objc_msgSend(v9, "setFont:", v10);

  v12 = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_tryAgainLabel, v11);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend(v5, "_gkPreferredFontForTextStyle:symbolicTraits:", qword_10005C218, 2);
    objc_msgSend(v13, "setFont:", v14);

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_10000C490(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;

  sub_10000D464(a1, a2);
  sub_10000CCB0(v3, v4);
  v5 = *(void **)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender);
  if (v5 && (v6 = objc_msgSend(v5, "displayNameWithOptions:", 0)) != 0)
  {
    v7 = v6;
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  sub_10000E3E4(v8, v10);
  swift_bridgeObjectRelease(v10);
  sub_10000D7AC();
  v11 = *(_BYTE *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState);
  v12 = 1;
  if (((1 << v11) & 0x78) != 0)
    goto LABEL_8;
  if (((1 << v11) & 7) != 0)
  {
    v12 = 0;
LABEL_8:
    *(_BYTE *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer) = v12;
  }
  sub_10000C554();
}

void sub_10000C554()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *Strong;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Height;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  char *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  double v57;
  char *v58;
  void *v59;
  void *v60;
  unsigned __int8 v61;
  uint64_t v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  char *v67;
  void *v68;
  void *v69;
  unsigned __int8 v70;
  uint64_t v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  char *v76;
  void *v77;
  void *v78;
  unsigned __int8 v79;
  uint64_t v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  char *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  double v92;
  unsigned __int8 v93;
  uint64_t v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  char *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  double v106;
  unsigned __int8 v107;
  uint64_t v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  double v115;
  char *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  double v120;
  unsigned __int8 v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  double v125;
  char *v126;
  void *v127;
  void *v128;
  unsigned __int8 v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  double v133;
  uint64_t v134;
  double v135;
  void *v136;
  double *v137;
  double v138;
  char *v139;
  CGRect v140;

  v1 = v0;
  v2 = objc_msgSend(v0, "view");
  if (!v2)
  {
    __break(1u);
    goto LABEL_56;
  }
  v3 = v2;
  objc_msgSend(v2, "setNeedsLayout");

  v4 = objc_msgSend(v1, "view");
  if (!v4)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v5 = v4;
  objc_msgSend(v4, "layoutIfNeeded");

  v6 = OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant;
  v7 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant];
  if (!v7)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  objc_msgSend(v7, "constant");
  v9 = v8;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerAvatarView], v10);
  if (!Strong)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v12 = Strong;
  objc_msgSend(Strong, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v140.origin.x = v14;
  v140.origin.y = v16;
  v140.size.width = v18;
  v140.size.height = v20;
  Height = CGRectGetHeight(v140);
  v22 = OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView;
  v23 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView];
  if (!v23)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  v24 = Height;
  objc_msgSend(v23, "spacing");
  v26 = v25;
  v27 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName];
  v29 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName], v28);
  if (!v29)
  {
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  v30 = v29;
  v31 = v9 + 0.0 + v24 + v26;
  v32 = objc_msgSend(v29, "isHidden");

  if ((v32 & 1) == 0)
  {
    v34 = swift_unknownObjectWeakLoadStrong(v27, v33);
    if (!v34)
    {
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
    v35 = (void *)v34;
    v36 = UILabel.requiredHeight.getter();

    v31 = v31 + v36;
  }
  v37 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_subTitle];
  v38 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_subTitle], v33);
  if (!v38)
    goto LABEL_61;
  v39 = v38;
  v40 = objc_msgSend(v38, "isHidden");

  if ((v40 & 1) == 0)
  {
    v42 = swift_unknownObjectWeakLoadStrong(v37, v41);
    if (!v42)
    {
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    v43 = (void *)v42;
    v44 = UILabel.requiredHeight.getter();

    v31 = v31 + v44;
  }
  v45 = *(void **)&v1[v22];
  if (!v45)
    goto LABEL_62;
  objc_msgSend(v45, "spacing");
  v47 = v46;
  v48 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_secondSubtitleLabel];
  v50 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_secondSubtitleLabel], v49);
  if (!v50)
  {
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v51 = v50;
  v52 = v31 + v47;
  v53 = objc_msgSend(v50, "isHidden");

  if ((v53 & 1) == 0)
  {
    v55 = swift_unknownObjectWeakLoadStrong(v48, v54);
    if (!v55)
    {
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    v56 = (void *)v55;
    v57 = UILabel.requiredHeight.getter();

    v52 = v52 + v57;
  }
  v58 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_dividerView];
  v59 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_dividerView], v54);
  if (!v59)
    goto LABEL_64;
  v60 = v59;
  v61 = objc_msgSend(v59, "isHidden");

  if ((v61 & 1) == 0)
  {
    v63 = (void *)swift_unknownObjectWeakLoadStrong(v58, v62);
    if (!v63)
    {
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
    v64 = v63;
    objc_msgSend(v63, "frame");
    v66 = v65;

    v52 = v52 + v66;
  }
  v67 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverInfoStackView];
  v68 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverInfoStackView], v62);
  if (!v68)
    goto LABEL_65;
  v69 = v68;
  v70 = objc_msgSend(v68, "isHidden");

  if ((v70 & 1) == 0)
  {
    v72 = (void *)swift_unknownObjectWeakLoadStrong(v67, v71);
    if (!v72)
    {
LABEL_78:
      __break(1u);
      goto LABEL_79;
    }
    v73 = v72;
    objc_msgSend(v72, "frame");
    v75 = v74;

    v52 = v52 + v75;
  }
  v76 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarAndButtonStackView];
  v77 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarAndButtonStackView], v71);
  if (!v77)
    goto LABEL_66;
  v78 = v77;
  v79 = objc_msgSend(v77, "isHidden");

  if ((v79 & 1) == 0)
  {
    v81 = (void *)swift_unknownObjectWeakLoadStrong(v76, v80);
    if (!v81)
    {
LABEL_79:
      __break(1u);
      goto LABEL_80;
    }
    v82 = v81;
    objc_msgSend(v81, "frame");
    v84 = v83;

    v52 = v52 + v84;
  }
  v85 = *(void **)&v1[v22];
  if (!v85)
    goto LABEL_67;
  objc_msgSend(v85, "spacing");
  v87 = v86;
  v88 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_buttonsStackView];
  v90 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_buttonsStackView], v89);
  if (!v90)
  {
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  v91 = v90;
  v92 = v52 + v87;
  v93 = objc_msgSend(v90, "isHidden");

  if ((v93 & 1) == 0)
  {
    v95 = (void *)swift_unknownObjectWeakLoadStrong(v88, v94);
    if (!v95)
    {
LABEL_80:
      __break(1u);
      goto LABEL_81;
    }
    v96 = v95;
    objc_msgSend(v95, "frame");
    v98 = v97;

    v92 = v92 + v98;
  }
  v99 = *(void **)&v1[v22];
  if (!v99)
    goto LABEL_69;
  objc_msgSend(v99, "spacing");
  v101 = v100;
  v102 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverActionStatus];
  v104 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverActionStatus], v103);
  if (!v104)
  {
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  v105 = v104;
  v106 = v92 + v101;
  v107 = objc_msgSend(v104, "isHidden");

  if ((v107 & 1) == 0)
  {
    v109 = (void *)swift_unknownObjectWeakLoadStrong(v102, v108);
    if (!v109)
    {
LABEL_81:
      __break(1u);
      goto LABEL_82;
    }
    v110 = v109;
    objc_msgSend(v109, "frame");
    v112 = v111;

    v106 = v106 + v112;
  }
  v113 = *(void **)&v1[v6];
  if (!v113)
    goto LABEL_71;
  objc_msgSend(v113, "constant");
  v115 = v114;
  v116 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_errorStateLabel];
  v118 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_errorStateLabel], v117);
  if (!v118)
  {
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v119 = v118;
  v120 = v106 + v115;
  v121 = objc_msgSend(v118, "isHidden");

  if ((v121 & 1) == 0)
  {
    v123 = swift_unknownObjectWeakLoadStrong(v116, v122);
    if (!v123)
    {
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
    v124 = (void *)v123;
    v125 = UILabel.requiredHeight.getter();

    v120 = v120 + v125;
  }
  v126 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_edgeCaseStateLabel];
  v127 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_edgeCaseStateLabel], v122);
  if (!v127)
    goto LABEL_73;
  v128 = v127;
  v129 = objc_msgSend(v127, "isHidden");

  if ((v129 & 1) != 0)
    goto LABEL_50;
  v131 = swift_unknownObjectWeakLoadStrong(v126, v130);
  if (!v131)
  {
LABEL_83:
    __break(1u);
    return;
  }
  v132 = (void *)v131;
  v133 = UILabel.requiredHeight.getter();

  v120 = v120 + v133;
LABEL_50:
  v134 = sub_100038A3C();
  if (v134)
  {
    v135 = fmax(v120, 220.0);
    v139 = (char *)v134;
    sub_100029CB4();
    v136 = v139;
    v137 = (double *)&v139[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
    *v137 = v135;
    *((_BYTE *)v137 + 8) = 0;
    if (v138 != v135)
    {
      objc_msgSend(v139, "requestResize");
      v136 = v139;
    }

  }
}

double UILabel.requiredHeight.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  double Height;
  CGRect v7;
  CGRect v8;

  objc_msgSend(v0, "frame");
  v1 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v7), 1.79769313e308);
  objc_msgSend(v1, "setNumberOfLines:", objc_msgSend(v0, "numberOfLines"));
  objc_msgSend(v1, "setLineBreakMode:", 0);
  v2 = objc_msgSend(v0, "font");
  objc_msgSend(v1, "setFont:", v2);

  v3 = objc_msgSend(v0, "text");
  objc_msgSend(v1, "setText:", v3);

  v4 = objc_msgSend(v0, "attributedText");
  objc_msgSend(v1, "setAttributedText:", v4);

  objc_msgSend(v1, "sizeToFit");
  objc_msgSend(v1, "frame");
  Height = CGRectGetHeight(v8);

  return Height;
}

void sub_10000CCB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *Strong;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((*(_BYTE *)(v2
                 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_isSenderProfilePublic) & 1) == 0)
  {
    v3 = v2
       + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarStackView;
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v2+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarStackView, a2);

    if (Strong)
    {
      v5 = (void *)swift_unknownObjectWeakLoadStrong(v3, a2);
      if (!v5)
        goto LABEL_8;
      v6 = v5;
      objc_msgSend(v5, "setHidden:", 1);

    }
  }
  v7 = (void *)swift_unknownObjectWeakLoadStrong(v2+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverInfoStackView, a2);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "setHidden:", 0);

    __asm { BR              X10 }
  }
  __break(1u);
LABEL_8:
  __break(1u);
  JUMPOUT(0x10000D3C8);
}

void sub_10000D464(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_errorStateLabel, a2);
  if (Strong)
  {
    v4 = Strong;
    objc_msgSend(Strong, "setHidden:", 1);

    v6 = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_tryAgainLabel, v5);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setHidden:", 1);

      v9 = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_viewFriendsLabel, v8);
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v9, "setHidden:", 1);

        v12 = (void *)swift_unknownObjectWeakLoadStrong(v2+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_secondSubtitleLabel, v11);
        if (v12)
        {
          v13 = v12;
          objc_msgSend(v12, "setHidden:", 1);

          __asm { BR              X10 }
        }
LABEL_9:
        __break(1u);
        JUMPOUT(0x10000D764);
      }
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  goto LABEL_8;
}

void sub_10000D7AC()
{
  __asm { BR              X10 }
}

void sub_10000D7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  NSString v9;
  Swift::String v10;

  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_subTitle, a2);
  if (!Strong)
  {
    __break(1u);
    JUMPOUT(0x10000D988);
  }
  v4 = (void *)Strong;
  v5 = (id)((uint64_t (*)(void))GKGameCenterUIFrameworkBundle)();
  v6._countAndFlagsBits = 0xD000000000000023;
  v10._object = (void *)0xE000000000000000;
  v6._object = (void *)0x80000001000422C0;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v10._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v10)._object;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v4, "setText:", v9);

}

void sub_10000D9B8(uint64_t a1)
{
  char *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  Swift::String v30;
  Swift::String v31;
  void *v32;
  NSString v33;
  char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  NSString v54;
  id v55;
  uint64_t inited;
  id v57;
  NSString *v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  Class isa;
  uint64_t v63;
  id v64;
  Swift::String v65;
  Swift::String v66;
  void *object;
  id v68;
  NSString v69;
  id v70;
  uint64_t v71;
  NSString *v72;
  id v73;
  void *v74;
  unint64_t v75;
  void *v76;
  Class v77;
  uint64_t v78;
  void *Strong;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  Swift::String v85;
  Swift::String v86;
  void *v87;
  NSString v88;
  char *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  void *v96;
  void *v97;
  char *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  id v107;
  char *v108;
  char v109[72];
  char v110[80];
  Swift::String v111;
  Swift::String v112;
  Swift::String v113;
  Swift::String v114;

  v3 = (void *)sub_100038A3C();
  if (!v3
    || (v5 = v3, v6 = objc_msgSend(v3, "activeConversation"), v5, !v6))
  {
LABEL_14:
    v49 = *(id *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer);
    if (v49 && (v49 = objc_msgSend(v49, "displayNameWithOptions:", 0)) != 0)
    {
      v50 = v49;
      v108 = v1;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
      v52 = v51;

    }
    else
    {
      v52 = *(_QWORD *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname + 8);
      if (!v52)
      {
LABEL_26:
        v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState] = 1;
        sub_10000C490((uint64_t)v49, v4);
        return;
      }
      v108 = v1;
      swift_bridgeObjectRetain(v52);
    }
    v53 = objc_allocWithZone((Class)NSMutableAttributedString);
    v54 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v52);
    v55 = objc_msgSend(v53, "initWithString:", v54);

    v106 = sub_100005170(&qword_100058C78);
    inited = swift_initStackObject(v106, v110);
    *(_OWORD *)(inited + 16) = xmmword_100044020;
    *(_QWORD *)(inited + 32) = NSFontAttributeName;
    v105 = (id)objc_opt_self(UIFont);
    v57 = v55;
    v58 = NSFontAttributeName;
    v59 = objc_msgSend(v105, "_gkPreferredFontForTextStyle:symbolicTraits:", UIFontTextStyleFootnote, 2);
    v60 = sub_1000105F0(0, (unint64_t *)&unk_100058C80, UIFont_ptr);
    *(_QWORD *)(inited + 64) = v60;
    *(_QWORD *)(inited + 40) = v59;
    v61 = sub_10000E2CC(inited);
    type metadata accessor for Key(0);
    sub_10000FFE4(&qword_100058818, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100043BD8);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v61);
    objc_msgSend(v57, "addAttributes:range:", isa, 0, objc_msgSend(v57, "length"));

    v64 = (id)GKGameCenterUIFrameworkBundle(v63);
    v65._countAndFlagsBits = 0xD000000000000020;
    v113._object = (void *)0xE000000000000000;
    v65._object = (void *)0x8000000100042190;
    v66._countAndFlagsBits = 0;
    v66._object = (void *)0xE000000000000000;
    v113._countAndFlagsBits = 0;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v65, (Swift::String_optional)0, (NSBundle)v64, v66, v113)._object;

    v68 = objc_allocWithZone((Class)NSMutableAttributedString);
    v69 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    v70 = objc_msgSend(v68, "initWithString:", v69);

    v71 = swift_initStackObject(v106, v109);
    *(_OWORD *)(v71 + 16) = xmmword_100044020;
    *(_QWORD *)(v71 + 32) = v58;
    v72 = v58;
    v73 = objc_msgSend(v105, "preferredFontForTextStyle:", UIFontTextStyleFootnote);
    *(_QWORD *)(v71 + 64) = v60;
    v74 = v57;
    *(_QWORD *)(v71 + 40) = v73;
    v75 = sub_10000E2CC(v71);
    v76 = v70;
    v77 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v75);
    objc_msgSend(v70, "addAttributes:range:", v77, 0, objc_msgSend(v70, "length"));

    objc_msgSend(v57, "appendAttributedString:", v70);
    v1 = v108;
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&v108[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteStatusInfoLabel], v78);
    if (Strong)
    {
      v80 = Strong;
      objc_msgSend(Strong, "setAttributedText:", v57);

      v82 = swift_unknownObjectWeakLoadStrong(&v108[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_viewFriendsLabel], v81);
      if (v82)
      {
        v83 = (void *)v82;
        v84 = (id)GKGameCenterUIFrameworkBundle(v82);
        v85._countAndFlagsBits = 0xD00000000000001DLL;
        v114._object = (void *)0xE000000000000000;
        v85._object = (void *)0x80000001000421C0;
        v86._countAndFlagsBits = 0;
        v86._object = (void *)0xE000000000000000;
        v114._countAndFlagsBits = 0;
        v87 = NSLocalizedString(_:tableName:bundle:value:comment:)(v85, (Swift::String_optional)0, (NSBundle)v84, v86, v114)._object;

        v88 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v87);
        objc_msgSend(v83, "setText:", v88);

        v89 = &v108[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteAcceptedStackView];
        v91 = (void *)swift_unknownObjectWeakLoadStrong(&v108[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteAcceptedStackView], v90);
        if (v91)
        {
          v92 = v91;
          objc_msgSend(v91, "setUserInteractionEnabled:", 1);

          v93 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v108, "friendAvatarPressed:");
          v94 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v108, "friendAvatarPressed:");
          v96 = (void *)swift_unknownObjectWeakLoadStrong(v89, v95);
          if (v96)
          {
            v97 = v96;
            objc_msgSend(v96, "addGestureRecognizer:", v93);

            v98 = &v108[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView];
            v100 = (void *)swift_unknownObjectWeakLoadStrong(&v108[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView], v99);
            if (v100)
            {
              v101 = v100;
              objc_msgSend(v100, "setUserInteractionEnabled:", 1);

              v103 = (void *)swift_unknownObjectWeakLoadStrong(v98, v102);
              if (v103)
              {
                v104 = v103;
                objc_msgSend(v103, "addGestureRecognizer:", v94);

                goto LABEL_26;
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
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_29;
  }
  v7 = objc_msgSend(v6, "recipientAddresses");
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for String);

  v9 = *(_QWORD *)(v8 + 16);
  v10 = swift_bridgeObjectRelease(v8);
  if (v9 < 2
    || (v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount),
        (*(_BYTE *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount + 8) & 1) != 0)
    || (v13 = *v12, *v12 < 1))
  {

    goto LABEL_14;
  }
  v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState] = 2;
  sub_10000C490(v10, v11);
  v15 = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteStatusInfoLabel], v14);
  if (!v15)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v16 = (void *)v15;
  v17 = (id)GKGameCenterUIFrameworkBundle(v15);
  v111._object = (void *)0xE000000000000000;
  v18._object = (void *)0x80000001000421E0;
  v18._countAndFlagsBits = 0xD00000000000001ALL;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v111._countAndFlagsBits = 0;
  v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v111);

  v21 = sub_100005170(&qword_100058C70);
  v22 = swift_allocObject(v21, 72, 7);
  *(_OWORD *)(v22 + 16) = xmmword_100044020;
  *(_QWORD *)(v22 + 56) = &type metadata for Int;
  *(_QWORD *)(v22 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v22 + 32) = v13;
  String.init(format:_:)(v20._countAndFlagsBits, v20._object, v22);
  v24 = v23;
  swift_bridgeObjectRelease(v20._object);
  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  objc_msgSend(v16, "setText:", v25);

  v27 = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_viewFriendsLabel], v26);
  if (!v27)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v28 = (void *)v27;
  v29 = (id)GKGameCenterUIFrameworkBundle(v27);
  v30._countAndFlagsBits = 0xD00000000000001CLL;
  v112._object = (void *)0xE000000000000000;
  v30._object = (void *)0x8000000100042200;
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  v112._countAndFlagsBits = 0;
  v32 = NSLocalizedString(_:tableName:bundle:value:comment:)(v30, (Swift::String_optional)0, (NSBundle)v29, v31, v112)._object;

  v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v32);
  objc_msgSend(v28, "setText:", v33);

  v34 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteAcceptedStackView];
  v36 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteAcceptedStackView], v35);
  if (!v36)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v37 = v36;
  objc_msgSend(v36, "setUserInteractionEnabled:", 1);

  v38 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v1, "viewGameCenterFriendsTapped:");
  v39 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v1, "viewGameCenterFriendsTapped:");
  v41 = (void *)swift_unknownObjectWeakLoadStrong(v34, v40);
  if (!v41)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v42 = v41;
  objc_msgSend(v41, "addGestureRecognizer:", v38);

  v43 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView];
  v45 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView], v44);
  if (v45)
  {
    v46 = v45;
    objc_msgSend(v45, "setUserInteractionEnabled:", 1);

    v48 = (void *)swift_unknownObjectWeakLoadStrong(v43, v47);
    if (v48)
    {
      v107 = v48;
      objc_msgSend(v48, "addGestureRecognizer:", v39);

      return;
    }
    goto LABEL_38;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

unint64_t sub_10000E2CC(uint64_t a1)
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
  sub_100005170(&qword_100058CA0);
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
    sub_10000FF38(v7, (uint64_t)&v14);
    v8 = v14;
    result = sub_10002F328(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_10000FF80(&v15, (_OWORD *)(v4[7] + 32 * result));
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

void sub_10000E3E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSString v11;
  id v12;
  uint64_t v13;
  uint64_t inited;
  void *v15;
  uint64_t v16;
  id v17;
  NSString *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  Swift::String v23;
  uint64_t v24;
  id v25;
  NSString v26;
  id v27;
  id v28;
  Class isa;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  NSString *v35;
  id v36;
  unint64_t v37;
  Class v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *Strong;
  Class v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  _BYTE v57[72];
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[80];

  v3 = v2;
  if (!a2
    || (v6 = String._bridgeToObjectiveC()(),
        v7 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v6),
        v6,
        !v7)
    || (v8 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithScale:", 1),
        v9 = objc_msgSend(v7, "imageWithConfiguration:", v8),
        v7,
        v8,
        !v9))
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName, a2);
    if (Strong)
    {
      v56 = Strong;
      objc_msgSend(Strong, "setHidden:", 1);

      return;
    }
    __break(1u);
    goto LABEL_19;
  }
  v55 = v9;
  v10 = objc_allocWithZone((Class)NSMutableAttributedString);
  swift_bridgeObjectRetain(a2);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = objc_msgSend(v10, "initWithString:", v11);

  v13 = sub_100005170(&qword_100058C78);
  inited = swift_initStackObject(v13, v60);
  *(_OWORD *)(inited + 16) = xmmword_100044020;
  *(_QWORD *)(inited + 32) = NSFontAttributeName;
  v15 = (void *)objc_opt_self(UIFont);
  v16 = qword_100058730;
  v17 = v12;
  v18 = NSFontAttributeName;
  if (v16 != -1)
    swift_once(&qword_100058730, sub_1000064B0);
  v19 = objc_msgSend(v15, "_gkPreferredFontForTextStyle:symbolicTraits:", qword_10005C210, 2);
  *(_QWORD *)(inited + 64) = sub_1000105F0(0, (unint64_t *)&unk_100058C80, UIFont_ptr);
  *(_QWORD *)(inited + 40) = v19;
  v20 = sub_10000E2CC(inited);
  v21 = v20;
  v22 = 1 << *(_BYTE *)(v3
                      + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState);
  if ((v22 & 0x178) != 0)
  {

    v58 = a1;
    v59 = a2;
    swift_bridgeObjectRetain(a2);
    v23._countAndFlagsBits = 32;
    v23._object = (void *)0xE100000000000000;
    String.append(_:)(v23);
    v24 = a2;
    v25 = objc_allocWithZone((Class)NSMutableAttributedString);
    v26 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    v27 = objc_msgSend(v25, "initWithString:", v26);

    type metadata accessor for Key(0);
    sub_10000FFE4(&qword_100058818, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100043BD8);
    v28 = v27;
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    objc_msgSend(v28, "addAttributes:range:", isa, 0, objc_msgSend(v28, "length"));

    v30 = objc_msgSend((id)objc_opt_self(NSTextAttachment), "textAttachmentWithImage:", v55);
    v31 = sub_1000105F0(0, &qword_100058C90, NSMutableAttributedString_ptr);
    v32 = objc_msgSend((id)swift_getObjCClassFromMetadata(v31), "attributedStringWithAttachment:", v30);
    v33 = swift_initStackObject(v13, v57);
    *(_OWORD *)(v33 + 16) = xmmword_100044020;
    *(_QWORD *)(v33 + 32) = NSForegroundColorAttributeName;
    v34 = (void *)objc_opt_self(UIColor);
    v35 = NSForegroundColorAttributeName;
    v36 = objc_msgSend(v34, "tertiaryLabelColor");
    *(_QWORD *)(v33 + 64) = sub_1000105F0(0, &qword_100058C98, UIColor_ptr);
    *(_QWORD *)(v33 + 40) = v36;
    v37 = sub_10000E2CC(v33);
    v38 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v37);
    objc_msgSend(v32, "addAttributes:range:", v38, 0, objc_msgSend(v32, "length"));

    objc_msgSend(v28, "appendAttributedString:", v32);
    v39 = v3 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName;
    v41 = (void *)swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName, v40);
    if (v41)
    {
      v42 = v41;
      objc_msgSend(v41, "setAttributedText:", v28);

      v44 = (void *)swift_unknownObjectWeakLoadStrong(v39, v43);
      if (v44)
      {
        v45 = v44;
        objc_msgSend(v44, "setUserInteractionEnabled:", 1);

        v46 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "friendAvatarPressed:");
        v48 = (void *)swift_unknownObjectWeakLoadStrong(v39, v47);
        if (v48)
        {
          v49 = v48;
          objc_msgSend(v48, "addGestureRecognizer:", v46);

          return;
        }
        goto LABEL_21;
      }
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if ((v22 & 7) == 0)
  {
    swift_bridgeObjectRelease(v20);

    goto LABEL_17;
  }
  type metadata accessor for Key(0);
  sub_10000FFE4(&qword_100058818, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100043BD8);
  v51 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  objc_msgSend(v17, "addAttributes:range:", v51, 0, objc_msgSend(v17, "length"));

  v53 = (void *)swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName, v52);
  if (v53)
  {
    v54 = v53;
    objc_msgSend(v53, "setAttributedText:", v17);

LABEL_17:
    return;
  }
LABEL_22:
  __break(1u);
}

void sub_10000EA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  id v7;
  Swift::String v8;
  Swift::String v9;
  void *object;
  NSString v11;
  Swift::String v12;

  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel))
    __asm { BR              X10 }
  sub_10000ECE8(a1, a2);
  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_errorStateLabel, v4);
  if (!Strong)
  {
    __break(1u);
    JUMPOUT(0x10000ECC0);
  }
  v6 = (void *)Strong;
  v7 = (id)GKGameCenterUIFrameworkBundle(Strong);
  v8._countAndFlagsBits = 0xD00000000000002ELL;
  v12._object = (void *)0xE000000000000000;
  v8._object = (void *)0x80000001000420C0;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v12._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v12)._object;

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v6, "setText:", v11);

}

void sub_10000ECE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *Strong;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_tryAgainLabel;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_tryAgainLabel, a2);
  if (!Strong)
  {
    __break(1u);
    goto LABEL_6;
  }
  v5 = Strong;
  objc_msgSend(Strong, "setHidden:", 0);

  v7 = (void *)swift_unknownObjectWeakLoadStrong(v3, v6);
  if (!v7)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v8 = v7;
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  v9 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v2, "tryAgainPressed:");
  v11 = (void *)swift_unknownObjectWeakLoadStrong(v3, v10);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "addGestureRecognizer:", v9);

    return;
  }
LABEL_7:
  __break(1u);
}

void sub_10000EDC4(void *a1)
{
  char *v1;
  char *v2;
  id v4;
  id v5;
  uint64_t v6;
  void *Strong;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSString v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSString v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  Swift::String v45;
  Swift::String v46;
  Swift::String v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSString v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  Swift::String v57;
  Swift::String v58;
  Swift::String v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSString v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  Swift::String v68;
  Swift::String v69;
  Swift::String v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSString v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  Swift::String v81;
  Swift::String v82;
  Swift::String v83;

  v2 = v1;
  v4 = objc_msgSend(v1, "traitCollection");
  v5 = objc_msgSend(v4, "preferredContentSizeCategory");

  LODWORD(v4) = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v5);
  if ((_DWORD)v4)
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarAndButtonStackView], v6);
    if (Strong)
    {
      v78 = Strong;
      objc_msgSend(Strong, "setHidden:", 1);

      return;
    }
    __break(1u);
    goto LABEL_16;
  }
  v8 = &v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendsCountLabel];
  v9 = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendsCountLabel], v6);
  if (!v9)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_opt_self(UIFont);
  v12 = objc_msgSend(v11, "_preferredFontForTextStyle:design:weight:", UIFontTextStyleHeadline, UIFontDescriptorSystemDesignRounded, UIFontWeightRegular);
  objc_msgSend(v10, "setFont:", v12);

  v14 = swift_unknownObjectWeakLoadStrong(v8, v13);
  if (!v14)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v15 = (void *)v14;
  objc_msgSend(a1, "stats");
  dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v17 = v16;
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  objc_msgSend(v15, "setText:", v18);

  v19 = &v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_achievementsCountLabel];
  v21 = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_achievementsCountLabel], v20);
  if (!v21)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v22 = (void *)v21;
  v23 = objc_msgSend(v11, "_preferredFontForTextStyle:design:weight:", UIFontTextStyleHeadline, UIFontDescriptorSystemDesignRounded, UIFontWeightRegular);
  objc_msgSend(v22, "setFont:", v23);

  v25 = swift_unknownObjectWeakLoadStrong(v19, v24);
  if (!v25)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v26 = (void *)v25;
  objc_msgSend(a1, "stats");
  dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v28 = v27;
  v29 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v28);
  objc_msgSend(v26, "setText:", v29);

  v30 = &v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gamesCountLabel];
  v32 = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gamesCountLabel], v31);
  if (!v32)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v33 = (void *)v32;
  v34 = objc_msgSend(v11, "_preferredFontForTextStyle:design:weight:", UIFontTextStyleHeadline, UIFontDescriptorSystemDesignRounded, UIFontWeightRegular);
  objc_msgSend(v33, "setFont:", v34);

  v36 = swift_unknownObjectWeakLoadStrong(v30, v35);
  if (!v36)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v37 = (void *)v36;
  objc_msgSend(a1, "stats");
  dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v39 = v38;
  v40 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v39);
  objc_msgSend(v37, "setText:", v40);

  v42 = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendsLabel], v41);
  if (!v42)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v43 = (void *)v42;
  v44 = (id)GKGameCenterUIFrameworkBundle(v42);
  v45._countAndFlagsBits = 0xD00000000000001CLL;
  v81._object = (void *)0xE000000000000000;
  v45._object = (void *)0x8000000100042060;
  v46._countAndFlagsBits = 0;
  v46._object = (void *)0xE000000000000000;
  v81._countAndFlagsBits = 0;
  v47 = NSLocalizedString(_:tableName:bundle:value:comment:)(v45, (Swift::String_optional)0, (NSBundle)v44, v46, v81);

  v48 = sub_100005170(&qword_100058C70);
  v49 = swift_allocObject(v48, 72, 7);
  *(_OWORD *)(v49 + 16) = xmmword_100044020;
  objc_msgSend(a1, "stats");
  *(_QWORD *)(v49 + 56) = &type metadata for Int;
  *(_QWORD *)(v49 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v49 + 32) = v79;
  String.init(format:_:)(v47._countAndFlagsBits, v47._object, v49);
  v51 = v50;
  swift_bridgeObjectRelease(v47._object);
  v52 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v51);
  objc_msgSend(v43, "setText:", v52);

  v54 = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_achievementsLabel], v53);
  if (!v54)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v55 = (void *)v54;
  v56 = (id)GKGameCenterUIFrameworkBundle(v54);
  v57._countAndFlagsBits = 0xD000000000000018;
  v82._object = (void *)0xE000000000000000;
  v57._object = (void *)0x8000000100042080;
  v58._countAndFlagsBits = 0;
  v58._object = (void *)0xE000000000000000;
  v82._countAndFlagsBits = 0;
  v59 = NSLocalizedString(_:tableName:bundle:value:comment:)(v57, (Swift::String_optional)0, (NSBundle)v56, v58, v82);

  v60 = swift_allocObject(v48, 72, 7);
  *(_OWORD *)(v60 + 16) = xmmword_100044020;
  objc_msgSend(a1, "stats");
  *(_QWORD *)(v60 + 56) = &type metadata for Int;
  *(_QWORD *)(v60 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v60 + 32) = v80;
  String.init(format:_:)(v59._countAndFlagsBits, v59._object, v60);
  v62 = v61;
  swift_bridgeObjectRelease(v59._object);
  v63 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v62);
  objc_msgSend(v55, "setText:", v63);

  v65 = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gamesLabel], v64);
  if (!v65)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v66 = (void *)v65;
  v67 = (id)GKGameCenterUIFrameworkBundle(v65);
  v83._object = (void *)0xE000000000000000;
  v68._object = (void *)0x80000001000420A0;
  v68._countAndFlagsBits = 0xD000000000000011;
  v69._countAndFlagsBits = 0;
  v69._object = (void *)0xE000000000000000;
  v83._countAndFlagsBits = 0;
  v70 = NSLocalizedString(_:tableName:bundle:value:comment:)(v68, (Swift::String_optional)0, (NSBundle)v67, v69, v83);

  v71 = swift_allocObject(v48, 72, 7);
  *(_OWORD *)(v71 + 16) = xmmword_100044020;
  objc_msgSend(a1, "stats");
  *(_QWORD *)(v71 + 56) = &type metadata for Int;
  *(_QWORD *)(v71 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v71 + 32) = v79;
  String.init(format:_:)(v70._countAndFlagsBits, v70._object, v71);
  v73 = v72;
  swift_bridgeObjectRelease(v70._object);
  v74 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v73);
  objc_msgSend(v66, "setText:", v74);

  v76 = (void *)swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarAndButtonStackView], v75);
  if (v76)
  {
    v77 = v76;
    objc_msgSend(v76, "setHidden:", 0);

    return;
  }
LABEL_25:
  __break(1u);
}

id sub_10000F4C8(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  _QWORD *v6;
  NSString v7;
  id v8;
  objc_super v10;

  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_mainContainer], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_subTitle], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteStatusInfoLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_secondSubtitleLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_viewFriendsLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerAvatarView], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_acceptButton], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gameCenterLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gameCenterPhoto], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_buttonsStackView], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendsCountLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendsLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gamesLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_achievementsLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_achievementsCountLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gamesCountLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarStackView], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarAndButtonStackView], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_errorStateLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverInfoStackView], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_dividerView], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_tryAgainLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_edgeCaseStateLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverActionStatus], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteAcceptedStackView], 0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel] = 0;
  *(_DWORD *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_profileVisibility] = 2;
  v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender] = 0;
  v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_isSenderProfilePublic] = 2;
  v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer] = 0;
  v6 = &v3[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl];
  *v6 = 0;
  v6[1] = 0;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for FriendRequestCardViewController();
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_10000F850(void *a1)
{
  _BYTE *v1;
  _QWORD *v3;
  objc_class *v4;
  id v5;
  objc_super v7;

  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_mainContainer], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerName], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_subTitle], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteStatusInfoLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_secondSubtitleLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_viewFriendsLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerAvatarView], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_acceptButton], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gameCenterLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gameCenterPhoto], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_ignoreButton], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_buttonsStackView], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendsCountLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendsLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gamesLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_achievementsLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_achievementsCountLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_gamesCountLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarStackView], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerProfileInfoBarAndButtonStackView], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_errorStateLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverInfoStackView], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_dividerView], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_tryAgainLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_edgeCaseStateLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_receiverActionStatus], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteAcceptedStackView], 0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_topMostConstriant] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_centerStackView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel] = 0;
  *(_DWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_profileVisibility] = 2;
  v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardState] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_sender] = 0;
  v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_isSenderProfilePublic] = 2;
  v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer] = 0;
  v3 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl];
  v4 = (objc_class *)type metadata accessor for FriendRequestCardViewController();
  *v3 = 0;
  v3[1] = 0;
  v7.receiver = v1;
  v7.super_class = v4;
  v5 = objc_msgSendSuper2(&v7, "initWithCoder:", a1);

  return v5;
}

uint64_t type metadata accessor for FriendRequestCardViewController()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension31FriendRequestCardViewController);
}

uint64_t getEnumTagSinglePayload for FriendRequestCardViewController.InviteCardViewer(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FriendRequestCardViewController.InviteCardViewer(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000FC68 + 4 * byte_100043E0B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000FC9C + 4 * byte_100043E06[v4]))();
}

uint64_t sub_10000FC9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FCA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000FCACLL);
  return result;
}

uint64_t sub_10000FCB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000FCC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000FCC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FCCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FCD8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000FCE0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FriendRequestCardViewController.InviteCardViewer()
{
  return &type metadata for FriendRequestCardViewController.InviteCardViewer;
}

uint64_t getEnumTagSinglePayload for FriendRequestCardViewController.InviteCardUIType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FriendRequestCardViewController.InviteCardUIType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000FDD8 + 4 * byte_100043E15[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_10000FE0C + 4 * byte_100043E10[v4]))();
}

uint64_t sub_10000FE0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FE14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000FE1CLL);
  return result;
}

uint64_t sub_10000FE28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000FE30);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_10000FE34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FE3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000FE48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FriendRequestCardViewController.InviteCardUIType()
{
  return &type metadata for FriendRequestCardViewController.InviteCardUIType;
}

unint64_t sub_10000FE64()
{
  unint64_t result;

  result = qword_100058C60;
  if (!qword_100058C60)
  {
    result = swift_getWitnessTable(&unk_100043F5C, &type metadata for FriendRequestCardViewController.InviteCardUIType);
    atomic_store(result, (unint64_t *)&qword_100058C60);
  }
  return result;
}

unint64_t sub_10000FEAC()
{
  unint64_t result;

  result = qword_100058C68;
  if (!qword_100058C68)
  {
    result = swift_getWitnessTable(&unk_100043FC4, &type metadata for FriendRequestCardViewController.InviteCardViewer);
    atomic_store(result, (unint64_t *)&qword_100058C68);
  }
  return result;
}

unint64_t sub_10000FEF0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000514A8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 9)
    return 9;
  else
    return v3;
}

uint64_t sub_10000FF38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005170(&qword_100058CA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000FF80(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000FF90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000FFA0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000FFA8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void *sub_10000FFCC(uint64_t a1)
{
  uint64_t v1;

  return sub_10000B998(a1, *(char **)(v1 + 16));
}

void sub_10000FFD4(uint64_t a1)
{
  uint64_t v1;

  sub_10000AA3C(a1, *(char **)(v1 + 16), *(void **)(v1 + 24));
}

void sub_10000FFDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000B1F0(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_10000FFE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_100010024()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059E20;
  if (!qword_100059E20)
  {
    v1 = sub_10000437C((uint64_t *)&unk_100058CD0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100059E20);
  }
  return result;
}

_QWORD *sub_100010070(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  unint64_t v9;
  _QWORD *v10;
  id v11;
  Class isa;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  _QWORD *v23;

  v23 = _swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
    goto LABEL_23;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v5 = 0;
      v6 = (_QWORD *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname);
      while ((a1 & 0xC000000000000001) != 0)
      {
        v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
LABEL_10:
        v8 = v7;
        v9 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_22;
        v10 = v6;
        sub_1000105F0(0, (unint64_t *)&unk_100058CF0, NSNumber_ptr);
        v11 = objc_msgSend(v8, "friendBiDirectional");
        isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
        a2 = static NSObject.== infix(_:_:)(v11, isa);

        if ((a2 & 1) != 0)
        {
          v13 = objc_msgSend(v8, "alias");
          v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
          a2 = v15;

          v6 = v10;
          v16 = v10[1];
          if (!v16)
          {

            swift_bridgeObjectRelease(a2);
            goto LABEL_6;
          }
          if (v14 == *v10 && v16 == a2)
          {
            v17 = swift_bridgeObjectRelease(a2);
LABEL_18:
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
            v19 = v23[2];
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v19);
            v20 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, v8);
            a2 = (uint64_t)&v23;
            specialized ContiguousArray._endMutation()(v20);
            goto LABEL_5;
          }
          v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, a2, *v10, v16, 0);
          v17 = swift_bridgeObjectRelease(a2);
          if ((v18 & 1) != 0)
            goto LABEL_18;
        }

LABEL_5:
        v6 = v10;
LABEL_6:
        ++v5;
        if (v9 == v4)
          return v23;
      }
      if (v5 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      if (a1 < 0)
        v22 = a1;
      else
        v22 = a1 & 0xFFFFFFFFFFFFFF8;
      v4 = _CocoaArrayWrapper.endIndex.getter(v22);
      if (!v4)
        return _swiftEmptyArrayStorage;
    }
    v7 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_10;
  }
  return _swiftEmptyArrayStorage;
}

_QWORD *sub_1000102B4(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  Class isa;
  char v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_21;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      v5 = v2 & 0xC000000000000001;
      v32 = v2 & 0xFFFFFFFFFFFFFF8;
      v30 = v2;
      v29 = v2 & 0xC000000000000001;
      while (v5)
      {
        v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v2);
LABEL_9:
        v7 = v6;
        v8 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_20;
        sub_1000105F0(0, (unint64_t *)&unk_100058CF0, NSNumber_ptr);
        v9 = objc_msgSend(v7, "friendBiDirectional");
        isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
        v11 = static NSObject.== infix(_:_:)(v9, isa);

        if ((v11 & 1) != 0)
        {
          v12 = v3;
          v13 = objc_msgSend(v7, "internal");
          v14 = objc_msgSend(v13, "playerID");

          v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
          v17 = v16;

          v18 = objc_msgSend(a2, "internal");
          v19 = objc_msgSend(v18, "playerID");

          v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
          v22 = v21;

          if (v15 == v20 && v17 == v22)
          {
            v23 = swift_bridgeObjectRelease_n(v17, 2);
            v3 = v12;
            v5 = v29;
          }
          else
          {
            v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v20, v22, 0);
            swift_bridgeObjectRelease(v17);
            v23 = swift_bridgeObjectRelease(v22);
            v3 = v12;
            v5 = v29;
            if ((v24 & 1) == 0)
            {

              v2 = v30;
              goto LABEL_5;
            }
          }
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v23);
          v25 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v25);
          v26 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v25, v7);
          specialized ContiguousArray._endMutation()(v26);
          v2 = v30;
        }
        else
        {

        }
LABEL_5:
        ++v4;
        if (v8 == v3)
          return _swiftEmptyArrayStorage;
      }
      if (v4 < *(_QWORD *)(v32 + 16))
        break;
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      if (v2 < 0)
        v28 = v2;
      else
        v28 = v2 & 0xFFFFFFFFFFFFFF8;
      v3 = _CocoaArrayWrapper.endIndex.getter(v28);
      if (!v3)
        return _swiftEmptyArrayStorage;
    }
    v6 = *(id *)(v2 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10001055C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005170(&qword_100058CE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001059C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_1000105AC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_1000105D8(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000081AC(a1, a2, *(_BYTE **)(v2 + 16), *(void **)(v2 + 24));
}

void sub_1000105E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100008D54(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_1000105E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100008B38(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1000105F0(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100010628()
{
  void *v0;
  void *v1;
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
  void *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[5];
  uint64_t v31;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v29 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v27 = *(_QWORD *)(v5 - 8);
  v28 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchTime(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v26 - v13;
  sub_1000105F0(0, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr);
  v15 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)(v12, 0.1);
  v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v17 = swift_allocObject(&unk_100051D48, 24, 7);
  *(_QWORD *)(v17 + 16) = v0;
  aBlock[4] = sub_100010DB8;
  v31 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013AF4;
  aBlock[3] = &unk_100051D60;
  v18 = _Block_copy(aBlock);
  v19 = v31;
  v20 = v1;
  v21 = swift_release(v19);
  static DispatchQoS.unspecified.getter(v21);
  aBlock[0] = _swiftEmptyArrayStorage;
  v22 = sub_10000FFE4((unint64_t *)&unk_100059E10, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v23 = sub_100005170((uint64_t *)&unk_100058CD0);
  v24 = sub_100010024();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v23, v24, v2, v22);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v14, v7, v4, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v28);
  return ((uint64_t (*)(char *, uint64_t))v16)(v14, v8);
}

void sub_1000108AC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  int v3;
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = sub_100038A3C();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_inviteCardViewer);
    v4 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
    v5 = v4;
    v6 = &GKSenderTappedViewPlayerProfileButton;
    if (v3)
      v6 = &GKReceiverTappedViewPlayerProfileButton;
    objc_msgSend(v4, "reportEvent:type:", GKReporterDomainImprovedFriendingUIInteractions, *v6);

    v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
    if (v7)
    {
      v8 = *(void **)(v7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
      if (v8)
      {
        v9 = objc_msgSend(v8, "internal");
        v10 = objc_msgSend(v9, "playerID");

        v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
        v13 = v12;

      }
      else
      {
        v11 = 0;
        v13 = 0;
      }
      v14 = qword_10005C238;
      qword_10005C230 = v11;
      qword_10005C238 = v13;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRelease(v14);
      byte_100059C60 = 0;
      objc_msgSend(v2, "requestPresentationStyle:", 3);

      swift_bridgeObjectRelease(v13);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100010A08()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *Strong;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];

  v1 = sub_100038A3C();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
    objc_msgSend(v3, "reportEvent:type:", GKReporterDomainImprovedFriendingUIInteractions, GKViewFriendProfileButtonTapped);

    Strong = (void *)swift_unknownObjectWeakLoadStrong(v0+ OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_friendAvatarView, v4);
    if (Strong
      && (v6 = Strong, v7 = objc_msgSend(Strong, "player"), v6, v7))
    {
      v8 = objc_msgSend(v7, "internal");

      v9 = objc_msgSend(v8, "playerID");
      v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      v12 = v11;

      v13 = GKUnknownPlayerID;
    }
    else
    {
      v13 = GKUnknownPlayerID;
      v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(GKUnknownPlayerID);
      v12 = v14;
    }
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    if (v10 == v15 && v12 == v16)
    {
      swift_bridgeObjectRelease(v12);
    }
    else
    {
      v18 = v16;
      v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, v15, v16, 0);
      swift_bridgeObjectRelease(v18);
      if ((v19 & 1) == 0)
      {
LABEL_19:
        v29 = qword_10005C238;
        qword_10005C230 = v10;
        qword_10005C238 = v12;
        swift_bridgeObjectRetain(v12);
        swift_bridgeObjectRelease(v29);
        byte_100059C60 = 0;
        objc_msgSend(v2, "requestPresentationStyle:", 3);
        swift_bridgeObjectRelease(v12);

        return;
      }
    }
    v20 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
    if (!v20)
    {
      __break(1u);
      return;
    }
    v21 = (_QWORD *)(v20 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs);
    swift_beginAccess(v20 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs, v30, 0, 0);
    v22 = (_QWORD *)*v21;
    if (*v21 && v22[2])
    {
      v10 = v22[4];
      v23 = v22[5];
      swift_bridgeObjectRetain(v23);
      swift_bridgeObjectRelease(v12);
      v12 = v23;
    }
    else
    {
      v24 = *(void **)(v20 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
      if (v24)
      {
        v25 = v24;
        swift_bridgeObjectRelease(v12);
        v26 = objc_msgSend(v25, "internal");

        v27 = objc_msgSend(v26, "playerID");
        v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
        v12 = v28;

      }
    }
    goto LABEL_19;
  }
}

id sub_100010CB0()
{
  id v0;
  NSString v1;
  NSString v2;
  NSString v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  NSString v7;

  v0 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
  v1 = String._bridgeToObjectiveC()();
  v2 = String._bridgeToObjectiveC()();
  v3 = String._bridgeToObjectiveC()();
  sub_100008E54();
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "recordClickWithAction:targetId:targetType:pageId:pageType:", v1, v2, v3, v6, v7);

  return sub_10000763C();
}

id sub_100010DB8()
{
  return sub_10000763C();
}

id sub_100010F30()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeaderView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HeaderView()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension10HeaderView);
}

uint64_t sub_100010F94(void **a1, void **a2)
{
  return _sSo8GKPlayerC26GameCenterMessageExtensionE1loiySbAB_ABtFZ_0(*a1, *a2);
}

void sub_100010FAC(uint64_t a1, uint64_t a2)
{
  char *v2;
  void *v3;
  uint64_t v6;
  void *v7;
  id v8;
  NSArray v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  char *v17;
  void **aBlock;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;

  v3 = *(void **)&v2[qword_100059998];
  if (v3)
  {
    v6 = *(_QWORD *)&v2[qword_1000599A0];
    if (*(_QWORD *)(v6 + 16))
    {
      v7 = (void *)objc_opt_self(GKGameRecord);
      v8 = v3;
      swift_bridgeObjectRetain(v6);
      v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v6);
      v10 = (_QWORD *)swift_allocObject(&unk_100051E80, 40, 7);
      v10[2] = v2;
      v10[3] = a1;
      v10[4] = a2;
      v22 = sub_100011B68;
      v23 = v10;
      aBlock = _NSConcreteStackBlock;
      v19 = 1107296256;
      v20 = sub_100011384;
      v21 = &unk_100051E98;
      v11 = _Block_copy(&aBlock);
      v12 = v23;
      v13 = v2;
      swift_retain(a2);
      swift_release(v12);
      objc_msgSend(v7, "loadGameRecordsForPlayer:bundleIDs:withCompletionHandler:", v8, v9.super.isa, v11);
      _Block_release(v11);

    }
    else
    {
      v14 = (_QWORD *)swift_allocObject(&unk_100051E30, 40, 7);
      v14[2] = v2;
      v14[3] = a1;
      v14[4] = a2;
      v22 = sub_100011B14;
      v23 = v14;
      aBlock = _NSConcreteStackBlock;
      v19 = 1107296256;
      v20 = sub_100011600;
      v21 = &unk_100051E48;
      v15 = _Block_copy(&aBlock);
      v16 = v23;
      v9.super.isa = (Class)v3;
      v17 = v2;
      swift_retain(a2);
      swift_release(v16);
      -[objc_class loadGamesPlayedDetailsWithCompletionHandler:](v9.super.isa, "loadGamesPlayedDetailsWithCompletionHandler:", v15);
      _Block_release(v15);
    }

  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000011, 0x80000001000424C0, "GameCenterMessageExtension/GamesModel.swift", 43, 2, 58, 0);
    __break(1u);
  }
}

uint64_t sub_1000111E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v10;
  uint64_t result;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);

  if (!((unint64_t)a1 >> 62))
  {
    v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(a1);
    if (v10)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease(a1);
LABEL_18:
    v20 = *(_QWORD *)(a3 + qword_1000599A8);
    *(_QWORD *)(a3 + qword_1000599A8) = _swiftEmptyArrayStorage;
    swift_bridgeObjectRelease(v20);
    return a4(a2);
  }
  if (a1 < 0)
    v19 = a1;
  else
    v19 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  result = _CocoaArrayWrapper.endIndex.getter(v19);
  v10 = result;
  if (!result)
    goto LABEL_17;
LABEL_3:
  if (v10 >= 1)
  {
    v21 = a2;
    v22 = a5;
    v23 = a4;
    for (i = 0; i != v10; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      else
        v15 = *(id *)(a1 + 8 * i + 32);
      v16 = v15;
      v17 = objc_msgSend(v15, "internal", v21, v22, v23);
      v18 = objc_msgSend(v17, "canBeIndexed");

      if (v18)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v13 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
        v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v16);
        specialized ContiguousArray._endMutation()(v14);
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease(a1);
    a4 = v23;
    a2 = v21;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_100011384(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  unint64_t v7;
  uint64_t v8;
  id v9;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = sub_1000119F8();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v7);
  swift_retain(v5);
  v9 = a3;
  v6(v8, a3);
  swift_release(v5);
  swift_bridgeObjectRelease(v8);

}

uint64_t sub_10001140C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD), uint64_t a7)
{
  uint64_t v12;
  uint64_t result;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_QWORD);

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v21 = a1;
    else
      v21 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    result = _CocoaArrayWrapper.endIndex.getter(v21);
    v12 = result;
    if (result)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease(a1);
    goto LABEL_18;
  }
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain(a1);
  if (!v12)
    goto LABEL_17;
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
    return result;
  }
  v27 = a4;
  v28 = a7;
  v29 = a6;
  for (i = 0; i != v12; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
    else
      v17 = *(id *)(a1 + 8 * i + 32);
    v18 = v17;
    v19 = objc_msgSend(v17, "internal", v27, v28, v29);
    v20 = objc_msgSend(v19, "canBeIndexed");

    if (v20)
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v15 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
      v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v18);
      specialized ContiguousArray._endMutation()(v16);
    }
    else
    {

    }
  }
  swift_bridgeObjectRelease(a1);
  a6 = v29;
  a4 = v27;
LABEL_18:
  v22 = qword_1000599A8;
  v23 = *(_QWORD *)(a5 + qword_1000599A8);
  *(_QWORD *)(a5 + qword_1000599A8) = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v23);
  v24 = *(_QWORD *)(a5 + v22);
  if ((unint64_t)v24 >> 62)
  {
    if (v24 < 0)
      v26 = *(_QWORD *)(a5 + v22);
    else
      v26 = v24 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(_QWORD *)(a5 + v22));
    v25 = _CocoaArrayWrapper.endIndex.getter(v26);
    swift_bridgeObjectRelease(v24);
  }
  else
  {
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  *(_QWORD *)(a5 + qword_1000599B0) = v25;
  return a6(a4);
}

void sub_100011600(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, void *);
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = sub_1000119F8();
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v9);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  swift_retain(v7);
  v14 = a4;
  v8(v10, v11, v13, a4);
  swift_release(v7);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v13);

}

id sub_1000116AC(void *a1)
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for GamesModel(0);
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1000116EC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamesModel(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t _sSo8GKPlayerC26GameCenterMessageExtensionE1loiySbAB_ABtFZ_0(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  SEL *v20;
  id v21;
  void *v22;
  void *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  id v27;
  void *v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;

  v4 = sub_100005170(&qword_100058F40);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v34 - v8;
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v34 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v34 - v18;
  v20 = (SEL *)&unk_100056000;
  v21 = objc_msgSend(a1, "lastPlayedDate");
  if (!v21)
  {
    v25 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v26 = v25(v9, 1, 1, v10);
    goto LABEL_5;
  }
  v22 = v21;
  v23 = a2;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v24 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v24(v9, v17, v10);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v25(v9, 0, 1, v10);
  v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  if ((_DWORD)v26 == 1)
  {
    a2 = v23;
    v20 = (SEL *)&unk_100056000;
LABEL_5:
    static Date.distantPast.getter(v26);
    sub_100011B74((uint64_t)v9);
    goto LABEL_7;
  }
  v24(v19, v9, v10);
  a2 = v23;
  v20 = (SEL *)&unk_100056000;
LABEL_7:
  v27 = objc_msgSend(a2, v20[458]);
  if (!v27)
  {
    v30 = v25(v7, 1, 1, v10);
    goto LABEL_11;
  }
  v28 = v27;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v29 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v29(v7, v17, v10);
  v25(v7, 0, 1, v10);
  v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10);
  if ((_DWORD)v30 == 1)
  {
LABEL_11:
    static Date.distantPast.getter(v30);
    sub_100011B74((uint64_t)v7);
    goto LABEL_12;
  }
  v29(v14, v7, v10);
LABEL_12:
  v31 = static Date.> infix(_:_:)(v19, v14);
  v32 = *(void (**)(char *, uint64_t))(v11 + 8);
  v32(v14, v10);
  v32(v19, v10);
  return v31 & 1;
}

uint64_t sub_1000119C4(uint64_t a1)
{
  uint64_t result;

  result = sub_100011A58(&qword_100058D30, (uint64_t)&protocol conformance descriptor for GKGameRecord);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000119F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100058D38;
  if (!qword_100058D38)
  {
    v1 = objc_opt_self(GKGameRecord);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100058D38);
  }
  return result;
}

uint64_t sub_100011A34()
{
  return sub_100011A58(&qword_100058D40, (uint64_t)&protocol conformance descriptor for NSObject);
}

uint64_t sub_100011A58(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1000119F8();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for GamesModel(uint64_t a1)
{
  uint64_t result;

  result = qword_100058D70;
  if (!qword_100058D70)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for GamesModel);
  return result;
}

uint64_t sub_100011AD4(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 256, 0, v2, a1 + 400);
}

uint64_t sub_100011B08()
{
  return type metadata accessor for GamesModel(0);
}

uint64_t sub_100011B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_10001140C(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(uint64_t (**)(_QWORD))(v4 + 24), *(_QWORD *)(v4 + 32));
}

uint64_t sub_100011B20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011B30(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100011B3C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100011B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000111E0(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(uint64_t))(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_100011B74(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005170(&qword_100058F40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100011D80()
{
  return sub_1000120A8(type metadata accessor for ActionCell);
}

uint64_t type metadata accessor for ActionCell()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension10ActionCell);
}

id sub_100011FC8(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_titleLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_subtitleLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_playerAvatarView], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension10SenderCell_gameCenterPhoto], 0);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SenderCell();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_10001209C()
{
  return sub_1000120A8(type metadata accessor for SenderCell);
}

id sub_1000120A8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for SenderCell()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension10SenderCell);
}

uint64_t UICollectionView.dequeueSupplementaryView<A>(ofKind:for:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  NSString v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  Class isa;
  id v14;
  uint64_t result;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  void *object;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v8 = String._bridgeToObjectiveC()();
  v22 = a4;
  v9 = sub_100005170(&qword_100058AA8);
  String.init<A>(describing:)(&v22, v9);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = objc_msgSend(v4, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v12, isa);

  result = swift_dynamicCastUnknownClass(v14, a4);
  if (!result)
  {

    v22 = 0;
    v23 = 0xE000000000000000;
    _StringGuts.grow(_:)(68);
    v16._countAndFlagsBits = 0xD00000000000002ELL;
    v16._object = (void *)0x8000000100041730;
    String.append(_:)(v16);
    v17._countAndFlagsBits = a1;
    v17._object = a2;
    String.append(_:)(v17);
    v18._object = (void *)0x8000000100041760;
    v18._countAndFlagsBits = 0xD000000000000012;
    String.append(_:)(v18);
    v21 = a4;
    v19._countAndFlagsBits = String.init<A>(describing:)(&v21, v9);
    object = v19._object;
    String.append(_:)(v19);
    swift_bridgeObjectRelease(object);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v22, v23, "GameCenterMessageExtension/GKSwiftUtils.swift", 45, 2, 112, 0);
    __break(1u);
  }
  return result;
}

uint64_t UICollectionView.dequeueCell<A>(for:)(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  Class isa;
  id v9;
  uint64_t result;
  Swift::String v11;
  void *object;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v14 = a2;
  v4 = sub_100005170(&qword_100058AA8);
  String.init<A>(describing:)(&v14, v4);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v9 = objc_msgSend(v2, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, isa);

  result = swift_dynamicCastUnknownClass(v9, a2);
  if (!result)
  {

    v14 = 0;
    v15 = 0xE000000000000000;
    _StringGuts.grow(_:)(42);
    swift_bridgeObjectRelease(v15);
    v14 = 0xD000000000000028;
    v15 = 0x80000001000416A0;
    v13 = a2;
    v11._countAndFlagsBits = String.init<A>(describing:)(&v13, v4);
    object = v11._object;
    String.append(_:)(v11);
    swift_bridgeObjectRelease(object);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v14, v15, "GameCenterMessageExtension/GKSwiftUtils.swift", 45, 2, 104, 0);
    __break(1u);
  }
  return result;
}

uint64_t static ReusableView<>.defaultReuseIdentifier.getter()
{
  uint64_t MetatypeMetadata;
  uint64_t v2;

  MetatypeMetadata = swift_getMetatypeMetadata();
  return String.init<A>(describing:)(&v2, MetatypeMetadata);
}

uint64_t static UICollectionReusableView.defaultReuseIdentifier.getter()
{
  uint64_t v0;
  uint64_t v2;

  v0 = sub_100005170(&qword_100058AA8);
  return String.init<A>(describing:)(&v2, v0);
}

uint64_t static NIBLoadableView<>.nibName.getter()
{
  uint64_t v0;
  objc_class *ObjCClassFromMetadata;
  NSString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  _QWORD v12[4];

  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v0);
  v2 = NSStringFromClass(ObjCClassFromMetadata);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v5 = v4;

  v12[2] = v3;
  v12[3] = v5;
  v12[0] = 46;
  v12[1] = 0xE100000000000000;
  v6 = sub_1000042C0();
  v7 = StringProtocol.components<A>(separatedBy:)(v12, &type metadata for String, &type metadata for String, v6, v6);
  swift_bridgeObjectRelease(v5);
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v9 = v7 + 16 * v8;
    v10 = *(_QWORD *)(v9 + 16);
    swift_bridgeObjectRetain(*(_QWORD *)(v9 + 24));
    swift_bridgeObjectRelease(v7);
    return v10;
  }
  else
  {
    result = swift_bridgeObjectRelease(v7);
    __break(1u);
  }
  return result;
}

void UICollectionView.register<A>(_:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t ObjCClassFromMetadata;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  uint64_t v9;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(a2);
  v9 = a2;
  v5 = sub_100005170(&qword_100058AA8);
  String.init<A>(describing:)(&v9, v5);
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v2, "registerClass:forCellWithReuseIdentifier:", ObjCClassFromMetadata, v8);

}

void UICollectionView.register<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t ObjCClassFromMetadata;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSString v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  uint64_t v19;

  v4 = v3;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(a2);
  v8 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  v10 = v9;
  v11 = v8;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  v13 = objc_msgSend((id)objc_opt_self(UINib), "nibWithNibName:bundle:", v12, v11);

  v19 = a2;
  v14 = v13;
  v15 = sub_100005170(&qword_100058AA8);
  String.init<A>(describing:)(&v19, v15);
  v17 = v16;
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  objc_msgSend(v4, "registerNib:forCellWithReuseIdentifier:", v14, v18);

}

id += infix(_:_:)(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "appendAttributedString:", a2);
}

id + infix(_:_:)(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = objc_msgSend(objc_allocWithZone((Class)NSMutableAttributedString), "initWithAttributedString:", a2);
  objc_msgSend(v3, "appendAttributedString:", a2);
  return v3;
}

id + infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  NSString v6;
  id v7;

  v4 = objc_msgSend(objc_allocWithZone((Class)NSMutableAttributedString), "initWithAttributedString:", a1);
  v5 = objc_allocWithZone((Class)NSAttributedString);
  swift_bridgeObjectRetain(a3);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  v7 = objc_msgSend(v5, "initWithString:", v6);

  objc_msgSend(v4, "appendAttributedString:", v7);
  return v4;
}

uint64_t initializeBufferWithCopyOfBuffer for FriendInviteCardErrorView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for FriendInviteCardErrorView(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_release(*(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for FriendInviteCardErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t assignWithCopy for FriendInviteCardErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v6;
  swift_retain(v6);
  swift_release(v8);
  return a1;
}

__n128 initializeWithTake for FriendInviteCardErrorView(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FriendInviteCardErrorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteCardErrorView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteCardErrorView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteCardErrorView()
{
  return &type metadata for FriendInviteCardErrorView;
}

uint64_t sub_100012A5C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100045D84, 1);
}

uint64_t sub_100012A6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t *v55;
  uint64_t v56;
  _BYTE v58[12];
  int v59;
  _BYTE *v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE *v70;
  uint64_t *v71;
  _QWORD v72[2];

  v71 = a2;
  v3 = type metadata accessor for BorderlessButtonStyle(0);
  v65 = *(_QWORD *)(v3 - 8);
  v66 = v3;
  __chkstk_darwin(v3);
  v64 = &v58[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_100005170(&qword_100058FE0);
  v62 = *(_QWORD *)(v5 - 8);
  v63 = v5;
  __chkstk_darwin(v5);
  v61 = &v58[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100005170(&qword_100058FE8);
  v68 = *(_QWORD *)(v7 - 8);
  v69 = v7;
  __chkstk_darwin(v7);
  v60 = &v58[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_100005170(&qword_100058FF0);
  v10 = __chkstk_darwin(v9);
  v70 = &v58[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  v67 = &v58[-v12];
  v13 = *(_QWORD *)(a1 + 8);
  v72[0] = *(_QWORD *)a1;
  v72[1] = v13;
  v14 = sub_1000042C0();
  swift_bridgeObjectRetain(v13);
  v15 = Text.init<A>(_:)(v72, &type metadata for String, v14);
  v35 = v16;
  v18 = v17;
  v20 = v19 & 1;
  v21 = static Font.subheadline.getter();
  v22 = Text.font(_:)(v21, v15, v35, v20, v18);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  swift_release(v21);
  v29 = v26 & 1;
  sub_100004304(v15, v35, v20);
  v30 = swift_bridgeObjectRelease(v18);
  LODWORD(v72[0]) = static HierarchicalShapeStyle.secondary.getter(v30);
  v31 = Text.foregroundStyle<A>(_:)(v72, v22, v24, v29, v28, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
  v33 = v32;
  LODWORD(v35) = v34;
  v37 = v36;
  sub_100004304(v22, v24, v29);
  swift_bridgeObjectRelease(v28);
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v42 = *(_QWORD *)(a1 + 24);
    v43 = *(_QWORD *)(a1 + 32);
    swift_retain(v43);
    v44 = v61;
    v45 = Button.init(action:label:)(v42, v43, sub_100012E48, 0, &type metadata for Text, &protocol witness table for Text);
    v46 = v64;
    BorderlessButtonStyle.init()(v45);
    v47 = sub_1000056BC(&qword_100059000, &qword_100058FE0, (uint64_t)&protocol conformance descriptor for Button<A>);
    v48 = sub_100013024();
    v59 = v35;
    v35 = (uint64_t)v60;
    v49 = v63;
    v50 = v66;
    View.buttonStyle<A>(_:)(v46, v63, v66, v47, v48);
    (*(void (**)(_BYTE *, uint64_t))(v65 + 8))(v46, v50);
    (*(void (**)(_BYTE *, uint64_t))(v62 + 8))(v44, v49);
    v40 = (uint64_t)v67;
    v51 = v68;
    v52 = v35;
    LOBYTE(v35) = v59;
    v53 = v69;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v68 + 32))(v67, v52, v69);
    v38 = 0;
    v41 = v53;
    v39 = v51;
  }
  else
  {
    v38 = 1;
    v40 = (uint64_t)v67;
    v39 = v68;
    v41 = v69;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56))(v40, v38, 1, v41);
  v54 = v70;
  sub_100012F9C(v40, (uint64_t)v70);
  v55 = v71;
  *v71 = v31;
  v55[1] = v33;
  *((_BYTE *)v55 + 16) = v35 & 1;
  v55[3] = v37;
  v56 = sub_100005170(&qword_100058FF8);
  sub_100012F9C((uint64_t)v54, (uint64_t)v55 + *(int *)(v56 + 48));
  sub_1000051F4(v31, v33, v35 & 1);
  swift_bridgeObjectRetain(v37);
  sub_100012FE4(v40);
  sub_100012FE4((uint64_t)v54);
  sub_100004304(v31, v33, v35 & 1);
  return swift_bridgeObjectRelease(v37);
}

uint64_t sub_100012E48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  _QWORD v20[2];

  type metadata accessor for GCUILocalizedStrings(0);
  v20[0] = static GCUILocalizedStrings.RETRY.getter();
  v20[1] = v2;
  v3 = sub_1000042C0();
  v4 = Text.init<A>(_:)(v20, &type metadata for String, v3);
  v6 = v5;
  v8 = v7;
  v10 = v9 & 1;
  v11 = static Color.blue.getter();
  v20[0] = v11;
  v12 = Text.foregroundStyle<A>(_:)(v20, v4, v6, v10, v8, &type metadata for Color, &protocol witness table for Color);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  sub_100004304(v4, v6, v10);
  swift_release(v11);
  result = swift_bridgeObjectRelease(v8);
  *(_QWORD *)a1 = v12;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v16 & 1;
  *(_QWORD *)(a1 + 24) = v18;
  return result;
}

uint64_t sub_100012F3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  __int128 v8;
  uint64_t v9;
  _OWORD v11[2];
  uint64_t v12;

  v8 = *(_OWORD *)(v6 + 16);
  v11[0] = *(_OWORD *)v6;
  v11[1] = v8;
  v12 = *(_QWORD *)(v6 + 32);
  *(_QWORD *)a6 = static HorizontalAlignment.center.getter(a1, a2, a3, a4, a5);
  *(_QWORD *)(a6 + 8) = 0x4020000000000000;
  *(_BYTE *)(a6 + 16) = 0;
  v9 = sub_100005170(&qword_100058FD8);
  return sub_100012A6C((uint64_t)v11, (uint64_t *)(a6 + *(int *)(v9 + 44)));
}

uint64_t sub_100012F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005170(&qword_100058FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012FE4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005170(&qword_100058FF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100013024()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059008;
  if (!qword_100059008)
  {
    v1 = type metadata accessor for BorderlessButtonStyle(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for BorderlessButtonStyle, v1);
    atomic_store(result, (unint64_t *)&qword_100059008);
  }
  return result;
}

uint64_t sub_10001306C()
{
  return sub_1000056BC(&qword_100059010, &qword_100059018, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

BOOL sub_100013098(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000130AC()
{
  unsigned __int8 *v0;
  uint64_t v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

void sub_1000130F0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0 + 1);
}

Swift::Int sub_10001311C(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2 + 1);
  return Hasher._finalize()();
}

uint64_t sub_10001315C@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_10001351C(*a1);
  *a2 = result;
  return result;
}

void sub_100013184(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

void sub_100013194(void (*a1)(id, _QWORD))
{
  uint64_t v1;
  void *v3;
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;

  v3 = (void *)objc_opt_self(GKLocalPlayer);
  v4 = objc_msgSend(v3, "currentLocalPlayer");
  if (v4)
  {
    v12 = v4;
    if (objc_msgSend(v4, "isAuthenticated"))
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)(v1 + 16) = v5;
    if (a1)
    {
      v11 = v12;
      a1(v12, 0);

    }
    else
    {

    }
    return;
  }
  v6 = objc_msgSend(v3, "authenticatedLocalPlayers");
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, (char *)&type metadata for Any + 8);

  if (*(_QWORD *)(v7 + 16))
  {
    sub_100013540(v7 + 32, (uint64_t)&v14);
    swift_bridgeObjectRelease(v7);
    if (*((_QWORD *)&v15 + 1))
    {
      v8 = sub_1000135BC();
      if ((swift_dynamicCast(&v13, &v14, (char *)&type metadata for Any + 8, v8, 6) & 1) != 0)
      {
        v9 = v13;
        *(_BYTE *)(v1 + 16) = 3;
        if (a1)
        {
          v10 = v9;
          a1(v9, 0);

        }
        else
        {

        }
        return;
      }
      goto LABEL_16;
    }
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    swift_bridgeObjectRelease(v7);
  }
  sub_10001357C((uint64_t)&v14);
LABEL_16:
  *(_BYTE *)(v1 + 16) = 0;
  if (a1)
    a1(0, 0);
}

uint64_t sub_100013348()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 17, 7);
}

uint64_t type metadata accessor for LocalPlayerAuthenticator()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension24LocalPlayerAuthenticator);
}

uint64_t getEnumTagSinglePayload for LoadableModel.LoadingState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LocalPlayerAuthenticator.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100013454 + 4 * byte_1000442A5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100013488 + 4 * byte_1000442A0[v4]))();
}

uint64_t sub_100013488(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013490(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100013498);
  return result;
}

uint64_t sub_1000134A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000134ACLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1000134B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000134B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocalPlayerAuthenticator.State()
{
  return &type metadata for LocalPlayerAuthenticator.State;
}

unint64_t sub_1000134D8()
{
  unint64_t result;

  result = qword_1000590F0;
  if (!qword_1000590F0)
  {
    result = swift_getWitnessTable(&unk_100044378, &type metadata for LocalPlayerAuthenticator.State);
    atomic_store(result, (unint64_t *)&qword_1000590F0);
  }
  return result;
}

uint64_t sub_10001351C(unint64_t a1)
{
  if (a1 >= 5)
    return 4;
  else
    return (0x302010004uLL >> (8 * a1));
}

uint64_t sub_100013540(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001357C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005170((uint64_t *)&unk_100059D40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000135BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000590F8;
  if (!qword_1000590F8)
  {
    v1 = objc_opt_self(GKLocalPlayer);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000590F8);
  }
  return result;
}

void sub_1000135F8(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void (*v4)(char *, uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  NSObject **v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t inited;
  _QWORD *v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  NSObject *v30;
  NSObject **v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  NSObject *v39;
  id v40;
  _QWORD *v41;
  void *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD *v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  NSObject **v51;
  uint8_t *v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  void **aBlock;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD *v63;

  v55 = a1;
  v56 = a2;
  v3 = type metadata accessor for Logger(0);
  v4 = *(void (**)(char *, uint64_t))(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v50 - v9;
  static GKLog.friending.getter(v8);
  v11 = v2;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  v14 = os_log_type_enabled(v12, v13);
  v57 = v7;
  if (v14)
  {
    v15 = swift_slowAlloc(22, -1);
    v53 = v4;
    v16 = v15;
    v17 = (NSObject **)swift_slowAlloc(16, -1);
    *(_DWORD *)v16 = 138412546;
    v54 = v3;
    aBlock = (void **)&v11->isa;
    v18 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v59);
    *v17 = v11;

    *(_WORD *)(v16 + 12) = 2112;
    aBlock = (void **)&v18->isa;
    v19 = v18;
    v3 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v59);
    v17[1] = v11;

    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ fetching player information using the playerModel: %@", (uint8_t *)v16, 0x16u);
    v20 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v17, 2, v20);
    swift_slowDealloc(v17, -1, -1);
    v21 = v16;
    v4 = v53;
    swift_slowDealloc(v21, -1, -1);
  }
  else
  {

    v12 = v11;
  }

  v22 = (void (*)(char *, uint64_t))*((_QWORD *)v4 + 1);
  v22(v10, v3);
  v23 = type metadata accessor for LocalPlayerAuthenticator();
  inited = swift_initStaticObject(v23, &unk_100058760);
  v25 = &unk_100059000;
  if (*(_BYTE *)(inited + 16) != 2
    || !*(Class *)((char *)&v11->isa + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player))
  {
    v53 = v22;
    v54 = inited;
    static GKLog.friending.getter(inited);
    v26 = v11;
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v51 = (NSObject **)swift_slowAlloc(8, -1);
      v52 = v29;
      *(_DWORD *)v29 = 138412290;
      aBlock = (void **)&v26->isa;
      v30 = v26;
      v25 = (_QWORD *)&unk_100059000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v59);
      v31 = v51;
      *v51 = v26;

      v32 = v52;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Player was not authenticated or player was nil", v52, 0xCu);
      v33 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v31, 1, v33);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v32, -1, -1);
    }
    else
    {

      v27 = v26;
    }

    v53(v57, v3);
    v34 = *(id *)((char *)&v26->isa + v25[44]);
    objc_msgSend(v34, "setError:", 0);
    v35 = (_QWORD *)swift_allocObject(&unk_100052300, 40, 7);
    v35[2] = v54;
    v35[3] = v26;
    v35[4] = v34;
    v62 = sub_10001B0C8;
    v63 = v35;
    aBlock = _NSConcreteStackBlock;
    v59 = 1107296256;
    v60 = sub_100018414;
    v61 = &unk_100052318;
    v36 = _Block_copy(&aBlock);
    v37 = v25;
    v38 = v63;
    v39 = v26;
    v40 = v34;
    v41 = v38;
    v25 = v37;
    swift_release(v41);
    objc_msgSend(v40, "perform:", v36);
    _Block_release(v36);

  }
  v42 = *(Class *)((char *)&v11->isa + v25[44]);
  v43 = (_QWORD *)swift_allocObject(&unk_100052350, 40, 7);
  v44 = v55;
  v45 = v56;
  v43[2] = v11;
  v43[3] = v44;
  v43[4] = v45;
  v62 = sub_10001B0D8;
  v63 = v43;
  aBlock = _NSConcreteStackBlock;
  v59 = 1107296256;
  v60 = sub_100013AF4;
  v61 = &unk_100052368;
  v46 = _Block_copy(&aBlock);
  v47 = v63;
  v48 = v11;
  v49 = v42;
  swift_retain(v45);
  swift_release(v47);
  objc_msgSend(v49, "notifyOnMainQueueWithBlock:", v46);
  _Block_release(v46);

}

uint64_t sub_100013AF4(uint64_t a1)
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

uint64_t sub_100013B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSString v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSString v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  sub_100005170(&qword_100058CE0);
  __chkstk_darwin();
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8);
  if (!v7)
    goto LABEL_7;
  v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode) & 0xFFFFFFFFFFFFLL;
  if (v8)
  {
    v9 = objc_allocWithZone((Class)GKFriendRequestURLModel);
    swift_bridgeObjectRetain(v7);
    v10 = objc_msgSend(v9, "init");
    v11 = *(_QWORD *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL + 8);
    if (v11)
      v12 = *(_QWORD *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL + 8);
    else
      v12 = 0xE000000000000000;
    swift_bridgeObjectRetain(v11);
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
    objc_msgSend(v10, "setFriendSupportPageURL:", v15);

    v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    objc_msgSend(v10, "setFriendCode:", v16);

    v29 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState);
    dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v18 = v17;
    v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v18);
    objc_msgSend(v10, "setFriendRequestState:", v19);

    v20 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
    objc_msgSend(v10, "setInitiator:", v20);

    v29 = a1;
    dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v22 = v21;
    v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v22);
    objc_msgSend(v10, "setFriendRequestVersion:", v23);

    v24 = objc_msgSend((id)objc_opt_self(NSURL), "_gkGenerateFriendRequestURL:", v10);
    if (v24)
    {
      v25 = v24;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v26 = type metadata accessor for URL(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v6, 0, 1, v26);
    }
    else
    {

      v27 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v6, 1, 1, v27);
    }
    return sub_10001B04C((uint64_t)v6, a2);
  }
  else
  {
LABEL_7:
    v13 = type metadata accessor for URL(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a2, 1, 1, v13);
  }
}

void sub_100013E2C(uint64_t a1, uint64_t a2, int a3, void (*a4)(_QWORD), uint64_t a5)
{
  char *v5;
  char *v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  int v37;
  uint64_t v38;
  _DWORD *v39;
  char *v40;
  uint8_t *v41;
  char *v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  os_log_t v48;
  uint64_t v49;
  char **v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_QWORD);
  uint64_t v54;
  char v55;
  NSString v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  char *v63;
  _QWORD v64[2];
  uint64_t *v65;
  os_log_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char **v71;
  uint64_t ObjectType;
  int v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(_QWORD);
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t aBlock[5];
  uint64_t v81;

  v6 = v5;
  ObjectType = swift_getObjectType(v5);
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void **)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player];
  if (!v16)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000017, 0x80000001000429C0, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 297, 0);
LABEL_17:
    __break(1u);
    return;
  }
  v73 = a3;
  v74 = a1;
  v75 = a2;
  v76 = a4;
  v77 = a5;
  v17 = (void *)objc_opt_self(GKLocalPlayer);
  v18 = v16;
  v78 = objc_msgSend(v17, "local");
  if (!objc_msgSend(v78, "isAuthenticated"))
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000028, 0x8000000100042820, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 299, 0);
    goto LABEL_17;
  }
  v19 = objc_msgSend(v78, "internal");
  v20 = objc_msgSend(v19, "playerID");

  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v23 = v22;

  v24 = objc_msgSend(v18, "internal");
  v25 = objc_msgSend(v24, "playerID");

  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
  v28 = v27;

  if (v21 == v26 && v23 == v28)
  {
    swift_bridgeObjectRelease_n(v23, 2);
LABEL_12:
    v76(0);

    return;
  }
  v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v23, v26, v28, 0);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v28);
  if ((v30 & 1) != 0)
    goto LABEL_12;
  v31 = *(_QWORD *)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8];
  if (!v31)
    goto LABEL_12;
  v32 = *(_QWORD *)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  v33 = swift_bridgeObjectRetain(*(_QWORD *)&v6[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8]);
  static GKLog.friending.getter(v33);
  v34 = v6;
  v35 = Logger.logObject.getter(v34);
  v36 = static os_log_type_t.info.getter();
  v37 = v36;
  if (os_log_type_enabled(v35, v36))
  {
    v38 = swift_slowAlloc(22, -1);
    v69 = v32;
    v39 = (_DWORD *)v38;
    v71 = (char **)swift_slowAlloc(8, -1);
    v68 = swift_slowAlloc(32, -1);
    v79 = (uint64_t)v34;
    aBlock[0] = v68;
    v64[0] = v39;
    *v39 = 138412546;
    v67 = v37;
    v66 = v35;
    v65 = aBlock;
    v40 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, aBlock);
    *v71 = v34;

    v41 = (uint8_t *)v64[0];
    *(_WORD *)(v64[0] + 12) = 2080;
    v64[1] = v41 + 14;
    v42 = v40;
    v43 = objc_msgSend(v42, "description");
    v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
    v70 = v31;
    v46 = v45;

    v79 = sub_10003EE08(v44, v46, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, v65);

    v47 = v46;
    v31 = v70;
    swift_bridgeObjectRelease(v47);
    v48 = v66;
    _os_log_impl((void *)&_mh_execute_header, v66, (os_log_type_t)v67, "%@ ACCEPT friend request for playerModel: %s", v41, 0x16u);
    v49 = sub_100005170((uint64_t *)&unk_100058CB0);
    v50 = v71;
    swift_arrayDestroy(v71, 1, v49);
    swift_slowDealloc(v50, -1, -1);
    v51 = v68;
    swift_arrayDestroy(v68, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v41, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v53 = v76;
  v52 = v77;
  v54 = v75;
  v55 = v73;
  v56 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v31);
  v57 = swift_allocObject(&unk_100052648, 72, 7);
  v58 = v55 & 1;
  *(_BYTE *)(v57 + 16) = v58;
  v59 = v74;
  *(_QWORD *)(v57 + 24) = v34;
  *(_QWORD *)(v57 + 32) = v59;
  *(_QWORD *)(v57 + 40) = v54;
  *(_QWORD *)(v57 + 48) = v53;
  v60 = ObjectType;
  *(_QWORD *)(v57 + 56) = v52;
  *(_QWORD *)(v57 + 64) = v60;
  aBlock[4] = (uint64_t)sub_10001DD20;
  v81 = v57;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100016274;
  aBlock[3] = (uint64_t)&unk_100052660;
  v61 = _Block_copy(aBlock);
  v62 = v81;
  swift_bridgeObjectRetain(v54);
  swift_retain(v52);
  v63 = v34;
  swift_release(v62);
  objc_msgSend(v78, "acceptFriendRequestWithIdentifier:sendPush:handler:", v56, v58, v61);

  _Block_release(v61);
}

void sub_100014404(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t ObjectType;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  char **v38;
  char *v39;
  char *v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSString v51;
  _QWORD *v52;
  void *v53;
  _QWORD *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(_QWORD);
  uint64_t v67;
  char *v68;
  id v69;
  uint64_t v70;
  uint64_t aBlock[5];
  _QWORD *v72;

  v5 = v4;
  ObjectType = swift_getObjectType(v5);
  v11 = type metadata accessor for Logger(0);
  v67 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v68 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void **)&v5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player];
  if (!v13)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000017, 0x80000001000429C0, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 331, 0);
LABEL_18:
    __break(1u);
    return;
  }
  v14 = (void *)objc_opt_self(GKLocalPlayer);
  v15 = v13;
  v69 = objc_msgSend(v14, "local");
  if (!objc_msgSend(v69, "isAuthenticated"))
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000028, 0x8000000100042820, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 333, 0);
    goto LABEL_18;
  }
  if (v5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] > 3u)
  {
LABEL_13:
    a3(0);

    return;
  }
  v63 = v11;
  v64 = ObjectType;
  v65 = a1;
  v66 = a3;
  v62 = a2;
  v16 = objc_msgSend(v69, "internal");
  v17 = objc_msgSend(v16, "playerID");

  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v20 = v19;

  v21 = objc_msgSend(v15, "internal");
  v22 = objc_msgSend(v21, "playerID");

  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  v25 = v24;

  if (v18 == v23 && v20 == v25)
  {
    swift_bridgeObjectRelease_n(v20, 2);
    a3 = v66;
    goto LABEL_13;
  }
  v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v23, v25, 0);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v25);
  v28 = v65;
  a3 = v66;
  v30 = v63;
  v29 = v64;
  if ((v27 & 1) != 0)
    goto LABEL_13;
  v31 = *(_QWORD *)&v5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8];
  if (!v31)
    goto LABEL_13;
  v61 = *(_QWORD *)&v5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  v32 = swift_bridgeObjectRetain(v31);
  v33 = v68;
  static GKLog.friending.getter(v32);
  v34 = v5;
  v35 = Logger.logObject.getter(v34);
  v36 = static os_log_type_t.info.getter();
  v60 = v35;
  v59 = v36;
  if (os_log_type_enabled(v35, v36))
  {
    v37 = swift_slowAlloc(22, -1);
    v38 = (char **)swift_slowAlloc(8, -1);
    v58 = swift_slowAlloc(32, -1);
    v70 = (uint64_t)v34;
    aBlock[0] = v58;
    *(_DWORD *)v37 = 138412546;
    v57 = v31;
    v39 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, aBlock);
    *v38 = v34;

    *(_WORD *)(v37 + 12) = 2080;
    v56 = v37 + 14;
    v40 = v39;
    v41 = objc_msgSend(v40, "description");
    v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
    v44 = v43;

    v45 = v42;
    v28 = v65;
    a3 = v66;
    v70 = sub_10003EE08(v45, v44, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, aBlock);

    v46 = v44;
    v31 = v57;
    swift_bridgeObjectRelease(v46);
    v47 = v60;
    _os_log_impl((void *)&_mh_execute_header, v60, (os_log_type_t)v59, "%@ Reject friend request for playerModel: %s", (uint8_t *)v37, 0x16u);
    v48 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v38, 1, v48);
    swift_slowDealloc(v38, -1, -1);
    v49 = v58;
    swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v49, -1, -1);
    v29 = v64;
    swift_slowDealloc(v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v63);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v67 + 8))(v33, v30);
  }
  v50 = v62;
  v51 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v31);
  v52 = (_QWORD *)swift_allocObject(&unk_1000525D0, 64, 7);
  v52[2] = v34;
  v52[3] = v28;
  v52[4] = v50;
  v52[5] = a3;
  v52[6] = a4;
  v52[7] = v29;
  aBlock[4] = (uint64_t)sub_10001DC90;
  v72 = v52;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100016274;
  aBlock[3] = (uint64_t)&unk_1000525E8;
  v53 = _Block_copy(aBlock);
  v54 = v72;
  swift_bridgeObjectRetain(v50);
  swift_retain(a4);
  v55 = v34;
  swift_release(v54);
  objc_msgSend(v69, "rejectFriendRequestWithIdentifier:handler:", v51, v53);

  _Block_release(v53);
}

unint64_t sub_1000149F4@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001AFD0(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_100014A1C@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001AFE0(*a1);
  *a2 = result;
  return result;
}

void sub_100014A44(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void sub_100014A50(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100014A80()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  uint64_t countAndFlagsBits;
  Swift::String v5;

  v0 = (id)((uint64_t (*)(void))GKGameCenterUIFrameworkBundle)();
  v1._countAndFlagsBits = 0xD00000000000002ELL;
  v5._object = (void *)0xE000000000000000;
  v1._object = (void *)0x80000001000420C0;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v5._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v5)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100014C1C()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  char v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t *v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v16;
  _OWORD v17[2];
  __int128 v18;

  v1 = v0;
  *(_QWORD *)&v17[0] = 0;
  *((_QWORD *)&v17[0] + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(148);
  v18 = v17[0];
  v2._countAndFlagsBits = 0x6F43646E65697266;
  v2._object = (void *)0xEC000000203A6564;
  String.append(_:)(v2);
  v17[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode);
  v3 = sub_100005170(&qword_1000591D8);
  _print_unlocked<A, B>(_:_:)(v17, &v18, v3, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v4._countAndFlagsBits = 0xD00000000000001ALL;
  v4._object = (void *)0x8000000100042AF0;
  String.append(_:)(v4);
  v17[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL);
  _print_unlocked<A, B>(_:_:)(v17, &v18, v3, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v5._countAndFlagsBits = 0xD000000000000014;
  v5._object = (void *)0x8000000100042B10;
  String.append(_:)(v5);
  v17[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname);
  _print_unlocked<A, B>(_:_:)(v17, &v18, v3, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v6._countAndFlagsBits = 0xD000000000000019;
  v6._object = (void *)0x8000000100042B30;
  String.append(_:)(v6);
  v7 = *(_BYTE *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount + 8);
  *(_QWORD *)&v17[0] = *(_QWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount);
  BYTE8(v17[0]) = v7;
  v8 = sub_100005170(&qword_100059270);
  _print_unlocked<A, B>(_:_:)(v17, &v18, v8, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v9._countAndFlagsBits = 0xD000000000000015;
  v9._object = (void *)0x8000000100042B50;
  String.append(_:)(v9);
  v10 = (uint64_t *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs);
  swift_beginAccess(v10, v17, 0, 0);
  v16 = *v10;
  v11 = sub_100005170(&qword_100059278);
  _print_unlocked<A, B>(_:_:)(&v16, &v18, v11, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v12._object = (void *)0xEC000000203A7265;
  v12._countAndFlagsBits = 0x79616C70200A202CLL;
  String.append(_:)(v12);
  v16 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
  v13 = sub_100005170(&qword_100059280);
  _print_unlocked<A, B>(_:_:)(&v16, &v18, v13, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v14._object = (void *)0x8000000100042B70;
  v14._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v14);
  v16 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer);
  _print_unlocked<A, B>(_:_:)(&v16, &v18, v13, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  return v18;
}

uint64_t sub_100014EE0(char a1)
{
  return qword_100044720[a1];
}

uint64_t *sub_100014F00@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

id sub_100014F18(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  id v22;
  NSString v23;
  id v24;
  uint64_t v25;
  objc_super v27;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t *)&v2[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_senderFriendRequestIdentifier];
  v11 = v2;
  v12 = UUID.init()();
  v13 = UUID.uuidString.getter(v12);
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *v10 = v13;
  v10[1] = v15;
  v16 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = 0;
  v17 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v19 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v20 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount];
  *(_QWORD *)v20 = 0;
  v20[8] = 1;
  *(_QWORD *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer] = 0;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState] = 2;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = 0;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 0;
  v21 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup;
  v22 = objc_allocWithZone((Class)GKDispatchGroup);
  v23 = String._bridgeToObjectiveC()();
  v24 = objc_msgSend(v22, "initWithName:", v23);

  *(_QWORD *)&v11[v21] = v24;
  v25 = *((_QWORD *)v17 + 1);
  *(_QWORD *)v17 = a1;
  *((_QWORD *)v17 + 1) = a2;

  swift_bridgeObjectRelease(v25);
  v27.receiver = v11;
  v27.super_class = ObjectType;
  return objc_msgSendSuper2(&v27, "init");
}

id sub_10001510C(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  id v22;
  NSString v23;
  id v24;
  uint64_t v25;
  objc_super v27;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t *)&v2[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_senderFriendRequestIdentifier];
  v11 = v2;
  v12 = UUID.init()();
  v13 = UUID.uuidString.getter(v12);
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *v10 = v13;
  v10[1] = v15;
  v16 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = 0;
  v17 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v19 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname];
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = 0;
  v20 = &v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount];
  *(_QWORD *)v20 = 0;
  v20[8] = 1;
  *(_QWORD *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer] = 0;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState] = 2;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = 0;
  v11[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 0;
  v21 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup;
  v22 = objc_allocWithZone((Class)GKDispatchGroup);
  v23 = String._bridgeToObjectiveC()();
  v24 = objc_msgSend(v22, "initWithName:", v23);

  *(_QWORD *)&v11[v21] = v24;
  v25 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v16 = a1;
  *((_QWORD *)v16 + 1) = a2;

  swift_bridgeObjectRelease(v25);
  v27.receiver = v11;
  v27.super_class = ObjectType;
  return objc_msgSendSuper2(&v27, "init");
}

uint64_t sub_100015300(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(result, a2);
      v7 = (uint64_t)sub_100019250(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_10001916C(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease(a2);
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

uint64_t sub_10001554C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t))
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  char v21;
  _BYTE v23[24];

  if (!a6)
  {
    v14 = (_QWORD *)(a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID);
    v15 = *(_QWORD *)(a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8);
    *v14 = a1;
    v14[1] = a2;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRelease(v15);
    v16 = (uint64_t *)(a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs);
    swift_beginAccess(a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs, v23, 1, 0);
    v17 = *v16;
    *v16 = a3;
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRelease(v17);
    if (a4)
    {
      v18 = objc_msgSend(a4, "integerValue");
      v19 = a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount;
      *(_QWORD *)v19 = v18;
      *(_BYTE *)(v19 + 8) = 0;
    }
    v20 = objc_msgSend(a5, "integerValue");
    if ((unint64_t)v20 >= 6)
      v21 = 5;
    else
      v21 = (char)v20;
    *(_BYTE *)(a7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState) = v21;
  }
  return a8(a6);
}

uint64_t sub_10001565C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, void *, id, void *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v9 = a3;
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, void *, id, void *))(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (!a2)
  {
    v12 = 0;
    v14 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v14 = v13;
  if (v9)
LABEL_3:
    v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, &type metadata for String);
LABEL_4:
  swift_retain(v10);
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v11(v12, v14, v9, a4, v16, a6);
  swift_release(v10);

  swift_bridgeObjectRelease(v9);
  return swift_bridgeObjectRelease(v14);
}

uint64_t sub_100015744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t))
{
  char v10;
  uint64_t *v11;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  if (a5)
  {
    v10 = 3;
    v11 = &OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType;
LABEL_5:
    *(_BYTE *)(a6 + *v11) = v10;
    return a7(a5);
  }
  if (a2)
  {
    v14 = (_QWORD *)(a6 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode);
    v15 = *(_QWORD *)(a6 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8);
    *v14 = a1;
    v14[1] = a2;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRelease(v15);
    v16 = (_QWORD *)(a6 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL);
    v17 = *(_QWORD *)(a6 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL + 8);
    *v16 = a3;
    v16[1] = a4;
    swift_bridgeObjectRetain(a4);
    swift_bridgeObjectRelease(v17);
    v10 = 1;
    v11 = &OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
    goto LABEL_5;
  }
  return a7(a5);
}

uint64_t sub_100015808(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (!a2)
  {
    v8 = 0;
    v10 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v10 = v9;
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v5 = v12;
LABEL_6:
  swift_retain(v6);
  v13 = a4;
  v7(v8, v10, v11, v5, a4);
  swift_release(v6);

  swift_bridgeObjectRelease(v5);
  return swift_bridgeObjectRelease(v10);
}

uint64_t sub_1000158C0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD *v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v28;
  _BYTE v29[24];

  if (!a1)
  {
    if ((a2 & 1) != 0)
    {
      v11 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
      v12 = objc_msgSend(v11, "internal");

      v13 = objc_msgSend(v12, "playerID");
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      v16 = v15;

      v17 = (uint64_t *)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs);
      swift_beginAccess(v17, v29, 33, 0);
      v18 = (_QWORD *)*v17;
      if (*v17)
      {
        v28 = v16;
        swift_bridgeObjectRetain(v16);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v18);
        *v17 = (uint64_t)v18;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v18 = sub_100018FB0(0, v18[2] + 1, 1, v18);
          *v17 = (uint64_t)v18;
        }
        v21 = v18[2];
        v20 = v18[3];
        if (v21 >= v20 >> 1)
        {
          v18 = sub_100018FB0((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
          *v17 = (uint64_t)v18;
        }
        v18[2] = v21 + 1;
        v22 = &v18[2 * v21];
        v22[4] = v14;
        v22[5] = v28;
        swift_endAccess(v29);
        v23 = v28;
      }
      else
      {
        swift_endAccess(v29);
        v24 = sub_100005170(&qword_1000591B0);
        v25 = swift_allocObject(v24, 48, 7);
        *(_OWORD *)(v25 + 16) = xmmword_100044020;
        *(_QWORD *)(v25 + 32) = v14;
        *(_QWORD *)(v25 + 40) = v16;
        v26 = (_QWORD *)*v17;
        *v17 = v25;
        v23 = v26;
      }
      swift_bridgeObjectRelease(v23);
    }
    else
    {
      *(_BYTE *)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState) = 2;
      *(_BYTE *)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState) = 0;
    }
    sub_100015ACC(a4, a5);
  }
  return a6(a1);
}

void sub_100015ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  NSString v13;
  id v14;
  id v15;
  Class isa;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  SEL *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  NSString v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id aBlock[6];

  v3 = v2;
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)v61 - v10;
  if (!a2)
    return;
  v12 = (void *)objc_opt_self(GKMessageUtilities);
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v12, "predicateWithPhoneNumberOrEmail:", v13);

  if (!v14)
    return;
  v15 = objc_msgSend(objc_allocWithZone((Class)CNContactStore), "init");
  if (qword_100058740 != -1)
    swift_once(&qword_100058740, sub_1000162C8);
  sub_100005170(&qword_1000591F0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  aBlock[0] = 0;
  v17 = objc_msgSend(v15, "unifiedContactsMatchingPredicate:keysToFetch:error:", v14, isa, aBlock);

  v18 = aBlock[0];
  if (!v17)
  {
    v36 = v15;
    v37 = aBlock[0];
    v38 = _convertNSErrorToError(_:)(v18);

    swift_willThrow();
    static GKLog.friending.getter(v39);
    swift_errorRetain(v38);
    v40 = swift_errorRetain(v38);
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc(32, -1);
      v44 = swift_slowAlloc(8, -1);
      v63 = v5;
      v45 = (_QWORD *)v44;
      v66 = (id)swift_slowAlloc(64, -1);
      aBlock[0] = v66;
      *(_DWORD *)v43 = 136315650;
      v46 = _typeName(_:qualified:)(v3, 0);
      v48 = v47;
      v67 = sub_10003EE08(v46, v47, (uint64_t *)aBlock);
      v64 = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68);
      swift_bridgeObjectRelease(v48);
      *(_WORD *)(v43 + 12) = 2080;
      v67 = sub_10003EE08(0xD000000000000019, 0x8000000100042A00, (uint64_t *)aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68);
      *(_WORD *)(v43 + 22) = 2112;
      swift_errorRetain(v38);
      v49 = _swift_stdlib_bridgeErrorToNSError(v38);
      v67 = v49;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68);
      *v45 = v49;
      swift_errorRelease(v38);
      swift_errorRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "%s %s - Error fetching contacts: %@", (uint8_t *)v43, 0x20u);
      v50 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v45, 1, v50);
      swift_slowDealloc(v45, -1, -1);
      v51 = v66;
      swift_arrayDestroy(v66, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1, -1);
      swift_slowDealloc(v43, -1, -1);

      swift_errorRelease(v38);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v63);
    }
    else
    {

      swift_errorRelease(v38);
      swift_errorRelease(v38);
      swift_errorRelease(v38);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    return;
  }
  v19 = sub_1000105F0(0, &qword_1000591F8, CNContact_ptr);
  v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v17, v19);
  v21 = v18;

  if ((unint64_t)v20 >> 62)
  {
    if (v20 < 0)
      v59 = v20;
    else
      v59 = v20 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v20);
    v60 = _CocoaArrayWrapper.endIndex.getter(v59);
    swift_bridgeObjectRelease(v20);
    if (v60 >= 1)
      goto LABEL_8;
LABEL_24:
    swift_bridgeObjectRelease(v20);

    return;
  }
  if (*(uint64_t *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10) < 1)
    goto LABEL_24;
LABEL_8:
  if ((v20 & 0xC000000000000001) != 0)
  {
    v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v20);
  }
  else
  {
    if (!*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v22 = *(id *)(v20 + 32);
  }
  v23 = v22;
  v65 = v15;
  v24 = swift_bridgeObjectRelease(v20);
  static GKLog.trace.getter(v24);
  v66 = v23;
  v25 = Logger.logObject.getter(v66);
  v26 = static os_log_type_t.info.getter();
  v27 = (SEL *)&unk_100056000;
  if (os_log_type_enabled(v25, v26))
  {
    v28 = swift_slowAlloc(22, -1);
    v62 = (void *)swift_slowAlloc(64, -1);
    aBlock[0] = v62;
    *(_DWORD *)v28 = 136315394;
    v63 = v5;
    v67 = sub_10003EE08(0xD000000000000019, 0x8000000100042A00, (uint64_t *)aBlock);
    v64 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68);
    *(_WORD *)(v28 + 12) = 2080;
    v61[1] = v28 + 14;
    v29 = v66;
    v30 = objc_msgSend(v66, "identifier");
    v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
    v33 = v32;

    v67 = sub_10003EE08(v31, v33, (uint64_t *)aBlock);
    v14 = v64;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68);

    v34 = v33;
    v27 = (SEL *)&unk_100056000;
    swift_bridgeObjectRelease(v34);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s - Adding %s to the deny list.", (uint8_t *)v28, 0x16u);
    v35 = v62;
    swift_arrayDestroy(v62, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v63);
  }
  else
  {

    v52 = v66;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  v53 = objc_msgSend((id)objc_opt_self(GKDaemonProxy), "proxyForLocalPlayer");
  v54 = objc_msgSend(v53, "utilityServicePrivate");

  v55 = objc_msgSend(v66, v27[492]);
  if (!v55)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v57 = v56;
    v55 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v57);
  }
  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_100016274;
  aBlock[3] = &unk_100052610;
  v58 = _Block_copy(aBlock);
  objc_msgSend(v54, "denyContact:handler:", v55, v58);

  _Block_release(v58);
  swift_unknownObjectRelease(v54);

}

void sub_100016274(uint64_t a1, void *a2)
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

uint64_t sub_1000162C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  NSString v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSString v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSString v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSString v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSString v25;
  id v26;
  uint64_t result;

  v0 = sub_100005170(&qword_100059200);
  v1 = swift_allocObject(v0, 80, 7);
  *(_OWORD *)(v1 + 16) = xmmword_1000443C0;
  *(_QWORD *)(v1 + 32) = objc_msgSend((id)objc_opt_self(CNContactFormatter), "descriptorForRequiredKeysForStyle:", 0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(CNContactImageDataKey);
  v3 = v2;
  v4 = objc_allocWithZone((Class)NSString);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "initWithString:", v5);

  *(_QWORD *)(v1 + 40) = v6;
  static String._unconditionallyBridgeFromObjectiveC(_:)(CNContactPhoneNumbersKey);
  v8 = v7;
  v9 = objc_allocWithZone((Class)NSString);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  v11 = objc_msgSend(v9, "initWithString:", v10);

  *(_QWORD *)(v1 + 48) = v11;
  static String._unconditionallyBridgeFromObjectiveC(_:)(CNContactEmailAddressesKey);
  v13 = v12;
  v14 = objc_allocWithZone((Class)NSString);
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  v16 = objc_msgSend(v14, "initWithString:", v15);

  *(_QWORD *)(v1 + 56) = v16;
  static String._unconditionallyBridgeFromObjectiveC(_:)(CNContactThumbnailImageDataKey);
  v18 = v17;
  v19 = objc_allocWithZone((Class)NSString);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  v21 = objc_msgSend(v19, "initWithString:", v20);

  *(_QWORD *)(v1 + 64) = v21;
  static String._unconditionallyBridgeFromObjectiveC(_:)(CNContactImageDataAvailableKey);
  v23 = v22;
  v24 = objc_allocWithZone((Class)NSString);
  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  v26 = objc_msgSend(v24, "initWithString:", v25);

  *(_QWORD *)(v1 + 72) = v26;
  result = specialized Array._endMutation()();
  qword_10005C228 = v1;
  return result;
}

uint64_t sub_100016520(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  _QWORD *v9;
  id v10;
  id v11;

  v9 = (_QWORD *)swift_allocObject(&unk_1000523C8, 48, 7);
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = a1;
  v9[5] = a2;
  v10 = a4;
  v11 = a5;
  swift_retain(a2);
  sub_100013194((void (*)(id, _QWORD))sub_10001B118);
  return swift_release(v9);
}

void sub_1000165A4(void **a1, uint64_t a2, void *a3, void *a4, void (*a5)(void), NSObject *a6)
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
  char *v19;
  id v20;
  void **v21;
  char *v22;
  void **v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void **v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  id v60;
  char *v61;
  void **v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  void ***v66;
  void **v67;
  uint64_t v68;
  void **v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  void ***v73;
  void **v74;
  uint64_t v75;
  void (*v76)(void);
  uint64_t v77;
  id v78;
  char *v79;
  char *v80;
  NSObject *v81;
  uint64_t v82;
  char v83;
  char *v84;
  void *v85;
  char **v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned __int8 *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  NSObject *v102;
  os_log_type_t v103;
  int v104;
  uint64_t v105;
  char *v106;
  char **v107;
  uint64_t v108;
  void **v109;
  char *v110;
  id v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  Class isa;
  _QWORD *v116;
  NSObject *v117;
  void *v118;
  _QWORD *v119;
  char *v120;
  id v121;
  uint64_t v122;
  os_log_t v123;
  int v124;
  void **v125;
  char *v126;
  char *v127;
  char *v128;
  void (*v129)(void);
  char **v130;
  uint64_t v131;
  char *v132;
  NSObject *v133;
  void **v134;
  id v135;
  uint64_t v136;
  void **aBlock;
  _QWORD v138[4];
  _QWORD *v139;

  v133 = a6;
  v135 = a4;
  v10 = type metadata accessor for Logger(0);
  v134 = *(void ***)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v128 = (char *)&v122 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v127 = (char *)&v122 - v14;
  v15 = __chkstk_darwin(v13);
  v126 = (char *)&v122 - v16;
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v122 - v18;
  static GKLog.friending.getter(v17);
  v20 = a3;
  v21 = a1;
  swift_errorRetain(a2);
  v22 = (char *)v20;
  v23 = v21;
  v24 = swift_errorRetain(a2);
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.info.getter();
  v27 = v26;
  v28 = os_log_type_enabled(v25, v26);
  v132 = v22;
  if (v28)
  {
    v29 = swift_slowAlloc(32, -1);
    v129 = a5;
    v30 = v29;
    v31 = (_QWORD *)swift_slowAlloc(8, -1);
    v125 = (void **)swift_slowAlloc(64, -1);
    v136 = (uint64_t)v22;
    aBlock = v125;
    *(_DWORD *)v30 = 138412802;
    v123 = v25;
    v124 = v27;
    v130 = (char **)v23;
    v32 = v22;
    v131 = v10;
    v33 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v136, &aBlock);
    *v31 = v22;

    *(_WORD *)(v30 + 12) = 2080;
    v136 = (uint64_t)a1;
    v34 = sub_100005170(&qword_1000591B8);
    v35 = Optional.nonNilDescription.getter(v34);
    v37 = v36;
    v136 = sub_10003EE08(v35, v36, (uint64_t *)&aBlock);
    v23 = (void **)v130;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v136, &aBlock);

    swift_bridgeObjectRelease(v37);
    *(_WORD *)(v30 + 22) = 2080;
    v136 = a2;
    v38 = sub_100005170((uint64_t *)&unk_1000591C0);
    v39 = Optional.nonNilDescription.getter(v38);
    v41 = v40;
    v136 = sub_10003EE08(v39, v40, (uint64_t *)&aBlock);
    v10 = v131;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v136, &aBlock);
    swift_bridgeObjectRelease(v41);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    v25 = v123;
    _os_log_impl((void *)&_mh_execute_header, v123, (os_log_type_t)v124, "%@ authCompleted: %s error: %s)", (uint8_t *)v30, 0x20u);
    v42 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v31, 1, v42);
    swift_slowDealloc(v31, -1, -1);
    v43 = v125;
    swift_arrayDestroy(v125, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1, -1);
    v44 = v30;
    a5 = v129;
    swift_slowDealloc(v44, -1, -1);
  }
  else
  {

    swift_errorRelease(a2);
    swift_errorRelease(a2);
  }

  v45 = (void (*)(char *, uint64_t))v134[1];
  v45(v19, v10);
  v46 = v135;
  if (a2)
  {
    v47 = (void *)_convertErrorToNSError(_:)(a2);
    objc_msgSend(v46, "setError:", v47);

LABEL_7:
    a5();
    return;
  }
  v131 = v10;
  objc_msgSend(v135, "setError:", 0);
  v48 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
  if (*(_QWORD *)&v132[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player])
    goto LABEL_7;
  v129 = a5;
  v130 = (char **)v23;
  v49 = (uint64_t *)&v132[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  v50 = *(_QWORD *)&v132[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8];
  if (!a1)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&v132[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8]);
    v56 = v50;
    if (!v50)
      goto LABEL_32;
    goto LABEL_19;
  }
  v134 = a1;
  v51 = *v49;
  swift_bridgeObjectRetain(v50);
  v52 = objc_msgSend(v130, "internal");
  v53 = objc_msgSend(v52, "playerID");

  v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v53);
  v56 = v55;

  if (!v50)
  {
    a1 = v134;
    if (!v56)
      goto LABEL_32;
    goto LABEL_19;
  }
  if (!v56)
  {
    v56 = v50;
LABEL_19:
    v57 = swift_bridgeObjectRelease(v56);
    goto LABEL_20;
  }
  if (v51 == v54 && v50 == v56)
  {
    swift_bridgeObjectRelease(v50);
    swift_bridgeObjectRelease(v56);
    a1 = v134;
LABEL_32:
    v84 = v132;
    v85 = *(void **)&v132[v48];
    *(_QWORD *)&v132[v48] = a1;
    v86 = v130;

    v87 = *(void **)&v84[v48];
    if (v87)
    {
      v88 = objc_msgSend(v87, "internal");
      v89 = objc_msgSend(v88, "playerID");

      v90 = static String._unconditionallyBridgeFromObjectiveC(_:)(v89);
      v92 = v91;

    }
    else
    {
      v90 = 0;
      v92 = 0;
    }
    v93 = v49[1];
    *v49 = v90;
    v49[1] = v92;

    v94 = swift_bridgeObjectRelease(v93);
    ((void (*)(uint64_t))v129)(v94);
    return;
  }
  v83 = _stringCompareWithSmolCheck(_:_:expecting:)(v51, v50, v54, v56, 0);
  swift_bridgeObjectRelease(v50);
  v57 = swift_bridgeObjectRelease(v56);
  a1 = v134;
  if ((v83 & 1) != 0)
    goto LABEL_32;
LABEL_20:
  v58 = v49[1];
  if (!v58
    || (v59 = *v49, *v49 == 0x496E776F6E6B6E55) && v58 == 0xE900000000000044
    || (v57 = _stringCompareWithSmolCheck(_:_:expecting:)(*v49, v49[1], 0x496E776F6E6B6E55, 0xE900000000000044, 0),
        (v57 & 1) != 0))
  {
    v60 = v132;
    if (*(_QWORD *)&v132[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8])
    {
      v61 = v128;
      static GKLog.friending.getter(v57);
      v62 = (void **)v60;
      v63 = Logger.logObject.getter(v62);
      v64 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v63, v64))
      {
        v65 = (uint8_t *)swift_slowAlloc(12, -1);
        v66 = (void ***)swift_slowAlloc(8, -1);
        *(_DWORD *)v65 = 138412290;
        aBlock = v62;
        v67 = v62;
        v61 = v128;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v138);
        *v66 = v62;

        _os_log_impl((void *)&_mh_execute_header, v63, v64, "%@ We have a non nil friend code, fetching sender playerID", v65, 0xCu);
        v68 = sub_100005170((uint64_t *)&unk_100058CB0);
        swift_arrayDestroy(v66, 1, v68);
        swift_slowDealloc(v66, -1, -1);
        swift_slowDealloc(v65, -1, -1);
      }
      else
      {

        v63 = v62;
      }
      v76 = v129;
      v77 = v131;
      v78 = v135;

      v45(v61, v77);
      v79 = v62;
      v80 = (char *)v78;
      v81 = v133;
      swift_retain(v133);
      sub_10001D3AC(v79, v80, v79, (uint64_t (*)(_QWORD))v76, v81);

      v82 = (uint64_t)v81;
    }
    else
    {
      static GKLog.friending.getter(v57);
      v69 = (void **)v60;
      v70 = Logger.logObject.getter(v69);
      v71 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc(12, -1);
        v73 = (void ***)swift_slowAlloc(8, -1);
        *(_DWORD *)v72 = 138412290;
        aBlock = v69;
        v74 = v69;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v138);
        *v73 = v69;

        _os_log_impl((void *)&_mh_execute_header, v70, v71, "%@ Creating a new friend request", v72, 0xCu);
        v75 = sub_100005170((uint64_t *)&unk_100058CB0);
        swift_arrayDestroy(v73, 1, v75);
        swift_slowDealloc(v73, -1, -1);
        swift_slowDealloc(v72, -1, -1);
      }
      else
      {

        v70 = v69;
      }
      v95 = v131;

      v45(v127, v95);
      v96 = v69;
      v97 = (uint64_t)v133;
      swift_retain(v133);
      sub_10001AB04(v96, v96, (uint64_t)v129, v97);

      v82 = v97;
    }
    swift_release(v82);
  }
  else
  {
    v98 = swift_bridgeObjectRetain(v58);
    v99 = v126;
    static GKLog.friending.getter(v98);
    v100 = v132;
    swift_bridgeObjectRetain_n(v58, 2);
    v101 = v100;
    v102 = Logger.logObject.getter(v101);
    v103 = static os_log_type_t.info.getter();
    v104 = v103;
    if (os_log_type_enabled(v102, v103))
    {
      v105 = swift_slowAlloc(22, -1);
      v130 = (char **)swift_slowAlloc(8, -1);
      v134 = (void **)swift_slowAlloc(32, -1);
      v136 = (uint64_t)v101;
      aBlock = v134;
      *(_DWORD *)v105 = 138412546;
      LODWORD(v132) = v104;
      v106 = v101;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v136, &aBlock);
      v107 = v130;
      *v130 = v101;

      *(_WORD *)(v105 + 12) = 2080;
      swift_bridgeObjectRetain(v58);
      v136 = sub_10003EE08(v59, v58, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v136, &aBlock);
      swift_bridgeObjectRelease_n(v58, 3);
      _os_log_impl((void *)&_mh_execute_header, v102, (os_log_type_t)v132, "%@ loading playerID: %s", (uint8_t *)v105, 0x16u);
      v108 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v107, 1, v108);
      swift_slowDealloc(v107, -1, -1);
      v109 = v134;
      swift_arrayDestroy(v134, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v109, -1, -1);
      swift_slowDealloc(v105, -1, -1);

      v110 = v126;
    }
    else
    {

      swift_bridgeObjectRelease_n(v58, 2);
      v110 = v99;
    }
    v45(v110, v131);
    v111 = v135;
    v112 = (void *)objc_opt_self(GKPlayer);
    v113 = sub_100005170(&qword_1000591B0);
    v114 = swift_allocObject(v113, 48, 7);
    *(_OWORD *)(v114 + 16) = xmmword_100044020;
    *(_QWORD *)(v114 + 32) = v59;
    *(_QWORD *)(v114 + 40) = v58;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v114);
    v116 = (_QWORD *)swift_allocObject(&unk_1000523F0, 48, 7);
    v116[2] = v101;
    v116[3] = v111;
    v117 = v133;
    v116[4] = v129;
    v116[5] = v117;
    v138[3] = sub_10001DA4C;
    v139 = v116;
    aBlock = _NSConcreteStackBlock;
    v138[0] = 1107296256;
    v138[1] = sub_1000175AC;
    v138[2] = &unk_100052408;
    v118 = _Block_copy(&aBlock);
    v119 = v139;
    v120 = v101;
    v121 = v111;
    swift_retain(v117);
    swift_release(v119);
    objc_msgSend(v112, "loadPlayersForIdentifiers:withCompletionHandler:", isa, v118);
    _Block_release(v118);

  }
}

void sub_100017154(uint64_t a1, uint64_t a2, void *a3, void *a4, void (*a5)(_QWORD))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  os_log_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  os_log_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void (*v57)(_QWORD);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v10 = type metadata accessor for Logger(0);
  v58 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v11);
  v14 = a3;
  swift_bridgeObjectRetain(a1);
  swift_errorRetain(a2);
  v15 = (char *)v14;
  swift_bridgeObjectRetain(a1);
  v16 = swift_errorRetain(a2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.info.getter();
  v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    v20 = swift_slowAlloc(32, -1);
    v52 = v17;
    v21 = v20;
    v22 = swift_slowAlloc(8, -1);
    v53 = v13;
    v23 = (_QWORD *)v22;
    v54 = swift_slowAlloc(64, -1);
    v59 = (uint64_t)v15;
    v60 = v54;
    *(_DWORD *)v21 = 138412802;
    HIDWORD(v51) = v19;
    v56 = a4;
    v57 = a5;
    v24 = v15;
    v55 = v10;
    v25 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
    *v23 = v15;

    *(_WORD *)(v21 + 12) = 2080;
    v59 = a1;
    v26 = sub_100005170(&qword_1000591D0);
    v27 = Optional.nonNilDescription.getter(v26);
    v29 = v28;
    v59 = sub_10003EE08(v27, v28, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v29);
    *(_WORD *)(v21 + 22) = 2080;
    v59 = a2;
    v30 = sub_100005170((uint64_t *)&unk_1000591C0);
    v31 = Optional.nonNilDescription.getter(v30);
    v33 = v32;
    v59 = sub_10003EE08(v31, v32, &v60);
    a4 = v56;
    a5 = v57;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
    swift_bridgeObjectRelease(v33);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    v34 = v52;
    _os_log_impl((void *)&_mh_execute_header, v52, BYTE4(v51), "%@ players: %s error:%s", (uint8_t *)v21, 0x20u);
    v35 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v23, 1, v35);
    swift_slowDealloc(v23, -1, -1);
    v36 = v54;
    swift_arrayDestroy(v54, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v58 + 8))(v53, v55);
    if (a2)
    {
LABEL_3:
      v37 = (void *)_convertErrorToNSError(_:)(a2);
      goto LABEL_6;
    }
  }
  else
  {
    swift_bridgeObjectRelease_n(a1, 2);

    swift_errorRelease(a2);
    swift_errorRelease(a2);

    (*(void (**)(char *, uint64_t))(v58 + 8))(v13, v10);
    if (a2)
      goto LABEL_3;
  }
  v37 = 0;
LABEL_6:
  objc_msgSend(a4, "setError:", v37);

  if (a1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
    }
    else
    {
      if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      v38 = *(id *)(a1 + 32);
    }
  }
  else
  {
    v38 = objc_msgSend((id)objc_opt_self(GKPlayer), "unknownPlayer");
  }
  v39 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
  v40 = *(void **)&v15[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player];
  *(_QWORD *)&v15[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = v38;
  v41 = v38;

  v42 = *(void **)&v15[v39];
  if (v42)
  {
    v43 = objc_msgSend(v42, "internal");
    v44 = objc_msgSend(v43, "playerID");

    v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
    v47 = v46;

  }
  else
  {
    v45 = 0;
    v47 = 0;
  }
  v48 = (uint64_t *)&v15[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  v49 = *(_QWORD *)&v15[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8];
  *v48 = v45;
  v48[1] = v47;

  v50 = swift_bridgeObjectRelease(v49);
  a5(v50);
}

uint64_t sub_1000175AC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  uint64_t v7;
  id v8;

  v4 = a2;
  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v7 = sub_1000105F0(0, (unint64_t *)&qword_100058CE8, GKPlayer_ptr);
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }
  swift_retain(v5);
  v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_100017638(void **a1, void *a2, char *a3, uint64_t (*a4)(_QWORD), uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  BOOL v33;
  uint8_t *v34;
  void **v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  NSObject *v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint8_t *v44;
  NSObject **v45;
  void **v46;
  uint64_t v47;
  void (**v48)(char *, uint64_t);
  char *v49;
  void (**v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  void **v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  void ***v57;
  void **v58;
  void **v59;
  uint64_t v60;
  void ***v61;
  uint64_t (*v62)(uint64_t);
  uint64_t v63;
  char *v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  void *v77;
  _QWORD *v78;
  char *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  void **p_isa;
  uint64_t (*v91)(_QWORD);
  uint64_t v92;
  char *v93;
  void (**v94)(char *, uint64_t);
  void **aBlock;
  _QWORD v96[4];
  _QWORD *v97;
  void *v98;
  uint64_t v99;

  v10 = type metadata accessor for Logger(0);
  v94 = *(void (***)(char *, uint64_t))(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v88 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v88 - v15;
  v93 = v17;
  if (a1)
    v18 = (void *)_convertErrorToNSError(_:)(a1);
  else
    v18 = 0;
  objc_msgSend(a2, "setError:", v18);

  v20 = (uint64_t *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  v21 = *(_QWORD *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8];
  if (!v21)
  {
    v93 = a3;
    v91 = a4;
    static GKLog.general.getter(v19);
    swift_errorRetain(a1);
    v30 = swift_errorRetain(a1);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.error.getter();
    v33 = os_log_type_enabled(v31, v32);
    v92 = a5;
    if (v33)
    {
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      v35 = (void **)swift_slowAlloc(32, -1);
      aBlock = v35;
      *(_DWORD *)v34 = 136315138;
      v89 = v10;
      v98 = a1;
      v36 = sub_100005170((uint64_t *)&unk_1000591C0);
      v37 = Optional.nonNilDescription.getter(v36);
      v39 = v38;
      v98 = (void *)sub_10003EE08(v37, v38, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99);
      swift_bridgeObjectRelease(v39);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "getPlayerIDFromFriendCode error:%s", v34, 0xCu);
      swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v34, -1, -1);

      v94[1](v16, v89);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);

      v94[1](v16, v10);
    }
    a4 = v91;
    v65 = v93;
    v66 = objc_msgSend((id)objc_opt_self(GKPlayer), "unknownPlayer");
    v67 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
    v68 = *(void **)&v65[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player];
    *(_QWORD *)&v65[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = v66;
    v69 = v66;

    v70 = *(void **)&v65[v67];
    if (v70)
    {
      v71 = objc_msgSend(v70, "internal");
      v72 = objc_msgSend(v71, "playerID");

      v73 = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
      v75 = v74;

    }
    else
    {
      v73 = 0;
      v75 = 0;
    }
    v82 = v20[1];
    *v20 = v73;
    v20[1] = v75;

    v81 = swift_bridgeObjectRelease(v82);
    v83 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType;
    v65[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 2;
    if (a1)
    {
      aBlock = a1;
      swift_errorRetain(a1);
      v84 = sub_100005170(&qword_1000591E0);
      v85 = sub_1000105F0(0, &qword_1000591E8, NSError_ptr);
      v81 = swift_dynamicCast(&v98, &aBlock, v84, v85, 6);
      if ((v81 & 1) != 0)
      {
        v86 = v98;
        v87 = sub_10001AA20(v98);

        if ((v87 & 1) != 0)
          v65[v83] = 4;
      }
    }
    return a4(v81);
  }
  v22 = *v20;
  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(GKUnknownPlayerID);
  v25 = v24;
  if (v22 == v23 && v21 == v24)
  {
    v29 = swift_bridgeObjectRelease(v24);
    goto LABEL_14;
  }
  v27 = a3;
  v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v21, v23, v24, 0);
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v25);
  if ((v28 & 1) == 0)
  {
    v76 = (_QWORD *)swift_allocObject(&unk_1000524B8, 48, 7);
    v76[2] = v22;
    v76[3] = v21;
    v76[4] = v27;
    v76[5] = a2;
    v96[3] = sub_10001DAFC;
    v97 = v76;
    aBlock = _NSConcreteStackBlock;
    v96[0] = 1107296256;
    v96[1] = sub_100018414;
    v96[2] = &unk_1000524D0;
    v77 = _Block_copy(&aBlock);
    v78 = v97;
    v79 = v27;
    v80 = a2;
    swift_release(v78);
    objc_msgSend(v80, "perform:", v77);
    _Block_release(v77);
    return a4(v81);
  }
  v29 = swift_bridgeObjectRelease(v21);
  a3 = v27;
LABEL_14:
  static GKLog.friending.getter(v29);
  v40 = a3;
  v41 = Logger.logObject.getter(v40);
  v42 = static os_log_type_t.info.getter();
  v43 = os_log_type_enabled(v41, v42);
  p_isa = (void **)&v40->isa;
  v91 = a4;
  v92 = a5;
  if (v43)
  {
    v44 = (uint8_t *)swift_slowAlloc(12, -1);
    v45 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v44 = 138412290;
    aBlock = p_isa;
    v46 = p_isa;
    v40 = p_isa;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v96);
    *v45 = v40;

    _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ We have a non nil friend code, but playerID was unknown.", v44, 0xCu);
    v47 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v45, 1, v47);
    swift_slowDealloc(v45, -1, -1);
    swift_slowDealloc(v44, -1, -1);
  }
  else
  {

    v41 = v40;
  }
  v49 = v93;
  v48 = v94;

  v50 = (void (**)(char *, uint64_t))v48[1];
  v51 = ((uint64_t (*)(char *, uint64_t))v50)(v14, v10);
  v52 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType;
  *((_BYTE *)&v40->isa + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType) = 0;
  static GKLog.friending.getter(v51);
  v53 = v40;
  v54 = Logger.logObject.getter(v53);
  v55 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = swift_slowAlloc(22, -1);
    v57 = (void ***)swift_slowAlloc(8, -1);
    *(_DWORD *)v56 = 138412546;
    v94 = v50;
    aBlock = v53;
    v89 = v10;
    v58 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v96);
    *v57 = v53;

    *(_WORD *)(v56 + 12) = 2048;
    v59 = (void **)*((unsigned __int8 *)p_isa + v52);

    aBlock = v59;
    v10 = v89;
    v50 = v94;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v96);

    _os_log_impl((void *)&_mh_execute_header, v54, v55, "%@ PlayerID was unknown, friendRequestErrorType set to %ld.", (uint8_t *)v56, 0x16u);
    v60 = sub_100005170((uint64_t *)&unk_100058CB0);
    v61 = v57;
    v49 = v93;
    swift_arrayDestroy(v61, 1, v60);
    swift_slowDealloc(v61, -1, -1);
    swift_slowDealloc(v56, -1, -1);
  }
  else
  {

    v54 = v53;
  }
  v62 = v91;

  v63 = ((uint64_t (*)(char *, uint64_t))v50)(v49, v10);
  return v62(v63);
}

void sub_100017DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, void *a6)
{
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  Class isa;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  id v23;
  char *v24;
  _QWORD aBlock[5];
  _QWORD *v26;
  char v27[24];

  v12 = sub_100005170(&qword_1000591B0);
  v13 = (_QWORD *)swift_allocObject(v12, 48, 7);
  *((_OWORD *)v13 + 1) = xmmword_100044020;
  v13[4] = a3;
  v13[5] = a4;
  v14 = &a5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs];
  swift_beginAccess(&a5[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs], v27, 0, 0);
  v15 = *(_QWORD **)v14;
  if (*(_QWORD *)v14 && v15[2])
  {
    v17 = v15[4];
    v16 = v15[5];
    swift_bridgeObjectRetain_n(v16, 2);
    swift_bridgeObjectRetain(a4);
    v13 = sub_100018FB0((_QWORD *)1, 2, 1, v13);
    v13[2] = 2;
    v13[6] = v17;
    v13[7] = v16;
  }
  else
  {
    swift_bridgeObjectRetain(a4);
    v17 = 0;
    v16 = 0xE000000000000000;
  }
  v18 = (void *)objc_opt_self(GKPlayer);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  v20 = (_QWORD *)swift_allocObject(&unk_100052508, 64, 7);
  v20[2] = a6;
  v20[3] = a5;
  v20[4] = v17;
  v20[5] = v16;
  v20[6] = a1;
  v20[7] = a2;
  aBlock[4] = sub_10001DB44;
  v26 = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000175AC;
  aBlock[3] = &unk_100052520;
  v21 = _Block_copy(aBlock);
  v22 = v26;
  v23 = a6;
  v24 = a5;
  swift_retain(a2);
  swift_release(v22);
  objc_msgSend(v18, "loadPlayersForIdentifiers:withCompletionHandler:", isa, v21);
  _Block_release(v21);

}

uint64_t sub_100017FB8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(_QWORD))
{
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  char v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v63;
  uint64_t (*v64)(_QWORD);
  uint64_t v65;

  if (a2)
    v11 = (void *)_convertErrorToNSError(_:)(a2);
  else
    v11 = 0;
  objc_msgSend(a3, "setError:", v11);

  v12 = (_QWORD *)&unk_100059000;
  if (!a1)
    goto LABEL_36;
  v64 = a7;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 >= 0)
      v39 = a1 & 0xFFFFFFFFFFFFFF8;
    else
      v39 = a1;
    swift_bridgeObjectRetain(a1);
    result = _CocoaArrayWrapper.endIndex.getter(v39);
    v13 = result;
    if (result)
      goto LABEL_7;
    goto LABEL_35;
  }
  v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain(a1);
  if (!v13)
  {
LABEL_35:
    swift_bridgeObjectRelease(a1);
    a7 = v64;
    v12 = &unk_100059000;
LABEL_36:
    v40 = v12[34];
    v41 = *(void **)(a4 + v40);
    if (v41)
    {
      v42 = *(void **)(a4 + v40);
      v43 = v42;
    }
    else
    {
      v43 = objc_msgSend((id)objc_opt_self(GKPlayer), "unknownPlayer");
      v42 = 0;
      v41 = *(void **)(a4 + v40);
    }
    *(_QWORD *)(a4 + v40) = v43;
    v44 = v43;
    v45 = v42;

    v46 = *(void **)(a4 + v40);
    if (v46)
    {
      v47 = objc_msgSend(v46, "internal");
      v48 = objc_msgSend(v47, "playerID");

      v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
      v51 = v50;

    }
    else
    {
      v49 = 0;
      v51 = 0;
    }
    v52 = (uint64_t *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID);
    v53 = *(_QWORD *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8);
    *v52 = v49;
    v52[1] = v51;

    v54 = swift_bridgeObjectRelease(v53);
    v55 = *(void **)(a4 + v40);
    if (!v55)
      return a7(v54);
    v56 = v55;
    v57 = objc_msgSend(v56, "internal");
    v58 = objc_msgSend(v57, "playerID");

    v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
    v61 = v60;

    if (!v61)
      return a7(v54);
    if (v59 == 0x496E776F6E6B6E55 && v61 == 0xE900000000000044)
    {
      v54 = swift_bridgeObjectRelease(v61);
    }
    else
    {
      v63 = _stringCompareWithSmolCheck(_:_:expecting:)(v59, v61, 0x496E776F6E6B6E55, 0xE900000000000044, 0);
      v54 = swift_bridgeObjectRelease(v61);
      if ((v63 & 1) == 0)
        return a7(v54);
    }
    *(_BYTE *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType) = 0;
    return a7(v54);
  }
LABEL_7:
  if (v13 >= 1)
  {
    v15 = 0;
    v16 = (uint64_t *)(a4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID);
    v65 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer;
    v17 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, a1);
      else
        v27 = *(id *)(a1 + 8 * v15 + 32);
      v28 = v27;
      v29 = objc_msgSend(v27, "internal", v64);
      v30 = objc_msgSend(v29, "playerID");

      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      v33 = v32;

      v34 = v16[1];
      if (v34)
      {
        v35 = *v16 == v31 && v34 == v33;
        if (v35 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v16, v34, v31, v33, 0) & 1) != 0)
        {
          swift_bridgeObjectRelease(v33);
          v18 = *(void **)(a4 + v17);
          *(_QWORD *)(a4 + v17) = v28;
          v19 = v28;

          v20 = *(void **)(a4 + v17);
          if (v20)
          {
            v21 = objc_msgSend(v20, "internal");
            v22 = objc_msgSend(v21, "playerID");

            v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
            v25 = v24;

          }
          else
          {
            v23 = 0;
            v25 = 0;
          }
          v26 = v16[1];
          *v16 = v23;
          v16[1] = v25;

          swift_bridgeObjectRelease(v26);
          goto LABEL_12;
        }
      }
      if (v31 == a5 && v33 == a6)
        break;
      v37 = _stringCompareWithSmolCheck(_:_:expecting:)(a5, a6, v31, v33, 0);
      swift_bridgeObjectRelease(v33);
      if ((v37 & 1) != 0)
        goto LABEL_29;

LABEL_12:
      if (v13 == ++v15)
        goto LABEL_35;
    }
    swift_bridgeObjectRelease(a6);
LABEL_29:
    v38 = *(void **)(a4 + v65);
    *(_QWORD *)(a4 + v65) = v28;

    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_100018414(uint64_t a1, void *aBlock)
{
  uint64_t v2;
  void (*v3)(uint64_t (*)(), uint64_t);
  void *v4;
  uint64_t v5;

  v3 = *(void (**)(uint64_t (*)(), uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = _Block_copy(aBlock);
  v5 = swift_allocObject(&unk_1000523A0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  swift_retain(v2);
  v3(sub_10001B108, v5);
  swift_release(v2);
  return swift_release(v5);
}

uint64_t sub_100018484(uint64_t result, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;

  if (result)
  {
    v5 = result;
    v6 = objc_msgSend((id)objc_opt_self(GKPlayer), "unknownPlayer");
    v7 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
    v8 = *(void **)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player) = v6;
    v9 = v6;

    v10 = *(void **)(a2 + v7);
    if (v10)
    {
      v11 = objc_msgSend(v10, "internal");
      v12 = objc_msgSend(v11, "playerID");

      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      v15 = v14;

    }
    else
    {
      v13 = 0;
      v15 = 0;
    }
    v16 = (uint64_t *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID);
    v17 = *(_QWORD *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8);
    *v16 = v13;
    v16[1] = v15;

    swift_bridgeObjectRelease(v17);
    v18 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType;
    *(_BYTE *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType) = 2;
    v24 = v5;
    swift_errorRetain(v5);
    v19 = sub_100005170(&qword_1000591E0);
    v20 = sub_1000105F0(0, &qword_1000591E8, NSError_ptr);
    if ((swift_dynamicCast(&v23, &v24, v19, v20, 6) & 1) != 0)
    {
      v21 = v23;
      v22 = sub_10001AA20(v23);

      if ((v22 & 1) != 0)
        *(_BYTE *)(a2 + v18) = 4;
    }
    return a3();
  }
  return result;
}

void sub_10001860C(uint64_t a1, void (*a2)(void *, id))
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
  v5 = *(void **)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v6, "isFriend"))
    {
      v7 = objc_msgSend(v6, "friendBiDirectional");
      sub_1000105F0(0, (unint64_t *)&unk_100058CF0, NSNumber_ptr);
      isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
      v9 = objc_msgSend(v7, "isEqualToNumber:", isa);

      if ((v9 & 1) != 0)
        *(_BYTE *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState) = 2;
    }
    else
    {

    }
  }
  v10 = *(void **)(a1 + v4);
  v11 = *(void **)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup);
  v12 = v10;
  v13 = objc_msgSend(v11, "error");
  a2(v10, v13);

}

void sub_100018748(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  void **v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;

  v3 = v2;
  sub_1000105F0(0, &qword_100059288, GKDispatchGroup_ptr);
  v6 = (void *)static GKDispatchGroup.namedGroup(with:line:function:)(0xD000000000000075, 0x8000000100042B90, 537, 0x293A5F2864616F6CLL, 0xE800000000000000);
  v7 = swift_allocObject(&unk_100052710, 32, 7);
  *(_QWORD *)(v7 + 16) = v3;
  *(_QWORD *)(v7 + 24) = v6;
  v20 = sub_10001E33C;
  v21 = (_QWORD *)v7;
  v16 = _NSConcreteStackBlock;
  v17 = 1107296256;
  v18 = sub_100018414;
  v19 = &unk_100052728;
  v8 = _Block_copy(&v16);
  v9 = v21;
  v10 = v3;
  v11 = v6;
  swift_release(v9);
  objc_msgSend(v11, "perform:", v8);
  _Block_release(v8);
  v12 = (_QWORD *)swift_allocObject(&unk_100052760, 40, 7);
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = v11;
  v20 = sub_10001E370;
  v21 = v12;
  v16 = _NSConcreteStackBlock;
  v17 = 1107296256;
  v18 = sub_100013AF4;
  v19 = &unk_100052778;
  v13 = _Block_copy(&v16);
  v14 = v21;
  v15 = v11;
  swift_retain(a2);
  swift_release(v14);
  objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v13);
  _Block_release(v13);

}

uint64_t sub_100018904(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _QWORD *v7;
  id v8;

  v7 = (_QWORD *)swift_allocObject(&unk_1000527B0, 40, 7);
  v7[2] = a4;
  v7[3] = a1;
  v7[4] = a2;
  v8 = a4;
  swift_retain(a2);
  sub_1000135F8((uint64_t)sub_10001E3C8, (uint64_t)v7);
  return swift_release(v7);
}

uint64_t sub_10001897C(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  void *v6;

  if (a2)
    v6 = (void *)_convertErrorToNSError(_:)(a2);
  else
    v6 = 0;
  objc_msgSend(a3, "setError:", v6);

  return a4();
}

void sub_100018A08()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_senderFriendRequestIdentifier
                                      + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID + 8));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL
                                      + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs));

}

id sub_100018AB8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PlayerModel()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension11PlayerModel);
}

ValueMetadata *type metadata accessor for PlayerModel.FriendRequestErrorType()
{
  return &type metadata for PlayerModel.FriendRequestErrorType;
}

uint64_t _s26GameCenterMessageExtension11PlayerModelC18FriendRequestStateOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s26GameCenterMessageExtension11PlayerModelC18FriendRequestStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_100018CBC + 4 * byte_1000443E5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100018CF0 + 4 * byte_1000443E0[v4]))();
}

uint64_t sub_100018CF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018CF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100018D00);
  return result;
}

uint64_t sub_100018D0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100018D14);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100018D18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018D20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlayerModel.FriendRequestState()
{
  return &type metadata for PlayerModel.FriendRequestState;
}

uint64_t getEnumTagSinglePayload for PlayerModel.FriendCodeState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PlayerModel.FriendCodeState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_100018E18 + 4 * byte_1000443EF[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100018E4C + 4 * byte_1000443EA[v4]))();
}

uint64_t sub_100018E4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018E54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100018E5CLL);
  return result;
}

uint64_t sub_100018E68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100018E70);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_100018E74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018E7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlayerModel.FriendCodeState()
{
  return &type metadata for PlayerModel.FriendCodeState;
}

unint64_t sub_100018E9C()
{
  unint64_t result;

  result = qword_100059190;
  if (!qword_100059190)
  {
    result = swift_getWitnessTable(&unk_1000444EC, &type metadata for PlayerModel.FriendCodeState);
    atomic_store(result, (unint64_t *)&qword_100059190);
  }
  return result;
}

unint64_t sub_100018EE4()
{
  unint64_t result;

  result = qword_100059198;
  if (!qword_100059198)
  {
    result = swift_getWitnessTable(&unk_10004458C, &type metadata for PlayerModel.FriendRequestState);
    atomic_store(result, (unint64_t *)&qword_100059198);
  }
  return result;
}

unint64_t sub_100018F2C()
{
  unint64_t result;

  result = qword_1000591A0;
  if (!qword_1000591A0)
  {
    result = swift_getWitnessTable(&unk_10004462C, &type metadata for PlayerModel.FriendRequestErrorType);
    atomic_store(result, (unint64_t *)&qword_1000591A0);
  }
  return result;
}

uint64_t sub_100018F70(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_100018F90(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *sub_100018FB0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100005170(&qword_1000591B0);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10001DB54(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

void sub_1000190BC(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

unsigned __int8 *sub_10001916C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;

  v15 = a1;
  v16 = a2;
  v4 = swift_bridgeObjectRetain(a2);
  v5 = String.init<A>(_:)(&v15, &type metadata for String, &protocol witness table for String, &protocol witness table for String, v4);
  v7 = v5;
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_1000194CC(v5, v6);
  v12 = v11;
  swift_bridgeObjectRelease(v8);
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v7, v8);
  }
LABEL_7:
  v13 = sub_100019250(v9, v10, a3);
  swift_bridgeObjectRelease(v8);
  return v13;
}

unsigned __int8 *sub_100019250(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1000194CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1;
  v3 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v3 = 11;
  v4 = String.subscript.getter(15, v3 | (v2 << 16), a1, a2);
  v6 = v5;
  v9 = sub_100019548(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_100019548(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = a3;
  if ((a4 & 0x1000000000000000) != 0)
  {
    v12 = sub_10001968C(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_10003F298(v12, 0);
      v5 = sub_100019778((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (unint64_t)_swiftEmptyArrayStorage;
    }
    v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(_QWORD *)(v8 + 16));
    swift_release(v8);
    return v14;
  }
  else
  {
    v8 = a1 >> 16;
    v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
LABEL_11:
      v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10)
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      goto LABEL_5;
    }
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }
}

unint64_t sub_10001968C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_10003F2FC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_10003F2FC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

unint64_t sub_100019778(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_10003F2FC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter(a6, a7);
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_10003F2FC(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void sub_100019988(unsigned __int8 *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  unsigned __int8 *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 **v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  unsigned __int8 **v30;
  uint64_t v31;
  NSString v32;
  _QWORD *v33;
  void *v34;
  _QWORD *v35;
  unsigned __int8 *v36;
  uint64_t v37;
  os_log_t v38;
  unsigned __int8 **v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t aBlock[5];
  _QWORD *v46;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject(&unk_100052850, 24, 7);
  v9 = v8;
  *(_QWORD *)(v8 + 16) = a2;
  v10 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] >= 2u)
  {
    swift_release(v8);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000038, 0x8000000100042880, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 274, 0);
LABEL_11:
    __break(1u);
    return;
  }
  v11 = (void *)objc_opt_self(GKLocalPlayer);
  v12 = a2;
  v43 = objc_msgSend(v11, "local");
  v13 = objc_msgSend(v43, "isAuthenticated");
  if (!(_DWORD)v13)
  {

    swift_release(v9);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000028, 0x8000000100042820, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 276, 0);
    goto LABEL_11;
  }
  if (a1[v10])
  {
    sub_10002EA94(0, v12);
    swift_release(v9);

  }
  else
  {
    static GKLog.friending.getter(v13);
    v14 = a1;
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.info.getter();
    v17 = v16;
    if (os_log_type_enabled(v15, v16))
    {
      v18 = swift_slowAlloc(22, -1);
      v40 = v17;
      v19 = v18;
      v20 = (unsigned __int8 **)swift_slowAlloc(8, -1);
      v39 = v20;
      v41 = swift_slowAlloc(32, -1);
      v44 = (uint64_t)v14;
      aBlock[0] = v41;
      *(_DWORD *)v19 = 138412546;
      v38 = v15;
      v21 = v14;
      v42 = v4;
      v22 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, aBlock);
      *v20 = v14;

      *(_WORD *)(v19 + 12) = 2080;
      v37 = v19 + 14;
      v23 = v22;
      v24 = objc_msgSend(v23, "description");
      v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
      v27 = v26;

      v44 = sub_10003EE08(v25, v27, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, aBlock);

      swift_bridgeObjectRelease(v27);
      v28 = v38;
      _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v40, "%@ CREATE friend request for playerModel: %s", (uint8_t *)v19, 0x16u);
      v29 = sub_100005170((uint64_t *)&unk_100058CB0);
      v30 = v39;
      swift_arrayDestroy(v39, 1, v29);
      swift_slowDealloc(v30, -1, -1);
      v31 = v41;
      swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v42);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    v32 = String._bridgeToObjectiveC()();
    v33 = (_QWORD *)swift_allocObject(&unk_100052878, 40, 7);
    v33[2] = v14;
    v33[3] = sub_10001E43C;
    v33[4] = v9;
    aBlock[4] = (uint64_t)sub_10001E680;
    v46 = v33;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100015808;
    aBlock[3] = (uint64_t)&unk_100052890;
    v34 = _Block_copy(aBlock);
    v35 = v46;
    v36 = v14;
    swift_retain(v9);
    swift_release(v35);
    objc_msgSend(v43, "createFriendRequestWithIdentifier:handler:", v32, v34);

    _Block_release(v34);
    swift_release(v9);

  }
}

void sub_100019E44(unsigned __int8 *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  unsigned __int8 *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 **v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  unsigned __int8 **v31;
  uint64_t v32;
  NSString v33;
  _QWORD *v34;
  void *v35;
  _QWORD *v36;
  unsigned __int8 *v37;
  uint64_t v38;
  os_log_t v39;
  unsigned __int8 **v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t aBlock[5];
  _QWORD *v47;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject(&unk_100052288, 32, 7);
  v11 = v10;
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v12 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] >= 2u)
  {
    swift_release(v10);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000038, 0x8000000100042880, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 274, 0);
LABEL_11:
    __break(1u);
    return;
  }
  v13 = (void *)objc_opt_self(GKLocalPlayer);
  v14 = a2;
  swift_retain(a3);
  v44 = objc_msgSend(v13, "local");
  v15 = objc_msgSend(v44, "isAuthenticated");
  if (!(_DWORD)v15)
  {
    swift_release(a3);

    swift_release(v11);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000028, 0x8000000100042820, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 276, 0);
    goto LABEL_11;
  }
  if (a1[v12])
  {
    sub_10003E0B4(0, (uint64_t)v14, a3);
    swift_release(v11);

  }
  else
  {
    static GKLog.friending.getter(v15);
    v16 = a1;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.info.getter();
    v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v20 = swift_slowAlloc(22, -1);
      v41 = v19;
      v21 = v20;
      v22 = (unsigned __int8 **)swift_slowAlloc(8, -1);
      v40 = v22;
      v42 = swift_slowAlloc(32, -1);
      v45 = (uint64_t)v16;
      aBlock[0] = v42;
      *(_DWORD *)v21 = 138412546;
      v43 = v6;
      v39 = v17;
      v23 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, aBlock);
      *v22 = v16;

      *(_WORD *)(v21 + 12) = 2080;
      v38 = v21 + 14;
      v24 = v23;
      v25 = objc_msgSend(v24, "description");
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
      v28 = v27;

      v45 = sub_10003EE08(v26, v28, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, aBlock);

      swift_bridgeObjectRelease(v28);
      v29 = v39;
      _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v41, "%@ CREATE friend request for playerModel: %s", (uint8_t *)v21, 0x16u);
      v30 = sub_100005170((uint64_t *)&unk_100058CB0);
      v31 = v40;
      swift_arrayDestroy(v40, 1, v30);
      swift_slowDealloc(v31, -1, -1);
      v32 = v42;
      swift_arrayDestroy(v42, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v43);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    v33 = String._bridgeToObjectiveC()();
    v34 = (_QWORD *)swift_allocObject(&unk_1000522B0, 40, 7);
    v34[2] = v16;
    v34[3] = sub_10001B01C;
    v34[4] = v11;
    aBlock[4] = (uint64_t)sub_10001B028;
    v47 = v34;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100015808;
    aBlock[3] = (uint64_t)&unk_1000522C8;
    v35 = _Block_copy(aBlock);
    v36 = v47;
    v37 = v16;
    swift_retain(v11);
    swift_release(v36);
    objc_msgSend(v44, "createFriendRequestWithIdentifier:handler:", v33, v35);

    _Block_release(v35);
    swift_release(v11);

  }
}

_QWORD *sub_10001A318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  _QWORD *v37;

  v32 = type metadata accessor for URLQueryItem(0);
  v7 = __chkstk_darwin(v32);
  v36 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)v30 - v10;
  result = _swiftEmptyArrayStorage;
  v37 = _swiftEmptyArrayStorage;
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v14 = *(unsigned __int8 *)(v9 + 80);
    v15 = *(_QWORD *)(v9 + 72);
    v30[1] = v3;
    v31 = (v14 + 32) & ~v14;
    v16 = a1 + v31;
    v34 = v15;
    v35 = v9;
    v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v17 = v32;
    for (i = v33(v11, a1 + v31, v32); ; i = v33(v11, v16, v17))
    {
      v20 = URLQueryItem.name.getter(i);
      v22 = v21;
      if (v20 == a2 && v21 == a3)
      {
        swift_bridgeObjectRelease(a3);
      }
      else
      {
        v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, a2, a3, 0);
        swift_bridgeObjectRelease(v22);
        if ((v23 & 1) == 0)
        {
          (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v17);
          v19 = v34;
          goto LABEL_4;
        }
      }
      v24 = a3;
      v25 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
      v25(v36, v11, v17);
      v26 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native(v37) & 1) == 0)
      {
        sub_10003F4DC(0, v26[2] + 1, 1);
        v26 = v37;
      }
      v28 = v26[2];
      v27 = v26[3];
      if (v28 >= v27 >> 1)
      {
        sub_10003F4DC(v27 > 1, v28 + 1, 1);
        v26 = v37;
      }
      v26[2] = v28 + 1;
      v19 = v34;
      v29 = (uint64_t)v26 + v31 + v28 * v34;
      v17 = v32;
      v25((char *)v29, v36, v32);
      v37 = v26;
      a3 = v24;
LABEL_4:
      v16 += v19;
      if (!--v13)
        return v37;
    }
  }
  return result;
}

void sub_10001A534(unsigned __int8 *a1, void *a2, void *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unsigned __int8 *v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  os_log_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSString v38;
  _QWORD *v39;
  void *v40;
  _QWORD *v41;
  unsigned __int8 *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_log_t v46;
  int v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t aBlock[5];
  _QWORD *v52;

  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)swift_allocObject(&unk_1000527D8, 40, 7);
  v13 = v12;
  v12[2] = a2;
  v12[3] = a3;
  v12[4] = a4;
  v14 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] >= 2u)
  {
    swift_release(v12);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000038, 0x8000000100042880, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 274, 0);
LABEL_11:
    __break(1u);
    return;
  }
  v15 = (void *)objc_opt_self(GKLocalPlayer);
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v49 = objc_msgSend(v15, "local");
  v19 = objc_msgSend(v49, "isAuthenticated");
  if (!(_DWORD)v19)
  {

    swift_release(v13);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000028, 0x8000000100042820, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 276, 0);
    goto LABEL_11;
  }
  if (a1[v14])
  {
    sub_100009CAC(0, v16, (uint64_t)v17, v18);
    swift_release(v13);

  }
  else
  {
    static GKLog.friending.getter(v19);
    v20 = a1;
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.info.getter();
    v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      v24 = swift_slowAlloc(22, -1);
      v47 = v23;
      v25 = v24;
      v26 = swift_slowAlloc(8, -1);
      v46 = v21;
      v27 = (_QWORD *)v26;
      v44 = v26;
      v48 = swift_slowAlloc(32, -1);
      v50 = (uint64_t)v20;
      aBlock[0] = v48;
      *(_DWORD *)v25 = 138412546;
      v43 = v9;
      v28 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, aBlock);
      *v27 = v20;

      *(_WORD *)(v25 + 12) = 2080;
      v29 = v28;
      v30 = objc_msgSend(v29, "description");
      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      v45 = v8;
      v33 = v32;

      v50 = sub_10003EE08(v31, v33, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, aBlock);

      swift_bridgeObjectRelease(v33);
      v34 = v46;
      _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v47, "%@ CREATE friend request for playerModel: %s", (uint8_t *)v25, 0x16u);
      v35 = sub_100005170((uint64_t *)&unk_100058CB0);
      v36 = v44;
      swift_arrayDestroy(v44, 1, v35);
      swift_slowDealloc(v36, -1, -1);
      v37 = v48;
      swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1, -1);
      swift_slowDealloc(v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v45);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    v38 = String._bridgeToObjectiveC()();
    v39 = (_QWORD *)swift_allocObject(&unk_100052800, 40, 7);
    v39[2] = v20;
    v39[3] = sub_10001E408;
    v39[4] = v13;
    aBlock[4] = (uint64_t)sub_10001E680;
    v52 = v39;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100015808;
    aBlock[3] = (uint64_t)&unk_100052818;
    v40 = _Block_copy(aBlock);
    v41 = v52;
    v42 = v20;
    swift_retain(v13);
    swift_release(v41);
    objc_msgSend(v49, "createFriendRequestWithIdentifier:handler:", v38, v40);

    _Block_release(v40);
    swift_release(v13);

  }
}

uint64_t sub_10001AA20(void *a1)
{
  char v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if ((objc_msgSend(a1, "gkIsNotConnectedToInternetError") & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(a1, "code") == (id)3)
  {
    v3 = objc_msgSend(a1, "domain");
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(GKErrorDomain);
    if (v4 == v7 && v6 == v8)
    {
      v2 = 1;
      v10 = v6;
    }
    else
    {
      v10 = v8;
      v2 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7, v8, 0);
    }
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    v2 = 0;
  }
  return v2 & 1;
}

void sub_10001AB04(unsigned __int8 *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  unsigned __int8 *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 **v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  os_log_t v31;
  uint64_t v32;
  unsigned __int8 **v33;
  uint64_t v34;
  NSString v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  unsigned __int8 *v39;
  uint64_t v40;
  os_log_t v41;
  unsigned __int8 **v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t aBlock[5];
  _QWORD *v49;

  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)swift_allocObject(&unk_100052558, 40, 7);
  v13 = v12;
  v12[2] = a2;
  v12[3] = a3;
  v12[4] = a4;
  v14 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] >= 2u)
  {
    swift_release(v12);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000038, 0x8000000100042880, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 274, 0);
LABEL_11:
    __break(1u);
    return;
  }
  v15 = (void *)objc_opt_self(GKLocalPlayer);
  v16 = a2;
  swift_retain(a4);
  v46 = objc_msgSend(v15, "local");
  v17 = objc_msgSend(v46, "isAuthenticated");
  if (!(_DWORD)v17)
  {
    swift_release(a4);

    swift_release(v13);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000028, 0x8000000100042820, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 276, 0);
    goto LABEL_11;
  }
  if (a1[v14])
  {
    swift_release(v13);

  }
  else
  {
    static GKLog.friending.getter(v17);
    v18 = a1;
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.info.getter();
    v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      v22 = swift_slowAlloc(22, -1);
      v43 = v21;
      v23 = v22;
      v24 = (unsigned __int8 **)swift_slowAlloc(8, -1);
      v42 = v24;
      v44 = swift_slowAlloc(32, -1);
      v47 = (uint64_t)v18;
      aBlock[0] = v44;
      *(_DWORD *)v23 = 138412546;
      v45 = v8;
      v41 = v19;
      v25 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, aBlock);
      *v24 = v18;

      *(_WORD *)(v23 + 12) = 2080;
      v40 = v23 + 14;
      v26 = v25;
      v27 = objc_msgSend(v26, "description");
      v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      v30 = v29;

      v47 = sub_10003EE08(v28, v30, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, aBlock);

      swift_bridgeObjectRelease(v30);
      v31 = v41;
      _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)v43, "%@ CREATE friend request for playerModel: %s", (uint8_t *)v23, 0x16u);
      v32 = sub_100005170((uint64_t *)&unk_100058CB0);
      v33 = v42;
      swift_arrayDestroy(v42, 1, v32);
      swift_slowDealloc(v33, -1, -1);
      v34 = v44;
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v45);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    v35 = String._bridgeToObjectiveC()();
    v36 = (_QWORD *)swift_allocObject(&unk_100052580, 40, 7);
    v36[2] = v18;
    v36[3] = sub_10001DC4C;
    v36[4] = v13;
    aBlock[4] = (uint64_t)sub_10001E680;
    v49 = v36;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100015808;
    aBlock[3] = (uint64_t)&unk_100052598;
    v37 = _Block_copy(aBlock);
    v38 = v49;
    v39 = v18;
    swift_retain(v13);
    swift_release(v38);
    objc_msgSend(v46, "createFriendRequestWithIdentifier:handler:", v35, v37);

    _Block_release(v37);
    swift_release(v13);

  }
}

unint64_t sub_10001AFD0(unint64_t result)
{
  if (result >= 5)
    return 5;
  return result;
}

unint64_t sub_10001AFE0(unint64_t result)
{
  if (result >= 6)
    return 6;
  return result;
}

uint64_t sub_10001AFF0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B01C(uint64_t a1)
{
  uint64_t v1;

  return sub_10003E0B4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10001B028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return sub_100015744(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16), *(uint64_t (**)(uint64_t))(v5 + 24));
}

uint64_t sub_10001B034(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001B044(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001B04C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005170(&qword_100058CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B094()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001B0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100016520(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32));
}

void sub_10001B0D8()
{
  uint64_t v0;

  sub_10001860C(*(_QWORD *)(v0 + 16), *(void (**)(void *, id))(v0 + 24));
}

uint64_t sub_10001B0E4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001B108()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_10001B118(void **a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000165A4(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void (**)(void))(v2 + 32), *(NSObject **)(v2 + 40));
}

id sub_10001B124(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  id v21;
  NSString v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_senderFriendRequestIdentifier];
  v9 = v1;
  v10 = UUID.init()();
  v11 = UUID.uuidString.getter(v10);
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *v8 = v11;
  v8[1] = v13;
  v14 = (uint64_t *)&v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerID];
  *v14 = 0;
  v14[1] = 0;
  v15 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player;
  *(_QWORD *)&v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player] = 0;
  v16 = &v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v17 = &v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = &v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v19 = &v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount];
  *(_QWORD *)v19 = 0;
  v19[8] = 1;
  *(_QWORD *)&v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer] = 0;
  v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState] = 2;
  v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = 0;
  v9[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 0;
  v20 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_playerGroup;
  v21 = objc_allocWithZone((Class)GKDispatchGroup);
  v22 = String._bridgeToObjectiveC()();
  v23 = objc_msgSend(v21, "initWithName:", v22);

  *(_QWORD *)&v9[v20] = v23;
  v24 = *(void **)&v9[v15];
  *(_QWORD *)&v9[v15] = a1;
  v25 = a1;

  v26 = objc_msgSend(v25, "internal");
  v27 = objc_msgSend(v26, "playerID");

  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  v30 = v29;

  v31 = v14[1];
  *v14 = v28;
  v14[1] = v30;

  swift_bridgeObjectRelease(v31);
  v33.receiver = v9;
  v33.super_class = ObjectType;
  return objc_msgSendSuper2(&v33, "init");
}

_BYTE *sub_10001B374(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  uint64_t (*v42)(char *, uint64_t);
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t (*v62)(char *, uint64_t);
  uint64_t v63;
  unsigned int (*v64)(char *, uint64_t, _QWORD *);
  uint64_t v65;
  char *v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  __n128 v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  char *v76;
  id v77;
  id v78;
  _BYTE *v79;
  uint64_t v80;
  uint64_t (*v81)(char *, char *, _QWORD *);
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t (*v87)(char *, _QWORD *);
  id v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t (*v93)(char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  id v99;
  id v100;
  id v101;
  id v102;
  char *v103;
  NSObject *v104;
  os_log_type_t v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  _BYTE *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  Class isa;
  id v132;
  uint64_t v133;
  void *v134;
  Class v135;
  Class v136;
  id v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  _BYTE *v148;
  unint64_t v149;
  char v150;
  uint64_t *v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  char v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  _QWORD *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  _QWORD *v168;
  uint64_t (*v169)(char *, uint64_t);
  uint64_t v170;
  char *v171;
  uint64_t (*v172)(char *, uint64_t);
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  char v178;
  id v179;
  id v180;
  _BYTE *v181;
  _BYTE *v182;
  NSObject *v183;
  os_log_type_t v184;
  _BOOL4 v185;
  uint64_t v186;
  _QWORD *v187;
  uint64_t v188;
  _BYTE *v189;
  __n128 v190;
  uint64_t v191;
  unint64_t v192;
  unint64_t v193;
  uint64_t v194;
  char *v195;
  uint64_t (*v196)(char *, uint64_t);
  uint64_t v197;
  char *v198;
  _BYTE *v199;
  NSObject *v200;
  os_log_type_t v201;
  uint64_t v202;
  uint64_t v203;
  _QWORD *v204;
  uint64_t v205;
  _BYTE *v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  _BYTE *v215;
  unint64_t v216;
  char v217;
  uint64_t *v218;
  uint64_t v219;
  uint64_t v220;
  char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  char v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t *v229;
  uint64_t v230;
  unint64_t v231;
  const char *v232;
  unint64_t i;
  uint64_t v234;
  int v235;
  char *v236;
  char *v237;
  char *v238;
  char *v239;
  char *v240;
  char *v241;
  char *v242;
  uint64_t v243;
  char *v244;
  char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t (*v249)(char *, uint64_t);
  uint64_t v250;
  __int128 v251;
  __int128 v252;
  _OWORD v253[2];

  v248 = type metadata accessor for Logger(0);
  v246 = *(_QWORD *)(v248 - 8);
  v2 = __chkstk_darwin(v248);
  v245 = (char *)&v236 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v236 - v5;
  v7 = __chkstk_darwin(v4);
  v240 = (char *)&v236 - v8;
  __chkstk_darwin(v7);
  v242 = (char *)&v236 - v9;
  v10 = sub_100005170(&qword_100059218);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v236 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v239 = (char *)&v236 - v15;
  v16 = __chkstk_darwin(v14);
  v238 = (char *)&v236 - v17;
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v236 - v19;
  __chkstk_darwin(v18);
  v22 = (char *)&v236 - v21;
  v249 = (uint64_t (*)(char *, uint64_t))type metadata accessor for URLQueryItem(0);
  v23 = *((_QWORD *)v249 - 1);
  v24 = __chkstk_darwin(v249);
  v26 = (char *)&v236 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __chkstk_darwin(v24);
  v237 = (char *)&v236 - v28;
  v29 = __chkstk_darwin(v27);
  v236 = (char *)&v236 - v30;
  v31 = __chkstk_darwin(v29);
  v241 = (char *)&v236 - v32;
  v33 = __chkstk_darwin(v31);
  v35 = (char *)&v236 - v34;
  v36 = URLComponents.queryItems.getter(v33);
  v243 = v36;
  if (!v36)
  {
LABEL_109:
    v231 = 0xD00000000000002ALL;
    v235 = 0;
    v234 = 164;
    v232 = "expected our components to have queryItems";
LABEL_113:
    for (i = (unint64_t)(v232 - 32) | 0x8000000000000000; ; i = 0x8000000100042AA0)
    {
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v231, i, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, v234, v235);
      __break(1u);
LABEL_115:
      v235 = 0;
      v234 = 198;
      v231 = 0xD000000000000018;
    }
  }
  v244 = v6;
  v247 = a1;
  v37 = URLComponents.queryItems.getter(v36);
  if (!v37)
  {
    v46 = *(char **)(v23 + 56);
    v42 = v249;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v46)(v22, 1, 1, v249);
    goto LABEL_9;
  }
  v38 = v37;
  v39 = v26;
  v40 = v13;
  v41 = sub_10001A318(v37, 28278, 0xE200000000000000);
  swift_bridgeObjectRelease(v38);
  if (v41[2])
  {
    v42 = v249;
    (*(void (**)(char *, unint64_t, uint64_t (*)(char *, uint64_t)))(v23 + 16))(v22, (unint64_t)v41+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)), v249);
    v43 = *(char **)(v23 + 56);
    v44 = v22;
    v45 = 0;
  }
  else
  {
    v43 = *(char **)(v23 + 56);
    v44 = v22;
    v45 = 1;
    v42 = v249;
  }
  v47 = v43;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v43)(v44, v45, 1, (uint64_t (*)(char *, uint64_t))v42);
  swift_bridgeObjectRelease(v41);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t (*)(char *, uint64_t)))(v23 + 48))(v22, 1, (uint64_t (*)(char *, uint64_t))v42) == 1)
  {
    v46 = v47;
    v13 = v40;
    v26 = v39;
LABEL_9:
    sub_10000527C((uint64_t)v22, &qword_100059218);
    v48 = sub_100015300(48, 0xE100000000000000);
    if ((v49 & 1) != 0)
      goto LABEL_22;
    goto LABEL_18;
  }
  v50 = (*(uint64_t (**)(char *, char *, uint64_t (*)(char *, uint64_t)))(v23 + 32))(v35, v22, (uint64_t (*)(char *, uint64_t))v42);
  v51 = URLQueryItem.value.getter(v50);
  v53 = v52;
  (*(void (**)(char *, uint64_t (*)(char *, uint64_t)))(v23 + 8))(v35, v249);
  if (v53)
    v54 = v51;
  else
    v54 = 48;
  if (v53)
    v55 = v53;
  else
    v55 = 0xE100000000000000;
  v42 = v249;
  v46 = v47;
  v13 = v40;
  v26 = v39;
  v48 = sub_100015300(v54, v55);
  if ((v56 & 1) != 0)
  {
LABEL_22:
    v58 = URLComponents.queryItems.getter(v48);
    if (!v58)
    {
      ((void (*)(char *, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v46)(v20, 1, 1, v249);
      v61 = v243;
LABEL_28:
      v65 = sub_10000527C((uint64_t)v20, &qword_100059218);
LABEL_29:
      v66 = v242;
      static GKLog.general.getter(v65);
      v67 = swift_bridgeObjectRetain_n(v61, 2);
      v68 = Logger.logObject.getter(v67);
      v69 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v68, v69))
      {
        v70 = (uint8_t *)swift_slowAlloc(12, -1);
        v71 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v253[0] = v71;
        *(_DWORD *)v70 = 136315138;
        v72 = swift_bridgeObjectRetain(v61);
        v73 = Array.description.getter(v72);
        v75 = v74;
        swift_bridgeObjectRelease(v61);
        *(_QWORD *)&v251 = sub_10003EE08(v73, v75, (uint64_t *)v253);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v251, (char *)&v251 + 8);
        swift_bridgeObjectRelease_n(v61, 2);
        swift_bridgeObjectRelease(v75);
        _os_log_impl((void *)&_mh_execute_header, v68, v69, "Couldn't find playerID in queryItems: %s", v70, 0xCu);
        swift_arrayDestroy(v71, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v71, -1, -1);
        swift_slowDealloc(v70, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v61, 2);
      }
      (*(void (**)(char *, uint64_t))(v246 + 8))(v66, v248);
      v76 = v244;
      v77 = objc_msgSend((id)objc_opt_self(GKPlayer), "unknownPlayer");
      v78 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
      v79 = sub_10001B124(v77);

      v57 = 0;
      v79[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 3;
      goto LABEL_84;
    }
    v59 = v58;
    v60 = sub_10001A318(v58, 6580592, 0xE300000000000000);
    swift_bridgeObjectRelease(v59);
    v61 = v243;
    if (v60[2])
    {
      v62 = v249;
      (*(void (**)(char *, unint64_t, uint64_t (*)(char *, uint64_t)))(v23 + 16))(v20, (unint64_t)v60+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)), v249);
      v63 = 0;
    }
    else
    {
      v63 = 1;
      v62 = v249;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v46)(v20, v63, 1, (uint64_t (*)(char *, uint64_t))v62);
    swift_bridgeObjectRelease(v60);
    v64 = *(unsigned int (**)(char *, uint64_t, _QWORD *))(v23 + 48);
    if (v64(v20, 1, (uint64_t (*)(char *, uint64_t))v62) == 1)
      goto LABEL_28;
    v240 = v46;
    v81 = *(uint64_t (**)(char *, char *, _QWORD *))(v23 + 32);
    v82 = v241;
    v83 = v81(v241, v20, (uint64_t (*)(char *, uint64_t))v62);
    v84 = URLQueryItem.value.getter(v83);
    v86 = v85;
    v87 = *(uint64_t (**)(char *, _QWORD *))(v23 + 8);
    v65 = v87(v82, v62);
    if (!v86)
      goto LABEL_29;
    v88 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
    v79 = sub_10001510C(v84, v86);
    v89 = URLComponents.queryItems.getter(v79);
    if (v89)
    {
      v90 = v89;
      v91 = sub_10001A318(v89, 25446, 0xE200000000000000);
      swift_bridgeObjectRelease(v90);
      if (v91[2])
      {
        v92 = (uint64_t)v238;
        v93 = v249;
        (*(void (**)(char *, unint64_t, uint64_t (*)(char *, uint64_t)))(v23 + 16))(v238, (unint64_t)v91+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)), v249);
        v94 = 0;
      }
      else
      {
        v94 = 1;
        v93 = v249;
        v92 = (uint64_t)v238;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v240)(v92, v94, 1, (uint64_t (*)(char *, uint64_t))v93);
      swift_bridgeObjectRelease(v91);
      if (v64((char *)v92, 1, (uint64_t (*)(char *, uint64_t))v93) != 1)
      {
        v160 = v236;
        v161 = v81(v236, (char *)v92, (uint64_t (*)(char *, uint64_t))v93);
        v242 = (char *)URLQueryItem.value.getter(v161);
        v163 = v162;
        v159 = v87(v160, v93);
        if (v163)
        {
          v164 = &v79[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
          v165 = *(_QWORD *)&v79[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8];
          *v164 = v242;
          v164[1] = v163;
          v159 = swift_bridgeObjectRelease(v165);
        }
        v158 = (uint64_t)v239;
LABEL_69:
        v166 = URLComponents.queryItems.getter(v159);
        if (v166)
        {
          v167 = v166;
          v168 = sub_10001A318(v166, 7565682, 0xE300000000000000);
          swift_bridgeObjectRelease(v167);
          if (v168[2])
          {
            v169 = v249;
            (*(void (**)(uint64_t, unint64_t, uint64_t (*)(char *, uint64_t)))(v23 + 16))(v158, (unint64_t)v168+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)), v249);
            v170 = 0;
            v76 = v244;
          }
          else
          {
            v170 = 1;
            v76 = v244;
            v169 = v249;
          }
          ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v240)(v158, v170, 1, (uint64_t (*)(char *, uint64_t))v169);
          swift_bridgeObjectRelease(v168);
          if (v64((char *)v158, 1, (uint64_t (*)(char *, uint64_t))v169) != 1)
          {
            v171 = v237;
            v172 = v249;
            v173 = v81(v237, (char *)v158, v249);
            v174 = URLQueryItem.value.getter(v173);
            v176 = v175;
            v87(v171, v172);
            if (v176)
            {
              v177 = sub_100015300(v174, v176);
              if ((v178 & 1) == 0 && v177 < 5)
                v79[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = v177;
            }
            goto LABEL_76;
          }
        }
        else
        {
          ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v240)(v158, 1, 1, v249);
          v76 = v244;
        }
        sub_10000527C(v158, &qword_100059218);
LABEL_76:

        v57 = 0;
        goto LABEL_84;
      }
    }
    else
    {
      v92 = (uint64_t)v238;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v240)(v238, 1, 1, v249);
    }
    v158 = (uint64_t)v239;
    v159 = sub_10000527C(v92, &qword_100059218);
    goto LABEL_69;
  }
LABEL_18:
  switch(v48)
  {
    case 0:
      goto LABEL_22;
    case 1:
      v57 = 1;
LABEL_38:
      v95 = URLComponents.queryItems.getter(v48);
      if (v95)
      {
        v96 = v95;
        v97 = sub_10001A318(v95, 25722, 0xE200000000000000);
        swift_bridgeObjectRelease(v96);
        if (v97[2])
        {
          (*(void (**)(char *, unint64_t, uint64_t (*)(char *, uint64_t)))(v23 + 16))(v13, (unint64_t)v97+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)), (uint64_t (*)(char *, uint64_t))v42);
          v98 = 0;
        }
        else
        {
          v98 = 1;
        }
        ((void (*)(char *, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v46)(v13, v98, 1, (uint64_t (*)(char *, uint64_t))v42);
        swift_bridgeObjectRelease(v97);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t (*)(char *, uint64_t)))(v23 + 48))(v13, 1, (uint64_t (*)(char *, uint64_t))v42) != 1)
        {
          v115 = (*(uint64_t (**)(char *, char *, uint64_t (*)(char *, uint64_t)))(v23 + 32))(v26, v13, (uint64_t (*)(char *, uint64_t))v42);
          v116 = URLQueryItem.value.getter(v115);
          v118 = v117;
          (*(void (**)(char *, uint64_t (*)(char *, uint64_t)))(v23 + 8))(v26, (uint64_t (*)(char *, uint64_t))v42);
          if (v118)
          {
            v119 = Data.init(base64Encoded:options:)(v116, v118, 0);
            v121 = v120;
            v122 = swift_bridgeObjectRelease(v118);
            if (v121 >> 60 == 15)
              goto LABEL_115;
            __chkstk_darwin(v122);
            *((_BYTE *)&v236 - 32) = 0;
            *(&v236 - 3) = (char *)v119;
            v234 = v121;
            v123 = sub_100005170(&qword_100059228);
            Data.withUnsafeBytes<A, B>(_:)(v253, sub_10001DD7C, &v236 - 6, v119, v121, v123, &type metadata for UInt8);
            v124 = *((_QWORD *)&v253[0] + 1);
            if (*((_QWORD *)&v253[0] + 1) >> 60 == 15)
            {
              __break(1u);
            }
            else
            {
              v125 = *(_QWORD *)&v253[0];
              v126 = sub_100005170(&qword_100059230);
              v127 = swift_allocObject(v126, 96, 7);
              *(_OWORD *)(v127 + 16) = xmmword_1000443D0;
              v128 = sub_1000105F0(0, &qword_100059238, NSString_ptr);
              *(_QWORD *)(v127 + 56) = sub_100005170(&qword_100059240);
              *(_QWORD *)(v127 + 32) = v128;
              v129 = sub_1000105F0(0, &qword_100059248, NSDictionary_ptr);
              *(_QWORD *)(v127 + 88) = sub_100005170(&qword_100059250);
              *(_QWORD *)(v127 + 64) = v129;
              v130 = objc_allocWithZone((Class)NSSet);
              isa = Array._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v127);
              v132 = objc_msgSend(v130, "initWithArray:", isa);

              *(_QWORD *)&v253[0] = 0;
              static Set._forceBridgeFromObjectiveC(_:result:)(v132, v253, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
              v133 = *(_QWORD *)&v253[0];
              if (*(_QWORD *)&v253[0])
              {

                v134 = (void *)objc_opt_self(NSKeyedUnarchiver);
                v135 = Set._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease(v133);
                v136 = Data._bridgeToObjectiveC()().super.isa;
                *(_QWORD *)&v253[0] = 0;
                v137 = objc_msgSend(v134, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v135, v136, v253);

                v138 = *(_QWORD *)&v253[0];
                if (v137)
                {
                  v139 = *(id *)&v253[0];
                  _bridgeAnyObjectToAny(_:)(v253, v137);
                  swift_unknownObjectRelease(v137);
                  v140 = sub_100005170(&qword_100059258);
                  if ((swift_dynamicCast(&v251, v253, (char *)&type metadata for Any + 8, v140, 6) & 1) != 0)
                  {
                    v141 = v251;
                    if (*(_QWORD *)(v251 + 16))
                    {
                      swift_bridgeObjectRetain(v251);
                      v142 = sub_10002F3A8(25446, 0xE200000000000000);
                      if ((v143 & 1) != 0)
                      {
                        v144 = (uint64_t *)(*(_QWORD *)(v141 + 56) + 16 * v142);
                        v145 = *v144;
                        v146 = v144[1];
                        swift_bridgeObjectRetain(v146);
                        swift_bridgeObjectRelease(v141);
                        v147 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
                        v148 = sub_100014F18(v145, v146);
                        v79 = v148;
                        if (*(_QWORD *)(v141 + 16))
                        {
                          swift_bridgeObjectRetain(v141);
                          v242 = v79;
                          v149 = sub_10002F3A8(7565682, 0xE300000000000000);
                          if ((v150 & 1) != 0)
                          {
                            v151 = (uint64_t *)(*(_QWORD *)(v141 + 56) + 16 * v149);
                            v152 = *v151;
                            v153 = v151[1];
                            swift_bridgeObjectRetain(v153);
                            swift_bridgeObjectRelease(v141);
                            v154 = sub_100015300(v152, v153);
                            if ((v155 & 1) == 0 && v154 <= 4)
                              v242[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] = v154;
                          }
                          else
                          {
                            swift_bridgeObjectRelease(v141);
                          }
                          if (*(_QWORD *)(v141 + 16))
                          {
                            swift_bridgeObjectRetain(v141);
                            v216 = sub_10002F3A8(28272, 0xE200000000000000);
                            if ((v217 & 1) != 0)
                            {
                              v218 = (uint64_t *)(*(_QWORD *)(v141 + 56) + 16 * v216);
                              v220 = *v218;
                              v219 = v218[1];
                              swift_bridgeObjectRetain(v219);
                              swift_bridgeObjectRelease(v141);
                              v221 = &v242[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname];
                              v222 = *(_QWORD *)&v242[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendNickname
                                                    + 8];
                              *(_QWORD *)v221 = v220;
                              *((_QWORD *)v221 + 1) = v219;
                            }
                            else
                            {
                              v222 = v141;
                            }
                            swift_bridgeObjectRelease(v222);
                          }
                        }
                        else
                        {
                          v215 = v148;
                        }
                        *(_QWORD *)&v253[0] = v141;
                        v223 = sub_100005170((uint64_t *)&unk_100059260);
                        if ((swift_dynamicCast(&v251, v253, v140, v223, 6) & 1) != 0)
                        {
                          v224 = v251;
                          if (*(_QWORD *)(v251 + 16)
                            && (v225 = sub_10002F3A8(1684631666, 0xE400000000000000), (v226 & 1) != 0))
                          {
                            sub_100013540(*(_QWORD *)(v224 + 56) + 32 * v225, (uint64_t)&v251);
                          }
                          else
                          {
                            v251 = 0u;
                            v252 = 0u;
                          }
                          swift_bridgeObjectRelease(v224);
                          if (*((_QWORD *)&v252 + 1))
                          {
                            sub_10000FF80(&v251, v253);
                            v227 = sub_100005170(&qword_1000591B0);
                            v228 = swift_allocObject(v227, 48, 7);
                            *(_OWORD *)(v228 + 16) = xmmword_100044020;
                            sub_100013540((uint64_t)v253, (uint64_t)&v251);
                            swift_dynamicCast(v228 + 32, &v251, (char *)&type metadata for Any + 8, &type metadata for String, 7);
                            sub_10001DD98(v125, v124);
                            sub_10001DD98(v119, v121);
                            sub_10001DDF0(v253);
                            v229 = (uint64_t *)&v79[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs];
                            swift_beginAccess(&v79[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs], &v251, 1, 0);
                            v230 = *v229;
                            *v229 = v228;

                            v80 = swift_bridgeObjectRelease(v230);
                          }
                          else
                          {
                            sub_10001DD98(v125, v124);
                            sub_10001DD98(v119, v121);

                            v80 = sub_10000527C((uint64_t)&v251, (uint64_t *)&unk_100059D40);
                          }
                        }
                        else
                        {
                          sub_10001DD98(v125, v124);
                          sub_10001DD98(v119, v121);

                        }
                        goto LABEL_83;
                      }
                      swift_bridgeObjectRelease_n(v141, 2);
                    }
                    else
                    {
                      swift_bridgeObjectRelease(v251);
                    }
                  }
                }
                else
                {
                  v156 = *(id *)&v253[0];
                  v157 = _convertNSErrorToError(_:)(v138);

                  swift_willThrow();
                  swift_errorRelease(v157);
                }
                v179 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
                v180 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
                v79 = sub_10001B124(v179);

                sub_10001DD98(v125, v124);
                v80 = sub_10001DD98(v119, v121);
LABEL_83:
                v61 = v243;
                v76 = v244;
                goto LABEL_84;
              }
            }
            __break(1u);
            goto LABEL_109;
          }
LABEL_112:
          v231 = 0xD00000000000001ALL;
          v235 = 0;
          v234 = 197;
          v232 = "Couldn't read zippedString";
          goto LABEL_113;
        }
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t (*)(char *, uint64_t)))v46)(v13, 1, 1, (uint64_t (*)(char *, uint64_t))v42);
      }
      sub_10000527C((uint64_t)v13, &qword_100059218);
      goto LABEL_112;
    case 2:
      v57 = 2;
      goto LABEL_38;
  }
  v99 = objc_msgSend((id)objc_opt_self(GKPlayer), "unknownPlayer");
  v100 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
  v101 = sub_10001B124(v99);

  v102 = v101;
  v103 = v240;
  static GKLog.friending.getter(v102);
  v79 = v102;
  v104 = Logger.logObject.getter(v79);
  v105 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v104, v105))
  {
    v106 = swift_slowAlloc(22, -1);
    v107 = (_QWORD *)swift_slowAlloc(8, -1);
    v108 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v253[0] = v108;
    *(_DWORD *)v106 = 138412546;
    *(_QWORD *)&v251 = v79;
    v109 = v79;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v251, (char *)&v251 + 8);
    *v107 = v79;

    *(_WORD *)(v106 + 12) = 2080;
    LOBYTE(v251) = 3;
    v110 = sub_100005170(&qword_100059220);
    v111 = Optional.nonNilDescription.getter(v110);
    v113 = v112;
    *(_QWORD *)&v251 = sub_10003EE08(v111, v112, (uint64_t *)v253);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v251, (char *)&v251 + 8);
    swift_bridgeObjectRelease(v113);
    _os_log_impl((void *)&_mh_execute_header, v104, v105, "%@ Couldn't handle this verion of friend request: %s", (uint8_t *)v106, 0x16u);
    v114 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v107, 1, v114);
    swift_slowDealloc(v107, -1, -1);
    swift_arrayDestroy(v108, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v108, -1, -1);
    swift_slowDealloc(v106, -1, -1);

    (*(void (**)(char *, uint64_t))(v246 + 8))(v240, v248);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v246 + 8))(v103, v248);
  }
  v61 = v243;
  v76 = v244;
  v79[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType] = 1;

  v57 = 3;
LABEL_84:
  static GKLog.friending.getter(v80);
  v181 = v79;
  swift_bridgeObjectRetain(v61);
  v182 = v181;
  v183 = Logger.logObject.getter(v182);
  v184 = static os_log_type_t.info.getter();
  v185 = os_log_type_enabled(v183, v184);
  LODWORD(v243) = v57;
  if (v185)
  {
    v186 = swift_slowAlloc(22, -1);
    v187 = (_QWORD *)swift_slowAlloc(8, -1);
    v242 = (char *)swift_slowAlloc(32, -1);
    *(_QWORD *)&v253[0] = v242;
    *(_DWORD *)v186 = 138412546;
    v250 = (uint64_t)v182;
    v188 = v61;
    v189 = v182;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v250, &v251);
    *v187 = v182;

    *(_WORD *)(v186 + 12) = 2080;
    v190 = swift_bridgeObjectRetain(v188);
    v191 = Array.description.getter(v190);
    v193 = v192;
    swift_bridgeObjectRelease(v188);
    v250 = sub_10003EE08(v191, v193, (uint64_t *)v253);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v250, &v251);
    swift_bridgeObjectRelease_n(v188, 2);
    swift_bridgeObjectRelease(v193);
    _os_log_impl((void *)&_mh_execute_header, v183, v184, "%@ queryItems: %s", (uint8_t *)v186, 0x16u);
    v194 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v187, 1, v194);
    swift_slowDealloc(v187, -1, -1);
    v195 = v242;
    swift_arrayDestroy(v242, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v195, -1, -1);
    swift_slowDealloc(v186, -1, -1);

    v196 = *(uint64_t (**)(char *, uint64_t))(v246 + 8);
    v197 = v196(v244, v248);
  }
  else
  {

    swift_bridgeObjectRelease_n(v61, 2);
    v196 = *(uint64_t (**)(char *, uint64_t))(v246 + 8);
    v197 = v196(v76, v248);
  }
  v198 = v245;
  static GKLog.friending.getter(v197);
  v199 = v182;
  v200 = Logger.logObject.getter(v199);
  v201 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v200, v201))
  {
    v202 = swift_slowAlloc(22, -1);
    v249 = v196;
    v203 = v202;
    v204 = (_QWORD *)swift_slowAlloc(8, -1);
    v205 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v253[0] = v205;
    *(_DWORD *)v203 = 138412546;
    v250 = (uint64_t)v199;
    v206 = v199;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v250, &v251);
    *v204 = v199;

    *(_WORD *)(v203 + 12) = 2080;
    LOBYTE(v250) = v243;
    v207 = sub_100005170(&qword_100059220);
    v208 = Optional.nonNilDescription.getter(v207);
    v210 = v209;
    v250 = sub_10003EE08(v208, v209, (uint64_t *)v253);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v250, &v251);
    swift_bridgeObjectRelease(v210);
    _os_log_impl((void *)&_mh_execute_header, v200, v201, "%@ Version in queryItems: %s", (uint8_t *)v203, 0x16u);
    v211 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v204, 1, v211);
    swift_slowDealloc(v204, -1, -1);
    swift_arrayDestroy(v205, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v205, -1, -1);
    swift_slowDealloc(v203, -1, -1);

    v212 = type metadata accessor for URLComponents(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v212 - 8) + 8))(v247, v212);
    v249(v245, v248);
  }
  else
  {

    v213 = type metadata accessor for URLComponents(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v213 - 8) + 8))(v247, v213);
    v196(v198, v248);
  }
  return v199;
}

id sub_10001CAD4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v53;
  char *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  int v58;
  uint64_t v59;
  uint8_t *v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  void (*v65)(char *, uint64_t);
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t *v69;
  int v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;

  v2 = type metadata accessor for Logger(0);
  v77 = *(_QWORD *)(v2 - 8);
  v78 = v2;
  v3 = __chkstk_darwin(v2);
  v79 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v72 = (char *)&v68 - v5;
  v6 = sub_100005170(&qword_100059208);
  __chkstk_darwin(v6);
  v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URLComponents(0);
  v10 = *(_QWORD *)(v9 - 8);
  v74 = v9;
  v75 = v10;
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v73 = (char *)&v68 - v14;
  v15 = sub_100005170(&qword_100058CE0);
  __chkstk_darwin(v15);
  v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for URL(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v68 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v20);
  v25 = (char *)&v68 - v24;
  __chkstk_darwin(v23);
  v27 = (char *)&v68 - v26;
  v76 = a1;
  v28 = objc_msgSend(a1, "selectedMessage");
  if (!v28)
    goto LABEL_9;
  v29 = v28;
  v30 = objc_msgSend(v28, "URL");
  if (!v30)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
    goto LABEL_7;
  }
  v31 = v30;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v32 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
  v32(v17, v25, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v17, 0, 1, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
LABEL_7:

    v35 = &qword_100058CE0;
    v36 = (uint64_t)v17;
    goto LABEL_8;
  }
  v32(v27, v17, v18);
  URLComponents.init(url:resolvingAgainstBaseURL:)(v27, 0);
  v34 = v74;
  v33 = v75;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v8, 1, v74) == 1)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v27, v18);

    v35 = &qword_100059208;
    v36 = (uint64_t)v8;
LABEL_8:
    sub_10000527C(v36, v35);
LABEL_9:
    v37 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
    v38 = objc_allocWithZone((Class)type metadata accessor for PlayerModel());
    v39 = sub_10001B124(v37);

    v42 = v77;
    v41 = v78;
    goto LABEL_10;
  }
  v53 = v73;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v73, v8, v34);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v13, v53, v34);
  v39 = sub_10001B374((uint64_t)v13);
  v54 = v72;
  static GKLog.friending.getter(v39);
  v55 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 16))(v22, v27, v18);
  v56 = Logger.logObject.getter(v55);
  v57 = static os_log_type_t.info.getter();
  v58 = v57;
  if (os_log_type_enabled(v56, v57))
  {
    v59 = swift_slowAlloc(12, -1);
    v70 = v58;
    v60 = (uint8_t *)v59;
    v71 = swift_slowAlloc(32, -1);
    v81 = v71;
    v69 = v60;
    *(_DWORD *)v60 = 136315138;
    v61 = sub_10001DD34();
    v62 = dispatch thunk of CustomStringConvertible.description.getter(v18, v61);
    v64 = v63;
    v80 = sub_10003EE08(v62, v63, &v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
    swift_bridgeObjectRelease(v64);
    v65 = *(void (**)(char *, uint64_t))(v19 + 8);
    v65(v22, v18);
    v66 = v69;
    _os_log_impl((void *)&_mh_execute_header, v56, (os_log_type_t)v70, "PlayerModel.init url: %s", v69, 0xCu);
    v67 = v71;
    swift_arrayDestroy(v71, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v67, -1, -1);
    swift_slowDealloc(v66, -1, -1);

    v42 = v77;
    v41 = v78;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v72, v78);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v73, v74);
  }
  else
  {

    v65 = *(void (**)(char *, uint64_t))(v19 + 8);
    v65(v22, v18);
    v42 = v77;
    v41 = v78;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v54, v78);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v73, v34);
  }
  v40 = ((uint64_t (*)(char *, uint64_t))v65)(v27, v18);
LABEL_10:
  v43 = v79;
  static GKLog.friending.getter(v40);
  v44 = v39;
  v45 = Logger.logObject.getter(v44);
  v46 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc(12, -1);
    v48 = swift_slowAlloc(32, -1);
    v81 = v48;
    *(_DWORD *)v47 = 136315138;
    v49 = sub_100014C1C();
    v51 = v50;
    v80 = sub_10003EE08(v49, v50, &v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);

    swift_bridgeObjectRelease(v51);
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "PlayerModel.init playerModel: %s", v47, 0xCu);
    swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1, -1);
    swift_slowDealloc(v47, -1, -1);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v79, v41);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v41);
  }
  return v44;
}

uint64_t sub_10001D15C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  uint64_t result;
  unint64_t v18;
  Swift::String v19;
  void *object;
  unint64_t v21;
  unint64_t v22;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005170(&qword_100059208);
  __chkstk_darwin(v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URLComponents(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v21 - v14;
  URLComponents.init(url:resolvingAgainstBaseURL:)(a1, 0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10000527C((uint64_t)v8, &qword_100059208);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    v21 = 0;
    v22 = 0xE000000000000000;
    _StringGuts.grow(_:)(39);
    swift_bridgeObjectRelease(v22);
    v21 = 0xD000000000000025;
    v22 = 0x8000000100042A20;
    v18 = sub_10001DD34();
    v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v2, v18);
    object = v19._object;
    String.append(_:)(v19);
    swift_bridgeObjectRelease(object);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v21, v22, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 125, 0);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    v16 = sub_10001B374((uint64_t)v13);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    return (uint64_t)v16;
  }
  return result;
}

void sub_10001D3AC(char *a1, char *a2, char *a3, uint64_t (*a4)(_QWORD), NSObject *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char **v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  uint64_t v27;
  uint8_t *v28;
  char **v29;
  char *v30;
  char *v31;
  uint8_t *v32;
  char *v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  os_log_t v38;
  uint64_t v39;
  char **v40;
  char *v41;
  char *v42;
  id v43;
  char *v44;
  NSString v45;
  NSObject *v46;
  os_log_type_t v47;
  int v48;
  uint64_t v49;
  char **v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t *v58;
  _QWORD *v59;
  void *v60;
  _QWORD *v61;
  char *v62;
  uint8_t *v63;
  uint8_t *v64;
  uint64_t *v65;
  char **v66;
  uint64_t v67;
  os_log_t v68;
  char *v69;
  char *v70;
  uint64_t (*v71)(_QWORD);
  uint64_t v72;
  __int128 aBlock;
  uint64_t (*v74)(uint64_t, uint64_t, uint64_t, void *, void *, void *);
  void *v75;
  uint64_t (*v76)(uint64_t, uint64_t, uint64_t, void *, void *, uint64_t);
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;

  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v63 - v15;
  v17 = (char **)swift_allocObject(&unk_100052440, 48, 7);
  v17[2] = a2;
  v17[3] = a3;
  v71 = a4;
  v17[4] = (char *)a4;
  v17[5] = (char *)a5;
  v18 = (void *)objc_opt_self(GKLocalPlayer);
  v70 = a2;
  v69 = a3;
  swift_retain(a5);
  v19 = objc_msgSend(v18, "local");
  v20 = objc_msgSend(v19, "isAuthenticated");
  if ((_DWORD)v20
    && (v21 = *(_QWORD *)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8]) != 0)
  {
    v67 = v10;
    v71 = *(uint64_t (**)(_QWORD))&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
    v22 = swift_bridgeObjectRetain(v21);
    static GKLog.friending.getter(v22);
    v23 = a1;
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.info.getter();
    v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      v27 = swift_slowAlloc(22, -1);
      LODWORD(v69) = v26;
      v28 = (uint8_t *)v27;
      v29 = (char **)swift_slowAlloc(8, -1);
      v66 = v29;
      v70 = (char *)swift_slowAlloc(32, -1);
      *(_QWORD *)&aBlock = v70;
      v63 = v28;
      *(_DWORD *)v28 = 138412546;
      v68 = v24;
      v78 = v23;
      v65 = &v79;
      v30 = v23;
      v72 = v11;
      v31 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79);
      *v29 = v23;

      v32 = v63;
      *((_WORD *)v63 + 6) = 2080;
      v64 = v32 + 14;
      v33 = v31;
      v34 = objc_msgSend(v33, "description");
      v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
      v37 = v36;

      v78 = (_QWORD *)sub_10003EE08(v35, v37, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, v65);

      swift_bridgeObjectRelease(v37);
      v38 = v68;
      _os_log_impl((void *)&_mh_execute_header, v68, (os_log_type_t)v69, " %@ View friend code details for playerModel: %s", v32, 0x16u);
      v39 = sub_100005170((uint64_t *)&unk_100058CB0);
      v40 = v66;
      swift_arrayDestroy(v66, 1, v39);
      swift_slowDealloc(v40, -1, -1);
      v41 = v70;
      swift_arrayDestroy(v70, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v72 + 8))(v16, v67);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v67);
    }
    v45 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
    v59 = (_QWORD *)swift_allocObject(&unk_100052468, 40, 7);
    v59[2] = v23;
    v59[3] = sub_10001DA90;
    v59[4] = v17;
    v76 = sub_10001DAA0;
    v77 = v59;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v74 = sub_10001565C;
    v75 = &unk_100052480;
    v60 = _Block_copy(&aBlock);
    v61 = v77;
    v62 = v23;
    swift_retain(v17);
    swift_release(v61);
    objc_msgSend(v19, "getPlayerIDFromFriendCode:handler:", v45, v60);

    _Block_release(v60);
  }
  else
  {
    v68 = a5;
    v72 = v11;
    static GKLog.friending.getter(v20);
    v42 = a1;
    v43 = v19;
    v44 = v42;
    v45 = v43;
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.info.getter();
    v48 = v47;
    if (os_log_type_enabled(v46, v47))
    {
      v49 = swift_slowAlloc(28, -1);
      v50 = (char **)swift_slowAlloc(8, -1);
      v65 = (uint64_t *)swift_slowAlloc(32, -1);
      v78 = v65;
      *(_DWORD *)v49 = 138412802;
      LODWORD(v64) = v48;
      v66 = v17;
      v67 = v10;
      *(_QWORD *)&aBlock = v44;
      v51 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 8);
      *v50 = v44;

      *(_WORD *)(v49 + 12) = 2080;
      aBlock = *(_OWORD *)&v51[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
      v52 = sub_100005170((uint64_t *)&qword_1000591D8);
      v53 = Optional.nonNilDescription.getter(v52);
      v55 = v54;
      *(_QWORD *)&aBlock = sub_10003EE08(v53, v54, (uint64_t *)&v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 8);

      swift_bridgeObjectRelease(v55);
      *(_WORD *)(v49 + 22) = 1024;
      v56 = objc_msgSend(v45, "isAuthenticated");

      LODWORD(aBlock) = v56;
      v17 = v66;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4);

      _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v64, "%@ Could not fetch playerID using friend code %s, local player authentication status: %{BOOL}d", (uint8_t *)v49, 0x1Cu);
      v57 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v50, 1, v57);
      swift_slowDealloc(v50, -1, -1);
      v58 = v65;
      swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v58, -1, -1);
      swift_slowDealloc(v49, -1, -1);

      (*(void (**)(char *, uint64_t))(v72 + 8))(v14, v67);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v72 + 8))(v14, v10);
    }
    sub_100017638(0, v70, v69, v71, (uint64_t)v68);
  }
  swift_release(v17);

}

void sub_10001DA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100017154(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void (**)(_QWORD))(v2 + 32));
}

uint64_t sub_10001DA5C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001DA90(void **a1)
{
  uint64_t v1;

  return sub_100017638(a1, *(void **)(v1 + 16), *(char **)(v1 + 24), *(uint64_t (**)(_QWORD))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_10001DAA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v6;

  return sub_10001554C(a1, a2, a3, a4, a5, a6, *(_QWORD *)(v6 + 16), *(uint64_t (**)(uint64_t))(v6 + 24));
}

uint64_t sub_10001DAC8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 48, 7);
}

void sub_10001DAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100017DE4(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(char **)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_10001DB08()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001DB44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100017FB8(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(uint64_t (**)(_QWORD))(v2 + 48));
}

uint64_t sub_10001DB54(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10001DC4C(uint64_t a1)
{
  uint64_t v1;

  return sub_100018484(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

uint64_t sub_10001DC5C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001DC90(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);

  v3 = v1[3];
  v4 = v1[4];
  v5 = (uint64_t (*)(uint64_t))v1[5];
  if (!a1)
    *(_BYTE *)(v1[2] + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeState) = 1;
  sub_100015ACC(v3, v4);
  return v5(a1);
}

uint64_t sub_10001DCEC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10001DD20(uint64_t a1)
{
  uint64_t v1;

  return sub_1000158C0(a1, *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(uint64_t (**)(uint64_t))(v1 + 48));
}

unint64_t sub_10001DD34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059210;
  if (!qword_100059210)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100059210);
  }
  return result;
}

void sub_10001DD7C(uint64_t a1)
{
  uint64_t v1;

  sub_100037CB4(a1, *(unsigned __int8 *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_10001DD98(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10001DDAC(result, a2);
  return result;
}

uint64_t sub_10001DDAC(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001DDF0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_10001DE10(char *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  char *v25;
  char *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  os_log_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t aBlock[5];
  _QWORD *v53;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject(&unk_100052698, 24, 7);
  v9 = v8;
  *(_QWORD *)(v8 + 16) = a2;
  v10 = OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState;
  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState] == 1)
  {
    v11 = (void *)objc_opt_self(GKLocalPlayer);
    v12 = a2;
    v50 = objc_msgSend(v11, "local");
    if (a1[v10] == 1
      && (v13 = *(_QWORD *)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8]) != 0)
    {
      v14 = *(_QWORD *)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
      swift_bridgeObjectRetain(*(_QWORD *)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8]);
      static GKLog.friending.getter(v15);
      v16 = a1;
      v17 = Logger.logObject.getter(v16);
      v18 = static os_log_type_t.info.getter();
      v19 = v18;
      if (os_log_type_enabled(v17, v18))
      {
        v20 = swift_slowAlloc(22, -1);
        v45 = v19;
        v21 = v20;
        v22 = swift_slowAlloc(8, -1);
        v46 = v13;
        v23 = (_QWORD *)v22;
        v44 = v22;
        v47 = swift_slowAlloc(32, -1);
        v51 = (uint64_t)v16;
        aBlock[0] = v47;
        *(_DWORD *)v21 = 138412546;
        v49 = v14;
        v43 = v5;
        v24 = v16;
        v48 = v4;
        v25 = v24;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, aBlock);
        *v23 = v16;
        v13 = v46;

        *(_WORD *)(v21 + 12) = 2080;
        v42 = v21 + 14;
        v26 = v25;
        v27 = objc_msgSend(v26, "description");
        v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
        v41 = v17;
        v30 = v29;

        v51 = sub_10003EE08(v28, v30, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, aBlock);

        swift_bridgeObjectRelease(v30);
        v31 = v41;
        _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)v45, "%@ CANCEL friend request for playerModel: %s", (uint8_t *)v21, 0x16u);
        v32 = sub_100005170((uint64_t *)&unk_100058CB0);
        v33 = v44;
        swift_arrayDestroy(v44, 1, v32);
        swift_slowDealloc(v33, -1, -1);
        v34 = v47;
        swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v34, -1, -1);
        swift_slowDealloc(v21, -1, -1);

        (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v48);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      v35 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v13);
      v36 = (_QWORD *)swift_allocObject(&unk_1000526C0, 40, 7);
      v36[2] = v16;
      v36[3] = sub_10001E2A4;
      v36[4] = v9;
      aBlock[4] = (uint64_t)sub_10001E2B0;
      v53 = v36;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100016274;
      aBlock[3] = (uint64_t)&unk_1000526D8;
      v37 = _Block_copy(aBlock);
      v38 = v53;
      v39 = v16;
      swift_retain(v9);
      swift_release(v38);
      objc_msgSend(v50, "cancelFriendRequestWithIdentifier:handler:", v35, v37);

      _Block_release(v37);
      swift_release(v9);

    }
    else
    {
      sub_10002C138(0, v12);
      swift_release(v9);

    }
  }
  else
  {
    swift_release(v8);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002CLL, 0x8000000100042AC0, "GameCenterMessageExtension/PlayerModel.swift", 44, 2, 384, 0);
    __break(1u);
  }
}

uint64_t sub_10001E2A4(uint64_t a1)
{
  uint64_t v1;

  return sub_10002C138(a1, *(void **)(v1 + 16));
}

uint64_t sub_10001E2B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t))(v1 + 24);
  if (!a1)
  {
    v4 = *(_QWORD *)(v1 + 16);
    *(_BYTE *)(v4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState) = 0;
    v5 = (_QWORD *)(v4 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode);
    v6 = v5[1];
    *v5 = 0;
    v5[1] = 0;
    swift_bridgeObjectRelease(v6);
  }
  return v3(a1);
}

uint64_t sub_10001E310()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001E33C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100018904(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_10001E344()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_10001E370()
{
  uint64_t v0;
  void (*v1)(void);
  id v2;

  v1 = *(void (**)(void))(v0 + 16);
  v2 = objc_msgSend(*(id *)(v0 + 32), "error");
  v1();

}

uint64_t sub_10001E3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10001897C(a1, a2, *(void **)(v2 + 16), *(uint64_t (**)(void))(v2 + 24));
}

uint64_t sub_10001E3D4()
{
  id *v0;

  return swift_deallocObject(v0, 40, 7);
}

void sub_10001E408(uint64_t a1)
{
  uint64_t v1;

  sub_100009CAC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_10001E418()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10001E43C(uint64_t a1)
{
  uint64_t v1;

  sub_10002EA94(a1, *(void **)(v1 + 16));
}

uint64_t getEnumTagSinglePayload for PlayerModel.URLPropertiesVersion(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PlayerModel.URLPropertiesVersion(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001E524 + 4 * byte_1000443F9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10001E558 + 4 * byte_1000443F4[v4]))();
}

uint64_t sub_10001E558(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001E560(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001E568);
  return result;
}

uint64_t sub_10001E574(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001E57CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10001E580(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001E588(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlayerModel.URLPropertiesVersion()
{
  return &type metadata for PlayerModel.URLPropertiesVersion;
}

unint64_t sub_10001E5A8()
{
  unint64_t result;

  result = qword_100059290;
  if (!qword_100059290)
  {
    result = swift_getWitnessTable(&unk_1000446F0, &type metadata for PlayerModel.URLPropertiesVersion);
    atomic_store(result, (unint64_t *)&qword_100059290);
  }
  return result;
}

void sub_10001E688(void (*a1)(_QWORD), uint64_t a2)
{
  char *v2;
  uint64_t v5;
  void *v6;
  Class isa;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  id v19;
  char *v20;
  id v21;
  id v22;
  void **aBlock;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, void *);
  void *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  _QWORD *v28;

  v5 = *(_QWORD *)&v2[qword_1000599A0];
  if (*(_QWORD *)(v5 + 16))
  {
    v6 = (void *)objc_opt_self(GKPlayer);
    swift_bridgeObjectRetain(v5);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
    v8 = (_QWORD *)swift_allocObject(&unk_100052A30, 40, 7);
    v8[2] = v2;
    v8[3] = a1;
    v8[4] = a2;
    v27 = sub_10001EBC4;
    v28 = v8;
    aBlock = _NSConcreteStackBlock;
    v24 = 1107296256;
    v25 = sub_1000175AC;
    v26 = &unk_100052A48;
    v9 = _Block_copy(&aBlock);
    v10 = v28;
    v11 = v2;
    swift_retain(a2);
    swift_release(v10);
    objc_msgSend(v6, "loadPlayersForIdentifiers:withCompletionHandler:", isa, v9);
    _Block_release(v9);

  }
  else
  {
    v12 = *(void **)&v2[qword_100059998];
    if (v12)
    {
      v13 = objc_opt_self(GKLocalPlayer);
      v14 = swift_dynamicCastObjCClass(v12, v13);
      if (v14)
      {
        v15 = (void *)v14;
        v16 = (_QWORD *)swift_allocObject(&unk_1000529E0, 40, 7);
        v16[2] = v2;
        v16[3] = a1;
        v16[4] = a2;
        v27 = sub_10001EB9C;
        v28 = v16;
        aBlock = _NSConcreteStackBlock;
        v24 = 1107296256;
        v25 = sub_1000175AC;
        v26 = &unk_1000529F8;
        v17 = _Block_copy(&aBlock);
        v18 = v28;
        v19 = v12;
        v20 = v2;
        swift_retain(a2);
        v21 = v19;
        swift_release(v18);
        objc_msgSend(v15, "loadRecentPlayersWithCompletionHandler:", v17);

        _Block_release(v17);
      }
      else
      {
        v22 = v12;
        a1(0);

      }
    }
    else
    {
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000011, 0x80000001000424C0, "GameCenterMessageExtension/FriendsModel.swift", 45, 2, 47, 0);
      __break(1u);
    }
  }
}

uint64_t sub_10001E904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  if (a1)
  {
    v6 = *(_QWORD *)(a3 + qword_1000599A8);
    *(_QWORD *)(a3 + qword_1000599A8) = a1;
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRelease(v6);
  }
  return a4(a2);
}

uint64_t sub_10001E95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (a1)
  {
    v8 = *(_QWORD *)(a3 + qword_1000599A8);
    *(_QWORD *)(a3 + qword_1000599A8) = a1;
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRelease(v8);
    if ((unint64_t)a1 >> 62)
    {
      if (a1 >= 0)
        v11 = a1 & 0xFFFFFFFFFFFFFF8;
      else
        v11 = a1;
      swift_bridgeObjectRetain(a1);
      v9 = _CocoaArrayWrapper.endIndex.getter(v11);
      swift_bridgeObjectRelease(a1);
    }
    else
    {
      v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    *(_QWORD *)(a3 + qword_1000599B0) = v9;
  }
  return a4(a2);
}

id sub_10001EA0C(void *a1)
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for FriendsModel(0);
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001EA4C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FriendsModel(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001EA80(uint64_t a1)
{
  uint64_t result;

  result = sub_10001EB14(&qword_1000592A0, (uint64_t)&protocol conformance descriptor for GKPlayer);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001EAB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100058CE8;
  if (!qword_100058CE8)
  {
    v1 = objc_opt_self(GKPlayer);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100058CE8);
  }
  return result;
}

uint64_t sub_10001EAF0()
{
  return sub_10001EB14(&qword_1000592A8, (uint64_t)&protocol conformance descriptor for NSObject);
}

uint64_t sub_10001EB14(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_10001EAB4();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for FriendsModel(uint64_t a1)
{
  uint64_t result;

  result = qword_1000592D8;
  if (!qword_1000592D8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FriendsModel);
  return result;
}

uint64_t sub_10001EB90()
{
  return type metadata accessor for FriendsModel(0);
}

uint64_t sub_10001EB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10001E95C(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(uint64_t))(v2 + 24));
}

uint64_t sub_10001EBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001EBB8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001EBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10001E904(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(uint64_t))(v2 + 24));
}

uint64_t destroy for FriendInviteGroupAcceptedStatusView(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 16));
}

_QWORD *_s26GameCenterMessageExtension35FriendInviteGroupAcceptedStatusViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a2[2];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = v4;
  swift_retain(v4);
  return a1;
}

_QWORD *assignWithCopy for FriendInviteGroupAcceptedStatusView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[2];
  v4 = a1[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

__n128 initializeWithTake for FriendInviteGroupAcceptedStatusView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FriendInviteGroupAcceptedStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteGroupAcceptedStatusView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteGroupAcceptedStatusView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteGroupAcceptedStatusView()
{
  return &type metadata for FriendInviteGroupAcceptedStatusView;
}

uint64_t sub_10001ED3C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100045F64, 1);
}

uint64_t sub_10001ED4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
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
  char v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  void (*v47)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  char v75;

  v50 = a3;
  v51 = a2;
  v59 = a4;
  v5 = sub_100005170(&qword_1000594B0);
  v57 = *(_QWORD *)(v5 - 8);
  v58 = v5;
  v6 = __chkstk_darwin(v5);
  v56 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v60 = (char *)&v49 - v8;
  v9 = type metadata accessor for Divider(0);
  v54 = *(_QWORD *)(v9 - 8);
  v55 = v9;
  v10 = __chkstk_darwin(v9);
  v53 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v52 = (char *)&v49 - v13;
  v14 = Divider.init()(v12);
  v19 = static HorizontalAlignment.center.getter(v14, v15, v16, v17, v18);
  sub_10001F020(a1, (uint64_t)&v61);
  v21 = v61;
  v20 = v62;
  v22 = v63;
  v23 = v64;
  v24 = v65;
  v25 = BYTE1(v65);
  v26 = v66;
  v27 = v67;
  v28 = v68;
  v49 = v70;
  v29 = v71;
  v30 = BYTE1(v71);
  v61 = v19;
  v62 = 0x4010000000000000;
  v63 = 0;
  v64 = v21;
  v65 = v20;
  LOBYTE(v66) = v22;
  v67 = v23;
  v68 = v24;
  v69 = v25;
  v70 = v26;
  v71 = v27;
  v72 = v28;
  v73 = v49;
  v74 = v29;
  v75 = v30;
  v31 = sub_100005170(&qword_1000594B8);
  v32 = sub_10001F3FC(&qword_1000594C0, &qword_1000594B8);
  v33 = v60;
  View.onTapGesture(count:perform:)(1, v51, v50, v31, v32);
  sub_100004304(v21, v20, v22);
  swift_bridgeObjectRelease(v23);
  sub_100004304(v26, v27, v28);
  swift_bridgeObjectRelease(v49);
  v34 = v53;
  v35 = v54;
  v36 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  v37 = v52;
  v38 = v55;
  v36(v53, v52, v55);
  v39 = v56;
  v40 = v57;
  v41 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  v42 = v33;
  v43 = v58;
  v41(v56, v42, v58);
  v44 = v59;
  v36(v59, v34, v38);
  v45 = sub_100005170(&qword_1000594C8);
  v41(&v44[*(int *)(v45 + 48)], v39, v43);
  v46 = *(void (**)(char *, uint64_t))(v40 + 8);
  v46(v60, v43);
  v47 = *(void (**)(char *, uint64_t))(v35 + 8);
  v47(v37, v38);
  v46(v39, v43);
  return ((uint64_t (*)(char *, uint64_t))v47)(v34, v38);
}

uint64_t sub_10001F020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  Swift::String v28;
  Swift::String v29;
  Swift::String v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
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
  char v55;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  Swift::String v61;
  Swift::String v62;
  Swift::String v63;

  v4 = (id)GKGameCenterUIFrameworkBundle(a1);
  v62._object = (void *)0xE000000000000000;
  v5._object = (void *)0x80000001000421E0;
  v5._countAndFlagsBits = 0xD00000000000001ALL;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v62._countAndFlagsBits = 0;
  v7 = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, v62);

  v8 = sub_100005170(&qword_100058C70);
  v9 = swift_allocObject(v8, 72, 7);
  *(_OWORD *)(v9 + 16) = xmmword_100044020;
  *(_QWORD *)(v9 + 56) = &type metadata for Int;
  *(_QWORD *)(v9 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v9 + 32) = a1;
  v10 = String.init(format:_:)(v7._countAndFlagsBits, v7._object, v9);
  v12 = v11;
  swift_bridgeObjectRelease(v7._object);
  v61._countAndFlagsBits = v10;
  v61._object = v12;
  v13 = sub_1000042C0();
  v14 = Text.init<A>(_:)(&v61, &type metadata for String, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19 & 1;
  v21 = static Font.footnote.getter();
  v22 = Text.font(_:)(v21, v14, v16, v20, v18);
  v58 = v23;
  v59 = v22;
  LOBYTE(v10) = v24;
  v60 = v25;
  swift_release(v21);
  v57 = v10 & 1;
  sub_100004304(v14, v16, v20);
  v26 = swift_bridgeObjectRelease(v18);
  v27 = (id)GKGameCenterUIFrameworkBundle(v26);
  v28._countAndFlagsBits = 0xD00000000000001CLL;
  v63._object = (void *)0xE000000000000000;
  v28._object = (void *)0x8000000100042200;
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  v63._countAndFlagsBits = 0;
  v30 = NSLocalizedString(_:tableName:bundle:value:comment:)(v28, (Swift::String_optional)0, (NSBundle)v27, v29, v63);

  v61 = v30;
  v31 = Text.init<A>(_:)(&v61, &type metadata for String, v13);
  v33 = v32;
  v35 = v34;
  v37 = v36 & 1;
  v38 = static Font.footnote.getter();
  v39 = Font.bold()();
  swift_release(v38);
  v40 = Text.font(_:)(v39, v31, v33, v37, v35);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  swift_release(v39);
  v47 = v44 & 1;
  sub_100004304(v31, v33, v37);
  v48 = swift_bridgeObjectRelease(v35);
  v49 = static Color.blue.getter(v48);
  v61._countAndFlagsBits = v49;
  v50 = Text.foregroundStyle<A>(_:)(&v61, v40, v42, v47, v46, &type metadata for Color, &protocol witness table for Color);
  v52 = v51;
  v54 = v53;
  LOBYTE(v39) = v55 & 1;
  sub_100004304(v40, v42, v47);
  swift_release(v49);
  swift_bridgeObjectRelease(v46);
  LOBYTE(v61._countAndFlagsBits) = v57;
  *(_QWORD *)a2 = v59;
  *(_QWORD *)(a2 + 8) = v58;
  *(_BYTE *)(a2 + 16) = v57;
  *(_QWORD *)(a2 + 24) = v60;
  *(_WORD *)(a2 + 32) = 256;
  *(_QWORD *)(a2 + 40) = v50;
  *(_QWORD *)(a2 + 48) = v52;
  *(_BYTE *)(a2 + 56) = v39;
  *(_QWORD *)(a2 + 64) = v54;
  *(_WORD *)(a2 + 72) = 256;
  sub_1000051F4(v59, v58, v57);
  swift_bridgeObjectRetain(v60);
  sub_1000051F4(v50, v52, v39);
  swift_bridgeObjectRetain(v54);
  sub_100004304(v50, v52, v39);
  swift_bridgeObjectRelease(v54);
  sub_100004304(v59, v58, v61._countAndFlagsBits);
  return swift_bridgeObjectRelease(v60);
}

uint64_t sub_10001F378@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *v6;
  v9 = v6[1];
  v10 = v6[2];
  *(_QWORD *)a6 = static HorizontalAlignment.center.getter(a1, a2, a3, a4, a5);
  *(_QWORD *)(a6 + 8) = 0x4024000000000000;
  *(_BYTE *)(a6 + 16) = 0;
  v11 = sub_100005170(&qword_1000594A8);
  return sub_10001ED4C(v8, v9, v10, (char *)(a6 + *(int *)(v11 + 44)));
}

uint64_t sub_10001F3D8()
{
  return sub_10001F3FC(&qword_1000594D0, &qword_1000594D8);
}

uint64_t sub_10001F3FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000437C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for FriendInviteInfoCardViewModel(uint64_t a1)
{

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  swift_release(*(_QWORD *)(a1 + 48));
  swift_release(*(_QWORD *)(a1 + 64));
  return swift_release(*(_QWORD *)(a1 + 80));
}

uint64_t initializeWithCopy for FriendInviteInfoCardViewModel(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v8 = *(_OWORD *)(a2 + 32);
  v9 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 48) = v9;
  v5 = *(_QWORD *)(a2 + 80);
  v10 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 80) = v5;
  v6 = v3;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v8);
  swift_retain(v9);
  swift_retain(v10);
  swift_retain(v5);
  return a1;
}

uint64_t assignWithCopy for FriendInviteInfoCardViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
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

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  v11 = *(_QWORD *)(a2 + 48);
  v12 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v11;
  swift_retain(v11);
  swift_release(v12);
  v13 = *(_QWORD *)(a2 + 64);
  v14 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v13;
  swift_retain(v13);
  swift_release(v14);
  v16 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a2 + 80);
  v17 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 72) = v16;
  *(_QWORD *)(a1 + 80) = v15;
  swift_retain(v15);
  swift_release(v17);
  return a1;
}

__n128 initializeWithTake for FriendInviteInfoCardViewModel(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for FriendInviteInfoCardViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v5 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release(v6);
  v7 = *(_QWORD *)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release(v7);
  v8 = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteInfoCardViewModel(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteInfoCardViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteInfoCardViewModel()
{
  return &type metadata for FriendInviteInfoCardViewModel;
}

uint64_t initializeBufferWithCopyOfBuffer for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

_QWORD *assignWithCopy for FriendInviteInfoCardViewModel.PlayerStatMetadata(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FriendInviteInfoCardViewModel.PlayerStatMetadata(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FriendInviteInfoCardViewModel.PlayerStatMetadata()
{
  return &type metadata for FriendInviteInfoCardViewModel.PlayerStatMetadata;
}

uint64_t sub_10001F8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_10001F8B4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_10002015C(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = "X";
    v4[2] = (char *)&value witness table for () + 64;
    swift_initStructMetadata(a1, 0, 3, v4, a1 + 32);
  }
}

uint64_t *sub_10001F934(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100005170(&qword_1000594E0);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4, a2, v8);
      v9 = v4;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *v4 = *a2;
      swift_retain(v13);
      v9 = v4;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 36);
    v15 = *(int *)(a3 + 40);
    v16 = (char *)v4 + v14;
    v17 = (char *)a2 + v14;
    v18 = *(void **)v17;
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *((_WORD *)v16 + 4) = *((_WORD *)v17 + 4);
    v19 = *((_QWORD *)v17 + 3);
    *((_QWORD *)v16 + 2) = *((_QWORD *)v17 + 2);
    *((_QWORD *)v16 + 3) = v19;
    v25 = *((_OWORD *)v17 + 2);
    v26 = *((_OWORD *)v17 + 3);
    *((_OWORD *)v16 + 2) = v25;
    *((_OWORD *)v16 + 3) = v26;
    v20 = *((_QWORD *)v17 + 10);
    v27 = *((_OWORD *)v17 + 4);
    *((_OWORD *)v16 + 4) = v27;
    *((_QWORD *)v16 + 10) = v20;
    v21 = (uint64_t *)((char *)v4 + v15);
    v22 = (uint64_t *)((char *)a2 + v15);
    v12 = v22[1];
    *v21 = *v22;
    v21[1] = v12;
    v23 = v18;
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v25);
    swift_retain(v26);
    swift_retain(v27);
    swift_retain(v20);
  }
  swift_retain(v12);
  return v4;
}

uint64_t sub_10001FA98(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;

  v4 = sub_100005170(&qword_1000594E0);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (char *)a1 + *(int *)(a2 + 36);

  swift_bridgeObjectRelease(*((_QWORD *)v6 + 3));
  swift_bridgeObjectRelease(*((_QWORD *)v6 + 4));
  swift_release(*((_QWORD *)v6 + 6));
  swift_release(*((_QWORD *)v6 + 8));
  swift_release(*((_QWORD *)v6 + 10));
  return swift_release(*(_QWORD *)((char *)a1 + *(int *)(a2 + 40) + 8));
}

uint64_t *sub_10001FB4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v6 = sub_100005170(&qword_1000594E0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 36);
  v13 = *(int *)(a3 + 40);
  v14 = (char *)a1 + v12;
  v15 = (char *)a2 + v12;
  v16 = *(void **)v15;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *((_WORD *)v14 + 4) = *((_WORD *)v15 + 4);
  v17 = *((_QWORD *)v15 + 3);
  *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
  *((_QWORD *)v14 + 3) = v17;
  v24 = *((_OWORD *)v15 + 2);
  v25 = *((_OWORD *)v15 + 3);
  *((_OWORD *)v14 + 2) = v24;
  *((_OWORD *)v14 + 3) = v25;
  v18 = *((_QWORD *)v15 + 10);
  v26 = *((_OWORD *)v15 + 4);
  *((_OWORD *)v14 + 4) = v26;
  *((_QWORD *)v14 + 10) = v18;
  v19 = (uint64_t *)((char *)a1 + v13);
  v20 = (uint64_t *)((char *)a2 + v13);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = v16;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v24);
  swift_retain(v25);
  swift_retain(v26);
  swift_retain(v18);
  swift_retain(v21);
  return a1;
}

uint64_t *sub_10001FC88(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
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
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;

  if (a1 != a2)
  {
    sub_10000527C((uint64_t)a1, &qword_1000594E0);
    v6 = sub_100005170(&qword_1000594E0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = *(int *)(a3 + 36);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *(void **)((char *)a2 + v12);
  v16 = *(void **)v13;
  *(_QWORD *)v13 = v15;
  v17 = v15;

  v13[8] = v14[8];
  v13[9] = v14[9];
  *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
  v18 = *((_QWORD *)v14 + 3);
  v19 = *((_QWORD *)v13 + 3);
  *((_QWORD *)v13 + 3) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  v20 = *((_QWORD *)v14 + 4);
  v21 = *((_QWORD *)v13 + 4);
  *((_QWORD *)v13 + 4) = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  v22 = *((_QWORD *)v14 + 6);
  v23 = *((_QWORD *)v13 + 6);
  *((_QWORD *)v13 + 5) = *((_QWORD *)v14 + 5);
  *((_QWORD *)v13 + 6) = v22;
  swift_retain(v22);
  swift_release(v23);
  v24 = *((_QWORD *)v14 + 8);
  v25 = *((_QWORD *)v13 + 8);
  *((_QWORD *)v13 + 7) = *((_QWORD *)v14 + 7);
  *((_QWORD *)v13 + 8) = v24;
  swift_retain(v24);
  swift_release(v25);
  v26 = *((_QWORD *)v14 + 10);
  v27 = *((_QWORD *)v13 + 10);
  *((_QWORD *)v13 + 9) = *((_QWORD *)v14 + 9);
  *((_QWORD *)v13 + 10) = v26;
  swift_retain(v26);
  swift_release(v27);
  v28 = *(int *)(a3 + 40);
  v29 = (uint64_t *)((char *)a1 + v28);
  v30 = (uint64_t *)((char *)a2 + v28);
  v31 = v30[1];
  v32 = v29[1];
  *v29 = *v30;
  v29[1] = v31;
  swift_retain(v31);
  swift_release(v32);
  return a1;
}

char *sub_10001FE1C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;

  v6 = sub_100005170(&qword_1000594E0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 36);
  v9 = *(int *)(a3 + 40);
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *((_OWORD *)v11 + 3);
  *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
  *((_OWORD *)v10 + 3) = v12;
  *((_OWORD *)v10 + 4) = *((_OWORD *)v11 + 4);
  *((_QWORD *)v10 + 10) = *((_QWORD *)v11 + 10);
  v13 = *((_OWORD *)v11 + 1);
  *(_OWORD *)v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v13;
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  return a1;
}

char *sub_10001FEEC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 != a2)
  {
    sub_10000527C((uint64_t)a1, &qword_1000594E0);
    v6 = sub_100005170(&qword_1000594E0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 36);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *(void **)&a1[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];

  v9[8] = v10[8];
  v9[9] = v10[9];
  v12 = *((_QWORD *)v10 + 3);
  v13 = *((_QWORD *)v9 + 3);
  *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
  *((_QWORD *)v9 + 3) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *((_QWORD *)v9 + 4);
  *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
  swift_bridgeObjectRelease(v14);
  v15 = *((_QWORD *)v9 + 6);
  *(_OWORD *)(v9 + 40) = *(_OWORD *)(v10 + 40);
  swift_release(v15);
  v16 = *((_QWORD *)v9 + 8);
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(v10 + 56);
  swift_release(v16);
  v17 = *((_QWORD *)v9 + 10);
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(v10 + 72);
  swift_release(v17);
  v18 = *(int *)(a3 + 40);
  v19 = *(_QWORD *)&a1[v18 + 8];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  swift_release(v19);
  return a1;
}

uint64_t sub_10002003C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020048);
}

uint64_t sub_100020048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100005170(qword_1000594E8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000200C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000200D4);
}

uint64_t sub_1000200D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100005170(qword_1000594E8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for FriendInviteInfoCardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100022D40(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FriendInviteInfoCardView);
}

void sub_10002015C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100059570)
  {
    v2 = type metadata accessor for ContentSizeCategory(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100059570);
  }
}

uint64_t sub_1000201B0(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &unk_100046000, 1);
}

uint64_t sub_1000201E4(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    __chkstk_darwin();
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *a1++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return TupleView.init(_:)(v8, TupleTypeMetadata);
  }
  __chkstk_darwin();
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata(0, a2);
  __chkstk_darwin();
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return TupleView.init(_:)(v8, TupleTypeMetadata);
}

uint64_t sub_100020398()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v1 = type metadata accessor for AttributeContainer(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  v5 = objc_msgSend(*v0, "displayNameWithOptions:", 0);
  if (!v5)
    v5 = objc_msgSend(v4, "displayName");
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  AttributeContainer.init()();
  AttributedString.init(_:attributes:)(v6, v8, v3);
  KeyPath = swift_getKeyPath(&unk_100044A38);
  *(&v15 - 2) = __chkstk_darwin(KeyPath);
  v10 = swift_getKeyPath(&unk_100044A68);
  v11 = static Font.body.getter();
  v12 = Font.bold()();
  swift_release(v11);
  v16 = v12;
  v13 = sub_100022C64();
  return AttributedString.subscript.setter(&v16, v10, v13);
}

uint64_t sub_1000204EC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a2;
  v4 = *a1;
  v5 = v2;
  sub_100005170(&qword_1000596D0);
  return dispatch thunk of static Equatable.== infix(_:_:)(&v5, &v4) & 1;
}

uint64_t sub_100020544()
{
  uint64_t v0;

  v0 = sub_100005170(&qword_1000596D0);
  return dispatch thunk of Hashable.hashValue.getter(v0, &protocol witness table for AnyKeyPath);
}

void sub_100020588(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *a2;
  v3 = sub_100022C64();
  AttributeDynamicLookup.subscript.getter(v2, v3);
  __break(1u);
}

void sub_1000205AC()
{
  AttributeScopes.SwiftUIAttributes.font.getter();
  __break(1u);
}

BOOL sub_1000205C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  _BOOL8 v13;
  uint64_t v15;

  v2 = v1;
  v4 = *(_QWORD *)(a1 - 8);
  __chkstk_darwin(a1);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ContentSizeCategory(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100036CB8((uint64_t)v10);
  v12 = ContentSizeCategory.isAccessibilityCategory.getter(v11);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a1);
  v13 = (v12 & 1) == 0 && *(_QWORD *)(*(_QWORD *)&v6[*(int *)(a1 + 36) + 32] + 16) != 0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  return v13;
}

uint64_t sub_1000206D8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t TupleTypeMetadata;
  uint64_t v8;
  uint64_t WitnessTable;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_BYTE *, _BYTE *, uint64_t);
  void (*v25)(_BYTE *, uint64_t);
  _BYTE v27[16];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v31 = sub_10000437C(&qword_100059578);
  v32 = sub_10000437C(&qword_100059580);
  v5 = sub_10000437C(&qword_100059588);
  v6 = *(_QWORD *)(a1 + 16);
  v33 = v5;
  v34 = v6;
  TupleTypeMetadata = swift_getTupleTypeMetadata(255, 4);
  v8 = type metadata accessor for TupleView(255, TupleTypeMetadata);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v8);
  v10 = type metadata accessor for VStack(0, v8, WitnessTable);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = &v27[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = __chkstk_darwin(v12);
  v17 = &v27[-v16];
  v18 = *(_QWORD *)(a1 + 24);
  v28 = v6;
  v29 = v18;
  v30 = v2;
  v23 = static HorizontalAlignment.center.getter(v15, v19, v20, v21, v22);
  VStack.init(alignment:spacing:content:)(v23, 0x4020000000000000, 0, sub_10002245C, v27, v8, WitnessTable);
  swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v10);
  v24 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v11 + 16);
  v24(v17, v14, v10);
  v25 = *(void (**)(_BYTE *, uint64_t))(v11 + 8);
  v25(v14, v10);
  v24(a2, v17, v10);
  return ((uint64_t (*)(_BYTE *, uint64_t))v25)(v17, v10);
}

uint64_t sub_100020870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
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
  _OWORD *v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t KeyPath;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  void (*v93)(char *, char *, uint64_t);
  uint64_t v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t);
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  void (*v114)(uint64_t, char *, uint64_t);
  uint64_t v115;
  uint64_t v116;
  void (*v117)(char *, uint64_t, uint64_t);
  char *v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t OpaqueTypeConformance2;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  _QWORD v142[4];
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  _OWORD v147[3];

  v128 = a4;
  v7 = *(_QWORD *)(a2 - 8);
  v133 = a2;
  v111 = v7;
  v8 = __chkstk_darwin(a1);
  v113 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v112 = (char *)&v105 - v10;
  v110 = sub_100005170(&qword_100059590);
  __chkstk_darwin(v110);
  v107 = (char *)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_100005170(&qword_100059598);
  __chkstk_darwin(v108);
  v109 = (uint64_t *)((char *)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v121 = type metadata accessor for GKFeatureFlags(0);
  v120 = *(_QWORD *)(v121 - 8);
  __chkstk_darwin(v121);
  v119 = (char *)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = sub_100005170(&qword_100059588);
  v14 = __chkstk_darwin(v124);
  v127 = (uint64_t)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v129 = (uint64_t)&v105 - v16;
  v123 = sub_100005170(&qword_100059580);
  v17 = __chkstk_darwin(v123);
  v126 = (uint64_t)&v105 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v134 = (uint64_t)&v105 - v19;
  v21 = type metadata accessor for FriendInviteInfoCardView(0, a2, a3, v20);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 64);
  __chkstk_darwin(v21);
  v25 = (char *)&v105 - v24;
  v125 = type metadata accessor for DashboardPlayerPhotoView(0);
  v122 = *(_QWORD *)(v125 - 8);
  __chkstk_darwin(v125);
  v27 = (char *)&v105 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = sub_100005170(&qword_1000595A0);
  __chkstk_darwin(v130);
  v118 = (char *)&v105 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = sub_100005170(&qword_100059578);
  v137 = *(_QWORD *)(v132 - 8);
  v29 = __chkstk_darwin(v132);
  v131 = (char *)&v105 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  v135 = a1;
  v136 = (char *)&v105 - v31;
  v106 = a1 + *(int *)(v21 + 36);
  v32 = objc_msgSend(*(id *)v106, "internal");
  v117 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v117(v25, a1, v21);
  v33 = *(unsigned __int8 *)(v22 + 80);
  v34 = (v33 + 32) & ~v33;
  v116 = v34 + v23;
  v115 = v33 | 7;
  v35 = swift_allocObject(&unk_100052CF0, v34 + v23, v33 | 7);
  v36 = v133;
  *(_QWORD *)(v35 + 16) = v133;
  *(_QWORD *)(v35 + 24) = a3;
  v114 = *(void (**)(uint64_t, char *, uint64_t))(v22 + 32);
  v114(v35 + v34, v25, v21);
  v37 = v35;
  v38 = v36;
  v39 = DashboardPlayerPhotoView.init(playerInternal:onContentReady:)(v32, sub_10002246C, v37);
  v40 = static Alignment.center.getter(v39);
  _FrameLayout.init(width:height:alignment:)(v147, 0x4058400000000000, 0, 0x4058400000000000, 0, v40, v41);
  v42 = v122;
  v43 = (uint64_t)v118;
  v44 = v125;
  (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v118, v27, v125);
  v45 = v130;
  v46 = (_OWORD *)(v43 + *(int *)(v130 + 36));
  v47 = v147[1];
  *v46 = v147[0];
  v46[1] = v47;
  v46[2] = v147[2];
  (*(void (**)(char *, uint64_t))(v42 + 8))(v27, v44);
  v117(v25, v135, v21);
  v48 = swift_allocObject(&unk_100052D18, v116, v115);
  *(_QWORD *)(v48 + 16) = v38;
  *(_QWORD *)(v48 + 24) = a3;
  v125 = a3;
  v114(v48 + v34, v25, v21);
  v49 = sub_1000055CC(&qword_1000595A8, &qword_1000595A0, (void (*)(void))sub_1000224C4);
  v50 = v131;
  View.onTapGesture(count:perform:)(1, sub_1000224B8, v48, v45, v49);
  swift_release(v48);
  sub_10000527C(v43, &qword_1000595A0);
  (*(void (**)(char *, char *, uint64_t))(v137 + 32))(v136, v50, v132);
  sub_1000213E0(v21, v134);
  v51 = v120;
  v52 = v119;
  v53 = v121;
  v54 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v120 + 104))(v119, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v121);
  LOBYTE(v48) = GKFeatureFlags.isEnabled.getter(v54);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v53);
  v122 = v49;
  if ((v48 & 1) != 0)
  {
    v55 = v21;
    if (*(_BYTE *)(v106 + 9) == 1)
    {
      v56 = *(id *)v106;
      v57 = objc_msgSend(*(id *)v106, "displayNameWithOptions:", 0);
      if (!v57)
        v57 = objc_msgSend(v56, "displayName");
      v58 = static String._unconditionallyBridgeFromObjectiveC(_:)(v57);
      v60 = v59;

      type metadata accessor for GCUILocalizedStrings(0);
      v61 = static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_UPSELL(playerName:)(v58, v60);
      v63 = v62;
      swift_bridgeObjectRelease(v60);
      v143 = v61;
      v144 = v63;
      v64 = sub_1000042C0();
      v65 = Text.init<A>(_:)(&v143, &type metadata for String, v64);
      v67 = v66;
      v69 = v68;
      v71 = v70 & 1;
      KeyPath = swift_getKeyPath(&unk_1000449D8);
      v73 = static HierarchicalShapeStyle.secondary.getter(KeyPath);
      v74 = static Font.caption.getter();
      v75 = swift_getKeyPath(&unk_100044A08);
      v76 = (v73 << 32) | 0x10001;
    }
    else
    {
      v65 = 0;
      v67 = 0;
      v71 = 0;
      v69 = 0;
      KeyPath = 0;
      v76 = 0;
      v75 = 0;
      v74 = 0;
    }
    v79 = v109;
    *v109 = v65;
    v79[1] = v67;
    v79[2] = v71;
    v79[3] = v69;
    v79[4] = KeyPath;
    v79[5] = v76;
    v79[6] = v75;
    v79[7] = v74;
    swift_storeEnumTagMultiPayload(v79, v108, 0);
    v80 = sub_100005170(&qword_1000595C0);
    v81 = sub_10002250C();
    v82 = sub_10002271C();
    v83 = v129;
    v84 = _ConditionalContent<>.init(storage:)(v79, v80, v110, v81, v82);
    v85 = v113;
    v86 = v112;
    v87 = v111;
    v21 = v55;
  }
  else
  {
    v77 = (uint64_t)v107;
    if (sub_1000205C8(v21))
    {
      sub_1000214C4(v21, v77);
      v78 = sub_100005170(&qword_1000595B8);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v77, 0, 1, v78);
    }
    else
    {
      v88 = sub_100005170(&qword_1000595B8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v88 - 8) + 56))(v77, 1, 1, v88);
    }
    v85 = v113;
    v86 = v112;
    v83 = v129;
    v89 = v109;
    sub_1000053A8(v77, (uint64_t)v109, &qword_100059590);
    swift_storeEnumTagMultiPayload(v89, v108, 1);
    v90 = sub_100005170(&qword_1000595C0);
    v91 = sub_10002250C();
    v92 = sub_10002271C();
    _ConditionalContent<>.init(storage:)(v89, v90, v110, v91, v92);
    v84 = sub_10000527C(v77, &qword_100059590);
    v87 = v111;
  }
  (*(void (**)(uint64_t))(v135 + *(int *)(v21 + 40)))(v84);
  v93 = *(void (**)(char *, char *, uint64_t))(v87 + 16);
  v94 = v133;
  v93(v86, v85, v133);
  v95 = *(void (**)(char *, uint64_t))(v87 + 8);
  v95(v85, v94);
  v96 = (uint64_t)v131;
  v97 = v132;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v131, v136, v132);
  v143 = v96;
  v98 = v134;
  v99 = v126;
  sub_1000053A8(v134, v126, &qword_100059580);
  v144 = v99;
  v100 = v83;
  v101 = v86;
  v102 = v127;
  sub_1000053A8(v100, v127, &qword_100059588);
  v145 = v102;
  v93(v85, v101, v94);
  v146 = v85;
  v142[0] = v97;
  v142[1] = v123;
  v142[2] = v124;
  v142[3] = v94;
  OpaqueTypeConformance2 = v130;
  v139 = v122;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&OpaqueTypeConformance2, &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>, 1);
  v139 = sub_1000056BC(&qword_100059650, &qword_100059580, (uint64_t)&protocol conformance descriptor for VStack<A>);
  v140 = sub_100022798();
  v141 = v125;
  sub_1000201E4(&v143, 4uLL, (uint64_t)v142);
  v95(v101, v94);
  sub_10000527C(v129, &qword_100059588);
  sub_10000527C(v98, &qword_100059580);
  v103 = *(void (**)(char *, uint64_t))(v137 + 8);
  v103(v136, v97);
  v95(v85, v94);
  sub_10000527C(v102, &qword_100059588);
  sub_10000527C(v99, &qword_100059580);
  return ((uint64_t (*)(uint64_t, uint64_t))v103)(v96, v97);
}

uint64_t sub_100021344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a1 + *(int *)(type metadata accessor for FriendInviteInfoCardView(0, a2, a3, a4) + 36);
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 56);
  v6 = objc_msgSend(*(id *)v4, "internal");
  v7 = objc_msgSend(v6, "playerID");

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  v5(v8, v10);
  return swift_bridgeObjectRelease(v10);
}

uint64_t sub_1000213E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v3 = v2;
  v6 = type metadata accessor for GKFeatureFlags(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v6);
  v11 = GKFeatureFlags.isEnabled.getter(v10);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v11 & 1) != 0)
    v17 = 0x4000000000000000;
  else
    v17 = 0xC000000000000000;
  *(_QWORD *)a2 = static HorizontalAlignment.center.getter(v12, v13, v14, v15, v16);
  *(_QWORD *)(a2 + 8) = v17;
  *(_BYTE *)(a2 + 16) = 0;
  v18 = sub_100005170(&qword_100059690);
  return sub_10002151C(v3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v19, (char *)(a2 + *(int *)(v18 + 44)));
}

uint64_t sub_1000214C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  *(_QWORD *)a2 = static VerticalAlignment.top.getter();
  *(_QWORD *)(a2 + 8) = 0x4028000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  sub_100005170(&qword_100059660);
  return sub_1000220A0(v2, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v5);
}

uint64_t sub_10002151C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v5;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t KeyPath;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t);
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  int v92;
  int v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned __int8 v106;
  __int128 v107;
  unsigned __int8 v108;
  unsigned __int8 v109;
  unsigned __int8 v110;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;

  v5 = a3;
  v100 = a5;
  v98 = type metadata accessor for FriendInviteInfoCardView(0, a2, a3, a4);
  v94 = *(_QWORD *)(v98 - 8);
  v85 = *(_QWORD *)(v94 + 64);
  __chkstk_darwin(v98);
  v86 = (char *)&v84 - v8;
  v9 = type metadata accessor for GKFeatureFlags(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005170(&qword_100059698);
  v14 = *(_QWORD *)(v13 - 8);
  v102 = v13;
  v103 = v14;
  v15 = __chkstk_darwin(v13);
  v99 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v97 = (char *)&v84 - v18;
  v19 = __chkstk_darwin(v17);
  v101 = (char *)&v84 - v20;
  v84 = static VerticalAlignment.center.getter(v19);
  v21 = a1;
  v22 = a2;
  v23 = a2;
  v24 = v5;
  sub_100021AD4(a1, v23, v5, (uint64_t)&v104);
  v26 = v104;
  v25 = v105;
  v27 = v106;
  v95 = v107;
  v93 = v108;
  v92 = v109;
  v91 = v110;
  v89 = *((_QWORD *)&v111 + 1);
  v90 = v111;
  v88 = v112;
  v87 = v113;
  v28 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v9);
  LOBYTE(v5) = GKFeatureFlags.isEnabled.getter(v28);
  v29 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if ((v5 & 1) != 0)
    v30 = static Font.headline.getter(v29);
  else
    v30 = static Font.body.getter(v29);
  v31 = v30;
  v32 = v21;
  v33 = v22;
  v34 = v86;
  v35 = v85;
  v36 = v84;
  v96 = v32;
  KeyPath = swift_getKeyPath(&unk_100044A08);
  v104 = v36;
  v105 = 0x4000000000000000;
  v106 = 0;
  *(_QWORD *)&v107 = v26;
  *((_QWORD *)&v107 + 1) = v25;
  v108 = v27;
  v111 = v95;
  LOBYTE(v112) = v93;
  BYTE1(v112) = v92;
  BYTE2(v112) = v91;
  v113 = v90;
  v114 = v89;
  v115 = v88;
  v116 = v87;
  v117 = KeyPath;
  v118 = v31;
  v38 = v94;
  v39 = v32;
  v40 = v98;
  (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v34, v39, v98);
  v41 = *(unsigned __int8 *)(v38 + 80);
  v42 = (v41 + 32) & ~v41;
  v43 = swift_allocObject(&unk_100052D68, v42 + v35, v41 | 7);
  *(_QWORD *)(v43 + 16) = v33;
  *(_QWORD *)(v43 + 24) = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v43 + v42, v34, v40);
  v44 = sub_100005170(&qword_1000596A0);
  v45 = sub_100022AC0();
  v46 = v97;
  View.onTapGesture(count:perform:)(1, sub_100022A54, v43, v44, v45);
  swift_release(v43);
  v47 = v111;
  v48 = v113;
  v49 = v114;
  v50 = v115;
  v51 = v116;
  v52 = v117;
  v53 = v118;
  sub_100004304(v107, *((uint64_t *)&v107 + 1), v108);
  swift_release(*((_QWORD *)&v47 + 1));
  swift_bridgeObjectRelease(v47);
  sub_100022B5C(v48, v49, v50, v51);
  swift_release(v52);
  swift_release(v53);
  (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v101, v46, v102);
  v54 = v96 + *(int *)(v40 + 36);
  v55 = *(_QWORD *)(v54 + 24);
  if (v55)
  {
    v104 = *(_QWORD *)(v54 + 16);
    v105 = v55;
    v56 = sub_1000042C0();
    swift_bridgeObjectRetain(v55);
    v57 = Text.init<A>(_:)(&v104, &type metadata for String, v56);
    v59 = v58;
    v61 = v60;
    v63 = v62 & 1;
    v64 = static Font.body.getter(v57);
    v98 = Text.font(_:)(v64, v57, v59, v63, v61);
    v97 = v65;
    v67 = v66;
    v96 = v68;
    swift_release(v64);
    v69 = v67 & 1;
    sub_100004304(v57, v59, v63);
    swift_bridgeObjectRelease(v61);
    *(_QWORD *)&v95 = swift_getKeyPath(&unk_1000449D8);
    v70 = 65537;
  }
  else
  {
    v98 = 0;
    v97 = 0;
    v69 = 0;
    v96 = 0;
    *(_QWORD *)&v95 = 0;
    v70 = 0;
  }
  v71 = v102;
  v72 = *(void (**)(char *, char *, uint64_t))(v103 + 16);
  v73 = v99;
  v74 = v101;
  v72(v99, v101, v102);
  v75 = v100;
  v72(v100, v73, v71);
  v76 = &v75[*(int *)(sub_100005170(&qword_1000596C0) + 48)];
  v77 = v98;
  v78 = (uint64_t)v97;
  *(_QWORD *)v76 = v98;
  *((_QWORD *)v76 + 1) = v78;
  *((_QWORD *)v76 + 2) = v69;
  v79 = v69;
  v80 = v96;
  v81 = v95;
  *((_QWORD *)v76 + 3) = v96;
  *((_QWORD *)v76 + 4) = v81;
  v76[42] = BYTE2(v70);
  *((_WORD *)v76 + 20) = v70;
  sub_100022B94(v77, v78, v79, v80, v81);
  v82 = *(void (**)(char *, uint64_t))(v103 + 8);
  v82(v74, v71);
  sub_100022BD0(v77, v78, v79, v80, v81);
  return ((uint64_t (*)(char *, uint64_t))v82)(v73, v71);
}

uint64_t sub_100021AD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  char v25;
  uint64_t v27;
  int v28;

  v8 = type metadata accessor for AttributedString(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1 + *(int *)(type metadata accessor for FriendInviteInfoCardView(0, a2, a3, v11) + 36);
  sub_100020398();
  v13 = Text.init(_:)(v10);
  v15 = v14;
  v28 = v16;
  v18 = v17;
  KeyPath = swift_getKeyPath(&unk_1000449D8);
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  if (*(_BYTE *)(v12 + 8) == 1)
  {
    v20 = Image.init(systemName:)(0x2E6E6F7276656863, 0xEF64726177726F66);
    v24 = static HierarchicalShapeStyle.tertiary.getter();
    v23 = static Font.subheadline.getter();
    v22 = swift_getKeyPath(&unk_100044A08);
    v21 = v24;
  }
  v25 = v28 & 1;
  *(_QWORD *)a4 = v13;
  *(_QWORD *)(a4 + 8) = v15;
  *(_BYTE *)(a4 + 16) = v25;
  *(_QWORD *)(a4 + 24) = v18;
  *(_QWORD *)(a4 + 32) = KeyPath;
  *(_WORD *)(a4 + 40) = 1;
  *(_BYTE *)(a4 + 42) = 1;
  *(_QWORD *)(a4 + 48) = v20;
  *(_QWORD *)(a4 + 56) = v21;
  *(_QWORD *)(a4 + 64) = v22;
  *(_QWORD *)(a4 + 72) = v23;
  sub_1000051F4(v13, v15, v25);
  swift_bridgeObjectRetain(v18);
  swift_retain(KeyPath);
  sub_100022C0C(v20, v21, v22, v23);
  sub_100022B5C(v20, v21, v22, v23);
  sub_100004304(v13, v15, v25);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v18);
}

uint64_t sub_100021C98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = type metadata accessor for FriendInviteInfoCardView(0, a2, a3, a4);
  v6 = a1 + *(int *)(result + 36);
  if (*(_BYTE *)(v6 + 8) == 1)
  {
    v7 = *(void (**)(uint64_t, uint64_t))(v6 + 72);
    v8 = objc_msgSend(*(id *)v6, "internal");
    v9 = objc_msgSend(v8, "playerID");

    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    v7(v10, v12);
    return swift_bridgeObjectRelease(v12);
  }
  return result;
}

uint64_t sub_100021D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  int v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v64 = a2;
  v65 = a3;
  v6 = sub_100005170(&qword_100059688);
  __chkstk_darwin(v6);
  v8 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Font.TextStyle(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = a1;
  v66 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v67 = v13;
  v60 = sub_1000042C0();
  v14 = Text.init<A>(_:)(&v66, &type metadata for String, v60);
  v57 = v15;
  v58 = v16;
  v18 = v17 & 1;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for Font.TextStyle.headline(_:), v9);
  v19 = enum case for Font.Design.rounded(_:);
  v20 = type metadata accessor for Font.Design(0);
  v21 = *(_QWORD *)(v20 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 104))(v8, v19, v20);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v21 + 56))(v8, 0, 1, v20);
  v22 = static Font.system(_:design:weight:)(v12, v8, 0, 1);
  sub_10000527C(v8, &qword_100059688);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v24 = v57;
  v23 = v58;
  v25 = Text.font(_:)(v22, v14, v57, v18, v58);
  v61 = v26;
  v62 = v25;
  LOBYTE(v9) = v27;
  v63 = v28;
  swift_release(v22);
  v59 = v9 & 1;
  sub_100004304(v14, v24, v18);
  swift_bridgeObjectRelease(v23);
  v66 = v64;
  v67 = v65;
  swift_bridgeObjectRetain(v65);
  v29 = Text.init<A>(_:)(&v66, &type metadata for String, v60);
  v31 = v30;
  v33 = v32;
  v35 = v34 & 1;
  v36 = static Font.caption2.getter();
  v37 = Text.font(_:)(v36, v29, v31, v35, v33);
  v39 = v38;
  LOBYTE(v8) = v40;
  v42 = v41;
  swift_release(v36);
  v43 = v8 & 1;
  sub_100004304(v29, v31, v35);
  v44 = swift_bridgeObjectRelease(v33);
  LODWORD(v66) = static HierarchicalShapeStyle.secondary.getter(v44);
  v45 = Text.foregroundStyle<A>(_:)(&v66, v37, v39, v43, v42, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
  v47 = v46;
  v49 = v48;
  LOBYTE(v35) = v50 & 1;
  sub_100004304(v37, v39, v43);
  swift_bridgeObjectRelease(v42);
  v51 = v59;
  LOBYTE(v66) = v59;
  v53 = v61;
  v52 = v62;
  *(_QWORD *)a4 = v62;
  *(_QWORD *)(a4 + 8) = v53;
  *(_BYTE *)(a4 + 16) = v51;
  v54 = v63;
  *(_QWORD *)(a4 + 24) = v63;
  *(_QWORD *)(a4 + 32) = v45;
  *(_QWORD *)(a4 + 40) = v47;
  *(_BYTE *)(a4 + 48) = v35;
  *(_QWORD *)(a4 + 56) = v49;
  v55 = v52;
  sub_1000051F4(v52, v53, v51);
  swift_bridgeObjectRetain(v54);
  sub_1000051F4(v45, v47, v35);
  swift_bridgeObjectRetain(v49);
  sub_100004304(v45, v47, v35);
  swift_bridgeObjectRelease(v49);
  sub_100004304(v55, v53, v66);
  return swift_bridgeObjectRelease(v54);
}

uint64_t sub_1000220A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v20;

  v7 = type metadata accessor for FriendInviteInfoCardView(0, a2, a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v20 - v11;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + *(int *)(v10 + 36) + 32) + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v20 - v11, a1, v7);
  v14 = *(unsigned __int8 *)(v8 + 80);
  v15 = (v14 + 32) & ~v14;
  v16 = swift_allocObject(&unk_100052D40, v15 + v9, v14 | 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v16 + v15, v12, v7);
  v17 = sub_100005170(&qword_100059668);
  v18 = sub_1000056BC(&qword_100059670, &qword_100059668, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  return ForEach<>.init(_:content:)(0, v13, sub_1000228F4, v16, v17, v18);
}

uint64_t sub_1000221D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  _QWORD *v19;
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
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  _QWORD v47[2];
  unsigned __int8 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;

  v10 = sub_100005170(&qword_100059678);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v41 - v14;
  result = type metadata accessor for FriendInviteInfoCardView(0, a3, a4, v16);
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v18 = *(_QWORD *)(a2 + *(int *)(result + 36) + 32);
  if (*(_QWORD *)(v18 + 16) <= (unint64_t)a1)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v46 = v13;
  v19 = (_QWORD *)(v18 + 24 * a1);
  v20 = v19[4];
  v21 = v19[5];
  v22 = v19[6];
  v23 = swift_bridgeObjectRetain(v22);
  v42 = static HorizontalAlignment.center.getter(v23, v24, v25, v26, v27);
  sub_100021D54(v20, v21, v22, (uint64_t)v47);
  v28 = v47[0];
  v43 = v48;
  v30 = v49;
  v29 = v50;
  v31 = v51;
  v32 = v52;
  v44 = v47[1];
  v45 = v53;
  v33 = swift_bridgeObjectRelease(v22);
  if (*(_QWORD *)(v18 + 16) - 1 <= a1)
  {
    v35 = type metadata accessor for Divider(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v15, 1, 1, v35);
  }
  else
  {
    Divider.init()(v33);
    v34 = type metadata accessor for Divider(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v15, 0, 1, v34);
  }
  v41 = v15;
  v36 = (uint64_t)v46;
  sub_1000053A8((uint64_t)v15, (uint64_t)v46, &qword_100059678);
  *(_QWORD *)a5 = v42;
  *(_QWORD *)(a5 + 8) = 0;
  *(_BYTE *)(a5 + 16) = 1;
  v37 = v44;
  v38 = v45;
  *(_QWORD *)(a5 + 24) = v28;
  *(_QWORD *)(a5 + 32) = v37;
  v39 = v43;
  *(_BYTE *)(a5 + 40) = v43;
  *(_QWORD *)(a5 + 48) = v30;
  *(_QWORD *)(a5 + 56) = v29;
  *(_QWORD *)(a5 + 64) = v31;
  *(_BYTE *)(a5 + 72) = v32;
  *(_QWORD *)(a5 + 80) = v38;
  v40 = sub_100005170(&qword_100059680);
  sub_1000053A8(v36, a5 + *(int *)(v40 + 48), &qword_100059678);
  sub_1000051F4(v28, v37, v39);
  swift_bridgeObjectRetain(v30);
  sub_1000051F4(v29, v31, v32);
  swift_bridgeObjectRetain(v38);
  sub_10000527C((uint64_t)v41, &qword_100059678);
  sub_10000527C(v36, &qword_100059678);
  sub_100004304(v28, v37, v39);
  swift_bridgeObjectRelease(v30);
  sub_100004304(v29, v31, v32);
  return swift_bridgeObjectRelease(v38);
}

uint64_t sub_10002245C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_100020870(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_10002246C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for FriendInviteInfoCardView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  return (*(uint64_t (**)(void))(v4 + *(int *)(v5 + 36) + ((v6 + 32) & ~v6) + 40))();
}

uint64_t sub_1000224B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100022A60((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100021344, a2, a3, a4);
}

unint64_t sub_1000224C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000595B0;
  if (!qword_1000595B0)
  {
    v1 = type metadata accessor for DashboardPlayerPhotoView(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DashboardPlayerPhotoView, v1);
    atomic_store(result, (unint64_t *)&qword_1000595B0);
  }
  return result;
}

unint64_t sub_10002250C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000595C8;
  if (!qword_1000595C8)
  {
    v1 = sub_10000437C(&qword_1000595C0);
    sub_100022570();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_1000595C8);
  }
  return result;
}

unint64_t sub_100022570()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000595D0;
  if (!qword_1000595D0)
  {
    v1 = sub_10000437C(&qword_1000595D8);
    sub_1000225F4();
    sub_1000056BC(&qword_100059630, &qword_100059638, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000595D0);
  }
  return result;
}

unint64_t sub_1000225F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000595E0;
  if (!qword_1000595E0)
  {
    v1 = sub_10000437C(&qword_1000595E8);
    sub_1000055CC(&qword_1000595F0, &qword_1000595F8, (void (*)(void))sub_100022698);
    sub_1000056BC(&qword_100059620, &qword_100059628, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000595E0);
  }
  return result;
}

unint64_t sub_100022698()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059600;
  if (!qword_100059600)
  {
    v1 = sub_10000437C(&qword_100059608);
    sub_1000056BC(&qword_100059610, &qword_100059618, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059600);
  }
  return result;
}

unint64_t sub_10002271C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059640;
  if (!qword_100059640)
  {
    v1 = sub_10000437C(&qword_100059590);
    sub_1000056BC(&qword_100059648, &qword_1000595B8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100059640);
  }
  return result;
}

unint64_t sub_100022798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059658;
  if (!qword_100059658)
  {
    v1 = sub_10000437C(&qword_100059588);
    sub_10002250C();
    sub_10002271C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059658);
  }
  return result;
}

uint64_t sub_100022804@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10002282C(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_100022850@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100022878@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000228A0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_1000228C8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_1000228F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FriendInviteInfoCardView(0, v6, v7, a2) - 8) + 80);
  return sub_1000221D4(a1, v3 + ((v8 + 32) & ~v8), v6, v7, a3);
}

uint64_t sub_100022960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;

  v5 = type metadata accessor for FriendInviteInfoCardView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v7 + 32) & ~v7;
  v9 = *(_QWORD *)(v6 + 64);
  v10 = (_QWORD *)(v4 + v8);
  v11 = sub_100005170(&qword_1000594E0);
  if (swift_getEnumCaseMultiPayload(v4 + v8, v11) == 1)
  {
    v12 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v4 + v8, v12);
  }
  else
  {
    swift_release(*v10);
  }
  v13 = v8 + v9;
  v14 = (char *)v10 + *(int *)(v5 + 36);

  swift_bridgeObjectRelease(*((_QWORD *)v14 + 3));
  swift_bridgeObjectRelease(*((_QWORD *)v14 + 4));
  swift_release(*((_QWORD *)v14 + 6));
  swift_release(*((_QWORD *)v14 + 8));
  swift_release(*((_QWORD *)v14 + 10));
  swift_release(*(_QWORD *)((char *)v10 + *(int *)(v5 + 40) + 8));
  return swift_deallocObject(v4, v13, v7 | 7);
}

uint64_t sub_100022A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100022A60((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100021C98, a2, a3, a4);
}

uint64_t sub_100022A60(uint64_t (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FriendInviteInfoCardView(0, v5, v6, a4) - 8) + 80);
  return a1(v4 + ((v7 + 32) & ~v7), v5, v6);
}

unint64_t sub_100022AC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000596A8;
  if (!qword_1000596A8)
  {
    v1 = sub_10000437C(&qword_1000596A0);
    sub_1000056BC(&qword_1000596B0, &qword_1000596B8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    sub_1000056BC(&qword_100059630, &qword_100059638, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000596A8);
  }
  return result;
}

uint64_t sub_100022B5C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    swift_release(result);
    swift_release(a3);
    return swift_release(a4);
  }
  return result;
}

uint64_t sub_100022B94(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    sub_1000051F4(result, a2, a3 & 1);
    swift_bridgeObjectRetain(a4);
    return swift_retain(a5);
  }
  return result;
}

uint64_t sub_100022BD0(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    sub_100004304(result, a2, a3 & 1);
    swift_release(a5);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_100022C0C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    swift_retain(a4);
    swift_retain(v5);
    return swift_retain(a3);
  }
  return result;
}

void sub_100022C48()
{
  AttributeScopes.SwiftUIAttributes.font.getter();
  __break(1u);
}

unint64_t sub_100022C64()
{
  unint64_t result;

  result = qword_1000596C8;
  if (!qword_1000596C8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for AttributeScopes.SwiftUIAttributes.FontAttribute, &type metadata for AttributeScopes.SwiftUIAttributes.FontAttribute);
    atomic_store(result, (unint64_t *)&qword_1000596C8);
  }
  return result;
}

void sub_100022CA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *a2;
  v3 = sub_100022C64();
  AttributeDynamicLookup.subscript.getter(v2, v3);
  __break(1u);
}

uint64_t sub_100022CCC()
{
  return 8;
}

uint64_t sub_100022CD8(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t sub_100022CE0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_100022CF0()
{
  uint64_t v0;

  v0 = sub_100005170(&qword_1000596D0);
  return dispatch thunk of Hashable.hashValue.getter(v0, &protocol witness table for AnyKeyPath);
}

_QWORD *sub_100022D34(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100022D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_100022D6C()
{
  uint64_t TupleTypeMetadata;
  uint64_t v1;
  uint64_t WitnessTable;
  uint64_t v3;

  sub_10000437C(&qword_100059578);
  sub_10000437C(&qword_100059580);
  sub_10000437C(&qword_100059588);
  TupleTypeMetadata = swift_getTupleTypeMetadata(255, 4);
  v1 = type metadata accessor for TupleView(255, TupleTypeMetadata);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v1);
  v3 = type metadata accessor for VStack(255, v1, WitnessTable);
  return swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v3);
}

id sub_100022F28()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LoadingStatusView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LoadingStatusView()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension17LoadingStatusView);
}

uint64_t sub_100022F88()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for SectionInfo()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension11SectionInfo);
}

id sub_100022FB8()
{
  char *v0;
  char *v1;
  id v2;
  objc_super v4;

  *(_QWORD *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_maxRowsPerSection] = 2;
  *(_QWORD *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo] = &_swiftEmptyDictionarySingleton;
  v1 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes] = &_swiftEmptyDictionarySingleton;
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for WideFlowLayout();
  v2 = objc_msgSendSuper2(&v4, "init");
  objc_msgSend(v2, "setScrollDirection:", 1);
  objc_msgSend(v2, "setHeaderReferenceSize:", 0.0, 36.0);
  objc_msgSend(v2, "setEstimatedItemSize:", 42.0, 42.0);
  objc_msgSend(v2, "setSectionInset:", 0.0, 16.0, 0.0, 16.0);

  return v2;
}

id sub_1000230D4(void *a1)
{
  char *v1;
  char *v3;
  id v4;
  id v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_maxRowsPerSection] = 2;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo] = &_swiftEmptyDictionarySingleton;
  v3 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes] = &_swiftEmptyDictionarySingleton;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for WideFlowLayout();
  v4 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v6, "setScrollDirection:", 1);
    objc_msgSend(v6, "setHeaderReferenceSize:", 0.0, 36.0);
    objc_msgSend(v6, "setEstimatedItemSize:", 42.0, 42.0);
    objc_msgSend(v6, "setSectionInset:", 0.0, 16.0, 0.0, 16.0);

  }
  return v5;
}

void sub_10002322C()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t isUniquelyReferenced_nonNull_native;
  _QWORD *v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _BYTE v66[24];
  char v67[24];

  v1 = v0;
  v2 = objc_msgSend(v0, "collectionView");
  if (!v2)
    return;
  v3 = v2;
  v4 = (unint64_t)objc_msgSend(v2, "numberOfSections");
  v5 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo];
  swift_beginAccess(&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo], v67, 1, 0);
  v6 = *(_QWORD *)v5;
  v65 = v5;
  *(_QWORD *)v5 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease(v6);
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_51;
  if (!v4)
  {
    v7 = 0;
LABEL_28:
    objc_msgSend(v1, "sectionInset", v63);
    v43 = v42;
    objc_msgSend(v1, "sectionInset");
    v45 = v44;
    if (v4)
    {
      v46 = 0;
      v47 = 0.0;
      while (1)
      {
        v48 = *(_QWORD *)v65;
        if (!*(_QWORD *)(*(_QWORD *)v65 + 16))
          goto LABEL_45;
        v49 = sub_10002F40C(v46);
        if ((v50 & 1) == 0)
          goto LABEL_46;
        v51 = *(_QWORD *)(*(_QWORD *)(v48 + 56) + 8 * v49);
        v52 = *(_QWORD *)(v51 + 16);
        if (v52 >= 1)
        {
          *(_QWORD *)(v51 + 72) = v43;
          *(double *)(v51 + 80) = v45;
          if (!v7)
            goto LABEL_47;
          v53 = v52 / v7;
          v17 = __OFADD__(v53, 1);
          v54 = v53 + 1;
          if (v17)
            goto LABEL_48;
          *(_QWORD *)(v51 + 24) = v7;
          *(_QWORD *)(v51 + 32) = v54;
          v55 = (double)v54;
          swift_retain(v51);
          objc_msgSend(v1, "headerReferenceSize");
          v57 = v56;
          objc_msgSend(v1, "estimatedItemSize");
          v59 = v57 + (v58 + *(double *)(v51 + 112)) * v55;
          objc_msgSend(v1, "estimatedItemSize");
          v61 = (v60 + *(double *)(v51 + 104)) * (double)v7 - *(double *)(v51 + 104);
          *(double *)(v51 + 88) = v61;
          *(double *)(v51 + 96) = v59;
          swift_release(v51);
          if (v61 > v47)
            v47 = v61;
          v45 = v45 + v59;
        }
        if (v4 == ++v46)
          goto LABEL_40;
      }
    }
    v47 = 0.0;
LABEL_40:

    v62 = (double *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize];
    *v62 = v47;
    v62[1] = v45 + -50.0;
    return;
  }
  v64 = OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_maxRowsPerSection;
  v63 = type metadata accessor for SectionInfo();
  v7 = 0;
  v8 = 0;
  for (i = swift_allocObject(v63, 120, 7); ; i = swift_allocObject(v63, 120, 7))
  {
    v12 = (_QWORD *)i;
    *(_OWORD *)(i + 16) = 0u;
    *(_OWORD *)(i + 32) = 0u;
    *(_OWORD *)(i + 48) = 0u;
    *(_OWORD *)(i + 64) = 0u;
    *(_OWORD *)(i + 80) = 0u;
    *(_OWORD *)(i + 96) = 0u;
    *(_QWORD *)(i + 112) = 0;
    v13 = (uint64_t)objc_msgSend(v3, "numberOfItemsInSection:", v8);
    v12[2] = v13;
    v14 = *(_QWORD *)&v1[v64];
    v12[4] = v14;
    if (!v14)
      break;
    if (v13 == 0x8000000000000000 && v14 == -1)
      goto LABEL_49;
    v16 = v13 / v14;
    v17 = __OFADD__(v16, 1);
    v18 = v16 + 1;
    if (v17)
      goto LABEL_43;
    v19 = (id)v4;
    v20 = v3;
    v12[3] = v18;
    objc_msgSend(v1, "headerReferenceSize");
    v12[5] = v21;
    v12[6] = v22;
    objc_msgSend(v1, "estimatedItemSize");
    v12[7] = v23;
    v12[8] = v24;
    objc_msgSend(v1, "minimumInteritemSpacing");
    v26 = v25;
    v27 = v1;
    objc_msgSend(v1, "minimumLineSpacing");
    v12[13] = v26;
    v12[14] = v28;
    if (v12[3] > v7)
      v7 = v12[3];
    swift_beginAccess(v65, v66, 33, 0);
    swift_retain(v12);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)v65);
    v30 = *(_QWORD **)v65;
    *(_QWORD *)v65 = 0x8000000000000000;
    v32 = sub_10002F40C(v8);
    v33 = v30[2];
    v34 = (v31 & 1) == 0;
    v35 = v33 + v34;
    if (__OFADD__(v33, v34))
      goto LABEL_44;
    v36 = v31;
    if (v30[3] >= v35)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v31 & 1) != 0)
          goto LABEL_5;
      }
      else
      {
        sub_100024E90();
        if ((v36 & 1) != 0)
          goto LABEL_5;
      }
    }
    else
    {
      sub_10002467C(v35, isUniquelyReferenced_nonNull_native);
      v37 = sub_10002F40C(v8);
      if ((v36 & 1) != (v38 & 1))
        goto LABEL_52;
      v32 = v37;
      if ((v36 & 1) != 0)
      {
LABEL_5:
        v10 = v30[7];
        swift_release(*(_QWORD *)(v10 + 8 * v32));
        *(_QWORD *)(v10 + 8 * v32) = v12;
        goto LABEL_6;
      }
    }
    v30[(v32 >> 6) + 8] |= 1 << v32;
    v39 = 8 * v32;
    *(_QWORD *)(v30[6] + v39) = v8;
    *(_QWORD *)(v30[7] + v39) = v12;
    v40 = v30[2];
    v17 = __OFADD__(v40, 1);
    v41 = v40 + 1;
    if (v17)
      goto LABEL_50;
    v30[2] = v41;
LABEL_6:
    ++v8;
    v11 = *(_QWORD *)v65;
    *(_QWORD *)v65 = v30;
    swift_bridgeObjectRelease(v11);
    swift_endAccess(v66);
    swift_release(v12);
    v4 = (unint64_t)v19;
    v3 = v20;
    v1 = v27;
    if (v19 == (id)v8)
      goto LABEL_28;
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
  __break(1u);
}

void sub_1000236A8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  double v10;
  double v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  Class isa;
  id v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void *v32;
  id v33;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  unint64_t v45;
  char v46;
  id v47;
  Class v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void (*v53)(uint64_t, char *, uint64_t);
  char *v54;
  char *v55;
  id v56;
  uint64_t v57;
  _QWORD *v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  uint64_t v63;
  char v64;
  unint64_t v65;
  char v66;
  _QWORD *v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  char *v73;
  NSString *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  char *v83;
  char *v84;
  _QWORD *v85;
  _BYTE v86[24];
  char v87[24];
  char v88[24];
  char v89[24];
  objc_super v90;

  v1 = type metadata accessor for IndexPath(0);
  v82 = *(_QWORD *)(v1 - 8);
  v2 = __chkstk_darwin(v1);
  v83 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v2);
  v79 = (char *)&v71 - v5;
  __chkstk_darwin(v4);
  v7 = (char *)&v71 - v6;
  v8 = (objc_class *)type metadata accessor for WideFlowLayout();
  v90.receiver = v0;
  v90.super_class = v8;
  objc_msgSendSuper2(&v90, "prepareLayout");
  v9 = objc_msgSend(v0, "collectionView");
  if (!v9)
    return;
  v72 = v9;
  objc_msgSend(v9, "bounds");
  if (v10 <= 0.0
    || (v11 = v10,
        sub_10002322C(),
        v12 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo],
        swift_beginAccess(&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_sectionInfo], v89, 0, 0),
        (v75 = *(_QWORD *)(*(_QWORD *)v12 + 16)) == 0))
  {
LABEL_46:

    return;
  }
  v84 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes];
  v76 = &v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes];
  swift_beginAccess(&v0[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes], v88, 0, 0);
  v80 = 0;
  v74 = UICollectionElementKindSectionHeader;
  v77 = v1;
  v73 = v12;
  while (1)
  {
    v13 = *(_QWORD *)v12;
    if (!*(_QWORD *)(*(_QWORD *)v12 + 16))
      goto LABEL_52;
    v14 = sub_10002F40C(v80);
    if ((v15 & 1) == 0)
      break;
    v16 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
    if (*(uint64_t *)(v16 + 16) < 1)
      goto LABEL_7;
    swift_retain(*(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14));
    IndexPath.init(item:section:)(0, v80);
    v17 = *(_QWORD *)v76;
    v18 = *(_QWORD *)(*(_QWORD *)v76 + 16);
    v78 = v16;
    if (v18)
    {
      swift_bridgeObjectRetain(v17);
      v19 = sub_10002F43C((uint64_t)v7);
      if ((v20 & 1) != 0)
      {
        v21 = *(id *)(*(_QWORD *)(v17 + 56) + 8 * v19);
        swift_bridgeObjectRelease(v17);
LABEL_16:
        v26 = v21;
        v27 = v26;
        v28 = *(double *)(v16 + 40);
        if (v28 == 0.0)
          v28 = v11;
        objc_msgSend(v26, "setFrame:", *(double *)(v16 + 72), *(double *)(v16 + 80), v28, *(double *)(v16 + 48));
        v29 = v82;
        v30 = (uint64_t)v79;
        (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v79, v7, v1);
        v31 = v76;
        swift_beginAccess(v76, v86, 33, 0);
        v32 = v27;
        v33 = v27;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)v31);
        v85 = *(_QWORD **)v31;
        *(_QWORD *)v31 = 0x8000000000000000;
        sub_100024C9C((uint64_t)v33, v30, isUniquelyReferenced_nonNull_native);
        v35 = *(_QWORD *)v31;
        *(_QWORD *)v31 = v85;
        swift_bridgeObjectRelease(v35);
        v36 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
        v16 = v78;
        v36(v30, v1);
        swift_endAccess(v86);

        v37 = *(_QWORD *)(v16 + 16);
        if (v37 < 0)
          goto LABEL_54;
        goto LABEL_21;
      }
      swift_bridgeObjectRelease(v17);
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)(v74);
    v23 = v22;
    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v23);
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v21 = objc_msgSend((id)objc_opt_self(UICollectionViewLayoutAttributes), "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v24, isa);

    v1 = v77;
    if (v21)
      goto LABEL_16;
    v32 = 0;
    v37 = *(_QWORD *)(v16 + 16);
    if (v37 < 0)
      goto LABEL_54;
LABEL_21:
    if (v37)
    {
      swift_beginAccess(v84, v87, 0, 0);
      v38 = 0;
      while (1)
      {
        if (v37 == v38)
        {
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_53;
        }
        v41 = v79;
        IndexPath.init(item:section:)(v38, v80);
        v42 = v82;
        v43 = *(void (**)(char *, uint64_t))(v82 + 8);
        v43(v7, v1);
        (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v7, v41, v1);
        v44 = *(_QWORD *)v84;
        if (*(_QWORD *)(*(_QWORD *)v84 + 16))
        {
          swift_bridgeObjectRetain(*(_QWORD *)v84);
          v45 = sub_10002F43C((uint64_t)v7);
          if ((v46 & 1) != 0)
          {
            v47 = *(id *)(*(_QWORD *)(v44 + 56) + 8 * v45);
            swift_bridgeObjectRelease(v44);

            goto LABEL_32;
          }
          swift_bridgeObjectRelease(v44);
        }

        v48 = IndexPath._bridgeToObjectiveC()().super.isa;
        v47 = objc_msgSend((id)objc_opt_self(UICollectionViewLayoutAttributes), "layoutAttributesForCellWithIndexPath:", v48);

        if (!v47)
        {
          v32 = 0;
          goto LABEL_25;
        }
LABEL_32:
        v49 = v47;
        v50 = *(_QWORD *)(v16 + 24);
        if (!v50)
          goto LABEL_49;
        v51 = v49;
        v81 = (void (*)(uint64_t, uint64_t))v43;
        + infix(_:_:)(*(double *)(v16 + 72), *(double *)(v16 + 80), (*(double *)(v16 + 56) + *(double *)(v16 + 104)) * (double)(v38 % v50), *(double *)(v16 + 48) + (*(double *)(v16 + 64) + *(double *)(v16 + 112)) * (double)(v38 / v50));
        objc_msgSend(v51, "setFrame:");
        v52 = (uint64_t)v83;
        v53 = *(void (**)(uint64_t, char *, uint64_t))(v82 + 16);
        v54 = v7;
        v53((uint64_t)v83, v7, v1);
        v55 = v84;
        swift_beginAccess(v84, v86, 33, 0);
        v32 = v51;
        v56 = v51;
        v57 = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)v55);
        v85 = *(_QWORD **)v55;
        v58 = v85;
        *(_QWORD *)v55 = 0x8000000000000000;
        v60 = sub_10002F43C(v52);
        v61 = v58[2];
        v62 = (v59 & 1) == 0;
        v63 = v61 + v62;
        if (__OFADD__(v61, v62))
          goto LABEL_50;
        v64 = v59;
        if (v58[3] >= v63)
        {
          if ((v57 & 1) != 0)
          {
            v67 = v85;
            if ((v59 & 1) == 0)
              goto LABEL_40;
          }
          else
          {
            sub_10002506C();
            v67 = v85;
            if ((v64 & 1) == 0)
              goto LABEL_40;
          }
        }
        else
        {
          sub_100024930(v63, v57);
          v65 = sub_10002F43C((uint64_t)v83);
          if ((v64 & 1) != (v66 & 1))
            goto LABEL_55;
          v60 = v65;
          v67 = v85;
          if ((v64 & 1) == 0)
          {
LABEL_40:
            v67[(v60 >> 6) + 8] |= 1 << v60;
            v1 = v77;
            v53(v67[6] + *(_QWORD *)(v82 + 72) * v60, v83, v77);
            *(_QWORD *)(v67[7] + 8 * v60) = v56;
            v68 = v67[2];
            v69 = __OFADD__(v68, 1);
            v70 = v68 + 1;
            if (v69)
              goto LABEL_51;
            v67[2] = v70;
            goto LABEL_24;
          }
        }
        v39 = v67[7];

        *(_QWORD *)(v39 + 8 * v60) = v56;
        v1 = v77;
LABEL_24:
        v40 = *(_QWORD *)v84;
        *(_QWORD *)v84 = v67;
        swift_bridgeObjectRelease(v40);
        v81((uint64_t)v83, v1);
        swift_endAccess(v86);

        v7 = v54;
        v16 = v78;
LABEL_25:
        if (v37 == ++v38)
        {
          swift_release(v16);
          v12 = v73;
          goto LABEL_6;
        }
      }
    }
    swift_release(v16);
LABEL_6:

    (*(void (**)(char *, uint64_t))(v82 + 8))(v7, v1);
LABEL_7:
    if (++v80 == v75)
      goto LABEL_46;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v77);
  __break(1u);
}

id sub_100023E10(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  char *v4;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22[32];
  char v23[24];

  v9 = &v4[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes];
  swift_beginAccess(&v4[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_itemAttributes], v23, 0, 0);
  swift_bridgeObjectRetain(*(_QWORD *)v9);
  sub_100023F40(v10, a1, a2, a3, a4);
  v12 = v11;
  result = objc_msgSend(v4, "collectionView");
  if (result)
  {
    v14 = result;
    objc_msgSend(result, "contentOffset");
    v16 = v15;

    objc_msgSend(v4, "sectionInset");
    v18 = v16 + v17;
    v19 = &v4[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes];
    swift_beginAccess(v19, v22, 0, 0);
    swift_bridgeObjectRetain(*(_QWORD *)v19);
    sub_100024148(v20, v18, a1, a2, a3, a4);
    sub_100025294(v21);
    return (id)v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100023F40(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v10 = 0;
  v12 = a1 + 64;
  v11 = *(_QWORD *)(a1 + 64);
  v13 = 1 << *(_BYTE *)(a1 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v11;
  v16 = (unint64_t)(v13 + 63) >> 6;
  if ((v14 & v11) != 0)
    goto LABEL_6;
LABEL_7:
  v19 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v19 < v16)
    {
      v20 = *(_QWORD *)(v12 + 8 * v19);
      ++v10;
      if (v20)
        goto LABEL_22;
      v10 = v19 + 1;
      if (v19 + 1 >= v16)
        goto LABEL_26;
      v20 = *(_QWORD *)(v12 + 8 * v10);
      if (v20)
        goto LABEL_22;
      v10 = v19 + 2;
      if (v19 + 2 >= v16)
        goto LABEL_26;
      v20 = *(_QWORD *)(v12 + 8 * v10);
      if (v20)
        goto LABEL_22;
      v10 = v19 + 3;
      if (v19 + 3 >= v16)
        goto LABEL_26;
      v20 = *(_QWORD *)(v12 + 8 * v10);
      if (v20)
      {
LABEL_22:
        v15 = (v20 - 1) & v20;
        for (i = __clz(__rbit64(v20)) + (v10 << 6); ; i = v17 | (v10 << 6))
        {
          v22 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * i);
          objc_msgSend(v22, "frame");
          v30.origin.x = v23;
          v30.origin.y = v24;
          v30.size.width = v25;
          v30.size.height = v26;
          v29.origin.x = a2;
          v29.origin.y = a3;
          v29.size.width = a4;
          v29.size.height = a5;
          if (CGRectIntersectsRect(v29, v30))
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            v27 = _swiftEmptyArrayStorage[2];
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v27);
            v28 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v22);
            specialized ContiguousArray._endMutation()(v28);
            if (!v15)
              goto LABEL_7;
          }
          else
          {

            if (!v15)
              goto LABEL_7;
          }
LABEL_6:
          v17 = __clz(__rbit64(v15));
          v15 &= v15 - 1;
        }
      }
      v21 = v19 + 4;
      if (v21 < v16)
      {
        v20 = *(_QWORD *)(v12 + 8 * v21);
        if (v20)
        {
          v10 = v21;
          goto LABEL_22;
        }
        while (1)
        {
          v10 = v21 + 1;
          if (__OFADD__(v21, 1))
            goto LABEL_28;
          if (v10 >= v16)
            break;
          v20 = *(_QWORD *)(v12 + 8 * v10);
          ++v21;
          if (v20)
            goto LABEL_22;
        }
      }
    }
LABEL_26:
    swift_release(a1);
    return;
  }
  __break(1u);
LABEL_28:
  __break(1u);
}

void sub_100024148(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  CGRect v26;
  CGRect v27;

  v12 = 0;
  v13 = a1 + 64;
  v14 = 1 << *(_BYTE *)(a1 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(a1 + 64);
  v25 = (unint64_t)(v14 + 63) >> 6;
  if (v16)
    goto LABEL_6;
LABEL_7:
  v19 = v12 + 1;
  if (!__OFADD__(v12, 1))
  {
    if (v19 < v25)
    {
      v20 = *(_QWORD *)(v13 + 8 * v19);
      ++v12;
      if (v20)
        goto LABEL_22;
      v12 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_26;
      v20 = *(_QWORD *)(v13 + 8 * v12);
      if (v20)
        goto LABEL_22;
      v12 = v19 + 2;
      if (v19 + 2 >= v25)
        goto LABEL_26;
      v20 = *(_QWORD *)(v13 + 8 * v12);
      if (v20)
        goto LABEL_22;
      v12 = v19 + 3;
      if (v19 + 3 >= v25)
        goto LABEL_26;
      v20 = *(_QWORD *)(v13 + 8 * v12);
      if (v20)
      {
LABEL_22:
        v16 = (v20 - 1) & v20;
        for (i = __clz(__rbit64(v20)) + (v12 << 6); ; i = v17 | (v12 << 6))
        {
          v22 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * i);
          objc_msgSend(v22, "frame");
          objc_msgSend(v22, "setFrame:", a2);
          objc_msgSend(v22, "frame");
          v27.origin.x = a3;
          v27.origin.y = a4;
          v27.size.width = a5;
          v27.size.height = a6;
          if (CGRectIntersectsRect(v26, v27))
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            v23 = _swiftEmptyArrayStorage[2];
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v23);
            v24 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v22);
            specialized ContiguousArray._endMutation()(v24);
            if (!v16)
              goto LABEL_7;
          }
          else
          {

            if (!v16)
              goto LABEL_7;
          }
LABEL_6:
          v17 = __clz(__rbit64(v16));
          v16 &= v16 - 1;
        }
      }
      v21 = v19 + 4;
      if (v21 < v25)
      {
        v20 = *(_QWORD *)(v13 + 8 * v21);
        if (v20)
        {
          v12 = v21;
          goto LABEL_22;
        }
        while (1)
        {
          v12 = v21 + 1;
          if (__OFADD__(v21, 1))
            goto LABEL_28;
          if (v12 >= v25)
            break;
          v20 = *(_QWORD *)(v13 + 8 * v12);
          ++v21;
          if (v20)
            goto LABEL_22;
        }
      }
    }
LABEL_26:
    swift_release(a1);
    return;
  }
  __break(1u);
LABEL_28:
  __break(1u);
}

void *sub_100024418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  id v17;
  _BYTE v19[24];

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(UICollectionElementKindSectionHeader);
  if (v7 == a1 && v8 == a2)
  {
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = v8;
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v7, v8, 0);
    swift_bridgeObjectRelease(v10);
    if ((v11 & 1) == 0)
      return 0;
  }
  v12 = (uint64_t *)(v3 + OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_headerAttributes);
  swift_beginAccess(v12, v19, 0, 0);
  v13 = *v12;
  if (!*(_QWORD *)(v13 + 16))
    return 0;
  swift_bridgeObjectRetain(v13);
  v14 = sub_10002F43C(a3);
  if ((v15 & 1) != 0)
  {
    v16 = *(void **)(*(_QWORD *)(v13 + 56) + 8 * v14);
    v17 = v16;
  }
  else
  {
    v16 = 0;
  }
  swift_bridgeObjectRelease(v13);
  return v16;
}

id sub_1000245E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WideFlowLayout();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WideFlowLayout()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension14WideFlowLayout);
}

uint64_t sub_10002467C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005170(&qword_100059900);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 0;
    v10 = (uint64_t *)(v5 + 64);
    v11 = 1 << *(_BYTE *)(v5 + 32);
    v33 = -1 << v11;
    v34 = v11;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v11 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v21 = v20 | (v9 << 6);
      }
      else
      {
        v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        if (v22 >= v35)
          goto LABEL_36;
        v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          v9 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_36;
          v23 = v10[v9];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_36:
              if ((a2 & 1) != 0)
              {
                if (v34 >= 64)
                  bzero((void *)(v5 + 64), 8 * v35);
                else
                  *v10 = v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                v9 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_44;
                if (v9 >= v35)
                  goto LABEL_36;
                v23 = v10[v9];
                ++v24;
                if (v23)
                  goto LABEL_33;
              }
            }
            v9 = v24;
          }
        }
LABEL_33:
        v13 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      v29 = 8 * v21;
      v30 = *(_QWORD *)(v5 + 56);
      v31 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v29);
      v32 = *(_QWORD *)(v30 + v29);
      if ((a2 & 1) == 0)
        swift_retain(*(_QWORD *)(v30 + v29));
      result = static Hasher._hash(seed:_:)(*(_QWORD *)(v8 + 40), v31);
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v14 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v19) = v31;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v19) = v32;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100024930(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t i;
  int v44;

  v3 = v2;
  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_100005170(&qword_100059920);
  v44 = a2;
  v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v40 = v3;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v42 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v41 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain(v10);
  v19 = 0;
  for (i = v10; ; v10 = i)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_24;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v41)
      goto LABEL_36;
    v24 = v42[v23];
    ++v19;
    if (!v24)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v41)
        goto LABEL_36;
      v24 = v42[v19];
      if (!v24)
        break;
    }
LABEL_23:
    v16 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v19 << 6);
LABEL_24:
    v26 = *(_QWORD *)(v7 + 72);
    v27 = *(_QWORD *)(v10 + 48) + v26 * v22;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 32))(v9, v27, v6);
      v28 = *(id *)(*(_QWORD *)(v10 + 56) + 8 * v22);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v9, v27, v6);
      v28 = *(id *)(*(_QWORD *)(v10 + 56) + 8 * v22);
    }
    v29 = *(_QWORD *)(v12 + 40);
    v30 = sub_100025784();
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v29, v6, v30);
    v31 = -1 << *(_BYTE *)(v12 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v17 + 8 * (v32 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v17 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v17 + 8 * v33);
      }
      while (v37 == -1);
      v20 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(*(_QWORD *)(v12 + 48) + v26 * v20, v9, v6);
    *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v20) = v28;
    ++*(_QWORD *)(v12 + 16);
  }
  v25 = v23 + 2;
  if (v25 < v41)
  {
    v24 = v42[v25];
    if (!v24)
    {
      while (1)
      {
        v19 = v25 + 1;
        if (__OFADD__(v25, 1))
          goto LABEL_43;
        if (v19 >= v41)
          goto LABEL_36;
        v24 = v42[v19];
        ++v25;
        if (v24)
          goto LABEL_23;
      }
    }
    v19 = v25;
    goto LABEL_23;
  }
LABEL_36:
  swift_release(v10);
  v3 = v40;
  if ((v44 & 1) != 0)
  {
    v38 = 1 << *(_BYTE *)(v10 + 32);
    if (v38 >= 64)
      bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v42 = -1 << v38;
    *(_QWORD *)(v10 + 16) = 0;
  }
LABEL_41:
  result = swift_release(v10);
  *v3 = v12;
  return result;
}

void sub_100024C9C(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_10002F43C(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];

      *(_QWORD *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_10002506C();
    goto LABEL_7;
  }
  sub_100024930(v17, a3 & 1);
  v22 = sub_10002F43C(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
    __break(1u);
    return;
  }
  v14 = v22;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_100024DF8(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_100024DF8(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for IndexPath(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

void *sub_100024E90()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100005170(&qword_100059900);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_retain(v17);
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_100025030()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059908;
  if (!qword_100059908)
  {
    v1 = objc_opt_self(UICollectionViewLayoutAttributes);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100059908);
  }
  return result;
}

id sub_10002506C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = type metadata accessor for IndexPath(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005170(&qword_100059920);
  v24 = v0;
  v5 = *v0;
  v6 = static _DictionaryStorage.copy(original:)(*v0);
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release(v5);
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100025294(uint64_t a1)
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
    result = sub_100025540(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
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

void (*sub_10002544C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1000254CC(v6, a2, a3);
  return sub_1000254A0;
}

void sub_1000254A0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1000254CC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_100025538;
  }
  __break(1u);
  return result;
}

void sub_100025538(id *a1)
{

}

uint64_t sub_100025540(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_100025738();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100005170(&qword_100059910);
          v13 = sub_10002544C(v18, i, a3);
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
    sub_100025030();
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

unint64_t sub_100025738()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059918;
  if (!qword_100059918)
  {
    v1 = sub_10000437C(&qword_100059910);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100059918);
  }
  return result;
}

unint64_t sub_100025784()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059928;
  if (!qword_100059928)
  {
    v1 = type metadata accessor for IndexPath(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for IndexPath, v1);
    atomic_store(result, (unint64_t *)&qword_100059928);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FriendInviteAcceptedStatusView(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;
  id v5;

  v3 = *((_QWORD *)a2 + 2);
  v4 = *a2;
  *(_OWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = v3;
  v5 = (id)v4;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for FriendInviteAcceptedStatusView(uint64_t a1)
{

  return swift_release(*(_QWORD *)(a1 + 16));
}

uint64_t assignWithCopy for FriendInviteAcceptedStatusView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v8 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain(v7);
  swift_release(v9);
  return a1;
}

uint64_t assignWithTake for FriendInviteAcceptedStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteAcceptedStatusView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FriendInviteAcceptedStatusView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FriendInviteAcceptedStatusView()
{
  return &type metadata for FriendInviteAcceptedStatusView;
}

uint64_t sub_100025968(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100046264, 1);
}

uint64_t sub_100025978@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;

  v32 = a2;
  v3 = type metadata accessor for AttributeContainer(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AttributedString(0);
  v31 = *(_QWORD *)(v6 - 8);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v30 - v10;
  v12 = objc_msgSend(a1, "displayNameWithOptions:", 0);
  if (!v12)
    v12 = objc_msgSend(a1, "displayName");
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v15 = v14;

  AttributeContainer.init()();
  AttributedString.init(_:attributes:)(v13, v15, v5);
  KeyPath = swift_getKeyPath(&unk_100044C00);
  __chkstk_darwin(KeyPath);
  v17 = swift_getKeyPath(&unk_100044C30);
  v18 = static Font.footnote.getter();
  v19 = Font.bold()();
  swift_release(v18);
  v33 = v19;
  v20 = sub_100022C64();
  v21 = AttributedString.subscript.setter(&v33, v17, v20);
  v22 = (id)GKGameCenterUIFrameworkBundle(v21);
  v34._object = (void *)0xE000000000000000;
  v23._object = (void *)0x8000000100042190;
  v23._countAndFlagsBits = 0xD000000000000020;
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  v34._countAndFlagsBits = 0;
  v25 = NSLocalizedString(_:tableName:bundle:value:comment:)(v23, (Swift::String_optional)0, (NSBundle)v22, v24, v34);

  AttributeContainer.init()();
  AttributedString.init(_:attributes:)(v25._countAndFlagsBits, v25._object, v5);
  v26 = swift_getKeyPath(&unk_100044C00);
  __chkstk_darwin(v26);
  v27 = swift_getKeyPath(&unk_100044C30);
  v33 = static Font.footnote.getter();
  AttributedString.subscript.setter(&v33, v27, v20);
  static AttributedString.+ infix(_:_:)(v11, v9);
  v28 = *(void (**)(char *, uint64_t))(v31 + 8);
  v28(v9, v6);
  return ((uint64_t (*)(char *, uint64_t))v28)(v11, v6);
}

uint64_t sub_100025C40@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  id v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  void (*v45)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;

  v51 = a4;
  v7 = sub_100005170(&qword_1000589D8);
  __chkstk_darwin(v7);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100005170(&qword_1000589E0);
  __chkstk_darwin(v10);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005170(&qword_100059938);
  v52 = *(_QWORD *)(v13 - 8);
  v14 = v13;
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v49 = (char *)&v47 - v18;
  v50 = type metadata accessor for Divider(0);
  v48 = *(_QWORD *)(v50 - 8);
  v19 = __chkstk_darwin(v50);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v19);
  v47 = (char *)&v47 - v23;
  v24 = Divider.init()(v22);
  *(_QWORD *)v9 = static VerticalAlignment.center.getter(v24);
  *((_QWORD *)v9 + 1) = 0x4024000000000000;
  v9[16] = 0;
  v25 = sub_100005170(&qword_100059940);
  v26 = sub_100025F8C(a1, a2, a3, (uint64_t)&v9[*(int *)(v25 + 44)]);
  v27 = static Alignment.leading.getter(v26);
  sub_100004DEC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v12, 0.0, 1, 0.0, 1, v27, v28);
  sub_10000527C((uint64_t)v9, &qword_1000589D8);
  v29 = (_QWORD *)swift_allocObject(&unk_100052E88, 40, 7);
  v29[2] = a1;
  v29[3] = a2;
  v29[4] = a3;
  v30 = sub_1000266F4();
  v31 = a1;
  swift_retain(a3);
  v32 = v17;
  View.onTapGesture(count:perform:)(1, sub_1000266E8, v29, v10, v30);
  swift_release(v29);
  sub_10000527C((uint64_t)v12, &qword_1000589E0);
  v33 = v52;
  v34 = v49;
  v35 = v17;
  v36 = v14;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v49, v35, v14);
  v37 = v47;
  v38 = v48;
  v39 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
  v40 = v50;
  v39(v21, v47, v50);
  v41 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  v41(v32, v34, v36);
  v42 = v51;
  v39(v51, v21, v40);
  v43 = sub_100005170(&qword_100059958);
  v41(&v42[*(int *)(v43 + 48)], v32, v36);
  v44 = *(void (**)(char *, uint64_t))(v52 + 8);
  v44(v34, v36);
  v45 = *(void (**)(char *, uint64_t))(v38 + 8);
  v45(v37, v40);
  v44(v32, v36);
  return ((uint64_t (*)(char *, uint64_t))v45)(v21, v40);
}

uint64_t sub_100025F8C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[3];
  uint64_t v32;
  _OWORD v33[3];

  v31[1] = a2;
  v31[2] = a3;
  v32 = a4;
  v5 = sub_100005170(&qword_100059960);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v31 - v9;
  v11 = type metadata accessor for DashboardPlayerPhotoView(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100005170(&qword_1000595A0);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)v31 - v19;
  v21 = DashboardPlayerPhotoView.init(playerInternal:onContentReady:)(objc_msgSend(a1, "internal"), 0, 0);
  v22 = static Alignment.center.getter(v21);
  _FrameLayout.init(width:height:alignment:)(v33, 0x4040000000000000, 0, 0x4040000000000000, 0, v22, v23);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v18, v14, v11);
  v24 = &v18[*(int *)(v15 + 36)];
  v25 = v33[1];
  *(_OWORD *)v24 = v33[0];
  *((_OWORD *)v24 + 1) = v25;
  *((_OWORD *)v24 + 2) = v33[2];
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v26 = sub_100026778((uint64_t)v18, (uint64_t)v20, &qword_1000595A0);
  *(_QWORD *)v10 = static HorizontalAlignment.leading.getter(v26);
  *((_QWORD *)v10 + 1) = 0x4010000000000000;
  v10[16] = 0;
  v27 = sub_100005170(&qword_100059968);
  sub_100026214(a1, (uint64_t *)&v10[*(int *)(v27 + 44)]);
  sub_1000053A8((uint64_t)v20, (uint64_t)v18, &qword_1000595A0);
  sub_1000053A8((uint64_t)v10, (uint64_t)v8, &qword_100059960);
  v28 = v32;
  sub_1000053A8((uint64_t)v18, v32, &qword_1000595A0);
  v29 = sub_100005170(&qword_100059970);
  sub_1000053A8((uint64_t)v8, v28 + *(int *)(v29 + 48), &qword_100059960);
  sub_10000527C((uint64_t)v10, &qword_100059960);
  sub_10000527C((uint64_t)v20, &qword_1000595A0);
  sub_10000527C((uint64_t)v8, &qword_100059960);
  return sub_10000527C((uint64_t)v18, &qword_1000595A0);
}

uint64_t sub_100026214@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  unint64_t v50;
  _BYTE *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  _BYTE v59[4];
  int v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  Swift::String v69;
  char v70;
  uint64_t v71;
  __int16 v72;
  Swift::String v73;

  v68 = a2;
  v3 = type metadata accessor for AccessibilityTraits(0);
  v66 = *(_QWORD *)(v3 - 8);
  v67 = v3;
  __chkstk_darwin(v3);
  v61 = &v59[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_100005170(&qword_100059978);
  v6 = __chkstk_darwin(v5);
  v8 = &v59[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v65 = &v59[-v9];
  v10 = type metadata accessor for AttributedString(0);
  __chkstk_darwin(v10);
  v12 = &v59[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100025978(a1, (uint64_t)v12);
  v13 = Text.init(_:)(v12);
  v63 = v14;
  v64 = v13;
  v62 = v15;
  v60 = v16 & 1;
  v17 = (id)GKGameCenterUIFrameworkBundle(v13);
  v73._object = (void *)0xE000000000000000;
  v18._object = (void *)0x80000001000421C0;
  v18._countAndFlagsBits = 0xD00000000000001DLL;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v73._countAndFlagsBits = 0;
  v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v73);

  v69 = v20;
  v21 = sub_1000042C0();
  v22 = Text.init<A>(_:)(&v69, &type metadata for String, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27 & 1;
  v29 = static Font.footnote.getter();
  v30 = Font.bold()();
  swift_release(v29);
  v31 = Text.font(_:)(v30, v22, v24, v28, v26);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  swift_release(v30);
  v38 = v35 & 1;
  sub_100004304(v22, v24, v28);
  v39 = swift_bridgeObjectRelease(v26);
  v40 = static Color.blue.getter(v39);
  v69._countAndFlagsBits = v40;
  v41 = Text.foregroundStyle<A>(_:)(&v69, v31, v33, v38, v37, &type metadata for Color, &protocol witness table for Color);
  v43 = v42;
  LOBYTE(v30) = v44;
  v46 = v45;
  sub_100004304(v31, v33, v38);
  swift_release(v40);
  v47 = swift_bridgeObjectRelease(v37);
  v69._countAndFlagsBits = v41;
  v69._object = v43;
  v70 = v30 & 1;
  v71 = v46;
  v72 = 256;
  v48 = v61;
  static AccessibilityTraits.isButton.getter(v47);
  v49 = sub_100005170(&qword_100058838);
  v50 = sub_100004318();
  View.accessibilityAddTraits(_:)(v48, v49, v50);
  (*(void (**)(_BYTE *, uint64_t))(v66 + 8))(v48, v67);
  sub_100004304(v69._countAndFlagsBits, (uint64_t)v69._object, v70);
  swift_bridgeObjectRelease(v71);
  v51 = v65;
  sub_100026778((uint64_t)v8, (uint64_t)v65, &qword_100059978);
  sub_1000053A8((uint64_t)v51, (uint64_t)v8, &qword_100059978);
  v52 = v68;
  v53 = v63;
  v54 = v64;
  v55 = v62;
  *v68 = v64;
  v52[1] = v55;
  LOBYTE(v30) = v60;
  *((_BYTE *)v52 + 16) = v60;
  v52[3] = v53;
  *((_WORD *)v52 + 16) = 256;
  v56 = v52;
  v57 = sub_100005170(&qword_100059980);
  sub_1000053A8((uint64_t)v8, (uint64_t)v56 + *(int *)(v57 + 48), &qword_100059978);
  sub_1000051F4(v54, v55, v30);
  swift_bridgeObjectRetain(v53);
  sub_10000527C((uint64_t)v51, &qword_100059978);
  sub_10000527C((uint64_t)v8, &qword_100059978);
  sub_100004304(v54, v55, v30);
  return swift_bridgeObjectRelease(v53);
}

uint64_t sub_1000265D4(void *a1, void (*a2)(uint64_t, uint64_t))
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(a1, "internal");
  v4 = objc_msgSend(v3, "playerID");

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v7 = v6;

  a2(v5, v7);
  return swift_bridgeObjectRelease(v7);
}

uint64_t sub_10002665C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *(void **)v6;
  v9 = *(_QWORD *)(v6 + 8);
  v10 = *(_QWORD *)(v6 + 16);
  *(_QWORD *)a6 = static HorizontalAlignment.center.getter(a1, a2, a3, a4, a5);
  *(_QWORD *)(a6 + 8) = 0x4024000000000000;
  *(_BYTE *)(a6 + 16) = 0;
  v11 = sub_100005170(&qword_100059930);
  return sub_100025C40(v8, v9, v10, (char *)(a6 + *(int *)(v11 + 44)));
}

uint64_t sub_1000266BC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000266E8()
{
  uint64_t v0;

  return sub_1000265D4(*(void **)(v0 + 16), *(void (**)(uint64_t, uint64_t))(v0 + 24));
}

unint64_t sub_1000266F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059948;
  if (!qword_100059948)
  {
    v1 = sub_10000437C(&qword_1000589E0);
    sub_1000056BC(&qword_100059950, &qword_1000589D8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059948);
  }
  return result;
}

uint64_t sub_100026778(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005170(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000267C8()
{
  return 8;
}

uint64_t sub_1000267D4(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t sub_1000267DC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

_QWORD *sub_1000267F0(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000267FC()
{
  return sub_1000056BC(&qword_100059988, &qword_100059990, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_100026830(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = "\b";
  v2[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[3] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[4] = (char *)&value witness table for Builtin.Int64 + 64;
  return swift_initClassMetadata2(a1, 0, 5, v2, a1 + 216);
}

id sub_100026890()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  objc_class *v6;
  objc_super v8;

  v1 = swift_isaMask & *v0;
  *(_QWORD *)((char *)v0 + qword_100059998) = 0;
  *(_QWORD *)((char *)v0 + qword_1000599A0) = _swiftEmptyArrayStorage;
  v2 = qword_1000599A8;
  v3 = *(_QWORD *)(v1 + 200);
  v4 = v0;
  *(_QWORD *)((char *)v0 + v2) = static Array._allocateUninitialized(_:)(0, v3);
  *(_QWORD *)((char *)v4 + qword_1000599B0) = 0;
  *(_QWORD *)((char *)v4 + qword_1000599B8) = 100;

  v6 = (objc_class *)type metadata accessor for PlayerItemsModel(0, v3, *(_QWORD *)(v1 + 208), v5);
  v8.receiver = v4;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, "init");
}

id sub_10002695C()
{
  return sub_100026890();
}

uint64_t sub_10002697C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + qword_1000599A0));
  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + qword_1000599A8));
}

id sub_1000269B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for PlayerItemsModel(0, *(_QWORD *)((swift_isaMask & *v4) + 0xC8), *(_QWORD *)((swift_isaMask & *v4) + 0xD0), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t sub_100026A04(uint64_t a1)
{

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + qword_1000599A0));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + qword_1000599A8));
}

uint64_t type metadata accessor for PlayerItemsModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100022D40(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PlayerItemsModel);
}

_QWORD *sub_100026A58(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100005170(&qword_1000594E0);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4, a2, v8);
      v9 = v4;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *v4 = *a2;
      swift_retain(v13);
      v9 = v4;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = a3[6];
    v16 = (_QWORD *)((char *)v4 + v14);
    v17 = (_QWORD *)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = (_QWORD *)((char *)v4 + v15);
    v20 = (_QWORD *)((char *)a2 + v15);
    v12 = v20[1];
    *v19 = *v20;
    v19[1] = v12;
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    swift_retain(v18);
  }
  swift_retain(v12);
  return v4;
}

uint64_t sub_100026B5C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100005170(&qword_1000594E0);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  swift_release(*(_QWORD *)((char *)a1 + *(int *)(a2 + 20) + 8));
  return swift_release(*(_QWORD *)((char *)a1 + *(int *)(a2 + 24) + 8));
}

_QWORD *sub_100026BE0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = sub_100005170(&qword_1000594E0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = a3[6];
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (_QWORD *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (_QWORD *)((char *)a1 + v13);
  v18 = (_QWORD *)((char *)a2 + v13);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  swift_retain(v16);
  swift_retain(v19);
  return a1;
}

_QWORD *sub_100026CBC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  if (a1 != a2)
  {
    sub_10000527C((uint64_t)a1, &qword_1000594E0);
    v6 = sub_100005170(&qword_1000594E0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = a3[5];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = v14[1];
  v16 = v13[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_retain(v15);
  swift_release(v16);
  v17 = a3[6];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v20 = v19[1];
  v21 = v18[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_retain(v20);
  swift_release(v21);
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

char *sub_100026DC8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_100005170(&qword_1000594E0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_100026E84(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_10000527C((uint64_t)a1, &qword_1000594E0);
    v6 = sub_100005170(&qword_1000594E0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = *(_QWORD *)&a1[v8 + 8];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  swift_release(v9);
  v10 = a3[6];
  v11 = *(_QWORD *)&a1[v10 + 8];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  swift_release(v11);
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t sub_100026F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100026F80);
}

uint64_t sub_100026F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100005170(qword_1000594E8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_100027000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002700C);
}

uint64_t sub_10002700C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100005170(qword_1000594E8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for FriendInviteButtonStackView(uint64_t a1)
{
  uint64_t result;

  result = qword_100059A98;
  if (!qword_100059A98)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FriendInviteButtonStackView);
  return result;
}

void sub_1000270C4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  sub_10002015C(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for () + 64;
    v4[2] = (char *)&value witness table for () + 64;
    v4[3] = &unk_100044D40;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

uint64_t sub_100027144(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000463F0, 1);
}

uint64_t sub_100027154@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;

  v29 = a1;
  v30 = sub_100005170(&qword_100059AD8);
  __chkstk_darwin(v30);
  v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100005170(&qword_100059AE0);
  __chkstk_darwin(v3);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005170(&qword_100059AE8);
  __chkstk_darwin(v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ContentSizeCategory(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100036CB8((uint64_t)v12);
  v14 = ContentSizeCategory.isAccessibilityCategory.getter(v13);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if ((v14 & 1) != 0)
  {
    *(_QWORD *)v8 = static HorizontalAlignment.center.getter(v15, v16, v17, v18, v19);
    *((_QWORD *)v8 + 1) = 0x4024000000000000;
    v8[16] = 0;
    v20 = sub_100005170(&qword_100059B08);
    sub_100027C34((uint64_t (*)(uint64_t))sub_10002742C, (void (*)(uint64_t))sub_100027830, &v8[*(int *)(v20 + 44)]);
    v21 = &qword_100059AE8;
    sub_1000053A8((uint64_t)v8, (uint64_t)v5, &qword_100059AE8);
    swift_storeEnumTagMultiPayload(v5, v3, 0);
    v22 = sub_1000056BC(&qword_100059AF8, &qword_100059AE8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v23 = sub_1000056BC(&qword_100059B00, &qword_100059AD8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    _ConditionalContent<>.init(storage:)(v5, v6, v30, v22, v23);
    v24 = (uint64_t)v8;
  }
  else
  {
    *(_QWORD *)v2 = static VerticalAlignment.center.getter(v15);
    *((_QWORD *)v2 + 1) = 0x4024000000000000;
    v2[16] = 0;
    v25 = sub_100005170(&qword_100059AF0);
    sub_100027C34((uint64_t (*)(uint64_t))sub_100027830, (void (*)(uint64_t))sub_10002742C, &v2[*(int *)(v25 + 44)]);
    v21 = &qword_100059AD8;
    sub_1000053A8((uint64_t)v2, (uint64_t)v5, &qword_100059AD8);
    swift_storeEnumTagMultiPayload(v5, v3, 1);
    v26 = sub_1000056BC(&qword_100059AF8, &qword_100059AE8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v27 = sub_1000056BC(&qword_100059B00, &qword_100059AD8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    _ConditionalContent<>.init(storage:)(v5, v6, v30, v26, v27);
    v24 = (uint64_t)v2;
  }
  return sub_10000527C(v24, v21);
}

uint64_t sub_10002742C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t *v24;
  _OWORD *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v35;
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
  uint64_t *v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v60 = a1;
  v2 = type metadata accessor for BorderlessButtonStyle(0);
  v61 = *(_QWORD *)(v2 - 8);
  v62 = v2;
  __chkstk_darwin(v2);
  v59 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v55);
  v54 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_100005170(&qword_100059B20);
  __chkstk_darwin(v56);
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100005170(&qword_100059B28);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_100005170(&qword_100059B30);
  __chkstk_darwin(v53);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_100005170(&qword_100059B38);
  __chkstk_darwin(v57);
  v58 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for FriendInviteButtonStackView(0);
  v15 = (uint64_t *)(v1 + *(int *)(v14 + 20));
  v17 = *v15;
  v16 = v15[1];
  swift_retain(v16);
  v18 = sub_100005170(&qword_100059B40);
  v19 = sub_100028334();
  Button.init(action:label:)(v17, v16, sub_100028084, 0, v18, v19);
  v20 = *(int *)(v14 + 28);
  LOBYTE(v17) = *(_BYTE *)(v1 + v20);
  v21 = v1;
  KeyPath = swift_getKeyPath(&unk_100044DA8);
  v23 = swift_allocObject(&unk_100053010, 17, 7);
  *(_BYTE *)(v23 + 16) = v17;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v10, v7);
  v24 = (uint64_t *)&v12[*(int *)(v53 + 36)];
  *v24 = KeyPath;
  v24[1] = (uint64_t)sub_1000286F8;
  v24[2] = v23;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v25 = v54;
  v26 = &v54[*(int *)(v55 + 20)];
  v27 = enum case for RoundedCornerStyle.continuous(_:);
  v28 = type metadata accessor for RoundedCornerStyle(0);
  v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v26, v27, v28);
  __asm { FMOV            V0.2D, #9.0 }
  *v25 = _Q0;
  if (*(_BYTE *)(v21 + v20) == 1)
  {
    v35 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray2Color");
    v36 = Color.init(uiColor:)(v35);
  }
  else
  {
    v36 = static Color.blue.getter(v29);
  }
  v37 = v36;
  sub_1000051B0((uint64_t)v25, (uint64_t)v6);
  v38 = v56;
  *(_QWORD *)&v6[*(int *)(v56 + 52)] = v37;
  *(_WORD *)&v6[*(int *)(v38 + 56)] = 256;
  v39 = sub_100005204((uint64_t)v25);
  v40 = static Alignment.center.getter(v39);
  v42 = v41;
  v44 = v57;
  v43 = (uint64_t)v58;
  v45 = (uint64_t)&v58[*(int *)(v57 + 36)];
  sub_1000053A8((uint64_t)v6, v45, &qword_100059B20);
  v46 = (uint64_t *)(v45 + *(int *)(sub_100005170(&qword_100059B80) + 36));
  *v46 = v40;
  v46[1] = v42;
  sub_1000053A8((uint64_t)v12, v43, &qword_100059B30);
  sub_10000527C((uint64_t)v6, &qword_100059B20);
  v47 = sub_10000527C((uint64_t)v12, &qword_100059B30);
  v48 = v59;
  BorderlessButtonStyle.init()(v47);
  v49 = sub_100028520();
  v50 = sub_100013024();
  v51 = v62;
  View.buttonStyle<A>(_:)(v48, v44, v62, v49, v50);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v48, v51);
  return sub_10000527C(v43, &qword_100059B38);
}

uint64_t sub_100027830@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t *v24;
  _OWORD *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v35;
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
  uint64_t *v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v60 = a1;
  v2 = type metadata accessor for BorderlessButtonStyle(0);
  v61 = *(_QWORD *)(v2 - 8);
  v62 = v2;
  __chkstk_darwin(v2);
  v59 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v55);
  v54 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_100005170(&qword_100059B20);
  __chkstk_darwin(v56);
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100005170(&qword_100059B28);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_100005170(&qword_100059B30);
  __chkstk_darwin(v53);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_100005170(&qword_100059B38);
  __chkstk_darwin(v57);
  v58 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for FriendInviteButtonStackView(0);
  v15 = (uint64_t *)(v1 + *(int *)(v14 + 24));
  v17 = *v15;
  v16 = v15[1];
  swift_retain(v16);
  v18 = sub_100005170(&qword_100059B40);
  v19 = sub_100028334();
  Button.init(action:label:)(v17, v16, sub_100027DA8, 0, v18, v19);
  v20 = *(int *)(v14 + 28);
  LOBYTE(v17) = *(_BYTE *)(v1 + v20);
  v21 = v1;
  KeyPath = swift_getKeyPath(&unk_100044DA8);
  v23 = swift_allocObject(&unk_100052FE8, 17, 7);
  *(_BYTE *)(v23 + 16) = v17;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v10, v7);
  v24 = (uint64_t *)&v12[*(int *)(v53 + 36)];
  *v24 = KeyPath;
  v24[1] = (uint64_t)sub_100028508;
  v24[2] = v23;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v25 = v54;
  v26 = &v54[*(int *)(v55 + 20)];
  v27 = enum case for RoundedCornerStyle.continuous(_:);
  v28 = type metadata accessor for RoundedCornerStyle(0);
  v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v26, v27, v28);
  __asm { FMOV            V0.2D, #9.0 }
  *v25 = _Q0;
  if (*(_BYTE *)(v21 + v20) == 1)
  {
    v35 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray2Color");
    v36 = Color.init(uiColor:)(v35);
  }
  else
  {
    v36 = static Color.white.getter(v29);
  }
  v37 = v36;
  sub_1000051B0((uint64_t)v25, (uint64_t)v6);
  v38 = v56;
  *(_QWORD *)&v6[*(int *)(v56 + 52)] = v37;
  *(_WORD *)&v6[*(int *)(v38 + 56)] = 256;
  v39 = sub_100005204((uint64_t)v25);
  v40 = static Alignment.center.getter(v39);
  v42 = v41;
  v44 = v57;
  v43 = (uint64_t)v58;
  v45 = (uint64_t)&v58[*(int *)(v57 + 36)];
  sub_1000053A8((uint64_t)v6, v45, &qword_100059B20);
  v46 = (uint64_t *)(v45 + *(int *)(sub_100005170(&qword_100059B80) + 36));
  *v46 = v40;
  v46[1] = v42;
  sub_1000053A8((uint64_t)v12, v43, &qword_100059B30);
  sub_10000527C((uint64_t)v6, &qword_100059B20);
  v47 = sub_10000527C((uint64_t)v12, &qword_100059B30);
  v48 = v59;
  BorderlessButtonStyle.init()(v47);
  v49 = sub_100028520();
  v50 = sub_100013024();
  v51 = v62;
  View.buttonStyle<A>(_:)(v48, v44, v62, v49, v50);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v48, v51);
  return sub_10000527C(v43, &qword_100059B38);
}

uint64_t sub_100027C34@<X0>(uint64_t (*a1)(uint64_t)@<X1>, void (*a2)(uint64_t)@<X2>, char *a3@<X8>)
{
  uint64_t v6;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;

  v6 = sub_100005170(&qword_100059B10);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v25 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v25 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v25 - v18;
  v20 = a1(v17);
  a2(v20);
  v21 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v21(v13, v19, v6);
  v21(v10, v16, v6);
  v21(a3, v13, v6);
  v22 = sub_100005170(&qword_100059B18);
  v21(&a3[*(int *)(v22 + 48)], v10, v6);
  v23 = *(void (**)(char *, uint64_t))(v7 + 8);
  v23(v16, v6);
  v23(v19, v6);
  v23(v10, v6);
  return ((uint64_t (*)(char *, uint64_t))v23)(v13, v6);
}

double sub_100027DA8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  char v19;
  uint64_t (*v20)(char *, uint64_t);
  uint64_t v21;
  __n128 v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  double result;
  __int128 v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  _OWORD v54[13];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  Swift::String v69;

  v2 = type metadata accessor for GKFeatureFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (id)GKGameCenterUIFrameworkBundle(v4);
  v69._object = (void *)0xE000000000000000;
  v8._countAndFlagsBits = 0x45524F4E4749;
  v8._object = (void *)0xE600000000000000;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v69._countAndFlagsBits = 0;
  v10 = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v69);

  v54[0] = v10;
  v11 = sub_1000042C0();
  v52 = Text.init<A>(_:)(v54, &type metadata for String, v11);
  v53 = v12;
  v14 = v13;
  v51 = v15;
  v50 = static Edge.Set.vertical.getter(v52);
  v16 = enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v18 = v17(v6, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v2);
  v19 = GKFeatureFlags.isEnabled.getter(v18);
  v20 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  v21 = v20(v6, v2);
  v22.n128_u64[0] = 6.0;
  if ((v19 & 1) != 0)
    v22.n128_f64[0] = 8.0;
  v23 = EdgeInsets.init(_all:)(v21, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = static Font.subheadline.getter();
  v31 = Font.bold()();
  swift_release(v30);
  KeyPath = swift_getKeyPath(&unk_100044DD8);
  v33 = v17(v6, v16, v2);
  v34 = GKFeatureFlags.isEnabled.getter(v33);
  v35 = v20(v6, v2);
  if ((v34 & 1) != 0)
    v36 = static Color.blue.getter(v35);
  else
    v36 = static Color.red.getter(v35);
  v37 = v36;
  v38 = v51 & 1;
  v40 = v52;
  v39 = v53;
  v56 = v52;
  v57 = v14;
  v58 = v51 & 1;
  v59 = v53;
  v60 = v50;
  v61 = v23;
  v62 = v25;
  v63 = v27;
  v64 = v29;
  v65 = 0;
  v66 = KeyPath;
  v67 = v31;
  v68 = v36;
  v41 = static Alignment.center.getter(v36);
  sub_100004FA8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v54, 0.0, 1, 0.0, 1, v41, v42);
  sub_100004304(v40, v14, v38);
  swift_release(v37);
  swift_release(v31);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v39);
  v43 = v54[11];
  *(_OWORD *)(a1 + 160) = v54[10];
  *(_OWORD *)(a1 + 176) = v43;
  *(_OWORD *)(a1 + 192) = v54[12];
  *(_QWORD *)(a1 + 208) = v55;
  v44 = v54[7];
  *(_OWORD *)(a1 + 96) = v54[6];
  *(_OWORD *)(a1 + 112) = v44;
  v45 = v54[9];
  *(_OWORD *)(a1 + 128) = v54[8];
  *(_OWORD *)(a1 + 144) = v45;
  v46 = v54[3];
  *(_OWORD *)(a1 + 32) = v54[2];
  *(_OWORD *)(a1 + 48) = v46;
  v47 = v54[5];
  *(_OWORD *)(a1 + 64) = v54[4];
  *(_OWORD *)(a1 + 80) = v47;
  result = *(double *)v54;
  v49 = v54[1];
  *(_OWORD *)a1 = v54[0];
  *(_OWORD *)(a1 + 16) = v49;
  return result;
}

double sub_100028084@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  __n128 v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  double result;
  __int128 v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  _OWORD v48[13];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  Swift::String v63;

  v2 = type metadata accessor for GKFeatureFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (id)GKGameCenterUIFrameworkBundle(v4);
  v63._object = (void *)0xE000000000000000;
  v8._countAndFlagsBits = 0x545045434341;
  v8._object = (void *)0xE600000000000000;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v63._countAndFlagsBits = 0;
  v10 = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v63);

  v48[0] = v10;
  v11 = sub_1000042C0();
  v12 = Text.init<A>(_:)(v48, &type metadata for String, v11);
  v14 = v13;
  v47 = v15;
  v17 = v16 & 1;
  v46 = static Edge.Set.vertical.getter(v12);
  v18 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v2);
  v19 = GKFeatureFlags.isEnabled.getter(v18);
  v20 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v21.n128_u64[0] = 6.0;
  if ((v19 & 1) != 0)
    v21.n128_f64[0] = 8.0;
  v22 = EdgeInsets.init(_all:)(v20, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = static Font.subheadline.getter();
  v30 = Font.bold()();
  swift_release(v29);
  KeyPath = swift_getKeyPath(&unk_100044DD8);
  v32 = static Color.white.getter();
  v33 = v12;
  v50 = v12;
  v51 = v14;
  v34 = v14;
  v52 = v17;
  v35 = v47;
  v53 = v47;
  v54 = v46;
  v55 = v22;
  v56 = v24;
  v57 = v26;
  v58 = v28;
  v59 = 0;
  v60 = KeyPath;
  v61 = v30;
  v62 = v32;
  v36 = static Alignment.center.getter(v32);
  sub_100004FA8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v48, 0.0, 1, 0.0, 1, v36, v37);
  sub_100004304(v33, v34, v17);
  swift_release(v32);
  swift_release(v30);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v35);
  v38 = v48[11];
  *(_OWORD *)(a1 + 160) = v48[10];
  *(_OWORD *)(a1 + 176) = v38;
  *(_OWORD *)(a1 + 192) = v48[12];
  *(_QWORD *)(a1 + 208) = v49;
  v39 = v48[7];
  *(_OWORD *)(a1 + 96) = v48[6];
  *(_OWORD *)(a1 + 112) = v39;
  v40 = v48[9];
  *(_OWORD *)(a1 + 128) = v48[8];
  *(_OWORD *)(a1 + 144) = v40;
  v41 = v48[3];
  *(_OWORD *)(a1 + 32) = v48[2];
  *(_OWORD *)(a1 + 48) = v41;
  v42 = v48[5];
  *(_OWORD *)(a1 + 64) = v48[4];
  *(_OWORD *)(a1 + 80) = v42;
  result = *(double *)v48;
  v44 = v48[1];
  *(_OWORD *)a1 = v48[0];
  *(_OWORD *)(a1 + 16) = v44;
  return result;
}

unint64_t sub_100028334()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059B48;
  if (!qword_100059B48)
  {
    v1 = sub_10000437C(&qword_100059B40);
    sub_1000283A0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059B48);
  }
  return result;
}

unint64_t sub_1000283A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059B50;
  if (!qword_100059B50)
  {
    v1 = sub_10000437C(&qword_100059B58);
    sub_100028424();
    sub_1000056BC(&qword_100059B70, &qword_100059B78, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059B50);
  }
  return result;
}

unint64_t sub_100028424()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059B60;
  if (!qword_100059B60)
  {
    v1 = sub_10000437C(&qword_100059B68);
    sub_100005658();
    sub_1000056BC(&qword_100059630, &qword_100059638, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059B60);
  }
  return result;
}

uint64_t sub_1000284A8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000284D4(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_1000284F8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_100028508(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_100028520()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059B88;
  if (!qword_100059B88)
  {
    v1 = sub_10000437C(&qword_100059B38);
    sub_1000285A4();
    sub_1000056BC(&qword_100059BB0, &qword_100059B80, (uint64_t)&protocol conformance descriptor for _BackgroundModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059B88);
  }
  return result;
}

unint64_t sub_1000285A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059B90;
  if (!qword_100059B90)
  {
    v1 = sub_10000437C(&qword_100059B30);
    sub_1000056BC(&qword_100059B98, &qword_100059B28, (uint64_t)&protocol conformance descriptor for Button<A>);
    sub_1000056BC(&qword_100059BA0, &qword_100059BA8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059B90);
  }
  return result;
}

uint64_t sub_100028648()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

unint64_t sub_10002865C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059BB8;
  if (!qword_100059BB8)
  {
    v1 = sub_10000437C(&qword_100059BC0);
    sub_1000056BC(&qword_100059AF8, &qword_100059AE8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_1000056BC(&qword_100059B00, &qword_100059AD8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059BB8);
  }
  return result;
}

uint64_t sub_1000286FC(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  _QWORD *v23;
  _QWORD aBlock[5];
  _QWORD *v25;

  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)&v2[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadQueue];
  v13 = (_QWORD *)swift_allocObject(&unk_100053110, 40, 7);
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_10002956C;
  v25 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013AF4;
  aBlock[3] = &unk_100053128;
  v14 = _Block_copy(aBlock);
  v15 = v12;
  v16 = v2;
  v17 = swift_retain(a2);
  static DispatchQoS.unspecified.getter(v17);
  v23 = _swiftEmptyArrayStorage;
  v18 = sub_10000FFE4((unint64_t *)&unk_100059E10, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v19 = sub_100005170((uint64_t *)&unk_100058CD0);
  v20 = sub_100029590((unint64_t *)&qword_100059E20, (uint64_t *)&unk_100058CD0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v23, v19, v20, v5, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release(v25);
}

void sub_100028900()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  uint64_t ObjectType;
  uint64_t v6;
  unint64_t v7;

  v6 = 0;
  v7 = 0xE000000000000000;
  _StringGuts.grow(_:)(62);
  ObjectType = swift_getObjectType(v0);
  v1 = sub_100005170(&qword_100059C10);
  v2._countAndFlagsBits = String.init<A>(describing:)(&ObjectType, v1);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._object = (void *)0x8000000100042FA0;
  v4._countAndFlagsBits = 0xD00000000000003CLL;
  String.append(_:)(v4);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v6, v7, "GameCenterMessageExtension/Loadable.swift", 41, 2, 30, 0);
  __break(1u);
}

void sub_1000289C0(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  _BYTE *v14;
  void **v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;

  if (a1[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadingState] - 1 >= 2)
  {
    a1[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadingState] = 1;
    v11 = *(void **)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadGroup];
    v12 = (_QWORD *)swift_allocObject(&unk_1000531B0, 40, 7);
    v12[2] = a1;
    v12[3] = a2;
    v12[4] = a3;
    v19 = sub_10002961C;
    v20 = v12;
    v15 = _NSConcreteStackBlock;
    v16 = 1107296256;
    v17 = sub_100018414;
    v18 = &unk_1000531C8;
    v8 = _Block_copy(&v15);
    v13 = v20;
    v10 = v11;
    v14 = a1;
    swift_retain(a3);
    swift_release(v13);
    objc_msgSend(v10, "perform:", v8);
  }
  else
  {
    v6 = *(void **)&a1[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadGroup];
    v7 = swift_allocObject(&unk_100053160, 32, 7);
    *(_QWORD *)(v7 + 16) = a2;
    *(_QWORD *)(v7 + 24) = a3;
    v19 = sub_1000295F4;
    v20 = (_QWORD *)v7;
    v15 = _NSConcreteStackBlock;
    v16 = 1107296256;
    v17 = sub_100013AF4;
    v18 = &unk_100053178;
    v8 = _Block_copy(&v15);
    v9 = v20;
    swift_retain(a3);
    v10 = v6;
    swift_release(v9);
    objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v8);
  }
  _Block_release(v8);

}

uint64_t sub_100028B58(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  void (*v11)(uint64_t (*)(uint64_t), _QWORD *);
  _QWORD *v12;

  v10 = (_QWORD *)swift_allocObject(&unk_100053200, 56, 7);
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  v10[5] = a1;
  v10[6] = a2;
  v11 = *(void (**)(uint64_t (*)(uint64_t), _QWORD *))((swift_isaMask & *a3) + 0xB8);
  v12 = a3;
  swift_retain(a5);
  swift_retain(a2);
  v11(sub_10002965C, v10);
  return swift_release(v10);
}

uint64_t sub_100028BFC(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD aBlock[5];
  _QWORD *v33;

  v12 = type metadata accessor for DispatchWorkItemFlags(0);
  v30 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for DispatchQoS(0);
  v28 = *(_QWORD *)(v15 - 8);
  v29 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(void **)&a2[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadQueue];
  v19 = (_QWORD *)swift_allocObject(&unk_100053228, 64, 7);
  v19[2] = a2;
  v19[3] = a1;
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a5;
  v19[7] = a6;
  aBlock[4] = sub_1000296A8;
  v33 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013AF4;
  aBlock[3] = &unk_100053240;
  v20 = _Block_copy(aBlock);
  v21 = v18;
  v22 = a2;
  swift_errorRetain(a1);
  swift_retain(a4);
  v23 = swift_retain(a6);
  static DispatchQoS.unspecified.getter(v23);
  v31 = _swiftEmptyArrayStorage;
  v24 = sub_10000FFE4((unint64_t *)&unk_100059E10, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v25 = sub_100005170((uint64_t *)&unk_100058CD0);
  v26 = sub_100029590((unint64_t *)&qword_100059E20, (uint64_t *)&unk_100058CD0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v31, v25, v26, v12, v24);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v17, v14, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v12);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v29);
  return swift_release(v33);
}

uint64_t sub_100028E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  _QWORD aBlock[5];
  _QWORD *v33;

  v30 = a6;
  v31 = a5;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v29 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
    v17 = 3;
  else
    v17 = 2;
  *(_BYTE *)(a1 + OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadingState) = v17;
  sub_10002952C();
  v18 = (void *)static OS_dispatch_queue.main.getter();
  v19 = (_QWORD *)swift_allocObject(&unk_100053278, 40, 7);
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a2;
  aBlock[4] = sub_1000296E4;
  v33 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013AF4;
  aBlock[3] = &unk_100053290;
  v20 = _Block_copy(aBlock);
  v21 = v33;
  swift_retain(a4);
  swift_errorRetain(a2);
  v22 = swift_release(v21);
  static DispatchQoS.unspecified.getter(v22);
  aBlock[0] = _swiftEmptyArrayStorage;
  v23 = sub_10000FFE4((unint64_t *)&unk_100059E10, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v24 = sub_100005170((uint64_t *)&unk_100058CD0);
  v25 = sub_100029590((unint64_t *)&qword_100059E20, (uint64_t *)&unk_100058CD0);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v10, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v16, v12, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v10);
  v26 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return v31(v26);
}

id sub_10002905C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  Swift::String v11;
  void *object;
  Swift::String v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  Swift::String v22;
  void *v23;
  uint64_t v24;
  Swift::String v25;
  unint64_t v26;
  id v27;
  NSString v28;
  id v29;
  objc_class *v30;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;

  v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v36 = *(_QWORD *)(v1 - 8);
  v37 = v1;
  __chkstk_darwin(v1);
  v35 = (char *)v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v3);
  v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v6);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadingState] = 0;
  v40 = 0x7565755164616F6CLL;
  v41 = 0xEB000000003C2065;
  v34 = sub_100005170(&qword_100059C18);
  v39 = v34;
  v9 = v0;
  v10 = sub_100005170(&qword_100059C20);
  v11._countAndFlagsBits = String.init<A>(describing:)(&v39, v10);
  object = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(object);
  v33 = OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadQueue;
  v32[1] = sub_10002952C();
  v13._countAndFlagsBits = 62;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  v14 = v40;
  v15 = v41;
  static DispatchQoS.unspecified.getter(v16);
  v40 = (uint64_t)_swiftEmptyArrayStorage;
  v17 = sub_10000FFE4(&qword_100059C28, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v18 = sub_100005170(&qword_100059C30);
  v19 = sub_100029590(&qword_100059C38, &qword_100059C30);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v40, v18, v19, v3, v17);
  v20 = v35;
  (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v35, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v37);
  v21 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v14, v15, v8, v5, v20, 0);
  *(_QWORD *)&v9[v33] = v21;
  v40 = 0x756F724764616F6CLL;
  v41 = 0xEB000000003C2070;
  v39 = v34;
  v22._countAndFlagsBits = String.init<A>(describing:)(&v39, v10);
  v23 = v22._object;
  String.append(_:)(v22);
  swift_bridgeObjectRelease(v23);
  v24 = OBJC_IVAR____TtC26GameCenterMessageExtension13LoadableModel_loadGroup;
  v25._countAndFlagsBits = 62;
  v25._object = (void *)0xE100000000000000;
  String.append(_:)(v25);
  v26 = v41;
  v27 = objc_allocWithZone((Class)GKDispatchGroup);
  v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v26);
  v29 = objc_msgSend(v27, "initWithName:", v28);

  *(_QWORD *)&v9[v24] = v29;
  v30 = (objc_class *)type metadata accessor for LoadableModel();
  v38.receiver = v9;
  v38.super_class = v30;
  return objc_msgSendSuper2(&v38, "init");
}

id sub_100029390()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LoadableModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LoadableModel()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension13LoadableModel);
}

uint64_t storeEnumTagSinglePayload for LoadableModel.LoadingState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100029464 + 4 * byte_100044E15[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100029498 + 4 * byte_100044E10[v4]))();
}

uint64_t sub_100029498(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000294A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000294A8);
  return result;
}

uint64_t sub_1000294B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000294BCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1000294C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000294C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LoadableModel.LoadingState()
{
  return &type metadata for LoadableModel.LoadingState;
}

unint64_t sub_1000294E8()
{
  unint64_t result;

  result = qword_100059C08;
  if (!qword_100059C08)
  {
    result = swift_getWitnessTable(&unk_100044ED0, &type metadata for LoadableModel.LoadingState);
    atomic_store(result, (unint64_t *)&qword_100059C08);
  }
  return result;
}

unint64_t sub_10002952C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100058CC0;
  if (!qword_100058CC0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100058CC0);
  }
  return result;
}

void sub_10002956C()
{
  uint64_t v0;

  sub_1000289C0(*(_BYTE **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100029578(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100029588(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100029590(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000437C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000295D0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000295F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

uint64_t sub_10002961C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100028B58(a1, a2, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_100029628()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002965C(uint64_t a1)
{
  uint64_t v1;

  return sub_100028BFC(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_10002966C()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000296A8()
{
  uint64_t v0;

  return sub_100028E24(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(uint64_t (**)(uint64_t))(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_1000296B8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_errorRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000296E4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32));
}

id sub_10002972C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject **v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v3);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v18 = v1;
    v9 = swift_slowAlloc(12, -1);
    v17 = v2;
    v10 = (uint8_t *)v9;
    v11 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    v19 = v6;
    v12 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20);
    *v11 = v6;

    v1 = v18;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ user interface is ready for display", v10, 0xCu);
    v13 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v11, 1, v13);
    swift_slowDealloc(v11, -1, -1);
    v14 = v10;
    v2 = v17;
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {

    v7 = v6;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return -[NSObject setReadyForDisplay](v6, "setReadyForDisplay");
}

uint64_t sub_1000298EC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  char *v11;
  id v12;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, "activeConversation");
  if (v6)
  {
    v7 = v6;
    v8 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
    if (v8)
    {
      v9 = swift_allocObject(&unk_100053588, 32, 7);
      *(_QWORD *)(v9 + 16) = v1;
      *(_QWORD *)(v9 + 24) = v7;
      v10 = v8;
      v11 = v1;
      v12 = v7;
      sub_1000286FC((uint64_t)sub_100032F50, v9);

      return swift_release(v9);
    }

  }
  static GKLog.general.getter(v6);
  v14 = v1;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v25 = v2;
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v18 = swift_slowAlloc(8, -1);
    v24 = v3;
    v19 = (_QWORD *)v18;
    *(_DWORD *)v17 = 138412290;
    v26 = v14;
    v20 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
    *v19 = v14;

    v2 = v25;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Expected a conversation and a playerModel", v17, 0xCu);
    v21 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v19, 1, v21);
    v22 = v19;
    v3 = v24;
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v17, -1, -1);
  }
  else
  {

    v15 = v14;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_100029B3C()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v1 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
  v2 = objc_msgSend(v1, "internal");
  v3 = objc_msgSend(v2, "playerID");

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  v7 = qword_10005C238;
  qword_10005C230 = v4;
  qword_10005C238 = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  if (v8)
  {
    v9 = (_QWORD *)(v8 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs);
    swift_beginAccess(v8 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayerIDs, v13, 0, 0);
    v10 = swift_bridgeObjectRetain(*v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = qword_10005C240;
  qword_10005C240 = v10;
  swift_bridgeObjectRelease(v11);
  byte_100059C60 = 1;
  return objc_msgSend(v0, "requestPresentationStyle:", 3);
}

void sub_100029CB4()
{
  char *v0;
  double *v1;
  id v2;
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Width;
  double v14;
  CGRect v15;

  v1 = (double *)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
  if ((v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight + 8] & 1) != 0)
  {
    v2 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
    v3 = objc_msgSend(v0, "view");
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

      v15.origin.x = v6;
      v15.origin.y = v8;
      v15.size.width = v10;
      v15.size.height = v12;
      Width = CGRectGetWidth(v15);
      v14 = sub_10003008C(v2, 0, 0, Width);

      *v1 = v14;
      *((_BYTE *)v1 + 8) = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100029DA0()
{
  qword_100059C40 = 0x4072C00000000000;
}

uint64_t sub_100029DB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100005170(&qword_100058CE0);
  sub_100032CFC(v0, qword_100059C48);
  v1 = sub_100032C54(v0, (uint64_t)qword_100059C48);
  v2 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

id sub_100029E1C(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v4;
  objc_class *ObjectType;
  char *v8;
  char *v9;
  void *v10;
  char *v11;
  NSString v12;
  id v13;
  void *v14;
  id v15;
  objc_super v17;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_inviteCardResizingObserver] = 0;
  v8 = &v4[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v4[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState];
  v10 = (void *)objc_opt_self(GKLocalPlayer);
  v11 = v4;
  *(_QWORD *)v9 = objc_msgSend(v10, "local");
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 0;

  if (a2)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v12 = 0;
  }
  v17.receiver = v11;
  v17.super_class = ObjectType;
  v13 = objc_msgSendSuper2(&v17, "initWithNibName:bundle:", v12, a3);

  v14 = (void *)objc_opt_self(GKImageRestrictions);
  v15 = v13;
  objc_msgSend(v14, "setForCurrentProcess");

  return v15;
}

id sub_100029FC0(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  char *v5;
  void *v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_inviteCardResizingObserver] = 0;
  v4 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState];
  v6 = (void *)objc_opt_self(GKLocalPlayer);
  v7 = v1;
  *(_QWORD *)v5 = objc_msgSend(v6, "local");
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 0;

  v12.receiver = v7;
  v12.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v12, "initWithCoder:", a1);
  if (v8)
  {
    v9 = (void *)objc_opt_self(GKImageRestrictions);
    v10 = v8;
    objc_msgSend(v9, "setForCurrentProcess");

  }
  return v8;
}

void sub_10002A0F0(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  NSString v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  objc_super v13;

  v13.receiver = v1;
  v13.super_class = (Class)swift_getObjectType(v1);
  objc_msgSendSuper2(&v13, "willBecomeActiveWithConversation:", a1);
  v3 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", v1, "updateCard:", GKPlayerAuthenticationDidChangeNotificationName, 0);

  v4 = (void *)objc_opt_self(GKActivity);
  v5 = String._bridgeToObjectiveC()();
  v6 = swift_allocObject(&unk_1000536C8, 32, 7);
  *(_QWORD *)(v6 + 16) = v1;
  *(_QWORD *)(v6 + 24) = a1;
  v11[4] = sub_100032FAC;
  v12 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100013AF4;
  v11[3] = &unk_1000536E0;
  v7 = _Block_copy(v11);
  v8 = v12;
  v9 = v1;
  v10 = a1;
  swift_release(v8);
  objc_msgSend(v4, "named:execute:", v5, v7);
  _Block_release(v7);

}

uint64_t sub_10002A258(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t inited;
  _QWORD *v6;
  id v7;
  id v8;

  v4 = type metadata accessor for LocalPlayerAuthenticator();
  inited = swift_initStaticObject(v4, &unk_100058760);
  v6 = (_QWORD *)swift_allocObject(&unk_100053718, 40, 7);
  v6[2] = a1;
  v6[3] = inited;
  v6[4] = a2;
  v7 = a1;
  v8 = a2;
  sub_100013194((void (*)(id, _QWORD))sub_100032FE8);
  return swift_release(v6);
}

void sub_10002A2D8(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  objc_class *v47;
  os_log_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;

  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v48 - v15;
  if (!a2)
  {
    if (*(_BYTE *)(a4 + 16) == 2)
    {
      static GKLog.friending.getter(v14);
      v36 = a3;
      v37 = Logger.logObject.getter(v36);
      v38 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v37, v38))
      {
        v51 = v9;
        v39 = (uint8_t *)swift_slowAlloc(12, -1);
        v40 = swift_slowAlloc(8, -1);
        v53 = a5;
        v50 = v40;
        v52 = a3;
        *(_DWORD *)v39 = 138412290;
        v55 = v36;
        v41 = v10;
        v42 = v36;
        v9 = v51;
        a3 = v52;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
        v43 = v50;
        *(_QWORD *)v50 = v36;

        v10 = v41;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ willBecomeActive - authentication succeed.", v39, 0xCu);
        v44 = sub_100005170((uint64_t *)&unk_100058CB0);
        swift_arrayDestroy(v43, 1, v44);
        a5 = v53;
        swift_slowDealloc(v43, -1, -1);
        swift_slowDealloc(v39, -1, -1);
      }
      else
      {

        v37 = v36;
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
      v47 = (objc_class *)sub_10001CAD4(a5);
      v46 = *(Class *)((char *)&v36->isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel);
      *(Class *)((char *)&v36->isa + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel) = v47;
    }
    else
    {
      if (byte_100058770 != 3)
        goto LABEL_13;
      v45 = sub_10001CAD4(a5);
      v46 = *(void **)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
      *(_QWORD *)&a3[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel] = v45;
    }

    goto LABEL_13;
  }
  static GKLog.general.getter(v14);
  v17 = a3;
  swift_errorRetain(a2);
  v18 = v17;
  v19 = swift_errorRetain(a2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc(22, -1);
    v23 = swift_slowAlloc(8, -1);
    v48 = v20;
    v24 = (_QWORD *)v23;
    v49 = swift_slowAlloc(32, -1);
    v54 = (uint64_t)v18;
    v55 = v49;
    *(_DWORD *)v22 = 138412546;
    v52 = a3;
    v53 = a5;
    v51 = v9;
    v25 = v18;
    v50 = v10;
    v26 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55);
    v27 = v24;
    *v24 = v18;

    *(_WORD *)(v22 + 12) = 2080;
    v54 = a2;
    swift_errorRetain(a2);
    v28 = sub_100005170((uint64_t *)&unk_1000591C0);
    v29 = String.init<A>(describing:)(&v54, v28);
    v31 = v30;
    v54 = sub_10003EE08(v29, v30, (uint64_t *)&v55);
    a3 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55);
    v32 = v31;
    a5 = v53;
    swift_bridgeObjectRelease(v32);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    v33 = v48;
    _os_log_impl((void *)&_mh_execute_header, v48, v21, "%@ willBecomeActive - authentication failed with error: %s", (uint8_t *)v22, 0x16u);
    v34 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v27, 1, v34);
    swift_slowDealloc(v27, -1, -1);
    v35 = v49;
    swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v51);
  }
  else
  {

    swift_errorRelease(a2);
    swift_errorRelease(a2);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
  }
LABEL_13:
  sub_10002A764(a5, (uint64_t)objc_msgSend(a3, "presentationStyle"));
}

void sub_10002A764(void *a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t v5;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  NSObject **v28;
  NSObject *v29;
  uint64_t v30;
  NSObject **v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v36;
  NSObject **v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  NSObject *v45;
  NSObject **v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  NSObject **v59;
  NSObject *v60;
  uint64_t v61;
  NSObject **v62;
  NSObject *v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  NSObject **v67;
  NSObject *v68;
  uint64_t v69;
  NSObject **v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  NSObject **v81;
  uint8_t *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  uint64_t v89;

  v3 = v2;
  v83 = a1;
  v84 = type metadata accessor for GKFeatureFlags(0);
  v5 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v7 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v85 = *(_QWORD *)(v8 - 8);
  v86 = v8;
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v81 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v81 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v81 - v19;
  __chkstk_darwin(v18);
  v22 = (char *)&v81 - v21;
  sub_10002CC40();
  if ((v23 & 1) != 0)
    v23 = sub_10002B94C();
  v87 = v2;
  if (byte_100058770 != 2)
  {
    static GKLog.friending.getter(v23);
    v32 = v2;
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v36 = (uint8_t *)swift_slowAlloc(12, -1);
      v37 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v36 = 138412290;
      v88 = v32;
      v38 = v32;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89);
      *v37 = v32;

      v3 = v87;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ local player was not authenticated instantiating actions VC.", v36, 0xCu);
      v39 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v37, 1, v39);
      swift_slowDealloc(v37, -1, -1);
      swift_slowDealloc(v36, -1, -1);
    }
    else
    {

      v33 = v32;
    }

    (*(void (**)(char *, uint64_t))(v85 + 8))(v22, v86);
    v40 = sub_1000308D8();
LABEL_32:
    v54 = (void *)v40;
    goto LABEL_33;
  }
  if (a2 == 3)
  {
    if (byte_100059C60 != 2)
    {
      if ((byte_100059C60 & 1) != 0)
      {
        static GKLog.friending.getter(v23);
        v63 = v2;
        v64 = Logger.logObject.getter(v63);
        v65 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v64, v65))
        {
          v66 = (uint8_t *)swift_slowAlloc(12, -1);
          v67 = (NSObject **)swift_slowAlloc(8, -1);
          *(_DWORD *)v66 = 138412290;
          v88 = v63;
          v68 = v63;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89);
          *v67 = v63;

          _os_log_impl((void *)&_mh_execute_header, v64, v65, "%@ FriendsList was tapped on, instantiating FriendsListViewController.", v66, 0xCu);
          v69 = sub_100005170((uint64_t *)&unk_100058CB0);
          swift_arrayDestroy(v67, 1, v69);
          v70 = v67;
          v3 = v87;
          swift_slowDealloc(v70, -1, -1);
          swift_slowDealloc(v66, -1, -1);
        }
        else
        {

          v64 = v63;
        }

        (*(void (**)(char *, uint64_t))(v85 + 8))(v14, v86);
        v40 = sub_100030DA0(3);
      }
      else
      {
        static GKLog.friending.getter(v23);
        v55 = v2;
        v56 = Logger.logObject.getter(v55);
        v57 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc(12, -1);
          v59 = (NSObject **)swift_slowAlloc(8, -1);
          *(_DWORD *)v58 = 138412290;
          v88 = v55;
          v60 = v55;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89);
          *v59 = v55;

          _os_log_impl((void *)&_mh_execute_header, v56, v57, "%@ Player profile was tapped on, instantiating PlayerProfileViewController.", v58, 0xCu);
          v61 = sub_100005170((uint64_t *)&unk_100058CB0);
          swift_arrayDestroy(v59, 1, v61);
          v62 = v59;
          v3 = v87;
          swift_slowDealloc(v62, -1, -1);
          swift_slowDealloc(v58, -1, -1);
        }
        else
        {

          v56 = v55;
        }

        (*(void (**)(char *, uint64_t))(v85 + 8))(v17, v86);
        v40 = (uint64_t)sub_100030BFC(3);
      }
      goto LABEL_32;
    }
  }
  else if (!a2)
  {
    static GKLog.friending.getter(v23);
    v24 = v2;
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v27 = 138412290;
      v88 = v24;
      v29 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89);
      *v28 = v24;

      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%@ local player was authenticated presentation style was compact so instantiating MessageActionsViewController.", v27, 0xCu);
      v30 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v28, 1, v30);
      v31 = v28;
      v3 = v87;
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v27, -1, -1);
    }
    else
    {

      v25 = v24;
    }

    (*(void (**)(char *, uint64_t))(v85 + 8))(v20, v86);
    v40 = sub_100030A50();
    goto LABEL_32;
  }
  static GKLog.friending.getter(v23);
  v41 = v2;
  v42 = Logger.logObject.getter(v41);
  v43 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc(12, -1);
    v81 = (NSObject **)swift_slowAlloc(8, -1);
    v82 = v44;
    *(_DWORD *)v44 = 138412290;
    v88 = v41;
    v45 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89);
    v46 = v81;
    *v81 = v41;

    v47 = v82;
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "%@ local player was authenticated instantiating FriendRequestCardViewController.", v82, 0xCu);
    v48 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v46, 1, v48);
    swift_slowDealloc(v46, -1, -1);
    swift_slowDealloc(v47, -1, -1);
  }
  else
  {

    v42 = v41;
  }
  v50 = v85;
  v49 = v86;
  v51 = v84;

  (*(void (**)(char *, uint64_t))(v50 + 8))(v11, v49);
  v52 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for GKFeatureFlags.FriendInviteCardRewrite(_:), v51);
  LOBYTE(v49) = GKFeatureFlags.isEnabled.getter(v52);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v51);
  if ((v49 & 1) != 0)
    v53 = sub_10002CD80(v83);
  else
    v53 = sub_100031094();
  v54 = (void *)v53;
  v3 = v87;
LABEL_33:
  objc_msgSend(v3, "addChildViewController:", v54);
  v71 = objc_msgSend(v54, "view");
  if (!v71)
  {
    __break(1u);
    goto LABEL_38;
  }
  v72 = v71;
  objc_msgSend(v71, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v73 = objc_msgSend(v3, "view");
  if (!v73)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v74 = v73;
  v75 = objc_msgSend(v54, "view");
  if (v75)
  {
    v76 = v75;
    objc_msgSend(v74, "addSubview:", v75);

    v77 = (void *)objc_opt_self(NSLayoutConstraint);
    v78 = objc_msgSend(v54, "view");
    v79 = v87;
    v80 = objc_msgSend(v87, "view");
    objc_msgSend(v77, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v78, v80);

    objc_msgSend(v54, "didMoveToParentViewController:", v79);
    return;
  }
LABEL_39:
  __break(1u);
}

void sub_10002B0D4(void *a1, void *a2)
{
  CGContext *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  CGColor *v11;
  id v12;

  v4 = (CGContext *)objc_msgSend(a1, "CGContext");
  v5 = objc_msgSend(a1, "format");
  CGContextSetAlpha(v4, 0.6);
  CGContextSetBlendMode(v4, kCGBlendModeNormal);
  if (objc_msgSend(a2, "presentationStyle") == (id)2)
  {
    v6 = objc_msgSend(a2, "view");
    if (!v6)
      goto LABEL_7;
    v7 = v6;
    v8 = objc_msgSend(v6, "layer");

    objc_msgSend(v8, "renderInContext:", v4);
  }
  v9 = objc_msgSend((id)objc_opt_self(UITraitCollection), "currentTraitCollection");
  objc_msgSend(v9, "userInterfaceStyle");

  v10 = objc_msgSend((id)objc_opt_self(UIColor), "_dimmingViewColor");
  if (v10)
  {
    v12 = v10;
    v11 = (CGColor *)objc_msgSend(v10, "CGColor");
    CGContextSetFillColorWithColor(v4, v11);

    CGContextSetAlpha(v4, 1.0);
    objc_msgSend(v5, "bounds");
    objc_msgSend(a1, "fillRect:blendMode:", 0);

    return;
  }
  __break(1u);
LABEL_7:
  __break(1u);
}

void sub_10002B294(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_10002B320(void *a1)
{
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  id v5;

  v2 = type metadata accessor for LocalPlayerAuthenticator();
  inited = swift_initStaticObject(v2, &unk_100058760);
  v4 = swift_allocObject(&unk_100053628, 32, 7);
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = inited;
  v5 = a1;
  sub_100013194((void (*)(id, _QWORD))sub_100032F8C);
  return swift_release(v4);
}

void sub_10002B390(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  SEL *v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  os_log_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  _QWORD *v40;
  NSObject *v41;
  _QWORD *v42;
  uint8_t *v43;
  uint64_t v44;
  _QWORD *v45;
  id v46;
  objc_class *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  os_log_t v52;
  uint64_t v53;
  uint8_t *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;

  v7 = (uint8_t *)type metadata accessor for Logger(0);
  v8 = *((_QWORD *)v7 - 1);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v51 - v13;
  v15 = (SEL *)&unk_100056000;
  if (a2)
  {
    static GKLog.general.getter(v12);
    v16 = a3;
    swift_errorRetain(a2);
    v17 = v16;
    v18 = swift_errorRetain(a2);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc(22, -1);
      v22 = swift_slowAlloc(8, -1);
      v52 = v19;
      v23 = (_QWORD *)v22;
      v53 = swift_slowAlloc(32, -1);
      v57 = (uint64_t)v17;
      v58 = v53;
      *(_DWORD *)v21 = 138412546;
      v55 = a3;
      v56 = v8;
      v24 = v17;
      v54 = v7;
      v25 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, &v58);
      *v23 = v17;
      v26 = v23;

      *(_WORD *)(v21 + 12) = 2080;
      v57 = a2;
      swift_errorRetain(a2);
      v27 = sub_100005170((uint64_t *)&unk_1000591C0);
      v28 = String.init<A>(describing:)(&v57, v27);
      v30 = v29;
      v57 = sub_10003EE08(v28, v29, (uint64_t *)&v58);
      a3 = v55;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, &v58);
      v31 = v30;
      v15 = (SEL *)&unk_100056000;
      swift_bridgeObjectRelease(v31);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      v32 = v52;
      _os_log_impl((void *)&_mh_execute_header, v52, v20, "%@ updating the card authentication failed with error: %s", (uint8_t *)v21, 0x16u);
      v33 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v26, 1, v33);
      swift_slowDealloc(v26, -1, -1);
      v34 = v53;
      swift_arrayDestroy(v53, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v21, -1, -1);

      (*(void (**)(char *, uint8_t *))(v56 + 8))(v14, v54);
    }
    else
    {

      swift_errorRelease(a2);
      swift_errorRelease(a2);

      (*(void (**)(char *, uint8_t *))(v8 + 8))(v14, v7);
    }
  }
  else if (*(_BYTE *)(a4 + 16) == 2)
  {
    v56 = v8;
    static GKLog.friending.getter(v12);
    v35 = a3;
    v36 = Logger.logObject.getter(v35);
    v37 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc(12, -1);
      v39 = swift_slowAlloc(8, -1);
      v55 = a3;
      v40 = (_QWORD *)v39;
      v54 = v38;
      *(_DWORD *)v38 = 138412290;
      v58 = v35;
      v41 = v35;
      v15 = (SEL *)&unk_100056000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59);
      *v40 = v35;
      v42 = v40;

      v43 = v54;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "%@ updating the card authentication succeed.", v54, 0xCu);
      v44 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v42, 1, v44);
      v45 = v42;
      a3 = v55;
      swift_slowDealloc(v45, -1, -1);
      swift_slowDealloc(v43, -1, -1);
    }
    else
    {

      v36 = v35;
    }

    (*(void (**)(char *, uint8_t *))(v56 + 8))(v11, v7);
    v46 = objc_msgSend(v35, v15[396]);
    if (!v46)
    {
      __break(1u);
      return;
    }
    v47 = (objc_class *)sub_10001CAD4(v46);
    v48 = *(Class *)((char *)&v35->isa + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel);
    *(Class *)((char *)&v35->isa + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel) = v47;

  }
  v49 = objc_msgSend(a3, v15[396]);
  if (v49)
  {
    v50 = v49;
    sub_10002A764(v49, (uint64_t)objc_msgSend(a3, "presentationStyle"));

  }
}

id sub_10002B94C()
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
  v2 = sub_1000105F0(0, &qword_100059DA8, UIViewController_ptr);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (!((unint64_t)v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
    return (id)swift_bridgeObjectRelease(v3);
  }
LABEL_12:
  if (v3 < 0)
    v11 = v3;
  else
    v11 = v3 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v3);
  v4 = _CocoaArrayWrapper.endIndex.getter(v11);
  swift_bridgeObjectRelease(v3);
  if (!v4)
    return (id)swift_bridgeObjectRelease(v3);
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
      return (id)swift_bridgeObjectRelease(v3);
  }
  __break(1u);
  return result;
}

void sub_10002BB14(uint64_t a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject **v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject **v20;
  uint8_t *v21;
  NSObject *v22;
  objc_super v23;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType(v1);
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23.receiver = v2;
  v23.super_class = ObjectType;
  objc_msgSendSuper2(&v23, "didTransitionToPresentationStyle:", a1);
  v9 = objc_msgSend(v2, "activeConversation");
  if (v9)
  {
    v10 = v9;
    sub_10002A764(v9, a1);

  }
  else
  {
    static GKLog.general.getter(0);
    v11 = v2;
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = (NSObject **)swift_slowAlloc(8, -1);
      v21 = v14;
      v22 = v11;
      *(_DWORD *)v14 = 138412290;
      v15 = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);
      v16 = v20;
      *v20 = v11;

      v17 = v21;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ didTransition: Expected an active conversation", v21, 0xCu);
      v18 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v16, 1, v18);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }
    else
    {

      v12 = v11;
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

double sub_10002BE8C(double a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  NSObject **v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;

  v23 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100058748 != -1)
    swift_once(&qword_100058748, sub_100029DA0);
  if (*(double *)&qword_100059C40 < a1)
    a1 = *(double *)&qword_100059C40;
  v6 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState];
  v7 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState + 8];
  v8 = v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState + 16];
  sub_1000302C8(v6, v7, v8);
  v9 = sub_10003008C(v6, v7, v8, a1);
  sub_100032D68(v6, v7, v8);
  static GKLog.friending.getter(v10);
  v11 = v1;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v15 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412546;
    v24 = *(double *)&v11;
    v16 = v11;
    v22 = v5;
    v17 = v3;
    v18 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
    *v15 = v11;

    v3 = v17;
    v5 = v22;
    *(_WORD *)(v14 + 12) = 2048;
    v24 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Provide an inviteCardHeight size for our MSMessages Live Bubble View, %f", (uint8_t *)v14, 0x16u);
    v19 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v15, 1, v19);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {

    v12 = v11;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v23);
  return a1;
}

uint64_t sub_10002C138(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  NSObject **v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t (*v40)(char *, uint64_t);
  char *v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v42 - v10;
  if (a1)
  {
    static GKLog.general.getter(v9);
    v12 = a2;
    swift_errorRetain(a1);
    v13 = v12;
    v14 = swift_errorRetain(a1);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc(22, -1);
      v18 = swift_slowAlloc(8, -1);
      v42 = v15;
      v19 = (_QWORD *)v18;
      v43 = swift_slowAlloc(32, -1);
      v46 = (uint64_t)v13;
      v47 = v43;
      *(_DWORD *)v17 = 138412546;
      v45 = v4;
      v20 = v13;
      v44 = v5;
      v21 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);
      v22 = v19;
      *v19 = v13;

      *(_WORD *)(v17 + 12) = 2080;
      v46 = a1;
      swift_errorRetain(a1);
      v23 = sub_100005170((uint64_t *)&unk_1000591C0);
      v24 = String.init<A>(describing:)(&v46, v23);
      v26 = v25;
      v46 = sub_10003EE08(v24, v25, (uint64_t *)&v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);
      swift_bridgeObjectRelease(v26);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      v27 = v42;
      _os_log_impl((void *)&_mh_execute_header, v42, v16, "%@ didCancelSending - cancelFriendRequest error: %s", (uint8_t *)v17, 0x16u);
      v28 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v22, 1, v28);
      swift_slowDealloc(v22, -1, -1);
      v29 = v43;
      swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v17, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v8, v45);
    }

    swift_errorRelease(a1);
    swift_errorRelease(a1);

    v40 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v41 = v8;
  }
  else
  {
    v31 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
    objc_msgSend(v31, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestCancelled);

    static GKLog.friending.getter(v32);
    v33 = a2;
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v45 = v4;
      v36 = (uint8_t *)swift_slowAlloc(12, -1);
      v37 = (NSObject **)swift_slowAlloc(8, -1);
      v44 = v5;
      *(_DWORD *)v36 = 138412290;
      v47 = v33;
      v38 = v33;
      v5 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48);
      *v37 = v33;

      v4 = v45;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "%@ didCancelSending - cancelFriendRequest succeed", v36, 0xCu);
      v39 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v37, 1, v39);
      swift_slowDealloc(v37, -1, -1);
      swift_slowDealloc(v36, -1, -1);
    }
    else
    {

      v34 = v33;
    }

    v40 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v41 = v11;
  }
  return v40(v41, v4);
}

uint64_t sub_10002C5C0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  result = __chkstk_darwin(v6);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v11 = swift_errorRetain(a1);
    static GKLog.general.getter(v11);
    swift_errorRetain(a1);
    swift_bridgeObjectRetain(a3);
    swift_errorRetain(a1);
    swift_bridgeObjectRetain(a3);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc(32, -1);
      v22 = a2;
      v16 = v15;
      v23 = (uint64_t *)swift_slowAlloc(8, -1);
      v24 = swift_slowAlloc(64, -1);
      v26 = v24;
      *(_DWORD *)v16 = 136315650;
      v25 = sub_10003EE08(0xD000000000000020, 0x8000000100043240, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
      *(_WORD *)(v16 + 12) = 2080;
      swift_bridgeObjectRetain(a3);
      v25 = sub_10003EE08(v22, a3, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
      swift_bridgeObjectRelease_n(a3, 3);
      *(_WORD *)(v16 + 22) = 2112;
      swift_errorRetain(a1);
      v17 = _swift_stdlib_bridgeErrorToNSError(a1);
      v25 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
      v18 = v23;
      *v23 = v17;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s - Error adding %s to the deny list. Error: %@", (uint8_t *)v16, 0x20u);
      v19 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v18, 1, v19);
      swift_slowDealloc(v18, -1, -1);
      v20 = v24;
      swift_arrayDestroy(v24, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v16, -1, -1);

      swift_errorRelease(a1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_10002CA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = type metadata accessor for MainActor(0);
  v5[7] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_10002CAB0, v7, v8);
}

uint64_t sub_10002CAB0()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(const void **)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 56));
  *(_QWORD *)(v0 + 64) = _Block_copy(v2);
  if (v1)
    static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(v0 + 32));
  else
    v3 = 0;
  *(_QWORD *)(v0 + 72) = v3;
  v4 = *(void **)(v0 + 48);
  v5 = *(void **)(v0 + 24);
  v6 = unk_100059DA4;
  v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100059DA0 + dword_100059DA0);
  v7 = *(id *)(v0 + 16);
  v8 = v5;
  v9 = v4;
  v10 = (_QWORD *)swift_task_alloc(v6);
  *(_QWORD *)(v0 + 80) = v10;
  *v10 = v0;
  v10[1] = sub_10002CB64;
  return v12(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10002CB64(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);

  v6 = *v3;
  v8 = *(_QWORD *)(*v3 + 72);
  v7 = *(_QWORD *)(*v3 + 80);
  v9 = *(void **)(*v3 + 48);
  v11 = *(void **)(*v3 + 16);
  v10 = *(void **)(*v3 + 24);
  v12 = *v3;
  swift_task_dealloc(v7);
  swift_bridgeObjectRelease(v8);

  if (a3)
  {
    swift_bridgeObjectRetain(a3);
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v13 = 0;
  }
  v14 = *(void (***)(_QWORD, _QWORD, _QWORD))(v6 + 64);
  ((void (**)(_QWORD, _QWORD, NSString))v14)[2](v14, a1 & 1, v13);

  _Block_release(v14);
  swift_bridgeObjectRelease(a3);
  return (*(uint64_t (**)(void))(v12 + 8))();
}

void sub_10002CC40()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = objc_msgSend(v0, "childViewControllers");
  v2 = sub_1000105F0(0, &qword_100059DA8, UIViewController_ptr);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (!((unint64_t)v3 >> 62))
  {
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease(v3);
    goto LABEL_14;
  }
  if (v3 < 0)
    v9 = v3;
  else
    v9 = v3 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v3);
  v10 = _CocoaArrayWrapper.endIndex.getter(v9);
  swift_bridgeObjectRelease(v3);
  if (!v10)
    goto LABEL_13;
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v3);
LABEL_6:
    v5 = v4;
    swift_bridgeObjectRelease(v3);
    v6 = objc_msgSend(v5, "presentedViewController");

    if (v6)
    {
      v7 = objc_opt_self(GKRemoteUINavigationController);
      v8 = (void *)swift_dynamicCastObjCClass(v6, v7);
      if (v8)
      {
LABEL_15:

        return;
      }

    }
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(id *)(v3 + 32);
    goto LABEL_6;
  }
  __break(1u);
}

uint64_t sub_10002CD80(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46[3];

  v3 = sub_100005170(&qword_100059DB8);
  __chkstk_darwin(v3);
  v41 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005170(&qword_100059DC0);
  v6 = *(_QWORD *)(v5 - 8);
  v42 = v5;
  v43 = v6;
  __chkstk_darwin(v5);
  v39 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100005170(&qword_100059DC8);
  v9 = *(_QWORD *)(v8 - 8);
  v44 = v8;
  v45 = v9;
  __chkstk_darwin(v8);
  v40 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void **)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  v12 = swift_allocObject(&unk_100053470, 24, 7);
  *(_QWORD *)(v12 + 16) = v1;
  v13 = swift_allocObject(&unk_100053498, 32, 7);
  *(_QWORD *)(v13 + 16) = sub_100032DBC;
  *(_QWORD *)(v13 + 24) = v12;
  v14 = swift_allocObject(&unk_1000534C0, 24, 7);
  *(_QWORD *)(v14 + 16) = v1;
  v15 = swift_allocObject(&unk_1000534E8, 24, 7);
  *(_QWORD *)(v15 + 16) = v1;
  v16 = swift_allocObject(&unk_100053510, 24, 7);
  swift_unknownObjectWeakInit(v16 + 16, v1);
  v17 = swift_allocObject(&unk_100053538, 24, 7);
  *(_QWORD *)(v17 + 16) = v1;
  v18 = type metadata accessor for FriendInviteCardViewModel(0);
  swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
  v19 = v11;
  v20 = a1;
  v21 = v1;
  v22 = (char *)sub_1000396D8(v11, v20, (uint64_t)sub_100032E10, v13, (uint64_t)sub_100032E30, v14, (uint64_t)sub_100032E50, v15, (uint64_t)sub_100032E94, v16, (uint64_t)sub_10002F9CC, 0, sub_100032E9C, v17);
  swift_beginAccess(&v22[OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__state], v46, 33, 0);
  v23 = sub_100005170((uint64_t *)&unk_100059DD0);
  v24 = v39;
  Published.projectedValue.getter(v23);
  swift_endAccess(v46);
  v25 = sub_1000105F0(0, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr);
  v46[0] = (id)static OS_dispatch_queue.main.getter();
  v26 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0);
  v27 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v41, 1, 1, v26);
  v28 = sub_1000056BC(&qword_100059DE0, &qword_100059DC0, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v29 = sub_100032EBC();
  v30 = v40;
  v31 = v42;
  Publisher.receive<A>(on:options:)(v46, v27, v42, v25, v28, v29);
  sub_10000527C(v27, &qword_100059DB8);

  (*(void (**)(char *, uint64_t))(v43 + 8))(v24, v31);
  v32 = swift_allocObject(&unk_100053510, 24, 7);
  swift_unknownObjectWeakInit(v32 + 16, v21);
  v33 = sub_1000056BC(&qword_100059DF0, &qword_100059DC8, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  v34 = v44;
  v35 = Publisher<>.sink(receiveValue:)(sub_100032F14, v32, v44, v33);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v30, v34);
  v36 = *(_QWORD *)&v21[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_inviteCardResizingObserver];
  *(_QWORD *)&v21[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_inviteCardResizingObserver] = v35;
  swift_release(v36);
  v46[0] = sub_100032F1C;
  v46[1] = v22;
  v37 = objc_allocWithZone((Class)sub_100005170(&qword_100059DF8));
  return UIHostingController.init(rootView:)(v46);
}

void sub_10002D1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  void *v8;
  NSString v9;
  NSString v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  void *object;
  NSString v15;
  void *v16;
  _QWORD aBlock[6];
  _BYTE v18[24];
  Swift::String v19;

  v5 = a5 + 16;
  swift_beginAccess(a5 + 16, v18, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5, v6);
  if (Strong)
  {
    v8 = (void *)Strong;
    v9 = String._bridgeToObjectiveC()();
    v10 = String._bridgeToObjectiveC()();
    v11 = (id)GKGameCenterUIFrameworkBundle(v10);
    v19._object = (void *)0xE000000000000000;
    v12._countAndFlagsBits = 0x4F545455425F4B4FLL;
    v12._object = (void *)0xE90000000000004ELL;
    v13._countAndFlagsBits = 0;
    v13._object = (void *)0xE000000000000000;
    v19._countAndFlagsBits = 0;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v19)._object;

    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100013AF4;
    aBlock[3] = &unk_100053550;
    v16 = _Block_copy(aBlock);
    objc_msgSend(v8, "_presentAlertWithTitle:message:buttonTitle:completion:", v9, v10, v15, v16);
    _Block_release(v16);

  }
}

void sub_10002D318(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t Strong;
  void *v14;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint8_t *v21;
  _QWORD *v22;
  NSObject *v23;
  uint8_t *v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  _QWORD v31[2];
  _QWORD *v32;
  uint8_t *v33;
  int v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  _BYTE v39[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = a2 + 16;
  v11 = *(unsigned __int8 *)(a1 + 16);
  swift_beginAccess(v10, v39, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v10, v12);
  if (Strong)
  {
    v14 = (void *)Strong;
    if (v11 != 9 || (v8 & 0xFFFFFFFFFFFFFFFELL | v9) != 0)
    {
      v37 = v5;
      static GKLog.friending.getter(Strong);
      v16 = v14;
      v17 = Logger.logObject.getter(v16);
      v18 = static os_log_type_t.info.getter();
      v19 = v18;
      if (os_log_type_enabled(v17, v18))
      {
        v20 = swift_slowAlloc(12, -1);
        v34 = v19;
        v21 = (uint8_t *)v20;
        v22 = (_QWORD *)swift_slowAlloc(8, -1);
        v32 = v22;
        v35 = v4;
        v36 = v14;
        v33 = v21;
        *(_DWORD *)v21 = 138412290;
        v31[1] = v21 + 4;
        v38 = v16;
        v23 = v16;
        v4 = v35;
        v14 = v36;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, v39);
        *v22 = v14;

        v24 = v33;
        _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v34, "%@ FriendInviteCardViewModel state updated, updating card height.", v33, 0xCu);
        v25 = sub_100005170((uint64_t *)&unk_100058CB0);
        v26 = v32;
        swift_arrayDestroy(v32, 1, v25);
        swift_slowDealloc(v26, -1, -1);
        swift_slowDealloc(v24, -1, -1);
      }
      else
      {

        v17 = v16;
      }

      (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v4);
      v27 = (char *)v16 + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState;
      v28 = *(Class *)((char *)&v16->isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState);
      v29 = *(Class *)((char *)&v16[1].isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState);
      *(_QWORD *)v27 = v8;
      *((_QWORD *)v27 + 1) = v9;
      v30 = v27[16];
      v27[16] = v11;
      sub_1000302C8((id)v8, (void *)v9, v11);
      sub_1000302C8((id)v8, (void *)v9, v11);
      sub_100032D68(v28, v29, v30);
      -[NSObject requestResize](v16, "requestResize");
      sub_100032D68((void *)v8, (void *)v9, v11);
      -[NSObject requestResize](v16, "requestResize");
    }

  }
}

uint64_t sub_10002D5A4@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  *a2 = swift_getKeyPath(&unk_100044F90);
  v4 = sub_100005170(&qword_100059D20);
  swift_storeEnumTagMultiPayload(a2, v4, 0);
  v5 = (_QWORD *)((char *)a2 + *(int *)(type metadata accessor for FriendInviteCardView(0) + 20));
  v6 = type metadata accessor for FriendInviteCardViewModel(0);
  v7 = sub_10000FFE4(&qword_100059D28, type metadata accessor for FriendInviteCardViewModel, (uint64_t)&unk_100045398);
  v8 = swift_retain(a1);
  result = ObservedObject.init(wrappedValue:)(v8, v6, v7);
  *v5 = result;
  v5[1] = v10;
  return result;
}

id sub_10002D658()
{
  void *v0;
  objc_class *ObjectType;
  id v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v2, "removeObserver:", v0);

  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, "dealloc");
}

void sub_10002D7B8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void **aBlock;
  _QWORD v26[4];
  uint64_t v27;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, "activeConversation");
  if (v5)
  {
    v6 = v5;
    v7 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
    if (v7)
    {
      v8 = v7;
      v9 = (void *)sub_10002DA4C(0);
      v10 = swift_allocObject(&unk_100053330, 24, 7);
      *(_QWORD *)(v10 + 16) = v0;
      v26[3] = sub_100030398;
      v27 = v10;
      aBlock = _NSConcreteStackBlock;
      v26[0] = 1107296256;
      v26[1] = sub_100016274;
      v26[2] = &unk_100053348;
      v11 = _Block_copy(&aBlock);
      v12 = v27;
      v13 = v0;
      swift_release(v12);
      objc_msgSend(v6, "insertMessage:completionHandler:", v9, v11);
      _Block_release(v11);

      return;
    }

  }
  static GKLog.general.getter(v5);
  v14 = v0;
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v24 = v1;
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v18 = swift_slowAlloc(8, -1);
    v23 = v2;
    v19 = (_QWORD *)v18;
    *(_DWORD *)v17 = 138412290;
    aBlock = (void **)&v14->isa;
    v20 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v26);
    *v19 = v14;

    v1 = v24;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Expected a conversation and a playerModel", v17, 0xCu);
    v21 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v19, 1, v21);
    v22 = v19;
    v2 = v23;
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v17, -1, -1);
  }
  else
  {

    v15 = v14;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_10002DA4C(char a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject **v17;
  uint64_t v18;
  uint8_t *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  NSObject **v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  uint64_t v36;

  sub_100005170(&qword_100058CE0);
  __chkstk_darwin();
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin();
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v7);
  v10 = v1;
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v34 = v4;
    v13 = swift_slowAlloc(12, -1);
    v32 = v6;
    v14 = (uint8_t *)v13;
    v31 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412290;
    v35 = v10;
    v15 = v10;
    v33 = v5;
    v16 = v15;
    v4 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    v17 = v31;
    *v31 = v10;

    v5 = v33;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ creating a message for GC friend invite", v14, 0xCu);
    v18 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v17, 1, v18);
    swift_slowDealloc(v17, -1, -1);
    v19 = v14;
    v6 = v32;
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {

    v11 = v10;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v20 = -[NSObject activeConversation](v10, "activeConversation");
  if (!v20
    || (v21 = v20,
        v22 = objc_msgSend(v20, "selectedMessage"),
        v21,
        !v22)
    || (v23 = objc_msgSend(v22, "session"), v22, !v23))
  {
    v23 = objc_msgSend(objc_allocWithZone((Class)MSSession), "init");
  }
  v24 = *(Class *)((char *)&v10->isa + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel);
  if (v24)
  {
    v25 = v24;
    sub_100013B20(1, (uint64_t)v4);

  }
  else
  {
    v26 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v4, 1, 1, v26);
  }
  sub_1000105F0(0, &qword_100059D50, MSMessage_ptr);
  if ((a1 & 1) != 0)
    v27 = static MSMessage.acceptedFriendInviteMessage(withUrl:session:)(v4, v23);
  else
    v27 = static MSMessage.friendInviteMessage(withUrl:session:)(v4, v23);
  v28 = v27;

  sub_10000527C((uint64_t)v4, &qword_100058CE0);
  return v28;
}

uint64_t sub_10002DD6C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  uint64_t v19;
  os_log_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  result = __chkstk_darwin();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v9 = swift_errorRetain(a1);
    static GKLog.general.getter(v9);
    swift_errorRetain(a1);
    v10 = a2;
    swift_errorRetain(a1);
    v11 = v10;
    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc(22, -1);
      v24 = v5;
      v15 = v14;
      v16 = (_QWORD *)swift_slowAlloc(16, -1);
      *(_DWORD *)v15 = 138412546;
      v25 = v4;
      v26 = (uint64_t)v11;
      v17 = v11;
      v23 = v12;
      v18 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
      *v16 = v11;

      *(_WORD *)(v15 + 12) = 2112;
      swift_errorRetain(a1);
      v19 = _swift_stdlib_bridgeErrorToNSError(a1);
      v26 = v19;
      v4 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
      v16[1] = v19;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      v20 = v23;
      _os_log_impl((void *)&_mh_execute_header, v23, v13, "%@ composeMessage - insert message error : %@", (uint8_t *)v15, 0x16u);
      v21 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v16, 2, v21);
      swift_slowDealloc(v16, -1, -1);
      v22 = v15;
      v5 = v24;
      swift_slowDealloc(v22, -1, -1);

      swift_errorRelease(a1);
    }
    else
    {
      swift_errorRelease(a1);

      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

void sub_10002DFAC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject **v16;
  uint64_t v17;
  uint8_t *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject **v22;
  uint64_t v23;
  uint64_t v24;
  void **aBlock;
  _QWORD v26[5];

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v7);
  v10 = a2;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v24 = v5;
    v13 = swift_slowAlloc(12, -1);
    v23 = v6;
    v14 = (uint8_t *)v13;
    v22 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412290;
    aBlock = (void **)&v10->isa;
    v15 = v10;
    v5 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v26);
    v16 = v22;
    *v22 = v10;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ acceptMessage", v14, 0xCu);
    v17 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v16, 1, v17);
    swift_slowDealloc(v16, -1, -1);
    v18 = v14;
    v6 = v23;
    swift_slowDealloc(v18, -1, -1);
  }
  else
  {

    v11 = v10;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v19 = (void *)sub_10002DA4C(1);
  v26[3] = sub_10002E1DC;
  v26[4] = 0;
  aBlock = _NSConcreteStackBlock;
  v26[0] = 1107296256;
  v26[1] = sub_100016274;
  v26[2] = &unk_1000535A0;
  v20 = _Block_copy(&aBlock);
  objc_msgSend(a3, "sendMessage:completionHandler:", v19, v20);
  _Block_release(v20);

}

uint64_t sub_10002E1DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  result = __chkstk_darwin(v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v7 = swift_errorRetain(a1);
    static GKLog.general.getter(v7);
    swift_errorRetain(a1);
    v8 = swift_errorRetain(a1);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc(12, -1);
      v17 = v2;
      v12 = (uint8_t *)v11;
      v13 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v12 = 138412290;
      swift_errorRetain(a1);
      v14 = _swift_stdlib_bridgeErrorToNSError(a1);
      v18 = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19);
      *v13 = v14;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "acceptMessage - send message error : %@", v12, 0xCu);
      v15 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v13, 1, v15);
      swift_slowDealloc(v13, -1, -1);
      v16 = v12;
      v2 = v17;
      swift_slowDealloc(v16, -1, -1);

      swift_errorRelease(a1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_10002E3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  char *v18;
  char *v19;
  __n128 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  char v28;
  uint64_t result;
  uint64_t v30;
  void *v31;
  char *v32;
  unint64_t v33;
  char v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void *v40;
  char *v41;
  unint64_t v42;
  char v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66[5];
  __int128 v67;
  __int128 v68;

  v62 = a3;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v8);
  v11 = v3;
  swift_bridgeObjectRetain_n(a1, 2);
  v63 = (char *)v11;
  v12 = Logger.logObject.getter(v63);
  v13 = static os_log_type_t.info.getter();
  v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    v15 = swift_slowAlloc(22, -1);
    v16 = (_QWORD *)swift_slowAlloc(8, -1);
    v56 = v16;
    v58 = swift_slowAlloc(32, -1);
    v66[0] = v58;
    *(_DWORD *)v15 = 138412546;
    v57 = v14;
    v60 = v7;
    v61 = a2;
    v17 = v63;
    *(_QWORD *)&v67 = v63;
    v18 = v63;
    v59 = v6;
    v19 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, (char *)&v67 + 8);
    *v16 = v17;

    *(_WORD *)(v15 + 12) = 2080;
    v20 = swift_bridgeObjectRetain(a1);
    v21 = Dictionary.description.getter(v20);
    v23 = v22;
    swift_bridgeObjectRelease(a1);
    *(_QWORD *)&v67 = sub_10003EE08(v21, v23, v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, (char *)&v67 + 8);
    swift_bridgeObjectRelease_n(a1, 2);
    a2 = v61;
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v57, "%@ Received text input payload to send a friend request: %s", (uint8_t *)v15, 0x16u);
    v24 = sub_100005170((uint64_t *)&unk_100058CB0);
    v25 = v56;
    swift_arrayDestroy(v56, 1, v24);
    swift_slowDealloc(v25, -1, -1);
    v26 = v58;
    swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v59);
  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
    v27 = v63;

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  if (a2 == 0xD00000000000002CLL && v62 == 0x80000001000431F0
    || (v28 = _stringCompareWithSmolCheck(_:_:expecting:)(a2, v62, 0xD00000000000002CLL, 0x80000001000431F0, 0),
        result = 0,
        (v28 & 1) != 0))
  {
    v30 = OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel;
    v31 = *(void **)&v63[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
    if (v31)
    {
      *(_QWORD *)&v67 = 0x6F43646E65697266;
      *((_QWORD *)&v67 + 1) = 0xEA00000000006564;
      v32 = v31;
      AnyHashable.init<A>(_:)(v66, &v67, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(a1 + 16) && (v33 = sub_10002F4A8((uint64_t)v66), (v34 & 1) != 0))
      {
        sub_100013540(*(_QWORD *)(a1 + 56) + 32 * v33, (uint64_t)&v67);
      }
      else
      {
        v67 = 0u;
        v68 = 0u;
      }
      sub_100030340((uint64_t)v66);
      if (*((_QWORD *)&v68 + 1))
      {
        v35 = swift_dynamicCast(&v64, &v67, (char *)&type metadata for Any + 8, &type metadata for String, 6);
        v36 = v64;
        v37 = v65;
        if (!v35)
        {
          v36 = 0;
          v37 = 0;
        }
      }
      else
      {
        sub_10000527C((uint64_t)&v67, (uint64_t *)&unk_100059D40);
        v36 = 0;
        v37 = 0;
      }
      v38 = &v32[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode];
      v39 = *(_QWORD *)&v32[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8];
      *(_QWORD *)v38 = v36;
      *((_QWORD *)v38 + 1) = v37;

      swift_bridgeObjectRelease(v39);
      v40 = *(void **)&v63[v30];
      if (v40)
      {
        *(_QWORD *)&v67 = 0x7255646E65697266;
        *((_QWORD *)&v67 + 1) = 0xE90000000000006CLL;
        v41 = v40;
        AnyHashable.init<A>(_:)(v66, &v67, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(a1 + 16) && (v42 = sub_10002F4A8((uint64_t)v66), (v43 & 1) != 0))
        {
          sub_100013540(*(_QWORD *)(a1 + 56) + 32 * v42, (uint64_t)&v67);
        }
        else
        {
          v67 = 0u;
          v68 = 0u;
        }
        sub_100030340((uint64_t)v66);
        if (*((_QWORD *)&v68 + 1))
        {
          v44 = swift_dynamicCast(&v64, &v67, (char *)&type metadata for Any + 8, &type metadata for String, 6);
          v45 = v64;
          v46 = v65;
          if (!v44)
          {
            v45 = 0;
            v46 = 0;
          }
        }
        else
        {
          sub_10000527C((uint64_t)&v67, (uint64_t *)&unk_100059D40);
          v45 = 0;
          v46 = 0;
        }
        v47 = &v41[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL];
        v48 = *(_QWORD *)&v41[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendSupportPageURL + 8];
        *(_QWORD *)v47 = v45;
        *((_QWORD *)v47 + 1) = v46;

        swift_bridgeObjectRelease(v48);
      }
    }
    *(_QWORD *)&v67 = 0xD00000000000001ALL;
    *((_QWORD *)&v67 + 1) = 0x8000000100043220;
    AnyHashable.init<A>(_:)(v66, &v67, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(a1 + 16) && (v49 = sub_10002F4A8((uint64_t)v66), (v50 & 1) != 0))
    {
      sub_100013540(*(_QWORD *)(a1 + 56) + 32 * v49, (uint64_t)&v67);
    }
    else
    {
      v67 = 0u;
      v68 = 0u;
    }
    sub_100030340((uint64_t)v66);
    if (*((_QWORD *)&v68 + 1))
    {
      v51 = swift_dynamicCast(&v64, &v67, (char *)&type metadata for Any + 8, &type metadata for String, 6);
      v52 = v64;
      v53 = v65;
      if (!v51)
      {
        v52 = 0;
        v53 = 0;
      }
    }
    else
    {
      sub_10000527C((uint64_t)&v67, (uint64_t *)&unk_100059D40);
      v52 = 0;
      v53 = 0;
    }
    v54 = qword_100059C70;
    qword_100059C68 = v52;
    qword_100059C70 = v53;
    swift_bridgeObjectRelease(v54);
    sub_10002D7B8();
    return 1;
  }
  return result;
}

uint64_t type metadata accessor for MessagesViewController()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension22MessagesViewController);
}

void sub_10002EA94(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  NSObject **v36;
  NSObject *v37;
  uint64_t v38;
  os_log_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v39 - v10;
  if (a1)
  {
    static GKLog.general.getter(v9);
    v12 = a2;
    swift_errorRetain(a1);
    v13 = v12;
    v14 = swift_errorRetain(a1);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc(22, -1);
      v18 = swift_slowAlloc(8, -1);
      v39 = v15;
      v19 = (_QWORD *)v18;
      v40 = swift_slowAlloc(32, -1);
      v43 = (uint64_t)v13;
      v44 = v40;
      *(_DWORD *)v17 = 138412546;
      v42 = v4;
      v20 = v13;
      v41 = v5;
      v21 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
      v22 = v19;
      *v19 = v13;

      *(_WORD *)(v17 + 12) = 2080;
      v43 = a1;
      swift_errorRetain(a1);
      v23 = sub_100005170((uint64_t *)&unk_1000591C0);
      v24 = String.init<A>(describing:)(&v43, v23);
      v26 = v25;
      v43 = sub_10003EE08(v24, v25, (uint64_t *)&v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
      swift_bridgeObjectRelease(v26);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      v27 = v39;
      _os_log_impl((void *)&_mh_execute_header, v39, v16, "%@ messageActionsViewController - createFriendRequest error: %s", (uint8_t *)v17, 0x16u);
      v28 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v22, 1, v28);
      swift_slowDealloc(v22, -1, -1);
      v29 = v40;
      swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v17, -1, -1);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v42);
    }
    else
    {

      swift_errorRelease(a1);
      swift_errorRelease(a1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    v30 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
    objc_msgSend(v30, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestCreated);

    static GKLog.friending.getter(v31);
    v32 = a2;
    v33 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v34 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v42 = v4;
      v35 = (uint8_t *)swift_slowAlloc(12, -1);
      v36 = (NSObject **)swift_slowAlloc(8, -1);
      v41 = v5;
      *(_DWORD *)v35 = 138412290;
      v44 = v32;
      v37 = v32;
      v5 = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45);
      *v36 = v32;

      v4 = v42;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ messageActionsViewController - createFriendRequest succeed.", v35, 0xCu);
      v38 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v36, 1, v38);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v35, -1, -1);
    }
    else
    {

      v33 = v32;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    sub_10002D7B8();
  }
}

void sub_10002EED0(CFTimeInterval a1)
{
  __CFString *v2;
  __CFString *v3;
  id v4;
  Swift::String v5;
  Swift::String v6;
  void *object;
  __CFString *v8;
  CFOptionFlags v9;
  Swift::String swift__string;

  v9 = 0;
  v2 = (__CFString *)String._bridgeToObjectiveC()();
  v3 = (__CFString *)String._bridgeToObjectiveC()();
  v4 = (id)GKGameCenterUIFrameworkBundle();
  swift__string._object = (void *)0xE000000000000000;
  v5._countAndFlagsBits = 0x4F545455425F4B4FLL;
  v5._object = (void *)0xE90000000000004ELL;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  swift__string._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, swift__string)._object;

  v8 = (__CFString *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  CFUserNotificationDisplayAlert(a1, 0, 0, 0, 0, v2, v3, v8, 0, 0, &v9);

}

uint64_t sub_10002F008(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ColorScheme(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_10002F084(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_100033040;
  return v6();
}

uint64_t sub_10002F0D8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_100033040;
  return v7();
}

uint64_t sub_10002F12C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_10000527C(a1, &qword_100059D58);
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
  v17 = swift_allocObject(&unk_1000533F8, 32, 7);
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
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100059D98, v17);
}

uint64_t sub_10002F278(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10002F2DC;
  return v6(a1);
}

uint64_t sub_10002F2DC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_10002F328(uint64_t a1)
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
  return sub_10002F4D8(a1, v7);
}

unint64_t sub_10002F3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10002F64C(a1, a2, v5);
}

unint64_t sub_10002F40C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return sub_10002F72C(a1, v3);
}

unint64_t sub_10002F43C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for IndexPath(0);
  v6 = sub_10000FFE4((unint64_t *)&qword_100059928, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath, (uint64_t)&protocol conformance descriptor for IndexPath);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10002F7C8(a1, v7);
}

unint64_t sub_10002F4A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10002F908(a1, v4);
}

unint64_t sub_10002F4D8(uint64_t a1, uint64_t a2)
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

unint64_t sub_10002F64C(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10002F72C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_10002F7C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v17 = a1;
  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_10000FFE4((unint64_t *)&unk_100059E30, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath, (uint64_t)&protocol conformance descriptor for IndexPath);
      v14 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v17);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_10002F908(uint64_t a1, uint64_t a2)
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
      sub_1000303B8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100030340((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10002F9D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v10[24];

  v2 = sub_100005170(&qword_100058CE0);
  __chkstk_darwin(v2);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_100058750 != -1)
    swift_once(&qword_100058750, sub_100029DB4);
  v5 = sub_100032C54(v2, (uint64_t)qword_100059C48);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v4, a1, v6);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);
  swift_beginAccess(v5, v10, 33, 0);
  sub_100032CB4((uint64_t)v4, v5);
  return swift_endAccess(v10);
}

uint64_t sub_10002FAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  _QWORD *v26;

  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000105F0(0, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr);
  v14 = (void *)static OS_dispatch_queue.main.getter();
  v15 = (_QWORD *)swift_allocObject(&unk_100053790, 56, 7);
  v15[2] = 0x403E000000000000;
  v15[3] = a1;
  v15[4] = a2;
  v15[5] = a3;
  v15[6] = a4;
  aBlock[4] = sub_100033030;
  v26 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013AF4;
  aBlock[3] = &unk_1000537A8;
  v16 = _Block_copy(aBlock);
  v17 = v26;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  v18 = swift_release(v17);
  static DispatchQoS.unspecified.getter(v18);
  aBlock[0] = _swiftEmptyArrayStorage;
  v19 = sub_10000FFE4((unint64_t *)&unk_100059E10, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v20 = sub_100005170((uint64_t *)&unk_100058CD0);
  v21 = sub_1000056BC((unint64_t *)&qword_100059E20, (uint64_t *)&unk_100058CD0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v20, v21, v8, v19);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v23);
}

void sub_10002FD14()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  id v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  uint64_t v17;
  id v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  NSObject *v22;
  NSObject *v23;
  os_log_type_t v24;
  unsigned __int8 *v25;
  NSObject *v26;
  char *v27;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unsigned __int8 *v32;
  NSObject *v33;
  uint64_t v34;
  Swift::String v35;
  Swift::String v36;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  if (v6)
  {
    v7 = (void *)objc_opt_self(GKPreferences);
    v32 = v6;
    v8 = objc_msgSend(v7, "shared");
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "isAddingFriendsRestricted");

      if ((v10 & 1) != 0)
      {
        v11 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
        objc_msgSend(v11, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestRestrictedError);

        v13 = (id)GKGameCenterUIFrameworkBundle(v12);
        v35._object = (void *)0xE000000000000000;
        v14._countAndFlagsBits = 0x525F444E45495246;
        v14._object = (void *)0xEE00545345555145;
        v15._countAndFlagsBits = 0;
        v15._object = (void *)0xE000000000000000;
        v35._countAndFlagsBits = 0;
        v16 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v35);

        v18 = (id)GKGameCenterUIFrameworkBundle(v17);
        v36._object = (void *)0xE000000000000000;
        v19._object = (void *)0x8000000100042330;
        v19._countAndFlagsBits = 0xD000000000000027;
        v20._countAndFlagsBits = 0;
        v20._object = (void *)0xE000000000000000;
        v36._countAndFlagsBits = 0;
        v21 = NSLocalizedString(_:tableName:bundle:value:comment:)(v19, (Swift::String_optional)0, (NSBundle)v18, v20, v36);

        sub_10002FAE0(v16._countAndFlagsBits, (uint64_t)v16._object, v21._countAndFlagsBits, (uint64_t)v21._object);
        swift_bridgeObjectRelease(v16._object);
        swift_bridgeObjectRelease(v21._object);

      }
      else
      {
        v31 = v0;
        sub_100019988(v32, v31);

      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    static GKLog.general.getter(v3);
    v22 = v0;
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (unsigned __int8 *)swift_slowAlloc(12, -1);
      v31 = (char *)swift_slowAlloc(8, -1);
      v32 = v25;
      v33 = v22;
      *(_DWORD *)v25 = 138412290;
      v26 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
      v27 = v31;
      *(_QWORD *)v31 = v22;

      v28 = v32;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ messageActionsViewController - Expected a playerModel", v32, 0xCu);
      v29 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v27, 1, v29);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v28, -1, -1);
    }
    else
    {

      v23 = v22;
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

double sub_10003008C(void *a1, void *a2, unsigned __int8 a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  _QWORD v26[2];
  unsigned __int8 v27;

  v8 = type metadata accessor for FriendInviteCardView(0);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)&v26[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = objc_msgSend(objc_allocWithZone((Class)MSConversation), "init");
  v12 = type metadata accessor for FriendInviteCardViewModel(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v13 = sub_1000396D8(0, v11, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, nullsub_1, 0);
  *(_BYTE *)(v13 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_isViewRecordSent) = 1;
  KeyPath = swift_getKeyPath(&unk_100044F48);
  v15 = swift_getKeyPath(&unk_100044F70);
  v26[0] = a1;
  v26[1] = a2;
  v27 = a3;
  sub_1000302C8(a1, a2, a3);
  swift_retain(v13);
  static Published.subscript.setter(v26, v13, KeyPath, v15);
  sub_10003C994();
  *v10 = swift_getKeyPath(&unk_100044F90);
  v16 = sub_100005170(&qword_100059D20);
  swift_storeEnumTagMultiPayload(v10, v16, 0);
  v17 = (_QWORD *)((char *)v10 + *(int *)(v8 + 20));
  v18 = sub_10000FFE4(&qword_100059D28, type metadata accessor for FriendInviteCardViewModel, (uint64_t)&unk_100045398);
  *v17 = ObservedObject.init(wrappedValue:)(v13, v12, v18);
  v17[1] = v19;
  v20 = objc_allocWithZone((Class)sub_100005170((uint64_t *)&unk_100059D30));
  v21 = (void *)UIHostingController.init(rootView:)(v10);
  dispatch thunk of UIHostingController.sizeThatFits(in:)(a4, 0.0);
  v23 = v22;

  return v23;
}

id sub_1000302C8(id result, void *a2, unsigned __int8 a3)
{
  id v3;

  if (a3 <= 8u)
  {
    if (((1 << a3) & 0x17D) != 0)
    {
      return result;
    }
    else if (a3 == 1)
    {
      v3 = result;
      return a2;
    }
  }
  return result;
}

uint64_t sub_10003031C()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100030340(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100030374()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100030398(uint64_t a1)
{
  uint64_t v1;

  return sub_10002DD6C(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000303A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000303B0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000303B8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000303F4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100030438()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = v0[5];
  v6 = v0[6];
  v7 = (_QWORD *)swift_task_alloc(dword_100059D64);
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_1000304B8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100059D60
                                                                              + dword_100059D60))(v2, v3, v4, v5, v6);
}

uint64_t sub_1000304B8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100030504()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100059D74);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100033040;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100059D70 + dword_100059D70))(v2, v3, v4);
}

uint64_t sub_100030580()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000305AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_100059D84);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100033040;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100059D80 + dword_100059D80))(a1, v4, v5, v6);
}

uint64_t sub_100030630()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100030654(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100059D94);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000304B8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100059D90 + dword_100059D90))(a1, v4);
}

uint64_t sub_1000306C4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000105F0(0, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject(&unk_100053740, 24, 7);
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_100032FF4;
  v22 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013AF4;
  aBlock[3] = &unk_100053758;
  v11 = _Block_copy(aBlock);
  v12 = v22;
  v13 = v1;
  v14 = swift_release(v12);
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = _swiftEmptyArrayStorage;
  v15 = sub_10000FFE4((unint64_t *)&unk_100059E10, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = sub_100005170((uint64_t *)&unk_100058CD0);
  v17 = sub_1000056BC((unint64_t *)&qword_100059E20, (uint64_t *)&unk_100058CD0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v2, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000308D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  NSString v5;
  id v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  Swift::String v12;
  unint64_t v13;
  unint64_t v14;

  v0 = type metadata accessor for ActionViewController();
  v13 = v0;
  v1 = sub_100005170(&qword_100059E08);
  v2 = String.init<A>(describing:)(&v13, v1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend((id)objc_opt_self(UIStoryboard), "storyboardWithName:bundle:", v5, 0);

  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v6, "instantiateViewControllerWithIdentifier:", v7);

  v9 = swift_dynamicCastClass(v8, v0);
  if (v9)
  {
    v10 = v9;
    swift_bridgeObjectRelease(v4);
    return v10;
  }
  else
  {

    v13 = 0xD00000000000002BLL;
    v14 = 0x8000000100043270;
    v12._countAndFlagsBits = v2;
    v12._object = v4;
    String.append(_:)(v12);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v13, v14, "GameCenterMessageExtension/GKSwiftUtils.swift", 45, 2, 25, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_100030A50()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSString v6;
  id v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  uint64_t result;
  Swift::String v16;
  unint64_t v17;
  unint64_t v18;

  v1 = type metadata accessor for MessageActionsViewController();
  v17 = v1;
  v2 = sub_100005170(&qword_100059DB0);
  v3 = String.init<A>(describing:)(&v17, v2);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIStoryboard), "storyboardWithName:bundle:", v6, 0);

  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", v8);

  v10 = swift_dynamicCastClass(v9, v1);
  if (v10)
  {
    v11 = v10;
    swift_bridgeObjectRelease(v5);
    v12 = (_QWORD *)(v11 + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
    v13 = *(_QWORD *)(v11 + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
    *v12 = v0;
    v12[1] = &off_100053310;
    v14 = v0;
    swift_unknownObjectRelease(v13);
    return v11;
  }
  else
  {

    v17 = 0xD00000000000002BLL;
    v18 = 0x8000000100043270;
    v16._countAndFlagsBits = v3;
    v16._object = v5;
    String.append(_:)(v16);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v17, v18, "GameCenterMessageExtension/GKSwiftUtils.swift", 45, 2, 25, 0);
    __break(1u);
  }
  return result;
}

id sub_100030BFC(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v2 = v1;
  type metadata accessor for PlayerProfileViewController(0);
  v4 = qword_10005C230;
  v5 = qword_10005C238;
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  swift_bridgeObjectRetain(qword_10005C238);
  v6 = (void *)PlayerProfileViewController.__allocating_init(playerId:navigationProxy:objectGraph:)(v4, v5, &v15, 0);
  v7 = objc_allocWithZone((Class)UINavigationController);
  v8 = objc_msgSend(v7, "initWithRootViewController:", v6, v15, v16, v17);
  v9 = objc_msgSend(v8, "navigationBar");
  objc_msgSend(v9, "setBarStyle:", 0);

  v10 = objc_msgSend(v8, "navigationBar");
  v11 = objc_msgSend((id)objc_opt_self(UIColor), "systemBlueColor");
  objc_msgSend(v10, "setTintColor:", v11);

  v12 = objc_msgSend(v6, "navigationItem");
  v13 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v2, "didDismissFullScreen");
  objc_msgSend(v12, "setRightBarButtonItem:", v13);

  objc_msgSend(v2, "requestPresentationStyle:", a1);
  return v8;
}

uint64_t sub_100030DA0(uint64_t a1)
{
  char *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t result;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;

  v2 = v1;
  v4 = qword_10005C238;
  if (qword_10005C238)
  {
    v5 = qword_10005C230;
    v6 = qword_10005C238;
LABEL_6:
    type metadata accessor for FriendsListViewController(0);
    v12 = qword_10005C240;
    swift_bridgeObjectRetain(qword_10005C240);
    swift_bridgeObjectRetain(v4);
    v13 = (void *)FriendsListViewController.__allocating_init(playerId:newFriendPlayerIds:showAddFriendButton:objectGraph:)(v5, v6, v12, 0, 0);
    v14 = objc_allocWithZone((Class)UINavigationController);
    v15 = v13;
    v16 = objc_msgSend(v14, "initWithRootViewController:", v15);
    v17 = objc_msgSend(v16, "navigationBar");
    objc_msgSend(v17, "setBarStyle:", 0);

    v18 = objc_msgSend(v16, "navigationBar");
    v19 = objc_msgSend((id)objc_opt_self(UIColor), "systemBlueColor");
    objc_msgSend(v18, "setTintColor:", v19);

    v20 = objc_msgSend(v15, "navigationItem");
    v21 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v2, "didDismissFullScreen");
    objc_msgSend(v20, "setRightBarButtonItem:", v21);

    objc_msgSend(v2, "requestPresentationStyle:", a1);
    return (uint64_t)v16;
  }
  v7 = *(_QWORD *)&v1[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  if (v7)
  {
    v8 = *(void **)(v7 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_player);
    if (v8)
    {
      v9 = objc_msgSend(v8, "internal");
      v10 = objc_msgSend(v9, "playerID");

      v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      v6 = v11;

      v4 = 0;
      goto LABEL_6;
    }
  }
  _StringGuts.grow(_:)(50);
  v23 = objc_msgSend(v1, "description");
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  v26 = v25;
  swift_bridgeObjectRelease(0xE000000000000000);

  v27._object = (void *)0x80000001000432E0;
  v27._countAndFlagsBits = 0xD000000000000030;
  String.append(_:)(v27);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v24, v26, "GameCenterMessageExtension/MessagesViewController.swift", 55, 2, 463, 0);
  __break(1u);
  return result;
}

uint64_t sub_100031094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSString v6;
  id v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  Swift::String v19;
  unint64_t v20;
  unint64_t v21;

  v1 = type metadata accessor for FriendRequestCardViewController();
  v20 = v1;
  v2 = sub_100005170(&qword_100059E00);
  v3 = String.init<A>(describing:)(&v20, v2);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIStoryboard), "storyboardWithName:bundle:", v6, 0);

  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", v8);

  v10 = swift_dynamicCastClass(v9, v1);
  if (v10)
  {
    v11 = v10;
    swift_bridgeObjectRelease(v5);
    v12 = *(void **)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel);
    v13 = *(void **)(v11 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel);
    *(_QWORD *)(v11 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_playerModel) = v12;
    v14 = v12;

    v15 = (_QWORD *)(v11 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl);
    v16 = *(_QWORD *)(v11 + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl);
    v17 = *(_QWORD *)(v11
                    + OBJC_IVAR____TtC26GameCenterMessageExtension31FriendRequestCardViewController_onFetchedUrl
                    + 8);
    *v15 = sub_10002F9CC;
    v15[1] = 0;
    sub_10001059C(v16, v17);

    return v11;
  }
  else
  {

    v20 = 0xD00000000000002BLL;
    v21 = 0x8000000100043270;
    v19._countAndFlagsBits = v3;
    v19._object = v5;
    String.append(_:)(v19);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v20, v21, "GameCenterMessageExtension/GKSwiftUtils.swift", 45, 2, 25, 0);
    __break(1u);
  }
  return result;
}

void sub_100031280(void *a1, void (**a2)(_QWORD, _QWORD))
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;

  v4 = objc_msgSend(a1, "view");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;

    v10 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", v7, v9);
    v11 = swift_allocObject(&unk_100053650, 24, 7);
    *(_QWORD *)(v11 + 16) = a1;
    v12 = swift_allocObject(&unk_100053678, 32, 7);
    *(_QWORD *)(v12 + 16) = sub_100032F94;
    *(_QWORD *)(v12 + 24) = v11;
    v17[4] = sub_100032E10;
    v18 = v12;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256;
    v17[2] = sub_10002B294;
    v17[3] = &unk_100053690;
    v13 = _Block_copy(v17);
    v14 = v18;
    v15 = a1;
    swift_retain(v12);
    swift_release(v14);
    v16 = objc_msgSend(v10, "imageWithActions:", v13);
    _Block_release(v13);
    LOBYTE(v13) = swift_isEscapingClosureAtFileLocation(v12, "", 128, 110, 48, 1);
    swift_release(v12);
    if ((v13 & 1) == 0)
    {
      ((void (**)(_QWORD, id))a2)[2](a2, v16);
      swift_release(v11);

      return;
    }
    __break(1u);
  }
  _Block_release(a2);
  __break(1u);
}

void sub_100031444()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005170(&qword_100058CE0);
  __chkstk_darwin(v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  objc_msgSend(v8, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestCancelSending);

  if (qword_100058750 != -1)
    swift_once(&qword_100058750, sub_100029DB4);
  v9 = sub_100032C54(v5, (uint64_t)qword_100059C48);
  v10 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  swift_beginAccess(v9, &v27, 33, 0);
  sub_100032CB4((uint64_t)v7, v9);
  v11 = swift_endAccess(&v27);
  v12 = *(void **)&v0[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel];
  if (v12 && *((_BYTE *)v12 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestState) == 1)
  {
    v13 = v0;
    v14 = v12;
    sub_10001DE10(v14, v13);

  }
  else
  {
    static GKLog.general.getter(v11);
    v15 = v0;
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v26 = v1;
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = swift_slowAlloc(8, -1);
      v25 = v2;
      v20 = (_QWORD *)v19;
      *(_DWORD *)v18 = 138412290;
      v27 = v15;
      v21 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
      *v20 = v15;

      v1 = v26;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ didCancelSending - Expected a playerModel", v18, 0xCu);
      v22 = sub_100005170((uint64_t *)&unk_100058CB0);
      swift_arrayDestroy(v20, 1, v22);
      v23 = v20;
      v2 = v25;
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v18, -1, -1);
    }
    else
    {

      v16 = v15;
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_100031748(uint64_t a1)
{
  id v2;
  Class isa;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v2 = objc_msgSend(objc_allocWithZone((Class)CNContactStore), "init");
  if (qword_100058740 != -1)
    swift_once(&qword_100058740, sub_1000162C8);
  sub_100005170(&qword_1000591F0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v18 = 0;
  v4 = objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", a1, isa, &v18);

  v5 = v18;
  if (!v4)
  {
    v13 = v18;
    v14 = _convertNSErrorToError(_:)(v5);

    swift_willThrow();
    swift_errorRelease(v14);
    return 0;
  }
  v6 = sub_1000105F0(0, &qword_1000591F8, CNContact_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v6);
  v8 = v5;

  if ((unint64_t)v7 >> 62)
  {
    if (v7 < 0)
      v15 = v7;
    else
      v15 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v16 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(v7);
    if (v16)
      goto LABEL_6;
LABEL_15:

    swift_bridgeObjectRelease(v7);
    return 0;
  }
  if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_15;
LABEL_6:
  if ((v7 & 0xC000000000000001) != 0)
  {
    v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v7);
  }
  else
  {
    if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v9 = *(id *)(v7 + 32);
  }
  v10 = v9;
  swift_bridgeObjectRelease(v7);
  v11 = objc_msgSend(v10, "givenName");

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  return v12;
}

void sub_100031978(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, void *);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  os_log_type_t v24;
  id v25;
  _QWORD *v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  NSString v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  Class isa;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  Class v90;
  id v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  id v95;
  id v96;
  NSString v97;
  uint64_t v98;
  _QWORD *v99;
  os_log_t v100;
  uint64_t v101;
  void (*v102)(char *, void *);
  char *v103;
  void *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t aBlock[5];
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v3 = type metadata accessor for GKFeatureFlags(0);
  v4 = *(_QWORD *)(v3 - 8);
  v106 = v3;
  v107 = v4;
  __chkstk_darwin(v3);
  v6 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0);
  v8 = *(void (**)(char *, void *))(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v108 = (char *)&v98 - v13;
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v98 - v15;
  static GKLog.friending.getter(v14);
  v17 = v1;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.info.getter();
  v20 = os_log_type_enabled(v18, v19);
  v103 = v11;
  if (v20)
  {
    v21 = swift_slowAlloc(22, -1);
    v105 = v6;
    v22 = v21;
    v99 = (_QWORD *)swift_slowAlloc(8, -1);
    v101 = swift_slowAlloc(32, -1);
    aBlock[0] = v101;
    *(_DWORD *)v22 = 138412546;
    v100 = v18;
    v111 = (uint64_t)v17;
    v104 = a1;
    v23 = v17;
    v102 = v8;
    v24 = v19;
    v25 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, &v112);
    v26 = v99;
    *v99 = v17;

    *(_WORD *)(v22 + 12) = 2080;
    v111 = sub_10003EE08(0xD000000000000020, 0x8000000100043240, aBlock);
    a1 = v104;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, &v112);
    v27 = v100;
    _os_log_impl((void *)&_mh_execute_header, v100, v24, "%@ %s didStartSending the friend invite.", (uint8_t *)v22, 0x16u);
    v28 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v26, 1, v28);
    swift_slowDealloc(v26, -1, -1);
    v29 = v101;
    swift_arrayDestroy(v101, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    v30 = v22;
    v6 = v105;
    swift_slowDealloc(v30, -1, -1);

    v31 = (void (*)(char *, uint64_t))*((_QWORD *)v102 + 1);
  }
  else
  {

    v31 = (void (*)(char *, uint64_t))*((_QWORD *)v8 + 1);
  }
  v31(v16, v7);
  v32 = v108;
  v33 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  objc_msgSend(v33, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestSent);

  v34 = qword_100059C70;
  if (qword_100059C70)
  {
    v35 = qword_100059C68;
    swift_bridgeObjectRetain(qword_100059C70);
    static GKLog.friending.getter(v36);
    v37 = swift_bridgeObjectRetain_n(v34, 2);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = swift_slowAlloc(22, -1);
      v105 = v6;
      v41 = v40;
      v42 = swift_slowAlloc(64, -1);
      v104 = (void *)v7;
      v43 = v42;
      aBlock[0] = v42;
      *(_DWORD *)v41 = 136315394;
      v102 = (void (*)(char *, void *))v31;
      v111 = sub_10003EE08(0xD000000000000020, 0x8000000100043240, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, &v112);
      *(_WORD *)(v41 + 12) = 2080;
      swift_bridgeObjectRetain(v34);
      v111 = sub_10003EE08(v35, v34, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, &v112);
      swift_bridgeObjectRelease_n(v34, 3);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "%s - recipientContactIdentifier was provided. Adding %s to the deny list.", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy(v43, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1, -1);
      v44 = v41;
      v6 = v105;
      swift_slowDealloc(v44, -1, -1);

      v102(v108, v104);
    }
    else
    {

      swift_bridgeObjectRelease_n(v34, 2);
      v31(v32, v7);
    }
    v61 = objc_msgSend((id)objc_opt_self(GKDaemonProxy), "proxyForLocalPlayer");
    v62 = objc_msgSend(v61, "utilityServicePrivate");

    v63 = String._bridgeToObjectiveC()();
    v64 = swift_allocObject(&unk_100053420, 32, 7);
    *(_QWORD *)(v64 + 16) = v35;
    *(_QWORD *)(v64 + 24) = v34;
    aBlock[4] = (uint64_t)sub_100032D60;
    v110 = v64;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100016274;
    aBlock[3] = (uint64_t)&unk_100053438;
    v65 = _Block_copy(aBlock);
    swift_release(v110);
    objc_msgSend(v62, "denyContact:handler:", v63, v65);
    _Block_release(v65);
    swift_unknownObjectRelease(v62);

  }
  else
  {
    v45 = v7;
    v46 = objc_msgSend(a1, "recipientAddresses");
    v47 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v46, &type metadata for String);

    v48 = *(_QWORD *)(v47 + 16);
    swift_bridgeObjectRelease(v47);
    if (v48 == 1)
    {
      v49 = objc_msgSend(a1, "recipientAddresses");
      v50 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v49, &type metadata for String);

      if (v50[2])
      {
        v104 = a1;
        v52 = v50[4];
        v51 = v50[5];
        swift_bridgeObjectRetain(v51);
        v53 = swift_bridgeObjectRelease(v50);
        v54 = v103;
        v55 = static GKLog.friending.getter(v53);
        v56 = Logger.logObject.getter(v55);
        v57 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v56, v57))
        {
          v102 = (void (*)(char *, void *))v31;
          v58 = (uint8_t *)swift_slowAlloc(12, -1);
          v59 = swift_slowAlloc(32, -1);
          v105 = v6;
          v60 = v59;
          aBlock[0] = v59;
          *(_DWORD *)v58 = 136315138;
          v111 = sub_10003EE08(0xD000000000000020, 0x8000000100043240, aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, &v112);
          _os_log_impl((void *)&_mh_execute_header, v56, v57, "%s - The recipient was manually provided by the user. Looking up the contacts from its handle.", v58, 0xCu);
          swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
          v6 = v105;
          swift_slowDealloc(v60, -1, -1);
          swift_slowDealloc(v58, -1, -1);

          v102(v103, (void *)v45);
        }
        else
        {

          v31(v54, v45);
        }
        type metadata accessor for PlayerModel();
        sub_100015ACC(v52, v51);
        swift_bridgeObjectRelease(v51);
        a1 = v104;
      }
      else
      {
        swift_bridgeObjectRelease(v50);
      }
    }
  }
  v67 = v106;
  v66 = v107;
  v68 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v107 + 104))(v6, enum case for GKFeatureFlags.CrystalOnboardingEnhancements(_:), v106);
  v69 = GKFeatureFlags.isEnabled.getter(v68);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v6, v67);
  if ((v69 & 1) != 0)
  {
    v70 = qword_100059C70;
    if (!qword_100059C70)
      goto LABEL_17;
    v71 = qword_100059C68;
    v72 = (void *)objc_opt_self(CNContact);
    v73 = sub_100005170(&qword_1000591B0);
    v74 = swift_allocObject(v73, 48, 7);
    *(_OWORD *)(v74 + 16) = xmmword_100044020;
    *(_QWORD *)(v74 + 32) = v71;
    *(_QWORD *)(v74 + 40) = v70;
    swift_bridgeObjectRetain(v70);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v74);
    v76 = objc_msgSend(v72, "predicateForContactsWithIdentifiers:", isa);

    sub_100031748((uint64_t)v76);
    v78 = v77;

    if (v78)
    {
      v79 = 0;
    }
    else
    {
LABEL_17:
      v80 = objc_msgSend(a1, "recipientAddresses");
      v81 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v80, &type metadata for String);

      v82 = *(_QWORD *)(v81 + 16);
      swift_bridgeObjectRelease(v81);
      if (v82 != 1)
        return;
      v83 = objc_msgSend(a1, "recipientAddresses");
      v84 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v83, &type metadata for String);

      if (!v84[2])
      {
        swift_bridgeObjectRelease(v84);
        return;
      }
      v86 = v84[4];
      v85 = v84[5];
      swift_bridgeObjectRetain(v85);
      swift_bridgeObjectRelease(v84);
      v87 = (void *)objc_opt_self(CNContact);
      v88 = sub_100005170(&qword_1000591B0);
      v89 = swift_allocObject(v88, 48, 7);
      *(_OWORD *)(v89 + 16) = xmmword_100044020;
      *(_QWORD *)(v89 + 32) = v86;
      *(_QWORD *)(v89 + 40) = v85;
      v90 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v89);
      v91 = objc_msgSend(v87, "predicateForContactsMatchingHandleStrings:", v90);

      sub_100031748((uint64_t)v91);
      if (v92)
      {
        v78 = v92;

        v79 = 0;
      }
      else
      {
        v93 = objc_msgSend(a1, "recipientAddresses");
        v94 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v93, &type metadata for String);

        if (!*(_QWORD *)(v94 + 16))
        {
          swift_bridgeObjectRelease(v94);

          return;
        }
        v78 = *(_QWORD *)(v94 + 40);
        swift_bridgeObjectRetain(v78);
        swift_bridgeObjectRelease(v94);

        v79 = 1;
      }
    }
    v95 = objc_msgSend((id)objc_opt_self(GKDaemonProxy), "proxyForLocalPlayer");
    v96 = objc_msgSend(v95, "friendServicePrivate");

    v97 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v78);
    objc_msgSend(v96, "notifyMessageBasedFriendRequestSentTo:nameKind:", v97, v79);
    swift_unknownObjectRelease(v96);

  }
}

uint64_t sub_100032418(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  v4 = type metadata accessor for URL(0);
  v3[13] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[14] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[15] = swift_task_alloc(v6);
  v3[16] = swift_task_alloc(v6);
  v3[17] = swift_task_alloc(v6);
  v7 = sub_100005170(&qword_100058CE0);
  v3[18] = v7;
  v8 = (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[19] = swift_task_alloc(v8);
  v3[20] = swift_task_alloc(v8);
  v3[21] = swift_task_alloc(v8);
  v3[22] = swift_task_alloc(v8);
  v3[23] = swift_task_alloc(v8);
  v9 = type metadata accessor for Logger(0);
  v3[24] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[25] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[26] = swift_task_alloc(v11);
  v3[27] = swift_task_alloc(v11);
  v12 = type metadata accessor for MainActor(0);
  v3[28] = static MainActor.shared.getter();
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v12, &protocol witness table for MainActor);
  return swift_task_switch(sub_100032560, v13, v14);
}

uint64_t sub_100032560()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint8_t *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (*v11)(uint64_t, uint64_t);
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);
  void *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  void *v31;
  uint8_t *v32;
  _QWORD *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSURL *v41;
  void (*v42)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSURL *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int v83;
  void (*v84)(uint64_t, uint64_t, uint64_t);
  uint64_t v85;
  _QWORD *v86;
  unsigned int (*v87)(uint64_t, uint64_t, uint64_t);
  uint64_t v88;

  v1 = *(void **)(v0 + 96);
  v2 = swift_release(*(_QWORD *)(v0 + 224));
  static GKLog.friending.getter(v2);
  v3 = Logger.logObject.getter(v1);
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(void **)(v0 + 96);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v86 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    *(_QWORD *)(v0 + 72) = v5;
    v7 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80);
    *v86 = v5;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Validating the message for sending GC invite.", v6, 0xCu);
    v8 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v86, 1, v8);
    swift_slowDealloc(v86, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    v9 = *(void **)(v0 + 96);

  }
  v10 = *(void **)(v0 + 80);
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 200) + 8);
  v11(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
  v12 = objc_msgSend(v10, "URL");
  v13 = *(_QWORD *)(v0 + 184);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)(v0 + 136);
    v16 = *(_QWORD *)(v0 + 104);
    v17 = *(_QWORD **)(v0 + 112);
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v18 = (void (*)(uint64_t, uint64_t, uint64_t))v17[4];
    v18(v13, v15, v16);
    v19 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v17[7];
    v19(v13, 0, 1, v16);
    v20 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v17[6];
    if (v20(v13, 1, v16) != 1)
    {
      v84 = v18;
      v87 = v20;
      sub_10000527C(*(_QWORD *)(v0 + 184), &qword_100058CE0);
      goto LABEL_14;
    }
  }
  else
  {
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 112) + 56);
    v19(*(_QWORD *)(v0 + 184), 1, 1, *(_QWORD *)(v0 + 104));
  }
  sub_10000527C(*(_QWORD *)(v0 + 184), &qword_100058CE0);
  if (qword_100058750 != -1)
    swift_once(&qword_100058750, sub_100029DB4);
  v21 = *(_QWORD *)(v0 + 176);
  v22 = *(_QWORD *)(v0 + 104);
  v23 = *(_QWORD *)(v0 + 112);
  v24 = sub_100032C54(*(_QWORD *)(v0 + 144), (uint64_t)qword_100059C48);
  swift_beginAccess(v24, v0 + 16, 0, 0);
  sub_100032C6C(v24, v21);
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  if (v25(v21, 1, v22) != 1)
  {
    v87 = v25;
    v36 = *(_QWORD *)(v0 + 168);
    v37 = *(_QWORD *)(v0 + 128);
    v38 = *(_QWORD *)(v0 + 104);
    v39 = *(_QWORD *)(v0 + 112);
    v40 = *(void **)(v0 + 80);
    v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32);
    v84(v37, *(_QWORD *)(v0 + 176), v38);
    URL._bridgeToObjectiveC()(v41);
    v42 = v19;
    v44 = v43;
    objc_msgSend(v40, "setURL:", v43);

    v19 = v42;
    v42(v36, 1, 1, v38);
    swift_beginAccess(v24, v0 + 40, 33, 0);
    sub_100032CB4(v36, v24);
    swift_endAccess(v0 + 40);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
LABEL_14:
    v45 = objc_msgSend(*(id *)(v0 + 88), "recipientIdentifiers");
    v46 = type metadata accessor for UUID(0);
    v47 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v45, v46);

    v48 = *(_QWORD *)(v47 + 16);
    swift_bridgeObjectRelease(v47);
    if (v48 >= 2)
    {
      v49 = objc_msgSend(*(id *)(v0 + 80), "URL");
      v50 = *(_QWORD *)(v0 + 160);
      if (v49)
      {
        v51 = v49;
        v52 = *(_QWORD *)(v0 + 136);
        v53 = *(_QWORD *)(v0 + 104);
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        v84(v50, v52, v53);
        v19(v50, 0, 1, v53);
        if (v87(v50, 1, v53) != 1)
        {
          v54 = *(_QWORD *)(v0 + 152);
          v55 = *(_QWORD *)(v0 + 136);
          v57 = *(_QWORD *)(v0 + 112);
          v56 = *(_QWORD *)(v0 + 120);
          v58 = *(_QWORD *)(v0 + 104);
          v84(v56, *(_QWORD *)(v0 + 160), v58);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16))(v55, v56, v58);
          v59 = (void *)sub_10001D15C(v55);
          sub_100013B20(2, v54);
          if (v87(v54, 1, v58) == 1)
          {
            v61 = 0;
          }
          else
          {
            v66 = *(_QWORD *)(v0 + 152);
            v67 = *(_QWORD *)(v0 + 104);
            v68 = *(_QWORD *)(v0 + 112);
            URL._bridgeToObjectiveC()(v60);
            v61 = v69;
            (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v66, v67);
          }
          v71 = *(_QWORD *)(v0 + 112);
          v70 = *(_QWORD *)(v0 + 120);
          v72 = *(_QWORD *)(v0 + 104);
          objc_msgSend(*(id *)(v0 + 80), "setURL:", v61);

          (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v70, v72);
          goto LABEL_25;
        }
      }
      else
      {
        v19(*(_QWORD *)(v0 + 160), 1, 1, *(_QWORD *)(v0 + 104));
      }
      sub_10000527C(*(_QWORD *)(v0 + 160), &qword_100058CE0);
    }
LABEL_25:
    v85 = 0;
    v88 = 0;
    v83 = 1;
    goto LABEL_26;
  }
  v26 = *(void **)(v0 + 96);
  v27 = sub_10000527C(*(_QWORD *)(v0 + 176), &qword_100058CE0);
  static GKLog.friending.getter(v27);
  v28 = Logger.logObject.getter(v26);
  v29 = static os_log_type_t.info.getter();
  v30 = os_log_type_enabled(v28, v29);
  v31 = *(void **)(v0 + 96);
  if (v30)
  {
    v32 = (uint8_t *)swift_slowAlloc(12, -1);
    v33 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v32 = 138412290;
    *(_QWORD *)(v0 + 64) = v31;
    v34 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72);
    *v33 = v31;

    _os_log_impl((void *)&_mh_execute_header, v28, v29, "%@ No message URL for sending GC invite", v32, 0xCu);
    v35 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v33, 1, v35);
    swift_slowDealloc(v33, -1, -1);
    swift_slowDealloc(v32, -1, -1);
  }
  else
  {

    v28 = *(NSObject **)(v0 + 96);
  }
  v62 = *(_QWORD *)(v0 + 208);
  v63 = *(_QWORD *)(v0 + 192);

  v11(v62, v63);
  type metadata accessor for GCUILocalizedStrings(0);
  v64 = static GCUILocalizedStrings.FRIEND_INVITE_CODE_FETCH_IN_PROGRESS_ERROR.getter();
  v85 = v65;
  v88 = v64;
  v83 = 0;
LABEL_26:
  v73 = *(_QWORD *)(v0 + 208);
  v75 = *(_QWORD *)(v0 + 176);
  v74 = *(_QWORD *)(v0 + 184);
  v77 = *(_QWORD *)(v0 + 160);
  v76 = *(_QWORD *)(v0 + 168);
  v78 = *(_QWORD *)(v0 + 152);
  v79 = *(_QWORD *)(v0 + 128);
  v80 = *(_QWORD *)(v0 + 136);
  v81 = *(_QWORD *)(v0 + 120);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  swift_task_dealloc(v78);
  swift_task_dealloc(v80);
  swift_task_dealloc(v79);
  swift_task_dealloc(v81);
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v0 + 8))(v83, v88, v85);
}

uint64_t sub_100032C54(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100032C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005170(&qword_100058CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100032CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005170(&qword_100058CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100032CFC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100032D3C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100032D60(uint64_t a1)
{
  uint64_t v1;

  return sub_10002C5C0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_100032D68(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 <= 8u)
  {
    if (((1 << a3) & 0x17D) != 0)
    {

    }
    else if (a3 == 1)
    {

    }
  }
}

id sub_100032DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v3 = *(void **)(v2 + 16);
  v4 = qword_10005C238;
  qword_10005C230 = a1;
  qword_10005C238 = a2;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRelease(v4);
  byte_100059C60 = 0;
  return objc_msgSend(v3, "requestPresentationStyle:", 3);
}

uint64_t sub_100032E10()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_100032E30()
{
  return sub_100029B3C();
}

uint64_t sub_100032E50()
{
  return sub_1000298EC();
}

uint64_t sub_100032E70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void sub_100032E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_10002D1A4(a1, a2, a3, a4, v4);
}

id sub_100032E9C()
{
  return sub_10002972C();
}

unint64_t sub_100032EBC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059DE8;
  if (!qword_100059DE8)
  {
    v1 = sub_1000105F0(255, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue, v1);
    atomic_store(result, (unint64_t *)&qword_100059DE8);
  }
  return result;
}

void sub_100032F14(uint64_t a1)
{
  uint64_t v1;

  sub_10002D318(a1, v1);
}

uint64_t sub_100032F1C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_10002D5A4(v1, a1);
}

uint64_t sub_100032F24()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100032F50(uint64_t a1)
{
  uint64_t v1;

  sub_10002DFAC(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100032F58()
{
  uint64_t v0;

  return sub_10002B320(*(void **)(v0 + 16));
}

uint64_t sub_100032F60()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100032F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10002B390(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_100032F94(void *a1)
{
  uint64_t v1;

  sub_10002B0D4(a1, *(void **)(v1 + 16));
}

uint64_t sub_100032F9C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100032FAC()
{
  uint64_t v0;

  return sub_10002A258(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100032FB4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100032FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10002A2D8(a1, a2, *(char **)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

id sub_100032FF4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "dismiss");
}

uint64_t sub_100033004()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_100033030()
{
  uint64_t v0;

  sub_10002EED0(*(CFTimeInterval *)(v0 + 16));
}

uint64_t *sub_1000330A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100005170(&qword_100059D20);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v12 = v16[1];
    *v15 = *v16;
    v15[1] = v12;
  }
  swift_retain(v12);
  return a1;
}

uint64_t sub_100033188(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100005170(&qword_100059D20);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  return swift_release(*(_QWORD *)((char *)a1 + *(int *)(a2 + 20) + 8));
}

uint64_t *sub_1000331FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = sub_100005170(&qword_100059D20);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_retain(v15);
  return a1;
}

uint64_t *sub_1000332B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_10000527C((uint64_t)a1, &qword_100059D20);
    v6 = sub_100005170(&qword_100059D20);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = *(int *)(a3 + 20);
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  *v13 = *v14;
  v15 = v14[1];
  v16 = v13[1];
  v13[1] = v15;
  swift_retain(v15);
  swift_release(v16);
  return a1;
}

char *sub_100033398(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_100005170(&qword_100059D20);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_100033440(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 != a2)
  {
    sub_10000527C((uint64_t)a1, &qword_100059D20);
    v6 = sub_100005170(&qword_100059D20);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  v13 = *((_QWORD *)v9 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_release(v13);
  return a1;
}

uint64_t sub_100033510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003351C);
}

uint64_t sub_10003351C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100005170(&qword_100059E40);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000335A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000335AC);
}

uint64_t sub_1000335AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100005170(&qword_100059E40);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for FriendInviteCardView(uint64_t a1)
{
  uint64_t result;

  result = qword_100059EA0;
  if (!qword_100059EA0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FriendInviteCardView);
  return result;
}

void sub_100033668(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  sub_1000336D8(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_100045048;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

void sub_1000336D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100059EB0)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100059EB0);
  }
}

uint64_t sub_10003372C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004651C, 1);
}

uint64_t sub_10003373C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  __n128 v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  __n128 v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  __n128 v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  void *v65;
  char **v66;
  uint64_t v67;
  char v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t result;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char v88[16];
  uint64_t v89;

  v80 = a1;
  v79 = sub_100005170(&qword_100059EE0);
  __chkstk_darwin(v79);
  v87 = (char *)&v76 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for ColorScheme(0);
  v85 = *(_QWORD *)(v3 - 8);
  v86 = v3;
  v4 = __chkstk_darwin(v3);
  v84 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v83 = (uint64_t)&v76 - v6;
  v7 = sub_100005170(&qword_100059EE8);
  __chkstk_darwin(v7);
  v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100005170(&qword_100059EF0);
  __chkstk_darwin(v10);
  v12 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005170(&qword_100059EF8);
  __chkstk_darwin(v13);
  v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_100005170(&qword_100059F00);
  __chkstk_darwin(v82);
  v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100005170(&qword_100059F08);
  __chkstk_darwin(v81);
  v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100005170(&qword_100059F10);
  v77 = *(_QWORD *)(v20 - 8);
  v78 = v20;
  __chkstk_darwin(v20);
  v76 = (char *)&v76 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = v1;
  v22 = sub_100036414((void (*)(void))sub_100036CB0, (uint64_t)v88, (uint64_t)v9);
  v23 = static Edge.Set.leading.getter(v22);
  v24 = v23;
  v25.n128_u64[0] = 18.0;
  v26 = EdgeInsets.init(_all:)(v23, v25);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  sub_1000053A8((uint64_t)v9, (uint64_t)v12, &qword_100059EE8);
  v33 = &v12[*(int *)(v10 + 36)];
  *v33 = v24;
  *((double *)v33 + 1) = v26;
  *((_QWORD *)v33 + 2) = v28;
  *((_QWORD *)v33 + 3) = v30;
  *((_QWORD *)v33 + 4) = v32;
  v33[40] = 0;
  v34 = sub_10000527C((uint64_t)v9, &qword_100059EE8);
  v35 = static Edge.Set.trailing.getter(v34);
  LOBYTE(v9) = v35;
  v36.n128_u64[0] = 12.0;
  v37 = EdgeInsets.init(_all:)(v35, v36);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  sub_1000053A8((uint64_t)v12, (uint64_t)v15, &qword_100059EF0);
  v44 = &v15[*(int *)(v13 + 36)];
  *v44 = (char)v9;
  *((double *)v44 + 1) = v37;
  *((_QWORD *)v44 + 2) = v39;
  *((_QWORD *)v44 + 3) = v41;
  *((_QWORD *)v44 + 4) = v43;
  v44[40] = 0;
  v45 = sub_10000527C((uint64_t)v12, &qword_100059EF0);
  v46 = static Edge.Set.vertical.getter(v45);
  LOBYTE(v9) = v46;
  v47.n128_u64[0] = 12.0;
  v48 = EdgeInsets.init(_all:)(v46, v47);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  sub_1000053A8((uint64_t)v15, (uint64_t)v17, &qword_100059EF8);
  v55 = &v17[*(int *)(v82 + 36)];
  *v55 = (char)v9;
  *((double *)v55 + 1) = v48;
  *((_QWORD *)v55 + 2) = v50;
  *((_QWORD *)v55 + 3) = v52;
  *((_QWORD *)v55 + 4) = v54;
  v55[40] = 0;
  v56 = (uint64_t)v15;
  v57 = v81;
  sub_10000527C(v56, &qword_100059EF8);
  v58 = v83;
  sub_100036CE4(&qword_100059D20, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, v83);
  v59 = v84;
  v60 = v85;
  v61 = v86;
  (*(void (**)(char *, _QWORD, uint64_t))(v85 + 104))(v84, enum case for ColorScheme.dark(_:), v86);
  v62 = v59;
  LOBYTE(v59) = static ColorScheme.== infix(_:_:)(v58, v59);
  v63 = *(void (**)(char *, uint64_t))(v60 + 8);
  v63(v62, v61);
  v63((char *)v58, v61);
  v64 = (uint64_t)v87;
  v65 = (void *)objc_opt_self(UIColor);
  v66 = &selRef_tertiarySystemGroupedBackgroundColor;
  if ((v59 & 1) == 0)
    v66 = &selRef_systemGray6Color;
  v67 = Color.init(uiColor:)(objc_msgSend(v65, *v66));
  v68 = static Edge.Set.all.getter(v67);
  sub_1000053A8((uint64_t)v17, (uint64_t)v19, &qword_100059F00);
  v69 = &v19[*(int *)(v57 + 36)];
  *(_QWORD *)v69 = v67;
  v69[8] = v68;
  sub_10000527C((uint64_t)v17, &qword_100059F00);
  v70 = enum case for DynamicTypeSize.accessibility2(_:);
  v71 = type metadata accessor for DynamicTypeSize(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 104))(v64, v70, v71);
  sub_100036F1C();
  result = dispatch thunk of static Equatable.== infix(_:_:)(v64, v64);
  if ((result & 1) != 0)
  {
    v73 = sub_100036F64();
    v74 = sub_1000056BC(&qword_100059F78, &qword_100059EE0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    v75 = v76;
    View.dynamicTypeSize<A>(_:)(v64, v57, v79, v73, v74);
    sub_10000527C(v64, &qword_100059EE0);
    sub_10000527C((uint64_t)v19, &qword_100059F08);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v77 + 32))(v80, v75, v78);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100033C98(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t KeyPath;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  int v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  _OWORD v100[7];
  _OWORD v101[2];
  _BYTE v102[145];
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
  char v113;

  v92 = a2;
  v61 = sub_100005170(&qword_100059F98);
  __chkstk_darwin(v61);
  v44[3] = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_100005170(&qword_100059FA0);
  __chkstk_darwin(v52);
  v56 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = sub_100005170(&qword_100059FA8);
  __chkstk_darwin(v97);
  v65 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_100005170(&qword_100059FB0);
  __chkstk_darwin(v58);
  v62 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100005170(&qword_100059FB8);
  __chkstk_darwin(v81);
  v66 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_100005170(&qword_100059FC0);
  __chkstk_darwin(v60);
  v67 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_100005170(&qword_100059FC8);
  __chkstk_darwin(v78);
  v80 = (char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_100005170(&qword_100059FD0);
  __chkstk_darwin(v53);
  v59 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_100005170(&qword_100059FD8);
  __chkstk_darwin(v79);
  v63 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_100005170(&qword_100059FE0);
  __chkstk_darwin(v87);
  v82 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_100005170(&qword_100059FE8);
  __chkstk_darwin(v54);
  v44[2] = (char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_100005170(&qword_100059FF0);
  __chkstk_darwin(v55);
  v44[1] = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_100005170(&qword_100059FF8);
  __chkstk_darwin(v49);
  v51 = (char *)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_100005170(&qword_10005A000);
  __chkstk_darwin(v77);
  v57 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for FriendInviteCardView(0);
  v68 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v69 = v18;
  v70 = (char *)v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_100005170(&qword_10005A008);
  __chkstk_darwin(v50);
  v83 = (char *)v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_100005170(&qword_10005A010);
  __chkstk_darwin(v72);
  v64 = (char *)v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = sub_100005170(&qword_10005A018);
  __chkstk_darwin(v93);
  v95 = (char *)v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_100005170(&qword_10005A020);
  __chkstk_darwin(v84);
  v86 = (char *)v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_100005170(&qword_10005A028);
  __chkstk_darwin(v73);
  v75 = (char *)v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_100005170(&qword_10005A030);
  __chkstk_darwin(v45);
  v47 = (char *)v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_100005170(&qword_10005A038);
  __chkstk_darwin(v46);
  v74 = sub_100005170(&qword_10005A040);
  __chkstk_darwin(v74);
  v48 = (char *)v44 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = sub_100005170(&qword_10005A048);
  __chkstk_darwin(v85);
  v76 = (char *)v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = sub_100005170(&qword_10005A050);
  __chkstk_darwin(v94);
  v88 = (char *)v44 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_100005170(&qword_10005A058);
  v29 = __chkstk_darwin(v28);
  __chkstk_darwin(v29);
  v30 = sub_100005170(&qword_10005A060);
  v31 = __chkstk_darwin(v30);
  v90 = (char *)v44 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __chkstk_darwin(v31);
  v96 = (char *)v44 - v34;
  v91 = static HorizontalAlignment.center.getter(v33, v35, v36, v37, v38);
  sub_1000366DC((uint64_t)v100);
  *(_OWORD *)&v102[39] = v100[2];
  *(_OWORD *)&v102[23] = v100[1];
  *(_OWORD *)&v102[103] = v100[6];
  *(_OWORD *)&v102[87] = v100[5];
  *(_OWORD *)&v102[119] = v101[0];
  *(_OWORD *)&v102[129] = *(_OWORD *)((char *)v101 + 10);
  *(_OWORD *)&v102[55] = v100[3];
  v103 = 1;
  *(_OWORD *)&v102[71] = v100[4];
  *(_OWORD *)&v102[7] = v100[0];
  v89 = 1;
  v108 = *(_OWORD *)&v102[64];
  v109 = *(_OWORD *)&v102[80];
  v106 = *(_OWORD *)&v102[32];
  v107 = *(_OWORD *)&v102[48];
  v113 = BYTE9(v101[1]);
  v111 = *(_OWORD *)&v102[112];
  v112 = *(_OWORD *)&v102[128];
  v110 = *(_OWORD *)&v102[96];
  v104 = *(_OWORD *)v102;
  v105 = *(_OWORD *)&v102[16];
  v39 = *(int *)(v17 + 20);
  v71 = a1;
  v40 = *(_QWORD *)(a1 + v39 + 8);
  KeyPath = swift_getKeyPath(&unk_1000450B0);
  v42 = swift_getKeyPath(&unk_1000450D8);
  v43 = swift_retain(v40);
  static Published.subscript.getter(&v98, v43, KeyPath, v42);
  swift_release(v40);
  swift_release(KeyPath);
  swift_release(v42);
  __asm { BR              X10 }
}

_QWORD *sub_1000344CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  *(_QWORD *)(v1 + 344) = v0;
  swift_retain(v2);
  *(_QWORD *)(v1 + 328) = sub_10003C458(v3);
  KeyPath = swift_getKeyPath(&unk_1000450B0);
  v6 = swift_getKeyPath(&unk_1000450D8);
  v7 = v3;
  static Published.subscript.getter((_QWORD *)(v1 + 632), v2, KeyPath, v6);
  swift_release(KeyPath);
  swift_release(v6);
  v8 = *(void **)(v1 + 632);
  v9 = *(void **)(v1 + 640);
  *(_QWORD *)(v1 + 336) = v3;
  v10 = *(_BYTE *)(v1 + 648);
  sub_1000393A8((uint64_t)v8, (uint64_t)v9, v10);
  v12 = v11;
  v14 = v13;
  sub_100032D68(v8, v9, v10);
  v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
  v15 = *(_QWORD *)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay + 8);
  v17 = swift_getKeyPath(&unk_1000450F8);
  v18 = *(uint64_t **)(v1 + 184);
  *v18 = v17;
  v19 = sub_100005170(&qword_1000594E0);
  swift_storeEnumTagMultiPayload(v18, v19, 0);
  v20 = *(_QWORD *)(v1 + 248);
  v21 = (char *)v18 + *(int *)(v20 + 36);
  *(_QWORD *)v21 = v7;
  *((_WORD *)v21 + 4) = 0;
  *((_QWORD *)v21 + 2) = v12;
  *((_QWORD *)v21 + 3) = v14;
  *((_QWORD *)v21 + 4) = *(_QWORD *)(v1 + 328);
  *((_QWORD *)v21 + 5) = v16;
  *((_QWORD *)v21 + 6) = v15;
  *((_QWORD *)v21 + 7) = sub_1000371C4;
  *((_QWORD *)v21 + 8) = v2;
  *((_QWORD *)v21 + 9) = sub_1000371CC;
  *((_QWORD *)v21 + 10) = v2;
  v22 = (uint64_t *)((char *)v18 + *(int *)(v20 + 40));
  *v22 = nullsub_1;
  v22[1] = 0;
  v23 = *(_QWORD *)(v1 + 48);
  sub_1000053A8((uint64_t)v18, v23, &qword_10005A010);
  swift_storeEnumTagMultiPayload(v23, *(_QWORD *)(v1 + 32), 1);
  v24 = sub_1000056BC(&qword_10005A090, &qword_10005A038, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v25 = sub_1000056BC(&qword_10005A098, &qword_10005A010, (uint64_t)&unk_100044988);
  swift_retain(v2);
  swift_retain(v15);
  v26 = *(_QWORD *)(v1 + 56);
  _ConditionalContent<>.init(storage:)(v23, *(_QWORD *)(v1 + 40), v20, v24, v25);
  v27 = *(_QWORD *)(v1 + 272);
  sub_1000053A8(v26, v27, &qword_10005A040);
  swift_storeEnumTagMultiPayload(v27, *(_QWORD *)(v1 + 256), 0);
  v28 = sub_1000372D0();
  v29 = sub_10003736C();
  v30 = *(_QWORD *)(v1 + 280);
  _ConditionalContent<>.init(storage:)(v27, *(_QWORD *)(v1 + 264), *(_QWORD *)(v1 + 288), v28, v29);
  sub_10000527C(v26, &qword_10005A040);
  v31 = *(_QWORD *)(v1 + 368);
  sub_1000053A8(v30, v31, &qword_10005A048);
  swift_storeEnumTagMultiPayload(v31, *(_QWORD *)(v1 + 352), 0);
  v32 = sub_10003723C();
  v33 = sub_100037410();
  v34 = *(_QWORD *)(v1 + 384);
  _ConditionalContent<>.init(storage:)(v31, *(_QWORD *)(v1 + 360), *(_QWORD *)(v1 + 376), v32, v33);
  sub_10000527C(v30, &qword_10005A048);
  v35 = *(_QWORD *)(v1 + 440);
  sub_1000053A8(v34, v35, &qword_10005A050);
  swift_storeEnumTagMultiPayload(v35, *(_QWORD *)(v1 + 424), 0);
  v36 = sub_100037260(&qword_10005A078, &qword_10005A050, (void (*)(void))sub_10003723C, (void (*)(void))sub_100037410);
  v37 = sub_100037554();
  v38 = *(_QWORD *)(v1 + 448);
  _ConditionalContent<>.init(storage:)(v35, *(_QWORD *)(v1 + 432), *(_QWORD *)(v1 + 456), v36, v37);
  sub_100032D68(*(void **)(v1 + 336), *(void **)(v1 + 344), 0);
  sub_10000527C(v34, &qword_10005A050);
  sub_10000527C((uint64_t)v18, &qword_10005A010);
  v39 = *(_QWORD *)(v1 + 400);
  sub_1000053A8(v38, v39, &qword_10005A060);
  v40 = *(_QWORD *)(v1 + 408);
  *(_QWORD *)(v1 + 464) = v40;
  *(_QWORD *)(v1 + 472) = 0;
  LODWORD(v26) = *(_DWORD *)(v1 + 396);
  *(_BYTE *)(v1 + 480) = v26;
  v41 = *(_OWORD *)(v4 - 160);
  *(_OWORD *)(v1 + 593) = *(_OWORD *)(v4 - 144);
  *(_OWORD *)(v1 + 577) = v41;
  *(_OWORD *)(v1 + 609) = *(_OWORD *)(v4 - 128);
  *(_BYTE *)(v1 + 625) = *(_BYTE *)(v4 - 112);
  v42 = *(_OWORD *)(v4 - 208);
  *(_OWORD *)(v1 + 513) = *(_OWORD *)(v4 - 224);
  *(_OWORD *)(v1 + 529) = v42;
  v43 = *(_OWORD *)(v4 - 176);
  *(_OWORD *)(v1 + 545) = *(_OWORD *)(v4 - 192);
  *(_OWORD *)(v1 + 561) = v43;
  v44 = *(_OWORD *)(v4 - 240);
  *(_OWORD *)(v1 + 481) = *(_OWORD *)(v4 - 256);
  *(_OWORD *)(v1 + 497) = v44;
  v45 = *(_OWORD *)(v1 + 608);
  v46 = *(_QWORD *)(v1 + 416);
  *(_OWORD *)(v46 + 128) = *(_OWORD *)(v1 + 592);
  *(_OWORD *)(v46 + 144) = v45;
  *(_WORD *)(v46 + 160) = *(_WORD *)(v1 + 624);
  v47 = *(_OWORD *)(v1 + 544);
  *(_OWORD *)(v46 + 64) = *(_OWORD *)(v1 + 528);
  *(_OWORD *)(v46 + 80) = v47;
  v48 = *(_OWORD *)(v1 + 576);
  *(_OWORD *)(v46 + 96) = *(_OWORD *)(v1 + 560);
  *(_OWORD *)(v46 + 112) = v48;
  v49 = *(_OWORD *)(v1 + 480);
  *(_OWORD *)v46 = *(_OWORD *)(v1 + 464);
  *(_OWORD *)(v46 + 16) = v49;
  v50 = *(_OWORD *)(v1 + 512);
  *(_OWORD *)(v46 + 32) = *(_OWORD *)(v1 + 496);
  *(_OWORD *)(v46 + 48) = v50;
  v51 = sub_100005170(&qword_10005A0E8);
  sub_1000053A8(v39, v46 + *(int *)(v51 + 48), &qword_10005A060);
  sub_1000375D8((_QWORD *)(v1 + 464));
  sub_10000527C(v38, &qword_10005A060);
  sub_10000527C(v39, &qword_10005A060);
  v52 = *(_OWORD *)(v4 - 144);
  *(_OWORD *)(v1 + 745) = *(_OWORD *)(v4 - 160);
  *(_OWORD *)(v1 + 761) = v52;
  *(_OWORD *)(v1 + 777) = *(_OWORD *)(v4 - 128);
  v53 = *(_OWORD *)(v4 - 208);
  *(_OWORD *)(v1 + 681) = *(_OWORD *)(v4 - 224);
  *(_OWORD *)(v1 + 697) = v53;
  v54 = *(_OWORD *)(v4 - 176);
  *(_OWORD *)(v1 + 713) = *(_OWORD *)(v4 - 192);
  *(_OWORD *)(v1 + 729) = v54;
  v55 = *(_OWORD *)(v4 - 240);
  *(_OWORD *)(v1 + 649) = *(_OWORD *)(v4 - 256);
  *(_QWORD *)(v1 + 632) = v40;
  *(_QWORD *)(v1 + 640) = 0;
  *(_BYTE *)(v1 + 648) = v26;
  *(_BYTE *)(v1 + 793) = *(_BYTE *)(v4 - 112);
  *(_OWORD *)(v1 + 665) = v55;
  return sub_10003765C((_QWORD *)(v1 + 632));
}

uint64_t sub_1000362A8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a2 + *(int *)(type metadata accessor for FriendInviteCardView(0) + 20) + 8);
  *a3 = a1;
  a3[1] = sub_100037A70;
  a3[2] = v5;
  v6 = a1;
  return swift_retain(v5);
}

int *sub_100036300@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *result;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for FriendInviteCardView(0) + 20) + 8);
  KeyPath = swift_getKeyPath(&unk_100045128);
  v5 = swift_getKeyPath(&unk_100045150);
  v6 = swift_retain_n(v3, 3);
  static Published.subscript.getter(&v11, v6, KeyPath, v5);
  swift_release(v3);
  swift_release(KeyPath);
  swift_release(v5);
  LOBYTE(KeyPath) = v11;
  *a2 = swift_getKeyPath(&unk_1000450F8);
  v7 = sub_100005170(&qword_1000594E0);
  swift_storeEnumTagMultiPayload(a2, v7, 0);
  result = (int *)type metadata accessor for FriendInviteButtonStackView(0);
  v9 = (_QWORD *)((char *)a2 + result[5]);
  *v9 = sub_100037A78;
  v9[1] = v3;
  v10 = (_QWORD *)((char *)a2 + result[6]);
  *v10 = sub_100037A7C;
  v10[1] = v3;
  *((_BYTE *)a2 + result[7]) = KeyPath;
  return result;
}

void sub_100036400(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void sub_10003640C(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100036414@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[2];
  void (*v32)(void);
  uint64_t v33;

  v31[1] = a2;
  v32 = a1;
  v33 = a3;
  v3 = sub_100005170(&qword_100059F60);
  __chkstk_darwin(v3);
  v5 = (_QWORD *)((char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_100005170(&qword_100059F80);
  __chkstk_darwin(v6);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005170(&qword_100059F50);
  __chkstk_darwin(v9);
  v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for GKFeatureFlags(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v12);
  v17 = GKFeatureFlags.isEnabled.getter(v16);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  if ((v17 & 1) != 0)
  {
    *(_QWORD *)v11 = static HorizontalAlignment.center.getter(v18, v19, v20, v21, v22);
    *((_QWORD *)v11 + 1) = 0x4010000000000000;
    v11[16] = 0;
    sub_100005170(&qword_100059F90);
    v32();
    v23 = &qword_100059F50;
    sub_1000053A8((uint64_t)v11, (uint64_t)v8, &qword_100059F50);
    swift_storeEnumTagMultiPayload(v8, v6, 0);
    v24 = sub_1000056BC(&qword_100059F48, &qword_100059F50, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v25 = sub_1000056BC(&qword_100059F58, &qword_100059F60, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    _ConditionalContent<>.init(storage:)(v8, v9, v3, v24, v25);
    v26 = (uint64_t)v11;
  }
  else
  {
    *v5 = static Alignment.center.getter(v18);
    v5[1] = v27;
    sub_100005170(&qword_100059F88);
    v32();
    v23 = &qword_100059F60;
    sub_1000053A8((uint64_t)v5, (uint64_t)v8, &qword_100059F60);
    swift_storeEnumTagMultiPayload(v8, v6, 1);
    v28 = sub_1000056BC(&qword_100059F48, &qword_100059F50, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v29 = sub_1000056BC(&qword_100059F58, &qword_100059F60, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    _ConditionalContent<>.init(storage:)(v8, v9, v3, v28, v29);
    v26 = (uint64_t)v5;
  }
  return sub_10000527C(v26, v23);
}

_QWORD *sub_1000366DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
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
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
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
  _QWORD v41[2];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[25];
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  _BYTE v52[7];
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
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  _BYTE v70[7];
  _BYTE v71[7];
  _DWORD v72[3];

  v2 = type metadata accessor for GKFeatureFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = static VerticalAlignment.center.getter(v4);
  sub_100036930((uint64_t)&v49);
  v30 = v50;
  v31 = v49;
  v7 = v51;
  v8 = v54;
  v39 = v56;
  v40 = v55;
  v37 = v58;
  v38 = v57;
  v35 = v60;
  v36 = v59;
  v33 = v53;
  v34 = v61;
  v9 = v62;
  v69 = 1;
  v68 = v51;
  v67 = v54;
  v66 = v62;
  v10 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v2);
  v11 = GKFeatureFlags.isEnabled.getter(v10);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  *(_DWORD *)v52 = v72[0];
  *(_DWORD *)&v52[3] = *(_DWORD *)((char *)v72 + 3);
  *(_DWORD *)((char *)&v55 + 1) = *(_DWORD *)v71;
  HIDWORD(v55) = *(_DWORD *)&v71[3];
  *(_DWORD *)((char *)&v57 + 1) = *(_DWORD *)v70;
  HIDWORD(v57) = *(_DWORD *)&v70[3];
  v12 = v32;
  v13 = v33;
  v41[0] = v32;
  v41[1] = 0;
  LOBYTE(v42) = 1;
  *(_DWORD *)((char *)&v42 + 1) = v72[0];
  DWORD1(v42) = *(_DWORD *)((char *)v72 + 3);
  v15 = v30;
  v14 = v31;
  *((_QWORD *)&v42 + 1) = v31;
  *(_QWORD *)&v43 = v30;
  BYTE8(v43) = v7;
  *(_DWORD *)((char *)&v43 + 9) = *(_DWORD *)v71;
  HIDWORD(v43) = *(_DWORD *)&v71[3];
  *(_QWORD *)&v44 = v33;
  BYTE8(v44) = v8;
  *(_DWORD *)((char *)&v44 + 9) = *(_DWORD *)v70;
  HIDWORD(v44) = *(_DWORD *)&v70[3];
  v17 = v39;
  v16 = v40;
  *(_QWORD *)&v45 = v40;
  *((_QWORD *)&v45 + 1) = v39;
  v19 = v37;
  v18 = v38;
  *(_QWORD *)&v46 = v38;
  *((_QWORD *)&v46 + 1) = v37;
  v21 = v35;
  v20 = v36;
  *(_QWORD *)v47 = v36;
  *(_QWORD *)&v47[8] = v35;
  v22 = v34;
  *(_QWORD *)&v47[16] = v34;
  v47[24] = v9;
  v23 = (unint64_t)v32;
  v24 = v42;
  v25 = v44;
  *(_OWORD *)(a1 + 32) = v43;
  *(_OWORD *)(a1 + 48) = v25;
  *(_OWORD *)a1 = v23;
  *(_OWORD *)(a1 + 16) = v24;
  v26 = v45;
  v27 = v46;
  v28 = *(_OWORD *)v47;
  *(_OWORD *)(a1 + 105) = *(_OWORD *)&v47[9];
  *(_OWORD *)(a1 + 80) = v27;
  *(_OWORD *)(a1 + 96) = v28;
  *(_OWORD *)(a1 + 64) = v26;
  v48 = v11 & 1;
  *(_QWORD *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 136) = (v11 & 1) == 0;
  *(_BYTE *)(a1 + 137) = v11 & 1;
  v49 = v12;
  v50 = 0;
  v51 = 1;
  v53 = v14;
  v54 = v15;
  LOBYTE(v55) = v7;
  v56 = v13;
  LOBYTE(v57) = v8;
  v58 = v16;
  v59 = v17;
  v60 = v18;
  v61 = v19;
  v62 = v20;
  v63 = v21;
  v64 = v22;
  v65 = v9;
  sub_100037A88(v41);
  return sub_100037ADC(&v49);
}

void sub_100036930(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
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
  uint64_t v35;
  char v36;
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
  char v48;
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
  int v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  _QWORD v63[2];
  uint64_t v64;
  unsigned __int8 v65;
  uint64_t v66;
  unsigned __int8 v67;
  uint64_t v68;
  uint64_t v69;

  v2 = type metadata accessor for GKFeatureFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Image.ResizingMode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend((id)objc_opt_self(GKUITheme), "sharedTheme");
  if (!v10)
  {
    __break(1u);
    goto LABEL_8;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "eventIconImage");

  if (!v12)
  {
LABEL_8:
    __break(1u);
    return;
  }
  v13 = Image.init(uiImage:)(v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  v14 = Image.resizable(capInsets:resizingMode:)(v9, v13, 0.0, 0.0, 0.0, 0.0);
  swift_release(v13);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v16 = static Alignment.center.getter(v15);
  _FrameLayout.init(width:height:alignment:)(&v64, 0x4035000000000000, 0, 0x4035000000000000, 0, v16, v17);
  v18 = v64;
  v59 = v65;
  v19 = v66;
  v62 = v67;
  v60 = v69;
  v61 = v68;
  v20 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v2);
  v21 = GKFeatureFlags.isEnabled.getter(v20);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((v21 & 1) != 0)
  {
    type metadata accessor for GCUILocalizedStrings(0);
    v63[0] = static GCUILocalizedStrings.GAME_CENTER.getter();
    v63[1] = v22;
    v23 = sub_1000042C0();
    v24 = Text.init<A>(_:)(v63, &type metadata for String, v23);
    v26 = v25;
    v28 = v27;
    v30 = v29 & 1;
    LODWORD(v63[0]) = static HierarchicalShapeStyle.secondary.getter(v24);
    v31 = Text.foregroundStyle<A>(_:)(v63, v24, v26, v30, v28, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
    v57 = v19;
    v58 = v18;
    v32 = v31;
    v54 = v31;
    v55 = v33;
    v56 = v34;
    v35 = v33;
    v37 = v36 & 1;
    sub_100004304(v24, v26, v30);
    v38 = swift_bridgeObjectRelease(v28);
    v39 = static Font.footnote.getter(v38);
    v40 = Font.bold()();
    swift_release(v39);
    v41 = v32;
    v42 = v56;
    LOBYTE(v32) = v37;
    v43 = Text.font(_:)(v40, v41, v56, v37, v35);
    v45 = v44;
    v46 = v14;
    v48 = v47;
    v50 = v49;
    swift_release(v40);
    v51 = v48 & 1;
    v14 = v46;
    v52 = v42;
    v19 = v57;
    v18 = v58;
    sub_100004304(v54, v52, v32);
    swift_bridgeObjectRelease(v55);
  }
  else
  {
    v43 = 0;
    v45 = 0;
    v51 = 0;
    v50 = 0;
  }
  *(_QWORD *)a1 = v14;
  *(_QWORD *)(a1 + 8) = v18;
  *(_BYTE *)(a1 + 16) = v59;
  *(_QWORD *)(a1 + 24) = v19;
  *(_BYTE *)(a1 + 32) = v62;
  v53 = v60;
  *(_QWORD *)(a1 + 40) = v61;
  *(_QWORD *)(a1 + 48) = v53;
  *(_QWORD *)(a1 + 56) = v43;
  *(_QWORD *)(a1 + 64) = v45;
  *(_QWORD *)(a1 + 72) = v51;
  *(_QWORD *)(a1 + 80) = v50;
  *(_QWORD *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 96) = 1;
  swift_retain(v14);
  sub_10003762C(v43, v45, v51, v50);
  sub_1000376B0(v43, v45, v51, v50);
  swift_release(v14);
}

void sub_100036CB0(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_100033C98(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_100036CB8@<X0>(uint64_t a1@<X8>)
{
  return sub_100036CE4(&qword_1000594E0, (uint64_t (*)(_QWORD))&type metadata accessor for ContentSizeCategory, 0xD000000000000013, 0x8000000100043380, a1);
}

uint64_t sub_100036CE4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a3;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100005170(a1);
  __chkstk_darwin(v15);
  v17 = (uint64_t *)((char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000053A8(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload(v17, v15) == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = *v17;
    v21 = static os_log_type_t.fault.getter();
    v22 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v22, v21))
    {
      v27 = a4;
      v23 = swift_slowAlloc(12, -1);
      v28 = a5;
      v24 = (uint8_t *)v23;
      v25 = swift_slowAlloc(32, -1);
      v31 = v25;
      *(_DWORD *)v24 = 136315138;
      v30 = sub_10003EE08(v29, v27, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v24, 0xCu);
      swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v14, v20);
    swift_release(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

unint64_t sub_100036F1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059F18;
  if (!qword_100059F18)
  {
    v1 = type metadata accessor for DynamicTypeSize(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DynamicTypeSize, v1);
    atomic_store(result, (unint64_t *)&qword_100059F18);
  }
  return result;
}

unint64_t sub_100036F64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059F20;
  if (!qword_100059F20)
  {
    v1 = sub_10000437C(&qword_100059F08);
    sub_100037038(&qword_100059F28, &qword_100059F00, (void (*)(void))sub_100037000);
    sub_1000056BC(&qword_100059F68, &qword_100059F70, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059F20);
  }
  return result;
}

uint64_t sub_100037000()
{
  return sub_100037038(&qword_100059F30, &qword_100059EF8, (void (*)(void))sub_10003701C);
}

uint64_t sub_10003701C()
{
  return sub_100037038(&qword_100059F38, &qword_100059EF0, (void (*)(void))sub_1000370A4);
}

uint64_t sub_100037038(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000437C(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000370A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059F40;
  if (!qword_100059F40)
  {
    v1 = sub_10000437C(&qword_100059EE8);
    sub_1000056BC(&qword_100059F48, &qword_100059F50, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_1000056BC(&qword_100059F58, &qword_100059F60, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100059F40);
  }
  return result;
}

uint64_t sub_100037140(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ContentSizeCategory(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.sizeCategory.setter(v3);
}

uint64_t sub_1000371C4(uint64_t a1, uint64_t a2)
{
  return sub_10003C7A4(a1, a2);
}

uint64_t sub_1000371CC(uint64_t a1, uint64_t a2)
{
  return sub_10003C7C4(a1, a2);
}

uint64_t sub_1000371D4()
{
  return EnvironmentValues.sizeCategory.getter();
}

unint64_t sub_1000371F8()
{
  unint64_t result;

  result = qword_10005A068;
  if (!qword_10005A068)
  {
    result = swift_getWitnessTable(&unk_10004424C, &type metadata for FriendInviteCardErrorView);
    atomic_store(result, (unint64_t *)&qword_10005A068);
  }
  return result;
}

uint64_t sub_10003723C()
{
  return sub_100037260(&qword_10005A080, &qword_10005A048, (void (*)(void))sub_1000372D0, (void (*)(void))sub_10003736C);
}

uint64_t sub_100037260(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000437C(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000372D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A088;
  if (!qword_10005A088)
  {
    v1 = sub_10000437C(&qword_10005A040);
    sub_1000056BC(&qword_10005A090, &qword_10005A038, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    sub_1000056BC(&qword_10005A098, &qword_10005A010, (uint64_t)&unk_100044988);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005A088);
  }
  return result;
}

unint64_t sub_10003736C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A0A0;
  if (!qword_10005A0A0)
  {
    v1 = sub_10000437C(&qword_10005A000);
    sub_1000056BC(&qword_10005A0A8, &qword_10005A008, (uint64_t)&unk_100044988);
    sub_1000056BC(&qword_10005A0B0, &qword_100059FF0, (uint64_t)&unk_100044988);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005A0A0);
  }
  return result;
}

uint64_t sub_100037410()
{
  return sub_100037260(&qword_10005A0B8, &qword_100059FE0, (void (*)(void))sub_100037434, (void (*)(void))sub_1000374D8);
}

unint64_t sub_100037434()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A0C0;
  if (!qword_10005A0C0)
  {
    v1 = sub_10000437C(&qword_100059FD8);
    sub_1000056BC(&qword_10005A0C8, &qword_100059FE8, (uint64_t)&unk_100044988);
    sub_1000056BC(&qword_10005A098, &qword_10005A010, (uint64_t)&unk_100044988);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005A0C0);
  }
  return result;
}

unint64_t sub_1000374D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A0D0;
  if (!qword_10005A0D0)
  {
    v1 = sub_10000437C(&qword_100059FB8);
    sub_1000056BC(&qword_10005A0D8, &qword_100059FC0, (uint64_t)&unk_100044988);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005A0D0);
  }
  return result;
}

unint64_t sub_100037554()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A0E0;
  if (!qword_10005A0E0)
  {
    v1 = sub_10000437C(&qword_100059FA8);
    sub_1000371F8();
    sub_1000056BC(&qword_10005A070, &qword_100059F98, (uint64_t)&unk_100044988);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005A0E0);
  }
  return result;
}

_QWORD *sub_1000375D8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[13];
  v3 = a1[14];
  v4 = a1[15];
  v5 = a1[16];
  swift_retain(a1[6]);
  sub_10003762C(v2, v3, v4, v5);
  return a1;
}

double sub_10003762C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  double result;

  if (a4)
  {
    sub_1000051F4(a1, a2, a3 & 1);
    *(_QWORD *)&result = swift_bridgeObjectRetain(a4).n128_u64[0];
  }
  return result;
}

_QWORD *sub_10003765C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[13];
  v3 = a1[14];
  v4 = a1[15];
  v5 = a1[16];
  swift_release(a1[6]);
  sub_1000376B0(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_1000376B0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100004304(result, a2, a3 & 1);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_1000376E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FriendInviteCardView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100037728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for FriendInviteCardView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_100005170(&qword_100059D20);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)((char *)v6 + *(int *)(v1 + 20) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_1000377E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FriendInviteCardView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

int *sub_100037824@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FriendInviteCardView(0) - 8) + 80);
  return sub_100036300(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_100037860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for FriendInviteCardView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_100005170(&qword_100059D20);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)((char *)v6 + *(int *)(v1 + 20) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100037918@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = type metadata accessor for FriendInviteCardView(0);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  v5 = *(_QWORD *)(v1 + *(int *)(v3 + 20) + ((v4 + 24) & ~v4) + 8);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = sub_100037A74;
  a1[2] = v5;
  return swift_retain(v5);
}

uint64_t sub_100037970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for FriendInviteCardView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_100005170(&qword_100059D20);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)((char *)v6 + *(int *)(v1 + 20) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100037A30@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FriendInviteCardView(0) - 8) + 80);
  return sub_1000362A8(*(void **)(v1 + 16), v1 + ((v3 + 24) & ~v3), a1);
}

_QWORD *sub_100037A88(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[10];
  v3 = a1[11];
  v4 = a1[12];
  v5 = a1[13];
  swift_retain(a1[3]);
  sub_10003762C(v2, v3, v4, v5);
  return a1;
}

_QWORD *sub_100037ADC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[10];
  v3 = a1[11];
  v4 = a1[12];
  v5 = a1[13];
  swift_release(a1[3]);
  sub_1000376B0(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_100037B30()
{
  _QWORD v1[4];

  v1[0] = sub_10000437C(&qword_100059F08);
  v1[1] = sub_10000437C(&qword_100059EE0);
  v1[2] = sub_100036F64();
  v1[3] = sub_1000056BC(&qword_100059F78, &qword_100059EE0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
}

uint64_t Data.decompress(withAlgorithm:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _BYTE v7[24];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[16] = a1;
  v8 = a2;
  v9 = a3;
  v5 = sub_100005170(&qword_100059228);
  Data.withUnsafeBytes<A, B>(_:)(&v10, sub_10001DD7C, v7, a2, a3, v5, &type metadata for UInt8);
  return v10;
}

uint64_t Data.deflate()(uint64_t a1, uint64_t a2)
{
  return sub_100037C44(a1, a2, (uint64_t)sub_10003807C);
}

uint64_t Data.inflate()(uint64_t a1, uint64_t a2)
{
  return sub_100037C44(a1, a2, (uint64_t)sub_100038138);
}

uint64_t sub_100037C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;

  v8[2] = a1;
  v8[3] = a2;
  v6 = sub_100005170(&qword_100059228);
  Data.withUnsafeBytes<A, B>(_:)(&v9, a3, v8, a1, a2, v6, &type metadata for UInt8);
  return v9;
}

void sub_100037CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X12 }
}

uint64_t sub_100037D00(uint64_t a1, compression_algorithm a2)
{
  const uint8_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t result;
  uint64_t v6;

  result = sub_100037D68(COMPRESSION_STREAM_DECODE, a2, v2, BYTE6(v3), 0, 0xC000000000000000);
  *v4 = result;
  v4[1] = v6;
  return result;
}

uint64_t sub_100037D68(compression_stream_operation a1, compression_algorithm a2, const uint8_t *a3, int64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  const uint8_t *v14;
  uint64_t v15;
  size_t v16;
  uint8_t *v17;
  compression_status v18;
  uint64_t v19;
  unint64_t v20;
  compression_stream stream;

  if (a1 == COMPRESSION_STREAM_ENCODE || a4 >= 1)
  {
    v13 = swift_slowAlloc(40, -1);
    v14 = *(const uint8_t **)(v13 + 16);
    *(_OWORD *)&stream.dst_ptr = *(_OWORD *)v13;
    stream.src_ptr = v14;
    *(_OWORD *)&stream.src_size = *(_OWORD *)(v13 + 24);
    if (compression_stream_init(&stream, a1, a2) == COMPRESSION_STATUS_ERROR)
    {
LABEL_25:
      v12 = 0;
LABEL_26:
      swift_slowDealloc(v13, -1, -1);
      return v12;
    }
    v15 = 0x10000;
    if (a4 < 0x10000)
      v15 = a4;
    if (v15 <= 64)
      v16 = 64;
    else
      v16 = v15;
    v17 = (uint8_t *)swift_slowAlloc(v16, -1);
    stream.dst_ptr = v17;
    stream.dst_size = v16;
    stream.src_ptr = a3;
    stream.src_size = a4;
    sub_100038264(a5, a6);
    v18 = compression_stream_process(&stream, 1);
    if (v18 == COMPRESSION_STATUS_OK)
    {
      if (stream.dst_size)
      {
LABEL_23:
        v19 = a5;
        v20 = a6;
LABEL_24:
        sub_10001DDAC(v19, v20);
        swift_slowDealloc(v17, -1, -1);
        compression_stream_destroy(&stream);
        goto LABEL_25;
      }
      while (1)
      {
        if (stream.dst_ptr != v17)
          Data._Representation.append(contentsOf:)(v17);
        stream.dst_ptr = v17;
        stream.dst_size = v16;
        v18 = compression_stream_process(&stream, 1);
        if (v18)
          break;
        if (stream.dst_size)
          goto LABEL_23;
      }
    }
    if (v18 == COMPRESSION_STATUS_END)
    {
      if (stream.dst_ptr != v17)
        Data._Representation.append(contentsOf:)(v17);
      v12 = a5;
      swift_slowDealloc(v17, -1, -1);
      compression_stream_destroy(&stream);
      goto LABEL_26;
    }
    v19 = a5;
    v20 = a6;
    goto LABEL_24;
  }
  return 0;
}

BOOL static Data.CompressionAlgorithm.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void Data.CompressionAlgorithm.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int Data.CompressionAlgorithm.hashValue.getter(unsigned __int8 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

void sub_100037FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X11 }
}

uint64_t sub_100038010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const uint8_t *v3;
  uint64_t *v4;
  uint64_t result;
  uint64_t v6;

  result = sub_100037D68(COMPRESSION_STREAM_ENCODE, COMPRESSION_ZLIB, v3, BYTE6(a3), 0, 0xC000000000000000);
  *v4 = result;
  v4[1] = v6;
  return result;
}

void sub_10003807C(uint64_t a1)
{
  uint64_t v1;

  sub_100037FD8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_100038094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X11 }
}

uint64_t sub_1000380CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const uint8_t *v3;
  uint64_t *v4;
  uint64_t result;
  uint64_t v6;

  result = sub_100037D68(COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB, v3, BYTE6(a3), 0, 0xC000000000000000);
  *v4 = result;
  v4[1] = v6;
  return result;
}

void sub_100038138(uint64_t a1)
{
  uint64_t v1;

  sub_100038094(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_100038154()
{
  unint64_t result;

  result = qword_10005A0F8;
  if (!qword_10005A0F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data.CompressionAlgorithm, &type metadata for Data.CompressionAlgorithm);
    atomic_store(result, (unint64_t *)&qword_10005A0F8);
  }
  return result;
}

uint64_t _s20CompressionAlgorithmOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000381E4 + 4 * byte_100045175[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100038218 + 4 * byte_100045170[v4]))();
}

uint64_t sub_100038218(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100038220(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100038228);
  return result;
}

uint64_t sub_100038234(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10003823CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100038240(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100038248(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Data.CompressionAlgorithm()
{
  return &type metadata for Data.CompressionAlgorithm;
}

uint64_t sub_100038264(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000382A8(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = "\b";
  v2[1] = "\b";
  v2[2] = "\b";
  v2[3] = "\b";
  return swift_initClassMetadata2(a1, 0, 4, v2, a1 + 96);
}

id sub_1000382EC()
{
  return (id)sub_1000389DC();
}

void sub_10003830C(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  sub_100038354((uint64_t)a3);

}

void sub_100038354(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + qword_10005A100);
  *(_QWORD *)(v1 + qword_10005A100) = a1;

}

id sub_100038368()
{
  return (id)sub_1000389EC();
}

void sub_100038388(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  sub_1000383D0((uint64_t)a3);

}

void sub_1000383D0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + qword_10005A108);
  *(_QWORD *)(v1 + qword_10005A108) = a1;

}

id sub_1000383E4()
{
  return (id)sub_1000389FC();
}

void sub_100038404(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  sub_10003844C((uint64_t)a3);

}

void sub_10003844C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + qword_10005A110);
  *(_QWORD *)(v1 + qword_10005A110) = a1;

}

void sub_100038460(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + qword_10005A118);
  *(_QWORD *)(v1 + qword_10005A118) = a1;

}

void sub_100038474()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + qword_10005A118);
  *(_QWORD *)(v0 + qword_10005A118) = 0;

}

void sub_100038488(void *a1)
{
  id v1;

  v1 = a1;
  sub_100038474();

}

id sub_1000384BC(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v13;
  objc_class *v14;
  objc_super v16;

  v13 = swift_isaMask & *v8;
  *(_QWORD *)((char *)v8 + qword_10005A100) = 0;
  *(_QWORD *)((char *)v8 + qword_10005A108) = 0;
  *(_QWORD *)((char *)v8 + qword_10005A110) = 0;
  *(_QWORD *)((char *)v8 + qword_10005A118) = 0;
  v14 = (objc_class *)type metadata accessor for ImageCell(0, *(_QWORD *)(v13 + 80), *(_QWORD *)(v13 + 88), a8);
  v16.receiver = v8;
  v16.super_class = v14;
  return objc_msgSendSuper2(&v16, "initWithFrame:", a1, a2, a3, a4);
}

id sub_100038568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  return sub_1000384BC(a5, a6, a7, a8, a1, a2, a3, a4);
}

id sub_100038588(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  objc_class *v7;
  id v8;
  objc_super v10;

  v6 = swift_isaMask & *v4;
  *(_QWORD *)((char *)v4 + qword_10005A100) = 0;
  *(_QWORD *)((char *)v4 + qword_10005A108) = 0;
  *(_QWORD *)((char *)v4 + qword_10005A110) = 0;
  *(_QWORD *)((char *)v4 + qword_10005A118) = 0;
  v7 = (objc_class *)type metadata accessor for ImageCell(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 88), a4);
  v10.receiver = v4;
  v10.super_class = v7;
  v8 = objc_msgSendSuper2(&v10, "initWithCoder:", a1);

  return v8;
}

id sub_100038620(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return sub_100038588(v3, v4, v5, v6);
}

id sub_100038644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for ImageCell(0, *(_QWORD *)((swift_isaMask & *v4) + 0x50), *(_QWORD *)((swift_isaMask & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

void sub_100038690(uint64_t a1)
{

}

uint64_t type metadata accessor for ImageCell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100022D40(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ImageCell);
}

id sub_1000386F4(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return sub_100038810(a1, a3, a4, a5, a6, a2, type metadata accessor for FriendCell);
}

id sub_100038700(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10003888C(a1, a2, a3, type metadata accessor for FriendCell);
}

id sub_10003870C()
{
  return sub_1000388E0(type metadata accessor for FriendCell);
}

uint64_t type metadata accessor for FriendCell(uint64_t a1)
{
  return sub_10003896C(a1, qword_10005A1C8, (uint64_t)&nominal type descriptor for FriendCell);
}

uint64_t sub_100038730()
{
  return type metadata accessor for FriendCell(0);
}

id sub_100038738(uint64_t a1)
{
  return *(id *)(a1 + qword_10005A100);
}

void sub_100038748(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = *(id *)(a1 + qword_10005A100);
  *(_QWORD *)(a1 + qword_10005A100) = a3;
  v3 = a3;

}

id sub_10003877C(uint64_t a1)
{
  return *(id *)(a1 + qword_10005A108);
}

void sub_10003878C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = *(id *)(a1 + qword_10005A108);
  *(_QWORD *)(a1 + qword_10005A108) = a3;
  v3 = a3;

}

id sub_1000387C0(uint64_t a1)
{
  return *(id *)(a1 + qword_10005A110);
}

void sub_1000387D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = *(id *)(a1 + qword_10005A110);
  *(_QWORD *)(a1 + qword_10005A110) = a3;
  v3 = a3;

}

id sub_100038804(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return sub_100038810(a1, a3, a4, a5, a6, a2, type metadata accessor for GameCell);
}

id sub_100038810(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t (*a7)(_QWORD))
{
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)a7(0);
  return objc_msgSendSuper2(&v12, "initWithFrame:", a2, a3, a4, a5);
}

id sub_100038880(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10003888C(a1, a2, a3, type metadata accessor for GameCell);
}

id sub_10003888C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)a4(0);
  return objc_msgSendSuper2(&v6, "initWithCoder:", a3);
}

id sub_1000388D4()
{
  return sub_1000388E0(type metadata accessor for GameCell);
}

id sub_1000388E0(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for GameCell(uint64_t a1)
{
  return sub_10003896C(a1, qword_10005A318, (uint64_t)&nominal type descriptor for GameCell);
}

uint64_t sub_10003892C()
{
  return type metadata accessor for GameCell(0);
}

id sub_100038934(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return sub_100038810(a1, a3, a4, a5, a6, a2, type metadata accessor for PointsCell);
}

id sub_100038940(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10003888C(a1, a2, a3, type metadata accessor for PointsCell);
}

id sub_10003894C()
{
  return sub_1000388E0(type metadata accessor for PointsCell);
}

uint64_t type metadata accessor for PointsCell(uint64_t a1)
{
  return sub_10003896C(a1, qword_10005A468, (uint64_t)&nominal type descriptor for PointsCell);
}

uint64_t sub_10003896C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_1000389A0(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 256, 0, v2, a1 + 232);
}

uint64_t sub_1000389D4()
{
  return type metadata accessor for PointsCell(0);
}

uint64_t sub_1000389DC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + qword_10005A100);
}

uint64_t sub_1000389EC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + qword_10005A108);
}

uint64_t sub_1000389FC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + qword_10005A110);
}

uint64_t sub_100038A3C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v1 = type metadata accessor for MessagesViewController();
  v2 = swift_dynamicCastClass(v0, v1);
  if (v2)
  {
    v3 = v2;
    v4 = v0;
  }
  else
  {
    v5 = objc_msgSend(v0, "parentViewController");
    if (v5)
    {
      v6 = v5;
      v3 = sub_100038A3C();

    }
    else
    {
      return 0;
    }
  }
  return v3;
}

void sub_100038B18()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  char *v12;
  uint64_t v13;
  void *Strong;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  Swift::String v25;
  Swift::String v26;
  void *object;
  NSString v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  char *v33;
  double v34;
  double *v35;
  double v36;
  id v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  unint64_t v44;
  const char *v45;
  unint64_t v46;
  Swift::String v47;
  uint64_t v48;
  void *v49;
  NSString v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  Swift::String v55;
  Swift::String v56;
  void *v57;
  NSString v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  unint64_t v65;
  objc_super v66;
  Swift::String v67;
  Swift::String v68;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for ActionViewController();
  v66.receiver = v1;
  v66.super_class = v6;
  v7 = objc_msgSendSuper2(&v66, "viewDidLoad");
  v8 = static GKLog.general.getter(v7);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Friend Request Card - Local player not authenticated view loaded", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v12 = &v1[OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_actionButton];
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_actionButton], v13);
  if (!Strong)
  {
    __break(1u);
    goto LABEL_27;
  }
  v15 = Strong;
  v16 = objc_msgSend(Strong, "layer");

  objc_msgSend(v16, "setCornerRadius:", 9.0);
  v18 = (void *)swift_unknownObjectWeakLoadStrong(v12, v17);
  if (!v18)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v19 = v18;
  v20 = objc_msgSend(v18, "layer");

  objc_msgSend(v20, "setMasksToBounds:", 1);
  if (byte_100058770 == 3)
  {
    v22 = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_descriptionLabel], v21);
    if (v22)
    {
      v23 = (void *)v22;
      v24 = (id)GKGameCenterUIFrameworkBundle(v22);
      v67._object = (void *)0xE000000000000000;
      v25._object = (void *)0x80000001000435F0;
      v25._countAndFlagsBits = 0xD000000000000013;
      v26._countAndFlagsBits = 0;
      v26._object = (void *)0xE000000000000000;
      v67._countAndFlagsBits = 0;
      object = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, (Swift::String_optional)0, (NSBundle)v24, v26, v67)._object;

      v28 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      objc_msgSend(v23, "setText:", v28);

      v30 = (void *)swift_unknownObjectWeakLoadStrong(v12, v29);
      if (v30)
      {
        v31 = v30;
        objc_msgSend(v30, "setHidden:", 1);

        v32 = sub_100038A3C();
        if (v32)
        {
          v33 = (char *)v32;
          sub_100029CB4();
          v35 = (double *)&v33[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
          v36 = 240.0;
LABEL_20:
          *v35 = v36;
          *((_BYTE *)v35 + 8) = 0;
          if (v34 != v36)
            objc_msgSend(v33, "requestResize");

          goto LABEL_23;
        }
        goto LABEL_23;
      }
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  v37 = objc_msgSend((id)objc_opt_self(GKPreferences), "shared");
  if (!v37)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v38 = v37;
  v39 = objc_msgSend(v37, "lockedDown");

  v41 = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_descriptionLabel], v40);
  v42 = (void *)v41;
  if (v39)
  {
    if (!v41)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    v43 = (id)GKGameCenterUIFrameworkBundle(v41);
    v44 = 0xD00000000000001BLL;
    v65 = 0xE000000000000000;
    v45 = "ALERT_MESSAGE_LOCKDOWN_MODE";
  }
  else
  {
    if (!v41)
    {
LABEL_34:
      __break(1u);
      return;
    }
    v43 = (id)GKGameCenterUIFrameworkBundle(v41);
    v44 = 0xD000000000000024;
    v65 = 0xE000000000000000;
    v45 = "FRIEND_REQUEST_OPEN_SETTINGS_MESSAGE";
  }
  v46 = (unint64_t)(v45 - 32) | 0x8000000000000000;
  v47._countAndFlagsBits = 0;
  v47._object = (void *)0xE000000000000000;
  v48 = 0;
  v49 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v44, (Swift::String_optional)0, (NSBundle)v43, v47, *(Swift::String *)(&v65 + -8))._object;

  v50 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v49);
  objc_msgSend(v42, "setText:", v50);

  v52 = swift_unknownObjectWeakLoadStrong(v12, v51);
  if (!v52)
    goto LABEL_31;
  v53 = (void *)v52;
  v54 = (id)GKGameCenterUIFrameworkBundle(v52);
  v68._object = (void *)0xE000000000000000;
  v55._countAndFlagsBits = 0x53474E4954544553;
  v55._object = (void *)0xEF4E4F545455425FLL;
  v56._countAndFlagsBits = 0;
  v56._object = (void *)0xE000000000000000;
  v68._countAndFlagsBits = 0;
  v57 = NSLocalizedString(_:tableName:bundle:value:comment:)(v55, (Swift::String_optional)0, (NSBundle)v54, v56, v68)._object;

  v58 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v57);
  objc_msgSend(v53, "setTitle:forState:", v58, 0);

  v60 = (void *)swift_unknownObjectWeakLoadStrong(v12, v59);
  if (!v60)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v61 = v60;
  objc_msgSend(v60, "addTarget:action:forControlEvents:", v1, "openSettings", 64);

  v62 = sub_100038A3C();
  if (v62)
  {
    v33 = (char *)v62;
    sub_100029CB4();
    v35 = (double *)&v33[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController____lazy_storage___inviteCardHeight];
    v36 = 280.0;
    goto LABEL_20;
  }
LABEL_23:
  v63 = sub_100038A3C();
  if (v63)
  {
    v64 = (void *)v63;
    sub_10002972C();

  }
}

id sub_100039288()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActionViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActionViewController()
{
  return objc_opt_self(_TtC26GameCenterMessageExtension20ActionViewController);
}

void sub_100039310(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = sub_1000105F0(0, (unint64_t *)&qword_100058CE8, GKPlayer_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v7);
  swift_retain(v5);
  v9 = a3;
  v6(v8, a3);
  swift_release(v5);
  swift_bridgeObjectRelease(v8);

}

void sub_1000393A8(uint64_t a1, uint64_t a2, char a3)
{
  type metadata accessor for GKFeatureFlags(0);
  __chkstk_darwin();
  __asm { BR              X10 }
}

uint64_t sub_10003941C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t countAndFlagsBits;
  id v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v11;

  v3 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, enum case for GKFeatureFlags.NewFriendInviteMessageCard(_:), v0);
  v4 = ((uint64_t (*)(uint64_t))GKFeatureFlags.isEnabled.getter)(v3);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
  if ((v4 & 1) != 0)
  {
    ((void (*)(_QWORD))type metadata accessor for GCUILocalizedStrings)(0);
    return ((uint64_t (*)(void))static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_SENDER_SUBTITLE.getter)();
  }
  else
  {
    v7 = (id)((uint64_t (*)(uint64_t))GKGameCenterUIFrameworkBundle)(v5);
    v8._countAndFlagsBits = 0xD000000000000023;
    v11._object = (void *)0xE000000000000000;
    v8._object = (void *)0x80000001000422C0;
    v9._countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
    v11._countAndFlagsBits = 0;
    countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v11)._countAndFlagsBits;

  }
  return countAndFlagsBits;
}

uint64_t sub_1000395F4()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_1000453D0);
  v2 = swift_getKeyPath(&unk_1000453F8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100039668()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100045418);
  v2 = swift_getKeyPath(&unk_100045440);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_1000396D8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  id v58;
  NSString v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  id v95;
  char *v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  id v113[2];
  char v114;

  v15 = v14;
  v109 = a8;
  v91 = a7;
  v107 = a6;
  v89 = a5;
  v105 = a4;
  v87 = a3;
  v86 = a2;
  v95 = a1;
  v110 = a14;
  v93 = a13;
  v108 = a12;
  v90 = a11;
  v106 = a10;
  v88 = a9;
  v16 = sub_100005170(&qword_10005A848);
  __chkstk_darwin(v16);
  v102 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100005170(&qword_10005A850);
  __chkstk_darwin(v18);
  v99 = (char *)&v85 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride(0);
  v112 = *(_QWORD *)(v98 - 8);
  __chkstk_darwin(v98);
  v96 = (char *)&v85 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100005170(&qword_100059DB8);
  __chkstk_darwin(v21);
  v23 = (char *)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = type metadata accessor for NSNotificationCenter.Publisher(0);
  v94 = *(_QWORD *)(v92 - 8);
  __chkstk_darwin(v92);
  v25 = (char *)&v85 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_100005170(&qword_10005A858);
  v27 = *(_QWORD *)(v26 - 8);
  v100 = v26;
  v101 = v27;
  __chkstk_darwin(v26);
  v111 = (char *)&v85 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_100005170(&qword_10005A860);
  v30 = *(_QWORD *)(v29 - 8);
  v103 = v29;
  v104 = v30;
  __chkstk_darwin(v29);
  v97 = (char *)&v85 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_100005170(&qword_10005A840);
  v33 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v35 = (char *)&v85 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_100005170((uint64_t *)&unk_100059DD0);
  v37 = *(_QWORD *)(v36 - 8);
  __chkstk_darwin(v36);
  v39 = (char *)&v85 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__state;
  v113[0] = 0;
  v113[1] = 0;
  v114 = 9;
  Published.init(initialValue:)(v113, &type metadata for FriendInviteCardViewModel.State);
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v40, v39, v36);
  v41 = v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__isProcessingAction;
  LOBYTE(v113[0]) = 0;
  Published.init(initialValue:)(v113, &type metadata for Bool);
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v41, v35, v32);
  v42 = OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel;
  *(_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel) = 0;
  *(_BYTE *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_isViewRecordSent) = 0;
  *(_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_refreshObserver) = 0;
  v43 = *(void **)(v15 + v42);
  v44 = v95;
  *(_QWORD *)(v15 + v42) = v95;
  v95 = v44;

  v45 = v86;
  *(_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation) = v86;
  v46 = (_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile);
  v47 = v105;
  *v46 = v87;
  v46[1] = v47;
  v48 = (_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentFriendsList);
  v50 = v106;
  v49 = v107;
  *v48 = v89;
  v48[1] = v49;
  v51 = (_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onAcceptInvite);
  v52 = v108;
  v53 = v109;
  *v51 = v91;
  v51[1] = v53;
  v54 = (_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
  *v54 = v88;
  v54[1] = v50;
  v55 = (_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onMessageUrlCreated);
  *v55 = v90;
  v55[1] = v52;
  v56 = (_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay);
  v57 = v110;
  *v56 = v93;
  v56[1] = v57;
  v93 = v45;
  swift_retain(v47);
  swift_retain(v49);
  swift_retain(v53);
  swift_retain(v50);
  swift_retain(v52);
  swift_retain(v57);
  sub_10003CE00();
  v58 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v59 = String._bridgeToObjectiveC()();
  NSNotificationCenter.publisher(for:object:)(v59, 0);

  v60 = sub_1000105F0(0, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr);
  v113[0] = (id)static OS_dispatch_queue.main.getter();
  v61 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v23, 1, 1, v61);
  v62 = sub_10000FFE4(&qword_10005A868, (uint64_t (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher, (uint64_t)&protocol conformance descriptor for NSNotificationCenter.Publisher);
  v63 = sub_10003F904((unint64_t *)&qword_100059DE8, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue);
  v64 = v92;
  Publisher.receive<A>(on:options:)(v113, v23, v92, v60, v62, v63);
  sub_10000527C((uint64_t)v23, &qword_100059DB8);

  v65 = (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v25, v64);
  v66 = v96;
  NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)(v65, 0.1);
  v67 = v98;
  v68 = v99;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v112 + 56))(v99, 1, 1, v98);
  v113[0] = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  v69 = type metadata accessor for NSRunLoop.SchedulerOptions(0);
  v70 = (uint64_t)v102;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v102, 1, 1, v69);
  v71 = sub_1000105F0(0, &qword_10005A870, NSRunLoop_ptr);
  v72 = sub_1000056BC(&qword_10005A878, &qword_10005A858, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  v73 = sub_10003F904(&qword_10005A880, &qword_10005A870, NSRunLoop_ptr, (uint64_t)&protocol conformance descriptor for NSRunLoop);
  v74 = v97;
  v75 = (uint64_t)v68;
  v76 = v68;
  v77 = v100;
  v78 = v111;
  Publisher.delay<A>(for:tolerance:scheduler:options:)(v66, v76, v113, v70, v100, v71, v72, v73);
  sub_10000527C(v70, &qword_10005A848);

  sub_10000527C(v75, &qword_10005A850);
  (*(void (**)(char *, uint64_t))(v112 + 8))(v66, v67);
  (*(void (**)(char *, uint64_t))(v101 + 8))(v78, v77);
  v79 = swift_allocObject(&unk_100053BF0, 24, 7);
  swift_weakInit(v79 + 16, v15);
  v80 = sub_1000056BC(&qword_10005A888, &qword_10005A860, (uint64_t)&protocol conformance descriptor for Publishers.Delay<A, B>);
  v81 = v103;
  v82 = Publisher<>.sink(receiveValue:)(sub_10003F968, v79, v103, v80);

  swift_release(v105);
  swift_release(v107);
  swift_release(v109);
  swift_release(v106);
  swift_release(v108);
  swift_release(v110);
  swift_release(v79);
  (*(void (**)(char *, uint64_t))(v104 + 8))(v74, v81);
  v83 = *(_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_refreshObserver);
  *(_QWORD *)(v15 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_refreshObserver) = v82;
  swift_release(v83);
  return v15;
}

uint64_t sub_100039EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  result = swift_weakLoadStrong(v2);
  if (result)
  {
    v4 = result;
    sub_10003CE00();
    return swift_release(v4);
  }
  return result;
}

void sub_100039F34()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSString v8;
  NSString v9;
  NSString v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  NSString v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  uint64_t v16;
  id v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  uint64_t v21;
  id v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  void (*v26)(uint64_t, void *, uint64_t, void *);
  id v27;
  Swift::String v28;
  Swift::String v29;
  Swift::String v30;
  uint64_t v31;
  id v32;
  Swift::String v33;
  Swift::String v34;
  Swift::String v35;
  id v36;
  NSString v37;
  NSString v38;
  NSString v39;
  uint64_t v40;
  uint64_t v41;
  NSString v42;
  uint64_t KeyPath;
  uint64_t v44;
  void *v45;
  id v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  _BOOL4 v53;
  void *v54;
  id v55;
  NSString v56;
  char v57;
  Swift::String v58;
  Swift::String v59;
  Swift::String v60;
  Swift::String v61;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(GKReachability), "_gkIsOnline");
  if ((_DWORD)v2)
  {
    v3 = objc_msgSend((id)objc_opt_self(GKPreferences), "shared");
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, "isAddingFriendsRestricted");

      if ((v5 & 1) != 0)
      {
        v6 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
        objc_msgSend(v6, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestRestrictedError);

        v7 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
        v8 = String._bridgeToObjectiveC()();
        v9 = String._bridgeToObjectiveC()();
        v10 = String._bridgeToObjectiveC()();
        sub_10003C7E4();
        v12 = v11;
        v13 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v12);
        v14 = String._bridgeToObjectiveC()();
        objc_msgSend(v7, "recordClickWithAction:targetId:targetType:pageId:pageType:", v8, v9, v10, v13, v14);

        v15 = *(void (**)(uint64_t, void *, uint64_t, void *))(v1
                                                                      + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
        v17 = (id)GKGameCenterUIFrameworkBundle(v16);
        v58._object = (void *)0xE000000000000000;
        v18._countAndFlagsBits = 0x525F444E45495246;
        v18._object = (void *)0xEE00545345555145;
        v19._countAndFlagsBits = 0;
        v19._object = (void *)0xE000000000000000;
        v58._countAndFlagsBits = 0;
        v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v58);

        v22 = (id)GKGameCenterUIFrameworkBundle(v21);
        v23._countAndFlagsBits = 0xD000000000000027;
        v59._object = (void *)0xE000000000000000;
        v23._object = (void *)0x8000000100042330;
        v24._countAndFlagsBits = 0;
        v24._object = (void *)0xE000000000000000;
        v59._countAndFlagsBits = 0;
        v25 = NSLocalizedString(_:tableName:bundle:value:comment:)(v23, (Swift::String_optional)0, (NSBundle)v22, v24, v59);

        v15(v20._countAndFlagsBits, v20._object, v25._countAndFlagsBits, v25._object);
        swift_bridgeObjectRelease(v20._object);
        swift_bridgeObjectRelease(v25._object);
      }
      else
      {
        KeyPath = swift_getKeyPath(&unk_100045418);
        v44 = swift_getKeyPath(&unk_100045440);
        v57 = 1;
        swift_retain(v1);
        static Published.subscript.setter(&v57, v1, KeyPath, v44);
        v45 = *(void **)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation);
        v46 = objc_msgSend(v45, "recipientAddresses");
        v47 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v46, &type metadata for String);

        if (v47[2])
        {
          v48 = v47[4];
          v49 = v47[5];
          swift_bridgeObjectRetain(v49);
          swift_bridgeObjectRelease(v47);
          v50 = objc_msgSend(v45, "recipientAddresses");
          v51 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v50, &type metadata for String);

          v52 = *(_QWORD *)(v51 + 16);
          swift_bridgeObjectRelease(v51);
          v53 = v52 > 1;
        }
        else
        {
          swift_bridgeObjectRelease(v47);
          v48 = 0;
          v49 = 0;
          v53 = 0;
        }
        v54 = *(void **)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel);
        if (v54)
        {
          swift_retain(v1);
          v55 = v54;
          sub_100013E2C(v48, v49, v53, sub_10003F8F0, v1);

          swift_release(v1);
        }
        swift_bridgeObjectRelease(v49);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v26 = *(void (**)(uint64_t, void *, uint64_t, void *))(v0
                                                                  + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
    v27 = (id)GKGameCenterUIFrameworkBundle(v2);
    v28._countAndFlagsBits = 0xD000000000000016;
    v60._object = (void *)0xE000000000000000;
    v28._object = (void *)0x80000001000422F0;
    v29._countAndFlagsBits = 0;
    v29._object = (void *)0xE000000000000000;
    v60._countAndFlagsBits = 0;
    v30 = NSLocalizedString(_:tableName:bundle:value:comment:)(v28, (Swift::String_optional)0, (NSBundle)v27, v29, v60);

    v32 = (id)GKGameCenterUIFrameworkBundle(v31);
    v33._countAndFlagsBits = 0xD000000000000018;
    v61._object = (void *)0xE000000000000000;
    v33._object = (void *)0x80000001000420F0;
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    v61._countAndFlagsBits = 0;
    v35 = NSLocalizedString(_:tableName:bundle:value:comment:)(v33, (Swift::String_optional)0, (NSBundle)v32, v34, v61);

    v26(v30._countAndFlagsBits, v30._object, v35._countAndFlagsBits, v35._object);
    swift_bridgeObjectRelease(v30._object);
    swift_bridgeObjectRelease(v35._object);
    v36 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
    v37 = String._bridgeToObjectiveC()();
    v38 = String._bridgeToObjectiveC()();
    v39 = String._bridgeToObjectiveC()();
    sub_10003C7E4();
    v41 = v40;
    v42 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v41);
    v56 = String._bridgeToObjectiveC()();
    objc_msgSend(v36, "recordClickWithAction:targetId:targetType:pageId:pageType:", v37, v38, v39, v42, v56);

  }
}

void sub_10003A51C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  id v13;
  id v14;
  NSString v15;
  NSString v16;
  NSString v17;
  uint64_t v18;
  uint64_t v19;
  NSString v20;
  NSString v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  NSString v34;
  NSString v35;
  NSString v36;
  uint64_t v37;
  uint64_t v38;
  NSString v39;
  NSString v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, void *, uint64_t, void *);
  id v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;
  uint64_t v58;
  id v59;
  Swift::String v60;
  Swift::String v61;
  Swift::String v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t aBlock[5];
  uint64_t v71;
  Swift::String v72;
  Swift::String v73;

  v4 = type metadata accessor for Logger(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v66 - v8;
  v68 = v10;
  if (a1)
  {
    v67 = v4;
    KeyPath = swift_getKeyPath(&unk_100045418);
    v12 = swift_getKeyPath(&unk_100045440);
    LOBYTE(aBlock[0]) = 0;
    swift_retain(a2);
    static Published.subscript.setter(aBlock, a2, KeyPath, v12);
    v13 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
    objc_msgSend(v13, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestExpiredError);

    v14 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
    v15 = String._bridgeToObjectiveC()();
    v16 = String._bridgeToObjectiveC()();
    v17 = String._bridgeToObjectiveC()();
    sub_10003C7E4();
    v19 = v18;
    v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    v21 = String._bridgeToObjectiveC()();
    objc_msgSend(v14, "recordClickWithAction:targetId:targetType:pageId:pageType:", v15, v16, v17, v20, v21);

    static GKLog.general.getter(v22);
    swift_errorRetain(a1);
    v23 = swift_errorRetain(a1);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v69 = a1;
      aBlock[0] = v27;
      *(_DWORD *)v26 = 136315138;
      swift_errorRetain(a1);
      v28 = sub_100005170((uint64_t *)&unk_1000591C0);
      v29 = String.init<A>(describing:)(&v69, v28);
      v31 = v30;
      v69 = sub_10003EE08(v29, v30, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, aBlock);
      swift_bridgeObjectRelease(v31);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "acceptButtonPressed - acceptFriendRequest error: %s", v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }

    v52 = (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v7, v67);
    v53 = *(void (**)(uint64_t, void *, uint64_t, void *))(a2
                                                                  + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
    v54 = (id)GKGameCenterUIFrameworkBundle(v52);
    v72._object = (void *)0xE000000000000000;
    v55._countAndFlagsBits = 0x525F444E45495246;
    v55._object = (void *)0xEE00545345555145;
    v56._countAndFlagsBits = 0;
    v56._object = (void *)0xE000000000000000;
    v72._countAndFlagsBits = 0;
    v57 = NSLocalizedString(_:tableName:bundle:value:comment:)(v55, (Swift::String_optional)0, (NSBundle)v54, v56, v72);

    v59 = (id)GKGameCenterUIFrameworkBundle(v58);
    v60._countAndFlagsBits = 0xD000000000000024;
    v73._object = (void *)0xE000000000000000;
    v60._object = (void *)0x8000000100042140;
    v61._countAndFlagsBits = 0;
    v61._object = (void *)0xE000000000000000;
    v73._countAndFlagsBits = 0;
    v62 = NSLocalizedString(_:tableName:bundle:value:comment:)(v60, (Swift::String_optional)0, (NSBundle)v59, v61, v73);

    v53(v57._countAndFlagsBits, v57._object, v62._countAndFlagsBits, v62._object);
    swift_bridgeObjectRelease(v57._object);
    swift_bridgeObjectRelease(v62._object);
  }
  else
  {
    v32 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
    objc_msgSend(v32, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestAccepted);

    v33 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
    v34 = String._bridgeToObjectiveC()();
    v35 = String._bridgeToObjectiveC()();
    v36 = String._bridgeToObjectiveC()();
    sub_10003C7E4();
    v38 = v37;
    v39 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v38);
    v40 = String._bridgeToObjectiveC()();
    objc_msgSend(v33, "recordClickWithAction:targetId:targetType:pageId:pageType:", v34, v35, v36, v39, v40);

    static GKLog.friending.getter(v41);
    v42 = swift_retain_n(a2, 2);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(12, -1);
      v46 = swift_slowAlloc(32, -1);
      v69 = a2;
      aBlock[0] = v46;
      *(_DWORD *)v45 = 136315138;
      v47 = type metadata accessor for FriendInviteCardViewModel(0);
      v67 = v4;
      v48 = v47;
      swift_retain(a2);
      v49 = String.init<A>(describing:)(&v69, v48);
      v51 = v50;
      v69 = sub_10003EE08(v49, v50, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, aBlock);
      swift_release_n(a2, 2);
      swift_bridgeObjectRelease(v51);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s acceptButtonPressed - acceptFriendRequest succeed", v45, 0xCu);
      swift_arrayDestroy(v46, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1, -1);
      swift_slowDealloc(v45, -1, -1);

      (*(void (**)(char *, uint64_t))(v68 + 8))(v9, v67);
    }
    else
    {

      swift_release_n(a2, 2);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v9, v4);
    }
    v63 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
    aBlock[4] = (uint64_t)sub_10003F8F8;
    v71 = a2;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100039310;
    aBlock[3] = (uint64_t)&unk_100053B90;
    v64 = _Block_copy(aBlock);
    v65 = v71;
    swift_retain(a2);
    swift_release(v65);
    objc_msgSend(v63, "loadFriendsAsPlayersWithCompletionHandler:", v64);
    _Block_release(v64);

  }
}

uint64_t sub_10003AC9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[5];
  uint64_t v28;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation), "recipientAddresses");
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, &type metadata for String);

  v14 = *(_QWORD *)(v13 + 16);
  v15 = swift_bridgeObjectRelease(v13);
  if (v14 == 1)
    return (*(uint64_t (**)(uint64_t))(a3
                                              + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onAcceptInvite))(v15);
  sub_1000105F0(0, (unint64_t *)&qword_100058CC0, OS_dispatch_queue_ptr);
  v17 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_10003F900;
  v28 = a3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013AF4;
  aBlock[3] = &unk_100053BB8;
  v18 = _Block_copy(aBlock);
  v26 = v5;
  v19 = v18;
  v20 = v28;
  swift_retain(a3);
  v21 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v21);
  aBlock[0] = _swiftEmptyArrayStorage;
  v22 = sub_10000FFE4((unint64_t *)&unk_100059E10, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v23 = sub_100005170((uint64_t *)&unk_100058CD0);
  v24 = sub_1000056BC((unint64_t *)&qword_100059E20, (uint64_t *)&unk_100058CD0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v23, v24, v4, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_10003AEFC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t KeyPath;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t, void *);
  id v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  uint64_t v14;
  id v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  id v19;
  NSString v20;
  NSString v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  NSString v25;
  void *v26;
  id v27;
  NSString v28;
  char v29;
  Swift::String v30;
  Swift::String v31;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(GKReachability), "_gkIsOnline");
  if ((_DWORD)v2)
  {
    KeyPath = swift_getKeyPath(&unk_100045418);
    v4 = swift_getKeyPath(&unk_100045440);
    v29 = 1;
    swift_retain(v1);
    static Published.subscript.setter(&v29, v1, KeyPath, v4);
    v5 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation), "recipientAddresses");
    v6 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for String);

    if (v6[2])
    {
      v7 = v6[4];
      v8 = v6[5];
      swift_bridgeObjectRetain(v8);
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    swift_bridgeObjectRelease(v6);
    v26 = *(void **)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel);
    if (v26)
    {
      swift_retain(v1);
      v27 = v26;
      sub_100014404(v7, v8, (void (*)(_QWORD))sub_10003F8E8, v1);

      swift_release(v1);
    }
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9 = *(void (**)(uint64_t, void *, uint64_t, void *))(v0
                                                                 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
    v10 = (id)GKGameCenterUIFrameworkBundle(v2);
    v11._countAndFlagsBits = 0xD000000000000016;
    v30._object = (void *)0xE000000000000000;
    v11._object = (void *)0x80000001000422F0;
    v12._countAndFlagsBits = 0;
    v12._object = (void *)0xE000000000000000;
    v30._countAndFlagsBits = 0;
    v13 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v10, v12, v30);

    v15 = (id)GKGameCenterUIFrameworkBundle(v14);
    v16._countAndFlagsBits = 0xD000000000000018;
    v31._object = (void *)0xE000000000000000;
    v16._object = (void *)0x80000001000420F0;
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    v31._countAndFlagsBits = 0;
    v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v31);

    v9(v13._countAndFlagsBits, v13._object, v18._countAndFlagsBits, v18._object);
    swift_bridgeObjectRelease(v13._object);
    swift_bridgeObjectRelease(v18._object);
    v19 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
    v20 = String._bridgeToObjectiveC()();
    v21 = String._bridgeToObjectiveC()();
    v22 = String._bridgeToObjectiveC()();
    sub_10003C7E4();
    v24 = v23;
    v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    v28 = String._bridgeToObjectiveC()();
    objc_msgSend(v19, "recordClickWithAction:targetId:targetType:pageId:pageType:", v20, v21, v22, v25, v28);

  }
}

uint64_t sub_10003B228(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  NSString v14;
  NSString v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  NSString v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  NSString v37;
  NSString v38;
  NSString v39;
  uint64_t v40;
  uint64_t v41;
  NSString v42;
  NSString v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void (*v56)(uint64_t, void *, uint64_t, void *);
  id v57;
  Swift::String v58;
  Swift::String v59;
  Swift::String v60;
  uint64_t v61;
  id v62;
  Swift::String v63;
  Swift::String v64;
  Swift::String v65;
  uint64_t KeyPath;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  Swift::String v72;
  Swift::String v73;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v68 - v9;
  v11 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  v12 = v11;
  if (a1)
  {
    v69 = v5;
    objc_msgSend(v11, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestExpiredError);

    v13 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
    v14 = String._bridgeToObjectiveC()();
    v15 = String._bridgeToObjectiveC()();
    v16 = String._bridgeToObjectiveC()();
    sub_10003C7E4();
    v18 = v17;
    v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v18);
    v20 = String._bridgeToObjectiveC()();
    objc_msgSend(v13, "recordClickWithAction:targetId:targetType:pageId:pageType:", v14, v15, v16, v19, v20);

    static GKLog.general.getter(v21);
    swift_retain(a2);
    swift_errorRetain(a1);
    swift_retain(a2);
    v22 = swift_errorRetain(a1);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc(22, -1);
      v26 = swift_slowAlloc(64, -1);
      v70 = a2;
      v71 = v26;
      *(_DWORD *)v25 = 136315394;
      v27 = type metadata accessor for FriendInviteCardViewModel(0);
      swift_retain(a2);
      v68 = v4;
      v28 = String.init<A>(describing:)(&v70, v27);
      v30 = v29;
      v70 = sub_10003EE08(v28, v29, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71);
      swift_release_n(a2, 2);
      swift_bridgeObjectRelease(v30);
      *(_WORD *)(v25 + 12) = 2080;
      v70 = a1;
      swift_errorRetain(a1);
      v31 = sub_100005170((uint64_t *)&unk_1000591C0);
      v32 = String.init<A>(describing:)(&v70, v31);
      v34 = v33;
      v70 = sub_10003EE08(v32, v33, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71);
      swift_bridgeObjectRelease(v34);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s ignoreAction - ignoreFriendRequest error: %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy(v26, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);

      v35 = (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v8, v68);
    }
    else
    {
      swift_release_n(a2, 2);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

      v35 = (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v8, v4);
    }
    v56 = *(void (**)(uint64_t, void *, uint64_t, void *))(a2
                                                                  + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert);
    v57 = (id)GKGameCenterUIFrameworkBundle(v35);
    v72._object = (void *)0xE000000000000000;
    v58._countAndFlagsBits = 0x525F444E45495246;
    v58._object = (void *)0xEE00545345555145;
    v59._countAndFlagsBits = 0;
    v59._object = (void *)0xE000000000000000;
    v72._countAndFlagsBits = 0;
    v60 = NSLocalizedString(_:tableName:bundle:value:comment:)(v58, (Swift::String_optional)0, (NSBundle)v57, v59, v72);

    v62 = (id)GKGameCenterUIFrameworkBundle(v61);
    v63._countAndFlagsBits = 0xD000000000000024;
    v73._object = (void *)0xE000000000000000;
    v63._object = (void *)0x8000000100042140;
    v64._countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    v73._countAndFlagsBits = 0;
    v65 = NSLocalizedString(_:tableName:bundle:value:comment:)(v63, (Swift::String_optional)0, (NSBundle)v62, v64, v73);

    v56(v60._countAndFlagsBits, v60._object, v65._countAndFlagsBits, v65._object);
    swift_bridgeObjectRelease(v60._object);
    swift_bridgeObjectRelease(v65._object);
    KeyPath = swift_getKeyPath(&unk_100045418);
    v67 = swift_getKeyPath(&unk_100045440);
    LOBYTE(v71) = 0;
    swift_retain(a2);
    return static Published.subscript.setter(&v71, a2, KeyPath, v67);
  }
  else
  {
    objc_msgSend(v11, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestAccepted);

    v36 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
    v37 = String._bridgeToObjectiveC()();
    v38 = String._bridgeToObjectiveC()();
    v39 = String._bridgeToObjectiveC()();
    sub_10003C7E4();
    v41 = v40;
    v42 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v41);
    v43 = String._bridgeToObjectiveC()();
    objc_msgSend(v36, "recordClickWithAction:targetId:targetType:pageId:pageType:", v37, v38, v39, v42, v43);

    static GKLog.friending.getter(v44);
    v45 = swift_retain_n(a2, 2);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(12, -1);
      v49 = swift_slowAlloc(32, -1);
      v70 = a2;
      v71 = v49;
      *(_DWORD *)v48 = 136315138;
      v50 = type metadata accessor for FriendInviteCardViewModel(0);
      v69 = v5;
      v51 = v50;
      swift_retain(a2);
      v68 = v4;
      v52 = String.init<A>(describing:)(&v70, v51);
      v54 = v53;
      v70 = sub_10003EE08(v52, v53, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71);
      swift_release_n(a2, 2);
      swift_bridgeObjectRelease(v54);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "%s ignoreAction - ignoreFriendRequest succeed", v48, 0xCu);
      swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v48, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v10, v68);
    }
    else
    {

      swift_release_n(a2, 2);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
  }
}

void sub_10003B97C()
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
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  NSString v18;
  NSString v19;
  NSString v20;
  uint64_t v21;
  uint64_t v22;
  NSString v23;
  NSString v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v4);
  v7 = swift_retain_n(v1, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(12, -1);
    v26 = v2;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc(32, -1);
    v27 = v1;
    v28 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = type metadata accessor for FriendInviteCardViewModel(0);
    swift_retain(v1);
    v14 = String.init<A>(describing:)(&v27, v13);
    v16 = v15;
    v27 = sub_10003EE08(v14, v15, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s retry", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v26);
  }
  else
  {

    swift_release_n(v1, 2);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  v17 = objc_msgSend(objc_allocWithZone((Class)GKAPIReporter), "init");
  v18 = String._bridgeToObjectiveC()();
  v19 = String._bridgeToObjectiveC()();
  v20 = String._bridgeToObjectiveC()();
  sub_10003C7E4();
  v22 = v21;
  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  v24 = String._bridgeToObjectiveC()();
  objc_msgSend(v17, "recordClickWithAction:targetId:targetType:pageId:pageType:", v18, v19, v20, v23, v24);

  sub_10003CE00();
}

uint64_t sub_10003BC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t KeyPath;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;

  v3 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v8);
  v11 = swift_retain_n(v3, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v31 = v6;
    v14 = swift_slowAlloc(12, -1);
    v32 = a1;
    v15 = (uint8_t *)v14;
    v16 = (void *)swift_slowAlloc(32, -1);
    v34 = v3;
    v35 = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = type metadata accessor for FriendInviteCardViewModel(0);
    v33 = a2;
    v18 = v17;
    swift_retain(v3);
    v19 = String.init<A>(describing:)(&v34, v18);
    v21 = v20;
    v34 = sub_10003EE08(v19, v20, (uint64_t *)&v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35);
    swift_release_n(v3, 2);
    v22 = v21;
    a2 = v33;
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s present profile", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    v23 = v15;
    a1 = v32;
    swift_slowDealloc(v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v31);
  }
  else
  {

    swift_release_n(v3, 2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  KeyPath = swift_getKeyPath(&unk_1000453D0);
  v25 = swift_getKeyPath(&unk_1000453F8);
  static Published.subscript.getter(&v35, v3, KeyPath, v25);
  swift_release(KeyPath);
  swift_release(v25);
  if (((1 << v37) & 0x178) != 0)
  {
    sub_100032D68(v35, v36, v37);
    goto LABEL_8;
  }
  if (((1 << v37) & 7) == 0)
  {
LABEL_8:
    v27 = swift_getKeyPath(&unk_1000453D0);
    v28 = swift_getKeyPath(&unk_1000453F8);
    static Published.subscript.getter(&v35, v3, v27, v28);
    swift_release(v27);
    swift_release(v28);
    __asm { BR              X9 }
  }
  sub_100032D68(v35, v36, v37);
  v26 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  objc_msgSend(v26, "reportEvent:type:", GKReporterDomainImprovedFriendingUIInteractions, GKSenderTappedViewPlayerProfileButton);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3
                                                     + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile))(a1, a2);
}

void sub_10003BFA0(void *a1, void *a2)
{
  sub_100032D68(a1, a2, 0);
  JUMPOUT(0x10003BF64);
}

void sub_10003BFAC(void *a1, void *a2)
{
  sub_100032D68(a1, a2, 1u);
  JUMPOUT(0x10003BF64);
}

void sub_10003BFB8(void *a1, void *a2)
{
  sub_100032D68(a1, a2, 2u);
  JUMPOUT(0x10003BF64);
}

void sub_10003BFC4(void *a1, void *a2)
{
  sub_100032D68(a1, a2, 8u);
  JUMPOUT(0x10003BF64);
}

uint64_t sub_10003BFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v8);
  v11 = swift_retain_n(v3, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v27 = v6;
    v14 = swift_slowAlloc(12, -1);
    v28 = a1;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v30 = v3;
    v31 = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = type metadata accessor for FriendInviteCardViewModel(0);
    v29 = a2;
    v18 = v17;
    swift_retain(v3);
    v19 = String.init<A>(describing:)(&v30, v18);
    v21 = v20;
    v30 = sub_10003EE08(v19, v20, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
    swift_release_n(v3, 2);
    v22 = v21;
    a2 = v29;
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s present friend profile", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    v23 = v15;
    a1 = v28;
    swift_slowDealloc(v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v27);
  }
  else
  {

    swift_release_n(v3, 2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v24 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  objc_msgSend(v24, "reportEvent:type:", GKReporterDomainImprovedFriendingUIInteractions, GKViewFriendProfileButtonTapped);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3
                                                     + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile))(a1, a2);
}

uint64_t sub_10003C224()
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
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v4);
  v7 = swift_retain_n(v1, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(12, -1);
    v20 = v2;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc(32, -1);
    v21 = v1;
    v22 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = type metadata accessor for FriendInviteCardViewModel(0);
    swift_retain(v1);
    v14 = String.init<A>(describing:)(&v21, v13);
    v16 = v15;
    v21 = sub_10003EE08(v14, v15, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s present friend list", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v20);
  }
  else
  {

    swift_release_n(v1, 2);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  v17 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  objc_msgSend(v17, "reportEvent:type:", GKReporterDomainImprovedFriendingUIInteractions, GKViewFriendListButtonTapped);

  return (*(uint64_t (**)(void))(v1
                              + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentFriendsList))();
}

_QWORD *sub_10003C458(void *a1)
{
  id v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  Swift::String v32;
  Swift::String v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;

  v2 = objc_msgSend(a1, "internal");
  v3 = objc_msgSend(v2, "friendsVisibility");

  if (v3)
    return _swiftEmptyArrayStorage;
  v5 = sub_100005170(&qword_10005A898);
  v4 = swift_allocObject(v5, 104, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100045460;
  v6 = objc_msgSend(a1, "stats");
  v7 = v41;
  v8 = (id)GKGameCenterUIFrameworkBundle(v6);
  v9._countAndFlagsBits = 0xD00000000000001CLL;
  v44._object = (void *)0xE000000000000000;
  v9._object = (void *)0x8000000100042060;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v44._countAndFlagsBits = 0;
  v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, (Swift::String_optional)0, (NSBundle)v8, v10, v44);

  v12 = sub_100005170(&qword_100058C70);
  v13 = swift_allocObject(v12, 72, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100044020;
  objc_msgSend(a1, "stats");
  v14 = v41;
  *(_QWORD *)(v13 + 56) = &type metadata for Int;
  *(_QWORD *)(v13 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v13 + 32) = v14;
  v15 = String.init(format:_:)(v11._countAndFlagsBits, v11._object, v13);
  v17 = v16;
  swift_bridgeObjectRelease(v11._object);
  *(_QWORD *)(v4 + 32) = v7;
  *(_QWORD *)(v4 + 40) = v15;
  *(_QWORD *)(v4 + 48) = v17;
  v18 = objc_msgSend(a1, "stats");
  v19 = v43;
  v20 = (id)GKGameCenterUIFrameworkBundle(v18);
  v21._countAndFlagsBits = 0xD000000000000018;
  v45._object = (void *)0xE000000000000000;
  v21._object = (void *)0x8000000100042080;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v45._countAndFlagsBits = 0;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v45);

  v24 = swift_allocObject(v12, 72, 7);
  *(_OWORD *)(v24 + 16) = xmmword_100044020;
  objc_msgSend(a1, "stats");
  v25 = v43;
  *(_QWORD *)(v24 + 56) = &type metadata for Int;
  *(_QWORD *)(v24 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v24 + 32) = v25;
  v26 = String.init(format:_:)(v23._countAndFlagsBits, v23._object, v24);
  v28 = v27;
  swift_bridgeObjectRelease(v23._object);
  *(_QWORD *)(v4 + 56) = v19;
  *(_QWORD *)(v4 + 64) = v26;
  *(_QWORD *)(v4 + 72) = v28;
  v29 = objc_msgSend(a1, "stats");
  v30 = v42;
  v31 = (id)GKGameCenterUIFrameworkBundle(v29);
  v46._object = (void *)0xE000000000000000;
  v32._object = (void *)0x80000001000420A0;
  v32._countAndFlagsBits = 0xD000000000000011;
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  v46._countAndFlagsBits = 0;
  v34 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, (Swift::String_optional)0, (NSBundle)v31, v33, v46);

  v35 = swift_allocObject(v12, 72, 7);
  *(_OWORD *)(v35 + 16) = xmmword_100044020;
  objc_msgSend(a1, "stats");
  v36 = v42;
  *(_QWORD *)(v35 + 56) = &type metadata for Int;
  *(_QWORD *)(v35 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v35 + 32) = v36;
  v37 = String.init(format:_:)(v34._countAndFlagsBits, v34._object, v35);
  v39 = v38;
  swift_bridgeObjectRelease(v34._object);
  *(_QWORD *)(v4 + 80) = v30;
  *(_QWORD *)(v4 + 88) = v37;
  *(_QWORD *)(v4 + 96) = v39;
  return (_QWORD *)v4;
}

uint64_t sub_10003C7A4(uint64_t a1, uint64_t a2)
{
  return sub_10003BC3C(a1, a2);
}

uint64_t sub_10003C7C4(uint64_t a1, uint64_t a2)
{
  return sub_10003BFD0(a1, a2);
}

void sub_10003C7E4()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;

  KeyPath = swift_getKeyPath(&unk_1000453D0);
  v2 = swift_getKeyPath(&unk_1000453F8);
  static Published.subscript.getter(&v3, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  __asm { BR              X9 }
}

uint64_t sub_10003C888(void *a1, void *a2, unsigned __int8 a3)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;

  sub_100032D68(a1, a2, a3);
  v4 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation), "recipientAddresses");
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for String);

  v6 = *(_QWORD *)(v5 + 16);
  swift_bridgeObjectRelease(v5);
  v7 = v6 > 1;
  if (v6 <= 1)
    v8 = 0x7564697669646E69;
  else
    v8 = 0x70756F7267;
  if (v7)
    v9 = (void *)0xE500000000000000;
  else
    v9 = (void *)0xEA00000000006C61;
  v10._countAndFlagsBits = 95;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  v11._countAndFlagsBits = v8;
  v11._object = v9;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v9);
  return 0x6E65697069636572;
}

uint64_t sub_10003C994()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[24];

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v4);
  v7 = swift_retain_n(v1, 4);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(22, -1);
    v25 = v2;
    v11 = v10;
    v12 = swift_slowAlloc(64, -1);
    v26 = v12;
    v27 = v1;
    *(_DWORD *)v11 = 136315394;
    v13 = type metadata accessor for FriendInviteCardViewModel(0);
    swift_retain(v1);
    v14 = String.init<A>(describing:)(&v27, v13);
    v16 = v15;
    v27 = sub_10003EE08(v14, v15, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v16);
    *(_WORD *)(v11 + 12) = 2080;
    KeyPath = swift_getKeyPath(&unk_1000453D0);
    v18 = swift_getKeyPath(&unk_1000453F8);
    static Published.subscript.getter(&v27, v1, KeyPath, v18);
    swift_release(KeyPath);
    swift_release(v18);
    v19 = String.init<A>(describing:)(&v27, &type metadata for FriendInviteCardViewModel.State);
    v21 = v20;
    v27 = sub_10003EE08(v19, v20, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s state is set to %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(v12, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v25);
  }
  else
  {

    swift_release_n(v1, 4);
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_isViewRecordSent) & 1) == 0)
  {
    v23 = swift_getKeyPath(&unk_1000453D0);
    v24 = swift_getKeyPath(&unk_1000453F8);
    static Published.subscript.getter(&v27, v1, v23, v24);
    swift_release(v23);
    swift_release(v24);
    __asm { BR              X9 }
  }
  return result;
}

void sub_10003CDCC(void *a1, void *a2)
{
  sub_100032D68(a1, a2, 8u);
  JUMPOUT(0x10003CDACLL);
}

void sub_10003CE00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t);
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t KeyPath;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48[2];
  char v49;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v45 - v8;
  static GKLog.friending.getter(v7);
  v10 = swift_retain_n(v1, 2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v46 = v2;
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v45 = v6;
    v15 = v14;
    v47 = v1;
    v48[0] = v14;
    *(_DWORD *)v13 = 136315138;
    v16 = type metadata accessor for FriendInviteCardViewModel(0);
    swift_retain(v1);
    v17 = String.init<A>(describing:)(&v47, v16);
    v19 = v18;
    v47 = sub_10003EE08(v17, v18, v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, v48);
    swift_release_n(v1, 2);
    v20 = v19;
    v2 = v46;
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s loadState", v13, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    v21 = v15;
    v6 = v45;
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v13, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
  v22 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  v23 = v22(v9, v2);
  v24 = *(char **)(v1 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_playerModel);
  if (v24)
  {
    v25 = *(_QWORD *)&v24[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8];
    if (v25
      && ((v25 & 0x2000000000000000) != 0
        ? (v26 = HIBYTE(v25) & 0xF)
        : (v26 = *(_QWORD *)&v24[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode] & 0xFFFFFFFFFFFFLL),
          v26))
    {
      v27 = swift_allocObject(&unk_100053AD8, 32, 7);
      *(_QWORD *)(v27 + 16) = v1;
      *(_QWORD *)(v27 + 24) = v24;
      v28 = v24;
      swift_retain(v1);
      v29 = v28;
      sub_1000135F8((uint64_t)sub_10003F86C, v27);

      swift_release(v27);
    }
    else
    {
      v30 = v24;
      sub_10003DE38(v30);

    }
  }
  else
  {
    static GKLog.friending.getter(v23);
    v31 = swift_retain_n(v1, 2);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      v35 = swift_slowAlloc(32, -1);
      v47 = v1;
      v48[0] = v35;
      v45 = v6;
      v46 = v2;
      *(_DWORD *)v34 = 136315138;
      v36 = type metadata accessor for FriendInviteCardViewModel(0);
      swift_retain(v1);
      v37 = String.init<A>(describing:)(&v47, v36);
      v39 = v38;
      v47 = sub_10003EE08(v37, v38, v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, v48);
      swift_release_n(v1, 2);
      swift_bridgeObjectRelease(v39);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s expected a playerModel", v34, 0xCu);
      swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v34, -1, -1);

      v40 = v45;
      v41 = v46;
    }
    else
    {

      swift_release_n(v1, 2);
      v40 = v6;
      v41 = v2;
    }
    v22(v40, v41);
    KeyPath = swift_getKeyPath(&unk_1000453D0);
    v43 = swift_getKeyPath(&unk_1000453F8);
    v48[0] = 0;
    v48[1] = 0;
    v49 = 7;
    swift_retain(v1);
    static Published.subscript.setter(v48, v1, KeyPath, v43);
    v44 = sub_10003C994();
    (*(void (**)(uint64_t))(v1
                                    + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay))(v44);
  }
}

uint64_t sub_10003D260(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  unsigned __int8 *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unsigned __int8 *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[2];
  char v40;
  uint64_t v41;
  _BYTE v42[16];

  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v12 = (void *)objc_opt_self(GKPlayer);
    v13 = a1;
    v14 = objc_msgSend(v12, "unknownPlayer");
    sub_1000105F0(0, (unint64_t *)&qword_100058CE8, GKPlayer_ptr);
    v15 = static NSObject.== infix(_:_:)(v13, v14);

    if ((v15 & 1) == 0)
      __asm { BR              X10 }

  }
  static GKLog.friending.getter(v9);
  swift_retain_n(a3, 2);
  v16 = a4;
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc(22, -1);
    v35 = (_QWORD *)swift_slowAlloc(8, -1);
    v36 = swift_slowAlloc(32, -1);
    v39[0] = v36;
    *(_DWORD *)v19 = 136315394;
    v41 = a3;
    v20 = type metadata accessor for FriendInviteCardViewModel(0);
    v38 = v7;
    v21 = v20;
    swift_retain(a3);
    v37 = v8;
    v22 = String.init<A>(describing:)(&v41, v21);
    v24 = v23;
    v41 = sub_10003EE08(v22, v23, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, v42);
    swift_release_n(a3, 2);
    swift_bridgeObjectRelease(v24);
    *(_WORD *)(v19 + 12) = 2112;
    v41 = (uint64_t)v16;
    v25 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, v42);
    v26 = v35;
    *v35 = v16;

    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s Could not find a valid player using playerModel: %@", (uint8_t *)v19, 0x16u);
    v27 = sub_100005170((uint64_t *)&unk_100058CB0);
    swift_arrayDestroy(v26, 1, v27);
    swift_slowDealloc(v26, -1, -1);
    v28 = v36;
    swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v38);
  }
  else
  {

    swift_release_n(a3, 2);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  v29 = v16[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType];
  KeyPath = swift_getKeyPath(&unk_1000453D0);
  v31 = swift_getKeyPath(&unk_1000453F8);
  v39[0] = v29;
  v39[1] = 0;
  v40 = 7;
  swift_retain(a3);
  static Published.subscript.setter(v39, a3, KeyPath, v31);
  v32 = sub_10003C994();
  return (*(uint64_t (**)(uint64_t))(a3
                                            + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay))(v32);
}

void sub_10003D6C0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  id v20;
  char *v21;

  v5 = (uint64_t *)&v3[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount];
  if ((v3[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCodeUsageCount + 8] & 1) == 0)
  {
    v6 = *v5;
    if (*v5 >= 1)
    {
      v7 = v2;
      v8 = *(void **)(v2 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_conversation);
      v9 = v0;
      v10 = objc_msgSend(v8, "recipientAddresses");
      v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, &type metadata for String);

      v12 = *(_QWORD *)(v11 + 16);
      swift_bridgeObjectRelease(v11);
      if (v12 >= 2)
      {
        KeyPath = swift_getKeyPath(&unk_1000453D0);
        v14 = swift_getKeyPath(&unk_1000453F8);
        *(_QWORD *)(v4 - 152) = v1;
        *(_QWORD *)(v4 - 144) = v6;
        *(_BYTE *)(v4 - 136) = 2;
        v15 = v9;
        swift_retain(v7);
        static Published.subscript.setter(v4 - 152, v7, KeyPath, v14);
        sub_10003C994();

        JUMPOUT(0x10003D6A0);
      }
      v16 = objc_msgSend((id)objc_opt_self(GKLocalPlayer), "local");
      v17 = (_QWORD *)swift_allocObject(&unk_100053B50, 40, 7);
      v17[2] = v3;
      v17[3] = v7;
      v17[4] = v9;
      *(_QWORD *)(v4 - 120) = sub_10003F8D4;
      *(_QWORD *)(v4 - 112) = v17;
      *(_QWORD *)(v4 - 152) = _NSConcreteStackBlock;
      *(_QWORD *)(v4 - 144) = 1107296256;
      *(_QWORD *)(v4 - 136) = sub_100039310;
      *(_QWORD *)(v4 - 128) = &unk_100053B68;
      v18 = _Block_copy((const void *)(v4 - 152));
      v19 = *(_QWORD *)(v4 - 112);
      v20 = v9;
      swift_retain(v7);
      v21 = v3;
      swift_release(v19);
      objc_msgSend(v16, "loadFriendsAsPlayersWithCompletionHandler:", v18);

      _Block_release(v18);
      JUMPOUT(0x10003D69CLL);
    }
  }
  swift_getKeyPath(&unk_1000453D0);
  swift_getKeyPath(&unk_1000453F8);
  *(_QWORD *)(v4 - 152) = v1;
  *(_QWORD *)(v4 - 144) = 0;
  *(_BYTE *)(v4 - 136) = 0;
  JUMPOUT(0x10003D668);
}

void sub_10003DB98(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSString v17;
  uint64_t KeyPath;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[2];
  char v23;

  v8 = a3;
  swift_bridgeObjectRetain(a1);
  v10 = (uint64_t)sub_100010070(v9, (uint64_t)v8);
  swift_bridgeObjectRelease(a1);

  if (!((unint64_t)v10 >> 62))
  {
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease(v10);
    v14 = *(void **)&v8[OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendPlayer];
    if (v14)
    {
      v12 = v14;
    }
    else
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(GKUnknownPlayerID);
      v16 = v15;
      v17 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v16);
      v12 = objc_msgSend((id)objc_opt_self(GKPlayer), "playerFromPlayerID:", v17);

    }
    goto LABEL_14;
  }
  if (v10 < 0)
    v13 = v10;
  else
    v13 = v10 & 0xFFFFFFFFFFFFFF8;
  if (!_CocoaArrayWrapper.endIndex.getter(v13))
    goto LABEL_11;
LABEL_3:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v10);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(v10 + 32);
LABEL_6:
    v12 = v11;
    swift_bridgeObjectRelease(v10);
LABEL_14:
    KeyPath = swift_getKeyPath(&unk_1000453D0);
    v19 = swift_getKeyPath(&unk_1000453F8);
    v22[0] = a5;
    v22[1] = v12;
    v23 = 1;
    v20 = a5;
    v21 = v12;
    swift_retain(a4);
    static Published.subscript.setter(v22, a4, KeyPath, v19);
    sub_10003C994();

    return;
  }
  __break(1u);
}

uint64_t sub_10003DD3C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  char v14;
  id v15;
  uint64_t v17;
  _QWORD v18[2];
  char v19;

  v8 = a3;
  swift_bridgeObjectRetain(a1);
  v10 = (uint64_t)sub_1000102B4(v9, v8);
  swift_bridgeObjectRelease(a1);

  if ((unint64_t)v10 >> 62)
  {
    if (v10 < 0)
      v17 = v10;
    else
      v17 = v10 & 0xFFFFFFFFFFFFFF8;
    v11 = _CocoaArrayWrapper.endIndex.getter(v17);
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v10);
  KeyPath = swift_getKeyPath(&unk_1000453D0);
  v13 = swift_getKeyPath(&unk_1000453F8);
  v18[0] = a5;
  v18[1] = 0;
  if (v11 < 1)
    v14 = 3;
  else
    v14 = 4;
  v19 = v14;
  v15 = a5;
  swift_retain(a4);
  static Published.subscript.setter(v18, a4, KeyPath, v13);
  return sub_10003C994();
}

uint64_t sub_10003DE38(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint8_t *v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  char v30;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static GKLog.friending.getter(v6);
  v9 = swift_retain_n(v2, 2);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v26 = v4;
    v12 = swift_slowAlloc(12, -1);
    v27 = a1;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc(32, -1);
    v28 = v2;
    *(_QWORD *)&v29 = v14;
    *(_DWORD *)v13 = 136315138;
    v15 = type metadata accessor for FriendInviteCardViewModel(0);
    swift_retain(v2);
    v16 = String.init<A>(describing:)(&v28, v15);
    v18 = v17;
    v28 = sub_10003EE08(v16, v17, (uint64_t *)&v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29);
    swift_release_n(v2, 2);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s creating friend request", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    v19 = v13;
    a1 = v27;
    swift_slowDealloc(v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v26);
  }
  else
  {

    swift_release_n(v2, 2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  KeyPath = swift_getKeyPath(&unk_1000453D0);
  v21 = swift_getKeyPath(&unk_1000453F8);
  v29 = xmmword_100045470;
  v30 = 9;
  swift_retain(v2);
  static Published.subscript.setter(&v29, v2, KeyPath, v21);
  v22 = sub_10003C994();
  (*(void (**)(uint64_t))(v2
                                  + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay))(v22);
  swift_retain(v2);
  v23 = a1;
  sub_100019E44(v23, v23, v2);

  return swift_release(v2);
}

uint64_t sub_10003E0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t KeyPath;
  uint64_t v35;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55[2];
  char v56;

  v6 = type metadata accessor for Logger(0);
  v53 = *(_QWORD *)(v6 - 8);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v50 - v10;
  v12 = sub_100005170(&qword_100058CE0);
  __chkstk_darwin(v12);
  v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for URL(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = a2;
  if (a1 || !*(_QWORD *)(a2 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendCode + 8))
  {
LABEL_2:
    static GKLog.friending.getter(v17);
    swift_retain(a3);
    swift_errorRetain(a1);
    swift_retain(a3);
    v20 = swift_errorRetain(a1);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc(22, -1);
      v24 = swift_slowAlloc(64, -1);
      v54 = a3;
      v55[0] = v24;
      *(_DWORD *)v23 = 136315394;
      v25 = type metadata accessor for FriendInviteCardViewModel(0);
      swift_retain(a3);
      v51 = v6;
      v26 = String.init<A>(describing:)(&v54, v25);
      v28 = v27;
      v54 = sub_10003EE08(v26, v27, v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55);
      swift_release_n(a3, 2);
      swift_bridgeObjectRelease(v28);
      *(_WORD *)(v23 + 12) = 2080;
      v54 = a1;
      v29 = sub_100005170((uint64_t *)&unk_1000591C0);
      v30 = Optional.nonNilDescription.getter(v29);
      v32 = v31;
      v54 = sub_10003EE08(v30, v31, v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55);
      swift_bridgeObjectRelease(v32);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s failed to create friend request with %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy(v24, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v51);
    }
    else
    {
      swift_release_n(a3, 2);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

      (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v6);
    }
    v33 = *(unsigned __int8 *)(v52 + OBJC_IVAR____TtC26GameCenterMessageExtension11PlayerModel_friendRequestErrorType);
    KeyPath = swift_getKeyPath(&unk_1000453D0);
    v35 = swift_getKeyPath(&unk_1000453F8);
    v55[0] = v33;
    v55[1] = 0;
    v56 = 7;
    swift_retain(a3);
    static Published.subscript.setter(v55, a3, KeyPath, v35);
    return sub_10003C994();
  }
  sub_100013B20(1, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    v17 = sub_10000527C((uint64_t)v14, &qword_100058CE0);
    goto LABEL_2;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v14, v15);
  v37 = objc_msgSend(objc_allocWithZone((Class)GKReporter), "init");
  objc_msgSend(v37, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestCreated);

  static GKLog.friending.getter(v38);
  v39 = swift_retain_n(a3, 2);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = swift_slowAlloc(12, -1);
    v51 = v6;
    v43 = (uint8_t *)v42;
    v52 = swift_slowAlloc(32, -1);
    v54 = a3;
    v55[0] = v52;
    *(_DWORD *)v43 = 136315138;
    v50 = v43 + 4;
    v44 = type metadata accessor for FriendInviteCardViewModel(0);
    swift_retain(a3);
    v45 = String.init<A>(describing:)(&v54, v44);
    v47 = v46;
    v54 = sub_10003EE08(v45, v46, v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55);
    swift_release_n(a3, 2);
    swift_bridgeObjectRelease(v47);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "%s friend request created", v43, 0xCu);
    v48 = v52;
    swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1, -1);
    swift_slowDealloc(v43, -1, -1);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v11, v51);
  }
  else
  {

    swift_release_n(a3, 2);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v11, v6);
  }
  v49 = (*(uint64_t (**)(char *))(a3
                                          + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onMessageUrlCreated))(v19);
  sub_10003CE00(v49);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
}

uint64_t sub_10003E670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__state;
  v2 = sub_100005170((uint64_t *)&unk_100059DD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel__isProcessingAction;
  v4 = sub_100005170(&qword_10005A840);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentProfile
                          + 8));
  swift_release(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentFriendsList
                          + 8));
  swift_release(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onAcceptInvite
                          + 8));
  swift_release(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onPresentAlert
                          + 8));
  swift_release(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onMessageUrlCreated
                          + 8));
  swift_release(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_onReadyForDisplay
                          + 8));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC26GameCenterMessageExtension25FriendInviteCardViewModel_refreshObserver));
  return v0;
}

uint64_t sub_10003E78C()
{
  uint64_t v0;

  sub_10003E670();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10003E7B0()
{
  return type metadata accessor for FriendInviteCardViewModel(0);
}

uint64_t type metadata accessor for FriendInviteCardViewModel(uint64_t a1)
{
  uint64_t result;

  result = qword_10005A648;
  if (!qword_10005A648)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FriendInviteCardViewModel);
  return result;
}

void sub_10003E7F4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[12];

  sub_10003E8D4(319, &qword_10005A658, (uint64_t)&type metadata for FriendInviteCardViewModel.State);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10003E8D4(319, (unint64_t *)&unk_10005A660, (uint64_t)&type metadata for Bool);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = "\b";
      v6[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
      v6[4] = (char *)&value witness table for () + 64;
      v6[5] = (char *)&value witness table for () + 64;
      v6[6] = (char *)&value witness table for () + 64;
      v6[7] = (char *)&value witness table for () + 64;
      v6[8] = (char *)&value witness table for () + 64;
      v6[9] = (char *)&value witness table for () + 64;
      v6[10] = &unk_100045378;
      v6[11] = "\b";
      swift_updateClassMetadata2(a1, 256, 12, v6, a1 + 80);
    }
  }
}

void sub_10003E8D4(uint64_t a1, unint64_t *a2, uint64_t a3)
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

void destroy for FriendInviteCardViewModel.State(uint64_t a1)
{
  sub_100032D68(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s26GameCenterMessageExtension25FriendInviteCardViewModelC5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1000302C8(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FriendInviteCardViewModel.State(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1000302C8(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100032D68(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for FriendInviteCardViewModel.State(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FriendInviteCardViewModel.State(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_100032D68(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendInviteCardViewModel.State(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF7 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 247);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 9)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendInviteCardViewModel.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF6)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 247;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF7)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF7)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_10003EAAC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 8u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 9);
}

uint64_t sub_10003EAC4(uint64_t result, unsigned int a2)
{
  if (a2 >= 9)
  {
    *(_QWORD *)result = a2 - 9;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 9;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FriendInviteCardViewModel.State()
{
  return &type metadata for FriendInviteCardViewModel.State;
}

void *sub_10003EAEC()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10003EAF8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for FriendInviteCardViewModel(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

double sub_10003EB34@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v6;
  double result;
  __int128 v8;
  char v9;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000453D0);
  v5 = swift_getKeyPath(&unk_1000453F8);
  static Published.subscript.getter(&v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  v6 = v9;
  result = *(double *)&v8;
  *(_OWORD *)a2 = v8;
  *(_BYTE *)(a2 + 16) = v6;
  return result;
}

uint64_t sub_10003EBBC(uint64_t a1, uint64_t *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t KeyPath;
  uint64_t v7;
  _QWORD v9[2];
  unsigned __int8 v10;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 8);
  v4 = *a2;
  v5 = *(_BYTE *)(a1 + 16);
  KeyPath = swift_getKeyPath(&unk_1000453D0);
  v7 = swift_getKeyPath(&unk_1000453F8);
  v9[0] = v2;
  v9[1] = v3;
  v10 = v5;
  sub_1000302C8(v2, v3, v5);
  swift_retain(v4);
  static Published.subscript.setter(v9, v4, KeyPath, v7);
  return sub_10003C994();
}

uint64_t sub_10003EC58@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100045418);
  v5 = swift_getKeyPath(&unk_100045440);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10003ECD4(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100045418);
  v5 = swift_getKeyPath(&unk_100045440);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10003ED44(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10003ED54(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_10003ED88(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_10003ED98(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = sub_10003EE08(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_10003EE08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10003EED8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100013540((uint64_t)v12, *a3);
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
      sub_100013540((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10001DDF0(v12);
  return v7;
}

uint64_t sub_10003EED8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10003F090(a5, a6);
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

uint64_t sub_10003F090(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10003F124(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10003F374(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10003F374(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10003F124(uint64_t a1, unint64_t a2)
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
      v5 = sub_10003F298(v4, 0);
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

_QWORD *sub_10003F298(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005170(&qword_10005A838);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10003F2FC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t sub_10003F374(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005170(&qword_10005A838);
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

uint64_t sub_10003F4C0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10003F4F8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10003F4DC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10003F660(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_10003F4F8(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005170(&qword_1000591B0);
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
    v11 = (char *)_swiftEmptyArrayStorage;
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
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10003F660(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100005170(&qword_10005A890);
  v11 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for URLQueryItem(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10003F840()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003F86C(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10003D260(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_10003F878(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10003DD3C(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_10003F884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003F894(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10003F8A0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10003F8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10003DB98(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_10003F8E8(uint64_t a1)
{
  uint64_t v1;

  return sub_10003B228(a1, v1);
}

void sub_10003F8F0(uint64_t a1)
{
  uint64_t v1;

  sub_10003A51C(a1, v1);
}

uint64_t sub_10003F8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10003AC9C(a1, a2, v2);
}

uint64_t sub_10003F904(unint64_t *a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_1000105F0(255, a2, a3);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10003F944()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003F968(uint64_t a1)
{
  uint64_t v1;

  return sub_100039EE0(a1, v1);
}

uint64_t sub_10003F988()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC26GameCenterMessageExtensionP33_FAD4B0AF53283B940986CD78AE34E63919ResourceBundleClass);
}
