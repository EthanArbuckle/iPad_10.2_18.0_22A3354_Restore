id sub_100005480()
{
  if (qword_100040628[0] != -1)
    dispatch_once(qword_100040628, &stru_100034F50);
  return (id)qword_100040620;
}

void sub_1000054C0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.sharinguiservice", "ShareSheetUI");
  v2 = (void *)qword_100040620;
  qword_100040620 = (uint64_t)v1;

}

void sub_1000055F0()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = share_sheet_log();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetServiceLoad", "", v2, 2u);
  }

}

void sub_100005664()
{
  id v0;

  v0 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v0, "_performBlockAfterCATransactionCommits:", &stru_100034F70);

}

void sub_1000056A0(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = share_sheet_log(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetServiceLoad", "", v3, 2u);
  }

}

uint64_t sub_100005870()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t OpaqueTypeConformance2;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin();
  v1 = (char *)&v10 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008AFC((uint64_t)v1);
  v2 = sub_100009344((uint64_t *)&unk_100040050);
  v3 = *(_QWORD *)(v2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = sub_10000A480((uint64_t)v1, (uint64_t *)&unk_10003F200);
    return static SHSheetRemoteSetting.HostProcessType.defaultValue.getter(v4);
  }
  else
  {
    v6 = type metadata accessor for SHSheetRemoteSetting.HostProcessType(0);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v6, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v8 = sub_100009DA0(&qword_10003F228, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostProcessType, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.HostProcessType);
    dispatch thunk of UISceneKeyValueStorage.subscript.getter(&v11, v6, v6, v8, &protocol witness table for Int, &protocol witness table for Int, &protocol witness table for Int, v2, OpaqueTypeConformance2);
    v5 = v11;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v1, v2);
  }
  return v5;
}

uint64_t sub_1000059C8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t OpaqueTypeConformance2;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t result;
  uint64_t v21;
  id v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  v1 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v1);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v4 = type metadata accessor for Logger(0);
  sub_10000A054(v4, (uint64_t)qword_100041D00);
  v5 = v0;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v10 = *(void **)&v5[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_scene];
    v26 = v10;
    v11 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
    *v9 = v10;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "create new share sheet session for scene:%@", v8, 0xCu);
    v12 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v9, 1, v12);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  sub_100008AFC((uint64_t)v3);
  v13 = sub_100009344((uint64_t *)&unk_100040050);
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v3, 1, v13) == 1)
  {
    result = sub_10000A480((uint64_t)v3, (uint64_t *)&unk_10003F200);
  }
  else
  {
    v15 = type metadata accessor for SHSheetRemoteSetting.ClientContext(0);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v15, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v17 = sub_10000ABC0(0, &qword_10003F210, SHSheetUIServiceClientContext_ptr);
    v18 = sub_100009DA0(&qword_10003F218, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.ClientContext);
    v19 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter(v15, v15, v17, v18, v13, OpaqueTypeConformance2);
    result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v3, v13);
    if (v19)
    {
      v22 = objc_allocWithZone((Class)type metadata accessor for ShareSheetUISession(0, v21));
      v23 = sub_10001A5B0(v19);
      v24 = &v23[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate];
      *((_QWORD *)v24 + 1) = &off_100035278;
      swift_unknownObjectWeakAssign(v24, v5);
      return (uint64_t)v23;
    }
  }
  __break(1u);
  return result;
}

void sub_100005CCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t OpaqueTypeConformance2;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (*v16)(char *, uint64_t);
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];

  v1 = v0;
  v2 = sub_100009344((uint64_t *)&unk_10003F200);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v39 - v6;
  v41 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  sub_100008AFC((uint64_t)&v39 - v6);
  v8 = sub_100009344((uint64_t *)&unk_100040050);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v10(v7, 1, v8) == 1)
  {
    sub_10000A480((uint64_t)v7, (uint64_t *)&unk_10003F200);
    goto LABEL_12;
  }
  v11 = type metadata accessor for SHSheetRemoteSetting.ClientContext(0);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v11, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
  v13 = sub_10000ABC0(0, &qword_10003F210, SHSheetUIServiceClientContext_ptr);
  v14 = sub_100009DA0(&qword_10003F218, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.ClientContext);
  v40 = OpaqueTypeConformance2;
  v15 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter(v11, v11, v13, v14, v8, OpaqueTypeConformance2);
  v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v7, v8);
  if (!v15)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v17 = objc_msgSend(objc_allocWithZone((Class)UIActivityContentContext), "init");
  objc_msgSend(v17, "setIsRemote:", 1);
  objc_msgSend(v17, "setCanRenderPeople:", 1);
  objc_msgSend(v17, "setConfigureForCloudSharing:", objc_msgSend(v15, "configureForCloudSharing"));
  objc_msgSend(v17, "setConfigureForPhotosEdit:", objc_msgSend(v15, "configureForPhotosEdit"));
  objc_msgSend(v17, "setHideHeaderView:", objc_msgSend(v15, "hideHeaderView"));
  objc_msgSend(v17, "setSharingExpanded:", objc_msgSend(v15, "isSharingExpanded"));
  v18 = objc_msgSend(v15, "topContentSectionText");
  objc_msgSend(v17, "setTopContentSectionText:", v18);

  v19 = objc_msgSend(v15, "applicationActivityTypes");
  objc_msgSend(v17, "setApplicationActivityTypes:", v19);

  v20 = objc_msgSend(v15, "heroActionActivityTypes");
  objc_msgSend(v17, "setHeroActionActivityTypes:", v20);

  objc_msgSend(v17, "setShowHeroActionsHorizontally:", objc_msgSend(v15, "showHeroActionsHorizontally"));
  v21 = objc_msgSend(v15, "tintColor");
  objc_msgSend(v17, "setTintColor:", v21);

  v22 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_fbsScene), "hostAuditToken");
  if (!v22)
    goto LABEL_6;
  v23 = v22;
  objc_msgSend(v17, "setHostAuditToken:", v22);
  v24 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession);
  if (v24)
  {
    v25 = *(void **)(v24 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken);
    *(_QWORD *)(v24 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken) = v23;

LABEL_6:
    v26 = objc_msgSend(objc_allocWithZone((Class)UIActivityContentViewController), "initWithContext:", v17);
    objc_msgSend(v26, "setDelegate:", v1);
    v27 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession;
    objc_msgSend(v26, "setPresenter:", *(_QWORD *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession));
    sub_100008AFC((uint64_t)v5);
    if (v10(v5, 1, v8) == 1)
    {
      v28 = sub_10000A480((uint64_t)v5, (uint64_t *)&unk_10003F200);
      v29 = static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter(v28);
    }
    else
    {
      v30 = type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle(0);
      v31 = sub_100009DA0(&qword_10003F2D8, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.HostPresentationStyle);
      dispatch thunk of UISceneKeyValueStorage.subscript.getter(v42, v30, v30, v31, &protocol witness table for Int, &protocol witness table for Int, &protocol witness table for Int, v8, v40);
      v29 = v42[0];
      v16(v5, v8);
    }
    v32 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v29);
    objc_msgSend(v26, "setHostPresentationStyle:", v32);

    v33 = *(_QWORD *)(v1 + v27);
    if (v33)
    {
      v34 = (uint64_t *)(v33 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
      swift_beginAccess(v33 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView, v42, 1, 0);
      v35 = *v34;
      *v34 = (uint64_t)v26;
      v36 = v26;
      swift_unknownObjectRelease(v35);
      v37 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController) = v26;
      v38 = v36;

      objc_msgSend(objc_allocWithZone((Class)SUISNavigationController), "initWithRootViewController:", v38);
      return;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_100006248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t OpaqueTypeConformance2;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t result;
  id v20;
  uint64_t v21;

  v1 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v1);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_scene);
  v6 = objc_opt_self(UIWindowScene, v5);
  v7 = swift_dynamicCastObjCClassUnconditional(v4, v6, 0, 0, 0);
  v8 = objc_allocWithZone((Class)UIWindow);
  v9 = v4;
  v10 = objc_msgSend(v8, "initWithWindowScene:", v7);
  objc_msgSend(v10, "setRootViewController:", *(_QWORD *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController));
  v11 = v10;
  sub_100008AFC((uint64_t)v3);
  v12 = sub_100009344((uint64_t *)&unk_100040050);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v3, 1, v12) == 1)
  {
    result = sub_10000A480((uint64_t)v3, (uint64_t *)&unk_10003F200);
  }
  else
  {
    v14 = type metadata accessor for SHSheetRemoteSetting.ClientContext(0);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v14, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v16 = sub_10000ABC0(0, &qword_10003F210, SHSheetUIServiceClientContext_ptr);
    v17 = sub_100009DA0(&qword_10003F218, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.ClientContext);
    v18 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter(v14, v14, v16, v17, v12, OpaqueTypeConformance2);
    result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v3, v12);
    if (v18)
    {
      v20 = objc_msgSend(v18, "tintColor");

      objc_msgSend(v11, "setTintColor:", v20);
      return (uint64_t)v11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100006470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t OpaqueTypeConformance2;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  unsigned int (*v84)(char *, uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  _BYTE v87[24];

  v1 = v0;
  v2 = sub_100009344((uint64_t *)&unk_10003F200);
  v3 = __chkstk_darwin(v2);
  v83 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v80 - v6;
  __chkstk_darwin(v5);
  v9 = (char *)&v80 - v8;
  v10 = sub_100009344((uint64_t *)&unk_100040050);
  v86 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v82 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v81 = (char *)&v80 - v14;
  __chkstk_darwin(v13);
  v16 = (char *)&v80 - v15;
  v17 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  v18 = swift_allocObject(&unk_100035300, 24, 7);
  swift_unknownObjectWeakInit(v18 + 16, v0);
  swift_retain(v18);
  v19 = sub_100006DA8((uint64_t)sub_10000A4BC, v18);
  swift_release_n(v18, 2);
  v20 = v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_sceneSettingsObservables;
  v21 = swift_beginAccess(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_sceneSettingsObservables, v87, 33, 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v21);
  v23 = *(_QWORD *)(*(_QWORD *)v20 + 16);
  v22 = *(_QWORD *)(*(_QWORD *)v20 + 24);
  if (v23 >= v22 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1);
  v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v19);
  specialized Array._endMutation()(v24);
  swift_endAccess(v87);
  v25 = swift_allocObject(&unk_100035300, 24, 7);
  swift_unknownObjectWeakInit(v25 + 16, v0);
  swift_retain(v25);
  v26 = sub_100007224((uint64_t)sub_10000A4C4, v25);
  swift_release_n(v25, 2);
  v27 = swift_beginAccess(v20, v87, 33, 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v27);
  v29 = *(_QWORD *)(*(_QWORD *)v20 + 16);
  v28 = *(_QWORD *)(*(_QWORD *)v20 + 24);
  if (v29 >= v28 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1);
  v30 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v29, v26);
  specialized Array._endMutation()(v30);
  swift_endAccess(v87);
  v31 = sub_100007424((uint64_t)nullsub_1, 0);
  v32 = swift_beginAccess(v20, v87, 33, 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v32);
  v34 = *(_QWORD *)(*(_QWORD *)v20 + 16);
  v33 = *(_QWORD *)(*(_QWORD *)v20 + 24);
  if (v34 >= v33 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1);
  v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v31);
  specialized Array._endMutation()(v35);
  swift_endAccess(v87);
  v36 = swift_allocObject(&unk_100035300, 24, 7);
  swift_unknownObjectWeakInit(v36 + 16, v0);
  swift_retain(v36);
  v85 = v17;
  sub_100008AFC((uint64_t)v9);
  v37 = v86;
  v84 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v86 + 48);
  if (v84(v9, 1, v10) == 1)
  {
    sub_10000A480((uint64_t)v9, (uint64_t *)&unk_10003F200);
    swift_release_n(v36, 2);
    v38 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v16, v9, v10);
    v39 = type metadata accessor for SHSheetRemoteSetting.OptionGroups(0);
    v40 = swift_allocObject(&unk_1000353F0, 32, 7);
    *(_QWORD *)(v40 + 16) = sub_10000A4CC;
    *(_QWORD *)(v40 + 24) = v36;
    v41 = swift_retain(v36);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v41, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v43 = sub_100009DA0(&qword_10003F2B8, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.OptionGroups, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.OptionGroups);
    v38 = dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)(v39, sub_10000A588, v40, v39, v43, v10, OpaqueTypeConformance2);
    swift_release(v40);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v16, v10);
    swift_release_n(v36, 2);
  }
  v44 = v7;
  v45 = swift_beginAccess(v20, v87, 33, 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v45);
  v47 = *(_QWORD *)(*(_QWORD *)v20 + 16);
  v46 = *(_QWORD *)(*(_QWORD *)v20 + 24);
  if (v47 >= v46 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v46 > 1, v47 + 1, 1);
  v48 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v47, v38);
  specialized Array._endMutation()(v48);
  swift_endAccess(v87);
  v49 = swift_allocObject(&unk_100035300, 24, 7);
  swift_unknownObjectWeakInit(v49 + 16, v1);
  swift_retain(v49);
  sub_100008AFC((uint64_t)v7);
  if (v84(v7, 1, v10) == 1)
  {
    sub_10000A480((uint64_t)v7, (uint64_t *)&unk_10003F200);
    swift_release_n(v49, 2);
    v50 = 0;
    v51 = v86;
  }
  else
  {
    v52 = v86;
    v53 = v81;
    (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v81, v44, v10);
    v54 = type metadata accessor for SHSheetRemoteSetting.CollaborationOptions(0);
    v55 = swift_allocObject(&unk_1000353C8, 32, 7);
    *(_QWORD *)(v55 + 16) = sub_10000A4EC;
    *(_QWORD *)(v55 + 24) = v49;
    v56 = swift_retain(v49);
    v57 = swift_getOpaqueTypeConformance2(v56, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v58 = type metadata accessor for SHSheetCollaborationOptions(0);
    v59 = sub_100009DA0(&qword_10003F2B0, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.CollaborationOptions, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.CollaborationOptions);
    v50 = dispatch thunk of UISceneKeyValueStorage.observe<A, B>(_:handler:)(v54, sub_10000A560, v55, v54, v58, v59, v10, v57);
    v60 = v55;
    v51 = v52;
    swift_release(v60);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v10);
    swift_release_n(v49, 2);
  }
  v61 = (uint64_t)v83;
  v62 = swift_beginAccess(v20, v87, 33, 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v62);
  v64 = *(_QWORD *)(*(_QWORD *)v20 + 16);
  v63 = *(_QWORD *)(*(_QWORD *)v20 + 24);
  if (v64 >= v63 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v63 > 1, v64 + 1, 1);
  v65 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v64, v50);
  specialized Array._endMutation()(v65);
  swift_endAccess(v87);
  v66 = swift_allocObject(&unk_100035300, 24, 7);
  swift_unknownObjectWeakInit(v66 + 16, v1);
  swift_retain(v66);
  sub_100008AFC(v61);
  if (v84((char *)v61, 1, v10) == 1)
  {
    sub_10000A480(v61, (uint64_t *)&unk_10003F200);
    swift_release_n(v66, 2);
    v67 = 0;
  }
  else
  {
    v68 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v82, v61, v10);
    v69 = type metadata accessor for SHSheetRemoteSetting.CloudShareRequest(0);
    v70 = swift_allocObject(&unk_1000353A0, 32, 7);
    *(_QWORD *)(v70 + 16) = sub_10000A50C;
    *(_QWORD *)(v70 + 24) = v66;
    v71 = swift_retain(v66);
    v72 = swift_getOpaqueTypeConformance2(v71, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v73 = type metadata accessor for SHSheetCloudSharingRequest(0);
    v74 = sub_100009DA0(&qword_10003F2A8, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.CloudShareRequest, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.CloudShareRequest);
    v67 = dispatch thunk of UISceneKeyValueStorage.observe<A, B>(_:handler:)(v69, sub_10000A538, v70, v69, v73, v74, v10, v72);
    swift_release(v70);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v68, v10);
    swift_release_n(v66, 2);
  }
  v75 = swift_beginAccess(v20, v87, 33, 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v75);
  v77 = *(_QWORD *)(*(_QWORD *)v20 + 16);
  v76 = *(_QWORD *)(*(_QWORD *)v20 + 24);
  if (v77 >= v76 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v76 > 1, v77 + 1, 1);
  v78 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v77, v67);
  specialized Array._endMutation()(v78);
  return swift_endAccess(v87);
}

void sub_100006CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _BYTE v10[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = *(void **)(Strong + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController);
    if (v6)
    {
      v7 = objc_allocWithZone((Class)NSNumber);
      v8 = v6;
      v9 = objc_msgSend(v7, "initWithInteger:", a1);
      objc_msgSend(v8, "setHostPresentationStyle:", v9);

    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_100006DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t OpaqueTypeConformance2;
  uint64_t v18;
  uint64_t v20;

  v5 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100009344((uint64_t *)&unk_100040050);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008AFC((uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10000A480((uint64_t)v7, (uint64_t *)&unk_10003F200);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    v13 = type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle(0);
    v14 = swift_allocObject(&unk_100035418, 24, 7);
    swift_unknownObjectWeakInit(v14 + 16, v2);
    v15 = (_QWORD *)swift_allocObject(&unk_100035490, 40, 7);
    v15[2] = v14;
    v15[3] = a1;
    v15[4] = a2;
    v16 = swift_retain(a2);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v16, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v18 = sub_100009DA0(&qword_10003F2D8, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.HostPresentationStyle);
    v12 = dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)(v13, sub_10000A610, v15, v13, v18, &protocol witness table for Int, &protocol witness table for Int, &protocol witness table for Int, v8, OpaqueTypeConformance2);
    swift_release(v15);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v12;
}

void sub_100006F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_100006FEC();

  }
}

void sub_100006FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t OpaqueTypeConformance2;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v1 = v0;
  v2 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_10000A054(v5, (uint64_t)qword_100041D00);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Updating remote scene session", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession);
  if (!v10)
  {
    __break(1u);
    goto LABEL_10;
  }
  v11 = v10;
  sub_100008AFC((uint64_t)v4);
  v12 = sub_100009344((uint64_t *)&unk_100040050);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v4, 1, v12) == 1)
  {
LABEL_10:
    sub_10000A480((uint64_t)v4, (uint64_t *)&unk_10003F200);
    goto LABEL_11;
  }
  v14 = type metadata accessor for SHSheetRemoteSetting.ClientContext(0);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v14, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
  v16 = sub_10000ABC0(0, &qword_10003F210, SHSheetUIServiceClientContext_ptr);
  v17 = sub_100009DA0(&qword_10003F218, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.ClientContext);
  v18 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter(v14, v14, v16, v17, v12, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v12);
  if (v18)
  {
    sub_10001A328(v18);

    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_100007224(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t OpaqueTypeConformance2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v5 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100009344((uint64_t *)&unk_100040050);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008AFC((uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10000A480((uint64_t)v7, (uint64_t *)&unk_10003F200);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    v13 = type metadata accessor for SHSheetRemoteSetting.ClientContext(0);
    v14 = swift_allocObject(&unk_100035418, 24, 7);
    swift_unknownObjectWeakInit(v14 + 16, v2);
    v15 = (_QWORD *)swift_allocObject(&unk_100035468, 40, 7);
    v15[2] = v14;
    v15[3] = a1;
    v15[4] = a2;
    v16 = swift_retain(a2);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v16, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v18 = sub_10000ABC0(0, &qword_10003F210, SHSheetUIServiceClientContext_ptr);
    v19 = sub_100009DA0(&qword_10003F218, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.ClientContext);
    v12 = dispatch thunk of UISceneKeyValueStorage.observe<A, B>(_:handler:)(v13, sub_10000A5D4, v15, v13, v18, v19, v8, OpaqueTypeConformance2);
    swift_release(v15);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v12;
}

uint64_t sub_100007424(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t OpaqueTypeConformance2;
  uint64_t v18;
  uint64_t v20;

  v5 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100009344((uint64_t *)&unk_100040050);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008AFC((uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10000A480((uint64_t)v7, (uint64_t *)&unk_10003F200);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    v13 = type metadata accessor for SHSheetRemoteSetting.HostProcessType(0);
    v14 = swift_allocObject(&unk_100035418, 24, 7);
    swift_unknownObjectWeakInit(v14 + 16, v2);
    v15 = (_QWORD *)swift_allocObject(&unk_100035440, 40, 7);
    v15[2] = v14;
    v15[3] = a1;
    v15[4] = a2;
    v16 = swift_retain(a2);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v16, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v18 = sub_100009DA0(&qword_10003F228, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostProcessType, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.HostProcessType);
    v12 = dispatch thunk of UISceneKeyValueStorage.observe<A>(_:handler:)(v13, sub_10000A594, v15, v13, v18, &protocol witness table for Int, &protocol witness table for Int, &protocol witness table for Int, v8, OpaqueTypeConformance2);
    swift_release(v15);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v12;
}

void sub_100007618(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  void *v8;
  id v9;
  _BYTE v10[24];

  v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    v8 = *(void **)(Strong + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession);
    v9 = v8;

    if (v8)
    {
      a3(a1);

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_1000076A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  _BYTE v4[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v4, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)

}

void sub_1000076F0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t Strong;
  char *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  os_log_type_t v45;
  uint8_t *v46;
  _QWORD *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  _BYTE v52[24];
  id v53;
  uint64_t v54;

  v4 = sub_100009344(&qword_10003F2A0);
  __chkstk_darwin(v4);
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a2 + 16;
  v9 = objc_opt_self(SHSheetPulsingAction, v8);
  v10 = swift_dynamicCastObjCClass(a1, v9);
  if (v10)
  {
    v12 = (void *)v10;
    swift_beginAccess(v7, &v53, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v7);
    if (!Strong)
      return;
    v14 = (char *)Strong;
    v15 = a1;
    v16 = objc_msgSend(v12, "event");
    sub_100019934(v16);
    goto LABEL_4;
  }
  v17 = objc_opt_self(SHSheetAirDropTransferUpdateAction, v11);
  v18 = swift_dynamicCastObjCClass(a1, v17);
  if (v18)
  {
    v20 = (void *)v18;
    swift_beginAccess(v7, &v53, 0, 0);
    v21 = swift_unknownObjectWeakLoadStrong(v7);
    if (v21)
    {
      v14 = (char *)v21;
      v15 = a1;
      v16 = objc_msgSend(v20, "change");
      v22 = (id *)&v14[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView];
      swift_beginAccess(&v14[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView], v52, 0, 0);
      if (*v22)
        objc_msgSend(*v22, "didUpdateAirDropTransferWithChange:", v16);
      goto LABEL_4;
    }
  }
  else
  {
    v23 = objc_opt_self(SHSheetContentReloadAction, v19);
    v24 = swift_dynamicCastObjCClass(a1, v23);
    if (v24)
    {
      v26 = (void *)v24;
      swift_beginAccess(v7, &v53, 0, 0);
      v27 = swift_unknownObjectWeakLoadStrong(v7);
      if (v27)
      {
        v28 = (void *)v27;
        v29 = a1;
        v30 = objc_msgSend(v26, "activityUUID");
        if (v30)
        {
          v31 = v30;
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          v32 = type metadata accessor for UUID(0);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v6, 0, 1, v32);
        }
        else
        {
          v38 = type metadata accessor for UUID(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v6, 1, 1, v38);
        }
        sub_100019D68((uint64_t)v6);

        sub_10000A480((uint64_t)v6, &qword_10003F2A0);
      }
    }
    else
    {
      v33 = objc_opt_self(SHSheetScrollingTestAction, v25);
      v34 = swift_dynamicCastObjCClass(a1, v33);
      if (v34)
      {
        v36 = (void *)v34;
        swift_beginAccess(v7, &v53, 0, 0);
        v37 = swift_unknownObjectWeakLoadStrong(v7);
        if (v37)
        {
          v14 = (char *)v37;
          v15 = a1;
          v16 = objc_msgSend(v36, "test");
          sub_10001A18C(v16);
LABEL_4:

LABEL_5:
        }
      }
      else
      {
        v39 = objc_opt_self(SHSheetMetadataChangedAction, v35);
        v40 = swift_dynamicCastObjCClass(a1, v39);
        if (!v40)
        {
          if (qword_10003EE08 != -1)
            swift_once(&qword_10003EE08, sub_10000B170);
          v44 = type metadata accessor for Logger(0);
          sub_10000A054(v44, (uint64_t)qword_100041D00);
          v51 = a1;
          v15 = Logger.logObject.getter(v51);
          v45 = static os_log_type_t.error.getter();
          if (!os_log_type_enabled(v15, v45))
          {

            return;
          }
          v46 = (uint8_t *)swift_slowAlloc(12, -1);
          v47 = (_QWORD *)swift_slowAlloc(8, -1);
          *(_DWORD *)v46 = 138412290;
          v53 = v51;
          v48 = v51;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54);
          *v47 = v51;

          _os_log_impl((void *)&_mh_execute_header, v15, v45, "Scene session received unhandled action: %@", v46, 0xCu);
          v49 = sub_100009344(&qword_10003F220);
          swift_arrayDestroy(v47, 1, v49);
          swift_slowDealloc(v47, -1, -1);
          swift_slowDealloc(v46, -1, -1);
          goto LABEL_5;
        }
        v41 = (void *)v40;
        swift_beginAccess(v7, &v53, 0, 0);
        v42 = swift_unknownObjectWeakLoadStrong(v7);
        if (v42)
        {
          v14 = (char *)v42;
          v15 = a1;
          v16 = objc_msgSend(v41, "metadata");
          v43 = (id *)&v14[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView];
          swift_beginAccess(&v14[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView], v52, 0, 0);
          if (*v43)
            objc_msgSend(*v43, "reloadMetadata:", v16);
          goto LABEL_4;
        }
      }
    }
  }
}

void sub_100007BEC(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

id sub_100007C3C()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  objc_super v14;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v3 = type metadata accessor for Logger(0);
  sub_10000A054(v3, (uint64_t)qword_100041D00);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "deinit Remote scene session", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = objc_msgSend(objc_allocWithZone((Class)SHSheetAction), "initWithType:", 8);
  v8 = *(void **)&v1[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene];
  v10 = objc_opt_self(_UIHostedWindowScene, v9);
  v11 = (void *)swift_dynamicCastObjCClass(v8, v10);
  if (v11)
    v12 = v8;
  objc_msgSend(v11, "sendAction:", v7);

  v14.receiver = v1;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, "dealloc");
}

void sub_100007ED4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  os_log_t oslog;
  NSObject *osloga;
  id v24;
  uint64_t v25;

  v2 = v1;
  v3 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest))
  {
    if (qword_10003EE08 != -1)
      swift_once(&qword_10003EE08, sub_10000B170);
    v5 = type metadata accessor for Logger(0);
    sub_10000A054(v5, (uint64_t)qword_100041D00);
    v6 = a1;
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      oslog = (os_log_t)swift_slowAlloc(8, -1);
      v24 = v6;
      *(_DWORD *)v9 = 138412290;
      v10 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
      oslog->isa = (Class)v6;

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Sending collaboration cloud sharing result: %@ to host", v9, 0xCu);
      v11 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(oslog, 1, v11);
      swift_slowDealloc(oslog, -1, -1);
      swift_slowDealloc(v9, -1, -1);

    }
    else
    {

    }
    v15 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = 0;

    v16 = objc_msgSend(objc_allocWithZone((Class)SHSheetCloudShareResultAction), "initWithResult:", v6);
    v17 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
    v19 = objc_opt_self(_UIHostedWindowScene, v18);
    v20 = (void *)swift_dynamicCastObjCClass(v17, v19);
    if (v20)
      v21 = v17;
    objc_msgSend(v20, "sendAction:", v16, oslog, v24);

  }
  else
  {
    if (qword_10003EE08 != -1)
      swift_once(&qword_10003EE08, sub_10000B170);
    v12 = type metadata accessor for Logger(0);
    sub_10000A054(v12, (uint64_t)qword_100041D00);
    osloga = Logger.logObject.getter();
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(osloga, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, osloga, v13, "Can't send collaboration cloud sharing result without an active share request", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

  }
}

uint64_t sub_1000081BC(uint64_t a1)
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

id sub_100008214()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_scene);
}

uint64_t sub_100008224()
{
  uint64_t v0;
  id v1;
  unsigned int v2;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_fbsScene), "settings");
  v2 = objc_msgSend(v1, "isForeground");

  return v2 ^ 1;
}

id sub_100008280(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return objc_msgSend((id)objc_opt_self(SHSheetHostToClientActionManager, a2), "unregisterHandlerForHostedWindowScene:", v2);
}

void sub_1000082A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  void *v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  _BYTE v8[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = *(void **)(Strong + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession);
    v5 = v4;

    if (v4)
    {
      v5[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_wantsRemoteOptionsPresentation] = 0;
      v6 = *(void **)&v5[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController];
      *(_QWORD *)&v5[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController] = 0;

      v7 = *(void **)&v5[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController];
      *(_QWORD *)&v5[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController] = 0;

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100008350(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  v5 = objc_opt_self(_UIHostedWindowScene, a2);
  v7 = (id)swift_dynamicCastObjCClass(v4, v5);
  if (v7)
    v6 = v4;
  objc_msgSend(v7, "sendAction:", a2);

}

id sub_1000083BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000083D4(a1, a2, a3, a4, (SEL *)&selRef_presentUserDefaultsViewController_);
}

id sub_1000083C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000083D4(a1, a2, a3, a4, (SEL *)&selRef_presentAlertController_);
}

id sub_1000083D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v5;
  id result;

  result = *(id *)(v5 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router);
  if (result)
    return objc_msgSend(result, *a5, a2);
  __break(1u);
  return result;
}

void sub_1000083F4(uint64_t a1, uint64_t a2)
{
  sub_10000A354(a2);
}

id sub_1000083FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100008414(a1, a2, a3, (SEL *)&selRef_presentPresentationBlockingViewController);
}

id sub_100008408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100008414(a1, a2, a3, (SEL *)&selRef_dismissPresentationBlockingViewControllerIfNeeded);
}

id sub_100008414(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  id result;

  result = *(id *)(v4 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router);
  if (result)
    return objc_msgSend(result, *a4);
  __break(1u);
  return result;
}

void sub_1000084EC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  Class isa;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;

  v2 = v1;
  v3 = objc_msgSend(a1, "headerMetadata");
  if (v3)
  {
    v4 = v3;
    v5 = sub_100009344(&qword_10003F348);
    v6 = swift_allocObject(v5, 40, 7);
    *(_OWORD *)(v6 + 16) = xmmword_100027B50;
    *(_QWORD *)(v6 + 32) = v4;
    v11[0] = v6;
    specialized Array._endMutation()();
    sub_10000ABC0(0, (unint64_t *)&unk_10003F350, LPLinkMetadata_ptr);
    v7 = v4;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v11[0]);
    v9 = swift_allocObject(&unk_100035300, 24, 7);
    swift_unknownObjectWeakInit(v9 + 16, v2);
    v11[4] = sub_10000ABB8;
    v12 = v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_10000E4CC;
    v11[3] = &unk_1000354A8;
    v10 = _Block_copy(v11);
    swift_release(v12);
    SFUILinkMetadataSerializationForLocalUseOnly(isa, v10);
    _Block_release(v10);

  }
}

void sub_10000863C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *Strong;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[5];
  _QWORD *v31;
  char v32[24];

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  swift_beginAccess(a2, v32, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v13 = Strong;
    if (a1[2])
    {
      v29 = v5;
      v14 = a1[4];
      v15 = a1[5];
      sub_10000ABC0(0, (unint64_t *)&unk_10003FAB0, OS_dispatch_queue_ptr);
      v16 = sub_10000ABF8(v14, v15);
      v28 = static OS_dispatch_queue.main.getter(v16);
      v17 = (_QWORD *)swift_allocObject(&unk_1000354E0, 40, 7);
      v17[2] = v14;
      v17[3] = v15;
      v17[4] = v13;
      aBlock[4] = sub_10000ACAC;
      v31 = v17;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000081BC;
      aBlock[3] = &unk_1000354F8;
      v18 = _Block_copy(aBlock);
      v19 = v31;
      sub_10000ABF8(v14, v15);
      v20 = v13;
      v21 = swift_release(v19);
      static DispatchQoS.unspecified.getter(v21);
      aBlock[0] = &_swiftEmptyArrayStorage;
      v22 = sub_100009DA0((unint64_t *)&qword_10003F360, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v27 = v8;
      v23 = v22;
      v24 = sub_100009344((uint64_t *)&unk_10003FAC0);
      v25 = sub_10000ACB8();
      dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v4, v23);
      v26 = (void *)v28;
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v18);
      _Block_release(v18);

      sub_10000AC68(v14, v15);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v4);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v27);
    }
    else
    {

    }
  }
}

void sub_1000088A8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v6;
  Class isa;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v6 = objc_allocWithZone((Class)SHSheetMetadataUpdateAction);
  sub_10000ABF8(a1, a2);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v8 = objc_msgSend(v6, "initWithSerializedMetadata:", isa);
  sub_10000AC68(a1, a2);

  v9 = *(void **)(a3 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  v11 = objc_opt_self(_UIHostedWindowScene, v10);
  v13 = (id)swift_dynamicCastObjCClass(v9, v11);
  if (v13)
    v12 = v9;
  objc_msgSend(v13, "sendAction:", v8);

}

uint64_t sub_100008AFC@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject **v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;

  v2 = v1;
  sub_100009344((uint64_t *)&unk_10003F200);
  v4 = __chkstk_darwin();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  UIScene.hostStorage.getter(v4);
  v7 = sub_100009344((uint64_t *)&unk_100040050);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  v9 = sub_10000A480((uint64_t)v6, (uint64_t *)&unk_10003F200);
  if (v8 == 1)
  {
    if (qword_10003EE08 != -1)
      swift_once(&qword_10003EE08, sub_10000B170);
    v10 = type metadata accessor for Logger(0);
    sub_10000A054(v10, (uint64_t)qword_100041D00);
    v11 = v2;
    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v19 = a1;
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v15 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v14 = 138412290;
      v20 = v11;
      v16 = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
      *v15 = v11;

      _os_log_impl((void *)&_mh_execute_header, v12, v13, "No host storage found for scene: %@", v14, 0xCu);
      v17 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(v15, 1, v17);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);
    }
    else
    {

      v12 = v11;
    }

  }
  return UIScene.hostStorage.getter(v9);
}

void sub_100008D24(uint64_t a1, uint64_t a2, void (*a3)(void *))
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t OpaqueTypeConformance2;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[24];

  v5 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v5);
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a2 += 16;
  swift_beginAccess(a2, v18, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v9 = (void *)Strong;
    sub_100008AFC((uint64_t)v7);
    v10 = sub_100009344((uint64_t *)&unk_100040050);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) == 1)
    {
      sub_10000A480((uint64_t)v7, (uint64_t *)&unk_10003F200);
      v12 = 0;
    }
    else
    {
      v13 = type metadata accessor for SHSheetRemoteSetting.ClientContext(0);
      OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v13, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
      v15 = sub_10000ABC0(0, &qword_10003F210, SHSheetUIServiceClientContext_ptr);
      v16 = sub_100009DA0(&qword_10003F218, (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.ClientContext, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.ClientContext);
      v12 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter(v13, v13, v15, v16, v10, OpaqueTypeConformance2);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    }
    a3(v12);

  }
}

void sub_100008EC8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7, uint64_t (*a8)(uint64_t))
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t Strong;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t OpaqueTypeConformance2;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  uint64_t v28;
  _BYTE v29[24];

  v14 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  swift_beginAccess(a2, v29, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v18 = (void *)Strong;
    v27 = a3;
    sub_100008AFC((uint64_t)v16);
    v19 = sub_100009344((uint64_t *)&unk_100040050);
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v16, 1, v19) == 1)
    {
      v21 = sub_10000A480((uint64_t)v16, (uint64_t *)&unk_10003F200);
      v22 = a8(v21);
    }
    else
    {
      v23 = a5(0);
      OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v23, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
      v25 = sub_100009DA0(a6, a5, a7);
      dispatch thunk of UISceneKeyValueStorage.subscript.getter(&v28, v23, v23, v25, &protocol witness table for Int, &protocol witness table for Int, &protocol witness table for Int, v19, OpaqueTypeConformance2);
      v22 = v28;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v19);
    }
    v27(v22);

  }
}

void sub_100009070(uint64_t a1, void (*a2)(void *))
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = sub_100009344(&qword_10003F2C0);
  UITypedKeyDiff.newValue.getter(&v5, v3);
  v4 = v5;
  a2(v5);

}

void sub_1000090CC(uint64_t a1, void (*a2)(void *), uint64_t a3, uint64_t *a4, uint64_t (*a5)(_QWORD *))
{
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = sub_100009344(a4);
  v8 = UITypedKeyDiff.newValue.getter(&v11, v7);
  v9 = v11;
  if (v11)
  {
    v10 = (void *)a5(v8);

  }
  else
  {
    v10 = 0;
  }
  a2(v10);

}

uint64_t variable initialization expression of ShareIntent._shareTransport()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v18;
  _OWORD v20[4];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009344(&qword_10003EE78);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v20 - v7;
  v9 = sub_100009344(&qword_10003EE80);
  __chkstk_darwin(v9);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009344(&qword_10003EE88);
  LocalizedStringResource.init(stringLiteral:)(7368769, 0xE300000000000000);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v16 = type metadata accessor for IntentDialog(0);
  memset(v20, 0, sizeof(v20));
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v8, 1, 1, v16);
  v17(v6, 1, 1, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v18 = sub_100009384();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, v20, v8, v6, v3, v18);
}

uint64_t sub_100009344(uint64_t *a1)
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

unint64_t sub_100009384()
{
  unint64_t result;

  result = qword_10003EE90;
  if (!qword_10003EE90)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003EE90);
  }
  return result;
}

uint64_t variable initialization expression of ShareIntent._recipients()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v19 = *(_QWORD *)(v0 - 8);
  v20 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for IntentPerson.ParameterMode(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100009344(&qword_10003EE78);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100009344(&qword_10003EE80);
  __chkstk_darwin(v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009344(&qword_10003EE98);
  LocalizedStringResource.init(stringLiteral:)(0x6E65697069636552, 0xEA00000000007374);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v17 = type metadata accessor for IntentDialog(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for IntentPerson.ParameterMode.contact(_:), v3);
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v20);
  return IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)(v16, v12, v6, v9, v2);
}

uint64_t variable initialization expression of ShareIntent._mode()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  _BYTE v21[15];
  char v22;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v21[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_100009344(&qword_10003EE78);
  v5 = __chkstk_darwin(v4);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v9 = &v21[-v8];
  v10 = sub_100009344(&qword_10003EE80);
  __chkstk_darwin(v10);
  v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v21[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100009344(&qword_10003EEA0);
  LocalizedStringResource.init(stringLiteral:)(1701080909, 0xE400000000000000);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v22 = 2;
  v17 = type metadata accessor for IntentDialog(0);
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v9, 1, 1, v17);
  v18(v7, 1, 1, v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v19 = sub_1000097E8();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v16, v12, &v22, v9, v7, v3, &off_100034FE0, v19);
}

unint64_t sub_1000097E8()
{
  unint64_t result;

  result = qword_10003EEA8;
  if (!qword_10003EEA8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_10003EEA8);
  }
  return result;
}

uint64_t variable initialization expression of ShareIntent._content()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100009344(&qword_10003EE78);
  __chkstk_darwin(v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100009344(&qword_10003EE80);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LocalizedStringResource(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009344(&qword_10003EEB0);
  LocalizedStringResource.init(stringLiteral:)(0x746E65746E6F43, 0xE700000000000000);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  v20 = 0;
  v14 = type metadata accessor for IntentDialog(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v6, 1, 1, v14);
  v15 = sub_100009344(&qword_10003EEB8);
  v16 = type metadata accessor for UTType(0);
  v17 = swift_allocObject(v15, ((*(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80) | 7);
  *(_OWORD *)(v17 + 16) = xmmword_100027B60;
  static UTType.item.getter();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return IntentParameter<>.init(title:description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)(v13, v9, &v20, v17, v6, v3);
}

uint64_t variable initialization expression of ShareTransportQuery._shareIntent()
{
  uint64_t KeyPath;

  sub_100009344(&qword_10003EEC0);
  KeyPath = swift_getKeyPath(&unk_100027B70);
  return IntentParameterDependency.__allocating_init<A, B>(_:)(KeyPath);
}

uint64_t type metadata accessor for ShareSheetRemoteSceneSession(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService28ShareSheetRemoteSceneSession, a2);
}

void type metadata accessor for ActivityType(uint64_t a1)
{
  sub_10000AD70(a1, &qword_10003F1E0, (uint64_t)&unk_100035260);
}

uint64_t sub_100009AB8(uint64_t a1, uint64_t a2)
{
  return sub_100009EB4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

void sub_100009AD0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_100009ADC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_100009AE4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100009AF8(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_100009B28(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_100009B3C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_100009B50(uint64_t a1, id *a2)
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

uint64_t sub_100009BC4(uint64_t a1, id *a2)
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

uint64_t sub_100009C40@<X0>(_QWORD *a1@<X8>)
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

_QWORD *sub_100009C88@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100009C9C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100009CC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100009DA0(&qword_10003F230, (uint64_t (*)(uint64_t))type metadata accessor for ActivityType, (uint64_t)&unk_100027CCC);
  v3 = sub_100009DA0(&qword_10003F238, (uint64_t (*)(uint64_t))type metadata accessor for ActivityType, (uint64_t)&unk_100027C74);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100009D48()
{
  return sub_100009DA0(&qword_10003F1E8, (uint64_t (*)(uint64_t))type metadata accessor for ActivityType, (uint64_t)&unk_100027C3C);
}

uint64_t sub_100009D74()
{
  return sub_100009DA0(&qword_10003F1F0, (uint64_t (*)(uint64_t))type metadata accessor for ActivityType, (uint64_t)&unk_100027C14);
}

uint64_t sub_100009DA0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100009DE0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100009E24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100009DA0(&qword_10003F3A0, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100027EA4);
  v3 = sub_100009DA0(&qword_10003F3A8, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100027E44);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100009EA8(uint64_t a1, uint64_t a2)
{
  return sub_100009EB4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100009EB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100009EF0(uint64_t a1)
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

Swift::Int sub_100009F30(uint64_t a1)
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

uint64_t sub_100009FA0(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_10000A028()
{
  return sub_100009DA0(&qword_10003F1F8, (uint64_t (*)(uint64_t))type metadata accessor for ActivityType, (uint64_t)&unk_100027CA4);
}

uint64_t sub_10000A054(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_10000A06C(void *a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  _QWORD v36[5];
  uint64_t v37;
  objc_super v38;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType(v1);
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_window] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_sceneSettingsObservables] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_scene] = a1;
  v5 = v2;
  v6 = a1;
  v7 = objc_msgSend(v6, "_FBSScene");
  *(_QWORD *)&v5[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_fbsScene] = v7;
  v9 = objc_opt_self(UIWindowScene, v8);
  *(_QWORD *)&v5[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene] = swift_dynamicCastObjCClassUnconditional(v6, v9, 0, 0, 0);
  v10 = v6;

  v38.receiver = v5;
  v38.super_class = ObjectType;
  v11 = (char *)objc_msgSendSuper2(&v38, "init");
  v12 = sub_1000059C8();
  v13 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession;
  v14 = *(void **)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession];
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession] = v12;

  sub_100005CCC();
  v15 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController;
  v16 = *(void **)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController];
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController] = v17;

  v18 = sub_100006248();
  v19 = *(void **)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_window];
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_window] = v18;

  v21 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController;
  v22 = *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController];
  if (!v22)
  {
    __break(1u);
    goto LABEL_7;
  }
  v23 = *(_QWORD *)&v11[v15];
  if (!v23)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (!*(_QWORD *)&v11[v13])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v24 = objc_opt_self(UINavigationController, v20);
  v25 = objc_msgSend(objc_allocWithZone((Class)SHSheetRouter), "initWithRootViewController:mainNavigationController:supportsModalPresentations:", v22, swift_dynamicCastObjCClassUnconditional(v23, v24, 0, 0, 0), 1);
  v26 = OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router;
  v27 = *(void **)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router];
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router] = v25;

  v28 = *(void **)&v11[v26];
  if (v28)
  {
    objc_msgSend(v28, "setMainViewController:", *(_QWORD *)&v11[v21]);
    sub_100006470();
    v29 = *(void **)&v11[v13];
    v31 = (void *)objc_opt_self(SHSheetHostToClientActionManager, v30);
    v32 = swift_allocObject(&unk_100035350, 24, 7);
    swift_unknownObjectWeakInit(v32 + 16, v29);
    v36[4] = sub_10000A478;
    v37 = v32;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 1107296256;
    v36[2] = sub_100007BEC;
    v36[3] = &unk_100035368;
    v33 = _Block_copy(v36);
    v34 = v37;
    v35 = v29;
    swift_release(v34);
    objc_msgSend(v31, "registerHandler:forHostedWindowScene:", v33, v11);
    _Block_release(v33);

    return;
  }
LABEL_9:
  __break(1u);
}

void sub_10000A354(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_router);
  if (v2)
  {
    v4 = swift_allocObject(&unk_100035300, 24, 7);
    swift_unknownObjectWeakInit(v4 + 16, v1);
    v8[4] = sub_10000A458;
    v9 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_1000081BC;
    v8[3] = &unk_100035318;
    v5 = _Block_copy(v8);
    v6 = v9;
    v7 = v2;
    swift_release(v6);
    objc_msgSend(v7, "presentOptionsViewController:dismissalHandler:", a1, v5);
    _Block_release(v5);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000A434()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000A458()
{
  uint64_t v0;

  sub_1000082A8(v0);
}

uint64_t sub_10000A460(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A470(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000A478(void *a1)
{
  uint64_t v1;

  sub_1000076F0(a1, v1);
}

uint64_t sub_10000A480(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100009344(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_10000A4BC(uint64_t a1)
{
  uint64_t v1;

  sub_100006CF0(a1, v1);
}

void sub_10000A4C4(uint64_t a1)
{
  uint64_t v1;

  sub_100006F9C(a1, v1);
}

void sub_10000A4CC(uint64_t a1)
{
  uint64_t v1;

  sub_100007618(a1, v1, (void (*)(uint64_t))sub_100018C20);
}

void sub_10000A4EC(uint64_t a1)
{
  uint64_t v1;

  sub_100007618(a1, v1, (void (*)(uint64_t))sub_100019430);
}

void sub_10000A50C(uint64_t a1)
{
  uint64_t v1;

  sub_1000076A8(a1, v1);
}

uint64_t sub_10000A514()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000A538(uint64_t a1)
{
  uint64_t v1;

  sub_1000090CC(a1, *(void (**)(void *))(v1 + 16), *(_QWORD *)(v1 + 24), &qword_10003F2D0, (uint64_t (*)(_QWORD *))&SHSheetCloudSharingRequest.request.getter);
}

void sub_10000A560(uint64_t a1)
{
  uint64_t v1;

  sub_1000090CC(a1, *(void (**)(void *))(v1 + 16), *(_QWORD *)(v1 + 24), &qword_10003F2C8, (uint64_t (*)(_QWORD *))&SHSheetCollaborationOptions.shareOptionsData.getter);
}

void sub_10000A588(uint64_t a1)
{
  uint64_t v1;

  sub_100009070(a1, *(void (**)(void *))(v1 + 16));
}

void sub_10000A594(uint64_t a1)
{
  uint64_t v1;

  sub_100008EC8(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostProcessType, &qword_10003F228, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.HostProcessType, (uint64_t (*)(uint64_t))&static SHSheetRemoteSetting.HostProcessType.defaultValue.getter);
}

void sub_10000A5D4(uint64_t a1)
{
  uint64_t v1;

  sub_100008D24(a1, *(_QWORD *)(v1 + 16), *(void (**)(void *))(v1 + 24));
}

uint64_t sub_10000A5E4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10000A610(uint64_t a1)
{
  uint64_t v1;

  sub_100008EC8(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), (uint64_t (*)(uint64_t))&type metadata accessor for SHSheetRemoteSetting.HostPresentationStyle, &qword_10003F2D8, (uint64_t)&protocol conformance descriptor for SHSheetRemoteSetting.HostPresentationStyle, (uint64_t (*)(uint64_t))&static SHSheetRemoteSetting.HostPresentationStyle.defaultValue.getter);
}

void sub_10000A64C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSUUID v13;
  NSURL *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  os_log_t v24;

  sub_100009344(&qword_10003F340);
  __chkstk_darwin();
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest);
  if (v9)
  {
    v24 = v9;
    v10 = -[NSObject collaborationItemIdentifier](v24, "collaborationItemIdentifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v11 = type metadata accessor for URL(0);
    v12 = *(_QWORD *)(v11 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v4, 1, 1, v11);
    swift_errorRetain(a1);
    v13.super.isa = UUID._bridgeToObjectiveC()().super.isa;
    v15 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v4, 1, v11) != 1)
    {
      URL._bridgeToObjectiveC()(v14);
      v15 = v16;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v11);
    }
    v17 = objc_allocWithZone((Class)SFCollaborationCloudSharingResult);
    v18 = (void *)_convertErrorToNSError(_:)(a1);
    swift_errorRelease(a1);
    v19 = objc_msgSend(v17, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v13.super.isa, v15, 0, v18, 0);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_100007ED4(v19);

  }
  else
  {
    if (qword_10003EE08 != -1)
      swift_once(&qword_10003EE08, sub_10000B170);
    v20 = type metadata accessor for Logger(0);
    sub_10000A054(v20, (uint64_t)qword_100041D00);
    v24 = (os_log_t)Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v21, "Received failedToSaveShareWithError message without an active cloud share request", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

  }
}

void sub_10000A904(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSUUID v17;
  NSURL *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  os_log_t v26;

  v3 = v2;
  sub_100009344(&qword_10003F340);
  __chkstk_darwin();
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(v3 + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest);
  if (v12)
  {
    v26 = v12;
    v13 = -[NSObject collaborationItemIdentifier](v26, "collaborationItemIdentifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v14 = type metadata accessor for URL(0);
    v15 = *(_QWORD *)(v14 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v7, a1, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v14);
    v16 = a2;
    v17.super.isa = UUID._bridgeToObjectiveC()().super.isa;
    v19 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) != 1)
    {
      URL._bridgeToObjectiveC()(v18);
      v19 = v20;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
    }
    v21 = objc_msgSend(objc_allocWithZone((Class)SFCollaborationCloudSharingResult), "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v17.super.isa, v19, v16, 0, 0);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_100007ED4(v21);

  }
  else
  {
    if (qword_10003EE08 != -1)
      swift_once(&qword_10003EE08, sub_10000B170);
    v22 = type metadata accessor for Logger(0);
    sub_10000A054(v22, (uint64_t)qword_100041D00);
    v26 = (os_log_t)Logger.logObject.getter();
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v23, "Received completedSharingWithShare message without an active cloud share request", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

  }
}

void sub_10000ABB8(_QWORD *a1)
{
  uint64_t v1;

  sub_10000863C(a1, v1);
}

uint64_t sub_10000ABC0(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3, a2);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000ABF8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000AC3C()
{
  uint64_t v0;

  sub_10000AC68(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000AC68(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_10000ACAC()
{
  uint64_t v0;

  sub_1000088A8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

unint64_t sub_10000ACB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003F370;
  if (!qword_10003F370)
  {
    v1 = sub_10000AD04((uint64_t *)&unk_10003FAC0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003F370);
  }
  return result;
}

uint64_t sub_10000AD04(uint64_t *a1)
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

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_10000AD70(a1, &qword_10003F378, (uint64_t)&unk_100035530);
}

void type metadata accessor for Category(uint64_t a1)
{
  sub_10000AD70(a1, &qword_10003F380, (uint64_t)&unk_100035558);
}

void sub_10000AD70(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_10000ADB4()
{
  return sub_100009DA0(&qword_10003F388, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100027E08);
}

uint64_t sub_10000ADE0()
{
  return sub_100009DA0(&qword_10003F390, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100027DDC);
}

uint64_t sub_10000AE0C()
{
  return sub_100009DA0(&qword_10003F398, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_100027E78);
}

id sub_10000AF2C(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for AppDelegate(a1, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  objc_class *v5;
  NSString *v6;

  v5 = (objc_class *)type metadata accessor for AppDelegate(*(uint64_t *)&argc, (uint64_t)argv);
  v6 = NSStringFromClass(v5);
  UIApplicationMain(argc, (char **)argv, 0, v6);

  return 0;
}

uint64_t type metadata accessor for AppDelegate(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService11AppDelegate, a2);
}

id sub_10000AFD4(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  id v11;
  id v12;
  NSString v13;
  id v14;

  v2 = objc_msgSend(a1, "role");
  v3 = UISceneSessionRoleShareSheet;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v6 = v5;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  if (v4 == v7 && v6 == v8)
  {

    swift_bridgeObjectRelease_n(v6, 2);
  }
  else
  {
    v10 = v8;
    _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7, v8, 0);

    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v10);
  }
  v11 = objc_msgSend(a1, "role");
  v12 = objc_allocWithZone((Class)UISceneConfiguration);
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v12, "initWithName:sessionRole:", v13, v11);

  return v14;
}

uint64_t sub_10000B14C(uint64_t a1)
{
  return sub_10000B200(a1, qword_100041CE8, 0xD000000000000010, 0x8000000100028F20);
}

uint64_t sub_10000B170(uint64_t a1)
{
  return sub_10000B200(a1, qword_100041D00, 0x6568536572616853, 0xEC00000049557465);
}

uint64_t *sub_10000B198(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000B1D8(uint64_t a1)
{
  return sub_10000B200(a1, qword_100041D18, 0x746E496572616853, 0xEB00000000746E65);
}

uint64_t sub_10000B200(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_10000B198(v7, a2);
  sub_10000A054(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD00000000000001ALL, 0x8000000100028F00, a3, a4);
}

uint64_t ShareTransportEntity.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t ShareTransportEntity.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(v2[1]);
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ShareTransportEntity.id.modify())()
{
  return nullsub_1;
}

uint64_t ShareTransportEntity.displayRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(v1);
  return DisplayRepresentation.init(stringLiteral:)(v2, v1);
}

uint64_t sub_10000B320()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000B198(v0, static ShareTransportEntity.typeDisplayRepresentation);
  sub_10000A054(v0, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
  return TypeDisplayRepresentation.init(stringLiteral:)(7368769, 0xE300000000000000);
}

uint64_t ShareTransportEntity.typeDisplayRepresentation.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_10003EE18 != -1)
    swift_once(&qword_10003EE18, sub_10000B320);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000A054(v0, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
}

uint64_t static ShareTransportEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10003EE18 != -1)
    swift_once(&qword_10003EE18, sub_10000B320);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ShareTransportEntity.typeDisplayRepresentation.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  if (qword_10003EE18 != -1)
    swift_once(&qword_10003EE18, sub_10000B320);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
  swift_beginAccess(v3, v6, 33, 0);
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ShareTransportEntity.typeDisplayRepresentation.modify(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10003EE18 != -1)
    swift_once(&qword_10003EE18, sub_10000B320);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareTransportEntity.typeDisplayRepresentation);
  swift_beginAccess(v3, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_10000B57C()
{
  uint64_t KeyPath;
  uint64_t result;

  sub_100009344(&qword_10003EEC0);
  KeyPath = swift_getKeyPath(&unk_1000281C8);
  result = IntentParameterDependency.__allocating_init<A, B>(_:)(KeyPath);
  static ShareTransportEntity.defaultQuery = result;
  return result;
}

uint64_t *ShareTransportEntity.defaultQuery.unsafeMutableAddressor()
{
  if (qword_10003EE20 != -1)
    swift_once(&qword_10003EE20, sub_10000B57C);
  return &static ShareTransportEntity.defaultQuery;
}

uint64_t static ShareTransportEntity.defaultQuery.getter()
{
  _BYTE v1[24];

  if (qword_10003EE20 != -1)
    swift_once(&qword_10003EE20, sub_10000B57C);
  swift_beginAccess(&static ShareTransportEntity.defaultQuery, v1, 0, 0);
  return swift_retain(static ShareTransportEntity.defaultQuery);
}

uint64_t static ShareTransportEntity.defaultQuery.setter(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[24];

  if (qword_10003EE20 != -1)
    swift_once(&qword_10003EE20, sub_10000B57C);
  swift_beginAccess(&static ShareTransportEntity.defaultQuery, v4, 1, 0);
  v2 = static ShareTransportEntity.defaultQuery;
  static ShareTransportEntity.defaultQuery = a1;
  return swift_release(v2);
}

uint64_t (*static ShareTransportEntity.defaultQuery.modify(uint64_t a1))(_QWORD)
{
  if (qword_10003EE20 != -1)
    swift_once(&qword_10003EE20, sub_10000B57C);
  swift_beginAccess(&static ShareTransportEntity.defaultQuery, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t ShareTransportEntity.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t ShareTransportEntity.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 24));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ShareTransportEntity.title.modify())()
{
  return nullsub_1;
}

uint64_t ShareTransportEntity.activityType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t ShareTransportEntity.activityType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 40));
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ShareTransportEntity.activityType.modify())()
{
  return nullsub_1;
}

uint64_t ShareTransportEntity.appBundleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 56));
  return v1;
}

uint64_t ShareTransportEntity.appBundleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 56));
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*ShareTransportEntity.appBundleID.modify())()
{
  return nullsub_1;
}

uint64_t ShareTransportEntity.description.getter()
{
  uint64_t *v0;
  Swift::String v1;
  uint64_t v2;
  void *v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  void *v7;
  Swift::String v8;
  Swift::String v9;
  uint64_t v10;
  void *v11;
  Swift::String v12;
  Swift::String v13;
  void *v14;
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;

  _StringGuts.grow(_:)(77);
  v1._countAndFlagsBits = 0xD00000000000001CLL;
  v1._object = (void *)0x8000000100028F40;
  String.append(_:)(v1);
  v2 = *v0;
  v3 = (void *)v0[1];
  swift_bridgeObjectRetain(v3);
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(v3);
  v5._countAndFlagsBits = 0x3A656C746974202CLL;
  v5._object = (void *)0xE900000000000020;
  String.append(_:)(v5);
  v6 = v0[2];
  v7 = (void *)v0[3];
  swift_bridgeObjectRetain(v7);
  v8._countAndFlagsBits = v6;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v7);
  v9._object = (void *)0x8000000100028F60;
  v9._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v9);
  v10 = v0[4];
  v11 = (void *)v0[5];
  swift_bridgeObjectRetain(v11);
  v12._countAndFlagsBits = v10;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v11);
  v13._countAndFlagsBits = 0x6E7542707061202CLL;
  v13._object = (void *)0xEF203A4449656C64;
  String.append(_:)(v13);
  v15 = v0[6];
  v14 = (void *)v0[7];
  swift_bridgeObjectRetain(v14);
  v16._countAndFlagsBits = v15;
  v16._object = v14;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v14);
  v17._countAndFlagsBits = 62;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  return 0;
}

unint64_t sub_10000BA18()
{
  unint64_t result;

  result = qword_10003F620;
  if (!qword_10003F620)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003F620);
  }
  return result;
}

unint64_t sub_10000BA60()
{
  unint64_t result;

  result = qword_10003F628;
  if (!qword_10003F628)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003F628);
  }
  return result;
}

unint64_t sub_10000BAA8()
{
  unint64_t result;

  result = qword_10003F630;
  if (!qword_10003F630)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003F630);
  }
  return result;
}

unint64_t sub_10000BAF0()
{
  unint64_t result;

  result = qword_10003F638;
  if (!qword_10003F638)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportQuery, &type metadata for ShareTransportQuery);
    atomic_store(result, (unint64_t *)&qword_10003F638);
  }
  return result;
}

void *sub_10000BB34()
{
  return &protocol witness table for String;
}

uint64_t sub_10000BB40@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  _BYTE v4[24];

  if (qword_10003EE20 != -1)
    swift_once(&qword_10003EE20, sub_10000B57C);
  swift_beginAccess(&static ShareTransportEntity.defaultQuery, v4, 0, 0);
  v2 = static ShareTransportEntity.defaultQuery;
  *a1 = static ShareTransportEntity.defaultQuery;
  return swift_retain(v2);
}

void *sub_10000BBB4()
{
  return &protocol witness table for String;
}

uint64_t sub_10000BBC0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

unint64_t sub_10000BBD4()
{
  unint64_t result;

  result = qword_10003F640;
  if (!qword_10003F640)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003F640);
  }
  return result;
}

unint64_t sub_10000BC1C()
{
  unint64_t result;

  result = qword_10003F648;
  if (!qword_10003F648)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003F648);
  }
  return result;
}

unint64_t sub_10000BC64()
{
  unint64_t result;

  result = qword_10003F650;
  if (!qword_10003F650)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003F650);
  }
  return result;
}

unint64_t sub_10000BCAC()
{
  unint64_t result;

  result = qword_10003F658;
  if (!qword_10003F658)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003F658);
  }
  return result;
}

unint64_t sub_10000BCF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003F660;
  if (!qword_10003F660)
  {
    v1 = sub_10000AD04(&qword_10003F668);
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyResolverSpecification<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10003F660);
  }
  return result;
}

uint64_t sub_10000BD44(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100009384();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000BD80()
{
  unint64_t result;

  result = qword_10003F670;
  if (!qword_10003F670)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportEntity, &type metadata for ShareTransportEntity);
    atomic_store(result, (unint64_t *)&qword_10003F670);
  }
  return result;
}

uint64_t sub_10000BDC4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000BCAC();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for ShareTransportEntity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for ShareTransportEntity(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  return swift_bridgeObjectRelease(a1[7]);
}

_QWORD *initializeWithCopy for ShareTransportEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

_QWORD *assignWithCopy for ShareTransportEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  v10 = a2[7];
  v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for ShareTransportEntity(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for ShareTransportEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[5];
  v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = a2[7];
  v11 = a1[7];
  a1[6] = a2[6];
  a1[7] = v10;
  swift_bridgeObjectRelease(v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShareTransportEntity(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShareTransportEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShareTransportEntity()
{
  return &type metadata for ShareTransportEntity;
}

uint64_t type metadata accessor for SUISRemoteAlertPresentationManager(uint64_t a1)
{
  uint64_t result;

  result = qword_10003F688;
  if (!qword_10003F688)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SUISRemoteAlertPresentationManager);
  return result;
}

uint64_t sub_10000C0D8(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 0, 0, v2, a1 + qword_100041D50);
}

id sub_10000C114()
{
  uint64_t v0;

  if (qword_10003EE28 != -1)
    swift_once(&qword_10003EE28, sub_10000C2EC);
  return (id)swift_dynamicCastClassUnconditional(qword_10003F680, v0, 0, 0, 0);
}

void sub_10000C168(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  SFRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)(v4);

}

void sub_10000C1BC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  SFRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)(v4);

}

void sub_10000C210(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a1;
  v8 = a4;
  SFRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)(v6, a4);

}

id sub_10000C270(void *a1)
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for SUISRemoteAlertPresentationManager(0);
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10000C2B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SUISRemoteAlertPresentationManager(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000C2E4()
{
  return type metadata accessor for SUISRemoteAlertPresentationManager(0);
}

id sub_10000C2EC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SUISRemoteAlertPresentationManager(0)), "init");
  qword_10003F680 = (uint64_t)result;
  return result;
}

uint64_t sub_10000C31C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000B198(v0, qword_10003F740);
  v1 = sub_10000A054(v0, (uint64_t)qword_10003F740);
  if (qword_10003EE10 != -1)
    swift_once(&qword_10003EE10, sub_10000B1D8);
  v2 = sub_10000A054(v0, (uint64_t)qword_100041D18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10000C3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = type metadata accessor for ShareTransportEntitiesProviderActor(a1, a2);
  v3 = swift_allocObject(v2, 112, 15);
  result = swift_defaultActor_initialize();
  qword_100041D60 = v3;
  return result;
}

uint64_t sub_10000C3E4()
{
  uint64_t v0;

  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for ShareTransportEntitiesProviderActor(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService35ShareTransportEntitiesProviderActor, a2);
}

uint64_t sub_10000C420()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000C42C()
{
  if (qword_10003EE38 != -1)
    swift_once(&qword_10003EE38, sub_10000C3AC);
  return swift_retain(qword_100041D60);
}

uint64_t sub_10000C46C()
{
  uint64_t v0;

  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

uint64_t sub_10000C474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 32) = v0;
  if (qword_10003EE38 != -1)
    swift_once(&qword_10003EE38, sub_10000C3AC);
  v2 = qword_100041D60;
  *(_QWORD *)(v1 + 40) = qword_100041D60;
  return swift_task_switch(sub_10000C4DC, v2, 0);
}

uint64_t sub_10000C4DC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t (*v8)(uint64_t);

  v1 = (_QWORD *)v0[4];
  v2 = v1[3];
  if (v2)
  {
    v8 = (uint64_t (*)(uint64_t))v0[1];
    v3 = swift_bridgeObjectRetain(v2);
    return v8(v3);
  }
  else
  {
    v0[6] = v1[2];
    v5 = (void *)v1[4];
    v6 = qword_100041D60;
    v0[7] = v5;
    v0[8] = v6;
    v7 = v5;
    return swift_task_switch(sub_10000C55C, v6, 0);
  }
}

uint64_t sub_10000C55C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = v2[6];
  v3 = v2[7];
  v5 = v2[4];
  v6 = qword_100041D60;
  v7 = sub_10000D578(a1, a2);
  v8 = (_QWORD *)swift_task_alloc(48);
  v2[9] = v8;
  v8[2] = v3;
  v8[3] = v4;
  v8[4] = v5;
  v9 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v2[10] = v9;
  v10 = sub_100009344(&qword_10003F918);
  *v9 = v2;
  v9[1] = sub_10000C634;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v2 + 2, v6, v7, 0xD00000000000001BLL, 0x8000000100029080, sub_10000D5BC, v8, v10);
}

uint64_t sub_10000C634()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 80);
  *(_QWORD *)(*v1 + 88) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = *(_QWORD *)(v2 + 64);
    v5 = sub_10000C778;
  }
  else
  {
    v6 = *(_QWORD *)(v2 + 64);
    swift_task_dealloc(*(_QWORD *)(v2 + 72));
    v5 = sub_10000C6A4;
    v4 = v6;
  }
  return swift_task_switch(v5, v4, 0);
}

uint64_t sub_10000C6A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);

  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v0 + 16);
  return swift_task_switch(sub_10000C6EC, v1, 0);
}

uint64_t sub_10000C6EC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 32);
  swift_retain(v2);
  v3 = sub_10000DE94(v1);
  swift_release(v2);
  swift_bridgeObjectRelease(v1);
  v4 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v3);
}

uint64_t sub_10000C778()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  return swift_task_switch(sub_10000C7B8, v1, 0);
}

uint64_t sub_10000C7B8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C7EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  if (qword_10003EE38 != -1)
    swift_once(&qword_10003EE38, sub_10000C3AC);
  v5 = qword_100041D60;
  v4[6] = qword_100041D60;
  return swift_task_switch(sub_10000C858, v5, 0);
}

uint64_t sub_10000C858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if (v1 == 0xD00000000000002ALL && v2 == 0x8000000100028C30
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v1, v2, 0xD00000000000002ALL, 0x8000000100028C30, 0) & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)v3 = 0xD00000000000002ALL;
    *(_QWORD *)(v3 + 8) = 0x8000000100028C30;
    *(_OWORD *)(v3 + 16) = xmmword_100028260;
    *(_QWORD *)(v3 + 32) = 0xD00000000000002ALL;
    *(_QWORD *)(v3 + 40) = 0x8000000100028C30;
    *(_QWORD *)(v3 + 48) = 0xD00000000000002ALL;
    *(_QWORD *)(v3 + 56) = 0x8000000100028C30;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = (_QWORD *)swift_task_alloc(dword_10003F824);
    *(_QWORD *)(v0 + 56) = v5;
    *v5 = v0;
    v5[1] = sub_10000C924;
    return sub_10000C474();
  }
}

uint64_t sub_10000C924(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*v2 + 56);
  v4 = *v2;
  *(_QWORD *)(v4 + 64) = a1;
  swift_task_dealloc(v3);
  if (v1)
    return (*(uint64_t (**)(void))(v4 + 8))();
  else
    return swift_task_switch(sub_10000C998, *(_QWORD *)(v4 + 48), 0);
}

uint64_t sub_10000C998()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
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
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v19;

  v1 = v0;
  v2 = v0[8];
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v19 = v0;
    v4 = (uint64_t *)(v2 + 48);
    while (1)
    {
      v5 = v19[3];
      v6 = v19[4];
      v8 = *(v4 - 2);
      v7 = *(v4 - 1);
      v10 = *v4;
      v9 = v4[1];
      v11 = v4[2];
      v12 = v4[3];
      v14 = v4[4];
      v13 = v4[5];
      if (v8 == v5 && v7 == v6)
        break;
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(*(v4 - 2), *(v4 - 1), v5, v6, 0) & 1) != 0)
        goto LABEL_12;
      v4 += 8;
      if (!--v3)
      {
        v1 = v19;
        v2 = v19[8];
        goto LABEL_10;
      }
    }
    v8 = v19[3];
    v7 = v19[4];
LABEL_12:
    v1 = v19;
    v16 = v19[8];
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v13);
    swift_bridgeObjectRelease(v16);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease(v2);
    v8 = 0;
    v7 = 0;
    v10 = 0;
    v9 = 0;
    v11 = 0;
    v12 = 0;
    v14 = 0;
    v13 = 0;
  }
  v17 = (_QWORD *)v1[2];
  *v17 = v8;
  v17[1] = v7;
  v17[2] = v10;
  v17[3] = v9;
  v17[4] = v11;
  v17[5] = v12;
  v17[6] = v14;
  v17[7] = v13;
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_10000CAC0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;

  v8 = sub_100009344(&qword_10003F920);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100009344(&qword_10003F928);
  __chkstk_darwin(v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  type metadata accessor for MainActor(0);
  v16 = a2;
  v17 = a3;
  v18 = swift_retain(a4);
  v19 = static MainActor.shared.getter(v18);
  v20 = *(unsigned __int8 *)(v9 + 80);
  v21 = (v20 + 56) & ~v20;
  v22 = (char *)swift_allocObject(&unk_100035800, v21 + v10, v20 | 7);
  *((_QWORD *)v22 + 2) = v19;
  *((_QWORD *)v22 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v22 + 4) = a2;
  *((_QWORD *)v22 + 5) = v17;
  *((_QWORD *)v22 + 6) = a4;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v22[v21], v11, v8);
  v23 = sub_10000D3F4((uint64_t)v14, (uint64_t)&unk_10003F938, (uint64_t)v22);
  return swift_release(v23);
}

uint64_t sub_10000CC48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7[19] = a6;
  v7[20] = a7;
  v7[17] = a4;
  v7[18] = a5;
  v8 = sub_100009344(&qword_10003F928);
  v7[21] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MainActor(0);
  v7[22] = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v7[23] = v10;
  v7[24] = v11;
  return swift_task_switch(sub_10000CCDC, v10, v11);
}

uint64_t sub_10000CCDC()
{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;

  v1 = (void *)v0[17];
  if (v1)
  {
    v2 = (id)v0[17];
  }
  else
  {
    v3 = v0[21];
    v4 = v0[19];
    v2 = objc_msgSend(objc_allocWithZone((Class)UIActivityViewController), "initWithActivityItemsConfiguration:", v0[18]);
    objc_msgSend(v2, "setHideSuggestions:", 1);
    objc_msgSend(v2, "setExcludedActivityCategories:", 1);
    v5 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v3, 1, 1, v5);
    v6 = swift_allocObject(&unk_100035828, 24, 7);
    swift_weakInit(v6 + 16, v4);
    v7 = qword_10003EE38;
    v8 = swift_retain(v6);
    if (v7 != -1)
      v8 = swift_once(&qword_10003EE38, sub_10000C3AC);
    v10 = v0[21];
    v1 = (void *)v0[17];
    v11 = qword_100041D60;
    v12 = sub_10000D578(v8, v9);
    v13 = (_QWORD *)swift_allocObject(&unk_100035850, 48, 7);
    v13[2] = v11;
    v13[3] = v12;
    v13[4] = v6;
    v13[5] = v2;
    swift_retain(v11);
    swift_release(v6);
    v14 = sub_10000D0CC(v10, (uint64_t)&unk_10003F948, (uint64_t)v13);
    swift_release(v14);
  }
  v15 = v0 + 2;
  v0[25] = v2;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10000CEC4;
  v16 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v17 = v0 + 10;
  v17[1] = 0x40000000;
  v17[2] = sub_10000D35C;
  v17[3] = &unk_100035868;
  v17[4] = v16;
  v18 = v1;
  objc_msgSend(v2, "_findSupportedActivitiesWithCompletionHandler:", v17);
  return swift_continuation_await(v15);
}

uint64_t sub_10000CEC4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 48);
  *(_QWORD *)(*v0 + 208) = v2;
  if (v2)
    v3 = sub_10000CF94;
  else
    v3 = sub_10000CF20;
  return swift_task_switch(v3, *(_QWORD *)(v1 + 184), *(_QWORD *)(v1 + 192));
}

uint64_t sub_10000CF20()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 168);
  swift_release(*(_QWORD *)(v0 + 176));
  *(_QWORD *)(v0 + 128) = *(_QWORD *)(v0 + 120);
  v3 = sub_100009344(&qword_10003F920);
  CheckedContinuation.resume(returning:)(v0 + 128, v3);

  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000CF94()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = swift_release(*(_QWORD *)(v0 + 176));
  swift_willThrow(v3);

  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000CFE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  if (qword_10003EE38 != -1)
    swift_once(&qword_10003EE38, sub_10000C3AC);
  return swift_task_switch(sub_10000D04C, qword_100041D60, 0);
}

uint64_t sub_10000D04C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v1 = *(_QWORD *)(v0 + 48) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v1);
  v3 = Strong;
  if (Strong)
  {
    v4 = *(void **)(v0 + 56);
    v5 = *(void **)(Strong + 32);
    *(_QWORD *)(Strong + 32) = v4;
    v6 = v4;

    swift_release(v3);
  }
  **(_BYTE **)(v0 + 40) = v3 == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D0CC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000E274(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_100035890, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = sub_100009344(&qword_10003F970);
  if (v14 | v12)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v12;
    v20[3] = v14;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, v17, &unk_10003F968, v16);
}

uint64_t sub_10000D218(uint64_t a1, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000E274(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_1000358B8, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10003F980, v16);
}

uint64_t sub_10000D35C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  unint64_t v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_100009344(&qword_10003F958);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    v11 = sub_10000E384(0, a2);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v11);
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10000D3F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD *v15;
  unsigned __int8 v16;
  _QWORD v18[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000E274(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
    {
LABEL_6:
      v15 = 0;
      return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
      goto LABEL_6;
  }
  v10 = *(_QWORD *)(a3 + 24);
  ObjectType = swift_getObjectType(v9);
  swift_unknownObjectRetain(v9);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  v14 = v13;
  swift_unknownObjectRelease(v9);
  if (!(v14 | v12))
    goto LABEL_6;
  v18[0] = 0;
  v18[1] = 0;
  v15 = v18;
  v18[2] = v12;
  v18[3] = v14;
  return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_10000D520()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ShareTransportEntitiesProvider(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService30ShareTransportEntitiesProvider, a2);
}

unint64_t sub_10000D578(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v3;

  result = qword_10003F910;
  if (!qword_10003F910)
  {
    v3 = type metadata accessor for ShareTransportEntitiesProviderActor(0, a2);
    result = swift_getWitnessTable(&unk_100028340, v3);
    atomic_store(result, (unint64_t *)&qword_10003F910);
  }
  return result;
}

uint64_t sub_10000D5BC(uint64_t a1)
{
  uint64_t v1;

  return sub_10000CAC0(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

id sub_10000D5C8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  NSString v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v15;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v15 = 0;
  v9 = objc_msgSend(v4, "initWithBundleIdentifier:requireValid:platform:error:", v8, a3 & 1, a4, &v15);

  v10 = v15;
  if (v9)
  {
    v11 = v15;
  }
  else
  {
    v12 = v15;
    _convertNSErrorToError(_:)(v10);

    swift_willThrow(v13);
  }
  return v9;
}

uint64_t sub_10000D6A8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000D70C;
  return v6(a1);
}

uint64_t sub_10000D70C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000D758(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_10000D778(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000D798(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_10000D800;
  return v5(v2 + 32);
}

uint64_t sub_10000D800()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 24));
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

unint64_t sub_10000D850(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = String.index(_:offsetBy:limitedBy:)(15, result, v5, a2, a3);
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D8EC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v14;
  unint64_t v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  Swift::String v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t active_platform;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;

  if (!a2)
    return 0;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIActivityTypeMessage);
  v6 = v5;
  if (v4 == a1 && v5 == a2)
  {
    v9 = v5;
    goto LABEL_10;
  }
  v8 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v4, v5, 0);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRelease(v6);
  if ((v8 & 1) != 0)
  {
    v9 = a2;
LABEL_10:
    swift_bridgeObjectRelease(v9);
    return 0xD000000000000013;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIActivityTypeMail);
  v12 = v11;
  if (v10 == a1 && v11 == a2)
    goto LABEL_17;
  v14 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v10, v11, 0);
  swift_bridgeObjectRelease(v12);
  if ((v14 & 1) != 0)
  {
    a1 = 0xD000000000000014;
    v15 = a2;
LABEL_18:
    swift_bridgeObjectRelease(v15);
    return a1;
  }
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIActivityTypeAirDrop);
  v19 = v18;
  if (v17 == a1 && v18 == a2)
  {
    swift_bridgeObjectRelease(a2);
    v22 = v19;
    goto LABEL_27;
  }
  v21 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v17, v18, 0);
  swift_bridgeObjectRelease(v19);
  if ((v21 & 1) != 0)
  {
    v22 = a2;
LABEL_27:
    swift_bridgeObjectRelease(v22);
    return static String._unconditionallyBridgeFromObjectiveC(_:)(UIActivityTypeAirDrop);
  }
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIActivityTypePostToTwitter);
  v12 = v23;
  if (v24 == a1 && v23 == a2)
  {
LABEL_17:
    a1 = 0xD000000000000014;
    swift_bridgeObjectRelease(a2);
    v15 = v12;
    goto LABEL_18;
  }
  v25 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v24, v23, 0);
  swift_bridgeObjectRelease(v12);
  if ((v25 & 1) != 0)
  {
    a1 = 0xD000000000000014;
    v15 = a2;
    goto LABEL_18;
  }
  v26._countAndFlagsBits = 0xD000000000000025;
  v26._object = (void *)0x80000001000290A0;
  if (String.hasPrefix(_:)(v26))
  {
    v27 = String.count.getter(0xD000000000000025, 0x80000001000290A0);
    v28 = sub_10000D850(v27, a1, a2);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    swift_bridgeObjectRelease(a2);
    a1 = static String._fromSubstring(_:)(v28, v30, v32, v34);
    swift_bridgeObjectRelease(v34);
  }
  else
  {
    v35 = swift_bridgeObjectRetain(a2);
    active_platform = dyld_get_active_platform(v35);
    v37 = objc_allocWithZone((Class)LSApplicationExtensionRecord);
    v38 = sub_10000D5C8(a1, a2, 0, active_platform);
    v39 = objc_msgSend(v38, "containingBundleRecord");
    if (v39
      && (v40 = v39,
          v41 = objc_msgSend(v39, "bundleIdentifier"),
          v40,
          v41))
    {
      a1 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
      swift_bridgeObjectRelease(a2);

    }
    else
    {

    }
  }
  return a1;
}

_QWORD *sub_10000DE94(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_23;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  if (!v2)
    return _swiftEmptyArrayStorage;
  result = (_QWORD *)sub_100014A20(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    v30 = v1 & 0xC000000000000001;
    v31 = v2;
    v32 = v1;
    while (1)
    {
      if (v2 == v4)
      {
        __break(1u);
LABEL_23:
        if (v1 < 0)
          v29 = v1;
        else
          v29 = v1 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v1);
        v2 = _CocoaArrayWrapper.endIndex.getter(v29);
        swift_bridgeObjectRelease(v1);
        goto LABEL_3;
      }
      if (v30)
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      else
        v5 = *(id *)(v1 + 8 * v4 + 32);
      v6 = v5;
      v7 = objc_msgSend(v6, "identifier");
      if (v7)
      {
        v8 = v7;
        v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
        v11 = v10;

      }
      else
      {
        v9 = 0;
        v11 = 0;
      }
      v12 = sub_10000D8EC(v9, v11);
      v14 = v13;
      swift_bridgeObjectRelease(v11);
      v15 = objc_msgSend(v6, "title");
      v33 = v14;
      if (!v15)
        goto LABEL_17;
      v16 = v15;
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v19 = v18;

      v20 = objc_msgSend(v6, "identifier");
      if (!v20)
        break;
      v21 = v20;
      v22 = v12;
      v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      v25 = v24;

      swift_bridgeObjectRetain(v25);
LABEL_18:

      v27 = _swiftEmptyArrayStorage[2];
      v26 = _swiftEmptyArrayStorage[3];
      if (v27 >= v26 >> 1)
        sub_100014A20(v26 > 1, v27 + 1, 1);
      ++v4;
      _swiftEmptyArrayStorage[2] = v27 + 1;
      v28 = &_swiftEmptyArrayStorage[8 * v27];
      v28[4] = v23;
      v28[5] = v25;
      v28[6] = v17;
      v28[7] = v19;
      v28[8] = v23;
      v28[9] = v25;
      v1 = v32;
      v28[10] = v22;
      v28[11] = v33;
      v2 = v31;
      if (v31 == v4)
        return _swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease(v19);
LABEL_17:
    v22 = v12;

    v23 = 0;
    v17 = 0;
    v25 = 0xE000000000000000;
    v19 = 0xE000000000000000;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E0F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100009344(&qword_10003F920);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 48));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000E180(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_100009344(&qword_10003F920) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = v1[6];
  v10 = (uint64_t)v1 + ((v4 + 56) & ~v4);
  v11 = (_QWORD *)swift_task_alloc(dword_10003F934);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_10000E22C;
  return sub_10000CC48(a1, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10000E22C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000E274(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100009344(&qword_10003F928);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E2B4()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000E2D8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E30C(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10003F944);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000E22C;
  return sub_10000CFE4(a1, v4, v5, v7, v6);
}

unint64_t sub_10000E384(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v3;

  result = qword_10003F950;
  if (!qword_10003F950)
  {
    v3 = objc_opt_self(SFShareSheetRemoteActivity, a2);
    result = swift_getObjCClassMetadata(v3);
    atomic_store(result, (unint64_t *)&qword_10003F950);
  }
  return result;
}

uint64_t sub_10000E3C0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E3E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003F964);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000E4C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003F960 + dword_10003F960))(a1, v4);
}

uint64_t sub_10000E454(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003F97C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000E4C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003F978 + dword_10003F978))(a1, v4);
}

uint64_t sub_10000E4CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;

  v3 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for Data);
  swift_retain(v2);
  v3(v4);
  swift_release(v2);
  return swift_bridgeObjectRelease(v4);
}

id sub_10000E630()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ShareSheetSceneActionHandler(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService28ShareSheetSceneActionHandler, a2);
}

void sub_10000E698(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  id v5;
  id v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v23;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene] = a1;
  v4 = v1;
  v5 = a1;
  v6 = objc_msgSend(v5, "_FBSScene");
  *(_QWORD *)&v4[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene] = v6;

  v23.receiver = v4;
  v23.super_class = ObjectType;
  v7 = (char *)objc_msgSendSuper2(&v23, "init");
  v8 = sub_10000E82C();
  v9 = OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession;
  v10 = *(void **)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession];
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession] = v8;

  sub_10000EA6C();
  v11 = OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController;
  v12 = *(void **)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController];
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController] = v13;

  v16 = sub_10000EEA0(v14, v15);
  v17 = *(void **)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window];
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window] = v16;

  v18 = *(_QWORD *)&v7[v11];
  if (!v18)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (!*(_QWORD *)&v7[v9])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v19 = objc_msgSend(objc_allocWithZone((Class)SHSheetRouter), "initWithRootViewController:supportsModalPresentations:", v18, 1);
  v20 = OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router;
  v21 = *(void **)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router];
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router] = v19;

  v22 = *(void **)&v7[v20];
  if (v22)
  {
    objc_msgSend(v22, "setMainViewController:", *(_QWORD *)&v7[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController]);
    sub_10000F044();

    return;
  }
LABEL_7:
  __break(1u);
}

char *sub_10000E82C()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  char *v16;
  char *v17;
  void *v19;
  uint64_t v20;

  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v1 = type metadata accessor for Logger(0);
  sub_10000A054(v1, (uint64_t)qword_100041D00);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v7 = *(void **)&v2[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene];
    v19 = v7;
    v8 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20);
    *v6 = v7;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "create new share sheet session for scene:%@", v5, 0xCu);
    v9 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v6, 1, v9);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  v10 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene], "settings");
  v12 = objc_opt_self(SHSheetSceneSettings, v11);
  v13 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v10, v12, 0, 0, 0), "sessionContext");

  v15 = objc_allocWithZone((Class)type metadata accessor for ShareSheetUISession(0, v14));
  v16 = sub_10001A5B0(v13);
  v17 = &v16[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate];
  *((_QWORD *)v17 + 1) = &off_100035910;
  swift_unknownObjectWeakAssign(v17, v2);
  return v16;
}

void sub_10000EA6C()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  _BYTE v28[24];

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  v2 = objc_msgSend(v1, "settings");
  v4 = objc_opt_self(SHSheetSceneSettings, v3);
  v5 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v2, v4, 0, 0, 0), "sessionContext");

  v6 = objc_msgSend(objc_allocWithZone((Class)UIActivityContentContext), "init");
  objc_msgSend(v6, "setIsRemote:", 1);
  objc_msgSend(v6, "setCanRenderPeople:", 1);
  objc_msgSend(v6, "setConfigureForCloudSharing:", objc_msgSend(v5, "configureForCloudSharing"));
  objc_msgSend(v6, "setConfigureForPhotosEdit:", objc_msgSend(v5, "configureForPhotosEdit"));
  objc_msgSend(v6, "setHideHeaderView:", objc_msgSend(v5, "hideHeaderView"));
  objc_msgSend(v6, "setSharingExpanded:", objc_msgSend(v5, "isSharingExpanded"));
  v7 = objc_msgSend(v5, "topContentSectionText");
  objc_msgSend(v6, "setTopContentSectionText:", v7);

  v8 = objc_msgSend(v5, "applicationActivityTypes");
  objc_msgSend(v6, "setApplicationActivityTypes:", v8);

  v9 = objc_msgSend(v5, "heroActionActivityTypes");
  objc_msgSend(v6, "setHeroActionActivityTypes:", v9);

  objc_msgSend(v6, "setShowHeroActionsHorizontally:", objc_msgSend(v5, "showHeroActionsHorizontally"));
  v10 = objc_msgSend(v5, "tintColor");
  objc_msgSend(v6, "setTintColor:", v10);

  v11 = objc_msgSend(v1, "hostAuditToken");
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v6, "setHostAuditToken:", v11);
    v13 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession);
    if (!v13)
      goto LABEL_7;
    v14 = *(void **)(v13 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken);
    *(_QWORD *)(v13 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken) = v12;

  }
  v15 = objc_msgSend(objc_allocWithZone((Class)UIActivityContentViewController), "initWithContext:", v6);
  objc_msgSend(v15, "setDelegate:", v0);
  v16 = OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession;
  objc_msgSend(v15, "setPresenter:", *(_QWORD *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession));
  v17 = objc_msgSend(v1, "settings");
  v19 = objc_opt_self(SHSheetSceneSettings, v18);
  v20 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v17, v19, 0, 0, 0), "presentationStyle");

  v21 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v20);
  objc_msgSend(v15, "setHostPresentationStyle:", v21);

  v22 = *(_QWORD *)(v0 + v16);
  if (v22)
  {
    v23 = (uint64_t *)(v22 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
    swift_beginAccess(v22 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView, v28, 1, 0);
    v24 = *v23;
    *v23 = (uint64_t)v15;
    v25 = v15;
    swift_unknownObjectRelease(v24);
    v26 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController);
    *(_QWORD *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController) = v15;
    v27 = v25;

    objc_msgSend(objc_msgSend(objc_allocWithZone((Class)SUISNavigationController), "initWithRootViewController:", v27), "setSheetInteractionDelegate:", v0);
    return;
  }
  __break(1u);
LABEL_7:
  __break(1u);
}

id sub_10000EEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id result;
  uint64_t v17;
  void *v18;

  v3 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene);
  v4 = objc_opt_self(UIWindowScene, a2);
  v5 = swift_dynamicCastObjCClassUnconditional(v3, v4, 0, 0, 0);
  v6 = objc_allocWithZone((Class)UIWindow);
  v7 = v3;
  v8 = objc_msgSend(v6, "initWithWindowScene:", v5);
  objc_msgSend(v8, "setRootViewController:", *(_QWORD *)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController));
  v9 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  v10 = v8;
  v11 = objc_msgSend(v9, "settings");
  v13 = objc_opt_self(SHSheetSceneSettings, v12);
  v14 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v11, v13, 0, 0, 0), "sessionContext");

  v15 = objc_msgSend(v14, "tintColor");
  objc_msgSend(v10, "setTintColor:", v15);

  result = objc_msgSend(v10, "_rootSheetPresentationController");
  if (result)
  {
    v18 = result;
    objc_msgSend((id)objc_opt_self(SUISPresentationControllerHelper, v17), "configureSheetPresentationController:", result);

    objc_msgSend(v10, "makeKeyAndVisible");
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000F044()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  uint64_t (**v7)(void *);
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  Class isa;
  id v15;
  NSString v16;
  id v17;
  uint64_t v18;
  objc_super v19;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession);
  v2 = swift_allocObject(&unk_100035998, 24, 7);
  v3 = swift_unknownObjectWeakInit(v2 + 16, v1);
  v5 = (objc_class *)type metadata accessor for ShareSheetSceneActionHandler(v3, v4);
  v6 = (char *)objc_allocWithZone(v5);
  v7 = (uint64_t (**)(void *))&v6[OBJC_IVAR____TtC16SharingUIService28ShareSheetSceneActionHandler_handler];
  *v7 = sub_100010FD0;
  v7[1] = (uint64_t (*)(void *))v2;
  v19.receiver = v6;
  v19.super_class = v5;
  v8 = v1;
  v9 = objc_msgSendSuper2(&v19, "init");
  v10 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene);
  v11 = sub_100009344(&qword_10003F348);
  v12 = swift_allocObject(v11, 40, 7);
  *(_OWORD *)(v12 + 16) = xmmword_100027B50;
  *(_QWORD *)(v12 + 32) = v9;
  v18 = v12;
  specialized Array._endMutation()(v12);
  v13 = v9;
  sub_100009344((uint64_t *)&unk_10003FAA0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  v15 = objc_allocWithZone((Class)NSString);
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v15, "initWithString:", v16);

  objc_msgSend(v10, "_registerBSActionResponderArray:forKey:", isa, v17);
}

id sub_10000F1D0()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  id result;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  Class isa;
  objc_super v10;
  id v11;
  void *v12;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  result = *(id *)&v0[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window];
  if (result)
  {
    result = objc_msgSend(result, "_rootSheetPresentationController");
    if (result)
    {
      v5 = result;
      objc_msgSend((id)objc_opt_self(SUISPresentationControllerHelper, v4), "resetSheetPresentationController:", result);

      v12 = &_swiftEmptySetSingleton;
      v6 = objc_msgSend(objc_allocWithZone((Class)SHSheetAction), "initWithType:", 8);
      sub_100010204((Swift::Int *)&v11, v6);

      v7 = *(void **)&v1[OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene];
      v8 = v12;
      sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
      sub_1000104A0();
      isa = Set._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v8);
      objc_msgSend(v7, "sendActions:", isa);

      v10.receiver = v1;
      v10.super_class = ObjectType;
      return objc_msgSendSuper2(&v10, "dealloc");
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F3D4(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t Strong;
  char *v14;
  id v15;
  id v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id *v43;
  _BYTE v44[24];
  _BYTE v45[24];

  v4 = sub_100009344(&qword_10003F2A0);
  __chkstk_darwin(v4);
  v6 = &v44[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a2 + 16;
  v9 = objc_opt_self(SHSheetPulsingAction, v8);
  v10 = swift_dynamicCastObjCClass(a1, v9);
  if (v10)
  {
    v12 = (void *)v10;
    swift_beginAccess(v7, v45, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v7);
    if (!Strong)
      return 1;
    v14 = (char *)Strong;
    v15 = a1;
    v16 = objc_msgSend(v12, "event");
    sub_100019934(v16);
LABEL_4:

    return 1;
  }
  v18 = objc_opt_self(SHSheetAirDropTransferUpdateAction, v11);
  v19 = swift_dynamicCastObjCClass(a1, v18);
  if (v19)
  {
    v21 = (void *)v19;
    swift_beginAccess(v7, v45, 0, 0);
    v22 = swift_unknownObjectWeakLoadStrong(v7);
    if (!v22)
      return 1;
    v14 = (char *)v22;
    v15 = a1;
    v16 = objc_msgSend(v21, "change");
    v23 = (id *)&v14[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView];
    swift_beginAccess(&v14[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView], v44, 0, 0);
    if (*v23)
      objc_msgSend(*v23, "didUpdateAirDropTransferWithChange:", v16);
    goto LABEL_4;
  }
  v24 = objc_opt_self(SHSheetContentReloadAction, v20);
  v25 = swift_dynamicCastObjCClass(a1, v24);
  if (v25)
  {
    v27 = (void *)v25;
    swift_beginAccess(v7, v45, 0, 0);
    v28 = swift_unknownObjectWeakLoadStrong(v7);
    if (v28)
    {
      v29 = (void *)v28;
      v30 = a1;
      v31 = objc_msgSend(v27, "activityUUID");
      if (v31)
      {
        v32 = v31;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        v33 = type metadata accessor for UUID(0);
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v6, 0, 1, v33);
      }
      else
      {
        v39 = type metadata accessor for UUID(0);
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v6, 1, 1, v39);
      }
      sub_100019D68((uint64_t)v6);

      sub_100010FD8((uint64_t)v6);
    }
    return 1;
  }
  v34 = objc_opt_self(SHSheetScrollingTestAction, v26);
  v35 = swift_dynamicCastObjCClass(a1, v34);
  if (v35)
  {
    v37 = (void *)v35;
    swift_beginAccess(v7, v45, 0, 0);
    v38 = swift_unknownObjectWeakLoadStrong(v7);
    if (!v38)
      return 1;
    v14 = (char *)v38;
    v15 = a1;
    v16 = objc_msgSend(v37, "test");
    sub_10001A18C(v16);
    goto LABEL_4;
  }
  v40 = objc_opt_self(SHSheetMetadataChangedAction, v36);
  result = swift_dynamicCastObjCClass(a1, v40);
  if (result)
  {
    v41 = (void *)result;
    swift_beginAccess(v7, v45, 0, 0);
    v42 = swift_unknownObjectWeakLoadStrong(v7);
    if (!v42)
      return 1;
    v14 = (char *)v42;
    v15 = a1;
    v16 = objc_msgSend(v41, "metadata");
    v43 = (id *)&v14[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView];
    swift_beginAccess(&v14[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView], v44, 0, 0);
    if (*v43)
      objc_msgSend(*v43, "reloadMetadata:", v16);
    goto LABEL_4;
  }
  return result;
}

void sub_10000F748()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[3];
  uint64_t v29;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_uiSession);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  v2 = v0;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  v4 = v1;
  v5 = objc_msgSend(v3, "settings");
  v7 = objc_opt_self(SHSheetSceneSettings, v6);
  v8 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v5, v7, 0, 0, 0), "sessionContext");

  sub_10001A328(v8);
  v9 = objc_msgSend(v3, "settings");
  v11 = objc_opt_self(SHSheetSceneSettings, v10);
  v12 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v9, v11, 0, 0, 0), "sheetConfiguration");

  _bridgeAnyObjectToAny(_:)(v28, v12);
  swift_unknownObjectRelease(v12);
  v13 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_window);
  if (!v13)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v14 = objc_msgSend(v13, "_rootSheetPresentationController");
  if (!v14)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v16 = v14;
  v17 = (void *)objc_opt_self(SUISPresentationControllerHelper, v15);
  v18 = v29;
  v19 = sub_1000101C0(v28, v29);
  v20 = _bridgeAnythingToObjectiveC<A>(_:)(v19, v18);
  objc_msgSend(v17, "updateSheetPresentationController:withConfiguration:", v16, v20);

  swift_unknownObjectRelease(v20);
  v21 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController);
  if (v21)
  {
    v22 = v21;
    v23 = objc_msgSend(v3, "settings");
    v25 = objc_opt_self(SHSheetSceneSettings, v24);
    v26 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v23, v25, 0, 0, 0), "presentationStyle");

    v27 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v26);
    objc_msgSend(v22, "setHostPresentationStyle:", v27);

    sub_1000101E4(v28);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t type metadata accessor for ShareSheetSceneSession(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService22ShareSheetSceneSession, a2);
}

id sub_10000F9FC()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_scene);
}

BOOL sub_10000FA0C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene), "settings"));
  v3 = objc_opt_self(SHSheetSceneSettings, v2);
  v4 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v1, v3, 0, 0, 0), "applicationState");

  return v4 == (id)2;
}

id sub_10000FA88()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene), "settings"));
  v3 = objc_opt_self(SHSheetSceneSettings, v2);
  v4 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v1, v3, 0, 0, 0), "hostProcessType");

  return v4;
}

void sub_10000FB04(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  Class isa;
  id v6;
  void *v7;

  v7 = &_swiftEmptySetSingleton;
  sub_100010204((Swift::Int *)&v6, a2);

  v3 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  v4 = v7;
  sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
  sub_1000104A0();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v3, "sendActions:", isa);

}

id sub_10000FBBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000FBD4(a1, a2, a3, a4, (SEL *)&selRef_presentUserDefaultsViewController_);
}

id sub_10000FBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000FBD4(a1, a2, a3, a4, (SEL *)&selRef_presentAlertController_);
}

id sub_10000FBD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v5;
  id result;

  result = *(id *)(v5 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router);
  if (result)
    return objc_msgSend(result, *a5, a2);
  __break(1u);
  return result;
}

void sub_10000FC40(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  Class isa;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;

  v2 = v1;
  v3 = objc_msgSend(a1, "headerMetadata");
  if (v3)
  {
    v4 = v3;
    v5 = sub_100009344(&qword_10003F348);
    v6 = swift_allocObject(v5, 40, 7);
    *(_OWORD *)(v6 + 16) = xmmword_100027B50;
    *(_QWORD *)(v6 + 32) = v4;
    v11[0] = v6;
    specialized Array._endMutation()();
    sub_10000ABC0(0, (unint64_t *)&unk_10003F350, LPLinkMetadata_ptr);
    v7 = v4;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v11[0]);
    v9 = swift_allocObject(&unk_1000359C0, 24, 7);
    swift_unknownObjectWeakInit(v9 + 16, v2);
    v11[4] = sub_1000114A4;
    v12 = v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_10000E4CC;
    v11[3] = &unk_1000359D8;
    v10 = _Block_copy(v11);
    swift_release(v12);
    SFUILinkMetadataSerializationForLocalUseOnly(isa, v10);
    _Block_release(v10);

  }
}

void sub_10000FD90(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *Strong;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[5];
  _QWORD *v31;
  char v32[24];

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  swift_beginAccess(a2, v32, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v13 = Strong;
    if (a1[2])
    {
      v29 = v5;
      v14 = a1[4];
      v15 = a1[5];
      sub_10000ABC0(0, (unint64_t *)&unk_10003FAB0, OS_dispatch_queue_ptr);
      v16 = sub_10000ABF8(v14, v15);
      v28 = static OS_dispatch_queue.main.getter(v16);
      v17 = (_QWORD *)swift_allocObject(&unk_100035A10, 40, 7);
      v17[2] = v14;
      v17[3] = v15;
      v17[4] = v13;
      aBlock[4] = sub_1000114F0;
      v31 = v17;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000081BC;
      aBlock[3] = &unk_100035A28;
      v18 = _Block_copy(aBlock);
      v19 = v31;
      sub_10000ABF8(v14, v15);
      v20 = v13;
      v21 = swift_release(v19);
      static DispatchQoS.unspecified.getter(v21);
      aBlock[0] = &_swiftEmptyArrayStorage;
      v22 = sub_1000114FC();
      v27 = v8;
      v23 = v22;
      v24 = sub_100009344((uint64_t *)&unk_10003FAC0);
      v25 = sub_10000ACB8();
      dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v4, v23);
      v26 = (void *)v28;
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v18);
      _Block_release(v18);

      sub_10000AC68(v14, v15);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v4);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v27);
    }
    else
    {

    }
  }
}

void sub_10000FFE4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v6;
  Class isa;
  id v8;
  id v9;
  void *v10;
  void *v11;
  Class v12;
  id v13;
  void *v14;

  v6 = objc_allocWithZone((Class)SHSheetMetadataUpdateAction);
  sub_10000ABF8(a1, a2);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v8 = objc_msgSend(v6, "initWithSerializedMetadata:", isa);
  sub_10000AC68(a1, a2);

  v14 = &_swiftEmptySetSingleton;
  v9 = v8;
  sub_100010204((Swift::Int *)&v13, v9);

  v10 = *(void **)(a3 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  v11 = v14;
  sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
  sub_1000104A0();
  v12 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  objc_msgSend(v10, "sendActions:", v12);

}

_QWORD *sub_1000101C0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000101E4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100010204(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  Swift::Int v32;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v31 = v9;
      v10 = sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v23 = sub_1000104F8(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_1000106EC(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_100010988((uint64_t)v8, v25);
    v28 = *v3;
    *v3 = v25;
  }
  else
  {
    v12 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v13 = NSObject._rawHashValue(seed:)(v12);
    v14 = -1 << *(_BYTE *)(v6 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v21 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        v22 = v21;
        return 0;
      }
      v18 = ~v14;
      while (1)
      {
        v15 = (v15 + 1) & v18;
        if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          break;
        v19 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
        v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_100010A08((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

unint64_t sub_1000104A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003FA88;
  if (!qword_10003FA88)
  {
    v1 = sub_10000ABC0(255, &qword_10003FA80, BSAction_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10003FA88);
  }
  return result;
}

Swift::Int sub_1000104F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_100009344((uint64_t *)&unk_10003FA90);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_1000106EC(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_1000106EC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100009344((uint64_t *)&unk_10003FA90);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_100010988(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_100010A08(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1000106EC(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_100010B8C();
      goto LABEL_14;
    }
    sub_100010D34(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

id sub_100010B8C()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100009344((uint64_t *)&unk_10003FA90);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_100010D34(uint64_t a1)
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
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100009344((uint64_t *)&unk_10003FA90);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100010FAC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010FD0(void *a1)
{
  uint64_t v1;

  return sub_10000F3D4(a1, v1);
}

uint64_t sub_100010FD8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100009344(&qword_10003F2A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100011018(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28[2];
  _QWORD v29[5];

  v2 = v1;
  v3 = a1;
  v28[1] = (id)a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(a1, 2);
    v5 = __CocoaSet.makeIterator()(v4);
    v6 = sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
    v7 = sub_1000104A0();
    v8 = Set.Iterator.init(_cocoa:)(v29, v5, v6, v7);
    v3 = v29[0];
    v26 = v29[1];
    v9 = v29[2];
    v10 = v29[3];
    v11 = v29[4];
  }
  else
  {
    v12 = -1 << *(_BYTE *)(a1 + 32);
    v26 = a1 + 56;
    v9 = ~v12;
    v13 = -v12;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v11 = v14 & *(_QWORD *)(a1 + 56);
    v8 = (_QWORD *)swift_bridgeObjectRetain_n(a1, 2);
    v10 = 0;
  }
  v15 = (unint64_t)(v9 + 64) >> 6;
  while (v3 < 0)
  {
    v19 = __CocoaSet.Iterator.next()(v8);
    if (!v19)
      goto LABEL_36;
    v20 = v19;
    v27 = v19;
    v21 = sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
    swift_unknownObjectRetain(v20);
    swift_dynamicCast(v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v21, 7);
    v22 = v28[0];
    swift_unknownObjectRelease(v20);
    v18 = v10;
    v16 = v11;
    if (!v22)
      goto LABEL_36;
LABEL_34:
    if (((*(uint64_t (**)(id))(v2 + OBJC_IVAR____TtC16SharingUIService28ShareSheetSceneActionHandler_handler))(v22) & 1) != 0)
    {

    }
    else
    {
      sub_100010204((Swift::Int *)v28, v22);

    }
    v10 = v18;
    v11 = v16;
  }
  if (v11)
  {
    v16 = (v11 - 1) & v11;
    v17 = __clz(__rbit64(v11)) | (v10 << 6);
    v18 = v10;
LABEL_33:
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    if (!v22)
      goto LABEL_36;
    goto LABEL_34;
  }
  v23 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v23 >= v15)
      goto LABEL_36;
    v24 = *(_QWORD *)(v26 + 8 * v23);
    v18 = v10 + 1;
    if (!v24)
    {
      v18 = v10 + 2;
      if (v10 + 2 >= v15)
        goto LABEL_36;
      v24 = *(_QWORD *)(v26 + 8 * v18);
      if (!v24)
      {
        v18 = v10 + 3;
        if (v10 + 3 >= v15)
          goto LABEL_36;
        v24 = *(_QWORD *)(v26 + 8 * v18);
        if (!v24)
        {
          v18 = v10 + 4;
          if (v10 + 4 >= v15)
            goto LABEL_36;
          v24 = *(_QWORD *)(v26 + 8 * v18);
          if (!v24)
          {
            v25 = v10 + 5;
            while (v15 != v25)
            {
              v24 = *(_QWORD *)(v26 + 8 * v25++);
              if (v24)
              {
                v18 = v25 - 1;
                goto LABEL_32;
              }
            }
LABEL_36:
            sub_100011544(v3);
            return;
          }
        }
      }
    }
LABEL_32:
    v16 = (v24 - 1) & v24;
    v17 = __clz(__rbit64(v24)) + (v18 << 6);
    goto LABEL_33;
  }
  __break(1u);
}

void sub_1000112E8()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  Class isa;
  id v5;
  void *v6;

  v6 = &_swiftEmptySetSingleton;
  v1 = objc_msgSend(objc_allocWithZone((Class)SHSheetAction), "initWithType:", 10);
  sub_100010204((Swift::Int *)&v5, v1);

  v2 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  v3 = v6;
  sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
  sub_1000104A0();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v2, "sendActions:", isa);

}

void sub_1000113C4(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  Class isa;
  id v6;
  void *v7;

  v7 = &_swiftEmptySetSingleton;
  v2 = objc_msgSend(objc_allocWithZone((Class)SHSheetDraggingAction), "initWithDraggingEvent:", a1);
  sub_100010204((Swift::Int *)&v6, v2);

  v3 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_fbsScene);
  v4 = v7;
  sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
  sub_1000104A0();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v3, "sendActions:", isa);

}

void sub_1000114A4(_QWORD *a1)
{
  uint64_t v1;

  sub_10000FD90(a1, v1);
}

uint64_t sub_1000114AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000114BC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000114C4()
{
  uint64_t v0;

  sub_10000AC68(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_1000114F0()
{
  uint64_t v0;

  sub_10000FFE4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

unint64_t sub_1000114FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003F360;
  if (!qword_10003F360)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10003F360);
  }
  return result;
}

uint64_t sub_100011544(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

Class sub_100011664(uint64_t a1, uint64_t a2, _QWORD *a3, void (*a4)(_QWORD))
{
  uint64_t v4;
  Class isa;

  v4 = *(_QWORD *)(a1 + *a3);
  a4(0);
  swift_bridgeObjectRetain(v4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

uint64_t sub_1000116C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = a4(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v8);
  v10 = *(_QWORD *)(a1 + *a5);
  *(_QWORD *)(a1 + *a5) = v9;
  return swift_bridgeObjectRelease(v10);
}

id sub_100011940(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v3 = a1 + *a3;
  v4 = *(_QWORD *)(v3 + 8);
  if (v4)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v3 + 8));
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t sub_1000119A4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = (uint64_t *)(a1 + *a4);
  v9 = v8[1];
  *v8 = v6;
  v8[1] = v7;
  return swift_bridgeObjectRelease(v9);
}

Class sub_100011B64(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v5;
  Class isa;

  v5 = *(_QWORD *)(a1 + *a3);
  swift_bridgeObjectRetain(v5);
  sub_100009344(a4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

uint64_t sub_100011BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = sub_100009344(a4);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v8);
  v10 = *(_QWORD *)(a1 + *a5);
  *(_QWORD *)(a1 + *a5) = v9;
  return swift_bridgeObjectRelease(v10);
}

unint64_t sub_100011C5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = sub_100009344(&qword_10003FC78);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v23 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v23);
    return (unint64_t)v8;
  }
  sub_100009344(&qword_10003FC80);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = *(int *)(v2 + 48);
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100012DF8(v13, (uint64_t)v5, &qword_10003FC78);
    result = sub_1000120F4((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for UUID(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v5, v19);
    *(_QWORD *)(v8[7] + 8 * v17) = *(_QWORD *)&v5[v10];
    v20 = v8[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_12;
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v23 = v25;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ShareSheetViewModel(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService19ShareSheetViewModel, a2);
}

unint64_t sub_1000120F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for UUID(0);
  v6 = sub_100012C50((unint64_t *)&unk_10003FC58, (uint64_t)&protocol conformance descriptor for UUID);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_1000121B4(a1, v7);
}

unint64_t sub_100012158(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  Swift::Int v5;
  _QWORD v7[9];

  v2 = v1;
  v4 = a1 & 1;
  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  Hasher._combine(_:)(a1 & 1);
  v5 = Hasher._finalize()();
  return sub_1000122EC(v4, v5);
}

unint64_t sub_1000121B4(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v18 = a1;
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
      v14 = sub_100012C50(&qword_10003FC88, (uint64_t)&protocol conformance descriptor for UUID);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_1000122EC(char a1, uint64_t a2)
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
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

id sub_1000123A8(void *a1, void *a2)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Class isa;
  unsigned __int8 v30;
  unsigned __int8 v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  objc_class *v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
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
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t ObjectType;
  objc_super v103;

  v3 = v2;
  ObjectType = swift_getObjectType(v2);
  v88 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isSharingExpanded;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isSharingExpanded] = 0;
  v6 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues;
  v7 = (uint64_t)&_swiftEmptyArrayStorage;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues] = &_swiftEmptyArrayStorage;
  v89 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isLoadingMetadata;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isLoadingMetadata] = 0;
  v90 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlRequests;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlRequests] = &_swiftEmptyArrayStorage;
  v91 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions] = 0;
  v92 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showOptions;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showOptions] = 0;
  v8 = (uint64_t *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customOptionsTitle];
  *v8 = 0;
  v8[1] = 0;
  v93 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showCustomHeaderButton;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showCustomHeaderButton] = 0;
  v94 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showHeaderSpecialization;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showHeaderSpecialization] = 0;
  v95 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle] = 0;
  v96 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor] = 0;
  v97 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isModeSwitchDisabled;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isModeSwitchDisabled] = 0;
  v98 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsCollaboration;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsCollaboration] = 0;
  v99 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsSendCopy;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsSendCopy] = 0;
  v100 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isCollaborative;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isCollaborative] = 0;
  v9 = (uint64_t *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationModeTitle];
  *v9 = 0;
  v9[1] = 0;
  v101 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController] = 0;
  v85 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper] = 0;
  v86 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper] = 0;
  v10 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_activitiesByUUID;
  v11 = v2;
  *(_QWORD *)&v2[v10] = sub_100011C5C((uint64_t)&_swiftEmptyArrayStorage);
  v87 = OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_applicationActivityTypes;
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_applicationActivityTypes] = &_swiftEmptyArrayStorage;
  v12 = objc_msgSend(a1, "peopleProxies");
  if (v12)
  {
    v13 = v12;
    v14 = sub_10000ABC0(0, &qword_10003FC70, UIAirDropNode_ptr);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, v14);

  }
  if ((unint64_t)v7 >> 62)
  {
    if (v7 < 0)
      v83 = v7;
    else
      v83 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v84 = sub_100009344(&qword_10003FC38);
    v16 = _bridgeCocoaArray<A>(_:)(v83, v84);
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v15 = swift_bridgeObjectRetain(v7);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v15);
    v16 = v7;
  }
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_peopleSuggestionProxies] = v16;
  v17 = objc_msgSend(a1, "shareProxies");
  if (v17)
  {
    v18 = v17;
    v19 = sub_10000ABC0(0, &qword_10003FC68, _UIHostActivityProxy_ptr);
    v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v18, v19);

    if (!((unint64_t)v20 >> 62))
    {
LABEL_7:
      v21 = swift_bridgeObjectRetain(v20);
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v21);
      v22 = v20;
      goto LABEL_8;
    }
  }
  else
  {
    v20 = (uint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62))
      goto LABEL_7;
  }
  if (v20 < 0)
    v55 = v20;
  else
    v55 = v20 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v20);
  v56 = sub_100009344(&qword_10003FC40);
  v22 = _bridgeCocoaArray<A>(_:)(v55, v56);
  swift_bridgeObjectRelease(v20);
LABEL_8:
  swift_bridgeObjectRelease(v20);
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_shareProxies] = v22;
  v23 = objc_msgSend(a1, "actionProxies");
  if (v23)
  {
    v24 = v23;
    v25 = sub_10000ABC0(0, &qword_10003FC68, _UIHostActivityProxy_ptr);
    v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v24, v25);

    if (!((unint64_t)v26 >> 62))
    {
LABEL_10:
      v27 = swift_bridgeObjectRetain(v26);
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v27);
      v28 = v26;
      goto LABEL_11;
    }
  }
  else
  {
    v26 = (uint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62))
      goto LABEL_10;
  }
  if (v26 < 0)
    v57 = v26;
  else
    v57 = v26 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v26);
  v58 = sub_100009344(&qword_10003FC40);
  v28 = _bridgeCocoaArray<A>(_:)(v57, v58);
  swift_bridgeObjectRelease(v26);
LABEL_11:
  swift_bridgeObjectRelease(v26);
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_actionProxies] = v28;
  isa = (Class)objc_msgSend(a1, "nearbyCountSlotID");
  if (!isa)
  {
    sub_10000ABC0(0, &qword_10003FC48, NSNumber_ptr);
    isa = NSNumber.init(integerLiteral:)(0).super.super.isa;
  }
  *(_QWORD *)&v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID] = isa;
  v30 = objc_msgSend(a1, "reloadData");
  v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_reloadData] = v30;
  v31 = objc_msgSend(a1, "wantsAnimation");
  v11[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_updateProxiesWithAnimation] = v31;
  if (a2)
  {
    v32 = a2;
    v3[v88] = objc_msgSend(v32, "isSharingExpanded");
    v33 = objc_msgSend(v32, "activitiesByUUID");
    v34 = type metadata accessor for UUID(0);
    v35 = sub_10000ABC0(0, &qword_10003FC50, UIActivity_ptr);
    v36 = sub_100012C50((unint64_t *)&unk_10003FC58, (uint64_t)&protocol conformance descriptor for UUID);
    v37 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v33, v34, v35, v36);

    v38 = *(_QWORD *)&v3[v10];
    *(_QWORD *)&v3[v10] = v37;
    swift_bridgeObjectRelease(v38);
    v39 = objc_msgSend(v32, "metadataValues");
    v40 = sub_10000ABC0(0, (unint64_t *)&unk_10003F350, LPLinkMetadata_ptr);
    v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v39, v40);

    v42 = *(_QWORD *)&v3[v6];
    *(_QWORD *)&v3[v6] = v41;
    swift_bridgeObjectRelease(v42);
    v3[v89] = objc_msgSend(v32, "isLoadingMetadata");
    v43 = objc_msgSend(v32, "urlRequests");
    v44 = type metadata accessor for URLRequest(0);
    v45 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v43, v44);

    v46 = *(_QWORD *)&v3[v90];
    *(_QWORD *)&v3[v90] = v45;
    swift_bridgeObjectRelease(v46);
    v47 = objc_msgSend(v32, "urlSandboxExtensions");
    v48 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v47, &type metadata for Data);

    v49 = *(_QWORD *)&v3[v91];
    *(_QWORD *)&v3[v91] = v48;
    swift_bridgeObjectRelease(v49);
    v3[v92] = objc_msgSend(v32, "showOptions");
    v50 = objc_msgSend(v32, "customOptionsTitle");
    if (v50)
    {
      v51 = v50;
      v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
      v54 = v53;

    }
    else
    {
      v52 = 0;
      v54 = 0;
    }
    v60 = v8[1];
    *v8 = v52;
    v8[1] = v54;
    swift_bridgeObjectRelease(v60);
    v3[v93] = objc_msgSend(v32, "showCustomHeaderButton");
    v3[v94] = objc_msgSend(v32, "showHeaderSpecialization");
    v61 = objc_msgSend(v32, "customHeaderButtonTitle");
    v62 = *(void **)&v3[v95];
    *(_QWORD *)&v3[v95] = v61;

    v63 = objc_msgSend(v32, "customHeaderButtonColor");
    v64 = *(void **)&v3[v96];
    *(_QWORD *)&v3[v96] = v63;

    v3[v97] = objc_msgSend(v32, "isModeSwitchDisabled");
    v3[v98] = objc_msgSend(v32, "supportsCollaboration");
    v3[v99] = objc_msgSend(v32, "supportsSendCopy");
    v3[v100] = objc_msgSend(v32, "isCollaborative");
    v65 = objc_msgSend(v32, "collaborationModeTitle");
    if (v65)
    {
      v66 = v65;
      v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v65);
      v69 = v68;

    }
    else
    {
      v67 = 0;
      v69 = 0;
    }
    v59 = (objc_class *)ObjectType;
    v70 = v9[1];
    *v9 = v67;
    v9[1] = v69;
    swift_bridgeObjectRelease(v70);
    v71 = objc_msgSend(v32, "collaborationFooterViewModel");
    v72 = *(void **)&v3[v101];
    *(_QWORD *)&v3[v101] = v71;

    v73 = objc_msgSend(v32, "customViewControllerVerticalInsetWrapper");
    v74 = *(void **)&v3[v85];
    *(_QWORD *)&v3[v85] = v73;

    v75 = objc_msgSend(v32, "customViewControllerSectionHeightWrapper");
    v76 = *(void **)&v3[v86];
    *(_QWORD *)&v3[v86] = v75;

    v77 = objc_msgSend(v32, "applicationActivityTypes");
    if (v77)
    {
      v78 = v77;
      type metadata accessor for ActivityType(0);
      v80 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v78, v79);

      v32 = v78;
    }
    else
    {
      v80 = &_swiftEmptyArrayStorage;
    }

    v81 = *(_QWORD *)&v11[v87];
    *(_QWORD *)&v11[v87] = v80;

    swift_bridgeObjectRelease(v81);
  }
  else
  {

    v59 = (objc_class *)ObjectType;
  }
  v103.receiver = v11;
  v103.super_class = v59;
  return objc_msgSendSuper2(&v103, "init");
}

uint64_t sub_100012C50(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for UUID(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100012C90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = sub_100009344(&qword_10003FC90);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    sub_100009344(&qword_10003FC98);
    v7 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v6);
    v8 = &v5[*(int *)(v2 + 48)];
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_100012DF8(v9, (uint64_t)v5, &qword_10003FC90);
      v11 = *v5;
      result = sub_100012158(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v7[6] + result) = v11;
      v15 = v7[7];
      v16 = type metadata accessor for DisplayRepresentation(0);
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v8, v16);
      v17 = v7[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_10;
      v7[2] = v19;
      v9 += v10;
      if (!--v6)
        return (unint64_t)v7;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_100012DF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100009344(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000B198(v0, qword_10003FCA0);
  v1 = sub_10000A054(v0, (uint64_t)qword_10003FCA0);
  if (qword_10003EE10 != -1)
    swift_once(&qword_10003EE10, sub_10000B1D8);
  v2 = sub_10000A054(v0, (uint64_t)qword_100041D18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100012ECC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[5] = v0;
  v2 = sub_100009344(&qword_10003FCC0);
  v1[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for UTType(0);
  v1[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[8] = v4;
  v1[9] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100012F50, 0, 0);
}

uint64_t sub_100012F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void **v4;
  void *v5;
  NSString v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  void *v21;
  uint8_t *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v32;
  _QWORD *v33;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  UTType.init(identifier:allowUndeclared:)(0xD000000000000018, 0x80000001000299B0, 1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_10001345C(*(_QWORD *)(v0 + 48));
LABEL_16:
    v32 = *(_QWORD *)(v0 + 48);
    swift_task_dealloc(*(_QWORD *)(v0 + 72));
    swift_task_dealloc(v32);
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  v4 = (void **)(v0 + 40);
  v5 = *(void **)(v0 + 40);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 32))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  v6 = String._bridgeToObjectiveC()();
  LODWORD(v5) = objc_msgSend(v5, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v6, 0);

  if (!(_DWORD)v5)
  {
    if (qword_10003EE40 != -1)
      swift_once(&qword_10003EE40, sub_100012E3C);
    v16 = *v4;
    v17 = type metadata accessor for Logger(0);
    sub_10000A054(v17, (uint64_t)qword_10003FCA0);
    v18 = Logger.logObject.getter(v16);
    v19 = static os_log_type_t.info.getter();
    v20 = os_log_type_enabled(v18, v19);
    v21 = *v4;
    if (v20)
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v22 = 138412290;
      *(_QWORD *)(v0 + 16) = v21;
      v24 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24);
      *v23 = v21;

      _os_log_impl((void *)&_mh_execute_header, v18, v19, "No metadata registered in item provider: %@", v22, 0xCu);
      v25 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(v23, 1, v25);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);
    }
    else
    {

    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
    goto LABEL_16;
  }
  if (qword_10003EE40 != -1)
    swift_once(&qword_10003EE40, sub_100012E3C);
  v7 = *v4;
  v8 = type metadata accessor for Logger(0);
  sub_10000A054(v8, (uint64_t)qword_10003FCA0);
  v9 = Logger.logObject.getter(v7);
  v10 = static os_log_type_t.default.getter();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *v4;
  if (v11)
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v33 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v13 = 138412290;
    *(_QWORD *)(v0 + 32) = v12;
    v14 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40);
    *v33 = v12;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Loading metadata from item provider %@", v13, 0xCu);
    v15 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v33, 1, v15);
    swift_slowDealloc(v33, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }
  else
  {

  }
  v26 = *(_QWORD *)(v0 + 72);
  v27 = *(_QWORD *)(v0 + 40);
  v28 = swift_task_alloc(32);
  *(_QWORD *)(v0 + 80) = v28;
  *(_QWORD *)(v28 + 16) = v27;
  *(_QWORD *)(v28 + 24) = v26;
  v29 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 88) = v29;
  v30 = sub_100009344(&qword_10003FCC8);
  *v29 = v0;
  v29[1] = sub_1000133AC;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000010, 0x80000001000299D0, sub_100013C0C, v28, v30);
}

uint64_t sub_1000133AC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 88));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100013408, 0, 0);
}

uint64_t sub_100013408()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_10001345C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100009344(&qword_10003FCC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10001349C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = sub_100009344(&qword_10003FCD0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = (v8 + 16) & ~v8;
  v10 = swift_allocObject(&unk_100035A70, v9 + v7, v8 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  v11 = (void *)NSItemProvider.loadDataRepresentation(for:completionHandler:)(a3, sub_100013C78, v10);
  swift_release(v10);

}

uint64_t sub_100013588(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;

  if (a2 >> 60 == 15)
  {
    if (qword_10003EE40 != -1)
      swift_once(&qword_10003EE40, sub_100012E3C);
    v4 = type metadata accessor for Logger(0);
    sub_10000A054(v4, (uint64_t)qword_10003FCA0);
    swift_errorRetain(a3);
    v5 = swift_errorRetain(a3);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v8 = 138412290;
      if (a3)
      {
        swift_errorRetain(a3);
        v10 = _swift_stdlib_bridgeErrorToNSError(a3);
        v33 = v10;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
      }
      else
      {
        v33 = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
        v10 = 0;
      }
      *v9 = v10;
      swift_errorRelease(a3);
      swift_errorRelease(a3);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to load metadata: %@", v8, 0xCu);
      v23 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(v9, 1, v23);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);
    }
    else
    {
      swift_errorRelease(a3);
      swift_errorRelease(a3);
    }

    v33 = 0;
    v24 = sub_100009344(&qword_10003FCD0);
    return CheckedContinuation.resume(returning:)(&v33, v24);
  }
  else
  {
    sub_10000ABC0(0, &qword_10003FCD8, NSKeyedUnarchiver_ptr);
    v13 = sub_10000ABC0(0, (unint64_t *)&unk_10003F350, LPLinkMetadata_ptr);
    sub_10000ABF8(a1, a2);
    v14 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v13, a1, a2, v13);
    v15 = (void *)v14;
    if (v14)
    {
      if (qword_10003EE40 != -1)
        swift_once(&qword_10003EE40, sub_100012E3C);
      v16 = type metadata accessor for Logger(0);
      sub_10000A054(v16, (uint64_t)qword_10003FCA0);
      v17 = v15;
      v18 = Logger.logObject.getter(v17);
      v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc(12, -1);
        v32 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v20 = 138412290;
        v33 = (uint64_t)v17;
        v21 = v17;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
        *v32 = v15;

        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Loaded metadata: %@", v20, 0xCu);
        v22 = sub_100009344(&qword_10003F220);
        swift_arrayDestroy(v32, 1, v22);
        swift_slowDealloc(v32, -1, -1);
        swift_slowDealloc(v20, -1, -1);

      }
      else
      {

      }
      v33 = (uint64_t)v15;
    }
    else
    {
      if (qword_10003EE40 != -1)
        swift_once(&qword_10003EE40, sub_100012E3C);
      v26 = type metadata accessor for Logger(0);
      v27 = sub_10000A054(v26, (uint64_t)qword_10003FCA0);
      v28 = Logger.logObject.getter(v27);
      v29 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to unarchive metadata", v30, 2u);
        swift_slowDealloc(v30, -1, -1);
      }

      v33 = 0;
    }
    v31 = sub_100009344(&qword_10003FCD0);
    CheckedContinuation.resume(returning:)(&v33, v31);
    return sub_100013CD0(a1, a2);
  }
}

void sub_100013C0C(uint64_t a1)
{
  uint64_t v1;

  sub_10001349C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100013C14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100009344(&qword_10003FCD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100013C78(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100009344(&qword_10003FCD0);
  return sub_100013588(a1, a2, a3);
}

uint64_t sub_100013CD0(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000AC68(result, a2);
  return result;
}

void sub_100013CE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, _QWORD);
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  __int128 v38;
  uint64_t v39;
  char *v40;
  char v41[24];

  swift_beginAccess(v1 + 24, v41, 0, 0);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v1 + 24));
    v5 = 0;
    v6 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      v38 = *(_OWORD *)(v3 + 16 * v5 + 32);
      v7 = *(_QWORD *)(v3 + 16 * v5 + 32);
      ObjectType = swift_getObjectType(v7);
      v9 = *(uint64_t (**)(uint64_t, _QWORD))(*((_QWORD *)&v38 + 1) + 24);
      swift_unknownObjectRetain(v7);
      if ((v9(ObjectType, *((_QWORD *)&v38 + 1)) & 1) != 0
        && (*(uint64_t (**)(uint64_t, _QWORD))(*((_QWORD *)&v38 + 1) + 32))(ObjectType, *((_QWORD *)&v38 + 1)) == 1)
      {
        v40 = v6;
        if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0)
        {
          sub_100014A3C(0, *((_QWORD *)v6 + 2) + 1, 1);
          v6 = v40;
        }
        v11 = *((_QWORD *)v6 + 2);
        v10 = *((_QWORD *)v6 + 3);
        if (v11 >= v10 >> 1)
        {
          sub_100014A3C(v10 > 1, v11 + 1, 1);
          v6 = v40;
        }
        *((_QWORD *)v6 + 2) = v11 + 1;
        *(_OWORD *)&v6[16 * v11 + 32] = v38;
      }
      else
      {
        swift_unknownObjectRelease(v7);
      }
      ++v5;
    }
    while (v4 != v5);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v6 = (char *)&_swiftEmptyArrayStorage;
  }
  if (qword_10003EE00 != -1)
    goto LABEL_29;
  while (1)
  {
    v12 = type metadata accessor for Logger(0);
    sub_10000A054(v12, (uint64_t)qword_100041CE8);
    v13 = swift_retain_n(v6, 2);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.debug.getter();
    v36 = v6;
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc(22, -1);
      v17 = swift_slowAlloc(32, -1);
      v40 = (char *)v17;
      *(_DWORD *)v16 = 136315394;
      swift_retain(v6);
      v18 = sub_100009344(&qword_10003FD88);
      v19 = Array.description.getter(v6, v18);
      v21 = v20;
      swift_release(v6);
      v39 = sub_100025614(v19, v21, (uint64_t *)&v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
      swift_release_n(v6, 2);
      swift_bridgeObjectRelease(v21);
      *(_WORD *)(v16 + 12) = 2048;
      v39 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "EvictIfNeeded: background scene sessions = %s backgroundLimit = %ld", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);

    }
    else
    {

      swift_release_n(v6, 2);
    }
    v22 = (char *)*((_QWORD *)v6 + 2);
    if ((uint64_t)v22 <= a1)
    {
LABEL_27:
      swift_release(v36);
      return;
    }
    if (__OFSUB__(v22, a1))
      break;
    if (!v22)
      goto LABEL_27;
    v23 = a1 + 1;
    v6 = (char *)(a1 + 0x8000000000000000);
    v24 = (uint64_t *)(v36 + 40);
    v37 = (char *)(a1 + 0x8000000000000000);
    while (1)
    {
      v25 = *(v24 - 1);
      a1 = *v24;
      v26 = swift_unknownObjectRetain(v25);
      v27 = Logger.logObject.getter(v26);
      v28 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = v23;
        v30 = swift_slowAlloc(12, -1);
        v31 = (uint64_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v30 = 138412290;
        v32 = swift_getObjectType(v25);
        v33 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v32, a1);
        *(_QWORD *)(v30 + 4) = v33;
        *v31 = v33;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "evicting background scene session for scene:%@", (uint8_t *)v30, 0xCu);
        v34 = sub_100009344(&qword_10003F220);
        swift_arrayDestroy(v31, 1, v34);
        swift_slowDealloc(v31, -1, -1);
        v35 = v30;
        v23 = v29;
        v6 = v37;
        swift_slowDealloc(v35, -1, -1);
      }

      sub_100014524(v25, a1);
      swift_unknownObjectRelease(v25);
      if (v6 == v22)
        break;
      if ((char *)v23 != v22)
      {
        v24 += 2;
        if (--v22)
          continue;
      }
      goto LABEL_27;
    }
    __break(1u);
LABEL_29:
    swift_once(&qword_10003EE00, sub_10000B14C);
  }
  __break(1u);
}

void sub_1000142D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t *v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  char **v15;
  char *v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  if (qword_10003EE00 != -1)
    swift_once(&qword_10003EE00, sub_10000B14C);
  v6 = type metadata accessor for Logger(0);
  sub_10000A054(v6, (uint64_t)qword_100041CE8);
  v7 = swift_unknownObjectRetain(a1);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    ObjectType = swift_getObjectType(a1);
    v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(ObjectType, a2);
    v21 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    *v11 = v13;
    swift_unknownObjectRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "adding scene session for scene:%@", v10, 0xCu);
    v14 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v11, 1, v14);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease(a1);
  }
  v15 = (char **)(v3 + 24);
  swift_beginAccess(v3 + 24, &v21, 33, 0);
  v16 = *(char **)(v3 + 24);
  swift_unknownObjectRetain(a1);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v16);
  *(_QWORD *)(v3 + 24) = v16;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v16 = sub_1000250C4(0, *((_QWORD *)v16 + 2) + 1, 1, v16);
    *v15 = v16;
  }
  v19 = *((_QWORD *)v16 + 2);
  v18 = *((_QWORD *)v16 + 3);
  if (v19 >= v18 >> 1)
  {
    v16 = sub_1000250C4((char *)(v18 > 1), v19 + 1, 1, v16);
    *v15 = v16;
  }
  *((_QWORD *)v16 + 2) = v19 + 1;
  v20 = &v16[16 * v19];
  *((_QWORD *)v20 + 4) = a1;
  *((_QWORD *)v20 + 5) = a2;
  swift_endAccess(&v21);
  sub_100013CE4(2);
}

void sub_100014524(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[24];

  swift_beginAccess(v2 + 24, v40, 0, 0);
  v6 = *(_QWORD *)(v2 + 24);
  v34 = *(_QWORD *)(v6 + 16);
  if (v34)
  {
    v33 = v2 + 24;
    sub_100014D4C(0, v5);
    ObjectType = swift_getObjectType(a1);
    v36 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 8);
    v37 = ObjectType;
    swift_bridgeObjectRetain(v6);
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = *(_QWORD *)(v6 + v8 + 32);
      v11 = *(_QWORD *)(v6 + v8 + 40);
      v12 = swift_getObjectType(v10);
      v13 = a2;
      v14 = a1;
      v15 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
      swift_unknownObjectRetain(v10);
      v16 = v15(v12, v11);
      a1 = v14;
      a2 = v13;
      v17 = (void *)v16;
      v18 = (void *)v36(v37, v13);
      v19 = static NSObject.== infix(_:_:)(v17, v18);
      swift_unknownObjectRelease(v10);

      if ((v19 & 1) != 0)
        break;
      ++v9;
      v8 += 16;
      if (v34 == v9)
      {
        swift_bridgeObjectRelease(v6);
        return;
      }
    }
    swift_bridgeObjectRelease(v6);
    if (qword_10003EE00 != -1)
      swift_once(&qword_10003EE00, sub_10000B14C);
    v20 = type metadata accessor for Logger(0);
    sub_10000A054(v20, (uint64_t)qword_100041CE8);
    v21 = swift_unknownObjectRetain(a1);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v35 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v24 = 138412290;
      v25 = v36(v37, a2);
      v38 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39);
      *v35 = v25;
      swift_unknownObjectRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "remove scene session for scene:%@", v24, 0xCu);
      v26 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(v35, 1, v26);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease(a1);
    }
    if (v9 >= *(_QWORD *)(*(_QWORD *)v33 + 16))
    {
      __break(1u);
    }
    else
    {
      v27 = *(_QWORD *)v33 + v8;
      v28 = *(_QWORD *)(v27 + 32);
      v29 = *(_QWORD *)(v27 + 40);
      v30 = swift_getObjectType(v28);
      v31 = *(void (**)(uint64_t, uint64_t))(v29 + 56);
      swift_unknownObjectRetain(v28);
      v31(v30, v29);
      swift_beginAccess(v33, &v38, 33, 0);
      v32 = sub_100014844(v9);
      swift_endAccess(&v38);
      swift_unknownObjectRelease(v32);
      swift_unknownObjectRelease(v28);
    }
  }
}

uint64_t sub_100014844(unint64_t a1)
{
  char **v1;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  char v10;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native(*v1) & 1) == 0)
    v3 = sub_100014D88((uint64_t)v3);
  v4 = *((_QWORD *)v3 + 2);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      v7 = &v3[16 * a1];
      v8 = *((_QWORD *)v7 + 4);
      memmove(v7 + 32, v7 + 48, 16 * v6);
      *((_QWORD *)v3 + 2) = v5;
      *v1 = v3;
      return v8;
    }
  }
  v10 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v10, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_100014920()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for SceneSessionManager(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService19SceneSessionManager, a2);
}

uint64_t sub_100014964@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void *sub_10001498C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_100014A20(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100014A58(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100014A3C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100014BC0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100014A58(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100009344((uint64_t *)&unk_10003FDA0);
    v11 = (char *)swift_allocObject(v10, (v9 << 6) | 0x20, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 + 31;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 6);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[64 * v8])
      memmove(v14, v15, v8 << 6);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[64 * v8] || v14 >= &v15[64 * v8])
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

uint64_t sub_100014BC0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100009344(&qword_10003FD90);
    v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 16 * v8)
      memmove(v11 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 16 * v8 || v14 >= v15 + 16 * v8)
  {
    sub_100009344(&qword_10003FD88);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

unint64_t sub_100014D4C(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v3;

  result = qword_10003FD98;
  if (!qword_10003FD98)
  {
    v3 = objc_opt_self(NSObject, a2);
    result = swift_getObjCClassMetadata(v3);
    atomic_store(result, (unint64_t *)&qword_10003FD98);
  }
  return result;
}

char *sub_100014D88(uint64_t a1)
{
  return sub_1000250C4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

id sub_100014F04(uint64_t a1)
{
  return sub_100015A30(a1, (uint64_t (*)(void))type metadata accessor for SecureWindow);
}

uint64_t type metadata accessor for SecureWindow(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService12SecureWindow, a2);
}

void sub_10001506C(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = qword_10003EE00;
  v13 = a3;
  v7 = a1;
  if (v6 != -1)
    swift_once(&qword_10003EE00, sub_10000B14C);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_10000A054(v8, (uint64_t)qword_100041CE8);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a4, v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

}

id sub_1000151E0()
{
  return sub_100015A30(0, (uint64_t (*)(void))type metadata accessor for RemoteAlertSceneDelegate);
}

uint64_t sub_100015228()
{
  return type metadata accessor for RemoteAlertSceneDelegate(0);
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate(uint64_t a1)
{
  uint64_t result;

  result = qword_10003FE68;
  if (!qword_10003FE68)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RemoteAlertSceneDelegate);
  return result;
}

void sub_10001526C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = "\b";
  sub_1000152E4(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
  }
}

void sub_1000152E4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10003FE78)
  {
    v2 = type metadata accessor for SFRemoteAlertPresentationRequest(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10003FE78);
  }
}

void sub_100015440(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint8_t *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;

  v2 = v1;
  v4 = type metadata accessor for SFRemoteAlertPresentationRequest(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v37 - v10;
  if ((SFRemoteAlertPresentationRequest.hideViewController.getter(v9) & 1) != 0)
  {
    if (qword_10003EE00 != -1)
      swift_once(&qword_10003EE00, sub_10000B14C);
    v12 = type metadata accessor for Logger(0);
    sub_10000A054(v12, (uint64_t)qword_100041CE8);
    v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc(12, -1);
      v38 = v1;
      v17 = (uint8_t *)v16;
      v18 = swift_slowAlloc(32, -1);
      v40 = v18;
      *(_DWORD *)v17 = 136315138;
      v37 = v17 + 4;
      v19 = SFRemoteAlertPresentationRequest.id.getter(v18);
      v21 = v20;
      v39 = sub_100025614(v19, v20, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
      swift_bridgeObjectRelease(v21);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Adding view controller to view hierarchy in remote alert for request: %s", v17, 0xCu);
      swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1, -1);
      v22 = v17;
      v2 = v38;
      swift_slowDealloc(v22, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }

    v34 = (void *)SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
    objc_msgSend(v34, "willMoveToParentViewController:", v2);

    v35 = (void *)SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
    objc_msgSend(v2, "addChildViewController:", v35);

    v36 = (void *)SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
    objc_msgSend(v36, "didMoveToParentViewController:", v2);
  }
  else
  {
    if (qword_10003EE00 != -1)
      swift_once(&qword_10003EE00, sub_10000B14C);
    v23 = type metadata accessor for Logger(0);
    sub_10000A054(v23, (uint64_t)qword_100041CE8);
    v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, a1, v4);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc(12, -1);
      v38 = v1;
      v28 = (uint8_t *)v27;
      v29 = swift_slowAlloc(32, -1);
      v40 = v29;
      *(_DWORD *)v28 = 136315138;
      v37 = v28 + 4;
      v30 = SFRemoteAlertPresentationRequest.id.getter(v29);
      v32 = v31;
      v39 = sub_100025614(v30, v31, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
      swift_bridgeObjectRelease(v32);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Presenting view controller in remote alert for request: %s", v28, 0xCu);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      v33 = v28;
      v2 = v38;
      swift_slowDealloc(v33, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    }

    v36 = (void *)SFRemoteAlertPresentationRequest.viewControllerToPresent.getter();
    objc_msgSend(v2, "presentViewController:animated:completion:", v36, SFRemoteAlertPresentationRequest.animated.getter() & 1, 0);
  }

}

void sub_100015858(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  id Strong;

  if (a1)
    a1();
  Strong = (id)swift_unknownObjectWeakLoadStrong(a3+ OBJC_IVAR____TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController_remoteAlertScene);
  objc_msgSend(Strong, "invalidate");

}

id sub_100015A20()
{
  return sub_100015A30(0, (uint64_t (*)(void))type metadata accessor for RemoteAlertRootViewController);
}

id sub_100015A30(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for RemoteAlertRootViewController(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController, a2);
}

uint64_t sub_100015A90()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_100015AC4()
{
  uint64_t v0;

  sub_100015858(*(void (**)(void))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100015AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015AE0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100015AE8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100015AF8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100015B08()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100015B2C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_100015B38(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v3;

  result = qword_10003FF10;
  if (!qword_10003FF10)
  {
    v3 = objc_opt_self(SBUIRemoteAlertButtonAction, a2);
    result = swift_getObjCClassMetadata(v3);
    atomic_store(result, (unint64_t *)&qword_10003FF10);
  }
  return result;
}

unint64_t sub_100015B74(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  unint64_t v3;

  result = qword_10003FF18;
  if (!qword_10003FF18)
  {
    v3 = sub_100015B38(255, a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v3);
    atomic_store(result, (unint64_t *)&qword_10003FF18);
  }
  return result;
}

void sub_100015BBC(void *a1)
{
  uint64_t v1;
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t ObjectType;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  int v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  id v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  objc_class *v74;
  char *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  os_log_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(char *, char *, uint64_t);
  char *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  objc_super v95;
  uint64_t v96;
  uint64_t v97;

  v3 = sub_100009344(&qword_10003FF28);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v83 - v7;
  v9 = type metadata accessor for SFRemoteAlertPresentationRequest(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v83 - v14;
  v17 = objc_opt_self(SBSUIRemoteAlertScene, v16);
  v18 = swift_dynamicCastObjCClass(a1, v17);
  if (!v18)
  {
    if (qword_10003EE00 != -1)
      swift_once(&qword_10003EE00, sub_10000B14C);
    v33 = type metadata accessor for Logger(0);
    sub_10000A054(v33, (uint64_t)qword_100041CE8);
    v92 = a1;
    v34 = Logger.logObject.getter(v92);
    v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(12, -1);
      v37 = swift_slowAlloc(32, -1);
      v93 = v37;
      *(_DWORD *)v36 = 136315138;
      ObjectType = swift_getObjectType(v92);
      v39 = _typeName(_:qualified:)(ObjectType, 0);
      v41 = v40;
      v96 = sub_100025614(v39, v40, &v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97);

      swift_bridgeObjectRelease(v41);
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Cannot configure scene, expected a remote alert scene but got a scene of type: %s", v36, 0xCu);
      swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1, -1);
      swift_slowDealloc(v36, -1, -1);

      return;
    }

LABEL_22:
    return;
  }
  v19 = (void *)v18;
  v20 = a1;
  v21 = objc_msgSend(v19, "configurationIdentifier");
  if (!v21)
  {
    if (qword_10003EE00 != -1)
      swift_once(&qword_10003EE00, sub_10000B14C);
    v42 = type metadata accessor for Logger(0);
    sub_10000A054(v42, (uint64_t)qword_100041CE8);
    v92 = v20;
    v43 = Logger.logObject.getter(v92);
    v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(12, -1);
      v46 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v45 = 138412290;
      v93 = (uint64_t)v19;
      v47 = v92;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
      *v46 = v19;

      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Could not find configuration identifier on remote alert scene: %@", v45, 0xCu);
      v48 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(v46, 1, v48);
      swift_slowDealloc(v46, -1, -1);
      swift_slowDealloc(v45, -1, -1);

      return;
    }

    goto LABEL_22;
  }
  v22 = v21;
  v91 = v1;
  v92 = v20;
  v90 = v6;
  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  v25 = v24;

  type metadata accessor for SUISRemoteAlertPresentationManager(0);
  v26 = sub_10000C114();
  dispatch thunk of SFRemoteAlertPresentationManager.presentationRequest(for:)(v23, v25);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100016F80((uint64_t)v8);
    if (qword_10003EE00 != -1)
      swift_once(&qword_10003EE00, sub_10000B14C);
    v27 = type metadata accessor for Logger(0);
    sub_10000A054(v27, (uint64_t)qword_100041CE8);
    v28 = swift_bridgeObjectRetain(v25);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(12, -1);
      v32 = swift_slowAlloc(32, -1);
      v93 = v32;
      *(_DWORD *)v31 = 136315138;
      swift_bridgeObjectRetain(v25);
      v96 = sub_100025614(v23, v25, &v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97);
      swift_bridgeObjectRelease_n(v25, 3);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Could not find a remote alert presentation request for ID: %s", v31, 0xCu);
      swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v31, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v25, 2);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v25);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    if (qword_10003EE00 != -1)
      swift_once(&qword_10003EE00, sub_10000B14C);
    v49 = type metadata accessor for Logger(0);
    v50 = sub_10000A054(v49, (uint64_t)qword_100041CE8);
    v89 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v89(v13, v15, v9);
    v51 = v92;
    v52 = Logger.logObject.getter(v51);
    v53 = static os_log_type_t.default.getter();
    v54 = v53;
    v55 = os_log_type_enabled(v52, v53);
    v92 = v51;
    if (v55)
    {
      v56 = swift_slowAlloc(22, -1);
      v86 = v54;
      v57 = v56;
      v58 = (_QWORD *)swift_slowAlloc(8, -1);
      v87 = swift_slowAlloc(32, -1);
      v93 = v87;
      *(_DWORD *)v57 = 138412546;
      v84 = v15;
      v85 = v52;
      v88 = v50;
      v96 = (uint64_t)v19;
      v59 = v51;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97);
      *v58 = v19;

      *(_WORD *)(v57 + 12) = 2080;
      v60 = SFRemoteAlertPresentationRequest.id.getter();
      v62 = v61;
      v96 = sub_100025614(v60, v61, &v93);
      v15 = v84;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97);
      swift_bridgeObjectRelease(v62);
      v63 = *(void (**)(char *, uint64_t))(v10 + 8);
      v63(v13, v9);
      v52 = v85;
      _os_log_impl((void *)&_mh_execute_header, v85, (os_log_type_t)v86, "Configuring remote alert scene: %@ for request with ID: %s", (uint8_t *)v57, 0x16u);
      v64 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(v58, 1, v64);
      swift_slowDealloc(v58, -1, -1);
      v65 = v87;
      swift_arrayDestroy(v87, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v65, -1, -1);
      swift_slowDealloc(v57, -1, -1);
    }
    else
    {

      v63 = *(void (**)(char *, uint64_t))(v10 + 8);
      v63(v13, v9);
    }

    if ((SFRemoteAlertPresentationRequest.contentOverlaysStatusBar.getter() & 1) != 0)
    {
      v66 = objc_msgSend(v19, "respondsToSelector:", "setContentOverlaysStatusBar:animationSettings:");
      if ((_DWORD)v66)
      {
        objc_msgSend(v19, "setContentOverlaysStatusBar:animationSettings:", 1, 0);
      }
      else
      {
        v67 = Logger.logObject.getter(v66);
        v68 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v67, v68))
        {
          v69 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v69 = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, v68, "Wanted to set contentOverlaysStatusBar to true, but this version of SpringBoard does not support it.", v69, 2u);
          swift_slowDealloc(v69, -1, -1);
        }

      }
    }
    objc_msgSend(v19, "setAllowsAlertStacking:", 1);
    v70 = objc_msgSend(v19, "setOrientationChangedEventsDisabled:", 1);
    v72 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow((uint64_t)v70, v71)), "initWithWindowScene:", v19);
    v74 = (objc_class *)type metadata accessor for RemoteAlertRootViewController(0, v73);
    v75 = (char *)objc_allocWithZone(v74);
    v76 = swift_unknownObjectWeakInit(&v75[OBJC_IVAR____TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController_remoteAlertScene], 0);
    swift_unknownObjectWeakAssign(v76, v19);
    v95.receiver = v75;
    v95.super_class = v74;
    v77 = objc_msgSendSuper2(&v95, "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v72, "setRootViewController:", v77);
    objc_msgSend(v72, "makeKeyAndVisible");
    v78 = v91;
    v79 = *(void **)(v91 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window);
    *(_QWORD *)(v91 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window) = v72;
    v80 = v72;

    v81 = (uint64_t)v90;
    v89(v90, v15, v9);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(v81, 0, 1, v9);
    v82 = v78 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest;
    swift_beginAccess(v78 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest, &v93, 33, 0);
    sub_100016FC0(v81, v82);
    swift_endAccess(&v93);

    v63(v15, v9);
  }
}

void sub_1000165E8()
{
  uint64_t v0;
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
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  _BYTE v22[24];

  v1 = v0;
  v2 = sub_100009344(&qword_10003FF28);
  __chkstk_darwin(v2);
  v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for SFRemoteAlertPresentationRequest(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10003EE00 != -1)
    swift_once(&qword_10003EE00, sub_10000B14C);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_10000A054(v9, (uint64_t)qword_100041CE8);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "RemoteAlertSceneDelegate: sceneDidBecomeActive", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  v14 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_window);
  if (v14)
  {
    v15 = objc_msgSend(v14, "rootViewController");
    if (v15)
    {
      v21 = v15;
      v17 = type metadata accessor for RemoteAlertRootViewController(0, v16);
      v18 = (void *)swift_dynamicCastClass(v21, v17);
      if (v18
        && (v19 = objc_msgSend(v18, "presentedViewController"),
            v19,
            !v19))
      {
        v20 = v1 + OBJC_IVAR____TtC16SharingUIService24RemoteAlertSceneDelegate_presentationRequest;
        swift_beginAccess(v20, v22, 0, 0);
        sub_100016F38(v20, (uint64_t)v4);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
        {

          sub_100016F80((uint64_t)v4);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
          sub_100015440((uint64_t)v8);

          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        }
      }
      else
      {

      }
    }
  }
}

void sub_100016858(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  id v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  id v56;
  int64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[4];

  if (qword_10003EE00 != -1)
LABEL_51:
    swift_once(&qword_10003EE00, sub_10000B14C);
  v4 = type metadata accessor for Logger(0);
  sub_10000A054(v4, (uint64_t)qword_100041CE8);
  v5 = swift_bridgeObjectRetain_n(a2, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v63 = v9;
    *(_DWORD *)v8 = 136315138;
    v11 = sub_100015B38(0, v10);
    v13 = sub_100015B74(v11, v12);
    v14 = swift_bridgeObjectRetain(a2);
    v15 = Set.description.getter(v14, v11, v13);
    v17 = v16;
    swift_bridgeObjectRelease(a2);
    v62 = sub_100025614(v15, v17, &v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "RemoteAlertSceneDelegate: handle buttonActions: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  v18 = objc_msgSend(a1, "configurationIdentifier");
  if (v18)
  {
    v19 = v18;
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v22 = v21;

    type metadata accessor for SUISRemoteAlertPresentationManager(0);
    v23 = sub_10000C114();
    a1 = (void *)dispatch thunk of SFRemoteAlertPresentationManager.presentationHandle(for:)(v20, v22);

    if (a1)
    {
      swift_bridgeObjectRelease(v22);
      if ((a2 & 0xC000000000000001) != 0)
      {
        if (a2 < 0)
          v24 = a2;
        else
          v24 = a2 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(a2);
        v25 = __CocoaSet.makeIterator()(v24);
        v27 = sub_100015B38(0, v26);
        v29 = sub_100015B74(v27, v28);
        v30 = Set.Iterator.init(_cocoa:)(&v63, v25, v27, v29);
        a2 = v63;
        v60 = v64[0];
        v31 = v64[1];
        v32 = v64[2];
        v33 = v64[3];
      }
      else
      {
        v45 = -1 << *(_BYTE *)(a2 + 32);
        v60 = a2 + 56;
        v31 = ~v45;
        v46 = -v45;
        if (v46 < 64)
          v47 = ~(-1 << v46);
        else
          v47 = -1;
        v33 = v47 & *(_QWORD *)(a2 + 56);
        v30 = (_QWORD *)swift_bridgeObjectRetain(a2);
        v32 = 0;
      }
      v48 = (unint64_t)(v31 + 64) >> 6;
      while (1)
      {
        if (a2 < 0)
        {
          v52 = __CocoaSet.Iterator.next()(v30);
          if (!v52)
            goto LABEL_49;
          v54 = v52;
          v61 = v52;
          v55 = sub_100015B38(0, v53);
          swift_unknownObjectRetain(v54);
          swift_dynamicCast(&v62, &v61, (char *)&type metadata for Swift.AnyObject + 8, v55, 7);
          v56 = (id)v62;
          swift_unknownObjectRelease(v54);
          v51 = v32;
          v49 = v33;
          if (!v56)
            goto LABEL_49;
        }
        else
        {
          if (v33)
          {
            v49 = (v33 - 1) & v33;
            v50 = __clz(__rbit64(v33)) | (v32 << 6);
            v51 = v32;
          }
          else
          {
            v57 = v32 + 1;
            if (__OFADD__(v32, 1))
            {
              __break(1u);
              goto LABEL_51;
            }
            if (v57 >= v48)
              goto LABEL_49;
            v58 = *(_QWORD *)(v60 + 8 * v57);
            v51 = v32 + 1;
            if (!v58)
            {
              v51 = v32 + 2;
              if (v32 + 2 >= v48)
                goto LABEL_49;
              v58 = *(_QWORD *)(v60 + 8 * v51);
              if (!v58)
              {
                v51 = v32 + 3;
                if (v32 + 3 >= v48)
                  goto LABEL_49;
                v58 = *(_QWORD *)(v60 + 8 * v51);
                if (!v58)
                {
                  v51 = v32 + 4;
                  if (v32 + 4 >= v48)
                    goto LABEL_49;
                  v58 = *(_QWORD *)(v60 + 8 * v51);
                  if (!v58)
                  {
                    v59 = v32 + 5;
                    while (v48 != v59)
                    {
                      v58 = *(_QWORD *)(v60 + 8 * v59++);
                      if (v58)
                      {
                        v51 = v59 - 1;
                        goto LABEL_44;
                      }
                    }
LABEL_49:
                    sub_100011544(a2);
                    swift_release(a1);
                    return;
                  }
                }
              }
            }
LABEL_44:
            v49 = (v58 - 1) & v58;
            v50 = __clz(__rbit64(v58)) + (v51 << 6);
          }
          v56 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v50);
          if (!v56)
            goto LABEL_49;
        }
        if (objc_msgSend(v56, "events") == (id)16)
          dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)(1, 0, 0);
        else
          objc_msgSend(v56, "sendResponseWithUnHandledEvents:", objc_msgSend(v56, "events"));

        v32 = v51;
        v33 = v49;
      }
    }
    v42 = swift_bridgeObjectRetain(v22);
    v35 = Logger.logObject.getter(v42);
    v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, (os_log_type_t)v43))
    {
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v44 = swift_slowAlloc(32, -1);
      v63 = v44;
      *(_DWORD *)v37 = 136315138;
      swift_bridgeObjectRetain(v22);
      v62 = sub_100025614(v20, v22, &v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63);
      swift_bridgeObjectRelease_n(v22, 3);
      _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v43, "Could not find a remote alert presentation request for ID: %s", v37, 0xCu);
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      v41 = (_QWORD *)v44;
      goto LABEL_16;
    }

    swift_bridgeObjectRelease_n(v22, 2);
  }
  else
  {
    v34 = a1;
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v38 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v37 = 138412290;
      v63 = (uint64_t)v34;
      v39 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, v64);
      *v38 = v34;

      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Could not find configuration identifier on remote alert scene: %@", v37, 0xCu);
      v40 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(v38, 1, v40);
      v41 = v38;
LABEL_16:
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v37, -1, -1);

      return;
    }

  }
}

uint64_t sub_100016F38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100009344(&qword_10003FF28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016F80(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100009344(&qword_10003FF28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100016FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100009344(&qword_10003FF28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_100017008(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = type metadata accessor for SceneSessionManager(0, a2);
  v3 = swift_allocObject(v2, 32, 7);
  *(_QWORD *)(v3 + 16) = 2;
  *(_QWORD *)(v3 + 24) = &_swiftEmptyArrayStorage;
  v5 = objc_msgSend((id)objc_opt_self(NSNotificationCenter, v4), "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", v3, "didReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

  qword_100041D70 = v3;
}

uint64_t sub_100017160(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v2 = v1;
  if (qword_10003EE00 != -1)
    swift_once(&qword_10003EE00, sub_10000B14C);
  v4 = type metadata accessor for Logger(0);
  sub_10000A054(v4, (uint64_t)qword_100041CE8);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v16 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "disconnect scene:%@", v8, 0xCu);
    v11 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  objc_msgSend(v5, "_unregisterSceneComponentForKey:", *(_QWORD *)(v2 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneComponentKey));
  v12 = v2 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession;
  result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession);
  if (result)
  {
    v14 = result;
    v15 = *(_QWORD *)(v12 + 8);
    if (qword_10003EE48 != -1)
      swift_once(&qword_10003EE48, sub_100017008);
    sub_100014524(v14, v15);
    return swift_unknownObjectRelease(v14);
  }
  return result;
}

void sub_1000173DC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  char v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v2 = v1;
  v4 = v1 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession;
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = Strong;
    v7 = *(_QWORD *)(v4 + 8);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(uint64_t, uint64_t))(v7 + 48))(ObjectType, v7);
    v9 = *(_BYTE *)(v2 + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_isModernScene);
    v10 = objc_msgSend(a1, "_FBSScene");
    v23 = objc_msgSend(v10, "settings");

    if ((v9 & 1) != 0)
    {
      v12 = objc_msgSend(v23, "isForeground");

      if (v12)
        goto LABEL_14;
      goto LABEL_11;
    }
    v20 = objc_opt_self(SHSheetSceneSettings, v11);
    v21 = (void *)swift_dynamicCastObjCClass(v23, v20);
    if (v21)
    {
      v22 = objc_msgSend(v21, "applicationState");

      if (v22 != (id)2)
      {
LABEL_14:
        swift_unknownObjectRelease(v6);
        return;
      }
LABEL_11:
      if (qword_10003EE48 != -1)
        swift_once(&qword_10003EE48, sub_100017008);
      sub_100013CE4(2);
      goto LABEL_14;
    }
    swift_unknownObjectRelease(v6);
  }
  else
  {
    if (qword_10003EE00 != -1)
      swift_once(&qword_10003EE00, sub_10000B14C);
    v13 = type metadata accessor for Logger(0);
    sub_10000A054(v13, (uint64_t)qword_100041CE8);
    v23 = a1;
    v14 = Logger.logObject.getter(v23);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(12, -1);
      v17 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v16 = 138412290;
      v24 = v23;
      v18 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
      *v17 = v23;

      _os_log_impl((void *)&_mh_execute_header, v14, v15, "no scene session for scene settings update:%@", v16, 0xCu);
      v19 = sub_100009344(&qword_10003F220);
      swift_arrayDestroy(v17, 1, v19);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);

      return;
    }

  }
}

id sub_10001777C(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for SceneDelegate(a1, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService13SceneDelegate, a2);
}

unint64_t sub_100017814(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v3;

  result = qword_100040040;
  if (!qword_100040040)
  {
    v3 = objc_opt_self(NSString, a2);
    result = swift_getObjCClassMetadata(v3);
    atomic_store(result, (unint64_t *)&qword_100040040);
  }
  return result;
}

void sub_100017850(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  objc_class *v28;
  char *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  char *v37;
  char *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char *v42;
  id v43;
  void *v44;
  id v45;
  _UNKNOWN **v46;
  id v47;
  char *v48;
  char *v49;
  _BYTE *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  _BYTE *v57;
  char *v58;
  id v59;
  objc_super v60;

  v2 = v1;
  v4 = sub_100009344((uint64_t *)&unk_10003F200);
  __chkstk_darwin(v4);
  v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EE00 != -1)
    swift_once(&qword_10003EE00, sub_10000B14C);
  v7 = type metadata accessor for Logger(0);
  sub_10000A054(v7, (uint64_t)qword_100041CE8);
  v8 = a1;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = (_QWORD *)swift_slowAlloc(8, -1);
    v57 = v2;
    v58 = v6;
    *(_DWORD *)v11 = 138412290;
    v59 = v8;
    v13 = v8;
    v2 = v57;
    v6 = v58;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
    *v12 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "connect scene:%@", v11, 0xCu);
    v14 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v12, 1, v14);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

  }
  v15 = objc_msgSend(v8, "session");
  v16 = objc_msgSend(v15, "configuration");

  v17 = objc_msgSend(v16, "role");
  v18 = UISceneSessionRoleShareSheet;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v21 = v20;
  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
  v24 = v22;
  if (v19 == v23 && v21 == v22)
  {

    swift_bridgeObjectRelease_n(v21, 2);
LABEL_10:
    v28 = (objc_class *)type metadata accessor for SceneWindowObserver(0, v25);
    v29 = (char *)objc_allocWithZone(v28);
    *(_QWORD *)&v29[OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene] = v8;
    v60.receiver = v29;
    v60.super_class = v28;
    v30 = v8;
    v31 = objc_msgSendSuper2(&v60, "init");

    UIScene.hostStorage.getter(objc_msgSend(v30, "_registerSceneComponent:forKey:", v31, *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneComponentKey]));
    v32 = sub_100009344((uint64_t *)&unk_100040050);
    LODWORD(v28) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 48))(v6, 1, v32);
    sub_100017E00((uint64_t)v6);
    v34 = OBJC_IVAR____TtC16SharingUIService13SceneDelegate_isModernScene;
    v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_isModernScene] = (_DWORD)v28 != 1;
    if ((_DWORD)v28 == 1)
    {
      v47 = objc_allocWithZone((Class)type metadata accessor for ShareSheetSceneSession(0, v33));
      sub_10000E698(v30);
      v42 = v48;
      v46 = &off_100035948;
    }
    else
    {
      v35 = objc_allocWithZone((Class)type metadata accessor for ShareSheetRemoteSceneSession(0, v33));
      v36 = v30;
      sub_10000A06C(v36);
      v38 = v37;

      v39 = *(void **)&v38[OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_window];
      v40 = OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window;
      v41 = *(void **)&v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window];
      *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window] = v39;
      v42 = v38;
      v43 = v39;

      v44 = *(void **)&v2[v40];
      if (v44)
      {
        v45 = v44;
        objc_msgSend(v45, "makeKeyAndVisible");

      }
      v46 = &off_1000352B0;
    }
    v49 = &v2[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession];
    *((_QWORD *)v49 + 1) = v46;
    swift_unknownObjectWeakAssign(v49, v42);
    if (qword_10003EE48 != -1)
      swift_once(&qword_10003EE48, sub_100017008);
    sub_1000142D4((uint64_t)v42, (uint64_t)v46);
    v50 = v2;
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v53 = 67109120;
      LODWORD(v59) = v2[v34];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, (char *)&v59 + 4);

      _os_log_impl((void *)&_mh_execute_header, v51, v52, "setup share sheet scene isModernScene: %{BOOL}d", v53, 8u);
      swift_slowDealloc(v53, -1, -1);
      swift_unknownObjectRelease(v42);

    }
    else
    {

      swift_unknownObjectRelease(v42);
      v51 = v31;
    }
    goto LABEL_22;
  }
  v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, v23, v22, 0);

  swift_bridgeObjectRelease(v21);
  v27 = swift_bridgeObjectRelease(v24);
  if ((v26 & 1) != 0)
    goto LABEL_10;
  v51 = Logger.logObject.getter(v27);
  v54 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v51, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v55 = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, v54, "scene session role is not supported.", v55, 2u);
    swift_slowDealloc(v55, -1, -1);
  }
LABEL_22:

}

uint64_t sub_100017E00(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100009344((uint64_t *)&unk_10003F200);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100017E40(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

uint64_t sub_100017E64()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000B198(v0, static ShareIntentMode.typeDisplayRepresentation);
  sub_10000A054(v0, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
  return TypeDisplayRepresentation.init(stringLiteral:)(1701080909, 0xE400000000000000);
}

uint64_t ShareIntentMode.typeDisplayRepresentation.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_10003EE50 != -1)
    swift_once(&qword_10003EE50, sub_100017E64);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000A054(v0, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
}

uint64_t static ShareIntentMode.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10003EE50 != -1)
    swift_once(&qword_10003EE50, sub_100017E64);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ShareIntentMode.typeDisplayRepresentation.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  if (qword_10003EE50 != -1)
    swift_once(&qword_10003EE50, sub_100017E64);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
  swift_beginAccess(v3, v6, 33, 0);
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ShareIntentMode.typeDisplayRepresentation.modify(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10003EE50 != -1)
    swift_once(&qword_10003EE50, sub_100017E64);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareIntentMode.typeDisplayRepresentation);
  swift_beginAccess(v3, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t sub_1000180C0()
{
  uint64_t v0;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v21;
  uint64_t result;
  _BYTE *v23;
  uint64_t v24;

  v0 = sub_100009344(&qword_1000400C8);
  __chkstk_darwin(v0);
  v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100009344(&qword_10003EE80);
  __chkstk_darwin(v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v24 = v6;
  __chkstk_darwin(v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100009344((uint64_t *)&unk_1000400D0);
  v11 = sub_100009344(&qword_10003FC90);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 72);
  v14 = *(unsigned __int8 *)(v12 + 80);
  v15 = (v14 + 32) & ~v14;
  v16 = swift_allocObject(v10, v15 + 2 * v13, v14 | 7);
  *(_OWORD *)(v16 + 16) = xmmword_100028560;
  v17 = (_BYTE *)(v16 + v15);
  v23 = &v17[*(int *)(v11 + 48)];
  *v17 = 0;
  LocalizedStringResource.init(stringLiteral:)(0x706F4320646E6553, 0xE900000000000079);
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v18(v5, 1, 1, v6);
  v19 = type metadata accessor for DisplayRepresentation.Image(0);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20(v2, 1, 1, v19);
  DisplayRepresentation.init(title:subtitle:image:)(v9, v5, v2);
  v17[v13] = 1;
  LocalizedStringResource.init(stringLiteral:)(0x726F62616C6C6F43, 0xEB00000000657461);
  v18(v5, 1, 1, v24);
  v20(v2, 1, 1, v19);
  DisplayRepresentation.init(title:subtitle:image:)(v9, v5, v2);
  v21 = sub_100012C90(v16);
  swift_setDeallocating(v16);
  swift_arrayDestroy(v17, 2, v11);
  result = swift_deallocClassInstance(v16, 32, 7);
  static ShareIntentMode.caseDisplayRepresentations = v21;
  return result;
}

uint64_t *ShareIntentMode.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_10003EE58 != -1)
    swift_once(&qword_10003EE58, sub_1000180C0);
  return &static ShareIntentMode.caseDisplayRepresentations;
}

uint64_t static ShareIntentMode.caseDisplayRepresentations.getter()
{
  _BYTE v1[24];

  if (qword_10003EE58 != -1)
    swift_once(&qword_10003EE58, sub_1000180C0);
  swift_beginAccess(&static ShareIntentMode.caseDisplayRepresentations, v1, 0, 0);
  return swift_bridgeObjectRetain(static ShareIntentMode.caseDisplayRepresentations);
}

uint64_t static ShareIntentMode.caseDisplayRepresentations.setter(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[24];

  if (qword_10003EE58 != -1)
    swift_once(&qword_10003EE58, sub_1000180C0);
  swift_beginAccess(&static ShareIntentMode.caseDisplayRepresentations, v4, 1, 0);
  v2 = static ShareIntentMode.caseDisplayRepresentations;
  static ShareIntentMode.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease(v2);
}

uint64_t (*static ShareIntentMode.caseDisplayRepresentations.modify(uint64_t a1))(_QWORD)
{
  if (qword_10003EE58 != -1)
    swift_once(&qword_10003EE58, sub_1000180C0);
  swift_beginAccess(&static ShareIntentMode.caseDisplayRepresentations, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t ShareIntentMode.description.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6F62616C6C6F632ELL;
  else
    return 0x706F43646E65732ELL;
}

SharingUIService::ShareIntentMode_optional __swiftcall ShareIntentMode.init(rawValue:)(Swift::UInt rawValue)
{
  SharingUIService::ShareIntentMode_optional v1;

  if (rawValue == 1)
    v1.value = SharingUIService_ShareIntentMode_collaborate;
  else
    v1.value = SharingUIService_ShareIntentMode_unknownDefault;
  if (rawValue)
    return v1;
  else
    return 0;
}

_UNKNOWN **static ShareIntentMode.allCases.getter()
{
  return &off_100034F90;
}

uint64_t ShareIntentMode.rawValue.getter(char a1)
{
  return a1 & 1;
}

BOOL sub_100018534(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_100018550()
{
  unint64_t result;

  result = qword_100040060;
  if (!qword_100040060)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_100040060);
  }
  return result;
}

Swift::Int sub_100018594()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000185D8()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100018600(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

_QWORD *sub_100018640@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_100018660(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_100018670()
{
  unint64_t result;

  result = qword_100040068;
  if (!qword_100040068)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_100040068);
  }
  return result;
}

unint64_t sub_1000186B8()
{
  unint64_t result;

  result = qword_100040070;
  if (!qword_100040070)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_100040070);
  }
  return result;
}

unint64_t sub_100018700()
{
  unint64_t result;

  result = qword_100040078;
  if (!qword_100040078)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_100040078);
  }
  return result;
}

void *sub_100018744()
{
  return &protocol witness table for UInt;
}

uint64_t sub_100018750()
{
  _BYTE *v0;

  if (*v0)
    return 0x6F62616C6C6F632ELL;
  else
    return 0x706F43646E65732ELL;
}

unint64_t sub_10001879C()
{
  unint64_t result;

  result = qword_100040080;
  if (!qword_100040080)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_100040080);
  }
  return result;
}

unint64_t sub_1000187E4()
{
  unint64_t result;

  result = qword_100040088;
  if (!qword_100040088)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_100040088);
  }
  return result;
}

unint64_t sub_10001882C()
{
  unint64_t result;

  result = qword_100040090;
  if (!qword_100040090)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_100040090);
  }
  return result;
}

unint64_t sub_100018874()
{
  unint64_t result;

  result = qword_100040098;
  if (!qword_100040098)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_100040098);
  }
  return result;
}

uint64_t sub_1000188B8(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000097E8();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>, 1);
}

uint64_t sub_1000188F8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000097E8();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100018934()
{
  unint64_t result;

  result = qword_1000400A0;
  if (!qword_1000400A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_1000400A0);
  }
  return result;
}

unint64_t sub_10001897C()
{
  unint64_t result;

  result = qword_1000400A8;
  if (!qword_1000400A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_1000400A8);
  }
  return result;
}

unint64_t sub_1000189C4()
{
  unint64_t result;

  result = qword_1000400B0;
  if (!qword_1000400B0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntentMode, &type metadata for ShareIntentMode);
    atomic_store(result, (unint64_t *)&qword_1000400B0);
  }
  return result;
}

uint64_t sub_100018A08(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100018874();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100018A44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000400B8;
  if (!qword_1000400B8)
  {
    v1 = sub_10000AD04(&qword_1000400C0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000400B8);
  }
  return result;
}

void sub_100018A90(_QWORD *a1@<X8>)
{
  *a1 = &off_100034FB8;
}

_BYTE *initializeBufferWithCopyOfBuffer for ShareIntentMode(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShareIntentMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ShareIntentMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100018B8C + 4 * byte_100028575[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100018BC0 + 4 * byte_100028570[v4]))();
}

uint64_t sub_100018BC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018BC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100018BD0);
  return result;
}

uint64_t sub_100018BDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100018BE4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100018BE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018BF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018BFC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100018C04(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShareIntentMode()
{
  return &type metadata for ShareIntentMode;
}

void sub_100018C20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  unint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  BOOL v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject **v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  NSArray v52;
  id v53;
  Class isa;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  objc_class *v60;
  void *v61;
  uint64_t v62;
  uint64_t Strong;
  uint64_t v64;
  uint64_t v65;
  uint64_t ObjectType;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  unint64_t v73;
  uint64_t v74;
  void **aBlock;
  uint64_t v76;
  void (*v77)(uint64_t, void *);
  void *v78;
  void (*v79)(void *);
  uint64_t v80;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_wantsRemoteOptionsPresentation) != 1)
    return;
  v1 = v0;
  v2 = SHSheetOptionGroups.groups.getter();
  if (!v2)
    return;
  v3 = v2;
  if (qword_10003EE08 != -1)
    goto LABEL_46;
  while (1)
  {
    v68 = v1;
    v4 = type metadata accessor for Logger(0);
    sub_10000A054(v4, (uint64_t)qword_100041D00);
    v5 = swift_bridgeObjectRetain_n(v3, 4);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.default.getter();
    v8 = (unint64_t)v3 >> 62;
    v70 = v3;
    if (os_log_type_enabled(v6, v7))
    {
      v9 = swift_slowAlloc(22, -1);
      v10 = (void **)swift_slowAlloc(32, -1);
      aBlock = v10;
      *(_DWORD *)v9 = 134218242;
      if (v8)
      {
        if (v3 >= 0)
          v67 = v3 & 0xFFFFFFFFFFFFFF8;
        else
          v67 = v3;
        swift_bridgeObjectRetain(v3);
        v11 = _CocoaArrayWrapper.endIndex.getter(v67);
        swift_bridgeObjectRelease(v3);
      }
      else
      {
        v11 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v3);
      v74 = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &aBlock);
      swift_bridgeObjectRelease(v3);
      *(_WORD *)(v9 + 12) = 2080;
      v12 = sub_10000ABC0(0, (unint64_t *)&unk_100040300, _UIActivityItemCustomizationGroup_ptr);
      v13 = swift_bridgeObjectRetain(v3);
      v14 = Array.description.getter(v13, v12);
      v16 = v15;
      swift_bridgeObjectRelease(v3);
      v74 = sub_100025614(v14, v16, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &aBlock);
      swift_bridgeObjectRelease_n(v3, 2);
      swift_bridgeObjectRelease(v16);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "options to update: group count %ld, %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);

      v8 = (unint64_t)v3 >> 62;
    }
    else
    {

      swift_bridgeObjectRelease_n(v3, 4);
    }
    v17 = swift_allocObject(&unk_100035DC0, 24, 7);
    swift_unknownObjectWeakInit(v17 + 16, v68);
    v69 = v3 & 0xFFFFFFFFFFFFFF8;
    if (!v8)
    {
      v1 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v3);
      if (!v1)
        break;
      goto LABEL_11;
    }
    v48 = v3 >= 0 ? v3 & 0xFFFFFFFFFFFFFF8 : v3;
    swift_bridgeObjectRetain(v3);
    v1 = _CocoaArrayWrapper.endIndex.getter(v48);
    if (!v1)
      break;
LABEL_11:
    v18 = 0;
    v71 = v1;
    while (1)
    {
      if ((v70 & 0xC000000000000001) != 0)
      {
        v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18, v70);
        v20 = __OFADD__(v18, 1);
        v21 = v18 + 1;
        if (v20)
          goto LABEL_43;
      }
      else
      {
        if (v18 >= *(_QWORD *)(v69 + 16))
          goto LABEL_45;
        v19 = *(id *)(v70 + 32 + 8 * v18);
        v20 = __OFADD__(v18, 1);
        v21 = v18 + 1;
        if (v20)
        {
LABEL_43:
          __break(1u);
          goto LABEL_44;
        }
      }
      v72 = v19;
      v22 = objc_msgSend(v19, "customizations");
      v23 = sub_10000ABC0(0, &qword_1000402F8, _UIActivityItemCustomization_ptr);
      v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v22, v23);

      v73 = v21;
      if ((unint64_t)v3 >> 62)
        break;
      v1 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v1)
        goto LABEL_21;
LABEL_12:

      swift_bridgeObjectRelease(v3);
      v1 = v71;
      v18 = v73;
      if (v73 == v71)
        goto LABEL_51;
    }
    if (v3 < 0)
      v47 = v3;
    else
      v47 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v1 = _CocoaArrayWrapper.endIndex.getter(v47);
    swift_bridgeObjectRelease(v3);
    if (!v1)
      goto LABEL_12;
LABEL_21:
    if (v1 >= 1)
    {
      v24 = 0;
      while (1)
      {
        if ((v3 & 0xC000000000000001) != 0)
          v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v24, v3);
        else
          v25 = *(id *)(v3 + 8 * v24 + 32);
        v27 = v25;
        v28 = objc_opt_self(_UIActivityItemCustomizationPicker, v26);
        v29 = swift_dynamicCastObjCClass(v27, v28);
        if (v29)
        {
          v31 = (void *)v29;
          v79 = sub_10001DFD4;
          v80 = v17;
          aBlock = _NSConcreteStackBlock;
          v76 = 1107296256;
          v77 = sub_10001AE24;
          v32 = &unk_100035E78;
        }
        else
        {
          v33 = objc_opt_self(_UIActivityItemCustomizationSwitch, v30);
          v34 = swift_dynamicCastObjCClass(v27, v33);
          if (v34)
          {
            v31 = (void *)v34;
            v79 = sub_10001DFD4;
            v80 = v17;
            aBlock = _NSConcreteStackBlock;
            v76 = 1107296256;
            v77 = sub_10001AE24;
            v32 = &unk_100035E50;
          }
          else
          {
            v36 = objc_opt_self(_UIActivityItemCustomizationTextField, v35);
            v37 = swift_dynamicCastObjCClass(v27, v36);
            if (!v37)
            {
              v41 = v27;
              v40 = Logger.logObject.getter(v41);
              v42 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v40, v42))
              {
                v43 = swift_slowAlloc(12, -1);
                v44 = v41;
                v45 = (NSObject **)swift_slowAlloc(8, -1);
                *(_DWORD *)v43 = 138412290;
                *(_QWORD *)(v43 + 4) = v44;
                *v45 = v44;
                _os_log_impl((void *)&_mh_execute_header, v40, v42, "Received unhandled customization: %@", (uint8_t *)v43, 0xCu);
                v46 = sub_100009344(&qword_10003F220);
                swift_arrayDestroy(v45, 1, v46);
                swift_slowDealloc(v45, -1, -1);
                swift_slowDealloc(v43, -1, -1);

              }
              else
              {

                v40 = v41;
              }
              goto LABEL_33;
            }
            v31 = (void *)v37;
            v79 = sub_10001DFD4;
            v80 = v17;
            aBlock = _NSConcreteStackBlock;
            v76 = 1107296256;
            v77 = sub_10001AE24;
            v32 = &unk_100035E28;
          }
        }
        v78 = v32;
        v38 = _Block_copy(&aBlock);
        v39 = v80;
        v40 = v27;
        swift_retain(v17);
        swift_release(v39);
        objc_msgSend(v31, "_setHandler:", v38);

        _Block_release(v38);
LABEL_33:
        ++v24;

        if (v1 == v24)
          goto LABEL_12;
      }
    }
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once(&qword_10003EE08, sub_10000B170);
  }
LABEL_51:
  swift_bridgeObjectRelease(v70);
  v49 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController;
  v50 = *(void **)(v68 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController);
  if (v50)
  {
    sub_10000ABC0(0, (unint64_t *)&unk_100040300, _UIActivityItemCustomizationGroup_ptr);
    v51 = v50;
    v52.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v70);
    objc_msgSend(v51, "updateWithCustomizationGroups:", v52.super.isa);

  }
  else
  {
    v53 = objc_allocWithZone((Class)SHSheetOptionsViewContext);
    sub_10000ABC0(0, (unint64_t *)&unk_100040300, _UIActivityItemCustomizationGroup_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v70);
    v55 = objc_msgSend(v53, "initWithCustomizationGroups:", isa);

    v52.super.isa = (Class)objc_msgSend((id)objc_opt_self(SHSheetFactory, v56), "createOptionsViewControllerWithContext:delegate:", v55, v68);
    v58 = objc_opt_self(ObjectManipulationViewController, v57);
    v59 = swift_dynamicCastObjCClass(v52.super.isa, v58);
    if (v59)
      v60 = v52.super.isa;
    v61 = *(void **)(v68 + v49);
    *(_QWORD *)(v68 + v49) = v59;

    v62 = v68 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
    Strong = swift_unknownObjectWeakLoadStrong(v68 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
    if (Strong)
    {
      v64 = Strong;
      v65 = *(_QWORD *)(v62 + 8);
      ObjectType = swift_getObjectType(Strong);
      (*(void (**)(uint64_t, Class, uint64_t, uint64_t))(v65 + 32))(v68, v52.super.isa, ObjectType, v65);

      swift_unknownObjectRelease(v64);
    }
    else
    {

    }
  }

  swift_release(v17);
}

void sub_100019430(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  NSString v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t Strong;
  uint64_t v39;
  uint64_t v40;
  uint64_t ObjectType;
  id v42;
  NSObject *oslog;
  _QWORD aBlock[5];
  uint64_t v45;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_wantsRemoteOptionsPresentation) == 1
    && a1 != 0)
  {
    v3 = v1;
    v42 = a1;
    v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
    v7 = v6;
    v8 = objc_allocWithZone((Class)NSKeyedUnarchiver);
    v9 = sub_10001D654();
    sub_10000AC68(v5, v7);
    if (!v9)
    {
      if (qword_10003EE08 != -1)
        swift_once(&qword_10003EE08, sub_10000B170);
      v10 = type metadata accessor for Logger(0);
      v11 = sub_10000A054(v10, (uint64_t)qword_100041D00);
      oslog = Logger.logObject.getter(v11);
      v12 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Found collaboration options data but couldn't create unarchiver to decode it", v13, 2u);
        swift_slowDealloc(v13, -1, -1);

LABEL_11:
        return;
      }
      goto LABEL_26;
    }
    objc_msgSend(v9, "setRequiresSecureCoding:", 1);
    v14 = sub_10000ABC0(0, &qword_1000402F0, _SWCollaborationShareOptions_ptr);
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSKeyedArchiveRootObjectKey);
    v17 = v16;
    oslog = NSCoder.decodeObject<A>(of:forKey:)(v14, v15, v16, v14);
    swift_bridgeObjectRelease(v17);
    if (!oslog)
    {
      if (qword_10003EE08 != -1)
        swift_once(&qword_10003EE08, sub_10000B170);
      v24 = type metadata accessor for Logger(0);
      v25 = sub_10000A054(v24, (uint64_t)qword_100041D00);
      oslog = Logger.logObject.getter(v25);
      v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v26, "Couldn't decode collaboration options", v27, 2u);
        swift_slowDealloc(v27, -1, -1);

        goto LABEL_11;
      }

      goto LABEL_27;
    }
    objc_msgSend(v9, "finishDecoding");
    v18 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController;
    if (*(_QWORD *)(v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController))
    {
      if (qword_10003EE08 != -1)
        swift_once(&qword_10003EE08, sub_10000B170);
      v19 = type metadata accessor for Logger(0);
      v20 = sub_10000A054(v19, (uint64_t)qword_100041D00);
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Collaboration options view controller already exists", v23, 2u);
        swift_slowDealloc(v23, -1, -1);

        goto LABEL_11;
      }

LABEL_26:
LABEL_27:

      return;
    }
    sub_10001A4E0();
    if (v28)
    {
      v29 = v28;
      v30 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v29);
    }
    else
    {
      v30 = 0;
    }
    v31 = (void *)objc_opt_self(SHSheetFactory, v28);
    v32 = swift_allocObject(&unk_100035DC0, 24, 7);
    swift_unknownObjectWeakInit(v32 + 16, v3);
    aBlock[4] = sub_10001DFCC;
    v45 = v32;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001AE24;
    aBlock[3] = &unk_100035E00;
    v33 = _Block_copy(aBlock);
    swift_release(v45);
    v34 = objc_msgSend(v31, "createCollaborationOptionsViewControllerWithCollaborationOptions:bundleIdentifier:updateHandler:", oslog, v30, v33);
    _Block_release(v33);

    v35 = *(void **)(v3 + v18);
    *(_QWORD *)(v3 + v18) = v34;
    v36 = v34;

    v37 = v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
    Strong = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
    if (Strong)
    {
      v39 = Strong;
      v40 = *(_QWORD *)(v37 + 8);
      ObjectType = swift_getObjectType(Strong);
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v40 + 32))(v3, v36, ObjectType, v40);

      swift_unknownObjectRelease(v39);
    }
    else
    {

    }
  }
}

void sub_100019934(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  char v18;
  id v19;
  unsigned int v20;
  id *v21;
  id v22;
  NSString v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD v38[2];
  uint64_t v39[3];
  uint64_t v40;
  uint64_t v41;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v38 - v9;
  v11 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  if (v11)
  {
    v12 = objc_msgSend(v11, "activitiesByUUID");
    v13 = sub_10000ABC0(0, &qword_10003FC50, UIActivity_ptr);
    v14 = sub_100009DA0((unint64_t *)&unk_10003FC58, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v12, v4, v13, v14);

    v16 = objc_msgSend(a1, "activityUUID");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    if (*(_QWORD *)(v15 + 16))
    {
      v17 = sub_1000120F4((uint64_t)v10);
      if ((v18 & 1) != 0)
      {
        v19 = *(id *)(*(_QWORD *)(v15 + 56) + 8 * v17);
        swift_bridgeObjectRelease(v15);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
        v20 = objc_msgSend(a1, "isPulsing");
        v21 = (id *)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
        if (v20)
        {
          swift_beginAccess(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView, v39, 0, 0);
          v22 = *v21;
          if (v22)
          {
            swift_unknownObjectRetain(v22);
            v23 = objc_msgSend(a1, "localizedTitle");
            if (!v23)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)(0);
              v25 = v24;
              v23 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v25);
            }
            objc_msgSend(v22, "startPulsingActivity:localizedTitle:", v19, v23);

            swift_unknownObjectRelease(v22);
            return;
          }
        }
        else
        {
          swift_beginAccess(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView, v39, 0, 0);
          if (*v21)
            objc_msgSend(*v21, "stopPulsingActivity:", v19);
        }

        return;
      }
    }
    swift_bridgeObjectRelease(v15);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v26 = type metadata accessor for Logger(0);
  sub_10000A054(v26, (uint64_t)qword_100041D00);
  v27 = a1;
  v28 = Logger.logObject.getter(v27);
  v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc(12, -1);
    v31 = swift_slowAlloc(32, -1);
    v38[0] = v5;
    v32 = v31;
    *(_DWORD *)v30 = 136315138;
    v38[1] = v30 + 4;
    v39[0] = v31;
    v33 = objc_msgSend(v27, "activityUUID");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v34 = sub_100009DA0(&qword_1000402E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v35 = dispatch thunk of CustomStringConvertible.description.getter(v4, v34);
    v37 = v36;
    (*(void (**)(char *, uint64_t))(v38[0] + 8))(v8, v4);
    v40 = sub_100025614(v35, v37, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41);

    swift_bridgeObjectRelease(v37);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Couldn't resolve activity for UUUID:%s", v30, 0xCu);
    swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v30, -1, -1);

  }
  else
  {

  }
}

void sub_100019D68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  id *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  id v22;
  void **v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void (*v35)(char *, uint64_t);
  void (*v36)(char *, uint64_t);
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39[3];

  v2 = v1;
  v4 = sub_100009344(&qword_10003F2A0);
  __chkstk_darwin(v4);
  v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)v37 - v12;
  sub_10001DEC0(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100010FD8((uint64_t)v6);
    v14 = (id *)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
    swift_beginAccess(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView, v39, 0, 0);
    if (*v14)
      objc_msgSend(*v14, "reloadContent");
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  v15 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  if (v15)
  {
    v16 = objc_msgSend(v15, "activitiesByUUID");
    v17 = sub_10000ABC0(0, &qword_10003FC50, UIActivity_ptr);
    v18 = sub_100009DA0((unint64_t *)&unk_10003FC58, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v16, v7, v17, v18);

    if (*(_QWORD *)(v19 + 16))
    {
      v20 = sub_1000120F4((uint64_t)v13);
      if ((v21 & 1) != 0)
      {
        v22 = *(id *)(*(_QWORD *)(v19 + 56) + 8 * v20);
        swift_bridgeObjectRelease(v19);
        v23 = (void **)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
        swift_beginAccess(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView, v39, 32, 0);
        v24 = *v23;
        if (v24)
        {
          swift_endAccess(v39);
          objc_msgSend(v24, "reloadActivity:", v22);

          (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
          swift_endAccess(v39);

        }
        return;
      }
    }
    swift_bridgeObjectRelease(v19);
  }
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v25 = type metadata accessor for Logger(0);
  sub_10000A054(v25, (uint64_t)qword_100041D00);
  v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v27 = Logger.logObject.getter(v26);
  v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc(12, -1);
    v30 = swift_slowAlloc(32, -1);
    v39[0] = v30;
    *(_DWORD *)v29 = 136315138;
    v37[1] = v29 + 4;
    v31 = sub_100009DA0(&qword_1000402E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v32 = dispatch thunk of CustomStringConvertible.description.getter(v7, v31);
    v34 = v33;
    v38 = sub_100025614(v32, v33, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, v39);
    swift_bridgeObjectRelease(v34);
    v35 = *(void (**)(char *, uint64_t))(v8 + 8);
    v35(v11, v7);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Couldn't resolve activity for UUUID:%s", v29, 0xCu);
    swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1, -1);
    swift_slowDealloc(v29, -1, -1);

    v35(v13, v7);
  }
  else
  {

    v36 = *(void (**)(char *, uint64_t))(v8 + 8);
    v36(v11, v7);
    v36(v13, v7);
  }
}

uint64_t sub_10001A18C(void *a1)
{
  uint64_t v1;
  void **v3;
  uint64_t result;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSString v11;
  void *v12;
  uint64_t v13;
  _QWORD aBlock[5];
  uint64_t v15;
  char v16[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
  result = swift_beginAccess(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView, v16, 0, 0);
  v5 = *v3;
  if (v5)
  {
    result = (uint64_t)objc_msgSend(v5, "respondsToSelector:", "runScrollingTestWithName:type:completionHandler:");
    if ((result & 1) != 0)
    {
      swift_unknownObjectRetain(v5);
      v6 = objc_msgSend(a1, "name");
      static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      v8 = v7;

      v9 = objc_msgSend(a1, "type");
      v10 = swift_allocObject(&unk_100035DC0, 24, 7);
      swift_unknownObjectWeakInit(v10 + 16, v1);
      swift_retain(v10);
      v11 = String._bridgeToObjectiveC()();
      aBlock[4] = sub_10001DFC4;
      v15 = v10;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000081BC;
      aBlock[3] = &unk_100035DD8;
      v12 = _Block_copy(aBlock);
      swift_retain(v10);
      objc_msgSend(v5, "runScrollingTestWithName:type:completionHandler:", v11, v9, v12);
      _Block_release(v12);

      v13 = v15;
      swift_bridgeObjectRelease(v8);
      swift_release_n(v10, 2);
      swift_unknownObjectRelease(v5);
      return swift_release(v13);
    }
  }
  return result;
}

void sub_10001A328(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;

  v2 = v1;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v4 = type metadata accessor for Logger(0);
  sub_10000A054(v4, (uint64_t)qword_100041D00);
  v5 = a1;
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v14 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "updateSessionContext: %@", v8, 0xCu);
    v11 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v12 = *(void **)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext) = v5;

  v13 = v5;
  sub_10001A9D8();
}

uint64_t sub_10001A4E0()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  __int128 v6;
  void *v7;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken);
  if (!v1)
    return 0;
  v7 = 0;
  v2 = v1;
  objc_msgSend(v2, "realToken");
  CPCopyBundleIdentifierAndTeamFromAuditToken(&v6, &v7, 0);
  v3 = v7;
  if (!v7)
  {

    return 0;
  }
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  return v4;
}

char *sub_10001A5B0(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  objc_class *ObjectType;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  id v17;
  id v18;
  char *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSString v23;
  objc_super v25;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType(v1);
  v5 = &v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration] = 0;
  v7 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_customViewController;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_customViewController] = 0;
  v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_wantsRemoteOptionsPresentation] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController] = 0;
  v8 = *(void **)&v2[v6];
  *(_QWORD *)&v2[v6] = a1;
  v9 = v2;
  v10 = a1;

  v11 = objc_msgSend(v10, "sessionIdentifier");
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  v15 = (uint64_t *)&v9[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_identifier];
  *v15 = v12;
  v15[1] = v14;
  v16 = v9;
  if (objc_msgSend(v10, "wantsCustomScene"))
  {
    v17 = objc_msgSend(v10, "processIdentity");
    v18 = objc_msgSend(objc_allocWithZone((Class)SHSheetCustomSceneViewController), "initWithProcessIdentity:", v17);

    v16 = *(void **)&v2[v7];
    *(_QWORD *)&v2[v7] = v18;

  }
  v25.receiver = v9;
  v25.super_class = ObjectType;
  v19 = (char *)objc_msgSendSuper2(&v25, "init");
  sub_1000055F0();
  sub_10001A7D4();
  v20 = *(void **)&v19[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager];
  if (v20)
  {
    v21 = *(_QWORD *)&v19[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_identifier + 8];
    v22 = v20;
    swift_bridgeObjectRetain(v21);
    v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
    objc_msgSend(v22, "connectUIServiceToDaemonWithSessionID:", v23);

  }
  return v19;
}

id sub_10001A7D4()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  id result;

  v1 = objc_msgSend(objc_allocWithZone((Class)SFShareSheetSlotManager), "init");
  v2 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager) = v1;

  result = *(id *)(v0 + v2);
  if (result)
  {
    objc_msgSend(result, "setDelegate:", v0);
    result = *(id *)(v0 + v2);
    if (result)
      return objc_msgSend(result, "activate");
  }
  return result;
}

id sub_10001A84C()
{
  char *v0;
  objc_class *ObjectType;
  void *v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = *(void **)&v0[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager];
  if (v2)
    objc_msgSend(v2, "invalidate");
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, "dealloc");
}

void sub_10001A9D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  char **v15;
  NSObject *v16;
  uint64_t v17;
  uint8_t *v18;
  id *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for DispatchPredicate(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000ABC0(0, (unint64_t *)&unk_10003FAB0, OS_dispatch_queue_ptr);
  *(_QWORD *)v5 = static OS_dispatch_queue.main.getter(v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  v7 = _dispatchPreconditionTest(_:)(v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((v7 & 1) == 0)
  {
    __break(1u);
LABEL_12:
    swift_once(&qword_10003EE08, sub_10000B170);
    goto LABEL_4;
  }
  v8 = sub_10001B104();
  if (!v8)
    return;
  v5 = v8;
  if (qword_10003EE08 != -1)
    goto LABEL_12;
LABEL_4:
  v9 = type metadata accessor for Logger(0);
  sub_10000A054(v9, (uint64_t)qword_100041D00);
  v10 = v5;
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(12, -1);
    v20 = v1;
    v14 = (uint8_t *)v13;
    v15 = (char **)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412290;
    v21 = v10;
    v16 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    *v15 = v5;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "update content with viewModel %@", v14, 0xCu);
    v17 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v15, 1, v17);
    swift_slowDealloc(v15, -1, -1);
    v18 = v14;
    v1 = v20;
    swift_slowDealloc(v18, -1, -1);
  }
  else
  {

    v11 = v10;
  }

  v19 = (id *)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView);
  swift_beginAccess(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView, &v21, 0, 0);
  if (*v19)
    objc_msgSend(*v19, "updateWithViewModel:", v10);

}

void sub_10001AC58(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  id v6;
  _BYTE v7[24];

  if (a1)
  {
    v3 = a2 + 16;
    swift_beginAccess(a2 + 16, v7, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v3);
    if (Strong)
    {
      v5 = (void *)Strong;
      v6 = a1;
      sub_10001ACBC((uint64_t)v6);

    }
  }
}

void sub_10001ACBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  id v14;

  v2 = v1;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000A054(v4, (uint64_t)qword_100041D00);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "handle remote option update", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v14 = objc_msgSend(objc_allocWithZone((Class)SHSheetOptionsUpdateAction), "initWithCustomization:", a1);
  v9 = v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
  if (Strong)
  {
    v11 = Strong;
    v12 = *(_QWORD *)(v9 + 8);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v12 + 8))(v2, v14, ObjectType, v12);

    swift_unknownObjectRelease(v11);
  }
  else
  {

  }
}

void sub_10001AE28(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_10001AE80(a1);

  }
}

void sub_10001AE80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  id v14;

  v2 = v1;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000A054(v4, (uint64_t)qword_100041D00);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "handle remote collaboration options update", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v14 = objc_msgSend(objc_allocWithZone((Class)SHSheetCollaborationOptionsUpdateAction), "initWithCollaborationOptions:", a1);
  v9 = v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
  if (Strong)
  {
    v11 = Strong;
    v12 = *(_QWORD *)(v9 + 8);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v12 + 8))(v2, v14, ObjectType, v12);

    swift_unknownObjectRelease(v11);
  }
  else
  {

  }
}

void sub_10001AFE8(uint64_t a1, void *a2)
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

void sub_10001B03C(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  char v10[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (char *)Strong;
    v4 = objc_msgSend(objc_allocWithZone((Class)SHSheetAction), "initWithType:", 9);
    v5 = &v3[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate];
    v6 = swift_unknownObjectWeakLoadStrong(&v3[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate]);
    if (v6)
    {
      v7 = v6;
      v8 = *((_QWORD *)v5 + 1);
      ObjectType = swift_getObjectType(v6);
      (*(void (**)(char *, id, uint64_t, uint64_t))(v8 + 8))(v3, v4, ObjectType, v8);

      swift_unknownObjectRelease(v7);
    }
    else
    {

    }
  }
}

char *sub_10001B104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t *v21;

  v1 = v0;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v2 = type metadata accessor for Logger(0);
  sub_10000A054(v2, (uint64_t)qword_100041D00);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "creating view model", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v7 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration);
  if (!v7)
  {
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "skipping: no configuration", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }
    goto LABEL_13;
  }
  v8 = *(void **)(v0 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  if (!v8)
  {
    v16 = v7;
    v19 = Logger.logObject.getter();
    v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, (os_log_type_t)v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, (os_log_type_t)v20, "skipping: no session context", v21, 2u);
      swift_slowDealloc(v21, -1, -1);
    }

LABEL_13:
    return 0;
  }
  v9 = objc_allocWithZone((Class)type metadata accessor for ShareSheetViewModel(0, v6));
  v10 = v8;
  v11 = v7;
  v12 = (char *)sub_1000123A8(v11, v8);

  v13 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_customViewController);
  v14 = *(void **)&v12[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController];
  *(_QWORD *)&v12[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController] = v13;
  v15 = v13;

  return v12;
}

uint64_t type metadata accessor for ShareSheetUISession(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService19ShareSheetUISession, a2);
}

uint64_t sub_10001B3F8(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[5];
  uint64_t v25;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v23 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000ABC0(0, (unint64_t *)&unk_10003FAB0, OS_dispatch_queue_ptr);
  v11 = (void *)static OS_dispatch_queue.main.getter(v10);
  v12 = swift_allocObject(&unk_100035D70, 32, 7);
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = v1;
  aBlock[4] = sub_10001DF98;
  v25 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000081BC;
  aBlock[3] = &unk_100035D88;
  v13 = _Block_copy(aBlock);
  v14 = v25;
  v15 = a1;
  v16 = v2;
  v17 = swift_release(v14);
  static DispatchQoS.unspecified.getter(v17);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v18 = sub_100009DA0((unint64_t *)&qword_10003F360, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v19 = sub_100009344((uint64_t *)&unk_10003FAC0);
  v20 = sub_10000ACB8();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v19, v20, v4, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v22);
}

void sub_10001B5FC(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t Strong;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;

  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v4 = type metadata accessor for Logger(0);
  sub_10000A054(v4, (uint64_t)qword_100041D00);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v22 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "did update data source with configuration %@", v8, 0xCu);
    v11 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v12 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration;
  v13 = *(void **)(a2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration);
  if (!v13)
  {
    sub_100005664();
    v13 = *(void **)(a2 + v12);
  }
  *(_QWORD *)(a2 + v12) = v5;

  v14 = objc_msgSend(v5, "shouldBlockPresentation");
  v15 = a2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  Strong = swift_unknownObjectWeakLoadStrong(a2 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
  v17 = Strong;
  if (v14)
  {
    if (Strong)
    {
      v18 = *(_QWORD *)(v15 + 8);
      ObjectType = swift_getObjectType(Strong);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 40))(a2, ObjectType, v18);
      swift_unknownObjectRelease(v17);
    }
  }
  else
  {
    if (Strong)
    {
      v20 = *(_QWORD *)(v15 + 8);
      v21 = swift_getObjectType(Strong);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(a2, v21, v20);
      swift_unknownObjectRelease(v17);
    }
    sub_10001A9D8();
  }
}

uint64_t sub_10001B89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[5];
  _QWORD *v32;

  v5 = v4;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v30 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v28 = *(_QWORD *)(v13 - 8);
  v29 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_10000ABC0(0, (unint64_t *)&unk_10003FAB0, OS_dispatch_queue_ptr);
  v17 = (void *)static OS_dispatch_queue.main.getter(v16);
  v18 = (_QWORD *)swift_allocObject(&unk_100035D20, 56, 7);
  v18[2] = a1;
  v18[3] = a2;
  v18[4] = v4;
  v18[5] = a3;
  v18[6] = a4;
  aBlock[4] = sub_10001DF44;
  v32 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000081BC;
  aBlock[3] = &unk_100035D38;
  v19 = _Block_copy(aBlock);
  v20 = v32;
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a2);
  v21 = v5;
  swift_bridgeObjectRetain(a3);
  v22 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v22);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v23 = sub_100009DA0((unint64_t *)&qword_10003F360, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v24 = sub_100009344((uint64_t *)&unk_10003FAC0);
  v25 = sub_10000ACB8();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v10, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v15, v12, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, v29);
}

void sub_10001BAC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t Strong;
  uint64_t v30;
  uint64_t v31;
  uint64_t ObjectType;
  id v33;

  v10 = OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext;
  v11 = *(void **)(a3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_sessionContext);
  if (v11)
  {
    v12 = objc_msgSend(v11, "activitiesByUUID");
    v13 = type metadata accessor for UUID(0);
    v14 = sub_10000ABC0(0, &qword_10003FC50, UIActivity_ptr);
    v15 = sub_100009DA0((unint64_t *)&unk_10003FC58, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v12, v13, v14, v15);

    v17 = *(void **)(a3 + v10);
    if (v17)
      goto LABEL_3;
LABEL_7:
    v23 = 0;
    v21 = &_swiftEmptyArrayStorage;
    goto LABEL_12;
  }
  v16 = sub_100011C5C((uint64_t)&_swiftEmptyArrayStorage);
  v17 = *(void **)(a3 + v10);
  if (!v17)
    goto LABEL_7;
LABEL_3:
  v18 = objc_msgSend(v17, "applicationActivityTypes");
  if (v18)
  {
    v19 = v18;
    type metadata accessor for ActivityType(0);
    v21 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, v20);

    v22 = *(void **)(a3 + v10);
    if (!v22)
      goto LABEL_11;
  }
  else
  {
    v21 = &_swiftEmptyArrayStorage;
    v22 = *(void **)(a3 + v10);
    if (!v22)
      goto LABEL_11;
  }
  v24 = objc_msgSend(v22, "excludedActivityTypes");
  if (v24)
  {
    v25 = v24;
    type metadata accessor for ActivityType(0);
    v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v25, v26);

    goto LABEL_12;
  }
LABEL_11:
  v23 = 0;
LABEL_12:
  objc_allocWithZone((Class)_UIActivityUserDefaultsViewController);
  swift_bridgeObjectRetain(a4);
  swift_bridgeObjectRetain(a2);
  v27 = swift_bridgeObjectRetain(a1);
  v33 = sub_10001D48C(v27, a2, v16, (uint64_t)v21, a4, v23, a5, 1);
  objc_msgSend(v33, "setUserDefaultsDelegate:", a3);
  objc_msgSend(v33, "setHostAuditToken:", *(_QWORD *)(a3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_hostAuditToken));
  v28 = a3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  Strong = swift_unknownObjectWeakLoadStrong(a3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
  if (Strong)
  {
    v30 = Strong;
    v31 = *(_QWORD *)(v28 + 8);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v31 + 16))(a3, v33, ObjectType, v31);

    swift_unknownObjectRelease(v30);
  }
  else
  {

  }
}

void sub_10001BE14(void *a1)
{
  sub_10001BE50(a1, "Perform people suggestion %s", (SEL *)&selRef_activityViewControllerWithSessionID_selectedPersonWithIdentifier_);
}

void sub_10001BE3C(void *a1)
{
  sub_10001BE50(a1, "Remove people suggestion %s", (SEL *)&selRef_activityViewControllerWithSessionID_removedPersonWithIdentifier_);
}

void sub_10001BE50(void *a1, const char *a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSString v32;
  id v33;
  Class isa;
  const char *v35[2];
  uint64_t v36;
  SEL *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v6 = v3;
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  v38 = v8;
  v39 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v12 = type metadata accessor for Logger(0);
  sub_10000A054(v12, (uint64_t)qword_100041D00);
  v13 = swift_unknownObjectRetain_n(a1, 2);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc(12, -1);
    v37 = a3;
    v17 = v16;
    v18 = swift_slowAlloc(32, -1);
    v36 = v3;
    v19 = v18;
    v41 = v18;
    *(_DWORD *)v17 = 136315138;
    v35[1] = (const char *)(v17 + 4);
    v20 = objc_msgSend(a1, "identifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v21 = sub_100009DA0(&qword_1000402E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v22 = a1;
    v23 = v38;
    v24 = dispatch thunk of CustomStringConvertible.description.getter(v38, v21);
    v35[0] = a2;
    v26 = v25;
    v27 = v23;
    a1 = v22;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v27);
    v40 = sub_100025614(v24, v26, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41);
    swift_unknownObjectRelease_n(v22, 2);
    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v35[0], (uint8_t *)v17, 0xCu);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    v28 = v19;
    v6 = v36;
    swift_slowDealloc(v28, -1, -1);
    v29 = v17;
    a3 = v37;
    swift_slowDealloc(v29, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n(a1, 2);
  }
  v30 = *(void **)(v6 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v30)
  {
    v31 = v30;
    v32 = String._bridgeToObjectiveC()();
    v33 = objc_msgSend(a1, "identifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v38);
    objc_msgSend(v31, *a3, v32, isa);

  }
}

void sub_10001C174(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSString v40;
  uint64_t v41;
  id v42;
  Class isa;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v44 - v11;
  v13 = sub_100009344(&qword_10003F2A0);
  v14 = __chkstk_darwin(v13);
  v50 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v44 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v44 - v19;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v51 = v7;
  v21 = type metadata accessor for Logger(0);
  sub_10000A054(v21, (uint64_t)qword_100041D00);
  sub_10001DEC0(a2, (uint64_t)v20);
  v22 = swift_unknownObjectRetain_n(a1, 2);
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, (os_log_type_t)v24))
  {
    v46 = v24;
    v47 = v3;
    v48 = a2;
    v49 = v10;
    v25 = (uint8_t *)swift_slowAlloc(12, -1);
    v45 = swift_slowAlloc(32, -1);
    v53 = v45;
    *(_DWORD *)v25 = 136315138;
    sub_10001DEC0((uint64_t)v20, (uint64_t)v18);
    v26 = v51;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v18, 1, v6) == 1)
    {
      v27 = objc_msgSend(a1, "identifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100010FD8((uint64_t)v18);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v12, v18, v6);
    }
    v29 = a1;
    v30 = sub_100009DA0(&qword_1000402E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v31 = dispatch thunk of CustomStringConvertible.description.getter(v6, v30);
    v33 = v32;
    v34 = v12;
    v28 = v6;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v34, v6);
    v52 = sub_100025614(v31, v33, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53);
    swift_unknownObjectRelease(v29);
    swift_bridgeObjectRelease(v33);
    sub_100010FD8((uint64_t)v20);
    swift_unknownObjectRelease(v29);
    _os_log_impl((void *)&_mh_execute_header, v23, (os_log_type_t)v46, "Perform share activity %s", v25, 0xCu);
    v35 = v45;
    swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v25, -1, -1);

    a2 = v48;
    v10 = v49;
    a1 = v29;
    v3 = v47;
  }
  else
  {
    v28 = v6;
    swift_unknownObjectRelease(a1);
    sub_100010FD8((uint64_t)v20);

    swift_unknownObjectRelease(a1);
  }
  v36 = *(void **)(v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  v37 = (uint64_t)v50;
  if (v36)
  {
    v38 = a1;
    v39 = v36;
    v40 = String._bridgeToObjectiveC()();
    sub_10001DEC0(a2, v37);
    v41 = v51;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v37, 1, v28) == 1)
    {
      v42 = objc_msgSend(v38, "identifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100010FD8(v37);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v10, v37, v28);
    }
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v28);
    objc_msgSend(v39, "activityViewControllerWithSessionID:selectedActivityWithIdentifier:", v40, isa);

  }
}

void sub_10001C6CC(void *a1)
{
  sub_10001BE50(a1, "Perform action activity %s", (SEL *)&selRef_activityViewControllerWithSessionID_selectedActionWithIdentifier_);
}

void sub_10001C6F4(void *a1, uint64_t a2, void *a3, const char *a4, SEL *a5)
{
  id v9;

  swift_unknownObjectRetain(a3);
  v9 = a1;
  sub_10001BE50(a3, a4, a5);
  swift_unknownObjectRelease(a3);

}

void sub_10001C760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  id v8;
  NSString v9;

  v1 = v0;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10000A054(v2, (uint64_t)qword_100041D00);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "handle action edit", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = *(void **)(v1 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v7)
  {
    v8 = v7;
    v9 = String._bridgeToObjectiveC()();
    objc_msgSend(v8, "activityViewControllerPerformEditActionsWithSessionID:", v9);

  }
}

void sub_10001C8D4()
{
  sub_10001CCC8("handle options", 1);
}

void sub_10001C928()
{
  sub_10001CCC8("handle close", 5);
}

void sub_10001C97C()
{
  sub_10001CCC8("handle next button", 7);
}

void sub_10001C9D0()
{
  sub_10001CCC8("handle collaboration options", 2);
}

void sub_10001CA24()
{
  sub_10001CCC8("handle custom header button", 0);
}

void sub_10001CA78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  NSString v11;
  uint64_t v12;
  uint64_t Strong;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  id v17;

  v3 = v2;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_10000A054(v5, (uint64_t)qword_100041D00);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "handle info suggestion", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = objc_allocWithZone((Class)SHSheetSuggestionAction);
  swift_bridgeObjectRetain(a2);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v17 = objc_msgSend(v10, "initWithSuggestionReason:", v11);

  v12 = v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  Strong = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
  if (Strong)
  {
    v14 = Strong;
    v15 = *(_QWORD *)(v12 + 8);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v15 + 8))(v3, v17, ObjectType, v15);

    swift_unknownObjectRelease(v14);
  }
  else
  {

  }
}

void sub_10001CC64()
{
  sub_10001CCC8("did select collaborative action", 3);
}

void sub_10001CCB8()
{
  sub_10001CCC8("did select send copy action", 4);
}

void sub_10001CCC8(const char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t Strong;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  id v16;

  v5 = v2;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_10000A054(v6, (uint64_t)qword_100041D00);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, a1, v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v16 = objc_msgSend(objc_allocWithZone((Class)SHSheetAction), "initWithType:", a2);
  v11 = v5 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
  Strong = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
  if (Strong)
  {
    v13 = Strong;
    v14 = *(_QWORD *)(v11 + 8);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v14 + 8))(v5, v16, ObjectType, v14);

    swift_unknownObjectRelease(v13);
  }
  else
  {

  }
}

void sub_10001D084(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t Strong;
  uint64_t v31;
  uint64_t v32;
  uint64_t ObjectType;
  void *v34;
  id v35;
  NSString v36;
  Class isa;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;

  v5 = v4;
  v43 = a4;
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v13 = type metadata accessor for Logger(0);
  sub_10000A054(v13, (uint64_t)qword_100041D00);
  v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(12, -1);
    v41 = a3;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc(32, -1);
    v42 = v4;
    v20 = v19;
    v45 = v19;
    v39 = a1;
    v40 = a2;
    *(_DWORD *)v18 = 136315138;
    v21 = sub_100009DA0(&qword_1000402E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v22 = dispatch thunk of CustomStringConvertible.description.getter(v9, v21);
    v24 = v23;
    v44 = sub_100025614(v22, v23, &v45);
    a1 = v39;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45);
    swift_bridgeObjectRelease(v24);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "didSelectActivityWithIdentifier:%s", v18, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    v25 = v20;
    v5 = v42;
    swift_slowDealloc(v25, -1, -1);
    v26 = v18;
    a3 = v41;
    swift_slowDealloc(v26, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  if ((v43 & 1) != 0)
  {
    v28 = objc_msgSend((id)objc_opt_self(SHSheetFactory, v27), "createScreenTimeAlertViewController");
    v29 = v5 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate;
    Strong = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
    if (Strong)
    {
      v31 = Strong;
      v32 = *(_QWORD *)(v29 + 8);
      ObjectType = swift_getObjectType(Strong);
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v32 + 24))(v5, v28, ObjectType, v32);

      swift_unknownObjectRelease(v31);
    }
    else
    {

    }
  }
  else
  {
    objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1, 0);
    v34 = *(void **)(v5 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
    if (v34)
    {
      v35 = v34;
      v36 = String._bridgeToObjectiveC()();
      isa = UUID._bridgeToObjectiveC()().super.isa;
      objc_msgSend(v35, "activityViewControllerWithSessionID:selectedDefaultActivityWithIdentifier:activityCategory:", v36, isa, a3);

    }
  }
}

id sub_10001D48C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  NSArray v15;
  NSArray v16;
  NSDictionary v17;
  NSArray v18;
  NSArray v19;
  NSArray v20;
  id v21;
  uint64_t v23;
  void *v25;

  sub_10000ABC0(0, &qword_1000402E8, _UIUserDefaultsActivityProxy_ptr);
  v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v16.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a2);
  type metadata accessor for UUID(0);
  sub_10000ABC0(0, &qword_10003FC50, UIActivity_ptr);
  sub_100009DA0((unint64_t *)&unk_10003FC58, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v17.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a3);
  type metadata accessor for ActivityType(0);
  v18.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a4);
  v19.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a5);
  if (a6)
  {
    v20.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v20.super.isa = 0;
  }
  LOBYTE(v23) = a8 & 1;
  v21 = objc_msgSend(v25, "initWithFavoritesProxies:suggestionProxies:activitiesByUUID:applicationActivityTypes:orderedUUIDs:excludedActivityTypes:activityCategory:isPresentedModally:", v15.super.isa, v16.super.isa, v17.super.isa, v18.super.isa, v19.super.isa, v20.super.isa, a7, v23);

  return v21;
}

id sub_10001D654()
{
  void *v0;
  Class isa;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v8;

  isa = Data._bridgeToObjectiveC()().super.isa;
  v8 = 0;
  v2 = objc_msgSend(v0, "initForReadingFromData:error:", isa, &v8);

  v3 = v8;
  if (v2)
  {
    v4 = v8;
  }
  else
  {
    v5 = v8;
    _convertNSErrorToError(_:)(v3);

    swift_willThrow(v6);
  }
  return v2;
}

void sub_10001D710(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  void *v23;
  id v24;
  NSString v25;
  Class isa;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v10 = type metadata accessor for Logger(0);
  sub_10000A054(v10, (uint64_t)qword_100041D00);
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(12, -1);
    v28 = v2;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v29 = a1;
    v17 = v16;
    v32 = v16;
    v30 = a2;
    *(_DWORD *)v15 = 136315138;
    v18 = sub_100009DA0(&qword_1000402E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v19 = dispatch thunk of CustomStringConvertible.description.getter(v6, v18);
    v21 = v20;
    v31 = sub_100025614(v19, v20, &v32);
    a2 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32);
    swift_bridgeObjectRelease(v21);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "didToggleActivityWithIdentifier:%s", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v22 = v15;
    v3 = v28;
    swift_slowDealloc(v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  v23 = *(void **)(v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v23)
  {
    v24 = v23;
    v25 = String._bridgeToObjectiveC()();
    isa = UUID._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v24, "activityViewControllerWithSessionID:toggledActivityWithIdentifier:activityCategory:", v25, isa, a2);

  }
}

void sub_10001D9A8(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  void *v25;
  id v26;
  NSString v27;
  Class isa;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = v3;
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v12 = type metadata accessor for Logger(0);
  sub_10000A054(v12, (uint64_t)qword_100041D00);
  v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  v16 = os_log_type_enabled(v14, v15);
  v32 = a2;
  if (v16)
  {
    v17 = swift_slowAlloc(12, -1);
    v29 = v3;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc(32, -1);
    v34 = v19;
    v30 = a1;
    *(_DWORD *)v18 = 136315138;
    v31 = a3;
    v20 = sub_100009DA0(&qword_1000402E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v21 = dispatch thunk of CustomStringConvertible.description.getter(v8, v20);
    v23 = v22;
    v33 = sub_100025614(v21, v22, &v34);
    a3 = v31;
    LOBYTE(a1) = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "didFavoriteActivity:%s", v18, 0xCu);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    v24 = v18;
    v4 = v29;
    swift_slowDealloc(v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  v25 = *(void **)(v4 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v25)
  {
    v26 = v25;
    v27 = String._bridgeToObjectiveC()();
    isa = UUID._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v26, "activityViewControllerWithSessionID:favoritedActivity:withIdentifier:activityCategory:", v27, a1 & 1, isa, a3);

  }
}

void sub_10001DC4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8_t *v17;
  void *v18;
  id v19;
  NSString v20;
  Class isa;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  if (qword_10003EE08 != -1)
    swift_once(&qword_10003EE08, sub_10000B170);
  v6 = type metadata accessor for Logger(0);
  sub_10000A054(v6, (uint64_t)qword_100041D00);
  v7 = swift_bridgeObjectRetain_n(a1, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v22 = a2;
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v24 = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = sub_10000ABC0(0, &qword_1000402E8, _UIUserDefaultsActivityProxy_ptr);
    v13 = swift_bridgeObjectRetain(a1);
    v14 = Array.description.getter(v13, v12);
    v16 = v15;
    swift_bridgeObjectRelease(a1);
    v23 = sub_100025614(v14, v16, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "didUpdateFavoritesProxies:%s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    v17 = v10;
    a2 = v22;
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
  }
  v18 = *(void **)(v3 + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  if (v18)
  {
    v19 = v18;
    v20 = String._bridgeToObjectiveC()();
    sub_10000ABC0(0, &qword_1000402E8, _UIUserDefaultsActivityProxy_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v19, "activityViewControllerWithSessionID:updatedFavoritesProxies:activityCategory:", v20, isa, a2);

  }
}

uint64_t sub_10001DEC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100009344(&qword_10003F2A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001DF08()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 56, 7);
}

void sub_10001DF44()
{
  uint64_t *v0;

  sub_10001BAC4(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_10001DF54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001DF64(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001DF6C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10001DF98()
{
  uint64_t v0;

  sub_10001B5FC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10001DFA0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10001DFC4()
{
  uint64_t v0;

  sub_10001B03C(v0);
}

void sub_10001DFCC(uint64_t a1)
{
  uint64_t v1;

  sub_10001AE28(a1, v1);
}

void sub_10001DFD4(void *a1)
{
  uint64_t v1;

  sub_10001AC58(a1, v1);
}

id sub_10001E13C()
{
  return sub_10001E31C((uint64_t (*)(void))type metadata accessor for SceneSettingsDiffAction);
}

uint64_t type metadata accessor for SceneSettingsDiffAction(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService23SceneSettingsDiffAction, a2);
}

id sub_10001E310()
{
  return sub_10001E31C((uint64_t (*)(void))type metadata accessor for SceneWindowObserver);
}

id sub_10001E31C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for SceneWindowObserver(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIService19SceneWindowObserver, a2);
}

uint64_t sub_10001E37C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000B198(v0, qword_1000403E0);
  v1 = sub_10000A054(v0, (uint64_t)qword_1000403E0);
  if (qword_10003EE10 != -1)
    swift_once(&qword_10003EE10, sub_10000B1D8);
  v2 = sub_10000A054(v0, (uint64_t)qword_100041D18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void *ShareIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static ShareIntent.assistantOnly;
}

uint64_t static ShareIntent.assistantOnly.getter()
{
  return 1;
}

uint64_t sub_10001E420()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000B198(v0, static ShareIntent.title);
  sub_10000A054(v0, (uint64_t)static ShareIntent.title);
  return LocalizedStringResource.init(stringLiteral:)(0x6572616853, 0xE500000000000000);
}

uint64_t ShareIntent.title.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_10003EE68 != -1)
    swift_once(&qword_10003EE68, sub_10001E420);
  v0 = type metadata accessor for LocalizedStringResource(0);
  return sub_10000A054(v0, (uint64_t)static ShareIntent.title);
}

uint64_t static ShareIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10003EE68 != -1)
    swift_once(&qword_10003EE68, sub_10001E420);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareIntent.title);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ShareIntent.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  if (qword_10003EE68 != -1)
    swift_once(&qword_10003EE68, sub_10001E420);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareIntent.title);
  swift_beginAccess(v3, v6, 33, 0);
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ShareIntent.title.modify(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10003EE68 != -1)
    swift_once(&qword_10003EE68, sub_10001E420);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000A054(v2, (uint64_t)static ShareIntent.title);
  swift_beginAccess(v3, a1, 33, 0);
  return j__swift_endAccess;
}

double ShareIntent.shareTransport.getter@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  IntentParameter.wrappedValue.getter(v7);
  result = *(double *)v7;
  v3 = v7[1];
  v4 = v7[2];
  v5 = v8;
  v6 = v9;
  *(_OWORD *)a1 = v7[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = v6;
  return result;
}

uint64_t ShareIntent.shareTransport.setter(_OWORD *a1)
{
  __int128 v1;
  __int128 v2;
  _OWORD v4[4];

  v1 = a1[1];
  v4[0] = *a1;
  v4[1] = v1;
  v2 = a1[3];
  v4[2] = a1[2];
  v4[3] = v2;
  return IntentParameter.wrappedValue.setter(v4);
}

uint64_t (*ShareIntent.shareTransport.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10001E74C;
}

uint64_t ShareIntent.$shareTransport.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t ShareIntent.recipients.getter()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t ShareIntent.recipients.setter(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t (*ShareIntent.recipients.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10001E74C;
}

uint64_t ShareIntent.$recipients.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t ShareIntent.mode.getter()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t ShareIntent.mode.setter(char a1)
{
  char v2;

  v2 = a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t (*ShareIntent.mode.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10001E74C;
}

uint64_t ShareIntent.$mode.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t ShareIntent.content.getter()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t ShareIntent.content.setter(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t (*ShareIntent.content.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10001E74C;
}

void sub_10001E9A8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t ShareIntent.$content.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t ShareIntent.perform()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[13] = a4;
  v5[14] = a5;
  v5[11] = a2;
  v5[12] = a3;
  v5[10] = a1;
  return swift_task_switch(sub_10001EA1C, 0, 0);
}

uint64_t sub_10001EA1C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  _QWORD *v13;

  if (qword_10003EE60 != -1)
    swift_once(&qword_10003EE60, sub_10001E37C);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_10000A054(v1, (uint64_t)qword_1000403E0);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Performing share intent", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  IntentParameter.wrappedValue.getter(v0 + 2);
  v7 = v0[5];
  v6 = v0[6];
  v8 = v0[7];
  v9 = v0[9];
  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v9);
  if (v6 == 0xD00000000000002ALL && v8 == 0x8000000100028C30)
  {
    swift_bridgeObjectRelease(0x8000000100028C30);
LABEL_9:
    v11 = (_QWORD *)swift_task_alloc(dword_10004040C);
    v0[15] = v11;
    *v11 = v0;
    v11[1] = sub_10001EC00;
    return sub_10001ECDC(v0[11], v0[12], v0[13], v0[14]);
  }
  v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v8, 0xD00000000000002ALL, 0x8000000100028C30, 0);
  swift_bridgeObjectRelease(v8);
  if ((v10 & 1) != 0)
    goto LABEL_9;
  v13 = (_QWORD *)swift_task_alloc(dword_100040404);
  v0[16] = v13;
  *v13 = v0;
  v13[1] = sub_10001EC88;
  return sub_10001EFB0(v0[11], v0[12], v0[13], v0[14]);
}

uint64_t sub_10001EC00()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 120));
  return swift_task_switch(sub_10001EC54, 0, 0);
}

uint64_t sub_10001EC54()
{
  uint64_t v0;

  static IntentResult.result<>()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001EC88()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 128));
  return swift_task_switch(sub_1000233E8, 0, 0);
}

uint64_t sub_10001ECDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[10] = a3;
  v4[11] = a4;
  v4[8] = a1;
  v4[9] = a2;
  v5 = type metadata accessor for MainActor(0);
  v4[12] = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[13] = v6;
  v4[14] = v7;
  return swift_task_switch(sub_10001ED4C, v6, v7);
}

uint64_t sub_10001ED4C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t **v6;

  if (qword_10003EE60 != -1)
    swift_once(&qword_10003EE60, sub_10001E37C);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_10000A054(v1, (uint64_t)qword_1000403E0);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "No transport provided, presenting Share Sheet", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = (uint64_t **)swift_task_alloc(dword_100040464);
  v0[15] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = (uint64_t *)sub_10001EE50;
  return sub_10001F4C0(v0[8], v0[9], v0[10], v0[11]);
}

uint64_t sub_10001EE50(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 120);
  *(_QWORD *)(*v1 + 128) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_10001EEA8, *(_QWORD *)(v2 + 104), *(_QWORD *)(v2 + 112));
}

uint64_t sub_10001EEA8()
{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = (void *)v0[16];
  swift_release(v0[12]);
  type metadata accessor for SUISRemoteAlertPresentationManager(0);
  v2 = sub_10000C114();
  v3 = dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:)(v1, 1, 0, 2, 0);

  v4 = swift_allocObject(&unk_100035F60, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  v0[6] = sub_10002267C;
  v0[7] = v4;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10001F7AC;
  v0[5] = &unk_100035F78;
  v5 = _Block_copy(v0 + 2);
  v6 = v0[7];
  swift_retain(v3);
  swift_release(v6);
  objc_msgSend(v1, "setCompletionWithItemsHandler:", v5);
  _Block_release(v5);
  swift_release(v3);

  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_10001EFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[27] = a3;
  v4[28] = a4;
  v4[25] = a1;
  v4[26] = a2;
  v5 = type metadata accessor for MainActor(0);
  v4[29] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[30] = v6;
  v4[31] = v7;
  return swift_task_switch(sub_10001F020, v6, v7);
}

uint64_t sub_10001F020()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t type;
  uint64_t v27;
  NSObject *log;
  uint64_t v29;

  if (qword_10003EE60 != -1)
    swift_once(&qword_10003EE60, sub_10001E37C);
  v1 = v0[25];
  v3 = v0[27];
  v2 = v0[28];
  v4 = v0[26];
  v5 = type metadata accessor for Logger(0);
  sub_10000A054(v5, (uint64_t)qword_1000403E0);
  swift_retain_n(v1, 2);
  swift_retain_n(v4, 2);
  swift_retain_n(v3, 2);
  v6 = swift_retain_n(v2, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  v9 = os_log_type_enabled(v7, v8);
  v11 = v0[27];
  v10 = v0[28];
  v13 = v0[25];
  v12 = v0[26];
  if (v9)
  {
    v25 = v0[28];
    log = v7;
    type = v8;
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v27 = swift_slowAlloc(32, -1);
    v29 = v27;
    *(_DWORD *)v14 = 136315138;
    IntentParameter.wrappedValue.getter(v0 + 2);
    v15 = ShareTransportEntity.description.getter();
    v24 = v11;
    v17 = v16;
    sub_1000232CC(v0 + 2);
    v0[24] = sub_100025614(v15, v17, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 25);
    swift_bridgeObjectRelease(v17);
    swift_release_n(v13, 2);
    swift_release_n(v12, 2);
    swift_release_n(v24, 2);
    swift_release(v25);
    swift_release(v25);
    v7 = log;
    _os_log_impl((void *)&_mh_execute_header, log, type, "Performing provided transport: %s", v14, 0xCu);
    swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    swift_release_n(v0[25], 2);
    swift_release_n(v12, 2);
    swift_release_n(v11, 2);
    swift_release_n(v10, 2);
  }

  IntentParameter.wrappedValue.getter(v0 + 10);
  v18 = v0[11];
  v19 = v0[13];
  v20 = v0[15];
  v0[32] = v0[14];
  v0[33] = v20;
  v21 = v0[17];
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v21);
  v22 = (_QWORD *)swift_task_alloc(dword_100040464);
  v0[34] = v22;
  *v22 = v0;
  v22[1] = sub_10001F2F0;
  return sub_10001F4C0(v0[25], v0[26], v0[27], v0[28]);
}

uint64_t sub_10001F2F0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 272);
  *(_QWORD *)(*v1 + 280) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_10001F348, *(_QWORD *)(v2 + 240), *(_QWORD *)(v2 + 248));
}

uint64_t sub_10001F348()
{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  v1 = (void *)v0[35];
  swift_release(v0[29]);
  type metadata accessor for SUISRemoteAlertPresentationManager(0);
  v2 = sub_10000C114();
  v3 = dispatch thunk of SFRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:hideViewController:)(v1, 0, 0, 2, 1);

  v4 = swift_allocObject(&unk_100036000, 24, 7);
  v0[18] = _NSConcreteStackBlock;
  *(_QWORD *)(v4 + 16) = v3;
  v0[22] = sub_10002267C;
  v0[23] = v4;
  v0[19] = 1107296256;
  v0[20] = sub_10001F7AC;
  v0[21] = &unk_100036018;
  v5 = _Block_copy(v0 + 18);
  v6 = v0[23];
  swift_retain(v3);
  swift_release(v6);
  objc_msgSend(v1, "setCompletionWithItemsHandler:", v5);
  _Block_release(v5);
  v7 = (void *)v0[35];
  v8 = v0[33];
  if (v3)
  {
    v9 = v0[32];
    v10 = (_QWORD *)swift_allocObject(&unk_100036050, 48, 7);
    v10[2] = v7;
    v10[3] = v9;
    v10[4] = v8;
    v10[5] = v3;
    swift_retain(v3);
    v11 = v7;
    dispatch thunk of SFRemoteAlertPresentationHandle.onActivate.setter(sub_1000232C0, v10);

    swift_release(v3);
  }
  else
  {
    swift_bridgeObjectRelease(v0[33]);

  }
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_10001F4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[11] = a3;
  v4[12] = a4;
  v4[9] = a1;
  v4[10] = a2;
  v5 = type metadata accessor for MainActor(0);
  v4[13] = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[14] = v6;
  v4[15] = v7;
  return swift_task_switch(sub_10001F530, v6, v7);
}

uint64_t sub_10001F530()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;

  IntentParameter.wrappedValue.getter(v0 + 8);
  v1 = v0[8];
  v2 = sub_100021B58(v1);
  v0[16] = v2;
  swift_bridgeObjectRelease(v1);
  v3 = (_QWORD *)swift_task_alloc(dword_10004046C);
  v0[17] = v3;
  *v3 = v0;
  v3[1] = sub_10001F5A4;
  return sub_100022698((uint64_t)v2, v0[12]);
}

uint64_t sub_10001F5A4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 136);
  *(_QWORD *)(*v1 + 144) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_10001F5FC, *(_QWORD *)(v2 + 112), *(_QWORD *)(v2 + 120));
}

uint64_t sub_10001F5FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  Class isa;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v1 = v0[18];
  v2 = v0[16];
  v3 = v0[12];
  v5 = v0[10];
  v4 = v0[11];
  v6 = v0[9];
  swift_release(v0[13]);
  v7 = objc_allocWithZone((Class)UIActivityItemsConfiguration);
  sub_10000ABC0(0, (unint64_t *)&qword_100040448, NSItemProvider_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  v9 = objc_msgSend(v7, "initWithItemProviders:", isa);

  v10 = (_QWORD *)swift_allocObject(&unk_100035FB0, 56, 7);
  v10[2] = v6;
  v10[3] = v5;
  v10[4] = v4;
  v10[5] = v3;
  v10[6] = v1;
  v0[6] = sub_100023228;
  v0[7] = v10;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_100020EF0;
  v0[5] = &unk_100035FC8;
  v11 = _Block_copy(v0 + 2);
  v12 = v0[7];
  swift_bridgeObjectRetain(v1);
  swift_retain(v6);
  swift_retain(v5);
  swift_retain(v4);
  swift_retain(v3);
  swift_release(v12);
  objc_msgSend(v9, "setPerItemMetadataProvider:", v11);
  _Block_release(v11);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v1);
  v13 = objc_msgSend(objc_allocWithZone((Class)UIActivityViewController), "initWithActivityItemsConfiguration:", v9);

  return ((uint64_t (*)(id))v0[1])(v13);
}

uint64_t sub_10001F7AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  void (*v9)(void *, uint64_t, uint64_t, void *);
  uint64_t v10;
  id v11;
  id v12;

  v9 = *(void (**)(void *, uint64_t, uint64_t, void *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (a4)
    v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, (char *)&type metadata for Any + 8);
  else
    v10 = 0;
  swift_retain(v8);
  v11 = a2;
  v12 = a5;
  v9(a2, a3, v10, a5);
  swift_release(v8);

  return swift_bridgeObjectRelease(v10);
}

uint64_t sub_10001F850(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;

  v8 = sub_100009344(&qword_10003F928);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  type metadata accessor for MainActor(0);
  swift_retain(a4);
  v12 = a1;
  v13 = swift_bridgeObjectRetain(a3);
  v14 = static MainActor.shared.getter(v13);
  v15 = (_QWORD *)swift_allocObject(&unk_100036078, 64, 7);
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  v15[5] = a2;
  v15[6] = a3;
  v15[7] = a4;
  v16 = sub_10000D218((uint64_t)v10, (uint64_t)&unk_100040498, (uint64_t)v15);
  return swift_release(v16);
}

uint64_t sub_10001F960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  v8 = type metadata accessor for MainActor(0);
  v7[19] = static MainActor.shared.getter(v8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v7[20] = v9;
  v7[21] = v10;
  return swift_task_switch(sub_10001F9D0, v9, v10);
}

uint64_t sub_10001F9D0()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  NSString v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0 + 2;
  v2 = (void *)v0[15];
  v3 = String._bridgeToObjectiveC()();
  v0[22] = v3;
  v0[7] = v0 + 24;
  v0[2] = v0;
  v0[3] = sub_10001FA80;
  v4 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_10001FF44;
  v5[3] = &unk_100036090;
  v5[4] = v4;
  objc_msgSend(v2, "_performActivityWithType:completionHandler:", v3, v5);
  return swift_continuation_await(v1);
}

uint64_t sub_10001FA80()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 48);
  *(_QWORD *)(*v0 + 184) = v2;
  if (v2)
    v3 = sub_10001FCBC;
  else
    v3 = sub_10001FADC;
  return swift_task_switch(v3, *(_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 168));
}

uint64_t sub_10001FADC()
{
  uint64_t v0;
  void *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(void **)(v0 + 176);
  swift_release(*(_QWORD *)(v0 + 152));
  v2 = *(_BYTE *)(v0 + 192);

  if ((v2 & 1) == 0)
  {
    if (qword_10003EE60 != -1)
      swift_once(&qword_10003EE60, sub_10001E37C);
    v3 = *(_QWORD *)(v0 + 136);
    v4 = type metadata accessor for Logger(0);
    sub_10000A054(v4, (uint64_t)qword_1000403E0);
    v5 = swift_bridgeObjectRetain_n(v3, 2);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(_QWORD *)(v0 + 136);
    if (v8)
    {
      v10 = *(_QWORD *)(v0 + 128);
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = swift_slowAlloc(32, -1);
      v14 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain(v9);
      *(_QWORD *)(v0 + 80) = sub_100025614(v10, v9, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
      swift_bridgeObjectRelease_n(v9, 3);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to perform activity of type %s", v11, 0xCu);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 136), 2);
    }

    if (*(_QWORD *)(v0 + 144))
      dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)(1, 0, 0);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001FCBC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 176);
  v2 = swift_release(*(_QWORD *)(v0 + 152));
  swift_willThrow(v2);

  if (qword_10003EE60 != -1)
    swift_once(&qword_10003EE60, sub_10001E37C);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 136);
  v5 = type metadata accessor for Logger(0);
  sub_10000A054(v5, (uint64_t)qword_1000403E0);
  swift_bridgeObjectRetain(v4);
  swift_errorRetain(v3);
  swift_bridgeObjectRetain(v4);
  v6 = swift_errorRetain(v3);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 184);
  v11 = *(_QWORD *)(v0 + 136);
  if (v9)
  {
    v12 = *(_QWORD *)(v0 + 128);
    v13 = swift_slowAlloc(22, -1);
    v14 = (uint64_t *)swift_slowAlloc(8, -1);
    v18 = swift_slowAlloc(32, -1);
    v19 = v18;
    *(_DWORD *)v13 = 136315394;
    swift_bridgeObjectRetain(v11);
    *(_QWORD *)(v0 + 80) = sub_100025614(v12, v11, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
    swift_bridgeObjectRelease_n(v11, 3);
    *(_WORD *)(v13 + 12) = 2112;
    swift_errorRetain(v10);
    v15 = _swift_stdlib_bridgeErrorToNSError(v10);
    *(_QWORD *)(v0 + 80) = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
    *v14 = v15;
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed to perform activity of type %s with error: %@", (uint8_t *)v13, 0x16u);
    v16 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v14, 1, v16);
    swift_slowDealloc(v14, -1, -1);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    swift_errorRelease(v10);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 184));
    swift_bridgeObjectRelease_n(v11, 2);
    swift_errorRelease(v10);
    swift_errorRelease(v10);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001FF44(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_100009344(&qword_10003F958);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10001FFC4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_100020088@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
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
  uint64_t inited;
  NSString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  BOOL v29;
  id v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_BYTE *, uint64_t);
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  void (*v47)(_BYTE *, _BYTE *, uint64_t);
  _BYTE v48[12];
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  char v59[40];
  _BYTE *v60;

  v57 = a2;
  v51 = type metadata accessor for URL(0);
  v56 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v54 = v3;
  v55 = &v48[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_100009344(&qword_10003FCC0);
  __chkstk_darwin(v4);
  v6 = &v48[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v50 = type metadata accessor for UTType(0);
  v58 = *(_QWORD *)(v50 - 8);
  v7 = __chkstk_darwin(v50);
  v53 = &v48[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __chkstk_darwin(v7);
  v11 = &v48[-v10];
  __chkstk_darwin(v9);
  v60 = &v48[-v12];
  v13 = type metadata accessor for URLResourceValues(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v48[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v49 = URL.startAccessingSecurityScopedResource()();
  v17 = sub_100009344(&qword_100040450);
  inited = swift_initStackObject(v17, v59);
  *(_OWORD *)(inited + 16) = xmmword_100027B60;
  *(_QWORD *)(inited + 32) = NSURLTypeIdentifierKey;
  v19 = NSURLTypeIdentifierKey;
  v20 = sub_10002192C(inited);
  swift_setDeallocating(inited);
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy(inited + 32, 1, v21);
  v22 = a1;
  v23 = v52;
  URL.resourceValues(forKeys:)(v20);
  if (v23)
  {
    swift_errorRelease(v23);
    v24 = swift_bridgeObjectRelease(v20);
    v52 = 0;
  }
  else
  {
    v41 = swift_bridgeObjectRelease(v20);
    v42 = URLResourceValues.typeIdentifier.getter(v41);
    v44 = v43;
    v24 = (*(uint64_t (**)(_BYTE *, uint64_t))(v14 + 8))(v16, v13);
    v52 = 0;
    if (v44)
    {
      UTType.init(identifier:allowUndeclared:)(v42, v44, 1);
      v45 = v58;
      v25 = v50;
      v46 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v58 + 48))(v6, 1, v50);
      v26 = v51;
      v27 = v22;
      v28 = v60;
      if (v46 == 1)
      {
        ((void (*)(void))static UTType.fileURL.getter)();
        sub_10000A480((uint64_t)v6, &qword_10003FCC0);
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v45 + 32))(v28, v11, v25);
      }
      else
      {
        v47 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v45 + 32);
        v47(v11, v6, v25);
        v47(v28, v11, v25);
      }
      if (v49)
        goto LABEL_4;
      goto LABEL_5;
    }
  }
  v25 = v50;
  v26 = v51;
  v27 = v22;
  v28 = v60;
  v29 = v49;
  static UTType.fileURL.getter(v24);
  if (v29)
LABEL_4:
    URL.stopAccessingSecurityScopedResource()();
LABEL_5:
  v30 = objc_msgSend(objc_allocWithZone((Class)NSItemProvider), "init");
  v31 = v58;
  v32 = v53;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v58 + 16))(v53, v28, v25);
  v34 = v55;
  v33 = v56;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v56 + 16))(v55, v27, v26);
  v35 = *(unsigned __int8 *)(v33 + 80);
  v36 = v25;
  v37 = (v35 + 16) & ~v35;
  v38 = swift_allocObject(&unk_100035F38, v37 + v54, v35 | 7);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v33 + 32))(v38 + v37, v34, v26);
  NSItemProvider.registerFileRepresentation(for:visibility:openInPlace:loadHandler:)(v32, 0, 1, sub_100022630, v38);
  swift_release(v38);
  v39 = *(void (**)(_BYTE *, uint64_t))(v31 + 8);
  v39(v32, v36);
  result = ((uint64_t (*)(_BYTE *, uint64_t))v39)(v60, v36);
  *v57 = v30;
  return result;
}

uint64_t sub_100020468(void (*a1)(char *, uint64_t, _QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  Swift::Bool v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = sub_100009344(&qword_10003F340);
  __chkstk_darwin(v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = URL.startAccessingSecurityScopedResource()();
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v7, a3, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  a1(v7, 1, 0);
  sub_10000A480((uint64_t)v7, &qword_10003F340);
  if (v8)
    URL.stopAccessingSecurityScopedResource()();
  return 0;
}

_QWORD *sub_10002055C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X4>, void *a4@<X6>, _QWORD *a5@<X8>)
{
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
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *result;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint8_t *v51;
  void *v52;
  uint8_t *v53;
  void *v54;
  uint64_t v55;
  uint8_t *v56;
  uint64_t v57;
  void (*v58)(char *, uint8_t *, uint64_t);
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  _QWORD *v71;
  uint8_t *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  id v77;
  uint64_t v78;
  id v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  _QWORD *v83;
  id v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  char v92;
  uint64_t v93;
  _OWORD *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[2];
  uint8_t *v99;
  void *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;

  v100 = a4;
  v9 = type metadata accessor for IntentPerson(0);
  v102 = *(_QWORD *)(v9 - 8);
  v10 = __chkstk_darwin(v9);
  v101 = (char *)v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)v98 - v12;
  v14 = UIActivityItemsConfigurationMetadataKeyShareRecipients;
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v17 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  if (v15 == v18 && v17 == v19)
  {
    swift_bridgeObjectRelease_n(v17, 2);
    goto LABEL_16;
  }
  v21 = v19;
  v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v18, v19, 0);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v21);
  if ((v22 & 1) != 0)
  {
LABEL_16:
    IntentParameter.wrappedValue.getter(&v104);
    v41 = v104;
    if (v104)
    {
      if (*(_QWORD *)(v104 + 16))
      {
        if (qword_10003EE60 != -1)
          swift_once(&qword_10003EE60, sub_10001E37C);
        v42 = type metadata accessor for Logger(0);
        sub_10000A054(v42, (uint64_t)qword_1000403E0);
        v43 = swift_bridgeObjectRetain(v41);
        v44 = Logger.logObject.getter(v43);
        v45 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v44, v45))
        {
          v46 = (uint8_t *)swift_slowAlloc(12, -1);
          v100 = (void *)swift_slowAlloc(32, -1);
          v104 = (unint64_t)v100;
          v99 = v46;
          *(_DWORD *)v46 = 136315138;
          v98[1] = v46 + 4;
          v47 = swift_bridgeObjectRetain(v41);
          v48 = Array.description.getter(v47, v9);
          v50 = v49;
          swift_bridgeObjectRelease(v41);
          v103 = sub_100025614(v48, v50, (uint64_t *)&v104);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v103, &v104);
          swift_bridgeObjectRelease_n(v41, 2);
          swift_bridgeObjectRelease(v50);
          v51 = v99;
          _os_log_impl((void *)&_mh_execute_header, v44, v45, "Intent providing recipients: %s", v99, 0xCu);
          v52 = v100;
          swift_arrayDestroy(v100, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v52, -1, -1);
          swift_slowDealloc(v51, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n(v41, 2);
        }
      }
      else
      {
        swift_bridgeObjectRelease(v104);
      }
    }
    result = IntentParameter.wrappedValue.getter(&v104);
    v53 = (uint8_t *)v104;
    if (!v104)
      goto LABEL_52;
    v54 = &_swiftEmptyArrayStorage;
    v104 = (unint64_t)&_swiftEmptyArrayStorage;
    v55 = *((_QWORD *)v53 + 2);
    if (v55)
    {
      v100 = a5;
      sub_10000ABC0(0, &qword_100040480, INPerson_ptr);
      v56 = &v53[(*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80)];
      v57 = *(_QWORD *)(v102 + 72);
      v58 = *(void (**)(char *, uint8_t *, uint64_t))(v102 + 16);
      v99 = v53;
      swift_bridgeObjectRetain(v53);
      do
      {
        v58(v13, v56, v9);
        v59 = v101;
        v58(v101, (uint8_t *)v13, v9);
        v60 = INPerson.init(_:)(v59);
        v61 = (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v13, v9);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v61);
        v63 = *(_QWORD *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v62 = *(_QWORD *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v63 >= v62 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v62 > 1, v63 + 1, 1);
        v64 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v63, v60);
        specialized Array._endMutation()(v64);
        v56 += v57;
        --v55;
      }
      while (v55);
      v53 = v99;
      swift_bridgeObjectRelease(v99);
      v54 = (void *)v104;
      a5 = v100;
    }
    swift_bridgeObjectRelease(v53);
    v65 = (uint64_t *)&unk_100040488;
    goto LABEL_32;
  }
  v23 = UIActivityItemsConfigurationMetadataKeyCollaborationModeRestrictions;
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v26 = v25;
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  if (v24 == v27 && v26 == v28)
  {
    swift_bridgeObjectRelease_n(v26, 2);
    goto LABEL_34;
  }
  v30 = v28;
  v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v26, v27, v28, 0);
  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(v30);
  v32 = a3;
  if ((v31 & 1) != 0)
  {
LABEL_34:
    IntentParameter.wrappedValue.getter(&v104);
    v66 = v104;
    if (v104 != 2)
    {
      if (qword_10003EE60 != -1)
        swift_once(&qword_10003EE60, sub_10001E37C);
      v67 = type metadata accessor for Logger(0);
      v68 = sub_10000A054(v67, (uint64_t)qword_1000403E0);
      v69 = Logger.logObject.getter(v68);
      v70 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v69, v70))
      {
        v71 = a5;
        v72 = (uint8_t *)swift_slowAlloc(12, -1);
        v73 = swift_slowAlloc(32, -1);
        v104 = v73;
        *(_DWORD *)v72 = 136315138;
        v74 = sub_100009344(&qword_10003F348);
        v75 = swift_allocObject(v74, 40, 7);
        *(_OWORD *)(v75 + 16) = xmmword_100027B50;
        v86 = objc_msgSend(objc_allocWithZone((Class)UIActivityCollaborationModeRestriction), "initWithDisabledMode:", (v66 & 1) == 0);
        *(_QWORD *)(v75 + 32) = v86;
        v103 = v75;
        specialized Array._endMutation()(v86);
        v87 = v103;
        v88 = sub_10000ABC0(0, &qword_100040478, UIActivityCollaborationModeRestriction_ptr);
        v89 = Array.description.getter(v87, v88);
        v91 = v90;
        swift_bridgeObjectRelease(v87);
        v103 = sub_100025614(v89, v91, (uint64_t *)&v104);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v103, &v104);
        swift_bridgeObjectRelease(v91);
        _os_log_impl((void *)&_mh_execute_header, v69, v70, "Intent providing restrictions: %s", v72, 0xCu);
        swift_arrayDestroy(v73, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v73, -1, -1);
        swift_slowDealloc(v72, -1, -1);

        a5 = v71;
      }
      else
      {

      }
    }
    result = IntentParameter.wrappedValue.getter(&v104);
    v92 = v104;
    if (v104 == 2)
      goto LABEL_52;
    v93 = sub_100009344(&qword_10003F348);
    v94 = (_OWORD *)swift_allocObject(v93, 40, 7);
    v94[1] = xmmword_100027B50;
    v95 = objc_msgSend(objc_allocWithZone((Class)UIActivityCollaborationModeRestriction), "initWithDisabledMode:", (v92 & 1) == 0);
    *((_QWORD *)v94 + 4) = v95;
    v104 = (unint64_t)v94;
    specialized Array._endMutation()(v95);
    v54 = (void *)v104;
    v65 = (uint64_t *)&unk_100040470;
LABEL_32:
    result = (_QWORD *)sub_100009344(v65);
    a5[3] = result;
    *a5 = v54;
    return result;
  }
  v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v35 = v34;
  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIActivityItemsConfigurationMetadataKeyLinkPresentationMetadata);
  v38 = v36;
  if (v33 == v37 && v35 == v36)
  {
    result = (_QWORD *)swift_bridgeObjectRelease_n(v35, 2);
    v40 = (uint64_t)v100;
    if (!v100)
      goto LABEL_52;
  }
  else
  {
    v76 = _stringCompareWithSmolCheck(_:_:expecting:)(v33, v35, v37, v36, 0);
    swift_bridgeObjectRelease(v35);
    result = (_QWORD *)swift_bridgeObjectRelease(v38);
    v40 = (uint64_t)v100;
    if ((v76 & 1) == 0 || !v100)
      goto LABEL_52;
  }
  if ((unint64_t)v40 >> 62)
  {
    if (v40 >= 0)
      v96 = v40 & 0xFFFFFFFFFFFFFF8;
    else
      v96 = v40;
    swift_bridgeObjectRetain(v40);
    v97 = _CocoaArrayWrapper.endIndex.getter(v96);
    result = (_QWORD *)swift_bridgeObjectRelease(v40);
    if (v97 <= a1)
      goto LABEL_52;
  }
  else if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a1)
  {
LABEL_52:
    *(_OWORD *)a5 = 0u;
    *((_OWORD *)a5 + 1) = 0u;
    return result;
  }
  if ((v40 & 0xC000000000000001) == 0)
  {
    if (a1 < 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a1)
    {
      v77 = *(id *)(v40 + 8 * a1 + 32);
      goto LABEL_48;
    }
    __break(1u);
    goto LABEL_64;
  }
  v77 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v40);
LABEL_48:
  a1 = (uint64_t)v77;
  v32 = a5;
  if (qword_10003EE60 != -1)
LABEL_64:
    swift_once(&qword_10003EE60, sub_10001E37C);
  v78 = type metadata accessor for Logger(0);
  sub_10000A054(v78, (uint64_t)qword_1000403E0);
  v79 = (id)a1;
  v80 = Logger.logObject.getter(v79);
  v81 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v80, v81))
  {
    v82 = (uint8_t *)swift_slowAlloc(12, -1);
    v83 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v82 = 138412290;
    v104 = (unint64_t)v79;
    v84 = v79;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &v105);
    *v83 = v79;

    _os_log_impl((void *)&_mh_execute_header, v80, v81, "Intent providing metadata: %@", v82, 0xCu);
    v85 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v83, 1, v85);
    swift_slowDealloc(v83, -1, -1);
    swift_slowDealloc(v82, -1, -1);

  }
  else
  {

  }
  result = (_QWORD *)sub_10000ABC0(0, (unint64_t *)&unk_10003F350, LPLinkMetadata_ptr);
  v32[3] = result;
  *v32 = v79;
  return result;
}

id sub_100020EF0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(_QWORD *__return_ptr, uint64_t, id);
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD v15[3];
  uint64_t v16;

  v6 = *(void (**)(_QWORD *__return_ptr, uint64_t, id))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a3;
  v6(v15, a2, v7);
  swift_release(v5);

  v8 = v16;
  if (!v16)
    return 0;
  v9 = sub_1000101C0(v15, v16);
  v10 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v12, v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  sub_1000101E4(v15);
  return v13;
}

uint64_t sub_100021000(uint64_t a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc(dword_1000403FC);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_10000E22C;
  v5 = *v1;
  *(_OWORD *)(v4 + 104) = v1[1];
  *(_OWORD *)(v4 + 88) = v5;
  *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch(sub_10001EA1C, 0, 0);
}

uint64_t sub_10002106C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = _s16SharingUIService11ShareIntentVACycfC_0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t sub_100021094(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100021688();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_1000210BC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t _s16SharingUIService11ShareIntentVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  char *v26;
  char *v27;
  char *v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t, uint64_t);
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t, uint64_t);
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  _OWORD v53[5];

  v0 = type metadata accessor for IntentPerson.ParameterMode(0);
  v46 = *(_QWORD *)(v0 - 8);
  v47 = v0;
  __chkstk_darwin(v0);
  v45 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = type metadata accessor for InputConnectionBehavior(0);
  v2 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100009344(&qword_10003EE78);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v39 - v9;
  v11 = sub_100009344(&qword_10003EE80);
  __chkstk_darwin(v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = v13;
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  v51 = v14;
  __chkstk_darwin(v14);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_100009344(&qword_10003EE88);
  LocalizedStringResource.init(stringLiteral:)(7368769, 0xE300000000000000);
  v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v50(v13, 1, 1, v14);
  v18 = type metadata accessor for IntentDialog(0);
  memset(v53, 0, 64);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v44 = v8;
  v19(v8, 1, 1, v18);
  v49 = v19;
  v20 = enum case for InputConnectionBehavior.default(_:);
  v43 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v21 = v52;
  v43(v4, enum case for InputConnectionBehavior.default(_:), v52);
  v22 = sub_100009384();
  v23 = v42;
  v24 = v4;
  v48 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v42, v53, v10, v8, v4, v22);
  v41 = sub_100009344(&qword_10003EE98);
  LocalizedStringResource.init(stringLiteral:)(0x6E65697069636552, 0xEA00000000007374);
  v25 = v50;
  v50(v23, 1, 1, v51);
  v19(v10, 1, 1, v18);
  v26 = v45;
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v45, enum case for IntentPerson.ParameterMode.contact(_:), v47);
  v27 = v24;
  v40 = v24;
  v28 = v24;
  v29 = v43;
  v43(v28, v20, v21);
  v47 = IntentParameter<>.init(title:description:mode:requestValueDialog:inputConnectionBehavior:)(v17, v23, v26, v10, v27);
  v46 = sub_100009344(&qword_10003EEA0);
  LocalizedStringResource.init(stringLiteral:)(1701080909, 0xE400000000000000);
  v30 = v51;
  v25(v23, 1, 1, v51);
  LOBYTE(v53[0]) = 2;
  v31 = v49;
  v49(v10, 1, 1, v18);
  v32 = v44;
  v31(v44, 1, 1, v18);
  v33 = v40;
  v29(v40, v20, v21);
  v34 = sub_1000097E8();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v17, v23, v53, v10, v32, v33, &off_100035008, v34);
  sub_100009344(&qword_10003EEB0);
  LocalizedStringResource.init(stringLiteral:)(0x746E65746E6F43, 0xE700000000000000);
  v50(v23, 1, 1, v30);
  *(_QWORD *)&v53[0] = 0;
  v49(v10, 1, 1, v18);
  v35 = sub_100009344(&qword_10003EEB8);
  v36 = type metadata accessor for UTType(0);
  v37 = swift_allocObject(v35, ((*(unsigned __int8 *)(*(_QWORD *)(v36 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v36 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v36 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v36 - 8) + 80) | 7);
  *(_OWORD *)(v37 + 16) = xmmword_100027B60;
  static UTType.item.getter();
  v29(v33, v20, v52);
  IntentParameter<>.init(title:description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)(v17, v23, v53, v37, v10, v33);
  return v48;
}

unint64_t sub_1000215AC()
{
  unint64_t result;

  result = qword_100040410;
  if (!qword_100040410)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntent, &type metadata for ShareIntent);
    atomic_store(result, (unint64_t *)&qword_100040410);
  }
  return result;
}

unint64_t sub_1000215F4()
{
  unint64_t result;

  result = qword_100040418;
  if (!qword_100040418)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntent, &type metadata for ShareIntent);
    atomic_store(result, (unint64_t *)&qword_100040418);
  }
  return result;
}

uint64_t sub_100021638(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of ShareIntent.perform()>>, 1);
}

uint64_t sub_100021648(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100021688();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

unint64_t sub_100021688()
{
  unint64_t result;

  result = qword_100040420;
  if (!qword_100040420)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareIntent, &type metadata for ShareIntent);
    atomic_store(result, (unint64_t *)&qword_100040420);
  }
  return result;
}

uint64_t destroy for ShareIntent(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[1]);
  swift_release(a1[2]);
  return swift_release(a1[3]);
}

uint64_t *initializeWithCopy for ShareIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  return a1;
}

uint64_t *assignWithCopy for ShareIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_retain(v8);
  swift_release(v9);
  v10 = a2[3];
  v11 = a1[3];
  a1[3] = v10;
  swift_retain(v10);
  swift_release(v11);
  return a1;
}

__n128 initializeWithTake for ShareIntent(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for ShareIntent(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  swift_release(a1[2]);
  v5 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShareIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShareIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShareIntent()
{
  return &type metadata for ShareIntent;
}

unint64_t sub_1000218E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100040430;
  if (!qword_100040430)
  {
    v1 = sub_10000AD04(&qword_100040438);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_100040430);
  }
  return result;
}

void *sub_10002192C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  Swift::Int v12;
  void *result;
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
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100009344(&qword_100040458);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v38 = v1;
    v39 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v39 + 8 * v4);
      v7 = *(_QWORD *)(v3 + 40);
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      v10 = v9;
      Hasher.init(_seed:)(v40, v7);
      v11 = v6;
      String.hash(into:)(v40, v8, v10);
      v12 = Hasher._finalize()();
      result = (void *)swift_bridgeObjectRelease(v10);
      v14 = -1 << *(_BYTE *)(v3 + 32);
      v15 = v12 & ~v14;
      v16 = v15 >> 6;
      v17 = *(_QWORD *)(v5 + 8 * (v15 >> 6));
      v18 = 1 << v15;
      if (((1 << v15) & v17) != 0)
      {
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15));
        v21 = v20;
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
        if (v19 == v22 && v21 == v23)
        {
LABEL_3:
          swift_bridgeObjectRelease_n(v21, 2);
LABEL_4:

          goto LABEL_5;
        }
        v25 = v23;
        v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, v22, v23, 0);
        swift_bridgeObjectRelease(v21);
        result = (void *)swift_bridgeObjectRelease(v25);
        if ((v26 & 1) != 0)
          goto LABEL_4;
        v27 = ~v14;
        while (1)
        {
          v15 = (v15 + 1) & v27;
          v16 = v15 >> 6;
          v17 = *(_QWORD *)(v5 + 8 * (v15 >> 6));
          v18 = 1 << v15;
          if ((v17 & (1 << v15)) == 0)
            break;
          v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15));
          v21 = v29;
          v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
          if (v28 == v30 && v21 == v31)
            goto LABEL_3;
          v33 = v31;
          v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v21, v30, v31, 0);
          swift_bridgeObjectRelease(v21);
          result = (void *)swift_bridgeObjectRelease(v33);
          if ((v34 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v16) = v18 | v17;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15) = v11;
      v35 = *(_QWORD *)(v3 + 16);
      v36 = __OFADD__(v35, 1);
      v37 = v35 + 1;
      if (v36)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v37;
LABEL_5:
      if (++v4 == v38)
        return (void *)v3;
    }
  }
  return &_swiftEmptySetSingleton;
}

void *sub_100021B58(uint64_t a1)
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
  uint64_t v13;
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
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _QWORD *v44;
  char v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t, uint64_t);
  char *v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, unint64_t, uint64_t);
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
  unint64_t v93;
  unint64_t v94;
  void *result;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v109;
  unint64_t v110;

  v2 = sub_100009344(&qword_10003F340);
  __chkstk_darwin(v2);
  v98 = (char *)&v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v104 = (char *)&v96 - v10;
  __chkstk_darwin(v9);
  v101 = (char *)&v96 - v11;
  v12 = type metadata accessor for IntentFile(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v103 = (char *)&v96 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v96 - v16;
  v18 = sub_100009344(&qword_100040440);
  v19 = __chkstk_darwin(v18);
  v102 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v22 = (char *)&v96 - v21;
  if (!a1)
    return &_swiftEmptyArrayStorage;
  v97 = v8;
  v110 = (unint64_t)&_swiftEmptyArrayStorage;
  v23 = *(_QWORD *)(a1 + 16);
  v99 = v4;
  v100 = a1;
  v106 = v23;
  v107 = v5;
  if (v23)
  {
    v24 = v23;
    v25 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v105 = *(_QWORD *)(v13 + 72);
    v26 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      v26(v22, v25, v12);
      v108 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
      v108(v22, 0, 1, v12);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v22, 1, v12) == 1)
        break;
      v27 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(v17, v22, v12);
      v28 = IntentFile._itemProvider.getter(v27);
      v29 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v12);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v29);
      v31 = *(_QWORD *)((v110 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v30 = *(_QWORD *)((v110 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v31 >= v30 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
      v32 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v28);
      specialized Array._endMutation()(v32);
      v25 += v105;
      if (!--v24)
        goto LABEL_11;
    }
  }
  else
  {
    v108 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    swift_bridgeObjectRetain(a1);
LABEL_11:
    v108(v22, 1, 1, v12);
  }
  v34 = v100;
  swift_bridgeObjectRelease(v100);
  v33 = v110;
  v35 = v110 >> 62;
  v36 = v107;
  v37 = v102;
  if (v110 >> 62)
  {
    if ((v110 & 0x8000000000000000) != 0)
      v48 = v110;
    else
      v48 = v110 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v110);
    v49 = _CocoaArrayWrapper.endIndex.getter(v48);
    swift_bridgeObjectRelease(v33);
    if (v49 == 1)
    {
      swift_bridgeObjectRetain(v33);
      if (_CocoaArrayWrapper.endIndex.getter(v48))
        goto LABEL_15;
      swift_bridgeObjectRelease(v33);
    }
    v45 = 0;
    goto LABEL_32;
  }
  if (*(_QWORD *)((v110 & 0xFFFFFFFFFFFFF8) + 0x10) != 1)
  {
    v45 = 0;
    goto LABEL_23;
  }
  swift_bridgeObjectRetain(v110);
LABEL_15:
  if ((v33 & 0xC000000000000001) != 0)
  {
    v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v33);
LABEL_18:
    v39 = v38;
    swift_bridgeObjectRelease(v33);
    v40 = objc_msgSend(v39, "registeredTypeIdentifiers");
    v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v40, &type metadata for String);

    v42 = *(_QWORD *)(v41 + 16);
    swift_bridgeObjectRelease(v41);
    if (v42 == 1)
    {
      v43 = objc_msgSend(v39, "registeredTypeIdentifiers");
      v44 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v43, &type metadata for String);

      v45 = sub_10001FFC4(0xD000000000000018, 0x80000001000299B0, v44);
      v46 = v44;
      v34 = v100;
      swift_bridgeObjectRelease(v46);

    }
    else
    {

      v45 = 0;
    }
    v36 = v107;
    v37 = v102;
    if (!v35)
    {
LABEL_23:
      v47 = v99;
      if (!*(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_41;
LABEL_36:
      if ((v45 & 1) == 0)
      {
        if (qword_10003EE60 != -1)
          swift_once(&qword_10003EE60, sub_10001E37C);
        v52 = type metadata accessor for Logger(0);
        sub_10000A054(v52, (uint64_t)qword_1000403E0);
        v53 = swift_bridgeObjectRetain_n(v33, 2);
        v54 = Logger.logObject.getter(v53);
        v55 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (uint8_t *)swift_slowAlloc(12, -1);
          v57 = swift_slowAlloc(32, -1);
          v110 = v57;
          *(_DWORD *)v56 = 136315138;
          v58 = sub_10000ABC0(0, (unint64_t *)&qword_100040448, NSItemProvider_ptr);
          v59 = swift_bridgeObjectRetain(v33);
          v60 = Array.description.getter(v59, v58);
          v62 = v61;
          swift_bridgeObjectRelease(v33);
          v109 = sub_100025614(v60, v62, (uint64_t *)&v110);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v109, &v110);
          swift_bridgeObjectRelease_n(v33, 2);
          swift_bridgeObjectRelease(v62);
          v63 = "Returning item providers from IntentFiles: %s";
LABEL_64:
          _os_log_impl((void *)&_mh_execute_header, v54, v55, v63, v56, 0xCu);
          swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v57, -1, -1);
          swift_slowDealloc(v56, -1, -1);

          return (void *)v33;
        }
LABEL_65:

        swift_bridgeObjectRelease_n(v33, 2);
        return (void *)v33;
      }
LABEL_41:
      swift_bridgeObjectRelease(v33);
      if (v106)
      {
        v64 = v34 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
        v65 = *(_QWORD *)(v13 + 72);
        v66 = v34;
        v67 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
        swift_bridgeObjectRetain(v66);
        v105 = (unint64_t)&_swiftEmptyArrayStorage;
        v68 = (uint64_t)v98;
        while (1)
        {
          v67(v37, v64, v12);
          v108(v37, 0, 1, v12);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v37, 1, v12) == 1)
            break;
          v69 = v103;
          v70 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(v103, v37, v12);
          IntentFile.fileURL.getter(v70);
          (*(void (**)(char *, uint64_t))(v13 + 8))(v69, v12);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v68, 1, v47) == 1)
          {
            sub_10000A480(v68, &qword_10003F340);
          }
          else
          {
            v71 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 32);
            v72 = v101;
            v71(v101, v68, v47);
            v71(v104, (uint64_t)v72, v47);
            if ((swift_isUniquelyReferenced_nonNull_native(v105) & 1) != 0)
              v73 = v105;
            else
              v73 = sub_1000251D0(0, *(_QWORD *)(v105 + 16) + 1, 1, v105);
            v75 = *(_QWORD *)(v73 + 16);
            v74 = *(_QWORD *)(v73 + 24);
            if (v75 >= v74 >> 1)
              v73 = sub_1000251D0(v74 > 1, v75 + 1, 1, v73);
            *(_QWORD *)(v73 + 16) = v75 + 1;
            v76 = (*(unsigned __int8 *)(v107 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v107 + 80);
            v105 = v73;
            v77 = v73 + v76 + *(_QWORD *)(v107 + 72) * v75;
            v36 = v107;
            v71((char *)v77, (uint64_t)v104, v47);
            v37 = v102;
          }
          v64 += v65;
          if (!--v106)
            goto LABEL_54;
        }
      }
      else
      {
        swift_bridgeObjectRetain(v34);
        v105 = (unint64_t)&_swiftEmptyArrayStorage;
LABEL_54:
        v108(v37, 1, 1, v12);
      }
      swift_bridgeObjectRelease(v100);
      v78 = *(_QWORD *)(v105 + 16);
      if (v78)
      {
        v110 = (unint64_t)&_swiftEmptyArrayStorage;
        v79 = v105;
        specialized ContiguousArray.reserveCapacity(_:)(v78);
        v80 = v79 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
        v81 = *(_QWORD *)(v36 + 72);
        v82 = *(void (**)(uint64_t, unint64_t, uint64_t))(v36 + 16);
        v83 = (uint64_t)v97;
        do
        {
          v82(v83, v80, v47);
          sub_100020088(v83, &v109);
          v84 = (*(uint64_t (**)(uint64_t, uint64_t))(v107 + 8))(v83, v47);
          v85 = v109;
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v84);
          v86 = *(_QWORD *)(v110 + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v86);
          v87 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v86, v85);
          specialized ContiguousArray._endMutation()(v87);
          v80 += v81;
          --v78;
        }
        while (v78);
        v33 = v110;
        swift_bridgeObjectRelease(v105);
      }
      else
      {
        swift_bridgeObjectRelease(v105);
        v33 = (uint64_t)&_swiftEmptyArrayStorage;
      }
      if (qword_10003EE60 != -1)
        swift_once(&qword_10003EE60, sub_10001E37C);
      v88 = type metadata accessor for Logger(0);
      sub_10000A054(v88, (uint64_t)qword_1000403E0);
      v89 = swift_bridgeObjectRetain_n(v33, 2);
      v54 = Logger.logObject.getter(v89);
      v55 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc(12, -1);
        v57 = swift_slowAlloc(32, -1);
        v110 = v57;
        *(_DWORD *)v56 = 136315138;
        v90 = sub_10000ABC0(0, (unint64_t *)&qword_100040448, NSItemProvider_ptr);
        v91 = swift_bridgeObjectRetain(v33);
        v92 = Array.description.getter(v91, v90);
        v94 = v93;
        swift_bridgeObjectRelease(v33);
        v109 = sub_100025614(v92, v94, (uint64_t *)&v110);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v109, &v110);
        swift_bridgeObjectRelease_n(v33, 2);
        swift_bridgeObjectRelease(v94);
        v63 = "Did not find item providers on Intent File using synthesized item providers: %s";
        goto LABEL_64;
      }
      goto LABEL_65;
    }
LABEL_32:
    if (v33 < 0)
      v50 = v33;
    else
      v50 = v33 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v33);
    v51 = _CocoaArrayWrapper.endIndex.getter(v50);
    swift_bridgeObjectRelease(v33);
    v47 = v99;
    if (!v51)
      goto LABEL_41;
    goto LABEL_36;
  }
  if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v38 = *(id *)(v33 + 32);
    goto LABEL_18;
  }
  __break(1u);
  (*(void (**)(char *, unint64_t))(v107 + 8))(v17, (unint64_t)v33 >> 62);
  result = (void *)swift_release(v110);
  __break(1u);
  return result;
}

uint64_t sub_1000225D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100022630(void (*a1)(char *, uint64_t, _QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  return sub_100020468(a1, a2, v2 + ((v5 + 16) & ~v5));
}

uint64_t sub_100022680(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100022690(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100022698(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[4] = a1;
  v2[5] = a2;
  v3 = sub_100009344(&qword_10003F340);
  v2[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v2[7] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[8] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[9] = swift_task_alloc(v6);
  v2[10] = swift_task_alloc(v6);
  v2[11] = swift_task_alloc(v6);
  v7 = type metadata accessor for IntentFile(0);
  v2[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[13] = v8;
  v2[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100009344(&qword_100040440);
  v2[15] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100022784, 0, 0);
}

uint64_t sub_100022784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(uint64_t, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSURL *v39;
  void *v40;
  void *v41;
  NSURL *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  char *v59;

  *(_QWORD *)(v0 + 16) = _swiftEmptyArrayStorage;
  v1 = *(_QWORD *)(v0 + 32);
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v7 = *(_QWORD *)(v0 + 32);
    else
      v7 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v7);
    *(_QWORD *)(v0 + 128) = v2;
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v1);
    *(_QWORD *)(v0 + 128) = v2;
    if (v2)
    {
LABEL_3:
      if (v2 >= 1)
      {
        v3 = *(_QWORD *)(v0 + 32);
        *(_QWORD *)(v0 + 136) = 0;
        if ((v3 & 0xC000000000000001) != 0)
          v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v3);
        else
          v4 = *(id *)(v3 + 32);
        *(_QWORD *)(v0 + 144) = v4;
        v5 = (_QWORD *)swift_task_alloc(dword_10003FCBC);
        *(_QWORD *)(v0 + 152) = v5;
        *v5 = v0;
        v5[1] = sub_100022C6C;
        return sub_100012ECC();
      }
      __break(1u);
      goto LABEL_37;
    }
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  if ((unint64_t)_swiftEmptyArrayStorage >> 62)
  {
LABEL_37:
    if ((uint64_t)_swiftEmptyArrayStorage < 0)
      v54 = _swiftEmptyArrayStorage;
    else
      v54 = (_QWORD *)((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
    v8 = _CocoaArrayWrapper.endIndex.getter(v54);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    goto LABEL_14;
  }
  v8 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_14:
  if (!v8)
  {
    IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
    v9 = *(_QWORD *)(v0 + 24);
    v10 = *(_QWORD *)(v9 + 16);
    v11 = *(_QWORD *)(v0 + 104);
    if (v10)
    {
      v12 = v9 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
      v56 = *(_QWORD *)(v11 + 72);
      v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
      v58 = *(_QWORD *)(v0 + 64);
      v55 = *(_QWORD *)(v0 + 24);
      swift_bridgeObjectRetain(v9);
      v13 = (char *)_swiftEmptyArrayStorage;
      do
      {
        v14 = *(_QWORD *)(v0 + 120);
        v15 = *(_QWORD *)(v0 + 96);
        v57(v14, v12, v15);
        v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
        v16(v14, 0, 1, v15);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v14, 1, v15) == 1)
        {
          v9 = v55;
          goto LABEL_29;
        }
        v17 = *(_QWORD *)(v0 + 112);
        v18 = *(_QWORD *)(v0 + 96);
        v20 = *(_QWORD *)(v0 + 48);
        v19 = *(_QWORD *)(v0 + 56);
        v21 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v11 + 32))(v17, *(_QWORD *)(v0 + 120), v18);
        IntentFile.fileURL.getter(v21);
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v17, v18);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v20, 1, v19) == 1)
        {
          sub_10000A480(*(_QWORD *)(v0 + 48), &qword_10003F340);
        }
        else
        {
          v23 = *(char **)(v0 + 80);
          v22 = *(char **)(v0 + 88);
          v24 = *(_QWORD *)(v0 + 56);
          v25 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
          v25(v22, *(char **)(v0 + 48), v24);
          v25(v23, v22, v24);
          if ((swift_isUniquelyReferenced_nonNull_native(v13) & 1) == 0)
            v13 = (char *)sub_1000251D0(0, *((_QWORD *)v13 + 2) + 1, 1, (unint64_t)v13);
          v27 = *((_QWORD *)v13 + 2);
          v26 = *((_QWORD *)v13 + 3);
          if (v27 >= v26 >> 1)
            v13 = (char *)sub_1000251D0(v26 > 1, v27 + 1, 1, (unint64_t)v13);
          v28 = *(char **)(v0 + 80);
          v29 = *(_QWORD *)(v0 + 56);
          *((_QWORD *)v13 + 2) = v27 + 1;
          v25(&v13[((*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80))+ *(_QWORD *)(v58 + 72) * v27], v28, v29);
        }
        v12 += v56;
        --v10;
      }
      while (v10);
      v9 = v55;
      v16(*(_QWORD *)(v0 + 120), 1, 1, *(_QWORD *)(v0 + 96));
    }
    else
    {
      v30 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v11 + 56);
      swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
      v13 = (char *)_swiftEmptyArrayStorage;
      v30(*(_QWORD *)(v0 + 120), 1, 1, *(_QWORD *)(v0 + 96));
    }
LABEL_29:
    swift_bridgeObjectRelease_n(v9, 2);
    v31 = *((_QWORD *)v13 + 2);
    if (v31)
    {
      v32 = *(_QWORD *)(v0 + 64);
      specialized ContiguousArray.reserveCapacity(_:)(v31);
      v59 = v13;
      v33 = &v13[(*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80)];
      v34 = *(_QWORD *)(v32 + 72);
      v35 = *(void (**)(uint64_t, char *, uint64_t))(v32 + 16);
      do
      {
        v36 = *(_QWORD *)(v0 + 72);
        v37 = *(_QWORD *)(v0 + 56);
        v35(v36, v33, v37);
        v38 = objc_msgSend(objc_allocWithZone((Class)LPLinkMetadata), "init");
        URL._bridgeToObjectiveC()(v39);
        v41 = v40;
        objc_msgSend(v38, "setOriginalURL:", v40);

        URL._bridgeToObjectiveC()(v42);
        v44 = v43;
        objc_msgSend(v38, "setURL:", v43);

        v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v36, v37);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v45);
        v46 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v46);
        v47 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v46, v38);
        specialized ContiguousArray._endMutation()(v47);
        v33 += v34;
        --v31;
      }
      while (v31);
      v48 = v59;
    }
    else
    {
      v48 = v13;
    }
    swift_bridgeObjectRelease(v48);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  }
  v49 = *(_QWORD *)(v0 + 112);
  v51 = *(_QWORD *)(v0 + 80);
  v50 = *(_QWORD *)(v0 + 88);
  v52 = *(_QWORD *)(v0 + 72);
  v53 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc(*(_QWORD *)(v0 + 120));
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
}

uint64_t sub_100022C6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_QWORD *)(*(_QWORD *)v1 + 160) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100022CC8, 0, 0);
}

uint64_t sub_100022CC8()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
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
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  unint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  void (*v36)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(uint64_t, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSURL *v45;
  void *v46;
  void *v47;
  NSURL *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
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
  void (*v63)(uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  char *v65;

  v1 = (_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 160);
  if (v2)
  {
    v3 = v2;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v3);
    v5 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v4 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v5 >= v4 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v4 > 1, v5 + 1, 1);
    v6 = *(void **)(v0 + 144);
    v7 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v5, v3);
    specialized Array._endMutation()(v7);

  }
  else
  {
    v6 = *(void **)(v0 + 144);
  }

  v8 = *(_QWORD *)(v0 + 136) + 1;
  if (v8 == *(_QWORD *)(v0 + 128))
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
    v9 = *(_QWORD *)(v0 + 16);
    if ((unint64_t)v9 >> 62)
    {
      if (v9 < 0)
        v59 = *(_QWORD *)(v0 + 16);
      else
        v59 = v9 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
      v60 = _CocoaArrayWrapper.endIndex.getter(v59);
      swift_bridgeObjectRelease(v9);
      if (!v60)
        goto LABEL_9;
    }
    else if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_9:
      IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
      v10 = *(_QWORD *)(v0 + 24);
      v11 = *(_QWORD *)(v10 + 16);
      v12 = *(_QWORD *)(v0 + 104);
      if (v11)
      {
        v13 = v10 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
        v62 = *(_QWORD *)(v12 + 72);
        v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
        v64 = *(_QWORD *)(v0 + 64);
        v61 = *(_QWORD *)(v0 + 24);
        swift_bridgeObjectRetain(v10);
        v14 = (char *)_swiftEmptyArrayStorage;
        do
        {
          v15 = *(_QWORD *)(v0 + 120);
          v16 = *(_QWORD *)(v0 + 96);
          v63(v15, v13, v16);
          v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
          v17(v15, 0, 1, v16);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v15, 1, v16) == 1)
          {
            v10 = v61;
            v1 = (_QWORD *)(v0 + 16);
            goto LABEL_27;
          }
          v18 = (unint64_t)v14;
          v19 = *(_QWORD *)(v0 + 112);
          v20 = *(_QWORD *)(v0 + 96);
          v22 = *(_QWORD *)(v0 + 48);
          v21 = *(_QWORD *)(v0 + 56);
          v23 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v12 + 32))(v19, *(_QWORD *)(v0 + 120), v20);
          IntentFile.fileURL.getter(v23);
          (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v19, v20);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v22, 1, v21) == 1)
          {
            sub_10000A480(*(_QWORD *)(v0 + 48), &qword_10003F340);
            v14 = (char *)v18;
          }
          else
          {
            v25 = *(char **)(v0 + 80);
            v24 = *(char **)(v0 + 88);
            v26 = *(_QWORD *)(v0 + 56);
            v27 = *(void (**)(char *, char *, uint64_t))(v64 + 32);
            v27(v24, *(char **)(v0 + 48), v26);
            v27(v25, v24, v26);
            v14 = (char *)v18;
            if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0)
              v14 = (char *)sub_1000251D0(0, *(_QWORD *)(v18 + 16) + 1, 1, v18);
            v29 = *((_QWORD *)v14 + 2);
            v28 = *((_QWORD *)v14 + 3);
            if (v29 >= v28 >> 1)
              v14 = (char *)sub_1000251D0(v28 > 1, v29 + 1, 1, (unint64_t)v14);
            v30 = *(char **)(v0 + 80);
            v31 = *(_QWORD *)(v0 + 56);
            *((_QWORD *)v14 + 2) = v29 + 1;
            v27(&v14[((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80))+ *(_QWORD *)(v64 + 72) * v29], v30, v31);
          }
          v13 += v62;
          --v11;
        }
        while (v11);
        v10 = v61;
        v1 = (_QWORD *)(v0 + 16);
        v17(*(_QWORD *)(v0 + 120), 1, 1, *(_QWORD *)(v0 + 96));
      }
      else
      {
        v36 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v12 + 56);
        swift_bridgeObjectRetain(v10);
        v14 = (char *)_swiftEmptyArrayStorage;
        v36(*(_QWORD *)(v0 + 120), 1, 1, *(_QWORD *)(v0 + 96));
      }
LABEL_27:
      swift_bridgeObjectRelease_n(v10, 2);
      v37 = *((_QWORD *)v14 + 2);
      if (v37)
      {
        v38 = *(_QWORD *)(v0 + 64);
        specialized ContiguousArray.reserveCapacity(_:)(v37);
        v65 = v14;
        v39 = &v14[(*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80)];
        v40 = *(_QWORD *)(v38 + 72);
        v41 = *(void (**)(uint64_t, char *, uint64_t))(v38 + 16);
        do
        {
          v42 = *(_QWORD *)(v0 + 72);
          v43 = *(_QWORD *)(v0 + 56);
          v41(v42, v39, v43);
          v44 = objc_msgSend(objc_allocWithZone((Class)LPLinkMetadata), "init");
          URL._bridgeToObjectiveC()(v45);
          v47 = v46;
          objc_msgSend(v44, "setOriginalURL:", v46);

          URL._bridgeToObjectiveC()(v48);
          v50 = v49;
          objc_msgSend(v44, "setURL:", v49);

          v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 8))(v42, v43);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v51);
          v52 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v52);
          v53 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v52, v44);
          specialized ContiguousArray._endMutation()(v53);
          v39 += v40;
          --v37;
        }
        while (v37);
        v9 = (uint64_t)_swiftEmptyArrayStorage;
        swift_bridgeObjectRelease(v65);
        v1 = (_QWORD *)(v0 + 16);
      }
      else
      {
        swift_bridgeObjectRelease(v14);
        v9 = (uint64_t)_swiftEmptyArrayStorage;
      }
      swift_bridgeObjectRelease(*v1);
    }
    v54 = *(_QWORD *)(v0 + 112);
    v56 = *(_QWORD *)(v0 + 80);
    v55 = *(_QWORD *)(v0 + 88);
    v57 = *(_QWORD *)(v0 + 72);
    v58 = *(_QWORD *)(v0 + 48);
    swift_task_dealloc(*(_QWORD *)(v0 + 120));
    swift_task_dealloc(v54);
    swift_task_dealloc(v55);
    swift_task_dealloc(v56);
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
  }
  *(_QWORD *)(v0 + 136) = v8;
  v32 = *(_QWORD *)(v0 + 32);
  if ((v32 & 0xC000000000000001) != 0)
    v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v32);
  else
    v33 = *(id *)(v32 + 8 * v8 + 32);
  *(_QWORD *)(v0 + 144) = v33;
  v34 = (_QWORD *)swift_task_alloc(dword_10003FCBC);
  *(_QWORD *)(v0 + 152) = v34;
  *v34 = v0;
  v34[1] = sub_100022C6C;
  return sub_100012ECC();
}

uint64_t sub_1000231E4()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

_QWORD *sub_100023228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_10002055C(a1, a2, *(_QWORD **)(v3 + 32), *(void **)(v3 + 48), a3);
}

uint64_t sub_100023238()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002325C()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + 16))
    return dispatch thunk of SFRemoteAlertPresentationHandle.dismiss(animated:completion:)(1, 0, 0);
  return result;
}

uint64_t sub_10002328C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000232C0()
{
  uint64_t v0;

  return sub_10001F850(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

_QWORD *sub_1000232CC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_100023320()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002335C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc(dword_100040494);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_10000E22C;
  return sub_10001F960(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t ShareTransportQuery.init()()
{
  uint64_t KeyPath;

  sub_100009344(&qword_10003EEC0);
  KeyPath = swift_getKeyPath(&unk_100028A40);
  return IntentParameterDependency.__allocating_init<A, B>(_:)(KeyPath);
}

uint64_t sub_100023438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000B198(v0, qword_1000404A0);
  v1 = sub_10000A054(v0, (uint64_t)qword_1000404A0);
  if (qword_10003EE10 != -1)
    swift_once(&qword_10003EE10, sub_10000B1D8);
  v2 = sub_10000A054(v0, (uint64_t)qword_100041D18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t ShareTransportQuery.shareIntent.getter()
{
  return IntentParameterDependency.wrappedValue.getter();
}

uint64_t sub_1000234E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100023510@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

uint64_t ShareTransportQuery.entities(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch(sub_100023550, 0, 0);
}

uint64_t sub_100023550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v18;

  if (qword_10003EE70 != -1)
    swift_once(&qword_10003EE70, sub_100023438);
  v1 = *(_QWORD *)(v0 + 56);
  v2 = type metadata accessor for Logger(0);
  *(_QWORD *)(v0 + 72) = sub_10000A054(v2, (uint64_t)qword_1000404A0);
  v3 = swift_bridgeObjectRetain_n(v1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 56);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v18 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = swift_bridgeObjectRetain(v7);
    v11 = Array.description.getter(v10, &type metadata for String);
    v13 = v12;
    swift_bridgeObjectRelease(v7);
    *(_QWORD *)(v0 + 48) = sub_100025614(v11, v13, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease_n(v7, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Querying for entities with identifiers %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 56), 2);
  }

  v14 = sub_100023D40();
  *(_QWORD *)(v0 + 80) = v14;
  if (!v14)
    return (*(uint64_t (**)(_UNKNOWN **))(v0 + 8))(&off_100035030);
  v15 = qword_10003EE38;
  v16 = v14;
  if (v15 != -1)
    swift_once(&qword_10003EE38, sub_10000C3AC);
  return swift_task_switch(sub_1000237AC, qword_100041D60, 0);
}

uint64_t sub_1000237AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = *(_QWORD *)(v2 + 80);
  v4 = type metadata accessor for ShareTransportEntitiesProvider(0, a2);
  v5 = (_QWORD *)swift_allocObject(v4, 40, 7);
  *(_QWORD *)(v2 + 88) = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[2] = v3;
  return swift_task_switch(sub_100023804, 0, 0);
}

uint64_t sub_100023804()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v0[2] = v0[7];
  v1 = (_QWORD *)swift_task_alloc(async function pointer to Sequence.asyncMap<A>(_:)[1]);
  v0[12] = v1;
  v2 = sub_100009344(&qword_1000404D0);
  v3 = sub_100009344(&qword_1000404D8);
  v4 = sub_100023FB0();
  *v1 = v0;
  v1[1] = sub_1000238A0;
  return Sequence.asyncMap<A>(_:)(&unk_1000404C8, v0[11], v2, v3, v4);
}

uint64_t sub_1000238A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 96);
  *(_QWORD *)(v3 + 104) = a1;
  *(_QWORD *)(v3 + 112) = v1;
  swift_task_dealloc(v4);
  if (v1)
    v5 = sub_100023D08;
  else
    v5 = sub_10002390C;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10002390C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
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
  id v33;
  uint64_t v34;
  _QWORD *v36;
  os_log_type_t type[8];
  os_log_type_t typea;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(swift_bridgeObjectRetain(v1) + 48);
    v4 = _swiftEmptyArrayStorage;
    do
    {
      v6 = *(v3 - 1);
      if (v6)
      {
        v7 = v3[5];
        v39 = *(v3 - 2);
        v41 = v3[4];
        v9 = v3[2];
        v8 = v3[3];
        v10 = *v3;
        v11 = v3[1];
        swift_bridgeObjectRetain(v6);
        swift_bridgeObjectRetain(v11);
        swift_bridgeObjectRetain(v8);
        swift_bridgeObjectRetain(v7);
        if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
          v4 = sub_1000253D8(0, v4[2] + 1, 1, v4);
        v13 = v4[2];
        v12 = v4[3];
        v14 = v4;
        if (v13 >= v12 >> 1)
          v14 = sub_1000253D8((_QWORD *)(v12 > 1), v13 + 1, 1, v4);
        v14[2] = v13 + 1;
        v4 = v14;
        v5 = &v14[8 * v13];
        v5[4] = v39;
        v5[5] = v6;
        v5[6] = v10;
        v5[7] = v11;
        v5[8] = v9;
        v5[9] = v8;
        v5[10] = v41;
        v5[11] = v7;
      }
      v3 += 8;
      --v2;
    }
    while (v2);
    v0 = *(_QWORD *)type;
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)type + 104));
    v1 = *(_QWORD *)(*(_QWORD *)type + 104);
  }
  else
  {
    v4 = _swiftEmptyArrayStorage;
  }
  v15 = *(void **)(v0 + 80);
  v16 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRetain_n(v16, 2);
  v17 = v15;
  swift_bridgeObjectRetain_n(v4, 2);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  v20 = os_log_type_enabled(v18, v19);
  v21 = *(void **)(v0 + 80);
  v22 = *(_QWORD *)(v0 + 88);
  v23 = *(_QWORD *)(v0 + 56);
  if (v20)
  {
    v42 = *(_QWORD *)(v0 + 88);
    typea = v19;
    v24 = swift_slowAlloc(32, -1);
    v36 = (_QWORD *)swift_slowAlloc(8, -1);
    v40 = swift_slowAlloc(64, -1);
    v43 = v40;
    *(_DWORD *)v24 = 136315650;
    v25 = swift_bridgeObjectRetain(v4);
    v26 = Array.description.getter(v25, &type metadata for ShareTransportEntity);
    v28 = v27;
    swift_bridgeObjectRelease(v4);
    *(_QWORD *)(v0 + 24) = sub_100025614(v26, v28, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease_n(v4, 2);
    *(_WORD *)(v24 + 12) = 2080;
    v29 = swift_bridgeObjectRetain(v23);
    v30 = Array.description.getter(v29, &type metadata for String);
    v32 = v31;
    swift_bridgeObjectRelease(v23);
    *(_QWORD *)(v0 + 32) = sub_100025614(v30, v32, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40);
    swift_bridgeObjectRelease(v32);
    swift_bridgeObjectRelease_n(v23, 2);
    *(_WORD *)(v24 + 22) = 2112;
    *(_QWORD *)(v0 + 40) = v21;
    v33 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48);
    *v36 = v21;

    _os_log_impl((void *)&_mh_execute_header, v18, typea, "Query found entities %s for identifiers %s and configuration %@", (uint8_t *)v24, 0x20u);
    v34 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v36, 1, v34);
    swift_slowDealloc(v36, -1, -1);
    swift_arrayDestroy(v40, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1, -1);
    swift_slowDealloc(v24, -1, -1);
    swift_release(v42);

  }
  else
  {
    swift_bridgeObjectRelease_n(v4, 2);
    swift_bridgeObjectRelease_n(v23, 2);
    swift_release(v22);

  }
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v4);
}

uint64_t sub_100023D08()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);
  swift_release(*(_QWORD *)(v0 + 88));

  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100023D40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  Class isa;
  id v9;
  uint64_t v11;

  v0 = IntentParameterDependency.wrappedValue.getter();
  if (!v0)
    return 0;
  v1 = v0;
  KeyPath = swift_getKeyPath(&unk_100028BD8);
  v3 = sub_100026180(&qword_100040558, &qword_100040560, (void (*)(void))sub_1000261E4, (uint64_t)&protocol conformance descriptor for <A> [A]);
  IntentProjection.subscript.getter(&v11, KeyPath, v3);
  swift_release(KeyPath);
  swift_release(v1);
  v4 = v11;
  v5 = sub_100021B58(v11);
  swift_bridgeObjectRelease(v4);
  v6 = objc_allocWithZone((Class)UIActivityItemsConfiguration);
  sub_10002622C(0, v7);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  v9 = objc_msgSend(v6, "initWithItemProviders:", isa);

  return v9;
}

uint64_t sub_100023E3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v2 + 80) = a1;
  v3 = *a2;
  v4 = a2[1];
  v5 = (_QWORD *)swift_task_alloc(dword_10003F82C);
  *(_QWORD *)(v2 + 88) = v5;
  *v5 = v2;
  v5[1] = sub_100023EA8;
  return sub_10000C7EC(v2 + 16, v3, v4);
}

uint64_t sub_100023EA8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 88);
  v3 = *v1;
  swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch(sub_100023F14, 0, 0);
}

uint64_t sub_100023F14()
{
  uint64_t v0;

  sub_1000260C8(v0 + 16, *(_QWORD *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023F4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc(dword_1000404C4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000E22C;
  return sub_100023E3C(a1, a2);
}

unint64_t sub_100023FB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000404E0;
  if (!qword_1000404E0)
  {
    v1 = sub_10000AD04(&qword_1000404D0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000404E0);
  }
  return result;
}

uint64_t ShareTransportQuery.suggestedEntities()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return swift_task_switch(sub_100024014, 0, 0);
}

uint64_t sub_100024014()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  uint64_t v7;
  id v8;

  if (qword_10003EE70 != -1)
    swift_once(&qword_10003EE70, sub_100023438);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_10000A054(v1, (uint64_t)qword_1000404A0);
  *(_QWORD *)(v0 + 40) = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Querying for supported entities", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = sub_100023D40();
  *(_QWORD *)(v0 + 48) = v6;
  if (!v6)
    return (*(uint64_t (**)(_UNKNOWN **))(v0 + 8))(&off_100035090);
  v7 = qword_10003EE38;
  v8 = v6;
  if (v7 != -1)
    swift_once(&qword_10003EE38, sub_10000C3AC);
  return swift_task_switch(sub_100024168, qword_100041D60, 0);
}

uint64_t sub_100024168(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v3 = v2[6];
  v4 = type metadata accessor for ShareTransportEntitiesProvider(0, a2);
  v5 = (_QWORD *)swift_allocObject(v4, 40, 7);
  v2[7] = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[2] = v3;
  v6 = (_QWORD *)swift_task_alloc(dword_10003F824);
  v2[8] = v6;
  *v6 = v2;
  v6[1] = sub_1000241D4;
  return sub_10000C474();
}

uint64_t sub_1000241D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 64);
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc(v4);
  if (v1)
    v5 = sub_100024490;
  else
    v5 = sub_100024240;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100024240()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(id *)(v0 + 48);
  swift_bridgeObjectRetain_n(v1, 2);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 72);
    v6 = *(void **)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 56);
    v7 = swift_slowAlloc(22, -1);
    v17 = (_QWORD *)swift_slowAlloc(8, -1);
    v18 = swift_slowAlloc(32, -1);
    v20 = v18;
    *(_DWORD *)v7 = 136315394;
    v8 = swift_bridgeObjectRetain(v5);
    v9 = Array.description.getter(v8, &type metadata for ShareTransportEntity);
    v11 = v10;
    swift_bridgeObjectRelease(v5);
    *(_QWORD *)(v0 + 16) = sub_100025614(v9, v11, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24);
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease_n(v5, 2);
    *(_WORD *)(v7 + 12) = 2112;
    *(_QWORD *)(v0 + 24) = v6;
    v12 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32);
    *v17 = v6;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Query found entities %s for configuration %@", (uint8_t *)v7, 0x16u);
    v13 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v17, 1, v13);
    swift_slowDealloc(v17, -1, -1);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v7, -1, -1);
    swift_release(v19);

  }
  else
  {
    v15 = *(void **)(v0 + 48);
    v14 = *(_QWORD *)(v0 + 56);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 72), 2);
    swift_release(v14);

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 72));
}

uint64_t sub_100024490()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 56));

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ShareTransportQuery.entities(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[15] = a2;
  v3[16] = a3;
  v3[14] = a1;
  return swift_task_switch(sub_1000244E4, 0, 0);
}

uint64_t sub_1000244E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  if (qword_10003EE70 != -1)
    swift_once(&qword_10003EE70, sub_100023438);
  v1 = *(_QWORD *)(v0 + 120);
  v2 = type metadata accessor for Logger(0);
  *(_QWORD *)(v0 + 136) = sub_10000A054(v2, (uint64_t)qword_1000404A0);
  v3 = swift_bridgeObjectRetain_n(v1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 120);
  if (v6)
  {
    v8 = *(_QWORD *)(v0 + 112);
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v15 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain(v7);
    *(_QWORD *)(v0 + 104) = sub_100025614(v8, v7, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112);
    swift_bridgeObjectRelease_n(v7, 3);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Querying for entity matching string %s", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 120), 2);
  }

  v11 = sub_100023D40();
  *(_QWORD *)(v0 + 144) = v11;
  if (!v11)
    return (*(uint64_t (**)(_UNKNOWN **))(v0 + 8))(&off_1000350F0);
  v12 = qword_10003EE38;
  v13 = v11;
  if (v12 != -1)
    swift_once(&qword_10003EE38, sub_10000C3AC);
  return swift_task_switch(sub_10002471C, qword_100041D60, 0);
}

uint64_t sub_10002471C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v3 = v2[18];
  v4 = type metadata accessor for ShareTransportEntitiesProvider(0, a2);
  v5 = (_QWORD *)swift_allocObject(v4, 40, 7);
  v5[3] = 0;
  v5[4] = 0;
  v5[2] = v3;
  v6 = qword_100041D60;
  v2[19] = v5;
  v2[20] = v6;
  v7 = (_QWORD *)swift_task_alloc(dword_10003F824);
  v2[21] = v7;
  *v7 = v2;
  v7[1] = sub_100024790;
  return sub_10000C474();
}

uint64_t sub_100024790(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 168);
  v3[22] = a1;
  v3[23] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v5 = sub_100024970;
    v6 = 0;
  }
  else
  {
    v6 = v3[20];
    v5 = sub_100024800;
  }
  return swift_task_switch(v5, v6, 0);
}

uint64_t sub_100024800()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  _QWORD *v18;

  v1 = v0;
  v2 = v0[22];
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v18 = v0;
    v4 = (uint64_t *)(v2 + 48);
    while (1)
    {
      v5 = v18[14];
      v6 = v18[15];
      v8 = *(v4 - 2);
      v7 = *(v4 - 1);
      v10 = *v4;
      v9 = v4[1];
      v12 = v4[2];
      v11 = v4[3];
      v13 = v4[4];
      v14 = v4[5];
      if (v13 == v5 && v14 == v6)
        break;
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(v4[4], v4[5], v5, v6, 0) & 1) != 0)
        goto LABEL_13;
      v4 += 8;
      if (!--v3)
      {
        v8 = 0xD00000000000002ALL;
        v1 = v18;
        v2 = v18[22];
        goto LABEL_11;
      }
    }
    v13 = v18[14];
    v14 = v18[15];
LABEL_13:
    v1 = v18;
    v16 = v18[22];
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRelease(v16);
  }
  else
  {
    v8 = 0xD00000000000002ALL;
LABEL_11:
    swift_bridgeObjectRelease(v2);
    v7 = 0x8000000100028C30;
    v10 = 0x725420796D6D7544;
    v9 = 0xEF74726F70736E61;
    v12 = 0xD00000000000002ALL;
    v11 = 0x8000000100028C30;
    v13 = 0xD00000000000002ALL;
    v14 = 0x8000000100028C30;
  }
  v1[26] = v11;
  v1[27] = v14;
  v1[24] = v7;
  v1[25] = v9;
  v1[2] = v8;
  v1[3] = v7;
  v1[4] = v10;
  v1[5] = v9;
  v1[6] = v12;
  v1[7] = v11;
  v1[8] = v13;
  v1[9] = v14;
  return swift_task_switch(sub_1000249A8, 0, 0);
}

uint64_t sub_100024970()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 144);
  swift_release(*(_QWORD *)(v0 + 152));

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000249A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  unint64_t v33;
  uint64_t v34;
  os_log_type_t type;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  NSObject *log;
  uint64_t v40;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  v5 = *(void **)(v0 + 144);
  swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 120), 2);
  v6 = v5;
  swift_bridgeObjectRetain_n(v4, 2);
  swift_bridgeObjectRetain_n(v3, 2);
  swift_bridgeObjectRetain_n(v1, 2);
  swift_bridgeObjectRetain_n(v2, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    log = v7;
    v10 = *(_QWORD *)(v0 + 208);
    v9 = *(_QWORD *)(v0 + 216);
    v11 = *(_QWORD *)(v0 + 192);
    v12 = *(_QWORD *)(v0 + 200);
    v37 = *(void **)(v0 + 144);
    v33 = *(_QWORD *)(v0 + 120);
    v34 = *(_QWORD *)(v0 + 112);
    v13 = swift_slowAlloc(32, -1);
    v36 = (_QWORD *)swift_slowAlloc(8, -1);
    v38 = swift_slowAlloc(64, -1);
    v40 = v38;
    *(_DWORD *)v13 = 136315650;
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v9);
    type = v8;
    v14 = ShareTransportEntity.description.getter();
    v16 = v15;
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v9);
    *(_QWORD *)(v0 + 80) = sub_100025614(v14, v16, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease_n(v11, 2);
    swift_bridgeObjectRelease_n(v12, 2);
    swift_bridgeObjectRelease_n(v10, 2);
    swift_bridgeObjectRelease_n(v9, 2);
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain(v33);
    *(_QWORD *)(v0 + 88) = sub_100025614(v34, v33, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96);
    swift_bridgeObjectRelease_n(v33, 3);
    *(_WORD *)(v13 + 22) = 2112;
    *(_QWORD *)(v0 + 96) = v37;
    v17 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104);
    *v36 = v37;

    _os_log_impl((void *)&_mh_execute_header, log, type, "Query found entity %s matching string %s and configuration %@", (uint8_t *)v13, 0x20u);
    v18 = sub_100009344(&qword_10003F220);
    swift_arrayDestroy(v36, 1, v18);
    swift_slowDealloc(v36, -1, -1);
    swift_arrayDestroy(v38, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v13, -1, -1);

  }
  else
  {
    v19 = *(_QWORD *)(v0 + 208);
    v20 = *(_QWORD *)(v0 + 216);
    v21 = *(_QWORD *)(v0 + 200);
    v22 = *(void **)(v0 + 144);
    v23 = *(_QWORD *)(v0 + 120);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 192), 2);
    swift_bridgeObjectRelease_n(v21, 2);
    swift_bridgeObjectRelease_n(v19, 2);
    swift_bridgeObjectRelease_n(v20, 2);
    swift_bridgeObjectRelease_n(v23, 2);

  }
  v25 = *(void **)(v0 + 144);
  v24 = *(_QWORD *)(v0 + 152);
  v26 = sub_100009344((uint64_t *)&unk_10003FDA0);
  v27 = (_OWORD *)swift_allocObject(v26, 96, 7);
  v28 = *(_OWORD *)(v0 + 16);
  v29 = *(_OWORD *)(v0 + 32);
  v27[1] = xmmword_100027B60;
  v27[2] = v28;
  v30 = *(_OWORD *)(v0 + 48);
  v31 = *(_OWORD *)(v0 + 64);
  v27[3] = v29;
  v27[4] = v30;
  v27[5] = v31;
  swift_release(v24);

  return (*(uint64_t (**)(_OWORD *))(v0 + 8))(v27);
}

uint64_t ShareTransportQuery.defaultResult()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = 0xD00000000000002ALL;
  *(_QWORD *)(a1 + 8) = 0x8000000100028C30;
  *(_OWORD *)(a1 + 16) = xmmword_100028260;
  *(_QWORD *)(a1 + 32) = 0xD00000000000002ALL;
  *(_QWORD *)(a1 + 40) = 0x8000000100028C30;
  *(_QWORD *)(a1 + 48) = 0xD00000000000002ALL;
  *(_QWORD *)(a1 + 56) = 0x8000000100028C30;
  return sub_1000256E4(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_100024D9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v7;
  _QWORD *v8;

  *(_QWORD *)(v4 + 16) = a1;
  v7 = *v3;
  v8 = (_QWORD *)swift_task_alloc(dword_1000404F4);
  *(_QWORD *)(v4 + 24) = v8;
  *v8 = v4;
  v8[1] = sub_100024E14;
  v8[15] = a3;
  v8[16] = v7;
  v8[14] = a2;
  return swift_task_switch(sub_1000244E4, 0, 0);
}

uint64_t sub_100024E14(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_100024E70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t KeyPath;
  uint64_t result;

  sub_100009344(&qword_10003EEC0);
  KeyPath = swift_getKeyPath(&unk_100028A40);
  result = IntentParameterDependency.__allocating_init<A, B>(_:)(KeyPath);
  *a1 = result;
  return result;
}

uint64_t sub_100024EB0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_1000404BC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100024F14;
  v5[7] = a1;
  v5[8] = v4;
  return swift_task_switch(sub_100023550, 0, 0);
}

uint64_t sub_100024F14(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 16);
  v5 = *v2;
  v6 = swift_task_dealloc(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_100024F68(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc(dword_1000404EC);
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_100026268;
  v4[4] = v3;
  return swift_task_switch(sub_100024014, 0, 0);
}

uint64_t sub_100024FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000BAF0();
  *v5 = v2;
  v5[1] = sub_10000E22C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100025038(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100025050, 0, 0);
}

uint64_t sub_100025050()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)v1 = 0xD00000000000002ALL;
  *(_QWORD *)(v1 + 8) = 0x8000000100028C30;
  *(_OWORD *)(v1 + 16) = xmmword_100028260;
  *(_QWORD *)(v1 + 32) = 0xD00000000000002ALL;
  *(_QWORD *)(v1 + 40) = 0x8000000100028C30;
  *(_QWORD *)(v1 + 48) = 0xD00000000000002ALL;
  *(_QWORD *)(v1 + 56) = 0x8000000100028C30;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100025090(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *sub_1000250C4(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100009344(&qword_10003FD90);
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
    sub_100025D7C(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000251D0(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
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
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100009344(&qword_100040570);
  v11 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for URL(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100025E84(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

_QWORD *sub_1000253D8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      v10 = sub_100009344((uint64_t *)&unk_10003FDA0);
      v11 = (_QWORD *)swift_allocObject(v10, (v9 << 6) | 0x20, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 + 31;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 6);
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
        if (v11 != a4 || v14 >= &a4[8 * v8 + 4])
          memmove(v14, a4 + 4, v8 << 6);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100025F9C(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_BYTE **sub_1000254E4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_1000254F4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
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

uint64_t sub_1000255A4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
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
  v9 = sub_100025614(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100025614(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10002580C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10002608C((uint64_t)v12, *a3);
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
      sub_10002608C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000101E4(v12);
  return v7;
}

uint64_t sub_1000256E4(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_1000256F0()
{
  unint64_t result;

  result = qword_100040508;
  if (!qword_100040508)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportQuery, &type metadata for ShareTransportQuery);
    atomic_store(result, (unint64_t *)&qword_100040508);
  }
  return result;
}

unint64_t sub_100025738()
{
  unint64_t result;

  result = qword_100040510[0];
  if (!qword_100040510[0])
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportQuery, &type metadata for ShareTransportQuery);
    atomic_store(result, qword_100040510);
  }
  return result;
}

unint64_t sub_100025784()
{
  unint64_t result;

  result = qword_100040528;
  if (!qword_100040528)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareTransportQuery, &type metadata for ShareTransportQuery);
    atomic_store(result, (unint64_t *)&qword_100040528);
  }
  return result;
}

uint64_t sub_1000257C8()
{
  return sub_100026180(&qword_100040530, qword_100040538, (void (*)(void))sub_10000BC64, (uint64_t)&protocol conformance descriptor for <A> [A]);
}

ValueMetadata *type metadata accessor for ShareTransportQuery()
{
  return &type metadata for ShareTransportQuery;
}

uint64_t sub_10002580C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000259C4(a5, a6);
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

uint64_t sub_1000259C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100025A58(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100025C30(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100025C30(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100025A58(uint64_t a1, unint64_t a2)
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
      v5 = sub_100025BCC(v4, 0);
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

_QWORD *sub_100025BCC(uint64_t a1, uint64_t a2)
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
  v4 = sub_100009344(&qword_100040550);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100025C30(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100009344(&qword_100040550);
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

uint64_t sub_100025D7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
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
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      sub_100009344(&qword_10003FD88);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100025E84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100025F9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + (a1 << 6) + 32;
    v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
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

uint64_t sub_10002608C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000260C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100009344(&qword_1000404D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *sub_100026110@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100026148(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  swift_bridgeObjectRetain(v2);
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_100026180(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000AD04(a2);
    a3();
    result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000261E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100040568;
  if (!qword_100040568)
  {
    v1 = type metadata accessor for IntentFile(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentFile, v1);
    atomic_store(result, (unint64_t *)&qword_100040568);
  }
  return result;
}

unint64_t sub_10002622C(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v3;

  result = qword_100040448;
  if (!qword_100040448)
  {
    v3 = objc_opt_self(NSItemProvider, a2);
    result = swift_getObjCClassMetadata(v3);
    atomic_store(result, (unint64_t *)&qword_100040448);
  }
  return result;
}

uint64_t sub_10002626C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass(uint64_t a1, uint64_t a2)
{
  return objc_opt_self(_TtC16SharingUIServiceP33_593FF9B2A4BEB149EC7499EF511035B019ResourceBundleClass, a2);
}

id objc_msgSend__performBlockAfterCATransactionCommits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBlockAfterCATransactionCommits:");
}

id objc_msgSend__setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setConfiguration:");
}

id objc_msgSend_eventForDraggingDidBeginWithRubberBandCoefficient_dismissible_interruptedOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventForDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:");
}

id objc_msgSend_eventForDraggingDidChangeWithTranslation_velocity_animateChange_dismissible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventForDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:");
}

id objc_msgSend_eventForDraggingDidEnd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventForDraggingDidEnd");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sheetInteractionController_didReceiveDraggingEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sheetInteractionController:didReceiveDraggingEvent:");
}

id objc_msgSend_sheetInteractionDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sheetInteractionDelegate");
}
