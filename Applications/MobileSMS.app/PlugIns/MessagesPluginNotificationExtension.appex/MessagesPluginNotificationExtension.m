void sub_100001DAC(id a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v1 = objc_alloc_init((Class)IMTimingCollection);
  objc_msgSend(v1, "startTimingForKey:", CFSTR("plugin-notif-imagent-connection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v2, "addListenerID:capabilities:", CFSTR("MessagesPluginNotificationExtension"), CKListenerPaginatedChatRegistryCapabilities());

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v3, "blockUntilConnected");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v4, "_setBlocksConnectionAtResume:", 1);

  if (IMOSLoggingEnabled(objc_msgSend(v1, "stopTimingForKey:", CFSTR("plugin-notif-imagent-connection"))))
  {
    v5 = OSLogHandleForIMFoundationCategory("CKCustomPluginNotificationViewController");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialized imagent connection from custom plugin notification %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

uint64_t sub_100002578()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004498(v0, qword_10000CAA0);
  sub_1000043E0(v0, (uint64_t)qword_10000CAA0);
  return Logger.init(subsystem:category:)(0xD000000000000036, 0x8000000100007100, 0xD000000000000018, 0x8000000100006BD0);
}

id sub_1000025F8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AskToNotificationManager()), "init");
  qword_10000CAC0 = (uint64_t)result;
  return result;
}

unint64_t sub_100002664(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t result;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003BE8(&qword_10000C9D8);
  v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  v5 = (_QWORD *)v4;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }
  swift_retain(v4);
  v7 = (void **)(a1 + 48);
  while (1)
  {
    v8 = (uint64_t)*(v7 - 2);
    v9 = (uint64_t)*(v7 - 1);
    v10 = *v7;
    swift_bridgeObjectRetain(v9);
    v11 = v10;
    result = sub_100004318(v8, v9);
    if ((v13 & 1) != 0)
      break;
    *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v14 = (uint64_t *)(v5[6] + 16 * result);
    *v14 = v8;
    v14[1] = v9;
    *(_QWORD *)(v5[7] + 8 * result) = v11;
    v15 = v5[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v5[2] = v17;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10000277C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003BE8(&qword_10000C9D0);
  v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  v5 = (_QWORD *)v4;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }
  swift_retain(v4);
  v7 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v8 = *(v7 - 2);
    v9 = *(v7 - 1);
    v10 = *v7;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    result = sub_100004318(v8, v9);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v5[6] + 16 * result);
    *v13 = v8;
    v13[1] = v9;
    *(_QWORD *)(v5[7] + 8 * result) = v10;
    v14 = v5[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v5[2] = v16;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100002894(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD v50[3];
  unint64_t v51;

  v3 = v2;
  v5 = sub_100002664((uint64_t)&_swiftEmptyArrayStorage, (uint64_t)a2);
  v6 = (void *)ATPayload.question.getter();
  v7 = ATQuestion.answerChoices.getter();

  if (!((unint64_t)v7 >> 62))
  {
    v9 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    v47 = v3;
    if (v9)
      goto LABEL_3;
LABEL_18:
    swift_bridgeObjectRelease(v7, v8);
    v36 = objc_msgSend(a1, "request");
    v37 = objc_msgSend(v36, "identifier");

    v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
    v40 = v39;

    v41 = (unint64_t *)(v47 + OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap);
    swift_beginAccess(v47 + OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap, v50, 33, 0);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v41);
    v51 = *v41;
    *v41 = 0x8000000000000000;
    sub_100004CD8(v5, v38, v40, isUniquelyReferenced_nonNull_native);
    v43 = *v41;
    *v41 = v51;
    swift_bridgeObjectRelease(v40, v44);
    swift_bridgeObjectRelease(v43, v45);
    return swift_endAccess(v50);
  }
  if (v7 < 0)
    v34 = v7;
  else
    v34 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v9 = _CocoaArrayWrapper.endIndex.getter(v34);
  swift_bridgeObjectRelease(v7, v35);
  v47 = v3;
  if (!v9)
    goto LABEL_18;
LABEL_3:
  result = type metadata accessor for ATPayload(0);
  if (v9 >= 1)
  {
    v11 = 0;
    v48 = v7 & 0xC000000000000001;
    v49 = v7;
    do
    {
      if (v48)
        v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v7);
      else
        v12 = *(id *)(v7 + 8 * v11 + 32);
      v13 = v12;
      v14 = ATPayload.question.getter();
      v15 = objc_allocWithZone((Class)type metadata accessor for ATResponse(0));
      v16 = v13;
      v17 = (void *)ATResponse.init(originalQuestion:responderHandle:chosenAnswer:)(v14, 0, 0xE000000000000000, v16);
      v18 = ATPayload.allResponses.getter();
      v19 = &_swiftEmptyArrayStorage;
      if (v18)
        v19 = (void *)v18;
      v50[0] = v19;
      v20 = v17;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v22 = *(_QWORD *)((v50[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
      v21 = *(_QWORD *)((v50[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v22 >= v21 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1);
      ++v11;
      v23 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v20);
      specialized Array._endMutation()(v23);
      swift_bridgeObjectRelease(v50[0], v24);
      v25 = v20;
      v26 = (void *)ATPayload.__allocating_init(originalPayload:newResponse:)(a2, v25);
      v27 = ATAnswerChoice.id.getter();
      v29 = v28;
      v30 = v26;
      v31 = swift_isUniquelyReferenced_nonNull_native(v5);
      v51 = v5;
      sub_100004E34((uint64_t)v30, v27, v29, v31);

      swift_bridgeObjectRelease(v29, v32);
      swift_bridgeObjectRelease(0x8000000000000000, v33);
      v7 = v49;
    }
    while (v9 != v11);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

id sub_100002BB4(void *a1)
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
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint8_t *v45;
  id result;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSString v62;
  uint64_t v63;
  NSString v64;
  uint64_t v65;
  id v66;
  id v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  unint64_t v90;
  id v91[5];
  __int128 v92;
  __int128 v93;

  v2 = type metadata accessor for ATURL.Parser(0);
  v87 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v88 = (char *)&v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003BE8(&qword_10000C9A0);
  __chkstk_darwin();
  v5 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a1, "request");
  v11 = objc_msgSend(v10, "content");

  v12 = objc_msgSend(v11, "userInfo");
  v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v12, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v89 = 0xD000000000000018;
  v90 = 0x8000000100006E90;
  AnyHashable.init<A>(_:)(v91, &v89, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v13 + 16) && (v14 = sub_10000437C((uint64_t)v91), (v15 & 1) != 0))
  {
    sub_100004438(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v92);
  }
  else
  {
    v92 = 0u;
    v93 = 0u;
  }
  sub_1000043AC((uint64_t)v91);
  if (!*((_QWORD *)&v93 + 1))
  {
    v19 = (uint64_t *)&unk_10000C9A8;
    v20 = (char *)&v92;
    goto LABEL_10;
  }
  if ((swift_dynamicCast(&v89, &v92, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_11:
    if (qword_10000CA98 != -1)
      swift_once(&qword_10000CA98, sub_100002578);
    v21 = type metadata accessor for Logger(0);
    sub_1000043E0(v21, (uint64_t)qword_10000CAA0);
    v22 = swift_bridgeObjectRetain(v13);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = (void *)swift_slowAlloc(32, -1);
      v91[0] = v26;
      *(_DWORD *)v25 = 136315138;
      v27 = swift_bridgeObjectRetain(v13);
      v28 = Dictionary.description.getter(v27, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v30 = v29;
      swift_bridgeObjectRelease(v13, v29);
      *(_QWORD *)&v92 = sub_100003CD8(v28, v30, (uint64_t *)v91);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, (char *)&v92 + 8, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(v13, 2);
      swift_bridgeObjectRelease(v30, v31);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "User info didn't have URL. userInfo: %s", v25, 0xCu);
      swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v13, 2);
    }
    return 0;
  }
  v16 = v90;
  URL.init(string:)(v89, v90);
  swift_bridgeObjectRelease(v16, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    v19 = &qword_10000C9A0;
    v20 = v5;
LABEL_10:
    sub_100006020((uint64_t)v20, v19);
    goto LABEL_11;
  }
  swift_bridgeObjectRelease(v13, v18);
  v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  v33 = v88;
  ATURL.Parser.init()(v32);
  v34 = type metadata accessor for ATPayload(0);
  v35 = sub_1000043F8(&qword_10000C9B0, (uint64_t)&protocol conformance descriptor for ATPayload);
  v36 = sub_1000043F8(&qword_10000C9B8, (uint64_t)&protocol conformance descriptor for ATPayload);
  ATURL.Parser.parse<A>(_:from:)(v91, v34, v9, v34, v35, v36);
  v86 = v2;
  v37 = v91[0];
  v38 = (void *)ATPayload.response.getter();

  if (v38)
  {
    v39 = v37;
    if (qword_10000CA98 != -1)
      swift_once(&qword_10000CA98, sub_100002578);
    v40 = type metadata accessor for Logger(0);
    v41 = sub_1000043E0(v40, (uint64_t)qword_10000CAA0);
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Payload for notification not a request. Bailing.", v44, 2u);
      v45 = v44;
      v2 = v86;
      swift_slowDealloc(v45, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v87 + 8))(v33, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return 0;
  }
  v47 = sub_100002894(a1, v37);
  v91[0] = &_swiftEmptyArrayStorage;
  v48 = (void *)ATPayload.question.getter(v47);
  v49 = ATQuestion.answerChoices.getter();

  if ((unint64_t)v49 >> 62)
  {
    if (v49 < 0)
      v73 = v49;
    else
      v73 = v49 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v49);
    v51 = _CocoaArrayWrapper.endIndex.getter(v73);
    swift_bridgeObjectRelease(v49, v74);
    v81 = v37;
    if (v51)
      goto LABEL_26;
LABEL_42:
    swift_bridgeObjectRelease(v49, v50);
    v72 = (uint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_43;
  }
  v51 = *(_QWORD *)((v49 & 0xFFFFFFFFFFFFF8) + 0x10);
  v81 = v37;
  if (!v51)
    goto LABEL_42;
LABEL_26:
  result = (id)objc_opt_self(UNNotificationAction);
  v85 = result;
  if (v51 < 1)
  {
    __break(1u);
    return result;
  }
  v52 = 0;
  v82 = v49 & 0xC000000000000001;
  v83 = v51;
  v84 = v49;
  do
  {
    if (v82)
      v53 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v52, v49);
    else
      v53 = *(id *)(v49 + 8 * v52 + 32);
    v54 = v53;
    v55 = ATAnswerChoice.kind.getter();
    v56 = (unsigned __int16)ATAnswerChoice.Kind.rawValue.getter(v55);
    if (v56 == (unsigned __int16)ATAnswerChoice.Kind.rawValue.getter(2))
      v57 = 3;
    else
      v57 = 1;
    ATAnswerChoice.id.getter();
    v59 = v58;
    ATAnswerChoice.title.getter();
    v61 = v60;
    v62 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v59, v63);
    v64 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v61, v65);
    v66 = objc_msgSend(v85, "actionWithIdentifier:title:options:", v62, v64, v57);

    v67 = v66;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v69 = *(_QWORD *)(((unint64_t)v91[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    v68 = *(_QWORD *)(((unint64_t)v91[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v69 >= v68 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v68 > 1, v69 + 1, 1);
    ++v52;
    v70 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v69, v67);
    specialized Array._endMutation()(v70);

    v49 = v84;
    v2 = v86;
  }
  while (v83 != v52);
  swift_bridgeObjectRelease(v84, v71);
  v72 = (uint64_t)v91[0];
  v33 = v88;
LABEL_43:
  if ((unint64_t)v72 >> 62)
  {
    if (v72 < 0)
      v79 = v72;
    else
      v79 = v72 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v72);
    v80 = v79;
    v2 = v86;
    v75 = _CocoaArrayWrapper.endIndex.getter(v80);
  }
  else
  {
    v75 = *(_QWORD *)((v72 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v72);
  }
  v76 = v81;

  swift_bridgeObjectRelease(v72, v77);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v33, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  result = v91[0];
  if (!v75)
  {
    swift_bridgeObjectRelease(v91[0], v78);
    return 0;
  }
  return result;
}

uint64_t sub_10000364C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  return swift_task_switch(sub_100003668, 0, 0);
}

uint64_t sub_100003668()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = type metadata accessor for ATDaemonConnectionManager(0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  v0[7] = ATDaemonConnectionManager.init()();
  v2 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to ATDaemonConnectionManager.sendResponsePayloadViaIDS(_:to:)
                                  + 1));
  v0[8] = v2;
  *v2 = v0;
  v2[1] = sub_1000036DC;
  return ATDaemonConnectionManager.sendResponsePayloadViaIDS(_:to:)(v0[3], v0[4]);
}

uint64_t sub_1000036DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100003780;
  else
    v3 = sub_100003740;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100003740()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  (*(void (**)(uint64_t))(v0 + 40))(1);
  swift_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_10000CA98 != -1)
    swift_once(&qword_10000CA98, sub_100002578);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = type metadata accessor for Logger(0);
  sub_1000043E0(v2, (uint64_t)qword_10000CAA0);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 72);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    swift_errorRetain(v7);
    v10 = _swift_stdlib_bridgeErrorToNSError(v7);
    *(_QWORD *)(v0 + 16) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v8 + 4, v8 + 12);
    *v9 = v10;
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error sending response payload: %@", v8, 0xCu);
    v11 = sub_100003BE8(&qword_10000C9C0);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 72));
    swift_errorRelease(v7);
  }

  v12 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 56);
  (*(void (**)(_QWORD))(v0 + 40))(0);
  swift_release(v13);
  swift_errorRelease(v12);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000395C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_100006020(a1, &qword_10000C9E0);
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
  v17 = swift_allocObject(&unk_1000086F0, 32, 7);
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
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_10000CA08, v17);
}

id sub_100003B88()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AskToNotificationManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AskToNotificationManager()
{
  return objc_opt_self(CKAskToNotificationManager);
}

uint64_t sub_100003BE8(uint64_t *a1)
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

uint64_t sub_100003C28(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100003C8C;
  return v6(a1);
}

uint64_t sub_100003C8C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100003CD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100003DA8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100004438((uint64_t)v12, *a3);
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
      sub_100004438((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100004474(v12);
  return v7;
}

uint64_t sub_100003DA8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100003F60(a5, a6);
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

uint64_t sub_100003F60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100003FF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_1000041CC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000041CC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100003FF4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100004168(v4, 0);
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

_QWORD *sub_100004168(uint64_t a1, uint64_t a2)
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
  v4 = sub_100003BE8(&qword_10000C9C8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000041CC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003BE8(&qword_10000C9C8);
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
    swift_bridgeObjectRelease(a4, v14);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

unint64_t sub_100004318(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000044D8(a1, a2, v5);
}

unint64_t sub_10000437C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1000045B8(a1, v4);
}

uint64_t sub_1000043AC(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_1000043E0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1000043F8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ATPayload(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004438(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004474(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *sub_100004498(uint64_t a1, uint64_t *a2)
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

unint64_t sub_1000044D8(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000045B8(uint64_t a1, uint64_t a2)
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
      sub_10000467C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000043AC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10000467C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

Swift::Int sub_1000046B8(uint64_t a1, uint64_t a2)
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
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100003BE8(&qword_10000C9D0);
  v37 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
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
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_36;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v35)
              goto LABEL_36;
            v24 = *(_QWORD *)(v36 + 8 * v14);
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
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_bridgeObjectRetain(v33);
    }
    Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
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
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
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

Swift::Int sub_1000049CC(uint64_t a1, uint64_t a2)
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
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100003BE8(&qword_10000C9D8);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
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
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_36;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v37)
              goto LABEL_36;
            v24 = *(_QWORD *)(v38 + 8 * v14);
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
    v33 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      v34 = v33;
    }
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
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
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100004CD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100004318(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100004F90();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease(*(_QWORD *)(v19 + 8 * v12), v11);
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_1000046B8(v15, a4 & 1);
  v21 = sub_100004318(a2, a3);
  if ((v16 & 1) == (v11 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void sub_100004E34(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100004318(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100005144();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain(a3);
      return;
    }
    goto LABEL_14;
  }
  sub_1000049CC(v15, a4 & 1);
  v20 = sub_100004318(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

void *sub_100004F90()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_100003BE8(&qword_10000C9D0);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_100005144()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_100003BE8(&qword_10000C9D8);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000052F4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100005310(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100005310(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003BE8(&qword_10000CA10);
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

void sub_100005478(void *a1, uint64_t a2, void (**a3)(const void *, _QWORD))
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSString v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  unint64_t *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  unint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  _QWORD *v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (**v92)(const void *, _QWORD);
  uint64_t v93;
  id v94;
  NSObject *v95;
  os_log_type_t v96;
  uint8_t *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  id v107;
  uint64_t v108;
  id v109;
  void (**v110)(const void *, _QWORD);
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;

  v108 = a2;
  sub_100003BE8(&qword_10000C9E0);
  __chkstk_darwin();
  v106 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = swift_allocObject(&unk_1000086A0, 24, 7);
  *(_QWORD *)(v112 + 16) = a3;
  v110 = a3;
  _Block_copy(a3);
  v109 = a1;
  v6 = objc_msgSend(a1, "notification");
  v7 = objc_msgSend(v6, "request");

  v8 = objc_msgSend(v7, "content");
  v9 = objc_msgSend(v8, "threadIdentifier");

  v10 = v9;
  if (!v9)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v12 = v11;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12, v13);
  }
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v16 = v15;
  if (qword_10000CA98 != -1)
    swift_once(&qword_10000CA98, sub_100002578);
  v17 = type metadata accessor for Logger(0);
  v18 = sub_1000043E0(v17, (uint64_t)qword_10000CAA0);
  v19 = swift_bridgeObjectRetain_n(v16, 2);
  v111 = v18;
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = (unint64_t *)swift_slowAlloc(32, -1);
    v114 = v23;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain(v16);
    v116 = sub_100003CD8(v14, v16, (uint64_t *)&v114);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v116, &v117, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease_n(v16, 3);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Creating chat controller for identifier: %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v16, 2);
  }
  v24 = objc_msgSend((id)objc_opt_self(IMChatRegistry), "sharedRegistry");
  v25 = objc_msgSend(v24, "existingChatWithChatIdentifier:", v10);

  if (!v25)
  {
    v45 = swift_bridgeObjectRetain(v16);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(12, -1);
      v49 = (unint64_t *)swift_slowAlloc(32, -1);
      v114 = v49;
      *(_DWORD *)v48 = 136315138;
      swift_bridgeObjectRetain(v16);
      v116 = sub_100003CD8(v14, v16, (uint64_t *)&v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v116, &v117, v48 + 4, v48 + 12);
      swift_bridgeObjectRelease_n(v16, 3);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Couldn't find chat for identifier %s", v48, 0xCu);
      swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v48, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v16, 2);
    }
    v50 = v112;
    v110[2](v110, 0);
    goto LABEL_24;
  }
  swift_bridgeObjectRelease(v16, v26);
  v27 = objc_msgSend(v25, "participants");
  v28 = sub_1000060F0(0, &qword_10000C9E8, IMHandle_ptr);
  v29 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v27, v28);

  if ((unint64_t)v29 >> 62)
  {
    if (v29 < 0)
      v51 = v29;
    else
      v51 = v29 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v29);
    v31 = _CocoaArrayWrapper.endIndex.getter(v51);
    swift_bridgeObjectRelease(v29, v52);
    v107 = v25;
    if (v31)
      goto LABEL_11;
LABEL_29:
    swift_bridgeObjectRelease(v29, v30);
    v33 = (unint64_t *)&_swiftEmptyArrayStorage;
    goto LABEL_30;
  }
  v31 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
  v107 = v25;
  if (!v31)
    goto LABEL_29;
LABEL_11:
  v114 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_1000052F4(0, v31 & ~(v31 >> 63), 0);
  if (v31 < 0)
  {
    __break(1u);
    return;
  }
  v32 = 0;
  v33 = v114;
  do
  {
    if ((v29 & 0xC000000000000001) != 0)
      v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v32, v29);
    else
      v34 = *(id *)(v29 + 8 * v32 + 32);
    v35 = v34;
    v36 = objc_msgSend(v34, "ID");
    v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
    v39 = v38;

    v114 = v33;
    v42 = v33[2];
    v41 = v33[3];
    if (v42 >= v41 >> 1)
    {
      sub_1000052F4(v41 > 1, v42 + 1, 1);
      v33 = v114;
    }
    ++v32;
    v33[2] = v42 + 1;
    v43 = &v33[2 * v42];
    v43[4] = v37;
    v43[5] = v39;
  }
  while (v31 != v32);
  swift_bridgeObjectRelease(v29, v40);
  v25 = v107;
LABEL_30:
  v53 = v109;
  if (v33[2])
  {
    v54 = objc_msgSend(v109, "notification");
    v55 = objc_msgSend(v54, "request");

    v56 = objc_msgSend(v55, "identifier");
    v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
    v59 = v58;

    v60 = (uint64_t *)(v108 + OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap);
    swift_beginAccess(v108 + OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap, &v114, 0, 0);
    v62 = *v60;
    if (*(_QWORD *)(*v60 + 16))
    {
      swift_bridgeObjectRetain(*v60);
      v63 = sub_100004318(v57, v59);
      if ((v64 & 1) != 0)
      {
        v65 = *(_QWORD *)(*(_QWORD *)(v62 + 56) + 8 * v63);
        swift_bridgeObjectRetain(v65);
        swift_bridgeObjectRelease(v59, v66);
        swift_bridgeObjectRelease(v62, v67);
        v68 = objc_msgSend(v53, "actionIdentifier");
        v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v68);
        v71 = v70;

        if (*(_QWORD *)(v65 + 16))
        {
          v73 = sub_100004318(v69, v71);
          if ((v72 & 1) != 0)
          {
            v74 = *(id *)(*(_QWORD *)(v65 + 56) + 8 * v73);
            swift_bridgeObjectRelease(v71, v75);
            swift_bridgeObjectRelease(v65, v76);
            v77 = type metadata accessor for TaskPriority(0);
            v78 = (uint64_t)v106;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 56))(v106, 1, 1, v77);
            v79 = (_QWORD *)swift_allocObject(&unk_1000086C8, 64, 7);
            v79[2] = 0;
            v79[3] = 0;
            v79[4] = v74;
            v79[5] = v33;
            v80 = v112;
            v79[6] = sub_100005F28;
            v79[7] = v80;
            swift_retain(v80);
            v50 = sub_10000395C(v78, (uint64_t)&unk_10000C9F8, (uint64_t)v79);
            swift_release(v80);

LABEL_24:
            swift_release(v50);
            return;
          }
        }
        swift_bridgeObjectRelease(v33, v72);
        swift_bridgeObjectRelease(v71, v93);
        v89 = v65;
      }
      else
      {
        swift_bridgeObjectRelease(v33, v64);
        swift_bridgeObjectRelease(v59, v90);
        v89 = v62;
      }
    }
    else
    {
      swift_bridgeObjectRelease(v33, v61);
      v89 = v59;
    }
    swift_bridgeObjectRelease(v89, v88);
    v94 = v53;
    v95 = Logger.logObject.getter(v94);
    v96 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v95, v96))
    {
      v97 = (uint8_t *)swift_slowAlloc(12, -1);
      v98 = swift_slowAlloc(32, -1);
      v116 = v98;
      *(_DWORD *)v97 = 136315138;
      v99 = objc_msgSend(v94, "actionIdentifier");
      v100 = static String._unconditionallyBridgeFromObjectiveC(_:)(v99);
      v102 = v101;

      v113 = sub_100003CD8(v100, v102, &v116);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v113, &v114, v97 + 4, v97 + 12);

      v103 = v102;
      v25 = v107;
      swift_bridgeObjectRelease(v103, v104);
      _os_log_impl((void *)&_mh_execute_header, v95, v96, "responsePayloadMap didn't have response payload for identifier %s", v97, 0xCu);
      swift_arrayDestroy(v98, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v98, -1, -1);
      swift_slowDealloc(v97, -1, -1);

    }
    else
    {

    }
    v105 = v112;
    v110[2](v110, 0);
    swift_release(v105);

  }
  else
  {
    swift_bridgeObjectRelease(v33, v44);
    v81 = v25;
    v82 = Logger.logObject.getter(v81);
    v83 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v82, v83))
    {
      v84 = (uint8_t *)swift_slowAlloc(12, -1);
      v85 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v84 = 138412290;
      v114 = (unint64_t *)v81;
      v86 = v81;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v114, &v115, v84 + 4, v84 + 12);
      *v85 = v25;

      _os_log_impl((void *)&_mh_execute_header, v82, v83, "Recipient addresses was empty for chat %@", v84, 0xCu);
      v87 = sub_100003BE8(&qword_10000C9C0);
      swift_arrayDestroy(v85, 1, v87);
      swift_slowDealloc(v85, -1, -1);
      swift_slowDealloc(v84, -1, -1);
    }
    else
    {

      v82 = v81;
    }
    v91 = v112;
    v92 = v110;

    v92[2](v92, 0);
    swift_release(v91);

  }
}

uint64_t sub_100005F04()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005F28()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100005F38()
{
  uint64_t v0;
  uint64_t v1;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40), v1);
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100005F74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  v2 = swift_task_alloc(dword_10000C9F4);
  v3 = *(_OWORD *)(v0 + 32);
  v4 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_100005FD8;
  *(_OWORD *)(v2 + 40) = v4;
  *(_OWORD *)(v2 + 24) = v3;
  return swift_task_switch(sub_100003668, 0, 0);
}

uint64_t sub_100005FD8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100006020(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100003BE8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000605C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006080(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10000CA04);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100005FD8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10000CA00 + dword_10000CA00))(a1, v4);
}

uint64_t sub_1000060F0(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void type metadata accessor for UNNotificationContentExtensionResponseOption()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10000CA20)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100008718);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000CA20);
  }
}

id objc_msgSend__setBlocksConnectionAtResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBlocksConnectionAtResume:");
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListenerID:capabilities:");
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockUntilConnected");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_connectIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectIfNeeded");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_customNotificationManagerForBalloonBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customNotificationManagerForBalloonBundleID:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_handleResponse_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResponse:completion:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationActionsFromNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationActionsFromNotification:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setNotificationActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationActions:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_startTimingForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimingForKey:");
}

id objc_msgSend_stopTimingForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTimingForKey:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}
