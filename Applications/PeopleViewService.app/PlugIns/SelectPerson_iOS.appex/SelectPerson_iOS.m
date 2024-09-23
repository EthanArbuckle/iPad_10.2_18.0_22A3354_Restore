id sub_100003114()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t ObjectType;
  uint64_t v20;
  uint64_t v21;

  v0 = type metadata accessor for ContactFormatter.Style(0);
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for ContactFormatter(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v20 - v9;
  type metadata accessor for ContactFetcher(0);
  v11 = ContactFetcher.__allocating_init()();
  type metadata accessor for WidgetCenter(0);
  v12 = static WidgetCenter.shared.getter();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for ContactFormatter.Style.fullName(_:), v0);
  v13 = String.localized.getter(0x656D614E206F4ELL, 0xE700000000000000);
  ContactFormatter.init(style:fallback:)(v3, v13, v14);
  type metadata accessor for VerticalTextHelper(0);
  v15 = static VerticalTextHelper.shared.getter();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v16 = sub_100005708(v11, v12, (uint64_t)v8, v15);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  v17 = v21;
  ObjectType = swift_getObjectType(v21);
  swift_deallocPartialClassInstance(v17, ObjectType, 176, 7);
  return v16;
}

uint64_t sub_1000032F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  char *v6;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
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
  _QWORD *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  void (*v53)(uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  char *v63;

  v6 = v5;
  v10 = objc_msgSend(a1, "people");
  v62 = a5;
  v63 = v5;
  v60 = a4;
  if (!v10)
  {
    v23 = 0;
    goto LABEL_41;
  }
  v11 = v10;
  v59 = a2;
  v12 = type metadata accessor for PersonType(0);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0)
      v24 = v13;
    else
      v24 = v13 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v13);
    result = _CocoaArrayWrapper.endIndex.getter(v24);
    v14 = result;
    if (!result)
      goto LABEL_19;
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v13);
    if (!v14)
      goto LABEL_19;
  }
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_52;
  }
  for (i = 0; i != v14; ++i)
  {
    if ((v13 & 0xC000000000000001) != 0)
      v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v13);
    else
      v18 = *(id *)(v13 + 8 * i + 32);
    v19 = v18;
    v20 = objc_msgSend(v18, "identifier");
    if (v20)
    {
      v17 = v20;

    }
    else
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v21 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v21);
      v22 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v21, v19);
      specialized ContiguousArray._endMutation()(v22);
    }
  }
LABEL_19:
  swift_bridgeObjectRelease(v13);
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0
    || ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
  {
    v57 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
    v23 = _CocoaArrayWrapper.endIndex.getter(v57);
    swift_release(_swiftEmptyArrayStorage);
  }
  else
  {
    v23 = _swiftEmptyArrayStorage[2];
  }
  swift_release(_swiftEmptyArrayStorage);
  if (!((unint64_t)v13 >> 62))
  {
    v25 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v25)
      goto LABEL_24;
LABEL_40:
    swift_bridgeObjectRelease(v13);
    v6 = v63;
    a4 = v60;
    goto LABEL_41;
  }
  if (v13 < 0)
    v37 = v13;
  else
    v37 = v13 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v13);
  v25 = _CocoaArrayWrapper.endIndex.getter(v37);
  swift_bridgeObjectRelease(v13);
  if (!v25)
    goto LABEL_40;
LABEL_24:
  result = sub_1000054F0(0, v25 & ~(v25 >> 63), 0);
  if ((v25 & 0x8000000000000000) == 0)
  {
    v58 = v23;
    v26 = 0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
        v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v26, v13);
      else
        v27 = *(id *)(v13 + 8 * v26 + 32);
      v28 = v27;
      v29 = objc_msgSend(v27, "identifier");
      if (v29)
      {
        v30 = v29;
        v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v33 = v32;

      }
      else
      {

        v31 = 0;
        v33 = 0xE000000000000000;
      }
      v35 = _swiftEmptyArrayStorage[2];
      v34 = _swiftEmptyArrayStorage[3];
      if (v35 >= v34 >> 1)
        sub_1000054F0(v34 > 1, v35 + 1, 1);
      ++v26;
      _swiftEmptyArrayStorage[2] = v35 + 1;
      v36 = &_swiftEmptyArrayStorage[2 * v35];
      v36[4] = v31;
      v36[5] = v33;
    }
    while (v25 != v26);
    swift_bridgeObjectRelease(v13);
    v6 = v63;
    a2 = v59;
    a4 = v60;
    v23 = v58;
LABEL_41:
    v38 = swift_allocObject(&unk_1000085A0, 17, 7);
    *(_BYTE *)(v38 + 16) = v23 < static PeopleConstants.noneOptionMaxCount.getter();
    v39 = swift_allocObject(&unk_1000085C8, 24, 7);
    *(_QWORD *)(v39 + 16) = _swiftEmptyArrayStorage;
    v40 = OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts;
    v41 = *(_QWORD *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts];
    if ((unint64_t)v41 >> 62)
    {
      if (v41 < 0)
        v55 = *(_QWORD *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts];
      else
        v55 = v41 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts]);
      v56 = _CocoaArrayWrapper.endIndex.getter(v55);
      swift_bridgeObjectRelease(v41);
      if (v56)
        goto LABEL_44;
    }
    else if (*(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_44:
      v46 = *(_QWORD *)&v6[v40];
      *(_QWORD *)(v39 + 16) = v46;
      swift_bridgeObjectRetain(v46);
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      v47 = (_QWORD *)swift_allocObject(&unk_1000085F0, 80, 7);
      v47[2] = _swiftEmptyArrayStorage;
      v47[3] = v6;
      v47[4] = a2;
      v47[5] = a3;
      v47[6] = v38;
      v47[7] = v39;
      v47[8] = a4;
      v47[9] = v62;
      v48 = swift_allocObject(&unk_100008618, 24, 7);
      *(_QWORD *)(v48 + 16) = _swiftEmptyArrayStorage;
      v49 = &v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter];
      v50 = *(_QWORD *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter + 24];
      v51 = *(_QWORD *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter + 32];
      sub_100004C98(v49, v50);
      v52 = (_QWORD *)swift_allocObject(&unk_100008640, 40, 7);
      v52[2] = v48;
      v52[3] = sub_100004D3C;
      v52[4] = v47;
      v53 = *(void (**)(uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v51 + 8);
      swift_bridgeObjectRetain(a3);
      swift_retain(v38);
      swift_retain(v39);
      swift_retain(v62);
      swift_retain(v48);
      swift_retain(v47);
      v54 = v63;
      v53(sub_100004D98, v52, v50, v51);
      swift_release(v38);
      swift_release(v39);
      swift_release(v47);
      swift_release(v48);
      return swift_release(v52);
    }
    v42 = *(_QWORD *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 24];
    v43 = *(_QWORD *)&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 32];
    sub_100004C98(&v6[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher], v42);
    a4 = v60;
    v44 = dispatch thunk of ContactFetcherProtocol.allContacts(limit:)(0, 1, v42, v43);
    v45 = *(_QWORD *)&v6[v40];
    *(_QWORD *)&v6[v40] = v44;
    swift_bridgeObjectRelease(v45);
    goto LABEL_44;
  }
LABEL_52:
  __break(1u);
  return result;
}

void sub_100003850(char *a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(id, _QWORD))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  NSString v74;
  uint64_t v75;
  Class isa;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  NSString v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  Class v89;
  _BYTE *v90;
  char *v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  NSString v97;
  Class v98;
  id v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  id v105;
  id v106;
  id v107;
  Class v108;
  id v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  id v117;
  id v118;
  Class v119;
  id v120;
  uint64_t v121;
  __int128 v127;
  uint64_t v128;
  _BYTE *v129;
  id v130;
  uint64_t v131;
  char v132[24];
  char v133[24];
  char v134[24];
  uint64_t v135;
  _QWORD v136[3];
  char v137[24];
  uint64_t v138;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  *(_QWORD *)&v127 = a3;
  v13 = a1;
  v129 = *(_BYTE **)(a2 + 16);
  if (!v129)
  {
    swift_bridgeObjectRetain(a1);
LABEL_60:
    v48 = (_BYTE *)(v10 + 16);
    v49 = (uint64_t *)(a7 + 16);
    v50 = *(_QWORD *)(v127 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 24);
    v51 = *(_QWORD *)(v127 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 32);
    sub_100004C98((_QWORD *)(v127 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher), v50);
    v52 = static PeopleConstants.maxContactSuggestions.getter();
    swift_bridgeObjectRetain(v13);
    v8 = dispatch thunk of ContactFetcherProtocol.recommendedContacts(maxSuggestions:excludeContactIdentifiers:)(v52, v13, v50, v51);
    swift_bridgeObjectRelease(v13);
    v138 = v8;
    v129 = v48;
    if (v11)
    {
      swift_beginAccess(v48, v134, 1, 0);
      *v48 = 0;
      v53 = swift_bridgeObjectRetain(v8);
      v54 = static SimpleContactFilter.phraseMatching(for:with:)(v53, v12, v11);
      swift_bridgeObjectRelease_n(v8, 2);
      v138 = v54;
      swift_beginAccess(v49, v133, 0, 0);
      v55 = *v49;
      v56 = swift_bridgeObjectRetain(*v49);
      v57 = static SimpleContactFilter.phraseMatching(for:with:)(v56, v12, v11);
      swift_bridgeObjectRelease(v55);
      swift_beginAccess(v49, v132, 1, 0);
      v58 = *v49;
      *v49 = v57;
      swift_bridgeObjectRelease(v58);
      v8 = v54;
    }
    swift_beginAccess(v49, v137, 0, 0);
    v59 = *v49;
    v60 = swift_bridgeObjectRetain(v59);
    v61 = static PeopleConstants.maxDisplayedWidgetContacts.getter(v60);
    v62 = sub_100005A9C(v61, v59);
    v64 = v63;
    v66 = v65;
    v68 = v67;
    swift_bridgeObjectRelease(v59);
    v12 = (char *)(id)v127;
    sub_100005C34(v62, v64, v66, v68, &v138);
    v70 = v69;
    swift_unknownObjectRelease(v62);

    String.localized.getter(7105601, 0xE300000000000000);
    v72 = v71;
    v73 = objc_allocWithZone((Class)INObjectSection);
    v74 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v72);
    v75 = type metadata accessor for PersonType(0);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v70);
    v130 = objc_msgSend(v73, "initWithTitle:items:", v74, isa);

    v17 = sub_100005674(&qword_10000C750);
    v77 = swift_allocObject(v17, 40, 7);
    v127 = xmmword_1000070E0;
    *(_OWORD *)(v77 + 16) = xmmword_1000070E0;
    v78 = static PeopleConstants.noneOptionDisplayString.getter();
    v80 = v79;
    String.localized.getter(v78, v79);
    v82 = v81;
    swift_bridgeObjectRelease(v80);
    v83 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v75));
    v84 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v82);
    v85 = objc_msgSend(v83, "initWithIdentifier:displayString:", 0, v84);

    *(_QWORD *)(v77 + 32) = v85;
    v136[0] = v77;
    specialized Array._endMutation()(v86);
    v87 = v136[0];
    v88 = objc_allocWithZone((Class)INObjectSection);
    v89 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v87);
    v9 = (char *)objc_msgSend(v88, "initWithTitle:items:", 0, v89);

    if ((unint64_t)v8 >> 62)
    {
LABEL_79:
      if (v8 < 0)
        v111 = v8;
      else
        v111 = v8 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v8);
      v112 = _CocoaArrayWrapper.endIndex.getter(v111);
      swift_bridgeObjectRelease(v8);
      v90 = v129;
      if (v112)
        goto LABEL_64;
    }
    else
    {
      v90 = v129;
      if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_64:
        v91 = v12;
        v92 = swift_bridgeObjectRetain(v8);
        v93 = sub_100005874(v92);
        swift_bridgeObjectRelease(v13);
        swift_bridgeObjectRelease(v8);

        String.localized.getter(0x6E656D6D6F636552, 0xEF736E6F69746164);
        v95 = v94;
        v96 = objc_allocWithZone((Class)INObjectSection);
        v97 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v95);
        v98 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v93);
        v99 = objc_msgSend(v96, "initWithTitle:items:", v97, v98);

        swift_beginAccess(v90, v136, 0, 0);
        if (*v90 == 1)
        {
          v100 = swift_allocObject(v17, 56, 7);
          *(_OWORD *)(v100 + 16) = xmmword_100007100;
          *(_QWORD *)(v100 + 32) = v9;
          *(_QWORD *)(v100 + 40) = v99;
          v101 = v130;
          *(_QWORD *)(v100 + 48) = v130;
          v135 = v100;
          specialized Array._endMutation()(v100);
          v102 = v135;
          v103 = v9;
        }
        else
        {
          v104 = swift_allocObject(v17, 48, 7);
          *(_OWORD *)(v104 + 16) = xmmword_1000070F0;
          v101 = v130;
          *(_QWORD *)(v104 + 32) = v99;
          *(_QWORD *)(v104 + 40) = v130;
          v135 = v104;
          specialized Array._endMutation()(v104);
          v102 = v135;
        }
        v105 = objc_allocWithZone((Class)INObjectCollection);
        v106 = v101;
        v107 = v99;
        sub_100005674(&qword_10000C758);
        v108 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v102);
        v109 = objc_msgSend(v105, "initWithSections:", v108);

        v110 = v109;
        a8(v109, 0);
        swift_bridgeObjectRelease(v8);

        goto LABEL_87;
      }
    }
    swift_bridgeObjectRelease(v13);
    swift_beginAccess(v90, v136, 0, 0);
    if (*v90 == 1)
    {
      v113 = swift_allocObject(v17, 48, 7);
      *(_OWORD *)(v113 + 16) = xmmword_1000070F0;
      v101 = v130;
      *(_QWORD *)(v113 + 32) = v9;
      *(_QWORD *)(v113 + 40) = v130;
      v135 = v113;
      specialized Array._endMutation()(v113);
      v114 = v135;
      v115 = v9;
    }
    else
    {
      v116 = swift_allocObject(v17, 40, 7);
      *(_OWORD *)(v116 + 16) = v127;
      v101 = v130;
      *(_QWORD *)(v116 + 32) = v130;
      v135 = v116;
      specialized Array._endMutation()(v116);
      v114 = v135;
    }
    v117 = objc_allocWithZone((Class)INObjectCollection);
    v118 = v101;
    sub_100005674(&qword_10000C758);
    v119 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v114);
    v120 = objc_msgSend(v117, "initWithSections:", v119);

    v110 = v120;
    a8(v120, 0);
    swift_bridgeObjectRelease(v8);
LABEL_87:

    return;
  }
  v128 = a2 + 32;
  swift_bridgeObjectRetain(a1);
  v121 = a2;
  swift_bridgeObjectRetain(a2);
  v15 = 0;
  while (1)
  {
    v16 = (_QWORD *)(v128 + 16 * (_QWORD)v15);
    v17 = v16[1];
    v18 = *((_QWORD *)v13 + 2);
    if (!v18)
    {
      swift_bridgeObjectRetain(v16[1]);
      v23 = 0;
      v24 = 0;
      goto LABEL_18;
    }
    v19 = *v16;
    v20 = *((_QWORD *)v13 + 4);
    v21 = *((_QWORD *)v13 + 5);
    v22 = v20 == *v16 && v21 == v17;
    if (v22 || (_stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, *v16, v16[1], 0) & 1) != 0)
    {
      v23 = 0;
    }
    else
    {
      if (v18 == 1)
      {
        v24 = *((_QWORD *)v13 + 2);
        swift_bridgeObjectRetain(v17);
        if (!v24)
          goto LABEL_73;
        v23 = 1;
        goto LABEL_18;
      }
      v43 = (uint64_t *)(v13 + 56);
      v23 = 1;
      while (1)
      {
        v44 = *(v43 - 1);
        v45 = *v43;
        v46 = v44 == v19 && v45 == v17;
        if (v46 || (_stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, v19, v17, 0) & 1) != 0)
          break;
        v47 = v23 + 1;
        if (__OFADD__(v23, 1))
          goto LABEL_76;
        v43 += 2;
        ++v23;
        if (v47 == v18)
        {
          v130 = v15;
          v23 = v18;
          goto LABEL_13;
        }
      }
    }
    v8 = v23 + 1;
    if (__OFADD__(v23, 1))
      goto LABEL_77;
    v130 = v15;
    if (v8 != v18)
    {
      swift_bridgeObjectRetain(v17);
      v31 = 16 * v23;
      v9 = (char *)(v23 + 1);
      while ((v8 & 0x8000000000000000) == 0)
      {
        v12 = (char *)*((_QWORD *)v13 + 2);
        if (v9 >= v12)
          goto LABEL_69;
        v34 = &v13[v31];
        v35 = *(_QWORD *)&v13[v31 + 48];
        v36 = *(_QWORD *)&v13[v31 + 56];
        v37 = v35 == v19 && v36 == v17;
        if (!v37 && (_stringCompareWithSmolCheck(_:_:expecting:)(v35, v36, v19, v17, 0) & 1) == 0)
        {
          if (v9 != (char *)v23)
          {
            if (v23 >= (unint64_t)v12)
              goto LABEL_71;
            v38 = &v13[16 * v23 + 32];
            v39 = *((_QWORD *)v38 + 1);
            v131 = *(_QWORD *)v38;
            v12 = (char *)*((_QWORD *)v34 + 6);
            v40 = *((_QWORD *)v34 + 7);
            swift_bridgeObjectRetain(v39);
            swift_bridgeObjectRetain(v40);
            if ((swift_isUniquelyReferenced_nonNull_native(v13) & 1) == 0)
              v13 = sub_1000056F4((uint64_t)v13);
            v41 = &v13[16 * v23];
            v42 = *((_QWORD *)v41 + 5);
            *((_QWORD *)v41 + 4) = v12;
            *((_QWORD *)v41 + 5) = v40;
            swift_bridgeObjectRelease(v42);
            if ((unint64_t)v9 >= *((_QWORD *)v13 + 2))
              goto LABEL_72;
            v32 = &v13[v31];
            v33 = *(_QWORD *)&v13[v31 + 56];
            *((_QWORD *)v32 + 6) = v131;
            *((_QWORD *)v32 + 7) = v39;
            swift_bridgeObjectRelease(v33);
          }
          v29 = __OFADD__(v23++, 1);
          if (v29)
            goto LABEL_70;
        }
        ++v9;
        v31 += 16;
        if (v9 == *((char **)v13 + 2))
          goto LABEL_14;
      }
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
      goto LABEL_79;
    }
LABEL_13:
    swift_bridgeObjectRetain(v17);
LABEL_14:
    v24 = *((_QWORD *)v13 + 2);
    v15 = v130;
    if (v24 < v23)
      goto LABEL_73;
    if (v23 < 0)
      goto LABEL_74;
LABEL_18:
    v8 = v23 - v24;
    if (__OFADD__(v24, v23 - v24))
      goto LABEL_75;
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v13);
    if (!(_DWORD)isUniquelyReferenced_nonNull_native || v23 > *((_QWORD *)v13 + 3) >> 1)
    {
      if (v24 <= v23)
        v26 = v23;
      else
        v26 = v24;
      v13 = sub_100004DA4(isUniquelyReferenced_nonNull_native, v26, 1, v13);
    }
    v12 = v13 + 32;
    swift_arrayDestroy(&v13[16 * v23 + 32], v24 - v23, &type metadata for String);
    if (v24 == v23)
      goto LABEL_3;
    v27 = *((_QWORD *)v13 + 2) - v24;
    if (v27 < 0)
      break;
    memmove(&v13[16 * v23 + 32], &v12[16 * v24], 16 * v27);
    v28 = *((_QWORD *)v13 + 2);
    v29 = __OFADD__(v28, v8);
    v30 = v28 + v8;
    if (v29)
      goto LABEL_78;
    *((_QWORD *)v13 + 2) = v30;
LABEL_3:
    v15 = (char *)v15 + 1;
    swift_bridgeObjectRelease(v17);
    if (v15 == v129)
    {
      swift_bridgeObjectRelease(v121);
      v12 = a4;
      v11 = a5;
      v10 = a6;
      goto LABEL_60;
    }
  }
  _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
}

void sub_100004300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_1000043CC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  __int128 v11;
  char **v12;
  __objc2_prot *v13;
  void *v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  _DWORD *v31;
  char *v32;
  id v33;
  __objc2_prot *v34;
  char **v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  _QWORD v61[2];
  void (*v62)(uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  char *v71;
  __int128 v72;
  _DWORD *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80[4];

  v61[1] = a4;
  v62 = a3;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)a1 >> 62)
    goto LABEL_42;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  v12 = (char **)(a2 + 16);
  while (v10)
  {
    a2 = 0;
    v67 = a1 & 0xC000000000000001;
    v64 = a1 & 0xFFFFFFFFFFFFFF8;
    v63 = a1 + 32;
    *(_QWORD *)&v11 = 136315138;
    v72 = v11;
    v71 = (char *)&type metadata for Any + 8;
    v13 = &OBJC_PROTOCOL___SelectPeopleIntentHandling;
    v65 = a1;
    v66 = v10;
    while (v67)
    {
      v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a1);
      v16 = __OFADD__(a2++, 1);
      if (v16)
        goto LABEL_39;
LABEL_12:
      v70 = a2;
      v14 = v15;
      v17 = type metadata accessor for SelectPeopleIntent(0);
      v18 = swift_dynamicCastClass(v14, v17);
      if (!v18)
        goto LABEL_5;
      v19 = (void *)v18;
      v69 = v14;
      v68 = v14;
      v20 = objc_msgSend(v19, "people");
      if (v20)
      {
        v21 = v20;
        v22 = type metadata accessor for PersonType(0);
        v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);

        if (!((unint64_t)v23 >> 62))
          goto LABEL_15;
      }
      else
      {
        v23 = (uint64_t)_swiftEmptyArrayStorage;
        if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
        {
LABEL_15:
          a2 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (a2)
            goto LABEL_16;
          goto LABEL_4;
        }
      }
      if (v23 < 0)
        v56 = v23;
      else
        v56 = v23 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v23);
      a2 = _CocoaArrayWrapper.endIndex.getter(v56);
      swift_bridgeObjectRelease(v23);
      if (a2)
      {
LABEL_16:
        if (a2 < 1)
          goto LABEL_40;
        v24 = 0;
        v75 = v23 & 0xC000000000000001;
        v76 = a2;
        v77 = v23;
        do
        {
          if (v75)
            v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v24, v23);
          else
            v25 = *(id *)(v23 + 8 * v24 + 32);
          v26 = v25;
          static PeopleLogger.extension.getter();
          v27 = v26;
          v28 = Logger.logObject.getter();
          v29 = static os_log_type_t.default.getter();
          v30 = os_log_type_enabled(v28, v29);
          v78 = v24;
          v79 = v27;
          if (v30)
          {
            v31 = (_DWORD *)swift_slowAlloc(12, -1);
            v73 = v31;
            v74 = swift_slowAlloc(32, -1);
            v80[0] = v74;
            *v31 = v72;
            v32 = v9;
            v33 = objc_msgSend(v27, "debugDescription");
            v34 = v13;
            v35 = v12;
            v36 = v7;
            v37 = v6;
            v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v40 = v39;

            v9 = v32;
            v41 = v38;
            v6 = v37;
            v7 = v36;
            v12 = v35;
            v13 = v34;
            v27 = v79;
            v42 = sub_100004EB0(v41, v40, v80);
            v43 = (uint8_t *)v73;
            *(_QWORD *)(v73 + 1) = v42;

            swift_bridgeObjectRelease(v40);
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "people in widget%s", v43, 0xCu);
            v44 = v74;
            swift_arrayDestroy(v74, 1, v71);
            swift_slowDealloc(v44, -1, -1);
            swift_slowDealloc(v43, -1, -1);

          }
          else
          {

          }
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
          v45 = objc_msgSend(v27, (SEL)v13[16].inst_props);
          if (v45)
          {
            v46 = v45;
            v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v49 = v48;

          }
          else
          {
            v47 = 0;
            v49 = 0xE000000000000000;
          }
          swift_beginAccess(v12, v80, 33, 0);
          v50 = *v12;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v12);
          *v12 = v50;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v50 = sub_100004DA4(0, *((_QWORD *)v50 + 2) + 1, 1, v50);
            *v12 = v50;
          }
          v53 = *((_QWORD *)v50 + 2);
          v52 = *((_QWORD *)v50 + 3);
          if (v53 >= v52 >> 1)
          {
            v50 = sub_100004DA4((char *)(v52 > 1), v53 + 1, 1, v50);
            *v12 = v50;
          }
          v54 = v78 + 1;
          *((_QWORD *)v50 + 2) = v53 + 1;
          v55 = &v50[16 * v53];
          v24 = v54;
          *((_QWORD *)v55 + 4) = v47;
          *((_QWORD *)v55 + 5) = v49;
          swift_endAccess(v80);

          v23 = v77;
        }
        while (v76 != v24);
      }
LABEL_4:

      swift_bridgeObjectRelease(v23);
      a1 = v65;
      v14 = v69;
LABEL_5:

      a2 = v70;
      if (v70 == v66)
        goto LABEL_46;
    }
    if ((unint64_t)a2 >= *(_QWORD *)(v64 + 16))
      goto LABEL_41;
    v15 = *(id *)(v63 + 8 * a2);
    v16 = __OFADD__(a2++, 1);
    if (!v16)
      goto LABEL_12;
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    if (a1 < 0)
      v57 = a1;
    else
      v57 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v10 = _CocoaArrayWrapper.endIndex.getter(v57);
    v12 = (char **)(a2 + 16);
  }
LABEL_46:
  swift_bridgeObjectRelease(a1);
  swift_beginAccess(v12, v80, 0, 0);
  v58 = *v12;
  v59 = swift_bridgeObjectRetain(*v12);
  v62(v59);
  return swift_bridgeObjectRelease(v58);
}

id sub_10000490C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
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
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  Swift::String v28;
  void *object;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSString v33;
  NSString v34;
  id v35;
  NSString v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  Swift::String v42;
  uint64_t v43;
  uint64_t v44;

  v2 = v1;
  v4 = type metadata accessor for ContactFormatter.Style(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for ContactFormatter(0);
  v8 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a1, "identifier");
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  v43 = v12;
  v44 = v14;
  v15 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter + 24);
  v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter + 32);
  sub_100004C98((_QWORD *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter), v15);
  dispatch thunk of ContactFormatterProtocol.displayName(for:)(a1, v15, v16);
  v18 = v17;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for ContactFormatter.Style.shortName(_:), v4);
  v19 = String.localized.getter(0x656D614E206F4ELL, 0xE700000000000000);
  ContactFormatter.init(style:fallback:)(v7, v19, v20);
  v21 = ContactFormatter.displayName(for:)((CNContact)a1);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v41);
  v22 = (_QWORD *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper);
  v23 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper + 24);
  v24 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper + 32);
  sub_100004C98(v22, v23);
  v25 = dispatch thunk of VerticalTextHelperProtocol.makeIdentifier(for:)(v21._countAndFlagsBits, v21._object, v23, v24);
  v27 = v26;
  swift_bridgeObjectRelease(v21._object);
  if (v27)
  {
    v42._countAndFlagsBits = 124;
    v42._object = (void *)0xE100000000000000;
    v28._countAndFlagsBits = v25;
    v28._object = v27;
    String.append(_:)(v28);
    swift_bridgeObjectRelease(v27);
    object = v42._object;
    String.append(_:)(v42);
    swift_bridgeObjectRelease(object);
  }
  v30 = type metadata accessor for PersonType(0);
  v31 = v44;
  v32 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v30));
  v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v31);
  v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  v35 = objc_msgSend(v32, "initWithIdentifier:displayString:", v33, v34);

  v36 = objc_msgSend(a1, "identifier");
  if (!v36)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v38 = v37;
    v36 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v38);
  }
  objc_msgSend(v35, "setId:", v36);

  return v35;
}

id sub_100004BE0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(_TtC16SelectPerson_iOS13IntentHandler);
}

_QWORD *sub_100004C98(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004CBC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100004CCC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100004CF0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 72));
  return swift_deallocObject(v0, 80, 7);
}

void sub_100004D3C(char *a1)
{
  uint64_t v1;

  sub_100003850(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(char **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(void (**)(id, _QWORD))(v1 + 64));
}

uint64_t sub_100004D6C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100004D98(uint64_t a1)
{
  uint64_t v1;

  return sub_1000043CC(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32));
}

char *sub_100004DA4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100005674(&qword_10000C740);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1000059AC(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100004EB0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100004F80(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000056B8((uint64_t)v12, *a3);
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
      sub_1000056B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006784(v12);
  return v7;
}

uint64_t sub_100004F80(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100005138(a5, a6);
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

uint64_t sub_100005138(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000051CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_1000053A4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000053A4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000051CC(uint64_t a1, unint64_t a2)
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
      v5 = sub_100005340(v4, 0);
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

_QWORD *sub_100005340(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005674(&qword_10000C748);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000053A4(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005674(&qword_10000C748);
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

uint64_t sub_1000054F0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10000550C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10000550C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005674(&qword_10000C740);
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

uint64_t sub_100005674(uint64_t *a1)
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

uint64_t sub_1000056B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_1000056F4(uint64_t a1)
{
  return sub_100004DA4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

id sub_100005708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  objc_class *v10;
  char *v11;
  id v12;
  objc_super v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v8 = type metadata accessor for ContactFormatter(0);
  v18[3] = v8;
  v18[4] = &protocol witness table for ContactFormatter;
  v9 = sub_100006704(v18);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v9, a3, v8);
  v17[3] = type metadata accessor for VerticalTextHelper(0);
  v17[4] = &protocol witness table for VerticalTextHelper;
  v17[0] = a4;
  v16[3] = type metadata accessor for ContactFetcher(0);
  v16[4] = &protocol witness table for ContactFetcher;
  v16[0] = a1;
  v15[3] = type metadata accessor for WidgetCenter(0);
  v15[4] = &protocol witness table for WidgetCenter;
  v15[0] = a2;
  v10 = (objc_class *)type metadata accessor for IntentHandler();
  v11 = (char *)objc_allocWithZone(v10);
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_allContacts] = &_swiftEmptyArrayStorage;
  sub_100006740((uint64_t)v16, (uint64_t)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher]);
  sub_100006740((uint64_t)v15, (uint64_t)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_widgetCenter]);
  sub_100006740((uint64_t)v18, (uint64_t)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFormatter]);
  sub_100006740((uint64_t)v17, (uint64_t)&v11[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_verticalTextHelper]);
  v14.receiver = v11;
  v14.super_class = v10;
  v12 = objc_msgSendSuper2(&v14, "init");
  sub_100006784(v17);
  sub_100006784(v18);
  sub_100006784(v15);
  sub_100006784(v16);
  return v12;
}

_QWORD *sub_100005874(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = _swiftEmptyArrayStorage;
    if (!v2)
      break;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      v7 = sub_10000490C(v5);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v8 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v8);
      v9 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v7);
      specialized ContiguousArray._endMutation()(v9);
      if (v2 == v4)
        return _swiftEmptyArrayStorage;
    }
    __break(1u);
LABEL_14:
    if (a1 < 0)
      v10 = a1;
    else
      v10 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a1);
  }
  return result;
}

uint64_t sub_1000059AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_100005A9C(uint64_t result, unint64_t a2)
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
    sub_100005ED8();
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

void sub_100005C34(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v35;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;

  v5 = a4 >> 1;
  if (a4 >> 1 == a3)
    return;
  v6 = a3;
  swift_unknownObjectRetain(a1);
  v35 = v5;
  while (1)
  {
    if (v6 >= v5)
      goto LABEL_33;
    v8 = *(void **)(a2 + 8 * v6);
    v9 = *a5;
    v38 = v6;
    if ((unint64_t)*a5 >> 62)
      break;
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n(v9, 2);
    v11 = v8;
    if (v10)
      goto LABEL_9;
LABEL_21:
    swift_bridgeObjectRelease_n(v9, 2);
    v28 = sub_10000490C(v8);

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v30 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v29 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v30 >= v29 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v30 + 1, 1);
    v31 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v28);
    specialized Array._endMutation()(v31);
    v7 = v38;
    v5 = v35;
LABEL_5:
    v6 = v7 + 1;
    if (v6 == v5)
    {
      swift_unknownObjectRelease(a1);
      return;
    }
  }
  if (v9 < 0)
    v32 = *a5;
  else
    v32 = v9 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain_n(v9, 2);
  v33 = v8;
  v10 = _CocoaArrayWrapper.endIndex.getter(v32);
  if (!v10)
    goto LABEL_21;
LABEL_9:
  v39 = v9;
  v40 = v9 & 0xC000000000000001;
  v12 = 4;
  while (1)
  {
    v13 = v12 - 4;
    if (!v40)
      break;
    v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12 - 4, v9);
    v15 = v12 - 3;
    if (__OFADD__(v13, 1))
      goto LABEL_32;
LABEL_15:
    v41 = v15;
    v16 = v14;
    v17 = objc_msgSend(v14, "identifier");
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v20 = v19;

    v21 = v8;
    v22 = objc_msgSend(v8, "identifier");
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    if (v18 == v23 && v20 == v25)
    {
      swift_bridgeObjectRelease_n(v39, 2);

LABEL_4:
      v7 = v38;
      v5 = v35;
      swift_bridgeObjectRelease_n(v20, 2);

      goto LABEL_5;
    }
    v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v23, v25, 0);

    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v25);
    if ((v27 & 1) != 0)
    {
      v20 = v39;
      goto LABEL_4;
    }
    ++v12;
    v8 = v21;
    v9 = v39;
    if (v41 == v10)
      goto LABEL_21;
  }
  v14 = *(id *)(v9 + 8 * v12);
  v15 = v12 - 3;
  if (!__OFADD__(v13, 1))
    goto LABEL_15;
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
}

unint64_t sub_100005ED8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C760;
  if (!qword_10000C760)
  {
    v1 = objc_opt_self(CNContact);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C760);
  }
  return result;
}

uint64_t sub_100005F14()
{
  char *v0;
  void *v1;
  uint64_t v2;
  char *v3;
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
  id v15;
  uint64_t v16;
  __objc2_prot *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __objc2_prot *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  objc_class *ObjCClassFromMetadata;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  NSString v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  id v90;
  uint64_t v91;
  _BYTE v92[24];
  uint64_t v93[3];
  _QWORD v94[2];

  v1 = v0;
  v80 = type metadata accessor for Logger(0);
  v79 = *(_QWORD *)(v80 - 8);
  __chkstk_darwin(v80);
  v81 = (char *)&v79 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = &v0[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher];
  v4 = *(_QWORD *)&v0[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 24];
  v5 = *(_QWORD *)&v0[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher + 32];
  sub_100004C98(&v0[OBJC_IVAR____TtC16SelectPerson_iOS13IntentHandler_contactFetcher], v4);
  v6 = ((uint64_t (*)(void))static PeopleConstants.maxContactsInMultipleWidget.getter)();
  v7 = dispatch thunk of ContactFetcherProtocol.recommendedContacts(maxSuggestions:excludeContactIdentifiers:)(v6, _swiftEmptyArrayStorage, v4, v5);
  v8 = v1;
  v9 = (uint64_t)sub_100005874(v7);
  swift_bridgeObjectRelease(v7);

  v94[0] = v9;
  if ((unint64_t)v9 >> 62)
    goto LABEL_76;
  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v11 = ((uint64_t (*)(void))static PeopleConstants.maxContactsInMultipleWidget.getter)();
  if (v10 < v11)
  {
    v12 = *((_QWORD *)v3 + 3);
    v13 = *((_QWORD *)v3 + 4);
    sub_100004C98(v3, v12);
    v14 = dispatch thunk of ContactFetcherProtocol.preferredContacts()(v12, v13);
    v15 = (id)v8;
    v16 = (uint64_t)sub_100005874(v14);
    swift_bridgeObjectRelease(v14);

    if ((unint64_t)v16 >> 62)
    {
      if (v16 < 0)
        v77 = v16;
      else
        v77 = v16 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v16);
      v3 = (char *)_CocoaArrayWrapper.endIndex.getter(v77);
      swift_bridgeObjectRelease(v16);
      if (v3)
      {
LABEL_6:
        v9 = 0;
        v85 = v16;
        v86 = v16 & 0xC000000000000001;
        v82 = v16 + 32;
        v83 = v16 & 0xFFFFFFFFFFFFFF8;
        v17 = &OBJC_PROTOCOL___SelectPeopleIntentHandling;
        v84 = v3;
        while (1)
        {
          if (v86)
          {
            v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v16);
          }
          else
          {
            if ((unint64_t)v9 >= *(_QWORD *)(v83 + 16))
              goto LABEL_75;
            v18 = *(id *)(v82 + 8 * v9);
          }
          v90 = v18;
          if (__OFADD__(v9++, 1))
            goto LABEL_74;
          v20 = v94[0];
          if (!(v94[0] >> 62))
          {
            v21 = *(_QWORD *)((v94[0] & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain_n(v94[0], 2);
            if (v21)
              break;
            goto LABEL_44;
          }
          v38 = v94[0] < 0 ? v94[0] : v94[0] & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n(v94[0], 2);
          v21 = _CocoaArrayWrapper.endIndex.getter(v38);
          if (v21)
            break;
LABEL_44:
          v37 = swift_bridgeObjectRelease_n(v20, 2);
LABEL_45:
          if ((unint64_t)v20 >> 62)
          {
            if (v20 < 0)
              v44 = v20;
            else
              v44 = v20 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(v20);
            v39 = _CocoaArrayWrapper.endIndex.getter(v44);
            v37 = swift_bridgeObjectRelease(v20);
          }
          else
          {
            v39 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
          }
          if (v39 < static PeopleConstants.maxContactsInMultipleWidget.getter(v37))
          {
            v40 = v90;
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            v42 = *(_QWORD *)((v94[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
            v41 = *(_QWORD *)((v94[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
            if (v42 >= v41 >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v41 > 1, v42 + 1, 1);
            v43 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v42, v40);
            specialized Array._endMutation()(v43);
          }
LABEL_9:

          if ((char *)v9 == v3)
          {
            v11 = swift_bridgeObjectRelease(v16);
            v9 = v94[0];
            goto LABEL_56;
          }
        }
        v87 = v9;
        v88 = v20;
        v89 = v20 & 0xC000000000000001;
        v8 = 4;
        while (1)
        {
          if (v89)
            v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, v20);
          else
            v24 = *(id *)(v20 + 8 * v8);
          v25 = v24;
          v9 = v8 - 3;
          if (__OFADD__(v8 - 4, 1))
          {
            __break(1u);
LABEL_74:
            __break(1u);
LABEL_75:
            __break(1u);
LABEL_76:
            if (v9 < 0)
              v76 = v9;
            else
              v76 = v9 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(v9);
            v10 = _CocoaArrayWrapper.endIndex.getter(v76);
            swift_bridgeObjectRelease(v9);
            goto LABEL_3;
          }
          v26 = v21;
          v27 = objc_msgSend(v24, (SEL)v17[16].inst_props);
          if (v27)
          {
            v28 = v27;
            v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
            v31 = v30;

          }
          else
          {
            v29 = 0;
            v31 = 0;
          }
          v32 = v17;
          v33 = (char *)objc_msgSend(v90, (SEL)v17[16].inst_props, v79, v80);
          if (v33)
          {
            v3 = v33;
            v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
            v22 = v35;

            if (!v31)
            {
              if (!v22)
              {
LABEL_7:
                swift_bridgeObjectRelease_n(v88, 2);

LABEL_8:
                v3 = v84;
                v16 = v85;
                v9 = v87;
                v17 = v32;
                goto LABEL_9;
              }

              goto LABEL_20;
            }
            if (v22)
            {
              if (v29 == v34 && v31 == v22)
              {
                swift_bridgeObjectRelease_n(v88, 2);

                swift_bridgeObjectRelease(v31);
                swift_bridgeObjectRelease(v22);
                goto LABEL_8;
              }
              v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v31, v34, v22, 0);

              swift_bridgeObjectRelease(v31);
              swift_bridgeObjectRelease(v22);
              if ((v36 & 1) != 0)
              {
                swift_bridgeObjectRelease_n(v88, 2);
                goto LABEL_8;
              }
              goto LABEL_21;
            }
          }
          else if (!v31)
          {
            goto LABEL_7;
          }

          v22 = v31;
LABEL_20:
          swift_bridgeObjectRelease(v22);
LABEL_21:
          ++v8;
          v21 = v26;
          v23 = v9 == v26;
          v17 = v32;
          v20 = v88;
          if (v23)
          {
            v37 = swift_bridgeObjectRelease_n(v88, 2);
            v20 = v94[0];
            v3 = v84;
            v16 = v85;
            v9 = v87;
            goto LABEL_45;
          }
        }
      }
    }
    else
    {
      v3 = *(char **)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v3)
        goto LABEL_6;
    }
    v11 = swift_bridgeObjectRelease(v16);
    if ((unint64_t)v9 >> 62)
      goto LABEL_85;
LABEL_57:
    v45 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_58;
  }
LABEL_56:
  if (!((unint64_t)v9 >> 62))
    goto LABEL_57;
LABEL_85:
  if (v9 < 0)
    v78 = v9;
  else
    v78 = v9 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v9);
  v45 = _CocoaArrayWrapper.endIndex.getter(v78);
  v11 = swift_bridgeObjectRelease(v9);
LABEL_58:
  if (v45 < static PeopleConstants.maxContactsInMultipleWidget.getter(v11))
  {
    v46 = type metadata accessor for PersonType(0);
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v46);
    do
    {
      v48 = static PeopleConstants.noneOptionDisplayString.getter();
      v50 = v49;
      String.localized.getter(v48, v49);
      v52 = v51;
      swift_bridgeObjectRelease(v50);
      v53 = objc_allocWithZone(ObjCClassFromMetadata);
      v54 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v52);
      v55 = objc_msgSend(v53, "initWithIdentifier:displayString:", 0, v54);

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v57 = *(_QWORD *)((v94[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
      v56 = *(_QWORD *)((v94[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v57 >= v56 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v56 > 1, v57 + 1, 1);
      v58 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v57, v55);
      v59 = specialized Array._endMutation()(v58);
      v60 = v94[0];
      if (v94[0] >> 62)
      {
        if (v94[0] < 0)
          v62 = v94[0];
        else
          v62 = v94[0] & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v94[0]);
        v61 = _CocoaArrayWrapper.endIndex.getter(v62);
        v59 = swift_bridgeObjectRelease(v60);
      }
      else
      {
        v61 = *(_QWORD *)((v94[0] & 0xFFFFFFFFFFFFF8) + 0x10);
      }
    }
    while (v61 < static PeopleConstants.maxContactsInMultipleWidget.getter(v59));
  }
  v63 = v81;
  v64 = static PeopleLogger.extension.getter();
  v65 = Logger.logObject.getter(v64);
  v66 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (uint8_t *)swift_slowAlloc(12, -1);
    v68 = swift_slowAlloc(32, -1);
    v93[0] = v68;
    *(_DWORD *)v67 = 136315138;
    swift_beginAccess(v94, v92, 0, 0);
    v69 = v94[0];
    v70 = type metadata accessor for PersonType(0);
    v71 = swift_bridgeObjectRetain(v69);
    v72 = Array.debugDescription.getter(v71, v70);
    v74 = v73;
    swift_bridgeObjectRelease(v69);
    v91 = sub_100004EB0(v72, v74, v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, v92, v67 + 4, v67 + 12);
    swift_bridgeObjectRelease(v74);
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Default contacts for widget: %s", v67, 0xCu);
    swift_arrayDestroy(v68, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v68, -1, -1);
    swift_slowDealloc(v67, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v79 + 8))(v63, v80);
  swift_beginAccess(v94, v93, 0, 0);
  return v94[0];
}

uint64_t sub_1000066D8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000066FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100004300(a1, a2, *(_QWORD *)(v2 + 16));
}

_QWORD *sub_100006704(_QWORD *a1)
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

uint64_t sub_100006740(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006784(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t WidgetCenter.getCurrentWidgetConfigurations(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = swift_allocObject(&unk_100008690, 24, 7);
  *(_QWORD *)(v4 + 16) = _swiftEmptyArrayStorage;
  v5 = (_QWORD *)swift_allocObject(&unk_1000086B8, 40, 7);
  v5[2] = v4;
  v5[3] = a1;
  v5[4] = a2;
  swift_retain(v4);
  swift_retain(a2);
  dispatch thunk of WidgetCenter.getCurrentConfigurations(_:)(sub_1000069EC, v5);
  swift_release(v4);
  return swift_release(v5);
}

uint64_t sub_100006848()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000686C(uint64_t a1, char a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];

  if ((a2 & 1) != 0)
  {
    v21[0] = a1;
    v17 = sub_100005674(&qword_10000C7C8);
    return swift_willThrowTypedImpl(v21, v17, &protocol self-conformance witness table for Error);
  }
  else
  {
    v6 = (uint64_t *)(a3 + 16);
    v7 = *(_QWORD *)(a1 + 16);
    if (v7)
    {
      v8 = *(_QWORD *)(type metadata accessor for WidgetInfo(0) - 8);
      v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
      v10 = *(_QWORD *)(v8 + 72);
      v11 = swift_bridgeObjectRetain(a1);
      do
      {
        v11 = WidgetInfo.configuration.getter(v11);
        if (v11)
        {
          v13 = (void *)v11;
          swift_beginAccess(v6, v21, 33, 0);
          v14 = v13;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v16 = *(_QWORD *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v15 = *(_QWORD *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v16 >= v15 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v15 > 1, v16 + 1, 1);
          v12 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v14);
          specialized Array._endMutation()(v12);
          swift_endAccess(v21);

        }
        v9 += v10;
        --v7;
      }
      while (v7);
      sub_100006AD0(a1, 0);
    }
    swift_beginAccess(v6, v21, 0, 0);
    v19 = *v6;
    v20 = swift_bridgeObjectRetain(v19);
    a4(v20);
    return swift_bridgeObjectRelease(v19);
  }
}

uint64_t sub_1000069EC(uint64_t a1, char a2)
{
  uint64_t v2;

  return sub_10000686C(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(void (**)(uint64_t))(v2 + 24));
}

uint64_t sub_1000069FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = swift_allocObject(&unk_100008690, 24, 7);
  *(_QWORD *)(v4 + 16) = &_swiftEmptyArrayStorage;
  v5 = (_QWORD *)swift_allocObject(&unk_1000086F0, 40, 7);
  v5[2] = v4;
  v5[3] = a1;
  v5[4] = a2;
  swift_retain(v4);
  swift_retain(a2);
  dispatch thunk of WidgetCenter.getCurrentConfigurations(_:)(sub_100006ADC, v5);
  swift_release(v4);
  return swift_release(v5);
}

uint64_t sub_100006AA4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006AD0(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_errorRelease();
  else
    return swift_bridgeObjectRelease(a1);
}
